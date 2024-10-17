// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_GornDJG_EXIT(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 999;
	condition		= DIA_GornDJG_EXIT_Condition;
	information		= DIA_GornDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_STARTCAMP(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_STARTCAMP_Condition;
	information		= DIA_GornDJG_STARTCAMP_Info;
	description		= "我 知 道 你 已 经 加 入 了 龙 猎 手 。";
};

func int DIA_GornDJG_STARTCAMP_Condition()
{
	if (Npc_GetDistToWP(self, "OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_STARTCAMP_Info()
{
	AI_Output(other, self, "DIA_GornDJG_STARTCAMP_15_00"); //我 知 道 你 已 经 加 入 了 龙 猎 手 。
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_12_01"); //我 跟 着 席 尔 维 欧 进 入 了 矿 藏 山 谷 ， 因 为 我 最 熟 悉 这 周 围 的 路 ， 而 且 希 望 能 对 形 式 有 个 清 晰 的 认 识 。
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_12_02"); //我 可 以 这 么 说 。 这 里 肯 定 会 有 什 么 事 情 即 将 发 生 。 我 一 生 中 从 没 见 过 这 么 多 的 兽 人 聚 集 在 同 一 个 地 方 。
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_12_03"); //如 果 现 在 加 隆 德 和 城 堡 里 的 圣 骑 士 都 已 经 逃 跑 或 者 是 被 杀 了 ， 我 也 不 会 感 到 太 意 外 。

	Info_AddChoice(DIA_GornDJG_STARTCAMP, "再 见 。", DIA_GornDJG_STARTCAMP_By);
	Info_AddChoice(DIA_GornDJG_STARTCAMP, "你 现 在 打 算 做 什 么 ？", DIA_GornDJG_STARTCAMP_Wohin);
};

func void DIA_GornDJG_STARTCAMP_Wohin()
{
	AI_Output(other, self, "DIA_GornDJG_STARTCAMP_Wohin_15_00"); //你 现 在 的 计 划 是 什 么 ？
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_01"); //我 得 先 跟 这 里 的 小 伙 子 们 去 一 趟 矿 藏 山 谷 ， 然 后 迟 些 再 离 开 。
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_Wohin_12_02"); //我 确 实 需 要 弄 清 那 些 兽 人 正 在 谋 划 什 么 事 情 。
};

func void DIA_GornDJG_STARTCAMP_By()
{
	AI_Output(other, self, "DIA_GornDJG_STARTCAMP_By_15_00"); //再 见 。
	AI_Output(self, other, "DIA_GornDJG_STARTCAMP_By_12_01"); //你 自 己 小 心 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HALLO(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_HALLO_Condition;
	information		= DIA_GornDJG_HALLO_Info;
	description		= "那 你 就 躲 在 这 里 ！";
};

func int DIA_GornDJG_HALLO_Condition()
{
	if (Npc_GetDistToWP(self, "OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HALLO_Info()
{
	AI_Output(other, self, "DIA_GornDJG_HALLO_15_00"); //那 么 这 里 就 是 你 的 藏 身 之 处 ！
	AI_Output(self, other, "DIA_GornDJG_HALLO_12_01"); //你 不 会 那 么 容 易 就 死 的 ， 是 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info WhatsUp
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATSUP(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_WHATSUP_Condition;
	information		= DIA_GornDJG_WHATSUP_Info;
	description		= "你 已 经 抓 到 什 么 了 吗 ？";
};

func int DIA_GornDJG_WHATSUP_Condition()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATSUP_Info()
{
	AI_Output(other, self, "DIA_GornDJG_WHATSUP_15_00"); //你 已 经 抓 到 什 么 了 吗 ？
	AI_Output(self, other, "DIA_GornDJG_WHATSUP_12_01"); //我 还 在 等 。 我 想 在 上 面 那 堆 古 老 的 岩 石 废 墟 中 一 定 有 什 么 东 西 。 晚 上 的 时 候 那 里 会 发 出 亮 光 ， 而 且 我 能 听 到 尖 叫 声 。

	Info_ClearChoices(DIA_GornDJG_WHATSUP);
	Info_AddChoice(DIA_GornDJG_WHATSUP, "也 许 是 莱 斯 特 ？", DIA_GornDJG_WHATSUP_Lester);
	Info_AddChoice(DIA_GornDJG_WHATSUP, "一 条 龙 吗 ？", DIA_GornDJG_WHATSUP_A_Dragon);

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_8);
};

func void DIA_GornDJG_WHATSUP_Lester()
{
	AI_Output(other, self, "DIA_GornDJG_WHATSUP_Lester_15_00"); //也 许 那 是 莱 斯 特 回 到 了 岩 石 上 的 古 老 废 墟 中 ？
	AI_Output(self, other, "DIA_GornDJG_WHATSUP_Lester_12_01"); //不 可 能 。 据 我 所 知 ， 莱 斯 特 已 经 不 住 在 那 上 面 了 。!
};

func void DIA_GornDJG_WHATSUP_A_Dragon()
{
	AI_Output(other, self, "DIA_GornDJG_WHATSUP_A_Dragon_15_00"); //一 条 龙 吗 ？
	AI_Output(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_01"); //非 常 有 可 能 。 那 里 的 高 地 守 卫 森 严 ， 就 像 是 国 王 巨 大 的 宝 库 一 样 。 唉 ， 那 是 通 往 堡 垒 的 唯 一 途 径 。
	AI_Output(self, other, "DIA_GornDJG_WHATSUP_A_Dragon_12_02"); //好 象 龙 还 不 是 那 么 坏 ， 它 们 看 起 来 是 受 另 外 一 些 怪 物 控 制 的 。

	GornDJG_WhatMonsters = TRUE;

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_9);

	Info_ClearChoices(DIA_GornDJG_WHATSUP);
};

///////////////////////////////////////////////////////////////////////
//	Info WhatMonsters
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WHATMONSTERS(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_WHATMONSTERS_Condition;
	information		= DIA_GornDJG_WHATMONSTERS_Info;
	description		= "那 些 会 是 什 么 样 的 怪 物 ？";
};

func int DIA_GornDJG_WHATMONSTERS_Condition()
{
	if (GornDJG_WhatMonsters == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATMONSTERS_Info()
{
	AI_Output(other, self, "DIA_GornDJG_WHATMONSTERS_15_00"); //那 些 会 是 什 么 样 的 怪 物 ？
	AI_Output(self, other, "DIA_GornDJG_WHATMONSTERS_12_01"); //我 还 不 能 完 全 把 它 们 描 述 清 楚 ， 但 它 们 是 直 立 行 走 ， 并 且 它 们 的 的 皮 肤 覆 盖 着 鳞 片 。 它 们 在 岩 石 上 行 动 ， 发 出 的 声 音 就 像 暴 龙 嗅 到 猎 物 的 气 味 一 样 。
	AI_Output(self, other, "DIA_GornDJG_WHATMONSTERS_12_02"); //我 在 这 下 面 能 清 楚 的 听 到 它 们 用 鼻 子 吸 气 喷 气 的 声 音 。 我 想 它 们 已 经 控 制 了 那 上 面 的 整 个 旷 野 。
};

///////////////////////////////////////////////////////////////////////
//	Info WahtAboutOrcs
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_WAHTABOUTORCS(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_WAHTABOUTORCS_Condition;
	information		= DIA_GornDJG_WAHTABOUTORCS_Info;
	description		= "那 兽 人 呢 ？";
};

func int DIA_GornDJG_WAHTABOUTORCS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info()
{
	AI_Output(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_00"); //那 兽 人 呢 ？
	AI_Output(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_01"); //我 已 经 注 意 它 们 很 长 一 段 时 间 了 。 它 们 在 这 下 面 设 置 的 路 障 一 定 是 为 了 隐 藏 某 些 东 西 。 我 怀 疑 它 们 已 经 成 群 结 队 地 聚 集 到 那 后 面 了 。
	AI_Output(other, self, "DIA_GornDJG_WAHTABOUTORCS_15_02"); //你 是 说 ， 比 现 在 这 里 的 还 要 多 ？
	AI_Output(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_03"); //如 果 哪 天 晚 上 它 们 放 倒 栅 栏 ， 象 洪 水 一 样 地 席 卷 了 这 片 土 地 的 话 ， 我 不 会 感 到 太 突 然 。 我 对 此 有 一 种 很 不 好 的 预 感 。
	AI_Output(self, other, "DIA_GornDJG_WAHTABOUTORCS_12_04"); //如 果 真 是 这 样 的 话 ， 我 将 不 得 不 回 去 警 告 李 。 他 也 希 望 离 开 这 座 岛 屿 。 到 那 个 时 候 ， 应 该 正 是 时 候 。!
};

///////////////////////////////////////////////////////////////////////
//	Info HelpKillDraconians
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information		= DIA_GornDJG_HELPKILLDRACONIANS_Info;
	description		= "你 能 帮 我 进 入 堡 垒 吗 ？";
};

func int DIA_GornDJG_HELPKILLDRACONIANS_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_GornDJG_WHATMONSTERS))
	&& (Npc_KnowsInfo(other, DIA_GornDJG_WAHTABOUTORCS))
	&& ((Npc_IsDead(RockDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info()
{
	AI_Output(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_00"); //你 能 帮 我 进 入 堡 垒 吗 ？
	AI_Output(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_01"); //我 不 确 定 。 我 担 心 就 在 我 一 转 身 的 时 候 ， 兽 人 就 会 发 起 进 攻 。
	AI_Output(other, self, "DIA_GornDJG_HELPKILLDRACONIANS_15_02"); //这 真 是 在 妄 想 ！
	AI_Output(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_03"); //没 有 帮 助 。 如 果 我 来 得 太 晚 的 话 ， 我 将 永 远 不 会 原 谅 自 己 ， 你 明 白 吗 ？ 另 一 方 面 … …
	AI_Output(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_04"); //无 论 如 何 ！ 为 什 么 我 不 在 这 里 干 点 别 的 ？ 让 我 们 冲 进 那 片 旷 野 冲 开 一 条 去 堡 垒 的 出 路 。
	AI_Output(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_05"); //做 一 点 练 习 不 会 有 什 么 坏 处 。 况 且 ， 我 想 到 近 处 去 看 看 上 面 那 些 畜 生 。
	AI_Output(self, other, "DIA_GornDJG_HELPKILLDRACONIANS_12_06"); //你 准 备 好 了 就 告 诉 我 ！

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_10);
};

///////////////////////////////////////////////////////////////////////
//	Info LosGeht´s
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_LOSGEHTS(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_LOSGEHTS_Condition;
	information		= DIA_GornDJG_LOSGEHTS_Info;
	description		= "我 们 开 始 攻 击 ！";
};

func int DIA_GornDJG_LOSGEHTS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_GornDJG_HELPKILLDRACONIANS))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_LOSGEHTS_Info()
{
	AI_Output(other, self, "DIA_GornDJG_LOSGEHTS_15_00"); //我 们 开 始 攻 击 ！
	AI_Output(self, other, "DIA_GornDJG_LOSGEHTS_12_01"); //就 象 以 前 那 样 ， 是 吗 ？ 但 我 告 诉 你 一 些 事 情 ： 这 是 我 的 战 斗 。 这 一 次 我 要 在 前 面 ！

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "RunToRockRuinBridge");
};

///////////////////////////////////////////////////////////////////////
//	Info BisHierhin
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_BISHIERHIN(C_INFO)
{
	npc				= PC_Fighter_DJG;
	condition		= DIA_GornDJG_BISHIERHIN_Condition;
	information		= DIA_GornDJG_BISHIERHIN_Info;
	important		= TRUE;
};

func int DIA_GornDJG_BISHIERHIN_Condition()
{
	if (Npc_GetDistToWP(self, "LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_BISHIERHIN_Info()
{
	AI_Output(self, other, "DIA_GornDJG_BISHIERHIN_12_00"); //那 如 同 儿 戏 。 好 吧 ， 我 的 朋 友 ， 你 还 得 对 付 剩 下 的 那 些 。 给 它 们 点 苦 头 吃 ！ 我 会 回 去 密 切 提 防 兽 人 。
	AI_Output(other, self, "DIA_GornDJG_BISHIERHIN_15_01"); //没 问 题 。 回 头 见 ！
	AI_Output(self, other, "DIA_GornDJG_BISHIERHIN_12_02"); //我 希 望 如 此 ！

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_11);

	B_GivePlayerXP(XP_GornDJGPlateauClear);

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info DragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_GornDJG_DRAGONDEAD(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 0;
	condition		= DIA_GornDJG_DRAGONDEAD_Condition;
	information		= DIA_GornDJG_DRAGONDEAD_Info;
	description		= "岩 龙 已 经 死 了 ！";
};

func int DIA_GornDJG_DRAGONDEAD_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_GornDJG_WHATSUP))
	&& (Npc_GetDistToWP(self, "OW_DJG_ROCKCAMP_01") < 1000)
	&& ((Npc_IsDead(RockDragon)) == TRUE)
	)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_DRAGONDEAD_Info()
{
	AI_Output(other, self, "DIA_GornDJG_DRAGONDEAD_15_00"); //岩 龙 已 经 死 了 ！
	AI_Output(self, other, "DIA_GornDJG_DRAGONDEAD_12_01"); //我 再 也 没 有 听 到 尖 叫 声 了 ！ 你 去 过 那 上 面 的 岩 石 堡 垒 了 吗 ？
	AI_Output(other, self, "DIA_GornDJG_DRAGONDEAD_15_02"); //是的！
	AI_Output(self, other, "DIA_GornDJG_DRAGONDEAD_12_03"); //哈 哈 ！ 果 然 不 出 我 的 预 料 。 无 论 你 在 哪 里 出 现 ， 哪 里 就 没 有 一 块 石 头 能 立 住 。
	AI_Output(other, self, "DIA_GornDJG_DRAGONDEAD_15_04"); //你 现 在 想 要 做 什 么 ？
	AI_Output(self, other, "DIA_GornDJG_DRAGONDEAD_12_05"); //我 会 逗 留 一 阵 子 然 后 回 到 李 那 里 去 。 也 许 我 们 还 能 在 那 里 见 面 ！
	AI_Output(self, other, "DIA_GornDJG_DRAGONDEAD_12_06"); //我 渐 渐 厌 倦 了 这 个 鬼 地 方 。 现 在 是 时 候 终 于 该 要 离 开 这 里 了 。
	AI_Output(other, self, "DIA_GornDJG_DRAGONDEAD_15_07"); //再 见 ！
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fighter_DJG_PICKPOCKET(C_INFO)
{
	npc				= PC_Fighter_DJG;
	nr				= 900;
	condition		= DIA_Fighter_DJG_PICKPOCKET_Condition;
	information		= DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	C_Beklauen(10, 35);
};

func void DIA_Fighter_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET, DIALOG_BACK, DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};
