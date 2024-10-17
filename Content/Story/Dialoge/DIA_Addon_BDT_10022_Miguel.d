// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Miguel_EXIT(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 999;
	condition		= DIA_Addon_Miguel_EXIT_Condition;
	information		= DIA_Addon_Miguel_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Miguel_PICKPOCKET(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 900;
	condition		= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information		= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen(40, 48);
};

func void DIA_Addon_Miguel_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK, DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Miguel_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_Hi(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 1;
	condition		= DIA_Addon_Miguel_Hi_Condition;
	information		= DIA_Addon_Miguel_Hi_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Miguel_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_Hi_15_00"); //你 在 这 里 做 什 么 ？

	if (Wld_IsTime(06, 00, 22, 00))
	{
		AI_Output(other, self, "DIA_Addon_Miguel_Hi_15_01"); //你 在 找 什 么 东 西 吗 ？
		AI_Output(self, other, "DIA_Addon_Miguel_Hi_11_02"); //植 物 - 我 在 寻 找 植 物 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Miguel_Hi_11_03"); //通 常 ， 我 寻 找 植 物 。
	};

	AI_Output(self, other, "DIA_Addon_Miguel_Hi_11_04"); //大 部 分 生 长 在 这 里 的 东 西 都 有 某 些 用 途 。
	AI_Output(self, other, "DIA_Addon_Miguel_Hi_11_05"); //多 数 植 物 具 有 治 疗 功 能 ， 另 外 你 可 以 把 那 些 沼 生 草 当 烟 吸 。
	AI_Output(self, other, "DIA_Addon_Miguel_Hi_11_06"); //我 在 屏 障 里 面 的 时 候 ， 一 直 都 是 炼 金 术 士 。
};

// ---------------------------------------------------------------------
//	Info Story
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_Story(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 2;
	condition		= DIA_Addon_Miguel_Story_Condition;
	information		= DIA_Addon_Miguel_Story_Info;
	description		= "他 们 为 什 么 把 你 送 到 屏 障 ？ ";
};

func int DIA_Addon_Miguel_Story_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Miguel_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Story_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_Story_15_00"); //他 们 为 什 么 把 你 送 到 屏 障 ？
	AI_Output(self, other, "DIA_Addon_Miguel_Story_11_01"); //我 合 成 最 多 的 就 是 改 变 精 神 的 药 剂 。
	AI_Output(self, other, "DIA_Addon_Miguel_Story_11_02"); //一 个 晚 上 ， 我 的 导 师 伊 格 纳 兹 把 我 的 ‘ 试 验 品 ’ 当 作 他 的 葡 萄 酒 喝 了 下 去 。
	AI_Output(self, other, "DIA_Addon_Miguel_Story_11_03"); //那 使 他 暂 时 … … 呃 … … 难 以 形 容 ， 从 那 时 起 ， 他 就 有 点 糊 涂 。
	AI_Output(self, other, "DIA_Addon_Miguel_Story_11_04"); //（ 嘲 弄 的 ） 法 师 们 因 为 某 些 原 因 把 我 关 进 屏 障 后 面 。 他 们 那 样 说 ， 我 在 研 究 被 禁 止 的 知 识 。
};

// ---------------------------------------------------------------------
//	LAGER
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_Lager(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 3;
	condition		= DIA_Addon_Miguel_Lager_Condition;
	information		= DIA_Addon_Miguel_Lager_Info;
	description		= "关 于 营 地 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_Addon_Miguel_Lager_Condition()
{
	return TRUE;
};

func void DIA_Addon_Miguel_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_Lager_15_00"); //关 于 营 地 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Miguel_Lager_11_01"); //不 多 。 我 从 来 没 有 自 己 去 过 那 里 。
	AI_Output(self, other, "DIA_Addon_Miguel_Lager_11_02"); //只 有 瑞 雯 的 人 一 开 始 去 过 那 里 。 其 余 那 些 后 来 的 人 ， 例 如 我 ， 只 能 等 他 们 需 要 新 人 的 时 候 。
};

// -----------------------------------------
//	Woher
// -----------------------------------------
instance DIA_Addon_Miguel_WhereFrom(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 4;
	condition		= DIA_Addon_Miguel_WhereFrom_Condition;
	information		= DIA_Addon_Miguel_WhereFrom_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_Addon_Miguel_WhereFrom_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo(other, DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //嗯 ， 我 想 你 也 一 样 。 和 海 盗 一 起 ， 在 海 外 。
	AI_Output(self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //这 里 的 山 谷 被 彻 底 隔 离 了 。 没 有 毗 邻 的 陆 地 。
	AI_Output(other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //（ 沉 思 ） 对 。
};

// -----------------------------------------
//	Angefordert
// -----------------------------------------
instance DIA_Addon_Miguel_Angefordert(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 4;
	condition		= DIA_Addon_Miguel_Angefordert_Condition;
	information		= DIA_Addon_Miguel_Angefordert_Info;
	description		= "他 们 什 么 时 候 需 要 新 人 ？";
};

func int DIA_Addon_Miguel_Angefordert_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Miguel_Lager))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //他 们 什 么 时 候 需 要 新 人 ？
	AI_Output(self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //嗯 ， 等 他 们 那 里 什 么 时 候 缺 人 的 时 候 。
	AI_Output(self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //如 果 有 矿 工 被 矿 井 爬 行 者 吃 掉 的 话 ， 他 们 会 让 我 们 中 的 某 人 来 取 代 他 。
	AI_Output(self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //有 时 他 们 也 会 互 相 残 杀 。 但 是 近 来 他 们 好 多 了 。
	AI_Output(self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //不 知 道 瑞 雯 为 什 么 要 控 制 矿 井 的 进 入 权 ， 所 以 大 家 不 能 同 时 进 去 。
	AI_Output(self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //但 是 我 不 知 道 那 是 怎 么 进 行 的 。 我 从 没 进 去 过 。
};

// ---------------------------------------------------------------------
//	Info Fortuno
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_Fortuno(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 6;
	condition		= DIA_Addon_Miguel_Fortuno_Condition;
	information		= DIA_Addon_Miguel_Fortuno_Info;
	description		= "关 于 弗 图 诺 … …";
};

func int DIA_Addon_Miguel_Fortuno_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Fortuno_FREE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_Fortuno_15_00"); //佛 图 诺 非 常 混 乱 ， 并 需 要 一 瓶 药 剂 恢 复 他 的 记 忆 。
	AI_Output(self, other, "DIA_Addon_Miguel_Fortuno_11_01"); //佛 图 诺 ？ 是 瑞 雯 的 仆 人 ， 不 ？
	AI_Output(other, self, "DIA_Addon_Miguel_Fortuno_15_02"); //他 曾 经 是 。 现 在 他 只 是 个 废 人 。 而 这 是 瑞 雯 的 错 。
	AI_Output(self, other, "DIA_Addon_Miguel_Fortuno_11_03"); //瑞 雯 ？ 到 现 在 为 止 ， 我 想 过 他 的 很 多 事 。 嗯 ， 好 吧 。 但 是 在 沼 泽 这 里 ， 我 无 法 酿 造 任 何 药 剂 。
	AI_Output(other, self, "DIA_Addon_Miguel_Fortuno_15_04"); //我 能 酿 造 药 剂 。 在 营 地 里 有 一 个 炼 金 术 士 工 作 台 。 我 只 需 要 配 方 。
	AI_Output(self, other, "DIA_Addon_Miguel_Fortuno_11_05"); //要 留 意 这 个 配 方 。 酿 造 这 种 药 剂 非 常 危 险 。
	B_GiveInvItems(self, other, ITWr_Addon_MCELIXIER_01, 1);
	AI_Output(self, other, "DIA_Addon_Miguel_Fortuno_11_06"); //如 果 在 酿 造 过 程 中 出 错 ， 或 者 某 种 原 料 不 正 确 ， 这 种 药 剂 就 是 致 命 的 。
	AI_Output(other, self, "DIA_Addon_Miguel_Fortuno_15_07"); //我 会 小 心 的 。

	B_LogEntry(Topic_Addon_Fortuno, Topic_Addon_Fortuno_4);
};

// ---------------------------------------------------------------------
//	Info BRAU
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_BRAU(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 7;
	condition		= DIA_Addon_Miguel_BRAU_Condition;
	information		= DIA_Addon_Miguel_BRAU_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？  ";
};

func int DIA_Addon_Miguel_BRAU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Miguel_Story))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output(other, self, "DIA_Addon_Miguel_BRAU_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Miguel_BRAU_11_01"); //没 时 间 。 我 到 这 里 是 来 赚 钱 的 。 只 要 我 还 无 法 进 入 营 地 ， 我 就 只 能 靠 出 售 草 药 为 生 。
	AI_Output(self, other, "DIA_Addon_Miguel_BRAU_11_02"); //不 过 如 果 你 需 要 药 剂 的 话 ， 我 还 有 一 些 。

	Log_CreateTopic(Topic_Addon_BDT_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, Topic_Addon_BDT_Trader_3);
};

// ---------------------------------------------------------------------
//	Info trade
// ----------------------------------------------------------------------
instance DIA_Addon_Miguel_trade(C_INFO)
{
	npc				= BDT_10022_Addon_Miguel;
	nr				= 888;
	condition		= DIA_Addon_Miguel_trade_Condition;
	information		= DIA_Addon_Miguel_trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Miguel_trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Miguel_BRAU))
	{
		return TRUE;
	};
};

func void DIA_Addon_Miguel_trade_Info()
{
	B_Say(other, self, "$TRADE_1");
	B_GiveTradeInv(self);
};
