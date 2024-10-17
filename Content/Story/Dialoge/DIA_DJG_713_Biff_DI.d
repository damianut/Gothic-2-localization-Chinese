//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Biff_DI_EXIT(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 999;
	condition		= DIA_Biff_DI_EXIT_Condition;
	information		= DIA_Biff_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_HALLO(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 10;
	condition		= DIA_Biff_DI_HALLO_Condition;
	information		= DIA_Biff_DI_HALLO_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HALLO_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_HALLO_07_00"); //还 有 吗 ？ 你 向 我 许 诺 的 财 富 呢 ？

	if (Npc_KnowsInfo(other, DIA_Biff_DI_ORKS) == FALSE)
	{
		AI_Output(other, self, "DIA_Biff_DI_HALLO_15_01"); //那 么 我 先 前 在 海 上 告 诉 了 你 什 么 ？
	};

	AI_Output(other, self, "DIA_Biff_DI_HALLO_15_02"); //现 在 ， 你 的 任 务 是 保 护 这 艘 船 。
	AI_Output(other, self, "DIA_Biff_DI_HALLO_15_03"); //我 可 不 想 一 路 游 回 去 。
	AI_Output(self, other, "DIA_Biff_DI_HALLO_07_04"); //可 恶 。 如 果 我 事 先 知 道 是 那 样 的 话 ， 我 肯 定 会 留 在 克 霍 里 尼 斯 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_perm(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_perm_Condition;
	information		= DIA_Biff_DI_perm_Info;
	permanent		= TRUE;
	description		= "所 有 人 都 上 船 了 ？";
};

func int DIA_Biff_DI_perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Biff_DI_HALLO))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other, self, "DIA_Biff_DI_perm_15_00"); //所 有 人 都 上 船 了 ？
	AI_Output(self, other, "DIA_Biff_DI_perm_07_01"); //（ 恼 怒 的 ） 是 的 ， 是 的 。 全 都 安 静 了 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_ORKS(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_ORKS_Condition;
	information		= DIA_Biff_DI_ORKS_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_ORKS_Condition()
{
	if ((Npc_GetDistToWP(self, "DI_SHIP_03") < 1000)
	&& (ORkSturmDI == TRUE)
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_ORKS_07_00"); //那 些 肮 脏 的 野 兽 ！
	AI_Output(other, self, "DIA_Biff_DI_ORKS_15_01"); //该 死 ， 你 在 这 里 做 什 么 ？ 你 应 该 在 保 护 船 。
	AI_Output(self, other, "DIA_Biff_DI_ORKS_07_02"); //它 不 会 那 么 快 沉 没 的 ， 老 兄 。
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_UNDEADDRGDEAD(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 4;
	condition		= DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information		= DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_00"); //是 这 样 吗 ?
	AI_Output(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_01"); //现 在 是 那 样 。
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_02"); //现 在 ， 我 能 … …
	AI_Output(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_03"); //即 便 你 攻 击 整 个 岛 屿 也 与 我 无 关 。
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_04"); //太好了。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "PlunderTempel");
};

///////////////////////////////////////////////////////////////////////
//	Info plunder
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_plunder(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_plunder_Condition;
	information		= DIA_Biff_DI_plunder_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_plunder_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
	&& (Npc_IsDead(UndeadDragon)))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_plunder_07_00"); //该 死 。 现 在 不 行 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Biff_DI_PICKPOCKET(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 900;
	condition		= DIA_Biff_DI_PICKPOCKET_Condition;
	information		= DIA_Biff_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Biff_DI_PICKPOCKET_Condition()
{
	C_Beklauen(92, 450);
};

func void DIA_Biff_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET, DIALOG_BACK, DIA_Biff_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Biff_DI_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};
