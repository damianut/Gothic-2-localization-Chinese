// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Brandon_EXIT(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 999;
	condition		= DIA_Addon_Brandon_EXIT_Condition;
	information		= DIA_Addon_Brandon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Brandon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Hallo
// ************************************************************
instance DIA_Addon_Brandon_Hello(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 1;
	condition		= DIA_Addon_Brandon_Hello_Condition;
	information		= DIA_Addon_Brandon_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Brandon_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Brandon_Hello_04_00"); //看 那 里 。 一 个 新 成 员 。
	AI_Output(self, other, "DIA_Addon_Brandon_Hello_04_01"); //而 且 还 是 个 旱 鸭 子 ！
	AI_Output(self, other, "DIA_Addon_Brandon_Hello_04_02"); //对 于 海 盗 来 说 ， 你 太 瘦 了 。
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Addon_Brandon_AnyNews(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 99;
	condition		= DIA_Addon_Brandon_AnyNews_Condition;
	information		= DIA_Addon_Brandon_AnyNews_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 新 消 息 的 吗 ？";
};

func int DIA_Addon_Brandon_AnyNews_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_AnyNews_15_00"); //还 有 什 么 新 消 息 的 吗 ？

	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self, other, "DIA_Addon_Brandon_Alright_04_01"); //你 可 以 那 么 说 。 我 受 伤 了 ， 你 有 治 疗 药 剂 可 以 分 享 吗 ？
		}
		else
		{
			if (C_AllCanyonRazorDead() == FALSE)
			{
				AI_Output(self, other, "DIA_Addon_Brandon_Alright_04_02"); //现 在 怎 么 办 ？ 我 们 要 准 备 痛 击 那 些 野 兽 吗 ， 还 是 不 行 ？
			}
			else // alle platt
			{
				AI_Output(self, other, "DIA_Addon_Brandon_Alright_04_03"); //看 你 问 的 问 题 ！ 我 不 认 为 在 整 个 的 峡 谷 里 还 会 有 一 头 剃 刀 龙 ！
			};
		};
	}
	else if ((GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg))
	&& (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Addon_Brandon_AnyNews_04_04"); //不 ， 不 过 因 为 格 雷 格 回 来 了 ， 我 希 望 那 会 快 点 改 变 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Brandon_AnyNews_04_06"); //（ 不 怀 好 意 的 ） 等 一 会 。
		AI_PlayAni(self, "T_SEARCH");
		AI_Output(self, other, "DIA_Addon_Brandon_AnyNews_04_07"); //（ 大 笑 ） 和 我 见 到 的 不 一 样 。 一 样 老 ， 一 样 老 ！
	};
};

// ************************************************************
// *** ***
// 			  			Teach STR und DEX
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 						Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Brandon_WannaLearn(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 11;
	condition		= DIA_Addon_Brandon_WannaLearn_Condition;
	information		= DIA_Addon_Brandon_WannaLearn_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Addon_Brandon_WannaLearn_Condition()
{
	return TRUE;
};

func void DIA_Addon_Brandon_WannaLearn_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_WannaLearn_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Brandon_WannaLearn_04_01"); //教 你 ？ 当 然 ！ 我 可 以 教 你 如 何 变 得 强 壮 ， 并 增 加 你 的 敏 捷 。
	AI_Output(self, other, "DIA_Addon_Brandon_WannaLearn_04_02"); //但 是 我 为 什 么 要 那 么 做 ？
	AI_Output(other, self, "DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00"); //因 为 我 要 给 你 买 一 杯 酒 ？
	AI_Output(self, other, "DIA_Addon_Brandon_WannaLearn_04_03"); //（ 露 齿 而 笑 ） 不 错 ， 老 兄 ！ 了 解 - 第 一 次 尝 试 。
	AI_Output(self, other, "DIA_Addon_Brandon_WannaLearn_04_04"); //但 是 别 想 拿 点 便 宜 的 劣 质 酒 就 来 烦 我 ！
	MIS_Brandon_BringHering = LOG_RUNNING;

	Log_CreateTopic(Topic_Addon_PIR_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher, Log_Text_Addon_BrandonTeach);

	Log_CreateTopic(TOPIC_Addon_BrandonBooze, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BrandonBooze, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BrandonBooze, TOPIC_Addon_BrandonBooze_1);
};

// ------------------------------------------------------------
// 						Hole Grog
// ------------------------------------------------------------
instance DIA_Addon_Brandon_HoleGrog(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 12;
	condition		= DIA_Addon_Brandon_HoleGrog_Condition;
	information		= DIA_Addon_Brandon_HoleGrog_Info;
	description		= "我 要 请 你 喝 杯 烈 酒 。";
};

func int DIA_Addon_Brandon_HoleGrog_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_HoleGrog_Info()
{
	AI_Output(other, self, "DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00"); //我 要 请 你 喝 杯 烈 酒 。
	AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_01"); //你 想 要 毒 死 我 ？ ？ ？
	AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_02"); //我 不 会 碰 那 些 垃 圾 ！ 你 知 道 那 里 有 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_03"); //老 塞 缪 尔 也 有 一 些 好 东 西 ！ 去 给 我 弄 点 过 来 ！
	if (Player_KnowsSchnellerHering == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Brandon_Hello_15_05"); //你 说 的 是 他 的 ‘ 急 躁 鲱 鱼 ’ ？
		AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_04"); //对 ， 我 就 是 说 的 那 个 !
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_05"); //你 试 过 塞 缪 尔 的 特 殊 配 方 吗 ？
		AI_Output(other, self, "DIA_Addon_Brandon_Hello_15_07"); //不 ， 还 没 有 。
		AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_06"); //拿 去 试 试 吧 。 它 是 必 须 要 尝 一 尝 的 。
	};

	AI_Output(self, other, "DIA_Addon_Brandon_HoleGrog_04_08"); //我 太 爱 这 种 调 制 品 了 ！

	B_LogEntry(TOPIC_Addon_BrandonBooze, TOPIC_Addon_BrandonBooze_2);
};

// ------------------------------------------------------------
// 					Schnellen Hering geben
// ------------------------------------------------------------
instance DIA_Addon_Brandon_SchnellerHering(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 13;
	condition		= DIA_Addon_Brandon_SchnellerHering_Condition;
	information		= DIA_Addon_Brandon_SchnellerHering_Info;
	description		= "喝 了 这 杯 急 躁 鲱 鱼 ！";
};

func int DIA_Addon_Brandon_SchnellerHering_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Brandon_WannaLearn))
	&& (Npc_HasItems(other, ItFo_Addon_SchnellerHering) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_SchnellerHering_Info()
{
	AI_Output(other, self, "DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00"); //给 你 。
	B_GiveInvItems(other, self, ItFo_Addon_Schnellerhering, 1);
	B_UseItem(self, ItFo_Addon_Schnellerhering);
	AI_Output(self, other, "DIA_Addon_Brandon_GiveGrog_04_01"); //啊 ！ 喝 下 去 就 像 是 一 团 液 体 的 火 ！

	B_LogEntry(TOPIC_Addon_BrandonBooze, TOPIC_Addon_BrandonBooze_3);

	MIS_Brandon_BringHering = LOG_SUCCESS;
	B_GivePlayerXP(XP_AMBIENT);
};

// ------------------------------------------------------------
// 			 Bring mir was bei!
// ------------------------------------------------------------
var int Brandon_Merke_Str;
var int Brandon_Merke_Dex;
// ------------------------------------------------------------
instance DIA_Addon_Brandon_TeachPlayer(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 777;
	condition		= DIA_Addon_Brandon_TeachPlayer_Condition;
	information		= DIA_Addon_Brandon_TeachPlayer_Info;
	permanent		= TRUE;
	description		= "教 我 点 东 西 ！";
};

func int DIA_Addon_Brandon_TeachPlayer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Brandon_WannaLearn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TeachPlayer_Info()
{
	AI_Output(other, self, "DIA_Addon_Francis_TeachPlayer_15_00"); //教 我 点 东 西 ！

	Brandon_Merke_Str = other.attribute[ATR_STRENGTH];
	Brandon_Merke_Dex = other.attribute[ATR_DEXTERITY];

	if (MIS_Brandon_BringHering == LOG_SUCCESS)
	{
		Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, DIALOG_BACK, DIA_Addon_Brandon_TeachPlayer_Back);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Brandon_TeachPlayer_DEX_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Brandon_TeachPlayer_DEX_5);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Brandon_TeachPlayer_STR_1);
		Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Brandon_TeachPlayer_STR_5);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Brandon_TeachPlayer_04_01"); //你 要 去 给 我 弄 点 像 样 的 酒 来 喝 ， 小 子 ！
	};
};

// ------------------------------------------------------------
func void DIA_Addon_Brandon_TeachPlayer_Back()
{
	if (other.attribute[ATR_STRENGTH] > Brandon_Merke_Str)
	{
		AI_Output(self, other, "DIA_Addon_Brandon_TeachPlayer_Back_04_00"); //好 吧 ， 伙 计 ！ 你 已 经 变 得 相 当 强 壮 。
	};

	if (other.attribute[ATR_DEXTERITY] > Brandon_Merke_Dex)
	{
		AI_Output(self, other, "DIA_Addon_Brandon_TeachPlayer_Back_04_01"); //你 越 灵 活 ， 你 就 越 能 准 确 击 中 你 的 目 标 。
	};

	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
};

// ------------------------------------------------------------
func void DIA_Addon_Brandon_TeachPlayer_DEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);

	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, DIALOG_BACK, DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Brandon_TeachPlayer_STR_5);
};

// ------------------------------------------------------------
func void DIA_Addon_Brandon_TeachPlayer_DEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, DIALOG_BACK, DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Brandon_TeachPlayer_STR_5);
};

// ------------------------------------------------------------
func void DIA_Addon_Brandon_TeachPlayer_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, DIALOG_BACK, DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Brandon_TeachPlayer_STR_5);
};

// ------------------------------------------------------------
func void DIA_Addon_Brandon_TeachPlayer_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Addon_Brandon_TeachPlayer);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, DIALOG_BACK, DIA_Addon_Brandon_TeachPlayer_Back);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Addon_Brandon_TeachPlayer_DEX_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnDex5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Addon_Brandon_TeachPlayer_DEX_5);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Brandon_TeachPlayer_STR_1);
	Info_AddChoice(DIA_Addon_Brandon_TeachPlayer, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Brandon_TeachPlayer_STR_5);
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Brandon_Anheuern(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 11;
	condition		= DIA_Addon_Brandon_Anheuern_Condition;
	information		= DIA_Addon_Brandon_Anheuern_Info;
	description		= "你 应 该 帮 助 我 。";
};

func int DIA_Addon_Brandon_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_FollowMe_15_00"); //你 应 该 帮 助 我 。
	AI_Output(self, other, "DIA_Addon_Brandon_Anheuern_04_01"); //我 不 熟 悉 那 个 。 谁 说 的 ？
	AI_Output(other, self, "DIA_Addon_Brandon_FollowMe_15_02"); //格 雷 格 说 的 。 我 们 要 去 峡 谷 捕 猎 剃 刀 龙 。
	AI_Output(self, other, "DIA_Addon_Brandon_Anheuern_04_03"); //（ 露 齿 而 笑 ） 终 于 要 做 点 事 了 ！
	AI_Output(self, other, "DIA_Addon_Brandon_Anheuern_04_04"); //那 我 们 立 刻 出 发 吧 ， 我 们 越 早 去 解 决 那 些 野 兽 ， 就 能 越 早 回 来 。
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Brandon_ComeOn(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 12;
	condition		= DIA_Addon_Brandon_ComeOn_Condition;
	information		= DIA_Addon_Brandon_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_Brandon_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Brandon_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_Weiter_15_00"); //跟 我 来 。
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Brandon_ComeOn_04_02"); //我 们 先 往 回 走 一 点 ！
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Brandon_ComeOn_04_01"); //我 在 这 里 ！
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_Brandon_GoHome(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 13;
	condition		= DIA_Addon_Brandon_GoHome_Condition;
	information		= DIA_Addon_Brandon_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_Brandon_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_DontNeedYou_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_Brandon_GoHome_04_01"); //好 吧 ， 没 问 题 。
	AI_Output(self, other, "DIA_Addon_Brandon_GoHome_04_02"); //也 许 我 们 能 找 个 时 间 一 起 喝 一 杯 。

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START"); // START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_Brandon_TooFar(C_INFO)
{
	npc				= PIR_1366_Addon_Brandon;
	nr				= 14;
	condition		= DIA_Addon_Brandon_TooFar_Condition;
	information		= DIA_Addon_Brandon_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Brandon_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brandon_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_Brandon_TooFar_04_00"); //已 经 够 了 ！ 你 想 要 把 整 个 岛 上 的 都 消 灭 吗 ？
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self, other, "DIA_Addon_Brandon_TooFar_04_01"); //我 们 回 营 地 去 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Brandon_TooFar_04_02"); //我 要 回 营 地 去 。
	};

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};
