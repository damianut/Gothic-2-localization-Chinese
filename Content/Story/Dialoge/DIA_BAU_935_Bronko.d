///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_EXIT(C_INFO)
{
	npc				= BAU_935_Bronko;
	nr				= 999;
	condition		= DIA_Bronko_EXIT_Condition;
	information		= DIA_Bronko_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bronko_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bronko_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_HALLO(C_INFO)
{
	npc				= BAU_935_Bronko;
	nr				= 1;
	condition		= DIA_Bronko_HALLO_Condition;
	information		= DIA_Bronko_HALLO_Info;
	important		= TRUE;
};

func int DIA_Bronko_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Bronko_HALLO_Info()
{
	AI_Output(self, other, "DIA_Bronko_HALLO_06_00"); //（ 慈 爱 的 ） 这 样 说 来 ， 那 我 们 向 哪 里 走 ？
	AI_Output(other, self, "DIA_Bronko_HALLO_15_01"); //你 是 这 里 的 工 头 吗 ？

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Bronko_HALLO_06_02"); //我 会 在 你 头 上 敲 一 记 ， 你 这 个 无 赖 。
	};

	AI_Output(self, other, "DIA_Bronko_HALLO_06_03"); //如 果 你 想 要 在 我 的 土 地 上 溜 达 ， 那 就 要 付 我5枚 金 币 ， 否 则 你 就 会 被 结 结 实 实 揍 一 顿 ！

	Info_ClearChoices(DIA_Bronko_HALLO);

	Info_AddChoice(DIA_Bronko_HALLO, "休 想 。 你 不 会 从 我 这 里 得 到 任 何 东 西 。", DIA_Bronko_HALLO_vergisses);
	Info_AddChoice(DIA_Bronko_HALLO, "如 果 我 别 无 选 择 的 话 - 给 你 钱 。", DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO, "你 的 土 地 ？ 你 是 这 里 的 农 民 ？", DIA_Bronko_HALLO_deinland);
};

func void DIA_Bronko_HALLO_deinland()
{
	AI_Output(other, self, "DIA_Bronko_HALLO_deinland_15_00"); //你 的 土 地 ？ 你 是 这 里 的 农 民 ？
	AI_Output(self, other, "DIA_Bronko_HALLO_deinland_06_01"); //你 一 定 要 信 。 不 然 我 为 什 么 要 你 付 我 过 路 费 呢 ？
	AI_Output(self, other, "DIA_Bronko_HALLO_deinland_06_02"); //我 不 介 意 你 向 其 它 人 询 问 我 的 事 情 。 嘿 嘿 ！
};

func void DIA_Bronko_HALLO_hiergeld()
{
	AI_Output(other, self, "DIA_Bronko_HALLO_hiergeld_15_00"); //如 果 我 别 无 选 择 的 话 - 给 你 钱 。

	if ((Npc_HasItems(other, ItMi_Gold)) >= 5)
	{
		B_GiveInvItems(other, self, ItMi_Gold, 5);

		AI_Output(self, other, "DIA_Bronko_HALLO_hiergeld_06_01"); //（ 有 点 恶 意 的 ） 谢 谢 你 。 祝 你 一 天 开 心 。

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Bronko_HALLO_hiergeld_06_02"); //你 连5个 金 币 都 没 有 。 想 要 骗 我 ， 是 吗 ？

		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	};
};

func void DIA_Bronko_HALLO_vergisses()
{
	AI_Output(other, self, "DIA_Bronko_HALLO_vergisses_15_00"); //休 想 。 你 不 会 从 我 这 里 得 到 任 何 东 西 。

	if ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Bronko_HALLO_vergisses_06_01"); //那 么 ， 恐 怕 我 必 须 要 狠 狠 教 训 你 了 。
	}
	else
	{
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self, other, "DIA_Bronko_HALLO_vergisses_06_02"); //你 们 这 些 城 市 卫 兵 很 缺 钱 ， 嗯 ？
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Bronko_HALLO_vergisses_06_03"); //我 不 管 是 不 是 魔 法 师 ， 你 必 须 要 付 钱 。 明 白 了 吗 ？
		};
	};

	Info_ClearChoices(DIA_Bronko_HALLO);

	Info_AddChoice(DIA_Bronko_HALLO, "如 果 我 别 无 选 择 的 话 - 给 你 钱 。", DIA_Bronko_HALLO_hiergeld);
	Info_AddChoice(DIA_Bronko_HALLO, "那 来 试 试 。", DIA_Bronko_HALLO_attack);
};

func void DIA_Bronko_HALLO_attack()
{
	AI_Output(other, self, "DIA_Bronko_HALLO_attack_15_00"); //那 来 试 试 。
	AI_Output(self, other, "DIA_Bronko_HALLO_attack_06_01"); //嗯 ， 那 样 的 话 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info keinBauer
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_KEINBAUER(C_INFO)
{
	npc				= BAU_935_Bronko;
	nr				= 2;
	condition		= DIA_Bronko_KEINBAUER_Condition;
	information		= DIA_Bronko_KEINBAUER_Info;
	permanent		= TRUE;
	description		= "你 ， 农 民 ？ 别 让 我 笑 。 你 是 个 无 名 小 卒 ， 真 的 。";
};

var int DIA_Bronko_KEINBAUER_noPerm;

func int DIA_Bronko_KEINBAUER_Condition()
{
	if (
	((MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING) || (Babera_BronkoKeinBauer == TRUE))
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	&& (DIA_Bronko_KEINBAUER_noPerm == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Bronko_KEINBAUER_Info()
{
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_15_00"); //你 ， 农 民 ？ 别 让 我 笑 。 你 是 个 无 名 小 卒 ， 真 的 。
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_06_01"); //什 么 ？ 想 让 我 打 烂 你 的 脸 ？。

	Info_ClearChoices(DIA_Bronko_KEINBAUER);

	if (hero.guild == GIL_NONE)
	{
		if (Babera_BronkoKeinBauer == TRUE)
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER, "（ 威 胁 布 隆 科 来 引 出 雇 佣 兵 ）", DIA_Bronko_KEINBAUER_SLD);
		};

		if (MIS_Sekob_Bronko_eingeschuechtert == LOG_RUNNING)
		{
			Info_AddChoice(DIA_Bronko_KEINBAUER, "塞 柯 布 是 这 里 的 农 民 ， 而 你 只 是 一 个 无 关 紧 要 的 下 三 滥 骗 子 。", DIA_Bronko_KEINBAUER_sekobderbauer);
		};
	};

	Info_AddChoice(DIA_Bronko_KEINBAUER, "嗯 ， 那 让 我 们 看 看 你 得 到 什 么 。", DIA_Bronko_KEINBAUER_attack);
	Info_AddChoice(DIA_Bronko_KEINBAUER, "没 关 系 ！", DIA_Bronko_KEINBAUER_schongut);
};

func void DIA_Bronko_KEINBAUER_attack()
{
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_attack_15_00"); //嗯 ， 那 让 我 们 看 看 你 得 到 什 么 。
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_attack_06_01"); //我 希 望 你 那 么 说 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Bronko_KEINBAUER_sekobderbauer()
{
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_00"); //塞 柯 布 是 这 里 的 农 场 主 ， 你 只 是 一 个 微 不 足 道 的 骗 子 ， 想 要 别 人 口 袋 里 骗 钱 。
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_01"); //谁 说 的 ？
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_sekobderbauer_15_02"); //听 我 说 。 塞 柯 布 要 你 回 去 工 作 ， 而 不 是 在 这 里 闲 逛 。
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_sekobderbauer_06_03"); //那 又 怎 么 样 ？ 你 现 在 想 要 做 什 么 ？
};

func void DIA_Bronko_KEINBAUER_schongut()
{
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_schongut_15_00"); //没 关 系 ！
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_schongut_06_01"); //滚 开 ！

	AI_StopProcessInfos(self);
};

func void DIA_Bronko_KEINBAUER_SLD()
{
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_SLD_15_00"); //好 吧 ， 那 我 只 能 告 诉 地 主 欧 纳 尔 这 里 有 一 个 爱 发 牢 骚 的 农 场 主 不 愿 意 支 付 他 的 租 金 。
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_SLD_06_01"); //嗯 哼 ， 等 一 下 。 欧 纳 尔 会 派 他 所 有 的 雇 佣 兵 来 追 杀 我 的 。
	AI_Output(other, self, "DIA_Bronko_KEINBAUER_SLD_15_02"); //那 又 怎 么 样 ？
	AI_Output(self, other, "DIA_Bronko_KEINBAUER_SLD_06_03"); //好 吧 ， 好 吧 。 你 想 要 什 么 我 都 给 你 ， 但 是 不 要 让 雇 佣 兵 插 手 这 件 事 ， 好 吗 ？

	if (B_GiveInvItems(self, other, ItMi_Gold, Npc_HasItems(self, ItMi_Gold)))
	{
		AI_Output(self, other, "DIA_Bronko_KEINBAUER_SLD_06_04"); //给 ， 我 甚 至 愿 意 把 我 所 有 的 金 币 都 给 你 。
	};

	AI_Output(self, other, "DIA_Bronko_KEINBAUER_SLD_06_05"); //而 且 我 将 回 我 的 地 里 去 。 除 了 雇 佣 兵 以 外 的 任 何 事 。

	AI_StopProcessInfos(self);
	DIA_Bronko_KEINBAUER_noPerm = TRUE;
	Npc_ExchangeRoutine(self, "Start");
	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info fleissig
///////////////////////////////////////////////////////////////////////
instance DIA_Bronko_FLEISSIG(C_INFO)
{
	npc				= BAU_935_Bronko;
	nr				= 3;
	condition		= DIA_Bronko_FLEISSIG_Condition;
	information		= DIA_Bronko_FLEISSIG_Info;
	permanent		= TRUE;
	description		= "（ 嘲 弄 布 隆 科 ）";
};

func int DIA_Bronko_FLEISSIG_Condition()
{
	if (
	(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	)
	{
		return TRUE;
	};
};

func void DIA_Bronko_FLEISSIG_Info()
{
	if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Bronko_FLEISSIG_15_00"); //怎 么 样 ？ 还 像 蜜 蜂 一 样 忙 ， 是 吗 ？
	}
	else
	{
		AI_Output(other, self, "DIA_Bronko_FLEISSIG_15_01"); //怎 么 样 ？ 还 那 么 多 嘴 ？
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Bronko_FLEISSIG_06_02"); //你 是 一 个 雇 佣 兵 ， 不 是 吗 ？ 我 本 来 就 应 该 猜 到 了 。
	}
	else if (MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Bronko_FLEISSIG_06_03"); //（ 担 忧 的 ） 你 不 会 把 其 它 雇 佣 兵 叫 来 吧 ， 嗯 ？
	};

	if (
	(self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	)
	{
		AI_Output(self, other, "DIA_Bronko_FLEISSIG_06_04"); //请 不 要 打 我 。
	};

	AI_Output(self, other, "DIA_Bronko_FLEISSIG_06_05"); //我 马 上 还 要 回 去 工 作 ， 好 吗 ？

	MIS_Sekob_Bronko_eingeschuechtert = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bronko_PICKPOCKET(C_INFO)
{
	npc				= BAU_935_Bronko;
	nr				= 900;
	condition		= DIA_Bronko_PICKPOCKET_Condition;
	information		= DIA_Bronko_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Bronko_PICKPOCKET_Condition()
{
	C_Beklauen(54, 80);
};

func void DIA_Bronko_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
	Info_AddChoice(DIA_Bronko_PICKPOCKET, DIALOG_BACK, DIA_Bronko_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bronko_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bronko_PICKPOCKET_DoIt);
};

func void DIA_Bronko_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};

func void DIA_Bronko_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bronko_PICKPOCKET);
};
