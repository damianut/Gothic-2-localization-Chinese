// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance Addon_10008_Bandit_EXIT(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 999;
	condition		= Addon_10008_Bandit_EXIT_Condition;
	information		= Addon_10008_Bandit_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Addon_10008_Bandit_EXIT_Condition()
{
	return TRUE;
};

func void Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_10008_Bandit_PICKPOCKET(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 900;
	condition		= DIA_Addon_10008_Bandit_PICKPOCKET_Condition;
	information		= DIA_Addon_10008_Bandit_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_10008_Bandit_PICKPOCKET_Condition()
{
	C_Beklauen(55, 99);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_BACK, DIA_Addon_10008_Bandit_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_10008_Bandit_PICKPOCKET_DoIt);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_10008_Bandit_Hi(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 2;
	condition		= DIA_Addon_10008_Bandit_Hi_Condition;
	information		= DIA_Addon_10008_Bandit_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_10008_Bandit_Hi_Condition()
{
	if ((Npc_GetDistToNpc(other, Skinner) <= 600)
	&& (!Npc_IsDead(Skinner))
	&& (Skinner.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_00"); //不 要 叫 醒 他 ！
	AI_Output(other, self, "DIA_Addon_10008_Bandit_Hi_15_01"); //什 么 ？ ？ ？
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_02"); //如 果 你 想 帮 自 己 一 个 忙 的 话 ， 那 就 离 皮 革 商 远 点 。
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_03"); //那 个 家 伙 难 以 预 料 。 他 杀 掉 了 上 一 个 叫 醒 他 的 家 伙 。
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_04"); //让 他 睡 吧 ， 为 了 大 家 的 利 益 。
};

// --------------------------------------------------------------------
//	Info soup
// ---------------------------------------------------------------------
instance DIA_Addon_10008_Bandit_soup(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 2;
	condition		= DIA_Addon_10008_Bandit_soup_Condition;
	information		= DIA_Addon_10008_Bandit_soup_Info;
	description		= "你 是 一 名 挖 掘 者 ？";
};

func int DIA_Addon_10008_Bandit_soup_Condition()
{
	return TRUE;
};

func void DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output(other, self, "DIA_Addon_10008_Bandit_soup_15_00"); //你 是 一 名 挖 掘 者 ？
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_01"); //因 为 裤 子 ？ 不 ， 我 穿 着 它 们 是 因 为 它 们 很 舒 服 。
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_02"); //我 在 这 里 就 是 做 炖 肉 。 给 ， 你 可 以 尝 尝 - 它 会 让 你 感 到 强 壮 。
	B_GiveInvItems(self, other, ItFo_Addon_Meatsoup, 1);
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_03"); //训 练 你 的 力 量 一 直 都 很 重 要 - 在 外 面 潜 伏 着 很 多 危 险 。
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_04"); //如 果 你 想 要 的 话 ， 我 能 帮 你 变 得 更 强 壮 。

	Log_CreateTopic(Topic_Addon_BDT_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, Topic_Addon_BDT_Teacher_2);
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Addon_10008_Bandit_Teach(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 7;
	condition		= DIA_Addon_10008_Bandit_Teach_Condition;
	information		= DIA_Addon_10008_Bandit_Teach_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 更 强 壮 。";
};

func int DIA_Addon_10008_Bandit_Teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_10008_Bandit_soup))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_10008_Bandit_Teach_15_00"); //我 要 变 得 更 强 壮 。

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
};

func void DIA_Addon_10008_Bandit_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};
