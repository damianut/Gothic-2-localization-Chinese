///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_EXIT(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 999;
	condition		= DIA_Addon_Martin_EXIT_Condition;
	information		= DIA_Addon_Martin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Martin_PICKPOCKET(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 900;
	condition		= DIA_Addon_Martin_PICKPOCKET_Condition;
	information		= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen(65, 77);
};

func void DIA_Addon_Martin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK, DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 1;
	condition		= DIA_Addon_Martin_MeetingIsRunning_Condition;
	information		= DIA_Addon_Martin_MeetingIsRunning_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //那 么 你 是 新 来 的 ， 嗯 ？ 欢 迎 加 入 我 们 ， ‘ 环 ’ 的 兄 弟 。
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //先 去 瓦 卓 斯 那 里 ， 也 许 那 时 我 就 有 时 间 和 你 谈 谈 了 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_Hallo_Condition;
	information		= DIA_Addon_Martin_Hallo_Info;
	important		= TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info()
{
	AI_Output(self, other, "DIA_Addon_Martin_Hallo_07_00"); //嘿 ， 你 。 这 里 没 你 的 事 。 只 有 圣 骑 士 和 我 们 民 兵 可 以 进 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_WasMachstDu_Condition;
	information		= DIA_Addon_Martin_WasMachstDu_Info;
	description		= "这 有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Addon_Martin_WasMachstDu_Condition()
{
	if (Npc_GetDistToWP(self, "NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_WasMachstDu_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //这 有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //这 是 圣 骑 士 皇 家 卫 兵 的 给 养 仓 库 。

	if ((other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //我 是 这 里 的 给 养 负 责 人 ，我 的 责 任 就 是 不 让 任 何 圣 骑 士 的 物 品 外 流 , 而 这 里 不 需 要 你 。
		AI_Output(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //那 么 把 你 的 手 看 好 ， 不 然 我 就 把 它 们 剁 掉 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_PreTrade_Condition;
	information		= DIA_Addon_Martin_PreTrade_Info;
	description		= "你 能 卖 我 任 何 圣 骑 士 的 东 西 吗 ？";
};

func int DIA_Addon_Martin_PreTrade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_PreTrade_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //你 能 卖 我 任 何 圣 骑 士 的 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //你 想 买 ？ 嗯 。 这 样 吧 ， 如 果 你 能 补 偿 我 因 为 圣 骑 士 的 东 西 外 流 而 惹 上 的 麻 烦 ， 那 我 们 也 许 能 做 这 个 交 易 。
	AI_Output(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //物 品 外 流 的 事 经 常 发 生 吗 ？
	AI_Output(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //既 然 补 给 官 员 已 经 说 过 一 切 物 品 都 正 常 ， 不 。
	AI_Output(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //我 知 道。
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_Farim_Condition;
	information		= DIA_Addon_Martin_Farim_Info;
	description		= "渔 夫 法 瑞 姆 和 民 兵 之 间 有 些 纷 争 。";
};

func int DIA_Addon_Martin_Farim_Condition()
{
	if ((MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Martin_PreTrade)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Farim_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_Farim_15_00"); //渔 夫 法 瑞 姆 与 民 兵 之 间 有 矛 盾 ， 那 些 家 伙 总 从 他 那 里 偷 东 西 。
	AI_Output(self, other, "DIA_Addon_Martin_Farim_07_01"); //我 要 怎 么 解 决 它 ？
	AI_Output(other, self, "DIA_Addon_Martin_Farim_15_02"); //你 对 这 里 的 圣 骑 士 有 一 定 的 影 响 力 。
	AI_Output(other, self, "DIA_Addon_Martin_Farim_15_03"); //法 瑞 姆 需 要 你 的 保 护 。 他 愿 意 把 他 捕 获 的 鱼 给 你 一 部 分 东 西 做 报 酬 。
	AI_Output(self, other, "DIA_Addon_Martin_Farim_07_04"); //我 知 道 你 的 意 思 。
	AI_Output(self, other, "DIA_Addon_Martin_Farim_07_05"); //（ 轻 蔑 的 ） 鱼 ！ 好 像 我 没 有 一 堆 垃 圾 要 处 理 一 样 。
	AI_Output(self, other, "DIA_Addon_Martin_Farim_07_06"); //告 诉 你 的 朋 友 ， 他 应 该 到 我 这 里 来 ， 并 确 切 地 告 诉 我 他 和 民 兵 之 间 究 竟 发 生 了 什 么 事 。
	AI_Output(self, other, "DIA_Addon_Martin_Farim_07_07"); //我 会 去 做 的 。

	B_LogEntry(TOPIC_Addon_FarimsFish, TOPIC_Addon_FarimsFish_2);

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP(XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 80;
	condition		= DIA_Addon_Martin_Trade_Condition;
	information		= DIA_Addon_Martin_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 供 应 什 么 ？";
};

func int DIA_Addon_Martin_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_PreTrade))
	{
		return TRUE;
	};
};

var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, LogText_Addon_MartinTrade);
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};

	AI_Output(other, self, "DIA_Addon_Martin_Trade_15_00"); //你 供 应 什 么 ？
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Addon_Martin_Trade_07_01"); //那 么 注 意 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 2;
	condition		= DIA_Addon_Martin_Rangerhelp_Condition;
	information		= DIA_Addon_Martin_Rangerhelp_Info;
	description		= "莱 尔 瑞 兹 派 我 来。";
};

func int DIA_Addon_Martin_Rangerhelp_Condition()
{
	if ((RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Rangerhelp_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //莱 尔 瑞 兹 让 我 来 的 。 他 说 你 能 帮 助 我 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //真 的 ？ 他 说 的 ？ 那 么 快 说 吧 。 你 想 要 我 怎 么 样 ？
	AI_Output(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //我 想 要 加 入 民 兵 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //（ 大 笑 ） 你 希 望 那 样 ， 不 是 吗 ？ 如 果 没 有 合 适 的 理 由 ， 我 们 不 会 接 受 像 你 那 样 穿 着 破 烂 衣 服 的 人 的 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //你 可 能 必 须 … …
	AI_Output(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //原 谅 我 的 胡 言 乱 语 。 告 诉 我 ， 如 果 我 要 加 入 你 们 的 话 ， 应 该 怎 么 做 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //（ 感 到 惊 讶 ） 好 吧 ， 那 么 注 意 了 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //补 给 官 员 的 工 作 太 痛 苦 了 ， 让 我 告 诉 你 ， 整 理 所 有 这 些 箱 子 和 袋 子 的 工 作 糟 糕 透 了 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //但 是 每 次 当 我 在 卡 迪 夫 的 酒 馆 待 上 一 晚 的 时 候 ， 就 有 人 在 这 里 和 这 些 箱 子 打 交 道 ， 等 我 第 二 天 早 晨 回 来 之 后 ， 就 有 东 西 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //（ 生 气 ） 太 奇 怪 了 ， 圣 骑 士 什 么 都 看 不 到 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //（ 生 气 ） 我 快 发 疯 了 。 我 不 能 整 晚 都 像 个 傻 瓜 一 样 呆 在 这 里 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //你 ， 接 手 这 里 … …
	AI_Output(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //我 知 道 了 。 我 应 该 当 你 在 酒 馆 消 磨 时 光 的 时 候 留 在 这 里 监 视 。
	AI_Output(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //接 受 或 者 离 开 。

	B_LogEntry(TOPIC_Addon_RangerHelpMIL, TOPIC_Addon_RangerHelpMIL_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 2;
	condition		= DIA_Addon_Martin_Auftrag_Condition;
	information		= DIA_Addon_Martin_Auftrag_Info;
	description		= "我 今 晚 会 照 看 你 的 补 给 箱 。";
};

func int DIA_Addon_Martin_Auftrag_Condition()
{
	if ((RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //我 今 晚 会 照 看 你 的 补 给 箱 。
	AI_Output(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //（ 满 意 的 ） 好 极 了 。

	if (Wld_IsTime(23, 00, 04, 00))
	{
		AI_Output(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //那 我 就 去 卡 迪 夫 的 酒 吧 了 。 当 我 回 来 时 ， 如 果 丢 了 东 西 你 就 要 倒 霉 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //好 ， 那 今 晚 过 来 ， 然 后 看 管 这 里 的 东 西 。 而 那 个 时 候 ， 我 将 在 卡 迪 夫 的 酒 馆 里 。
	};

	B_StartOtherRoutine(MIL_321_Rangar, "PrePalCampKlau");

	Info_ClearChoices(DIA_Addon_Martin_Auftrag);
	Info_AddChoice(DIA_Addon_Martin_Auftrag, "（ 更 多 ）", DIA_Addon_Martin_Auftrag_weiter);
};

func void DIA_Addon_Martin_Auftrag_weiter()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	B_StartOtherRoutine(MIL_321_Rangar, "PalCampKlau");
};

// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_FromVatras_Condition;
	information		= DIA_Addon_Martin_FromVatras_Info;
	description		= "你 在 找 那 个 把 武 器 出 售 给 强 盗 的 人 ？";
};

func int DIA_Addon_Martin_FromVatras_Condition()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_FromVatras_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_FromVatras_15_00"); //你 在 找 那 个 把 武 器 出 售 给 强 盗 的 人 ？
	AI_Output(self, other, "DIA_Addon_Martin_FromVatras_07_01"); //说 谁 ？
	AI_Output(other, self, "DIA_Addon_Martin_FromVatras_15_02"); //说 说 瓦 卓 斯 。
	AI_Output(self, other, "DIA_Addon_Martin_FromVatras_07_03"); //哦 。 你 想 知 道 什 么 ？
	AI_Output(other, self, "DIA_Addon_Martin_FromVatras_15_04"); //不 多 ， 但 是 我 可 以 发 现 更 多 。
	AI_Output(self, other, "DIA_Addon_Martin_FromVatras_07_05"); //（ 投 合 人 心 ） 啊 ， 那 是 如 此 … …
};

///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_TellAll_Condition;
	information		= DIA_Addon_Martin_TellAll_Info;
	description		= "告 诉 你 ， 你 知 道 什 么 关 于 这 个 武 器 交 易 商 的 情 况 吗 ？";
};

func int DIA_Addon_Martin_TellAll_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_TellAll_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_TellAll_15_00"); //告 诉 你 ， 你 知 道 什 么 关 于 这 个 武 器 交 易 商 的 情 况 吗 ？
	AI_Output(self, other, "DIA_Addon_Martin_TellAll_07_01"); //听 着 。 我 们 知 道 一 定 是 某 个 在 富 人 区 很 有 影 响 的 人 在 背 后 主 使 。
	AI_Output(self, other, "DIA_Addon_Martin_TellAll_07_02"); //而 有 些 武 器 甚 至 可 能 是 民 兵 的 补 给 品 。
	AI_Output(self, other, "DIA_Addon_Martin_TellAll_07_03"); //但 是 我 们 还 不 知 道 究 竟 是 谁 在 指 使 。
	AI_Output(self, other, "DIA_Addon_Martin_TellAll_07_04"); //如 果 你 有 足 够 的 毅 力 去 解 决 五 个 以 上 的 盗 贼 小 组 ， 也 许 你 能 查 明 … …
	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_7);
};

///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_AboutBandits_Condition;
	information		= DIA_Addon_Martin_AboutBandits_Info;
	description		= "强 盗 怎 么 样 ？";
};

func int DIA_Addon_Martin_AboutBandits_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_AboutBandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //强 盗 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //我 们 知 道 现 在 强 盗 们 封 锁 了 农 场 到 城 市 之 间 的 路 。
	AI_Output(self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //此 外 ， 我 知 道 前 几 天 一 定 有 一 批 武 器 运 被 走 了 。
	AI_Output(self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //也 许 在 强 盗 那 里 能 找 到 一 些 线 索 揭 开 这 个 武 器 交 易 商 的 面 纱 。
	// AI_Output(self, other, "DIA_Addon_Martin_AboutBandits_07_04"); // Ich werd sehen, was ich tun kann

	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_8);
};

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 5;
	condition		= DIA_Addon_Martin_Fernando_Condition;
	information		= DIA_Addon_Martin_Fernando_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 武 器 供 应 商 … …";
};

func int DIA_Addon_Martin_Fernando_Condition()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_00"); //呃 ， 关 于 那 个 武 器 交 易 商 … …

	if ((Npc_HasItems(other, ItMw_Addon_BanditTrader))
	|| (Npc_HasItems(other, ItRi_Addon_BanditTrader))
	|| ((Npc_HasItems(other, ItWr_Addon_BanditTrader)) && (BanditTrader_Lieferung_Gelesen == TRUE))
	|| (Fernando_HatsZugegeben == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_01"); //让 我 看 看 你 知 道 什 么 。

		var int FernandoHints;
		FernandoHints = 0;

		if (
		(Npc_HasItems(other, ItMw_Addon_BanditTrader))
		|| (Npc_HasItems(other, ItRi_Addon_BanditTrader))
		|| ((Npc_HasItems(other, ItWr_Addon_BanditTrader)) && (BanditTrader_Lieferung_Gelesen == TRUE))
		)
		{
			if (Npc_HasItems(other, ItMw_Addon_BanditTrader))
			{
				AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_02"); //我 在 强 盗 身 上 找 到 了 这 把 轻 剑 。 柄 上 刻 着 字 母 ‘F’ 。
				FernandoHints = (FernandoHints + 1);
			};

			if (Npc_HasItems(other, ItRi_Addon_BanditTrader))
			{
				AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_03"); //强 盗 有 这 个 戒 指 。 它 指 出 了 一 个 海 外 商 人 。
				FernandoHints = (FernandoHints + 1);
			};

			if ((Npc_HasItems(other, ItWr_Addon_BanditTrader)) && (BanditTrader_Lieferung_Gelesen == TRUE))
			{
				AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_04"); //这 张 武 器 货 运 表 和 其 它 一 些 从 强 盗 身 上 发 现 的 东 西 上 有 明 显 签 字 - 费 尔 南 多 。
				FernandoHints = (FernandoHints + 3);
			};

			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_05"); //此 外 ， 费 尔 南 多 ， 来 自 富 人 区 的 老 商 人 ， 已 经 承 认 了 他 和 强 盗 有 交 易 。
				FernandoHints = (FernandoHints + 1);
			};
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_06"); //费 尔 南 多 已 经 承 认 了 他 向 强 盗 提 供 武 器 。
		};

		if (FernandoHints >= 3)
		{
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_07"); //我 想 那 已 经 足 够 了 。 费 尔 南 多 ， 那 么 ， 嗯 ， 他 将 罪 有 应 得 。
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_08"); //而 且 他 一 直 看 起 来 都 是 很 老 实 的 样 子 。
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_09"); //我 要 确 保 他 被 关 起 来 直 到 他 在 监 狱 里 日 渐 消 瘦 。
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_10"); //我 必 须 要 说 ， 听 起 来 不 错 。
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_11"); //瓦 卓 斯 听 到 这 个 好 消 息 一 定 会 高 兴 的 。
			B_StartOtherRoutine(Fernando, "Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_9);

			B_GivePlayerXP(XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_12"); //然 后 呢 ？ 还 有 其 它 的 吗 ？
			AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_13"); //那 就 够 了 。

			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_14"); //他 承 认 了 ， 这 很 好 ， 但 是 不 幸 的 是 ， 如 果 没 有 确 凿 证 据 的 话 ， 我 什 么 也 不 能 做 。
				AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_15"); //我 不 想 在 哈 根 勋 爵 面 前 闹 笑 话 。 你 必 须 给 我 找 到 更 多 的 证 据 。
			}
			else
			{
				AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_16"); //那 还 不 够 。 那 可 能 是 富 人 区 的 任 何 一 个 人 。
				AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_17"); //看 起 来 你 必 须 要 跟 踪 强 盗 的 踪 迹 和 进 一 步 的 武 器 货 运 ， 直 到 我 们 查 明 谁 是 幕 后 操 作 者 。
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_18"); //也 许 你 应 该 再 和 瓦 卓 斯 谈 谈 … …
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Martin_Fernando_15_19"); //再 说 一 下 怎 么 做 ？
		AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_20"); //听 着 。 你 应 该 查 明 是 谁 把 武 器 卖 给 强 盗 ， 并 给 我 带 来 证 据 。
		AI_Output(self, other, "DIA_Addon_Martin_Fernando_07_21"); //不 过 一 定 要 是 真 凭 实 据 的 罪 证 。 否 则 我 无 法 逮 捕 那 个 家 伙 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 90;
	condition		= DIA_Addon_Martin_Perm_Condition;
	information		= DIA_Addon_Martin_Perm_Info;
	permanent		= TRUE;
	description		= "所 有 的 货 箱 还 在 那 里 ？";
};

func int DIA_Addon_Martin_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_Perm_15_00"); //所 有 的 货 箱 还 在 那 里 ？

	if ((MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay() - 2))
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING))
	{
		AI_Output(self, other, "DIA_Addon_Martin_Perm_07_01"); //（ 生 气 ） 你 这 个 混 蛋 ， 你 本 应 该 给 我 守 住 箱 子 ， 而 现 在 又 有 东 西 丢 了 。

		if (Wld_IsTime(24, 00, 03, 00))
		{
			AI_Output(self, other, "DIA_Addon_Martin_Perm_07_02"); //（ 大 声 的 ） 直 接 去 港 口 的 给 养 仓 库 ， 并 把 那 个 偷 东 西 的 家 伙 给 我 抓 来 ， 明 白 了 吗 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Martin_Perm_07_03"); //还 有 ， 今 天 晚 上 在 我 走 了 以 后 要 更 加 留 神 ， 明 白 了 吗 ？
		};
	}
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Martin_Perm_07_04"); //来 吧 ， 嘲 笑 我 吧 。 你 整 天 站 在 码 头 上 ， 袖 手 旁 观 着 所 有 的 混 乱 。
		AI_Output(self, other, "DIA_Addon_Martin_Perm_07_05"); //圣 骑 士 拉 来 了 那 么 多 没 意 思 的 废 物 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Martin_Perm_07_06"); //什 么 都 不 要 碰 ， 不 然 我 就 叫 守 卫 ， 明 白 吗 ？
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 2;
	condition		= DIA_Addon_Martin_GotRangar_Condition;
	information		= DIA_Addon_Martin_GotRangar_Info;
	description		= "我 抓 住 了 那 个 贼 。";
};

func int DIA_Addon_Martin_GotRangar_Condition()
{
	if ((MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GotRangar_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //我 抓 住 了 那 个 贼 。
	AI_Output(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //是 兰 加 动 了 你 的 库 存 。
	AI_Output(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //好 ， 终 于 明 白 了 ， 至 少 现 在 我 知 道 了 应 该 留 意 谁 。 这 个 混 蛋 ， 如 果 我 抓 住 他 的话 ， 一 定不放过他 。
	AI_Output(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //我 一 直 奇 怪 为 什 么 没 有 一 个 圣 骑 士 发 现 任 何 情 况 。
	AI_Output(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //真 的 ？ 为 什 么 ？
	AI_Output(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //很 明 显 ， 那 些 白 痴 无 法 区 分 我 们 这 些 民 兵 。 对 他 们 来 说 ， 我 们 看 起 来 都 是 一 个 样 子 。
	AI_Output(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //干 的 很 好 ， 朋 友 。
	AI_Output(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //如 果 我 能 帮 你 的 话 ， 尽 管 说 话 。

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz(C_INFO)
{
	npc				= Mil_350_Addon_Martin;
	nr				= 2;
	condition		= DIA_Addon_Martin_GetMiliz_Condition;
	information		= DIA_Addon_Martin_GetMiliz_Info;
	description		= "你 知 道 我 想 从 你 那 里 了 解 什 么 。";
};

func int DIA_Addon_Martin_GetMiliz_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Martin_GotRangar))
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_GetMiliz_Info()
{
	AI_Output(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //你 知 道 我 想 从 你 那 里 了 解 什 么 。
	AI_Output(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //哦 ， 是 的 。 你 想 加 入 民 兵 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //你 已 经 向 我 证 明 了 你 的 能 力 。
	AI_Output(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //好 。 跳 过 这 一 点 不 说 ， 我 也 知 道 你 比 其 它 某 些 人 更 加 拥 护 我 们 。
	AI_Output(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //所 以 我 才 会 帮 助 你 。 拿 上 我 的 这 封 推 荐 信 ， 去 交 给 安 德 烈 - 我 们 的 圣 骑 士 指 挥 。
	CreateInvItems(self, ItWr_Martin_MilizEmpfehlung_Addon, 1);
	B_GiveInvItems(self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);
	AI_Output(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //你 可 以 在 兵 营 找 到 他 。 我 肯 定 他 会 用 你 的 。

	B_LogEntry(TOPIC_Addon_RangerHelpMIL, TOPIC_Addon_RangerHelpMIL_3);
};
