///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap1_EXIT(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 999;
	condition		= DIA_Marduk_Kap1_EXIT_Condition;
	information		= DIA_Marduk_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marduk_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_JOB(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 0;
	condition		= DIA_Marduk_JOB_Condition;
	information		= DIA_Marduk_JOB_Info;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_Marduk_JOB_Condition()
{
	return TRUE;
};

func void DIA_Marduk_JOB_Info()
{
	AI_Output(other, self, "DIA_Marduk_JOB_15_00"); //你 在 这 里 做 什 么 工 作 ？
	AI_Output(self, other, "DIA_Marduk_JOB_05_01"); //我 训 练 圣 骑 士 与 邪 恶 作 战 。
};

///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Arbeit(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 3;
	condition		= DIA_Marduk_Arbeit_Condition;
	information		= DIA_Marduk_Arbeit_Info;
	description		= "还 有 什 么 事 我 能 帮 忙 吗 ， 大 师 ？";
};

func int DIA_Marduk_Arbeit_Condition()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Marduk_Arbeit_15_00"); //还 有 什 么 事 我 能 帮 忙 吗 ， 大 师 ？
	AI_Output(self, other, "DIA_Marduk_Arbeit_05_01"); //为 我 ？ 不 ， 我 不 需 要 你 的 帮 助 。 还 是 为 远 赴 矿 藏 山 谷 的 英 诺 斯 的 战 士 们 祈 求 安 康 吧 。

	MIS_MardukBeten = LOG_RUNNING;
	B_StartOtherRoutine(Sergio, "WAIT");

	Log_CreateTopic(Topic_MardukBeten, LOG_MISSION);
	Log_SetTopicStatus(Topic_MardukBeten, LOG_RUNNING);
	B_LogEntry(Topic_MardukBeten, Topic_MardukBeten_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Gebetet
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Gebetet(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 3;
	condition		= DIA_Marduk_Gebetet_Condition;
	information		= DIA_Marduk_Gebetet_Info;
	description		= "我 为 圣 骑 士 祈 祷 。";
};

func int DIA_Marduk_Gebetet_Condition()
{
	if ((MIS_MardukBeten == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, PC_PrayShrine_Paladine)))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Gebetet_Info()
{
	AI_Output(other, self, "DIA_Marduk_Gebetet_15_00"); //我 为 圣 骑 士 祈 祷 。
	AI_Output(self, other, "DIA_Marduk_Gebetet_05_01"); //你 干 得 很 好 。 现 在 回 去 做 你 的 工 作 。

	MIS_MardukBeten = LOG_SUCCESS;
	B_GivePlayerXP(XP_MardukBeten);
	B_StartOtherRoutine(Sergio, "START");
};

///////////////////////////////////////////////////////////////////////
//	Info Das Böse
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Evil(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 0;
	condition		= DIA_Marduk_Evil_Condition;
	information		= DIA_Marduk_Evil_Info;
	permanent		= TRUE;
	description		= "什 么 是 ‘ 邪 恶 ’ ？";
};

func int DIA_Marduk_Evil_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Evil_Info()
{
	AI_Output(other, self, "DIA_Marduk_Evil_15_00"); //什 么 是 ‘ 邪 恶 ’ ？
	AI_Output(self, other, "DIA_Marduk_Evil_05_01"); //邪 恶 无 处 不 在 。 它 是 贝 利 尔 的 力 量 ， 英 诺 斯 永 恒 的 敌 人 。
	AI_Output(self, other, "DIA_Marduk_Evil_05_02"); //它 全 被 黑 暗 包 围 ， 并 试 图 将 英 诺 斯 的 光 明 永 远 抹 去 。
	AI_Output(self, other, "DIA_Marduk_Evil_05_03"); //贝 利 尔 是 黑 暗 、 憎 恨 和 毁 灭 之 王 。
	AI_Output(self, other, "DIA_Marduk_Evil_05_04"); //只 有 我 们 这 些 心 中 燃 烧 着 英 诺 斯 圣 火 的 人 才 能 把 英 诺 斯 的 光 明 洒 向 世 界 ， 并 驱 散 黑 暗 。
};

///////////////////////////////////////////////////////////////////////
//	Info Paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Pal(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 0;
	condition		= DIA_Marduk_Pal_Condition;
	information		= DIA_Marduk_Pal_Info;
	description		= "但 是 只 有 魔 法 师 和 学 徒 住 在 修 道 院 里 。";
};

func int DIA_Marduk_Pal_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Pal_Info()
{
	AI_Output(other, self, "DIA_Marduk_Pal_15_00"); //但 是 只 有 魔 法 师 和 学 徒 住 在 修 道 院 里 。
	AI_Output(self, other, "DIA_Marduk_Pal_05_01"); //那 是 正 确 的 。 与 我 们 实 现 英 诺 斯 命 令 的 组 织 相 比 … …
	AI_Output(self, other, "DIA_Marduk_Pal_05_02"); //… … 圣 骑 士 为 我 们 的 神 诉 诸 伟 大 的 行 动 ， 超 过 其 它 一 切 。
	AI_Output(self, other, "DIA_Marduk_Pal_05_03"); //我 们 是 英 诺 斯 的 代 表 ， 而 圣 骑 士 是 他 的 战 士 ， 以 他 的 名 义 参 加 战 斗 ， 并 增 加 他 的 荣 耀 。
};

///////////////////////////////////////////////////////////////////////
//	Info BEFORETEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_BEFORETEACH(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 3;
	condition		= DIA_Marduk_BEFORETEACH_Condition;
	information		= DIA_Marduk_BEFORETEACH_Info;
	description		= "你 还 能 教 我 什 么 吗 ？";
};

func int DIA_Marduk_BEFORETEACH_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Marduk_JOB))
	{
		return TRUE;
	};
};

func void DIA_Marduk_BEFORETEACH_Info()
{
	AI_Output(other, self, "DIA_Marduk_BEFORETEACH_15_00"); //你 还 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Marduk_BEFORETEACH_05_01"); //我 是 冰 和 雷 魔 法 的 专 家 。 我 可 以 教 会 你 它 们 的 力 量 。

	if (other.guild != GIL_KDF)
	{
		AI_Output(self, other, "DIA_Marduk_BEFORETEACH_05_02"); //不 过 ， 我 只 传 授 魔 法 师 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_TEACH(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 10;
	condition		= DIA_Marduk_TEACH_Condition;
	information		= DIA_Marduk_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我 （ 制 造 咒 语 ）";
};

func int DIA_Marduk_TEACH_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Marduk_BEFORETEACH)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TEACH_Info()
{
	var int abletolearn;

	abletolearn = 0;

	AI_Output(other, self, "DIA_Marduk_TEACH_15_00"); //教 我 。

	Info_ClearChoices(DIA_Marduk_TEACH);
	Info_AddChoice(DIA_Marduk_TEACH, DIALOG_BACK, DIA_Marduk_TEACH_BACK);
	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_Zap, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Zap)), DIA_Marduk_TEACH_ZAP);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_Icebolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Icebolt)), DIA_Marduk_TEACH_Icebolt);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_IceCube, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_IceCube)), DIA_Marduk_TEACH_IceCube);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_ChargeZap, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ChargeZap)), DIA_Marduk_TEACH_ThunderBall);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_LightningFlash, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LightningFlash)), DIA_Marduk_TEACH_LightningFlash);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE))
	{
		Info_AddChoice(DIA_Marduk_TEACH, B_BuildLearnString(NAME_SPL_IceWave, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_IceWave)), DIA_Marduk_TEACH_IceWave);
		abletolearn = (abletolearn + 1);
	};

	if (abletolearn < 1)
	{
		AI_Output(self, other, "DIA_Marduk_TEACH_05_01"); //现 在 我 不 能 教 你 。
		Info_ClearChoices(DIA_Marduk_TEACH);
	};
};

func void DIA_Marduk_TEACH_BACK()
{
	Info_ClearChoices(DIA_Marduk_TEACH);
};

///////////////////////////////////////////////////////////////////////
//	MAGIER ZAUBER
///////////////////////////////////////////////////////////////////////
func void DIA_Marduk_TEACH_ZAP()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Zap);
};

func void DIA_Marduk_TEACH_Icebolt()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Icebolt);
};

func void DIA_Marduk_TEACH_LightningFlash()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LightningFlash);
};

func void DIA_Marduk_TEACH_IceCube()
{
	B_TeachPlayerTalentRunes(self, other, SPL_IceCube);
};

func void DIA_Marduk_TEACH_ThunderBall()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ChargeZap);
};

func void DIA_Marduk_TEACH_IceWave()
{
	B_TeachPlayerTalentRunes(self, other, SPL_IceWave);
};

// #####################################################################
// ##
// ## Kapitel 2
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap2_EXIT(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 999;
	condition		= DIA_Marduk_Kap2_EXIT_Condition;
	information		= DIA_Marduk_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marduk_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 3
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap3_EXIT(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 999;
	condition		= DIA_Marduk_Kap3_EXIT_Condition;
	information		= DIA_Marduk_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marduk_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap3_Hello(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 30;
	condition		= DIA_Marduk_Kap3_Hello_Condition;
	information		= DIA_Marduk_Kap3_Hello_Info;
	important		= TRUE;
};

func int DIA_Marduk_Kap3_Hello_Condition()
{
	if ((Kapitel == 3)
	&& ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_Hello_Info()
{
	AI_Output(self, other, "DIA_Marduk_Kap3_Hello_Info_05_00"); //欢 迎 ， 我 的 孩 子 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_Info_05_01"); //你 什 么 时 候 成 为 了 一 名 圣 骑 士 ？
	};

	if (hero.Guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_Info_05_02"); //你 从 哪 里 来 ？
	};

	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
	Info_AddChoice(DIA_Marduk_Kap3_Hello, "那 不 关 你 的 事 。", DIA_Marduk_Kap3_Hello_NotYourConcern);

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello, "只 有 很 短 的 时 间 。", DIA_Marduk_Kap3_Hello_Soon);
	};

	if (hero.Guild == GIL_DJG)
	{
		Info_AddChoice(DIA_Marduk_Kap3_Hello, "我 从 农 场 来 。", DIA_Marduk_Kap3_Hello_DJG);
	};
};

func void DIA_Marduk_Kap3_Hello_NotYourConcern()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_Hello_NotYourConcern_15_00"); //那 不 关 你 的 事 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_NotYourConcern_05_01"); //（ 斥 责 ） 圣 骑 士 应 该 永 远 礼 貌 而 谦 逊 。 你 们 的 任 务 就 是 保 护 那 些 无 法 保 护 自 己 的 人 。
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_NotYourConcern_05_02"); //（ 斥 责 ） 那 是 一 个 特 权 ， 而 你 应 该 感 激 英 诺 斯 给 你 这 个 机 会 。 考 虑 一 下 吧 ！
	};

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_NotYourConcern_05_03"); //（ 生 气 ） 有 些 时 候 我 们 不 允 许 暴 民 进 入 我 们 神 圣 的 修 道 院 。 你 证 明 了 那 些 时 候 是 最 好 的 。
		AI_Output(self, other, "DIA_Marduk_Kap3_Hello_NotYourConcern_05_04"); //（ 警 告 ） 我 警 告 你 ， 不 要 动 这 里 的 任 何 东 西 ， 否 则 你 将 立 刻 受 到 惩 罚 。 我 们 绝 不 会 手 下 留 情 。
	};

	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_Soon()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_Hello_Soon_15_00"); //只 有 很 短 的 时 间 。
	AI_Output(self, other, "DIA_Marduk_Kap3_Hello_Soon_05_01"); //那 么 我 向 你 致 以 问 候 。 在 这 场 战 斗 中 ， 我 们 需 要 每 一 个 有 勇 气 同 邪 恶 斗 争 的 人 。
	AI_Output(self, other, "DIA_Marduk_Kap3_Hello_Soon_05_02"); //我 们 的 命 运 都 掌 握 在 你 这 样 的 人 的 手 中 。 愿 英 诺 斯 永 远 赐 予 你 所 需 的 勇 气 。

	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

func void DIA_Marduk_Kap3_Hello_DJG()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_Hello_DJG_15_00"); //我 从 农 场 来 。
	AI_Output(self, other, "DIA_Marduk_Kap3_Hello_DJG_05_01"); //那 么 我 以 ‘ 好 客 ’ 的 名 义 欢 迎 你 。 我 希 望 你 能 意 识 到 。
	AI_Output(self, other, "DIA_Marduk_Kap3_Hello_DJG_05_02"); //不 要 因 为 是 客 人 就 滥 用 你 的 特 权 ， 否 则 你 就 会 遇 到 大 麻 烦 。

	Info_ClearChoices(DIA_Marduk_Kap3_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Paladine trainieren
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_TrainPals(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 32;
	condition		= DIA_Marduk_TrainPals_Condition;
	information		= DIA_Marduk_TrainPals_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 ？";
};

// ---------------------------------
var int Marduk_TrainPals_permanent;
// ---------------------------------
func int DIA_Marduk_TrainPals_Condition()
{
	if ((hero.guild == GIL_PAL)
	&& (Marduk_TrainPals_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Marduk_TrainPals_Info()
{
	AI_Output(other, self, "DIA_Marduk_TrainPals_15_00"); //你 能 教 我 什 么 ？
	AI_Output(self, other, "DIA_Marduk_TrainPals_05_01"); //毫 无 疑 问 ， 我 不 能 教 你 战 斗 技 巧 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_05_02"); //我 能 ， 不 过 ， 带 来 英 诺 斯 精 华 ， 他 的 礼 物 就 会 靠 近 你 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_05_03"); //此 外 ， 我 的 任 务 是 帮 你 准 备 剑 神 圣 化 仪 式 。
	AI_Output(other, self, "DIA_Marduk_TrainPals_15_04"); //魔 法 呢 ？
	AI_Output(self, other, "DIA_Marduk_TrainPals_05_05"); //在 这 里 ， 我 们 只 能 教 你 我 们 的 魔 法 。 你 必 须 在 城 市 里 学 习 圣 骑 士 的 魔 法 。

	Info_ClearChoices(DIA_Marduk_TrainPals);
	Info_AddChoice(DIA_Marduk_TrainPals, "以 后 再 说 。", DIA_Marduk_TrainPals_Later);
	Info_AddChoice(DIA_Marduk_TrainPals, "你 那 是 什 么 意 思 ？", DIA_Marduk_TrainPals_Meaning);
	Info_AddChoice(DIA_Marduk_TrainPals, "什 么 是 剑 的 神 圣 化 ？", DIA_Marduk_TrainPals_Blessing);
};

func void DIA_Marduk_TrainPals_Later()
{
	AI_Output(other, self, "DIA_Marduk_TrainPals_Later_15_00"); //以 后 再 说 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_Later_05_01"); //真 心 欢 迎 你 随 时 来 这 里 。

	Info_ClearChoices(DIA_Marduk_TrainPals);
};

func void DIA_Marduk_TrainPals_Meaning()
{
	AI_Output(other, self, "DIA_Marduk_TrainPals_Meaning_15_00"); //你 那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Marduk_TrainPals_Meaning_05_01"); //当 英 诺 斯 必 须 离 开 我 们 的 世 界 时 ， 他 给 人 类 留 下 了 一 部 分 他 的 神 力 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_Meaning_05_02"); //我 们 人 类 之 中 ， 只 有 极 少 部 分 可 以 使 用 他 的 力 量 ， 并 以 他 的 名 义 监 督 公 正 。
	AI_Output(other, self, "DIA_Marduk_TrainPals_Meaning_15_03"); //你 想 给 我 带 来 什 么 ？
	AI_Output(self, other, "DIA_Marduk_TrainPals_Meaning_05_04"); //我 可 以 让 你 沿 着 正 确 的 道 路 辨 别 英 诺 斯 的 精 华 ， 并 追 随 他 。
};

func void DIA_Marduk_TrainPals_Blessing()
{
	AI_Output(other, self, "DIA_Marduk_TrainPals_Blessing_15_00"); //什 么 是 剑 的 神 圣 化？
	AI_Output(self, other, "DIA_Marduk_TrainPals_Blessing_05_01"); //神 圣 化 剑 仪 式 是 一 名 圣 骑 士 最 神 圣 的 仪 式 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_Blessing_05_02"); //在 这 个 仪 式 中 ， 英 诺 斯 神 圣 的 力 量 流 淌 在 圣 骑 士 长 剑 的 锋 刃 中 ， 并 给 剑 带 来 不 可 思 议 的 力 量 。
	AI_Output(self, other, "DIA_Marduk_TrainPals_Blessing_05_03"); //经 过 神 圣 化 的 剑 是 圣 骑 士 最 珍 贵 的 财 产 ， 并 将 终 生 伴 随 着 他 。

	Marduk_TrainPals_permanent = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Schwertweihe
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_SwordBlessing(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 33;
	condition		= DIA_Marduk_SwordBlessing_Condition;
	information		= DIA_Marduk_SwordBlessing_Info;
	permanent		= TRUE;
	description		= "我 要 把 我 的 剑 神 圣 化 。";
};

func int DIA_Marduk_SwordBlessing_Condition()
{
	if (Marduk_TrainPals_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Marduk_SwordBlessing_Info()
{
	AI_Output(other, self, "DIA_Marduk_SwordBlessing_15_00"); //我 要 把 我 的 剑 神 圣 化 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_05_01"); //如 果 你 决 定 踏 上 这 一 步 的 话 ， 你 首 先 需 要 一 把 魔 法 剑 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_05_02"); //然 后 ， 你 需 要 在 小 教 堂 中 隐 修 并 祈 祷 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_05_03"); //在 祈 祷 的 过 程 中 ， 并 且 向 我 们 的 英 诺 斯 神 进 行 适 当 的 捐 赠 后 ， 你 应 该 向 英 诺 斯 要 求 他 的 恩 惠 和 在 战 斗 中 抵 抗 邪 恶 的 指 引 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_05_04"); //如 果 英 诺 斯 愿 意 降 临 到 你 身 上 的 话 ， 你 的 剑 将 在 那 一 刻 起 得 到 我 们 的 神 的 力 量 。

	Info_ClearChoices(DIA_Marduk_SwordBlessing);
	Info_AddChoice(DIA_Marduk_SwordBlessing, DIALOG_BACK, DIA_Marduk_SwordBlessing_Back);
	Info_AddChoice(DIA_Marduk_SwordBlessing, "什 么 类 型 的 捐 赠 ？", DIA_Marduk_SwordBlessing_Donation);
	Info_AddChoice(DIA_Marduk_SwordBlessing, "我 从 哪 里 可 以 得 到 魔 法 刀 ？", DIA_Marduk_SwordBlessing_OreBlade);
};

func void DIA_Marduk_SwordBlessing_Back()
{
	Info_ClearChoices(DIA_Marduk_SwordBlessing);
};

func void DIA_Marduk_SwordBlessing_Donation()
{
	AI_Output(other, self, "DIA_Marduk_SwordBlessing_Donation_15_00"); //什 么 类 型 的 捐 赠 ？
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_Donation_05_01"); //现 在 ， 考 虑 到 将 要 赐 予 你 的 恩 典 ，5000枚 金 币 将 是 合 适 的 金 额 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_Donation_05_02"); //当 然 ， 你 可 以 捐 赠 更 多 。
};

func void DIA_Marduk_SwordBlessing_OreBlade()
{
	AI_Output(other, self, "DIA_Marduk_SwordBlessing_OreBlade_15_00"); //我 从 哪 里 可 以 得 到 魔 法 刀 ？
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_OreBlade_05_01"); //到 城 里 找 铁 匠 哈 莱 德 试 试 。
	AI_Output(self, other, "DIA_Marduk_SwordBlessing_OreBlade_05_02"); //当 圣 骑 士 在 岛 上 时 ， 由 他 提 供 魔 法 武 器 。
	if (Npc_IsDead(HARAD) == TRUE)
	{
		AI_Output(other, self, "DIA_Marduk_SwordBlessing_OreBlade_15_03"); //哈 莱 德 死 了 。
		AI_Output(self, other, "DIA_Marduk_SwordBlessing_OreBlade_05_04"); //我 很 抱 歉 ， 那 你 必 须 等 待 ， 直 到 你 同 其 它 圣 骑 士 一 起 返 回 本 土 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap3_PERM(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 39;
	condition		= DIA_Marduk_Kap3_PERM_Condition;
	information		= DIA_Marduk_Kap3_PERM_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Marduk_Kap3_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap3_PERM_Info()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_15_00"); //有 新 闻 吗 ？

	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_05_01"); //是 的 ， 敌 人 已 经 成 功 地 在 我 们 的 圣 堂 里 培 养 了 一 个 叛 徒 。
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_05_02"); //他 已 经 偷 走 了 英 诺 斯 之 眼 ， 我 们 最 重 要 的 一 个 宝 物 。 而 那 仅 仅 是 冰 山 一 角 。
		// Joly:AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_03"); // Was meinst du?
	};

	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_05_04"); //（ 关 切 的 ） 敌 人 显 然 已 经 进 入 了 城 市 。
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_15_05"); //你 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_05_06"); //一 名 圣 骑 士 ， 洛 萨 ， 在 街 道 上 被 谋 杀 了 。
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_05_07"); //（ 生 气 ） 在 光 天 化 日 之 下 ！ 这 太 离 谱 了 ， 但 我 担 心 这 只 是 一 个 开 始 。

	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
	Info_AddChoice(DIA_Marduk_Kap3_PERM, DIALOG_BACK, DIA_Marduk_Kap3_PERM_BAck);
	Info_AddChoice(DIA_Marduk_Kap3_PERM, "现 在 将 会 发 生 什 么 ？", DIA_Marduk_Kap3_PERM_AndNow);
	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, "贝 尼 特 是 无 辜 的 。", DIA_Marduk_Kap3_PERM_BennetisNotGuilty);
	}
	else
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, "凶 手 被 抓 住 了 吗 ？", DIA_Marduk_Kap3_PERM_Murderer);
	};

	if (MIS_NovizenChase == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Marduk_Kap3_PERM, "那 个 贼 去 哪 里 了 ？", DIA_Marduk_Kap3_PERM_thief);
	};
};

func void DIA_Marduk_Kap3_PERM_BAck()
{
	Info_ClearChoices(DIA_Marduk_Kap3_PERM);
};

func void DIA_Marduk_Kap3_PERM_AndNow()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_AndNow_15_00"); //现 在 将 会 发 生 什 么 ？
	if (MIS_NovizenChase == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_AndNow_05_01"); //我 们 将 追 捕 那 个 盗 贼 ， 不 论 到 哪 里 。 我 们 将 抓 住 他 ， 并 让 他 接 受 应 得 的 惩 罚 。
		AI_Output(other, self, "DIA_Marduk_Kap3_PERM_AndNow_15_02"); //为 此 ， 我 们 首 先 需 要 知 道 那 个 贼 是 谁 。
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_AndNow_05_03"); //我 们 很 快 就 会 查 明 。 无 论 我 们 要 花 费 多 长 时 间 ， 我 们 一 定 要 找 到 他 。
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_AndNow_05_04"); //我 向 英 诺 斯 起 誓 。
	}
	else
	{
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_AndNow_05_05"); //一 个 凶 手 ， 此 外 还 有 一 个 圣 骑 士 ， 毫 无 疑 问 发 生 了 最 糟 的 罪 行 。
		AI_Output(self, other, "DIA_Marduk_Kap3_PERM_AndNow_05_06"); //凶 手 无 疑 将 被 判 处 死 刑 。
	};
};

func void DIA_Marduk_Kap3_PERM_BennetisNotGuilty()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00"); //贝 尼 特 是 无 辜 的 。 目 击 者 在 撒 谎 。
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01"); //你 怎 么 知 道 那 些 的 ？
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02"); //我 已 经 找 到 了 证 据 。
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03"); //有 时 我 认 为 不 忠 和 贪 婪 是 我 们 最 大 的 敌 人 。
};

func void DIA_Marduk_Kap3_PERM_Murderer()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_Murderer_15_00"); //凶 手 被 抓 住 了 吗 ？
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_Murderer_05_01"); //幸 运 的 是 ， 是 的 。 那 是 一 个 来 自 欧 纳 尔 的 农 场 的 杀 人 犯 。
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_Murderer_15_02"); //谁 ？
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_Murderer_05_03"); //我 不 知 道 他 的 名 字 。 但 已 确 定 是 那 些 雇 佣 兵 中 的 一 个 人 ， 你 完 全 可 以 想 象 他 们 会 做 出 这 样 的 行 径 。
};

func void DIA_Marduk_Kap3_PERM_thief()
{
	AI_Output(other, self, "DIA_Marduk_Kap3_PERM_thief_15_00"); //那 个 贼 去 哪 里 了 ？
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_thief_05_01"); //我 不 知 道 ， 他 奔 向 城 门 ， 好 像 被 附 体 了 一 样 ， 然 后 就 消 失 了 。
	AI_Output(self, other, "DIA_Marduk_Kap3_PERM_thief_05_02"); //无 论 他 躲 在 哪 里 ， 卧 倒 在 哪 块 岩 石 下 ， 英 诺 斯 的 愤 怒 将 击 中 他 ， 并 烧 焦 他 黑 暗 的 灵 魂 。
};

// #####################################################################
// ##
// ## Kapitel 4
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap4_EXIT(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 999;
	condition		= DIA_Marduk_Kap4_EXIT_Condition;
	information		= DIA_Marduk_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marduk_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM Kap4U5
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap4U5_PERM(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 49;
	condition		= DIA_Marduk_Kap4U5_PERM_Condition;
	information		= DIA_Marduk_Kap4U5_PERM_Info;
	permanent		= TRUE;
	description		= "有 新 消 息 吗 ？";
};

func int DIA_Marduk_Kap4U5_PERM_Condition()
{
	if ((Kapitel == 4)
	|| (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap4U5_PERM_Info()
{
	AI_Output(other, self, "DIA_Marduk_Kap4U5_PERM_15_00"); //有 新 消 息 吗 ？
	AI_Output(self, other, "DIA_Marduk_Kap4U5_PERM_05_01"); //不 ， 唉 ， 不 ， 形 势 依 然 十 分 严 峻 。
};

// #####################################################################
// ##
// ## Kapitel 5
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
instance DIA_Marduk_Kap5_EXIT(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 999;
	condition		= DIA_Marduk_Kap5_EXIT_Condition;
	information		= DIA_Marduk_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Marduk_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Marduk_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Marduk_PICKPOCKET(C_INFO)
{
	npc				= KDF_505_Marduk;
	nr				= 900;
	condition		= DIA_Marduk_PICKPOCKET_Condition;
	information		= DIA_Marduk_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Marduk_PICKPOCKET_Condition()
{
	C_Beklauen(36, 40);
};

func void DIA_Marduk_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
	Info_AddChoice(DIA_Marduk_PICKPOCKET, DIALOG_BACK, DIA_Marduk_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Marduk_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Marduk_PICKPOCKET_DoIt);
};

func void DIA_Marduk_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};

func void DIA_Marduk_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Marduk_PICKPOCKET);
};
