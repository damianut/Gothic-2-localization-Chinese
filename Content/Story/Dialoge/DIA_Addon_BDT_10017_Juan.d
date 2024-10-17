// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Juan_EXIT(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 999;
	condition		= DIA_Addon_Juan_EXIT_Condition;
	information		= DIA_Addon_Juan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Juan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Juan_PICKPOCKET(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 900;
	condition		= DIA_Addon_Juan_PICKPOCKET_Condition;
	information		= DIA_Addon_Juan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Juan_PICKPOCKET_Condition()
{
	C_Beklauen(65, 73);
};

func void DIA_Addon_Juan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET, DIALOG_BACK, DIA_Addon_Juan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Juan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Juan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Juan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

func void DIA_Addon_Juan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Juan_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Juan_HI(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 2;
	condition		= DIA_Addon_Juan_HI_Condition;
	information		= DIA_Addon_Juan_HI_Info;
	description		= "怎 么 样 了 ？";
};

func int DIA_Addon_Juan_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Juan_HI_Info()
{
	AI_Output(other, self, "DIA_Addon_Juan_HI_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Juan_HI_13_01"); //你 想 要 什 么 ？ 没 有 什 么 对 我 说 了 吗 ？ 如 果 没 有 ， 你 可 以 离 开 了 。

	if (!Npc_IsDead(Freund))
	{
		AI_Output(self, other, "DIA_Addon_Juan_HI_13_02"); //否 则 我 的 朋 友 会 把 你 剁 得 粉 碎 。 那 怎 么 样 ？ 行 吗 ？
		B_StartOtherRoutine(Freund, "STAND");
	};
};

// ---------------------------------------------------------------------
//	Info Losung
// ---------------------------------------------------------------------
instance DIA_Addon_Juan_Losung(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 2;
	condition		= DIA_Addon_Juan_Losung_Condition;
	information		= DIA_Addon_Juan_Losung_Info;
	description		= "他 们 说 你 有 一 些 有 趣 的 东 西 … …";
};

func int DIA_Addon_Juan_Losung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Juan_HI)
	&& ((Tom_tells == TRUE) || (MIS_Huno_Stahl == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Losung_Info()
{
	AI_Output(other, self, "DIA_Addon_Juan_Losung_15_00"); //他 们 说 你 有 一 些 有 趣 的 东 西 … …
	AI_Output(self, other, "DIA_Addon_Juan_Losung_13_01"); //那 又 怎 么 样 ？ 伊 斯 特 班 想 对 我 指 东 说 西 ， 嗯 ？ 我 做 了 所 有 的 工 作 ， 并 在 这 个 糟 糕 的 洞 里 呆 上 几 天 … …
	AI_Output(self, other, "DIA_Addon_Juan_Losung_13_02"); //… … 然 后 他 就 派 个 人 来 拿 走 这 里 所 有 的 东 西 ？ 我 不 是 仓 库 ！
	AI_Output(other, self, "DIA_Addon_Juan_Losung_15_03"); //是 的 ， 然 后 呢 ？ 那 不 关 我 的 事 。
	AI_Output(self, other, "DIA_Addon_Juan_Losung_13_04"); //但 是 我 正 让 它 成 为 你 的 问 题 。 你 想 要 货 物 - 好 ， 你 可 以 付 钱 买 它 。
	AI_Output(self, other, "DIA_Addon_Juan_Losung_13_05"); //从 伊 斯 特 班 、 瑞 雯 或 者 我 不 知 道 的 谁 那 里 弄 点 钱 来 ， 我 不 在 乎 。 谁 想 要 这 些 货 物 ， 就 要 付 钱 买 它 们 ！
};

// ---------------------------------------------------------------------
//	Info Aufs Maul
// ---------------------------------------------------------------------
instance DIA_Addon_Juan_AufsMaul(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 2;
	condition		= DIA_Addon_Juan_AufsMaul_Condition;
	information		= DIA_Addon_Juan_AufsMaul_Info;
	description		= "我 不 是 从 伊 斯 特 班 那 来 的 !";
};

func int DIA_Addon_Juan_AufsMaul_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_AufsMaul_Info()
{
	AI_Output(other, self, "DIA_Addon_Juan_AufsMaul_15_00"); //我 不 是 从 伊 斯 特 班 那 来 的 !
	AI_Output(self, other, "DIA_Addon_Juan_AufsMaul_13_01"); //哦 ？ 嗯 ， 那 么 … … 哦 … … 等 一 下 ！ 不 要 动 ， 你 的 肩 膀 上 有 个 什 么 东 西 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ---------------------------------------------------------------------
//	Info Trade
// ---------------------------------------------------------------------
instance DIA_Addon_Juan_Trade(C_INFO)
{
	npc				= BDT_10017_Addon_Juan;
	nr				= 99;
	condition		= DIA_Addon_Juan_Trade_Condition;
	information		= DIA_Addon_Juan_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Juan_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Juan_Losung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Juan_Trade_Info()
{
	B_Say(other, self, "$TRADE_3");
};
