// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Greg_EXIT(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 999;
	condition		= DIA_Addon_Greg_EXIT_Condition;
	information		= DIA_Addon_Greg_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Greg_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Greg_PICKPOCKET(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 900;
	condition		= DIA_Addon_Greg_PICKPOCKET_Condition;
	information		= DIA_Addon_Greg_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Addon_Greg_PICKPOCKET_Condition()
{
	C_Beklauen(111, 666);
};

func void DIA_Addon_Greg_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET, DIALOG_BACK, DIA_Addon_Greg_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Greg_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Greg_PICKPOCKET_DoIt);
};

func void DIA_Addon_Greg_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

func void DIA_Addon_Greg_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Greg_PICKPOCKET);
};

// ************************************************************
// 			  			Hallo - (Greg Is Back)
// ************************************************************
instance DIA_Addon_Greg_ImNew(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 1;
	condition		= DIA_Addon_Greg_ImNew_Condition;
	information		= DIA_Addon_Greg_ImNew_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_ImNew_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_ImNew_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_Hello_01_00"); //（ 威 胁 ） 嘿 ， 你 。 你 在 我 的 小 屋 里 做 什 么 ？
	AI_Output(other, self, "DIA_Addon_Greg_Hello_15_01"); //我 … …
	AI_Output(self, other, "DIA_Addon_Greg_Hello_01_02"); //（ 狂 怒 ） 我 只 是 离 开 几 天 ， 然 后 所 有 人 都 以 为 他 们 可 以 随 心 所 欲 。
	// AI_Output(other,self,"DIA_Addon_Greg_ImNew_15_00"); // Ich bin der Neue.
	// AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_01"); // (zynisch) So so, du bist der Neue.
	// AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_02"); // Hier entscheide immer noch ICH, wer bei uns mitmacht.
	AI_Output(self, other, "DIA_Addon_Greg_ImNew_01_03"); //这 里 到 底 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Greg_ImNew_01_04"); //栅 栏 还 没 有 完 工 ？ 峡 谷 里 到 处 是 野 兽 ， 所 有 人 都 在 闲 逛 ， 过 得 优 哉 优 哉 。

	GregIsBack = TRUE;

	if (!Npc_IsDead(Francis))
	{
		AI_TurnToNpc(self, Francis);
		AI_Output(self, other, "DIA_Addon_Greg_ImNew_01_05"); //（ 大 声 的 ） 这 就 是 你 已 经 做 完 的 所 有 事 吗 ， 弗 朗 西 斯 ？

		if (C_BodyStateContains(Francis, BS_SIT))
		{
			AI_Output(self, other, "DIA_Addon_Greg_ImNew_01_06"); //（ 大 声 的 ） 马 上 离 开 我 的 长 椅 ！
		};
	};

	Npc_ExchangeRoutine(self, "HOME");
	AI_TurnToNpc(self, other);
	AI_Output(self, other, "DIA_Addon_Greg_ImNew_01_07"); //而 你 ？ 你 做 了 什 么 ？

	Info_ClearChoices(DIA_Addon_Greg_ImNew);
	Info_AddChoice(DIA_Addon_Greg_ImNew, "不 太 远 。", DIA_Addon_Greg_ImNew_nich);
	if ((
	(Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0)
	)
	|| (C_TowerBanditsDead() == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_ImNew, "我 一 直 在 工 作 。", DIA_Addon_Greg_ImNew_turm);
	};
};

// ------------------------------------------------------------------
func void B_UseRakeBilanz()
{
	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Greg_UseRakeBilanz_01_00"); //别 以 为 我 已 经 忘 记 了 你 还 欠 我 一 两 件 东 西 。
		AI_Output(self, other, "DIA_Addon_Greg_UseRakeBilanz_01_01"); //换 句 话 说 ， 我 在 克 霍 里 尼 斯 葬 送 的 东 西 价 值 几 百 金 币 。
		AI_Output(self, other, "DIA_Addon_Greg_UseRakeBilanz_01_02"); //你 把 它 们 全 都 据 为 己 有 ， 不 是 吗 ？
		AI_Output(self, other, "DIA_Addon_Greg_UseRakeBilanz_01_03"); //我 要 让 你 偿 还 每 一 分 钱 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Greg_UseRakeBilanz_01_04"); //我 要 教 会 你 工 作 的 真 正 含 义 。
	};

	if (!Npc_IsDead(Francis))
	{
		Npc_ExchangeRoutine(Francis, "GREGISBACK");
		AI_StartState(Francis, ZS_Saw, 1, "ADW_PIRATECAMP_BEACH_19"); // HACK - REDUNDANT!!!
		Francis_ausgeschissen = TRUE;
	};

	Info_ClearChoices(DIA_Addon_Greg_ImNew);
};

// --------------------------------------------------------------------
func void DIA_Addon_Greg_ImNew_nich()
{
	AI_Output(other, self, "DIA_Addon_Greg_ImNew_nich_15_00"); //不 太 远 。
	AI_Output(self, other, "DIA_Addon_Greg_ImNew_nich_01_01"); //不 用 担 心 。 我 会 给 你 找 一 些 合 适 的 ， 我 的 朋 友 。
	B_UseRakeBilanz();
};

func void DIA_Addon_Greg_ImNew_turm()
{
	AI_Output(other, self, "DIA_Addon_Greg_ImNew_turm_15_00"); //我 一 直 在 工 作 。
	AI_Output(self, other, "DIA_Addon_Greg_ImNew_turm_01_01"); //你 成 功 了 ？ 是 什 么 ？

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Greg_ImNew_turm_15_02"); //我 已 经 解 决 了 塔 里 的 强 盗 。
	};

	if ((Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1))
	&& (MIS_Addon_MorganLurker != 0))
	{
		AI_Output(other, self, "DIA_Addon_Greg_ImNew_turm_15_03"); //北 边 的 海 滩 已 经 没 有 一 头 野 兽 了 。
	};

	AI_Output(self, other, "DIA_Addon_Greg_ImNew_turm_01_04"); //嗯 。 我 想 那 只 是 一 个 开 始 。

	B_UseRakeBilanz();
};

// ************************************************************
// 			  				JoinPirates
// ************************************************************
instance DIA_Addon_Greg_JoinPirates(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_JoinPirates_Condition;
	information		= DIA_Addon_Greg_JoinPirates_Info;
	description		= "在 那 里 做 什 么 ？";
};

func int DIA_Addon_Greg_JoinPirates_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Greg_ImNew) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_JoinPirates_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_JoinPirates_15_00"); //在 那 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_01_01"); //首 先 我 们 要 这 里 热 闹 起 来 。

	if ((Npc_IsDead(Morgan)) == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_01_02"); //摩 根 ， 那 头 懒 惰 的 猪 ， 开 始 锯 木 板 。
	};

	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_01_03"); //你 将 接 手 摩 根 的 工 作 ， 并 把 那 该 死 的 峡 谷 里 面 的 野 兽 都 清 理 干 净 。

	MIS_Addon_Greg_ClearCanyon = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_ClearCanyon, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_ClearCanyon, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_ClearCanyon, TOPIC_Addon_ClearCanyon_1);

	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
	Info_AddChoice(DIA_Addon_Greg_JoinPirates, "那 我 想 我 要 走 了 。", DIA_Addon_Greg_JoinPirates_Leave);

	if (((Npc_IsDead(Brandon)) == FALSE)
	|| ((Npc_IsDead(Matt)) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_JoinPirates, "我 要 一 个 人 做 所 有 的 事 ？", DIA_Addon_Greg_JoinPirates_Compadres);
	};

	Info_AddChoice(DIA_Addon_Greg_JoinPirates, "什 么 野 兽 ？", DIA_Addon_Greg_JoinPirates_ClearCanyon);
};

func void DIA_Addon_Greg_JoinPirates_Leave()
{
	AI_Output(other, self, "DIA_Addon_Greg_JoinPirates_Leave_15_00"); //那 我 想 我 要 走 了 。
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Leave_01_01"); //还 有 一 件 事 ， 你 现 在 是 我 们 一 员 了 。
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Leave_01_02"); //所 以 ， 先 去 给 你 自 己 弄 一 套 象 样 的 狩 猎 用 具 。
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Leave_01_03"); //这 是 给 你 的 一 些 盔 甲 。 我 希 望 它 能 合 身 。
	CreateInvItems(self, ItAr_Pir_M_Addon, 1);
	B_GiveInvItems(self, other, ItAr_Pir_M_Addon, 1);
	AI_EquipArmor(hero, ItAr_Pir_M_Addon);
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Leave_01_04"); //还 有 ， 不 要 混 日 子 - 马 上 去 做 ？

	Info_ClearChoices(DIA_Addon_Greg_JoinPirates);
};

func void DIA_Addon_Greg_JoinPirates_Compadres()
{
	AI_Output(other, self, "DIA_Addon_Greg_JoinPirates_Compadres_15_00"); //我 要 一 个 人 做 所 有 的 事 ？
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Compadres_01_01"); //直 接 去 从 那 些 小 伙 子 里 挑 几 个 出 来 。
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_Compadres_01_02"); //让 他 们 学 会 挣 钱 ， 而 不 是 整 天 闲 逛 。

	B_LogEntry(TOPIC_Addon_ClearCanyon, TOPIC_Addon_ClearCanyon_2);
};

func void DIA_Addon_Greg_JoinPirates_ClearCanyon()
{
	AI_Output(other, self, "DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00"); //什 么 野 兽 ？
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01"); //峡 谷 中 的 剃 刀 龙 离 我 们 的 营 地 越 来 越 近 。
	AI_Output(self, other, "DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02"); //我 不 想 等 它 们 把 我 为 数 不 多 的 人 再 吃 掉 一 个 。

	B_LogEntry(TOPIC_Addon_ClearCanyon, TOPIC_Addon_ClearCanyon_3);
};

// ************************************************************
// 			  				Wegen dem Canyon...
// ************************************************************
instance DIA_Addon_Greg_AboutCanyon(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_AboutCanyon_Condition;
	information		= DIA_Addon_Greg_AboutCanyon_Info;
	permanent		= TRUE;
	description		= "关 于 那 个 峡 谷 … …";
};

func int DIA_Addon_Greg_AboutCanyon_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_AboutCanyon_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_AboutCanyon_15_00"); //关 于 那 个 峡 谷 … …
	AI_Output(self, other, "DIA_Addon_Greg_AboutCanyon_01_01"); //是 吗 ， 它 怎 么 样 了 ？

	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
	if (C_AllCanyonRazorDead() == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon, DIALOG_BACK, DIA_Addon_Greg_AboutCanyon_Back);
		if (((Npc_IsDead(Brandon)) == FALSE)
		|| ((Npc_IsDead(Matt)) == FALSE))
		{
			Info_AddChoice(DIA_Addon_Greg_AboutCanyon, "谁 能 帮 助 我 ？", DIA_Addon_Greg_AboutCanyon_Compadres);
		};

		Info_AddChoice(DIA_Addon_Greg_AboutCanyon, "我 要 杀 死 什 么 样 的 野 兽 ？", DIA_Addon_Greg_AboutCanyon_Job);
	}
	else
	{
		Info_AddChoice(DIA_Addon_Greg_AboutCanyon, "我 杀 掉 了 所 有 的 剃 刀 龙 。", DIA_Addon_Greg_AboutCanyon_RazorsDead);
	};
};

func void DIA_Addon_Greg_AboutCanyon_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Compadres()
{
	AI_Output(other, self, "DIA_Addon_Greg_AboutCanyon_Compadres_15_00"); //谁 能 帮 助 我 ？
	AI_Output(self, other, "DIA_Addon_Greg_AboutCanyon_Compadres_01_01"); //带 上 几 个 人 。
	AI_Output(self, other, "DIA_Addon_Greg_AboutCanyon_Compadres_01_02"); //他 们 除 了 闲 逛 以 外 ， 什 么 事 都 不 做 。
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_Job()
{
	AI_Output(other, self, "DIA_Addon_Greg_AboutCanyon_Job_15_00"); //我 要 杀 死 什 么 样 的 野 兽 ？
	AI_Output(self, other, "DIA_Addon_Greg_AboutCanyon_Job_01_01"); //解 决 剃 刀 龙 ！ 其 它 生 物 都 是 无 害 的 。
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

func void DIA_Addon_Greg_AboutCanyon_RazorsDead()
{
	AI_Output(other, self, "DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00"); //我 杀 掉 了 所 有 的 剃 刀 龙 。
	AI_Output(self, other, "DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01"); //好 。 看 来 你 是 个 有 用 的 家 伙 。

	B_LogEntry(TOPIC_Addon_ClearCanyon, TOPIC_Addon_ClearCanyon_4);

	MIS_Addon_Greg_ClearCanyon = LOG_SUCCESS;
	B_Addon_PiratesGoHome();
	B_GivePlayerXP(XP_ADDON_CLEARCANYON);
	Info_ClearChoices(DIA_Addon_Greg_AboutCanyon);
};

// ************************************************************
// 			  				BanditArmor
// ************************************************************
instance DIA_Addon_Greg_BanditArmor(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_BanditArmor_Condition;
	information		= DIA_Addon_Greg_BanditArmor_Info;
	permanent		= TRUE;
	description		= "我 需 要 那 套 强 盗 盔 甲 。";
};

func int DIA_Addon_Greg_BanditArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditArmor_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_BanditArmor_15_00"); //我 需 要 那 套 强 盗 盔 甲 。
	if (MIS_Addon_Greg_ClearCanyon != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_01"); //首 先 证 明 你 的 价 值 。 然 后 我 们 再 谈 话 。
		if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
		{
			AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_02"); //首 先 ， 杀 掉 峡 谷 中 所 有 的 剃 刀 龙 ！
		};

		B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_8);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_03"); //嘿 ， 你 真 不 简 单 。
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_04"); //本 应 该 是 波 恩 斯 穿 着 那 套 盔 甲 去 侦 察 强 盗 的 情 况 。
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_05"); //但 是 也 许 你 更 适 合 这 项 工 作 。
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_06"); //也 许 你 还 有 机 会 活 着 离 开 那 里 。
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_07"); //去 找 波 恩 斯 谈 谈 ， 让 他 把 盔 甲 给 你 。 然 后 穿 上 它 去 强 盗 营 地 。
		AI_Output(self, other, "DIA_Addon_Greg_BanditArmor_01_08"); //我 需 要 弄 清 为 什 么 那 些 卑 鄙 的 家 伙 要 先 来 我 们 的 山 谷 。
		AI_Output(other, self, "DIA_Addon_Greg_BanditArmor_15_09"); //对 对 ， 长 官 ！

		B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_9);

		Log_CreateTopic(TOPIC_Addon_ScoutBandits, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_ScoutBandits, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_ScoutBandits, TOPIC_Addon_ScoutBandits_1);

		MIS_Greg_ScoutBandits = LOG_RUNNING;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auftraege2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Auftraege2(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_Auftraege2_Condition;
	information		= DIA_Addon_Greg_Auftraege2_Info;
	description		= "你 还 有 其 它 事 情 要 我 做 吗 ？";
};

func int DIA_Addon_Greg_Auftraege2_Condition()
{
	if ((MIS_Greg_ScoutBandits != 0)
	&& (
	(C_TowerBanditsDead() == FALSE)
	|| (
	(Npc_IsDead(BeachLurker1) == FALSE)
	&& (Npc_IsDead(BeachLurker2) == FALSE)
	&& (Npc_IsDead(BeachLurker3) == FALSE)
	&& (Npc_IsDead(BeachWaran1) == FALSE)
	&& (Npc_IsDead(BeachWaran2) == FALSE)
	&& (Npc_IsDead(BeachShadowbeast1) == FALSE)
	)
	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Auftraege2_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_Auftraege2_15_00"); //你 还 有 其 它 事 情 要 我 做 吗 ？

	if ((Npc_IsDead(BeachLurker1) == FALSE)
	&& (Npc_IsDead(BeachLurker2) == FALSE)
	&& (Npc_IsDead(BeachLurker3) == FALSE)
	&& (Npc_IsDead(BeachWaran1) == FALSE)
	&& (Npc_IsDead(BeachWaran2) == FALSE)
	&& (Npc_IsDead(BeachShadowbeast1) == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Greg_Auftraege2_01_01"); //北 边 的 海 滩 仍 旧 布 满 了 野 兽 。
		AI_Output(self, other, "DIA_Addon_Greg_Auftraege2_01_02"); //看 来 摩 根 还 什 么 事 情 都 没 做 。

		Log_CreateTopic(TOPIC_Addon_MorganBeach, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_MorganBeach, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_MorganBeach, TOPIC_Addon_MorganBeach_1);

		MIS_Addon_MorganLurker = LOG_RUNNING;
	};

	if (C_TowerBanditsDead() == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Greg_Auftraege2_01_03"); //南 边 悬 崖 的 塔 里 还 有 强 盗 。
		AI_Output(self, other, "DIA_Addon_Greg_Auftraege2_01_04"); //弗 朗 西 斯 应 该 去 解 决 它 们 。

		Log_CreateTopic(TOPIC_Addon_BanditsTower, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_BanditsTower, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_5);

		MIS_Henry_FreeBDTTower = LOG_RUNNING;
	};

	AI_Output(self, other, "DIA_Addon_Greg_Auftraege2_01_05"); //如 果 你 愿 意 的 话 ， 你 也 可 以 去 做 。
};

///////////////////////////////////////////////////////////////////////
//	Info Sauber2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_Sauber2(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_Sauber2_Condition;
	information		= DIA_Addon_Greg_Sauber2_Info;
	description		= "北 部 海 滩 已 经 清 理 干 净 了 。";
};

func int DIA_Addon_Greg_Sauber2_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Greg_Auftraege2))
	&& (Npc_IsDead(BeachLurker1))
	&& (Npc_IsDead(BeachLurker2))
	&& (Npc_IsDead(BeachLurker3))
	&& (Npc_IsDead(BeachWaran1))
	&& (Npc_IsDead(BeachWaran2))
	&& (Npc_IsDead(BeachShadowbeast1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Sauber2_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_Sauber2_15_00"); //北 部 海 滩 已 经 清 理 干 净 了 。
	AI_Output(self, other, "DIA_Addon_Greg_Sauber2_01_01"); //棒 极 了 。 这 是 你 的 报 酬 。
	CreateInvItems(self, ItMi_Gold, 200);
	B_GiveInvItems(self, other, ItMi_Gold, 200);

	B_LogEntry(TOPIC_Addon_MorganBeach, TOPIC_Addon_MorganBeach_2);

	MIS_Addon_MorganLurker = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Morgan_LurkerPlatt);
};

///////////////////////////////////////////////////////////////////////
//	Info BanditPlatt2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_BanditPlatt2(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_BanditPlatt2_Condition;
	information		= DIA_Addon_Greg_BanditPlatt2_Info;
	description		= "塔 里 的 强 盗 已 经 被 解 决 了 。";
};

func int DIA_Addon_Greg_BanditPlatt2_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Greg_Auftraege2))
	&& (C_TowerBanditsDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditPlatt2_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_BanditPlatt2_15_00"); //塔 里 的 强 盗 已 经 被 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Greg_BanditPlatt2_01_01"); //太 出 色 了 。 干 的 不 错 。 这 是 你 的 报 酬 。
	CreateInvItems(self, ItMi_Gold, 200);
	B_GiveInvItems(self, other, ItMi_Gold, 200);

	B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_6);

	MIS_Henry_FreeBDTTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
};

// ************************************************************
// 			  				BanditGoldmine
// ************************************************************
instance DIA_Addon_Greg_BanditGoldmine(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_BanditGoldmine_Condition;
	information		= DIA_Addon_Greg_BanditGoldmine_Info;
	permanent		= TRUE;
	description		= "强 盗 发 现 了 一 个 金 矿 。";
};

func int DIA_Addon_Greg_BanditGoldmine_Condition()
{
	if ((SC_KnowsRavensGoldmine == TRUE)
	&& (MIS_Greg_ScoutBandits == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_BanditGoldmine_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_BanditGoldmine_15_00"); //强 盗 发 现 了 一 个 金 矿 。
	AI_Output(self, other, "DIA_Addon_Greg_BanditGoldmine_01_01"); //我 早 该 想 到 ！ 那 是 他 们 来 这 里 的 原 因 。
	AI_Output(self, other, "DIA_Addon_Greg_BanditGoldmine_01_02"); //没 人 会 自 愿 在 这 怪 物 横 行 的 沼 泽 里 生 活 。
	AI_Output(self, other, "DIA_Addon_Greg_BanditGoldmine_01_03"); //干 的 不 错 。 拿 着 ， 我 有 些 东 西 给 你 。

	B_GiveInvItems(self, other, ItRi_Addon_STR_01, 1);

	B_LogEntry(TOPIC_Addon_ScoutBandits, TOPIC_Addon_ScoutBandits_2);

	MIS_Greg_ScoutBandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_Greg_ScoutBandits);
};

// ************************************************************
// 			Wer bist du
// ************************************************************
instance DIA_Addon_Greg_WhoAreYou(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 2;
	condition		= DIA_Addon_Greg_WhoAreYou_Condition;
	information		= DIA_Addon_Greg_WhoAreYou_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Addon_Greg_WhoAreYou_Condition()
{
	if ((PlayerTalkedToGregNW == FALSE) // Joly:WAR VOHER npc_gLOBAL -> GREG_NW
	&& (SC_MeetsGregTime == 0)) // Joly:zur sicherheit
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_WhoAreYou_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_WhoAreYou_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Greg_WhoAreYou_01_01"); //我 是 格 雷 格 ， 这 帮 懒 鬼 们 的 头 儿 。
	AI_Output(self, other, "DIA_Addon_Greg_WhoAreYou_01_02"); //那 对 你 来 说 够 吗 ？
};

// ************************************************************
// 			  	NiceToSeeYou
// ************************************************************
instance DIA_Addon_Greg_NiceToSeeYou(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 5;
	condition		= DIA_Addon_Greg_NiceToSeeYou_Condition;
	information		= DIA_Addon_Greg_NiceToSeeYou_Info;
	description		= "那 么 你 怎 么 到 这 里 来 的 ？";
};

func int DIA_Addon_Greg_NiceToSeeYou_Condition()
{
	if ((PlayerTalkedToGregNW == TRUE)
	&& (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NiceToSeeYou_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NiceToSeeYou_15_00"); //那 么 你 怎 么 到 这 里 来 的 ？
	AI_Output(self, other, "DIA_Addon_Greg_NiceToSeeYou_01_01"); //你 没 想 到 我 会 来 ， 嗯 ？
	AI_Output(self, other, "DIA_Addon_Greg_NiceToSeeYou_01_02"); //正 是 如 此 ， 我 们 直 接 了 当 说 吧 。 我 是 格 雷 格 ， 这 是 我 的 营 地 。
	AI_Output(self, other, "DIA_Addon_Greg_NiceToSeeYou_01_03"); //那 对 你 来 说 够 吗 ？
};

// ************************************************************
// 			  	Story
// ************************************************************
instance DIA_Addon_Greg_Story(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 99;
	condition		= DIA_Addon_Greg_Story_Condition;
	information		= DIA_Addon_Greg_Story_Info;
	permanent		= TRUE;
	description		= "还 有 一 件 事 情 我 想 要 了 解 。";
};

func int DIA_Addon_Greg_Story_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Addon_Greg_WhoAreYou) == TRUE)
	|| (Npc_KnowsInfo(other, DIA_Addon_Greg_NiceToSeeYou) == TRUE))
	&& (MIS_Greg_ScoutBandits != 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_Story_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_Story_15_00"); //还 有 一 件 事 情 我 想 要 了 解 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_01_01"); //那 是 ？

	Info_ClearChoices(DIA_Addon_Greg_Story);
	Info_AddChoice(DIA_Addon_Greg_Story, DIALOG_BACK, DIA_Addon_Greg_Story_Back);
	Info_AddChoice(DIA_Addon_Greg_Story, "你 怎 么 到 这 里 的 ？", DIA_Addon_Greg_Story_Way);
	Info_AddChoice(DIA_Addon_Greg_Story, "你 的 船 在 哪 里 ？", DIA_Addon_Greg_Story_Ship);

	if (RavenIsDead == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_Story, "你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？", DIA_Addon_Greg_Story_Raven);
	};
};

func void DIA_Addon_Greg_Story_Back()
{
	Info_ClearChoices(DIA_Addon_Greg_Story);
};

func void DIA_Addon_Greg_Story_Way()
{
	AI_Output(other, self, "DIA_Addon_Greg_Story_Way_15_00"); //你 怎 么 到 这 里 的。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Way_01_01"); //我 在 古 老 的 金 字 塔 附 近 找 到 一 条 隧 道 ， 被 一 些 法 师 保 护 着 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Way_01_02"); //我 轻 松 地 从 那 些 蜥 蜴 身 边 那 溜 了 过 去 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Way_01_03"); //首 先 我 到 了 一 个 古 代 墓 室 ， 并 决 定 看 一 下 我 能 在 里 面 找 到 什 么 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Way_01_04"); //当 我 突 然 发 现 我 置 身 于 我 心 爱 的 山 谷 中 时 ， 请 想 象 一 下 我 的 惊 讶 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Way_01_05"); //在 那 个 时 候 ， 我 想 我 应 该 可 以 在 远 离 民 兵 的 地 方 度 过 余 生 。
};

func void DIA_Addon_Greg_Story_Ship()
{
	AI_Output(other, self, "DIA_Addon_Greg_Story_Ship_15_00"); //你 的 船 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Greg_Story_Ship_01_01"); //这 只 是 我 的 幸 运 。 几 个 月 的 时 间 ， 没 有 船 在 这 里 和 大 陆 之 间 通 行 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Ship_01_02"); //几 个 月 ！ 然 后 我 遇 到 的 第 一 艘 船 是 一 艘 全 副 武 装 的 战 舰 ， 属 于 国 王 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Ship_01_03"); //全 是 圣 骑 士 ， 从 它 的 船 舱 到 桅 杆 的 顶 上 。
	AI_Output(other, self, "DIA_Addon_Greg_Story_Ship_15_04"); //那 就 是 我 说 的 坏 运 气 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Ship_01_05"); //你 还 可 以 再 那 么 说 一 次 。 他 们 立 刻 击 沉 了 我 们 的 。 我 是 唯 一 设 法 到 达 海 岸 的 人 。
};

func void DIA_Addon_Greg_Story_Raven()
{
	AI_Output(other, self, "DIA_Addon_Greg_Story_Raven_15_00"); //你 都 知 道 关 于 瑞 雯 的 什 么 事 情 ？
	AI_Output(self, other, "DIA_Addon_Greg_Story_Raven_01_01"); //据 我 所 知 ， 他 以 前 是 一 个 矿 石 大 亨 ， 流 放 地 的 大 人 物 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Raven_01_02"); //我 不 知 道 为 什 么 他 现 在 会 来 这 里 ， 而 且 为 什 么 人 们 要 追 随 他 。
	AI_Output(self, other, "DIA_Addon_Greg_Story_Raven_01_03"); //但 是 他 肯 定 有 所 图 谋 。 他 不 是 那 种 愿 意 在 沼 泽 里 藏 身 的 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info RavenDead
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_RavenDead(C_INFO)
{
	npc				= PIR_1320_Addon_Greg;
	nr				= 2;
	condition		= DIA_Addon_Greg_RavenDead_Condition;
	information		= DIA_Addon_Greg_RavenDead_Info;
	description		= "瑞 雯 被 干 掉 了 。";
};

func int DIA_Addon_Greg_RavenDead_Condition()
{
	if (RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_RavenDead_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_RavenDead_15_00"); //瑞 雯 被 干 掉 了 。
	AI_Output(self, other, "DIA_Addon_Greg_RavenDead_01_01"); //嗯 ， 我 将 … … 那 真 是 意 想 不 到 的。 你 在 他 上 厕 所 的 时 候 干 掉 了 他 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Greg_RavenDead_01_02"); //那 对 我 来 说 当 然 值 5 0 0 枚 金 币 。
	CreateInvItems(self, ItMi_Gold, 500);
	B_GiveInvItems(self, other, ItMi_Gold, 500);
	AI_Output(self, other, "DIA_Addon_Greg_RavenDead_01_03"); //你 真 是 个 挺 而 走 险 的 家 伙 。 竟 然 那 样 做 。
	B_GivePlayerXP(XP_ADDON_GregRavenLohn);
};
