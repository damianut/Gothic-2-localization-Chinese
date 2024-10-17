///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_EXIT(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 999;
	condition		= DIA_Gaan_EXIT_Condition;
	information		= DIA_Gaan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

var int DIA_Gaan_EXIT_oneTime;
func int DIA_Gaan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if (DIA_Gaan_EXIT_oneTime == FALSE)
	{
		Npc_ExchangeRoutine(self, "Start");
		DIA_Gaan_EXIT_oneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MeetingIsRunning(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 1;
	condition		= DIA_Addon_Gaan_MeetingIsRunning_Condition;
	information		= DIA_Addon_Gaan_MeetingIsRunning_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Gaan_MeetingIsRunning_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int DIA_Addon_Gaan_MeetingIsRunning_One_time;
func void DIA_Addon_Gaan_MeetingIsRunning_Info()
{
	if (DIA_Addon_Gaan_MeetingIsRunning_One_time == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_00"); //我 们 中 间 又 有 一 张 新 面 孔 了 。 欢 迎 加 入 ‘ 水 之 环 ’ 。
		DIA_Addon_Gaan_MeetingIsRunning_One_time = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Gaan_MeetingIsRunning_03_01"); //瓦 卓 斯 想 要 见 你 。 你 最 好 马 上 去 找 他 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_HALLO(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 3;
	condition		= DIA_Gaan_HALLO_Condition;
	information		= DIA_Gaan_HALLO_Info;
	description		= "你 在 这 里 有 很 大 的 地 方 。";
};

func int DIA_Gaan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Gaan_HALLO_Info()
{
	AI_Output(other, self, "DIA_Gaan_HALLO_15_00"); //你 在 这 里 有 很 大 的 地 方 。
	AI_Output(self, other, "DIA_Gaan_HALLO_03_01"); //非 常 好 。 但 是 如 果 你 想 要 通 过 那 里 的 关 卡 的 话 ， 你 不 用 考 虑 那 么 久 。
	AI_Output(self, other, "DIA_Gaan_HALLO_03_02"); //如 果 这 一 小 片 土 地 让 你 感 到 印 象 深 刻 的 话 ， 那 就 等 你 见 到 那 边 的 矿 藏 山 谷 时 再 说 。
};

///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASMACHSTDU(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 4;
	condition		= DIA_Gaan_WASMACHSTDU_Condition;
	information		= DIA_Gaan_WASMACHSTDU_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Gaan_WASMACHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Gaan_HALLO))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Gaan_WASMACHSTDU_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Gaan_WASMACHSTDU_03_01"); //我 的 名 字 叫 加 安 。 我 是 为 本 加 工 作 的 猎 人 ， 他 是 高 原 牧 场 这 里 的 农 场 主 。
	AI_Output(self, other, "DIA_Gaan_WASMACHSTDU_03_02"); //我 大 部 分 时 间 都 在 野 外 度 过 的 ， 享 受 阳 光 。
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_Ranger(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 2;
	condition		= DIA_Addon_Gaan_Ranger_Condition;
	information		= DIA_Addon_Gaan_Ranger_Info;
	description		= "你 为 什 么 看 起 来 这 么 严 肃 ？";
};

func int DIA_Addon_Gaan_Ranger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Gaan_HALLO))
	&& (SCIsWearingRangerRing == TRUE)
	&& (RangerMeetingRunning == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_Ranger_Info()
{
	AI_Output(other, self, "DIA_Addon_Gaan_Ranger_15_00"); //你 为 什 么 看 起 来 这 么 严 肃 ？
	AI_Output(self, other, "DIA_Addon_Gaan_Ranger_03_01"); //你 戴 着 我 们 的 蓝 宝 石 戒 指 。
	AI_Output(other, self, "DIA_Addon_Gaan_Ranger_15_02"); //你 属 于 ‘ 水 之 环 ’ 了 ？
	AI_Output(self, other, "DIA_Addon_Gaan_Ranger_03_03"); //我 当 然 是 。 很 高 兴 能 看 到 我 们 成 员 中 的 新 面 孔 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info AufgabeBeimRing
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_AufgabeBeimRing(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 2;
	condition		= DIA_Addon_Gaan_AufgabeBeimRing_Condition;
	information		= DIA_Addon_Gaan_AufgabeBeimRing_Info;
	description		= "你 在 ‘ 水 之 环 ’ 里 的 任 务 是 什 么 ？";
};

func int DIA_Addon_Gaan_AufgabeBeimRing_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Addon_Gaan_Ranger))
	|| (RangerMeetingRunning != 0))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_AufgabeBeimRing_Info()
{
	AI_Output(other, self, "DIA_Addon_Gaan_AufgabeBeimRing_15_00"); //你 在 ‘ 水 之 环 ’ 里 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_01"); //我 一 直 留 意 关 卡 的 入 口 ， 看 有 谁 进 出 。
	AI_Output(self, other, "DIA_Addon_Gaan_AufgabeBeimRing_03_02"); //可 能 是 因 为 圣 骑 士 已 经 封 闭 了 关 卡 ， 所 以 并 没 有 太 多 人 进 进 出 出 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gaan_MissingPeople(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 2;
	condition		= DIA_Addon_Gaan_MissingPeople_Condition;
	information		= DIA_Addon_Gaan_MissingPeople_Info;
	description		= "你 听 说 过 那 些 失 踪 人 吗 ？";
};

func int DIA_Addon_Gaan_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Gaan_AufgabeBeimRing))
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Gaan_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Gaan_MissingPeople_15_00"); //你 听 说 过 那 些 失 踪 人 吗 ？
	AI_Output(self, other, "DIA_Addon_Gaan_MissingPeople_03_01"); //我 当 然 有 。 所 以 我 们 才 要 保 持 警 惕 。
	AI_Output(self, other, "DIA_Addon_Gaan_MissingPeople_03_02"); //但 是 说 实 话 ， 我 没 有 看 到 很 多 能 给 你 提 供 线 索 的 东 西 。
};

///////////////////////////////////////////////////////////////////////
//	Info wald
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WALD(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 5;
	condition		= DIA_Gaan_WALD_Condition;
	information		= DIA_Gaan_WALD_Info;
	description		= "关 于 矿 藏 山 谷 我 需 要 了 解 什 么 ？";
};

func int DIA_Gaan_WALD_Condition()
{
	return TRUE;
};

func void DIA_Gaan_WALD_Info()
{
	AI_Output(other, self, "DIA_Gaan_WALD_15_00"); //关 于 矿 藏 山 谷 我 需 要 了 解 什 么 ？
	AI_Output(self, other, "DIA_Gaan_WALD_03_01"); //不 知 道 。 我 只 是 扫 了 一 眼 山 谷 。 看 起 来 非 常 危 险 。
	AI_Output(self, other, "DIA_Gaan_WALD_03_02"); //如 果 你 通 过 关 卡 到 那 里 之 后 ， 最 好 紧 靠 那 些 被 踏 平 的 小 道 。
	AI_Output(self, other, "DIA_Gaan_WALD_03_03"); //你 既 可 以 穿 过 大 峡 谷 ， 也 可 以 从 石 桥 上 面 的 路 走 。 那 一 条 比 较 短 ， 也 安 全 一 些 。
	AI_Output(self, other, "DIA_Gaan_WALD_03_04"); //由 于 兽 人 在 那 里 四 处 游 荡 ， 你 必 须 要 留 点 神 。
	AI_Output(self, other, "DIA_Gaan_WALD_03_05"); //我 可 不 想 拖 着 你 到 草 药 女 巫 那 里 去 。
};

///////////////////////////////////////////////////////////////////////
//	Info sagitta
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_SAGITTA(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 7;
	condition		= DIA_Gaan_SAGITTA_Condition;
	information		= DIA_Gaan_SAGITTA_Info;
	description		= "草 药 女 巫 ？";
};

func int DIA_Gaan_SAGITTA_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gaan_WALD))
	{
		return TRUE;
	};
};

func void DIA_Gaan_SAGITTA_Info()
{
	AI_Output(other, self, "DIA_Gaan_SAGITTA_15_00"); //草 药 女 巫 ？
	AI_Output(self, other, "DIA_Gaan_SAGITTA_03_01"); //她 的 名 字 叫 萨 吉 塔 。 她 是 给 农 民 和 其 它 生 活 在 港 口 城 市 外 的 人 治 病 的 医 生 。
	AI_Output(self, other, "DIA_Gaan_SAGITTA_03_02"); //一 个 非 常 古 怪 的 女 性 。
	AI_Output(self, other, "DIA_Gaan_SAGITTA_03_03"); //没 人 愿 意 真 的 走 近 她 ， 但 所 有 人 都 喜 欢 谈 论 她 。
	AI_Output(self, other, "DIA_Gaan_SAGITTA_03_04"); //不 过 如 果 你 生 了 病 ， 你 找 不 到 比 萨 吉 塔 更 好 的 医 生 了 ， 她 的 厨 房 里 都 是 治 疗 药 草 。
	AI_Output(self, other, "DIA_Gaan_SAGITTA_03_05"); //你 可 以 在 塞 柯 布 的 农 场 后 面 狭 长 的 树 林 里 找 到 她 。
};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTER(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 8;
	condition		= DIA_Gaan_MONSTER_Condition;
	information		= DIA_Gaan_MONSTER_Info;
	description		= "这 种 危 险 的 野 兽 是 什 么 样 子 ？";
};

func int DIA_Gaan_MONSTER_Condition()
{
	if (
	(MIS_Gaan_Snapper == LOG_RUNNING)
	&& ((Npc_IsDead(Gaans_Snapper)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTER_Info()
{
	AI_Output(other, self, "DIA_Gaan_MONSTER_15_00"); //这 种 危 险 的 野 兽 是 什 么 样 子 ？
	AI_Output(self, other, "DIA_Gaan_MONSTER_03_01"); //我 也 知 道 得 不 是 很 清 楚 。 到 目 前 为 止 ， 我 主 要 听 到 的 是 呼 噜 声 和 抓 挠 的 声 音 。 但 是 我 已 经 见 过 它 能 做 什 么 。
	AI_Output(self, other, "DIA_Gaan_MONSTER_03_02"); //即 使 狼 也 无 法 安 全 从 它 口 中 逃 脱 。 那 头 野 兽 甚 至 把 其 中 一 头 的 脑 袋 打 掉 。
};

///////////////////////////////////////////////////////////////////////
//	Info monster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WASZAHLSTDU(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 9;
	condition		= DIA_Gaan_WASZAHLSTDU_Condition;
	information		= DIA_Gaan_WASZAHLSTDU_Info;
	description		= "如 果 我 帮 你 杀 了 那 头 野 兽 ， 你 付 我 多 少 钱 ？";
};

func int DIA_Gaan_WASZAHLSTDU_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
	&& ((Npc_IsDead(Gaans_Snapper)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Gaan_WASZAHLSTDU_Info()
{
	AI_Output(other, self, "DIA_Gaan_WASZAHLSTDU_15_00"); //如 果 我 帮 你 杀 了 那 头 野 兽 ， 你 付 我 多 少 钱 ？
	AI_Output(self, other, "DIA_Gaan_WASZAHLSTDU_03_01"); //我 会 把 能 分 享 的 一 切 都 给 那 个 杀 死 它 的 人 。
	// AI_Output(self, other, "DIA_Gaan_WASZAHLSTDU_03_02"); // 30 Goldmünzen?
	// Auskommentiert, weil "?" ist auch so gesprochen worden - kommt nicht gut
	B_Say_Gold(self, other, 30);
	MIS_Gaan_Deal = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info wohermonster
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_WOHERMONSTER(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 10;
	condition		= DIA_Gaan_WOHERMONSTER_Condition;
	information		= DIA_Gaan_WOHERMONSTER_Info;
	description		= "这 头 可 恶 的 野 兽 是 从 哪 里 来 的 ？";
};

func int DIA_Gaan_WOHERMONSTER_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Gaan_MONSTER))
	&& ((Npc_IsDead(Gaans_Snapper)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Gaan_WOHERMONSTER_Info()
{
	AI_Output(other, self, "DIA_Gaan_WOHERMONSTER_15_00"); //这 头 可 恶 的 野 兽 是 从 哪 里 来 的 ？
	AI_Output(self, other, "DIA_Gaan_WOHERMONSTER_03_01"); //从 森 林 外 的 某 个 地 方 。 也 许 来 自 矿 藏 山 谷 。 但 是 我 无 法 确 定 。
	AI_Output(self, other, "DIA_Gaan_WOHERMONSTER_03_02"); //我 从 来 没 有 去 过 矿 藏 山 谷 。
};

///////////////////////////////////////////////////////////////////////
//	Info MonsterTot
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_MONSTERTOT(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 11;
	condition		= DIA_Gaan_MONSTERTOT_Condition;
	information		= DIA_Gaan_MONSTERTOT_Info;
	important		= TRUE;
};

func int DIA_Gaan_MONSTERTOT_Condition()
{
	if (((Npc_IsDead(Gaans_Snapper)) == TRUE)
	&& (RangerMeetingRunning != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Gaan_MONSTERTOT_Info()
{
	AI_Output(self, other, "DIA_Gaan_MONSTERTOT_03_00"); //我 想 那 头 恐 怖 的 野 兽 已 经 死 了 。
	AI_Output(self, other, "DIA_Gaan_MONSTERTOT_03_01"); //那 么 我 终 于 可 以 再 次 自 由 狩 猎 了 。

	if (MIS_Gaan_Deal == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Gaan_MONSTERTOT_03_02"); //这 是 我 答 应 给 你 的 钱 。

		CreateInvItems(self, ItMi_Gold, 30);
		B_GiveInvItems(self, other, ItMi_Gold, 30);
	};

	MIS_Gaan_Snapper = LOG_SUCCESS;
	B_GivePlayerXP(XP_Gaan_WaldSnapper);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			  ASK TEACHER
// ************************************************************
instance DIA_Gaan_AskTeacher(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 10;
	condition		= DIA_Gaan_AskTeacher_Condition;
	information		= DIA_Gaan_AskTeacher_Info;
	description		= "你 能 教 我 狩 猎 吗 ？";
};

func int DIA_Gaan_AskTeacher_Condition()
{
	return TRUE;
};

func void DIA_Gaan_AskTeacher_Info()
{
	AI_Output(other, self, "DIA_Gaan_AskTeacher_15_00"); //你 能 教 我 狩 猎 吗 ？
	AI_Output(self, other, "DIA_Gaan_AskTeacher_03_01"); //没 问 题 。 给 我100枚 金 币 ， 我 能 教 你 如 何 解 剖 你 猎 杀 的 动 物 。
	AI_Output(self, other, "DIA_Gaan_AskTeacher_03_02"); //在 市 场 上 ， 毛 皮 和 其 它 战 利 品 都 能 卖 很 多 钱 。

	Log_CreateTopic(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, TOPIC_Teacher_1);
};

// ************************************************************
// 			  			  PAY TEACHER
// ************************************************************
instance DIA_Gaan_PayTeacher(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 11;
	condition		= DIA_Gaan_PayTeacher_Condition;
	information		= DIA_Gaan_PayTeacher_Info;
	permanent		= TRUE;
	description		= "给 。 １ ０ ０ 金 币 ， 学 习 你 解 剖 动 物 的 技 能 。";
};

var int DIA_Gaan_PayTeacher_noPerm;

func int DIA_Gaan_PayTeacher_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Gaan_AskTeacher))
	&& (DIA_Gaan_PayTeacher_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gaan_PayTeacher_Info()
{
	AI_Output(other, self, "DIA_Gaan_PayTeacher_15_00"); //给 。 １ ０ ０ 金 币 ， 学 习 你 解 剖 动 物 的 技 能 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(self, other, "DIA_Gaan_PayTeacher_03_01"); //谢 谢 。 现 在 说 。
		Gaan_TeachPlayer = TRUE;
		DIA_Gaan_PayTeacher_noPerm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Gaan_PayTeacher_03_02"); //稍 后 再 说 吧 ， 等 你 有 一 些 钱 的 时 候 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_TEACHHUNTING(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 12;
	condition		= DIA_Gaan_TEACHHUNTING_Condition;
	information		= DIA_Gaan_TEACHHUNTING_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么?";
};

func int DIA_Gaan_TEACHHUNTING_Condition()
{
	if (Gaan_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaan_TEACHHUNTING_Info()
{
	AI_Output(other, self, "DIA_Gaan_TEACHHUNTING_15_00"); //你 能 教 我 什 么 ?
	if (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE) && (MIS_Gaan_Snapper == LOG_SUCCESS))
	)
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_03_01"); //那 要 看 你 想 要 了 解 什 么 。

		Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_TEETH, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Gaan_TEACHHUNTING_Teeth);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_CLAWS, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), DIA_Gaan_TEACHHUNTING_Claws);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_FUR, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), DIA_Gaan_TEACHHUNTING_Fur);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_BLOODFLY_STING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), DIA_Gaan_TEACHHUNTING_BFSting);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_BLOODFLY_WING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), DIA_Gaan_TEACHHUNTING_BFWing);
		};

		if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DrgSnapperHorn] == FALSE)
		&& (MIS_Gaan_Snapper == LOG_SUCCESS))
		{
			Info_AddChoice(DIA_Gaan_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_DRAGON_SNAPPER_HORN, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DrgSnapperHorn)), DIA_Gaan_TEACHHUNTING_DrgSnapperHorn);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_03_02"); //现 在 ， 我 不 能 教 你 任 何 你 还 不 会 的 东 西 。 对 不 起 。
	};
};

func void DIA_Gaan_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Gaan_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Claws))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_00"); //动 物 永 远 不 会 放 弃 它 们 的 爪 子 。 你 必 须 非 常 精 确 地 下 刀 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_01"); //你 的 手 要 略 微 交 叉 。 然 后 用 力 一 切 把 爪 子 分 离 下 来 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Claws_03_02"); //商 人 们 总 是 非 常 渴 望 购 买 爪 子 。
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_00"); //动 物 身 上 最 容 易 取 得 的 就 是 牙 齿 。 用 你 的 刀 在 它 嘴 里 的 牙 齿 边 上 移 动 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Teeth_03_01"); //然 后 用 力 一 拉 ， 就 可 以 把 它 们 从 头 骨 上 分 离 下 来 。
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Fell abziehen ------
func void DIA_Gaan_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_00"); //剥 皮 最 好 的 方 法 就 是 沿 着 后 腿 深 深 地 切 下 去 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_Fur_03_01"); //接 着 ， 要 确 保 把 毛 皮 从 前 面 向 后 拉 。
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Blutfliegenstachel ------
func void DIA_Gaan_TEACHHUNTING_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFSting))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_00"); //这 些 飞 虫 的 背 部 有 一 个 柔 软 的 地 方 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_BFSting_03_01"); //如 果 你 按 住 那 里 ， 刺 会 伸 出 非 常 长 ， 然 后 你 就 可 以 用 刀 把 它 割 下 来 。
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ Blutfliegenflügel ------
func void DIA_Gaan_TEACHHUNTING_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFWing))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_00"); //取 下 血 蝇 翅 膀 最 好 的 方 法 是 用 快 刀 猛 砍 ， 要 非 常 靠 近 它 的 躯 体 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_BFWing_03_01"); //你 必 需 注 意 不 要 损 伤 翅 膀 上 柔 弱 的 组 织 。 如 果 你 不 小 心 的 话 ， 它 们 就 没 有 用 了 。
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

// ------ DrgSnapperHorn ------
func void DIA_Gaan_TEACHHUNTING_DrgSnapperHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DrgSnapperHorn))
	{
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00"); //现 在 这 头 有 些 超 重 的 暴 龙 死 了 ， 我 可 以 教 你 如 何 取 下 它 的 角 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01"); //把 你 的 刀 深 深 地 插 入 这 种 动 物 的 前 额 ， 然 后 小 心 地 向 前 抬 。
		AI_Output(self, other, "DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02"); //如 果 它 没 有 从 头 骨 上 松 动 的 话 ， 你 就 要 用 第 二 把 刀 从 另 一 边 插 入 。

		CreateInvItems(Gaans_Snapper, ItAt_DrgSnapperHorn, 1); // falls der Snapper ihm gerade vor den Füssen liegt!!
	};

	Info_ClearChoices(DIA_Gaan_TEACHHUNTING);
	Info_AddChoice(DIA_Gaan_TEACHHUNTING, DIALOG_BACK, DIA_Gaan_TEACHHUNTING_BACK);
};

///////////////////////////////////////////////////////////////////////
//	Info jagd
///////////////////////////////////////////////////////////////////////
instance DIA_Gaan_JAGD(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 80;
	condition		= DIA_Gaan_JAGD_Condition;
	information		= DIA_Gaan_JAGD_Info;
	permanent		= TRUE;
	description		= "狩 猎 进 行 的 怎 么 样 ？";
};

func int DIA_Gaan_JAGD_Condition()
{
	return TRUE;
};

func void B_WasMachtJagd()
{
	AI_Output(other, self, "DIA_Gaan_JAGD_15_00"); //狩 猎 进 行 的 怎 么 样 ？
};

func void DIA_Gaan_JAGD_Info()
{
	B_WasMachtJagd();

	if ((Npc_IsDead(Gaans_Snapper)) == FALSE)
	{
		AI_Output(self, other, "DIA_Gaan_JAGD_03_01"); //我 能 杀 死 的 最 后 一 种 动 物 是 巨 鼠 。 不 那 么 振 奋 人 心 ， 也 没 什 么 商 业 价 值 。
		AI_Output(self, other, "DIA_Gaan_JAGD_03_02"); //几 天 以 来 ， 有 一 种 喷 着 鼻 息 的 野 兽 在 这 里 游 荡 。
		AI_Output(self, other, "DIA_Gaan_JAGD_03_03"); //它 不 仅 杀 死 任 何 会 移 动 的 东 西 ， 还 影 响 了 我 的 工 作 。
		Log_CreateTopic(TOPIC_GaanSchnaubi, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GaanSchnaubi, LOG_RUNNING);
		B_LogEntry(TOPIC_GaanSchnaubi, TOPIC_GaanSchnaubi_1);
		MIS_Gaan_Snapper = LOG_RUNNING;
	}
	else if (Kapitel >= 3)
	{
		AI_Output(self, other, "DIA_Gaan_JAGD_03_04"); //它 们 在 这 里 更 加 疯 狂 。 同 时 ， 有 更 多 这 种 喷 着 鼻 息 的 野 兽 从 关 卡 里 跑 出 来 。
		AI_Output(self, other, "DIA_Gaan_JAGD_03_05"); //在 这 种 情 形 下 ， 这 里 的 狩 猎 变 得 越 来 越 难 。
	}
	else
	{
		AI_Output(self, other, "DIA_Gaan_JAGD_03_06"); //我 想 我 不 能 抱 怨 .
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gaan_PICKPOCKET(C_INFO)
{
	npc				= BAU_961_Gaan;
	nr				= 900;
	condition		= DIA_Gaan_PICKPOCKET_Condition;
	information		= DIA_Gaan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Gaan_PICKPOCKET_Condition()
{
	C_Beklauen(23, 35);
};

func void DIA_Gaan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
	Info_AddChoice(DIA_Gaan_PICKPOCKET, DIALOG_BACK, DIA_Gaan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gaan_PICKPOCKET_DoIt);
};

func void DIA_Gaan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};

func void DIA_Gaan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaan_PICKPOCKET);
};
