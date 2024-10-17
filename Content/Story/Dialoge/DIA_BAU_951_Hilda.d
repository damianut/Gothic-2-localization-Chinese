///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_EXIT_Condition;
	information		= DIA_Hilda_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Hallo(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_Hallo_Condition;
	information		= DIA_Hilda_Hallo_Info;
	important		= TRUE;
};

func int DIA_Hilda_Hallo_Condition()
{
	if ((MIS_Lobart_Rueben != LOG_SUCCESS)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_Hallo_17_00"); //嘿 ， 谁 邀 请 你 的 ？ 马 上 从 房 子 里 出 去 。 这 里 没 有 救 济 金 发 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_Hallo_17_01"); //是 的 ， 那 是 什 么 ？
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Was zu essen? (PERM)
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_WasZuEssen(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_WasZuEssen_Condition;
	information		= DIA_Hilda_WasZuEssen_Info;
	permanent		= TRUE;
	description		= "你 能 给 我 一 点 吃 的 吗 ？";
};

func int DIA_Hilda_WasZuEssen_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Hilda_Hallo)) || (MIS_Lobart_Rueben == LOG_SUCCESS))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	if (hero.guild == GIL_NONE)
	{
		var int Rueben_TagNull;

		AI_Output(other, self, "DIA_Hilda_WasZuEssen_15_00"); //你 能 给 我 一 点 吃 的 吗 ？

		if (MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if (!Npc_KnowsInfo(other, DIA_Hilda_PfanneTooLate))
			{
				if (Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self, other, ItFo_Stew, 1);

					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_01"); //给 ， 拿 上 这 个 。 你 是 一 个 好 人 。

					Hilda_Stew_Day = Wld_GetDay();
				}

				else if ((Wld_GetDay() == 0)
				&& (Rueben_TagNull == FALSE))
				{
					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_02"); //你 明 天 可 以 再 来 拿 。
					B_GiveInvItems(self, other, ItFo_Stew, 1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;

					Log_CreateTopic(Topic_Bonus, LOG_NOTE);
					B_LogEntry(Topic_Bonus, Topic_Bonus_6);
				}
				else // heute schon bekommen
				{
					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_03"); //你 已 经 拿 了 今 天 的 份 额 ！ 以 后 再 来 。
				};
			}
			else // Pfanne zu spät
			{
				AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_04"); //我 们 这 里 不 救 济 懒 汉 。 走 开 ！
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_05"); //只 有 那 些 在 这 里 劳 动 的 人 才 有 东 西 吃 ！
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_06"); //我 肯 定 你 有 足 够 的 钱 在 镇 上 给 自 己 买 点 东 西 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Rüben bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_BringBeet(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 1;
	condition		= DIA_Hilda_BringBeet_Condition;
	information		= DIA_Hilda_BringBeet_Info;
	description		= "我 给 你 带 来 了 一 些 萝 卜 … …";
};

func int DIA_Hilda_BringBeet_Condition()
{
	if ((MIS_Lobart_RuebenToHilda == LOG_RUNNING)
	&& (Npc_HasItems(other, ItPl_Beet) >= 1)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other, self, "DIA_Hilda_BringBeet_15_00"); //我 给 你 带 来 了 一 些 萝 卜 … …

	if (Npc_HasItems(other, ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other, self, ItPl_Beet, Npc_HasItems(other, ItPl_Beet));

		AI_Output(self, other, "DIA_Hilda_BringBeet_17_01"); //好 极 了 ！ （ 大 笑 ） 那 足 够 养 肥 那 些 家 伙 了 ！
		AI_Output(self, other, "DIA_Hilda_BringBeet_17_02"); //在 你 到 这 里 之 前 几 分 钟 - 我 看 到 一 个 旅 行 商 人 经 过 这 里 。
		AI_Output(self, other, "DIA_Hilda_BringBeet_17_03"); //我 想 他 正 在 去 镇 上 的 路 边 休 息 。 去 他 那 里 看 看 是 否 能 给 我 买 个 象 样 的 煎 锅 。

		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient); // damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Hilda_BringBeet_17_04"); //什 么 ？ ！ 那 就 是 全 部 的 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Hilda_BringBeet_17_05"); //这 还 不 够 。
		};

		AI_Output(self, other, "DIA_Hilda_BringBeet_17_06"); //到 外 面 的 地 里 去 多 找 一 些 ， 大 家 都 饿 了！
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Einkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Einkaufen(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_Einkaufen_Condition;
	information		= DIA_Hilda_Einkaufen_Info;
	description		= "给 我 钱 ， 我 会 帮 你 去 找 那 个 商 人 … …";
};

func int DIA_Hilda_Einkaufen_Condition()
{
	if ((MIS_Lobart_RuebenToHilda == LOG_SUCCESS)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info()
{
	AI_Output(other, self, "DIA_Hilda_Einkaufen_15_00"); //给 我 钱 ， 我 会 帮 你 去 找 那 个 商 人 … …

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_Einkaufen_17_01"); //你 是 说 我 可 以 信 任 你 ？ 只 是 千 万 不 要 用 钱 去 买 烈 性 酒 ， 你 听 到 了 吗 ？！
	};

	B_GiveInvItems(self, other, ItMi_Gold, 20);

	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();

	Log_CreateTopic(TOPIC_Hilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda, LOG_RUNNING);
	B_LogEntry(TOPIC_Hilda, TOPIC_Hilda_1);
};

///////////////////////////////////////////////////////////////////////
//	Pfanne geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneGeholt(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_PfanneGeholt_Condition;
	information		= DIA_Hilda_PfanneGeholt_Info;
	description		= "这 是 你 要 的 煎 锅 。";
};

func int DIA_Hilda_PfanneGeholt_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (Npc_HasItems(other, itmi_pan) > 0)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other, self, "DIA_Hilda_PfanneGeholt_15_00"); //这 是 你 要 的 煎 锅 。
	B_GiveInvItems(other, self, itmi_pan, 1);
	AI_Output(self, other, "DIA_Hilda_PfanneGeholt_17_01"); //好 。 那 我 们 看 一 下 ， 是 不 是 一 切 顺 利 … …

	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP(XP_HildaHolPfanne);
};

///////////////////////////////////////////////////////////////////////
//	Pfanne zu spät
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneTooLate(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 1;
	condition		= DIA_Hilda_PfanneTooLate_Condition;
	information		= DIA_Hilda_PfanneTooLate_Info;
	important		= TRUE;
};

func int DIA_Hilda_PfanneTooLate_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() - 1))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_00"); //你 还 敢 回 这 里 来 ？ 你 用 我 的 钱 做 什 么 了 ， 你 这 个 废 物 ？ ！
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_01"); //你 现 在 有 足 够 的 时 间 。 我 给 你 买 煎 锅 的 钱 呢 ？
	};

	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output(other, self, "DIA_Hilda_PfanneTooLate_15_02"); //对 不 起 ， 花 了 我 不 少 时 间 。 这 是 你 的 煎 锅 ！

		B_GiveInvItems(other, self, itmi_pan, 1);

		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_03"); //啊 ， 那 把 它 放 在 这 里 。 难 以 置 信 ！

		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);

		AI_StopProcessInfos(self);
	}
	else // keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_04"); //啊 ！ 你 还 拿 着 它 ！ 把 它 还 我 。 现 在 。
			B_GiveInvItems(other, self, ItMi_Gold, 20);
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_05"); //难 以 置 信 ！
		}
		else // kein Gold
		{
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_06"); //你 一 点 都 没 剩 下 ！ 我 给 了 你20枚 金 币 ！
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_07"); //滚 出 我 的 视 线 ， 你 这 可 恶 的 小 偷 ！

			B_MemorizePlayerCrime(self, other, CRIME_THEFT);
		};

		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Klamotten uas Truhe geklaut
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Hilda_TruheRumgemacht(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_TruheRumgemacht_Condition;
	information		= DIA_Hilda_TruheRumgemacht_Info;
	important		= TRUE;
};

func int DIA_Hilda_TruheRumgemacht_Condition()
{
	if ((Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (!(Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE)))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_TruheRumgemacht_Info()
{
	AI_Output(self, other, "DIA_Hilda_TruheRumgemacht_17_00"); //Denk´ bloss nicht, ich hätte nicht gesehen, wie du an der Kiste 'rumgemacht hast.
	AI_Output(self, other, "DIA_Hilda_TruheRumgemacht_17_01"); //Raus hier aber schnell. Sonst hol´ ich meinen Mann!

	AI_StopProcessInfos(self);
};

*/

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
instance DIA_Hilda_KAP3_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP3_EXIT_Condition;
	information		= DIA_Hilda_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Krank
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_KRANK(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 30;
	condition		= DIA_Hilda_KRANK_Condition;
	information		= DIA_Hilda_KRANK_Info;
	permanent		= TRUE;
	description		= "你 感 觉 不 舒 服 吗 ？";
};

func int DIA_Hilda_KRANK_Condition()
{
	if ((Kapitel >= 3)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	&& (MIS_HealHilda != LOG_SUCCESS))
	{
		return TRUE;
	};
};

var int DIA_Hilda_KRANK_OnTime;
func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_15_00"); //你 感 觉 不 舒 服 吗 ？
	AI_Output(self, other, "DIA_Hilda_KRANK_17_01"); //不 ， 一 点 也 不 。 我 又 得 了 这 种 可 怕 的 热 病 。
	AI_Output(self, other, "DIA_Hilda_KRANK_17_02"); //我 真 应 该 去 找 镇 上 的 治 疗 者 看 看 ， 但 是 我 太 虚 弱 了 ， 去 不 了 。

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK, "很 快 就 会 好 的 。 我 必 须 走 了", DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK, "我 能 帮 忙 吗 ？", DIA_Hilda_KRANK_helfen);

		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};

func void DIA_Hilda_KRANK_besserung()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //很 快 就 会 好 的 。 我 必 须 走 了 。
	AI_Output(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //我 们 只 能 希 望 过 一 阵 能 快 点 好 。
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //我 能 帮 忙 吗 ？
	AI_Output(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //如 果 你 能 去 瓦 卓 斯 那 里 帮 我 拿 药 回 来 的 话 ， 那 真 是 太 好 了 。
	AI_Output(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //他 会 知 道 要 怎 么 做 的 ！ 我 再 也 做 不 到 了 。

	Log_CreateTopic(TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry(TOPIC_HealHilda, TOPIC_HealHilda_1);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilungbringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_HEILUNGBRINGEN(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 31;
	condition		= DIA_Hilda_HEILUNGBRINGEN_Condition;
	information		= DIA_Hilda_HEILUNGBRINGEN_Info;
	description		= "我 给 你 带 来 了 药 。";
};

func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if (Npc_HasItems(other, ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //我 给 你 带 来 了 药 。
	B_GiveInvItems(other, self, ItPo_HealHilda_MIS, 1);
	AI_Output(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //真 的 。 我 们 的 社 会 需 要 更 多 像 你 这 样 的 人 。 太 谢 谢 你 了 。
	B_UseItem(self, ItPo_HealHilda_MIS);
	AI_Output(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //我 希 望 这 一 点 点 的 钱 能 够 用 。
	CreateInvItems(self, ItMi_Gold, 50);
	B_GiveInvItems(self, other, ItMi_Gold, 50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info disturb
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_DISTURB(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 32;
	condition		= DIA_Hilda_DISTURB_Condition;
	information		= DIA_Hilda_DISTURB_Info;
	permanent		= TRUE;
	description		= "你 好 吗 ？";
};

func int DIA_Hilda_DISTURB_Condition()
{
	if ((MIS_HealHilda == LOG_SUCCESS)
	|| (
	((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel > 3)
	))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Hilda_DISTURB_15_00"); //你 好 吗 ？
		AI_Output(self, other, "DIA_Hilda_DISTURB_17_01"); //已 经 好 一 点 了 ， 谢 谢 你 。
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_DISTURB_17_02"); //没 有 那 么 好 。
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
instance DIA_Hilda_KAP4_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP4_EXIT_Condition;
	information		= DIA_Hilda_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
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
instance DIA_Hilda_KAP5_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP5_EXIT_Condition;
	information		= DIA_Hilda_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
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
instance DIA_Hilda_KAP6_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP6_EXIT_Condition;
	information		= DIA_Hilda_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hilda_PICKPOCKET(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 900;
	condition		= DIA_Hilda_PICKPOCKET_Condition;
	information		= DIA_Hilda_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Hilda_PICKPOCKET_Condition()
{
	C_Beklauen(26, 35);
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET, DIALOG_BACK, DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};
