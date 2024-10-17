///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_DI_EXIT(C_INFO)
{
	npc				= SLD_811_Wolf_DI;
	nr				= 999;
	condition		= DIA_Wolf_DI_EXIT_Condition;
	information		= DIA_Wolf_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wolf_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wolf_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_DI_HALLO(C_INFO)
{
	npc				= SLD_811_Wolf_DI;
	nr				= 4;
	condition		= DIA_Wolf_DI_HALLO_Condition;
	information		= DIA_Wolf_DI_HALLO_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Wolf_DI_HALLO_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

var int DIA_Wolf_DI_HALLO_OneTime;
func void DIA_Wolf_DI_HALLO_Info()
{
	AI_Output(other, self, "DIA_Wolf_DI_HALLO_15_00"); //怎 么 样 了 ？

	if ((Bennet_IsOnBoard == LOG_SUCCESS)
	&& (Npc_IsDead(Bennet_DI) == FALSE))
	{
		AI_Output(self, other, "DIA_Wolf_DI_HALLO_08_01"); //你 一 定 要 带 上 贝 尼 特 吗 ， 伙 计 ？
		AI_Output(other, self, "DIA_Wolf_DI_HALLO_15_02"); //什 么 难 题 ？
		AI_Output(self, other, "DIA_Wolf_DI_HALLO_08_03"); //哈 ， 没 事 。 很 好 。 做 你 的 事 ， 然 后 离 开 这 里 ， 行 吗 ？
	}
	else
	{
		if (DIA_Wolf_DI_HALLO_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Wolf_DI_HALLO_08_04"); //锻 造 炉 不 是 很 好 ， 但 是 ， 我 会 尽 力 试 一 下 。
			B_GivePlayerXP(XP_Ambient);
			DIA_Wolf_DI_HALLO_OneTime = TRUE;
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "SmithDI");
		}
		else
		{
			AI_Output(other, self, "DIA_Wolf_DI_HALLO_15_05"); //你 能 为 我 做 一 些 盔 甲 吗 ？
			AI_Output(self, other, "DIA_Wolf_DI_HALLO_08_06"); //对 不 起 ， 伙 计 。 用 这 些 工 具 可 不 行 。 必 须 等 我 们 登 上 陆 地 之 后 。
		};
	};
};

// ************************************************************
// 	  	  Training
// ************************************************************
instance DIA_Wolf_DI_Training(C_INFO)
{
	npc				= SLD_811_Wolf_DI;
	nr				= 10;
	condition		= DIA_Wolf_DI_Training_Condition;
	information		= DIA_Wolf_DI_Training_Info;
	permanent		= TRUE;
	description		= "训 练 我 的 远 程 战 斗 。";
};

func int DIA_Wolf_DI_Training_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Wolf_DI_Training_Info()
{
	AI_Output(other, self, "DIA_Wolf_DI_Training_15_00"); //训 练 我 的 远 程 战 斗 。
	AI_Output(self, other, "DIA_Wolf_DI_Training_08_01"); //哪 一 种 ？

	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Wolf_DI_Training_CROSSBOW_5);
};

//***************************************************************************
// BOGEN
//***************************************************************************
// ------ 1% Waffentalent ------
func void DIA_Wolf_DI_Training_BOW_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 90))
	{
		AI_Output(self, other, "DIA_Wolf_DI_Training_BOW_1_08_00"); //跟 弩 不 一 样 ， 弓 比 较 笨 重 而 且 发 射 时 需 要 一 定 的 距 离 。 在 战 斗 时 一 定 要 确 保 有 足 够 的 距 离 。
	};

	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Wolf_DI_Training_CROSSBOW_5);
};

// ------ 5% Waffentalent ------
func void DIA_Wolf_DI_Training_BOW_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 90))
	{
		AI_Output(self, other, "DIA_Wolf_DI_Training_BOW_5_08_00"); //在 发 射 的 时 候 ， 让 弦 从 你 的 手 指 头 间 滑 过 。 手 指 的 一 点 点 阻 力 都 会 让 箭 偏 离 轨 道 。
	};

	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Wolf_DI_Training_CROSSBOW_5);
};

//***************************************************************************
// Armbrust
//***************************************************************************
// ------ 1% Waffentalent ------

func void DIA_Wolf_DI_Training_CROSSBOW_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 100))
	{
		AI_Output(self, other, "DIA_Wolf_DI_Training_CROSSBOW_1_08_00"); //在 发 射 弩 箭 的 时 候 不 要 抖 动 。 这 就 是 为 什 么 要 非 常 小 心 地 扣 动 扳 机 的 原 因 。
	};

	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Wolf_DI_Training_CROSSBOW_5);
};

// ------ 5% Waffentalent ------
func void DIA_Wolf_DI_Training_CROSSBOW_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 100))
	{
		AI_Output(self, other, "DIA_Wolf_DI_Training_CROSSBOW_5_08_00"); //一 个 聪 明 的 神 射 手 懂 得 利 用 风 ， 而 且 从 来 不 会 顶 着 它 发 射 。
	};

	Info_ClearChoices(DIA_Wolf_DI_Training);
	Info_AddChoice(DIA_Wolf_DI_Training, DIALOG_BACK, DIA_Wolf_DI_Training_BACK);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Wolf_DI_Training_BOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Wolf_DI_Training_BOW_5);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Wolf_DI_Training_CROSSBOW_1);
	Info_AddChoice(DIA_Wolf_DI_Training, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Wolf_DI_Training_CROSSBOW_5);
};

// ------ Back ------
func void DIA_Wolf_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_Training);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Wolf_DI_UndeadDragonDead(C_INFO)
{
	npc				= SLD_811_Wolf_DI;
	nr				= 2;
	condition		= DIA_Wolf_DI_UndeadDragonDead_Condition;
	information		= DIA_Wolf_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Wolf_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Wolf_DI_UndeadDragonDead_OneTime;
func void DIA_Wolf_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Wolf_DI_UndeadDragonDead_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Wolf_DI_UndeadDragonDead_08_01"); //当 然 。 你 呢 ？ 有 点 困 难 ， 是 吗 ？

	if (DIA_Wolf_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other, self, "DIA_Wolf_DI_UndeadDragonDead_15_02"); //你 现 在 要 去 哪 里 ？
		AI_Output(self, other, "DIA_Wolf_DI_UndeadDragonDead_08_03"); //除 了 回 去 ， 哪 儿 都 行 。 我 受 够 克 霍 里 尼 斯 了 。
		AI_Output(self, other, "DIA_Wolf_DI_UndeadDragonDead_08_04"); //无 论 要 去 哪 里 ， 我 的 意 见 跟 你 完 全 一 样 。 只 要 能 远 离 这 个 地 方 。
		DIA_Wolf_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wolf_DI_PICKPOCKET(C_INFO)
{
	npc				= SLD_811_Wolf_DI;
	nr				= 900;
	condition		= DIA_Wolf_DI_PICKPOCKET_Condition;
	information		= DIA_Wolf_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Wolf_DI_PICKPOCKET_Condition()
{
	C_Beklauen(32, 45);
};

func void DIA_Wolf_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET, DIALOG_BACK, DIA_Wolf_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wolf_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wolf_DI_PICKPOCKET_DoIt);
};

func void DIA_Wolf_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};

func void DIA_Wolf_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wolf_DI_PICKPOCKET);
};
