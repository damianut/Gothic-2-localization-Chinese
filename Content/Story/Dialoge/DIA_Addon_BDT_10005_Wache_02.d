// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Wache_02_EXIT(C_INFO)
{
	npc				= BDT_10005_Addon_Wache_02;
	nr				= 999;
	condition		= DIA_Addon_Wache_02_EXIT_Condition;
	information		= DIA_Addon_Wache_02_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Wache_02_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Wache_02_PICKPOCKET(C_INFO)
{
	npc				= BDT_10005_Addon_Wache_02;
	nr				= 900;
	condition		= DIA_Addon_Wache_02_PICKPOCKET_Condition;
	information		= DIA_Addon_Wache_02_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Wache_02_PICKPOCKET_Condition()
{
	C_Beklauen(38, 101);
};

func void DIA_Addon_Wache_02_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET, DIALOG_BACK, DIA_Addon_Wache_02_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Wache_02_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Wache_02_PICKPOCKET_DoIt);
};

func void DIA_Addon_Wache_02_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Wache_02_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

// --------------------------------------------------------------------
//	Info Hi
// --------------------------------------------------------------------
instance DIA_Addon_Wache_02_Hi(C_INFO)
{
	npc				= BDT_10005_Addon_Wache_02;
	nr				= 2;
	condition		= DIA_Addon_Wache_02_Hi_Condition;
	information		= DIA_Addon_Wache_02_Hi_Info;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_Wache_02_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Wache_02_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Wache_02_Hi_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Wache_02_Hi_13_01"); //等 一 下 ， 我 是 不 是 在 哪 里 见 过 你 吗 ？
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Wache_02_Hi_13_02"); //嗯 … … 不 。 你 不 是 那 个 人 。 继 续 前 进 ， 走 开 。
};

// --------------------------------------------------------------------
//	Info Attentat
// --------------------------------------------------------------------
instance DIA_Addon_Wache_02_Attentat(C_INFO)
{
	npc				= BDT_10005_Addon_Wache_02;
	nr				= 2;
	condition		= DIA_Addon_Wache_02_Attentat_Condition;
	information		= DIA_Addon_Wache_02_Attentat_Info;
	description		= "关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？";
};

func int DIA_Addon_Wache_02_Attentat_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Wache_02_Hi)
	&& (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Wache_02_Attentat_15_00"); //关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Wache_02_Attentat_13_01"); //我 知 道 什 么 ？ （ 大 笑 ） 我 打 断 了 那 个 家 伙 的 腿 。
	AI_Output(self, other, "DIA_Addon_Wache_02_Attentat_13_02"); //（ 威 胁 ） 我 还 会 对 那 些 想 要 袭 击 伊 斯 特 班 的 人 做 同 样 的 事 … …
};

// --------------------------------------------------------------------
//	Info perm
// --------------------------------------------------------------------
instance DIA_Addon_Wache_02_perm(C_INFO)
{
	npc				= BDT_10005_Addon_Wache_02;
	nr				= 99;
	condition		= DIA_Addon_Wache_02_perm_Condition;
	information		= DIA_Addon_Wache_02_perm_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_Wache_02_perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Wache_02_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Wache_02_perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Wache_02_perm_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Wache_02_perm_13_01"); //到 现 在 为 止 很 平 静 。

	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Wache_02_perm_13_02"); //你 在 找 那 个 叛 徒 - 那 我 们 会 留 意 他 … …
	};
};
