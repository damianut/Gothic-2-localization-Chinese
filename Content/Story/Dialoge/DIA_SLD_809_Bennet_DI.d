///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_EXIT(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 999;
	condition		= DIA_Bennet_DI_EXIT_Condition;
	information		= DIA_Bennet_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bennet_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bennet_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Bennet_DI_Hello(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 10;
	condition		= DIA_Bennet_DI_Hello_Condition;
	information		= DIA_Bennet_DI_Hello_Info;
	permanent		= TRUE;
	description		= "你 还 顺 利 吗 ？";
};

func int DIA_Bennet_DI_Hello_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Hello_Info()
{
	AI_Output(other, self, "DIA_Bennet_DI_Hello_15_00"); //你 还 顺 利 吗 ？

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Bennet_DI_Hello_06_01"); //船 上 这 个 锻 铁 炉 有 点 生 锈 了 。 是 海 盐 把 它 弄 成 了 这 样 。 要 在 这 里 做 出 什 么 象 样 的 东 西 也 许 会 比 较 难 。 但 是 ， 除 此 之 外 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Bennet_DI_Hello_06_02"); //是 的 ， 倘 若 兽 人 不 回 来 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_TRADE(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 7;
	condition		= DIA_Bennet_DI_TRADE_Condition;
	information		= DIA_Bennet_DI_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 能 卖 我 什 么 武 器 ？";
};

func int DIA_Bennet_DI_TRADE_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_TRADE_Info()
{
	AI_Output(other, self, "DIA_Bennet_DI_TRADE_15_00"); //你 能 卖 我 什 么 武 器 ？
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Bennet_DI_TRADE_06_01"); //只 有 最 好 的 。 你 知 道 。
};

///////////////////////////////////////////////////////////////////////
//	Info Smith
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_Smith(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 7;
	condition		= DIA_Bennet_DI_Smith_Condition;
	information		= DIA_Bennet_DI_Smith_Info;
	permanent		= TRUE;
	description		= "你 教 我 你 的 技 艺 吗 ？";
};

func int DIA_Bennet_DI_Smith_Condition()
{
	if ((Bennet_TeachSmith == TRUE)
	&& (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_Smith_Info()
{
	AI_Output(other, self, "DIA_Bennet_DI_Smith_15_00"); //你 教 我 你 的 技 艺 吗 ？
	AI_Output(self, other, "DIA_Bennet_DI_Smith_06_01"); //取 决 于 你 想 做 出 什 么 。

	Info_ClearChoices(DIA_Bennet_DI_Smith);
	Info_AddChoice(DIA_Bennet_DI_Smith, DIALOG_BACK, DIA_Bennet_DI_Smith_BACK);

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_LEARN_SMITHING, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common)), DIA_Bennet_DI_Smith_Common);
	};

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01)), DIA_Bennet_DI_Smith_1hSpecial1);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01)), DIA_Bennet_DI_Smith_2hSpecial1);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02)), DIA_Bennet_DI_Smith_1hSpecial2);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02)), DIA_Bennet_DI_Smith_2hSpecial2);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_03)), DIA_Bennet_DI_Smith_1hSpecial3);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_03)), DIA_Bennet_DI_Smith_2hSpecial3);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_1H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_04)), DIA_Bennet_DI_Smith_1hSpecial4);
		};

		if (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == FALSE)
		{
			Info_AddChoice(DIA_Bennet_DI_Smith, B_BuildLearnString(NAME_ItMw_2H_Special_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_04)), DIA_Bennet_DI_Smith_2hSpecial4);
		};
	};
};

// ------ Back ------
func void DIA_Bennet_DI_Smith_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_Smith);
};

func void DIA_Bennet_DI_Smith_Common()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_Common);
};

func void DIA_Bennet_DI_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_01);
};

func void DIA_Bennet_DI_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_01);
};

func void DIA_Bennet_DI_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_02);
};

func void DIA_Bennet_DI_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_02);
};

func void DIA_Bennet_DI_Smith_1hSpecial3()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_03);
};

func void DIA_Bennet_DI_Smith_2hSpecial3()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_03);
};

func void DIA_Bennet_DI_Smith_1hSpecial4()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_04);
};

func void DIA_Bennet_DI_Smith_2hSpecial4()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_04);
};

//*******************************************
//	TechPlayerSTR
//*******************************************
instance DIA_Bennet_TeachSTR(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 150;
	condition		= DIA_Bennet_TeachSTR_Condition;
	information		= DIA_Bennet_TeachSTR_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 强 壮 。";
};

func int DIA_Bennet_TeachSTR_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bennet_TeachSTR_Info()
{
	AI_Output(other, self, "DIA_Bennet_TeachSTR_15_00"); //我 想 要 变 得 更 强 壮 。
	AI_Output(self, other, "DIA_Bennet_TeachSTR_06_01"); //在 这 种 时 候 ， 只 需 要 一 条 强 壮 的 胳 膊 。

	Info_ClearChoices(DIA_Bennet_TeachSTR);
	Info_AddChoice(DIA_Bennet_TeachSTR, DIALOG_BACK, DIA_Bennet_TeachSTR_Back);
	Info_AddChoice(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Bennet_TeachSTR_STR_1);
	Info_AddChoice(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Bennet_TeachSTR_STR_5);
};

func void DIA_Bennet_TeachSTR_Back()
{
	Info_ClearChoices(DIA_Bennet_TeachSTR);
};

func void DIA_Bennet_TeachSTR_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Bennet_TeachSTR_STR_1);
};

func void DIA_Bennet_TeachSTR_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MAX);
	Info_AddChoice(DIA_Bennet_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Bennet_TeachSTR_STR_5);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_DragonEgg(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 99;
	condition		= DIA_Bennet_DI_DragonEgg_Condition;
	information		= DIA_Bennet_DI_DragonEgg_Info;
	description		= "我 这 里 有 一 枚 龙 蛋 。";
};

func int DIA_Bennet_DI_DragonEgg_Condition()
{
	if (Npc_HasItems(other, ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_DragonEgg_Info()
{
	AI_Output(other, self, "DIA_Bennet_DI_DragonEgg_15_00"); //我 这 里 有 一 枚 龙 蛋 。
	AI_Output(self, other, "DIA_Bennet_DI_DragonEgg_06_01"); //是 吗 ？
	AI_Output(other, self, "DIA_Bennet_DI_DragonEgg_15_02"); //好 吧 。 我 想 … …
	AI_Output(self, other, "DIA_Bennet_DI_DragonEgg_06_03"); //我 知 道 你 在 想 什 么 。 算 了 ， 留 着 那 东 西 吧 ， 我 不 想 要 它 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Bennet_DI_UndeadDragonDead(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 7;
	condition		= DIA_Bennet_DI_UndeadDragonDead_Condition;
	information		= DIA_Bennet_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 们 已 经 做 了 所 有 需 要 做 的 。";
};

func int DIA_Bennet_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Bennet_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Bennet_DI_UndeadDragonDead_15_00"); //我 们 已 经 做 了 所 有 需 要 做 的 。
	AI_Output(self, other, "DIA_Bennet_DI_UndeadDragonDead_06_01"); //我 很 高 兴 听 到 这 些 。 我 真 的 已 经 受 够 了 这 个 旧 铁 炉 子 。 我 必 须 再 回 到 平 稳 的 地 面 上 去 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bennet_DI_PICKPOCKET(C_INFO)
{
	npc				= SLD_809_Bennet_DI;
	nr				= 900;
	condition		= DIA_Bennet_DI_PICKPOCKET_Condition;
	information		= DIA_Bennet_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Bennet_DI_PICKPOCKET_Condition()
{
	C_Beklauen(35, 65);
};

func void DIA_Bennet_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET, DIALOG_BACK, DIA_Bennet_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bennet_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bennet_DI_PICKPOCKET_DoIt);
};

func void DIA_Bennet_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};

func void DIA_Bennet_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bennet_DI_PICKPOCKET);
};
