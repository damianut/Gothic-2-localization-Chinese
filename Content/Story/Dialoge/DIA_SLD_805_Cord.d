// ************************************************************
// 			  					EXIT
// ************************************************************
instance DIA_Cord_EXIT(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 999;
	condition		= DIA_Cord_EXIT_Condition;
	information		= DIA_Cord_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Cord_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cord_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_MeetingIsRunning(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 1;
	condition		= DIA_Addon_Cord_MeetingIsRunning_Condition;
	information		= DIA_Addon_Cord_MeetingIsRunning_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Cord_MeetingIsRunning_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int DIA_Addon_Cord_MeetingIsRunning_OneTime;
func void DIA_Addon_Cord_MeetingIsRunning_Info()
{
	if (DIA_Addon_Cord_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_00"); //欢 迎 来 到 ‘ 水 之 环 ’ ， 兄 弟 。
		DIA_Addon_Cord_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Cord_MeetingIsRunning_14_01"); //你 现 在 应 该 去 见 瓦 卓 斯 … …
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
instance DIA_Cord_Hallo(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 2;
	condition		= DIA_Cord_Hallo_Condition;
	information		= DIA_Cord_Hallo_Info;
	important		= TRUE;
};

func int DIA_Cord_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE)
	&& (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cord_Hallo_Info()
{
	AI_Output(self, other, "DIA_Cord_Hallo_14_00"); //如 果 你 碰 到 了 狼 或 者 旷 野 袭 击 者 ， 去 跟 一 个 年 青 的 雇 佣 兵 说 就 行 了 。
	AI_Output(self, other, "DIA_Cord_Hallo_14_01"); //如 果 有 圣 骑 士 在 这 里 出 现 ， 就 可 以 来 找 我 。

	if (SC_IsRanger == FALSE)
	{
		AI_Output(other, self, "DIA_Cord_Hallo_15_02"); //什 么 ？
		AI_Output(self, other, "DIA_Cord_Hallo_14_03"); //无 论 什 么 时 候 你 们 农 民 来 找 我 ， 总 是 关 于 屠 杀 无 辜 的 野 兽 的 事 情 。
		AI_Output(other, self, "DIA_Cord_Hallo_15_04"); //我 不 是 农 民 。
		AI_Output(self, other, "DIA_Cord_Hallo_14_05"); //哦 ？ 那 你 希 望 是 什 么 ？
	};
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
var int Cord_SchonmalGefragt;
// ------------------------------------------------------------
instance DIA_Cord_WannaJoin(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 5;
	condition		= DIA_Cord_WannaJoin_Condition;
	information		= DIA_Cord_WannaJoin_Info;
	permanent		= TRUE;
	description		= "我 想 要 成 为 一 名 雇 佣 兵 ！";
};

func int DIA_Cord_WannaJoin_Condition()
{
	if ((Cord_Approved == FALSE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void B_Cord_BeBetter()
{
	AI_Output(self, other, "DIA_Cord_WannaJoin_14_14"); //既 然 你 不 知 道 怎 么 使 用 武 器 ， 那 你 来 错 地 方 了 ！
};

func void DIA_Cord_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Cord_WannaJoin_15_00"); //我 想 要 成 为 一 名 雇 佣 兵 ！
	if (Cord_SchonmalGefragt == FALSE)
	{
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_01"); //你 看 起 来 更 象 生 来 就 该 在 地 里 干 活 的 人 ， 小 伙 子 。
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_02"); //那 么 ， 你 能 使 用 武 器 吗 ？
		Cord_SchonmalGefragt = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_03"); //现 在 你 有 进 步 了 吗 ？
	};

	AI_Output(self, other, "DIA_Cord_WannaJoin_14_04"); //那 ， 单 手 武 器 怎 么 样 ？
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		AI_Output(other, self, "DIA_Cord_WannaJoin_15_05"); //但 是 我 还 不 错 。
	}
	else
	{
		AI_Output(other, self, "DIA_Cord_WannaJoin_15_06"); //好 … …
	};

	AI_Output(self, other, "DIA_Cord_WannaJoin_14_07"); //那 ， 还 有 双 手 武 器 呢 ？
	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		AI_Output(other, self, "DIA_Cord_WannaJoin_15_08"); //我 知 道 怎 么 用 那 个 。
	}
	else
	{
		AI_Output(other, self, "DIA_Cord_WannaJoin_15_09"); //我 敢 肯 定 我 会 进 步 的 ！
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	|| (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
	{
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_10"); //好 吧 ， 至 少 你 不 是 一 个 一 无 所 知 的 新 手 。 好 吧 。 我 准 备 投 票 让 你 加 入 。
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_11"); //你 可 以 从 我 这 里 打 听 其 它 任 何 你 需 要 知 道 的 事 情 。
		Cord_Approved = TRUE;
		B_GivePlayerXP(XP_Cord_Approved);
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_1);
		Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_3);
	}
	else
	{
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_12"); //换 句 话 说 ： 你 是 个 实 实 在 在 的 生 手 ！
		AI_Output(self, other, "DIA_Cord_WannaJoin_14_13"); //每 一 个 雇 佣 兵 都 要 依 赖 他 的 伙 伴 。 我 们 全 部 的 生 命 都 取 决 于 此 。
		B_Cord_BeBetter();

		Log_CreateTopic(TOPIC_CordProve, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CordProve, LOG_RUNNING);
		B_LogEntry(TOPIC_CordProve, TOPIC_CordProve_1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info YouAreRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_YouAreRanger(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 2;
	condition		= DIA_Addon_Cord_YouAreRanger_Condition;
	information		= DIA_Addon_Cord_YouAreRanger_Info;
	description		= "我 听 说 你 属 于 ‘ 水 之 环 ’ 。";
};

func int DIA_Addon_Cord_YouAreRanger_Condition()
{
	if ((RangerHelp_gildeSLD == TRUE)
	&& (Cord_SchonmalGefragt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Info()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_15_00"); //我 听 说 你 属 于 ‘ 水 之 环 ’ 。

	if (SC_IsRanger == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_14_01"); //哪 只 讨 厌 的 家 伙 的 大 嘴 没 有 闭 上 ？

		if (SC_KnowsCordAsRangerFromLee == TRUE)
		{
			AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_15_02"); //李 告 诉 我 的 。
		};

		if (SC_KnowsCordAsRangerFromLares == TRUE)
		{
			AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_15_03"); //莱 尔 瑞 兹 说 如 果 我 告 诉 你 ： 我 ‘ 居 住 在 他 的 翅 膀 下 面 ’ ， 你 就 可 以 帮 助 我 。
		};
	};

	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_14_04"); //（ 叹 气 ） 看 来 ， 我 现 在 必 须 照 顾 你 ， 不 是 吗 ？
	// AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_14_05"); // Was muss ich denn jetzt für dich machen, damit du die Schnauze hälst?
	AI_Output(self, other, "DIA_Addon_Cord_Add_14_01"); //好 吧 ， 那 你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_14_06"); //还 有 ， 关 于 你 现 在 要 告 诉 我 的 事 ， 要 非 常 小 心 。 因 为 如 果 我 听 到 了 不 喜 欢 听 到 的 话 ， 我 可 能 会 把 你 活 剥 了 。

	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "我 真 的 不 需 要 任 何 东 西 。 我 要 自 己 走 。", DIA_Addon_Cord_YouAreRanger_nix);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "我 想 要 你 的 盔 甲 。", DIA_Addon_Cord_YouAreRanger_ruestung);
	Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "我 想 要 你 的 武 器 ！", DIA_Addon_Cord_YouAreRanger_waffe);
	if (Cord_Approved == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "教 我 如 何 战 斗 。", DIA_Addon_Cord_YouAreRanger_kampf);
	};

	if (hero.guild == GIL_NONE)
	{
		// Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "Verschwinde hier. Ich will deinen Platz auf dem Hof einnehmen.", DIA_Addon_Cord_YouAreRanger_weg );
	};

	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "你 可 以 帮 我 加 入 雇 佣 兵 。", DIA_Addon_Cord_YouAreRanger_SLDAufnahme);
	};

	// Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "Bezahl mich für mein Schweigen.", DIA_Addon_Cord_YouAreRanger_Gold );
};

var int Cord_SC_Dreist;
func void B_DIA_Addon_Cord_YouAreRanger_WARN()
{
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_WARN_14_00"); //（ 恐 吓 ） 还 有 ， 如 果 我 听 说 你 不 能 闭 紧 你 的 嘴 ， 厄 运 就 会 降 临 到 你 头 上 。 这 些 话 我 只 说 一 遍 ， 明 白 吗 ？
};

func void B_DIA_Addon_Cord_YouAreRanger_FRESSE()
{
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_FRESSE_14_00"); //（ 狂 怒 的 ） 就 是 这 样 。 现 在 你 做 得 太 过 火 了 。 我 会 把 你 当 垃 圾 扫 出 院 子 去 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	Cord_RangerHelp_GetSLD = FALSE;
	Cord_RangerHelp_Fight = FALSE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void DIA_Addon_Cord_YouAreRanger_ruestung()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_ruestung_15_00"); //我 想 要 你 的 盔 甲 。

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_ruestung_14_01"); //再 说 一 遍 就 打 得 你 满 地 找 牙 。
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_waffe()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_Add_15_00"); //我 想 要 你 的 武 器 ！

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_Add_14_03"); //（ 胁 迫 ） 是 吗 ， 现 在 ？
		AI_Output(self, other, "DIA_Addon_Cord_Add_14_02"); //（ 冷 酷 地 ） 尽 管 试 试 来 拿 ！
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_weg()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_weg_15_00"); //走 开 。 我 要 取 代 你 在 这 个 农 场 里 的 位 置 。

	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_weg_14_01"); //别 在 我 面 前 装 腔 作 势 ， 小 子 ， 否 则 我 会 打 断 你 的 每 一 根 骨 头 。
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

var int DIA_Addon_Cord_YouAreRanger_SCGotOffer;

func void DIA_Addon_Cord_YouAreRanger_kampf()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_kampf_15_00"); //教 我 如 何 战 斗 。
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_kampf_14_01"); //好 吧 。 还 有 什 么 ？
	Cord_RangerHelp_Fight = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "就 是 这 样 。", DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_SLDAufnahme()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00"); //你 可 以 帮 忙 让 雇 佣 兵 们 接 受 我 。
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01"); //（ 大 笑 ） 我 现 在 才 明 白 。 好 吧 。 我 会 试 试 看 。 还 有 什 么 ？

	Cord_RangerHelp_GetSLD = TRUE;

	if (DIA_Addon_Cord_YouAreRanger_SCGotOffer == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cord_YouAreRanger, "就 是 这 样 。", DIA_Addon_Cord_YouAreRanger_reicht);
		DIA_Addon_Cord_YouAreRanger_SCGotOffer = TRUE;
	};
};

func void DIA_Addon_Cord_YouAreRanger_Gold()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_Gold_15_00"); //用 钱 封 住 我 的 嘴 。
	if (Cord_SC_Dreist == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_Gold_14_01"); //你 不 会 喜 欢 那 样 吧 ？ 那 对 你 太 不 好 了 。 我 不 会 接 受 勒 索 的 ， 小 鬼 。
		Cord_SC_Dreist = TRUE;
	}
	else
	{
		B_DIA_Addon_Cord_YouAreRanger_FRESSE();
	};
};

func void DIA_Addon_Cord_YouAreRanger_nix()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_nix_15_00"); //我 真 的 不 需 要 任 何 东 西 。 我 要 自 己 走 。
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_nix_14_01"); //如 果 那 就 是 你 希 望 的 。 把 握 住 你 的 机 会 。
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

func void DIA_Addon_Cord_YouAreRanger_reicht()
{
	AI_Output(other, self, "DIA_Addon_Cord_YouAreRanger_reicht_15_00"); //就 是 这 样 。
	AI_Output(self, other, "DIA_Addon_Cord_YouAreRanger_reicht_14_01"); //那 应 该 不 会 太 难 。
	B_DIA_Addon_Cord_YouAreRanger_WARN();
	Info_ClearChoices(DIA_Addon_Cord_YouAreRanger);
};

///////////////////////////////////////////////////////////////////////
//	Info RangerHelp2GetSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_RangerHelp2GetSLD(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 2;
	condition		= DIA_Addon_Cord_RangerHelp2GetSLD_Condition;
	information		= DIA_Addon_Cord_RangerHelp2GetSLD_Info;
	permanent		= TRUE;
	description		= "帮 我 成 为 雇 佣 兵 。";
};

var int DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm;
func int DIA_Addon_Cord_RangerHelp2GetSLD_Condition()
{
	if ((Cord_RangerHelp_GetSLD == TRUE)
	&& (hero.guild == GIL_NONE)
	&& (DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void B_Cord_RangerHelpObsolete()
{
	AI_Output(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_00"); //已 经 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_01"); //哦 。 那 么 ， 我 想 我 不 能 帮 你 。
	AI_Output(other, self, "DIA_Addon_Cord_RangerHelpObsolete_15_02"); //你 那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_03"); //嗯 ， 那 意 味 着 我 不 能 帮 助 你 。
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_04"); //或 者 ， 你 想 让 我 和 每 一 个 雇 佣 兵 作 对 ， 就 是 为 了 你 能 加 入 这 里 ？
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelpObsolete_14_05"); //那 你 就 必 须 亲 自 去 做 。
	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
	TOPIC_End_RangerHelpSLD = TRUE;
};

func void B_Cord_ComeLaterWhenDone()
{
	AI_Output(self, other, "DIA_Addon_Cord_ComeLaterWhenDone_14_00"); //那 么 ， 继 续 吧 ， 解 决 它 ， 然 后 回 这 里 来 。
	AI_StopProcessInfos(self);
};

func void B_Cord_IDoItForYou()
{
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_00"); //啊 ， 是 的 。 那 很 容 易 。 听 着 。 明 天 再 来 。 到 那 时 我 就 已 经 解 决 它 了 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_01"); //但 是 ， 你 将 必 须 为 我 办 几 件 事 作 为 回 报 。
	AI_Output(other, self, "DIA_Addon_Cord_IDoItForYou_15_02"); //那 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_03"); //离 这 里 不 远 ， 在 东 南 边 ， 山 里 有 一 个 小 型 的 强 盗 营 地 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_04"); //如 果 你 从 这 里 往 东 南 边 走 ， 很 快 就 会 看 到 那 里 的 塔 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_05"); //前 些 日 子 ， 我 们 的 一 个 伙 计 - 帕 特 里 克 离 开 这 里 去 跟 那 些 恶 棍 做 生 意 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_06"); //嗯 。 我 告 诉 他 那 是 个 倒 霉 的 主 意 。 但 那 个 白 痴 不 肯 听 我 的 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_07"); //我 猜 他 们 已 经 干 掉 他 了 。 但 是 我 不 敢 肯 定 。
	AI_Output(self, other, "DIA_Addon_Cord_IDoItForYou_14_08"); //你 要 帮 我 查 明 真 相 。

	B_LogEntry(TOPIC_Addon_RangerHelpSLD, TOPIC_Addon_RangerHelpSLD_1);

	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD, "算 了 吧 。 那 比 托 尔 洛 夫 的 任 务 还 要 难 。", B_Cord_IDoItForYou_mist);
	Info_AddChoice(DIA_Addon_Cord_RangerHelp2GetSLD, "是 什 么 让 你 如 此 确 定 他 们 不 会 也 除 掉 我 呢 ？", B_Cord_IDoItForYou_Dexter);

	DIA_Addon_Cord_RangerHelp2GetSLD_NoPerm = TRUE;
};

func void B_Cord_IDoItForYou_mist()
{
	AI_Output(other, self, "Dia_Addon_Cord_IDoItForYou_mist_15_00"); //算 了 吧 。 那 比 托 尔 洛 夫 的 任 务 还 要 难 。
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_01"); //不 一 定 。 象 你 这 么 微 不 足 道 、 滑 头 滑 脑 、 不 三 不 四 的 家 伙 不 会 引 起 他 们 多 大 兴 趣 的 。
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_mist_14_02"); //而 且 ， 我 不 能 亲 自 去 干 这 件 事 。 那 些 小 子 只 要 看 见 雇 佣 兵 就 会 暴 跳 如 雷 。
};

func void B_Cord_IDoItForYou_Dexter()
{
	AI_Output(other, self, "Dia_Addon_Cord_IDoItForYou_Dexter_15_00"); //是 什 么 让 你 如 此 确 定 他 们 不 会 也 除 掉 我 呢 ？
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_01"); //事 实 上 ， 我 知 道 他 们 的 头 儿 的 名 字 。 他 叫 德 克 斯 特 。 你 可 以 直 接 说 你 认 识 那 个 家 伙 。
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_02"); //那 么 ， 最 糟 糕 的 情 况 是 ： 他 的 人 在 扭 断 你 的 脖 子 前 还 会 考 虑 考 虑 。
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_03"); //当 然 ， 那 样 还 是 很 危 险 。
	AI_Output(self, other, "Dia_Addon_Cord_IDoItForYou_Dexter_14_04"); //但 是 你 能 做 到 。
	Info_ClearChoices(DIA_Addon_Cord_RangerHelp2GetSLD);

	B_LogEntry(TOPIC_Addon_RangerHelpSLD, TOPIC_Addon_RangerHelpSLD_2);

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_2);

	MIS_Addon_Cord_Look4Patrick = LOG_RUNNING;
	Ranger_SCKnowsDexter = TRUE;
};

func void DIA_Addon_Cord_RangerHelp2GetSLD_Info()
{
	AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_00"); //帮 我 成 为 雇 佣 兵 。
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_01"); //让 我 想 想 。 嗯 。 如 果 你 想 在 这 里 发 展 ， 就 必 须 设 法 通 过 托 尔 洛 夫 这 一 关 。
	AI_Output(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_02"); //你 已 经 见 过 托 尔 洛 夫 了 吗 ？

	if (Torlof_Go == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_03"); //不 太 正 确 。
		B_Cord_ComeLaterWhenDone();
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_04"); //是 的 。 是 跟 测 试 和 其 它 事 的 一 起 。
		AI_Output(self, other, "DIA_Addon_Cord_RangerHelp2GetSLD_14_05"); //啊 。 那 会 是 什 么 测 试 ？

		if ((Torlof_ProbeBestanden == TRUE)
		|| ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING) && (Npc_IsDead(Rumbold)) && (Npc_IsDead(Rick)))
		|| ((MIS_Torlof_HolPachtVonSekob == LOG_RUNNING) && ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE) || (Npc_IsDead(Sekob)))))
		{
			B_Cord_RangerHelpObsolete();
		}
		else if (Torlof_Probe == 0)
		{
			AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_06"); //我 还 没 有 接 受 。
			B_Cord_ComeLaterWhenDone();
		}
		else if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_07"); //我 必 须 去 塞 柯 布 的 农 场 收 租 。
			B_Cord_IDoItForYou();
		}
		else if (Torlof_Probe == Probe_Bengar)
		{
			AI_Output(other, self, "DIA_Addon_Cord_RangerHelp2GetSLD_15_08"); //我 必 须 去 把 民 兵 从 本 加 的 农 场 赶 出 去 。
			B_Cord_IDoItForYou();
		}
		else
		{
			B_Cord_RangerHelpObsolete();
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cord_TalkedToDexter(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 5;
	condition		= DIA_Addon_Cord_TalkedToDexter_Condition;
	information		= DIA_Addon_Cord_TalkedToDexter_Info;
	description		= "我 要 去 看 德 克 斯 特 。";
};

func int DIA_Addon_Cord_TalkedToDexter_Condition()
{
	if (((BDT_1060_Dexter.aivar[AIV_TalkedToPlayer] == TRUE)
	|| (Npc_IsDead(BDT_1060_Dexter)))
	&& (MIS_Addon_Cord_Look4Patrick == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cord_TalkedToDexter_Info()
{
	AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_00"); //我 要 去 看 德 克 斯 特 。
	AI_Output(self, other, "DIA_Addon_Cord_TalkedToDexter_14_01"); //然 后 ？

	if (Npc_IsDead(BDT_1060_Dexter))
	{
		AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_02"); //德 克 斯 特 死 了 。
	};

	AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_03"); //那 上 面 没 有 你 的 同 伴 帕 特 里 克 的 踪 迹 。

	if (Dexter_KnowsPatrick == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_04"); //德 克 斯 特 记 得 他 ， 但 是 ， 他 说 那 是 很 久 以 前 他 见 过 他 。
		AI_Output(self, other, "DIA_Addon_Cord_TalkedToDexter_14_05"); //那 你 敢 肯 定 德 克 斯 特 没 有 对 你 撒 谎 吗 ？
		AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_06"); //不 ， 我 不 确 定 。 但 是 ， 我 只 能 告 诉 你 这 些 了 。
	};

	AI_Output(self, other, "DIA_Addon_Cord_TalkedToDexter_14_07"); //我 不 知 道 。 看 来 ， 他 似 乎 已 经 完 全 消 失 了 。
	AI_Output(self, other, "DIA_Addon_Cord_TalkedToDexter_14_08"); //嗯 ， 你 完 成 了 契 约 里 你 的 那 一 部 分 … …

	MIS_Addon_Cord_Look4Patrick = LOG_SUCCESS;
	TOPIC_End_RangerHelpSLD = TRUE;
	B_GivePlayerXP(XP_Addon_Cord_Look4Patrick);

	AI_Output(other, self, "DIA_Addon_Cord_TalkedToDexter_15_09"); //托 尔 洛 夫 的 测 试 现 在 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Cord_TalkedToDexter_14_10"); //别 担 心 ， 你 可 以 回 去 找 托 尔 洛 夫 。 你 的 任 务 完 成 了 ， 而 且 你 通 过 了 测 试 。 我 告 诉 过 你 我 会 安 排 好 的 。

	Cord_RangerHelp_TorlofsProbe = TRUE;

	if (Torlof_Probe == Probe_Sekob)
	{
		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
	}
	else if (Torlof_Probe == Probe_Bengar)
	{
		MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	};
};

// ************************************************************
// 			  ReturnPatrick
// ************************************************************
instance DIA_Cord_ReturnPatrick(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 8;
	condition		= DIA_Cord_ReturnPatrick_Condition;
	information		= DIA_Cord_ReturnPatrick_Info;
	description		= "帕 特 里 克 回 来 了 。";
};

func int DIA_Cord_ReturnPatrick_Condition()
{
	if ((Npc_GetDistToWP(Patrick_NW, "NW_BIGFARM_PATRICK") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cord_ReturnPatrick_Info()
{
	AI_Output(other, self, "DIA_Addon_Cord_ReturnPatrick_15_00"); //帕 特 里 克 回 来 了 。
	AI_Output(self, other, "DIA_Addon_Cord_ReturnPatrick_14_01"); //是 的 ， 伙 计 。 我 几 乎 放 弃 了 希 望 。 你 … …
	AI_Output(other, self, "DIA_Addon_Cord_ReturnPatrick_15_02"); //嘿 ， 帮 帮 我 。
	AI_Output(self, other, "DIA_Addon_Cord_ReturnPatrick_14_03"); //真 的 ？
	AI_Output(other, self, "DIA_Addon_Cord_ReturnPatrick_15_04"); //不 用 对 我 们 说 感 谢 的 话 了。
	AI_Output(self, other, "DIA_Addon_Cord_ReturnPatrick_14_05"); //我 根 本 没 打 算 谢 你 。
	AI_Output(other, self, "DIA_Addon_Cord_ReturnPatrick_15_06"); //但 是 … … ？
	AI_Output(self, other, "DIA_Addon_Cord_ReturnPatrick_14_07"); //（ 咧 着 嘴 笑 ） 我 本 来 是 准 备 告 诉 你 ： 你 是 一 个 该 死 的 厚 颜 无 耻 的 恶 棍 。
	AI_Output(self, other, "DIA_Addon_Cord_ReturnPatrick_14_09"); //（ 咧 着 嘴 笑 ） 保 持 冷 静 ！

	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				ExplainSkills
// ************************************************************
instance DIA_Cord_ExplainSkills(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 1;
	condition		= DIA_Cord_ExplainSkills_Condition;
	information		= DIA_Cord_ExplainSkills_Info;
	description		= "我 要 首 先 学 习 什 么 ， 单 手 还 是 双 手 战 斗 ？";
};

func int DIA_Cord_ExplainSkills_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainSkills_Info()
{
	AI_Output(other, self, "DIA_Cord_ExplainSkills_15_00"); //我 要 首 先 学 习 什 么 ， 单 手 还 是 双 手 战 斗 ？
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_01"); //那 两 种 武 器 非 常 相 似 。
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_02"); //一 旦 你 到 达 了 某 一 种 武 器 的 下 一 个 级 别 ， 你 就 同 样 自 动 学 会 了 另 一 种 。
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_03"); //举 个 例 子 ， 如 果 你 善 于 使 用 单 手 剑 战 斗 ， 但 是 在 双 手 武 器 方 面 还 是 个 初 学 者 … …
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_04"); //… … 你 的 双 手 技 能 将 在 你 训 练 单 手 武 器 的 过 程 中 同 时 增 加 。
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_05"); //如 果 你 只 拿 某 一 种 武 器 训 练 ， 你 会 发 现 这 样 训 练 会 更 加 费 时 费 力 。
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_06"); //如 果 你 总 是 两 种 武 器 同 时 训 练 ， 你 将 会 花 较 少 的 功 夫 获 得 同 等 的 成 效 。
	AI_Output(self, other, "DIA_Cord_ExplainSkills_14_07"); //最 后 ， 两 种 方 式 都 能 得 到 同 一 个 结 果 - 那 是 你 的 选 择 了 。
};

// ************************************************************
// 			  				ExplainWeapons
// ************************************************************
instance DIA_Cord_ExplainWeapons(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 2;
	condition		= DIA_Cord_ExplainWeapons_Condition;
	information		= DIA_Cord_ExplainWeapons_Info;
	description		= "单 手 或 者 双 手 武 器 的 优 点 是 什 么 ？";
};

func int DIA_Cord_ExplainWeapons_Condition()
{
	if (Cord_Approved == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cord_ExplainWeapons_Info()
{
	AI_Output(other, self, "DIA_Cord_ExplainWeapons_15_00"); //单 手 武 器 和 双 手 武 器 各 自 的 优 势 是 什 么 ？
	AI_Output(self, other, "DIA_Cord_ExplainWeapons_14_01"); //这 个 问 题 问 得 好 。 我 知 道 ， 你 已 经 花 了 些 心 思 在 想 这 件 事 情 。
	AI_Output(self, other, "DIA_Cord_ExplainWeapons_14_02"); //单 手 武 器 速 度 更 快 ， 但 威 力 较 小 。
	AI_Output(self, other, "DIA_Cord_ExplainWeapons_14_03"); //双 手 武 器 能 造 成 更 多 伤 害 ， 但 是 ， 你 无 法 快 速 攻 击 。
	AI_Output(self, other, "DIA_Cord_ExplainWeapons_14_04"); //还 有 ， 需 要 更 大 的 力 量 来 挥 动 一 把 双 手 武 器 。 这 意 味 着 额 外 的 训 练 。
	AI_Output(self, other, "DIA_Cord_ExplainWeapons_14_05"); //成 为 真 正 高 手 唯 一 的 方 法 是 付 出 巨 大 的 努 力 。
};

// ******************************************************
//							Teach
// ******************************************************

var int Cord_Merke_1h;
var int Cord_Merke_2h;
// ------------------------------------------------------
instance DIA_Cord_Teach(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 3;
	condition		= DIA_Cord_Teach_Condition;
	information		= DIA_Cord_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 战 斗 ！";
};

func int DIA_Cord_Teach_Condition()
{
	return TRUE;
};

func void B_Cord_Zeitverschwendung()
{
	AI_Output(self, other, "DIA_Cord_Teach_14_03"); //我 不 会 在 新 手 身 上 浪 费 时 间 。
};

func void DIA_Cord_Teach_Info()
{
	AI_Output(other, self, "DIA_Cord_Teach_15_00"); //教 我 如 何 战 斗 ！
	if ((Cord_Approved == TRUE)
	|| (hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG)
	|| (Cord_RangerHelp_Fight == TRUE)) // ADDON
	{
		if (((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0))
		|| (Cord_RangerHelp_Fight == TRUE)) // ADDON
		{
			AI_Output(self, other, "DIA_Cord_Teach_14_01"); //我 可 以 教 你 使 用 任 何 武 器 - 我 们 要 从 哪 里 开 始。
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
		{
			AI_Output(self, other, "DIA_Cord_Teach_14_02"); //我 可 以 训 练 你 使 用 单 手 剑 。 但 是 ， 你 还 没 有 能 力 挥 动 一 把 双 手 巨 剑 。
			B_Cord_Zeitverschwendung();
			Cord_Approved = TRUE;
		}
		else if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
		{
			AI_Output(self, other, "DIA_Cord_Teach_14_04"); //当 提 到 单 手 剑 的 时 候 ， 你 就 是 个 彻 头 彻 尾 的 新 手 ！ 但 是 ， 你 的 双 手 武 器 技 能 不 算 太 差 。
			AI_Output(self, other, "DIA_Cord_Teach_14_05"); //如 果 你 需 要 更 多 使 用 单 手 武 器 的 经 验 ， 就 去 找 另 一 个 老 师 。
			Cord_Approved = TRUE;
		}
		else
		{
			B_Cord_Zeitverschwendung();
			B_Cord_BeBetter();
		};

		if (Cord_Approved == TRUE)
		{
			Info_ClearChoices(DIA_Cord_Teach);
			Info_AddChoice(DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);

			if ((Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)) // ADDON
			{
				Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Cord_Teach_2H_1);
				Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Cord_Teach_2H_5);
			};

			if ((Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
			|| (Cord_RangerHelp_Fight == TRUE)) // ADDON
			{
				Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Cord_Teach_1H_1);
				Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
			};

			Cord_Merke_1h = other.HitChance[NPC_TALENT_1H];
			Cord_Merke_2h = other.HitChance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Cord_Teach_14_06"); //我 只 训 练 雇 佣 兵 ， 或 者 适 当 的 候 选 人 ！
	};
};

func void DIA_Cord_Teach_Back()
{
	if ((Cord_Merke_1h < other.HitChance[NPC_TALENT_1H])
	|| (Cord_Merke_2h < other.HitChance[NPC_TALENT_2H]))
	{
		AI_Output(self, other, "DIA_Cord_Teach_BACK_14_00"); //你 已 经 进 步 了 - 别 松 劲 ！
	};

	Info_ClearChoices(DIA_Cord_Teach);
};

func void DIA_Cord_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);

	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Cord_Teach_2H_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 90);

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);

	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Cord_Teach_2H_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 90);

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);

	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Cord_Teach_2H_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

func void DIA_Cord_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 90);

	Info_ClearChoices(DIA_Cord_Teach);
	Info_AddChoice(DIA_Cord_Teach, DIALOG_BACK, DIA_Cord_Teach_Back);

	if (Npc_GetTalentSkill(other, NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Cord_Teach_2H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Cord_Teach_2H_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Cord_Teach_1H_1);
		Info_AddChoice(DIA_Cord_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Cord_Teach_1H_5);
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Cord_PICKPOCKET(C_INFO)
{
	npc				= SLD_805_Cord;
	nr				= 900;
	condition		= DIA_Cord_PICKPOCKET_Condition;
	information		= DIA_Cord_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Cord_PICKPOCKET_Condition()
{
	C_Beklauen(65, 75);
};

func void DIA_Cord_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
	Info_AddChoice(DIA_Cord_PICKPOCKET, DIALOG_BACK, DIA_Cord_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cord_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Cord_PICKPOCKET_DoIt);
};

func void DIA_Cord_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};

func void DIA_Cord_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cord_PICKPOCKET);
};
