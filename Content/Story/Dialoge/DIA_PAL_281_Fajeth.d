func int C_SnapperDeath()
{
	if (Npc_IsDead(NewMine_Snapper1)
	&& Npc_IsDead(NewMine_Snapper2)
	&& Npc_IsDead(NewMine_Snapper3)
	&& Npc_IsDead(NewMine_Snapper4)
	&& Npc_IsDead(NewMine_Snapper5)
	&& Npc_IsDead(NewMine_Snapper6)
	&& Npc_IsDead(NewMine_Snapper7)
	&& Npc_IsDead(NewMine_Snapper8))
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_EXIT(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 999;
	condition		= DIA_Fajeth_EXIT_Condition;
	information		= DIA_Fajeth_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fajeth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fajeth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

/*
Seit einiger Zeit suchen wir in diesem verfluchten Gebiet eine Stelle, die noch erzhaltiges Gestein enthält,
nicht ständig von Orkpatroullien heimgesucht wird, wo die dauernden Drachenangriffe ausbleiben !
Wir sind völlig verdreckt und ausgehungert, haben unzählige Kämpfe ausgetragen
und haben endlich hier den Funken einer Hoffnung gefunden bei diesem dreckigen Loch in der Erde dort drüben unseren praktisch unmöglichen Auftrag zu erledigen.
Und da kommt einer wie du daher und besitzt die Frechheit uns zu sagen, wir seien überfällig !Entweder bist du völlig verrückt oder einfach nur unverschämt !
*/
///////////////////////////////////////////////////////////////////////
//	Info First
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_First(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 2;
	condition		= DIA_Fajeth_First_Condition;
	information		= DIA_Fajeth_First_Info;
	important		= TRUE;
};

func int DIA_Fajeth_First_Condition()
{
	if (Garond.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_First_Info()
{
	AI_Output(self, other, "DIA_Fajeth_First_12_00"); //你 是 谁 ？ 你 在 这 里 干 什 么 ？
	AI_Output(other, self, "DIA_Fajeth_First_15_01"); //我 正 在 为 执 行 哈 根 勋 爵 的 命 令 而 奔 走 … …
	AI_Output(self, other, "DIA_Fajeth_First_12_02"); //那 么 你 该 试 着 去 城 堡 。 指 挥 官 加 隆 德 在 那 里 。 他 是 这 次 远 征 的 首 席 指 挥 官 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Hallo(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 2;
	condition		= DIA_Fajeth_Hallo_Condition;
	information		= DIA_Fajeth_Hallo_Info;
	important		= TRUE;
};

func int DIA_Fajeth_Hallo_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Hallo_Info()
{
	AI_Output(self, other, "DIA_Fajeth_Hallo_12_00"); //你 从 哪 里 来 ？
	AI_Output(other, self, "DIA_Fajeth_Hallo_15_01"); //我 是 代 表 加 隆 德 来 这 里 的 … …
	AI_Output(self, other, "DIA_Fajeth_Hallo_12_02"); //很 好 。 我 当 然 需 要 新 人 。
	AI_Output(other, self, "DIA_Fajeth_Hallo_15_03"); //我 不 是 来 协 助 你 的 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_12_04"); //不 是 ？ 那 么 ， 你 为 什 么 来 这 里 ？
	AI_Output(other, self, "DIA_Fajeth_Hallo_15_05"); //我 的 任 务 是 来 看 看 你 们 至 今 已 经 开 采 了 多 少 矿 石 。

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_06"); //尊 敬 的 魔 法 师 。 你 的 出 现 给 予 我 和 我 的 人 带 来 了 信 心 。
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_07"); //如 果 你 能 把 英 诺 斯 赐 予 的 力 量 用 在 我 们 身 上 ， 那 肯 定 对 我 们 有 很 大 的 帮 助 。

		Info_AddChoice(DIA_Fajeth_Hallo, "我 能 帮 你 什 么 忙 ？", DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, "我 的 任 务 十 分 紧 急 。", DIA_Fajeth_Hallo_KDFNein);
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_08"); //我 的 任 务 是 做 一 切 我 认 为 对 开 采 矿 石 有 益 的 事 ， 并 保 护 它 们 。
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_09"); //那 也 包 括 征 用 兵 员 。 你 是 为 英 诺 斯 服 务 的 - 因 此 你 将 听 从 我 的 命 令 。

		Info_AddChoice(DIA_Fajeth_Hallo, "我 能 帮 你 什 么 忙 ？", DIA_Fajeth_Hallo_Tun);
		Info_AddChoice(DIA_Fajeth_Hallo, "我 已 经 得 到 命 令 了 ， 加 隆 德 的 。 ", DIA_Fajeth_Hallo_MILNein);
	}
	else // GIL_SLD
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_10"); //听 着 - 我 不 知 道 为 什 么 加 隆 德 给 我 派 来 一 名 雇 佣 兵 - 但 他 一 定 有 他 的 理 由 。
		AI_Output(self, other, "DIA_Fajeth_Hallo_12_11"); //但 在 我 送 你 回 去 之 前 ， 你 得 为 我 办 一 件 事 。

		Info_AddChoice(DIA_Fajeth_Hallo, "所 有 东 西 都 有 它 自 己 的 价 格 。", DIA_Fajeth_Hallo_SLDJa);
		Info_AddChoice(DIA_Fajeth_Hallo, "不 ， 我 没 有 时 间 … …", DIA_Fajeth_Hallo_SLDNein);
	};
};

func void DIA_Fajeth_Hallo_Tun() // Mission
{
	AI_Output(other, self, "DIA_Fajeth_Hallo_Tun_15_00"); //我 能 帮 你 做 什 么 ？
	AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_01"); //这 些 天 来 ， 一 群 暴 龙 在 我 们 营 地 外 面 游 荡 。 看 起 来 ， 它 们 想 等 待 时 机 来 袭 击 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_02"); //我 不 知 道 它 们 在 等 什 么 - 但 只 要 它 们 在 这 里 ， 营 地 里 头 就 不 会 有 安 宁 。

	if ((Npc_IsDead(Fed)) == FALSE)
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_03"); //首 先 是 那 个 费 德 被 吓 得 发 了 疯 - 这 使 其 它 的 囚 犯 也 快 疯 了 。
	};

	if ((Npc_IsDead(Bilgot)) == FALSE)
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_04"); //那 我 该 派 谁 去 ？ 比 尔 戈 特 ？ 嘿 - 他 也 是 个 废 人 。
	};

	if ((Npc_IsDead(Tengron)) == FALSE)
	{
		AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_05"); //那 腾 格 荣 呢 ？ 他 当 然 能 打 ， 但 他 欠 缺 必 要 的 计 谋 。
	};

	AI_Output(self, other, "DIA_Fajeth_Hallo_Tun_12_06"); //唯 一 能 干 这 件 事 的 人 是 你 。 我 希 望 你 能 追 捕 那 些 该 死 的 畜 生 并 杀 了 它 们 。

	Wld_InsertNpc(NewMine_Snapper7, "OW_PATH_333"); // Joly: Zur Sicherheit, falls keine mehr da sind.
	Wld_InsertNpc(NewMine_Snapper8, "OW_PATH_333");
	Wld_InsertNpc(NewMine_Snapper3, "SPAWN_OW_BLOCKGOBBO_CAVE_DM6");

	MIS_Fajeth_Kill_Snapper = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FajethKillSnapper, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FajethKillSnapper, LOG_RUNNING);
	B_LogEntry(TOPIC_FajethKillSnapper, TOPIC_FajethKillSnapper_1);

	Info_ClearChoices(DIA_Fajeth_Hallo);

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

func void DIA_Fajeth_Hallo_KDFNein()
{
	AI_Output(other, self, "DIA_Fajeth_Hallo_KDFNein_15_00"); //我 的 任 务 比 这 件 事 情 更 紧 急 。 我 不 能 帮 你 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_KDFNein_12_01"); //当 然 ， 尊 敬 的 先 生 。 我 将 告 诉 你 所 有 你 想 知 道 的 事 。
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

func void DIA_Fajeth_Hallo_MILNein()
{
	AI_Output(other, self, "DIA_Fajeth_Hallo_MILNein_15_00"); //我 已 经 得 到 命 令 了 ， 加 隆 德 的 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_MILNein_12_01"); //不 过 你 会 办 好 这 件 事 的 。 但 只 有 在 我 送 你 回 去 的 时 候 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_MILNein_12_02"); //现 在 我 只 想 听 你 说 ： ‘ 我 能 为 你 做 些 什 么 ？ ’ 明 白 吗 ？
};

func void DIA_Fajeth_Hallo_SLDJa()
{
	AI_Output(other, self, "DIA_Fajeth_Hallo_SLDJa_15_00"); //所 有 的 事 情 都 有 个 代 价 。 如 果 你 能 付 钱 的 话 ， 我 会 考 虑 一 下 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_SLDJa_12_01"); //我 不 习 惯 于 跟 雇 佣 兵 做 交 易 。 我 讨 厌 为 了 个 好 价 钱 讨 价 还 价 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_SLDJa_12_02"); //不 过 为 了 表 示 我 的 好 意 ， 我 将 支 付100个 金 币 让 你 为 我 工 作 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_SLDJa_12_03"); //我 们 可 以 达 成 协 议 了 吗 ？
	Fajeth_Pay = TRUE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
	Info_AddChoice(DIA_Fajeth_Hallo, "我 能 帮 你 什 么 忙 ？", DIA_Fajeth_Hallo_Tun);
	Info_AddChoice(DIA_Fajeth_Hallo, "不 ， 我 没 有 时 间 … …", DIA_Fajeth_Hallo_SLDNein);
};

func void DIA_Fajeth_Hallo_SLDNein()
{
	AI_Output(other, self, "DIA_Fajeth_Hallo_SLDNein_15_00"); //不 ， 我 没 有 时 间 来 处 理 你 的 问 题 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_SLDNein_12_01"); //你 在 拒 绝 这 么 好 赚 的 钱 ？ 我 可 从 没 想 过 雇 佣 兵 会 这 样 。
	AI_Output(self, other, "DIA_Fajeth_Hallo_SLDNein_12_02"); //既 然 你 不 想 帮 助 我 们 ， 我 建 议 你 问 了 你 的 问 题 就 赶 紧 走 吧 。
	MIS_Fajeth_Kill_Snapper = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Fajeth_Hallo);
};

///////////////////////////////////////////////////////////////////////
//	Info Leader
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Leader(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 2;
	condition		= DIA_Fajeth_Leader_Condition;
	information		= DIA_Fajeth_Leader_Info;
	description		= "我 杀 了 兽 群 的 首 领 。";
};

func int DIA_Fajeth_Leader_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER)
	&& Npc_IsDead(NewMine_LeadSnapper)
	&& (MIS_Fajeth_Kill_Snapper == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Leader_Info()
{
	AI_Output(other, self, "DIA_Fajeth_Leader_15_00"); //我 杀 了 兽 群 的 首 领 。
	AI_Output(self, other, "DIA_Fajeth_Leader_12_01"); //很 好 。 没 有 了 首 领 ， 它 们 的 危 险 就 只 剩 一 半 了 。 我 想 它 们 不 会 再 攻 击 我 们 了 。

	if (Fajeth_Pay == TRUE)
	{
		AI_Output(self, other, "DIA_Fajeth_Leader_12_02"); //这 是 你 的 金 子 - 商 量 好 了 的 。
		B_GiveInvItems(self, other, ItMi_Gold, 100);
	};

	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};

///////////////////////////////////////////////////////////////////////
//	Info SNAPPER_Killed
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_SNAPPER_KILLED(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 9;
	condition		= DIA_Fajeth_SNAPPER_KILLED_Condition;
	information		= DIA_Fajeth_SNAPPER_KILLED_Info;
	permanent		= TRUE;
	description		= "暴 龙 已 经 被 解 决 了 。";
};

func int DIA_Fajeth_SNAPPER_KILLED_Condition()
{
	if ((MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	&& (C_SnapperDeath() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_SNAPPER_KILLED_Info()
{
	AI_Output(hero, self, "DIA_Fajeth_SNAPPER_KILLED_15_00"); //暴 龙 已 经 被 解 决 了 。
	AI_Output(self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_01"); //干 得 漂 亮 。 我 们 应 该 有 能 力 去 解 决 外 面 剩 下 的 那 些 畜 生 了 。

	if (Fajeth_Pay == TRUE)
	{
		AI_Output(self, hero, "DIA_Fajeth_SNAPPER_KILLED_12_02"); //你 挣 到 了 你 的 钱 - 这 是100个 金 币 ， 商 量 好 了 的 。
		B_GiveInvItems(self, other, ItmI_Gold, 100);
	};

	Fajeth.flags = 0;
	MIS_Fajeth_Kill_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_FajethKillSnapper);
};

///////////////////////////////////////////////////////////////////////
//	Info Running
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Running(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 9;
	condition		= DIA_Fajeth_Running_Condition;
	information		= DIA_Fajeth_Running_Info;
	permanent		= TRUE;
	description		= "你 的 人 士 气 如 何 ？";
};

func int DIA_Fajeth_Running_Condition()
{
	if (MIS_Fajeth_Kill_Snapper == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Running_Info()
{
	AI_Output(other, self, "DIA_Fajeth_Running_15_00"); //你 的 人 士 气 如 何 ？
	AI_Output(self, other, "DIA_Fajeth_Running_12_01"); //你 想 知 道 我 们 的 人 士 气 如 何 ？ 他 们 吓 得 不 能 工 作 了 ！
	AI_Output(self, other, "DIA_Fajeth_Running_12_02"); //解 决 这 些 暴 龙 ， 否 则 就 要 有 人 崩 溃 了 ！
};

///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_BELOHNUNG(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 3;
	condition		= DIA_Fajeth_BELOHNUNG_Condition;
	information		= DIA_Fajeth_BELOHNUNG_Info;
	description		= "告 诉 我 迄 今 为 止 你 采 了 多 少 矿 石 。";
};

func int DIA_Fajeth_BELOHNUNG_Condition()
{
	if ((MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	|| (MIS_Fajeth_Kill_Snapper == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_BELOHNUNG_Info()
{
	AI_Output(other, self, "DIA_Fajeth_BELOHNUNG_15_00"); //告 诉 我 迄 今 为 止 你 采 了 多 少 矿 石 。
	AI_Output(self, other, "DIA_Fajeth_BELOHNUNG_12_01"); //向 加 隆 德 报 告 说 我 们 到 现 在 为 止 只 采 集 到 两 箱 矿 石 。
	AI_Output(self, other, "DIA_Fajeth_BELOHNUNG_12_02"); //由 于 受 到 持 续 的 攻 击 ， 我 已 经 遭 受 了 严 重 的 损 失 。
	AI_Output(self, other, "DIA_Fajeth_BELOHNUNG_12_03"); //如 果 加 隆 德 能 给 我 派 来 更 多 的 人 ， 我 们 就 能 采 到 更 多 的 矿 石 了 。
	AI_Output(other, self, "DIA_Fajeth_BELOHNUNG_15_04"); //我 明 白 了 。 我 会 让 他 知 道 。
	AI_Output(self, other, "DIA_Fajeth_BELOHNUNG_12_05"); //好 的 。 那 么 剩 下 的 事 情 就 交 给 你 了 。 我 们 将 尽 可 能 一 直 坚 守 阵 地 。

	Fajeth_Ore = TRUE;

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_Perm2(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 9;
	condition		= DIA_Fajeth_Perm2_Condition;
	information		= DIA_Fajeth_Perm2_Info;
	permanent		= TRUE;
	description		= "矿 石 出 产 进 度 如 何 ？";
};

func int DIA_Fajeth_Perm2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_Perm2_Info()
{
	AI_Output(other, self, "DIA_Fajeth_Perm2_15_00"); //矿 石 出 产 进 度 如 何 ？
	AI_Output(self, other, "DIA_Fajeth_Perm2_12_01"); //真 糟 糕 。 我 们 现 在 没 有 任 何 进 展 。
	AI_Output(self, other, "DIA_Fajeth_Perm2_12_02"); //我 们 刚 到 这 里 时 ， 一 切 都 还 好 - 可 是 从 那 以 后 ， 我 的 伙 计 们 除 了 一 些 碎 片 就 几 乎 没 有 开 采 到 任 何 东 西 。 没 有 任 何 有 用 的 东 西 。
	AI_Output(self, other, "DIA_Fajeth_Perm2_12_03"); //但 我 们 不 会 放 弃 - 至 少 在 我 还 指 挥 这 里 的 时 候 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3 und höher
// ##
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Erzabbau
///////////////////////////////////////////////////////////////////////
instance DIA_Fajeth_ERZABBAU(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 11;
	condition		= DIA_Fajeth_ERZABBAU_Condition;
	information		= DIA_Fajeth_ERZABBAU_Info;
	permanent		= TRUE;
	description		= "矿 石 挖 掘 的 进 度 如 何 ？";
};

func int DIA_Fajeth_ERZABBAU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fajeth_BELOHNUNG))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Fajeth_ERZABBAU_Info()
{
	AI_Output(other, self, "DIA_Fajeth_ERZABBAU_15_00"); //矿 石 挖 掘 的 进 度 如 何 ？

	if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Fajeth_ERZABBAU_12_01"); //这 里 变 得 越 来 越 安 静 了 。 为 什 么 会 这 样 ？
		AI_Output(other, self, "DIA_Fajeth_ERZABBAU_15_02"); //那 些 龙 死 了 。
		AI_Output(self, other, "DIA_Fajeth_ERZABBAU_12_03"); //好 吧 ， 那 么 我 希 望 我 的 轻 松 日 子 早 点 到 来 。 我 正 在 慢 慢 地 失 去 控 制 。
	}
	else
	{
		AI_Output(self, other, "DIA_Fajeth_ERZABBAU_12_04"); //你 可 以 自 己 去 看 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fajeth_PICKPOCKET(C_INFO)
{
	npc				= PAL_281_Fajeth;
	nr				= 900;
	condition		= DIA_Fajeth_PICKPOCKET_Condition;
	information		= DIA_Fajeth_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Fajeth_PICKPOCKET_Condition()
{
	C_Beklauen(56, 95);
};

func void DIA_Fajeth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET, DIALOG_BACK, DIA_Fajeth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fajeth_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fajeth_PICKPOCKET_DoIt);
};

func void DIA_Fajeth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};

func void DIA_Fajeth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fajeth_PICKPOCKET);
};
