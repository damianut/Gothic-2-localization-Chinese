///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_EXIT(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 999;
	condition		= DIA_Lee_DI_EXIT_Condition;
	information		= DIA_Lee_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_Hallo(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 2;
	condition		= DIA_Lee_DI_Hallo_Condition;
	information		= DIA_Lee_DI_Hallo_Info;
	description		= "你 想 要 负 责 什 么 工 作 ？";
};

func int DIA_Lee_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Lee_DI_Hallo_15_00"); //你 想 要 负 责 什 么 工 作 ？
	AI_Output(self, other, "DIA_Lee_DI_Hallo_04_01"); //必 须 有 人 照 看 船 只 。 我 会 留 在 这 里 确 保 你 们 回 来 时 它 还 在 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM6
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_PERM6(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 2;
	condition		= DIA_Lee_DI_PERM6_Condition;
	information		= DIA_Lee_DI_PERM6_Info;
	permanent		= TRUE;
	description		= "我 的 船 怎 么 样 ？";
};

func int DIA_Lee_DI_PERM6_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_DI_Hallo))
	&& (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_PERM6_Info()
{
	AI_Output(other, self, "DIA_Lee_DI_PERM6_15_00"); //我 的 船 怎 么 样 ？

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Lee_DI_PERM6_04_01"); //别 担 心 。 我 已 经 安 排 好 一 切 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_DI_PERM6_04_02"); //一 切 都 好 。 我 们 随 时 欢 迎 那 些 可 怜 的 兽 人 回 来 。 那 样 ， 它 们 会 得 到 另 一 顿 痛 打 。
	};

	AI_StopProcessInfos(self);
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Lee_DI_Teach(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 10;
	condition		= DIA_Lee_DI_Teach_Condition;
	information		= DIA_Lee_DI_Teach_Info;
	permanent		= TRUE;
	description		= "我 需 要 训 练 。";
};

func int DIA_Lee_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_DI_Teach_Info()
{
	AI_Output(other, self, "DIA_Lee_DI_Teach_15_00"); //我 需 要 接 受 训 练 。
	AI_Output(self, other, "DIA_Lee_DI_Teach_04_01"); //你 想 训 练 什 么 ？

	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach, DIALOG_BACK, DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 100))
	{
		AI_Output(self, other, "DIA_Lee_DI_Teach_1H_1_04_00"); //你 的 防 御 相 当 厉 害 ， 不 过 ， 还 要 想 办 法 再 提 高 一 点 。
	};

	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach, DIALOG_BACK, DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_1H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 100))
	{
		AI_Output(self, other, "DIA_Lee_DI_Teach_1H_5_04_00"); //你 的 手 腕 还 是 太 僵 硬 了 。 你 拿 武 器 时 得 放 松 一 点 。
	};

	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach, DIALOG_BACK, DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self, other, "DIA_DIA_Lee_DI_Teach_2H_1_04_00"); //要 时 刻 记 住 ， 摆 动 用 的 是 臀 部 的 力 量 ， 而 不 是 手 腕 。
	};

	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach, DIALOG_BACK, DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_2H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self, other, "DIA_Lee_DI_Teach_2H_5_04_00"); //如 果 没 有 命 中 ， 最 有 力 的 一 击 也 是 徒 劳 。 所 以 ， 要 用 巧 劲 。
	};

	Info_ClearChoices(DIA_Lee_DI_Teach);
	Info_AddChoice(DIA_Lee_DI_Teach, DIALOG_BACK, DIA_Lee_DI_Teach_Back);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lee_DI_Teach_1H_5);
};

func void DIA_Lee_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_UndeadDragonDead(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 2;
	condition		= DIA_Lee_DI_UndeadDragonDead_Condition;
	information		= DIA_Lee_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 们 现 在 可 以 出 发 了 。";
};

func int DIA_Lee_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lee_DI_UndeadDragonDead_OneTime;
func void DIA_Lee_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Lee_DI_UndeadDragonDead_15_00"); //我 们 现 在 可 以 上 路 了 。 敌 人 完 蛋 了 。
	AI_Output(self, other, "DIA_Lee_DI_UndeadDragonDead_04_01"); //很 好 。 那 就 去 告 诉 船 长 让 他 启 航 。

	if ((DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE)
	&& (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Lee_DI_UndeadDragonDead_04_02"); //你 会 带 我 去 大 陆 ， 是 吗 ？
		AI_Output(other, self, "DIA_Lee_DI_UndeadDragonDead_15_03"); //是 的 。 没 有 你 的 话 ， 克 霍 里 尼 斯 也 会 幸 免 于 难 的 。
		// AI_Output(self,other, "DIA_Lee_DI_UndeadDragonDead_04_04"); // Dann kann ich dem König endlich meine lang ersehnte Aufwartung machen. Er ist schon zu lange vor mir davon gelaufen.
		AI_Output(self, other, "DIA_Lee_Add_04_26"); //那 我 就 终 于 能 去 见 早 就 该 去 见 的 国 王 了 。
		AI_Output(self, other, "DIA_Lee_Add_04_27"); //为 了 这 个 ， 我 已 经 等 了 很 久 … …
		AI_Output(self, other, "DIA_Lee_DI_UndeadDragonDead_04_05"); //你 怎 么 想 ？ 忍 耐 是 不 是 终 将 得 到 回 报 ？
		AI_Output(other, self, "DIA_Lee_DI_UndeadDragonDead_15_06"); //忍 耐 和 一 些 惊 人 的 争 吵 。
		AI_Output(self, other, "DIA_Lee_DI_UndeadDragonDead_04_07"); //（ 大 笑 ） 是 啊 。 如 果 没 有 相 当 的 武 装 力 量 ， 什 么 都 没 用 。 能 与 你 一 起 作 战 是 一 种 光 荣 。
		DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Lee_DI_UndeadDragonDead_04_08"); //在 这 次 探 险 后 ， 也 许 某 一 天 我 们 会 再 走 到 一 起 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lee_DI_PICKPOCKET(C_INFO)
{
	npc				= SLD_800_Lee_DI;
	nr				= 900;
	condition		= DIA_Lee_DI_PICKPOCKET_Condition;
	information		= DIA_Lee_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Lee_DI_PICKPOCKET_Condition()
{
	C_Beklauen(110, 570);
};

func void DIA_Lee_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET, DIALOG_BACK, DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};

func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lee_DI_PICKPOCKET);
};
