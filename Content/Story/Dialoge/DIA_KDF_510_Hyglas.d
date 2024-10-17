///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap1_EXIT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 999;
	condition		= DIA_Hyglas_Kap1_EXIT_Condition;
	information		= DIA_Hyglas_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hyglas_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Feuer
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Feuer(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 2;
	condition		= DIA_Hyglas_Feuer_Condition;
	information		= DIA_Hyglas_Feuer_Info;
	description		= "我 申 请 火 焰 测 试 。 ";
};

func int DIA_Hyglas_Feuer_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Feuer_Info()
{
	AI_Output(other, self, "DIA_Hyglas_Feuer_15_00"); //我 申 请 火 焰 测 试 。
	AI_Output(self, other, "DIA_Hyglas_Feuer_14_01"); //火 焰 测 试 始 于 很 久 以 前 ， 并 且 已 经 很 长 时 间 没 有 举 行 过 了 。
	AI_Output(self, other, "DIA_Hyglas_Feuer_14_02"); //你 的 要 求 过 于 危 险 。 所 以 不 要 再 去 想 它 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Hallo(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 2;
	condition		= DIA_Hyglas_Hallo_Condition;
	information		= DIA_Hyglas_Hallo_Info;
	important		= TRUE;
};

func int DIA_Hyglas_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Hallo_Info()
{
	AI_Output(self, other, "DIA_Hyglas_Hallo_14_00"); //我 是 大 师 希 格 莱 斯 ， 火 焰 守 护 者 和 知 识 的 管 理 者 。

	if (other.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Hyglas_Hallo_14_01"); //那 么 说 大 师 帕 兰 已 经 给 了 你 研 究 铭 文 的 许 可 。
		AI_Output(self, other, "DIA_Hyglas_Hallo_14_02"); //那 么 现 在 你 可 以 去 学 习 了 。 学 习 ， 那 样 你 可 以 从 铭 文 中 获 得 启 迪 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_JOB(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 2;
	condition		= DIA_Hyglas_JOB_Condition;
	information		= DIA_Hyglas_JOB_Info;
	description		= "你 在 研 究 什 么 ， 大 师 ？";
};

func int DIA_Hyglas_JOB_Condition()
{
	return TRUE;
};

func void DIA_Hyglas_JOB_Info()
{
	AI_Output(other, self, "DIA_Hyglas_JOB_15_00"); //你 在 研 究 什 么 ， 大 师 ？
	AI_Output(self, other, "DIA_Hyglas_JOB_14_01"); //我 的 研 究 集 中 于 火 焰 - 英 诺 斯 的 力 量 。
	AI_Output(self, other, "DIA_Hyglas_JOB_14_02"); //那 是 他 的 礼 物 ， 同 时 也 是 一 件 威 力 无 比 的 武 器 - 而 且 我 制 造 包 含 这 种 力 量 的 咒 语 。

	if (other.guild == GIL_NOV)
	{
		AI_Output(other, self, "DIA_Hyglas_JOB_15_03"); //茅 塞 顿 开 。 你 能 教 我 那 些 吗 ？
		AI_Output(self, other, "DIA_Hyglas_JOB_14_04"); //英 诺 斯 赠 与 的 魔 法 ， 只 有 他 的 仆 人 ， 火 魔 法 师 ， 才 能 学 习 如 何 使 用 这 种 力 量 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info CONTEST
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_CONTEST(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 9;
	condition		= DIA_Hyglas_CONTEST_Condition;
	information		= DIA_Hyglas_CONTEST_Info;
	description		= "我 已 经 申 请 了 火 焰 测 试 。";
};

func int DIA_Hyglas_CONTEST_Condition()
{
	if (MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_CONTEST_Info()
{
	AI_Output(other, self, "DIA_Hyglas_CONTEST_15_00"); //我 已 经 申 请 了 火 焰 测 试 。 乌 尔 萨 给 我 一 个 任 务 让 我 制 造 一 个 火 箭 咒 语 。
	AI_Output(self, other, "DIA_Hyglas_CONTEST_14_01"); //现 在 你 想 要 我 教 你 公 式 ？
	AI_Output(other, self, "DIA_Hyglas_CONTEST_15_02"); //我 不 知 道 怎 么 去 做 。
	AI_Output(self, other, "DIA_Hyglas_CONTEST_14_03"); //嗯 … …
	AI_Output(self, other, "DIA_Hyglas_CONTEST_14_04"); //好 吧 ， 我 会 教 你 公 式 。 但 是 首 先 你 要 找 到 所 有 必 须 的 原 料 。

	B_LogEntry(TOPIC_Rune, TOPIC_Rune_1);
};

///////////////////////////////////////////////////////////////////////
//	Info FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_FIREBOLT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 9;
	condition		= DIA_Hyglas_FIREBOLT_Condition;
	information		= DIA_Hyglas_FIREBOLT_Info;
	description		= "要 制 造 火 箭 咒 语 ， 我 需 要 什 么 原 料 ？";
};

func int DIA_Hyglas_FIREBOLT_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hyglas_CONTEST)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_FIREBOLT_Info()
{
	AI_Output(other, self, "DIA_Hyglas_FIREBOLT_15_00"); //要 制 造 火 箭 咒 语 ， 我 需 要 什 么 原 料 ？
	AI_Output(self, other, "DIA_Hyglas_FIREBOLT_14_01"); //去 研 究 - 它 就 记 录 在 这 些 书 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info TALENT_FIREBOLT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TALENT_FIREBOLT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 990;
	condition		= DIA_Hyglas_TALENT_FIREBOLT_Condition;
	information		= DIA_Hyglas_TALENT_FIREBOLT_Info;
	permanent		= TRUE;
	description		= "教 我 制 造 火 箭 咒 语 。";
};

func int DIA_Hyglas_TALENT_FIREBOLT_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hyglas_CONTEST)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	&& (Npc_HasItems(other, ItMi_RuneBlank) >= 1)
	&& (Npc_HasItems(other, ItSc_Firebolt) >= 1)
	&& (Npc_HasItems(other, ItMi_Sulfur) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TALENT_FIREBOLT_Info()
{
	AI_Output(other, self, "DIA_Hyglas_TALENT_FIREBOLT_15_00"); //教 我 制 造 火 箭 咒 语 。

	if (B_TeachPlayerTalentRunes(self, other, SPL_Firebolt))
	{
		AI_Output(self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_01"); //要 制 造 一 个 火 箭 咒 语 ， 你 需 要 在 咒 语 台 上 把 硫 磺 和 咒 语 石 结 合 到 一 起 。
		AI_Output(self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_02"); //火 箭 魔 法 卷 轴 的 力 量 将 在 咒 语 中 流 动 ， 那 样 你 就 拥 有 了 英 诺 斯 的 工 具 。
		AI_Output(self, other, "DIA_Hyglas_TALENT_FIREBOLT_14_03"); //那 么 ， 当 你 找 到 所 有 的 原 始 材 料 之 后 ， 到 咒 语 台 那 里 ， 去 制 造 你 的 咒 语 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info BLANK_RUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BLANK_RUNE(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 9;
	condition		= DIA_Hyglas_BLANK_RUNE_Condition;
	information		= DIA_Hyglas_BLANK_RUNE_Info;
	description		= "我 在 哪 里 能 找 到 咒 语 石 ？ ";
};

func int DIA_Hyglas_BLANK_RUNE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Hyglas_FIREBOLT)
	&& (MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMI_RuneBlank) < 1)
	&& (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BLANK_RUNE_Info()
{
	AI_Output(other, self, "DIA_Hyglas_BLANK_RUNE_15_00"); //我 在 哪 里 能 找 到 咒 语 石 ？
	AI_Output(self, other, "DIA_Hyglas_BLANK_RUNE_14_01"); //嘿 ， 是 你 申 请 的 火 焰 测 试 - 不 是 我 。 寻 找 也 是 测 试 的 一 部 分 。
};

///////////////////////////////////////////////////////////////////////
//	Info GOTRUNE
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_GOTRUNE(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 2;
	condition		= DIA_Hyglas_GOTRUNE_Condition;
	information		= DIA_Hyglas_GOTRUNE_Info;
	description		= "我 已 经 制 造 了 咒 语 。";
};

func int DIA_Hyglas_GOTRUNE_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Ulthar_SUCCESS) == FALSE)
	&& (Npc_HasItems(hero, ItRu_Firebolt) >= 1)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_GOTRUNE_Info()
{
	AI_Output(other, self, "DIA_Hyglas_GOTRUNE_15_00"); //我 已 经 制 造 了 咒 语 。
	AI_Output(self, other, "DIA_Hyglas_GOTRUNE_14_01"); //好 ， 好 。 你 看 来 已 经 通 过 了 这 个 测 试 。 毕 竟 那 没 有 多 难 。
	AI_Output(self, other, "DIA_Hyglas_GOTRUNE_14_02"); //那 马 上 去 乌 尔 萨 那 里 ， 让 他 看 看 你 的 工 作 成 果 。

	B_LogEntry(TOPIC_Rune, TOPIC_Rune_2);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_TEACH(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 15;
	condition		= DIA_Hyglas_TEACH_Condition;
	information		= DIA_Hyglas_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我";
};

func int DIA_Hyglas_TEACH_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_TEACH_Info()
{
	var int abletolearn;

	abletolearn = 0;
	AI_Output(other, self, "DIA_Hyglas_TEACH_15_00"); //教 我 。

	Info_ClearChoices(DIA_Hyglas_TEACH);
	Info_AddChoice(DIA_Hyglas_TEACH, DIALOG_BACK, DIA_Hyglas_TEACH_BACK);

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH, B_BuildLearnString(NAME_SPL_InstantFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_InstantFireball)), DIA_Hyglas_TEACH_InstantFireball);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH, B_BuildLearnString(NAME_SPL_Firestorm, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firestorm)), DIA_Hyglas_TEACH_Firestorm);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH, B_BuildLearnString(NAME_SPL_ChargeFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ChargeFireball)), DIA_Hyglas_TEACH_ChargeFireball);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH, B_BuildLearnString(NAME_SPL_Pyrokinesis, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Pyrokinesis)), DIA_Hyglas_TEACH_Pyrokinesis);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6)
	&& (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE))
	{
		Info_AddChoice(DIA_Hyglas_TEACH, B_BuildLearnString(NAME_SPL_Firerain, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firerain)), DIA_Hyglas_TEACH_Firerain);
		abletolearn = (abletolearn + 1);
	};

	if (abletolearn < 1)
	{
		B_Say(self, other, "$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(DIA_Hyglas_TEACH);
	};
};

func void DIA_Hyglas_TEACH_BACK()
{
	Info_ClearChoices(DIA_Hyglas_TEACH);
};

func void DIA_Hyglas_TEACH_InstantFireball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_InstantFireball);
};

func void DIA_Hyglas_TEACH_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ChargeFireball);
};

func void DIA_Hyglas_TEACH_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Pyrokinesis);
};

func void DIA_Hyglas_TEACH_Firestorm()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firestorm);
};

func void DIA_Hyglas_TEACH_Firerain()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firerain);
};

// #######################################
// ##
// ## Kapitel 2
// ##
// #######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap2_EXIT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 999;
	condition		= DIA_Hyglas_Kap2_EXIT_Condition;
	information		= DIA_Hyglas_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hyglas_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #######################################
// ##
// ## Kapitel 3
// ##
// #######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap3_EXIT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 999;
	condition		= DIA_Hyglas_Kap3_EXIT_Condition;
	information		= DIA_Hyglas_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hyglas_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BringBook
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_BringBook(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 38;
	condition		= DIA_Hyglas_BringBook_Condition;
	information		= DIA_Hyglas_BringBook_Info;
	description		= "有 新 消 息 吗 ？";
};

func int DIA_Hyglas_BringBook_Condition()
{
	if ((Kapitel >= 3)
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_BringBook_Info()
{
	AI_Output(other, self, "DIA_Hyglas_BringBook_15_00"); //有 新 消 息 吗 ？
	AI_Output(self, other, "DIA_Hyglas_BringBook_14_01"); //嗯 ， 是 的 。 你 可 能 已 经 注 意 到 了 那 些 穿 黑 袍 子 的 人 影 。
	AI_Output(other, self, "DIA_Hyglas_BringBook_15_02"); //我 已 经 遇 到 他 们 了 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_14_03"); //这 把 我 们 带 到 了 问 题 的 核 心 。 现 在 ， 我 只 能 观 测 到 非 常 稀 少 的 星 座 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_14_04"); //更 准 确 地 讲 ， 公 牛 星 座 直 接 与 武 士 星 座 相 连 。 我 想 你 应 该 知 道 那 是 什 么 意 思 。
	AI_Output(other, self, "DIA_Hyglas_BringBook_15_05"); //嗯 。 诚 实 地 讲 … …
	AI_Output(self, other, "DIA_Hyglas_BringBook_14_06"); //是 的 ， 正 确 ， 我 明 白 。 嗯 ， 我 现 在 无 法 向 你 解 释 全 部 的 情 况 ， 但 无 疑 征 兆 变 化 巨 大 。 而 我 不 喜 欢 变 化 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_14_07"); //因 此 ， 我 要 你 从 给 我 从 城 里 拿 一 本 书 来 。 它 叫 ‘ 星 的 神 圣 力 量 ’ 。 你 应 该 仔 细 找 一 下 ， 我 肯 定 你 能 找 到 它 。

	Info_ClearChoices(DIA_Hyglas_BringBook);
	Info_AddChoice(DIA_Hyglas_BringBook, "你 自 己 去 拿 书 吧 。", DIA_Hyglas_BringBook_GetItYourself);
	Info_AddChoice(DIA_Hyglas_BringBook, "我 有 什 么 好 处 ？", DIA_Hyglas_BringBook_GetForIt);
	Info_AddChoice(DIA_Hyglas_BringBook, "我 看 看 能 不 能 找 到 它 。", DIA_Hyglas_BringBook_Yes);
};

func void DIA_Hyglas_BringBook_GetItYourself()
{
	AI_Output(other, self, "DIA_Hyglas_BringBook_GetItYourself_15_00"); //你 自 己 去 拿 书 吧 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_GetItYourself_14_01"); //你 竟 敢 用 那 样 的 语 气 和 我 讲 话 ？ 你 的 行 为 没 有 表 现 出 对 我 应 有 的 尊 敬 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_GetItYourself_14_02"); //出 去 ， 考 虑 一 下 你 的 行 为 。

	MIS_HyglasBringBook = LOG_OBSOLETE;

	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_GetForIt()
{
	AI_Output(other, self, "DIA_Hyglas_BringBook_GetForIt_15_00"); //我 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_Hyglas_BringBook_GetForIt_14_01"); //你 是 什 么 意 思 ？
	AI_Output(other, self, "DIA_Hyglas_BringBook_GetForIt_15_02"); //我 想 知 道 我 给 你 书 后 ， 你 能 给 我 什 么 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_GetForIt_14_03"); //没 有 。 你 想 要 什 么 ？ 如 果 你 有 时 间 去 镇 上 完 成 我 的 任 务 ， 那 么 帮 助 我 就 是 你 的 职 责 。

	Info_ClearChoices(DIA_Hyglas_BringBook);
};

func void DIA_Hyglas_BringBook_Yes()
{
	AI_Output(other, self, "DIA_Hyglas_BringBook_Yes_15_00"); //我 看 看 能 不 能 找 到 它 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_Yes_14_01"); //很 好 - 这 可 以 节 约 我 的 时 间 ， 那 样 我 可 以 追 踪 其 它 一 些 迹 象 。
	AI_Output(self, other, "DIA_Hyglas_BringBook_Yes_14_02"); //但 是 不 要 花 费 太 长 时 间 。 时 间 ， 恐 怕 是 我 们 最 缺 少 的 。

	MIS_HyglasBringBook = LOG_RUNNING;

	Info_ClearChoices(DIA_Hyglas_BringBook);

	Log_CreateTopic(TOPIC_HyglasBringBook, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HyglasBringBook, LOG_RUNNING);
	B_LogEntry(TOPIC_HyglasBringBook, TOPIC_HyglasBringBook_1);
};

//*********************************************************************
//	Ich hab dein Buch
//*********************************************************************
instance DIA_Hyglas_HaveBook(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 38;
	condition		= DIA_Hyglas_HaveBook_Condition;
	information		= DIA_Hyglas_HaveBook_Info;
	description		= "我 把 书 给 你 带 来 了 。";
};

func int DIA_Hyglas_HaveBook_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hyglas_BringBook))
	&& (Npc_HasItems(other, ItWr_Astronomy_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_HaveBook_Info()
{
	AI_Output(other, self, "DIA_Hyglas_HaveBook_15_00"); //我 把 书 给 你 带 来 了 。

	if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Hyglas_HaveBook_14_01"); //非 常 好 ， 给 我 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hyglas_HaveBook_14_02"); //那 么 你 终 于 改 变 了 你 的 想 法 。 非 常 好 。 那 你 把 书 放 在 哪 里 了 ？
	};

	B_GiveInvItems(other, self, ItWr_Astronomy_Mis, 1);

	Mis_HyglasBringBook = LOG_SUCCESS;
	B_GivePlayerXP(XP_HyglasBringBook);

	AI_Output(self, other, "DIA_Hyglas_HaveBook_14_03"); //你 现 在 可 以 走 了 。 我 要 隐 居 作 研 究 。
};

// #######################################
// ##
// ## Kapitel 4
// ##
// #######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap4_EXIT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 999;
	condition		= DIA_Hyglas_Kap4_EXIT_Condition;
	information		= DIA_Hyglas_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hyglas_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap4_PERM(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 49;
	condition		= DIA_Hyglas_Kap4_PERM_Condition;
	information		= DIA_Hyglas_Kap4_PERM_Info;
	permanent		= TRUE;
	description		= "已 经 发 现 什 么 事 了 吗 ？";
};

func int DIA_Hyglas_Kap4_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Hyglas_BringBook))
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap4_PERM_Info()
{
	AI_Output(other, self, "DIA_Hyglas_Kap4_PERM_15_00"); //已 经 发 现 什 么 事 了 吗 ？

	if (Mis_HyglasBringBook == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Hyglas_Kap4_PERM_14_01"); //嗯 ， 我 不 能 完 全 肯 定 ， 但 是 当 前 的 星 兆 预 示 了 很 多 的 危 险 。
		AI_Output(other, self, "DIA_Hyglas_Kap4_PERM_15_02"); //什 么 样 的 危 险 ？
		AI_Output(self, other, "DIA_Hyglas_Kap4_PERM_14_03"); //嗯 ， 世 界 之 间 的 结 构 似 乎 非 常 脆 弱 。 只 要 很 小 的 力 量 就 能 在 这 个 结 构 上 撕 裂 出 一 个 洞 来 。
		AI_Output(self, other, "DIA_Hyglas_Kap4_PERM_14_04"); //恶 魔 可 以 利 用 那 个 入 口 不 费 吹 灰 之 力 进 入 我 们 的 世 界 。

		Hyglas_SendsToKarras = TRUE;
	}
	else if (Mis_HyglasBringBook == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Hyglas_Kap4_PERM_14_05"); //不 ， 我 还 在 等 那 本 书 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hyglas_Kap4_PERM_14_06"); //我 告 诉 过 你 ， 我 还 要 做 些 研 究 ， 不 过 当 然 ， 如 果 我 没 有 必 要 的 材 料 的 话 ， 将 要 花 费 更 长 的 时 间 。
	};
};

// #######################################
// ##
// ## Kapitel 5
// ##
// #######################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hyglas_Kap5_EXIT(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 999;
	condition		= DIA_Hyglas_Kap5_EXIT_Condition;
	information		= DIA_Hyglas_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hyglas_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hyglas_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hyglas_PICKPOCKET(C_INFO)
{
	npc				= KDF_510_Hyglas;
	nr				= 900;
	condition		= DIA_Hyglas_PICKPOCKET_Condition;
	information		= DIA_Hyglas_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Hyglas_PICKPOCKET_Condition()
{
	C_Beklauen(73, 200);
};

func void DIA_Hyglas_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET, DIALOG_BACK, DIA_Hyglas_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hyglas_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hyglas_PICKPOCKET_DoIt);
};

func void DIA_Hyglas_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};

func void DIA_Hyglas_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hyglas_PICKPOCKET);
};
