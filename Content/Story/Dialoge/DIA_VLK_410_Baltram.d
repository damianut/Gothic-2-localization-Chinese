///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_EXIT(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 999;
	condition		= DIA_Baltram_EXIT_Condition;
	information		= DIA_Baltram_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Baltram_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Baltram_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

/////////////////////////////////////////////////////////////////////// AUSKOMMENTIERT WEGEN ADDON M.F. (Missionen passen nicht mehr, Spielfluß hemmend)
//	Info Sperre
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Baltram_Sperre(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 1;
	condition		= DIA_Baltram_Sperre_Condition;
	information		= DIA_Baltram_Sperre_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Baltram_Sperre_Condition()
{
	if ((Canthar_Sperre == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& ((!Npc_KnowsInfo(other, DIA_Addon_Baltram_LaresAbloese))
	|| (SCIsWearingRangerRing == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Sperre_Info()
{
	AI_Output(self, other, "DIA_Baltram_Sperre_01_00"); //Was willst du? Du bist ein Sträfling aus der Minenkolonie. Mit dir mache ich keine Geschäfte!
	AI_StopProcessInfos(self);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Hallo(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 2;
	condition		= DIA_Baltram_Hallo_Condition;
	information		= DIA_Baltram_Hallo_Info;
	important		= TRUE;
};

func int DIA_Baltram_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	// && (Canthar_Sperre == FALSE)
	&& (MIS_Nagur_Bote == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Hallo_Info()
{
	if ((hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		AI_Output(self, other, "DIA_Baltram_Hallo_01_00"); //欢 迎 您 ， 陌 生 人 ， 我 叫 贝 尔 卓 姆 。 你 是 来 采 购 食 物 的 吗 ？
		AI_Output(self, other, "DIA_Baltram_Hallo_01_01"); //我 恐 怕 不 得 不 让 你 失 望 了 。 我 目 前 没 有 多 少 库 存 。
		AI_Output(self, other, "DIA_Baltram_Hallo_01_02"); //但 是 ， 我 很 快 就 能 收 到 一 批 新 货 。
	}
	else
	{
		AI_Output(self, other, "DIA_Baltram_Hallo_01_03"); //如 果 你 是 来 向 我 采 购 食 物 的 ， 那 你 可 以 马 上 离 开 了 。
		AI_Output(self, other, "DIA_Baltram_Hallo_01_04"); //我 不 怎 么 看 得 起 雇 佣 兵 ！ 你 们 只 会 给 我 惹 麻 烦 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LaresAbloese
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_LaresAbloese(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 1;
	condition		= DIA_Addon_Baltram_LaresAbloese_Condition;
	information		= DIA_Addon_Baltram_LaresAbloese_Info;
	important		= TRUE;
};

func int DIA_Addon_Baltram_LaresAbloese_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (SCIsWearingRangerRing == TRUE)
	&& (MIS_Lares_BringRangerToMe == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_LaresAbloese_Info()
{
	AI_Output(other, self, "DIA_Addon_Baltram_LaresAbloese_15_00"); //为 什 么 你 看 起 来 这 样 可 疑 ？
	AI_Output(self, other, "DIA_Addon_Baltram_LaresAbloese_01_01"); //我 看 到 你 有 ‘ 水 之 环 ’ 的 标 记 。
	AI_Output(other, self, "DIA_Addon_Baltram_LaresAbloese_15_02"); //那 么 ， 你 也 是 成 员 之 一 ？
	AI_Output(self, other, "DIA_Addon_Baltram_LaresAbloese_01_03"); //如 果 我 是 又 怎 么 样 ？
	AI_Output(other, self, "DIA_Addon_Baltram_LaresAbloese_15_04"); //那 么 ， 我 将 告 诉 你 莱 尔 瑞 兹 想 离 开 在 港 口 的 岗 位 。
	AI_Output(self, other, "DIA_Addon_Baltram_LaresAbloese_01_05"); //好 的 。 如 果 是 这 样 话 ， 我 找 别 的 人 去 处 理 这 件 事 。
	AI_Output(other, self, "DIA_Addon_Baltram_LaresAbloese_15_06"); //我 明 白 了 。
	B_GivePlayerXP(XP_Ambient);

	B_LogEntry(TOPIC_Addon_BringRangerToLares, TOPIC_Addon_BringRangerToLares_2);

	SC_KnowsBaltramAsRanger = TRUE;
	Baltram_Exchange4Lares = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Job
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Job(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 3;
	condition		= DIA_Baltram_Job_Condition;
	information		= DIA_Baltram_Job_Info;
	description		= "你 有 工 作 给 我 吗 ？";
};

func int DIA_Baltram_Job_Condition()
{
	if ((MIS_Nagur_Bote != LOG_RUNNING)
	&& (MIS_Nagur_Bote != LOG_SUCCESS)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Job_Info()
{
	AI_Output(other, self, "DIA_Baltram_Job_15_00"); //你 有 工 作 给 我 吗 ？
	AI_Output(self, other, "DIA_Baltram_Job_01_01"); //不 ， 我 已 经 有 役 童 了 。 去 别 的 商 人 那 里 试 试 看 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trick
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Trick(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 4;
	condition		= DIA_Baltram_Trick_Condition;
	information		= DIA_Baltram_Trick_Info;
	important		= TRUE;
};

func int DIA_Baltram_Trick_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_Nagur_Bote == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Baltram_Trick_Info()
{
	AI_Output(self, other, "DIA_Baltram_Trick_01_00"); //你 在 找 工 作 吗 ？
	AI_Output(other, self, "DIA_Baltram_Trick_15_01"); //当 然 ， 是 关 于 什 么 的 ？
	AI_Output(self, other, "DIA_Baltram_Trick_01_02"); //我 的 役 童 还 没 有 回 来 ， 而 且 我 在 等 着 一 批 从 农 场 主 阿 基 尔 那 里 运 来 的 货 物 。
	AI_Output(other, self, "DIA_Baltram_Trick_15_03"); //那 么 ， 它 对 你 来 说 值 多 少 钱 ？
	AI_Output(self, other, "DIA_Baltram_Trick_01_04"); //我 会 给 你 5 0 个 金 币 。
	AI_Output(other, self, "DIA_Baltram_Trick_15_05"); //好 ， 成 交 。
	AI_Output(self, other, "DIA_Baltram_Trick_01_06"); //好 的 ， 就 告 诉 阿 基 尔 是 我 派 你 去 的 。 他 会 给 你 一 个 包 裹 。 把 它 带 给 我 。

	MIS_Baltram_ScoutAkil = LOG_RUNNING;
	B_LogEntry(TOPIC_Nagur, TOPIC_Nagur_4);

	Log_CreateTopic(TOPIC_Baltram, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Baltram, LOG_RUNNING);
	B_LogEntry(TOPIC_Baltram, TOPIC_Baltram_2);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
var int Baltram_TradeLOG;
// --------------------------------------------------------------
instance DIA_Baltram_WAREZ(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 2;
	condition		= DIA_Baltram_WAREZ_Condition;
	information		= DIA_Baltram_WAREZ_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Baltram_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Baltram_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Baltram_WAREZ_15_00"); //让 我 看 看 你 的 货 物 。

	if (Baltram_TradeLOG == FALSE)
	{
		Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
		B_LogEntry(Topic_CityTrader, TOPIC_CityTrader_11);
		Baltram_TradeLOG = TRUE;
	};

	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Baltram_WAREZ_01_01"); //他 们 不 该 让 事 情 发 展 到 这 个 样 子 。 现 在 ， 雇 佣 兵 真 的 已 经 谋 杀 了 一 名 圣 骑 士 。
		AI_Output(self, other, "DIA_Baltram_WAREZ_01_02"); //就 在 最 近 某 一 天 ， 会 有 一 些 事 情 发 生 ！
	};

	if ((MIS_BaltramTrade != LOG_SUCCESS)
	&& ((hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)))
	{
		AI_Output(self, other, "DIA_Baltram_WAREZ_01_03"); //像 你 这 样 的 人 从 我 这 里 得 不 到 任 何 东 西 。
		AI_Output(other, self, "DIA_Baltram_WAREZ_15_04"); //为 什 么 ？
		AI_Output(self, other, "DIA_Baltram_WAREZ_01_05"); //首 先 ， 你 鼓 动 那 些 农 民 ， 然 后 ， 你 装 作 什 么 都 没 发 生 过 的 样 子 。
		AI_Output(self, other, "DIA_Baltram_WAREZ_01_06"); //马 上 走 开 ， 你 把 我 的 客 人 都 赶 走 了 。

		MIS_BaltramTrade = LOG_FAILED;

		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Skip
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_Skip(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 5;
	condition		= DIA_Addon_Baltram_Skip_Condition;
	information		= DIA_Addon_Baltram_Skip_Info;
	description		= "你 同 海 盗 们 做 生 意 ？";
};

func int DIA_Addon_Baltram_Skip_Condition()
{
	if (SCKnowsBaltramAsPirateTrader == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_Skip_Info()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_15_00"); //（ 碰 巧 地 ） 你 在 跟 海 盗 做 生 意 ？
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_01_01"); //（ 感 觉 被 发 现 ） 什 么 ？ 谁 告 诉 你 的 ？
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_15_02"); //我 跟 他 们 中 的 一 个 人 谈 过 。 他 像 是 在 他 的 海 湾 里 等 着 你 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_01_03"); //你 能 做 什 么 事 情 ？ 这 些 日 子 不 好 过 。 每 一 个 人 都 得 看 好 自 己 的 东 西 。

	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 不 怕 被 抓 吗 ？", DIA_Addon_Baltram_Skip_erwischen);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 要 为 此 承 担 后 果 ！", DIA_Addon_Baltram_Skip_MIL);
};

func void DIA_Addon_Baltram_Skip_Back()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_Back_15_00"); //我 想 知 道 的 就 这 么 多 。
	Info_ClearChoices(DIA_Addon_Baltram_Skip);
};

func void DIA_Addon_Baltram_Skip_MIL()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_MIL_15_00"); //你 要 为 此 承 担 后 果 ！
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_MIL_01_01"); //嘿 ， 听 着 。 我 会 告 诉 你 我 知 道 的 一 切 ， 但 是 作 为 回 报 ， 你 不 要 出 卖 我 ， 好 吗 ？

	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 们 交 易 的 是 什 么 ？", DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 知 道 关 于 海 盗 的 事 情 吗 ？", DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_erwischen()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_erwischen_15_00"); //你 不 怕 被 抓 吗 ？
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_erwischen_01_01"); //那 有 可 能 。 你 也 发 现 了 ， 不 是 吗 ？。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_erwischen_01_02"); //但 是 ， 你 会 守 口 如 瓶 ， 对 吗 ？

	Info_ClearChoices(DIA_Addon_Baltram_Skip);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 们 交 易 的 是 什 么 ？", DIA_Addon_Baltram_Skip_was);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "你 知 道 关 于 海 盗 的 事 情 吗 ？", DIA_Addon_Baltram_Skip_pirat);
};

func void DIA_Addon_Baltram_Skip_was()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_was_15_00"); //（ 简 略 地 ） 你 在 做 什 么 买 卖 ？
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_was_01_01"); //我 主 要 为 他 们 提 供 食 物 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_was_01_02"); //为 此 ， 他 们 给 我 一 些 朗 姆 酒 ， 那 要 到 克 霍 里 尼 斯 去 卖 。

	Info_AddChoice(DIA_Addon_Baltram_Skip, "我 想 知 道 的 就 这 么 多 。", DIA_Addon_Baltram_Skip_Back);
	Info_AddChoice(DIA_Addon_Baltram_Skip, "我 可 以 帮 你 处 理 这 笔 生 意 。", DIA_Addon_Baltram_Skip_Ich);
};

func void DIA_Addon_Baltram_Skip_Ich()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_Ich_15_00"); //（ 咧 着 嘴 笑 ） 我 可 以 帮 你 处 理 这 桩 事 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_Ich_01_01"); //那 就 太 棒 了 。 我 现 在 不 能 离 开 克 霍 里 尼 斯 。
	CreateInvItems(self, ItMi_Packet_Baltram4Skip_Addon, 1);
	B_GiveInvItems(self, other, ItMi_Packet_Baltram4Skip_Addon, 1);
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_Ich_01_02"); //给 ， 拿 着 这 个 包 裹 ， 告 诉 斯 奇 普 这 次 给 的 朗 姆 酒 可 不 能 太 少 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_Ich_01_03"); //至 少 要 三 瓶 。

	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, TOPIC_Addon_BaltramSkipTrade_2);

	MIS_Addon_Baltram_Paket4Skip = LOG_RUNNING;
};

func void DIA_Addon_Baltram_Skip_pirat()
{
	AI_Output(other, self, "DIA_Addon_Baltram_Skip_pirat_15_00"); //（ 简 略 地 ） 你 知 道 关 于 海 盗 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_pirat_01_01"); //（ 匆 忙 地 ） 他 们 住 在 克 霍 里 尼 斯 岛 上 一 个 偏 僻 的 角 落 上 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_pirat_01_02"); //据 我 所 知 ， 要 坐 小 船 或 者 别 的 什 么 船 只 才 能 到 那 里 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_pirat_01_03"); //克 霍 里 尼 斯 的 人 都 害 怕 他 们 。 真 的 是 这 样 ， 因 为 他 们 是 一 帮 凶 恶 的 歹 徒 。
	AI_Output(self, other, "DIA_Addon_Baltram_Skip_pirat_01_04"); //尽 管 如 此 ， 我 认 为 ， 他 们 远 远 没 有 那 些 强 盗 坏 。
};

///////////////////////////////////////////////////////////////////////
//	Info SkipsRum
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Baltram_SkipsRum(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 5;
	condition		= DIA_Addon_Baltram_SkipsRum_Condition;
	information		= DIA_Addon_Baltram_SkipsRum_Info;
	description		= "我 从 斯 奇 普 那 里 得 到 了 朗 姆 酒 。";
};

func int DIA_Addon_Baltram_SkipsRum_Condition()
{
	if ((Skip_Rum4Baltram == TRUE)
	&& (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFo_Addon_Rum) >= 2))
	{
		return TRUE;
	};
};

func void DIA_Addon_Baltram_SkipsRum_Info()
{
	AI_Output(other, self, "DIA_Addon_Baltram_SkipsRum_15_00"); //我 从 斯 奇 普 那 里 把 朗 姆 酒 带 来 了 。 但 他 只 给 了 我 2 瓶 。
	AI_Output(self, other, "DIA_Addon_Baltram_SkipsRum_01_01"); //（ 生 气 的 ） 那 真 贵 。 他 以 为 他 是 谁 ？ 算 了 ， 把 它 们 放 在 这 里 吧 。
	B_GiveInvItems(other, self, ItFo_Addon_Rum, 2);
	AI_Output(self, other, "DIA_Addon_Baltram_SkipsRum_01_02"); //现 在 ， 我 不 能 给 你 太 多 的 报 酬 。 这 些 应 该 足 够 了 。
	CreateInvItems(self, ItMi_Gold, 10);
	B_GiveInvItems(self, other, ItMi_Gold, 10);

	TOPIC_END_BaltramSkipTrade = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_AkilsHof(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 4;
	condition		= DIA_Baltram_AkilsHof_Condition;
	information		= DIA_Baltram_AkilsHof_Info;
	description		= "我 到 哪 里 去 找 阿 基 尔 的 农 场 ？";
};

func int DIA_Baltram_AkilsHof_Condition()
{
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Baltram_AkilsHof_Info()
{
	AI_Output(other, self, "DIA_Baltram_AkilsHof_15_00"); //我 到 哪 里 去 找 阿 基 尔 的 农 场 ？
	AI_Output(self, other, "DIA_Baltram_AkilsHof_01_01"); //从 这 里 直 接 出 东 门 ， 沿 着 往 东 南 方 的 路 去 。
	AI_Output(self, other, "DIA_Baltram_AkilsHof_01_02"); //过 一 会 儿 就 会 到 一 个 石 梯 前 面 。 上 去 后 就 能 从 那 里 看 到 阿 基 尔 的 农 场 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Lieferung geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_Lieferung(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 5;
	condition		= DIA_Baltram_Lieferung_Condition;
	information		= DIA_Baltram_Lieferung_Info;
	description		= "我 已 经 得 到 了 阿 基 尔 的 货 物 。";
};

func int DIA_Baltram_Lieferung_Condition()
{
	if (Npc_HasItems(other, ItMi_BaltramPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Baltram_Lieferung_Info()
{
	AI_Output(other, self, "DIA_Baltram_Lieferung_15_00"); //我 已 经 得 到 了 阿 基 尔 的 货 物 。
	AI_Output(self, other, "DIA_Baltram_Lieferung_01_01"); //太 棒 了 。 我 终 于 又 能 供 应 新 鲜 货 物 了 。 这 是 你 的 5 0 个 金 币 。

	B_GiveInvItems(other, self, ItMi_BaltramPaket, 1);
	B_GiveInvItems(self, other, ItMi_Gold, 50);

	MIS_Baltram_ScoutAkil = LOG_SUCCESS;
	MIS_Nagur_Bote = LOG_FAILED;
	B_GivePlayerXP(XP_Baltram_ScoutAkil);

	Npc_RemoveInvItems(self, ItMi_BaltramPaket, 1);

	CreateInvItems(self, ItFo_Cheese, 5);
	CreateInvItems(self, ItFo_Apple, 10);
	CreateInvItems(self, ItFo_Beer, 5);
	CreateInvItems(self, ItFo_Bacon, 5);
	CreateInvItems(self, ItFo_Sausage, 5);
};

///////////////////////////////////////////////////////////////////////
//	Info LetUsTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_LetUsTrade(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 6;
	condition		= DIA_Baltram_LetUsTrade_Condition;
	information		= DIA_Baltram_LetUsTrade_Info;
	description		= "我 们 最 终 还 不 能 一 起 做 生 意 ？";
};

func int DIA_Baltram_LetUsTrade_Condition()
{
	if (MIS_BaltramTrade == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Baltram_LetUsTrade_Info()
{
	AI_Output(other, self, "DIA_Baltram_LetUsTrade_15_00"); //我 们 最 终 还 不 能 一 起 做 生 意 ？
	AI_Output(self, other, "DIA_Baltram_LetUsTrade_01_01"); //听 着 ， 如 果 你 给 我 带 1 0 个 火 腿 和 1 0 瓶 酒 来 ， 那 我 就 会 再 跟 你 交 易 。
	AI_Output(other, self, "DIA_Baltram_LetUsTrade_15_02"); //我 会 看 看 能 做 什 么 。

	MIS_BaltramTrade = LOG_RUNNING;
};

var int BaltramEnoughBacon;
var int BaltramEnoughWine;

///////////////////////////////////////////////////////////////////////
//	Info HaveYourWarez
///////////////////////////////////////////////////////////////////////
instance DIA_Baltram_HaveYourWarez(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 6;
	condition		= DIA_Baltram_HaveYourWarez_Condition;
	information		= DIA_Baltram_HaveYourWarez_Info;
	permanent		= TRUE;
	description		= "我 拿 到 了 你 的 货 物 。";
};

func int DIA_Baltram_HaveYourWarez_Condition()
{
	if ((MIS_BaltramTrade == LOG_RUNNING)
	&& (MIS_BaltramTrade != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Baltram_HaveYourWarez_Info()
{
	AI_Output(other, self, "DIA_Baltram_HaveYourWarez_15_00"); //我 拿 到 了 你 的 货 物 。
	AI_Output(self, other, "DIA_Baltram_HaveYourWarez_01_01"); //让 我 看 看 。

	if (Npc_HasItems(other, ItFo_Bacon) < 10)
	{
		AI_Output(self, other, "DIA_Baltram_HaveYourWarez_01_02"); //我 们 已 经 说 定 了 是 1 0 个 火 腿 。 等 你 凑 齐 了 再 来 。

		BaltramEnoughBacon = FALSE;
	}
	else
	{
		BaltramEnoughBacon = TRUE;
	};

	if (Npc_HasItems(other, ItFo_Wine) < 10)
	{
		AI_Output(self, other, "DIA_Baltram_HaveYourWarez_01_03"); //那 1 0 瓶 酒 怎 么 样 了 ？ 你 忘 了 吗 ？

		BaltramEnoughWine = FALSE;
	}
	else
	{
		BaltramEnoughWine = TRUE;
	};

	if (BaltramEnoughBacon == TRUE
	&& BaltramEnoughWine == TRUE)
	{
		AI_Output(self, other, "DIA_Baltram_HaveYourWarez_01_04"); //嗯 ， 这 不 是 最 好 的 ， 不 过 在 现 在 这 样 的 时 候 也 不 能 太 挑 剔 了 。

		B_GiveInvItems(other, self, ItFo_Bacon, 10);
		B_GiveInvItems(other, self, ItFo_Wine, 10);

		MIS_BaltramTrade = LOG_SUCCESS;

		B_GivePlayerXP(XP_BaltramTrade);

		AI_Output(self, other, "DIA_Baltram_HaveYourWarez_01_05"); //现 在 没 有 什 么 问 题 了 ， 我 们 可 以 交 易 了。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Baltram_PICKPOCKET(C_INFO)
{
	npc				= VLK_410_Baltram;
	nr				= 900;
	condition		= DIA_Baltram_PICKPOCKET_Condition;
	information		= DIA_Baltram_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Baltram_PICKPOCKET_Condition()
{
	C_Beklauen(76, 175);
};

func void DIA_Baltram_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
	Info_AddChoice(DIA_Baltram_PICKPOCKET, DIALOG_BACK, DIA_Baltram_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Baltram_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Baltram_PICKPOCKET_DoIt);
};

func void DIA_Baltram_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};

func void DIA_Baltram_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Baltram_PICKPOCKET);
};
