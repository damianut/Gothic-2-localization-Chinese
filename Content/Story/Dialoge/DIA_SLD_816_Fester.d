// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Fester_EXIT(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 999;
	condition		= DIA_Fester_EXIT_Condition;
	information		= DIA_Fester_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fester_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fester_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hello
// ************************************************************
instance DIA_Fester_Hello(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 1;
	condition		= DIA_Fester_Hello_Condition;
	information		= DIA_Fester_Hello_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Fester_Hello_Condition()
{
	return TRUE;
};

func void DIA_Fester_Hello_Info()
{
	AI_Output(other, self, "DIA_Fester_Hello_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Fester_Hello_08_01"); //我 正 准 备 战 斗 … …
};

// ************************************************************
// 			  					Auftrag
// ************************************************************
instance DIA_Fester_Auftrag(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 2;
	condition		= DIA_Fester_Auftrag_Condition;
	information		= DIA_Fester_Auftrag_Info;
	description		= "为 什 么 ？";
};

func int DIA_Fester_Auftrag_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fester_Hello))
	{
		return TRUE;
	};
};

func void DIA_Fester_Auftrag_Info()
{
	AI_Output(other, self, "DIA_Fester_Auftrag_15_00"); //为 什 么 ？
	AI_Output(self, other, "DIA_Fester_Auftrag_08_01"); //最 近 ， 那 些 旷 野 袭 击 者 给 农 民 们 带 来 了 越 来 越 多 的 麻 烦 。
	AI_Output(self, other, "DIA_Fester_Auftrag_08_02"); //甚 至 有 几 个 人 被 吃 掉 了 。
	AI_Output(self, other, "DIA_Fester_Auftrag_08_03"); //胖 子 欧 纳 尔 发 现 这 很 不 好 玩 。 一 个 星 期 以 来 ， 我 们 没 有 一 个 人 领 到 了 薪 水 。
	AI_Output(self, other, "DIA_Fester_Auftrag_08_04"); //这 或 多 或 少 有 我 的 过 错 。 现 在 李 想 要 我 一 个 人 去 捣 掉 那 些 畜 生 的 老 巢 。
	AI_Output(self, other, "DIA_Fester_Auftrag_08_05"); //其 它 的 人 都 已 经 下 了 赌 注 赌 我 能 不 能 活 着 回 来 … …
};

// ************************************************************
// 			  				Du Kämpfer?
// ************************************************************
instance DIA_Fester_YouFight(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 3;
	condition		= DIA_Fester_YouFight_Condition;
	information		= DIA_Fester_YouFight_Info;
	description		= "你 是 一 名 优 秀 的 战 士 ？";
};

func int DIA_Fester_YouFight_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo(other, DIA_Fester_Hello))
	&& (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_YouFight_Info()
{
	AI_Output(other, self, "DIA_Fester_YouFight_15_00"); //你 是 一 名 优 秀 的 战 士 ？
	AI_Output(self, other, "DIA_Fester_YouFight_08_01"); //我 的 剑 术 一 般 ， 但 是 如 果 说 弓 箭 ， 我 射 得 非 常 好 ！ 你 为 什 么 要 问 ？
};

// ************************************************************
// 			  				WoNest
// ************************************************************
instance DIA_Fester_WoNest(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 4;
	condition		= DIA_Fester_WoNest_Condition;
	information		= DIA_Fester_WoNest_Info;
	description		= "巢 穴 在 哪 里 ？";
};

func int DIA_Fester_WoNest_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fester_Auftrag))
	&& (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_WoNest_Info()
{
	AI_Output(other, self, "DIA_Fester_WoNest_15_00"); //巢 穴 在 哪 里 ？
	AI_Output(self, other, "DIA_Fester_WoNest_08_01"); //在 田 野 的 中 间 ， 那 块 大 岩 石 里 面 。
};

// ************************************************************
// 			  				Du Kämpfer?
// ************************************************************

var int Fester_Choice;
const int FC_Gold = 0;
const int FC_Join = 1;
instance DIA_Fester_Together(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 5;
	condition		= DIA_Fester_Together_Condition;
	information		= DIA_Fester_Together_Info;
	description		= "我 们 可 以 一 起 攻 击 那 个 巢 穴 … …";
};

func int DIA_Fester_Together_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo(other, DIA_Fester_Auftrag)))
	{
		return TRUE;
	};
};

func void DIA_Fester_Together_Info()
{
	AI_Output(other, self, "DIA_Fester_Together_15_00"); //我 们 可 以 一 起 攻 击 那 个 巢 穴 … …
	AI_Output(self, other, "DIA_Fester_Together_08_01"); //你 想 帮 我 ？ 为 什 么 ？

	Info_ClearChoices(DIA_Fester_Together);
	Info_AddChoice(DIA_Fester_Together, "我 想 看 到 更 多 的 金 币 ！", DIA_Fester_Together_Gold);
	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Fester_Together, "我 要 加 入 你 们 ！", DIA_Fester_Together_Join);
	};
};

func void DIA_Fester_Together_Join()
{
	AI_Output(other, self, "DIA_Fester_Together_Join_15_00"); //我 要 加 入 你 们 ！
	AI_Output(self, other, "DIA_Fester_Together_Join_08_01"); //哦 ， 是 这 样 啊 。 你 想 证 明 自 己 有 多 棒 … …
	AI_Output(self, other, "DIA_Fester_Together_Join_08_02"); //（ 阴 险 地 ） 好 吧 ， 我 们 一 起 去 打 那 些 畜 生 。
	Fester_Choice = FC_Join;
	Info_ClearChoices(DIA_Fester_Together);
};

func void DIA_Fester_Together_Gold()
{
	AI_Output(other, self, "DIA_Fester_Together_Gold_15_00"); //我 想 看 到 更 多 的 金 币 ！
	AI_Output(self, other, "DIA_Fester_Together_Gold_08_01"); //（ 大 笑 ） 你 这 个 混 蛋 ！ 你 想 占 我 的 便 宜 ， 是 吗 ？
	AI_Output(self, other, "DIA_Fester_Together_Gold_08_02"); //要 么 我 付 钱 给 你 ， 要 么 我 一 败 涂 地 。
	AI_Output(self, other, "DIA_Fester_Together_Gold_08_03"); //好 吧 。 我 可 以 付 给 你 5 0 个 金 币 - 我 只 有 这 么 多 。
	Fester_Choice = FC_Gold;
	Info_ClearChoices(DIA_Fester_Together);
};

// ************************************************************
// 			  				Du Kämpfer?
// ************************************************************
var int Fester_Losgeh_Day;
// -----------------------
instance DIA_Fester_TogetherNOW(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 6;
	condition		= DIA_Fester_TogetherNOW_Condition;
	information		= DIA_Fester_TogetherNOW_Info;
	permanent		= TRUE;
	description		= "我 们 开 始 攻 击 巢 穴 吧 ！";
};

func int DIA_Fester_TogetherNOW_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_KnowsInfo(other, DIA_Fester_Together))
	&& (MIS_Fester_KillBugs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fester_TogetherNOW_Info()
{
	AI_Output(other, self, "DIA_Fester_TogetherNOW_15_00"); //我 们 开 始 攻 击 巢 穴 吧 ！

	if (Wld_IsTime(20, 30, 06, 00))
	{
		AI_Output(self, other, "DIA_Fester_TogetherNOW_08_01"); //摸 着 黑 去 ？ 不 ， 不 ， 我 们 最 好 白 天 去 干 这 件 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Fester_TogetherNOW_08_02"); //马 上 ？ 还 是 说 你 要 先 准 备 一 下 ？
		AI_Output(self, other, "DIA_Fester_TogetherNOW_08_03"); //你 可 以 先 回 农 场 去 … …

		Info_ClearChoices(DIA_Fester_TogetherNOW);
		Info_AddChoice(DIA_Fester_TogetherNOW, "好 吧 ， 我 们 再 等 等 … …", DIA_Fester_TogetherNOW_Later);
		Info_AddChoice(DIA_Fester_TogetherNOW, "现 在 是 最 好 的 行 动 时 机 。", DIA_Fester_TogetherNOW_NOW);
	};
};

func void DIA_Fester_TogetherNOW_Now()
{
	AI_Output(other, self, "DIA_Fester_TogetherNOW_Now_15_00"); //现 在 是 最 好 的 行 动 时 机 。
	AI_Output(self, other, "DIA_Fester_TogetherNOW_Now_08_01"); //很 好 ， 那 么 ， 我 们 来 看 看 你 弄 到 了 什 么 。

	Npc_ExchangeRoutine(self, "GUIDE");

	Fester_Losgeh_Day = B_GetDayPlus();

	MIS_Fester_KillBugs = LOG_RUNNING;

	Log_CreateTopic(TOPIC_FesterRauber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FesterRauber, LOG_RUNNING);
	B_LogEntry(TOPIC_FesterRauber, TOPIC_FesterRauber_1);

	Info_ClearChoices(DIA_Fester_TogetherNOW);
	AI_StopProcessInfos(self);
};

func void DIA_Fester_TogetherNOW_Later()
{
	AI_Output(other, self, "DIA_Fester_TogetherNOW_Later_15_00"); //好 吧 ， 我 们 再 等 等 … …
	AI_Output(self, other, "DIA_Fester_TogetherNOW_Later_08_01"); //你 知 道 能 在 哪 里 找 到 我 … …
	Info_ClearChoices(DIA_Fester_TogetherNOW);
};

// ************************************************************
// 			  				InCave
// ************************************************************
instance DIA_Fester_InCave(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 7;
	condition		= DIA_Fester_InCave_Condition;
	information		= DIA_Fester_InCave_Info;
	important		= TRUE;
};

func int DIA_Fester_InCave_Condition()
{
	if ((MIS_Fester_KillBugs == LOG_RUNNING)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LastFightComment] = TRUE; // NEWS darf nicht kommen!

		return TRUE;
	};
};

func void DIA_Fester_InCave_Info()
{
	if (Wld_GetDay() > Fester_Losgeh_Day)
	{
		AI_Output(self, other, "DIA_Fester_InCave_08_00"); //你 究 竟 去 了 哪 里 ？
	}
	else // zeitlich passend
	{
		AI_Output(self, other, "DIA_Fester_InCave_08_01"); //那 么 说 它 们 把 那 些 死 了 的 农 民 拖 到 这 里 。 真 恶 心 。
	};

	AI_Output(self, other, "DIA_Fester_InCave_08_02"); //现 在 ， 这 些 丑 陋 的 东 西 应 该 全 被 消 灭 。
	AI_Output(self, other, "DIA_Fester_InCave_08_03"); //我 们 回 去 ！

	Npc_ExchangeRoutine(self, "START");

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				WasMitAbmachung?
// ************************************************************
instance DIA_Fester_WasMitAbmachung(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 8;
	condition		= DIA_Fester_WasMitAbmachung_Condition;
	information		= DIA_Fester_WasMitAbmachung_Info;
	description		= "那 我 们 的 协 议 呢 ？";
};

func int DIA_Fester_WasMitAbmachung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fester_InCave))
	{
		return TRUE;
	};
};

func void DIA_Fester_WasMitAbmachung_Info()
{
	AI_Output(other, self, "DIA_Fester_WasMitAbmachung_15_00"); //那 我 们 的 协 议 呢 ？
	if (Festers_Giant_Bug_Killed == 0)
	{
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_01"); //你 在 开 玩 笑 ？ 你 还 什 么 事 都 没 做 。
	}
	else if (Fester_Choice == FC_Join)
	{
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_02"); //嗯 ， 我 可 以 帮 你 加 入 我 们 ， 但 是 ， 我 不 会 这 么 做 。
		AI_Output(other, self, "DIA_Fester_WasMitAbmachung_15_03"); //那 为 什 么 不 呢 ？
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_04"); //如 果 我 告 诉 所 有 的 人 说 你 帮 了 我 ， 他 们 又 会 给 我 找 另 一 个 差 使 。
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_05"); //你 知 道 我 不 想 那 样 ， 是 吧 ？
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_06"); //好 吧 ， 祝 你 好 运 ， 孩 子 。 我 敢 肯 定 你 会 找 到 其 它 的 人 帮 助 你 。
	}
	else // FC_Gold
	{
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_07"); //嘿 - 你 想 利 用 我 的 地 位 。 现 在 我 要 先 小 小 的 利 用 一 下 你 。
		AI_Output(self, other, "DIA_Fester_WasMitAbmachung_08_08"); //不 过 ， 看 看 好 的 一 面 ： 你 有 了 学 习 经 验 。 那 也 很 好 ， 不 是 吗 ？
	};

	MIS_Fester_KillBugs = LOG_OBSOLETE;

	// Bugs inserten, die wegen ihm raus waren
	Wld_InsertNpc(Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(Giant_Bug, "NW_BIGFARM01_RIGHTFIELD_02_MONSTER");

	Wld_InsertNpc(Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(Giant_Bug, "NW_BIGMILL_FIELD_MONSTER_04");
};

// ************************************************************
// 			  			PERMPruegel
// ************************************************************
var int Fester_Duell_Day;
var int Fester_FightVerarscht;
var int Fester_FightSylvio;
instance DIA_Fester_PERMPruegel(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 9;
	condition		= DIA_Fester_PERMPruegel_Condition;
	information		= DIA_Fester_PERMPruegel_Info;
	permanent		= TRUE;
	description		= "我 想 你 的 皮 毛 可 以 用 另 外 一 种 方 法 鞣 制 。";
};

func int DIA_Fester_PERMPruegel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fester_WasMitAbmachung))
	|| (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO))
	|| (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fester_PERMPruegel_Info()
{
	AI_Output(other, self, "DIA_Fester_PERMPruegel_15_00"); //我 想 你 的 皮 毛 可 以 用 另 外 一 种 方 法 鞣 制 。

	if (Fester_Duell_Day < Wld_GetDay())
	{
		var int random;
		random = Hlp_Random(11);

		CreateInvItems(self, itmi_gold, random);

		Fester_Duell_Day = Wld_GetDay();
	};

	if ((Npc_KnowsInfo(other, DIA_Fester_WasMitAbmachung))
	&& (Fester_FightVerarscht == FALSE))
	{
		AI_Output(other, self, "DIA_Fester_PERMPruegel_15_01"); //我 可 不 想 被 别 人 愚 弄 ！
		AI_Output(self, other, "DIA_Fester_PERMPruegel_08_02"); //我 发 抖 了 ， 我 发 抖 了 。
		Fester_FightVerarscht = TRUE;
	}
	else if (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO))
	{
		AI_Output(other, self, "DIA_Fester_PERMPruegel_15_03"); //结 交 席 尔 维 欧 可 不 是 什 么 好 主 意 。
		AI_Output(self, other, "DIA_Fester_PERMPruegel_08_04"); //你 是 李 的 一 个 马 屁 精 ， 是 吗 ？ 你 找 错 了 人 ！
		Fester_FightSylvio = TRUE;
	}
	else
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, other, "DIA_Fester_PERMPruegel_08_05"); //现 在 你 究 竟 想 从 我 这 里 得 到 什 么 ？
			AI_Output(other, self, "DIA_Fester_PERMPruegel_15_06"); //我 只 喜 欢 看 着 你 吃 泥 巴 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Fester_PERMPruegel_08_07"); //你 就 是 弄 不 明 白 ， 是 吗 ？
		};
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fester_PICKPOCKET(C_INFO)
{
	npc				= Sld_816_Fester;
	nr				= 900;
	condition		= DIA_Fester_PICKPOCKET_Condition;
	information		= DIA_Fester_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Fester_PICKPOCKET_Condition()
{
	C_Beklauen(27, 45);
};

func void DIA_Fester_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
	Info_AddChoice(DIA_Fester_PICKPOCKET, DIALOG_BACK, DIA_Fester_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fester_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fester_PICKPOCKET_DoIt);
};

func void DIA_Fester_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};

func void DIA_Fester_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fester_PICKPOCKET);
};
