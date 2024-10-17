// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10019_Wache_EXIT(C_INFO)
{
	npc				= BDT_10019_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10019_Wache_EXIT_Condition;
	information		= DIA_Addon_10019_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10019_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10019_Wache_Hi(C_INFO)
{
	npc				= BDT_10019_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10019_Wache_Hi_Condition;
	information		= DIA_Addon_10019_Wache_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_10019_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10019_Wache_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_10019_Wache_Hi_06_00"); //这 么 说 ， 你 正 要 去 矿 井 ？

	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi, "实 际 上 ， 我 要 见 瑞 雯 。", DIA_Addon_BDT_10019_Wache_Hi_Raven);
	Info_AddChoice(DIA_Addon_BDT_10019_Wache_Hi, "是 的 。", DIA_Addon_BDT_10019_Wache_Hi_Ja);
};

func void B_Say_Wache_kaputt()
{
	AI_Output(other, self, "DIA_Addon_BDT_10019_Wache_kaputt_15_00"); //他 们 为 什 么 死 了 ？
	AI_Output(self, other, "DIA_Addon_BDT_10019_Wache_kaputt_06_01"); //（ 存 心 不 良 的 大 笑 ） 他 们 把 自 己 弄 得 粉 身 碎 骨 了 。

	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Raven()
{
	AI_Output(other, self, "DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00"); //实 际 上 ， 我 要 见 瑞 雯 。
	AI_Output(self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01"); //（ 警 告 ） 嘿 - 想 要 进 入 神 殿 的 话 ， 你 就 会 象 这 里 的 囚 犯 一 样 死 去 。
	AI_Output(self, other, "DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02"); //挪 挪 你 的 屁 股 去 矿 井 吧 。

	B_Say_Wache_kaputt();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};

func void DIA_Addon_BDT_10019_Wache_Hi_Ja()
{
	AI_Output(other, self, "DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00"); //是 的 。
	AI_Output(self, other, "DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01"); //那 你 多 加 小 心 。 多 留 神 那 些 分 散 在 这 个 地 方 的 家 伙 的 所 作 所 为 。

	B_Say_Wache_kaputt();
	Info_ClearChoices(DIA_Addon_BDT_10019_Wache_Hi);
};
