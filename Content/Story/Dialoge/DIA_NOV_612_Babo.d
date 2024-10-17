//***********************************************************************
//	Info EXIT
//***********************************************************************
instance DIA_Babo_Kap1_EXIT(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 999;
	condition		= DIA_Babo_Kap1_EXIT_Condition;
	information		= DIA_Babo_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babo_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//***********************************************************************
//	Info Hello
//***********************************************************************
instance DIA_Babo_Hello(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 2;
	condition		= DIA_Babo_Hello_Condition;
	information		= DIA_Babo_Hello_Info;
	important		= TRUE;
};

func int DIA_Babo_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Hello_Info()
{
	AI_Output(self, other, "DIA_Babo_Hello_03_00"); //（ 害 羞 的 ） 你 好 ， 你 也 是 新 来 的 ， 不 是 吗 ？
	AI_Output(other, self, "DIA_Babo_Hello_15_01"); //是 的 。 你 在 这 里 多 久 了 ？
	AI_Output(self, other, "DIA_Babo_Hello_03_02"); //我 已 经 来 这 里 四 星 期 了 。 你 已 经 拿 到 战 杖 了 吗 ？
	AI_Output(other, self, "DIA_Babo_Hello_15_03"); //现 在 还 没 有 。
	AI_Output(self, other, "DIA_Babo_Hello_03_04"); //那 给 你 这 个 。 我 们 新 信 徒 都 带 着 战 杖 ， 作 为 他 们 自 保 能 力 的 象 征 。 你 能 战 斗 吗 ？
	AI_Output(other, self, "DIA_Babo_Hello_15_05"); //嗯 ， 我 能 使 用 一 些 武 器 … …
	AI_Output(self, other, "DIA_Babo_Hello_03_06"); //如 果 你 想 要 的 话 ， 我 能 教 你 一 些 东 西 。 然 而 ， 我 有 一 个 请 求 … …

	B_GiveInvItems(self, other, ITMW_1h_NOV_Mace, 1);
	AI_EquipBestMeleeWeapon(self);
};

//***********************************************************************
//	Info Anliegen
//***********************************************************************
instance DIA_Babo_Anliegen(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 2;
	condition		= DIA_Babo_Anliegen_Condition;
	information		= DIA_Babo_Anliegen_Info;
	description		= "那 会 是 什 么 要 求 ？";
};

func int DIA_Babo_Anliegen_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (Npc_KnowsInfo(other, DIA_Babo_Hello)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Anliegen_Info()
{
	AI_Output(other, self, "DIA_Babo_Anliegen_15_00"); //那 会 是 什 么 要 求 ？
	AI_Output(self, other, "DIA_Babo_Anliegen_03_01"); //嗯 ， 有 一 个 圣 骑 士 ， 瑟 吉 欧 ， 现 在 这 在 修 道 院 里 。
	AI_Output(self, other, "DIA_Babo_Anliegen_03_02"); //如 果 你 能 说 服 他 帮 我 做 一 些 练 习 的 话 ， 那 我 就 训 练 你 。
	AI_Output(other, self, "DIA_Babo_Anliegen_15_03"); //我 会 去 看 看 我 能 做 什 么 。

	Log_CreateTopic(Topic_BaboTrain, LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboTrain, LOG_RUNNING);
	B_LogEntry(Topic_BaboTrain, Topic_BaboTrain_2);
};

//***********************************************************************
//	Info Sergio
//***********************************************************************
instance DIA_Babo_Sergio(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 2;
	condition		= DIA_Babo_Sergio_Condition;
	information		= DIA_Babo_Sergio_Info;
	description		= "我 已 经 同 瑟 吉 欧 谈 过 了 。";
};

func int DIA_Babo_Sergio_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sergio_Babo)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_Sergio_Info()
{
	AI_Output(other, self, "DIA_Babo_Sergio_15_00"); //我 已 经 同 瑟 吉 欧 谈 过 了 。 他 将 在 每 天 早 晨 和 你 一 起 训 练 两 个 小 时 ， 从 五 点 开 始 。
	AI_Output(self, other, "DIA_Babo_Sergio_03_01"); //谢 谢 ！ 对 我 是 多 大 的 荣 幸 啊 ！
	AI_Output(self, other, "DIA_Babo_Sergio_03_02"); //如 果 你 想 要 的 话 ， 我 可 以 教 你 一 些 战 斗 的 秘 诀 。

	Babo_TeachPlayer = TRUE;
	Babo_Training = TRUE;
	B_GivePlayerXP((XP_Ambient) * 2);

	Log_CreateTopic(Topic_KlosterTeacher, LOG_NOTE);
	B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_3);
};

//***************************************************************************************
//			Ich will trainieren
//***************************************************************************************
instance DIA_Babo_Teach(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 100;
	condition		= DIA_Babo_Teach_Condition;
	information		= DIA_Babo_Teach_Info;
	permanent		= TRUE;
	description		= "我 已 经 做 好 训 练 的 准 备 了 。";
};

// ----------------------------------
var int DIA_Babo_Teach_permanent;
var int Babo_Labercount;
// ----------------------------------
func int DIA_Babo_Teach_Condition()
{
	if (((Babo_TeachPlayer == TRUE)
	&& (DIA_Babo_Teach_permanent == FALSE))
	|| (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

// -------------------------------
var int babo_merk2h;
// -------------------------------
func void DIA_Babo_Teach_Info()
{
	babo_merk2h = other.HitChance [NPC_TALENT_2H];

	AI_Output(other, self, "DIA_Babo_Teach_15_00"); //我 已 经 做 好 训 练 的 准 备 了 。

	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach, DIALOG_BACK, DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self, other, "DIA_DIA_Babo_Teach_Back_03_00"); //你 已 经 学 会 了 我 所 能 教 你 的 所 有 关 于 双 手 战 斗 的 技 巧 。

		DIA_Babo_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Babo_Teach);
};

func void DIA_Babo_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 75);

	if (other.HitChance [NPC_TALENT_2H] > babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_03_00"); //为 了英 诺 斯 而 战 。英 诺 斯 是 我 们 的 生 命 - 你 的 信 仰 给 了 你 力 量 。
		};

		if (Babo_Labercount == 1)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_03_01"); //英 诺 斯 的 仆 人 永 远 不 会 激 怒 对 手 - 他 让 对 手 惊 奇 ！
		};

		if (Babo_Labercount == 2)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_03_02"); //无 论 你 走 到 哪 里 - 要 永 远 带 着 你 的 战 杖 。
		};

		if (Babo_Labercount == 3)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_03_03"); //英 诺 斯 的 仆 人 随 时 准 备 战 斗 。 如 果 你 没 有 魔 法 的 话 ， 战 杖 就 是 你 最 重 要 的 防 御 。
		};

		Babo_Labercount = Babo_Labercount + 1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};

	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach, DIALOG_BACK, DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Babo_Teach_2H_5);
};

func void DIA_Babo_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 75);

	if (other.HitChance [NPC_TALENT_2H] > babo_merk2h)
	{
		if (Babo_Labercount == 0)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_2H_5_03_00"); //英 诺 斯 的 仆 人 不 仅 仅 使 用 他 的 战 杖 战 斗 ， 还 要 用 他 的 心 。
		};

		if (Babo_Labercount == 1)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_2H_5_03_01"); //你 必 须 知 道 要 点 取 决 于 你 能 够 安 全 撤 退 。
		};

		if (Babo_Labercount == 2)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_2H_5_03_02"); //记 住 ， 如 果 你 能 控 制 你 的 对 手 ， 并 且 不 给 他 机 会 让 他 自 控 的 话 ， 你 的 战 斗 技 巧 就 非 常 好 了 。
		};

		if (Babo_Labercount == 3)
		{
			AI_Output(self, other, "DIA_DIA_Babo_Teach_2H_5_03_03"); //当 你 放 弃 时 ， 你 只 有 失 败 。
		};

		Babo_Labercount = Babo_Labercount + 1;
		if (Babo_Labercount >= 3)
		{
			Babo_Labercount = 0;
		};
	};

	Info_ClearChoices(DIA_Babo_Teach);
	Info_AddChoice(DIA_Babo_Teach, DIALOG_BACK, DIA_Babo_Teach_Back);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Babo_Teach_2H_1);
	Info_AddChoice(DIA_Babo_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Babo_Teach_2H_5);
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Babo_Wurst(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 2;
	condition		= DIA_Babo_Wurst_Condition;
	information		= DIA_Babo_Wurst_Info;
	description		= "给 ， 拿 一 根 香 肠 。";
};

func int DIA_Babo_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Babo_Wurst_Info()
{
	AI_Output(other, self, "DIA_Babo_Wurst_15_00"); //给 ， 拿 一 根 香 肠 。
	AI_Output(self, other, "DIA_Babo_Wurst_03_01"); //哦 ， 羊 肉 香 肠 ， 棒 极 了 ！ 它 们 的 味 道 好 极 了 - 来 吧 ， 再 给 我 一 根 香 肠 ！
	AI_Output(other, self, "DIA_Babo_Wurst_15_02"); //那 样 我 剩 下 的 就 不 够 给 别 人 了 。
	AI_Output(self, other, "DIA_Babo_Wurst_03_03"); //但 是 你 还 有 一 根 多 出 来 的 香 肠 。 也 就 是 说 ， 给 你 自 己 留 的 。 那 么 和 朋 友 分 享 香 肠 如 何 ？
	AI_Output(self, other, "DIA_Babo_Wurst_03_04"); //来 吧 ， 我 可 以 给 你 一 个 ‘ 火 箭 ’ 魔 法 卷 轴 交 换 它 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

	Info_ClearChoices(DIA_Babo_Wurst);
	Info_AddChoice(DIA_Babo_Wurst, "好 吧 ， 给 ， 再 拿 一 根 。", DIA_Babo_Wurst_JA);
	Info_AddChoice(DIA_Babo_Wurst, "不 ， 我 不 能 那 么 做 。 ", DIA_Babo_Wurst_NEIN);
};

func void DIA_Babo_Wurst_JA()
{
	AI_Output(other, self, "DIA_Babo_Wurst_JA_15_00"); //好 吧 ， 给 ， 再 拿 一 根 。
	AI_Output(self, other, "DIA_Babo_Wurst_JA_03_01"); //好 吧 。 给 你 魔 法 卷 轴 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	B_GiveInvItems(self, other, ItSC_Firebolt, 1);

	Info_ClearChoices(DIA_Babo_Wurst);
};

func void DIA_Babo_Wurst_NEIN()
{
	AI_Output(other, self, "DIA_Babo_Wurst_NEIN_15_00"); //不 ， 我 不 能 那 么 做 。
	AI_Output(self, other, "DIA_Babo_Wurst_NEIN_03_01"); //老 兄 ， 你 是 那 种 对 什 么 事 都 挑 剔 的 人 ， 嗯 ？
	Info_ClearChoices(DIA_Babo_Wurst);
};

//***********************************************************************
//	Was ist zwischen dir und Agon passiert?
//***********************************************************************
instance DIA_Babo_YouAndAgon(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 3;
	condition		= DIA_Babo_YouAndAgon_Condition;
	information		= DIA_Babo_YouAndAgon_Info;
	description		= "你 和 阿 岗 之 间 发 生 了 什 么 事 ？";
};

func int DIA_Babo_YouAndAgon_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Opolos_Monastery)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_YouAndAgon_Info()
{
	AI_Output(other, self, "DIA_Babo_YouAndAgon_15_00"); //你 和 阿 岗 之 间 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Babo_YouAndAgon_03_01"); //哦 ， 我 们 对 于 如 何 照 管 火 荨 麻 有 些 意 见 不 合 。
	AI_Output(self, other, "DIA_Babo_YouAndAgon_03_02"); //阿 岗 浇 水 太 多 了 ， 所 以 那 些 植 物 的 根 立 刻 就 烂 掉 了 。
	AI_Output(self, other, "DIA_Babo_YouAndAgon_03_03"); //在 根 全 部 烂 掉 以 后 ， 他 诬 陷 我 。
	AI_Output(self, other, "DIA_Babo_YouAndAgon_03_04"); //从 那 时 起 ， 他 们 就 让 我 打 扫 庭 院 。
};

//***********************************************************************
//	Warum hat Agon das getan?
//***********************************************************************
instance DIA_Babo_WhyDidAgon(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 4;
	condition		= DIA_Babo_WhyDidAgon_Condition;
	information		= DIA_Babo_WhyDidAgon_Info;
	description		= "为 什 么 阿 岗 要 那 么 做 ？";
};

func int DIA_Babo_WhyDidAgon_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_WhyDidAgon_Info()
{
	AI_Output(other, self, "DIA_Babo_WhyDidAgon_15_00"); //为 什 么 阿 岗 要 那 么 做 ？
	AI_Output(self, other, "DIA_Babo_WhyDidAgon_03_01"); //你 必 须 去 问 他 。 我 想 ， 他 只 是 不 能 容 忍 有 人 比 他 强 。
};

//***********************************************************************
//	Du hast wohl Ahnung von Pflanzen?
//***********************************************************************
instance DIA_Babo_PlantLore(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 5;
	condition		= DIA_Babo_PlantLore_Condition;
	information		= DIA_Babo_PlantLore_Info;
	description		= "你 似 乎 对 那 个 计 划 略 知 一 二 ？";
};

func int DIA_Babo_PlantLore_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Babo_YouAndAgon))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Babo_PlantLore_Info()
{
	AI_Output(other, self, "DIA_Babo_PlantLore_15_00"); //你 似 乎 对 那 个 计 划 略 知 一 二 ？
	AI_Output(self, other, "DIA_Babo_PlantLore_03_01"); //我 们 有 一 个 草 药 园 ， 我 在 那 里 跟 我 的 爷 爷 学 会 了 一 些 窍 门 。
	AI_Output(self, other, "DIA_Babo_PlantLore_03_02"); //我 很 想 重 新 回 花 园 工 作 。

	MIS_HelpBabo = LOG_RUNNING;
	Log_CreateTopic(Topic_BaboGaertner, LOG_MISSION);
	Log_SetTopicStatus(Topic_BaboGaertner, LOG_RUNNING);
	B_LogEntry(Topic_BaboGaertner, Topic_BaboGaertner_1);
};

//***********************************************************************
//	Fegen
//***********************************************************************
instance DIA_Babo_Fegen(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 2;
	condition		= DIA_Babo_Fegen_Condition;
	information		= DIA_Babo_Fegen_Info;
	description		= "我 应 该 去 打 扫 新 信 徒 的 房 间 。";
};

func int DIA_Babo_Fegen_Condition()
{
	if (MIS_ParlanFegen == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Babo_Fegen_Info()
{
	AI_Output(other, self, "DIA_Babo_Fegen_15_00"); //我 应 该 去 打 扫 新 信 徒 的 房 间 。
	AI_Output(self, other, "DIA_Babo_Fegen_03_01"); //你 的 工 作 负 担 非 常 重 。 你 知 道 吗 - 我 要 帮 助 你 。 你 一 个 人 永 远 无 法 完 成 那 些 工 作 。
	AI_Output(self, other, "DIA_Babo_Fegen_03_02"); //但 是 我 非 常 需 要 一 个 ‘ 风 之 拳 ’ 魔 法 卷 轴 - 你 知 道 吗 ， 我 很 幸 运 地 在 一 本 书 中 知 道 了 它 。
	AI_Output(self, other, "DIA_Babo_Fegen_03_03"); //现 在 ， 很 自 然 ， 我 想 试 试 那 个 魔 法 。 所 以 ， 给 我 那 种 魔 法 卷 轴 ， 我 就 会 帮 助 你 。

	B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_2);
};

//***********************************************************************
//	Windfaust abgeben
//***********************************************************************
instance DIA_Babo_Windfaust(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 3;
	condition		= DIA_Babo_Windfaust_Condition;
	information		= DIA_Babo_Windfaust_Info;
	permanent		= TRUE;
	description		= "关 于 魔 法 卷 轴 … … （ 交 出 风 之 拳 ）";
};

// ---------------------------------
var int DIA_Babo_Windfaust_permanent;
// ---------------------------------
func int DIA_Babo_Windfaust_Condition()
{
	if ((MIS_ParlanFegen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Babo_Fegen))
	&& (DIA_Babo_Windfaust_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babo_Windfaust_Info()
{
	AI_Output(other, self, "DIA_Babo_Windfaust_15_00"); //关 于 魔 法 卷 轴 … …
	AI_Output(self, other, "DIA_Babo_Windfaust_03_01"); //你 给 我 找 到 了 风 之 拳 魔 法 吗 ？

	if (B_GiveInvItems(other, self, ItSc_Windfist, 1))
	{
		AI_Output(other, self, "DIA_Babo_Windfaust_15_02"); //这 是 你 想 要 的 魔 法 卷 轴 。
		AI_Output(self, other, "DIA_Babo_Windfaust_03_03"); //那 太 好 了 。 那 么 我 将 会 帮 助 你 清 理 房 间 。

		NOV_Helfer = (NOV_Helfer + 1);
		DIA_Babo_Windfaust_permanent = TRUE;
		B_GivePlayerXP(XP_Feger);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FEGEN");

		B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_3);
	}
	else
	{
		AI_Output(other, self, "DIA_Babo_Windfaust_15_04"); //不 ， 现 在 还 没 有 。
		AI_Output(self, other, "DIA_Babo_Windfaust_03_05"); //那 我 等 你 成 功 。
	};

	AI_StopProcessInfos(self);
};

//***********************************************************************
//	 Wie ist das Leben hier im Kloster?
//***********************************************************************
instance DIA_Babo_Life(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 10;
	condition		= DIA_Babo_Life_Condition;
	information		= DIA_Babo_Life_Info;
	permanent		= TRUE;
	description		= "在 修 道 院 这 里 的 生 活 是 怎 样 的 ？";
};

func int DIA_Babo_Life_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Babo_Life_Info()
{
	AI_Output(other, self, "DIA_Babo_Life_15_00"); //在 修 道 院 这 里 的 生 活 是 怎 样 的 ？
	AI_Output(self, other, "DIA_Babo_Life_03_01"); //我 不 是 想 要 抱 怨 ， 但 是 我 从 来 没 想 过 这 里 会 这 么 严 格 。 如 果 你 不 遵 守 规 则 ， 他 们 就 惩 罚 你 。
	AI_Output(self, other, "DIA_Babo_Life_03_02"); //当 然 ， 很 多 新 信 徒 想 要 在 图 书 馆 里 学 习 英 诺 斯 的 教 义 ， 所 以 如 果 他 们 被 选 中 后 ， 就 可 以 作 好 准 备 了 。
	AI_Output(self, other, "DIA_Babo_Life_03_03"); //不 过 我 想 ， 参 加 魔 法 测 试 最 好 的 准 备 就 是 履 行 我 们 的 职 责 。

	if (Npc_KnowsInfo(other, DIA_Igaranz_Choosen) == FALSE)
	{
		AI_Output(other, self, "DIA_Babo_Life_15_04"); //‘ 被 选 中 ’ 和 ‘ 测 试 ’ 是 怎 么 安 排 的 ？
		AI_Output(self, other, "DIA_Babo_Life_03_05"); //去 和 伊 加 莱 兹 兄 弟 谈 谈 。 他 对 那 个 了 解 更 多 。
	};
};

//*********************************************************************
//		Sc hat Babo den Gärtnerposten verschafft (Kap. 2)
//*********************************************************************
instance DIA_Babo_HowIsIt(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 1;
	condition		= DIA_Babo_HowIsIt_Condition;
	information		= DIA_Babo_HowIsIt_Info;
	permanent		= TRUE;
	description		= "事 情 怎 么 样 了 ？";
};

func int DIA_Babo_HowIsIt_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

// --------------------
var int Babo_XPgiven;
// --------------------
func void DIA_Babo_HowIsIt_Info()
{
	AI_Output(other, self, "DIA_Babo_HowIsIt_15_00"); //你 好 吗 ？

	if (MIS_HelpBabo == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Babo_HowIsIt_03_01"); //（ 谦 逊 的 ） 我 感 谢 魔 法 师 给 我 的 任 务。
		AI_Output(self, other, "DIA_Babo_HowIsIt_03_02"); //我 喜 欢 在 花 园 工 作 ， 并 希 望 魔 法 师 对 我 感 到 满 意 ， 大 师 。

		if (Babo_XPgiven == FALSE)
		{
			B_GivePlayerXP(XP_Ambient);
			Babo_XPgiven = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Babo_HowIsIt_03_03"); //（ 吃 惊 的 ） 好 … … 好 … … 好 ， 大 师 。
		AI_Output(self, other, "DIA_Babo_HowIsIt_03_04"); //我 、 我 会 努 力 工 作 ， 不 让 魔 法 师 失 望 。
	};

	AI_StopProcessInfos(self);
};

// ####################################################
// ##
// ## Kapitel 2
// ##
// ####################################################
instance DIA_Babo_Kap2_EXIT(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 999;
	condition		= DIA_Babo_Kap2_EXIT_Condition;
	information		= DIA_Babo_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babo_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ####################################################
// ##
// ## Kapitel 3
// ##
// ####################################################
instance DIA_Babo_Kap3_EXIT(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 999;
	condition		= DIA_Babo_Kap3_EXIT_Condition;
	information		= DIA_Babo_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babo_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//******************************
// hallo!
//******************************
instance DIA_Babo_Kap3_Hello(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 31;
	condition		= DIA_Babo_Kap3_Hello_Condition;
	information		= DIA_Babo_Kap3_Hello_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Babo_Kap3_Hello_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Hello_Info()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Hello_15_00"); //你 在 这 里 做 什 么 ？

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Babo_Kap3_Hello_03_01"); //（ 胆 怯 的 ） 我 要 完 成 交 给 我 的 任 务 ， 让 修 道 院 满 意 。
	}
	else
	{
		AI_Output(self, other, "DIA_Babo_Kap3_Hello_03_02"); //你 不 能 同 你 说 话 。 如 果 我 们 和 陌 生 人 说 话 ， 是 不 会 有 好 处 的 。
	};
};

//*********************************************
//	Kopf hoch!
//*********************************************
instance DIA_Babo_Kap3_KeepTheFaith(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 31;
	condition		= DIA_Babo_Kap3_KeepTheFaith_Condition;
	information		= DIA_Babo_Kap3_KeepTheFaith_Info;
	description		= "你 永 远 也 不 要 失 去 信 仰 。";
};

func int DIA_Babo_Kap3_KeepTheFaith_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Babo_Kap3_Hello))
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_KeepTheFaith_Info()
{
	AI_Output(other, self, "DIA_Babo_Kap3_KeepTheFaith_15_00"); //你 永 远 也 不 要 失 去 信 仰 。
	AI_Output(self, other, "DIA_Babo_Kap3_KeepTheFaith_03_01"); //（ 行 动 中 被 抓 住 ） 不 ， … … 我 是 说 ， 我 永 远 不 会 做 这 样 的 事 。 真 的 ！
	AI_Output(other, self, "DIA_Babo_Kap3_KeepTheFaith_15_02"); //我 们 所 有 人 都 经 常 接 受 严 格 的 测 试 。
	AI_Output(self, other, "DIA_Babo_Kap3_KeepTheFaith_03_03"); //是 的 ， 大 师 。 我 会 永 远 记 住 。 谢 谢 你 。

	B_GivePlayerXP(XP_Ambient);
};

//*********************************************
//	Das klingt aber nicht sehr glücklich.
//*********************************************
instance DIA_Babo_Kap3_Unhappy(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 31;
	condition		= DIA_Babo_Kap3_Unhappy_Condition;
	information		= DIA_Babo_Kap3_Unhappy_Info;
	description		= "那 听 起 来 不 像 是 非 常 高 兴 。";
};

func int DIA_Babo_Kap3_Unhappy_Condition()
{
	if ((Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Babo_Kap3_Hello)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Unhappy_Info()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_15_00"); //那 听 起 来 不 像 是 非 常 高 兴 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_03_01"); //（ 行 动 中 被 抓 住 ） 嗯 … … 我 的 意 思 是 ， 一 切 都 很 好 ， 真 的 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_03_02"); //只 是 … … 哦 ， 我 不 应 该 抱 怨 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "那 就 不 要 再 四 处 抱 怨 。", DIA_Babo_Kap3_Unhappy_Lament);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "嗷 ， 来 吧 ， 你 能 告 诉 我 。", DIA_Babo_Kap3_Unhappy_TellMe);
};

func void DIA_Babo_Kap3_Unhappy_Lament()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Lament_15_00"); //那 就 不 要 再 四 处 抱 怨 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Lament_03_01"); //（ 害 怕 的 ） 我 … … 我 … … 请 不 要 告 诉 魔 法 师 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Lament_03_02"); //我 不 想 再 受 到 惩 罚 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Lament_15_03"); //我 会 考 虑 一 下 的 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_TellMe()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_TellMe_15_00"); //嗷 ， 来 吧 ， 你 能 告 诉 我 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_TellMe_03_01"); //你 真 的 不 会 告 诉 魔 法 师 ？
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_TellMe_15_02"); //我 的 样 子 看 起 来 会 吗 ？
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_TellMe_03_03"); //好 吧 。 我 和 某 个 新 信 徒 之 间 有 矛 盾 。 他 威 胁 我 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_TellMe_15_04"); //说 吧 ， 那 就 说 出 来 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_TellMe_03_05"); //伊 加 莱 兹 ， 就 是 那 个 新 信 徒 ， 找 到 了 我 的 一 些 私 人 文 件 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_TellMe_03_06"); //他 威 胁 我 ， 如 果 我 不 按 照 他 说 的 去 做 的 话 ， 就 要 把 它 们 交 给 魔 法 师 。

	MIS_BabosDocs = LOG_RUNNING;

	Log_CreateTopic(Topic_BabosDocs, LOG_MISSION);
	Log_SetTopicStatus(Topic_BabosDocs, LOG_RUNNING);
	B_LogEntry(Topic_BabosDocs, Topic_BabosDocs_1);

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "我 想 那 是 我 的 个 人 隐 私 。", DIA_Babo_Kap3_Unhappy_Privat);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "你 打 算 对 他 做 什 么 ？", DIA_Babo_Kap3_Unhappy_ShouldDo);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "那 些 是 什 么 样 的 文 档 ？", DIA_Babo_Kap3_Unhappy_Documents);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "也 许 我 可 以 帮 你 。", DIA_Babo_Kap3_Unhappy_CanHelpYou);
};

func void DIA_Babo_Kap3_Unhappy_Privat()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Privat_15_00"); //我 想 那 是 我 的 个 人 隐 私 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Privat_03_01"); //我 明 白 ， 你 不 想 惹 麻 烦 。 那 我 只 能 自 己 解 决 了 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Privat_15_02"); //你 要 设 法 解 决 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_ShouldDo()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_ShouldDo_15_00"); //你 打 算 对 他 做 什 么 ？
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_ShouldDo_03_01"); //我 不 想 谈 论 它 。 无 论 如 何 ， 它 不 会 令 英 诺 斯 感 到 愉 快 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_ShouldDo_03_02"); //我 不 敢 去 想 ， 如 果 它 传 出 去 的 话 会 发 生 什 么 事 。
};

func void DIA_Babo_Kap3_Unhappy_Documents()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Documents_15_00"); //那 些 是 什 么 样 的 文 档 ？
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Documents_03_01"); //（ 不 确 定 ） 那 和 别 人 无 关 。 全 都 是 我 的 事 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Documents_15_02"); //快 点 ， 告 诉 我 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Documents_03_03"); //它 们 是 ， 呃 … … 全 都 是 普 通 的 文 档 。 没 什 么 特 别 的 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Documents_15_04"); //我 不 会 再 多 问 了 。
};

func void DIA_Babo_Kap3_Unhappy_CanHelpYou()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00"); //也 许 我 能 帮 助 你 ？
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01"); //你 要 那 么 做 ？
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02"); //当 然 要 看 情 况 而 定 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03"); //（ 匆 忙 的 ） 当 然 ， 我 会 付 你 钱 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04"); //多 少 ？
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05"); //当 然 ， 我 没 有 那 么 多 钱 ， 但 是 我 会 给 你 一 个 魔 法 卷 轴 。 我 有 一 个 治 疗 魔 法 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "我 宁 愿 离 那 远 点 。", DIA_Babo_Kap3_Unhappy_No);
	Info_AddChoice(DIA_Babo_Kap3_Unhappy, "我 要 看 看 我 能 做 什 么 。", DIA_Babo_Kap3_Unhappy_Yes);
};

func void DIA_Babo_Kap3_Unhappy_No()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_No_15_00"); //我 宁 愿 离 那 远 点 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_No_03_01"); //那 么 我 别 无 选 择 ， 我 只 能 等 了 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

func void DIA_Babo_Kap3_Unhappy_Yes()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Yes_15_00"); //我 会 看 看 能 做 什 么 。
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Yes_03_01"); //（ 快 乐 的 ） 真 的 ， 它 肯 定 有 用 。 它 一 定 会 ！
	AI_Output(self, other, "DIA_Babo_Kap3_Unhappy_Yes_03_02"); //那 么 ， 你 只 需 要 查 明 伊 加 莱 兹 把 那 些 东 西 放 在 哪 里 。 然 后 你 把 它 从 他 那 里 偷 走 ， 一 切 就 都 好 了 。
	AI_Output(other, self, "DIA_Babo_Kap3_Unhappy_Yes_15_03"); //放 松 。 你 现 在 还 是 继 续 ， 我 来 负 责 剩 下 的 。

	Info_ClearChoices(DIA_Babo_Kap3_Unhappy);
};

//********************************
// Ich hab deine Dokumente
//********************************
instance DIA_Babo_Kap3_HaveYourDocs(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 31;
	condition		= DIA_Babo_Kap3_HaveYourDocs_Condition;
	information		= DIA_Babo_Kap3_HaveYourDocs_Info;
	description		= "我 得 到 了 你 的 文 档。";
};

func int DIA_Babo_Kap3_HaveYourDocs_Condition()
{
	if ((MIS_BabosDocs == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_BabosDocs_MIS) >= 1)
	|| ((Npc_HasItems(other, ItWr_BabosPinUp_MIS) >= 1)
	&& (Npc_HasItems(other, ItWr_BabosLetter_MIS) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_Info()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_15_00"); //我 得 到 了 你 的 文 档。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_03_01"); //真 的 ？ 谢 谢 ， 你 救 了 我 。 我 不 知 道 该 怎 么 感 谢 你 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_15_02"); //对 ， 对 ， 马 上 冷 静 下 来 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_03_03"); //（ 惴 惴 不 安 的 ） 它 们 真 的 是 我 的 吗 ？ 你 肯 定 吗 ？ 让 我 看 看 。

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "我 打 算 把 它 们 留 的 久 一 点 。", DIA_Babo_Kap3_HaveYourDocs_KeepThem);

	if (BaboSDocsOpen == TRUE)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "根 据 明 显 的 事 实 ， 价 格 上 涨 了 。", DIA_Babo_Kap3_HaveYourDocs_IWantMore);
	};

	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "给 你 。", DIA_Babo_Kap3_HaveYourDocs_HereTheyAre);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00"); //我 打 算 把 它 们 留 的 久 一 点 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01"); //（ 目 瞪 口 呆 ） 什 么 ！ ？ 那 是 什 么 意 思 ？ 你 有 什 么 打 算 ？

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "只 是 在 开 玩 笑 。", DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "那 是 我 自 己 的 事 。", DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern);

	if (Igaraz_IsPartner == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "伊 加 莱 兹 和 我 是 搭 档 。", DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner);
	};
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00"); //只 是 在 开 玩 笑 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01"); //（ 尖 刻 的 ） 哈 哈 ， 我 不 能 笑 。 那 它 们 在 哪 里 ？
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02"); //在这里。

	if (Npc_HasItems(other, ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other, self, ItWr_BabosDocs_MIS, 1);
	}
	else
	{
		B_GiveInvItems(other, self, ItWr_BabosPinUp_MIS, 1);
		B_GiveInvItems(other, self, ItWr_BabosLetter_MIS, 1);
	};

	B_UseFakeScroll();

	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03"); //我 不 想 冒 犯 你 ， 但 是 我 真 的 对 整 件 事 情 感 到 不 安 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04"); //好 吧 。 那 么 和 你 的 ‘ 文 档 ’ 玩 得 开 心 些 。

	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00"); //那 是 我 自 己 的 事 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01"); //那 些 文 档 属 于 我 。 你 没 有 权 力 留 下 它 们 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02"); //见 你 。

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00"); //伊 加 莱 兹 和 我 现 在 是 搭 档 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01"); //（ 目 瞪 口 呆 ） 什 么 ？ 你 不 能 那 样 做 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02"); //看 样 子 我 能 。 我 会 留 下 那 些 文 档 ， 一 切 还 是 老 样 子 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03"); //我 会 和 伊 加 莱 兹 解 决 财 务 分 成 问 题 。
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04"); //嗯 ， 那 么 照 管 好 那 些 植 物 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05"); //你 是 一 头 猪 。 一 头 可 耻 、 贪 婪 的 猪 。 英 诺 斯 将 会 惩 罚 你 。

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, Dialog_Ende, DIA_Babo_Kap3_HaveYourDocs_End);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "注 意 你 的 语 言 。", DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "你 没 有 什 么 事 情 做 吗 ？", DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo);
};

func void DIA_Babo_Kap3_HaveYourDocs_End()
{
	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00"); //注 意 你 的 语 言 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01"); //我 还 是 很 好 ， 一 如 既 往 。

	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_NothingToDo()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00"); //你 没 有 什 么 事 情 做 吗 ？
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01"); //我 全 明 白 了 ， 但 是 相 信 我 ， 会 有 报 应 的 。

	AI_StopProcessInfos(self);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00"); //根 据 明 显 的 事 实 ， 价 格 上 涨 了 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01"); //你 比 其 它 人 好 不 了 多 少 。 你 要 做 什 么 ？
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02"); //你 得 到 了 什 么 ？
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03"); //我 可 以 给 你121枚 金 币 ， 那 是 我 全 部 的 积 蓄 。

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "那 还 不 够 。", DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough);
	Info_AddChoice(DIA_Babo_Kap3_HaveYourDocs, "同 意 。", DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00"); //那 还 不 够 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01"); //但 是 我 没 有 更 多 的 钱 了 。 如 果 我 事 先 知 道 是 那 种 情 况 的 话 ， 我 永 远 不 会 进 入 修 道 院 。

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00"); //同意
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01"); //这 是 钱 和 魔 法 卷 轴 。

	CreateInvItems(self, ItSc_MediumHeal, 1);
	CreateInvItems(self, ItMi_Gold, 121);
	B_GiveInvItems(self, other, ItSc_MediumHeal, 1);
	B_GiveInvItems(self, other, ItMi_Gold, 121);

	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

func void DIA_Babo_Kap3_HaveYourDocs_HereTheyAre()
{
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00"); //给 你 。

	if (Npc_HasItems(other, ItWr_BabosDocs_MIS) >= 1)
	{
		B_GiveInvItems(other, self, ItWr_BabosDocs_MIS, 1);
	}
	else
	{
		B_GiveInvItems(other, self, ItWr_BabosPinUp_MIS, 1);
		B_GiveInvItems(other, self, ItWr_BabosLetter_MIS, 1);
	};

	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01"); //是 的 ， 他 们 完 成 了 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02"); //你 在 注 意 他 们 ？
	AI_Output(other, self, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03"); //那 有 很 大 分 别 吗 ？
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04"); //不 ， 只 要 我 把 它 们 找 回 来 。
	AI_Output(self, other, "DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05"); //现 在 我 希 望 能 重 新 高 枕 无 忧 。

	CreateInvItems(self, ItSc_MediumHeal, 1);
	B_GiveInvItems(self, other, ItSc_MediumHeal, 1);

	MIS_BabosDocs = LOG_SUCCESS;
	B_GivePlayerXP(XP_BabosDocs);

	Info_ClearChoices(DIA_Babo_Kap3_HaveYourDocs);
};

//*********************************************
//	Bist du zufrieden?
//*********************************************
instance DIA_Babo_Kap3_Perm(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 39;
	condition		= DIA_Babo_Kap3_Perm_Condition;
	information		= DIA_Babo_Kap3_Perm_Info;
	permanent		= TRUE;
	description		= "你 对 你 的 工 作 感 到 满 意 吗 ？";
};

func int DIA_Babo_Kap3_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Babo_Kap3_Hello))
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap3_Perm_Info()
{
	AI_Output(other, self, "DIA_Babo_Kap3_Perm_15_00"); //你 对 你 的 工 作 感 到 满 意 吗 ？
	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Babo_Kap3_Perm_03_01"); //（ 毫 不 让 人 信 服 ） 是 的 ， 当 然 。 我 对 英 诺 斯 智 慧 和 力 量 的 信 仰 给 了 我 力 量 。
		AI_Output(self, other, "DIA_Babo_Kap3_Perm_03_02"); //（ 摆 脱 ） 我 不 想 失 礼 ， 但 是 我 今 天 有 很 多 事 要 做 。
		AI_Output(other, self, "DIA_Babo_Kap3_Perm_15_03"); //你 可 以 继 续 进 行 。
		AI_Output(self, other, "DIA_Babo_Kap3_Perm_03_04"); //（ 放 心 的 ） 谢 谢 。
	}
	else
	{
		AI_Output(self, other, "DIA_Babo_Kap3_Perm_03_05"); //没 事 ， 但 是 我 要 回 去 工 作 ， 否 则 我 今 天 就 别 想 完 成 了 。
		AI_Output(self, other, "DIA_Babo_Kap3_Perm_03_06"); //我 不 想 为 了 完 成 义 务 、 不 惹 麻 烦 而 再 次 工 作 到 深 夜 。
	};

	AI_StopProcessInfos(self);
};

// ####################################################
// ##
// ## Kapitel 4
// ##
// ####################################################
instance DIA_Babo_Kap4_EXIT(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 999;
	condition		= DIA_Babo_Kap4_EXIT_Condition;
	information		= DIA_Babo_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babo_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ####################################################
// ##
// ## Kapitel 5
// ##
// ####################################################
instance DIA_Babo_Kap5_EXIT(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 999;
	condition		= DIA_Babo_Kap5_EXIT_Condition;
	information		= DIA_Babo_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babo_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Babo_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Babo_PICKPOCKET(C_INFO)
{
	npc				= NOV_612_Babo;
	nr				= 900;
	condition		= DIA_Babo_PICKPOCKET_Condition;
	information		= DIA_Babo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Babo_PICKPOCKET_Condition()
{
	C_Beklauen(17, 25);
};

func void DIA_Babo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
	Info_AddChoice(DIA_Babo_PICKPOCKET, DIALOG_BACK, DIA_Babo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Babo_PICKPOCKET_DoIt);
};

func void DIA_Babo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};

func void DIA_Babo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babo_PICKPOCKET);
};
