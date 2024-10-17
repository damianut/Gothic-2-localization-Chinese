///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Engardo_EXIT(C_INFO)
{
	npc				= SLD_841_Engardo;
	nr				= 999;
	condition		= DIA_Engardo_EXIT_Condition;
	information		= DIA_Engardo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Engardo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Engardo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Engardo_HALLO(C_INFO)
{
	npc				= SLD_841_Engardo;
	nr				= 4;
	condition		= DIA_Engardo_HALLO_Condition;
	information		= DIA_Engardo_HALLO_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Engardo_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

// -----------------------------------
var int Chance;
// -----------------------------------
func void DIA_Engardo_HALLO_Info()
{
	Akils_SLDStillthere = TRUE;
	if (Chance == FALSE)
	{
		AI_Output(self, other, "DIA_Engardo_HALLO_13_00"); //嘿 ， 乡 巴 佬 ， 你 迷 路 了 吗 ？ 回 到 你 的 田 里 去 拔 几 根 大 萝 卜 。
		Chance = 1;
		AI_StopProcessInfos(self);
	}
	else if (Chance == 1)
	{
		AI_Output(self, other, "DIA_Engardo_HALLO_13_01"); //你 在 一 个 错 误 的 时 间 来 到 了 一 个 错 误 的 地 点 … …
		AI_Output(self, other, "DIA_Engardo_HALLO_13_02"); //… … 那 么 我 想 ， 如 果 你 想 活 的 话 ， 最 好 现 在 就 走 开 ， 明 白 吗 ？
		Chance = 2;
		AI_StopProcessInfos(self);
	}
	else if (Chance == 2)
	{
		AI_Output(self, other, "DIA_Engardo_HALLO_13_03"); //你 的 耳 朵 不 好 使 吗 ， 还 是 你 想 找 死 ？ （ 无 情 的 ） 好 吧 - 现 在 已 经 太 晚 了 。

		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Engardo_PICKPOCKET(C_INFO)
{
	npc				= SLD_841_Engardo;
	nr				= 900;
	condition		= DIA_Engardo_PICKPOCKET_Condition;
	information		= DIA_Engardo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Engardo_PICKPOCKET_Condition()
{
	C_Beklauen(34, 45);
};

func void DIA_Engardo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
	Info_AddChoice(DIA_Engardo_PICKPOCKET, DIALOG_BACK, DIA_Engardo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Engardo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Engardo_PICKPOCKET_DoIt);
};

func void DIA_Engardo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
};

func void DIA_Engardo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Engardo_PICKPOCKET);
};
