// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BL_BDT_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_Addon_BL_BDT_1_EXIT_Condition;
	information		= DIA_Addon_BL_BDT_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_BL_BDT_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									Chef
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Chef(C_INFO)
{
	nr				= 2;
	condition		= DIA_Addon_BL_BDT_1_Chef_Condition;
	information		= DIA_Addon_BL_BDT_1_Chef_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_Addon_BL_BDT_1_Chef_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_Chef_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_1_Chef_15_00"); //谁 主 管 这 里 ？

	if (RavenIsDead == TRUE)
	{
		if (Npc_IsDead(Thorus))
		{
			AI_Output(self, other, "DIA_Addon_BL_BDT_1_Chef_01_01"); //那 么 多 的 统 治 者 来 来 往 往 … … 经 过 一 段 时 间 ， 你 们 失 去 了 观 察 力 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_BL_BDT_1_Chef_01_02"); //我 想 托 鲁 斯 现 在 是 我 们 的 头 … …
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_1_Chef_01_03"); //瑞 雯 是 我 们 的 首 领 。 他 领 导 我 们 ， 并 在 这 里 修 建 了 营 地 。
		AI_Output(self, other, "DIA_Addon_BL_BDT_1_Chef_01_04"); //他 控 制 着 矿 井 ， 不 然 那 些 坏 蛋 们 早 就 站 在 金 子 上 互 相 屠 杀 了 。
	};
};

// *************************************************************************
// 									Lager (nicht perm!)
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager(C_INFO)
{
	nr				= 3;
	condition		= DIA_Addon_BL_BDT_1_Lager_Condition;
	information		= DIA_Addon_BL_BDT_1_Lager_Info;
	description		= "关 于 营 地 你 知 道 什 么 ？";
};

func int DIA_Addon_BL_BDT_1_Lager_Condition()
{
	if ((Sklaven_Flucht == FALSE)
	|| !Npc_IsDead(Raven))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_1_Lager_15_00"); //关 于 营 地 你 知 道 什 么 ？
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Lager_01_01"); //当 这 里 有 金 矿 的 消 息 散 布 出 去 后 ， 这 些 笨 蛋 们 在 这 里 引 起 了 相 当 大 的 骚 动 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Lager_01_02"); //瑞 雯 杀 了 他 们 中 最 坏 的 ， 并 把 其 它 人 赶 出 了 矿 坑 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Lager_01_03"); //从 那 时 起 ， 上 层 的 地 区 就 不 允 许 任 何 人 进 入 了 。 他 还 把 囚 犯 抓 到 这 里 来 挖 掘 金 矿 。
	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_ScoutBandits, Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};

// *************************************************************************
// 									Lager2
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Lager2(C_INFO)
{
	nr				= 3;
	condition		= DIA_Addon_BL_BDT_1_Lager2_Condition;
	information		= DIA_Addon_BL_BDT_1_Lager2_Info;
	permanent		= TRUE;
	description		= "关 于 营 地 你 知 道 什 么 ？";
};

func int DIA_Addon_BL_BDT_1_Lager2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BL_BDT_1_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Lager2_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_1_Lager2_15_00"); //关 于 营 地 你 知 道 什 么 ？
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Lager2_01_01"); //如 果 你 攻 击 了 某 个 人 ， 其 它 人 会 全 部 都 向 你 发 起 攻 击 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Lager2_01_02"); //除 非 你 有 很 好 的 理 由 去 和 某 人 争 论 ， 那 样 的 话 就 不 会 有 任 何 人 牵 扯 进 来 。
};

// *************************************************************************
// 								News
// *************************************************************************
instance DIA_Addon_BL_BDT_1_News(C_INFO)
{
	nr				= 4;
	condition		= DIA_Addon_BL_BDT_1_News_Condition;
	information		= DIA_Addon_BL_BDT_1_News_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 新 的 吗 ？ ";
};

func int DIA_Addon_BL_BDT_1_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_BL_BDT_1_News_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_1_News_15_00"); //还 有 什 么 新 的 吗 ？

	if (RavenIsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_BL_BDT_1_News_01_01"); //瑞 雯 死 了 。 我 们 现 在 要 做 什 么 ？
	};

	AI_Output(self, other, "DIA_Addon_BL_BDT_1_News_01_02"); //海 盗 不 会 带 我 们 回 主 大 陆 ， 因 为 上 一 次 的 运 输 费 还 没 给 他 们 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_News_01_03"); //我 们 应 该 杀 掉 他 们 一 两 个 ， 那 么 剩 下 的 就 会 送 我 们 了 。
};

// *************************************************************************
// 									Sklaven
// *************************************************************************
instance DIA_Addon_BL_BDT_1_Sklaven(C_INFO)
{
	nr				= 5;
	condition		= DIA_Addon_BL_BDT_1_Sklaven_Condition;
	information		= DIA_Addon_BL_BDT_1_Sklaven_Info;
	permanent		= TRUE;
	description		= "关 于 囚 犯 你 都 知 道 些 什 么 ？";
};

func int DIA_Addon_BL_BDT_1_Sklaven_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BL_BDT_1_Lager)
	&& ((Sklaven_Flucht == FALSE)
	|| (RavenIsDead == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BL_BDT_1_Sklaven_Info()
{
	AI_Output(other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_00"); //关 于 囚 犯 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_01"); //瑞 雯 想 要 挖 出 什 么 东 西 。 首 先 他 让 强 盗 们 去 挖 ， 但 是 死 了 很 多 人 。
	AI_Output(self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_02"); //那 就 是 为 什 么 他 后 来 要 把 囚 犯 抓 来 - 如 果 他 们 死 了 ， 也 没 什 么 大 不 了 。

	if (BDT_1_Ausbuddeln == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_BL_BDT_1_Sklaven_15_03"); //瑞 雯 究 竟 想 要 挖 什 么 ？
		AI_Output(self, other, "DIA_Addon_BL_BDT_1_Sklaven_01_04"); //不 知 道 ， 但 一 定 是 比 金 子 更 有 用 的 价 值 。
		BDT_1_Ausbuddeln = TRUE;
	};
};

func void B_AssignAmbientInfos_Addon_BL_BDT_1(var C_Npc slf)
{
	DIA_Addon_BL_BDT_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Chef.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_News.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Sklaven.npc = Hlp_GetInstanceID(slf);
	DIA_Addon_BL_BDT_1_Lager2.npc = Hlp_GetInstanceID(slf);
};
