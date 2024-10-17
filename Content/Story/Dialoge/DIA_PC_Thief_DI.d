// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_PC_Thief_DI_EXIT(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 999;
	condition		= DIA_PC_Thief_DI_EXIT_Condition;
	information		= DIA_PC_Thief_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PC_Thief_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PC_Thief_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************
instance DIA_PC_Thief_DI_Hallo(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 5;
	condition		= DIA_PC_Thief_DI_Hallo_Condition;
	information		= DIA_PC_Thief_DI_Hallo_Info;
	description		= "我 们 到 了 。";
};

func int DIA_PC_Thief_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_PC_Thief_DI_Hallo_15_00"); //我 们 到 了 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_01"); //这 座 岛 屿 离 克 霍 里 尼 斯 不 象 我 想 象 的 那 么 远 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_02"); //我 不 知 道 这 件 事 。 但 是 现 在 ， 当 然 ， 有 几 件 事 在 我 脑 子 里 慢 慢 变 得 清 晰 了 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_03"); //我 曾 经 常 常 问 自 己 ， 兽 人 的 补 给 品 怎 么 能 总 是 来 得 这 么 快 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_04"); //有 了 这 座 前 哨 ， 这 就 是 小 菜 一 碟 了 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_05"); //当 你 一 路 深 入 这 座 岛 里 面 时 ， 很 有 可 能 会 遇 到 一 两 个 陷 阱 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Hallo_11_06"); //如 果 你 觉 得 被 卡 在 了 某 个 地 方 ， 回 来 找 我 。 也 许 我 的 经 验 能 帮 到 你 。
};

// ************************************************************
// 	  	  RAT
// ************************************************************
instance DIA_PC_Thief_DI_RAT(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 5;
	condition		= DIA_PC_Thief_DI_RAT_Condition;
	information		= DIA_PC_Thief_DI_RAT_Info;
	permanent		= TRUE;
	description		= "我 需 要 你 的 建 议 。";
};

func int DIA_PC_Thief_DI_RAT_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo)))
	{
		return TRUE;
	};
};

var int DIA_PC_Thief_DI_RAT_OneTime;
var int DIA_PC_Thief_DI_RAT_OneTime2;
func void DIA_PC_Thief_DI_RAT_Info()
{
	AI_Output(other, self, "DIA_PC_Thief_DI_RAT_15_00"); //我 需 要 你 的 建 议 。

	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	&& (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other, self, "DIA_PC_Thief_DI_RAT_15_01"); //有 个 兽 人 上 校 的 司 令 部 设 在 那 上 面 。 从 那 里 ， 我 无 法 继 续 深 入 小 岛 内 部 。
		AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_02"); //兽 人 是 狡 猾 的 生 物 。 他 们 经 常 被 人 低 估 。 我 猜 想 他 们 有 一 条 某 种 类 型 的 秘 密 通 道 。 在 墙 上 搜 索 一 下 看 有 没 有 秘 密 机 关 。
		AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_03"); //不 过 要 记 住 ， 常 常 要 按 照 一 定 的 顺 序 去 使 用 机 关 ， 才 能 让 它 发 挥 作 用 。
	}
	else if ((Npc_IsDead(FireDragonIsland))
	&& (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other, self, "DIA_PC_Thief_DI_RAT_15_04"); //我 已 经 跟 一 条 龙 战 斗 过 了 ， 而 现 在 我 遇 到 了 一 个 有 吊 桥 的 深 渊 。 桥 被 拉 起 来 了 ， 因 此 我 没 有 办 法 过 去 。
		AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_05"); //嗯 。 你 试 过 远 射 程 武 器 了 吗 ？ 也 许 击 中 那 个 机 械 装 置 就 能 启 动 它 。
	}
	else if ((Npc_IsDead(Skeleton_Lord_Archol))
	&& ((Npc_KnowsInfo(other, DIA_Schwarzmagier_HELLO)) == FALSE))
	{
		AI_Output(other, self, "DIA_PC_Thief_DI_RAT_15_06"); //我 遇 到 了 一 群 亡 灵 ， 还 有 他 们 复 杂 的 机 关 。
		AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_07"); //对 不 起 ， 我 没 有 跟 亡 灵 打 交 道 的 经 验 。 这 次 要 靠 你 自 己 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_08"); //要 是 你 遇 到 了 问 题 ， 而 凭 我 的 经 验 能 解 决 它 ， 那 就 再 来 找 我 吧 。

		if ((ORkSturmDI == TRUE)
		&& (DIA_PC_Thief_DI_RAT_OneTime2 == FALSE))
		{
			AI_Output(self, other, "DIA_PC_Thief_DI_RAT_11_09"); //还 有 一 件 事 。 我 更 希 望 你 不 会 把 周 围 所 有 的 怪 物 都 拉 到 船 边 来 。 我 希 望 这 次 兽 人 的 袭 击 是 我 必 须 抵 挡 的 最 后 一 次 攻 击 ！
			B_GivePlayerXP(XP_Ambient);
			DIA_PC_Thief_DI_RAT_OneTime2 = TRUE;
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Diego_DI_TRADE(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 12;
	condition		= DIA_Diego_DI_TRADE_Condition;
	information		= DIA_Diego_DI_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "我 需 要 弹 药。";
};

func int DIA_Diego_DI_TRADE_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Diego_DI_TRADE_Info()
{
	AI_Output(other, self, "DIA_Diego_DI_TRADE_15_00"); //我 需 要 弹 药 。
	B_GiveTradeInv(self);

	// Joly: Mc ArrowBolt
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems(self, ItRw_Bolt, Npc_HasItems(self, ItRw_Bolt));
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 50);
	CreateInvItems(self, ItRw_Bolt, McBolzenAmount);

	Npc_RemoveInvItems(self, ItRw_Arrow, Npc_HasItems(self, ItRw_Arrow));
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 50);
	CreateInvItems(self, ItRw_Arrow, McArrowAmount);
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output(self, other, "DIA_Diego_DI_TRADE_11_01"); //也 许 我 能 帮 助 你 。
};

// ************************************************************
// 	  	  Training
// ************************************************************
instance DIA_PC_Thief_DI_Training_Talente(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 10;
	condition		= DIA_PC_Thief_DI_Training_Talente_Condition;
	information		= DIA_PC_Thief_DI_Training_Talente_Info;
	permanent		= TRUE;
	description		= "训 练 我 。";
};

func int DIA_PC_Thief_DI_Training_Talente_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_PC_Thief_DI_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_PC_Thief_DI_Training_Talente_Info()
{
	AI_Output(other, self, "DIA_PC_Thief_DI_Training_15_00"); //训 练 我 。
	AI_Output(self, other, "DIA_PC_Thief_DI_Training_11_01"); //你 都 需 要 什 么 ？

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

//***************************************************************************
// DEX 1
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_1()
{
	if (B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MAX))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_Training_DEX_1_11_00"); //如 果 你 总 能 设 法 置 身 战 线 之 外 的 话 ， 生 活 对 你 来 说 会 容 易 得 多 。
	};

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

//***************************************************************************
// DEX 5
//***************************************************************************

func void DIA_PC_Thief_DI_Training_DEX_5()
{
	if (B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MAX))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_Training_DEX_5_11_00"); //当 你 行 动 的 时 候 ， 一 直 要 想 着 猫 的 敏 捷 。 剩 下 的 事 情 就 会 自 然 而 然 地 解 决 。
	};

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

//***************************************************************************
// BOGEN
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 100))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00"); //为 了 达 到 最 好 的 效 果 ， 需 要 投 入 大 量 的 实 实 在 在 的 练 习 。
	};

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

// ------ 5% Waffentalent ------
func void DIA_PC_Thief_DI_Training_Combat_BOW_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 100))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00"); //手 要 稳 住 ， 在 瞄 准 的 时 候 要 慢 慢 地 呼 气 。
	};

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

// ------ PICKLOCK ------
func void DIA_PC_Thief_DI_Training_Talente_PICKLOCK()
{
	if (B_TeachThiefTalent(self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_Training_PICKLOCK_11_00"); //正 是 时 候 。 真 奇 怪 ， 你 以 前 从 来 没 学 过 这 种 技 能 。
	};

	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, DIALOG_BACK, DIA_PC_Thief_DI_Training_Talente_BACK);

	if (Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, TXT_TALENTS[NPC_TALENT_PICKLOCK], DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#else
		Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, NAME_TALENT_PICKLOCK, DIA_PC_Thief_DI_Training_Talente_PICKLOCK);
//#endif
	};

	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_PC_Thief_DI_Training_DEX_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_PC_Thief_DI_Training_DEX_5);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_PC_Thief_DI_Training_Combat_BOW_1);
	Info_AddChoice(DIA_PC_Thief_DI_Training_Talente, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_PC_Thief_DI_Training_Combat_BOW_5);
};

// ------ Back ------
func void DIA_PC_Thief_DI_Training_Talente_BACK()
{
	Info_ClearChoices(DIA_PC_Thief_DI_Training_Talente);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************
instance DIA_PC_Thief_DI_UndeadDragonDead(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 5;
	condition		= DIA_PC_Thief_DI_UndeadDragonDead_Condition;
	information		= DIA_PC_Thief_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "都 结 束 了 。 现 在 我 们 可 以 离 开 这 里 了 。";
};

func int DIA_PC_Thief_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_PC_Thief_DI_UndeadDragonDead_OneTime;
func void DIA_PC_Thief_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_PC_Thief_DI_UndeadDragonDead_15_00"); //都 结 束 了 。 现 在 我 们 可 以 离 开 这 里 了 。

	if ((Npc_GetDistToWP(self, "WP_UNDEAD_MIDDLE_01") < 4000))
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_01"); //现 在 ， 你 想 看 看 这 个 吗 。 我 这 一 生 还 从 来 没 见 过 这 样 的 一 座 建 筑 。
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_02"); //你 是 怎 么 设 法 绕 过 那 个 东 西 的 ？
		AI_Output(other, self, "DIA_PC_Thief_DI_UndeadDragonDead_15_03"); //我 想 我 很 走 运 。
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_04"); //（ 大 笑 ） 如 果 你 这 么 说 的 话 。
	}
	else
	{
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_05"); //好。
	};

	if (DIA_PC_Thief_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other, self, "DIA_PC_Thief_DI_UndeadDragonDead_15_06"); //你 现 在 想 要 做 什 么 ？
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_07"); //这 个 问 题 问 得 好 。 我 想 我 会 先 回 克 霍 里 尼 斯 去 。
		// AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_08"); // Wäre doch gelacht, wenn ich aus dem Dreckloch nicht wieder eine gescheite Stadt ohne Korruption machen kann.
		if ((Diebesgilde_Verraten == TRUE)
		|| (MIS_Andre_GuildOfThieves == LOG_SUCCESS))
		{
			AI_Output(self, other, "DIA_DiegoDI_Add_11_00"); //那 里 已 经 没 有 盗 贼 行 会 了 。 那 引 发 了 一 些 有 意 思 的 可 能 性 。
		};

		// AI_Output(self,other,"DIA_DiegoDI_Add_11_01"); // Für Bromors Haus kann ich bestimmt noch was rausschlagen - vorausgesetzt ich finde einen Käufer...
		AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_09"); //嗯 。 或 者 我 也 许 将 接 管 布 洛 摩 尔 的 生 意 。 那 样 总 能 弄 到 钱 。 正 当 的 钱 。
		DIA_PC_Thief_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_PC_Thief_DI_UndeadDragonDead_11_10"); //马 上 去 找 船 长 ， 我 们 要 离 开 这 里 。
	AI_StopProcessInfos(self);

	if (Lares_IsOnBoard != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self, "SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self, "Start");
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Thief_DI_PICKPOCKET(C_INFO)
{
	npc				= PC_Thief_DI;
	nr				= 900;
	condition		= DIA_Thief_DI_PICKPOCKET_Condition;
	information		= DIA_Thief_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Thief_DI_PICKPOCKET_Condition()
{
	C_Beklauen(120, 600);
};

func void DIA_Thief_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET, DIALOG_BACK, DIA_Thief_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Thief_DI_PICKPOCKET_DoIt);
};

func void DIA_Thief_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};

func void DIA_Thief_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_DI_PICKPOCKET);
};
