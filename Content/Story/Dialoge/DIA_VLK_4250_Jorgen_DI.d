// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_Jorgen_DI_KAP3_EXIT(C_INFO)
{
	npc				= VLK_4250_Jorgen_DI;
	nr				= 999;
	condition		= DIA_Jorgen_DI_KAP3_EXIT_Condition;
	information		= DIA_Jorgen_DI_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jorgen_DI_KAP3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jorgen_DI_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hallo
//*********************************************************************
instance DIA_Jorgen_DI_Hallo(C_INFO)
{
	npc				= VLK_4250_Jorgen_DI;
	nr				= 4;
	condition		= DIA_Jorgen_DI_Hallo_Condition;
	information		= DIA_Jorgen_DI_Hallo_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Jorgen_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Jorgen_DI_Hallo_15_00"); //一 切 都 好 吗 ？

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Jorgen_DI_Hallo_07_01"); //非 常 肯 定 - 只 要 所 有 那 些 怪 物 离 我 们 远 远 的 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Jorgen_DI_Hallo_07_02"); //兽 人 要 再 那 样 攻 击 下 去 的 话 ， 我 们 就 活 不 成 了 。 所 以 ， 快 点 - 我 们 必 须 离 开 这 里 了。
		B_StartOtherRoutine(Jorgen_DI, "Start");
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Jorgen_DI_UndeadDragonDead(C_INFO)
{
	npc				= VLK_4250_Jorgen_DI;
	nr				= 4;
	condition		= DIA_Jorgen_DI_UndeadDragonDead_Condition;
	information		= DIA_Jorgen_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "敌 人 死 了 。";
};

func int DIA_Jorgen_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Jorgen_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Jorgen_DI_UndeadDragonDead_15_00"); //敌 人 死 了 。
	AI_Output(self, other, "DIA_Jorgen_DI_UndeadDragonDead_07_01"); //那 是 个 好 消 息 。 我 们 在 这 座 岛 上 要 做 的 就 是 这 些 吗 ？

	Info_ClearChoices(DIA_Jorgen_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead, "再 等 一 会 。", DIA_Jorgen_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jorgen_DI_UndeadDragonDead, "是 的 。 就 是 它 。 我 们 走 。", DIA_Jorgen_DI_UndeadDragonDead_over);
};

func void DIA_Jorgen_DI_UndeadDragonDead_moment()
{
	AI_Output(other, self, "DIA_Jorgen_DI_UndeadDragonDead_moment_15_00"); //再 等 一 分 钟 。 我 还 要 处 理 一 些 事 情 。
	AI_Output(self, other, "DIA_Jorgen_DI_UndeadDragonDead_moment_07_01"); //好 吧 。 不 过 要 快 点 。
	AI_StopProcessInfos(self);
};

func void DIA_Jorgen_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};
