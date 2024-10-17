///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_XIT(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 999;
	condition		= DIA_Girion_DI_EXIT_Condition;
	information		= DIA_Girion_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_Hallo(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 2;
	condition		= DIA_Girion_DI_Hallo_Condition;
	information		= DIA_Girion_DI_Hallo_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Girion_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Girion_DI_Hallo_15_00"); //一 切 都 好 吗 ？

	if (ORkSturmDI == TRUE)
	{
		AI_Output(self, other, "DIA_Girion_DI_Hallo_08_01"); //那 些 兽 人 确 实 十 分 勇 猛 ， 他 们 竟 然 敢 跟 我 拼 。
		AI_Output(self, other, "DIA_Girion_DI_Hallo_08_02"); //他 们 确 实 应 该 有 点 头 脑 而 不 是 挑 战 一 位 皇 家 卫 队 的 圣 骑 士 。
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Girion_DI_Hallo_08_03"); //我 也 这 样 想 。 你 在 这 个 悬 崖 上 的 任 务 需 要 很 长 的 时 间 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Girion_DI_Hallo_08_04"); //不 要 把 我 当 成 傻 瓜 。 干 你 该 干 的 事 情 ， 然 后 把 船 交 还 给 我 。
	};
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Girion_DI_Teach(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 5;
	condition		= DIA_Girion_DI_Teach_Condition;
	information		= DIA_Girion_DI_Teach_Info;
	permanent		= TRUE;
	description		= "训 练 我 ， 那 样 我 们 可 以 快 慢 离 开 这 里.";
};

func int DIA_Girion_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Teach_Info()
{
	AI_Output(other, self, "DIA_Girion_DI_Teach_15_00"); //训 练 我 ， 这 样 我 们 就 能 早 点 离 开 这 里 了 。
	AI_Output(self, other, "DIA_Girion_DI_Teach_08_01"); //我 像 是 没 有 其 它 选 择 。

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

//***************************************************************************
// ARMBRUST
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 90))
	{
		AI_Output(self, other, "DIA_Girion_DI_Teach_CROSSBOW_1_08_00"); //不 要 撑 起 手 肘 。 那 样 会 使 瞄 准 动 作 太 过 僵 硬 ， 而 且 必 然 会 使 武 器 偏 移 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

// ------ 5% Waffentalent ------
func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 90))
	{
		AI_Output(self, other, "DIA_Girion_DI_Teach_CROSSBOW_5_08_00"); //在 每 次 射 击 前 都 要 放 松 左 臂 。 那 样 能 在 瞄 准 时 更 灵 活 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 90))
	{
		AI_Output(self, other, "DIA_Girion_DI_Teach_1H_1_08_00"); //你 的 刀 刃 要 象 切 割 风 中 的 芦 苇 一 样 从 空 气 中 划 过 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 90))
	{
		AI_Output(self, other, "DIA_Girion_DI_Teach_1H_5_08_00"); //要 计 算 好 力 度 。 盲 目 地 冲 着 敌 人 冲 过 去 是 从 来 不 会 取 得 成 功 的 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 90))
	{
		AI_Output(self, other, "DIA_DIA_Girion_DI_Teach_2H_1_08_00"); //握 住 剑 柄 时 不 要 太 用 力 ， 这 样 你 的 进 攻 就 能 击 中 目 标 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 90))
	{
		AI_Output(self, other, "DIA_Girion_DI_Teach_2H_5_08_00"); //别 忘 了 格 挡 。 但 是 最 好 的 防 御 方 法 就 是 避 开 对 手 的 攻 击 。
	};

	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach, DIALOG_BACK, DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info OrcEliteRing
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_OrcEliteRing(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 99;
	condition		= DIA_Girion_DI_OrcEliteRing_Condition;
	information		= DIA_Girion_DI_OrcEliteRing_Info;
	permanent		= TRUE;
	description		= "我 有 一 枚 来 自 兽 人 军 阀 的 戒 指 。";
};

func int DIA_Girion_DI_OrcEliteRing_Condition()
{
	if (Npc_HasItems(other, ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_OrcEliteRing_OneTime;
func void DIA_Girion_DI_OrcEliteRing_Info()
{
	AI_Output(other, self, "DIA_Girion_DI_OrcEliteRing_15_00"); //我 有 一 枚 来 自 兽 人 军 阀 的 戒 指 。

	if (DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Girion_DI_OrcEliteRing_08_01"); //我 想 哈 根 勋 爵 可 能 会 用 那 个 做 点 什 么 。
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Girion_DI_OrcEliteRing_08_02"); //把 它 给 我 。 我 会 把 它 交 给 哈 根 勋 爵 。

	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing, "我 宁 愿 自 己 留 着 它 。", DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing, "给 ， 拿 上 它 。", DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_geben()
{
	AI_Output(other, self, "DIA_Girion_DI_OrcEliteRing_geben_15_00"); //给 ， 拿 上 它 。
	AI_Output(self, other, "DIA_Girion_DI_OrcEliteRing_geben_08_01"); //谢 谢 。 不 过 我 认 为 它 对 你 用 处 不 大 。
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems(other, self, ItRi_OrcEliteRing, 1);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Girion_DI_OrcEliteRing_behalten()
{
	AI_Output(other, self, "DIA_Girion_DI_OrcEliteRing_behalten_15_00"); //我 宁 愿 自 己 留 着 它 。
	AI_Output(self, other, "DIA_Girion_DI_OrcEliteRing_behalten_08_01"); //那 请 自 便 吧 。 但 你 拿 了 它 毫 无 用 处 。
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Girion_DI_UndeadDragonDead(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 2;
	condition		= DIA_Girion_DI_UndeadDragonDead_Condition;
	information		= DIA_Girion_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 们 现 在 可 以 离 开 这 里 了 。";
};

func int DIA_Girion_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_UndeadDragonDead_OneTime;
func void DIA_Girion_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Girion_DI_UndeadDragonDead_15_00"); //我 们 现 在 可 以 离 开 这 里 了 。
	AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_01"); //是 时 候 了 。 我 确 实 想 过 自 己 可 能 会 死 在 这 座 悬 崖 上 。

	if (DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_02"); //马 上 把 船 交 给 我 。
		AI_Output(other, self, "DIA_Girion_DI_UndeadDragonDead_15_03"); //我 们 还 没 到 克 霍 里 尼 斯 。 而 且 ， 老 实 说 ， 我 并 不 急 于 要 回 到 克 霍 里 尼 斯 。
		AI_Output(other, self, "DIA_Girion_DI_UndeadDragonDead_15_04"); //我 已 经 在 那 里 呆 得 太 久 了 。
		AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_05"); //果 然 不 出 我 所 料 。 但 现 在 时 间 和 地 点 都 不 适 合 弄 清 这 件 事 情 。 我 们 应 该 在 大 海 上 来 讨 论 这 件 事 情 。
		AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_06"); //那 又 怎 么 样 呢 。 但 我 仍 然 很 庆 幸 你 能 安 然 无 恙 地 回 到 这 艘 船 上 来 。

		if (hero.guild == GIL_PAL)
		{
			AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_07"); //你 是 英 诺 斯 的 真 正 勇 士 。 我 再 也 不 怀 疑 这 一 点 了 。 我 很 高 兴 你 能 站 在 我 们 这 一 边 。
		}
		else
		{
			AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_08"); //尽 管 你 是 个 坏 蛋 ， 最 后 你 还 是 做 了 正 义 的 行 为 。
		};

		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Girion_DI_UndeadDragonDead_08_09"); //好 吧 。 马 上 去 找 船 长 ， 要 他 指 挥 我 们 离 开 这 里 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Girion_DI_PICKPOCKET(C_INFO)
{
	npc				= PAL_207_Girion_DI;
	nr				= 900;
	condition		= DIA_Girion_DI_PICKPOCKET_Condition;
	information		= DIA_Girion_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Girion_DI_PICKPOCKET_Condition()
{
	C_Beklauen(71, 260);
};

func void DIA_Girion_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET, DIALOG_BACK, DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};
