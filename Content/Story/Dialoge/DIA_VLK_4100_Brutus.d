///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_EXIT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 999;
	condition		= DIA_Brutus_EXIT_Condition;
	information		= DIA_Brutus_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brutus_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Brutus ist ToughGuy
///////////////////////////////////////////////////////////////////////
//	Info AFTER_FIGHT
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_AFTER_FIGHT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 1;
	condition		= DIA_Brutus_AFTER_FIGHT_Condition;
	information		= DIA_Brutus_AFTER_FIGHT_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Brutus_AFTER_FIGHT_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& Npc_IsInState(self, ZS_Talk)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_AFTER_FIGHT_Info()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(other, self, "DIA_Brutus_AFTER_FIGHT_15_00"); //那 么 ， 你 的 牙 齿 都 还 在 ？
		AI_Output(self, other, "DIA_Brutus_AFTER_FIGHT_06_01"); //伙 计 ， 你 是 个 硬 汉 ！ 我 可 不 想 在 战 斗 中 碰 上 你 ！
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		AI_Output(other, self, "DIA_Brutus_AFTER_FIGHT_15_02"); //我 想 你 打 断 了 我 的 每 一 根 肋 骨 。
		AI_Output(self, other, "DIA_Brutus_AFTER_FIGHT_06_03"); //可 是 我 并 没 有 打 你 那 么 狠 。 哦 ， 好 吧 ， 没 关 系 ， 我 喜 欢 不 把 挨 打 当 回 事 的 家 伙 。

		if (Brutus_einmalig == FALSE)
		{
			AI_Output(self, other, "DIA_Brutus_AFTER_FIGHT_06_04"); //这 一 瓶 药 剂 可 以 让 你 恢 复 健 康 。 它 还 能 对 你 的 内 脏 起 到 奇 特 的 效 果 ！

			CreateInvItems(self, ItPo_Health_01, 1);
			B_GiveInvItems(self, hero, ItPo_Health_01, 1);
			Brutus_einmalig = TRUE;
		};
	}
	else // Cancel
	{
		AI_Output(self, other, "DIA_Brutus_AFTER_FIGHT_06_05"); //我 没 有 任 何 理 由 反 对 一 场 正 当 的 搏 斗 。 但 当 我 发 起 一 场 战 斗 后 ， 我 也 会 有 始 有 终 。
	};

	// ------ AIVAR resetten ------
	self.aivar[AIV_LastFightComment] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PRISONER
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PRISONER(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 2;
	condition		= DIA_Brutus_PRISONER_Condition;
	information		= DIA_Brutus_PRISONER_Info;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_Brutus_PRISONER_Condition()
{
	if ((Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PRISONER_Info()
{
	AI_Output(other, self, "DIA_Brutus_PRISONER_15_00"); //你 在 这 里 干 什 么 工 作 ？
	AI_Output(self, other, "DIA_Brutus_PRISONER_06_01"); //我 的 工 作 ？ 我 训 练 那 些 小 子 。 我 教 他 们 怎 样 练 出 钢 铁 般 的 肌 肉 。
	AI_Output(self, other, "DIA_Brutus_PRISONER_06_02"); //我 还 管 理 那 些 囚 犯 。 对 于 那 些 混 蛋 来 说 ， 我 真 像 他 们 的 父 亲 一 样 。
	AI_Output(self, other, "DIA_Brutus_PRISONER_06_03"); //不 过 我 真 正 的 活 儿 是 让 他 们 开 口 讲 话 。 相 信 我 - 我 有 办 法 让 任 何 人 开 口 。
	AI_Output(other, self, "DIA_Brutus_PRISONER_15_04"); //听 起 来 太 棒 了 … …
	AI_Output(self, other, "DIA_Brutus_PRISONER_06_05"); //但 是 我 们 现 在 关 起 来 的 那 些 满 身 跳 蚤 的 笨 蛋 却 没 什 么 话 说 。

	if (MIS_RescueGorn != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Brutus_PRISONER_06_06"); //而 且 他 们 不 让 我 对 付 那 个 戈 恩 。

		KnowsAboutGorn = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 90;
	condition		= DIA_Brutus_PERM_Condition;
	information		= DIA_Brutus_PERM_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Brutus_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Brutus_PRISONER)
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM_Info()
{
	AI_Output(other, self, "DIA_Brutus_PERM_15_00"); //还 有 什 么 新 消息 吗 ？
	AI_Output(self, other, "DIA_Brutus_PERM_06_01"); //一 切 看 来 都 很 平 静 。 没 有 新 的 囚 犯 - 没 人 需 要 说 实 话 - 太 糟 了 。
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kasse
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Kasse(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 2;
	condition		= DIA_Brutus_Kasse_Condition;
	information		= DIA_Brutus_Kasse_Info;
	description		= "你 能 训 练 我 吗 ？";
};

func int DIA_Brutus_Kasse_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Brutus_PRISONER)
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Kasse_Info()
{
	AI_Output(other, self, "DIA_Brutus_Kasse_15_00"); //你 能 训 练 我 吗 ？
	AI_Output(self, other, "DIA_Brutus_Kasse_06_01"); //我 肯 定 可 以 帮 你 变 得 更 强 壮 ， 但 是 ， 我 从 来 不 免 费 送 什 么 东 西 。
	AI_Output(other, self, "DIA_Brutus_Kasse_15_02"); //你 想 要 多 少 ？
	AI_Output(self, other, "DIA_Brutus_Kasse_06_03"); //… … 你 在 城 堡 外 面 东 奔 西 走 ， 是 吗 ？ 我 有 个 提 议 。
	AI_Output(self, other, "DIA_Brutus_Kasse_06_04"); //我 的 助 手 丹 恩 在 最 近 一 次 攻 击 中 溜 走 了 。 真 是 个 懦 夫 。
	AI_Output(self, other, "DIA_Brutus_Kasse_06_05"); //但 他 没 有 空 着 手 跑 掉 。 他 拿 走 了 我 钱 箱 子 里 的 东 西 。
	AI_Output(other, self, "DIA_Brutus_Kasse_15_06"); //什 么 钱 箱 子 ？
	AI_Output(self, other, "DIA_Brutus_Kasse_06_07"); //我 们 把 自 己 的 物 品 都 放 在 这 个 箱 子 里 面 … … 嗯 … … 是 随 着 时 间 的 流 逝 积 攒 下 来 的 。
	AI_Output(self, other, "DIA_Brutus_Kasse_06_08"); //那 是 一 个 可 观 的 数 字 。 箱 子 里 放 着200个 金 币 ， 还 有 一 些 珍 贵 的 珠 宝 。
	AI_Output(self, other, "DIA_Brutus_Kasse_06_09"); //如 果 你 帮 我 把 钱 拿 回 来 ， 你 可 以 留 着 那 些 珠 宝 ， 我 还 会 训 练 你 。

	Log_CreateTopic(TopicBrutusKasse, LOG_MISSION);
	Log_SetTopicStatus(TopicBrutusKasse, LOG_RUNNING);
	B_LogEntry(TopicBrutusKasse, TopicBrutusKasse_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Wo ist Den?
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Den(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 2;
	condition		= DIA_Brutus_Den_Condition;
	information		= DIA_Brutus_Den_Info;
	description		= "你 知 道 丹 恩 向 哪 里 跑 的 吗 ？";
};

func int DIA_Brutus_Den_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Brutus_Kasse)
	&& (Kapitel < 3)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Den_Info()
{
	AI_Output(other, self, "DIA_Brutus_Den_15_00"); //你 知 道 丹 恩 向 哪 里 跑 的 吗 ？
	AI_Output(self, other, "DIA_Brutus_Den_06_01"); //离 这 里 越 远 越 好 。 我 猜 他 可 能 已 经 想 办 法 穿 过 关 卡 了 。
	AI_Output(other, self, "DIA_Brutus_Den_15_02"); //谢 谢 你 ， 这 很 有 帮 助 。
	AI_Output(self, other, "DIA_Brutus_Den_06_03"); //嗯 ， 我 能 说 些 什 么 ？ 我 不 知 道 他 去 了 哪 里 。

	B_LogEntry(TopicBrutusKasse, TopicBrutusKasse_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Gold
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_Gold(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 2;
	condition		= DIA_Brutus_Gold_Condition;
	information		= DIA_Brutus_Gold_Info;
	permanent		= TRUE;
	description		= "我 有 东 西 给 你 （ 给 他 ２ ０ ０ 金 币 ）";
};

func int DIA_Brutus_Gold_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Brutus_Kasse)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	&& (Brutus_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Gold_Info()
{
	AI_Output(other, self, "DIA_Brutus_Gold_15_00"); //我 有 一 些 东 西 给 你 。

	if (B_GiveInvItems(other, self, Itmi_Gold, 200))
	{
		AI_Output(self, other, "DIA_Brutus_Gold_06_01"); //好 极 了 。 如 果 你 喜 欢 的 话 ， 我 可 以 训 练 你 。
		Brutus_TeachSTR = TRUE;
		Log_CreateTopic(TOPIC_Teacher_OC, LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_1);
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_Brutus_Gold_06_02"); //听 着 ， 只 要 给 我200个 金 币 。 我 不 在 乎 你 在 哪 里 得 到 它 们 的 - 只 要 是 金 子 。
	};
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Brutus_Teach(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 7;
	condition		= DIA_Brutus_Teach_Condition;
	information		= DIA_Brutus_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 变 得 更 强 壮";
};

func int DIA_Brutus_Teach_Condition()
{
	if ((Brutus_TeachSTR == TRUE)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_Teach_Info()
{
	AI_Output(other, self, "DIA_Brutus_Teach_15_00"); //我 想 要 变 得 更 强 壮 。

	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_Back()
{
	Info_ClearChoices(DIA_Brutus_Teach);
};

func void DIA_Brutus_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Brutus_Teach_STR_5);
};

func void DIA_Brutus_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Brutus_Teach);
	Info_AddChoice(DIA_Brutus_Teach, DIALOG_BACK, DIA_Brutus_Teach_Back);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Brutus_Teach_STR_1);
	Info_AddChoice(DIA_Brutus_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Brutus_Teach_STR_5);
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
instance DIA_Brutus_KAP3_EXIT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 999;
	condition		= DIA_Brutus_KAP3_EXIT_Condition;
	information		= DIA_Brutus_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brutus_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DuSchonWieder
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_DUSCHONWIEDER(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 30;
	condition		= DIA_Brutus_DUSCHONWIEDER_Condition;
	information		= DIA_Brutus_DUSCHONWIEDER_Info;
	permanent		= TRUE;
	description		= "今 天 拷 问 了 什 么 人 吗 ？";
};

func int DIA_Brutus_DUSCHONWIEDER_Condition()
{
	if ((Kapitel == 3)
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_DUSCHONWIEDER_Info()
{
	AI_Output(other, self, "DIA_Brutus_DUSCHONWIEDER_15_00"); //今 天 拷 问 了 什 么 人 吗 ？
	AI_Output(self, other, "DIA_Brutus_DUSCHONWIEDER_06_01"); //你 没 看 见 我 很 忙 吗 ？ 等 一 会 儿 再 来 。

	B_NpcClearObsessionByDMT(self);
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
instance DIA_Brutus_KAP4_EXIT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 999;
	condition		= DIA_Brutus_KAP4_EXIT_Condition;
	information		= DIA_Brutus_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brutus_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Warumnichtarbbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_WARUMNICHTARBBEIT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 40;
	condition		= DIA_Brutus_WARUMNICHTARBBEIT_Condition;
	information		= DIA_Brutus_WARUMNICHTARBBEIT_Info;
	description		= "你 为 什 么 不 在 工 作 ？";
};

func int DIA_Brutus_WARUMNICHTARBBEIT_Condition()
{
	if ((Kapitel >= 4)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	&& (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_WARUMNICHTARBBEIT_Info()
{
	AI_Output(other, self, "DIA_Brutus_WARUMNICHTARBBEIT_15_00"); //你 为 什 么 不 在 工 作 ？
	AI_Output(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_01"); //（ 心 烦 意 乱 的 ） 但 是 那 很 恶 心 ！
	AI_Output(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_02"); //你 已 经 看 过 我 的 房 间 了 吗 ？ 那 些 肮 脏 的 肉 虫 到 处 都 是 。
	AI_Output(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_03"); //我 不 知 道 以 前 是 谁 住 在 那 里 ， 但 是 ， 我 肯 定 不 会 回 到 那 个 肮 脏 的 猪 圈 里 去 了 。
	AI_Output(self, other, "DIA_Brutus_WARUMNICHTARBBEIT_06_04"); //我 憎 恨 那 些 畜 生 。 别 象 个 白 痴 一 样 地 咧 着 嘴 笑 了 。

	Log_CreateTopic(TOPIC_BrutusMeatbugs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrutusMeatbugs, LOG_RUNNING);
	B_LogEntry(TOPIC_BrutusMeatbugs, TOPIC_BrutusMeatbugs_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Meatbugsweg
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_MEATBUGSWEG(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 31;
	condition		= DIA_Brutus_MEATBUGSWEG_Condition;
	information		= DIA_Brutus_MEATBUGSWEG_Info;
	description		= "肉 虫 都 没 了 。";
};

func int DIA_Brutus_MEATBUGSWEG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Brutus_WARUMNICHTARBBEIT))
	&& (Npc_IsDead(Meatbug_Brutus1))
	&& (Npc_IsDead(Meatbug_Brutus2))
	&& (Npc_IsDead(Meatbug_Brutus3))
	&& (Npc_IsDead(Meatbug_Brutus4))
	&& (Kapitel >= 4)
	&& (NpcObsessedByDMT_Brutus == FALSE)
	&& (MIS_OCGateOpen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_MEATBUGSWEG_Info()
{
	AI_Output(other, self, "DIA_Brutus_MEATBUGSWEG_15_00"); //那 些 肉 虫 都 没 了 。 你 可 以 回 去 磨 光 你 的 拇 指 夹 了 ， 或 者 别 的 什 么 东 西 。
	AI_Output(self, other, "DIA_Brutus_MEATBUGSWEG_06_01"); //你 肯 定 那 些 怪 物 一 个 都 不 剩 了 ？
	AI_Output(other, self, "DIA_Brutus_MEATBUGSWEG_15_02"); //非 常 肯 定 。
	AI_Output(self, other, "DIA_Brutus_MEATBUGSWEG_06_03"); //那 好 吧 。 给 ， 拿 着 这 些 金 子 ， 算 我 的 一 点 感 谢 。
	AI_Output(other, self, "DIA_Brutus_MEATBUGSWEG_15_04"); //噢 ， 别 让 我 哭 。

	TOPIC_END_BrutusMeatbugs = TRUE;

	B_GivePlayerXP(XP_BrutusMeatbugs);
	B_NpcClearObsessionByDMT(self);

	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);

	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_PERM4(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 32;
	condition		= DIA_Brutus_PERM4_Condition;
	information		= DIA_Brutus_PERM4_Info;
	permanent		= TRUE;
	description		= "你 疯 了 吗 ？";
};

func int DIA_Brutus_PERM4_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Brutus_MEATBUGSWEG))
	|| (MIS_OCGateOpen == TRUE))
	&& (NpcObsessedByDMT_Brutus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_PERM4_Info()
{
	if (
	(MIS_OCGateOpen == TRUE)
	|| ((hero.guild == GIL_KDF) && (Kapitel >= 5))
	)
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Brutus_PERM4_15_00"); //你 没 事 吧 ？
		AI_Output(self, other, "DIA_Brutus_PERM4_06_01"); //（ 担 心 地 ） 你 真 的 肯 定 那 些 肉 虫 都 没 了 ？
		AI_Output(other, self, "DIA_Brutus_PERM4_15_02"); //啊 咳 … … 看 ， 就 在 你 后 面 有 一 个 。
		AI_Output(self, other, "DIA_Brutus_PERM4_06_03"); //（ 怒 吼 ） 什 么 ？

		B_NpcClearObsessionByDMT(self);

		Npc_SetTarget(self, other);

		self.aivar[AIV_INVINCIBLE] = FALSE; // HACK, weil durch AI_StartState(böse) Flag nicht zurückgesetzt wird
		other.aivar[AIV_INVINCIBLE] = FALSE;

		AI_StartState(self, ZS_Flee, 0, "");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info bessen
///////////////////////////////////////////////////////////////////////
instance DIA_Brutus_BESSEN(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 55;
	condition		= DIA_Brutus_BESSEN_Condition;
	information		= DIA_Brutus_BESSEN_Info;
	permanent		= TRUE;
	description		= "你 被 附 体 了 ！";
};

func int DIA_Brutus_BESSEN_Condition()
{
	if ((NpcObsessedByDMT_Brutus == TRUE)
	&& (NpcObsessedByDMT == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brutus_BESSEN_Info()
{
	AI_Output(other, self, "DIA_Brutus_BESSEN_15_00"); //你 被 附 体 了 ！

	if ((hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL))
	{
		AI_Output(other, self, "DIA_Brutus_BESSEN_15_01"); //去 修 道 院 让 人 给 你 治 疗 一 下 。
		AI_Output(self, other, "DIA_Brutus_BESSEN_06_02"); //没 人 帮 我 的 忙 。 走 开 ！
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Brutus_BESSEN_15_03"); //必 须 有 人 从 你 脑 袋 里 的 魔 鬼 赶 走 。
		AI_Output(self, other, "DIA_Brutus_BESSEN_06_04"); //（ 尖 叫 ） 不 ！
		B_NpcClearObsessionByDMT(self);

		Npc_SetTarget(self, other);

		self.aivar[AIV_INVINCIBLE] = FALSE; // HACK, weil durch AI_StartState(böse) Flag nicht zurückgesetzt wird
		other.aivar[AIV_INVINCIBLE] = FALSE;

		AI_StartState(self, ZS_Flee, 0, "");
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5 und 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Brutus_KAP5_EXIT(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 999;
	condition		= DIA_Brutus_KAP5_EXIT_Condition;
	information		= DIA_Brutus_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Brutus_KAP5_EXIT_Condition()
{
	if (Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Brutus_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Brutus_PICKPOCKET(C_INFO)
{
	npc				= VLK_4100_Brutus;
	nr				= 900;
	condition		= DIA_Brutus_PICKPOCKET_Condition;
	information		= DIA_Brutus_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Brutus_PICKPOCKET_Condition()
{
	C_Beklauen(14, 35);
};

func void DIA_Brutus_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
	Info_AddChoice(DIA_Brutus_PICKPOCKET, DIALOG_BACK, DIA_Brutus_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brutus_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Brutus_PICKPOCKET_DoIt);
};

func void DIA_Brutus_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};

func void DIA_Brutus_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brutus_PICKPOCKET);
};
