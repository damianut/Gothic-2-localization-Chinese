// ************************************************************
// 								Exit
// ************************************************************
instance DIA_Addon_RoastPirate_EXIT(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 999;
	condition		= DIA_Addon_RoastPirate_EXIT_Condition;
	information		= DIA_Addon_RoastPirate_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_RoastPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 							Diese Hitze
// ************************************************************
var int PIR_1364_Grog;
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_GimmeGrog(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 1;
	condition		= DIA_Addon_RoastPirate_GimmeGrog_Condition;
	information		= DIA_Addon_RoastPirate_GimmeGrog_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_RoastPirate_GimmeGrog_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk) == TRUE)
	&& (Npc_WasInState(self, ZS_Roast_Scavenger) == TRUE)
	&& (PIR_1364_Grog == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_Info()
{
	AI_Output(self, other, "DIA_Addon_PIR_6_GimmeGrog_06_00"); //啊 ， 这 种 火 的 热 度 让 人 口 渴 。
	AI_Output(self, other, "DIA_Addon_PIR_6_GimmeGrog_06_01"); //啊 ， 你 有 一 些 烈 酒 给 我 吗 ？

	Log_CreateTopic(TOPIC_Addon_RoastGrog, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RoastGrog, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RoastGrog, TOPIC_Addon_RoastGrog_1);

	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog, "不 ， 我 什 么 都 没 弄 到 。", DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny);

	if (Npc_HasItems(other, ItFo_addon_Grog) >= 1)
	{
		Info_AddChoice(DIA_Addon_RoastPirate_GimmeGrog, "给 ， 喝 一 口 。", DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog);
	};
};

func void DIA_Addon_RoastPirate_GimmeGrog_DontHaveAny()
{
	AI_Output(other, self, "DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00"); //不 ， 我 什 么 都 没 弄 到 。
	AI_Output(self, other, "DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00"); //胡 说 ， 我 猜 我 会 被 渴 死 。

	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_RoastPirate_GimmeGrog_HereIsGrog()
{
	AI_Output(other, self, "DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00"); //给 ， 喝 一 口 。
	B_GiveInvItems(other, self, ItFo_Addon_Grog, 1);
	AI_Output(self, other, "DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01"); //谢 谢 ， 老 兄 。
	B_UseItem(self, ItFo_Addon_Grog);
	PIR_1364_Grog = TRUE;
	Info_ClearChoices(DIA_Addon_RoastPirate_GimmeGrog);
	B_LogEntry(TOPIC_Addon_RoastGrog, TOPIC_Addon_RoastGrog_2);

	Npc_ExchangeRoutine(self, "START");

	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 					Hallo 2 (Was machst du?)
// ************************************************************
instance DIA_Addon_RoastPirate_SeichtesWasser(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 2;
	condition		= DIA_Addon_RoastPirate_SeichtesWasser_Condition;
	information		= DIA_Addon_RoastPirate_SeichtesWasser_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Addon_RoastPirate_SeichtesWasser_Condition()
{
	return TRUE;
};

func void DIA_Addon_RoastPirate_SeichtesWasser_Info()
{
	AI_Output(other, self, "DIA_Addon_PIR_6_SeichtesWasser_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_01"); //我 必 须 照 顾 好 这 里 这 些 贪 吃 的 船 员 。
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_02"); //所 以 我 没 日 没 夜 的 站 在 这 里 ， 拿 着 热 煎 锅 卖 命 地 工 作 。
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_03"); //我 非 常 想 去 海 滩 上 搜 寻 那 些 搁 浅 的 船 物 。
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_04"); //上 周 ， 一 艘 巨 大 的 商 船 在 撞 上 了 海 岸 边 的 暗 礁 。
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_05"); //现 在 所 有 的 好 东 西 都 被 冲 到 了 海 滩 上 。
	AI_Output(self, other, "DIA_Addon_PIR_6_SeichtesWasser_06_06"); //我 真 希 望 有 人 能 快 点 接 手 我 的 工 作 。
};

// ************************************************************
// 							Francis
// ************************************************************
instance DIA_Addon_RoastPirate_Francis(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 3;
	condition		= DIA_Addon_RoastPirate_Francis_Condition;
	information		= DIA_Addon_RoastPirate_Francis_Info;
	description		= "关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_Addon_RoastPirate_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_RoastPirate_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_PIR_6_FRANCIS_15_00"); //关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_PIR_6_Francis_06_01"); //弗 朗 西 斯 ？ 他 一 直 扮 演 着 我 们 的 船 长 。 不 过 等 格 雷 格 回 来 的 时 候 。
	AI_Output(self, other, "DIA_Addon_PIR_6_Francis_06_02"); //那 时 他 就 要 爬 回 他 的 石 头 下 面 ， 像 虫 子 一 样 蜷 缩 起 来 。
	AI_Output(self, other, "DIA_Addon_PIR_6_Francis_06_04"); //照 我 说 的 话 ， 他 在 欺 骗 所 有 的 人 。 我 打 赌 他 一 定 赚 了 一 大 笔 钱 。
	AI_Output(self, other, "DIA_Addon_PIR_6_Francis_06_05"); //我 可 没 有 告 诉 你 这 些 。 而 且 只 要 你 还 没 有 证 据 ， 就 最 好 不 要 对 任 何 人 提 起 这 事 。
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Addon_RoastPirate_PERM(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 99;
	condition		= DIA_Addon_RoastPirate_PERM_Condition;
	information		= DIA_Addon_RoastPirate_PERM_Info;
	permanent		= TRUE;
	description		= "还 有 吗 ？";
};

func int DIA_Addon_RoastPirate_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_RoastPirate_SeichtesWasser))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_Job_15_00"); //还 有 吗 ？

	var int randy;
	randy = Hlp_Random(3);

	if (GregIsBack == TRUE)
	{
		if ((randy == 0)
		&& (!Npc_IsDead(Francis)))
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_02"); //如 果 我 是 格 雷 格 ， 我 就 派 弗 朗 西 斯 去 沼 泽 。
		}
		else if (randy == 1)
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_03"); //因 为 格 雷 格 回 来 了 ， 强 盗 在 攻 击 我 们 之 前 一 定 会 考 虑 再 三 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_01"); //因 为 格 雷 格 回 来 了 ， 我 们 有 更 多 的 工 作 要 做 ， 不 过 至 少 我 们 得 到 了 应 有 的 酬 劳 。
		};
	}
	else
	{
		if ((randy == 0)
		&& (!Npc_IsDead(Francis)))
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_06"); //弗 朗 西 斯 是 个 彻 底 的 失 败 者 。 就 因 为 他 做 了 这 个 营 地 的 首 领 ， 所 有 的 事 情 都 变 得 一 团 糟 。
		}
		else if (randy == 1)
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_05"); //让 那 些 强 盗 来 进 攻 吧 。 他 们 永 远 也 不 知 道 是 什 么 打 中 了 他 们 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_PIR_6_Chef_06_04"); //只 要 格 雷 格 能 快 点 回 来 。 我 想 回 去 ， 回 到 开 阔 的 大 海 上 。
		};
	};
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_Anheuern(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 11;
	condition		= DIA_Addon_RoastPirate_Anheuern_Condition;
	information		= DIA_Addon_RoastPirate_Anheuern_Info;
	description		= "你 应 该 帮 助 我 。";
};

func int DIA_Addon_RoastPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_15_01"); //你 应 该 帮 助 我 。
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_15_03"); //来 自 格 雷 格 的 命 令 。
	B_Say(self, other, "$ABS_GOOD");
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_ComeOn(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 12;
	condition		= DIA_Addon_RoastPirate_ComeOn_Condition;
	information		= DIA_Addon_RoastPirate_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_RoastPirate_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_RoastPirate_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_RoastPirate_ComeOn_15_00"); //跟 我 来 。
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_Say(self, other, "$ABS_GOOD");
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_GoHome(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 13;
	condition		= DIA_Addon_RoastPirate_GoHome_Condition;
	information		= DIA_Addon_RoastPirate_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_RoastPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_RoastPirate_GoHome_15_00"); //我 不 再 需 要 你 了 。
	B_Say(self, other, "$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_RoastPirate_TooFar(C_INFO)
{
	npc				= PIR_1364_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_RoastPirate_TooFar_Condition;
	information		= DIA_Addon_RoastPirate_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_RoastPirate_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_RoastPirate_TooFar_Info()
{
	B_Say(self, other, "$RUNAWAY");

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};
