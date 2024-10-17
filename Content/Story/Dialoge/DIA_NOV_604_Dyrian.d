//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Dyrian_EXIT(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 999;
	condition		= DIA_Dyrian_EXIT_Condition;
	information		= DIA_Dyrian_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dyrian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dyrian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//**************************************************************************
//	Info Hello
//**************************************************************************
instance DIA_Dyrian_Hello(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 2;
	condition		= DIA_Dyrian_Hello_Condition;
	information		= DIA_Dyrian_Hello_Info;
	important		= TRUE;
};

func int DIA_Dyrian_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (MIS_RUNE == FALSE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (MIS_GOLEM == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Hello_Info()
{
	AI_Output(self, other, "DIA_Dyrian_Hello_13_00"); //（ 哀 伤 的 ） 你 要 做 什 么 ？
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Dyrian_Wurst(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_Wurst_Condition;
	information		= DIA_Dyrian_Wurst_Info;
	description		= "我 忙 着 发 香 肠 。";
};

func int DIA_Dyrian_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Wurst_Info()
{
	AI_Output(other, self, "DIA_Dyrian_Wurst_15_00"); //我 忙 着 发 香 肠 。
	AI_Output(self, other, "DIA_Dyrian_Wurst_13_01"); //谢 谢 。 希 望 那 不 是 我 在 这 里 得 到 的 最 后 一 根 香 肠 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

//**************************************************************************
//	Was machst Du hier?
//**************************************************************************
instance DIA_Dyrian_Job(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 1;
	condition		= DIA_Dyrian_Job_Condition;
	information		= DIA_Dyrian_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Dyrian_Job_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Dyrian_Hello)
	&& (MIS_RUNE == FALSE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Job_Info()
{
	AI_Output(other, self, "DIA_Dyrian_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Dyrian_Job_13_01"); //我 违 反 了 社 团 的 规 定 。
	AI_Output(self, other, "DIA_Dyrian_Job_13_02"); //现 在 我 正 等 待 高 级 议 会 决 定 是 否 让 我 留 在 修 道 院 。
};

//**************************************************************************
//	Wieso sollst Du das Kloster denn verlassen?
//**************************************************************************
instance DIA_Dyrian_WhatDone(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_WhatDone_Condition;
	information		= DIA_Dyrian_WhatDone_Info;
	description		= "告 诉 我 发 生 了 什 么 事 。";
};

func int DIA_Dyrian_WhatDone_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dyrian_Job))
	&& (MIS_RUNE == FALSE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_WhatDone_Info()
{
	AI_Output(other, self, "DIA_Dyrian_WhatDone_15_00"); //告 诉 我 发 生 了 什 么 事 。
	AI_Output(self, other, "DIA_Dyrian_WhatDone_13_01"); //我 在 打 扫 的 时 候 从 魔 法 师 的 房 间 里 拿 了 一 本 书 ， 为 了 以 后 阅 读 。
	AI_Output(self, other, "DIA_Dyrian_WhatDone_13_02"); //大 师 希 格 莱 斯 立 即 发 现 了 ， 当 然 ， 向 我 问 起 了 那 本 书 。
	AI_Output(self, other, "DIA_Dyrian_WhatDone_13_03"); //我 因 为 害 怕 受 到 惩 罚 ， 就 撒 了 谎 - 但 是 后 来 ， 当 我 在 房 间 里 看 那 本 书 的 时 候 被 他 抓 住 了 。
	AI_Output(self, other, "DIA_Dyrian_WhatDone_13_04"); //他 非 常 生 气 ， 并 通 知 了 高 级 议 会 。 他 们 现 在 正 在 讨 论 是 否 让 我 留 下 。
};

//**************************************************************************
//	Kann ich dir irgendwie helfen?
//**************************************************************************
instance DIA_Dyrian_CanHelp(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 4;
	condition		= DIA_Dyrian_CanHelp_Condition;
	information		= DIA_Dyrian_CanHelp_Info;
	permanent		= TRUE;
	description		= "我 有 什 么 办 法 帮 助 你 ？";
};

func int DIA_Dyrian_CanHelp_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Dyrian_Job)
	&& (MIS_RUNE == FALSE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_CanHelp_Info()
{
	AI_Output(other, self, "DIA_Dyrian_CanHelp_15_00"); //我 有 什 么 办 法 帮 助 你 ？
	AI_Output(self, other, "DIA_Dyrian_CanHelp_13_01"); //不 ， 我 正 等 着 英 诺 斯 和 魔 法 师 的 宽 恕 。
};

//**************************************************************************
//	SC hat die Prüfung des Feuers angenommen und mit Hyglas gesprochen
//**************************************************************************
instance DIA_Dyrian_Scroll(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 1;
	condition		= DIA_Dyrian_Scroll_Condition;
	information		= DIA_Dyrian_Scroll_Info;
	important		= TRUE;
};

func int DIA_Dyrian_Scroll_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	|| (MIS_RUNE == LOG_RUNNING)
	|| (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Scroll_Info()
{
	AI_Output(self, other, "DIA_Dyrian_Scroll_13_00"); //嘿 ， 你 真 的 申 请 了 火 焰 测 试 ？
	AI_Output(other, self, "DIA_Dyrian_Scroll_15_01"); //是 的 。 而 且 我 打 算 通 过 。
	AI_Output(self, other, "DIA_Dyrian_Scroll_13_02"); //好 - 也 许 我 能 帮 助 你 。 我 可 以 给 你 一 个 非 常 有 用 的 魔 法 卷 轴 ， 一 个 催 眠 魔 法 。 感 兴 趣 吗 ？

	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll, "不 ， 我 不 需 要 你 的 帮 助 。", DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll, "你 要 怎 么 处 理 它 ？", DIA_Dyrian_Scroll_How);
	Info_AddChoice(DIA_Dyrian_Scroll, "我 能 用 它 做 什 么 ？", DIA_Dyrian_Scroll_What);
};

func void DIA_Dyrian_Scroll_What()
{
	AI_Output(other, self, "DIA_Dyrian_Scroll_What_15_00"); //我 能 用 它 做 什 么 ？
	AI_Output(self, other, "DIA_Dyrian_Scroll_What_13_01"); //用 这 个 魔 法 ， 你 可 以 让 别 人 进 入 短 暂 的 魔 法 催 眠 。 但 是 只 有 当 他 们 的 意 志 比 你 弱 才 行 。
	AI_Output(self, other, "DIA_Dyrian_Scroll_What_13_02"); //如 果 有 人 挡 住 你 的 路 时 ， 那 就 非 常 有 用 了 … …
	AI_Output(other, self, "DIA_Dyrian_Scroll_What_15_03"); //那 我 怎 么 才 能 知 道 其 它 人 的 意 志 是 否 比 较 弱 呢 ？
	AI_Output(self, other, "DIA_Dyrian_Scroll_What_13_04"); //你 用 不 着 在 魔 法 师 身 上 试 了 ， 但 是 你 可 以 把 大 部 分 新 信 徒 催 眠 。
};

func void DIA_Dyrian_Scroll_No()
{
	AI_Output(other, self, "DIA_Dyrian_Scroll_No_15_00"); //不 ， 我 不 需 要 你 的 帮 助 。
	AI_Output(self, other, "DIA_Dyrian_Scroll_No_13_01"); //当 你 改 变 想 法 的 时 候 ， 可 以 随 时 来 找 我 。
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

func void DIA_Dyrian_Scroll_How()
{
	AI_Output(other, self, "DIA_Dyrian_Scroll_How_15_00"); //你 想 要 什 么 作 为 交 换 ？
	AI_Output(self, other, "DIA_Dyrian_Scroll_How_13_01"); //每 个 魔 法 师 刚 加 入 的 时 候 都 可 以 许 一 个 愿 。
	AI_Output(self, other, "DIA_Dyrian_Scroll_How_13_02"); //那 么 如 果 你 真 的 通 过 了 火 焰 测 试 ， 那 么 你 就 可 以 让 我 留 在 道 院 里 。

	Info_ClearChoices(DIA_Dyrian_Scroll);
	Info_AddChoice(DIA_Dyrian_Scroll, "不 ， 我 不 需 要 你 的 帮 助 。", DIA_Dyrian_Scroll_No);
	Info_AddChoice(DIA_Dyrian_Scroll, "好 吧 ， 给 我 魔 法 卷 轴 。 ", DIA_Dyrian_Scroll_Yes);
};

func void DIA_Dyrian_Scroll_Yes()
{
	AI_Output(other, self, "DIA_Dyrian_Scroll_Yes_15_00"); //好 吧 ， 给 我 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Dyrian_Scroll_Yes_13_01"); //祝 你 的 测 试 好 运 。 愿 英 诺 斯 祝 福 你 。

	B_GiveInvItems(self, other, ItSc_Sleep, 1);
	MIS_HelpDyrian = LOG_RUNNING;
	Log_CreateTopic(Topic_DyrianDrin, LOG_MISSION);
	Log_SetTopicStatus(Topic_DyrianDrin, LOG_RUNNING);
	B_LogEntry(Topic_DyrianDrin, Topic_DyrianDrin_1);
	Info_ClearChoices(DIA_Dyrian_Scroll);
};

//**************************************************************************
//	Doch Scroll nehmen
//**************************************************************************
instance DIA_Dyrian_Doch(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 4;
	condition		= DIA_Dyrian_Doch_Condition;
	information		= DIA_Dyrian_Doch_Info;
	permanent		= TRUE;
	description		= "我 改 变 主 意 了 。 把 那 个 催 眠 魔 法 给 我 。";
};

func int DIA_Dyrian_Doch_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Dyrian_Scroll)
	&& (MIS_HelpDyrian != LOG_RUNNING)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Doch_Info()
{
	AI_Output(other, self, "DIA_Dyrian_Doch_15_00"); //我 改 变 主 意 了 。 把 那 个 催 眠 魔 法 给 我 。
	AI_Output(self, other, "DIA_Dyrian_Doch_13_01"); //好 ， 如 果 你 通 过 了 测 试 ， 你 就 要 保 证 我 留 在 修 道 院 里 。

	B_GiveInvItems(self, other, ItSc_Sleep, 1);
	MIS_HelpDyrian = LOG_RUNNING;
};

//*****************************************************************************
//			SC trifft Dyrian, nach Aufnahme und der ist noch im KLoster
//*****************************************************************************
instance DIA_Dyrian_HelloAgain(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 2;
	condition		= DIA_Dyrian_HelloAgain_Condition;
	information		= DIA_Dyrian_HelloAgain_Info;
	important		= TRUE;
};

func int DIA_Dyrian_HelloAgain_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (other.guild == GIL_KDF)
	&& (MIS_HelpDyrian == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HelloAgain_Info()
{
	AI_Output(self, other, "DIA_Dyrian_HelloAgain_13_00"); //（ 欢 喜 的 ） 谢 谢 ， 你 救 了 我 ！
	AI_Output(self, other, "DIA_Dyrian_HelloAgain_13_01"); //（ 害 怕 的 ） 哦 - 原 谅 我 ， 大 师 - 我 没 想 欺 骗 。
	AI_Output(self, other, "DIA_Dyrian_HelloAgain_13_02"); //（ 尊 敬 的 ） 我 感 谢 你 允 许 我 留 在 修 道 院 里 。 我 的 生 命 从 今 天 开 始 将 完 全 不 同 … …

	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

//*****************************************************************************
//			Wie gehts? // Info für Magier Success
//*****************************************************************************
func void B_Dyrian_PlayerHowIsIt()
{
	AI_Output(other, self, "DIA_Dyrian_HowIsIt_15_00"); //情 况 怎 么 样 了 ？
};
instance DIA_Dyrian_HowIsIt(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_HowIsIt_Condition;
	information		= DIA_Dyrian_HowIsIt_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Dyrian_HowIsIt_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dyrian_HelloAgain))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_HowIsIt_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self, other, "DIA_Dyrian_HowIsIt_13_01"); //好 。 我 真 的 喜 欢 工 作 ， 大 师 。

	AI_StopProcessInfos(self);
};

//*****************************************************************************
//			Wie gehts? // Info für alle anderen
//*****************************************************************************
instance DIA_Dyrian_other(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_other_Condition;
	information		= DIA_Dyrian_other_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Dyrian_other_Condition()
{
	if ((other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_other_Info()
{
	B_Dyrian_PlayerHowIsIt();
	AI_Output(self, other, "DIA_Dyrian_HowIsIt_13_02"); //我 感 谢 英 诺 斯 ， 可 以 让 我 留 在 修 道 院 里 。

	AI_StopProcessInfos(self);
};

//*****************************************************************************
//			Dyrian steht in Kneipe
//*****************************************************************************
instance DIA_Dyrian_Kneipe(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_Kneipe_Condition;
	information		= DIA_Dyrian_Kneipe_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Dyrian_Kneipe_Condition()
{
	if ((MIS_HelpDyrian == LOG_FAILED)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_Kneipe_Info()
{
	AI_Output(other, self, "DIA_Dyrian_Kneipe_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Dyrian_Kneipe_13_01"); //你 在 问 我 ？ 我 把 所 有 的 希 望 都 寄 托 在 你 身 上 ， 而 你 让 我 流 离 失 所 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_13_02"); //现 在 ， 我 除 了 酒 ， 什 么 都 不 剩 了 。 而 这 都 是 你 的 错 ！

	Info_ClearChoices(DIA_Dyrian_Kneipe);
	Info_AddChoice(DIA_Dyrian_Kneipe, "这 ， 给 你 ５ 金 币 。", DIA_Dyrian_Kneipe_Gold);
	Info_AddChoice(DIA_Dyrian_Kneipe, "我 可 以 解 释 一 切 。", DIA_Dyrian_Kneipe_CanExplain);
	Info_AddChoice(DIA_Dyrian_Kneipe, "留 意 你 在 那 里 说 的 话 。！", DIA_Dyrian_Kneipe_ShutUp);
};

func void DIA_Dyrian_Kneipe_Gold()
{
	AI_Output(other, self, "DIA_Dyrian_Kneipe_Gold_15_00"); //拿 着 ， 给 你5枚 金 币 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_Gold_13_01"); //（ 惴 惴 不 安 的 ）5枚 金 币 ？ 你 给 我5枚 金 币 来 补 偿 我 的 生 活 所 遭 受 的 迫 害 ？
	AI_Output(self, other, "DIA_Dyrian_Kneipe_Gold_13_02"); //我 要 拿 走 你 所 有 的 钱 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 0);
};

func void DIA_Dyrian_Kneipe_CanExplain()
{
	AI_Output(other, self, "DIA_Dyrian_Kneipe_CanExplain_15_00"); //我 可 以 解 释 一 切 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_CanExplain_13_01"); //省 省 你 廉 价 的 借 口 吧 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_CanExplain_13_02"); //你 每 次 开 口 都 在 撒 谎 。 现 在 走 开 。

	AI_StopProcessInfos(self);
};

func void DIA_Dyrian_Kneipe_ShutUp()
{
	AI_Output(other, self, "DIA_Dyrian_Kneipe_ShutUp_15_00"); //留 意 你 在 那 里 说 的 话 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_ShutUp_13_01"); //是 的 ， 来 啊 ， 继 续 威 胁 我 。 那 对 你 不 会 有 好 处 的 。
	AI_Output(self, other, "DIA_Dyrian_Kneipe_ShutUp_13_02"); //我 要 告 诉 全 世 界 ， 你 是 这 样 一 个 伪 善 的 混 蛋 ！ 只 要 等 我 喝 完 这 瓶 … …
	AI_Output(self, other, "DIA_Dyrian_Kneipe_ShutUp_13_03"); //现 在 滚 出 我 的 视 线 ， 你 让 我 恶 心 ！

	AI_StopProcessInfos(self);
};

//*****************************************************************************
//			Wie gehts? // Info nachher Kneipe
//*****************************************************************************
instance DIA_Dyrian_nachher(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 3;
	condition		= DIA_Dyrian_nachher_Condition;
	information		= DIA_Dyrian_nachher_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Dyrian_nachher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dyrian_Kneipe))
	{
		return TRUE;
	};
};

func void DIA_Dyrian_nachher_Info()
{
	AI_Output(other, self, "DIA_Dyrian_nachher_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Dyrian_nachher_13_01"); //啊 ， 离 我 远 点 ！ 我 不 想 再 和 你 有 任 何 瓜 葛 ！
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Dyrian_PICKPOCKET(C_INFO)
{
	npc				= NOV_604_Dyrian;
	nr				= 900;
	condition		= DIA_Dyrian_PICKPOCKET_Condition;
	information		= DIA_Dyrian_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Dyrian_PICKPOCKET_Condition()
{
	C_Beklauen(10, 15);
};

func void DIA_Dyrian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET, DIALOG_BACK, DIA_Dyrian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dyrian_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Dyrian_PICKPOCKET_DoIt);
};

func void DIA_Dyrian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};

func void DIA_Dyrian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dyrian_PICKPOCKET);
};
