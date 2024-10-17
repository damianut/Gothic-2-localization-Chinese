// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_NW_EXIT(C_INFO)
{
	npc				= STRF_1123_Addon_Patrick_NW;
	nr				= 999;
	condition		= DIA_Addon_Patrick_NW_EXIT_Condition;
	information		= DIA_Addon_Patrick_NW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Patrick_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Patrick_NW_PICKPOCKET(C_INFO)
{
	npc				= STRF_1123_Addon_Patrick_NW;
	nr				= 900;
	condition		= DIA_Addon_Patrick_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Patrick_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Patrick_NW_PICKPOCKET_Condition()
{
	C_Beklauen(35, 50);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Patrick_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Patrick_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Patrick_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};

func void DIA_Addon_Patrick_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Patrick_NW_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_NW_Hi(C_INFO)
{
	npc				= STRF_1123_Addon_Patrick_NW;
	nr				= 2;
	condition		= DIA_Addon_Patrick_NW_Hi_Condition;
	information		= DIA_Addon_Patrick_NW_Hi_Info;
	description		= "怎 么 样 ？ 你 感 觉 还 好 吗 ？";
};

func int DIA_Addon_Patrick_NW_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_NW_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Patrick_NW_Hi_15_00"); //怎 么 样 ？ 你 感 觉 还 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Patrick_NW_Hi_07_01"); //全 都 好 了 。 水 法 师 领 导 我 们 安 全 地 离 开 了 这 个 可 恶 的 山 谷 。
	AI_Output(other, self, "DIA_Addon_Patrick_NW_Hi_15_02"); //接 下 来 你 要 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Patrick_NW_Hi_07_03"); //我 要 继 续 为 李 战 斗 。 而 且 有 一 天 我 会 离 开 这 个 岛 … …
	AI_Output(other, self, "DIA_Addon_Patrick_NW_Hi_15_04"); //然 后 呢 ？
	AI_Output(self, other, "DIA_Addon_Patrick_NW_Hi_07_05"); //我 们 会 看 到 的 。 如 果 战 争 依 旧 激 烈 的 话 ， 我 们 将 站 出 来 抵 抗 兽 人 。 但 是 那 还 有 待 观 察 。
};
