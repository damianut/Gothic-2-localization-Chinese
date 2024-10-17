///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_EXIT(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 999;
	condition		= DIA_Kervo_EXIT_Condition;
	information		= DIA_Kervo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasist
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_WASIST(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 4;
	condition		= DIA_Kervo_WASIST_Condition;
	information		= DIA_Kervo_WASIST_Info;
	description		= "有 什 么 麻 烦 ？";
};

func int DIA_Kervo_WASIST_Condition()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info()
{
	AI_Output(other, self, "DIA_Kervo_WASIST_15_00"); //你 怎 么 了 ？
	AI_Output(self, other, "DIA_Kervo_WASIST_13_01"); //你 一 定 要 问 吗 ？ 那 就 看 看 你 周 围 。
	AI_Output(self, other, "DIA_Kervo_WASIST_13_02"); //自 从 我 到 这 里 来 以 后 ， 这 些 该 死 的 潜 伏 者 就 散 布 在 整 个 河 流 上 。
	AI_Output(self, other, "DIA_Kervo_WASIST_13_03"); //最 初 只 有 两 个 。 从 昨 天 起 ， 我 至 少 看 到 了 五 个 。
	AI_Output(self, other, "DIA_Kervo_WASIST_13_04"); //不 知 道 我 会 怎 样 离 开 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_HILFE(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 5;
	condition		= DIA_Kervo_HILFE_Condition;
	information		= DIA_Kervo_HILFE_Info;
	description		= "你 试 过 通 过 关 卡 吗 ？";
};

func int DIA_Kervo_HILFE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kervo_WASIST))
	{
		return TRUE;
	};
};

func void DIA_Kervo_HILFE_Info()
{
	AI_Output(other, self, "DIA_Kervo_HILFE_15_00"); //你 试 过 通 过 关 卡 吗 ？
	AI_Output(self, other, "DIA_Kervo_HILFE_13_01"); //你 觉 得 我 疯 了 吗 ？ 只 要 外 面 那 些 畜 生 还 在 ， 就 算20个 士 兵 也 不 能 把 我 从 这 里 拖 出 去 。 我 讨 厌 那 些 东 西 。
	AI_Output(self, other, "DIA_Kervo_HILFE_13_02"); //（ 完 全 失 去 勇 气 ） 我 只 要 闻 到 它 们 的 气 味 就 会 出 一 身 冷 汗 。 而 它 们 发 出 的 那 种 持 续 不 断 的 咯 咯 声 使 我 的 血 液 都 冻 住 了 。
	AI_Output(self, other, "DIA_Kervo_HILFE_13_03"); //如 果 你 那 么 急 着 去 让 它 们 把 你 活 剐 了 ， 只 管 往 前 走 吧 。

	Info_ClearChoices(DIA_Kervo_HILFE);
	Info_AddChoice(DIA_Kervo_HILFE, "嗯 ， 那 我 离 开 。", DIA_Kervo_HILFE_tschau);
	Info_AddChoice(DIA_Kervo_HILFE, "但 是 你 不 能 永 远 留 在 这 里 。", DIA_Kervo_HILFE_ewig);

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice(DIA_Kervo_HILFE, "如 果 我 杀 了 那 些 东 西 ， 你 能 给 我 什 么 ？", DIA_Kervo_HILFE_Problem);
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};

func void DIA_Kervo_HILFE_ewig()
{
	AI_Output(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //但 是 你 不 能 永 远 留 在 这 里 。
	AI_Output(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //我 不 知 道 你 想 从 我 这 里 得 到 些 什 么 ， 不 过 ， 我 可 以 告 诉 你 ： 你 别 想 让 我 离 开 这 里 。
};

var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem()
{
	AI_Output(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //如 果 我 杀 了 那 些 东 西 ， 你 能 给 我 什 么 ？
	AI_Output(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //嗯 。 好 吧 。 如 果 洞 口 前 面 的 那 些 潜 伏 者 消 失 了 ， 那 就 够 了 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //我 找 到 了 一 个 空 白 的 咒 语 石 。 因 为 你 是 一 个 魔 法 师 ， 我 敢 肯 定 你 拿 着 它 会 有 用 的 。
	}
	else
	{
		AI_Output(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //我 找 到 了 一 块 矿 石 。
	};

	AI_Output(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //我 会 把 它 给 你 作 为 交 换 。
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kervo_HILFE_tschau()
{
	AI_Output(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //嗯 ， 那 我 离 开。
	AI_Output(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //当 然 。 我 不 会 留 你 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info LurkerPlatt
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_LurkerPlatt(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 0;
	condition		= DIA_Kervo_LurkerPlatt_Condition;
	information		= DIA_Kervo_LurkerPlatt_Info;
	description		= "洞 穴 前 面 的 潜 伏 者 已 经 没 了 。";
};

func int DIA_Kervo_LurkerPlatt_Condition()
{
	if ((MIS_Kervo_KillLurker == LOG_RUNNING)
	&& (Npc_IsDead(Kervo_Lurker1))
	&& (Npc_IsDead(Kervo_Lurker2))
	&& (Npc_IsDead(Kervo_Lurker3))
	&& (Npc_IsDead(Kervo_Lurker4))
	&& (Npc_IsDead(Kervo_Lurker5))
	&& (Npc_IsDead(Kervo_Lurker6)))
	{
		return TRUE;
	};
};

func void DIA_Kervo_LurkerPlatt_Info()
{
	AI_Output(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //洞 穴 前 面 的 潜 伏 者 已 经 没 了 。
	AI_Output(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //太 棒 了 。 我 现 在 终 于 又 可 以 喘 口 气 了 。

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //这 是 我 对 你 保 证 过 的 东 西 。

		if (hero.guild == GIL_KDF)
		{
			B_GiveInvItems(self, other, ItMi_RuneBlank, 1);
		}
		else
		{
			B_GiveInvItems(self, other, ItMi_Nugget, 1);
		};
	};

	B_GivePlayerXP(XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Vergisses
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_VERGISSES(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 0;
	condition		= DIA_Kervo_VERGISSES_Condition;
	information		= DIA_Kervo_VERGISSES_Info;
	permanent		= TRUE;
	description		= "你 现 在 可 以 穿 过 关 卡 了 吗 ？";
};

func int DIA_Kervo_VERGISSES_Condition()
{
	if (MIS_Kervo_KillLurker == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Kervo_VERGISSES_Info()
{
	AI_Output(other, self, "DIA_Kervo_VERGISSES_15_00"); //你 现 在 可 以 穿 过 关 卡 了 吗 ？
	AI_Output(self, other, "DIA_Kervo_VERGISSES_13_01"); //算 了 吧 ， 伙 计 。 如 果 他 们 抓 住 了 我 ， 他 们 会 把 我 带 回 矿 区 。 我 要 留 在 这 里 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Kervo_PICKPOCKET(C_INFO)
{
	npc				= STRF_1116_Kervo;
	nr				= 900;
	condition		= DIA_Kervo_PICKPOCKET_Condition;
	information		= DIA_Kervo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Kervo_PICKPOCKET_Condition()
{
	C_Beklauen(34, 10);
};

func void DIA_Kervo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
	Info_AddChoice(DIA_Kervo_PICKPOCKET, DIALOG_BACK, DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kervo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};

func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kervo_PICKPOCKET);
};
