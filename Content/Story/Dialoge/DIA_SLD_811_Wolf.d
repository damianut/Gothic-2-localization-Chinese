// ************************************************************
// 			  					EXIT
// ************************************************************
instance DIA_Wolf_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 999;
	condition		= DIA_Wolf_EXIT_Condition;
	information		= DIA_Wolf_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
instance DIA_Wolf_Hallo(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 4;
	condition		= DIA_Wolf_Hallo_Condition;
	information		= DIA_Wolf_Hallo_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Wolf_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wolf_Hallo_Info()
{
	AI_Output(other, self, "DIA_Wolf_Hallo_15_00"); //一 切 顺 利 吗 ？
	AI_Output(self, other, "DIA_Wolf_Hallo_08_01"); //嗨 ！ 我 认 识 你 ！ 在 流 放 地 的 时 候 。
	AI_Output(self, other, "DIA_Wolf_Hallo_08_02"); //你 来 这 里 想 要 做 什 么 ？
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Wolf_WannaJoin(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 5;
	condition		= DIA_Wolf_WannaJoin_Condition;
	information		= DIA_Wolf_WannaJoin_Info;
	description		= "我 来 加 入 你 们 。";
};

func int DIA_Wolf_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_Hallo))
	&& (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Wolf_WannaJoin_15_00"); //我 来 加 入 你 们 。
	AI_Output(self, other, "DIA_Wolf_WannaJoin_08_01"); //行 啊 。 我 没 什 么 可 反 对 的 。 何 况 ， 你 那 时 从 那 些 守 卫 那 里 夺 回 了 我 们 的 矿 。
	AI_Output(self, other, "DIA_Wolf_WannaJoin_08_02"); //不 过 ， 别 以 为 能 那 么 容 易 就 跟 这 里 的 其 它 人 相 处 融 洽 。
	AI_Output(self, other, "DIA_Wolf_WannaJoin_08_03"); //从 那 时 加 入 了 很 多 新 兵 ， 还 有 一 些 老 雇 佣 兵 不 记 得 你 。
	AI_Output(self, other, "DIA_Wolf_WannaJoin_08_04"); //我 几 乎 认 不 出 你 ， 你 看 起 来 很 憔 悴 。
	AI_Output(other, self, "DIA_Wolf_WannaJoin_15_05"); //屏 障 崩 溃 后 ， 我 好 不 容 易 捡 了 一 条 命 。
	AI_Output(self, other, "DIA_Wolf_WannaJoin_08_06"); //那 么 ， 你 看 起 来 走 运 了 。

	B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_6);
};

// ************************************************************
// 			  				WannaBuy
// ************************************************************
instance DIA_Wolf_WannaBuy(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 6;
	condition		= DIA_Wolf_WannaBuy_Condition;
	information		= DIA_Wolf_WannaBuy_Info;
	description		= "你 还 有 别 的 东 西 卖 吗 ？";
};

func int DIA_Wolf_WannaBuy_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaBuy_Info()
{
	AI_Output(other, self, "DIA_Wolf_WannaBuy_15_00"); //你 还 有 别 的 东 西 卖 吗 ？
	AI_Output(self, other, "DIA_Wolf_WannaBuy_08_01"); //哦 ， 不 要 问 我 。
	AI_Output(self, other, "DIA_Wolf_WannaBuy_08_02"); //贝 尼 特 ， 一 个 新 来 的 家 伙 ， 现 在 负 责 武 器 和 盔 甲 。
	AI_Output(self, other, "DIA_Wolf_WannaBuy_08_03"); //在 流 放 地 的 时 候 ， 我 为 李 负 责 全 部 的 武 器 储 备 ， 后 来 ， 来 了 一 个 经 过 专 门 训 练 的 铁 匠 和 ‘ 战 俘 ’ ， 我 就 丢 了 工 作 。
	AI_Output(self, other, "DIA_Wolf_WannaBuy_08_04"); //我 非 常 需 要 一 份 新 的 工 作 ， 就 算 是 只 要 我 到 外 面 去 看 管 农 场 都 行 。
	AI_Output(self, other, "DIA_Wolf_WannaBuy_08_05"); //我 不 在 乎 ， 只 要 我 不 再 在 这 里 无 所 事 事 就 行 。
};

// ************************************************************
// 			  				WannaLearn
// ************************************************************
instance DIA_Wolf_WannaLearn(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 7;
	condition		= DIA_Wolf_WannaLearn_Condition;
	information		= DIA_Wolf_WannaLearn_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Wolf_WannaLearn_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Wolf_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Wolf_WannaLearn_Info()
{
	AI_Output(other, self, "DIA_Wolf_WannaLearn_15_00"); //你 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Wolf_WannaLearn_08_01"); //如 果 你 愿 意 ， 我 可 以 教 你 几 个 使 用 弓 箭 的 诀 窍 。 无 论 如 何 ， 我 现 在 没 有 其 它 更 好 的 事 情 做 了 。

	Wolf_TeachBow = TRUE;
	Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_4);
};

// ************************************************************
// 			  				TEACH
// ************************************************************
var int Wolf_Merke_Bow;
// ------------------------------------------------------
instance DIA_Wolf_TEACH(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 8;
	condition		= DIA_Wolf_TEACH_Condition;
	information		= DIA_Wolf_TEACH_Info;
	permanent		= TRUE;
	description		= "我 想 进 一 步 地 学 习 箭 术 。";
};

func int DIA_Wolf_TEACH_Condition()
{
	if (Wolf_TeachBow == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_TEACH_Info()
{
	AI_Output(other, self, "DIA_Wolf_TEACH_15_00"); //我 想 进 一 步 地 学 习 箭 术 。
	AI_Output(self, other, "DIA_Wolf_TEACH_08_01"); //我 该 教 你 什 么 ？

	Wolf_Merke_Bow = other.HitChance[NPC_TALENT_BOW];

	Info_ClearChoices(DIA_Wolf_Teach);
	Info_AddChoice(DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_Back()
{
	if (Wolf_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self, other, "DIA_Wolf_Teach_BACK_08_00"); //好 了 。 你 已 经 瞄 准 得 更 精 确 了 。
	};

	Info_ClearChoices(DIA_Wolf_Teach);
};

func void DIA_Wolf_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 90);

	Info_ClearChoices(DIA_Wolf_Teach);
	Info_AddChoice(DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_Teach_Bow_1);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_Teach_Bow_5);
};

func void DIA_Wolf_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 90);

	Info_ClearChoices(DIA_Wolf_Teach);
	Info_AddChoice(DIA_Wolf_Teach, DIALOG_BACK, DIA_Wolf_Teach_Back);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_Teach_BOW_1);
	Info_AddChoice(DIA_Wolf_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_Teach_BOW_5);
};

// ************************************************************
// 			  					PERM
// ************************************************************
instance DIA_Wolf_PERM(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 9;
	condition		= DIA_Wolf_PERM_Condition;
	information		= DIA_Wolf_PERM_Info;
	permanent		= TRUE;
	description		= "然 后 呢 ？ 得 到 新 的 任 务 了 ？";
};

func int DIA_Wolf_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_WannaBuy))
	&& (MIS_BengarsHelpingSLD == 0)
	&& (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_PERM_Info()
{
	AI_Output(other, self, "DIA_Wolf_PERM_15_00"); //然 后 呢 ？ 得 到 新 的 任 务 了 ？
	AI_Output(self, other, "DIA_Wolf_PERM_08_01"); //到 目 前 为 止 还 没 有 。 如 果 你 有 了 适 合 我 干 的 活 就 告 诉 我 。
};

// ************************************************************
// 			  					Stadt
// ************************************************************
instance DIA_Wolf_Stadt(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 10;
	condition		= DIA_Wolf_Stadt_Condition;
	information		= DIA_Wolf_Stadt_Info;
	description		= "你 试 过 在 镇 上 找 个 工 作 吗 ？";
};

func int DIA_Wolf_Stadt_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_WannaBuy))
	&& (MIS_BengarsHelpingSLD == 0)
	&& (Wolf_IsOnBoard != LOG_FAILED))
	{
		return TRUE;
	};
};

func void DIA_Wolf_Stadt_Info()
{
	AI_Output(other, self, "DIA_Wolf_Stadt_15_00"); //你 试 过 在 镇 上 找 个 工 作 吗 ？
	AI_Output(self, other, "DIA_Wolf_Stadt_08_01"); //在 城 里 ？ （ 大 笑 ） 就 算 几 匹 野 马 也 不 能 把 我 拖 到 那 里 去 。
	AI_Output(self, other, "DIA_Wolf_Stadt_08_02"); //或 者 说 你 觉 得 我 会 想 去 那 里 当 一 个 民 兵 ？ 我 可 以 想 象 得 出 自 己 穿 上 那 些 奴 才 们 穿 的 制 服 是 个 什 么 样 。
	AI_Output(self, other, "DIA_Wolf_Stadt_08_03"); //然 后 是 那 种 事 事 顺 从 的 困 惑 。 不 ， 算 了 吧 - 在 农 场 这 里 也 许 会 没 有 任 何 事 可 干 ， 但 是 至 少 我 能 做 自 己 想 做 的 事 情 。
};

// #####################################################################
// ##
// ##
// ## Ab KAPITEL 2
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   Wegen CrawlerArmor
// ************************************************************
var int MIS_Wolf_BringCrawlerPlates;
var int Wolf_MakeArmor;
var int Player_GotCrawlerArmor;
// ---------------------------------
instance DIA_Wolf_AboutCrawler(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 1;
	condition		= DIA_Wolf_AboutCrawler_Condition;
	information		= DIA_Wolf_AboutCrawler_Info;
	description		= "我 听 说 你 知 道 怎 样 用 爬 行 者 鳞 片 做 盔 甲 ？";
};

func int DIA_Wolf_AboutCrawler_Condition()
{
	if ((Kapitel >= 2)
	&& (Wolf_ProduceCrawlerArmor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_AboutCrawler_Info()
{
	AI_Output(other, self, "DIA_Wolf_AboutCrawler_15_00"); //我 听 说 你 知 道 怎 样 用 爬 行 者 鳞 片 做 盔 甲 ？
	AI_Output(self, other, "DIA_Wolf_AboutCrawler_08_01"); //是 这 样 的 。 你 听 谁 说 的 ？
	AI_Output(other, self, "DIA_Wolf_AboutCrawler_15_02"); //是 一 个 叫 盖 斯 塔 斯 的 猎 人 告 诉 我 的 。
	AI_Output(other, self, "DIA_Wolf_AboutCrawler_15_03"); //你 能 为 我 做 那 样 的 盔 甲 吗 ？
	AI_Output(self, other, "DIA_Wolf_AboutCrawler_08_04"); //当 然 。 给 我10个 爬 行 者 鳞 片 就 可 以 给 你 做 一 件 。
	AI_Output(other, self, "DIA_Wolf_AboutCrawler_15_05"); //你 想 要 多 少 钱 作 为 回 报 ？
	AI_Output(self, other, "DIA_Wolf_AboutCrawler_08_06"); //算 了 吧 。 都 是 老 朋 友 了 。

	MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Wolf_BringCrawlerPlates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wolf_BringCrawlerPlates, LOG_RUNNING);
	B_LogEntry(TOPIC_Wolf_BringCrawlerPlates, TOPIC_Wolf_BringCrawlerPlates_1);
};

// ************************************************************
// 	  				  TeachCrawlerPlates
// ************************************************************
instance DIA_Wolf_TeachCrawlerPlates(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 2;
	condition		= DIA_Wolf_TeachCrawlerPlates_Condition;
	information		= DIA_Wolf_TeachCrawlerPlates_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LEARN_CRAWLER_PLATES_2, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_CrawlerPlate));
};

func int DIA_Wolf_TeachCrawlerPlates_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_AboutCrawler))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_TeachCrawlerPlates_Info()
{
	AI_Output(other, self, "DIA_Wolf_TeachCrawlerPlates_15_00"); //告 诉 我 怎 样 从 爬 行 者 身 上 把 鳞 弄 下 来 ！

	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_CrawlerPlate))
	{
		AI_Output(self, other, "DIA_Wolf_TeachCrawlerPlates_08_01"); //这 很 容 易 。 背 部 的 鳞 都 只 有 边 缘 贴 着 身 体 。 只 要 用 锋 利 的 尖 刀 把 它 们 切 下 来 就 行 了。
		AI_Output(self, other, "DIA_Wolf_TeachCrawlerPlates_08_02"); //明 白 吗 ？
		AI_Output(other, self, "DIA_Wolf_TeachCrawlerPlates_15_03"); //听 起 来 很 容 易 。
		AI_Output(self, other, "DIA_Wolf_TeachCrawlerPlates_08_04"); //我 说 的 就 是 这 个 。
	};
};

// ************************************************************
// 	  				   BringPlates
// ************************************************************
instance DIA_Wolf_BringPlates(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 3;
	condition		= DIA_Wolf_BringPlates_Condition;
	information		= DIA_Wolf_BringPlates_Info;
	permanent		= TRUE;
	description		= "我 拿 到 了 制 作 盔 甲 用 的 爬 行 者 鳞 片 。";
};

func int DIA_Wolf_BringPlates_Condition()
{
	if ((MIS_Wolf_BringCrawlerPlates == LOG_RUNNING)
	&& (Npc_HasItems(other, ItAt_CrawlerPlate) >= 10))
	{
		return TRUE;
	};
};

func void DIA_Wolf_BringPlates_Info()
{
	AI_Output(other, self, "DIA_Wolf_BringPlates_15_00"); //我 拿 到 了 制 作 盔 甲 用 的 爬 行 者 鳞 片 。
	B_GiveInvItems(other, self, ItAt_CrawlerPlate, 10);
	AI_Output(self, other, "DIA_Wolf_BringPlates_08_01"); //很 好 ！ 把 它 们 放 在 这 里 。

	MIS_Wolf_BringCrawlerPlates = LOG_SUCCESS;
};

// ************************************************************
// 	  				  		ArmorReady
// ************************************************************
var int Wolf_Armor_Day;
// --------------------
instance DIA_Wolf_ArmorReady(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 4;
	condition		= DIA_Wolf_ArmorReady_Condition;
	information		= DIA_Wolf_ArmorReady_Info;
	permanent		= TRUE;
	description		= "好 ， 盔 甲 在 哪 里 ？";
};

func int DIA_Wolf_ArmorReady_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_AboutCrawler))
	&& (Player_GotCrawlerArmor == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_ArmorReady_Info()
{
	AI_Output(other, self, "DIA_Wolf_ArmorReady_15_00"); //好 ， 盔 甲 在 哪 里 ？

	if (Npc_HasItems(self, ItAt_CrawlerPlate) >= 10)
	{
		if (Wolf_MakeArmor == FALSE)
		{
			Wolf_Armor_Day = (Wld_GetDay() + 1);
			Wolf_MakeArmor = TRUE;
		};

		if ((Wolf_MakeArmor == TRUE)
		&& (Wolf_Armor_Day > Wld_GetDay()))
		{
			AI_Output(self, other, "DIA_Wolf_ArmorReady_08_01"); //我 会 帮 你 把 它 们 做 好 。 明 天 再 来 。
		}
		else
		{
			CreateInvItems(self, ItAr_Djg_Crawler, 1);
			Npc_RemoveInvItems(self, ItAt_CrawlerPlate, 10);
			AI_Output(self, other, "DIA_Wolf_ArmorReady_08_02"); //我 做 好 了 。 在 这 里 。
			B_GiveInvItems(self, other, ItAr_Djg_Crawler, 1);
			AI_Output(self, other, "DIA_Wolf_ArmorReady_08_03"); //看 起 来 真 的 不 错 ， 我 认 为 … …
			AI_Output(other, self, "DIA_Wolf_ArmorReady_15_04"); //谢 谢 你 ！
			AI_Output(self, other, "DIA_Wolf_ArmorReady_08_05"); //不 用 谢 。
			Player_GotCrawlerArmor = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Wolf_ArmorReady_08_06"); //你 真 会 开 玩 笑 。 首 先 ， 我 需 要 爬 行 者 鳞 片 … …
		Wolf_MakeArmor = FALSE;
		MIS_Wolf_BringCrawlerPlates = LOG_RUNNING;
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
instance DIA_Wolf_KAP3_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 999;
	condition		= DIA_Wolf_KAP3_EXIT_Condition;
	information		= DIA_Wolf_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info bengar
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_BENGAR(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 31;
	condition		= DIA_Wolf_BENGAR_Condition;
	information		= DIA_Wolf_BENGAR_Info;
	permanent		= TRUE;
	description		= "我 已 经 在 本 加 的 农 场 帮 你 找 到 了 一 个 工 作 。";
};

func int DIA_Wolf_BENGAR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_HALLO))
	&& (MIS_BengarsHelpingSLD == LOG_RUNNING)
	&& (Kapitel >= 3)
	&& (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

var int DIA_Wolf_BENGAR_oneTime;
var int Wolf_BENGAR_geld;

func void DIA_Wolf_BENGAR_Info()
{
	AI_Output(other, self, "DIA_Wolf_BENGAR_15_00"); //我 已 经 在 本 加 的 农 场 帮 你 找 到 了 一 个 工 作 。

	if (DIA_Wolf_BENGAR_oneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Wolf_BENGAR_08_01"); //让 我 们 听 听 。
		AI_Output(other, self, "DIA_Wolf_BENGAR_15_02"); //通 往 矿 藏 山 谷 的 关 卡 就 在 本 加 的 农 场 那 里 。 他 遇 到 了 麻 烦 ， 那 些 野 兽 都 从 关 卡 涌 了 进 来 。
		AI_Output(other, self, "DIA_Wolf_BENGAR_15_03"); //必 须 有 人 去 保 卫 本 加 的 农 场 。
		AI_Output(self, other, "DIA_Wolf_BENGAR_08_04"); //那 很 重 要 。 因 为 至 少 那 时 我 就 得 离 开 农 场 ， 还 没 法 看 着 铁 匠 铺 。
		DIA_Wolf_BENGAR_oneTime = TRUE;
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Wolf_BENGAR_08_05"); //就 这 样 。 因 为 你 是 我 们 的 人 ， 我 会 给 你 一 个 好 价 钱 。 给 我 3 0 0 个 金 币 我 就 去 干 。
		Wolf_BENGAR_geld = 300;
	}
	else
	{
		AI_Output(self, other, "DIA_Wolf_BENGAR_08_06"); //很 好 。 那 就 8 0 0 个 金 币 。
		AI_Output(other, self, "DIA_Wolf_BENGAR_15_07"); //一 个 大 价 钱 。
		AI_Output(self, other, "DIA_Wolf_BENGAR_08_08"); //好 吧 。 如 果 是 自 己 人 ， 我 会 无 条 件 地 去 做 。 但 是 对 于 你 … …
		Wolf_BENGAR_geld = 800;
	};

	Info_ClearChoices(DIA_Wolf_BENGAR);
	Info_AddChoice(DIA_Wolf_BENGAR, "我 会 考 虑 的", DIA_Wolf_BENGAR_nochnicht);
	Info_AddChoice(DIA_Wolf_BENGAR, "这 是 你 的 钱 。", DIA_Wolf_BENGAR_geld);
};

func void DIA_Wolf_BENGAR_geld()
{
	AI_Output(other, self, "DIA_Wolf_BENGAR_geld_15_00"); //这 是 你 的 钱 。

	if (B_GiveInvItems(other, self, ItMi_Gold, Wolf_BENGAR_geld))
	{
		AI_Output(self, other, "DIA_Wolf_BENGAR_geld_08_01"); //很 好 。 那 我 就 出 发 去 找 那 些 野 兽 了 。 我 们 来 看 看 我 能 在 这 个 农 场 里 召 集 哪 些 人 。
		AI_Output(self, other, "DIA_Wolf_BENGAR_geld_08_02"); //再 见 。

		MIS_BengarsHelpingSLD = LOG_SUCCESS;
		B_GivePlayerXP(XP_BengarsHelpingSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self, "BENCH", -1);
		Npc_ExchangeRoutine(self, "BengarsFarm");
		B_StartOtherRoutine(SLD_815_Soeldner, "BengarsFarm");
		B_StartOtherRoutine(SLD_817_Soeldner, "BengarsFarm");
	}
	else
	{
		AI_Output(self, other, "DIA_Wolf_BENGAR_geld_08_03"); //好 吧 ， 如 果 你 有 钱 的 话 ， 我 现 在 都 已 经 上 路 了 。
	};

	Info_ClearChoices(DIA_Wolf_BENGAR);
};

func void DIA_Wolf_BENGAR_nochnicht()
{
	AI_Output(other, self, "DIA_Wolf_BENGAR_nochnicht_15_00"); //我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Wolf_BENGAR_nochnicht_08_01"); //好 吧 ， 但 不 要 让 我 失 望 。
	Info_ClearChoices(DIA_Wolf_BENGAR);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_PERMKAP3(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 80;
	condition		= DIA_Wolf_PERMKAP3_Condition;
	information		= DIA_Wolf_PERMKAP3_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Wolf_PERMKAP3_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_GetDistToWP(self, "FARM3") < 3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (Wolf_IsOnBoard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

var int DIA_Wolf_PERMKAP3_onetime;
func void DIA_Wolf_PERMKAP3_Info()
{
	AI_Output(other, self, "DIA_Wolf_PERMKAP3_15_00"); //一 切 进 展 顺 利 吗 ？

	if ((Npc_IsDead(Bengar)) && (DIA_Wolf_PERMKAP3_onetime == FALSE))
	{
		AI_Output(self, other, "DIA_Wolf_PERMKAP3_08_01"); //我 的 老 板 死 了 。 哦 ， 嗯 。 我 一 直 都 想 有 个 自 己 的 农 场 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "BengarDead");
		DIA_Wolf_PERMKAP3_onetime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Wolf_PERMKAP3_08_02"); //当 然 ！ 一 切 都 很 平 静 。
	};

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
instance DIA_Wolf_KAP4_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 999;
	condition		= DIA_Wolf_KAP4_EXIT_Condition;
	information		= DIA_Wolf_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP4_EXIT_Info()
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
instance DIA_Wolf_KAP5_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 999;
	condition		= DIA_Wolf_KAP5_EXIT_Condition;
	information		= DIA_Wolf_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ship
///////////////////////////////////////////////////////////////////////
var int wolf_SaidNo;
instance DIA_Wolf_SHIP(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 2;
	condition		= DIA_Wolf_SHIP_Condition;
	information		= DIA_Wolf_SHIP_Info;
	description		= "你 能 离 开 这 里 到 一 艘 船 上 去 吗 ？";
};

func int DIA_Wolf_SHIP_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Wolf_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIP_Info()
{
	AI_Output(other, self, "DIA_Wolf_SHIP_15_00"); //你 想 要 坐 船 离 开 这 里 吗 ？

	if ((MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& (!Npc_IsDead(Bengar)))
	{
		AI_Output(self, other, "DIA_Wolf_SHIP_08_01"); //不 。 不 再 想 了 。 我 已 经 找 到 我 的 工 作 了 。 下 次 吧 。
		wolf_SaidNo = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Wolf_SHIP_08_02"); //是 的 ， 当 然 。 我 们 离 开 这 里 吧 。 要 想 保 护 你 的 船 ， 我 能 帮 上 很 大 的 忙 。 我 们 要 去 哪 里 ？
		MIS_BengarsHelpingSLD = LOG_OBSOLETE;

		Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
		B_LogEntry(TOPIC_Crew, TOPIC_Crew_14);
	};
};

///////////////////////////////////////////////////////////////////////
// Ich muß zu einer Insel nicht weit von dieser hier.
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_KnowWhereEnemy(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 2;
	condition		= DIA_Wolf_KnowWhereEnemy_Condition;
	information		= DIA_Wolf_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 要 去 另 一 个 离 这 里 不 远 的 岛 。 ";
};

func int DIA_Wolf_KnowWhereEnemy_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wolf_SHIP))
	&& (Wolf_SaidNo == FALSE)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Wolf_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Wolf_KnowWhereEnemy_15_00"); //我 要 去 另 一 个 离 这 里 不 远 的 岛 。
	AI_Output(self, other, "DIA_Wolf_KnowWhereEnemy_08_01"); //是 的 ， 我 们 还 等 什 么 ？ 在 海 上 时 ， 我 可 以 教 你 箭 术 和 射 弩 。

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Wolf_KnowWhereEnemy_15_02"); //我 刚 记 起 来 ， 我 其 实 已 经 找 到 足 够 的 人 手 了 。
		AI_Output(self, other, "DIA_Wolf_KnowWhereEnemy_08_03"); //（ 愤 怒 的 ） 你 就 是 这 样 的 吗 ？ 一 开 始 你 对 我 挥 舞 红 旗 ， 到 后 来 什 么 也 没 有 ， 是 吗 ？
		AI_Output(self, other, "DIA_Wolf_KnowWhereEnemy_08_04"); //混 蛋 。 我 希 望 你 的 破 船 沉 掉 。
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy, "我 要 再 稍 微 多 考 虑 一 段 时 间 。", DIA_Wolf_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Wolf_KnowWhereEnemy, "欢 迎 上 船", DIA_Wolf_KnowWhereEnemy_Yes);
	};
};

func void DIA_Wolf_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Wolf_KnowWhereEnemy_Yes_15_00"); //欢 迎 上 船 ！
	AI_Output(other, self, "DIA_Wolf_KnowWhereEnemy_Yes_15_01"); //来 港 口 。 我 们 就 要 走 了 。
	AI_Output(self, other, "DIA_Wolf_KnowWhereEnemy_Yes_08_02"); //我 在 路 上 了 。

	B_GivePlayerXP(XP_Crewmember_Success);

	self.flags = NPC_FLAG_IMMORTAL;
	Wolf_IsOnBoard = LOG_SUCCESS;

	crewmember_Count = (Crewmember_Count + 1);
	AI_StopProcessInfos(self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

func void DIA_Wolf_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Wolf_KnowWhereEnemy_No_15_00"); //我 要 再 稍 微 多 考 虑 一 段 时 间 。
	AI_Output(self, other, "DIA_Wolf_KnowWhereEnemy_No_08_01"); //哦 ， 你 知 道 吗 ， 我 觉 得 你 是 个 牛 皮 大 王 。 我 一 个 字 都 不 相 信 。 让 开 点 。

	Wolf_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Wolf_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_LeaveMyShip(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 55;
	condition		= DIA_Wolf_LeaveMyShip_Condition;
	information		= DIA_Wolf_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "我 没 法 用 你 。";
};

func int DIA_Wolf_LeaveMyShip_Condition()
{
	if ((Wolf_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wolf_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Wolf_LeaveMyShip_15_00"); //我 没 法 用 你 。
	AI_Output(self, other, "DIA_Wolf_LeaveMyShip_08_01"); //一 开 始 你 给 我 希 望 ， 然 后 又 那 样 拒 绝 我 。 你 这 个 混 蛋 ， 我 会 让 你 为 此 付 出 代 价 。

	Wolf_IsOnBoard = LOG_FAILED; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info shipoff
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_SHIPOFF(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 56;
	condition		= DIA_Wolf_SHIPOFF_Condition;
	information		= DIA_Wolf_SHIPOFF_Info;
	permanent		= TRUE;
	description		= "听 着 。";
};

func int DIA_Wolf_SHIPOFF_Condition()
{
	if (Wolf_IsOnBoard == LOG_FAILED)
	{
		return TRUE;
	};
};

func void DIA_Wolf_SHIPOFF_Info()
{
	AI_Output(other, self, "DIA_Wolf_SHIPOFF_15_00"); //听 着 。
	AI_Output(self, other, "DIA_Wolf_SHIPOFF_08_01"); //滚 开 ， 混 蛋 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
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
instance DIA_Wolf_KAP6_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 999;
	condition		= DIA_Wolf_KAP6_EXIT_Condition;
	information		= DIA_Wolf_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Wolf_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wolf_PICKPOCKET(C_INFO)
{
	npc				= SLD_811_Wolf;
	nr				= 900;
	condition		= DIA_Wolf_PICKPOCKET_Condition;
	information		= DIA_Wolf_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Wolf_PICKPOCKET_Condition()
{
	C_Beklauen(32, 35);
};

func void DIA_Wolf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_PICKPOCKET, DIALOG_BACK, DIA_Wolf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wolf_PICKPOCKET_DoIt);
};

func void DIA_Wolf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};

func void DIA_Wolf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_PICKPOCKET);
};
