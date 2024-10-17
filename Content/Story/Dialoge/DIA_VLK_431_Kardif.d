///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_EXIT(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 999;
	condition		= DIA_Kardif_EXIT_Condition;
	information		= DIA_Kardif_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kardif_EXIT_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Kardif_PICKPOCKET(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 900;
	condition		= DIA_Kardif_PICKPOCKET_Condition;
	information		= DIA_Kardif_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Kardif_PICKPOCKET_Condition()
{
	C_Beklauen(55, 85);
};

func void DIA_Kardif_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
	Info_AddChoice(DIA_Kardif_PICKPOCKET, DIALOG_BACK, DIA_Kardif_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kardif_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Kardif_PICKPOCKET_DoIt);
};

func void DIA_Kardif_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

func void DIA_Kardif_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kardif_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hi(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_Hi_Condition;
	information		= DIA_Kardif_Hi_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Kardif_Hi_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hi_Info()
{
	AI_Output(other, self, "DIA_Kardif_Hi_15_00"); //最 近 怎 么 样 ？
	AI_Output(self, other, "DIA_Kardif_Hi_14_01"); //如 果 你 想 喝 点 什 么 ， 你 必 须 花 钱 去 买 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_4);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Hallo(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_Hallo_Condition;
	information		= DIA_Kardif_Hallo_Info;
	description		= "我 打 赌 你 一 定 无 意 中 听 到 了 很 多 事 情 … …";
};

func int DIA_Kardif_Hallo_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_Hi)
	&& (Kardif_Deal == 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Hallo_Info()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_15_00"); //我 打 赌 你 一 定 无 意 中 听 到 了 很 多 事 情 … …
	AI_Output(self, other, "DIA_Kardif_Hallo_14_01"); //那 么 ， 那 对 你 来 说 意 味 着 什 么 ？
	AI_Output(other, self, "DIA_Kardif_Hallo_15_02"); //我 一 贯 都 消 息 灵 通 。
	AI_Output(self, other, "DIA_Kardif_Hallo_14_03"); //那 么 ， 你 把 钱 包 打 开 了 吗 ？
	AI_Output(self, other, "DIA_Kardif_Hallo_14_04"); //我 每 告 诉 你 一 条 消 息 都 需 要 收 取 1 0 个 金 币 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_5);

	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, "我 最 多 给 你 ５ 个 金 币 来 买 你 的 信 息 。 ", DIA_Kardif_Hallo_Angebot);
	Info_AddChoice(DIA_Kardif_Hallo, "算 了 吧 - 我 从 别 的 地 方 找 信 息 。", DIA_Kardif_Hallo_Hart);
	Info_AddChoice(DIA_Kardif_Hallo, "好 吧 ， 成 交 。", DIA_Kardif_Hallo_Zehn);
};

func void DIA_Kardif_Hallo_Zehn()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Zehn_15_00"); //好 吧 ， 成 交 。
	AI_Output(self, other, "DIA_Kardif_Hallo_Zehn_14_01"); //你 做 成 了 一 笔 好 买 卖 了 （ 咧 着 嘴 笑 ） 。 我 随 时 为 你 效 劳 。

	Kardif_Deal = 10;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Angebot()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Angebot_15_00"); //我 最 多 用 5 个 金 币 买 你 的 消 息 。
	AI_Output(self, other, "DIA_Kardif_Hallo_Angebot_14_01"); //什 么 ，5个 金 币 ？ 你 想 要 我 破 产 ？ （ 短 暂 地 想 了 一 下 ） - 7 个 金 币 吧 。

	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, "不 ， 那 样 不 行 。 我 说 ６ 个 金 币！ ", DIA_Kardif_Hallo_KeinDeal);
	Info_AddChoice(DIA_Kardif_Hallo, "好 吧 ， ７ 金 币 听 起 来 很 公 平 。", DIA_Kardif_Hallo_Sieben);
};

func void DIA_Kardif_Hallo_Hart()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Hart_15_00"); //算 了 - 我 到 别 的 地 方 去 打 听 消 息 。
	AI_Output(self, other, "DIA_Kardif_Hallo_Hart_14_01"); //好 的 ， 好 吧 … … 我 就 降 到 7 个 吧 。

	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, "好 吧 ， ７ 金 币 听 起 来 很 公 平 。", DIA_Kardif_Hallo_Sieben);
	Info_AddChoice(DIA_Kardif_Hallo, "不 ， 我 不 是 那 么 需 要 你 的 信 息 。 ", DIA_Kardif_Hallo_Ablehnen);
};

func void DIA_Kardif_Hallo_Sieben()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Sieben_15_00"); //好 吧 ， ７ 金 币 听 起 来 很 公 平 。
	AI_Output(self, other, "DIA_Kardif_Hallo_Sieben_14_01"); //（ 咧 着 嘴 笑 ） 明 智 的 决 定 。 好 吧 ， 那 么 你 有 什 么 想 知 道 的 事 情 就 问 我 吧 。

	Kardif_Deal = 7;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_Ablehnen()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Ablehnen_15_00"); //不 ， 我 不 是 那 么 需 要 你 的 信 息 。
	AI_Output(self, other, "DIA_Kardif_Hallo_Ablehnen_14_01"); //嘿 ， 等 一 等 … … （ 叹 气 ） - 好 的 ，5 个 金 币 。 但 是 那 是 我 最 终 的 出 价 ！

	Info_ClearChoices(DIA_Kardif_Hallo);
	Info_AddChoice(DIA_Kardif_Hallo, "你 为 什 么 不 马 上 说 呢 ？ ", DIA_Kardif_Hallo_Fuenf);
};

func void DIA_Kardif_Hallo_Fuenf()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_Fuenf_15_00"); //你 为 什 么 不 马 上 说 呢 ？
	AI_Output(self, other, "DIA_Kardif_Hallo_Fuenf_14_01"); //哦 ， 我 真 的 亏 大 了 。 不 过 ， 无 论 如 何 - 这 是 个 交 易 。
	Kardif_Deal = 5;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

func void DIA_Kardif_Hallo_KeinDeal()
{
	AI_Output(other, self, "DIA_Kardif_Hallo_KeinDeal_15_00"); //不 ， 那 样 不 行 。 我 说 ６ 个 金 币 ！
	AI_Output(self, other, "DIA_Kardif_Hallo_KeinDeal_14_01"); //你 是 个 无 赖 ， 你 知 道 吗 ？ 好 吧 ， 如 果 你 坚 持 ， 就 6 个 金 币 交 换 一 个 消 息 吧 。
	Kardif_Deal = 6;
	Info_ClearChoices(DIA_Kardif_Hallo);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TRADE(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_TRADE_Condition;
	information		= DIA_Kardif_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "给 我 一 点 喝 的 。";
};

func int DIA_Kardif_TRADE_Condition()
{
	if (Kardif_OneQuestion == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Kardif_TRADE_15_00"); //给 我 一 点 喝 的 。
};

///////////////////////////////////////////////////////////////////////
//	Info
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_TradeInfo(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_TradeInfo_Condition;
	information		= DIA_Kardif_TradeInfo_Info;
	permanent		= TRUE;
	description		= "我 需 要 一 些 信 息 。";
};

func int DIA_Kardif_TradeInfo_Condition()
{
	if ((Kardif_OneQuestion == FALSE)
	&& (Kardif_Deal > 0))
	{
		return TRUE;
	};
};

func void DIA_Kardif_TradeInfo_Info()
{
	AI_Output(other, self, "DIA_Kardif_TradeInfo_15_00"); //我 需 要 一 些 信 息 。

	Kardif_OneQuestion = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
func void B_SayKardifZuwenigGold()
{
	AI_Output(self, other, "B_SayKardifZuwenigGold_14_00"); //等 你 有 足 够 的 钱 再 来 。
};
instance DIA_Kardif_Buerger(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Buerger_Condition;
	information		= DIA_Kardif_Buerger_Info;
	permanent		= TRUE;
	description		= "谁 是 这 个 镇 上 最 有 势 力 的 居 民 ？";
};

// -------------------------------------------
var int DIA_Kardif_Buerger_permanent;
// -------------------------------------------
func int DIA_Kardif_Buerger_Condition()
{
	if ((DIA_Kardif_Buerger_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Buerger_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Buerger_15_00"); //谁 是 这 个 镇 上 最 有 势 力 的 居 民 ？
		AI_Output(self, other, "DIA_Kardif_Buerger_14_01"); //你 在 码 头 这 里 找 不 到 别 的 人 了 。 这 里 唯 一 有 权 势 的 人 是 雷 玛 尔 。
		AI_Output(self, other, "DIA_Kardif_Buerger_14_02"); //这 个 放 高 利 贷 的 家 伙 不 是 很 受 欢 迎 ， 但 他 有 钱 ， 而 且 还 有 其 它 一 些 有 势 力 的 人 欠 了 他 的 钱 。
		AI_Output(self, other, "DIA_Kardif_Buerger_14_03"); //雇 佣 兵 和 工 匠 大 师 们 也 有 很 大 的 影 响 力 - 如 果 你 问 我 的 话 ， 太 大 了 。

		DIA_Kardif_Buerger_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

// *****************************************************
//						Lehmar
// *****************************************************
instance DIA_Kardif_Lehmar(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Lehmar_Condition;
	information		= DIA_Kardif_Lehmar_Info;
	permanent		= TRUE;
	description		= "谁 欠 雷 玛 尔 的 账 ？";
};

// -------------------------------------------
var int DIA_Kardif_Lehmar_permanent;
// -------------------------------------------
func int DIA_Kardif_Lehmar_Condition()
{
	if ((DIA_Kardif_Lehmar_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Buerger_permanent == TRUE)) // (Knows perm Info)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lehmar_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Add_15_00"); //谁 欠 雷 玛 尔 的 账 ？
		AI_Output(self, other, "DIA_Kardif_Add_14_01"); //（ 大 笑 ） 如 果 你 想 知 道 这 些 ， 你 应 该 看 看 他 的 账 册 。
		AI_Output(self, other, "DIA_Kardif_Add_14_02"); //要 让 他 察 觉 不 出 可 能 才 是 最 难 办 到 的 。
		AI_Output(self, other, "DIA_Kardif_Add_14_03"); //据 我 所 知 ， 他 时 刻 把 它 带 在 身 边 … …

		DIA_Kardif_Lehmar_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Arbeit(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Arbeit_Condition;
	information		= DIA_Kardif_Arbeit_Info;
	permanent		= TRUE;
	description		= "我 在 哪 里 能 找 到 工 作 ？";
};

// -------------------------------------------
var int DIA_Kardif_Arbeit_permanent;
// -------------------------------------------
func int DIA_Kardif_Arbeit_Condition()
{
	if ((DIA_Kardif_Arbeit_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Arbeit_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Arbeit_15_00"); //我 在 哪 里 能 找 到 工 作 ？
		AI_Output(self, other, "DIA_Kardif_Arbeit_14_01"); //看 来 你 在 港 口 是 找 不 到 什 么 工 作 的 。 你 必 须 去 城 里 的 贫 民 区 找 那 些 工 匠 大 师 们 解 决 这 个 问 题 。
		AI_Output(self, other, "DIA_Kardif_Arbeit_14_02"); //但 是 如 果 你 能 舞 动 一 把 像 样 的 剑 ， 你 可 以 去 仓 库 后 面 挑 战 艾 尔 里 克 。

		DIA_Kardif_Arbeit_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Kardif_MissingPeople(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Addon_Kardif_MissingPeople_Condition;
	information		= DIA_Addon_Kardif_MissingPeople_Info;
	permanent		= TRUE;
	description		= "关 于 失 踪 的 市 民 你 都 知 道 些 什 么 ？";
};

// -------------------------------------------
var int DIA_Addon_Kardif_MissingPeople_permanent;
// -------------------------------------------
func int DIA_Addon_Kardif_MissingPeople_Condition()
{
	if ((DIA_Addon_Kardif_MissingPeople_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Kardif_MissingPeople_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Addon_Kardif_MissingPeople_15_00"); //关 于 失 踪 的 市 民 你 都 知 道 些 什 么 ？
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_01"); //我 只 知 道 最 近 这 些 天 有 一 些 人 失 踪 了 。
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_02"); //他 们 说 ， 港 口 这 边 更 是 特 别 糟 糕 。 也 许 你 应 该 去 这 周 围 问 问 。
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_03"); //在 城 里 的 贫 民 区 也 发 生 了 一 些 事 件 。
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_04"); //如 果 你 想 知 道 更 多 的 事 ， 你 应 该 去 跟 科 拉 贡 谈 谈 。
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_05"); //他 的 酒 馆 在 城 里 的 贫 民 区 ， 而 他 好 像 听 说 了 一 些 事 情 。
		AI_Output(self, other, "DIA_Addon_Kardif_MissingPeople_14_06"); //哈 尔 沃 ， 码 头 下 面 的 鱼 商 ， 也 许 他 也 知 道 一 些 事 情 。 很 多 人 经 常 光 顾 他 那 里 。

		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_4);

		DIA_Addon_Kardif_MissingPeople_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Lernen(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Lernen_Condition;
	information		= DIA_Kardif_Lernen_Info;
	permanent		= TRUE;
	description		= "这 里 有 人 能 教 我 一 些 东 西 吗 ？";
};

// -------------------------------------------
var int DIA_Kardif_Lernen_permanent;
// -------------------------------------------
func int DIA_Kardif_Lernen_Condition()
{
	if ((DIA_Kardif_Lernen_permanent == FALSE)
	&& (Kardif_OneQuestion == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Lernen_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Lernen_15_00"); //这 里 有 人 能 教 我 一 些 东 西 吗 ？
		AI_Output(self, other, "DIA_Kardif_Lernen_14_01"); //港 口 区 这 里 也 有 几 个 能 人 。
		AI_Output(self, other, "DIA_Kardif_Lernen_14_02"); //铁 匠 卡 尔 是 个 毫 不 含 糊 的 家 伙 。 我 打 赌 他 能 指 导 你 怎 样 变 得 更 强 壮 。
		AI_Output(self, other, "DIA_Kardif_Lernen_14_03"); //艾 尔 里 克 知 道 很 多 关 于 搏 斗 方 面 的 技 能 。 还 有 莱 尔 瑞 兹 ， 他 是 个 狡 猾 的 无 赖 。 他 有 时 也 在 码 头 附 近 闲 逛 。
		AI_Output(self, other, "DIA_Kardif_Lernen_14_04"); //如 果 你 够 疯 狂 的 话 ， 就 去 见 伊 格 纳 兹 - 他 知 道 所 有 关 于 炼 金 药 剂 的 事 。
		AI_Output(other, self, "DIA_Kardif_Lernen_15_05"); //我 到 哪 里 能 找 到 所 有 这 些 人 ？
		AI_Output(self, other, "DIA_Kardif_Lernen_14_06"); //（ 叹 息 ） 孩 子 ， 我 还 没 给 你 解 释 完 这 些 的 时 候 ， 恐 怕 国 王 就 已 经 赢 得 抵 抗 兽 人 的 这 场 战 争 了 ！
		AI_Output(self, other, "DIA_Kardif_Lernen_14_07"); //只 要 在 港 口 区 随 便 看 看 ， 你 肯 定 就 能 找 到 他 们 。 还 有 ， 如 果 你 不 认 得 路 了 ， 就 去 找 布 拉 希 姆 给 自 己 买 张 地 图 。
		AI_Output(self, other, "DIA_Kardif_Lernen_14_08"); //他 很 好 找 。 他 的 小 屋 就 在 我 的 酒 馆 隔 壁 。 （ 咕 哝 着 ） 这 一 点 我 本 该 收 双 倍 的 钱 。

		Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);

		B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_3);
		Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_4);
		Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_5);
		Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_6);

		Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
		Log_AddEntry(Topic_CityTrader, Topic_CityTrader_6);

		DIA_Kardif_Lernen_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Diebeswerk_Condition;
	information		= DIA_Kardif_Diebeswerk_Info;
	permanent		= TRUE;
	description		= "有 什 么 ‘ 特 殊 ’ 工 作 可 做 吗 … … ？";
};

// -------------------------------------------
var int DIA_Kardif_Diebeswerk_permanent;
// -------------------------------------------
func int DIA_Kardif_Diebeswerk_Condition()
{
	if ((DIA_Kardif_Diebeswerk_permanent == FALSE)
	&& (DIA_Kardif_Arbeit_permanent == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	) // && (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Diebeswerk_15_00"); //这 周 围 有 什 么 ‘ 特 殊 的 ’ 工 作 可 以 让 我 的 钱 来 得 快 点 吗 ？
		AI_Output(self, other, "DIA_Kardif_Diebeswerk_14_01"); //你 是 说 一 些 特 别 的 事 情 ， 对 吗 ？ 嗯 … …
		AI_PlayAni(self, "T_SEARCH");
		AI_Output(self, other, "DIA_Kardif_Diebeswerk_14_02"); //… … 那 就 去 跟 纳 格 谈 谈 。 也 许 他 能 帮 你 。

		DIA_Kardif_Diebeswerk_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's Infos werden verkauft!
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Diebeswerk2(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Diebeswerk2_Condition;
	information		= DIA_Kardif_Diebeswerk2_Info;
	permanent		= TRUE;
	description		= "有 什 么 ‘ 特 殊 的 ’ 事 情 可 以 让 我 做 吗 ？";
};

// -------------------------------------------
var int DIA_Kardif_Diebeswerk2_permanent;
// -------------------------------------------
func int DIA_Kardif_Diebeswerk2_Condition()
{
	if ((DIA_Kardif_Diebeswerk2_permanent == FALSE)
	&& (DIA_Kardif_Diebeswerk_permanent == TRUE) // andere Info
	&& (DIA_Kardif_Arbeit_permanent == TRUE)
	&& (Kardif_OneQuestion == TRUE)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Diebeswerk2_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Diebeswerk2_15_00"); //有 什 么 ‘ 特 殊 的 ’ 事 情 可 以 让 我 做 吗 ？
		AI_Output(self, other, "DIA_Kardif_Diebeswerk2_14_01"); //我 有 一 些 事 可 以 交 给 你 做 - 但 是 你 必 须 是 个 多 才 多 艺 的 人 才 会 对 它 感 兴 趣 。
		AI_Output(other, self, "DIA_Kardif_Diebeswerk2_15_02"); //你 得 到 了 什 么 ？
		AI_Output(self, other, "DIA_Kardif_Diebeswerk2_14_03"); //嗯 ， 祖 里 斯 ， 市 场 里 的 药 剂 商 人 ， 他 现 在 有 一 位 客 人 - 火 魔 法 师 达 隆 。
		AI_Output(other, self, "DIA_Kardif_Diebeswerk2_15_04"); //然 后 ？
		AI_Output(self, other, "DIA_Kardif_Diebeswerk2_14_05"); //他 有 一 个 新 箱 子 ， 是 木 匠 托 尔 本 给 他 特 别 制 作 的 。
		AI_Output(self, other, "DIA_Kardif_Diebeswerk2_14_06"); //他 们 说 这 个 达 隆 带 着 一 大 堆 贵 重 物 品 。 但 是 ， 这 些 事 情 可 不 是 我 告 诉 你 的 ， 明 白 吗 ？

		DIA_Kardif_Diebeswerk2_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Kardif's ich will doch keine Info kaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zurueck(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_Zurueck_Condition;
	information		= DIA_Kardif_Zurueck_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};

func int DIA_Kardif_Zurueck_Condition()
{
	if (Kardif_OneQuestion == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zurueck_Info()
{
	Kardif_OneQuestion = FALSE;
	Info_ClearChoices(DIA_Kardif_Zurueck);
};

///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DOPE(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 5;
	condition		= DIA_Kardif_DOPE_Condition;
	information		= DIA_Kardif_DOPE_Info;
	permanent		= TRUE;
	description		= "我 在 这 边 哪 里 能 买 到 烟 草 ？";
};

var int DIA_Kardif_DOPE_perm;
func int DIA_Kardif_DOPE_Condition()
{
	if ((MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_DOPE_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DOPE_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	AI_Output(other, self, "DIA_Kardif_DOPE_15_01"); //我 在 这 边 哪 里 能 买 到 烟 草 ？

	if (Hlp_IsItem(heroArmor, ItAR_MIl_L) == TRUE)
	{
		AI_Output(self, other, "DIA_Kardif_DOPE_14_00"); //当 然 不 是 这 里 - 这 样 的 东 西 对 我 没 有 任 何 用 处 !
	}
	else
	{
		AI_Output(self, other, "DIA_Kardif_DOPE_14_02"); //当 然 不 是 这 里 。
		AI_Output(other, self, "DIA_Kardif_DOPE_15_03"); //好 的 ， 那 么 在 哪 里 ？
		AI_Output(self, other, "DIA_Kardif_DOPE_14_04"); //如 果 我 是 你 的 话 ， 我 会 去 跟 麦 尔 多 谈 谈 - 总 之 ， 他 整 天 抽 着 烟 。

		DIA_Kardif_DOPE_perm = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Paket(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 3;
	condition		= DIA_Kardif_Paket_Condition;
	information		= DIA_Kardif_Paket_Info;
	permanent		= TRUE;
	description		= "关 于 沼 生 草 的 包 裹 你 知 道 些 什 么 ？";
};

var int DIA_Kardif_Paket_perm;
func int DIA_Kardif_Paket_Condition()
{
	if ((MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Paket_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Paket_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Paket_15_00"); //关 于 沼 生 草 的 包 裹 你 知 道 些 什 么 ？
		AI_Output(self, other, "DIA_Kardif_Paket_14_01"); //无 论 是 谁 有 这 样 一 个 包 裹 ， 他 就 是 个 富 人 。 而 且 ， 也 许 同 样 是 个 非 常 悠 闲 的 人 ！
		AI_Output(other, self, "DIA_Kardif_Paket_15_02"); //别 试 图 愚 弄 我 。 你 知 道 一 些 事 。 那 就 说 出 来 吧 ！
		AI_Output(self, other, "DIA_Kardif_Paket_14_03"); //好 吧 ， 好 吧 - 这 个 家 伙 有 一 天 来 过 我 的 酒 馆 。 是 一 个 雇 佣 兵 。
		AI_Output(self, other, "DIA_Kardif_Paket_14_04"); //他 说 他 在 港 口 卖 掉 了 一 包 沼 生 草 ， 不 过 ， 他 当 时 完 全 醉 倒 了 。 我 就 知 道 这 么 多 了 。

		DIA_Kardif_Paket_perm = TRUE;

		B_LogEntry(TOPIC_WAREHOUSE, TOPIC_WAREHOUSE_2);
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SendAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_SENDATTILA(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_SENDATTILA_Condition;
	information		= DIA_Kardif_SENDATTILA_Info;
	important		= TRUE;
};

func int DIA_Kardif_SENDATTILA_Condition()
{
	if ((MIS_ThiefGuild_sucked == TRUE)
	|| (Diebesgilde_Okay >= 3)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kardif_SENDATTILA_Info()
{
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_00"); //嘿 ， 你 ， 来 这 边 。 我 有 一 些 事 情 对 你 说 。
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_01"); //这 里 有 一 个 家 伙 坚 持 要 跟 你 谈 谈 。
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_02"); //因 为 你 那 时 不 在 这 里 ， 他 告 诉 我 给 你 带 个 信 。
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_03"); //他 想 见 见 你 。 在 哈 尔 沃 的 鱼 店 后 面 。
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_04"); //这 个 消 息 是 免 费 的 - 但 是 ， 这 是 个 例 外 ， 孩 子 ！ 除 了 这 件 事 外 ， 别 的 都 得 花 钱 ！
	AI_Output(other, self, "DIA_Kardif_SENDATTILA_15_05"); //那 个 家 伙 长 的 什 么 样 子 ？
	AI_Output(self, other, "DIA_Kardif_SENDATTILA_14_06"); //我 可 以 告 诉 你 - 但 是 ， 你 必 须 付 钱 ， 我 的 朋 友 。 （ 咧 着 嘴 笑 ）

	if (Kardif_Deal == 0)
	{
		AI_Output(self, other, "DIA_Kardif_Hallo_14_04"); //我 每 告 诉 你 一 条 消 息 都 需 要 收 取 1 0 个 金 币 。
		Kardif_Deal = 10;
	};

	Wld_InsertNpc(VLK_494_Attila, "NW_CITY_ENTRANCE_01");
};

///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Kerl(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_Kerl_Condition;
	information		= DIA_Kardif_Kerl_Info;
	permanent		= TRUE;
	description		= "那 个 家 伙 长 的 什 么 样 子 ？";
};

// ----------------------------------
var int DIA_Kardif_Kerl_permanent;
// ----------------------------------
func int DIA_Kardif_Kerl_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kardif_SENDATTILA)
	&& (Attila.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kardif_OneQuestion == TRUE)
	&& (DIA_Kardif_Kerl_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kardif_Kerl_Info()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, Kardif_Deal))
	{
		AI_Output(other, self, "DIA_Kardif_Kerl_15_00"); //那 个 家 伙 长 的 什 么 样 子 ？
		AI_Output(self, other, "DIA_Kardif_Kerl_14_01"); //嗯 ， 非 常 高 、 皮 肤 黝 黑 而 且 很 结 实 - 不 过 没 穿 制 服 。 不 知 怎 么 … … 很 凶 恶 。
		AI_Output(other, self, "DIA_Kardif_Kerl_15_02"); //那 他 的 脸 呢 ？
		AI_Output(self, other, "DIA_Kardif_Kerl_14_03"); //他 的 脸 ？ 当 他 看 着 我 的 时 候 ， 我 很 庆 幸 他 不 是 冲 着 我 来 的 。
		AI_Output(self, other, "DIA_Kardif_Kerl_14_04"); //他 眼 中 有 种 让 人 畏 惧 的 东 西 - 总 之 ， 我 觉 得 你 该 去 见 他 。 这 肯 定 会 很 有 意 思 。
		AI_Output(other, self, "DIA_Kardif_Kerl_15_05"); //对 … … 问 题 是 ， 是 冲 谁 来 的 … …

		DIA_Kardif_Kerl_permanent = TRUE;
	}
	else
	{
		B_SayKardifZuwenigGold();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DefeatedAttila
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_DEFEATEDATTILA(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_DEFEATEDATTILA_Condition;
	information		= DIA_Kardif_DEFEATEDATTILA_Info;
	description		= "那 个 混 蛋 想 要 杀 了 我 ！";
};

func int DIA_Kardif_DEFEATEDATTILA_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Attila_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Kardif_DEFEATEDATTILA_Info()
{
	AI_Output(other, self, "DIA_Kardif_DEFEATEDATTILA_15_00"); //那 个 混 蛋 想 要 杀 了 我 ！
	AI_Output(self, other, "DIA_Kardif_DEFEATEDATTILA_14_01"); //嘿 ， 那 怎 么 会 是 我 的 过 错 呢 ？ 我 做 的 无 非 只 是 传 递 信 息 。
	AI_Output(self, other, "DIA_Kardif_DEFEATEDATTILA_14_02"); //如 果 有 人 想 要 来 得 罪 你 ， 我 猜 他 一 定 有 他 的 理 由 。

	B_GivePlayerXP(XP_Kardif_Blame4Attila);

	B_KillNpc(Attila);
	Npc_RemoveInvItem(Attila, ItMi_OldCoin);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Zeichen(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 2;
	condition		= DIA_Kardif_Zeichen_Condition;
	information		= DIA_Kardif_Zeichen_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Kardif_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Zeichen_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Kardif_Zeichen_14_00"); //哈 ， 你 跟 黑 帮 混 在 了 一 起 。 好 吧 。 既 然 这 样 ， 我 有 一 些 事 情 跟 你 说 。
	AI_Output(self, other, "DIA_Kardif_Zeichen_14_01"); //（ 平 静 地 ） 如 果 你 需 要 一 些 开 锁 工 具 ， 来 找 我 。 我 这 里 还 有 几 个 。 只 是 要 给 我 弄 一 些 东 西 来 喝 。

	CreateInvItems(self, ItKe_Lockpick, 20);
};

// ###########################
// ##
// ## Kapitel 5
// ##
// ###########################

///////////////////////////////////////////////////////////////////////
//	Info Crew
///////////////////////////////////////////////////////////////////////
instance DIA_Kardif_Crew(C_INFO)
{
	npc				= VLK_431_Kardif;
	nr				= 51;
	condition		= DIA_Kardif_Crew_Condition;
	information		= DIA_Kardif_Crew_Info;
	description		= "我 还 需 要 几 个 水 手 。";
};

func int DIA_Kardif_Crew_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kardif_Crew_Info()
{
	AI_Output(other, self, "DIA_Kardif_Crew_15_00"); //我 还 需 要 几 个 水 手 。
	AI_Output(self, other, "DIA_Kardif_Crew_14_01"); //糟 糕 的 日 子 ， 我 的 朋 友 。 你 在 克 霍 里 尼 斯 找 不 到 足 够 的 水 手 。 他 们 大 部 分 都 已 经 离 开 这 座 城 了 。
	AI_Output(self, other, "DIA_Kardif_Crew_14_02"); //但 是 ， 只 要 有 一 个 好 的 船 长 ， 要 在 短 时 间 内 找 几 个 聪 明 的 小 伙 子 组 成 一 支 像 样 的 水 手 队 伍 那 倒 不 是 什 么 太 难 的 事 。
	AI_Output(other, self, "DIA_Kardif_Crew_15_03"); //我 到 哪 里 能 找 到 一 个 船 长 ？
	AI_Output(self, other, "DIA_Kardif_Crew_14_04"); //你 问 错 了 人 。 我 只 开 酒 馆 。
	if (Npc_IsDead(Jack) == FALSE)
	{
		if (SCGoTCaptain == FALSE)
		{
			Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
			B_LogEntry(TOPIC_Captain, TOPIC_Captain_3);
		};

		AI_Output(self, other, "DIA_Kardif_Crew_14_05"); //去 跟 杰 克 谈 谈 。 从 我 懂 事 起 他 就 一 直 在 这 个 港 口 周 围 转 。 如 果 说 到 航 海 的 事 情 ， 他 就 是 你 要 找 的 人 。
	};
};
