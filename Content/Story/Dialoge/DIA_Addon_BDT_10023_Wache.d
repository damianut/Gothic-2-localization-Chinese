// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_10023_Wache_EXIT(C_INFO)
{
	npc				= BDT_10023_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10023_Wache_EXIT_Condition;
	information		= DIA_Addon_10023_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10023_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_10023_Wache_Hi(C_INFO)
{
	npc				= BDT_10023_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10023_Wache_Hi_Condition;
	information		= DIA_Addon_10023_Wache_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_10023_Wache_Hi_Condition()
{
	if (Npc_GetDistToNpc(self, other) <= 300)
	{
		return TRUE;
	};
};

func void DIA_Addon_10023_Wache_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_10023_Wache_Hi_11_00"); //嘿 ， 你 要 去 哪 ？ 你 想 要 走 这 条 路 ？
	AI_Output(other, self, "DIA_Addon_10023_Wache_Hi_15_01"); //嗯 ， 当 然 ， 为 什 么 不 ？
	AI_Output(self, other, "DIA_Addon_10023_Wache_Hi_11_02"); //那 后 面 还 有 更 多 的 奴 隶 。 据 我 所 知 ， 你 可 以 进 去 ， 但 是 不 要 打 他 们 太 狠 ， 不 然 他 们 就 没 法 干 活 了 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_Hi_11_03"); //毕 竟 ， 我 们 不 能 让 他 们 只 是 坐 在 那 里 。 他 们 必 须 去 挖 掘 金 子 。
	AI_Output(other, self, "DIA_Addon_10023_Wache_Hi_15_04"); //我 明 白 。 那 是 谁 下 达 的 命 令 ？
	AI_Output(self, other, "DIA_Addon_10023_Wache_Hi_11_05"); //那 是 布 拉 德 维 恩 下 达 的 直 接 命 令 。
	AI_Output(other, self, "DIA_Addon_10023_Wache_Hi_15_06"); //我 以 为 瑞 雯 是 这 里 的 老 板 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_Hi_11_07"); //正 确 - 但 是 他 把 奴 隶 交 给 了 布 拉 德 维 恩 。 他 不 再 需 要 他 们 了 。

	Pardos.attribute[ATR_HITPOINTS] = 70;
	B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_3);
};

// ---------------------------------------------------------------------
//	Info go
// ---------------------------------------------------------------------
var int PrisonGuard_Rules;
// ---------------------------------------------------------------------
instance DIA_Addon_10023_Wache_go(C_INFO)
{
	npc				= BDT_10023_Addon_Wache;
	nr				= 99;
	condition		= DIA_Addon_10023_Wache_go_Condition;
	information		= DIA_Addon_10023_Wache_go_Info;
	permanent		= TRUE;
	description		= "让 奴 隶 们 走 ！";
};

func int DIA_Addon_10023_Wache_go_Condition()
{
	return TRUE;
};

func void DIA_Addon_10023_Wache_go_Info()
{
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_15_00"); //让 奴 隶 们 走 ！

	if (PrisonGuard_Rules == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_10023_Wache_go_11_01"); //听 着 。 布 拉 德 维 恩 指 挥 这 里 。 奴 隶 们 属 于 他 ， 所 以 他 有 权 力 给 他 们 自 由 。
		AI_Output(self, other, "DIA_Addon_10023_Wache_go_11_02"); //此 外 ， 托 鲁 斯 同 样 也 有 发 言 权 。 那 么 你 呢 ？
		PrisonGuard_Rules = TRUE;
		B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_4);
	};

	AI_Output(self, other, "DIA_Addon_10023_Wache_go_11_03"); //你 还 有 什 么 要 说 的 吗 ？

	Info_ClearChoices(DIA_Addon_10023_Wache_go);
	Info_AddChoice(DIA_Addon_10023_Wache_go, DIALOG_BACK, DIA_Addon_10023_Wache_go_BACK);

	if (Npc_KnowsInfo(other, DIA_Addon_Thorus_Answer))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, "我 同 托 鲁 斯 谈 过 了 。", DIA_Addon_10023_Wache_go_Thorus);
	}
	else if (Npc_IsDead(Bloodwyn)
	&& (Npc_HasItems(other, ItMi_Addon_Bloodwyn_Kopf) >= 1))
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, "（ 出 示 布 拉 德 维 恩 的 头 ）", DIA_Addon_10023_Wache_go_Blood);
	}
	else
	{
		Info_AddChoice(DIA_Addon_10023_Wache_go, "我 决 定 ‘ 谁 ’ 进 入 矿 井 。", DIA_Addon_10023_Wache_go_WER);
	};
};

func void DIA_Addon_10023_Wache_go_BACK()
{
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

func void DIA_Addon_10023_Wache_go_WER()
{
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_WER_15_00"); //我 决 定 ‘ 谁 ’ 进 入 矿 井 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_go_WER_11_01"); //你 在 做 伊 斯 特 班 以 前 的 工 作 。 那 你 确 实 不 能 在 这 里 说 什 么 。 走 开 。
	Info_ClearChoices(DIA_Addon_10023_Wache_go);
};

// ----------------------------------------
var int Wache_einmal;
// ----------------------------------------
func void DIA_Addon_10023_Wache_go_Blood()
{
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_Blood_15_00"); //给 ， 够 了 吗 ？
	AI_Output(self, other, "DIA_Addon_10023_Wache_go_Blood_11_01"); //（ 作 呕 ） 把 那 个 放 到 一 边 。 我 不 想 看 到 那 样 。
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_Blood_15_02"); //你 最 好 马 上 让 奴 隶 们 走 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_go_Blood_11_03"); //等 一 下 。 布 拉 德 维 恩 并 非 这 里 唯 一 有 发 言 权 的 人 。 只 要 我 没 有 得 到 托 鲁 斯 的 命 令 ， 谁 都 不 能 被 释 放 。

	if (Npc_KnowsInfo(other, DIA_Addon_Thorus_Answer))
	{
		Info_ClearChoices(DIA_Addon_10023_Wache_go);
		Info_AddChoice(DIA_Addon_10023_Wache_go, "我 同 托 鲁 斯 谈 过 了 。", DIA_Addon_10023_Wache_go_Thorus);
	}
	else
	{
		if (Wache_einmal == FALSE)
		{
			AI_Output(other, self, "DIA_Addon_10023_Wache_go_Blood_15_04"); //但 是 你 刚 刚 说 奴 隶 们 属 于 布 拉 德 维 恩 。
			AI_Output(self, other, "DIA_Addon_10023_Wache_go_Blood_11_05"); //是 的 ， 但 是 我 也 说 了 ， 如 果 没 有 托 鲁 斯 的 命 令 ， 我 不 会 释 放 任 何 人 。
			AI_Output(other, self, "DIA_Addon_10023_Wache_go_Blood_15_06"); //你 也 是 那 种 没 有 命 令 连 尿 都 不 撒 的 人 ， 嗯 ？
			Wache_einmal = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_10023_Wache_go_Blood_11_07"); //是 的 ， 但 是 我 也 说 过 … …
			AI_Output(other, self, "DIA_Addon_10023_Wache_go_Blood_15_08"); //… … 好 吧 ， 剩 下 的 别 对 我 说 了 。
		};

		Info_ClearChoices(DIA_Addon_10023_Wache_go);
	};
};

func void DIA_Addon_10023_Wache_go_Thorus()
{
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_Thorus_15_00"); //我 同 托 鲁 斯 谈 过 了 。 他 命 令 给 奴 隶 们 自 由 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_go_Thorus_11_01"); //好 吧 ， 如 果 是 托 鲁 斯 的 命 令 的 话 。 但 是 我 必 须 亲 自 去 问 一 下 ， 为 什 么 他 会 做 出 那 样 的 决 定 … …
	AI_Output(other, self, "DIA_Addon_10023_Wache_go_Thorus_15_02"); //… … 但 是 你 问 问 题 也 不 会 得 到 报 酬 。
	AI_Output(self, other, "DIA_Addon_10023_Wache_go_Thorus_11_03"); //好 吧 ， 好 吧 。 显 然 这 里 不 再 需 要 我 了 ， 那 我 要 去 找 些 炖 肉 吃 。

	Ready_Togo = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "SOUP");
};
