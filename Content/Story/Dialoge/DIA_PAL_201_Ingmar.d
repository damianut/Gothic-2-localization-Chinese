///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_EXIT(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 999;
	condition		= DIA_Ingmar_EXIT_Condition;
	information		= DIA_Ingmar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ingmar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Hallo(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 2;
	condition		= DIA_Ingmar_Hallo_Condition;
	information		= DIA_Ingmar_Hallo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

// ------------------------------------
var int DIA_Ingmar_Hallo_permanent;
// ------------------------------------
func int DIA_Ingmar_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (DIA_Ingmar_Hallo_permanent == FALSE)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Hallo_Info()
{
	if ((EnterOW_Kapitel2 == FALSE)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self, other, "DIA_Ingmar_Hallo_06_00"); //根 据 我 收 到 的 报 告 ， 矿 藏 山 谷 是 一 个 危 险 的 地 方 .
		AI_Output(self, other, "DIA_Ingmar_Hallo_06_01"); //在 你 离 开 之 前 ， 你 一 定 要 确 保 装 备 完 善 。
	}
	else if ((MIS_OLDWORLD == LOG_SUCCESS)
	&& (LordHagen.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(self, other, "DIA_Ingmar_Hallo_06_02"); //矿 藏 山 谷 的 状 况 非 常 令 人 担 忧 。 但 是 我 们 会 研 究 出 计 划 解 除 危 险 ， 并 让 我 们 的 人 带 着 矿 石 离 开 那 里 。
		DIA_Ingmar_Hallo_permanent = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Ingmar_Hallo_06_03"); //我 想 你 是 来 找 哈 根 勋 爵 谈 话 的 ， 所 以 你 应 该 直 接 过 去 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Krieg mit den Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Krieg(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 99;
	condition		= DIA_Ingmar_Krieg_Condition;
	information		= DIA_Ingmar_Krieg_Info;
	description		= "本 土 的 状 况 如 何 。？";
};

func int DIA_Ingmar_Krieg_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Krieg_Info()
{
	AI_Output(other, self, "DIA_Ingmar_Krieg_15_00"); //本 土 的 状 况 如 何 。？
	AI_Output(self, other, "DIA_Ingmar_Krieg_06_01"); //虽 然 皇 家 部 队 已 经 把 兽 人 击 退 ， 但 是 战 争 还 没 有 胜 利 。
	AI_Output(self, other, "DIA_Ingmar_Krieg_06_02"); //但 是 很 多 地 方 都 有 兽 人 小 股 部 队 集 合 ， 试 图 分 散 我 们 的 军 力。
	AI_Output(self, other, "DIA_Ingmar_Krieg_06_03"); //他 们 打 仗 没 有 荣 誉 、 没 有 信 仰 - 因 此 我 们 终 将 获 胜 。
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_CanTeach(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 100;
	condition		= DIA_Ingmar_CanTeach_Condition;
	information		= DIA_Ingmar_CanTeach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 ？";
};

func int DIA_Ingmar_CanTeach_Condition()
{
	if (Ingmar_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Ingmar_CanTeach_15_00"); //你 能 教 我 什 么 ？

	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Ingmar_CanTeach_06_01"); //我 能 教 你 如 何 增 强 你 的 臂 力 ， 以 便 更 加 有 效 地 使 用 你 的 武 器。
		Ingmar_TeachSTR = TRUE;
		B_LogEntry(TOPIC_CityTeacher, TOPIC_CityTeacher_11);
	}
	else
	{
		AI_Output(self, other, "DIA_Ingmar_CanTeach_06_02"); //我 只 传 授 我 们 兄 弟 会 的 追 随 者 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_Teach(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 6;
	condition		= DIA_Ingmar_Teach_Condition;
	information		= DIA_Ingmar_Teach_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 强 壮 。";
};

func int DIA_Ingmar_Teach_Condition()
{
	if (Ingmar_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_Teach_Info()
{
	AI_Output(other, self, "DIA_Ingmar_Teach_15_00"); //我 想 要 变 得 更 强 壮 。

	Info_ClearChoices(DIA_Ingmar_Teach);
	Info_AddChoice(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_BACK()
{
	if (other.attribute [ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self, other, "DIA_Ingmar_Teach_06_00"); //你 象 兽 人 一 样 强 壮 。 我 没 什 么 能 教 你 的 了 。
	};

	Info_ClearChoices(DIA_Ingmar_TEACH);
};

func void DIA_Ingmar_Teach_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MAX);

	Info_ClearChoices(DIA_Ingmar_Teach);

	Info_AddChoice(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_TEACH_BACK);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ingmar_Teach_5);
};

func void DIA_Ingmar_Teach_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices(DIA_Ingmar_Teach);

	Info_AddChoice(DIA_Ingmar_Teach, DIALOG_BACK, DIA_Ingmar_Teach_BACK);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ingmar_Teach_1);
	Info_AddChoice(DIA_Ingmar_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ingmar_Teach_5);
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
instance DIA_Ingmar_KAP3_EXIT(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 999;
	condition		= DIA_Ingmar_KAP3_EXIT_Condition;
	information		= DIA_Ingmar_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ingmar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP3_EXIT_Info()
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
instance DIA_Ingmar_KAP4_EXIT(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 999;
	condition		= DIA_Ingmar_KAP4_EXIT_Condition;
	information		= DIA_Ingmar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ingmar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orkelite
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_ORKELITE(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 40;
	condition		= DIA_Ingmar_ORKELITE_Condition;
	information		= DIA_Ingmar_ORKELITE_Info;
	description		= "兽 人 们 正 在 策 划 一 次 重 大 的 进 攻 。";
};

func int DIA_Ingmar_ORKELITE_Condition()
{
	if (((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems(other, ItRi_OrcEliteRing)) || (Hagen_SawOrcRing == TRUE))
	&& (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_ORKELITE_Info()
{
	AI_Output(other, self, "DIA_Ingmar_ORKELITE_15_00"); //兽 人 们 正 在 策 划 一 次 重 大 的 进 攻 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_06_01"); //的 确 。 嗯 ， 那 非 常 有 意 思 。 你 怎 么 会 知 道 这 些 ？

	if (TalkedTo_AntiPaladin == TRUE)
	{
		AI_Output(other, self, "DIA_Ingmar_ORKELITE_15_02"); //我 已 经 同 他 们 谈 过 了 。
	};

	AI_Output(other, self, "DIA_Ingmar_ORKELITE_15_03"); //他 们 的 一 些 首 领 正 在 这 个 地 区 出 没 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_06_04"); //嗯 。 那 听 起 来 不 像 是 兽 人 的 常 规 战 略 。

	Info_ClearChoices(DIA_Ingmar_ORKELITE);
	Info_AddChoice(DIA_Ingmar_ORKELITE, "你 想 办 法 除 掉 他 们 。", DIA_Ingmar_ORKELITE_loswerden);
	Info_AddChoice(DIA_Ingmar_ORKELITE, "我 们 现 在 要 做 什 么 ？", DIA_Ingmar_ORKELITE_wasTun);
	Info_AddChoice(DIA_Ingmar_ORKELITE, "那 是 什 么 意 思 ？", DIA_Ingmar_ORKELITE_wieso);

	Log_CreateTopic(TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_5);

	MIS_KillOrkOberst = LOG_RUNNING;
};

func void DIA_Ingmar_ORKELITE_loswerden()
{
	AI_Output(other, self, "DIA_Ingmar_ORKELITE_loswerden_15_00"); //你 想 办 法 除 掉 他 们 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_loswerden_06_01"); //如 果 我 们 能 获 得 更 多 信 息 的 话 就 更 好 了 。 我 将 派 一 些 人 在 附 近 进 行 侦 察 。
	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

func void DIA_Ingmar_ORKELITE_wieso()
{
	AI_Output(other, self, "DIA_Ingmar_ORKELITE_wieso_15_00"); //那 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wieso_06_01"); //如 果 你 所 说 正 确 的 话 ， 那 意 味 着 他 们 希 望 利 用 最 好 的 战 士 从 内 部 进 攻 来 消 弱 我 们 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wieso_06_02"); //通 常 ， 每 群 兽 人 战 士 都 由 一 名 军 阀 率 领 。 你 很 少 能 见 到 两 个 甚 至 更 多 军 阀 呆 在 一 起 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wieso_06_03"); //他 们 这 样 做 是 有 原 因 的 。 他 们 的 首 领 组 成 战 略 攻 击 的 核 心 ， 周 围 由 兽 人 战 士 围 住 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wieso_06_04"); //这 样 的 话 ， 如 果 不 能 突 破 至 少30名 以 上 的 战 士 的 话 ， 想 要 靠 近 他 们 非 常 难 。

	B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_6);
};

func void DIA_Ingmar_ORKELITE_wasTun()
{
	AI_Output(other, self, "DIA_Ingmar_ORKELITE_wasTun_15_00"); //我 们 现 在 要 做 什 么 ？
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wasTun_06_01"); //当 他 们 以 大 量 这 样 的 组 合 出 现 时 ， 通 常 会 组 成 一 支 突 袭 队 ， 并 由 他 们 之 中 等 级 最 高 的 人 领 导 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wasTun_06_02"); //这 名 最 高 级 军 阀 会 建 立 一 个 司 令 部 ， 并 在 指 挥 他 的 部 队 进 入 战 斗 后 ， 撤 回 到 某 个 山 洞 里 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wasTun_06_03"); //如 果 我 们 能 够 控 制 这 个 首 领 ， 那 将 让 我 们 取 得 决 定 性 的 优 势 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wasTun_06_04"); //兽 人 首 领 通 常 喜 欢 在 他 的 敌 人 附 近 游 荡 。 那 么 在 离 城 市 不 算 很 远 的 地 方 去 找 他 的 山 洞 应 该 十 分 明 智 。
	AI_Output(self, other, "DIA_Ingmar_ORKELITE_wasTun_06_05"); //在 洛 拔 特 的 农 场 的 附 近 发 现 了 一 些 兽 人 。 也 许 你 应 该 从 那 里 开 始 你 的 搜 索 。

	B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_7);

	Info_ClearChoices(DIA_Ingmar_ORKELITE);
};

///////////////////////////////////////////////////////////////////////
//	Info Hauptquartier
///////////////////////////////////////////////////////////////////////
instance DIA_Ingmar_HAUPTQUARTIER(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 41;
	condition		= DIA_Ingmar_HAUPTQUARTIER_Condition;
	information		= DIA_Ingmar_HAUPTQUARTIER_Info;
	description		= "我 终 于 找 到 了 兽 人 的 总 部";
};

func int DIA_Ingmar_HAUPTQUARTIER_Condition()
{
	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst))
	&& (Npc_KnowsInfo(other, DIA_Ingmar_ORKELITE)))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_HAUPTQUARTIER_Info()
{
	AI_Output(other, self, "DIA_Ingmar_HAUPTQUARTIER_15_00"); //我 已 经 找 到 了 兽 人 的 司 令 部 。 他 们 的 军 阀 领 袖 已 经 死 了 。
	AI_Output(self, other, "DIA_Ingmar_HAUPTQUARTIER_06_01"); //这 是 个 大 新 闻 。 那 够 兽 人 忙 一 阵 的 了 。
	AI_Output(self, other, "DIA_Ingmar_HAUPTQUARTIER_06_02"); //干 得 不 错 。 如 果 我 们 有 更 多 像 你 一 样 的 骑 士 ， 接 下 来 的 战 斗 就 是 小 菜 一 碟 。
	AI_Output(self, other, "DIA_Ingmar_HAUPTQUARTIER_06_03"); //给 。 拿 上 我 们 的 金 币 ， 并 用 它 给 你 自 己 买 些 装 备 。

	B_GivePlayerXP(XP_KilledOrkOberst);
	CreateInvItems(self, ItMi_Gold, 300);
	B_GiveInvItems(self, other, ItMi_Gold, 300);
	MIS_KillOrkOberst = LOG_SUCCESS;
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
instance DIA_Ingmar_KAP5_EXIT(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 999;
	condition		= DIA_Ingmar_KAP5_EXIT_Condition;
	information		= DIA_Ingmar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ingmar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Ingmar_KAP6_EXIT(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 999;
	condition		= DIA_Ingmar_KAP6_EXIT_Condition;
	information		= DIA_Ingmar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ingmar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Ingmar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ingmar_PICKPOCKET(C_INFO)
{
	npc				= Pal_201_Ingmar;
	nr				= 900;
	condition		= DIA_Ingmar_PICKPOCKET_Condition;
	information		= DIA_Ingmar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 想 要 偷 走 他 的 卷 轴 简 直 不 可 能 ）";
};

func int DIA_Ingmar_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (105 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Ingmar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET, DIALOG_BACK, DIA_Ingmar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ingmar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ingmar_PICKPOCKET_DoIt);
};

func void DIA_Ingmar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 105)
	{
		B_GiveInvItems(self, other, ITWr_Manowar, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Ingmar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ingmar_PICKPOCKET);
};
