// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_EXIT(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 999;
	condition		= DIA_Addon_Emilio_EXIT_Condition;
	information		= DIA_Addon_Emilio_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Emilio_PICKPOCKET(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 900;
	condition		= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information		= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen(76, 112);
};

func void DIA_Addon_Emilio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK, DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Emilio_PICKPOCKET);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10015_Emilio_Hi(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 1;
	condition		= DIA_Addon_Emilio_Hi_Condition;
	information		= DIA_Addon_Emilio_Hi_Info;
	description		= "你 看 起 来 像 个 挖 掘 者 。";
};

func int DIA_Addon_Emilio_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Emilio_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00"); //你 看 起 来 像 个 挖 掘 者 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01"); //我 是 一 个 矿 工 。 上 一 次 我 在 矿 井 里 的 时 候 ， 正 忙 的 不 可 开 交 。

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry(TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine);
		Log_AddEntry(TOPIC_Addon_ScoutBandits, Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};

// ----------------------------------------------------------------------
//	Info Gold
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10015_Emilio_Gold(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 2;
	condition		= DIA_Addon_Emilio_Gold_Condition;
	information		= DIA_Addon_Emilio_Gold_Info;
	description		= "矿 井 的 金 子 怎 么 了 ？";
};

func int DIA_Addon_Emilio_Gold_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Gold_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00"); //矿 井 的 金 子 怎 么 了 ？
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01"); //托 鲁 斯 搜 集 并 分 发 它 。 任 何 人 都 不 能 保 留 他 挖 掘 到 的 东 西 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02"); //每 个 人 都 只 能 分 到 一 部 分 金 子 - 那 样 的 话 ， 即 使 猎 人 和 卫 兵 也 能 得 到 他 们 的 那 一 份 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03"); //我 觉 得 那 样 不 错 。 由 于 我 们 制 定 了 那 个 规 则 ， 死 亡 减 少 了 ， 而 矿 工 也 能 比 外 面 那 些 人 分 到 更 多 。
};

// ----------------------------------------------------------------------
//	Info Stein
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10015_Emilio_Stein(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 3;
	condition		= DIA_Addon_Emilio_Stein_Condition;
	information		= DIA_Addon_Emilio_Stein_Info;
	description		= "怎 么 处 理 这 些 红 石 头 ？";
};

func int DIA_Addon_Emilio_Stein_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Emilio_Jetzt))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Stein_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00"); //怎 么 处 理 这 些 红 石 头 ？
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01"); //那 是 托 鲁 斯 和 伊 斯 特 班 想 出 来 的 东 西 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02"); //托 鲁 斯 负 责 黄 金 分 配 ， 而 伊 斯 特 班 为 矿 井 组 织 工 人 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03"); //当 然 ， 他 不 会 在 每 次 派 了 新 人 进 入 矿 井 后 就 跑 到 托 鲁 斯 那 里 汇 报 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04"); //因 此 他 给 我 们 每 人 一 块 那 种 红 色 石 片 ， 然 后 托 鲁 斯 就 会 让 我 们 进 去 。 它 就 像 是 通 行 证 。
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
var int Emilio_Switch;
instance DIA_Addon_Emilio_Attentat(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 4;
	condition		= DIA_Addon_Emilio_Attentat_Condition;
	information		= DIA_Addon_Emilio_Attentat_Info;
	permanent		= TRUE;
	description		= "关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？";
};

func int DIA_Addon_Emilio_Attentat_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead(Senyan)))
	{
		return FALSE; // selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Emilio_Attentat_15_00"); //关 于 那 次 袭 击 ， 你 都 知 道 些 什 么 ？
	if (Emilio_Switch == 0)
	{
		AI_Output(self, other, "DIA_Addon_Emilio_Attentat_10_01"); //（ 害 怕 ） 嘿 ， 老 兄 ， 我 什 么 都 没 做 ！
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Emilio_Attentat_10_02"); //（ 害 怕 ） 什 么 事 都 没 有 ！
		Emilio_Switch = 0;
	};
};

// ----------------------------------------------------------------------
//	Info Senyan
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10015_Emilio_Senyan(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 1;
	condition		= DIA_Addon_Emilio_Senyan_Condition;
	information		= DIA_Addon_Emilio_Senyan_Info;
	important		= TRUE;
};

func int DIA_Addon_Emilio_Senyan_Condition()
{
	if (Npc_IsDead(Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Senyan_Info()
{
	if (Senyan_Called == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00"); //（ 仔 细 调 查 ） 告 诉 我 ， 为 什 么 森 延 大 喊 ， ‘ 看 看 是 谁 来 了 ’ ？
		AI_Output(other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01"); //（ 冷 淡 的 ） 一 笔 没 了 结 的 旧 账 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //你 杀 了 森 延 ！
	};

	AI_Output(other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03"); //你 对 此 有 什 么 问 题 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04"); //（ 匆 忙 的 ） 不 ， 伙 计 ， 我 对 它 没 问 题 。
	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05"); //刚 好 相 反 。 （ 嘲 弄 的 ） 这 个 混 蛋 为 伊 斯 特 班 工 作 。

	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_9);
};

// ----------------------------------------------------------------------
//	Info Jetzt
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_Jetzt(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 5;
	condition		= DIA_Addon_Emilio_Jetzt_Condition;
	information		= DIA_Addon_Emilio_Jetzt_Info;
	description		= "为 什 么 你 现 在 不 在 矿 井 ？";
};

func int DIA_Addon_Emilio_Jetzt_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10015_Emilio_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Jetzt_Info()
{
	AI_Output(other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //为 什 么 你 现 在 不 在 矿 井 ？
	AI_Output(self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //（ 有 些 不 确 定 ） 我 已 经 到 矿 井 很 久 了 ， 并 且 不 停 工 作 ， 直 到 我 快 要 跌 倒 的 时 候 。 现 在 我 需 要 休 息 几 天 。
	AI_Output(self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //（ 叹 气 ， 多 少 有 些 不 确 定 ） 在 我 拿 到 下 一 块 红 石 头 之 前 。
};

// ----------------------------------------------------------------------
//	Info VonEmilio
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_VonEmilio(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 6;
	condition		= DIA_Addon_Emilio_VonEmilio_Condition;
	information		= DIA_Addon_Emilio_VonEmilio_Info;
	description		= "雷 纳 尔 跟 我 讲 了 一 些 你 的 事 … …";
};

func int DIA_Addon_Emilio_VonEmilio_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_VonEmilio_Info()
{
	AI_Output(other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //雷 纳 尔 跟 我 讲 了 一 些 你 的 事 … …
	AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //雷 纳 尔 ？ 那 家 伙 是 个 白 痴 。 你 一 定 已 经 发 现 了 。
	AI_Output(other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //他 说 自 从 上 次 袭 击 后 ， 你 一 直 没 来 矿 井 。
	AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //（ 害 怕 ） 我 … … 什 么 都 不 知 道 ！

	if (!Npc_IsDead(Senyan))
	{
		AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //你 在 和 那 个 森 延 合 作 ！
		AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //你 们 都 是 伊 斯 特 班 的 同 谋 ！ 我 刚 好 地 听 到 了 你 泄 露 的 秘 密 ！
		AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //到 目 前 为 止 ， 伊 斯 特 班 根 本 不 在 乎 我 们 。 我 为 什 么 要 相 信 他 的 人 ?
		AI_Output(self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //别 惹 我 ！
		AI_StopProcessInfos(self);
	};

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_10);
};

// ----------------------------------------------------------------------
//	Info Hilf Mir
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_HilfMir(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 7;
	condition		= DIA_Addon_Emilio_HilfMir_Condition;
	information		= DIA_Addon_Emilio_HilfMir_Info;
	description		= "帮 我 找 出 这 次 袭 击 背 后 的 哪 个 人 ！";
};

func int DIA_Addon_Emilio_HilfMir_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead(Senyan)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_HilfMir_Info()
{
	AI_Output(other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //帮 我 找 出 这 次 袭 击 背 后 的 哪 个 人 ！
	AI_Output(self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //不 ！ 我 不 想 对 它 做 任 何 事 ！
	AI_Output(other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //如 果 象 雷 纳 尔 那 样 的 傻 瓜 能 发 现 你 举 止 怪 异 的 话 ， 用 不 了 多 久 伊 斯 特 班 也 能 发 现 。
	AI_Output(self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //（ 局 促 不 安 ） 我 … … 该 死 ！ 我 会 告 诉 你 一 个 名 字 。 仅 此 而 已 。
	AI_Output(other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //我 正 在 听 。
	AI_Output(self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //胡 诺 … … 去 找 胡 诺 。 他 一 定 知 道 和 此 事 有 关 的 一 些 事 情 。
	Emilio_TellAll = TRUE;

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_11);
};

// ----------------------------------------------------------------------
//	Info Hilf Mir
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_GegenEsteban(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 8;
	condition		= DIA_Addon_Emilio_GegenEsteban_Condition;
	information		= DIA_Addon_Emilio_GegenEsteban_Info;
	description		= "你 有 什 么 办 法 来 对 抗 伊 斯 特 班 ？";
};

func int DIA_Addon_Emilio_GegenEsteban_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_GegenEsteban_Info()
{
	AI_Output(other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //你 有 什 么 办 法 来 对 抗 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //那 头 猪 考 虑 只 是 钱 。
	AI_Output(self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //每 过 几 天 ， 我 们 之 中 就 有 人 被 爬 行 者 吃 掉 。
	AI_Output(self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //但 是 伊 斯 特 班 就 是 不 派 任 何 战 士 进 入 矿 井 。
	AI_Output(self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //为 什 么 ？ 那 些 家 伙 属 于 ‘ 瑞 雯 ’ 的 保 镖 ， 而 伊 斯 特 班 不 敢 告 诉 他 们 。
	AI_Output(self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //他 宁 愿 让 我 们 被 杀 死 ！
};

// ----------------------------------------------------------------------
//	Info Mine
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10015_Emilio_Mine(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 9;
	condition		= DIA_Addon_Emilio_Mine_Condition;
	information		= DIA_Addon_Emilio_Mine_Info;
	description		= DIALOG_ADDON_MINE_DESCRIPTION;
};

func int DIA_Addon_Emilio_Mine_Condition()
{
	if ((MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems(other, ItmI_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Mine_Info()
{
	B_Say(other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other, self, ItmI_Addon_Stone_01, 1);

	AI_Output(self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00"); //所 以 现 在 你 是 这 里 的 头 。 好 吧 ， 那 样 我 将 会 开 始 行 动 。

	Player_SentBuddler = (Player_SentBuddler + 1);
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "MINE");
};

// ----------------------------------------------------------------------
//	Info Hacker
// ----------------------------------------------------------------------
instance DIA_Addon_Emilio_Hacker(C_INFO)
{
	npc				= BDT_10015_Addon_Emilio;
	nr				= 9;
	condition		= DIA_Addon_Emilio_Hacker_Condition;
	information		= DIA_Addon_Emilio_Hacker_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Addon_Emilio_Hacker_Condition()
{
	if (Npc_GetDistToWP(self, "ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Emilio_Hacker_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //我 真 的 工 作 很 努 力 。 嗯 ， 最 重 要 的 是 ， 我 不 想 被 爬 行 者 吃 掉 。
};
