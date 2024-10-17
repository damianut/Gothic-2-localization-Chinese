// *********************************************************
// 			  				EXIT
// *********************************************************
var int Vatras_SchickeLeuteWeg;
var int Vatras_LaresExit;
var int Vatras_MORE;

///////////////////////////////////////////////////////////////////////
//	Info KillerWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_KillerWarning(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_KillerWarning_Condition;
	information		= DIA_Addon_Vatras_KillerWarning_Info;
	important		= TRUE;
};

func int DIA_Addon_Vatras_KillerWarning_Condition()
{
	if ((Kapitel >= 5)
	&& (MadKillerCount >= 3)
	&& (MadKillerCount < 7)
	&& (VatrasPissedOffForever == FALSE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_KillerWarning_Info()
{
	AI_Output(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_00"); //在 克 霍 里 尼 斯 里 传 说 着 很 多 关 于 你 的 谣 言 。
	AI_Output(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_01"); //他 们 说 你 涉 嫌 谋 杀 无 辜 的 百 姓 。
	AI_Output(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_02"); //如 果 这 件 事 是 真 的 ， 我 就 得 警 告 你 ， 孩 子 。
	AI_Output(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_03"); //不 要 偏 离 这 个 世 界 的 平 衡 和 维 护 的 轨 道 ， 否 则 你 将 不 得 不 承 受 结 果 。
	AI_Output(self, other, "DIA_Addon_Vatras_KillerWarning_ADD_05_04"); //告 诉 我 。 我 能 怎 样 来 帮 助 你 ？
};

///////////////////////////////////////////////////////////////////////
//	Info LastWarning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_LastWarning(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_LastWarning_Condition;
	information		= DIA_Addon_Vatras_LastWarning_Info;
	important		= TRUE;
};

func int DIA_Addon_Vatras_LastWarning_Condition()
{
	if ((Kapitel >= 5)
	&& (MadKillerCount >= 7)
	&& (VatrasPissedOffForever == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_LastWarning_Info()
{
	B_LastWarningVatras();
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_06"); //你 有 什 么 要 辩 解 的 吗 ？

	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning, "吻 我 的 屁 股 。", DIA_Addon_Vatras_LastWarning_Arsch);
	Info_AddChoice(DIA_Addon_Vatras_LastWarning, "我 很 抱 歉 。 我 不 知 道 我 做 了 什 么 。", DIA_Addon_Vatras_LastWarning_Reue);
};

func void DIA_Addon_Vatras_LastWarning_Arsch()
{
	AI_Output(other, self, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00"); //滚 开 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00"); //你 的 话 里 没 有 悔 悟 的 意 思 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01"); //你 没 有 给 我 任 何 选 择 。
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	B_VatrasPissedOff();
};

func void DIA_Addon_Vatras_LastWarning_Reue()
{
	AI_Output(other, self, "DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00"); //我 很 抱 歉 。 我 不 知 道 我 做 了 什 么 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00"); //我 会 为 你 祈 祷 ， 希 望 你 能 恢 复 理 智 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01"); //如 果 我 再 听 到 你 参 与 了 另 一 起 谋 杀 案 ， 厄 运 将 会 降 临 到 你 身 上 。
	Info_ClearChoices(DIA_Addon_Vatras_LastWarning);
	VatrasMadKillerCount = MadKillerCount;
};

///////////////////////////////////////////////////////////////////////
//	Info PissedOf
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PissedOff(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_PissedOff_Condition;
	information		= DIA_Addon_Vatras_PissedOff_Info;
	important		= TRUE;
};

func int DIA_Addon_Vatras_PissedOff_Condition()
{
	if ((MadKillerCount > VatrasMadKillerCount)
	&& (Npc_KnowsInfo(other, DIA_Addon_Vatras_LastWarning))
	&& (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PissedOff_Info()
{
	AI_Output(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_00"); //你 的 话 跟 你 的 行 为 一 样 虚 伪 。
	AI_Output(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_01"); //你 就 是 不 会 停 止 你 那 些 毫 无 意 义 的 杀 戮 。
	AI_Output(self, other, "DIA_Addon_Vatras_PissedOff_ADD_05_02"); //你 没 有 给 我 任 何 选 择 。
	B_VatrasPissedOff();
};

// ----------------------------
instance DIA_Vatras_EXIT(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 999;
	condition		= DIA_Vatras_EXIT_Condition;
	information		= DIA_Vatras_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vatras_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_EXIT_Info()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Vatras_HowToJoin))
	&& (Vatras_LaresExit == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Vatras_LaresExit_05_00"); //等 等 ！
		if (Vatras_GehZuLares == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Vatras_LaresExit_05_01"); //如 果 你 看 到 莱 尔 瑞 兹 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Vatras_LaresExit_05_02"); //我 想 请 你 帮 我 一 个 小 忙 。
			AI_Output(self, other, "DIA_Addon_Vatras_LaresExit_05_03"); //去 港 口 那 里 。 你 会 发 现 那 里 有 一 个 叫 莱 尔 瑞 兹 的 人 。
			Vatras_GehZuLares = TRUE;
		};

		AI_Output(self, other, "DIA_Addon_Vatras_LaresExit_05_04"); //把 这 枚 装 饰 给 他 ， 告 诉 他 必 须 把 这 个 东 西 送 回 去 。 他 会 知 道 要 拿 它 干 什 么 。
		CreateInvItems(self, ItMi_Ornament_Addon_Vatras, 1);
		B_GiveInvItems(self, other, ItMi_Ornament_Addon_Vatras, 1);

		Vatras_LaresExit = TRUE;
	};

	AI_StopProcessInfos(self); Vatras_MORE = FALSE;

	if (Vatras_SchickeLeuteWeg == TRUE)
	{
		B_StartOtherRoutine(VLK_455_Buerger, "VATRASAWAY");
		B_StartOtherRoutine(VLK_454_Buerger, "VATRASAWAY");
		B_StartOtherRoutine(VLK_428_Buergerin, "VATRASAWAY");
		B_StartOtherRoutine(VLK_450_Buerger, "VATRASAWAY");
		B_StartOtherRoutine(VLK_426_Buergerin, "VATRASAWAY");
		B_StartOtherRoutine(VLK_421_Valentino, "VATRASAWAY");

		Vatras_SchickeLeuteWeg = FALSE;
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vatras_PICKPOCKET(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 900;
	condition		= DIA_Vatras_PICKPOCKET_Condition;
	information		= DIA_Vatras_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Vatras_PICKPOCKET_Condition()
{
	C_Beklauen(91, 250);
};

func void DIA_Vatras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
	Info_AddChoice(DIA_Vatras_PICKPOCKET, DIALOG_BACK, DIA_Vatras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vatras_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Vatras_PICKPOCKET_DoIt);
};

func void DIA_Vatras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

func void DIA_Vatras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vatras_PICKPOCKET);
};

// *********************************************************
// 			  				Hallo
// *********************************************************
instance DIA_Vatras_GREET(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Vatras_GREET_Condition;
	information		= DIA_Vatras_GREET_Info;
	important		= TRUE;
};

func int DIA_Vatras_GREET_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_GREET_Info()
{
	AI_Output(self, other, "DIA_Vatras_GREET_05_00"); //亚 达 诺 斯 与 你 同 在 。
	AI_Output(other, self, "DIA_Vatras_GREET_15_01"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Vatras_GREET_05_02"); //我 是 瓦 卓 斯 ， 亚 达 诺 斯 的 仆 人 ， 神 界 与 尘 世 间 平 衡 的 守 护 者 。
	AI_Output(self, other, "DIA_Vatras_GREET_05_03"); //我 能 为 你 做 什 么 ？
};

// *********************************************************
// 		  				Brief abgeben
// *********************************************************
instance DIA_Addon_Vatras_Cavalorn(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_Cavalorn_Condition;
	information		= DIA_Addon_Vatras_Cavalorn_Info;
	description		= "给 ， 我 有 一 封 给 你 的 信 。";
};

func int DIA_Addon_Vatras_Cavalorn_Condition()
{
	if ((
	(Npc_HasItems(other, ItWr_SaturasFirstMessage_Addon_Sealed) >= 1)
	&& (MIS_Addon_Cavalorn_Letter2Vatras == LOG_RUNNING)
	)
	|| (Npc_HasItems(other, ItWr_SaturasFirstMessage_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Cavalorn_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Cavalorn_15_00"); //给 ， 我 有 一 封 给 你 的 信 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_05_01"); //给 我 吗 ？

	if (SaturasFirstMessageOpened == FALSE)
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras);
		B_GiveInvItems(other, self, ItWr_SaturasFirstMessage_Addon_Sealed, 1);
	}
	else
	{
		B_GivePlayerXP(XP_Addon_Cavalorn_Letter2Vatras_Opened);
		B_GiveInvItems(other, self, ItWr_SaturasFirstMessage_Addon, 1);
		AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_05_02"); //是 的 ， 但 是 … … 它 已 经 被 打 开 过 了 。 我 希 望 它 没 有 落 入 歹 人 之 手 。
	};

	B_UseFakeScroll();

	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_05_03"); //确 实 。 你 给 我 带 来 的 是 一 个 非 常 重 要 的 消 息 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_05_04"); //我 想 知 道 你 是 怎 样 拿 到 这 封 信 的 。

	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
	Info_AddChoice(DIA_Addon_Vatras_Cavalorn, "我 从 强 盗 那 里 得 到 它 的 。", DIA_Addon_Vatras_Cavalorn_Bandit);

	if (MIS_Addon_Cavalorn_KillBrago == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Addon_Vatras_Cavalorn, "来 自 猎 人 卡 瓦 隆", DIA_Addon_Vatras_Cavalorn_Cavalorn);
	};

	MIS_Addon_Cavalorn_Letter2Vatras = LOG_SUCCESS;
};

func void DIA_Addon_Vatras_Cavalorn_Bandit()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Cavalorn_Bandit_15_00"); //我 从 强 盗 那 里 得 到 它 的 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_01"); //（ 担 忧 的 ） 以 亚 达 诺 斯 的 名 义 。 那 可 不 太 妙 。 那 可 一 点 都 不 妙 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_02"); //如 果 你 说 的 都 是 真 的 ， 我 们 就 遇 上 了 大 麻 烦 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_Bandit_05_03"); //我 不 得 不 尽 快 解 决 这 件 事 情 。
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

func void DIA_Addon_Vatras_Cavalorn_Cavalorn()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00"); //把 它 交 给 我 的 人 叫 做 卡 瓦 隆 ， 就 是 那 个 猎 人 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01"); //（ 感 到 惊 讶 的 ） 卡 瓦 隆 ？ 他 在 哪 里 ？
	AI_Output(other, self, "DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02"); //他 要 我 告 诉 你 他 没 有 成 功 ， 还 有 ， 他 往 集 合 地 点 去 了 。 他 说 的 是 什 么 意 思 。
	AI_Output(self, other, "DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03"); //我 看 你 已 经 得 到 了 卡 瓦 隆 的 信 任 。 那 对 你 很 有 利 。

	B_GivePlayerXP(XP_Addon_CavalornTrust);
	Info_ClearChoices(DIA_Addon_Vatras_Cavalorn);
};

// ************************************************************
// 		Cavalorn Sent Me
// ************************************************************
var int Vatras_Why;
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CavalornSentMe(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Addon_Vatras_CavalornSentMe_Condition;
	information		= DIA_Addon_Vatras_CavalornSentMe_Info;
	description		= "卡 瓦 隆 让 我 来 找 你 ！";
};

func int DIA_Addon_Vatras_CavalornSentMe_Condition()
{
	if ((SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Ring))
	&& (Vatras_Why == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CavalornSentMe_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Add_15_00"); //卡 瓦 隆 让 我 来 找 你 ！
	AI_Output(self, other, "DIA_Addon_Vatras_Add_05_01"); //（ 狡 猾 的 ） 那 么 ， 他 告 诉 了 你 一 些 什 么 ？
	AI_Output(other, self, "DIA_Addon_Vatras_Add_15_02"); //他 说 你 急 需 更 多 优 秀 的 人 。
	AI_Output(self, other, "DIA_Addon_Vatras_Add_05_03"); //（ 微 笑 ） 啊 哈 … … 那 么 说 你 想 加 入 我 们 ， 孩 子 ？
};

// ************************************************************
// 		Tell Me About RING (Trigger für MIS_Waffenhändler)
// ************************************************************
instance DIA_Addon_Vatras_TellMe(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Addon_Vatras_TellMe_Condition;
	information		= DIA_Addon_Vatras_TellMe_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 水 之 环 的 事 。";
};

func int DIA_Addon_Vatras_TellMe_Condition()
{
	if ((SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_TellMe_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_15_00"); //告 诉 我 关 于 水 之 环 的 事 。

	if (!Npc_KnowsInfo(other, DIA_Addon_Vatras_WannaBeRanger))
	{
		AI_Output(self, other, "DIA_Addon_Vatras_TellMe_05_01"); //（ 期 待 地 ） 我 为 什 么 要 那 么 做 ？
		Vatras_Why = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Vatras_TellMe_05_02"); //由 于 你 还 不 是 我 们 这 个 组 织 的 成 员 ， 当 然 ， 我 不 能 告 诉 你 一 切 。
		AI_Output(self, other, "DIA_Addon_Vatras_TellMe_05_03"); //但 是 ， 我 会 告 诉 你 我 可 以 说 的 事 情 。

		Info_ClearChoices(DIA_Addon_Vatras_TellMe);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, DIALOG_BACK, DIA_Addon_Vatras_TellMe_BACK);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, "你 究 竟 在 做 什 么 ？", DIA_Addon_Vatras_TellMe_Philo);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, "其 它 水 法 师 在 哪 里 ？", DIA_Addon_Vatras_TellMe_OtherKdW);
		Info_AddChoice(DIA_Addon_Vatras_TellMe, "那 么 谁 是 水 之 环 的 成 员 ？", DIA_Addon_Vatras_TellMe_WerNoch);
	};
};

func void DIA_Addon_Vatras_TellMe_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_TellMe);
};

func void DIA_Addon_Vatras_TellMe_Philo()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_Philo_15_00"); //你 究 竟 在 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Philo_05_01"); //我 们 立 足 英 诺 斯 的 秩 序 和 贝 利 尔 的 混 乱 之 间 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Philo_05_02"); //如 果 这 两 边 的 其 中 一 方 占 据 了 优 势 ， 将 意 味 着 要 么 完 全 失 去 自 由 ， 要 么 就 是 极 度 的 混 乱 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Philo_05_03"); //因 此 ， 我 们 在 这 两 者 之 间 守 护 着 平 衡 。 那 样 这 个 世 界 上 的 生 命 才 有 存 在 的 可 能 。

	if (MIS_Vatras_FindTheBanditTrader == 0)
	{
		Info_AddChoice(DIA_Addon_Vatras_TellMe, "那 么 ， 用 具 体 的 话 来 说 那 是 什 么 意 思 ？", DIA_Addon_Vatras_TellMe_Konkret);
	};
};

func void DIA_Addon_Vatras_TellMe_Konkret()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_Konkret_15_00"); //（ 皱 着 眉 头 ） 那 么 ， 用 具 体 的 话 来 说 那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_01"); //屏 障 的 倒 塌 引 发 了 无 数 的 恶 兆 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_02"); //那 些 强 盗 可 能 就 是 最 明 显 的 一 个 例 子 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_03"); //事 已 至 此 ， 要 在 岛 上 通 行 而 不 遭 到 袭 击 是 不 可 能 的 … …
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_04"); //… … 同 样 城 里 还 有 一 些 人 支 持 这 些 强 盗 ！
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Add_05_00"); //我 们 已 经 发 现 那 些 强 盗 会 定 期 收 到 克 霍 里 尼 斯 里 一 个 武 器 商 人 的 货 物 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_05"); //我 们 试 图 找 出 这 些 人 ， 并 防 止 他 们 危 及 到 这 座 城 市 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Konkret_05_06"); //如 果 你 能 发 现 关 于 这 件 事 的 任 何 消 息 ， 告 诉 我 一 声 。
	MIS_Vatras_FindTheBanditTrader = LOG_RUNNING;
	Vatras_ToMartin = TRUE;
	Log_CreateTopic(TOPIC_Addon_BanditTrader, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditTrader, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_2);
	Log_AddEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_3);
	Log_AddEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_12);
};

func void DIA_Addon_Vatras_TellMe_OtherKdW()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_OtherKdW_15_00"); //其 它 水 法 师 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_01"); //他 们 正 在 克 霍 里 尼 斯 的 东 北 部 地 区 探 索 一 个 古 代 文 明 遗 址 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_OtherKdW_05_02"); //我 们 怀 疑 那 些 废 墟 里 一 定 有 一 条 通 道 通 往 岛 屿 的 某 个 地 方 ， 而 那 个 地 方 还 没 被 标 明 在 地 图 上 。

	Log_CreateTopic(TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_9);

	Info_AddChoice(DIA_Addon_Vatras_TellMe, "告 诉 我 关 于 那 个 未 知 的 地 区 。", DIA_Addon_Vatras_TellMe_Unexplored);
};

func void DIA_Addon_Vatras_TellMe_Unexplored()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_00"); //告 诉 我 关 于 那 个 未 知 的 地 区 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_01"); //如 果 你 有 兴 趣 加 入 这 次 远 征 ， 我 可 以 写 封 信 派 你 去 萨 图 拉 斯 那 里 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_Unexplored_05_02"); //当 然 ， 只 有 当 你 成 为 我 们 的 人 之 后 ， 你 就 可 以 参 加 。
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_Unexplored_15_03"); //当 然 。
	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_10);
};

func void DIA_Addon_Vatras_TellMe_WerNoch()
{
	AI_Output(other, self, "DIA_Addon_Vatras_TellMe_WerNoch_15_00"); //那 么 谁 是 水 之 环 的 成 员 ？
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_01"); //在 你 加 入 这 个 ‘ 环 ’ 之 前 ， 我 不 能 告 诉 你 。
	AI_Output(self, other, "DIA_Addon_Vatras_TellMe_WerNoch_05_02"); //但 是 ， 到 那 个 时 候 ， 你 肯 定 已 经 遇 到 他 们 中 的 一 些 人 了 。
};

// *********************************************************
// 		  				Wanna JOIN (+ Ex-Segen)
// *********************************************************
instance DIA_Addon_Vatras_WannaBeRanger(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_WannaBeRanger_Condition;
	information		= DIA_Addon_Vatras_WannaBeRanger_Info;
	description		= "我 想 要 加 入 ‘ 水 之 环 ’ ！";
};

func int DIA_Addon_Vatras_WannaBeRanger_Condition()
{
	if (SC_KnowsRanger == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WannaBeRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_WannaBeRanger_15_00"); //我 想 要 加 入 ‘ 水 之 环 ’ ！

	if (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Ring))
	{
		AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_05_01"); //是 这 样 ？ 那 就 说 明 你 已 经 满 足 了 首 要 的 条 件 。
		AI_Output(other, self, "DIA_Addon_Vatras_WannaBeRanger_15_02"); //你 这 是 什 么 意 思 ？
		AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_05_03"); //我 的 意 思 是 我 们 中 间 一 定 有 一 些 相 信 你 的 人 。 否 则 ， 你 根 本 就 不 会 知 道 这 些 。
	};

	AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_05_04"); //但 是 ， 我 对 你 完 全 不 了 解 … …
	// AI_Output(self, other, "DIA_Vatras_INFLUENCE_05_03"); // Ich will dich wohl segnen, Fremder, aber ich kenne dich nicht. Erzähle mir was über dich.
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_15_04"); //你 想 知 道 什 么 ？
	AI_Output(self, other, "DIA_Vatras_INFLUENCE_05_05"); //好 吧 ， 你 可 以 告 诉 我 你 从 哪 里 来 ， 为 什 么 来 到 这 座 城 市 。
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_15_06"); //我 为 圣 骑 士 的 首 领 带 来 了 一 个 重 要 的 消 息 。
	AI_Output(self, other, "DIA_Vatras_INFLUENCE_05_07"); //是 什 么 消 息 ？

	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "龙 来 了 … …", DIA_Vatras_INFLUENCE_FIRST_TRUTH);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "恐 怖 的 事 情 就 要 发 生 了 。", DIA_Vatras_INFLUENCE_FIRST_LIE);
};

func void DIA_Vatras_INFLUENCE_FIRST_TRUTH()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00"); //在 我 们 谈 话 的 时 候 ， 一 支 庞 大 的 部 队 正 在 集 结 ， 它 们 由 一 群 龙 率 领 并 要 征 服 整 个 地 区 。

	if (Vatras_First == TRUE)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01"); //如 果 这 是 真 事 的 话 ， 这 片 大 地 的 平 衡 就 要 被 打 乱 了 。 是 谁 告 诉 你 这 件 事 的 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02"); //（ 考 虑 ） 一 群 龙 ？ 直 到 现 在 ， 你 说 的 这 些 生 物 只 有 传 说 中 才 提 及 过 。 你 怎 么 知 道 这 件 事 的 ？
	};

	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "哦 ， 我 在 某 个 地 方 听 到 的 谣 传 … …", DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "魔 法 师 艾 克 萨 达 斯 告 诉 我 的 … …", DIA_Vatras_INFLUENCE_SECOND_TRUTH);

	Vatras_First = TRUE;
};

func void DIA_Vatras_INFLUENCE_FIRST_LIE()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_FIRST_LIE_15_00"); //恐 怖 的 事 情 就 要 发 生 了 。

	if (Vatras_First == 2)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_01"); //（ 愤 怒 的 ） 啊 哈 。 那 么 ， 是 谁 告 诉 你 这 件 事 的 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_FIRST_LIE_05_02"); //可 怕 的 事 情 ， 嗯 … … 你 怎 么 知 道 这 件 事 的 ？
	};

	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "哦 ， 我 在 某 个 地 方 听 到 的 谣 传 … …", DIA_Vatras_INFLUENCE_SECOND_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "魔 法 师 艾 克 萨 达 斯 告 诉 我 的 … …", DIA_Vatras_INFLUENCE_SECOND_TRUTH);

	Vatras_First = 2;
};

func void DIA_Vatras_INFLUENCE_SECOND_TRUTH()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00"); //魔 法 师 艾 克 萨 达 斯 告 诉 我 的 。 他 派 我 来 警 告 那 些 圣 骑 士 。

	if (Vatras_Second == TRUE)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01"); //我 知 道 这 个 人 是 个 博 学 的 魔 法 大 师 。 那 么 ， 你 是 从 哪 里 来 的 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02"); //亡 灵 法 师 … … 那 么 ， 他 还 活 着 … … （ 思 考 ） 是 他 派 你 来 的 ？ 你 到 底 是 谁 ？
	};

	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "我 只 是 一 名 从 南 方 来 的 冒 险 者 … … ", DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "我 是 以 前 的 罪 犯 … … ", DIA_Vatras_INFLUENCE_THIRD_TRUTH);

	Vatras_Second = TRUE;
};

func void DIA_Vatras_INFLUENCE_SECOND_LIE()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_SECOND_LIE_15_00"); //哦 ， 我 在 某 个 地 方 听 到 的 谣 传 … …

	if (Vatras_Second == 2)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_01"); //（ 生 气 的 ） 至 少 你 该 记 得 你 是 从 哪 里 来 的 吧 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_SECOND_LIE_05_02"); //啊 哈 。 那 么 ， 那 就 是 你 此 行 的 目 的 。 你 到 底 是 谁 ？
	};

	Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "我 只 是 一 名 从 南 方 来 的 冒 险 者 … … ", DIA_Vatras_INFLUENCE_THIRD_LIE);
	Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "我 是 以 前 的 罪 犯 … … ", DIA_Vatras_INFLUENCE_THIRD_TRUTH);

	Vatras_Second = 2;
};

func void B_Vatras_INFLUENCE_REPEAT()
{
	// RAUS wegen ADDON
	// AI_Output(other, self, "DIA_Vatras_INFLUENCE_REPEAT_15_00"); // Und, gibst du mir jetzt deinen Segen?

	// AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_01"); // Gut, fassen wir mal zusammen:

	if (Vatras_Third == TRUE)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_02"); //你 从 前 是 个 囚 犯 ， … …
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_03"); //你 是 从 南 方 来 的 一 个 冒 险 家 … …
	};

	if (Vatras_Second == TRUE)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_04"); //… … 亡 灵 法 师 艾 克 萨 达 斯 告 诉 你 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_05"); //… … 你 听 说 了 一 些 传 言 … …
	};

	if (Vatras_First == TRUE)
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_06"); //… … 说 一 群 龙 已 经 来 征 服 这 个 国 家 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_07"); //… … 这 件 可 怕 的 事 情 就 要 发 生 了 。
	};

	AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_08"); //然 后 ， 你 就 来 向 圣 骑 士 报 告 这 件 事 … …
	if ((Vatras_First == TRUE)
	&& (Vatras_Second == TRUE)
	&& (Vatras_Third == TRUE))
	{
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_09"); //这 一 切 听 起 来 非 常 荒 谬 ， 但 是 ， 我 感 觉 不 到 你 在 对 我 说 谎 。
		AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_10"); //因 此 ， 我 必 须 承 认 你 的 动 机 是 值 得 尊 敬 的 。

		AI_Output(self, other, "DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11"); //我 给 你 一 个 机 会 加 入 水 之 环 。

		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_Add_05_00"); //我 觉 得 你 有 一 些 东 西 没 有 告 诉 我 。
		AI_Output(self, other, "DIA_Vatras_Add_05_01"); //如 果 你 担 心 我 可 能 会 把 你 告 诉 我 的 事 传 出 去 ， 那 就 让 我 来 消 除 你 的 疑 虑 。
		AI_Output(self, other, "DIA_Vatras_Add_05_02"); //我 发 誓 将 要 保 守 所 有 告 诉 我 的 秘 密 。
		if (Wld_IsTime(05, 05, 20, 10))
		{
			AI_Output(other, self, "DIA_Vatras_Add_15_03"); //那 么 ， 这 里 所 有 的 人 怎 么 样 了 ？
			AI_Output(self, other, "DIA_Vatras_Add_05_04"); //他 们 对 我 的 传 道 只 明 白 一 半 。 所 以 别 担 心 。
		};

		AI_Output(self, other, "DIA_Vatras_Add_05_05"); //我 们 从 头 说 起 。 那 是 什 么 消 息 ？

		// ADDON - SC kann nicht mehr versagen!
		// Vatras_Chance = TRUE;
		Info_ClearChoices(DIA_Addon_Vatras_WannaBeRanger);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "龙 来 了 … …", DIA_Vatras_INFLUENCE_FIRST_TRUTH);
		Info_AddChoice(DIA_Addon_Vatras_WannaBeRanger, "恐 怖 的 事 情 就 要 发 生 了 。", DIA_Vatras_INFLUENCE_FIRST_LIE);
	};

	// else-Fall raus - Addon
	// AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_13"); // Ich habe dir jetzt zweimal die Chance gegeben, mir die Wahrheit zu sagen - aber du willst es anscheinend nicht. Ich werde dir meinen Segen nicht geben.
};

func void DIA_Vatras_INFLUENCE_THIRD_TRUTH()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00"); //我 从 前 是 克 霍 里 尼 斯 罪 犯 流 放 地 的 一 个 囚 犯 。
	Vatras_Third = TRUE;

	B_Vatras_INFLUENCE_REPEAT();
};

func void DIA_Vatras_INFLUENCE_THIRD_LIE()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_THIRD_LIE_15_00"); //我 是 一 名 从 南 方 来 的 冒 险 者 … …
	Vatras_Third = FALSE;

	B_Vatras_INFLUENCE_REPEAT();
};

// ************************************************************
// 			  			How to JOIN
// ************************************************************
// ------------------------------------------------------------
// Was muß ich tun?
// ------------------------------------------------------------
instance DIA_Addon_Vatras_HowToJoin(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_HowToJoin_Condition;
	information		= DIA_Addon_Vatras_HowToJoin_Info;
	description		= "我 要 想 加 入 话 ， 必 须 要 怎 么 做 ？";
};

func int DIA_Addon_Vatras_HowToJoin_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Vatras_WannaBeRanger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_HowToJoin_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_HowToJoin_15_00"); //我 要 想 加 入 话 ， 必 须 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_05_01"); //需 要 知 道 你 加 入 ‘ 环 ’ 的 主 要 职 责 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_05_02"); //我 不 会 让 所 有 主 动 来 要 求 加 入 我 们 的 人 加 入 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_05_03"); //如 果 你 想 加 入 这 个 ‘ 环 ’ ， 你 就 必 须 证 明 你 的 行 为 像 我 们 的 人 。
	AI_Output(other, self, "DIA_Addon_Vatras_HowToJoin_15_04"); //那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_05_05"); //在 我 们 让 一 个 年 青 人 加 入 我 们 的 行 列 之 前 ， 他 必 须 为 这 个 ‘ 环 ’ 立 下 大 功 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_05_06"); //只 有 这 样 ， 我 才 会 开 始 考 虑 让 他 为 维 护 这 个 岛 上 的 力 量 平 衡 而 出 力 。

	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, "那 什 么 样 的 行 动 才 能 得 到 你 的 认 可 ？", DIA_Addon_Vatras_HowToJoin_WhatsGreat);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, "我 释 放 了 很 多 人 。 屏 障 已 经 消 失 了 。", DIA_Addon_Vatras_HowToJoin_FreedMen);
	Info_AddChoice(DIA_Addon_Vatras_HowToJoin, "我 已 经 击 败 了 沉 睡 者 。 那 还 不 是 一 个 足 够 大 的 功 劳 吗 ？", DIA_Addon_Vatras_HowToJoin_Sleeper);
};

func void DIA_Addon_Vatras_HowToJoin_Sleeper()
{
	AI_Output(other, self, "DIA_Addon_Vatras_HowToJoin_Sleeper_15_00"); //我 已 经 击 败 了 沉 睡 者 。 那 还 不 是 一 个 足 够 大 的 功 劳 吗 ？
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_01"); //这 些 天 ， 我 听 说 了 很 多 传 言 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_02"); //包 括 打 败 那 个 叫 做 沉 睡 者 的 野 兽 的 故 事 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_03"); //我 没 有 听 说 的 是 这 仅 仅 是 一 个 人 办 成 的 ， 虽 然 你 的 眼 睛 告 诉 ， 你 对 自 己 所 做 的 事 确 信 无 疑 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_Sleeper_05_04"); //这 让 我 有 点 糊 涂 了 ， 但 是 ， 有 时 我 不 能 确 定 我 的 感 觉 不 会 欺 骗 自 己 。
};

func void DIA_Addon_Vatras_HowToJoin_FreedMen()
{
	AI_Output(other, self, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00"); //我 释 放 了 很 多 人 。 屏 障 已 经 消 失 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01"); //即 使 你 真 的 能 说 那 是 你 的 功 劳 … …
	AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02"); //矿 藏 山 谷 里 那 件 大 事 不 仅 仅 是 解 放 了 水 法 师 和 那 些 正 直 的 市 民 。
	AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03"); //这 些 天 来 ， 全 国 各 地 的 罪 犯 都 充 斥 在 克 霍 里 尼 斯 这 里 ， 困 扰 着 所 有 的 人 。
	AI_Output(self, other, "DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04"); //那 些 强 盗 已 经 控 制 了 城 外 的 大 片 区 域 。 现 在 想 要 离 开 这 座 城 市 ， 然 后 再 平 安 归 来 是 不 可 能 的 了 。
};

func void DIA_Addon_Vatras_HowToJoin_WhatsGreat()
{
	AI_Output(other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00"); //那 什 么 样 的 行 动 才 能 让 你 认 可？
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01"); //最 近 这 些 天 ， 克 霍 里 尼 斯 正 面 临 着 一 个 巨 大 的 谜 团 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02"); //城 里 失 踪 人 口 的 数 字 几 乎 每 天 都 在 增 长 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03"); //如 果 你 能 对 我 解 释 他 们 发 生 了 什 么 事 ， 你 将 在 ‘ 水 之 环 ’ 拥 有 一 席 之 地 。

	Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RingOfWater, LogText_Addon_KDWRight);
	Log_AddEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_13);

	if (SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl);
	};

	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_RUNNING;
	SC_HearedAboutMissingPeople = TRUE;

	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04"); //无 论 如 何 … …
	AI_Output(other, self, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05"); //嗯 ？
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06"); //… … 你 应 该 先 把 这 个 消 息 告 诉 那 些 圣 骑 士 。
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07"); //我 认 为 这 件 事 极 其 重 要 ！
	AI_Output(self, other, "DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08"); //去 跟 哈 根 勋 爵 谈 谈 。

	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_14);

	Info_ClearChoices(DIA_Addon_Vatras_HowToJoin);
};

// ------------------------------------------------------------
// Hilf mir bei GILDE!
// ------------------------------------------------------------
instance DIA_Addon_Vatras_GuildBypass(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Addon_Vatras_GuildBypass_Condition;
	information		= DIA_Addon_Vatras_GuildBypass_Info;
	description		= "但 是 哈 根 勋 爵 不 准 备 见 我 ！";
};

func int DIA_Addon_Vatras_GuildBypass_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Vatras_HowToJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildBypass_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_GuildBypass_15_00"); //但 是 哈 根 勋 爵 不 准 备 见 我 ！
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_05_01"); //倘 若 你 先 成 为 一 个 势 力 庞 大 的 组 织 的 成 员 ，他 会 见 你 的。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_05_02"); //这 个 消 息 对 ‘ 环 ’ 来 说，有 重 大 的 联 系 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_05_03"); //我 们 将 协 助 你 尽 快 传 达 这 个 消 息 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_05_04"); //你 应 该 去 跟 莱 尔 瑞 兹 谈 谈 这 件 事 ， 我 信 任 他 。 他 会 帮 助 你 。

	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_15);

	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass, "我 愿 意 那 么 做 。", DIA_Addon_Vatras_GuildBypass_BACK);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass, "我 应 该 加 入 什 么 组 织 ？ ？", DIA_Addon_Vatras_GuildBypass_WhichGuild);
};

func void DIA_Addon_Vatras_GuildBypass_BACK()
{
	AI_Output(other, self, "DIA_Addon_Vatras_GuildBypass_BACK_15_00"); //我 愿 意 那 么 做 。
	Vatras_GehZuLares = TRUE;

	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
};

func void DIA_Addon_Vatras_GuildBypass_WhichGuild()
{
	AI_Output(other, self, "DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00"); //我 应 该 加 入 什 么 组 织 ？
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01"); //只 有 三 个 组 织 有 足 够 的 影 响 力 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02"); //它 们 是 ： 城 市 民 兵 、 火 魔 法 师 修 道 院 、 以 及 地 主 农 场 里 的 雇 佣 兵 部 队 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03"); //选 择 权 在 于 你 ， 孩 子 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04"); //莱 尔 瑞 兹 肯 定 能 协 助 你 作 出 这 个 艰 难 的 决 定 。 跟 他 谈 谈 这 件 事 。

	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_16);

	Info_ClearChoices(DIA_Addon_Vatras_GuildBypass);
	Info_AddChoice(DIA_Addon_Vatras_GuildBypass, "我 愿 意 那 么 做 。", DIA_Addon_Vatras_GuildBypass_BACK);
};

// ------------------------------------------------------------
// Ranger NOW (MissingPeople ist hier schon Succes!!!)
// ------------------------------------------------------------
instance DIA_Addon_Vatras_NowRanger(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_NowRanger_Condition;
	information		= DIA_Addon_Vatras_NowRanger_Info;
	permanent		= TRUE;
	description		= "我 准 备 加 入 水 之 环 ！";
};

func int DIA_Addon_Vatras_NowRanger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Vatras_HowToJoin))
	&& (SC_IsRanger == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_NowRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_NowRanger_15_00"); //我 准 备 加 入 水 之 环 ！
	AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_01"); //那 么 ， 你 把 消 息 传 达 给 了 哈 根 勋 爵 ？

	if (Kapitel >= 2) // Pass-Schlüssel von Hagen
	{
		AI_Output(other, self, "DIA_Addon_Vatras_NowRanger_15_02"); //是 的。
		if (MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other, self, "DIA_Addon_Vatras_NowRanger_15_03"); //但 是 ， 他 派 了 我 去 矿 藏 山 谷 ， 那 样 我 就 可 以 找 到 证 据 向 他 证 明 我 的 话 ！
			AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_04"); //你 必 须 决 定 下 一 步 想 怎 么 做 。
			AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_05"); //对 我 来 说 ， 最 重 要 的 是 他 应 该 得 知 这 个 消 息 。 现 在 由 他 来 选 择 是 行 动 ， 还 是 等 待 你 的 证 据 。
			AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_06"); //至 于 你 所 提 到 的 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_07"); //好 的。
		};

		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_08"); //你 已 经 证 明 了 你 对 我 们 是 必 不 可 少 的 了 。 你 可 以 成 为 我 们 追 随 者 中 的 一 员 ， 并 以 我 们 的 名 义 出 去 执 行 亚 达 诺 斯 的 命 令 。
		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_09"); //我 把 这 个 水 之 环 蓝 宝 石 戒 指 交 托 给 你 。 愿 它 能 帮 助 你 找 到 我 们 的 同 盟 ， 并 跟 他 们 一 起 维 持 这 个 世 界 的 平 衡 。
		CreateInvItems(self, ItRi_Ranger_Addon, 1);
		B_GiveInvItems(self, other, ItRi_Ranger_Addon, 1);
		if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_10"); //你 是 我 们 追 随 者 中 的 第 一 个 火 魔 法 师 。 对 此 我 感 到 特 别 高 兴 。
		};

		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_11"); //愿 亚 达 诺 斯 保 佑 你 。 那 么 ， 现 在 去 见 见 你 的 兄 弟 们 吧 。
		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_12"); //他 们 会 在 ‘ 死 亡 女 妖’ 客 栈 等 你 ， 接 受 你 加 入 我 们 的 组 织 。
		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_13"); //你 也 许 知 道 那 个 客 栈 。 它 就 在 去 往 欧 纳 尔 的 农 场 的 路 上 。
		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_14"); //别 忘 了 戴 上 你 的 戒 指 ， 那 么 ， 你 的 兄 弟 们 就 会 认 出 你 是 自 己 人 。

		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_17);

		SC_IsRanger = TRUE;
		Lares_CanBringScToPlaces = TRUE;
		MIS_Addon_Lares_ComeToRangerMeeting = LOG_RUNNING;
		B_GivePlayerXP(XP_Addon_SC_IsRanger);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Vatras_NowRanger_15_15"); //不 。 还 没 有 。
		AI_Output(self, other, "DIA_Addon_Vatras_NowRanger_05_16"); //那 就 快 点 。 去 他 那 里 。 我 想 你 的 消 息 非 常 重 要 ！
	};
};

// ------------------------------------------------------------
// NACH RangerMeeting
// ------------------------------------------------------------
instance DIA_Addon_Vatras_CloseMeeting(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_CloseMeeting_Condition;
	information		= DIA_Addon_Vatras_CloseMeeting_Info;
	description		= "‘ 环 ’ 里 的 兄 弟 让 我 来 找 你 。";
};

func int DIA_Addon_Vatras_CloseMeeting_Condition()
{
	if (Lares_TakeFirstMissionFromVatras == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_CloseMeeting_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_CloseMeeting_15_00"); //‘ 环 ’ 里 的 兄 弟 让 我 来 找 你 。
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_01"); //很 好 ！ 我 一 直 在 等 你 ！
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_02"); //我 会 让 你 和 其 它 水 法 师 一 起 穿 过 传 送 门 。
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_03"); //你 要 去 追 查 以 前 的 矿 石 大 亨 瑞 雯 ， 找 到 他 绑 架 克 霍 里 尼 斯 的 市 民 的 原 因 。
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_04"); //我 们 会 在 这 里 继 续 努 力 对 付 那 些 强 盗 带 来 的 威 胁 。
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_05"); //把 这 封 信 交 给 萨 图 拉 斯 。 从 现 在 起 ， 他 会 给 你 安 排 任 务 。
	if (MIS_Addon_Lares_Ornament2Saturas != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_08"); //莱 尔 瑞 兹 如 果 还 没 有 把 装 饰 物 交 出 去 的 话 ， 将 会 求 助 于 你 。
	};

	CreateInvItems(self, ItWr_Vatras2Saturas_FindRaven, 1);
	B_GiveInvItems(self, other, ItWr_Vatras2Saturas_FindRaven, 1);
	AI_Output(self, other, "DIA_Addon_Vatras_CloseMeeting_05_06"); //愿 亚 达 诺 斯 指 引 你 。

	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_11);

	Log_CreateTopic(TOPIC_Addon_Sklaven, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Sklaven, TOPIC_Addon_Sklaven_2);

	RangerMeetingRunning = LOG_SUCCESS; // Joly:Muss hier stehen!Sonst Chaos mit Rangern! -> Meeting
	B_SchlussMitRangerMeeting();
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  			Missing People
// ************************************************************
// ------------------------------------------------------------
// MissingPeople PERM
// ------------------------------------------------------------
var int MISSINGPEOPLEINFO[20];
// ------------------------------------------------------------
instance DIA_Addon_Vatras_MissingPeople(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_MissingPeople_Condition;
	information		= DIA_Addon_Vatras_MissingPeople_Info;
	permanent		= TRUE;
	description		= "关 于 失 踪 的 人 … …";
};

func int DIA_Addon_Vatras_MissingPeople_Condition()
{
	if (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

var int DIA_Addon_Vatras_MissingPeople_Wo_NoPerm;
func void DIA_Addon_Vatras_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_15_00"); //关 于 那 些 失 踪 的 人 们 … …
	AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_05_01"); //嗯 ？

	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
	Info_AddChoice(DIA_Addon_Vatras_MissingPeople, DIALOG_BACK, DIA_Addon_Vatras_MissingPeople_BACK);
	if (SCKnowsMissingPeopleAreInAddonWorld == TRUE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, "我 知 道 他 们 在 哪 里 ！", DIA_Addon_Vatras_MissingPeople_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, "让 我 告 诉 你 我 知 道 的 事 吧 … …", DIA_Addon_Vatras_MissingPeople_Report);
	};

	if (DIA_Addon_Vatras_MissingPeople_Wo_NoPerm == FALSE)
	{
		Info_AddChoice(DIA_Addon_Vatras_MissingPeople, "我 应 该 从 哪 里 开 始 寻 找 他 们 ？", DIA_Addon_Vatras_MissingPeople_Wo);
	};
};

func void DIA_Addon_Vatras_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_MissingPeople);
};

func void DIA_Addon_Vatras_MissingPeople_Wo()
{
	AI_Output(other, self, "DIA_Addon_Vatras_HintMissingPeople_Wo_15_00"); //我 应 该 从 哪 里 开 始 寻 找 他 们 ？
	AI_Output(self, other, "DIA_Addon_Vatras_HintMissingPeople_Wo_05_01"); //大 部 分 人 是 在 港 口 附 近 失 踪 的 。 你 也 许 应 该 从 那 里 开 始 搜 索 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_7);

	DIA_Addon_Vatras_MissingPeople_Wo_NoPerm = TRUE;
};

func void DIA_Addon_Vatras_MissingPeople_Report()
{
	var int Vatras_MissingPeopleReports;
	Vatras_MissingPeopleReports = 0;
	AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_00"); //让 我 告 诉 你 我 所 知 道 的 事 … …

	if (((MIS_Akil_BringMissPeopleBack != 0)
	|| (MIS_Bengar_BringMissPeopleBack != 0))
	&& (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_01"); //那 些 农 民 们 也 有 一 些 人 失 踪 了 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[1] = TRUE;
	};

	if (((Elvrich_GoesBack2Thorben == TRUE)
	|| (Elvrich_SCKnowsPirats == TRUE)
	|| (SC_KnowsDexterAsKidnapper == TRUE))
	&& (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_02"); //我 发 现 那 些 强 盗 对 这 里 的 失 踪 事 件 负 有 责 任 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[2] = TRUE;
	};

	if ((Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_03"); //艾 尔 弗 里 奇 ， 托 尔 本 大 师 的 学 徒 ， 他 告 诉 我 那 些 强 盗 是 通 过 海 路 把 被 拐 骗 的 人 带 离 克 霍 里 尼 斯 的 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[3] = TRUE;
	};

	if ((Elvrich_SCKnowsPirats == TRUE)
	&& (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_04"); //不 知 怎 么 ， 还 有 一 些 海 盗 跟 这 件 事 有 关 。 我 还 想 不 出 他 们 在 这 中 间 扮 演 的 是 什 么 角 色 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[4] = TRUE;
	};

	if ((Elvrich_GoesBack2Thorben == TRUE)
	&& (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_05"); //我 从 强 盗 那 里 救 出 了 艾 尔 弗 里 奇 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[5] = TRUE;
	};

	if ((SC_KnowsLuciaCaughtByBandits == TRUE)
	&& (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_06"); //那 些 强 盗 抓 住 了 一 个 名 叫 露 西 亚 的 女 孩 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[6] = TRUE;
	};

	if (((Npc_HasItems(other, ItWr_LuciasLoveLetter_Addon))
	|| (MIS_LuciasLetter == LOG_SUCCESS))
	&& (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_07"); //露 西 亚 被 强 盗 绑 架 后 决 定 加 入 他 们 的 行 列 。
		if (MIS_LuciasLetter == LOG_SUCCESS)
		{
			AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_08"); //这 看 来 绝 对 不 是 出 于 她 自 己 的 正 常 意 愿 。
		};

		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[7] = TRUE;
	};

	if ((SC_KnowsDexterAsKidnapper == TRUE)
	&& (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_09"); //强 盗 的 头 目 名 叫 德 克 斯 特 。 他 负 责 绑 架 市 民 。
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_10"); //我 在 罪 犯 流 放 地 的 时 候 认 识 了 德 克 斯 特 。 他 那 时 为 矿 石 大 亨 高 梅 兹 工 作 。
		AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_11"); //他 肯 定 会 记 得 你 。 你 应 该 小 心 点 。
		Vatras_MissingPeopleReports = (Vatras_MissingPeopleReports + 1);
		MISSINGPEOPLEINFO[8] = TRUE;
	};

	if (Vatras_MissingPeopleReports != 0)
	{
		AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_12"); //我 认 为 你 的 思 路 是 对 的 。 坚 持 下 去 。
		var int XP_Vatras_MissingPeopleReports;
		XP_Vatras_MissingPeopleReports = (XP_Addon_Vatras_MissingPeopleReport * Vatras_MissingPeopleReports);
		B_GivePlayerXP(XP_Vatras_MissingPeopleReports);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Report_05_13"); //你 已 经 发 现 什 么 了 吗 ？
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Report_15_14"); //到 目 前 为 止 还 没 什 么 重 要 的 事 。
	};
};

func void DIA_Addon_Vatras_MissingPeople_Success()
{
	AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_00"); //我 知 道 失 踪 的 人 在 哪 里 。
	AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_01"); //你 已 经 发 现 什 么 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_02"); //一 个 叫 瑞 雯 的 人 把 他 们 拖 到 了 克 霍 里 尼 斯 的 一 个 偏 远 地 区 。
	AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_03"); //你 怎 么 如 此 肯 定 ？
	AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_04"); //我 看 到 了 他 的 命 令 。 他 联 络 了 当 地 的 强 盗 来 为 他 工 作 。
	if (Npc_HasItems(other, ItWr_RavensKidnapperMission_Addon))
	{
		AI_Output(other, self, "DIA_Addon_Vatras_MissingPeople_Success_15_05"); //给 。
		B_UseFakeScroll();
	};

	AI_Output(self, other, "DIA_Addon_Vatras_MissingPeople_Success_05_06"); //很 好 。 你 做 了 一 件 伟 大 的 工 作 。 我 曾 经 担 心 我 们 可 能 会 永 远 找 不 到 答 案 。
	MIS_Addon_Vatras_WhereAreMissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Vatras_WhereAreMissingPeople);
};

// ------------------------------------------------------------
// Gefangene befreit
// ------------------------------------------------------------
instance DIA_Addon_Vatras_Free(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_Free_Condition;
	information		= DIA_Addon_Vatras_Free_Info;
	description		= "失 踪 的 人 回 来 了 ！";
};

func int DIA_Addon_Vatras_Free_Condition()
{
	if (MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Free_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Free_15_00"); //失 踪 的 人 都 已 经 回 去 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_Free_05_01"); //是 的 ， 你 成 功 了 。 他 们 的 旅 程 有 了 一 个 好 结 局 。
	AI_Output(self, other, "DIA_Addon_Vatras_Free_05_02"); //但 是 ， 你 自 己 的 旅 程 还 要 继 续 下 去 。 那 么 ， 愿 亚 达 诺 斯 的 祝 福 与 你 同 行 。
	AI_Output(self, other, "DIA_Addon_Vatras_Free_05_03"); //（ 祈 祷 ） 亚 达 诺 斯 ， 祝 福 这 个 人 。 照 亮 他 的 路 途 ， 赐 予 他 力 量 抵 挡 所 有 的 危 险 。

	B_RaiseAttribute(other, ATR_MANA_MAX, 3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];

	Snd_Play("Levelup");

	// ***Mike** Auskommentiert, weil FALSCHE funktion - bitte Rücksprache, bevor du's wieder änderst
	// var string concatText;
	// concatText = ConcatStrings(NAME_Bonus_ManaMax,IntToString(4));
	// PrintScreen(concatText, -1,-1,FONT_ScreenSmall,2);
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_Waffen(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_Waffen_Condition;
	information		= DIA_Addon_Vatras_Waffen_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 武 器 供 应 商 … …";
};

func int DIA_Addon_Vatras_Waffen_Condition()
{
	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Waffen_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_15_00"); //关 于 这 个 武 器 供 应 商 … …

	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
	Info_AddChoice(DIA_Addon_Vatras_Waffen, DIALOG_BACK, DIA_Addon_Vatras_Waffen_BACK);
	if ((Fernando_ImKnast == TRUE)
	|| (Fernando_HatsZugegeben == TRUE))
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen, "我 知 道 那 个 卖 武 器 给 强 盗 的 商 人 ！", DIA_Addon_Vatras_Waffen_Success);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Vatras_Waffen, "到 目 前 为 止 ， 关 于 那 个 武 器 供 应 商 你 了 解 到 了 什 么 ？", DIA_Addon_Vatras_Waffen_ToMartin);
	};
};

func void DIA_Addon_Vatras_Waffen_BACK()
{
	Info_ClearChoices(DIA_Addon_Vatras_Waffen);
};

func void DIA_Addon_Vatras_Waffen_ToMartin()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_ToMartin_15_00"); //关 于 这 个 武 器 商 人 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_01"); //去 问 问 马 丁 这 件 事 情 ， 他 是 圣 骑 士 的 供 应 品 主 管 。 他 应 该 能 告 诉 你 更 多 事 情 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_02"); //他 被 任 命 去 调 查 那 个 武 器 商 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_ToMartin_05_03"); //你 能 在 港 口 区 找 到 马 丁 。 如 果 你 看 到 了 一 堆 箱 子 、 供 应 品 和 圣 骑 士 ， 马 丁 就 不 会 太 远 了 。

	Vatras_ToMartin = TRUE;
};

func void DIA_Addon_Vatras_Waffen_Success()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_Success_15_00"); //我 知 道 那 个 卖 武 器 给 强 盗 的 商 人 ！
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_Success_15_01"); //他 的 名 字 叫 费 尔 南 多 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_Success_05_02"); //很 好 。 马 丁 已 经 采 取 必 要 的 行 动 来 阻 止 他 继 续 发 货 吗 ？
	if (Fernando_ImKnast == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Vatras_Waffen_Success_15_03"); //是 的 。 马 丁 很 快 就 要 让 他 永 远 无 法 离 开 地 牢 了 。
		AI_Output(self, other, "DIA_Addon_Vatras_Waffen_Success_05_04"); //干 的 漂 亮 ， 孩 子 。

		if ((Npc_KnowsInfo(other, DIA_ADDON_Vatras_WannaBeRanger))
		&& (SC_IsRanger == FALSE))
		{
			AI_Output(other, self, "DIA_Addon_Vatras_Waffen_Success_15_05"); //（ 厚 着 脸 皮 ） 这 意 味 着 你 现 在 会 让 我 加 入 ‘ 水 之 环 ’ 吗 ？
			AI_Output(self, other, "DIA_Addon_Vatras_Waffen_Success_05_06"); //（ 微 笑 ） 这 不 是 我 们 商 量 好 的 条 件 - 而 你 是 知 道 的 。
		};

		AI_Output(self, other, "DIA_Addon_Vatras_Waffen_Success_05_07"); //愿 亚 达 诺 斯 照 亮 你 的 路 途 。

		MIS_Vatras_FindTheBanditTrader = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_Vatras_FindTheBanditTrader);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Vatras_CaughtFernando_15_09"); //还 不 行 。
		AI_Output(self, other, "DIA_Addon_Vatras_CaughtFernando_05_10"); //那 么 ， 快 点 行 动 ， 马 上 给 他 报 告 。 一 定 要 立 刻 阻 止 它 。
	};
};

// ************************************************************
// 			  				Waffenhändler
// ************************************************************
instance DIA_Addon_Vatras_WISP(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_WISP_Condition;
	information		= DIA_Addon_Vatras_WISP_Info;
	description		= "有 什 么 有 助 于 我 搜 索 东 西 吗 ？";
};

func int DIA_Addon_Vatras_WISP_Condition()
{
	if (MIS_Vatras_FindTheBanditTrader != 0)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_WISP_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_WISP_15_00"); //有 什 么 有 助 于 我 搜 索 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_01"); //你 非 常 顽 固 ， 年 青 人 。 但 是 ， 我 确 实 能 想 到 一 些 事 情 来 让 你 的 工 作 更 容 易 一 些 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_02"); //我 会 给 你 这 个 矿 石 护 身 符 。 你 肯 定 能 用 上 它 。
	CreateInvItems(self, ItAm_Addon_WispDetector, 1);
	B_GiveInvItems(self, other, ItAm_Addon_WispDetector, 1);
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_03"); //这 是 一 个 磷 火 搜 索 护 身 符。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_04"); //世 上 总 共 只 有 几 个 。 这 个 护 身 符 里 面 存 在 的 磷 火 有 着 非 常 特 殊 的 能 力 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_05"); //它 能 帮 助 你 找 到 通 常 用 肉 眼 发 现 不 了 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_06"); //你 只 要 戴 上 这 个 护 身 符 就 能 召 唤 它 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_07"); //如 果 它 的 失 去 了 能 力 或 者 你 找 不 到 它 了 ， 只 要 重 新 戴 上 这 个 护 身 符 ， 它 又 会 再 出 现 。

	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_4);
	Log_CreateTopic(TOPIC_WispDetector, LOG_NOTE);
	Log_AddEntry(TOPIC_WispDetector, LogText_Addon_WispLearned);
	Log_AddEntry(TOPIC_WispDetector, LogText_Addon_WispLearned_NF);

	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_08"); //磷 火 能 探 测 到 武 器 。

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_09"); //它 会 对 你 调 查 给 强 盗 运 送 武 器 的 事 件 非 常 有 帮 助 。
	};

	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_WISP_05_10"); //好 好 对 待 它 ， 它 不 会 辜 负 你 。

	Info_ClearChoices(DIA_Addon_Vatras_WISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP, "谢 谢 你 ！ 我 会 照 顾 好 它 的 。", DIA_Addon_Vatras_WISP_Thanks);
	Info_AddChoice(DIA_Addon_Vatras_WISP, "磷 火 还 能 做 其 它 事 吗 ？", DIA_Addon_Vatras_WISP_MoreWISP);
	Info_AddChoice(DIA_Addon_Vatras_WISP, "在 护 身 符 里 面 的 磷 火 ？", DIA_Addon_Vatras_WISP_Amulett);
	SC_GotWisp = TRUE;
};

func void DIA_Addon_Vatras_WISP_Thanks()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_Thanks_15_00"); //谢 谢 你 ！ 我 会 照 顾 好 它 的 。
	Info_ClearChoices(DIA_Addon_Vatras_WISP);
};

func void DIA_Addon_Vatras_WISP_MoreWISP()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Waffen_MoreWISP_15_00"); //磷 火 还 能 做 其 它 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_01"); //寻 找 近 战 武 器 以 外 的 东 西 ？ 除 非 你 教 它 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_02"); //我 认 为 瑞 奥 淀 知 道 怎 么 教 这 些 。 他 是 我 们 的 人 ， 目 前 正 在 跟 萨 图 拉 斯 一 起 旅 行 。
	AI_Output(self, other, "DIA_Addon_Vatras_Waffen_MoreWISP_05_03"); //也 许 他 能 告 诉 你 更 多 事 情 。

	if (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING)
	{
		B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_5);
	};
};

func void DIA_Addon_Vatras_WISP_Amulett()
{
	AI_Output(other, self, "DIA_Addon_Vatras_WISPDETECTOR_was_15_00"); //在 护 身 符 里 面 的 磷 火 ？
	AI_Output(self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_01"); //磷 火 是 一 种 绝 妙 的 东 西 。 它 们 由 纯 魔 法 能 量 组 成 。
	AI_Output(self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_02"); //它 们 受 到 这 个 世 上 的 魔 法 矿 石 的 限 制 。 那 是 它 们 的 起 源 。 那 给 予 它 们 力 量 。
	AI_Output(self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_03"); //你 从 来 没 听 说 过 它 们 ， 我 一 点 也 不 奇 怪 。 它 们 只 会 显 露 在 那 个 戴 着 那 块 包 含 它 们 的 矿 石 的 人 面 前 。
	AI_Output(self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_04"); //住 在 野 外 的 磷 火 已 经 成 功 地 脱 离 它 们 的 根 源 。 它 们 会 攻 击 任 何 接 近 它 们 的 人 。
	AI_Output(self, other, "DIA_Addon_Vatras_WISPDETECTOR_was_05_05"); //没 有 任 何 办 法 能 帮 助 那 些 可 怜 的 东 西 。 你 最 好 离 它 们 远 一 点 。
};

// ********************************************************
// 			  			  STONEPLATES
// *********************************************************
// ---------------------------------------------------------
// About Stoneplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_Stoneplate(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_Stoneplate_Condition;
	information		= DIA_Addon_Vatras_Stoneplate_Info;
	description		= "我 找 到 了 这 个 石 片 … …";
};

func int DIA_Addon_Vatras_Stoneplate_Condition()
{
	if ((C_ScHasMagicStonePlate() == TRUE)
	&& (Npc_HasItems(other, ItWr_StonePlateCommon_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_Stoneplate_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_Stoneplate_15_00"); //我 得 到 了 这 块 石 片 。 你 能 不 能 告 诉 我 更 多 关 于 它 的 事 ？
	AI_Output(self, other, "DIA_Addon_Vatras_Stoneplate_05_01"); //那 些 都 是 古 代 文 明 的 人 工 制 品 ， 我 们 已 经 研 究 它 们 很 久 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_Stoneplate_05_02"); //它 们 分 成 很 多 种 。 有 一 些 包 含 有 古 代 人 的 历 史 信 息 。
	AI_Output(self, other, "DIA_Addon_Vatras_Stoneplate_05_03"); //那 是 我 感 兴 趣 的 一 类 。 给 我 所 有 你 能 找 到 的 这 种 东 西 。
	AI_Output(self, other, "DIA_Addon_Vatras_Stoneplate_05_04"); //我 会 给 你 适 当 的 报 酬 。

	Log_CreateTopic(TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Stoneplates, LogText_Addon_VatrasTrade);

	Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, LogText_Addon_VatrasTrade);
};

// ---------------------------------------------------------
// Sell Stonplate
// ---------------------------------------------------------
instance DIA_Addon_Vatras_SellStonplate(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_SellStonplate_Condition;
	information		= DIA_Addon_Vatras_SellStonplate_Info;
	permanent		= TRUE;
	description		= "我 还 有 更 多 的 石 片 给 你 … …";
};

func int DIA_Addon_Vatras_SellStonplate_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Vatras_Stoneplate))
	&& (Npc_HasItems(other, ItWr_StonePlateCommon_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_SellStonplate_Info()
{
	var int anzahl; anzahl = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);

	if (anzahl == 1)
	{
		AI_Output(other, self, "DIA_Addon_Vatras_SellStonplate_15_00"); //我 又 给 你 找 到 了 另 一 块 石 片 … …
	}
	else
	{
		// Fixme Joly --> Hier SC-output "Hier.." oder ähnliche --Mike
	};

	B_GiveInvItems(other, self, ItWr_StonePlateCommon_Addon, anzahl);

	AI_Output(self, other, "DIA_Addon_Vatras_SellStonplate_05_01"); //棒 极 了 ！

	if (anzahl >= 10)
	{
		AI_Output(self, other, "DIA_Addon_Vatras_SellStonplate_05_02"); //我 会 增 加 你 的 魔 法 能 力 ！
		B_RaiseAttribute(other, ATR_MANA_MAX, anzahl);
		Npc_ChangeAttribute(other, ATR_MANA, anzahl);
	}
	else if (anzahl >= 5)
	{
		AI_Output(self, other, "DIA_Addon_Vatras_SellStonplate_05_04"); //给 ， 拿 上 这 几 个 魔 法 卷 轴 作 为 奖 励 … …
		B_GiveInvItems(self, other, ItSc_InstantFireball, anzahl);
	}
	else // 1-4 Plates --> 2-5 Tränke
	{
		AI_Output(self, other, "DIA_Addon_Vatras_SellStonplate_05_03"); //给 ， 拿 上 这 几 个 药 剂 作 为 奖 励 … …
		B_GiveInvItems(self, other, ItPo_Health_03, anzahl + 1);
	};

	B_GivePlayerXP(XP_Addon_VatrasStonplate * anzahl);
};

// *********************************************************
// 			  			KLOSTER BYPASS
// *********************************************************
var int Vatras_SentToDaron;
// -----------------------------
instance DIA_Addon_Vatras_GuildHelp(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 5;
	condition		= DIA_Addon_Vatras_GuildHelp_Condition;
	information		= DIA_Addon_Vatras_GuildHelp_Info;
	description		= "莱 尔 瑞 兹 说 你 可 以 帮 助 我 进 入 火 魔 法 师 的 修 道 院 。";
};

func int DIA_Addon_Vatras_GuildHelp_Condition()
{
	if (RangerHelp_gildeKDF == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_GuildHelp_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_GuildHelp_15_00"); //莱 尔 瑞 兹 说 你 可 以 帮 助 我 进 入 火 魔 法 师 的 修 道 院 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_01"); //这 是 你 的 选 择 吗 ？ 火 焰 之 路 ？
	AI_Output(other, self, "DIA_Addon_Vatras_GuildHelp_15_02"); //是 的 。 我 想 成 为 一 名 火 魔 法 师 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_03"); //据 我 所 知 ， 他 们 很 乐 意 接 收 新 信 徒 进 修 道 院 。 那 么 ， 你 为 什 么 需 要 我 的 帮 助 ？

	if (SC_KnowsKlosterTribut == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Vatras_GuildHelp_15_04"); //修 道 院 前 面 的 新 信 徒 想 要 我 交 出 一 些 礼 物 才 能 进 入 ， 一 只 羊 和 一 笔 钱 。
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Vatras_GuildHelp_15_05"); //莱 尔 瑞 兹 提 到 他 们 在 让 任 何 人 进 入 修 道 院 前 都 要 一 份 礼 品 。
	};

	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_06"); //我 本 人 无 法 批 准 你 进 入 修 道 院 。 你 知 道 ， 我 是 个 水 法 师 。 但 是 ， 我 跟 火 魔 法 师 达 隆 非 常 熟 悉 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_07"); //他 大 部 分 时 间 都 在 市 场 上 ， 为 他 的 教 堂 筹 集 善 款 。
	Vatras_SentToDaron = TRUE;
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_08"); //不 过 ， 我 听 说 他 去 城 里 不 仅 仅 是 为 了 筹 款 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_09"); //他 告 诉 过 我 关 于 他 被 盗 的 一 个 小 雕 像 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_10"); //雕 像 对 他 非 常 重 要 。 如 果 你 能 帮 他 拿 回 那 个 雕 像 ， 他 肯 定 会 允 许 你 进 入 修 道 院 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_11"); //当 然 ， 如 果 你 决 定 要 加 入 火 魔 法 师， 你 也 可 以 成 为 这 个 ‘ 环 ’ 的 成 员 。
	AI_Output(self, other, "DIA_Addon_Vatras_GuildHelp_05_12"); //如 果 你 证 明 了 自 己 的 价 值 ， 那 就 行 了 。
	MIS_Addon_Vatras_Go2Daron = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, TOPIC_Addon_RangerHelpKDF_3);
};

// ************************************************************
// *** ***
//							Gothic II
// *** ***
// ************************************************************

// ============================================================
// MORE (Wegen der alten Scheiße...)
// ============================================================
instance DIA_Vatras_MORE(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 998;
	condition		= DIA_Vatras_MORE_Condition;
	information		= DIA_Vatras_MORE_Info;
	permanent		= TRUE;
	description		= "（ 更 多 ）";
};

func int DIA_Vatras_MORE_Condition()
{
	if (Vatras_MORE == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_MORE_Info()
{
	Vatras_MORE = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info INFLUENCE (SEGEN)
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INFLUENCE(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 92;
	condition		= DIA_Vatras_INFLUENCE_Condition;
	information		= DIA_Vatras_INFLUENCE_Info;
	description		= "我 在 请 求 你 的 祝 福 。";
};

func int DIA_Vatras_INFLUENCE_Condition()
{
	if ((MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	// --------------------
	&& (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INFLUENCE_Info()
{
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_15_00"); //我 在 请 求 你 的 祝 福 。
	AI_Output(self, other, "DIA_Vatras_INFLUENCE_05_01"); //我 为 什 么 要 给 你 我 的 祝 福 ， 陌 生 人 ？
	AI_Output(other, self, "DIA_Vatras_INFLUENCE_15_02"); //我 想 开 始 跟 城 里 贫 民 区 的 一 位 大 师 当 学 徒 。
	AI_Output(self, other, "DIA_Vatras_INFLUENCE_REPEAT_05_11"); //亚 达 诺 斯 的 祝 福 与 你 同 在 ， 我 的 孩 子 ！
	Snd_Play("LevelUp");
	B_GivePlayerXP(XP_VatrasTruth);
	Vatras_Segen = TRUE;
	B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WoKdF
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_WoKdF(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 93;
	condition		= DIA_Vatras_WoKdF_Condition;
	information		= DIA_Vatras_WoKdF_Info;
	description		= "我 在 哪 里 能 找 到 英 诺 斯 的 牧 师 ？";
};

func int DIA_Vatras_WoKdF_Condition()
{
	if ((MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Vatras_Segen == TRUE)
	&& (Vatras_SentToDaron == FALSE)
	// --------------------
	&& (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_WoKdF_Info()
{
	AI_Output(other, self, "DIA_Vatras_WoKdF_15_00"); //我 在 哪 里 能 找 到 英 诺 斯 的 牧 师 ？
	AI_Output(self, other, "DIA_Vatras_WoKdF_05_01"); //最 好 是 到 市 场 里 随 便 看 看 。 你 会 在 那 里 找 到 一 个 修 道 院 的 使 者 。
};

///////////////////////////////////////////////////////////////////////
//	Info Spende
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Spende(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 94;
	condition		= DIA_Vatras_Spende_Condition;
	information		= DIA_Vatras_Spende_Info;
	permanent		= TRUE;
	description		= "我 要 向 亚 达 诺 斯 捐 赠 ！";
};

func int DIA_Vatras_Spende_Condition()
{
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_Spende_Info()
{
	AI_Output(other, self, "DIA_Vatras_Spende_15_00"); //我 要 向 亚 达 诺 斯 捐 赠 ！
	AI_Output(self, other, "DIA_Vatras_Spende_05_01"); //给 亚 达 诺 斯 的 教 堂 的 一 小 笔 捐 款 将 会 减 轻 你 应 该 承 担 的 一 些 罪 ， 我 的 孩 子 。
	AI_Output(self, other, "DIA_Vatras_Spende_05_02"); //你 能 给 多 少 呢 ？

	Info_ClearChoices(DIA_Vatras_Spende);
	Info_AddChoice(DIA_Vatras_Spende, "我 现 在 还 没 有 任 何 东 西 可 供 分 享 … …", DIA_Vatras_Spende_BACK);
	if (Npc_HasItems(other, itmi_gold) >= 50)
	{
		Info_AddChoice(DIA_Vatras_Spende, "我 有 ５ ０ 金 币 。", DIA_Vatras_Spende_50);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice(DIA_Vatras_Spende, "我 有 １ ０ ０ 金 币 。", DIA_Vatras_Spende_100);
	};
};

func void DIA_Vatras_Spende_BACK()
{
	AI_Output(other, self, "DIA_Vatras_Spende_BACK_15_00"); //我 现 在 还 没 有 任 何 东 西 可 供 分 享 … …
	AI_Output(self, other, "DIA_Vatras_Spende_BACK_05_01"); //这 不 是 个 问 题 ， 你 以 后 可 以 按 照 自 己 的 良 好 意 愿 行 事 ， 我 的 孩 子 。
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_50()
{
	AI_Output(other, self, "DIA_Vatras_Spende_50_15_00"); //我 有 ５ ０ 金 币 … …
	AI_Output(self, other, "DIA_Vatras_Spende_50_05_01"); //我 以 亚 达 诺 斯 的 名 义 感 谢 你 ， 我 的 孩 子 。 你 的 钱 将 会 分 发 给 穷 人 们 。
	B_GiveInvItems(other, self, Itmi_Gold, 50);
	Info_ClearChoices(DIA_Vatras_Spende);
};

func void DIA_Vatras_Spende_100()
{
	AI_Output(other, self, "DIA_Vatras_Spende_100_15_00"); //我 有 １ ０ ０ 金 币 … …
	AI_Output(self, other, "DIA_Vatras_Spende_100_05_01"); //我 以 亚 达 诺 斯 的 名 义 祝 福 你 ， 感 谢 你 这 一 慷 慨 的 行 为 ！
	Snd_Play("LevelUp");
	AI_Output(self, other, "DIA_Vatras_Spende_100_05_02"); //愿 你 的 道 路 得 到 亚 达 诺 斯 的 祝 福 ！
	B_GiveInvItems(other, self, ITmi_Gold, 100);
	Vatras_Segen = TRUE;
	Info_ClearChoices(DIA_Vatras_Spende);
	if (MIS_Thorben_GetBlessings == LOG_RUNNING)
	{
		B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_CanTeach(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 95;
	condition		= DIA_Vatras_CanTeach_Condition;
	information		= DIA_Vatras_CanTeach_Info;
	description		= "你 能 教 我 一 些 关 于 魔 法 的 知 识 吗 ？";
};

func int DIA_Vatras_CanTeach_Condition()
{
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Vatras_CanTeach_15_00"); //你 能 教 我 一 些 关 于 魔 法 的 知 识 吗 ？
	AI_Output(self, other, "DIA_Vatras_CanTeach_05_01"); //只 有 英 诺 斯 的 特 选 子 民 和 亚 达 诺 斯 的 特 选 子 民 才 能 使 用 魔 法 咒 语 。
	AI_Output(self, other, "DIA_Vatras_CanTeach_05_02"); //不 过 ， 普 通 人 也 能 通 过 魔 法 卷 轴 来 使 用 魔 法 。
	AI_Output(self, other, "DIA_Vatras_CanTeach_05_03"); //我 可 以 告 诉 你 怎 样 引 导 和 扩 大 自 己 的 魔 法 能 力 。

	Vatras_TeachMANA = TRUE;
	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_19);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_Teach(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 100;
	condition		= DIA_Vatras_Teach_Condition;
	information		= DIA_Vatras_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 加 我 的 魔 法 能 力 。";
};

func int DIA_Vatras_Teach_Condition()
{
	if ((Vatras_TeachMANA == TRUE)
	// --------------------
	&& (Vatras_MORE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_Teach_Info()
{
	AI_Output(other, self, "DIA_Vatras_Teach_15_00"); //我 想 要 增 加 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_Vatras_Teach);
	Info_AddChoice(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self, other, "DIA_Vatras_Teach_05_00"); //你 的 魔 法 能 力 已 经 很 高 了 ， 我 没 有 能 力 教 你 。
	};

	Info_ClearChoices(DIA_Vatras_TEACH);
};

func void DIA_Vatras_Teach_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_HIGH);

	Info_ClearChoices(DIA_Vatras_Teach);

	Info_AddChoice(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_TEACH_BACK);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Vatras_Teach_5);
};

func void DIA_Vatras_Teach_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_HIGH);

	Info_ClearChoices(DIA_Vatras_Teach);

	Info_AddChoice(DIA_Vatras_Teach, DIALOG_BACK, DIA_Vatras_Teach_BACK);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Vatras_Teach_1);
	Info_AddChoice(DIA_Vatras_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Vatras_Teach_5);
};

///////////////////////////////////////////////////////////////////////
//	Info GODS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_GODS(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 98; // Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition		= DIA_Vatras_GODS_Condition;
	information		= DIA_Vatras_GODS_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 神 的 事";
};

func int DIA_Vatras_GODS_Condition()
{
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_GODS_Info()
{
	AI_Output(other, self, "DIA_Vatras_GODS_15_00"); //告 诉 我 关 于 神 的 事 。
	AI_Output(self, other, "DIA_Vatras_GODS_05_01"); //你 到 底 想 知 道 些 什 么 ？

	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS, DIALOG_BACK, DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, "告 诉 我 关 于 英 诺 斯 的 事", DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 亚 达 诺 斯", DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 贝 利 尔", DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BACK()
{
	Info_ClearChoices(DIA_Vatras_GODS);
};

func void DIA_Vatras_GODS_INNOS()
{
	AI_Output(other, self, "DIA_Vatras_GODS_INNOS_15_00"); //告 诉 我 关 于 英 诺 斯 的 事 。
	AI_Output(self, other, "DIA_Vatras_GODS_INNOS_05_01"); //非 常 好 。 （ 宣 扬 ） 英 诺 斯 是 第 一 位 的 最 高 的 神 。 他 创 造 了 太 阳 和 这 个 世 界 。
	AI_Output(self, other, "DIA_Vatras_GODS_INNOS_05_02"); //他 把 光 与 火 作 为 礼 物 赐 给 了 人 类 。 他 是 法 律 和 正 义 。
	AI_Output(self, other, "DIA_Vatras_GODS_INNOS_05_03"); //他 的 牧 师 是 火 魔 法 师 ， 那 些 圣 骑 士 是 他 的 勇 士 。

	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS, DIALOG_BACK, DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, "告 诉 我 关 于 英 诺 斯 的 事", DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 亚 达 诺 斯", DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 贝 利 尔", DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_ADANOS()
{
	AI_Output(other, self, "DIA_Vatras_GODS_ADANOS_15_00"); //跟 我 说 说 亚 达 诺 斯 。
	AI_Output(self, other, "DIA_Vatras_GODS_ADANOS_05_01"); //亚 达 诺 斯 是 中 间 的 神 。 他 是 正 义 的 天 枰 ， 他 守 护 着 英 诺 斯 和 贝 利 尔 之 间 的 平 衡 。
	AI_Output(self, other, "DIA_Vatras_GODS_ADANOS_05_02"); //他 掌 握 着 改 变 的 能 力 ， 他 的 礼 物 是 所 有 海 洋 、 江 河 和 湖 泊 里 的 水 。
	AI_Output(self, other, "DIA_Vatras_GODS_ADANOS_05_03"); //他 的 牧 师 是 水 法 师 ， 比 如 我 就 是 亚 达 诺 斯 的 一 个 牧 师 和 仆 人 。

	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS, DIALOG_BACK, DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, "告 诉 我 关 于 英 诺 斯 的 事", DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 亚 达 诺 斯", DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 贝 利 尔", DIA_Vatras_GODS_BELIAR);
};

func void DIA_Vatras_GODS_BELIAR()
{
	AI_Output(other, self, "DIA_Vatras_GODS_BELIAR_15_00"); //跟 我 说 说 贝 利 尔 。
	AI_Output(self, other, "DIA_Vatras_GODS_BELIAR_05_01"); //贝 利 尔 是 死 亡 、 毁 灭 、 和 一 切 违 背 自 然 的 事 物 的 黑 暗 之 神 。
	AI_Output(self, other, "DIA_Vatras_GODS_BELIAR_05_02"); //他 永 无 休 止 地 跟 英 诺 斯 斗 争 着 ， 但 是 ， 亚 达 诺 斯 守 卫 着 他 们 两 者 之 间 的 平 衡 。
	AI_Output(self, other, "DIA_Vatras_GODS_BELIAR_05_03"); //只 有 很 少 的 人 响 应 贝 利 尔 的 召 唤 - 然 而 ， 他 赐 予 那 些 跟 随 他 的 人 非 凡 的 力 量 。

	Info_ClearChoices(DIA_Vatras_GODS);
	Info_AddChoice(DIA_Vatras_GODS, DIALOG_BACK, DIA_Vatras_GODS_BACK);
	Info_AddChoice(DIA_Vatras_GODS, "告 诉 我 关 于 英 诺 斯 的 事", DIA_Vatras_GODS_INNOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 亚 达 诺 斯", DIA_Vatras_GODS_ADANOS);
	Info_AddChoice(DIA_Vatras_GODS, "跟 我 说 说 贝 利 尔", DIA_Vatras_GODS_BELIAR);
};

///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HEAL(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 99; // Joly: bracuht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition		= DIA_Vatras_HEAL_Condition;
	information		= DIA_Vatras_HEAL_Info;
	permanent		= TRUE;
	description		= "你 能 治 疗 我 吗 ？";
};

func int DIA_Vatras_HEAL_Condition()
{
	// --------------------
	if (Vatras_MORE == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_HEAL_Info()
{
	AI_Output(other, self, "DIA_Vatras_HEAL_15_00"); //你 能 治 疗 我 吗 ？

	if (hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self, other, "DIA_Vatras_HEAL_05_01"); //（ 虔 诚 的 ） 亚 达 诺 斯 祝 福 这 个 躯 体 。 让 它 从 伤 痛 中 释 放 ， 并 赐 予 它 新 生 使 它 强 大 。
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_HEAL_05_02"); //这 次 你 不 需 要 请 求 治 疗 魔 法 。
	};
};

// ********************************************************************
// 							Isgaroth Mission
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MISSION(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Vatras_MISSION_Condition;
	information		= DIA_Vatras_MISSION_Info;
	important		= TRUE;
};

func int DIA_Vatras_MISSION_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MISSION_Info()
{
	AI_Output(self, other, "DIA_Vatras_Add_05_10"); //我 有 个 消 息 要 告 诉 大 师 伊 斯 加 罗 斯 。 他 守 卫 着 修 道 院 前 面 的 神 殿 。
	AI_Output(self, other, "DIA_Vatras_MISSION_05_01"); //如 果 你 为 我 完 成 这 项 使 命 ， 你 就 可 以 选 择 自 己 的 报 酬 。

	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION, "现 在 不 行。", DIA_Vatras_MISSION_NO);
	Info_AddChoice(DIA_Vatras_MISSION, "当 然 。", DIA_Vatras_MISSION_YES);
};

func void B_SayVatrasGo()
{
	AI_Output(self, other, "DIA_Vatras_Add_05_13"); //很 好 。 那 么 ， 马 上 去 找 大 师 伊 斯 加 罗 斯 吧 。
};

func void DIA_Vatras_MISSION_YES()
{
	AI_Output(other, self, "DIA_Vatras_MISSION_YES_15_00"); //我 会 的 。
	AI_Output(self, other, "DIA_Vatras_Add_05_11"); //很 好 ， 那 么 ， 带 上 这 个 消 息 ， 然 后 从 中 选 一 个 魔 法 卷 轴 吧 。
	AI_Output(self, other, "DIA_Vatras_Add_05_12"); //当 你 传 达 了 这 个 消 息 后 ， 我 会 酌 情 奖 赏 你 。

	B_GiveInvItems(self, hero, ItWr_VatrasMessage, 1);
	MIS_Vatras_Message = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Botschaft, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Botschaft, LOG_RUNNING);
	B_LogEntry(TOPIC_Botschaft, TOPIC_Botschaft_1);

	Info_ClearChoices(DIA_Vatras_MISSION);
	Info_AddChoice(DIA_Vatras_MISSION, "我 要 那 个 光 明 魔 法", DIA_Vatras_MISSION_LIGHT);
	Info_AddChoice(DIA_Vatras_MISSION, "我 选 择 治 疗 魔 法", DIA_Vatras_MISSION_HEAL);
	Info_AddChoice(DIA_Vatras_MISSION, "给 我 冰 箭", DIA_Vatras_MISSION_ICE);
};

func void DIA_Vatras_MISSION_NO()
{
	// AI_Output(other, self, "DIA_Vatras_MISSION_NO_15_00"); // Such dir einen anderen Laufburschen, alter Mann!
	AI_Output(other, self, "DIA_ADDON_Vatras_MISSION_NO_15_00"); //现 在 不 行 ！
	AI_Output(self, other, "DIA_ADDON_Vatras_MISSION_NO_05_01"); //没 问 题 。 我 会 派 其 它 人 。
	MIS_Vatras_Message = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_HEAL()
{
	AI_Output(other, self, "DIA_Vatras_MISSION_HEAL_15_00"); //我 选 择 治 疗 魔 法 。
	B_SayVatrasGo();

	B_GiveInvItems(self, hero, ItSc_LightHeal, 1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_ICE()
{
	AI_Output(other, self, "DIA_Vatras_MISSION_ICE_15_00"); //给 我 冰 箭 。
	B_SayVatrasGo();

	B_GiveInvItems(self, hero, ItSc_Icebolt, 1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

func void DIA_Vatras_MISSION_LIGHT()
{
	AI_Output(other, self, "DIA_Vatras_MISSION_LIGHT_15_00"); //我 要 那 个 光 明 魔 法 。
	B_SayVatrasGo();

	B_GiveInvItems(self, hero, ItSc_Light, 1);
	Info_ClearChoices(DIA_Vatras_MISSION);
};

///////////////////////////////////////////////////////////////////////
//	Info MESSAGE_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_MESSAGE_SUCCESS(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Vatras_MESSAGE_SUCCESS_Condition;
	information		= DIA_Vatras_MESSAGE_SUCCESS_Info;
	description		= "我 已 经 把 你 的 消 息 送 到 了";
};

func int DIA_Vatras_MESSAGE_SUCCESS_Condition()
{
	if ((MIS_Vatras_Message == LOG_RUNNING)
	&& (Vatras_Return == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_MESSAGE_SUCCESS_Info()
{
	AI_Output(other, self, "DIA_Vatras_MESSAGE_SUCCESS_15_00"); //我 已 经 把 你 的 消 息 送 到 了 。
	AI_Output(self, other, "DIA_Vatras_Add_05_14"); //请 接 受 我 的 感 谢 。 然 后 ， 挑 选 你 的 奖 励 。

	MIS_Vatras_Message = LOG_SUCCESS;
	B_GivePlayerXP(XP_Vatras_Message);

	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS, "１ 国 王 酢 浆 草", DIA_Vatras_MESSAGE_SUCCESS_Plant);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS, "技 能 戒 指", DIA_Vatras_MESSAGE_SUCCESS_Ring);
	Info_AddChoice(DIA_Vatras_MESSAGE_SUCCESS, "1 个 黄 金 矿 石 块", DIA_Vatras_MESSAGE_SUCCESS_Ore);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Plant()
{
	B_GiveInvItems(self, hero, ItPl_Perm_Herb, 1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ring()
{
	B_GiveInvItems(self, hero, ItRi_Dex_01, 1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

func void DIA_Vatras_MESSAGE_SUCCESS_Ore()
{
	B_GiveInvItems(self, hero, ItMI_Nugget, 1);
	Info_ClearChoices(DIA_Vatras_MESSAGE_SUCCESS);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

////////////////////////// Geht weg //////////////////////////////////
const int kurz = 0;
const int lang = 1;

var int Vatras_einmalLangWeg;

func void B_Vatras_GeheWeg(var int dauer)
{
	// EXIT if

	if (Vatras_einmalLangWeg == TRUE)
	{
		return;
	};

	// FUNC

	if ((Npc_GetDistToWP(self, "NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500)
	&& (Npc_WasInState(self, ZS_Preach_Vatras)))
	{
		B_StopLookAt(self);
		AI_AlignToWP(self);

		AI_Output(self, other, "DIA_Vatras_Add_05_06"); //大 家 听 着 ！ 其 它 地 方 需 要 我 。
		if (dauer == kurz)
		{
			AI_Output(self, other, "DIA_Vatras_Add_05_07"); //那 不 会 太 久 。 当 我 回 来 时 ， 我 会 告 诉 你 们 剩 下 的 故 事 。
		}
		else // lang
		{
			AI_Output(self, other, "DIA_Vatras_Add_05_08"); //我 不 知 道 自 己 是 否 应 该 回 去 。 如 果 你 想 知 道 结 局 ， 就 去 看 看 经 文 里 的 故 事 。

			Vatras_einmalLangWeg = TRUE;
		};

		AI_Output(self, other, "DIA_Vatras_Add_05_09"); //愿 亚 达 诺 斯 与 你 同 在 ！

		B_TurnToNpc(self, other);
	};

	Vatras_SchickeLeuteWeg = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AbloesePre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AbloesePre(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_AbloesePre_Condition;
	information		= DIA_Addon_Vatras_AbloesePre_Info;
	description		= "我 现 在 遇 到 了 关 于 英 诺 斯 之 眼 的 问 题 。";
};

func int DIA_Addon_Vatras_AbloesePre_Condition()
{
	if (((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == FALSE)
	&& (RavenIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AbloesePre_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_AbloesePre_15_00"); //我 遇 到 了 一 个 问 题 ， 是 关 于 英 诺 斯 之 眼 。 我 需 要 你 的 帮 助 。
	AI_Output(self, other, "DIA_Addon_Vatras_AbloesePre_05_01"); //解 决 你 的 问 题 需 要 我 离 开 城 市 吗 ？
	AI_Output(other, self, "DIA_Addon_Vatras_AbloesePre_15_02"); //我 不 知 道 ， 有 可 能 。
	AI_Output(self, other, "DIA_Addon_Vatras_AbloesePre_05_03"); //很 多 天 来 我 一 直 在 等 着 有 人 来 换 班 。 其 它 的 水 法 师 应 该 早 已 经 回 到 克 霍 里 尼 斯 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_AbloesePre_05_04"); //如 果 你 能 保 证 他 们 至 少 有 一 个 人 回 来 城 里 接 替 我 的 职 责 ， 我 就 能 自 由 地 帮 助 你 解 决 问 题 了 。
	MIS_SCKnowsInnosEyeIsBroken = TRUE;

	Log_CreateTopic(TOPIC_Addon_VatrasAbloesung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_VatrasAbloesung, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_VatrasAbloesung, TOPIC_Addon_VatrasAbloesung_1);
};

///////////////////////////////////////////////////////////////////////
//	Info AddonSolved
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_AddonSolved(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Addon_Vatras_AddonSolved_Condition;
	information		= DIA_Addon_Vatras_AddonSolved_Info;
	description		= "这 里 的 某 个 人 会 接 替 你 。";
};

func int DIA_Addon_Vatras_AddonSolved_Condition()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_AddonSolved_Info()
{
	AI_Output(other, self, "DIA_Addon_Vatras_AddonSolved_15_00"); //这 里 的 某 个 人 会 接 替 你 。
	AI_Output(self, other, "DIA_Addon_Vatras_AddonSolved_05_01"); //东 北 方 山 区 的 事 情 解 决 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Vatras_AddonSolved_15_02"); //是 的 ， 解 决 了 。 瑞 雯 死 了 ， 威 胁 已 经 被 阻 止 了 。
	AI_Output(self, other, "DIA_Addon_Vatras_AddonSolved_05_03"); //那 真 是 个 好 消 息 。 让 我 们 期 待 不 要 再 有 这 样 的 事 情 发 生 了 。

	if (Npc_KnowsInfo(other, DIA_Addon_Vatras_AbloesePre))
	{
		AI_Output(self, other, "DIA_Addon_Vatras_AddonSolved_05_04"); //现 在 ， 我 可 以 帮 你 解 决 你 的 小 问 题 了 。
		AI_Output(self, other, "DIA_Addon_Vatras_AddonSolved_05_05"); //我 好 像 记 得 它 是 关 于 英 诺 斯 之 眼 ， 对 吧 ？
	};

	VatrasCanLeaveTown_Kap3 = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info InnoseyeKaputt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_INNOSEYEKAPUTT(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 2;
	condition		= DIA_Vatras_INNOSEYEKAPUTT_Condition;
	information		= DIA_Vatras_INNOSEYEKAPUTT_Info;
	description		= "英 诺 斯 之 眼 损 坏 了 。";
};

func int DIA_Vatras_INNOSEYEKAPUTT_Condition()
{
	if (((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken == TRUE))
	&& (Kapitel == 3)
	&& (VatrasCanLeaveTown_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_INNOSEYEKAPUTT_Info()
{
	if (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_00"); //皮 罗 卡 派 我 来 的 。
	}
	else if (MIS_Xardas_GoToVatrasInnoseye == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_01"); //艾 克 萨 达 斯 派 我 来 的 。
	};

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	B_GivePlayerXP(XP_Ambient);

	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_15_02"); //英 诺 斯 之 眼 损 坏 了 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_03"); //我 知 道 。 我 已 经 从 一 些 非 常 沮 丧 的 新 信 徒 那 里 得 知 了 这 一 点 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_04"); //搜 索 者 已 经 用 火 魔 法 师 的 太 阳 之 环 来 摧 毁 了 ‘ 眼 睛 ’ 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_05_05"); //可 以 说 那 是 敌 人 受 神 灵 启 示 后 的 一 个 行 动 。

	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "新 的 消 息 在 这 个 城 市 里 传 播 的 很 快 。", DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten);

	if ((hero.guild == GIL_KDF)
	&& (MIS_Pyrokar_GoToVatrasInnoseye == LOG_RUNNING))
	{
		Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "有 这 么 多 人 ， 为 什 么 皮 罗 卡 要 派 我 来 你 这 里 ？", DIA_Vatras_INNOSEYEKAPUTT_warumdu);
	};

	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "现 在 眼 睛 怎 么 样 了 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00"); //现 在 眼 睛 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01"); //我 们 必 须 把 它 重 新 结 合 在 一 起 。 但 我 担 心 那 并 不 是 件 容 易 的 事 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02"); //这 个 底 座 已 经 碎 成 两 片 了 ， 一 个 经 验 丰 富 的 铁 匠 应 该 能 修 好 它 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03"); //但 这 不 是 真 正 的 问 题 。 真 正 让 我 担 心 的 是 它 上 面 镶 嵌 的 宝 石 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04"); //它 失 去 了 光 泽 和 力 量 。 敌 人 好 像 已 经 准 确 地 知 道 了 怎 样 削 弱 它 的 能 力 。

	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "我 在 哪 里 能 找 到 有 能 力 修 复 底 座 的 铁 匠 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "怎 么 才 能 恢 复 这 块 宝 石 的 力 量 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00"); //怎 么 才 能 恢 复 这 块 宝 石 的 力 量 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01"); //我 只 知 道 一 个 方 法 。 三 种 神 力 联 合 起 来 应 该 能 实 现 预 期 的 结 果 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02"); //在 它 被 摧 毁 的 地 方 进 行 一 个 妥 善 筹 备 的 复 原 仪 式 将 会 为 这 块 宝 石 找 回 它 的 火 焰 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03"); //然 而 ， 问 题 是 你 必 须 带 回 三 位 神 的 代 表 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04"); //此 外 ， 这 个 仪 式 还 需 要 一 些 沼 生 草 。 我 估 计 那 至 少 需 要 三 份 植 物 。

	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "那 三 个 神 在 尘 世 中 的 代 表 可 能 是 谁 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer);
	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "我 在 哪 里 能 找 到 这 种 沼 生 草 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00"); //我 在 哪 里 能 找 到 这 种 沼 生 草 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01"); //我 听 说 森 林 里 有 一 个 叫 萨 吉 塔 的 江 湖 郎 中 。 她 可 能 会 出 售 这 样 的 药 草 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02"); //但 是 ， 你 也 可 以 去 港 口 那 里 碰 碰 运 气 。
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00"); //那 三 个 神 在 尘 世 中 的 代 表 可 能 是 谁 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01"); //我 自 己 将 会 代 表 亚 达 诺 斯 神 出 席 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02"); //皮 罗 卡 ， 最 高 等 的 火 魔 法 师 ， 他 将 是 代 表 英 诺 斯 神 的 人 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03"); //但 是 对 于 贝 利 尔 ， 我 想 不 到 一 个 合 适 的 人 选 。 他 必 须 是 精 通 着 黑 魔 法 的 人 。

	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "黑 魔 法 ？ 那 么 艾 克 萨 达 斯 呢 ？", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00"); //黑 魔 法 ？ 那 么 艾 克 萨 达 斯 呢 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01"); //就 是 它 。 这 也 许 有 用 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02"); //但 是 ， 我 自 问 ， 你 要 怎 样 才 能 把 我 们 三 个 带 到 一 起 来 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03"); //我 能 想 像 得 出 当 皮 罗 卡 听 到 他 必 须 跟 艾 克 萨 达 斯 合 作 时 的 表 情 。

	Info_AddChoice(DIA_Vatras_INNOSEYEKAPUTT, "我 必 须 走 了 。", DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter);
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00"); //我 到 哪 里 能 找 到 一 个 能 干 的 铁 匠 来 修 复 这 只 ‘ 眼 睛 ’ 的 底 座 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01"); //在 这 个 区 域 周 围 问 一 问 看 有 没 有 人 知 道 谁 会 修 理 珠 宝 。
};

func void DIA_Vatras_INNOSEYEKAPUTT_warumdu()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00"); //有 这 么 多 人 ， 为 什 么 皮 罗 卡 要 派 我 来 你 这 里 ？
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01"); //我 怀 疑 迟 早 会 发 生 这 样 的 事 情 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02"); //皮 罗 卡 总 是 认 为 自 己 如 此 无 懈 可 击 和 高 高 在 上 ， 已 经 近 乎 于 粗 心 了 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03"); //因 此 ， 他 对 这 个 ‘ 眼 睛 ’ 的 保 护 措 施 也 是 粗 心 大 意 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04"); //我 认 为 他 不 知 不 觉 地 依 赖 于 亚 达 诺 斯 赐 予 我 的 能 力 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05"); //无 法 想 像 如 果 我 现 在 不 在 的 话 ， 会 发 生 什 么 事 情 。
};

func void DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00"); //新 的 消 息 在 这 个 城 市 里 传 播 的 很 快 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01"); //那 也 是 件 好 事 。 敌 人 也 不 会 睡 觉 着 。
};

func void DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_weiter()
{
	AI_Output(other, self, "DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00"); //我 必 须 走 了 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01"); //我 也 将 在 太 阳 之 环 开 始 准 备 这 个 仪 式 。
	AI_Output(self, other, "DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02"); //把 艾 克 萨 达 斯 和 皮 罗 卡 带 到 那 里 去 。 还 有 别 忘 了 带 上 沼 生 草 。 我 就 靠 你 了 。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_3);

	MIS_RitualInnosEyeRepair = LOG_RUNNING;
	Info_ClearChoices(DIA_Vatras_INNOSEYEKAPUTT);
	Npc_ExchangeRoutine(self, "RITUALINNOSEYEREPAIR");

	// ------ Zuhörer weg -------
	B_Vatras_Geheweg(kurz);
	// --------------------------

	// Joly: Weg mit den Ritualdementoren!!!!!

	DMT_1201.aivar[AIV_EnemyOverride] = TRUE; // Joly: Damit sie erstmal nicht die Welt entvölkern, ohne Zutun des Spielers!!!!!
	DMT_1202.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1203.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1204.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1205.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1206.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1207.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1208.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1209.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1210.aivar[AIV_EnemyOverride] = TRUE;
	DMT_1211.aivar[AIV_EnemyOverride] = TRUE;

	B_StartOtherRoutine(DMT_1201, "AfterRitual");
	B_StartOtherRoutine(DMT_1202, "AfterRitual");
	B_StartOtherRoutine(DMT_1203, "AfterRitual");
	B_StartOtherRoutine(DMT_1204, "AfterRitual");
	B_StartOtherRoutine(DMT_1205, "AfterRitual");
	B_StartOtherRoutine(DMT_1206, "AfterRitual");
	B_StartOtherRoutine(DMT_1207, "AfterRitual");
	B_StartOtherRoutine(DMT_1208, "AfterRitual");
	B_StartOtherRoutine(DMT_1209, "AfterRitual");
	B_StartOtherRoutine(DMT_1210, "AfterRitual");
	B_StartOtherRoutine(DMT_1211, "AfterRitual");
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_RitualInnosEyeRepair(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 33;
	condition		= DIA_Vatras_RitualInnosEyeRepair_Condition;
	information		= DIA_Vatras_RitualInnosEyeRepair_Info;
	permanent		= TRUE;
	description		= "英 诺 斯 之 眼 怎 么 样 了 ？";
};

func int DIA_Vatras_RitualInnosEyeRepair_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Vatras_RitualInnosEyeRepair_Info()
{
	AI_Output(other, self, "DIA_Vatras_RitualInnosEyeRepair_15_00"); //英 诺 斯 之 眼 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_01"); //记 住 ： 只 有 跟 艾 克 萨 达 斯 和 皮 罗 卡 一 起 在 太 阳 之 环 举 行 复 原 仪 式 能 修 复 这 只 ‘ 眼 睛 ’ 。
	AI_Output(self, other, "DIA_Vatras_RitualInnosEyeRepair_05_02"); //而 且 ， 别 忘 了 带 上 那 只 ‘ 眼 睛 ’ ， 还 有 修 好 的 底 座 。
};

///////////////////////////////////////////////////////////////////////
//	Info Beginn
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_BEGINN(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 31;
	condition		= DIA_Vatras_BEGINN_Condition;
	information		= DIA_Vatras_BEGINN_Info;
	description		= "我 完 成 了 你 交 我 给 的 所 有 事 情 。";
};

func int DIA_Vatras_BEGINN_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_RITUAL_02") < 2000)
	&& (Npc_GetDistToWP(Xardas, "NW_TROLLAREA_RITUAL_02") < 2000)
	&& (Npc_GetDistToWP(Pyrokar, "NW_TROLLAREA_RITUAL_02") < 2000)
	&& (Npc_HasItems(other, ItMi_InnosEye_Broken_MIS))
	&& (MIS_Bennet_InnosEyeRepairedSetting == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Vatras_BEGINN_Info()
{
	AI_Output(other, self, "DIA_Vatras_BEGINN_15_00"); //我 已 经 办 好 了 你 要 我 做 的 事 情 。 这 是 修 理 过 的 ‘ 眼 睛 ’ 。
	B_GivePlayerXP(XP_RitualInnosEyeRuns);

	B_GiveInvItems(other, self, ItMi_InnosEye_Broken_MIS, 1);
	Npc_RemoveInvItem(self, ItMi_InnosEye_Broken_MIS);

	AI_Output(self, other, "DIA_Vatras_BEGINN_05_01"); //真 的 ， 现 在 举 行 仪 式 已 经 什 么 都 不 缺 了 。
	AI_Output(other, self, "DIA_Vatras_BEGINN_15_02"); //沼 生 草 怎 么 样 了 ？

	AI_Output(self, other, "DIA_Vatras_BEGINN_05_03"); //哈 ， 是 的 。 你 有 3 份 沼 生 草 植 物 了 ， 是 吗 ？

	if (B_GiveInvItems(other, self, ItPL_SwampHerb, 3))
	{
		AI_Output(other, self, "DIA_Vatras_BEGINN_15_04"); //阿 咳 。 是 的 。 这 是 3 份 植 物 。
		AI_Output(self, other, "DIA_Vatras_BEGINN_05_05"); //好 极 了 。
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(other, self, "DIA_Vatras_BEGINN_15_06"); //不 。 哎 ， 没 有 。
		AI_Output(self, other, "DIA_Vatras_BEGINN_05_07"); //好 吧 。 那 么 我 们 只 能 在 没 有 的 情 况 下 试 试 了 。
	};

	AI_Output(self, other, "DIA_Vatras_BEGINN_05_08"); //你 干 得 不 错 ， 现 在 站 到 一 边 去 ， 我 们 要 开 始 举 行 仪 式 了 。 愿 我 们 的 精 神 联 合 起 来 。

	Info_ClearChoices(DIA_Vatras_BEGINN);
	Info_AddChoice(DIA_Vatras_BEGINN, DIALOG_ENDE, DIA_Vatras_BEGINN_los);
};

func void DIA_Vatras_BEGINN_los()
{
	AI_StopProcessInfos(self); Vatras_MORE = FALSE;

	Npc_ExchangeRoutine(self, "RITUALINNOSEYE");
	B_StartOtherRoutine(Xardas, "RITUALINNOSEYE");
	B_StartOtherRoutine(Pyrokar, "RITUALINNOSEYE");
	Npc_SetRefuseTalk(self, 60);

	RitualInnosEyeRuns = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info augeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_AUGEGEHEILT(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 33;
	condition		= DIA_Vatras_AUGEGEHEILT_Condition;
	information		= DIA_Vatras_AUGEGEHEILT_Info;
	important		= TRUE;
};

func int DIA_Vatras_AUGEGEHEILT_Condition()
{
	if ((Kapitel == 3)
	&& (RitualInnosEyeRuns == LOG_RUNNING)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_AUGEGEHEILT_Info()
{
	AI_Output(self, other, "DIA_Vatras_AUGEGEHEILT_05_00"); //完 成 了 。 我 们 成 功 地 扭 转 了 敌 人 的 计 划 并 修 复 了 这 只 ‘ 眼 睛 ’ 。
	AI_Output(self, other, "DIA_Vatras_AUGEGEHEILT_05_01"); //让 皮 罗 卡 告 诉 你 怎 样 运 用 它 的 力 量 。
	AI_Output(self, other, "DIA_Vatras_AUGEGEHEILT_05_02"); //我 希 望 在 你 完 成 了 你 的 使 命 后 ， 能 够 再 见 到 你 。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_4);
	AI_StopProcessInfos(self); Vatras_MORE = FALSE;

	RitualInnosEyeRuns = LOG_SUCCESS;
	MIS_RitualInnosEyeRepair = LOG_SUCCESS;

	B_StartOtherRoutine(Pyrokar, "RitualInnosEyeRepair");
	B_StartOtherRoutine(Xardas, "RitualInnosEyeRepair");

	B_StartOtherRoutine(VLK_455_Buerger, "START");
	B_StartOtherRoutine(VLK_454_Buerger, "START");
	B_StartOtherRoutine(VLK_428_Buergerin, "START");
	B_StartOtherRoutine(VLK_450_Buerger, "START");
	B_StartOtherRoutine(VLK_426_Buergerin, "START");
	B_StartOtherRoutine(VLK_421_Valentino, "START");
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_PERMKAP3(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 33;
	condition		= DIA_Vatras_PERMKAP3_Condition;
	information		= DIA_Vatras_PERMKAP3_Info;
	description		= "感 谢 你 帮 忙 修 复 英 诺 斯 之 眼 。 ";
};

func int DIA_Vatras_PERMKAP3_Condition()
{
	if (MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Vatras_PERMKAP3_Info()
{
	AI_Output(other, self, "DIA_Vatras_PERMKAP3_15_00"); //感 谢 你 帮 忙 修 复 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Vatras_PERMKAP3_05_01"); //别 总 把 谢 谢 挂 在 你 的 嘴 边 。 你 最 伟 大 的 使 命 还 在 前 面 。

	if (MIS_ReadyforChapter4 == FALSE)
	{
		AI_Output(self, other, "DIA_Vatras_PERMKAP3_05_02"); //跟 皮 罗 卡 谈 谈 ， 他 会 对 你 解 释 其 它 的 事 情 。
	};

	AI_Output(self, other, "DIA_Vatras_PERMKAP3_05_03"); //我 希 望 再 次 见 到 你 时 你 仍 安 然 无 恙 ， 我 的 孩 子 。
};

///////////////////////////////////////////////////////////////////////
//	Info HildaKrank
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_HILDAKRANK(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 34;
	condition		= DIA_Vatras_HILDAKRANK_Condition;
	information		= DIA_Vatras_HILDAKRANK_Info;
	description		= "洛 拔 特 的 妻 子 希 尔 达 病 了 。";
};

func int DIA_Vatras_HILDAKRANK_Condition()
{
	if ((MIS_HealHilda == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Vatras_GREET)))
	{
		return TRUE;
	};
};

func void DIA_Vatras_HILDAKRANK_Info()
{
	AI_Output(other, self, "DIA_Vatras_HILDAKRANK_15_00"); //洛 拔 特 的 妻 子 希 尔 达 病 了 。
	AI_Output(self, other, "DIA_Vatras_HILDAKRANK_05_01"); //什 么 ？ 又 一 次 ？ 这 个 善 良 的 女 人 应 该 好 好 地 照 顾 她 自 己 。
	AI_Output(self, other, "DIA_Vatras_HILDAKRANK_05_02"); //一 个 寒 冷 的 冬 天 过 后 ， 她 也 许 就 不 会 再 跟 我 们 一 起 了 。 好 吧 ， 我 要 给 她 一 颗 药 帮 她 减 轻 发 热 。
	AI_Output(self, other, "DIA_Vatras_HILDAKRANK_05_03"); //哦 ， 既 然 你 来 了 顺 便 帮 我 送 过 去 吧 。
	CreateInvItems(self, ItPo_HealHilda_MIS, 1);
	B_GiveInvItems(self, other, ItPo_HealHilda_MIS, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_OBSESSION(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 35;
	condition		= DIA_Vatras_OBSESSION_Condition;
	information		= DIA_Vatras_OBSESSION_Info;
	description		= "我 现 在 有 一 种 恐 惧 的 感 觉 。";
};

func int DIA_Vatras_OBSESSION_Condition()
{
	if ((SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1))
	{
		return TRUE;
	};
};

func void DIA_Vatras_OBSESSION_Info()
{
	AI_Output(other, self, "DIA_Vatras_OBSESSION_15_00"); //我 现 在 有 一 种 恐 惧 的 感 觉 。
	AI_Output(self, other, "DIA_Vatras_OBSESSION_05_01"); //你 看 起 来 也 不 怎 么 好 。 你 受 到 搜 索 者 的 黑 色 凝 视 已 经 太 久 了 。
	AI_Output(self, other, "DIA_Vatras_OBSESSION_05_02"); //我 只 能 治 疗 你 的 身 体 ， 只 有 修 道 院 能 洁 净 你 的 灵 魂 。 跟 皮 罗 卡 谈 谈 。 他 会 帮 助 你 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************
instance DIA_Vatras_AllDragonsDead(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 59;
	condition		= DIA_Vatras_AllDragonsDead_Condition;
	information		= DIA_Vatras_AllDragonsDead_Info;
	description		= "龙 不 会 再 带 来 其 它 破 坏 了 。";
};

func int DIA_Vatras_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vatras_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Vatras_AllDragonsDead_15_00"); //龙 不 会 再 带 来 其 它 破 坏 了 。
	AI_Output(self, other, "DIA_Vatras_AllDragonsDead_05_01"); //我 知 道 你 会 安 然 无 恙 的 。 然 而 ， 你 还 得 跨 越 你 最 大 的 障 碍 。
	AI_Output(other, self, "DIA_Vatras_AllDragonsDead_15_02"); //我 知 道 。
	AI_Output(self, other, "DIA_Vatras_AllDragonsDead_05_03"); //那 么 ， 好 好 装 备 一 下 自 己 ， 如 果 你 需 要 帮 助 就 来 找 我 。 英 诺 斯 之 眼 一 定 要 随 身 携 带 ， 听 到 了 吗 ？ 亚 达 诺 斯 祝 福 你 。
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_KnowWhereEnemy(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 55;
	condition		= DIA_Vatras_KnowWhereEnemy_Condition;
	information		= DIA_Vatras_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 知 道 我 们 的 敌 人 在 哪 里 。";
};

func int DIA_Vatras_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Vatras_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Vatras_KnowWhereEnemy_15_00"); //我 知 道 我 们 的 敌 人 在 哪 里 。
	AI_Output(self, other, "DIA_Vatras_KnowWhereEnemy_05_01"); //那 我 们 别 浪 费 时 间 了 ， 在 他 自 己 来 找 我 们 之 前 把 他 找 出 来 。
	AI_Output(other, self, "DIA_Vatras_KnowWhereEnemy_15_02"); //你 想 和 我 一 起 去 ?
	AI_Output(self, other, "DIA_Vatras_KnowWhereEnemy_05_03"); //这 件 事 我 已 经 想 了 很 久 ， 我 从 来 没 对 自 己 的 事 情 如 此 确 定 过 ， 我 的 朋 友 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_8);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Vatras_KnowWhereEnemy_15_04"); //我 的 名 单 上 人 已 经 太 多 了 。 我 恐 怕 那 里 没 有 你 的 位 置 了 。
		AI_Output(self, other, "DIA_Vatras_KnowWhereEnemy_05_05"); //那 就 腾 出 一 个 位 置 来 。 你 会 需 要 我 的 。
	}
	else
	{
		Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy, "我 要 再 考 虑 一 下 。", DIA_Vatras_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Vatras_KnowWhereEnemy, "我 认 为 有 你 与 我 同 行 是 我 的 荣 幸 。", DIA_Vatras_KnowWhereEnemy_Yes);
	};
};

func void DIA_Vatras_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Vatras_KnowWhereEnemy_Yes_15_00"); //我 认 为 你 在 我 身 边 是 一 种 荣 耀 。 我 们 在 码 头 上 跟 你 碰 面 。
	AI_Output(self, other, "DIA_Vatras_KnowWhereEnemy_Yes_05_01"); //别 花 太 多 时 间 。 敌 人 不 会 睡 觉 的 ， 我 的 朋 友 。

	B_GivePlayerXP(XP_Crewmember_Success);

	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg(lang);

	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

func void DIA_Vatras_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Vatras_KnowWhereEnemy_No_15_00"); //我 要 再 考 虑 一 下 。
	AI_Output(self, other, "DIA_Vatras_KnowWhereEnemy_No_05_01"); //随 便 你 。 如 果 你 改 变 了 主 意 再 来 找 我 。

	Vatras_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Vatras_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_LeaveMyShip(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 55;
	condition		= DIA_Vatras_LeaveMyShip_Condition;
	information		= DIA_Vatras_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "你 最 好 留 在 这 里 ， 城 市 需 要 你 。";
};

func int DIA_Vatras_LeaveMyShip_Condition()
{
	if ((Vatras_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Vatras_LeaveMyShip_15_00"); //你 最 好 留 在 这 里 ， 城 市 需 要 你 。
	AI_Output(self, other, "DIA_Vatras_LeaveMyShip_05_01"); //也 许 你 是 对 的 。 但 是 ， 如 果 你 希 望 的 话 ， 我 会 陪 伴 你 的 。 你 记 住 。

	Vatras_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "PRAY");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_StillNeedYou(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 55;
	condition		= DIA_Vatras_StillNeedYou_Condition;
	information		= DIA_Vatras_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "和 我 一 起 去 敌 人 的 岛 屿 去 。";
};

func int DIA_Vatras_StillNeedYou_Condition()
{
	if (((Vatras_IsOnBOard == LOG_OBSOLETE)
	|| (Vatras_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Vatras_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Vatras_StillNeedYou_15_00"); //和 我 一 起 去 敌 人 的 岛 屿 去 。
	AI_Output(self, other, "DIA_Vatras_StillNeedYou_05_01"); //一 个 明 智 的 决 定 。 我 希 望 你 能 受 得 了 它 。

	self.flags = NPC_FLAG_IMMORTAL;
	Vatras_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	// ------ Zuhörer weg -------
	B_Vatras_GeheWeg(lang);

	AI_StopProcessInfos(self); Vatras_MORE = FALSE;

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER(C_INFO)
{
	npc				= VLK_439_Vatras;
	nr				= 1;
	condition		= DIA_Addon_Vatras_PISSOFFFOREVVER_Condition;
	information		= DIA_Addon_Vatras_PISSOFFFOREVVER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_Condition()
{
	if ((VatrasPissedOffForever == TRUE)
	&& (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Addon_Vatras_PISSOFFFOREVVER_Info()
{
	B_VatrasPissedOff();
	AI_StopProcessInfos(self); Vatras_MORE = FALSE;
};
