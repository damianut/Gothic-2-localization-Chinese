///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_EXIT(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 999;
	condition		= DIA_Vino_EXIT_Condition;
	information		= DIA_Vino_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vino_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Vino_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//							Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_HALLO(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 1;
	condition		= DIA_Vino_HALLO_Condition;
	information		= DIA_Vino_HALLO_Info;
	important		= TRUE;
};

func int DIA_Vino_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_HALLO_Info()
{
	AI_Output(other, self, "DIA_Vino_HALLO_15_00"); //工 作 怎 么 样 ？
	AI_Output(self, other, "DIA_Vino_HALLO_05_01"); //同 往 常 一 样 。 有 很 多 事 情 要 做 ， 钱 不 够 用 ， 如 果 运 气 坏 一 点 的 话 ， 明 天 兽 人 就 会 到 来 并 烧 掉 我 们 的 农 场 。

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Vino_HALLO_05_02"); //国 王 的 圣 骑 士 已 经 占 据 了 整 个 城 市 。 但 是 如 果 兽 人 攻 击 我 们 的 话 ， 我 很 难 相 信 他 们 会 移 驾 到 我 们 这 里 来 。
	};
};

///////////////////////////////////////////////////////////////////////
//						Suche Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_SeekWork(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 1;
	condition		= DIA_Vino_SeekWork_Condition;
	information		= DIA_Vino_SeekWork_Info;
	description		= "我 能 帮 助 你 吗 ？ 我 在 找 工 作 。";
};

func int DIA_Vino_SeekWork_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_WorkNOW)
	|| Npc_KnowsInfo(other, DIA_Lobart_KLEIDUNG))
	&& (!Npc_IsDead(Lobart))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_SeekWork_Info()
{
	AI_Output(other, self, "DIA_Vino_SeekWork_15_00"); //我 能 帮 助 你 吗 ？ 我 在 找 工 作 。

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Vino_SeekWork_05_01"); //你 了 解 农 田 里 的 工 作 吗 ？
		AI_Output(other, self, "DIA_Vino_SeekWork_15_02"); //有 什 么 需 要 了 解 的 ？
		AI_Output(self, other, "DIA_Vino_SeekWork_05_03"); //啊 ！ 那 样 的 话 … … 我 想 我 们 这 里 还 好 ， 谢 谢 你 。

		if (!Npc_IsDead(Lobart))
		{
			AI_Output(self, other, "DIA_Vino_SeekWork_05_04"); //如 果 你 想 要 给 洛 拔 特 做 临 时 工 ， 我 只 能 警 告 你 。 他 付 给 像 你 这 样 的 人 的 工 钱 相 当 可 怜 ！

			if (((Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == TRUE) || (Npc_HasItems(lobart, itar_bau_l) > 0))
			&& (Lobart_Kleidung_Verkauft == FALSE)
			&& ((Npc_KnowsInfo(other, DIA_Lobart_KLEIDUNG)) || (Npc_KnowsInfo(other, DIA_Lobart_WorkNOW))))
			{
				AI_Output(other, self, "DIA_Vino_SeekWork_15_05"); //如 果 我 帮 他 做 农 活 的 话 ， 他 会 便 宜 卖 我 一 套 干 净 的 衣 服 。
				AI_Output(self, other, "DIA_Vino_SeekWork_05_06"); //嗯 。 我 没 有 什 么 事 给 你 做 ， 但 是 你 可 以 给 我 和 这 些 小 伙 子 找 点 什 么 喝 的 。
				AI_Output(self, other, "DIA_Vino_SeekWork_05_07"); //给 我 拿 一 瓶 葡 萄 酒 来 ， 我 就 告 诉 洛 拔 特 你 给 了 我 们 很 大 的 帮 助 （ 愚 弄 的 大 笑 ） 。

				MIS_Vino_Wein = LOG_RUNNING;

				Log_CreateTopic(TOPIC_Vino, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Vino, LOG_RUNNING);
				B_LogEntry(TOPIC_Vino, TOPIC_Vino_1);
			}
			else
			{
				AI_Output(self, other, "DIA_Vino_SeekWork_05_08"); //但 是 那 个 东 西 不 是 从 我 这 里 弄 到 的 ， 明 白 吗 ？！
			};
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Vino_SeekWork_05_09"); //我 不 这 么 认 为 。 像 你 这 样 的 人 不 会 想 做 我 能 提 供 给 你 的 那 些 低 微 的 工 作 。
	};
};

///////////////////////////////////////////////////////////////////////
//						Wein bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_BringWine(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 1;
	condition		= DIA_Vino_BringWine_Condition;
	information		= DIA_Vino_BringWine_Info;
	description		= "这 是 你 的 葡 萄 酒 。";
};

func int DIA_Vino_BringWine_Condition()
{
	if ((MIS_Vino_Wein == LOG_RUNNING)
	&& (Npc_HasItems(other, itfo_wine) > 0)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_BringWine_Info()
{
	AI_Output(other, self, "DIA_Vino_BringWine_15_00"); //这 是 你 的 葡 萄 酒 。
	B_GiveInvItems(other, self, itfo_wine, 1);
	AI_Output(self, other, "DIA_Vino_BringWine_05_01"); //我 最 好 不 要 问 你 是 从 哪 里 弄 到 它 的 ， 嗯 ？ （ 大 笑 ） 谁 在 乎 呢 ？。
	if (!Npc_IsDead(Lobart))
	{
		AI_Output(self, other, "DIA_Vino_BringWine_05_02"); //无 论 如 何 ， 谢 谢 。

		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Vino_BringWine_05_03"); //洛 拔 特 只 会 听 到 关 于 你 的 好 话 。
		};
	};

	MIS_Vino_Wein = LOG_SUCCESS;
	B_GivePlayerXP(XP_VinoWein);
};

///////////////////////////////////////////////////////////////////////
//						will in die Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_ToTheCity(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 3;
	condition		= DIA_Vino_ToTheCity_Condition;
	information		= DIA_Vino_ToTheCity_Info;
	description		= "我 要 进 城 。";
};

func int DIA_Vino_ToTheCity_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Vino_ToTheCity_Info()
{
	AI_Output(other, self, "DIA_Vino_ToTheCity_15_00"); //我 要 进 城 。
	AI_Output(self, other, "DIA_Vino_ToTheCity_05_01"); //还 好 吗 ？
	AI_Output(other, self, "DIA_Vino_ToTheCity_15_02"); //你 是 否 能 告 诉 我 一 些 关 于 城 市 的 趣 事 呢 ？
	AI_Output(self, other, "DIA_Vino_ToTheCity_05_03"); //不 。 但 是 玛 勒 斯 时 常 去 城 市 - 也 许 他 知 道 一 些 事 情 - 我 是 说 ， 一 些 会 让 你 感 兴 趣 的 事 。
};

///////////////////////////////////////////////////////////////////////
//								Gerüchte (PERM)
///////////////////////////////////////////////////////////////////////

// --------------------------
var int Vino_Gossip_Orks;
var int Vino_Gossip_Bugs;
// --------------------------
instance DIA_Vino_PERM(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 10;
	condition		= DIA_Vino_PERM_Condition;
	information		= DIA_Vino_PERM_Info;
	permanent		= TRUE;
	description		= "有 什 么 有 趣 的 新 闻 吗 ？";
};

func int DIA_Vino_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Vino_HALLO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM_Info()
{
	AI_Output(other, self, "DIA_Vino_PERM_15_00"); //有 什 么 有 趣 的 新 闻 吗 ？

	if (Vino_Gossip_Orks == FALSE)
	{
		AI_Output(self, other, "DIA_Vino_PERM_05_01"); //我 可 以 发 誓 ， 我 在 两 天 前 看 到 有 个 兽 人 在 树 林 边 上 。
		AI_Output(self, other, "DIA_Vino_PERM_05_02"); //从 那 时 起 ， 我 晚 上 总 是 提 心 吊 胆 。
		Vino_Gossip_Orks = TRUE;
		Knows_Ork = TRUE;
	}
	else if ((Vino_Gossip_Bugs == FALSE)
	&& (MIS_AndreHelpLobart == LOG_RUNNING))
	{
		AI_Output(self, other, "DIA_Vino_PERM_05_03"); //这 些 巨 大 的 、 令 人 厌 恶 的 、 折 磨 人 的 甲 虫 已 经 变 得 了 真 正 的 祸 害 。 它 们 到 处 都 是 。 如 果 你 不 留 神 的 话 ， 它 们 会 把 能 看 到 的 一 切 都 吃 掉 。
		AI_Output(self, other, "DIA_Vino_PERM_05_04"); //几 天 前 ， 我 正 躺 在 草 丛 里 ， 想 我 自 己 的 事 ， 快 要 睡 着 的 时 候 ， 这 种 该 死 的 东 西 居 然 有 一 个 开 始 啃 我 的 鞋 ！
		AI_Output(self, other, "DIA_Vino_PERM_05_05"); //你 真 应 该 看 我 是 怎 么 跑 的 。 从 那 时 起 ， 我 就 再 也 睡 不 安 稳 了 。
		Vino_Gossip_Bugs = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Vino_PERM_05_06"); //除 了 我 已 经 告 诉 你 的 事 情 以 外 ？ 没 了 。
	};
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
instance DIA_Vino_KAP3_EXIT(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 999;
	condition		= DIA_Vino_KAP3_EXIT_Condition;
	information		= DIA_Vino_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vino_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMTAMSTART
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_DMTAMSTART(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 31;
	condition		= DIA_Vino_DMTAMSTART_Condition;
	information		= DIA_Vino_DMTAMSTART_Info;
	permanent		= TRUE;
	description		= "它 是 怎 么 袭 击 你 的 ？";
};

func int DIA_Vino_DMTAMSTART_Condition()
{
	if ((Kapitel == 3)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

var int DIA_Vino_DMTAMSTART_OneTime;
func void DIA_Vino_DMTAMSTART_Info()
{
	AI_Output(other, self, "DIA_Vino_DMTAMSTART_15_00"); //它 是 怎 么 袭 击 你 的 ？

	if ((FoundVinosKellerei == TRUE)
	&& (DIA_Vino_DMTAMSTART_OneTime == FALSE)
	&& (hero.guild != GIL_MIL))
	{
		AI_Output(self, other, "DIA_Vino_DMTAMSTART_05_01"); //讨 厌 。 民 兵 找 到 了 我 藏 起 来 的 蒸 馏 器 。
		AI_Output(self, other, "DIA_Vino_DMTAMSTART_05_02"); //我 希 望 他 们 永 远 也 不 会 发 现 那 是 属 于 我 的 。
		B_GivePlayerXP(XP_AmbientKap3);
		DIA_Vino_DMTAMSTART_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Vino_DMTAMSTART_05_03"); //到 处 都 是 那 些 戴 黑 罩 帽 的 混 蛋 。 应 该 有 人 把 他 们 的 罩 帽 塞 进 他 们 的 喉 咙 里 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Obesessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Obesessed(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 32;
	condition		= DIA_Vino_Obesessed_Condition;
	information		= DIA_Vino_Obesessed_Info;
	permanent		= TRUE;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Vino_Obesessed_Condition()
{
	if ((NpcObsessedByDMT_Vino == FALSE)
	&& (Kapitel >= 3)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Vino_Obesessed_Info()
{
	if ((Npc_IsDead(DMT_Vino1))
	&& (Npc_IsDead(DMT_Vino2))
	&& (Npc_IsDead(DMT_Vino3))
	&& (Npc_IsDead(DMT_Vino4)))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Vino_Obesessed_15_00"); //发 生 了 什 么 事 ？
		AI_Output(self, other, "DIA_Vino_Obesessed_05_01"); //（ 呼 气 ） 该 死 ， 走 开 。 否 则 的 话 ， 他 们 会 杀 了 我 。！
		AI_StopProcessInfos(self);
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_Heilung(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 55;
	condition		= DIA_Vino_Heilung_Condition;
	information		= DIA_Vino_Heilung_Info;
	permanent		= TRUE;
	description		= "你 根 本 不 是 你 自 己 。";
};

func int DIA_Vino_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Vino == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& ((Npc_GetDistToWP(self, "NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Vino_Heilung_oneTime;
func void DIA_Vino_Heilung_Info()
{
	AI_Output(other, self, "DIA_Vino_Heilung_15_00"); //你 根 本 不 是 你 自 己 。
	AI_Output(self, other, "DIA_Vino_Heilung_05_01"); //我 的 头 … … 我 再 也 站 不 起 来 了 。

	if (DIA_Vino_Heilung_oneTime == FALSE)
	{
		AI_Output(other, self, "DIA_Vino_Heilung_15_02"); //你 应 该 去 修 道 院 。 皮 罗 卡 ， 最 高 级 的 火 魔 法 师 ， 应 该 能 帮 助 你 。
		AI_Output(self, other, "DIA_Vino_Heilung_05_03"); //你 这 么 认 为 ？ 好 吧 。 我 会 试 一 下 。
		B_NpcClearObsessionByDMT(self);
		B_StartOtherRoutine(Vino, "Kloster");

		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_2);

		B_GivePlayerXP(XP_VinoFreeFromDMT);
		DIA_Vino_Heilung_oneTime = TRUE;
	};
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
instance DIA_Vino_KAP4_EXIT(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 999;
	condition		= DIA_Vino_KAP4_EXIT_Condition;
	information		= DIA_Vino_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vino_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm4Obsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM4OBSESSED(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 41;
	condition		= DIA_Vino_PERM4OBSESSED_Condition;
	information		= DIA_Vino_PERM4OBSESSED_Info;
	permanent		= TRUE;
	description		= "你 好 吗 ？";
};

func int DIA_Vino_PERM4OBSESSED_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (NpcObsessedByDMT_Vino == TRUE)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};

var int DIA_Vino_PERM4OBSESSED_XP_oneTime;

func void DIA_Vino_PERM4OBSESSED_Info()
{
	AI_Output(other, self, "DIA_Vino_PERM4OBSESSED_15_00"); //你 好 吗 ？
	AI_Output(self, other, "DIA_Vino_PERM4OBSESSED_05_01"); //对 ， 对 ， 已 经 好 了 。 我 想 这 里 的 人 能 够 帮 助 我 。 但 是 我 仍 旧 感 觉 非 常 晕 。

	if (DIA_Vino_PERM4OBSESSED_XP_oneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Vino_PERM4OBSESSED_05_02"); //但 是 我 必 须 说 ， 他 们 的 葡 萄 酒 是 我 尝 过 的 最 好 的 。
		B_GivePlayerXP(XP_Ambient);
		DIA_Vino_PERM4OBSESSED_XP_oneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm45und6
///////////////////////////////////////////////////////////////////////
instance DIA_Vino_PERM45UND6(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 42;
	condition		= DIA_Vino_PERM45UND6_Condition;
	information		= DIA_Vino_PERM45UND6_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 闻 吗 ？";
};

func int DIA_Vino_PERM45UND6_Condition()
{
	if ((Kapitel >= 4)
	&& (hero.guild != GIL_KDF)
	&& (NpcObsessedByDMT_Vino == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vino_PERM45UND6_Info()
{
	AI_Output(other, self, "DIA_Vino_PERM45UND6_15_00"); //有 什 么 新 闻 吗 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Vino_PERM45UND6_05_01"); //这 个 地 区 的 兽 人 数 量 已 经 爆 增 。
		AI_Output(self, other, "DIA_Vino_PERM45UND6_05_02"); //你 们 圣 骑 士 会 解 决 他 们 ， 对 吗 ？
	}
	else // hero.guild == GIL_DJG
	{
		AI_Output(self, other, "DIA_Vino_PERM45UND6_05_03"); //恐 怕 用 不 了 多 久 ， 我 们 就 必 须 放 弃 农 场 ， 并 去 欧 纳 尔 的 农 场 加 入 你 们 这 些 雇 佣 兵 。
	};

	if ((FoundVinosKellerei == TRUE)
	&& (hero.guild != GIL_MIL))
	{
		AI_Output(self, other, "DIA_Vino_PERM45UND6_05_04"); //不 幸 的 是 ， 民 兵 发 现 了 我 的 蒸 馏 器 。 我 只 能 希 望 他 们 不 会 抓 到 我。
	};
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
instance DIA_Vino_KAP5_EXIT(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 999;
	condition		= DIA_Vino_KAP5_EXIT_Condition;
	information		= DIA_Vino_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vino_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
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
instance DIA_Vino_KAP6_EXIT(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 999;
	condition		= DIA_Vino_KAP6_EXIT_Condition;
	information		= DIA_Vino_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vino_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Vino_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Vino_PICKPOCKET(C_INFO)
{
	npc				= BAU_952_Vino;
	nr				= 900;
	condition		= DIA_Vino_PICKPOCKET_Condition;
	information		= DIA_Vino_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Vino_PICKPOCKET_Condition()
{
	C_Beklauen(34, 60);
};

func void DIA_Vino_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
	Info_AddChoice(DIA_Vino_PICKPOCKET, DIALOG_BACK, DIA_Vino_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Vino_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Vino_PICKPOCKET_DoIt);
};

func void DIA_Vino_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
};

func void DIA_Vino_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Vino_PICKPOCKET);
};
