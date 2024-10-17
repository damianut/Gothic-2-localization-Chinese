// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lares_DI_EXIT(C_INFO)
{
	npc				= VLK_449_Lares_DI;
	nr				= 999;
	condition		= DIA_Lares_DI_EXIT_Condition;
	information		= DIA_Lares_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lares_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lares_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************
instance DIA_Lares_DI_Hallo(C_INFO)
{
	npc				= VLK_449_Lares_DI;
	nr				= 2;
	condition		= DIA_Lares_DI_Hallo_Condition;
	information		= DIA_Lares_DI_Hallo_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Lares_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Lares_DI_Hallo_15_00"); //事 情 怎 么 样 了 ？

	if (ORkSturmDI == TRUE)
	{
		AI_Output(self, other, "DIA_Lares_DI_Hallo_09_01"); //快 点 。 那 些 兽 人 肯 定 会 回 来 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lares_DI_Hallo_09_02"); //好 吧 。 这 个 洞 穴 真 的 令 人 毛 骨 悚 然 。
	};
};

// ************************************************************
// 	  	  Training
// ************************************************************
instance DIA_Lares_DI_Training(C_INFO)
{
	npc				= VLK_449_Lares_DI;
	nr				= 10;
	condition		= DIA_Lares_DI_Training_Condition;
	information		= DIA_Lares_DI_Training_Info;
	permanent		= TRUE;
	description		= "把 你 的 技 能 教 给 我 。";
};

func int DIA_Lares_DI_Training_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lares_DI_Training_Info()
{
	AI_Output(other, self, "DIA_Lares_DI_Training_15_00"); //把 你 的 技 能 教 给 我 。
	AI_Output(self, other, "DIA_Lares_DI_Training_09_01"); //没 问 题 。

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 100))
	{
		AI_Output(self, other, "DIA_Lares_DI_Training_1H_1_09_00"); //你 必 须 弓 起 前 面 的 腿 并 保 持 背 部 挺 直 - 那 么 你 就 能 有 一 个 更 稳 定 的 姿 态 。
	};

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

func void DIA_Lares_DI_Training_1H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 100))
	{
		AI_Output(self, other, "DIA_Lares_DI_Training_1H_5_09_00"); //保 持 腰 部 的 灵 活 ， 那 可 以 帮 你 避 开 反 击 。
	};

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

//***************************************************************************
// DEX 1
//***************************************************************************

func void DIA_Lares_DI_Training_DEX_1()
{
	if (B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED))
	{
		AI_Output(self, other, "DIA_Lares_DI_Training_DEX_1_09_00"); //身 体 的 上 半 部 分 运 动 时 必 须 跟 其 它 部 分 协 调 。
	};

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

//***************************************************************************
// DEX 5
//***************************************************************************

func void DIA_Lares_DI_Training_DEX_5()
{
	if (B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED))
	{
		AI_Output(self, other, "DIA_Lares_DI_Training_DEX_5_09_00"); //你 必 须 时 刻 注 意 自 己 的 立 足 点 。
	};

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

// ------ SNEAK ------
func void DIA_Lares_DI_Training_SNEAK()
{
	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Lares_DI_Training_SNEAK_09_00"); //在 潜 行 时 总 是 要 用 到 全 部 的 脚 底 。
	};

	Info_ClearChoices(DIA_Lares_DI_Training);
	Info_AddChoice(DIA_Lares_DI_Training, DIALOG_BACK, DIA_Lares_DI_Training_BACK);
	if (Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(DIA_Lares_DI_Training, "学 习 潜 行", DIA_Lares_DI_Training_SNEAK);
	};

	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Lares_DI_Training_DEX_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Lares_DI_Training_DEX_5);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Lares_DI_Training_1H_1);
	Info_AddChoice(DIA_Lares_DI_Training, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Lares_DI_Training_1H_5);
};

// ------ Back ------
func void DIA_Lares_DI_Training_BACK()
{
	Info_ClearChoices(DIA_Lares_DI_Training);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************
instance DIA_Lares_DI_UndeadDragonDead(C_INFO)
{
	npc				= VLK_449_Lares_DI;
	nr				= 5;
	condition		= DIA_Lares_DI_UndeadDragonDead_Condition;
	information		= DIA_Lares_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "你 看 来 一 点 也 不 在 乎 这 些 。";
};

func int DIA_Lares_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lares_DI_UndeadDragonDead_OneTime;
func void DIA_Lares_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Lares_DI_UndeadDragonDead_15_00"); //你 看 来 一 点 也 不 在 乎 这 些 。
	AI_Output(self, other, "DIA_Lares_DI_UndeadDragonDead_09_01"); //哈 ， 你 知 道 ， 我 想 你 能 办 到 。

	if (DIA_Lares_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(other, self, "DIA_Lares_DI_UndeadDragonDead_15_02"); //现 在 你 打 算 怎 么 做 ？
		AI_Output(self, other, "DIA_Lares_DI_UndeadDragonDead_09_03"); //不 知 道 。 我 想 从 现 在 起 我 会 跟 随 你 。

		DIA_Lares_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_StopProcessInfos(self);
};
