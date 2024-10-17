///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_EXIT(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 999;
	condition		= DIA_Oric_EXIT_Condition;
	information		= DIA_Oric_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Oric_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_HALLO(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 4;
	condition		= DIA_Oric_HALLO_Condition;
	information		= DIA_Oric_HALLO_Info;
	description		= "你 的 工 作 是 什 么 ？";
};

func int DIA_Oric_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Oric_HALLO_Info()
{
	AI_Output(other, self, "DIA_Oric_HALLO_15_00"); //你 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Oric_HALLO_11_01"); //我 是 国 王 的 战 略 官 员 ， 我 目 前 听 命 于 指 挥 官 加 隆 德 阁 下 。
	AI_Output(self, other, "DIA_Oric_HALLO_11_02"); //我 们 是 这 座 城 堡 里 面 仅 存 的 圣 骑 士 。 其 它 所 有 的 圣 骑 士 都 离 开 或 是 倒 下 了 。
	AI_Output(self, other, "DIA_Oric_HALLO_11_03"); //就 是 现 在 ， 我 们 的 责 任 是 给 这 次 远 征 带 来 一 个 好 的 结 局 ， 并 且 我 们 能 做 到 。 以 英 诺 斯 的 名 义 - 我 们 能 做 到 。
};

///////////////////////////////////////////////////////////////////////
//	Info Bruder
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Bruder(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 4;
	condition		= DIA_Oric_Bruder_Condition;
	information		= DIA_Oric_Bruder_Info;
	description		= "我 有 一 条 消 息 告 诉 你 。";
};

func int DIA_Oric_Bruder_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jergan_Burg)
	&& Npc_KnowsInfo(other, DIA_Oric_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Oric_Bruder_Info()
{
	AI_Output(other, self, "DIA_Oric_Bruder_15_00"); //我 有 一 条 消 息 告 诉 你 。
	AI_Output(self, other, "DIA_Oric_Bruder_11_01"); //那 是 什 么 ？
	AI_Output(other, self, "DIA_Oric_Bruder_15_02"); //你 的 兄 弟 死 了 。 他 已 经 走 到 关 卡 那 里 了 。
	AI_Output(self, other, "DIA_Oric_Bruder_11_03"); //（ 咕 哝 着 ） … … 我 的 兄 弟 … …
	AI_Output(self, other, "DIA_Oric_Bruder_11_04"); //英 诺 斯 给 了 我 一 次 严 格 的 测 试 。 但 他 作 为 他 的 仆 人 死 去 了 … …
	AI_Output(self, other, "DIA_Oric_Bruder_11_05"); //这 个 噩 耗 像 一 支 箭 刺 进 了 我 的 心 脏 。 我 要 在 祈 祷 中 寻 找 新 的 力 量 。
	OricBruder = TRUE;

	B_GivePlayerXP(XP_Ambient);
};

//*****************************************
//	Minen Auftrag
//*****************************************
instance DIA_Oric_ScoutMine(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 1;
	condition		= DIA_Oric_ScoutMine_Condition;
	information		= DIA_Oric_ScoutMine_Info;
	description		= "我 要 去 采 矿 地 点 。";
};

func int DIA_Oric_ScoutMine_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel < 3)
	&& (Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Fajeth_Ore == FALSE)
	&& (Marcos_Ore == FALSE)
	&& (Silvestro_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_ScoutMine_Info()
{
	AI_Output(other, self, "DIA_Oric_ScoutMine_15_00"); //我 要 去 采 矿 地 点 。
	AI_Output(self, other, "DIA_Oric_ScoutMine_11_01"); //这 不 是 儿 戏 ， 小 心 点 。 首 先 ， 找 到 圣 骑 士 。 他 们 率 领 着 三 支 小 队 。
	AI_Output(self, other, "DIA_Oric_ScoutMine_11_02"); //如 果 你 想 了 解 更 多 关 于 这 件 事 情 的 问 题 ， 跟 帕 西 沃 谈 谈 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_Perm(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 99;
	condition		= DIA_Oric_Perm_Condition;
	information		= DIA_Oric_Perm_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Oric_Perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Oric_HALLO))
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Oric_Perm_Info()
{
	AI_Output(other, self, "DIA_Oric_Perm_15_00"); //状 况 怎 么 样 ？

	if (MIS_ScoutMine == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Oric_Perm_11_01"); //你 必 须 找 到 所 有 的 矿 工 ， 外 加 矿 石 。 然 后 我 们 才 能 想 法 子 离 开 这 个 山 谷 。
	}
	else if (MIS_ScoutMine == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Oric_Perm_11_02"); //这 次 远 征 已 经 到 了 底 点 。 但 我 们 不 会 放 弃 ， 因 为 英 诺 斯 与 我 们 同 在 。 他 将 带 领 我 们 安 全 地 离 开 山 谷 。
	}
	else // noch nicht angenommen
	{
		AI_Output(self, other, "DIA_Oric_Perm_11_03"); //你 出 现 在 这 里 对 我 们 来 说 是 希 望 的 好 兆 头 。
		AI_Output(self, other, "DIA_Oric_Perm_11_04"); //我 们 需 要 你 。 去 跟 加 隆 德 谈 谈 - 他 会 跟 你 解 释 一 切 。
	};
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
instance DIA_Oric_KAP3_EXIT(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 999;
	condition		= DIA_Oric_KAP3_EXIT_Condition;
	information		= DIA_Oric_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Oric_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Oric_KAP4_EXIT(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 999;
	condition		= DIA_Oric_KAP4_EXIT_Condition;
	information		= DIA_Oric_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Oric_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*****************************************
//	Kann ich irgendwie helfen?
//*****************************************
instance DIA_Oric_IAmBack(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 4;
	condition		= DIA_Oric_IAmBack_Condition;
	information		= DIA_Oric_IAmBack_Info;
	description		= "我 已 经 回 来 了 。";
};

func int DIA_Oric_IAmBack_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Oric_IAmBack_Info()
{
	AI_Output(other, self, "DIA_Oric_IAmBack_15_00"); //我 已 经 回 来 了 。
	AI_Output(self, other, "DIA_Oric_IAmBack_11_01"); //在 几 天 前 你 在 这 里 制 造 的 那 一 幕 场 景 之 后 ， 我 从 来 没 想 过 会 在 这 里 再 次 见 到 你 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Oric_IAmBack_11_02"); //我 以 我 们 修 道 会 的 名 义 向 你 表 示 欢 迎 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Oric_IAmBack_11_03"); //我 看 你 已 经 成 为 了 一 名 魔 法 师 。 我 向 你 致 敬 。
	};

	AI_Output(self, other, "DIA_Oric_IAmBack_11_04"); //也 许 你 的 出 现 是 个 好 兆 头 。
};

//***********************************************
//	Kann ich helfen?
//***********************************************
instance DIA_Oric_CanHelp(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 4;
	condition		= DIA_Oric_CanHelp_Condition;
	information		= DIA_Oric_CanHelp_Info;
	description		= "我 能 帮 忙 吗 ？";
};

func int DIA_Oric_CanHelp_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_CanHelp_Info()
{
	AI_Output(other, self, "DIA_Oric_CanHelp_15_00"); //我 能 帮 忙 吗 ？
	AI_Output(self, other, "DIA_Oric_CanHelp_11_01"); //现 在 ， 我 们 好 像 已 经 做 了 这 里 能 做 的 一 切 。
	AI_Output(self, other, "DIA_Oric_CanHelp_11_02"); //然 而 ， 这 里 还 有 一 些 事 情 ， 一 些 你 能 去 围 墙 外 面 为 我 们 办 的 非 常 重 要 的 事 情 。
	AI_Output(self, other, "DIA_Oric_CanHelp_11_03"); //我 们 计 划 去 切 断 这 条 毒 蛇 的 头 。

	Info_ClearChoices(DIA_Oric_CanHelp);
	Info_AddChoice(DIA_Oric_CanHelp, "我 想 你 可 以 找 别 的 人 。", DIA_Oric_CanHelp_NotYourMan);
	Info_AddChoice(DIA_Oric_CanHelp, "你 那 是 什 么 意 思 ？", DIA_Oric_CanHelp_WhatYouMean);
};

func void DIA_Oric_CanHelp_NotYourMan()
{
	AI_Output(other, self, "DIA_Oric_CanHelp_NotYourMan_15_00"); //我 想 你 可 以 找 别 的 人 。
	AI_Output(self, other, "DIA_Oric_CanHelp_NotYourMan_11_01"); //我 找 不 出 任 何 人 - 你 是 我 们 唯 一 的 希 望 。
};

func void DIA_Oric_CanHelp_WhatYouMean()
{
	AI_Output(other, self, "DIA_Oric_CanHelp_WhatYouMean_15_00"); //你 那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_01"); //我 们 知 道 他 们 的 一 个 首 领 。 他 叫 霍 什 帕 克 。
	AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_02"); //他 是 兽 人 中 最 有 势 力 的 萨 满 之 一 。
	AI_Output(other, self, "DIA_Oric_CanHelp_WhatYouMean_15_03"); //那 我 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_04"); //杀 了 他 。
	AI_Output(other, self, "DIA_Oric_CanHelp_WhatYouMean_15_05"); //那 是 在 开 玩 笑 ！ ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_06"); //你 是 我 们 唯 一 能 用 得 上 的 人 。 这 里 需 要 其 它 所 有 那 些 骑 士 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_07"); //我 向 你 提 出 这 个 请 求 是 迫 不 得 已 ， 大 师 。 但 是 你 是 完 成 这 个 任 务 的 最 好 人 选 。
	}
	else
	{
		AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_08"); //你 想 要 帮 助 我 们 ， 是 吗 ？ 好 吧 ， 那 么 。
	};

	AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_09"); //霍 什 帕 克 的 帐 篷 就 在 包 围 圈 外 面 ， 位 于 从 这 里 往 南 的 一 座 悬 崖 上 。
	AI_Output(self, other, "DIA_Oric_CanHelp_WhatYouMean_11_10"); //你 从 那 里 的 一 扇 窗 户 里 几 乎 可 以 看 到 它 。

	Info_ClearChoices(DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};

//***********************************************
//	Ich brauche noch Ausrüstung.
//***********************************************
instance DIA_Oric_NeedStuff(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 6;
	condition		= DIA_Oric_NeedStuff_Condition;
	information		= DIA_Oric_NeedStuff_Info;
	description		= "我 还 需 要 一 些 装 备 。";
};

func int DIA_Oric_NeedStuff_Condition()
{
	if ((OrikToldMissionChapter4 == TRUE)
	&& (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NeedStuff_Info()
{
	AI_Output(other, self, "DIA_Oric_NeedStuff_15_00"); //我 还 需 要 一 些 装 备 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_11_01"); //我 们 已 经 没 有 剩 下 什 么 东 西 可 以 给 你 了 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_11_02"); //好 吧 ， 我 能 给 你 这 个 。

	Info_ClearChoices(DIA_Oric_NeedStuff);
	Info_AddChoice(DIA_Oric_NeedStuff, "或 者 １ 个 敏 捷 炼 金 药", DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice(DIA_Oric_NeedStuff, "或 者 １ 个 力 量 炼 金 药", DIA_Oric_NeedStuff_Strength);
	Info_AddChoice(DIA_Oric_NeedStuff, "或 者 ３ 个 魔 力 药 剂", DIA_Oric_NeedStuff_Mana);
	Info_AddChoice(DIA_Oric_NeedStuff, "３ 治 疗 之 炼 金 药", DIA_Oric_NeedStuff_Health);
};

func void DIA_Oric_NeedStuff_Health()
{
	AI_Output(other, self, "DIA_Oric_NeedStuff_Health_15_00"); //我 要 治 疗 药 剂 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_Health_11_01"); //不 错 的 选 择 。 希 望 它 能 帮 助 你 。

	CreateInvItems(self, ItPo_Health_03, 3);
	B_GiveInvItems(self, other, ItPo_Health_03, 3);

	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Mana()
{
	AI_Output(other, self, "DIA_Oric_NeedStuff_Mana_15_00"); //我 想 要 魔 法 药 剂 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_Mana_11_01"); //我 希 望 你 能 用 到 它 们 。 愿 英 诺 斯 庇 佑 你 。

	CreateInvItems(self, ItPo_Mana_03, 3);
	B_GiveInvItems(self, other, ItPo_Health_03, 3);

	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Strength()
{
	AI_Output(other, self, "DIA_Oric_NeedStuff_Strength_15_00"); //我 想 要 力 量 炼 金 药 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_Strength_11_01"); //给 ， 这 个 肯 定 有 用 。 我 祝 你 好 运 。

	CreateInvItems(self, ItPo_Perm_STR, 1);
	B_GiveInvItems(self, other, ItPo_Perm_STR, 1);

	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Dexterity()
{
	AI_Output(other, self, "DIA_Oric_NeedStuff_Dexterity_15_00"); //我 想 要 敏 捷 炼 金 药 。
	AI_Output(self, other, "DIA_Oric_NeedStuff_Dexterity_11_01"); //愿 你 的 箭 百 发 百 中 。 给 你 。

	CreateInvItems(self, ItPo_Perm_DEX, 1);
	B_GiveInvItems(self, other, ItPo_Perm_DEX, 1);

	Info_ClearChoices(DIA_Oric_NeedStuff);
};

//***********************************************
//	ich werde keinen feigen Mord begehen.
//***********************************************
instance DIA_Oric_NoMurder(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 7;
	condition		= DIA_Oric_NoMurder_Condition;
	information		= DIA_Oric_NoMurder_Info;
	description		= "我 不 会 用 那 样 卑 鄙 的 手 段 谋 杀 霍 什 帕 克 。";
};

func int DIA_Oric_NoMurder_Condition()
{
	if ((OrikToldMissionChapter4 == TRUE)
	&& (MIS_KillHoshPak == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Oric_NoMurder_Info()
{
	AI_Output(other, self, "DIA_Oric_NoMurder_15_00"); //我 不 会 用 那 样 卑 鄙 的 手 段 谋 杀 霍 什 帕 克 。
	AI_Output(self, other, "DIA_Oric_NoMurder_11_01"); //你 能 想 象 出 我 们 的 处 境 有 多 么 危 及 吗 ？
	AI_Output(self, other, "DIA_Oric_NoMurder_11_02"); //我 们 被 一 支 兽 人 的 高 级 部 队 包 围 了 。 我 们 的 储 备 已 经 快 耗 尽 了 。
	AI_Output(self, other, "DIA_Oric_NoMurder_11_03"); //如 果 我 们 不 能 成 功 地 把 矿 石 装 上 船 ， 这 些 兽 人 将 会 毁 掉 我 们 的 整 个 王 国 。
	AI_Output(self, other, "DIA_Oric_NoMurder_11_04"); //我 们 代 表 的 一 切 都 将 被 遗 忘 。
};

//***********************************************
//	Ich werde dir helfen
//***********************************************
instance DIA_Oric_WillHelp(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 5;
	condition		= DIA_Oric_WillHelp_Condition;
	information		= DIA_Oric_WillHelp_Info;
	description		= "好 吧 。 我 会 杀 死 霍 什 帕 克 。";
};

func int DIA_Oric_WillHelp_Condition()
{
	if ((OrikToldMissionChapter4 == TRUE)
	&& MIS_KillHoshPak == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Oric_WillHelp_Info()
{
	AI_Output(other, self, "DIA_Oric_WillHelp_15_00"); //好 吧 。 我 会 杀 死 霍 什 帕 克 。
	AI_Output(self, other, "DIA_Oric_WillHelp_11_01"); //我 很 高 兴 听 到 这 些 。
	AI_Output(self, other, "DIA_Oric_WillHelp_11_02"); //霍 什 帕 克 的 帐 篷 在 一 座 小 悬 崖 上 。 你 以 前 肯 定 见 过 它 。
	AI_Output(self, other, "DIA_Oric_WillHelp_11_03"); //它 离 通 往 我 们 的 矿 井 的 小 路 不 远 ， 就 被 那 座 大 山 笼 罩 着 。

	Log_CreateTopic(TOPIC_KillHoshPak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak, LOG_RUNNING);
	B_LogEntry(TOPIC_KillHoshPak, TOPIC_KillHoshPak_1);

	MIS_KillHoshPak = LOG_RUNNING;
};

//***********************************************
//	Hosh-Pak ist tot!
//***********************************************
instance DIA_Oric_HoshDead(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 8;
	condition		= DIA_Oric_HoshDead_Condition;
	information		= DIA_Oric_HoshDead_Info;
	description		= "霍 什 帕 克 死 了 ！";
};

func int DIA_Oric_HoshDead_Condition()
{
	if ((Npc_IsDead(Hosh_Pak))
	&& (MIS_KillHoshPak == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Oric_HoshDead_Info()
{
	AI_Output(other, self, "DIA_Oric_HoshDead_15_00"); //霍 什 帕 克 死 了 ！
	AI_Output(self, other, "DIA_Oric_HoshDead_11_01"); //太 棒 了 ， 这 次 肯 定 能 扰 乱 那 些 兽 人 。 不 管 怎 样 ， 也 许 我 们 真 的 还 有 机 会 。
	AI_Output(self, other, "DIA_Oric_HoshDead_11_02"); //我 想 这 至 少 能 给 我 们 带 来 一 个 星 期 的 缓 冲 时 间 。

	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillHosh_Pak);
};

//***********************************************
//	Irgendwelche Neuigkeiten?
//***********************************************
instance DIA_Oric_AnyNews(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 9;
	condition		= DIA_Oric_AnyNews_Condition;
	information		= DIA_Oric_AnyNews_Info;
	permanent		= TRUE;
	description		= "有 新 消 息 吗 ？";
};

func int DIA_Oric_AnyNews_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack)))
	{
		return TRUE;
	};
};

func void DIA_Oric_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Oric_AnyNews_15_00"); //有 新 消 息 吗 ？

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Oric_AnyNews_11_01"); //你 是 说 ， 除 了 兽 人 已 经 开 始 侵 袭 我 们 这 件 事 之 外 。
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Oric_AnyNews_11_02"); //是 的 。 你 是 我 们 的 英 雄 。 这 么 快 地 干 掉 所 有 的 龙 可 不 是 一 般 的 壮 举 ， 我 该 这 么 说 。
	}
	else if (MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Oric_AnyNews_11_03"); //看 来 只 要 霍 什 帕 克 一 死 ， 兽 人 就 会 全 体 大 乱 。
	}
	else
	{
		AI_Output(self, other, "DIA_Oric_AnyNews_11_04"); //这 些 兽 人 的 数 量 越 来 越 庞 大 。 这 可 不 妙 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Oric_DragonPlettBericht(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 3;
	condition		= DIA_Oric_DragonPlettBericht_Condition;
	information		= DIA_Oric_DragonPlettBericht_Info;
	permanent		= TRUE;
	description		= "我 需 要 更 多 关 于 龙 的 信 息 。";
};

func int DIA_Oric_DragonPlettBericht_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Oric_IAmBack))
	&& (MIS_AllDragonsDead == FALSE))
	{
		return TRUE;
	};
};

var int Oric_SwampdragonInfo_OneTime;
var int Oric_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Oric_DragonCounter;
var int Oric_FirstQuestion;
func void DIA_Oric_DragonPlettBericht_Info()
{
	AI_Output(other, self, "DIA_Oric_DragonPlettBericht_15_00"); //我 需 要 更 多 关 于 龙 的 信 息 。

	if (MIS_KilledDragons == 1)
	{
		AI_Output(other, self, "DIA_Oric_DragonPlettBericht_15_01"); //我 已 经 杀 了 它 们 其 中 一 个 。 你 能 告 诉 我 要 去 哪 里 找 其 它 的 吗 ？
	}
	else if (MIS_KilledDragons != 0)
	{
		AI_Output(other, self, "DIA_Oric_DragonPlettBericht_15_02"); //我 有 一 种 感 觉 ， 我 觉 得 还 没 有 杀 完 所 有 的 龙 。 也 许 我 遗 漏 了 某 些 事 情 ？
	};

	if (((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE))
	&& ((Oric_SwampdragonInfo_OneTime == FALSE)
	|| (Oric_RockdragonInfo_OneTime == FALSE)
	|| (Oric_FiredragonInfo_OneTime == FALSE)
	|| (Oric_IcedragonInfo_OneTime == FALSE)))
	{
		if (((Npc_IsDead(Swampdragon)) == FALSE)
		&& (Oric_SwampdragonInfo_OneTime == FALSE))
		{
			AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_03"); //最 近 两 天 ， 在 古 城 堡 的 西 边 出 现 了 一 片 非 常 大 的 沼 泽 地 。 这 非 常 可 疑 ， 你 认 为 是 这 样 吗 ？
			B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_5);
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if (((Npc_IsDead(Rockdragon)) == FALSE)
		&& (Oric_RockdragonInfo_OneTime == FALSE))
		{
			AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_04"); //南 边 有 一 座 岩 石 堡 垒 ， 在 火 山 后 面 的 远 处 。
			AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_05"); //我 们 的 侦 察 兵 报 告 说 那 个 堡 垒 有 重 兵 防 守 。 也 许 它 们 之 中 的 某 一 个 就 藏 在 那 里 。
			B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_6);
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if (((Npc_IsDead(FireDragon)) == FALSE)
		&& (Oric_FiredragonInfo_OneTime == FALSE))
		{
			AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_06"); //据 说 ， 在 龙 最 后 一 次 袭 击 之 后 ， 它 们 之 中 有 一 个 消 失 在 南 边 的 火 山 里 了 。 你 该 去 那 里 找 找 看 。
			B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_7);
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if (((Npc_IsDead(IceDragon)) == FALSE)
		&& (Oric_IcedragonInfo_OneTime == FALSE))
		{
			AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_07"); //西 边 有 一 片 广 阔 的 冰 原 。 如 果 有 一 条 龙 藏 在 那 里 ， 我 不 会 觉 得 太 意 外 。
			B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_8);
			Oric_IcedragonInfo_OneTime = TRUE;
		};

		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Oric_DragonPlettBericht_11_08"); //此 时 ， 唉 ， 我 已 经 没 有 任 何 东 西 可 以 告 诉 你 了 。
	};
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
instance DIA_Oric_KAP5_EXIT(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 999;
	condition		= DIA_Oric_KAP5_EXIT_Condition;
	information		= DIA_Oric_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Oric_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Oric_KAP6_EXIT(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 999;
	condition		= DIA_Oric_KAP6_EXIT_Condition;
	information		= DIA_Oric_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Oric_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Oric_PICKPOCKET(C_INFO)
{
	npc				= PAL_251_Oric;
	nr				= 900;
	condition		= DIA_Oric_PICKPOCKET_Condition;
	information		= DIA_Oric_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 他 的 魔 法 卷 轴 非 常 困 难 ）";
};

func int DIA_Oric_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (85 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Oric_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Oric_PICKPOCKET);
	Info_AddChoice(DIA_Oric_PICKPOCKET, DIALOG_BACK, DIA_Oric_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Oric_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Oric_PICKPOCKET_DoIt);
};

func void DIA_Oric_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 85)
	{
		B_GiveInvItems(self, other, ITSc_PalRepelEvil, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Oric_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Oric_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Oric_PICKPOCKET);
};
