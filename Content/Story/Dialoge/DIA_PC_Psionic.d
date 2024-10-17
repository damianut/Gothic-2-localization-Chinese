// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lester_EXIT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= DIA_Lester_EXIT_Condition;
	information		= DIA_Lester_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Lester_Hello(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 1;
	condition		= DIA_Lester_Hello_Condition;
	information		= DIA_Lester_Hello_Info;
	important		= TRUE;
};

func int DIA_Lester_Hello_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_Hello_Info()
{
	if (C_BodyStateContains(self, BS_SIT))
	{
		AI_StandUp(self);
		B_TurnToNpc(self, other);
	};

	AI_Output(self, other, "DIA_Lester_Hello_13_00"); //是 你 吗 ？ - 真 是 ！ 伙 计 ， 见 到 你 我 真 高 兴 ！

	Info_ClearChoices(DIA_Lester_Hello);

	Info_AddChoice(DIA_Lester_Hello, "我 认 识 你 吗 ？", DIA_Lester_Hello_YouKnowMe);
	Info_AddChoice(DIA_Lester_Hello, "莱 斯 特 ！ 你 怎 么 到 这 里 的 ？", DIA_Lester_Hello_Lester);
};

func void DIA_Lester_Hello_Lester()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other, self, "DIA_Lester_Hello_Lester_15_00"); //莱 斯 特 ！ 你 怎 么 到 这 里 的 ？
	AI_Output(self, other, "DIA_Lester_Hello_Lester_13_01"); //那 真 是 一 次 疯 狂 的 逃 亡 。 在 屏 障 被 打 破 后 ， 我 迷 迷 糊 糊 地 在 那 个 地 方 转 了 很 久 。
	AI_Output(self, other, "DIA_Lester_Hello_Lester_13_02"); //然 后 ， 我 花 了 几 天 时 间 在 树 丛 里 杀 出 了 一 条 路 ， 直 到 最 后 找 到 这 个 山 谷 。
	AI_Output(self, other, "DIA_Lester_Hello_Lester_13_03"); //迪 雅 戈 、 米 尔 腾 和 戈 恩 仍 然 在 矿 藏 山 谷 里 。 至 少 我 是 这 么 想 的 。
};

func void DIA_Lester_Hello_YouKnowMe()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other, self, "DIA_Lester_Hello_YouKnowMe_15_00"); //我 应 该 认 识 你 吗 ？
	AI_Output(self, other, "DIA_Lester_Hello_YouKnowMe_13_01"); //你 好 ？ 有 人 在 家 吗 ？ 我 冒 着 掉 脑 袋 的 危 险 你 才 能 得 到 那 块 怪 异 的 石 头 。
	AI_Output(self, other, "DIA_Lester_Hello_YouKnowMe_13_02"); //你 欠 我 一 些 东 西 … … 这 次 你 该 记 得 那 是 什 么 了 吧 。
	AI_Output(self, other, "DIA_Lester_Hello_YouKnowMe_13_03"); //你 还 记 得 迪 雅 戈 、 米 尔 腾 和 戈 恩 吗 ？

	Info_AddChoice(DIA_Lester_Hello, "迪 雅 戈 ， 米 尔 腾 和 谁 ？", DIA_Lester_Hello_WhoFourFriends);
	Info_AddChoice(DIA_Lester_Hello, "当 然 。 他 们 怎 么 样 ？", DIA_Lester_Hello_KnowFourFriends);
};

func void DIA_Lester_Hello_KnowFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other, self, "DIA_Lester_Hello_KnowFourFriends_15_00"); //当 然 。 他 们 怎 么 样 ？
	AI_Output(self, other, "DIA_Lester_Hello_KnowFourFriends_13_01"); //据 我 所 知 ， 他 们 在 屏 障 破 坏 以 后 ， 应 该 还 活 着 。
	AI_Output(self, other, "DIA_Lester_Hello_KnowFourFriends_13_02"); //我 不 知 道 他 们 现 在 在 哪 里 - 他 们 三 个 可 能 还 在 矿 藏 山 谷 中 游 荡 。
	AI_Output(self, other, "DIA_Lester_Hello_KnowFourFriends_13_03"); //如 果 你 碰 到 他 们 就 告 诉 我 一 声 。
};

func void DIA_Lester_Hello_WhoFourFriends()
{
	Info_ClearChoices(DIA_Lester_Hello);
	AI_Output(other, self, "DIA_Lester_Hello_WhoFourFriends_15_00"); //迪 雅 戈 ， 米 尔 腾 和 谁 ？
	AI_Output(self, other, "DIA_Lester_Hello_WhoFourFriends_13_01"); //别 告 诉 我 说 你 什 么 都 不 记 得 了 。 聚 焦 石 - 巨 魔 - 水 法 师 的 庞 大 的 矿 石 堆 ？
	AI_Output(other, self, "DIA_Lester_Hello_WhoFourFriends_15_02"); //我 不 很 肯 定 … …
	AI_Output(self, other, "DIA_Lester_Hello_WhoFourFriends_13_03"); //它 们 都 会 想 起 来 的 。 我 也 花 了 一 阵 儿 功 夫 ， 头 脑 才 清 醒 过 来 。
};

// ************************************************************
// 		  				  Was ist passiert? // E1
// ************************************************************
instance DIA_Lester_WhatHappened(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 1;
	condition		= DIA_Lester_WhatHappened_Condition;
	information		= DIA_Lester_WhatHappened_Info;
	description		= "它 们 都 会 想 起 来 的 。 我 也 花 了 一 阵 儿 功 夫 ， 头 脑 才 清 醒 过 来 。";
};

func int DIA_Lester_WhatHappened_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lester_Hello))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_WhatHappened_Info()
{
	AI_Output(other, self, "DIA_Lester_WhatHappened_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_01"); //沉 睡 者 被 打 败 后 ， 整 个 兄 弟 会 都 精 神 错 乱 了 。
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_02"); //没 有 了 他 们 的 首 脑 ， 他 们 都 变 成 了 空 壳 。
	AI_Output(other, self, "DIA_Lester_WhatHappened_15_03"); //你 呢 ？ 你 怎 么 样 ？
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_04"); //我 也 是 一 样 。 我 晚 上 会 作 恶 梦 而 且 还 有 幻 觉 。 但 是 当 我 的 头 脑 又 多 少 回 复 点 清 醒 的 时 候 ， 我 就 会 逃 命 。
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_05"); //有 一 次 ， 我 想 我 看 到 一 个 巨 大 的 黑 影 向 一 群 逃 亡 者 猛 扑 过 去 ， 用 一 团 巨 大 的 火 云 中 把 他 们 烧 成 了 灰 烬 。
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_06"); //在 那 一 刻 ， 我 真 的 以 为 有 一 条 龙 来 杀 我 了 。
	AI_Output(other, self, "DIA_Lester_WhatHappened_15_07"); //你 还 看 到 了 什 么 其 它 的 东 西 ？
	AI_Output(self, other, "DIA_Lester_WhatHappened_13_08"); //没 有 - 我 玩 命 似 的 跑 了 ！
};

// ************************************************************
// 		  				   Minental // E1
// ************************************************************
instance DIA_Lester_MineColony(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 2;
	condition		= DIA_Lester_MineColony_Condition;
	information		= DIA_Lester_MineColony_Info;
	description		= "你 躲 在 这 座 山 谷 多 久 了 ？";
};

func int DIA_Lester_MineColony_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lester_Hello))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_MineColony_Info()
{
	AI_Output(other, self, "DIA_Lester_ReturnToColony_15_00"); //你 躲 在 这 座 山 谷 多 久 了 ？
	AI_Output(self, other, "DIA_Lester_ReturnToColony_13_01"); //我 不 确 定 。 也 许 是 一 个 星 期 吧 。 但 还 有 一 件 事 ：
	AI_Output(self, other, "DIA_Lester_ReturnToColony_13_02"); //我 傍 晚 来 的 时 候 ， 往 山 上 看 了 一 眼 - 那 里 只 有 几 棵 树 。
	AI_Output(self, other, "DIA_Lester_ReturnToColony_13_03"); //但 当 我 第 二 天 早 上 再 看 时 ， 就 有 了 那 座 塔 。 我 可 以 发 誓 ， 它 以 前 从 来 没 有 在 那 里 过 。 从 那 时 起 ， 我 就 没 有 离 开 过 这 个 山 谷 。
	AI_Output(other, self, "DIA_Lester_ReturnToColony_15_04"); //你 是 说 艾 克 萨 达 斯 之 塔 ？ 我 知 道 他 很 强 大 ， 但 是 建 造 一 座 那 样 的 塔 … …
	AI_Output(self, other, "DIA_Lester_ReturnToColony_13_05"); //亡 灵 法 师 艾 克 萨 达 斯 ？ 他 住 在 那 座 塔 里 面 ？ 我 不 知 道 我 会 不 会 喜 欢 那 样 … …
	AI_Output(other, self, "DIA_Lester_ReturnToColony_15_06"); //别 担 心 ， 是 他 从 沉 睡 者 的 神 殿 里 面 把 我 救 出 来 的 。 他 是 我 们 这 一 边 的 。
};

///////////////////////////////////////////////////////////////////////
//	Info SEND_XARDAS
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_SEND_XARDAS(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 4;
	condition		= DIA_Lester_SEND_XARDAS_Condition;
	information		= DIA_Lester_SEND_XARDAS_Info;
	description		= "别 担 心 ， 是 他 从 沉 睡 者 的 神 殿 里 面 把 我 救 出 来 的 。 他 是 我 们 这 一 边 的 。";
};

func int DIA_Lester_SEND_XARDAS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lester_WhatHappened)
	&& Npc_KnowsInfo(other, DIA_Lester_MineColony)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_SEND_XARDAS_Info()
{
	AI_Output(other, self, "DIA_Lester_SEND_XARDAS_15_00"); //你 必 须 告 诉 艾 克 萨 达 斯 那 个 影 子 的 事 情 ， 那 会 很 重 要 。
	AI_Output(self, other, "DIA_Lester_SEND_XARDAS_13_01"); //你 不 认 为 那 是 我 的 幻 觉 ？ 你 的 意 思 是 真 的 有 这 么 一 条 … …
	AI_Output(other, self, "DIA_Lester_SEND_XARDAS_15_02"); //… … 龙 。 是 的 。
	AI_Output(self, other, "DIA_Lester_SEND_XARDAS_13_03"); //你 又 到 了 最 紧 张 的 时 候 了 ， 我 说 得 对 吗 ？
	AI_Output(other, self, "DIA_Lester_SEND_XARDAS_15_04"); //我 不 该 说 最 紧 张 的 时 候 … … 还 没 有 。
	AI_Output(self, other, "DIA_Lester_SEND_XARDAS_13_05"); //（ 叹 息 ） 也 好 ， 如 果 这 件 事 这 么 重 要 ， 那 么 我 会 去 见 他 - 但 不 是 现 在 。
	AI_Output(self, other, "DIA_Lester_SEND_XARDAS_13_06"); //现 在 ， 我 要 去 休 息 一 下 。 经 过 这 次 从 罪 犯 流 放 地 的 逃 亡 ， 我 还 是 筋 疲 力 尽 。
	AI_Output(self, other, "DIA_Lester_SEND_XARDAS_13_07"); //我 想 你 已 经 有 一 些 重 大 计 划 了 。 我 会 去 艾 克 萨 达 斯 那 里 见 你 。

	AI_StopProcessInfos(self);

	// wird bei LOLO zu Xardas gebeamt
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_STADT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 1;
	condition		= DIA_Addon_Lester_STADT_Condition;
	information		= DIA_Addon_Lester_STADT_Info;
	description		= "我 要 向 克 霍 里 尼 斯 进 发 ！ 你 知 道 那 座 城 市 的 什 么 信 息 ？";
};

func int DIA_Addon_Lester_STADT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lester_Hello))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_STADT_Info()
{
	AI_Output(other, self, "DIA_Addon_Lester_STADT_15_00"); //我 正 准 备 去 克 霍 里 尼 斯 ！ 关 于 那 个 城 ， 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Lester_STADT_13_01"); //克 霍 里 尼 斯 ？ 嗯 ， 那 是 个 海 港 ， 没 什 么 特 别 的 。
	AI_Output(self, other, "DIA_Addon_Lester_STADT_13_02"); //你 为 什 么 要 问 ？
	AI_Output(other, self, "DIA_Addon_Lester_STADT_15_03"); //我 必 须 去 见 圣 骑 士 ， 据 说 他 们 在 城 里 。
	AI_Output(self, other, "DIA_Addon_Lester_STADT_13_04"); //（ 大 笑 ） 真 的 吗 ？ 哈 。 他 们 甚 至 不 会 让 你 进 城 ， 当 然 也 不 会 让 你 去 圣 骑 士 呆 的 地 方 。
};

///////////////////////////////////////////////////////////////////////
//	Info STADT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_Vorschlag(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 1;
	condition		= DIA_Addon_Lester_Vorschlag_Condition;
	information		= DIA_Addon_Lester_Vorschlag_Info;
	description		= "关 于 如 何 进 城 ， 你 有 什 么 建 议 吗 ？";
};

func int DIA_Addon_Lester_Vorschlag_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lester_STADT))
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_Vorschlag_Info()
{
	AI_Output(other, self, "DIA_Addon_Lester_Vorschlag_15_00"); //关 于 如 何 进 城 ， 你 有 什 么 建 议 吗 ？
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_01"); //我 真 是 这 样 的 。 我 以 前 为 一 个 叫 康 斯 坦 提 诺 的 老 炼 金 术 士 工 作 。
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_02"); //他 在 城 里 很 有 势 力 ， 而 且 他 曾 经 指 示 过 大 门 守 卫 ， 让 所 有 售 卖 珍 稀 草 药 的 人 进 城 。
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_03"); //那 这 就 很 好 办 了 ， 真 的 。 你 收 集 一 大 捆 这 里 到 处 都 有 的 植 物 ， 然 后 假 装 你 是 为 康 斯 坦 提 诺 工 作 的 ， 那 就 能 进 去 了 。
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_04"); //但 不 要 把 这 样 或 那 样 的 植 物 混 在 一 起 。 守 卫 们 不 会 都 那 么 聪 明 ， 他 们 对 炼 金 术 一 点 都 不 懂 。
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_05"); //如 果 你 想 进 去 ， 就 要 使 那 捆 东 西 象 点 样 子 。
	AI_Output(self, other, "DIA_Addon_Lester_Vorschlag_13_06"); //我 觉 得10份 同 样 的 植 物 标 本 就 能 骗 过 他 们 了 。
	AI_Output(other, self, "DIA_Addon_Lester_Vorschlag_15_07"); //谢 谢 你 的 提 醒 。

	Log_CreateTopic(TOPIC_Addon_PickForConstantino, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_PickForConstantino, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_PickForConstantino, TOPIC_Addon_PickForConstantino_1);

	MIS_Addon_Lester_PickForConstantino = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info PASSAGEPLANTSSUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lester_PASSAGEPLANTSSUCCESS(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition;
	information		= DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info;
	description		= "给 康 斯 坦 提 诺 的 植 物 ， 就 像 一 道 符 咒 一 样 灵 。";
};

func int DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Condition()
{
	if (MIS_Addon_Lester_PickForConstantino == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_Info()
{
	AI_Output(other, self, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_15_00"); //给 康 斯 坦 提 诺 送 草 药 这 件 事 就 象 变 魔 法 一 样 有 效 。 它 让 我 通 过 了 城 里 的 守 卫 。
	AI_Output(self, other, "DIA_Addon_Lester_PASSAGEPLANTSSUCCESS_13_01"); //朋 友 ， 就 像 我 说 的 ， 你 偶 尔 该 听 我 一 次 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 		  		Perm
// ************************************************************
instance DIA_Lester_Perm(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 99;
	condition		= DIA_Lester_Perm_Condition;
	information		= DIA_Lester_Perm_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 地 区 你 知 道 什 么 ？";
};

func int DIA_Lester_Perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lester_Hello))
	&& (Kapitel < 3)
	&& (Npc_GetDistToWP(self, "NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Lester_Perm_Info()
{
	AI_Output(other, self, "DIA_Lester_Perm_15_00"); //关 于 这 个 地 区 你 知 道 什 么 ？
	AI_Output(self, other, "DIA_Lester_Perm_13_01"); //如 果 你 继 续 沿 着 那 条 路 走 下 去 ， 就 会 走 到 一 个 农 场 。 这 座 城 市 离 那 里 只 有 一 点 路 程 就 到 了 。
	AI_Output(self, other, "DIA_Lester_Perm_13_02"); //不 过 要 小 心 点 ， 除 了 狼 和 老 鼠 在 这 里 游 荡 以 外 ， 还 有 哥 布 林 和 强 盗 ！
};

// ************************************************************
// 		  		Sleep
// ************************************************************
instance DIA_Lester_Sleep(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 99;
	condition		= DIA_Lester_Sleep_Condition;
	information		= DIA_Lester_Sleep_Info;
	permanent		= TRUE;
	description		= "你 还 觉 得 疲 劳 吗 ？";
};

func int DIA_Lester_Sleep_Condition()
{
	if ((Kapitel < 3)
	&& (Npc_GetDistToWP(self, "NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Lester_Sleep_Info()
{
	AI_Output(other, self, "DIA_Lester_Sleep_15_00"); //你 还 觉 得 疲 劳 吗 ？
	AI_Output(self, other, "DIA_Lester_Sleep_13_01"); //那 还 用 说 。 （ 打 哈 欠 ） 我 把 什 么 事 都 告 诉 艾 克 萨 达 斯 了 。 我 现 在 准 备 去 睡 一 会 儿 。 可 能 ， 一 天 或 者 … …
	AI_Output(self, other, "DIA_Lester_Sleep_13_02"); //… … 两 天 … … 或 者 更 久 。

	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Lester_KAP3_EXIT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= DIA_Lester_KAP3_EXIT_Condition;
	information		= DIA_Lester_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BACKINTOWN
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_BACKINTOWN(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 2;
	condition		= DIA_Lester_BACKINTOWN_Condition;
	information		= DIA_Lester_BACKINTOWN_Info;
	important		= TRUE;
};

func int DIA_Lester_BACKINTOWN_Condition()
{
	if ((Npc_GetDistToWP(self, "LEVELCHANGE") <= 500)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lester_BACKINTOWN_Info()
{
	AI_Output(self, other, "DIA_Lester_BACKINTOWN_13_00"); //嘿 ， 你 终 于 回 来 了 ！ 你 必 须 马 上 去 见 见 艾 克 萨 达 斯 ， 出 问 题 了 。
	AI_Output(other, self, "DIA_Lester_BACKINTOWN_15_01"); //这 个 我 绝 对 相 信 。
	AI_Output(self, other, "DIA_Lester_BACKINTOWN_13_02"); //你 走 之 后 ， 一 切 都 乱 了 套 。
	AI_Output(self, other, "DIA_Lester_BACKINTOWN_13_03"); //去 跟 艾 克 萨 达 斯 谈 谈 ， 他 正 在 等 你 ！
	AI_Output(self, other, "DIA_Lester_BACKINTOWN_13_04"); //艾 克 萨 达 斯 要 我 把 这 个 符 咒 给 你 。 它 会 帮 你 快 点 到 他 那 儿 。 我 们 在 那 里 再 见 。

	CreateInvItems(self, ItRu_TeleportXardas, 1);
	B_GiveInvItems(self, other, ItRu_TeleportXardas, 1);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START"); // Joly: Lester geht wieder zurück in sein Tal!
};

///////////////////////////////////////////////////////////////////////
//	Info perm3
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_PERM3(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 900;
	condition		= DIA_Lester_PERM3_Condition;
	information		= DIA_Lester_PERM3_Info;
	permanent		= TRUE;
	description		= "你 看 起 来 不 象 那 么 热 的 样 子 。";
};

func int DIA_Lester_PERM3_Condition()
{
	if ((Kapitel >= 3)
	&& (Lester_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

var int DIA_Lester_PERM3_OneTime;
func void DIA_Lester_PERM3_Info()
{
	AI_Output(other, self, "DIA_Lester_PERM3_15_00"); //你 看 起 来 不 象 那 么 热 的 样 子 。

	if (hero.guild == GIL_KDF)
	{
		if (DIA_Lester_PERM3_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Lester_PERM3_13_01"); //我 并 不 觉 得 那 么 感 兴 趣 ， 伙 计 。 我 已 经 筋 疲 力 尽 了 ， 而 且 我 的 头 一 直 在 疼 。
			AI_Output(self, other, "DIA_Lester_PERM3_13_02"); //每 次 那 些 黑 袍 人 出 现 后 ， 它 就 变 得 更 糟 糕。

			if (SC_KnowsMadPsi == TRUE)
			{
				AI_Output(other, self, "DIA_Lester_PERM3_15_03"); //那 我 可 以 明 确 地 告 诉 你 这 是 为 什 么 。
				AI_Output(self, other, "DIA_Lester_PERM3_13_04"); //是 吗 ？ 我 不 想 知 道 。
				AI_Output(other, self, "DIA_Lester_PERM3_15_05"); //这 些 穿 黑 袍 子 的 人 - 或 者 以 我 们 魔 法 师 的 说 法 叫 搜 索 者 - 曾 经 追 随 一 个 厉 害 的 大 魔 鬼 。 这 能 让 你 想 起 什 么 吗 ？
				AI_Output(self, other, "DIA_Lester_PERM3_13_06"); //嗯 。 不 。 除 非 你 告 诉 我 … …
				AI_Output(other, self, "DIA_Lester_PERM3_15_07"); //是 的 ， 确 实 。 这 些 搜 索 者 曾 经 是 沉 睡 者 的 追 随 者 。 来 自 沼 泽 营 地 的 叛 教 派 系 的 狂 人 。
				AI_Output(other, self, "DIA_Lester_PERM3_15_08"); //他 们 是 你 的 人 ， 莱 斯 特 。 从 前 的 沉 睡 者 兄 弟 会 。 现 在 他 们 只 不 过 是 没 有 灵 魂 的 邪 恶 的 奴 才 。
				AI_Output(self, other, "DIA_Lester_PERM3_13_09"); //我 有 一 个 想 法 ， 但 我 希 望 那 不 是 真 的 。 你 是 在 说 他 回 来 了 ？ 沉 睡 者 又 来 这 里 了 ？
				AI_Output(other, self, "DIA_Lester_PERM3_15_10"); //问 得 好 。 我 能 肯 定 的 是 我 必 须 在 这 些 搜 索 者 变 得 太 过 强 大 之 前 阻 止 他 们 。
				AI_Output(self, other, "DIA_Lester_PERM3_13_11"); //我 不 喜 欢 这 样 ， 但 我 认 为 你 是 对 的 。 对 不 起 ， 但 是 所 有 这 些 东 西 都 在 困 扰 着 我 的 大 脑 。
				B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_13);
				B_GivePlayerXP(XP_Lester_KnowsMadPsi);
				DIA_Lester_PERM3_OneTime = TRUE;
			};
		};
	}
	else
	{
		if (Lester_IsOnBOard == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Lester_PERM3_13_12"); //我 的 头 痛 还 是 老 样 子 ， 但 这 些 问 题 很 快 就 有 望 得 到 解 决 。
			AI_Output(self, other, "DIA_Lester_PERM3_13_13"); //一 个 方 式 或 者 另 一 个 。
		}
		else if (hero.guild == GIL_DJG)
		{
			AI_Output(self, other, "DIA_Lester_PERM3_13_14"); //我 的 头 疼 得 越 来 越 痛 ， 几 乎 难 以 忍 受 。 而 且 现 在 这 些 蜥 蜴 人 还 经 常 来 攻 击 我 。 我 不 得 不 问 自 己 他 们 是 从 哪 里 来 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_Lester_PERM3_13_15"); //头 痛 就 是 不 会 停 止 。 又 有 某 些 事 情 正 在 酝 酿 之 中 了 。
		};
	};

	AI_Output(self, other, "DIA_Lester_PERM3_13_16"); //（ 叹 息 ） 我 想 我 得 先 休 息 一 下 了 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Lester_KAP4_EXIT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= DIA_Lester_KAP4_EXIT_Condition;
	information		= DIA_Lester_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Lester_KAP5_EXIT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= DIA_Lester_KAP5_EXIT_Condition;
	information		= DIA_Lester_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info XardasWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_XARDASWEG(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 2;
	condition		= DIA_Lester_XARDASWEG_Condition;
	information		= DIA_Lester_XARDASWEG_Info;
	description		= "艾 克 萨 达 斯 在 哪 里 ？";
};

func int DIA_Lester_XARDASWEG_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lester_XARDASWEG_Info()
{
	AI_Output(other, self, "DIA_Lester_XARDASWEG_15_00"); //艾 克 萨 达 斯 在 哪 里 ？
	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_01"); //他 走 了 ， 而 且 他 把 那 些 恶 魔 留 在 了 他 的 塔 里 面 。
	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_02"); //我 想 他 不 希 望 有 人 趁 他 不 在 时 在 他 的 塔 周 围 偷 窥 。
	AI_Output(other, self, "DIA_Lester_XARDASWEG_15_03"); //他 去 哪 里 了 ？
	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_04"); //他 没 有 说 。 他 只 要 我 把 这 封 信 交 给 你 。

	CreateInvItems(self, ItWr_XardasLetterToOpenBook_MIS, 1);
	B_GiveInvItems(self, other, ItWr_XardasLetterToOpenBook_MIS, 1);

	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_05"); //我 看 了 。 对 不 起 。 我 很 好 奇 。
	AI_Output(other, self, "DIA_Lester_XARDASWEG_15_06"); //还 有 吗 ？
	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_07"); //不 知 道 ， 我 一 个 字 都 不 懂 ， 伙 计 。 但 有 一 点 我 很 清 楚 ： 我 们 不 会 很 快 再 见 到 他 。
	AI_Output(self, other, "DIA_Lester_XARDASWEG_13_08"); //我 想 事 情 对 他 来 说 十 万 火 急 ， 他 往 山 上 去 了 。
	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_9);
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_KnowWhereEnemy(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 2;
	condition		= DIA_Lester_KnowWhereEnemy_Condition;
	information		= DIA_Lester_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 发 现 了 敌 人 现 在 的 藏 身 地 。";
};

func int DIA_Lester_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lester_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_15_00"); //我 发 现 了 敌 人 现 在 的 藏 身 地 。
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_13_01"); //不 要 问 我 为 什 么 ， 但 我 感 觉 可 能 我 应 该 跟 你 一 起 走 。
	AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_15_02"); //你 这 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_13_03"); //我 无 法 解 释 ， 但 我 知 道 我 只 有 跟 着 你 才 能 知 道 答 案 。

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_15_04"); //对 不 起 ， 不 过 船 已 经 满 员 了 。
		AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_13_05"); //也 许 是 吧 ， 也 许 我 的 命 运 跟 将 要 发 生 的 事 情 相 比 毫 无 意 义 。
		AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_13_06"); //你 知 道 自 己 该 做 些 什 么 。 坚 持 与 邪 恶 作 斗 争 - 不 要 担 心 我 。
		AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_13_07"); //我 不 重 要 。
	}
	else
	{
		Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy, "我 不 能 带 上 你 。", DIA_Lester_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lester_KnowWhereEnemy, "那 跟 我 来 ， 找 到 你 的 答 案 ！", DIA_Lester_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lester_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_Yes_15_00"); //那 跟 我 来 ， 找 到 你 的 答 案 ！
	AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_Yes_15_01"); //我 会 在 港 口 跟 你 碰 面 。 我 准 备 好 了 就 往 那 里 去 。
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_Yes_13_02"); //快 点 ， 我 们 的 时 间 不 多 。

	self.flags = NPC_FLAG_IMMORTAL;
	Lester_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

func void DIA_Lester_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Lester_KnowWhereEnemy_No_15_00"); //我 不 能 带 上 你 。
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_No_13_01"); //我 明 白 。 我 可 能 不 会 给 你 带 来 多 大 的 帮 助。
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_No_13_02"); //无 论 你 跟 谁 一 起 - 要 确 保 你 能 信 任 他 们 。
	AI_Output(self, other, "DIA_Lester_KnowWhereEnemy_No_13_03"); //那 么 你 好 好 保 重 吧 。

	Lester_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lester_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_LeaveMyShip(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 4;
	condition		= DIA_Lester_LeaveMyShip_Condition;
	information		= DIA_Lester_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "我 没 有 房 间 给 你 用 了 。";
};

func int DIA_Lester_LeaveMyShip_Condition()
{
	if ((Lester_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lester_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Lester_LeaveMyShip_15_00"); //我 没 有 房 间 给 你 用 了 。
	AI_Output(self, other, "DIA_Lester_LeaveMyShip_13_01"); //我 知 道 你 的 意 思 。 我 如 果 处 在 你 的 位 置 上 也 可 能 这 么 做 。
	AI_Output(self, other, "DIA_Lester_LeaveMyShip_13_02"); //如 果 你 需 要 我 的 话 ， 我 将 帮 助 你 。 你 知 道 能 在 哪 里 找 到 我 。

	Lester_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lester_StillNeedYou(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 4;
	condition		= DIA_Lester_StillNeedYou_Condition;
	information		= DIA_Lester_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "我 需 要 一 个 朋 友 来 帮 助 我 。";
};

func int DIA_Lester_StillNeedYou_Condition()
{
	if (((Lester_IsOnBOard == LOG_OBSOLETE) // Hier brauch man natürlich nur eine variable abfragen
	|| (Lester_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lester_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Lester_StillNeedYou_15_00"); //我 需 要 一 个 朋 友 来 帮 助 我 。

	if (Lester_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Lester_StillNeedYou_13_01"); //我 知 道 ！ 我 们 将 一 起 看 着 事 情 发 展 ， 就 象 以 前 那 样 。
		AI_Output(self, other, "DIA_Lester_StillNeedYou_13_02"); //邪 恶 势 力 最 好 小 心 点 。 我 们 正 在 它 的 鼻 子 下 面 活 动 。

		self.flags = NPC_FLAG_IMMORTAL;
		Lester_IsOnBoard = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count + 1);

		if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self, "SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self, "WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Lester_StillNeedYou_13_03"); //我 想 我 最 好 还 是 呆 在 这 里 。 祝 你 好 运 。

		AI_StopProcessInfos(self);
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6 // auf der Dracheninsel ->Neue Instanz!!!
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Lester_KAP6_EXIT(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 999;
	condition		= DIA_Lester_KAP6_EXIT_Condition;
	information		= DIA_Lester_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Lester_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_PC_Psionic_PICKPOCKET(C_INFO)
{
	npc				= PC_Psionic;
	nr				= 900;
	condition		= DIA_PC_Psionic_PICKPOCKET_Condition;
	information		= DIA_PC_Psionic_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_PC_Psionic_PICKPOCKET_Condition()
{
	C_Beklauen(76, 20);
};

func void DIA_PC_Psionic_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET, DIALOG_BACK, DIA_PC_Psionic_PICKPOCKET_BACK);
	Info_AddChoice(DIA_PC_Psionic_PICKPOCKET, DIALOG_PICKPOCKET, DIA_PC_Psionic_PICKPOCKET_DoIt);
};

func void DIA_PC_Psionic_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};

func void DIA_PC_Psionic_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_PC_Psionic_PICKPOCKET);
};
