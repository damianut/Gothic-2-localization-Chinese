///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_EXIT(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 999;
	condition		= DIA_Addon_Elvrich_EXIT_Condition;
	information		= DIA_Addon_Elvrich_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Elvrich_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Elvrich_PICKPOCKET(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 900;
	condition		= DIA_Addon_Elvrich_PICKPOCKET_Condition;
	information		= DIA_Addon_Elvrich_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Elvrich_PICKPOCKET_Condition()
{
	C_Beklauen(62, 110);
};

func void DIA_Addon_Elvrich_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_BACK, DIA_Addon_Elvrich_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Elvrich_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Elvrich_PICKPOCKET_DoIt);
};

func void DIA_Addon_Elvrich_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

func void DIA_Addon_Elvrich_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Elvrich_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info BanditsThere
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_BanditsThere(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_BanditsThere_Condition;
	information		= DIA_Addon_Elvrich_BanditsThere_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Addon_Elvrich_BanditsThere_NoPerm;
func int DIA_Addon_Elvrich_BanditsThere_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (DIA_Addon_Elvrich_BanditsThere_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_BanditsThere_Info()
{
	if ((Npc_IsDead(BDT_10307_Addon_RangerBandit_M))
	&& (Npc_IsDead(BDT_10308_Addon_RangerBandit_L))
	&& (Npc_IsDead(BDT_10309_Addon_RangerBandit_L))
	&& (Npc_IsDead(BDT_10310_Addon_RangerBandit_M)))
	{
		AI_Output(self, other, "DIA_Addon_Elvrich_BanditsThere_04_00"); //谢 天 谢 地 ， 强 盗 被 干 掉 了 。 你 救 了 我 的 命 。
		DIA_Addon_Elvrich_BanditsThere_NoPerm = TRUE;
		self.aivar[AIV_NoFightParker] = FALSE;
	}
	else
	{
		B_Say(self, other, "$NOTNOW");
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Wer(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_Wer_Condition;
	information		= DIA_Addon_Elvrich_Wer_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Addon_Elvrich_Wer_Condition()
{
	return TRUE;
};

func void DIA_Addon_Elvrich_Wer_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_Wer_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_Wer_04_01"); //我 的 名 字 叫 艾 尔 弗 里 奇 。 我 从 镇 上 来 。
	if (MIS_Thorben_BringElvrichBack == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_Addon_Elvrich_Wer_15_02"); //大 师 托 尔 本 告 诉 我 你 已 经 失 踪 了 。
	};

	AI_Output(self, other, "DIA_Addon_Elvrich_Wer_04_03"); //那 些 可 恶 的 坏 蛋 把 我 拉 到 这 里 ， 然 后 把 我 囚 禁 起 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_MissingPeople(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_MissingPeople_Condition;
	information		= DIA_Addon_Elvrich_MissingPeople_Info;
	description		= "镇 上 有 很 多 人 失 踪 了 。";
};

func int DIA_Addon_Elvrich_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Elvrich_Wer))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_MissingPeople_15_00"); //镇 上 有 很 多 人 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Elvrich_MissingPeople_04_01"); //我 不 知 道 任 何 关 于 那 些 失 踪 市 民 的 情 况 。 我 只 能 告 诉 你 发 生 在 我 身 上 的 事 。
};

///////////////////////////////////////////////////////////////////////
//	Info WhatExactly
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhatExactly(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_WhatExactly_Condition;
	information		= DIA_Addon_Elvrich_WhatExactly_Info;
	description		= "你 究 竟 发 生 了 什 么 事 ？";
};

func int DIA_Addon_Elvrich_WhatExactly_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Elvrich_Wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhatExactly_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_15_00"); //你 究 竟 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_04_01"); //我 正 要 去 和 我 女 朋 友 事 先 定 好 的 地 点 约 会 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_04_02"); //她 的 名 字 叫 露 西 亚 。 我 们 打 算 逃 到 山 上 。 远 离 镇 上 所 有 住 在 那 里 的 人 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_04_03"); //我 刚 刚 到 达 约 会 地 点 ， 突 然 ， 这 些 强 盗 从 灌 木 丛 里 跳 出 来 ， 并 把 我 们 两 个 都 抓 住 了 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_04_04"); //我 奋 勇 抵 抗 ， 当 然 没 有 一 点 用 处 。 他 们 人 太 多 了 。 你 没 有 看 到 他 们 ？

	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, "强 盗 们 要 从 你 身 上 得 到 什 么 ？", DIA_Addon_Elvrich_WhatExactly_Want);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, "跟 我 说 说 露 西 亚 。", DIA_Addon_Elvrich_WhatExactly_lucia);
};

func void DIA_Addon_Elvrich_WhatExactly_Want()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_Want_15_00"); //强 盗 们 要 从 你 身 上 得 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Want_04_01"); //在 夜 里 ， 我 有 时 候 能 偷 听 到 他 们 的 谈 话 。 我 无 法 全 部 听 清 ， 但 是 我 想 他 们 想 让 我 们 做 奴 隶 。

	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, "他 们 要 把 你 带 到 哪 里 ？", DIA_Addon_Elvrich_WhatExactly_Pirates);
};

func void DIA_Addon_Elvrich_WhatExactly_Pirates()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_Pirates_15_00"); //他 们 要 把 你 带 到 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_01"); //去 这 里 的 某 个 地 方 去 ， 在 克 霍 里 尼 斯 的 岛 上 。 但 是 我 想 如 果 没 有 船 的 话 ， 肯 定 到 不 了 那 里 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_02"); //他 们 把 我 带 到 一 个 海 岸 上 的 泊 船 地 点 。 有 一 些 海 盗 驻 扎 在 那 里 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_03"); //一 个 强 盗 走 向 海 盗 进 行 谈 判 。 他 们 争 执 的 非 常 激 烈 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_04"); //我 想 那 个 强 盗 想 要 海 盗 们 把 他 摆 渡 到 某 个 地 方 ， 带 着 我 一 起 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_05"); //但 是 海 盗 不 同 意 ， 所 以 强 盗 撤 退 了 。 从 那 个 时 候 起 ， 我 们 就 一 直 呆 在 这 里 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Pirates_04_06"); //他 们 看 起 来 非 常 为 难 。 然 后 你 就 来 了 。

	Elvrich_SCKnowsPirats = TRUE;

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_10);

	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, "克 霍 里 尼 斯 的 海 盗 ？", DIA_Addon_Elvrich_WhatExactly_Here);
	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, "海 盗 的 船 停 泊 在 什 么 地 方 ？", DIA_Addon_Elvrich_WhatExactly_pirat);
};

func void DIA_Addon_Elvrich_WhatExactly_Here()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_Here_15_00"); //克 霍 里 尼 斯 的 海 盗 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_01"); //我 对 他 们 所 知 不 多 。 我 首 先 在 泊 船 地 点 见 到 他 们 的 一 个 人 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_02"); //他 们 总 是 躲 在 暗 处 。 他 们 每 个 人 都 是 克 霍 里 尼 斯 城 里 通 缉 的 罪 犯 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_Here_04_03"); //他 们 害 怕 绞 架 。 所 以 你 在 镇 上 从 来 都 见 不 到 他 们 。
};

func void DIA_Addon_Elvrich_WhatExactly_lucia()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_lucia_15_00"); //跟 我 说 说 露 西 亚 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_lucia_04_01"); //一 个 来 自 海 港 地 区 的 女 孩 。 她 以 前 为 那 个 讨 厌 的 布 洛 摩 尔 工 作 。 她 相 当 漂 亮 。
};

func void DIA_Addon_Elvrich_WhatExactly_pirat()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhatExactly_pirat_15_00"); //海 盗 的 船 停 泊 在 什 么 地 方 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_01"); //离 克 霍 里 尼 斯 的 港 口 不 远 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_02"); //当 你 站 在 码 头 上 面 向 大 海 时 ， 现 在 你 要 做 的 就 是 找 一 条 船 ， 然 后 沿 着 海 岸 向 右 划 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhatExactly_pirat_04_03"); //你 遇 到 的 第 一 个 小 海 湾 就 是 我 说 的 地 方 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_11);

	Info_AddChoice(DIA_Addon_Elvrich_WhatExactly, DIALOG_BACK, DIA_Addon_Elvrich_WhatExactly_Back);
};

func void DIA_Addon_Elvrich_WhatExactly_Back()
{
	Info_ClearChoices(DIA_Addon_Elvrich_WhatExactly);
};

///////////////////////////////////////////////////////////////////////
//	Info Bromor
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_Bromor(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_Bromor_Condition;
	information		= DIA_Addon_Elvrich_Bromor_Info;
	description		= "布 洛 摩 尔 说 露 西 亚 是 带 着 一 个 金 盘 子 离 开 的 … …";
};

func int DIA_Addon_Elvrich_Bromor_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_Bromor_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_Bromor_15_00"); //布 洛 摩 尔 说 露 西 亚 是 带 着 一 个 金 盘 子 离 开 的 … …
	AI_Output(self, other, "DIA_Addon_Elvrich_Bromor_04_01"); //嗯 。 如 果 露 西 亚 真 的 偷 了 布 洛 摩 尔 的 东 西 ， 也 一 定 被 强 盗 抢 走 了 。

	Log_CreateTopic(TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BromorsGold, TOPIC_Addon_BromorsGold_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WhereIsLucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WhereIsLucia(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_WhereIsLucia_Condition;
	information		= DIA_Addon_Elvrich_WhereIsLucia_Info;
	description		= "现 在 露 西 亚 在 哪 里 ？";
};

func int DIA_Addon_Elvrich_WhereIsLucia_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_LuciasLetter != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WhereIsLucia_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WhereIsLucia_15_00"); //现 在 露 西 亚 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_01"); //我 们 在 欧 纳 尔 的 农 场 前 面 的 十 字 路 口 分 开 了 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_02"); //强 盗 们 把 露 西 亚 拉 到 塞 柯 布 的 农 场 后 面 的 树 林 里 去 了 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WhereIsLucia_04_03"); //愿 英 诺 斯 保 佑 她 。

	Log_CreateTopic(TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lucia, TOPIC_Addon_Lucia_2);

	SC_KnowsLuciaCaughtByBandits = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWaffen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_FernandosWaffen(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_FernandosWaffen_Condition;
	information		= DIA_Addon_Elvrich_FernandosWaffen_Info;
	description		= "俘 虏 你 的 强 盗 收 到 了 一 船 武 器 ？";
};

func int DIA_Addon_Elvrich_FernandosWaffen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhatExactly))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_FernandosWaffen_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_FernandosWaffen_15_00"); //俘 虏 你 的 强 盗 收 到 了 一 船 武 器 ？
	AI_Output(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_01"); //哦 ， 是 的 ， 多 的 他 们 几 乎 带 不 了 。
	AI_Output(self, other, "DIA_Addon_Elvrich_FernandosWaffen_04_02"); //他 们 带 着 一 大 堆 人 消 失 在 塞 柯 布 的 农 场 方 向 。
	B_GivePlayerXP(XP_Ambient);

	Log_CreateTopic(TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_10);
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_LuciaLetter(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 4;
	condition		= DIA_Addon_Elvrich_LuciaLetter_Condition;
	information		= DIA_Addon_Elvrich_LuciaLetter_Info;
	description		= "我 找 到 一 封 来 自 你 的 露 西 亚 的 信 。";
};

func int DIA_Addon_Elvrich_LuciaLetter_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhatExactly))
	&& (Npc_HasItems(other, ItWr_LuciasLoveLetter_Addon)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_LuciaLetter_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_LuciaLetter_15_00"); //我 找 到 一 封 来 自 你 的 露 西 亚 的 信 。
	AI_Output(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_01"); //（ 兴 奋 的 ） 什 么 ？ 给 我 ！
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_02"); //（ 绝 望 的 ） 不 ！ 我 不 相 信 。 不 ， 我 就 是 不 能 相 信 。
	AI_Output(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_03"); //（ 绝 望 的 ） 她 不 能 就 这 样 抛 下 我 。
	AI_Output(self, other, "DIA_Addon_Elvrich_LuciaLetter_04_04"); //（ 绝 望 的 ） 把 这 封 信 拿 回 去 ， 我 不 想 要 它 。 我 坚 信 她 有 一 天 会 回 到 我 的 身 边 。

	Log_CreateTopic(TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lucia, TOPIC_Addon_Lucia_3);

	B_GivePlayerXP(XP_Addon_LuciasLetter);
	MIS_LuciasLetter = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info WasNun
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_WasNun(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_WasNun_Condition;
	information		= DIA_Addon_Elvrich_WasNun_Info;
	description		= "你 应 该 赶 快 回 到 镇 上 去 ！";
};

func int DIA_Addon_Elvrich_WasNun_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Elvrich_WhereIsLucia))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_WasNun_Info()
{
	AI_Output(other, self, "DIA_Addon_Elvrich_WasNun_15_00"); //你 应 该 赶 快 回 到 镇 上 去 ！
	AI_Output(self, other, "DIA_Addon_Elvrich_WasNun_04_01"); //我 还 能 再 做 什 么 ？ 我 要 直 接 回 我 的 大 师 托 尔 本 那 里 。
	AI_Output(self, other, "DIA_Addon_Elvrich_WasNun_04_02"); //你 要 去 找 强 盗 ？
	AI_Output(other, self, "DIA_Addon_Elvrich_WasNun_15_03"); //嗯 ， 对 ， 我 是 这 么 想 … …
	AI_Output(self, other, "DIA_Addon_Elvrich_WasNun_04_04"); //如 果 你 找 到 露 西 亚 的 话 ， 把 她 安 全 地 带 回 镇 上 ， 好 吗 ？
	AI_Output(other, self, "DIA_Addon_Elvrich_WasNun_15_05"); //我 会 看 看 能 做 什 么 。

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_7);

	Elvrich_GoesBack2Thorben = TRUE;
	Npc_ExchangeRoutine(self, "BACKINTHECITY");
	EquipItem(self, ItMw_1h_Bau_Mace);
};

///////////////////////////////////////////////////////////////////////
// PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Elvrich_PERM(C_INFO)
{
	npc				= VLK_4302_Addon_Elvrich;
	nr				= 5;
	condition		= DIA_Addon_Elvrich_PERM_Condition;
	information		= DIA_Addon_Elvrich_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Elvrich_PERM_Condition()
{
	if ((Elvrich_GoesBack2Thorben == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (MIS_LuciasLetter != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Elvrich_PERM_Info()
{
	AI_Output(self, other, "DIA_Addon_Elvrich_PERM_04_00"); //谢 谢 你 救 了 我 ！
};
