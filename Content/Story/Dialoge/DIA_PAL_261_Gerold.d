// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Gerold_EXIT(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 999;
	condition		= DIA_Gerold_EXIT_Condition;
	information		= DIA_Gerold_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gerold_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	Wer sitzt im Kerker?
// ************************************************************
instance DIA_Gerold_Hallo(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Hallo_Condition;
	information		= DIA_Gerold_Hallo_Info;
	description		= "你 在 看 守 什 么 ？";
};

func int DIA_Gerold_Hallo_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gerold_Hallo_Info()
{
	AI_Output(other, self, "DIA_Gerold_Hallo_15_00"); //你 在 看 守 什 么 ？
	AI_Output(self, other, "DIA_Gerold_Hallo_12_01"); //囚 犯 们 。
	AI_Output(other, self, "DIA_Gerold_Hallo_15_02"); //那 是 谁 ？
	AI_Output(self, other, "DIA_Gerold_Hallo_12_03"); //几 个 囚 犯 和 雇 佣 兵 戈 恩 。 一 条 大 汉 - 跟 公 牛 一 样 结 实 。
	AI_Output(self, other, "DIA_Gerold_Hallo_12_04"); //他 们 用 了 四 个 人 才 把 他 推 进 囚 室 。
};

// ************************************************************
// 	Kerker
// ************************************************************
instance DIA_Gerold_Jail(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Jail_Condition;
	information		= DIA_Gerold_Jail_Info;
	description		= "你 能 让 我 进 入 地 牢 吗 ？ ";
};

func int DIA_Gerold_Jail_Condition()
{
	if ((Kapitel == 2)
	&& Npc_KnowsInfo(other, DIA_Gerold_Hallo)
	&& (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Jail_Info()
{
	AI_Output(other, self, "DIA_Gerold_Jail_15_00"); //你 能 让 我 进 入 地 牢 吗 ？
	AI_Output(self, other, "DIA_Gerold_Jail_12_01"); //不 。 谁 都 不 能 进 入 地 牢 。 那 适 用 于 每 一 个 人 ， 你 、 米 尔 腾 ， 还 有 其 它 所 有 的 人 。
	AI_Output(self, other, "DIA_Gerold_Jail_12_02"); //这 不 是 什 么 你 想 进 就 进 ， 想 出 就 出 的 酒 馆 。 记 住 这 个 。

	KnowsAboutGorn = TRUE;
};

// ************************************************************
// 	Ausnahme
// ************************************************************
instance DIA_Gerold_Ausnahme(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Ausnahme_Condition;
	information		= DIA_Gerold_Ausnahme_Info;
	description		= "你 能 给 我 破 一 次 例 吗 ？";
};

func int DIA_Gerold_Ausnahme_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Gerold_Jail))
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Ausnahme_Info()
{
	AI_Output(other, self, "DIA_Gerold_Ausnahme_15_00"); //你 能 给 我 破 一 次 例 吗 ？
	AI_Output(self, other, "DIA_Gerold_Ausnahme_12_01"); //不 .
};

// ************************************************************
// 	Gold
// ************************************************************
instance DIA_Gerold_Gold(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Gold_Condition;
	information		= DIA_Gerold_Gold_Info;
	description		= "那 么 如 果 我 付 你 钱 呢 ？";
};

func int DIA_Gerold_Gold_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Gerold_Ausnahme))
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Gold_Info()
{
	AI_Output(other, self, "DIA_Gerold_Gold_15_00"); //那 么 如 果 我 付 你 钱 呢 ？
	AI_Output(self, other, "DIA_Gerold_Gold_12_01"); //… … 嗯 … …
	AI_Output(self, other, "DIA_Gerold_Gold_12_02"); //不 。
};

// ************************************************************
// 	Deal mit Gerold um Brief reinzuschmuggeln
// ************************************************************
instance DIA_Gerold_Deal(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Deal_Condition;
	information		= DIA_Gerold_Deal_Info;
	description		= "我 这 里 有 一 个 字 条 是 给 一 个 犯 人 的 … …";
};

func int DIA_Gerold_Deal_Condition()
{
	if ((MIS_RescueGorn == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_LetterForGorn_MIS) >= 1)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Deal_Info()
{
	AI_Output(other, self, "DIA_Gerold_Deal_15_00"); //我 这 里 有 一 张 便 条 是 给 一 个 囚 犯 的 .你 能 帮 我 交 给 他 吗 ？
	AI_Output(self, other, "DIA_Gerold_Deal_12_01"); //嗯 … … 原 则 上 来 讲 ， 我 不 觉 得 有 什 么 不 可 以 。 那 么 ， 这 封 信 是 捎 给 谁 的 呢 ？
	AI_Output(other, self, "DIA_Gerold_Deal_15_02"); //是 给 戈 恩 的 。
	AI_Output(self, other, "DIA_Gerold_Deal_12_03"); //一 个 非 常 重 要 的 囚 犯 。 我 想 加 隆 德 不 会 同 意 的 。 但 是 ， 如 果 这 对 你 很 重 要 ， 我 们 当 然 可 以 达 成 一 项 协 议 。
	AI_Output(other, self, "DIA_Gerold_Deal_15_04"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Gerold_Deal_12_05"); //我 们 的 食 物 配 给 一 直 在 持 续 下 降 。 我 想 得 到 一 些 象 样 的 食 物 来 做 个 交 换 。
	AI_Output(self, other, "DIA_Gerold_Deal_12_06"); //给 我 弄 点 美 味 的 香 肠 和 一 个 新 鲜 面 包 - 还 要 一 些 甜 蜂 蜜 。
	AI_Output(self, other, "DIA_Gerold_Deal_12_07"); //同 时 还 要 一 瓶 葡 萄 酒 … … 是 的 ， 那 就 行 了 。 你 应 该 能 弄 到 这 些 。 那 么 ， 当 你 有 了 这 些 东 西 后 回 来 找 我 吧 。

	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_1);
};

// ************************************************************
// 	Deal Stuff
// ************************************************************
instance DIA_Gerold_Stuff(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_Stuff_Condition;
	information		= DIA_Gerold_Stuff_Info;
	permanent		= TRUE;
	description		= "我 有 一 些 东 西 给 你 … …";
};

// -----------------------------------
var int DIA_Gerold_Stuff_permanent;
// -----------------------------------
func int DIA_Gerold_Stuff_Condition()
{
	if ((Npc_HasItems(other, ItWr_LetterForGorn_MIS) >= 1)
	&& Npc_KnowsInfo(other, DIA_Gerold_Deal)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Stuff_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Stuff_Info()
{
	AI_Output(other, self, "DIA_Gerold_Stuff_15_00"); //我 已 经 给 你 弄 到 了 一 些 东 西 。 你 想 要 的 食 物 。

	// ------------------HACK für deutliche Anzeige-------------------

	if ((Npc_HasItems(other, ItFo_Honey) >= 1)
	&& (Npc_HasItems(other, ItFo_Bread) >= 1)
	&& (Npc_HasItems(other, ItFo_Wine) >= 1)
	&& (Npc_HasItems(other, ItFo_Sausage) >= 1))
	{
		AI_PrintScreen(PRINT_GIVE_HONEY, -1, 34, FONT_ScreenSmall, 2);
		AI_PrintScreen(PRINT_GIVE_BREAD, -1, 37, FONT_ScreenSmall, 2);
		AI_PrintScreen(PRINT_GIVE_WEIN, -1, 40, FONT_ScreenSmall, 2);
		AI_PrintScreen(PRINT_GIVE_WURST, -1, 43, FONT_ScreenSmall, 2);

		Npc_RemoveInvItems(other, ItFo_Honey, 1);
		Npc_RemoveInvItems(other, ItFo_Bread, 1);
		Npc_RemoveInvItems(other, ItFo_Wine, 1);
		Npc_RemoveInvItems(other, ItFo_Sausage, 1);
		/*
		if (B_GiveInvItems(other, self, ItFo_Honey, 1)
		&& B_GiveInvItems(other, self, ItFo_Bread, 1)
		&& B_GiveInvItems(other, self, ItFo_Wine, 1)
		&& B_GiveInvItems(other, self, ItFo_Sausage, 1))
		{
	*/

			AI_Output(self, other, "DIA_Gerold_Stuff_12_01"); //好 的 ， 给 我 那 些 吃 的 。 你 的 信 呢 ？
			AI_Output(other, self, "DIA_Gerold_Stuff_15_02"); //好 的 ， 给 你 。 记 住 ， 是 给 戈 恩 的 。
			AI_Output(self, other, "DIA_Gerold_Stuff_12_03"); //明 天 再 来 ， 他 那 时 就 已 经 收 到 信 了 。

			B_GiveInvItems(other, self, ItWr_LetterForGorn_MIS, 1);
			DayContactGorn = Wld_GetDay();
			DIA_Gerold_Stuff_permanent = TRUE;

			B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_2);
		}
		else
		{
			AI_Output(self, other, "DIA_Gerold_Stuff_12_04"); //等 你 找 到 了 我 想 要 的 东 西 再 回 来 找 我 。
		};
	};

// ************************************************************
// 	Deal Antwort
// ************************************************************
	instance DIA_Gerold_Antwort(C_INFO)
	{
		npc = PAL_261_Gerold;
		nr = 2;
		condition = DIA_Gerold_Antwort_Condition;
		information = DIA_Gerold_Antwort_Info;
		permanent = TRUE;
		description = "戈 恩 收 到 消 息 了 吗 ？";
};

// -------------------------------------
	var int DIA_Gerold_Antwort_permanent;
// -------------------------------------
func int DIA_Gerold_Antwort_Condition()
{
	if ((DIA_Gerold_Stuff_permanent == TRUE)
	&& (Kapitel == 2)
	&& (DIA_Gerold_Antwort_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Antwort_Info()
{
	AI_Output(other, self, "DIA_Gerold_Antwort_15_00"); //戈 恩 收 到 消 息 了 吗 ？

	if (DayContactGorn < Wld_GetDay())
	{
		AI_Output(self, other, "DIA_Gerold_Antwort_12_01"); //是 的 ， 他 要 我 告 诉 你 他 的 话 ：
		AI_Output(other, self, "DIA_Gerold_Antwort_15_02"); //还 好 吗 ？
		AI_Output(self, other, "DIA_Gerold_Antwort_12_03"); //是 在 南 门 。
		AI_Output(other, self, "DIA_Gerold_Antwort_15_04"); //他 还 说 了 其 它 的 什 么 事 情 吗 ？
		AI_Output(self, other, "DIA_Gerold_Antwort_12_05"); //没 有 。 不 知 道 那 是 什 么 意 思 。 你 知 道 那 是 什 么 意 思 吗 ？
		AI_Output(other, self, "DIA_Gerold_Antwort_15_06"); //也 许 吧 。 但 你 不 该 老 是 想 着 这 件 事 。
		AI_Output(self, other, "DIA_Gerold_Antwort_12_07"); //是 啊 ， 那 样 更 好 。

		GornsTreasure = TRUE;
		DIA_Gerold_Antwort_permanent = TRUE;
		B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_3);
	}
	else
	{
		AI_Output(self, other, "DIA_Gerold_GornsAnswer_12_08"); //不 ， 还 没 。 过 一 会 儿 再 来 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 	Offizielle Freilassung
// ************************************************************
instance DIA_Gerold_SetGornFree(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 2;
	condition		= DIA_Gerold_SetGornFree_Condition;
	information		= DIA_Gerold_SetGornFree_Info;
	description		= "释 放 戈 恩 。";
};

func int DIA_Gerold_SetGornFree_Condition()
{
	if ((Garond_Kerkerauf == TRUE)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Gerold_SetGornFree_Info()
{
	AI_Output(other, self, "DIA_Gerold_SetGornFree_15_00"); //释 放 戈 恩 。 这 是 指 挥 官 加 隆 德 的 命 令 。
	AI_Output(self, other, "DIA_Gerold_SetGornFree_12_01"); //我 已 经 得 到 通 知 了 。 这 是 钥 匙 ， 你 可 以 进 去 了 。

	CreateInvItems(self, ItKe_PrisonKey_MIS, 1);
	B_GiveInvItems(self, other, ItKe_PrisonKey_MIS, 1);
	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_4);
};

// ************************************************************
// 	Perm
// ************************************************************
instance DIA_Gerold_Perm(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 900;
	condition		= DIA_Gerold_Perm_Condition;
	information		= DIA_Gerold_Perm_Info;
	permanent		= TRUE;
	description		= "你 永 远 不 睡 觉 ？";
};

func int DIA_Gerold_Perm_Condition()
{
	if ((Kapitel < 4)
	&& Npc_KnowsInfo(other, DIA_Gerold_Gold))
	{
		return TRUE;
	};
};

func void DIA_Gerold_Perm_Info()
{
	AI_Output(other, self, "DIA_Gerold_Perm_15_00"); //你 永 远 不 睡 觉 ？
	AI_Output(self, other, "DIA_Gerold_Perm_12_01"); //不 。 英 诺 斯 亲 自 赐 予 我 永 远 不 需 睡 眠 的 能 力 。
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
instance DIA_Gerold_KAP4_EXIT(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 999;
	condition		= DIA_Gerold_KAP4_EXIT_Condition;
	information		= DIA_Gerold_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gerold_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesRuhig
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_KAP4_ALLESRUHIG(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 30;
	condition		= DIA_Gerold_KAP4_ALLESRUHIG_Condition;
	information		= DIA_Gerold_KAP4_ALLESRUHIG_Info;
	description		= "都 安 静 了 ？";
};

func int DIA_Gerold_KAP4_ALLESRUHIG_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Info()
{
	AI_Output(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_00"); //都 安 静 了 ？
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_01"); //安 静 ， 是 的 。
	AI_Output(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_15_02"); //但 是 ？
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_03"); //我 的 肚 皮 已 经 贴 着 后 背 了 ， 伙 计 。 加 隆 德 又 减 少 了 食 物 配 给 。
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_12_04"); //如 果 我 不 弄 点 香 喷 喷 的 饭 菜 吞 到 肚 子 里 去 ， 那 我 就 准 备 去 咬 加 隆 德 的 肥 屁 股 了 。

	Info_ClearChoices(DIA_Gerold_KAP4_ALLESRUHIG);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG, "不 关 我 的 事 。", DIA_Gerold_KAP4_ALLESRUHIG_Nein);
	Info_AddChoice(DIA_Gerold_KAP4_ALLESRUHIG, "也 许 我 可 以 给 你 一 些 东 西 。", DIA_Gerold_KAP4_ALLESRUHIG_geben);
};

func void DIA_Gerold_KAP4_ALLESRUHIG_geben()
{
	AI_Output(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00"); //也 许 我 可 以 给 你 一 些 东 西 。
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01"); //你 疯 了 吗 ？ 当 然 不 是 这 里 。 如 果 其 它 人 看 到 了 ， 我 就 会 结 交 一 堆 新 朋 友 ， 你 知 道 我 说 的 是 什 么 意 思 吗.
	if (Wld_IsTime(23, 10, 08, 00) == FALSE)
	{
		AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02"); //当 其 它 的 人 都 睡 着 的 时 候 你 可 以 在 魔 法 师 的 神 殿 里 找 到 我 。
	}
	else
	{
		AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03"); //快 点 ， 在 其 它 人 从 他 们 的 洞 里 钻 出 来 之 前 跟 我 去 魔 法 师 的 神 殿 。 我 可 不 想 等 到 明 天 。
	};

	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04"); //总 之 ， 这 个 时 候 很 少 有 人 会 在 这 座 庙 里 。 我 会 在 那 里 等 你 。
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05"); //但 是 不 要 带 着 干 巴 巴 的 面 包 或 是 一 些 生 肉 块 来 ， 明 白 了 吗 ？

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Food");

	Log_CreateTopic(TOPIC_GeroldGiveFood, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GeroldGiveFood, LOG_RUNNING);
	B_LogEntry(TOPIC_GeroldGiveFood, TOPIC_GeroldGiveFood_1);

	MIS_GeroldGiveFood = LOG_RUNNING;
};

func void DIA_Gerold_KAP4_ALLESRUHIG_Nein()
{
	AI_Output(other, self, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00"); //不 关 我 的 事 。
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01"); //你 能 说 会 道 。 加 隆 德 肯 定 不 会 缩 减 你 的 配 给 。
	AI_Output(self, other, "DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02"); //即 使 他 不 承 认 ， 他 也 是 个 胆 小 的 狗 屁 不 如 的 东 西 ， 而 且 他 认 为 你 是 他 唯 一 的 救 星 。

	AI_StopProcessInfos(self);
};

var int Gerold_FoodCounter;
///////////////////////////////////////////////////////////////////////
//	Info Food
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_FOOD(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 31;
	condition		= DIA_Gerold_FOOD_Condition;
	information		= DIA_Gerold_FOOD_Info;
	important		= TRUE;
};

func int DIA_Gerold_FOOD_Condition()
{
	if ((Npc_GetDistToWP(self, "OC_MAGE_IN") < 500)
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Gerold_MoreFood()
{
	Info_ClearChoices(DIA_Gerold_FOOD);

	if (Gerold_FoodCounter > 8)
	{
		AI_Output(self, other, "DIA_Gerold_MoreFood_12_00"); //够 了 ， 够 了 。 有 了 这 些 我 就 能 舒 服 一 阵 子 了 。
		AI_Output(self, other, "DIA_Gerold_MoreFood_12_01"); //这 是 我 的 金 币 。 反 正 我 在 这 里 用 它 也 买 不 到 任 何 东 西 ， 那 你 就 一 起 拿 着 吧 。
		AI_Output(self, other, "DIA_Gerold_MoreFood_12_02"); //好 吧 ， 在 别 人 看 到 我 们 之 前 ， 我 还 是 先 走 为 好 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
		MIS_GeroldGiveFood = LOG_SUCCESS;
		B_GivePlayerXP(XP_GeroldGiveFood);
		CreateInvItems(self, ItMi_Gold, 450);
		B_GiveInvItems(self, other, ItMi_Gold, 450);
	}
	else
	{
		if (Gerold_FoodCounter == 0)
		{
			Info_AddChoice(DIA_Gerold_FOOD, "我 现 在 什 么 都 没 有 。", DIA_Gerold_FOOD_nichts);
		}
		else
		{
			Info_AddChoice(DIA_Gerold_FOOD, "那 是 我 所 有 的 。", DIA_Gerold_FOOD_kaese_nichtmehr);
			if (Gerold_FoodCounter < 5)
			{
				AI_Output(self, other, "DIA_Gerold_MoreFood_12_03"); //好 吧 ， 给 我 。 你 还 有 吗 ？
			}
			else
			{
				AI_Output(self, other, "DIA_Gerold_MoreFood_12_04"); //是 的 。 还 要 ， 还 要 ！
			};
		};

		if (Npc_HasItems(other, ItFo_FishSoup)
		|| Npc_HasItems(other, ItFo_Stew))
		{
			Info_AddChoice(DIA_Gerold_FOOD, "(交 给 汤 ）", DIA_Gerold_FOOD_Suppe);
		};

		if (Npc_HasItems(other, ItFoMutton))
		{
			Info_AddChoice(DIA_Gerold_FOOD, "（交 给 肉 ）", DIA_Gerold_FOOD_fleisch);
		};

		if (Npc_HasItems(other, ItFo_Bacon))
		{
			Info_AddChoice(DIA_Gerold_FOOD, "（交 给 火 腿 ）", DIA_Gerold_FOOD_schinken);
		};

		if (Npc_HasItems(other, ItFo_Cheese))
		{
			Info_AddChoice(DIA_Gerold_FOOD, "(交 给 奶 酪 ）", DIA_Gerold_FOOD_kaese);
		};

		if (Npc_HasItems(other, ItFo_Sausage))
		{
			Info_AddChoice(DIA_Gerold_FOOD, "(交 给 香 肠 ）", DIA_Gerold_FOOD_Wurst);
		};

		Gerold_FoodCounter = (Gerold_FoodCounter + 1);
	};
};

func void DIA_Gerold_FOOD_Info()
{
	AI_Output(self, other, "DIA_Gerold_FOOD_12_00"); //给 你 。 那 么 ， 这 次 是 什 么 ？ 你 有 什 么 可 以 给 我 吃 的 ？

	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_nichts()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_nichts_15_00"); //我 现 在 什 么 都 没 有 。
	AI_Output(self, other, "DIA_Gerold_FOOD_nichts_12_01"); //首 先 你 是 小 题 大 做 ， 而 现 在 你 又 想 骗 我 ？

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	Npc_ExchangeRoutine(self, "Start");
	MIS_GeroldGiveFood = LOG_FAILED;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Gerold_FOOD_kaese_nichtmehr()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_kaese_nichtmehr_15_00"); //那 是 我 所 有 的 。
	AI_Output(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_01"); //而 且 我 还 得 相 信 它 ？ 好 吧 ， 聊 胜 于 无 。 给 你 一 点 金 子 作 为 交 换 。
	CreateInvItems(self, ItMi_Gold, 50);
	B_GiveInvItems(self, other, ItMi_Gold, 50);
	AI_Output(self, other, "DIA_Gerold_FOOD_kaese_nichtmehr_12_02"); //好 吧 。 我 必 须 回 到 岗 位 上 去 了 。
	AI_StopProcessInfos(self);

	var int XP_GeroldGiveFoodLow;
	var int Teiler;

	if (Gerold_FoodCounter < 4)
	{
		Teiler = 3;
	}
	else
	{
		Teiler = 2;
	};

	XP_GeroldGiveFoodLow = (XP_GeroldGiveFood / Teiler);

	Npc_ExchangeRoutine(self, "Start");
	MIS_GeroldGiveFood = LOG_OBSOLETE;
	B_GivePlayerXP(XP_GeroldGiveFoodLow);
};

func void DIA_Gerold_FOOD_kaese()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_kaese_15_00"); //那 么 ， 一 大 块 多 汁 的 奶 酪 怎 么 样 ？
	B_GiveInvItems(other, self, ItFo_Cheese, 1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Wurst()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_Wurst_15_00"); //一 根 香 肠 ？
	B_GiveInvItems(other, self, ItFo_Sausage, 1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_schinken()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_schinken_15_00"); //我 可 以 给 你 这 块 火 腿 。
	B_GiveInvItems(other, self, ItFo_Bacon, 1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_fleisch()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_fleisch_15_00"); //一 大 块 肉 ？
	B_GiveInvItems(other, self, ItFoMutton, 1);
	DIA_Gerold_MoreFood();
};

func void DIA_Gerold_FOOD_Suppe()
{
	AI_Output(other, self, "DIA_Gerold_FOOD_Suppe_15_00"); //一 份 好 汤 正 合 要 求 ， 你 觉 得 呢 。

	if (B_GiveInvItems(other, self, ItFo_FishSoup, 1))
	{
	}
	else
	{
		B_GiveInvItems(other, self, ItFo_Stew, 1);
	};

	DIA_Gerold_MoreFood();
};

///////////////////////////////////////////////////////////////////////
//	Info perm4
///////////////////////////////////////////////////////////////////////
instance DIA_Gerold_PERM4(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 41;
	condition		= DIA_Gerold_PERM4_Condition;
	information		= DIA_Gerold_PERM4_Info;
	permanent		= TRUE;
	description		= "还 饿 吗 ？";
};

func int DIA_Gerold_PERM4_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gerold_KAP4_ALLESRUHIG))
	{
		return TRUE;
	};
};

func void DIA_Gerold_PERM4_Info()
{
	AI_Output(other, self, "DIA_Gerold_PERM4_15_00"); //还 饿 吗 ？

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Gerold_PERM4_12_01"); //如 果 兽 人 再 次 进 攻 ， 就 是 撑 饱 了 肚 子 也 帮 不 了 我 。
	}
	else if (MIS_GeroldGiveFood == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Gerold_PERM4_12_02"); //那 一 定 是 个 玩 笑 。 我 吃 饱 了 。 再 次 感 谢 。
	}
	else if (MIS_GeroldGiveFood == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Gerold_PERM4_12_03"); //是 的 。 不 管 怎 样 ， 谢 谢 你 的 帮 助 。
	}
	else
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Gerold_PERM4_12_04"); //不 客 气 ， 长 官 。
		}
		else
		{
			AI_Output(self, other, "DIA_Gerold_PERM4_12_05"); //走 开 ！
		};
	};

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
instance DIA_Gerold_KAP5_EXIT(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 999;
	condition		= DIA_Gerold_KAP5_EXIT_Condition;
	information		= DIA_Gerold_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gerold_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP5_EXIT_Info()
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
instance DIA_Gerold_KAP6_EXIT(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 999;
	condition		= DIA_Gerold_KAP6_EXIT_Condition;
	information		= DIA_Gerold_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gerold_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Gerold_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gerold_PICKPOCKET(C_INFO)
{
	npc				= PAL_261_Gerold;
	nr				= 900;
	condition		= DIA_Gerold_PICKPOCKET_Condition;
	information		= DIA_Gerold_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Gerold_PICKPOCKET_Condition()
{
	C_Beklauen(71, 170);
};

func void DIA_Gerold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
	Info_AddChoice(DIA_Gerold_PICKPOCKET, DIALOG_BACK, DIA_Gerold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gerold_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gerold_PICKPOCKET_DoIt);
};

func void DIA_Gerold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};

func void DIA_Gerold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gerold_PICKPOCKET);
};
