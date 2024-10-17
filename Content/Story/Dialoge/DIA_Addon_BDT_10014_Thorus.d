// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_EXIT(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 999;
	condition		= DIA_Addon_Thorus_EXIT_Condition;
	information		= DIA_Addon_Thorus_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Thorus_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Hi(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 2;
	condition		= DIA_Addon_Thorus_Hi_Condition;
	information		= DIA_Addon_Thorus_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Thorus_Hi_Condition()
{
	if (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_00"); //你 知 道 规 则 ， 没 有 红 色 石 片 的 人 不 能 进 入 矿 井 。
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Hi_15_01"); //别 管 矿 井 了 - 我 要 见 瑞 雯 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_02"); //尽 管 那 样 ， 我 们 这 里 有 规 定 ， 它 们 适 用 于 所 有 人 。 即 便 是 你 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_03"); //回 去 。 如 果 你 想 要 不 经 许 可 就 进 入 上 层 区 域 ， 其 它 的 卫 兵 会 将 杀 死 你 。 那 些 就 是 规 定 。

	if (!Npc_IsDead(Esteban))
	{
		AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Hi_12_04"); //如 果 你 对 此 有 什 么 问 题 ， 去 和 伊 斯 特 班 谈 谈 。 他 负 责 营 地 。
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

// ----------------------------------------------------------------------
//	Info Raven
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Raven(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 3;
	condition		= DIA_Addon_Thorus_Raven_Condition;
	information		= DIA_Addon_Thorus_Raven_Info;
	description		= "我 要 找 到 瑞 雯 ， 这 十 分 重 要 … …";
};

func int DIA_Addon_Thorus_Raven_Condition()
{
	if (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raven_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Raven_15_00"); //我 要 找 到 瑞 雯 ， 这 十 分 重 要 … …
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_01"); //哦 ， 是 吗 ？ 你 真 的 认 为 能 想 办 法 到 他 面 前 去 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_02"); //他 的 卫 兵 已 经 得 到 命 令 不 让 任 何 人 通 过 。 在 你 看 到 他 之 前 ， 可 能 你 已 经 死 了 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raven_12_03"); //所 以 ， 把 那 个 念 头 从 你 的 脑 袋 里 赶 出 去 吧 。

	Log_CreateTopic(TOPIC_Addon_RavenKDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_6);
};

// ----------------------------------------------------------------------
//	Info Zeit
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Zeit(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 4;
	condition		= DIA_Addon_Thorus_Zeit_Condition;
	information		= DIA_Addon_Thorus_Zeit_Info;
	description		= "你 不 记 得 我 了 ？ 从 旧 营 地 来 … …";
};

func int DIA_Addon_Thorus_Zeit_Condition()
{
	if (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Zeit_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Zeit_15_00"); //你 不 记 得 我 了 ？ 从 旧 营 地 来 … …
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_01"); //你 是 其 中 一 名 囚 犯 ？ ！ 也 许 你 曾 经 还 是 我 的 一 名 卫 兵 。 还 有 吗 ？ 现 在 ， 那 不 足 以 使 我 们 成 为 同 盟 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_02"); //不 ， 不 行 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_03"); //也 许 你 是 那 个 消 除 屏 障 的 人 - 也 许 你 还 也 杀 了 我 的 同 伴 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_04"); //那 又 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_05"); //那 个 时 期 已 经 结 束 了 。

	if (!Npc_IsDead(Esteban))
	{
		AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Zeit_12_06"); //你 要 进 去 ？ 那 就 去 找 红 色 的 石 头 ， 不 要 浪 费 我 的 时 间 。
	};
};

// ----------------------------------------------------------------------
//	Die guten alten Zeiten
// ----------------------------------------------------------------------
var int Thorus_GoodOldPerm;
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_GoodOldPerm(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 4;
	condition		= DIA_Addon_Thorus_GoodOldPerm_Condition;
	information		= DIA_Addon_Thorus_GoodOldPerm_Info;
	permanent		= TRUE;
	description		= "来 吧 ， 让 我 进 去 。 看 在 过 去 的 面 子 上 。";
};

func int DIA_Addon_Thorus_GoodOldPerm_Condition()
{
	if ((MIS_Send_Buddler != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Addon_BDT_10014_Thorus_Zeit))
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_GoodOldPerm_Info()
{
	AI_Output(other, self, "DIA_Addon_Thorus_Add_15_00"); //来 吧 ， 让 我 进 去 。 看 在 过 去 的 面 子 上 。
	if (Thorus_GoodOldPerm == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Thorus_Add_12_01"); //让 我 向 你 解 释 一 下 。 你 知 道 我 为 什 么 还 活 着 吗 ？
		AI_Output(self, other, "DIA_Addon_Thorus_Add_12_02"); //因 为 我 始 终 忠 实 于 自 己 人 。
		AI_Output(self, other, "DIA_Addon_Thorus_Add_12_03"); //我 不 需 要 赞 成 瑞 雯 所 做 的 每 一 件 事 。 但 是 我 会 遵 守 规 则 。
		AI_Output(self, other, "DIA_Addon_Thorus_Add_12_04"); //你 也 一 样 ！
		Thorus_GoodOldPerm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Thorus_Add_12_05"); //（ 坚 定 的 ） 不 ！
	};
};

// ----------------------------------------------------------------------
// Abfrage auf alle Tokens bis auf den ROTEN
// ----------------------------------------------------------------------
func int C_PlayerHasWrongToken()
{
	if ((C_ScHasMagicStonePlate() == TRUE)
	|| (Npc_HasItems(hero, ItWr_StonePlateCommon_Addon) >= 1) // Klar.
	|| (Npc_HasItems(hero, ItMi_Addon_Stone_02) >= 1)
	|| (Npc_HasItems(hero, ItMi_Addon_Stone_03) >= 1)
	|| (Npc_HasItems(hero, ItMi_Addon_Stone_04) >= 1)
	|| (Npc_HasItems(hero, ItMi_Addon_Stone_05) >= 1))
	{
		return TRUE;
	};

	return FALSE;
};

// ----------------------------------------------------------------------
//	Info Stein
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Stein(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 9;
	condition		= DIA_Addon_Thorus_Stein_Condition;
	information		= DIA_Addon_Thorus_Stein_Info;
	permanent		= TRUE;
	description		= "我 这 里 有 一 块 给 你 的 石 片 … …";
};

func int DIA_Addon_Thorus_Stein_Condition()
{
	if ((C_PlayerHasWrongToken() == TRUE)
	&& (RavenIsDead == FALSE)
	&& (MIS_Send_Buddler != LOG_RUNNING)
	&& (MIS_Send_Buddler != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Stein_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Stein_15_00"); //我 这 里 有 一 块 给 你 的 石 片 … …
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Stein_12_01"); //你 没 有 正 确 的 石 头 。 只 有 红 色 的 石 头 最 重 要 。
};

// ----------------------------------------------------------------------
//	Info Rein
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Rein(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 9;
	condition		= DIA_Addon_Thorus_Rein_Condition;
	information		= DIA_Addon_Thorus_Rein_Info;
	description		= "我 这 里 有 一 块 红 色 石 片 … …";
};

func int DIA_Addon_Thorus_Rein_Condition()
{
	if ((Npc_HasItems(other, ItMi_Addon_Stone_01) >= 1)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Rein_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_00"); //我 这 里 有 一 块 红 色 石 片 … …
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_01"); //好 吧 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_02"); //你 杀 了 伊 斯 特 班 - 那 么 你 现 在 要 做 他 的 工 作 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_03"); //在 矿 井 里 出 现 了 一 些 矿 井 爬 行 者 的 问 题 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_04"); //已 经 有 三 个 矿 工 被 杀 了 。 你 的 工 作 是 提 供 替 补 者 。
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Rein_15_05"); //我 什 么 时 候 才 能 最 终 进 入 那 该 死 的 矿 井 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Rein_12_06"); //做 你 的 工 作 - 然 后 你 就 能 做 你 想 做 的 事 。

	MIS_Send_Buddler = LOG_RUNNING;
	Log_CreateTopic(Topic_Addon_Buddler, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Buddler, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Buddler, Topic_Addon_Buddler_1);
};

// ----------------------------------------------------------------------
//	Info drei typen losgeschickt
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Sent(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 9;
	condition		= DIA_Addon_Thorus_Sent_Condition;
	information		= DIA_Addon_Thorus_Sent_Info;
	description		= "我 派 出 了 三 个 人 。";
};

func int DIA_Addon_Thorus_Sent_Condition()
{
	if ((Player_SentBuddler >= 3)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Sent_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Sent_15_00"); //我 派 出 了 三 个 人 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Sent_12_01"); //好 吧 。 等 我 得 到 让 你 进 去 的 通 知 以 后 。

	MIS_Send_Buddler = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

// ----------------------------------------------------------------------
//	Info Armor
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10014_Thorus_Armor(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 99;
	condition		= DIA_Addon_Thorus_Armor_Condition;
	information		= DIA_Addon_Thorus_Armor_Info;
	description		= "嘿 ， 你 穿 的 是 什 么 盔 甲 ？ 我 从 哪 里 能 弄 到 那 样 的 盔 甲 ？";
};

func int DIA_Addon_Thorus_Armor_Condition()
{
	if (RavenIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Armor_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Armor_15_00"); //嘿 ， 你 穿 的 是 什 么 盔 甲 ？ 我 从 哪 里 能 弄 到 那 样 的 盔 甲 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_01"); //你 不 能 。 这 套 盔 甲 是 为 瑞 雯 的 卫 兵 保 留 的 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Armor_12_02"); //我 很 难 想 象 对 候 选 者 来 说 怎 么 通 过 一 项 入 门 测 试 。 不 过 最 终 决 定 的 不 是 我 ， 是 瑞 雯 。
};

// ----------------------------------------------------------------------
//	Info Gefangene
// ----------------------------------------------------------------------
instance DIA_Addon_Thorus_Gefangene(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 88;
	condition		= DIA_Addon_Thorus_Gefangene_Condition;
	information		= DIA_Addon_Thorus_Gefangene_Info;
	description		= "囚 犯 怎 么 样 了 ？";
};

func int DIA_Addon_Thorus_Gefangene_Condition()
{
	if (!Npc_IsDead(Bloodwyn)
	&& Npc_KnowsInfo(other, DIA_Addon_Patrick_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Gefangene_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_00"); //囚 犯 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_01"); //嗯 ， 他 们 已 经 完 成 了 他 们 的 工 作 。 据 我 所 知 ， 他 们 现 在 打 算 挖 掘 黄 金 。
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_02"); //如 果 他 们 逃 走 … … ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_03"); //… … 布 拉 德 维 恩 会 派 他 的 卫 兵 追 杀 他 们 。 但 我 想 象 不 到 他 们 会 疯 狂 到 想 要 逃 走 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_04"); //除 非 … …
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Gefangene_15_05"); //除 非 什 么 ？
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Gefangene_12_06"); //… … 有 其 它 人 唆 使 。 不 过 我 不 知 道 有 谁 会 愚 蠢 到 想 这 么 做 … … 至 少 ， 当 布 拉 德 维 恩 还 在 这 里 的 时 候 。
	B_Say(other, self, "$VERSTEHE");
};

// ----------------------------------------------------------------------
//	Info Speech
// ----------------------------------------------------------------------
instance DIA_Addon_Thorus_Speech(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 99;
	condition		= DIA_Addon_Thorus_Speech_Condition;
	information		= DIA_Addon_Thorus_Speech_Info;
	important		= TRUE;
};

func int DIA_Addon_Thorus_Speech_Condition()
{
	if (Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Speech_Info()
{
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_00"); //你 打 算 做 什 么 ？
	AI_Output(other, self, "DIA_Addon_Thorus_Speech_15_01"); //什 么 ？ ？

	if (RavenIsDead == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_02"); //现 在 你 也 已 经 把 布 拉 德 维 恩 除 掉 了 。 我 只 是 在 问 自 己 下 一 个 是 谁 。 瑞 雯 ？ 还 是 我 ？
		AI_Output(other, self, "DIA_Addon_Thorus_Speech_15_03"); //你 害 怕 了 ？
		AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_04"); //我 不 怕 战 斗 。 但 是 我 害 怕 你 行 动 所 产 生 的 结 果 。
	};

	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_05"); //这 个 营 地 是 我 们 剩 下 的 唯 一 的 东 西 了 。
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_06"); //它 不 一 定 会 发 展 到 完 美 ， 但 是 它 的 确 在 发 展 。
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_07"); //随 着 你 杀 的 每 一 个 人 ， 我 们 社 团 的 另 一 部 分 就 会 分 裂 。
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_08"); //我 们 是 强 盗 ， 流 浪 者 、 违 法 者 、 亡 命 之 徒 。
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_09"); //无 论 我 们 去 哪 里 ， 我 们 都 被 追 捕 、 关 押 和 杀 害 。
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_10"); //对 我 们 来 说 ， 没 有 比 这 里 更 好 的 地 方 ， 没 有 比 现 在 更 好 的 时 光 。
	AI_Output(other, self, "DIA_Addon_Thorus_Speech_15_11"); //你 在 暗 示 什 么 ？
	AI_Output(self, other, "DIA_Addon_Thorus_Speech_12_12"); //这 些 人 需 要 有 人 来 领 导 他 们 。 谁 能 ？ 你 吗 ？ 不 停 地 从 一 个 地 方 游 荡 到 另 一 个 地 方 的 人 ？
};

// ----------------------------------------------------------------------
//	Info Answer
// ----------------------------------------------------------------------
instance DIA_Addon_Thorus_Answer(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 99;
	condition		= DIA_Addon_Thorus_Answer_Condition;
	information		= DIA_Addon_Thorus_Answer_Info;
	description		= "然 后 你 接 收 了 营 地 的 领 导 权 。 ";
};

func int DIA_Addon_Thorus_Answer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Thorus_Speech))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Answer_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_00"); //然 后 你 接 收 了 营 地 的 领 导 权 。

	if (RavenIsDead == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_01"); //好 吧 ， 但 是 瑞 雯 怎 么 样 ？
		AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_02"); //瑞 雯 很 快 就 有 其 它 事 情 要 担 心 了 。 我 会 解 决 他 的 。
	};

	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Answer_15_03"); //哦 ， 是 的 ， 要 保 证 囚 犯 可 以 平 安 地 离 开 营 地 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Answer_12_04"); //好 吧 。 我 会 解 决 这 里 所 有 的 卫 兵 。

	B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_5);

	if (!Npc_IsDead(PrisonGuard))
	{
		B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_6);
	}
	else
	{
		B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_7);
	};
};

// ----------------------------------------------------------------------
//	Info Raventot
// ----------------------------------------------------------------------
instance DIA_Addon_Thorus_Raventot(C_INFO)
{
	npc				= BDT_10014_Addon_Thorus;
	nr				= 99;
	condition		= DIA_Addon_Thorus_Raventot_Condition;
	information		= DIA_Addon_Thorus_Raventot_Info;
	description		= "我 成 功 了 。 瑞 雯 完 蛋 了 。";
};

func int DIA_Addon_Thorus_Raventot_Condition()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorus_Raventot_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_00"); //我 成 功 了 。 瑞 雯 完 蛋 了 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_01"); //那 就 意 味 着 你 已 经 给 了 贝 利 尔 一 脚 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_02"); //那 么 你 要 出 发 了 吗 ？
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_03"); //我 在 这 个 山 谷 的 工 作 完 成 了 。 我 应 该 休 息 几 天 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_04"); //（ 大 笑 ） 是 的 ， 你 一 直 都 在 忙 碌 ， 不 是 吗 ？ （ 认 真 的 ） 旅 途 愉 快 。
	AI_Output(other, self, "DIA_Addon_BDT_10014_Thorus_Raventot_15_05"); //谁 知 道 ， 也 许 我 们 还 会 再 碰 面 。
	AI_Output(self, other, "DIA_Addon_BDT_10014_Thorus_Raventot_12_06"); //谁 知 道 。 你 还 要 穿 过 很 多 大 门 ， 走 过 很 多 的 道 路 。 你 必 定 会 在 其 中 某 个 地 方 遇 到 我 … …

	AI_StopProcessInfos(self);
};
