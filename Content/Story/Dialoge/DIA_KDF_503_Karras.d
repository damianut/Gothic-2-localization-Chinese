///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP1_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP1_EXIT_Condition;
	information		= DIA_Karras_KAP1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 1;
	condition		= DIA_Karras_Hello_Condition;
	information		= DIA_Karras_Hello_Info;
	important		= TRUE;
};

func int DIA_Karras_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_00"); //兄 弟，我 能 帮 你 做 什 么 ？
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_01"); //兄 弟，我 能 帮 你 做 什 么 ？
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_02"); //高 贵 的 英 诺 斯 的 战 士 们 极 少 进 入 这 些 房 间 。
		AI_Output(self, other, "DIA_Karras_Hello_10_03"); //我 能 为 你 做 些 什 么 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_04"); //（ 怀 疑 的 ） 你 在 这 里 做 什 么 ？
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Mission_Condition;
	information		= DIA_Karras_Mission_Info;
	description		= "我 要 来 阅 读 铭 文 。";
};

func int DIA_Karras_Mission_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other, self, "DIA_Karras_Mission_15_00"); //我 要 来 阅 读 铭 文 。
	AI_Output(self, other, "DIA_Karras_Mission_10_01"); //我 明 白 。 如 果 你 在 沉 闷 的 研 究 之 间 能 分 出 一 点 时 间 的 话 ， 来 找 我 。
	AI_Output(self, other, "DIA_Karras_Mission_10_02"); //我 还 有 其 它 一 件 事 情 需 要 一 名 慎 重 的 新 手 来 做 。
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Aufgabe_Condition;
	information		= DIA_Karras_Aufgabe_Info;
	description		= "你 有 一 个 任 务 给 我 ？ ";
};

func int DIA_Karras_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Karras_Mission))
	{
		return TRUE;
	};
};

func void DIA_Karras_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Karras_Aufgabe_15_00"); //你 有 一 个 任 务 给 我 ？
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_01"); //是 的 。 是 关 于 这 个 疯 子 伊 格 纳 兹 。 他 住 在 克 霍 里 尼 斯 里 ， 试 验 各 种 药 剂 和 治 疗 水 。 此 外 也 有 魔 法 。
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_02"); //那 正 是 我 所 担 心 的 。 我 问 自 己 ， 他 的 魔 法 是 否 能 让 英 诺 斯 满 意 。
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_03"); //为 了 验 证 此 事 ， 我 需 要 一 些 他 的 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_04"); //我 想 要 你 进 城 ， 并 从 他 那 里 给 我 购 买 三 个 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_05"); //但 是 不 要 对 任 何 人 提 起 - 明 白 了 吗 ？
	AI_Output(other, self, "DIA_Karras_Aufgabe_15_06"); //没 问 题 。
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_07"); //这 是 1 5 0 枚 金 币 。 你 应 该 足 够 你 的 花 费 了 。

	MIS_KarrasVergessen = LOG_RUNNING;

	Log_CreateTopic(Topic_KarrasCharm, LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm, LOG_RUNNING);
	B_LogEntry(Topic_KarrasCharm, Topic_KarrasCharm_1);

	B_GiveInvItems(self, other, ItMi_Gold, 150);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Success_Condition;
	information		= DIA_Karras_Success_Info;
	description		= "这 是 你 要 的 魔 法 卷 轴 。";
};

func int DIA_Karras_Success_Condition()
{
	if ((MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems(other, ItSc_Charm) >= 3))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other, self, "DIA_Karras_Success_15_00"); //这 是 你 要 的 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Karras_Success_10_01"); //干 得 好 ， 我 年 青 的 朋 友 。
	AI_Output(self, other, "DIA_Karras_Success_10_02"); //但 是 现 在 是 你 置 身 于 学 习 之 中 的 时 候 了 。
	AI_Output(self, other, "DIA_Karras_Success_10_03"); //拿 上 这 个 魔 法 卷 轴 作 为 回 报 。

	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
	B_GiveInvItems(other, self, ItSc_Charm, 3);
	B_GiveInvItems(self, other, ItSc_SumWolf, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Trade_Condition;
	information		= DIA_Karras_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Karras_Trade_Condition()
{
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Karras_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_JOB_Condition;
	information		= DIA_Karras_JOB_Info;
	description		= "你 的 工 作 是 什 么 ？";
};

func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other, self, "DIA_Karras_JOB_15_00"); //你 的 工 作 是 什 么 ？
	AI_Output(self, other, "DIA_Karras_JOB_10_01"); //我 的 职 责 是 训 练 法 师 们 关 于 天 体 显 现 的 技 术 。
	AI_Output(other, self, "DIA_Karras_JOB_15_02"); //那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Karras_JOB_10_03"); //嗯 ， 我 教 他 们 如 何 从 其 它 地 方 或 者 天 体 召 唤 生 物 。
	AI_Output(self, other, "DIA_Karras_JOB_10_04"); //这 通 常 被 称 作 ‘ 召 唤 ’ ， 尽 管 这 个 叫 法 并 不 足 以 表 达 召 唤 一 个 仆 从 的 含 义 。
	AI_Output(self, other, "DIA_Karras_JOB_10_05"); //此 外 ， 我 还 有 一 些 高 莱 克 斯 没 有 的 以 及 很 有 趣 的 魔 法 卷 轴 。

	if (other.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Karras_JOB_10_06"); //但 是 我 只 传 授 修 道 会 中 的 成 员 。
	};

	Log_CreateTopic(Topic_KlosterTrader, LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, Topic_KlosterTrader_3);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 10;
	condition		= DIA_Karras_TEACH_Condition;
	information		= DIA_Karras_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我 （ 制 造 咒 语 ）";
};

func int DIA_Karras_TEACH_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Karras_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other, self, "DIA_Karras_TEACH_15_00"); //教 我 。

	Info_ClearChoices(DIA_Karras_TEACH);

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)), DIA_Karras_TEACH_SUMGOBL);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonWolf, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonWolf)), DIA_Karras_TEACHSummonWolf);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonSkeleton)), DIA_Karras_TEACH_SummonSkeleton);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonGolem, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGolem)), DIA_Karras_TEACH_SummonGolem);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonDemon, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonDemon)), DIA_Karras_TEACH_SummonDemon);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6)
	&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)), DIA_Karras_TEACH_ArmyOfDarkness);
		abletolearn = (abletolearn + 1);
	};

	if (abletolearn < 1)
	{
		AI_Output(self, other, "DIA_Karras_TEACH_10_01"); //现 在 ， 你 从 我 这 里 学 不 到 别 的 东 西 了 。
	}
	else
	{
		Info_AddChoice(DIA_Karras_TEACH, DIALOG_BACK, DIA_Karras_TEACH_BACK);
	};
};

func void DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Karras_TEACH);
};

func void DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGoblinSkeleton);
};

func void DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonWolf);
};

func void DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonSkeleton);
};

func void DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGolem);
};

func void DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonDemon);
};

func void DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ArmyOfDarkness);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 3;
	condition		= DIA_Karras_CIRCLE4_Condition;
	information		= DIA_Karras_CIRCLE4_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 第 四 环 魔 法 。";
};

func int DIA_Karras_CIRCLE4_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other, self, "DIA_Karras_CIRCLE4_15_00"); //我 想 要 学 习 第 四 环 魔 法 。

	if (MIS_ReadyforChapter4 == TRUE)
	{
		if (B_TeachMagicCircle(self, other, 4))
		{
			AI_Output(self, other, "DIA_Karras_CIRCLE4_10_01"); //好 。 所 有 的 预 兆 都 已 实 现 。 现 在 进 入 第 四 环 ， 那 样 新 的 魔 法 力 量 将 进 入 你 的 体 内 。
			AI_Output(self, other, "DIA_Karras_CIRCLE4_10_02"); //你 已 经 走 了 很 长 的 路 ， 而 英 诺 斯 将 继 续 照 亮 你 的 路 途 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_CIRCLE4_10_03"); //它 还 没 有 完 成 。
	};
};

/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 3;
	condition		= DIA_Karras_CIRCLE5_Condition;
	information		= DIA_Karras_CIRCLE5_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 第 五 环 魔 法 。";
};

func int DIA_Karras_CIRCLE5_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other, self, "DIA_Karras_CIRCLE5_15_00"); //我 想 要 学 习 第 五 环 魔 法 。

	if (Kapitel >= 5)
	{
		if (B_TeachMagicCircle(self, other, 5))
		{
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_01"); //那 么 现 在 进 入 第 五 环 魔 法 。 你 将 支 配 比 以 往 更 强 大 的 魔 法 。
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_02"); //明 智 地 使 用 它 的 力 量 ， 兄 弟 - 因 为 黑 暗 和 你 的 敌 人 依 然 强 大 。
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_03"); //我 无 法 陪 伴 你 进 入 第 六 环 和 更 高 级 的 魔 法 环 。 皮 罗 卡 将 会 在 时 机 到 来 时 亲 自 传 授 你 。

			B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_2);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_CIRCLE4_10_04"); //时 机 还 不 成 熟 。
	};
};

// #####################################################################
// ##
// ## Kapitel 2
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP2_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP2_EXIT_Condition;
	information		= DIA_Karras_KAP2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 3
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP3_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP3_EXIT_Condition;
	information		= DIA_Karras_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 31;
	condition		= DIA_Karras_ChasePedro_Condition;
	information		= DIA_Karras_ChasePedro_Info;
	important		= TRUE;
};

func int DIA_Karras_ChasePedro_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_00"); //兄 弟 ， 你 不 能 有 一 丝 延 误 。 你 必 须 追 捕 比 德 罗 ， 并 将 英 诺 斯 之 眼 归 还 到 修 道 院 。
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_01"); //如 果 无 法 取 回 ‘ 眼 睛 ’ 的 话 ， 我 们 都 将 会 失 败 。
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_02"); //你 在 这 里 做 什 么 ？ 你 不 是 应 该 出 发 去 寻 找 那 个 卑 鄙 的 叛 徒 比 德 罗 吗 ？

		Info_ClearChoices(DIA_Karras_ChasePedro);
		Info_AddChoice(DIA_Karras_ChasePedro, "稍 候 。 我 还 有 事 要 先 处 理 。", DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro, "稍 候 。 我 还 有 事 要 先 处 理 。", DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other, self, "DIA_Karras_ChasePedro_Later_15_00"); //稍 候 。 我 还 有 事 要 先 处 理 。
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_01"); //你 不 知 道 这 个 损 失 就 是 修 道 院 的 损 失 吗 ？ 英 诺 斯 之 眼 是 一 件 强 大 的 武 器 。
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_02"); //没 人 能 预 知 敌 人 打 算 怎 么 使 用 护 身 符 ， 但 是 他 一 定 正 在 计 划 某 些 事 情 ， 而 我 们 必 须 阻 止 它 。
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_03"); //那 么 立 即 动 身 去 追 捕 小 偷 ！

	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePedro_WontEscape()
{
	AI_Output(other, self, "DIA_Karras_ChasePedro_WontEscape_15_00"); //他 不 会 走 得 那 么 远 。
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_01"); //我 这 么 想 是 为 你 好 。 如 果 他 因 为 你 在 这 里 浪 费 时 间 而 逃 脱 ， 我 将 亲 自 把 你 拉 到 法 庭 上 去 。
	AI_Output(other, self, "DIA_Karras_ChasePedro_WontEscape_15_02"); //你 要 控 告 我 什 么 ？
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_03"); //与 敌 人 同 谋 。 稍 微 想 象 一 下 这 种 罪 行 应 受 的 惩 罚 吧 。
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_04"); //现 在 不 要 再 浪 费 一 点 时 间 ， 否 则 下 次 我 们 再 见 面 ， 将 是 在 火 刑 柱 旁 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 31;
	condition		= DIA_Karras_NeedInfo_Condition;
	information		= DIA_Karras_NeedInfo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Karras_NeedInfo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self, other, "DIA_Karras_NeedInfo_10_00"); //你 已 经 知 道 了 所 有 你 需 要 知 道 的 事 。 现 在 立 刻 上 路 ！

	AI_StopProcessInfos(self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 1; // damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition		= DIA_Karras_InnosEyeRetrieved_Condition;
	information		= DIA_Karras_InnosEyeRetrieved_Info;
	description		= "我 已 经 拿 回 了 英 诺 斯 之 眼 。";
};

func int DIA_Karras_InnosEyeRetrieved_Condition()
{
	if ((KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other, self, "DIA_Karras_InnosEyeRetrieved_15_00"); //我 已 经 拿 回 了 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_01"); //你 能 把 ‘ 眼 睛 ’ 从 敌 人 手 里 夺 回 来 ， 我 全 放 心 了 。
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_02"); //但 是 危 险 尚 未 被 阻 止 。 邪 恶 还 在 制 订 更 长 远 的 计 划 ， 并 正 在 进 行 非 同 寻 常 的 侵 略 。
	AI_Output(other, self, "DIA_Karras_InnosEyeRetrieved_15_03"); //我 早 就 估 计 到 了 。
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_04"); //不 要 嘲 弄 我 。 情 况 很 危 急 ， 非 常 危 急 ， 而 我 们 不 知 道 可 以 相 信 谁 。
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_05"); //敌 人 已 经 成 功 的 地 把 新 信 徒 比 德 罗 引 入 魔 道 ， 而 他 还 可 能 成 功 地 诱 惑 了 更 多 其 它 的 人 。

	B_GivePlayerXP(XP_AMBIENT);
};

///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP3_Perm(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 5;
	condition		= DIA_Karras_KAP3_Perm_Condition;
	information		= DIA_Karras_KAP3_Perm_Info;
	permanent		= TRUE;
	description		= "你 的 研 究 进 展 的 怎 么 样 了 ？";
};

func int DIA_Karras_KAP3_Perm_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB)))
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_00"); //你 的 研 究 进 展 的 怎 么 样 了 ？

	if ((MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_01"); //我 已 经 发 现 了 一 些 关 于 搜 索 者 的 东 西 。
		AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_02"); //那 是 什 么 ？
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_03"); //他 们 显 然 是 有 魔 鬼 血 统 。 嗯 ， 至 少 他 们 现 在 或 以 前 受 到 魔 鬼 的 影 响 。
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_04"); //如 果 你 遇 到 他 们 要 当 心 。
		AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_05"); //多 么 新 奇 的 想 法 。
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_06"); //很 抱 歉 ， 但 是 我 没 有 足 够 的 材 料 进 行 更 加 准 确 的 描 述 。
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_07"); //但 是 如 果 你 能 设 法 给 我 一 些 他 们 的 东 西 来 研 究 的 话 … …

		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_7);

		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm, DIALOG_BACK, DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "我 应 该 看 看 我 能 做 什 么 。", DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "沉 睡 者 可 能 涉 及 其 中 吗 ？", DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "你 需 要 什 么 样 材 料 ？", DIA_Karras_KAP3_Perm_Material);
	}
	else if (MIS_KarrasResearchDMT == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_08"); //我 还 在 分 析 那 些 搜 索 者 的 证 据 。
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_09"); //一 旦 我 了 解 到 什 么 ， 我 当 然 会 立 即 告 诉 你 。
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_10"); //敌 人 有 很 多 种 面 孔 。 他 们 给 修 道 院 带 来 的 巨 大 危 险 十 分 难 以 判 断 。
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Sleeper_15_00"); //沉 睡 者 可 能 涉 及 其 中 吗 ？
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Sleeper_10_01"); //我 已 经 听 说 过 沉 睡 者 的 故 事 。 但 是 作 为 局 外 人 我 不 能 对 它 发 表 任 何 观 点 。
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Sleeper_10_02"); //有 数 不 尽 的 魔 鬼 ， 而 他 们 中 的 任 何 一 个 都 可 能 牵 扯 在 内 。
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Corpse_15_00"); //那 么 你 想 让 我 给 你 带 一 具 尸 体 来 吗 ？
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_01"); //不 ， 你 疯 了 吗 ？ 让 魔 鬼 化 身 进 入 修 道 院 的 高 墙 之 内 ， 这 太 危 险 了 。
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_02"); //如 果 你 能 找 到 一 些 带 有 这 种 魔 鬼 的 特 征 的 物 品 就 足 够 了 。
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_03"); //残 留 在 它 们 上 面 的 恶 魔 的 气 息 可 以 为 研 究 提 供 足 够 的 线 索 。
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Material_15_00"); //你 需 要 什 么 样 材 料 ？
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Material_10_01"); //我 不 知 道 - 任 何 属 于 这 些 家 伙 的 特 殊 物 品 都 行 。

	Info_AddChoice(DIA_Karras_KAP3_Perm, "你 想 让 我 把 尸 体 给 你 弄 来 ？", DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_WillSee_15_00"); //我 应 该 看 看 我 能 做 什 么 。
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_WillSee_10_01"); //它 当 然 非 常 有 用 。 同 时 ， 我 将 亲 自 进 行 我 的 研 究 。
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************
instance DIA_Karras_HaveBook(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_HaveBook_Condition;
	information		= DIA_Karras_HaveBook_Info;
	description		= "我 现 在 已 经 得 到 了 附 体 名 单 。";
};

func int DIA_Karras_HaveBook_Condition()
{
	if ((MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems(hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int KarrasGotResearchDMTBook_Day;
func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other, self, "DIA_Karras_HaveBook_15_00"); //我 找 到 了 一 本 附 体 名 单 。 也 许 你 能 发 现 它 的 一 些 用 途 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_01"); //给 我 看 看 。

	Npc_RemoveInvItems(other, ITWR_DementorObsessionBook_MIS, 1);
	AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"

	AI_Output(self, other, "DIA_Karras_HaveBook_10_02"); //是 的 ， 也 许 会 。 我 要 检 查 这 本 书 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_03"); //但 是 我 已 经 确 定 了 一 件 事 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_04"); //以 我 的 观 点 ， 搜 索 者 是 由 贝 利 尔 制 造 的 一 种 绝 对 邪 恶 的 生 命 形 式 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_05"); //这 些 生 物 一 半 是 魔 鬼 、 一 半 是 人 类 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_06"); //然 而 ， 现 在 我 还 不 知 道 我 们 看 到 的 是 一 种 精 神 附 体 ， 还 是 纯 粹 的 体 质 变 异 。
	AI_Output(self, other, "DIA_Karras_HaveBook_10_07"); //稍 后 再 来 ， 那 时 我 一 定 会 发 现 更 多 的 事 情 。
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_8);
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************
instance DIA_Karras_ResearchDMTEnd(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_ResearchDMTEnd_Condition;
	information		= DIA_Karras_ResearchDMTEnd_Info;
	permanent		= TRUE;
	description		= "发 现 什 么 搜 索 者 的 新 信 息 吗 ？";
};

func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if ((MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_00"); //发 现 什 么 搜 索 者 的 新 信 息 吗 ？

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_01"); //是 的 。 现 在 我 已 经 知 道 搜 索 者 究 竟 是 谁 或 者 什 么 。
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_02"); //快 说 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_03"); //他 们 曾 经 是 人 类 ， 就 像 你 和 我 。 他 们 犯 下 了 一 个 糟 糕 的 错 误 - 投 身 于 某 个 极 其 强 大 的 大 魔 鬼 的 邪 恶 魔 法 之 中 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_04"); //在 这 个 大 魔 鬼 强 大 的 影 响 下 ， 他 们 的 存 在 只 是 在 为 他 服 务 ， 直 到 他 们 只 剩 下 自 己 的 影 子 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_05"); //现 在 ， 他 们 只 是 邪 恶 的 工 具 ， 没 有 自 己 的 意 志 ， 而 且 他 们 永 远 不 会 停 止 猎 杀 英 诺 斯 的 追 随 者 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_06"); //我 们 一 定 要 小 心 。 目 前 看 来 ， 他 们 仍 旧 要 避 开 英 诺 斯 的 神 圣 大 堂 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_07"); //然 而 ， 如 果 他 们 的 力 量 继 续 增 长 下 去 ， 我 不 知 道 我 们 是 否 还 能 安 全 地 呆 在 这 里 。
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_08"); //谢 谢 。 那 非 常 有 启 发 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_09"); //真 的 ？ 只 会 让 我 产 生 更 多 的 问 题 。 例 如 ， 他 们 以 前 是 谁 ， 还 有 是 哪 个 大 魔 鬼 让 他 们 变 成 现 在 这 个 样 子 。
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_10"); //我 不 知 道 。 这 听 起 来 很 像 是 沉 睡 者 兄 弟 会 。 我 知 道 那 些 家 伙 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_11"); //我 希 望 你 了 解 自 己 被 卷 入 了 什 么 事 情 。 多 多 保 重 ， 我 的 兄 弟 。
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_12"); //但 是 ， 当 然 。 这 是 你 的 年 鉴 。 我 不 再 需 要 它 了 。

		CreateInvItems(other, ITWR_DementorObsessionBook_MIS, 1);
		AI_PrintScreen(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2); // "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_9);
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_13"); //我 还 在 继 续 工 作 。 以 后 再 来 吧 。
	};
};

//********************************************************************
//	Prot_BlackEye (ItAm_Prot_BlackEye_Mis)
//********************************************************************
instance DIA_Karras_Prot_BlackEye(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Prot_BlackEye_Condition;
	information		= DIA_Karras_Prot_BlackEye_Info;
	permanent		= TRUE;
	description		= "有 什 么 方 法 可 以 保 护 一 个 人 免 受 搜 索 者 的 心 理 攻 击 ？";
};

func int DIA_Karras_Prot_BlackEye_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB)))
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other, self, "DIA_Karras_Prot_BlackEye_15_00"); //有 什 么 方 法 可 以 保 护 一 个 人 免 受 搜 索 者 的 心 理 攻 击 ？

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_01"); //的 确 。 一 块 由 来 自 受 到 祝 福 的 土 地 中 的 石 头 制 成 的 护 身 符 有 一 种 保 护 效 果 。
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_02"); //不 幸 的 是 ， 我 没 有 足 够 的 那 种 石 头 。
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_03"); //某 些 我 们 建 造 的 祈 祷 神 龛 是 用 它 们 制 成 的 。
		AI_Output(other, self, "DIA_Karras_Prot_BlackEye_15_04"); //好 吧 。 我 会 张 罗 一 些 的 。
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_05"); //好 ， 去 做 吧 。 但 是 千 万 不 要 想 去 破 坏 神 龛 ， 你 听 到 了 吗 ？
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_10);
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_06"); //不 知 道 。 我 还 没 有 足 够 的 知 识 来 回 答 。 以 后 再 来 问 我 吧 。
	};
};

//********************************************************************
//	KarrasBlessedStone (ItAm_Prot_BlackEye_Mis)
//********************************************************************
instance DIA_Karras_KarrasBlessedStone(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_KarrasBlessedStone_Condition;
	information		= DIA_Karras_KarrasBlessedStone_Info;
	description		= "我 这 里 有 一 些 来 自 受 祝 福 的 土 地 的 石 头 。";
};

func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Npc_HasItems(other, ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int KarrasMakesBlessedStone_Day;
func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other, self, "DIA_Karras_KarrasBlessedStone_15_00"); //我 这 里 有 一 些 来 自 受 祝 福 的 土 地 的 石 头 。
	B_GiveInvItems(other, self, ItMi_KarrasBlessedStone_Mis, 1);
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_01"); //好 。 我 希 望 所 有 的 祈 祷 神 龛 还 都 在 它 们 原 来 的 位 置 。
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_02"); //好 吧 。 我 将 帮 你 制 作 一 个 防 护 护 身 符 来 抵 抗 搜 索 者 的 黑 色 凝 视 。
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_03"); //给 我 一 些 时 间 。 我 马 上 开 始 工 作 。
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_11);
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************
instance DIA_Karras_ItAm_Prot_BlackEye_Mis(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information		= DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent		= TRUE;
	description		= "那 你 答 应 给 我 的 防 护 护 身 符 呢 ？";
};

var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
func int DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output(other, self, "DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //那 你 答 应 给 我 的 防 护 护 身 符 呢 ？

	if (KarrasMakesBlessedStone_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //我 完 成 了 。 给 ， 看 一 下 。 它 已 经 变 得 非 常 漂 亮 了 。
		CreateInvItems(self, ItAm_Prot_BlackEye_Mis, 1);
		B_GiveInvItems(self, other, ItAm_Prot_BlackEye_Mis, 1);
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //时 刻 带 着 它 ， 那 样 搜 索 者 将 永 远 无 法 把 你 拉 进 他 们 的 心 灵 深 渊 。
		AI_Output(other, self, "DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //谢 谢 你 。
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_12);
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //耐 心 。 我 还 在 继 续 工 作 。
	};
};

// #####################################################################
// ##
// ## Kapitel 4
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP4_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP4_EXIT_Condition;
	information		= DIA_Karras_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 5
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP5_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP5_EXIT_Condition;
	information		= DIA_Karras_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Karras_PICKPOCKET(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 900;
	condition		= DIA_Karras_PICKPOCKET_Condition;
	information		= DIA_Karras_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen(49, 35);
};

func void DIA_Karras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
	Info_AddChoice(DIA_Karras_PICKPOCKET, DIALOG_BACK, DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};

func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};
