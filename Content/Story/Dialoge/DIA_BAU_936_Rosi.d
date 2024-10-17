///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_EXIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 999;
	condition		= DIA_Rosi_EXIT_Condition;
	information		= DIA_Rosi_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rosi_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Rosi_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HALLO(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 3;
	condition		= DIA_Rosi_HALLO_Condition;
	information		= DIA_Rosi_HALLO_Info;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_Rosi_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rosi_HALLO_Info()
{
	AI_Output(other, self, "DIA_Rosi_HALLO_15_00"); //你 一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Rosi_HALLO_17_01"); //嗯 ， 一 般 般 吧 。 这 么 辛 苦 的 工 作 ， 我 的 背 都 受 伤 了 。 你 在 这 里 做 什 么 ？ 我 并 不 经 常 遇 到 游 客 。

	if ((hero.guild != GIL_MIL))
	{
		AI_Output(self, other, "DIA_Rosi_HALLO_17_02"); //通 常 ， 要 么 是 从 山 里 来 的 一 些 杀 人 犯 ， 要 么 是 那 些 从 城 里 来 的 讨 厌 的 民 兵 。
		AI_Output(self, other, "DIA_Rosi_HALLO_17_03"); //他 们 近 来 袭 击 我 们 农 场 的 次 数 越 来 越 多 。 但 是 你 看 起 来 不 像 是 他 们 那 些 人 ， 或 者 说 你 是 ？
	};
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WASMACHSTDU(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 4;
	condition		= DIA_Rosi_WASMACHSTDU_Condition;
	information		= DIA_Rosi_WASMACHSTDU_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Rosi_WASMACHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_HALLO))
	&& (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Rosi_WASMACHSTDU_15_00"); //你 在 这 里 做 什 么 ？

	if (Npc_IsDead(Sekob) == FALSE)
	{
		AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_01"); //我 几 年 来 一 直 在 问 自 己 。 塞 柯 布 ， 我 的 丈 夫 ， 现 在 已 经 同 所 有 人 闹 翻 了 。
		AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_02"); //他 到 处 欠 债 。 而 且 他 还 从 欧 纳 尔 的 库 房 偷 东 西 ， 然 后 把 它 们 卖 到 镇 上 。
		AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_03"); //现 在 ， 他 利 用 非 法 交 易 来 积 聚 钱 财 。
		AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_04"); //他 让 我 们 的 工 人 不 停 劳 动 直 到 他 们 受 伤 。 他 自 己 的 人 现 在 都 管 他 叫 监 工 。
		AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_05"); //自 称 是 塞 柯 布 的 妻 子 ， 并 不 会 让 我 感 到 自 豪 ， 相 信 我 。 有 时 ， 我 希 望 那 个 屏 障 还 在 原 地 。
	};

	AI_Output(self, other, "DIA_Rosi_WASMACHSTDU_17_06"); //你 想 要 买 点 吃 的 吗 ， 或 者 那 些 在 丛 林 里 狩 猎 时 所 需 的 东 西 ？
	Log_CreateTopic(Topic_OutTrader, LOG_NOTE);
	B_LogEntry(Topic_OutTrader, Topic_OutTrader_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_WAREZ(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 2;
	condition		= DIA_Rosi_WAREZ_Condition;
	information		= DIA_Rosi_WAREZ_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 可 以 给 我 提 供 一 些 什 么 ？";
};

func int DIA_Rosi_WAREZ_Condition()
{
	if ((
	(Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	|| ((Kapitel >= 5) && (Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB)))
	|| (Npc_IsDead(Sekob))
	)
	&& (MIS_bringRosiBackToSekob != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Rosi_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Rosi_WAREZ_15_00"); //你 可 以 给 我 提 供 一 些 什 么 ？
	AI_Output(self, other, "DIA_Rosi_WAREZ_17_01"); //你 想 要 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info barriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BARRIERE(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 6;
	condition		= DIA_Rosi_BARRIERE_Condition;
	information		= DIA_Rosi_BARRIERE_Info;
	description		= "屏 障 ？";
};

func int DIA_Rosi_BARRIERE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& (Npc_IsDead(Sekob) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BARRIERE_Info()
{
	AI_Output(other, self, "DIA_Rosi_BARRIERE_15_00"); //屏 障 ？
	AI_Output(self, other, "DIA_Rosi_BARRIERE_17_01"); //嗯 ， 那 个 以 前 封 闭 旧 矿 藏 山 谷 的 罩 子 。
	AI_Output(self, other, "DIA_Rosi_BARRIERE_17_02"); //那 时 ， 有 很 多 犯 了 罪 的 农 场 主 和 工 人 都 被 扔 进 那 里 ， 他 们 永 远 都 回 不 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info DuInBarriere
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_DuInBarriere(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 10;
	condition		= DIA_Rosi_DuInBarriere_Condition;
	information		= DIA_Rosi_DuInBarriere_Info;
	description		= "你 以 前 去 过 屏 障 吗 ？";
};

func int DIA_Rosi_DuInBarriere_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_BARRIERE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_DuInBarriere_Info()
{
	AI_Output(other, self, "DIA_Rosi_DuInBarriere_15_00"); //你 以 前 去 过 屏 障 吗 ？
	AI_Output(self, other, "DIA_Rosi_DuInBarriere_17_01"); //不 。 我 们 只 是 听 说 过 它 。 高 原 牧 场 上 的 农 场 主 本 加 ， 肯 定 能 告 诉 你 关 于 那 个 东 西 的 事 。
	AI_Output(self, other, "DIA_Rosi_DuInBarriere_17_02"); //他 的 农 场 非 常 靠 近 通 向 矿 藏 山 谷 的 关 卡 。
};

///////////////////////////////////////////////////////////////////////
//	Info Bengar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_BENGAR(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 11;
	condition		= DIA_Rosi_BENGAR_Condition;
	information		= DIA_Rosi_BENGAR_Info;
	description		= "我 怎 么 能 到 本 加 的 农 场 去 ？";
};

func int DIA_Rosi_BENGAR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_DuInBarriere))
	&& (Npc_IsDead(Balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_BENGAR_Info()
{
	AI_Output(other, self, "DIA_Rosi_BENGAR_15_00"); //我 怎 么 能 到 本 加 的 农 场 去 ？
	AI_Output(self, other, "DIA_Rosi_BENGAR_17_01"); //去 问 巴 尔 塞 萨 。 他 是 我 们 的 牧 羊 人 。 他 有 时 会 把 我 们 的 牲 畜 带 到 本 加 的 牧 场 那 边 放 牧 。
	AI_Output(self, other, "DIA_Rosi_BENGAR_17_02"); //他 能 告 诉 你 怎 么 去 那 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_Miliz(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 7;
	condition		= DIA_Rosi_Miliz_Condition;
	information		= DIA_Rosi_Miliz_Info;
	description		= "为 什 么 民 兵 要 在 你 的 农 场 这 里 攻 击 你 ？";
};

func int DIA_Rosi_Miliz_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	&& ((hero.guild != GIL_MIL)))
	{
		return TRUE;
	};
};

func void DIA_Rosi_Miliz_Info()
{
	AI_Output(other, self, "DIA_Rosi_Miliz_15_00"); //为 什 么 民 兵 要 在 你 的 农 场 这 里 攻 击 你 ？
	AI_Output(self, other, "DIA_Rosi_Miliz_17_01"); //因 为 那 里 没 有 人 能 让 他 们 不 再 掠 夺 我 们 ， 而 是 购 买 我 们 的 货 物 。
	AI_Output(self, other, "DIA_Rosi_Miliz_17_02"); //山 高 皇 帝 远 ， 我 们 只 能 忍 着 ， 并 为 欧 纳 尔 工 作 ， 然 后 希 望 在 我 们 真 正 需 要 的 时 候 ， 欧 纳 尔 可 以 派 出 援 兵 。
};

///////////////////////////////////////////////////////////////////////
//	Info Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ONAR(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 8;
	condition		= DIA_Rosi_ONAR_Condition;
	information		= DIA_Rosi_ONAR_Info;
	description		= "欧 纳 尔 的 帮 助 看 起 来 怎 么 样 ？";
};

func int DIA_Rosi_ONAR_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rosi_Miliz))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ONAR_Info()
{
	AI_Output(other, self, "DIA_Rosi_ONAR_15_00"); //欧 纳 尔 的 帮 助 看 起 来 怎 么 样 ？
	AI_Output(self, other, "DIA_Rosi_ONAR_17_01"); //有 时 当 一 些 民 兵 准 备 为 了 他 们 自 己 的 理 由 来 掠 夺 我 们 的 时 候 ， 我 们 能 够 事 先 收 到 警 报 。
	AI_Output(self, other, "DIA_Rosi_ONAR_17_02"); //然 后 我 们 就 派 人 去 老 地 主 那 里 请 求 他 的 帮 助 。
	AI_Output(self, other, "DIA_Rosi_ONAR_17_03"); //一 般 用 不 了 多 久 ， 他 雇 的 那 些 雇 佣 兵 就 会 来 到 这 里 把 那 些 民 兵 赶 走 。
	AI_Output(self, other, "DIA_Rosi_ONAR_17_04"); //不 过 ， 说 到 底 ， 那 些 雇 佣 兵 也 不 怎 么 样 。
};

///////////////////////////////////////////////////////////////////////
//	Info Permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_PERMKAP1(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 80;
	condition		= DIA_Rosi_PERMKAP1_Condition;
	information		= DIA_Rosi_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "别 灰 心 。";
};

func int DIA_Rosi_PERMKAP1_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
	|| ((Kapitel >= 5) && (Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB))))
	{
		return TRUE;
	};
};

func void DIA_Rosi_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Rosi_PERMKAP1_15_00"); //别 灰 心 。

	if ((MIS_bringRosiBackToSekob == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Rosi_PERMKAP1_17_01"); //别 管 闲 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Rosi_PERMKAP1_17_02"); //照 顾 好 自 己 ， 不 要 让 他 们 抓 住 你 。
	};

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
instance DIA_Rosi_KAP3_EXIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 999;
	condition		= DIA_Rosi_KAP3_EXIT_Condition;
	information		= DIA_Rosi_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rosi_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP3_EXIT_Info()
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
instance DIA_Rosi_KAP4_EXIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 999;
	condition		= DIA_Rosi_KAP4_EXIT_Condition;
	information		= DIA_Rosi_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rosi_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP4_EXIT_Info()
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
instance DIA_Rosi_KAP5_EXIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 999;
	condition		= DIA_Rosi_KAP5_EXIT_Condition;
	information		= DIA_Rosi_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rosi_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FleefromSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_FLEEFROMSEKOB(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 50;
	condition		= DIA_Rosi_FLEEFROMSEKOB_Condition;
	information		= DIA_Rosi_FLEEFROMSEKOB_Info;
	description		= "你 在 荒 野 这 里 做 什 么 ？";
};

func int DIA_Rosi_FLEEFROMSEKOB_Condition()
{
	if ((Kapitel == 5)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_FLEEFROMSEKOB_Info()
{
	AI_Output(other, self, "DIA_Rosi_FLEEFROMSEKOB_15_00"); //你 在 荒 野 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_01"); //在 塞 柯 布 的 农 场 这 里 ， 我 再 也 无 法 忍 受 了 。 塞 柯 布 的 脾 气 发 了 一 次 又 一 次 。
	AI_Output(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_02"); //到 最 后 ， 没 有 一 个 人 能 和 他 讲 话 。 他 能 做 的 只 有 大 喊。
	AI_Output(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_03"); //我 必 须 离 开 这 里 ， 但 是 我 不 知 道 要 去 哪 里 。
	AI_Output(self, other, "DIA_Rosi_FLEEFROMSEKOB_17_04"); //有 兴 趣 做 个 小 交 易 吗 ？
	B_GivePlayerXP(XP_Ambient);
	RosiFoundKap5 = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_HILFE(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 51;
	condition		= DIA_Rosi_HILFE_Condition;
	information		= DIA_Rosi_HILFE_Info;
	description		= "我 要 把 你 从 这 里 带 出 去 。";
};

func int DIA_Rosi_HILFE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rosi_FLEEFROMSEKOB))
	&& (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_HILFE_Info()
{
	AI_Output(other, self, "DIA_Rosi_HILFE_15_00"); //我 要 把 你 从 这 里 带 出 去 。

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Till.aivar[AIV_PARTYMEMBER] = TRUE;

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other, self, "DIA_Rosi_HILFE_15_01"); //我 可 以 带 你 去 城 里 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other, self, "DIA_Rosi_HILFE_15_02"); //我 可 以 带 你 去 地 主 的 农 场 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Rosi_HILFE_15_03"); //离 开 这 里 去 修 道 院 。 那 里 一 定 欢 迎 你 。
	};

	AI_Output(self, other, "DIA_Rosi_HILFE_17_04"); //我 将 永 远 忘 不 了 你 对 我 的 帮 助 。 我 要 报 答 你 ， 当 然 了 。

	if (Npc_IsDead(Till))
	{
		AI_Output(self, other, "DIA_Rosi_HILFE_17_05"); //你 先 走 。 我 会 跟 上 的 。
	}
	else
	{
		AI_Output(self, other, "DIA_Rosi_HILFE_17_06"); //你 先 走 。 我 会 跟 上 的 。
	};

	AI_StopProcessInfos(self);
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self, "FollowCity");
		B_StartOtherRoutine(Till, "FollowCity");
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self, "FollowBigfarm");
		B_StartOtherRoutine(Till, "FollowBigfarm");
	};

	if (hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self, "FollowKloster");
		B_StartOtherRoutine(Till, "FollowKloster");
	};

	Log_CreateTopic(TOPIC_RosisFlucht, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RosisFlucht, LOG_RUNNING);
	B_LogEntry(TOPIC_RosisFlucht, TOPIC_RosisFlucht_2);
	MIS_RosisFlucht = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info angekommen
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_ANGEKOMMEN(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 55;
	condition		= DIA_Rosi_ANGEKOMMEN_Condition;
	information		= DIA_Rosi_ANGEKOMMEN_Info;
	important		= TRUE;
};

func int DIA_Rosi_ANGEKOMMEN_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_bringRosiBackToSekob != LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE)
	&& (
	((Npc_GetDistToWP(self, "CITY2") < 6000) && (hero.guild == GIL_PAL))
	|| ((Npc_GetDistToWP(self, "NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG))
	|| ((Npc_GetDistToWP(self, "KLOSTER") < 6000) && (hero.guild == GIL_KDF))
	))
	{
		return TRUE;
	};
};

func void DIA_Rosi_ANGEKOMMEN_Info()
{
	AI_Output(self, other, "DIA_Rosi_ANGEKOMMEN_17_00"); //这 里 的 路 我 认 识 了 。
	AI_Output(self, other, "DIA_Rosi_ANGEKOMMEN_17_01"); //谢 谢 你 。 如 果 没 有 你 ， 我 真 不 知 道 能 做 什 么 ?

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;

	MIS_bringRosiBackToSekob = LOG_OBSOLETE;
	MIS_RosisFlucht = LOG_SUCCESS;
	AI_Output(self, other, "DIA_Rosi_ANGEKOMMEN_17_02"); //请 接 受 这 件 小 礼 物 作 为 报 答 。

	CreateInvItems(Rosi, ItMi_Gold, 650);
	B_GiveInvItems(self, other, ItMi_Gold, 450);

	if (Npc_IsDead(Till))
	{
		B_GivePlayerXP(XP_SavedRosi);
	}
	else
	{
		var int XPForBoth;
		XPForBoth = (XP_SavedRosi + XP_Ambient);
		B_GivePlayerXP(XPForBoth);
	};

	AI_StopProcessInfos(self);

	if (Npc_GetDistToWP(self, "CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self, "CITY");
		B_StartOtherRoutine(Till, "CITY");
	}
	else if (Npc_GetDistToWP(self, "BIGFARM") < 8000)
	{
		Npc_ExchangeRoutine(self, "BIGFARM");
		B_StartOtherRoutine(Till, "BIGFARM");
	}
	else if (Npc_GetDistToWP(self, "KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self, "KLOSTER");
		B_StartOtherRoutine(Till, "KLOSTER");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info trait
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_TRAIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 55;
	condition		= DIA_Rosi_TRAIT_Condition;
	information		= DIA_Rosi_TRAIT_Info;
	description		= "看 ， 你 现 在 又 到 家 了 。";
};

func int DIA_Rosi_TRAIT_Condition()
{
	if ((MIS_bringRosiBackToSekob == LOG_SUCCESS)
	&& (Rosi_FleeFromSekob_Kap5 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rosi_TRAIT_Info()
{
	AI_Output(other, self, "DIA_Rosi_TRAIT_15_00"); //看 ， 你 现 在 又 到 家 了 。
	AI_Output(self, other, "DIA_Rosi_TRAIT_17_01"); //你 是 我 一 生 中 遇 到 的 最 差 劲 的 肥 料 ， 你 这 污 秽 的 畜 牲 。
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_RosisFlucht = LOG_FAILED;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Rosi_MinenAnteil(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 3;
	condition		= DIA_Rosi_MinenAnteil_Condition;
	information		= DIA_Rosi_MinenAnteil_Info;
	description		= "出 售 非 法 的 矿 井 股 票 - 你 不 感 到 羞 耻 ？";
};

func int DIA_Rosi_MinenAnteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU)))
	{
		return TRUE;
	};
};

func void DIA_Rosi_MinenAnteil_Info()
{
	AI_Output(other, self, "DIA_Rosi_Minenanteil_15_00"); //出 售 非 法 的 矿 井 股 票 - 你 不 感 到 羞 耻 ？
	AI_Output(self, other, "DIA_Rosi_Minenanteil_17_01"); //不 。 我 也 需 要 生 存 ， 而 且 又 不 是 我 让 它 们 进 入 流 通 的 。
	B_GivePlayerXP(XP_Ambient);
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
instance DIA_Rosi_KAP6_EXIT(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 999;
	condition		= DIA_Rosi_KAP6_EXIT_Condition;
	information		= DIA_Rosi_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rosi_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Rosi_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rosi_PICKPOCKET(C_INFO)
{
	npc				= BAU_936_Rosi;
	nr				= 900;
	condition		= DIA_Rosi_PICKPOCKET_Condition;
	information		= DIA_Rosi_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Rosi_PICKPOCKET_Condition()
{
	C_Beklauen(30, 75);
};

func void DIA_Rosi_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
	Info_AddChoice(DIA_Rosi_PICKPOCKET, DIALOG_BACK, DIA_Rosi_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rosi_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rosi_PICKPOCKET_DoIt);
};

func void DIA_Rosi_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};

func void DIA_Rosi_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rosi_PICKPOCKET);
};
