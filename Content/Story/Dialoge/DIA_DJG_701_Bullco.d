// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_EXIT(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 999;
	condition		= DIA_BullcoDJG_EXIT_Condition;
	information		= DIA_BullcoDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BullcoDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BullcoDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_HALLO(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 5;
	condition		= DIA_BullcoDJG_HALLO_Condition;
	information		= DIA_BullcoDJG_HALLO_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_BullcoDJG_HALLO_Condition()
{
	if ((Npc_IsDead(DJG_Sylvio)) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_HALLO_Info()
{
	AI_Output(other, self, "DIA_BullcoDJG_HALLO_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_BullcoDJG_HALLO_06_01"); //这 里 真 的 很 冷 ， 老 兄 ！ 我 不 知 道 有 那 么 多 的 地 方 ， 为 什 么 席 尔 维 欧 偏 要 来 这 里 。
	AI_Output(self, other, "DIA_BullcoDJG_HALLO_06_02"); //这 附 近 形 势 危 及 的 地 方 非 常 多 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wartemal
///////////////////////////////////////////////////////////////////////
instance DIA_BullcoDJG_WARTEMAL(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 6;
	condition		= DIA_BullcoDJG_WARTEMAL_Condition;
	information		= DIA_BullcoDJG_WARTEMAL_Info;
	permanent		= TRUE;
	description		= "其 它 事 情 都 好 吗 ？";
};

func int DIA_BullcoDJG_WARTEMAL_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_BullcoDJG_HALLO))
	|| (Npc_KnowsInfo(other, DIA_Bullco_WASNUN)))
	{
		return TRUE;
	};
};

func void DIA_BullcoDJG_WARTEMAL_Info()
{
	AI_Output(other, self, "DIA_BullcoDJG_WARTEMAL_15_00"); //其 它 事 情 都 好 吗 ？

	if (Npc_KnowsInfo(other, DIA_Bullco_WASNUN))
	{
		AI_Output(self, other, "DIA_BullcoDJG_WARTEMAL_06_01"); //只 是 不 要 刺 激 我 。
	}
	else
	{
		AI_Output(self, other, "DIA_BullcoDJG_WARTEMAL_06_02"); //现 在 不 ！ 我 要 冻 僵 了 ！ 我 只 想 尽 快 离 开 这 里 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SylvioDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_SYLVIODEAD(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 7;
	condition		= DIA_Bullco_SYLVIODEAD_Condition;
	information		= DIA_Bullco_SYLVIODEAD_Info;
	important		= TRUE;
};

func int DIA_Bullco_SYLVIODEAD_Condition()
{
	if (Npc_IsDead(DJG_Sylvio))
	{
		return TRUE;
	};
};

func void DIA_Bullco_SYLVIODEAD_Info()
{
	AI_Output(self, other, "DIA_Bullco_SYLVIODEAD_06_00"); //该 死 。 席 尔 维 欧 死 了 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnun
///////////////////////////////////////////////////////////////////////
instance DIA_Bullco_WASNUN(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 8;
	condition		= DIA_Bullco_WASNUN_Condition;
	information		= DIA_Bullco_WASNUN_Info;
	description		= "那 个 席 尔 维 欧 死 了 ， 现 在 你 有 什 么 计 划？";
};

func int DIA_Bullco_WASNUN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bullco_SYLVIODEAD))
	&& (Npc_IsDead(DJG_Sylvio)))
	{
		return TRUE;
	};
};

func void DIA_Bullco_WASNUN_Info()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_15_00"); //那 个 席 尔 维 欧 死 了 ， 现 在 你 有 什 么 计 划 ？
	AI_Output(self, other, "DIA_Bullco_WASNUN_06_01"); //不 知 道 。 我 想 和 其 它 龙 猎 手 一 起 走 ， 如 果 他 们 还 要 我 的 话 。

	Info_AddChoice(DIA_Bullco_WASNUN, "我 应 该 马 上 扭 掉 你 的 脑 袋 。", DIA_Bullco_WASNUN_kopfab);
	Info_AddChoice(DIA_Bullco_WASNUN, "你 知 道 其 它 人 在 哪 里 吗 ？", DIA_Bullco_WASNUN_woandere);
};

func void DIA_Bullco_WASNUN_woandere()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_woandere_15_00"); //你 知 道 其 它 人 在 哪 里 吗 ？
	AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_06_01"); //我 想 是 这 样 的 。 至 少 我 在 那 边 的 河 边 见 到 过 一 个 。

	Info_AddChoice(DIA_Bullco_WASNUN, "带 我 到 其 它 的 龙 猎 手 那 里 去 。", DIA_Bullco_WASNUN_woandere_zuihnen);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_15_00"); //带 我 到 其 它 的 龙 猎 手 那 里 去 。
	AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_06_01"); //嘿 ， 我 不 是 你 的 仆 人 。

	Info_ClearChoices(DIA_Bullco_WASNUN);

	Info_AddChoice(DIA_Bullco_WASNUN, "随 便 你 吧 。 我 肯 定 我 能 找 到 他 们 。", DIA_Bullco_WASNUN_woandere_zuihnen_alleine);
	Info_AddChoice(DIA_Bullco_WASNUN, "如 果 我 让 你 活 下 去 的 话 ， 就 算 你 有 运 气 。", DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen);
	Info_AddChoice(DIA_Bullco_WASNUN, "我 愿 意 付 给 你 ５ ０ 金 币 。", DIA_Bullco_WASNUN_woandere_zuihnen_Geld);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00"); //如 果 我 让 你 活 下 去 的 话 ， 就 算 你 有 运 气 。
	AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01"); //别 烦 我 。
	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_Geld()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00"); //我 愿 意 付 给 你 ５ ０ 金 币 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01"); //那 好 吧 。 把 钱 交 出 来 。
		AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02"); //跟 我 来 。 我 会 把 你 带 到 我 上 次 见 到 龙 猎 手 的 地 方 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "DJGVorposten");
	}
	else
	{
		AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03"); //你 没 有 5 0 枚 金 币 ， 我 不 会 被 那 种 废 话 欺 骗 的 。 走 开 。
		AI_StopProcessInfos(self);
	};
};

func void DIA_Bullco_WASNUN_woandere_zuihnen_alleine()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00"); //随 便 你 吧 。 我 肯 定 我 能 找 到 他 们 。
	AI_Output(self, other, "DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01"); //那 么 不 要 走 开 。

	AI_StopProcessInfos(self);
};

func void DIA_Bullco_WASNUN_kopfab()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_kopfab_15_00"); //我 应 该 马 上 扭 掉 你 的 脑 袋 。
	AI_Output(self, other, "DIA_Bullco_WASNUN_kopfab_06_01"); //闭 嘴 。

	Info_AddChoice(DIA_Bullco_WASNUN, "拔 出 你 的 武 器 。 我 们 现 在 做 个 了 断 。", DIA_Bullco_WASNUN_kopfab_angriff);
};

func void DIA_Bullco_WASNUN_kopfab_angriff()
{
	AI_Output(other, self, "DIA_Bullco_WASNUN_kopfab_angriff_15_00"); //拔 出 你 的 武 器 。 我 们 现 在 做 个 了 断 。
	AI_Output(self, other, "DIA_Bullco_WASNUN_kopfab_angriff_06_01"); //那 就 这 样 吧 。

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bullco_PICKPOCKET(C_INFO)
{
	npc				= DJG_701_Bullco;
	nr				= 900;
	condition		= DIA_Bullco_PICKPOCKET_Condition;
	information		= DIA_Bullco_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Bullco_PICKPOCKET_Condition()
{
	C_Beklauen(34, 65);
};

func void DIA_Bullco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
	Info_AddChoice(DIA_Bullco_PICKPOCKET, DIALOG_BACK, DIA_Bullco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bullco_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bullco_PICKPOCKET_DoIt);
};

func void DIA_Bullco_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};

func void DIA_Bullco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bullco_PICKPOCKET);
};
