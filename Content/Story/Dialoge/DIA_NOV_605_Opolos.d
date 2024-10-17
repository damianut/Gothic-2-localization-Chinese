//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Opolos_Kap1_EXIT(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 999;
	condition		= DIA_Opolos_Kap1_EXIT_Condition;
	information		= DIA_Opolos_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Opolos_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//		Hello
//*********************************************************************
instance DIA_Opolos_Hello(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 1;
	condition		= DIA_Opolos_Hello_Condition;
	information		= DIA_Opolos_Hello_Info;
	important		= TRUE;
};

func int DIA_Opolos_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Hello_Info()
{
	AI_Output(self, other, "DIA_Opolos_Hello_12_00"); //你 好 ， 你 一 定 是 个 新 人 。
	AI_Output(self, other, "DIA_Opolos_Hello_12_01"); //我 是 奥 波 罗 斯 。 我 照 管 这 里 的 绵 羊 。
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Opolos_Wurst(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 2;
	condition		= DIA_Opolos_Wurst_Condition;
	information		= DIA_Opolos_Wurst_Info;
	description		= "我 这 里 有 一 个 羊 肉 香 肠 … …";
};

func int DIA_Opolos_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Wurst_Info()
{
	AI_Output(other, self, "DIA_Opolos_Wurst_15_00"); //我 这 里 有 一 个 羊 肉 香 肠 … …
	AI_Output(self, other, "DIA_Opolos_Wurst_12_01"); //哦 ， 老 兄 ， 太 好 了 ！ 终 于 又 有 了 一 根 美 味 的 羊 肉 香 肠 。!
	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

//*********************************************************************
//		Seit wann bist Du hier?
//*********************************************************************
instance DIA_Opolos_HowLong(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 1;
	condition		= DIA_Opolos_HowLong_Condition;
	information		= DIA_Opolos_HowLong_Info;
	description		= "你 在 修 道 院 多 久 了 ？";
};

func int DIA_Opolos_HowLong_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Opolos_Hello))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowLong_Info()
{
	AI_Output(other, self, "DIA_Opolos_HowLong_15_00"); //你 在 修 道 院 多 久 了 ？
	AI_Output(self, other, "DIA_Opolos_HowLong_12_01"); //我 已 经 到 这 里 三 年 了 。 但 是 到 现 在 为 止 ， 我 还 没 有 开 始 研 究 ， 虽 然 我 很 想 。
	AI_Output(other, self, "DIA_Opolos_HowLong_15_02"); //为 什 么 不 ？
	AI_Output(self, other, "DIA_Opolos_HowLong_12_03"); //我 的 工 作 是 照 看 绵 羊 - 不 是 研 究 铭 文 。
	AI_Output(self, other, "DIA_Opolos_HowLong_12_04"); //而 且 只 要 大 师 帕 兰 没 有 让 我 从 这 个 职 务 中 解 脱 出 来 ， 我 就 不 能 进 图 书 馆 研 究 。

	MIS_HelpOpolos = LOG_RUNNING;
	Log_CreateTopic(Topic_OpolosStudy, LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosStudy, LOG_RUNNING);
	B_LogEntry(Topic_OpolosStudy, Topic_OpolosStudy_1);
};

//*********************************************************************
//		Auf was muss ich hier im Kloster achten?
//*********************************************************************
instance DIA_Opolos_Monastery(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 3;
	condition		= DIA_Opolos_Monastery_Condition;
	information		= DIA_Opolos_Monastery_Info;
	description		= "我 在 修 道 院 该 怎 么 做 ？";
};

func int DIA_Opolos_Monastery_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Opolos_Hello)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Monastery_Info()
{
	AI_Output(other, self, "DIA_Opolos_Monastery_15_00"); //我 在 修 道 院 该 怎 么 做 ？
	AI_Output(self, other, "DIA_Opolos_Monastery_12_01"); //永 远 不 要 向 魔 法 师 说 谎 。 不 要 冒 犯 社 团 里 的 其 它 兄 弟 。
	AI_Output(self, other, "DIA_Opolos_Monastery_12_02"); //尊 重 社 团 的 财 产 。 如 果 你 违 反 了 这 些 规 定 ， 你 将 必 须 接 受 大 师 帕 兰 的 处 罚 。
	AI_Output(self, other, "DIA_Opolos_Monastery_12_03"); //除 了 那 些 以 外 ， 我 只 能 建 议 你 要 小 心 阿 岗 。 如 果 你 不 留 神 的 话 ， 你 就 会 像 白 波 一 样 完 了 。
};

//*********************************************************************
//		Kannst du mir was beibringen?
//*********************************************************************
instance DIA_Opolos_beibringen(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 3;
	condition		= DIA_Opolos_beibringen_Condition;
	information		= DIA_Opolos_beibringen_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Opolos_beibringen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Opolos_Hello)
	&& ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Opolos_beibringen_Info()
{
	AI_Output(other, self, "DIA_Opolos_beibringen_15_00"); //你 还 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Opolos_beibringen_12_01"); //当 然 ， 我 以 前 经 常 打 架 。 我 可 以 教 你 如 何 增 强 你 的 臂 力 。
	AI_Output(self, other, "DIA_Opolos_beibringen_12_02"); //但 是 我 想 学 习 一 些 药 剂 的 知 识 ， 尤 其 是 关 于 魔 法 药 剂 。
	AI_Output(other, self, "DIA_Opolos_beibringen_15_03"); //你 能 帮 我 吗 ？
	AI_Output(self, other, "DIA_Opolos_beibringen_12_04"); //好 ， 如 果 你 为 尼 欧 莱 斯 工 作 的 话 ， 你 当 然 有 机 会 向 他 短 时 间 ‘ 借 ’ 一 张 配 方 。
	AI_Output(self, other, "DIA_Opolos_beibringen_12_05"); //如 果 你 把 它 给 我 带 来 ， 并 让 我 看 一 下 的 话 ， 我 就 训 练 你 。

	Log_CreateTopic(Topic_OpolosRezept, LOG_MISSION);
	Log_SetTopicStatus(Topic_OpolosRezept, LOG_RUNNING);
	B_LogEntry(Topic_OpolosRezept, Topic_OpolosRezept_1);
};

//*********************************************************************
// rezept
//*********************************************************************
instance DIA_Opolos_rezept(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 3;
	condition		= DIA_Opolos_rezept_Condition;
	information		= DIA_Opolos_rezept_Info;
	permanent		= TRUE;
	description		= "关 于 配 方 … …";
};

// -----------------------------------
var int DIA_Opolos_rezept_permanent;
// -----------------------------------
func int DIA_Opolos_rezept_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Opolos_beibringen)
	&& (other.guild == GIL_NOV)
	&& (DIA_Opolos_rezept_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_rezept_Info()
{
	if (Npc_HasItems(other, ItWr_Manarezept) >= 1)
	{
		AI_Output(other, self, "DIA_Opolos_rezept_15_00"); //我 已 经 找 到 了 你 想 要 的 配 方 。
		AI_Output(self, other, "DIA_Opolos_rezept_12_01"); //好 ， 那 让 我 看 一 下 。
		B_UseFakeScroll();
		AI_Output(self, other, "DIA_Opolos_rezept_12_02"); //啊 哈 … … 嗯 … … 对 … … 我 明 白 了 … … 好 ， 好 … …
		B_UseFakeScroll();
		AI_Output(self, other, "DIA_Opolos_rezept_12_03"); //好 ， 多 谢 。 如 果 你 需 要 的 话 ， 可 以 跟 我 来 训 练 。

		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;

		Opolos_Rezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);

		Log_CreateTopic(Topic_KlosterTeacher, LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_1);
	}
	else if (MIS_NEORASRezept == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Opolos_rezept_15_04"); //我 已 经 把 配 方 还 给 尼 欧 莱 斯 了 。
		AI_Output(self, other, "DIA_Opolos_rezept_12_05"); //哦 ， 该 死 - 我 可 能 永 远 也 无 法 在 这 里 研 究 了 。 那 又 怎 么 样 ？ 我 还 是 会 训 练 你 。

		Opolos_Rezept = LOG_FAILED;

		DIA_Opolos_rezept_permanent = TRUE;
		Opolos_TeachSTR = TRUE;

		Log_CreateTopic(Topic_KlosterTeacher, LOG_NOTE);
		B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_1);
	}
	else
	{
		AI_Output(other, self, "DIA_Opolos_rezept_15_06"); //我 以 后 再 回 来。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH_STR
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_TEACH_STR(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 99;
	condition		= DIA_Opolos_TEACH_STR_Condition;
	information		= DIA_Opolos_TEACH_STR_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 强 壮 。";
};

func int DIA_Opolos_TEACH_STR_Condition()
{
	if ((hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV)
	&& (Opolos_TeachSTR == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_TEACH_STR_Info()
{
	AI_Output(other, self, "DIA_Opolos_TEACH_STR_15_00"); //我 想 要 变 得 更 强 壮 。

	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR, DIALOG_BACK, DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self, other, "DIA_Opolos_TEACH_STR_12_00"); //你 现 在 已 经 相 当 强 壮 了 。 我 不 能 再 教 你 什 么 了 。
	};

	Info_ClearChoices(DIA_Opolos_TEACH_STR);
};

func void DIA_Opolos_TEACH_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR, DIALOG_BACK, DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Opolos_TEACH_STR_5);
};

func void DIA_Opolos_TEACH_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Opolos_TEACH_STR);
	Info_AddChoice(DIA_Opolos_TEACH_STR, DIALOG_BACK, DIA_Opolos_TEACH_STR_BACK);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Opolos_TEACH_STR_1);
	Info_AddChoice(DIA_Opolos_TEACH_STR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Opolos_TEACH_STR_5);
};

//*********************************************************************
//		Wer ist Agon?
//*********************************************************************
instance DIA_Opolos_Agon(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 4;
	condition		= DIA_Opolos_Agon_Condition;
	information		= DIA_Opolos_Agon_Info;
	description		= "阿 岗 和 白 波 是 谁 ？";
};

func int DIA_Opolos_Agon_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Opolos_Monastery))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Agon_Info()
{
	AI_Output(other, self, "DIA_Opolos_Agon_15_00"); //阿 岗 和 白 波 是 谁 ？
	AI_Output(self, other, "DIA_Opolos_Agon_12_01"); //阿 岗 负 责 草 药 花 园 。 他 也 是 个 新 信 徒 ， 但 是 他 的 样 子 就 像 他 是 天 选 者 一 样 。
	AI_Output(self, other, "DIA_Opolos_Agon_12_02"); //白 波 比 阿 岗 早 一 些 进 的 修 道 院 ， 起 初 他 在 草 药 花 园 帮 助 阿 岗 。
	AI_Output(self, other, "DIA_Opolos_Agon_12_03"); //但 是 他 们 之 间 一 定 发 生 了 一 些 冲 突 ， 从 那 时 起 ， 白 波 就 负 责 打 扫 庭 院 。
	AI_Output(other, self, "DIA_Opolos_Agon_15_04"); //你 知 道 到 底 发 生 了 什 么 事 吗 ？
	AI_Output(self, other, "DIA_Opolos_Agon_12_05"); //不 知 道 。 你 必 须 要 问 他 们 。 但 是 阿 岗 的 话 比 其 它 新 信 徒 更 有 分 量 ， 因 为 他 是 总 督 的 侄 子 。
};

///////////////////////////////////////////////////////////////////////
//	Info SHEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Opolos_LIESEL(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 2;
	condition		= DIA_Opolos_LIESEL_Condition;
	information		= DIA_Opolos_LIESEL_Info;
	permanent		= TRUE;
	description		= "看 啊 ， 我 带 来 了 贝 斯 蒂";
};

func int DIA_Opolos_LIESEL_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (Liesel_Giveaway == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Opolos_LIESEL_Info()
{
	AI_Output(other, self, "DIA_Opolos_LIESEL_15_00"); //看 啊 ， 我 带 来 了 贝 斯 蒂 。 我 能 把 他 交 给 你 吗 ？

	Npc_PerceiveAll(self);

	if (Wld_DetectNpc(self, Follow_Sheep, NOFUNC, -1)
	&& (Npc_GetDistToNpc(self, other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = ZS_MM_AllScheduler;

		Liesel_Giveaway = TRUE;
		AI_Output(self, hero, "DIA_Opolos_LIESEL_12_01"); //是 的 ， 当 然 。 很 漂 亮 的 动 物 。 我 会 照 顾 好 她 的 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Opolos_Add_15_00"); //嗯 … … 不 知 道 怎 么 回 事 ， 我 好 像 把 它 放 错 地 方 了 。 我 一 会 回 来 。
	};
};

//*********************************************************************
//	Wegen der Biblothek...
//*********************************************************************
instance DIA_Opolos_Biblothek(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 98;
	condition		= DIA_Opolos_Biblothek_Condition;
	information		= DIA_Opolos_Biblothek_Info;
	permanent		= TRUE;
	description		= "关 于 图 书 馆 … …";
};

func int DIA_Opolos_Biblothek_Condition()
{
	if ((other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Opolos_HowLong))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Biblothek_Info()
{
	AI_Output(other, self, "DIA_Opolos_Biblothek_15_00"); //关 于 图 书 馆 … …

	if (Parlan_Erlaubnis == FALSE)
	{
		AI_Output(self, other, "DIA_Opolos_Biblothek_12_01"); //那 是 左 边 锁 住 的 房 间 ， 紧 挨 着 大 门 。
		AI_Output(self, other, "DIA_Opolos_Biblothek_12_02"); //但 是 只 有 当 大 师 帕 兰 认 为 你 可 以 研 究 教 义 时 ， 你 才 能 得 到 钥 匙 。
	}
	else
	{
		AI_Output(self, other, "DIA_Opolos_Biblothek_12_03"); //你 这 幸 运 的 家 伙 ！ 你 拿 到 了 图 书 馆 的 钥 匙 ， 虽 然 你 才 到 这 里 很 短 的 时 间 。
		AI_Output(self, other, "DIA_Opolos_Biblothek_12_04"); //利 用 你 的 机 会 研 究 那 些 古 老 的 铭 文 吧 ！
	};

	AI_StopProcessInfos(self);
};

//*********************************************************************
//		Sc hat Opolos das Studieren ermöglicht (Kap. 2)
//*********************************************************************
instance DIA_Opolos_HelloAgain(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 2;
	condition		= DIA_Opolos_HelloAgain_Condition;
	information		= DIA_Opolos_HelloAgain_Info;
	important		= TRUE;
};

func int DIA_Opolos_HelloAgain_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (MIS_HelpOpolos == LOG_SUCCESS)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Opolos_HelloAgain_Info()
{
	AI_Output(self, other, "DIA_Opolos_HelloAgain_12_00"); //你 好 。 谢 谢 你 帮 助 我 。 我 会 充 分 利 用 这 个 机 会 ， 并 多 多 学 习 。
	AI_Output(self, other, "DIA_Opolos_HelloAgain_12_01"); //不 过 你 现 在 当 然 没 有 时 间 和 一 个 小 小 的 新 信 徒 说 话 ， 大 师 。

	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

//*********************************************************************
//		Sc hat Opolos zum Einkaufen geschickt (Kap. 2)
//*********************************************************************
instance DIA_Opolos_HowIsIt(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 3;
	condition		= DIA_Opolos_HowIsIt_Condition;
	information		= DIA_Opolos_HowIsIt_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Opolos_HowIsIt_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Opolos_HowIsIt_Info()
{
	AI_Output(other, self, "DIA_Opolos_HowIsIt_15_00"); //情 况 怎 么 样 了 ？

	if (MIS_HelpOpolos == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Opolos_HowIsIt_12_01"); //好 极 了 。 自 从 我 获 准 进 行 研 究 之 后 ， 一 切 都 非 常 美 妙 。
	}
	else
	{
		AI_Output(self, other, "DIA_Opolos_HowIsIt_12_02"); //我 忠 实 地 完 成 所 有 交 给 我 的 任 务 ， 大 师 。
		AI_Output(self, other, "DIA_Opolos_HowIsIt_12_03"); //每 一 天 ， 英 诺 斯 都 在 我 面 前 设 置 一 个 新 的 挑 战 。 我 要 继 续 工 作 提 高 自 己 。
	};

	AI_StopProcessInfos(self);
};

// ##########################################
// ##
// ## Kapitel 2
// ##
// ##########################################
instance DIA_Opolos_Kap2_EXIT(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 999;
	condition		= DIA_Opolos_Kap2_EXIT_Condition;
	information		= DIA_Opolos_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Opolos_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##########################################
// ##
// ## Kapitel 3
// ##
// ##########################################
instance DIA_Opolos_Kap3_EXIT(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 999;
	condition		= DIA_Opolos_Kap3_EXIT_Condition;
	information		= DIA_Opolos_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Opolos_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*************************************************************
//	Was amchen die Schafe?
//************************************************************
instance DIA_Opolos_Kap3_PERM(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 39;
	condition		= DIA_Opolos_Kap3_PERM_Condition;
	information		= DIA_Opolos_Kap3_PERM_Info;
	permanent		= TRUE;
	description		= "绵 羊 怎 么 样 了 ？";
};

func int DIA_Opolos_Kap3_PERM_Condition()
{
	if ((Kapitel >= 3)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap3_PERM_Info()
{
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_15_00"); //绵 羊 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_12_01"); //你 觉 得 它 们 怎 么 样 ？ 它 们 站 在 周 围 ， 咀 嚼 着 青 草 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_12_02"); //我 更 想 知 道 外 面 发 生 了 什 么 事 。 魔 法 师 们 似 乎 都 非 常 紧 张 。

	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
	Info_AddChoice(DIA_Opolos_Kap3_PERM, DIALOG_BACK, DIA_Opolos_Kap3_PERM_BACK);
	Info_AddChoice(DIA_Opolos_Kap3_PERM, "在 矿 藏 山 谷 里 面 有 龙 。", DIA_Opolos_Kap3_PERM_DRAGONS);
	Info_AddChoice(DIA_Opolos_Kap3_PERM, "穿 着 黑 袍 的 陌 生 人 在 庭 院 里 徘 徊 。", DIA_Opolos_Kap3_PERM_DMT);

	if (MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Opolos_Kap3_PERM, "比 德 罗 出 卖 了 我 们 。", DIA_Opolos_Kap3_PERM_PEDRO);
	};
};

func void DIA_Opolos_Kap3_PERM_BACK()
{
	Info_ClearChoices(DIA_Opolos_Kap3_PERM);
};

var int Opolos_Dragons;

func void DIA_Opolos_Kap3_PERM_DRAGONS()
{
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DRAGONS_15_00"); //在 矿 藏 山 谷 里 面 有 龙 。 他 们 正 和 兽 人 军 队 一 起 围 攻 皇 家 部 队 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_DRAGONS_12_01"); //龙 - 我 一 直 以 为 他 们 只 存 在 于 恐 怖 小 说 里 。
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DRAGONS_15_02"); //他 们 就 在 那 里 ， 相 信 我 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_DRAGONS_12_03"); //但 是 国 王 的 圣 骑 士 会 去 解 决 他 们 的 ， 不 是 吗 ？
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DRAGONS_15_04"); //马上就知道了。

	if (Opolos_Dragons == FALSE)
	{
		B_GivePlayerXP(XP_AMBIENT);
		Opolos_Dragons = TRUE;
	};
};

var int Opolos_DMT;

func void DIA_Opolos_Kap3_PERM_DMT()
{
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DMT_15_00"); //穿 着 黑 袍 的 陌 生 人 在 庭 院 里 徘 徊 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_DMT_12_01"); //你 说 的 是 什 么 意 思 ？ 什 么 样 的 陌 生 人 ？
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DMT_15_02"); //没 人 知 道 他 们 从 哪 里 来 。 他 们 穿 着 长 长 的 黑 袍 子 ， 并 且 挡 着 他 们 的 脸 。
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_DMT_15_03"); //他 们 看 起 来 像 是 某 种 魔 法 师 ， 至 少 他 们 会 魔 法 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_DMT_12_04"); //那 听 起 来 令 人 非 常 不 安 ， 但 是 我 肯 定 高 级 议 会 将 会 解 决 这 个 问 题 。

	if (Opolos_DMT == FALSE)
	{
		B_GivePlayerXP(XP_AMBIENT);
		Opolos_DMT = TRUE;
	};
};

var int Opolos_Pedro;

func void DIA_Opolos_Kap3_PERM_PEDRO()
{
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_PEDRO_15_00"); //比 德 罗 出 卖 了 我 们 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_PEDRO_12_01"); //我 听 说 了 ， 但 是 我 不 知 道 你 也 在 关 注 它 。 所 以 我 才 没 有 提 起 。
	AI_Output(self, other, "DIA_Opolos_Kap3_PERM_PEDRO_12_02"); //敌 人 比 我 们 强 大 吗 - 我 是 说 ， 我 们 能 打 败 他 吗 ？
	AI_Output(other, self, "DIA_Opolos_Kap3_PERM_PEDRO_15_03"); //我 们 至 少 还 没 死 。

	if (Opolos_Pedro == FALSE)
	{
		B_GivePlayerXP(XP_AMBIENT);
		Opolos_Pedro = TRUE;
	};
};

// ##########################################
// ##
// ## Kapitel 4
// ##
// ##########################################
instance DIA_Opolos_Kap4_EXIT(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 999;
	condition		= DIA_Opolos_Kap4_EXIT_Condition;
	information		= DIA_Opolos_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Opolos_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##########################################
// ##
// ## Kapitel 5
// ##
// ##########################################
instance DIA_Opolos_Kap5_EXIT(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 999;
	condition		= DIA_Opolos_Kap5_EXIT_Condition;
	information		= DIA_Opolos_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Opolos_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Opolos_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Opolos_PICKPOCKET(C_INFO)
{
	npc				= NOV_605_Opolos;
	nr				= 900;
	condition		= DIA_Opolos_PICKPOCKET_Condition;
	information		= DIA_Opolos_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Opolos_PICKPOCKET_Condition()
{
	C_Beklauen(54, 70);
};

func void DIA_Opolos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
	Info_AddChoice(DIA_Opolos_PICKPOCKET, DIALOG_BACK, DIA_Opolos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Opolos_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Opolos_PICKPOCKET_DoIt);
};

func void DIA_Opolos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};

func void DIA_Opolos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Opolos_PICKPOCKET);
};
