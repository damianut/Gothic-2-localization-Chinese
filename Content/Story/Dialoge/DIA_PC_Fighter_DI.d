// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_Gorn_DI_KAP5_EXIT(C_INFO)
{
	npc				= PC_Fighter_DI;
	nr				= 999;
	condition		= DIA_Gorn_DI_KAP5_EXIT_Condition;
	information		= DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gorn_DI_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************
instance DIA_Gorn_DI_Hallo(C_INFO)
{
	npc				= PC_Fighter_DI;
	nr				= 2;
	condition		= DIA_Gorn_DI_Hallo_Condition;
	information		= DIA_Gorn_DI_Hallo_Info;
	permanent		= TRUE;
	description		= "一 切 都 是 船 的 形 状 ？";
};

func int DIA_Gorn_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Hallo_Info()
{
	AI_Output(other, self, "DIA_Gorn_DI_Hallo_15_00"); //一 切 都 是 船 的 形 状 ？

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Gorn_DI_Hallo_12_01"); //现 在 为 止 。 记 住 ， 我 想 见 到 一 些 行 动 。
	}
	else
	{
		AI_Output(self, other, "DIA_Gorn_DI_Hallo_12_02"); //那 里 有 很 多 的 兽 人 吗 ？ 把 他 们 交 给 我 。 我 刚 刚 热 身 完 。
	};
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Gorn_DI_Teach(C_INFO)
{
	npc				= PC_Fighter_DI;
	nr				= 10;
	condition		= DIA_Gorn_DI_Teach_Condition;
	information		= DIA_Gorn_DI_Teach_Info;
	permanent		= TRUE;
	description		= "我 需 要 训 练 。";
};

func int DIA_Gorn_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Gorn_DI_Teach_Info()
{
	AI_Output(other, self, "DIA_Gorn_DI_Teach_15_00"); //我 需 要 训 练 。
	AI_Output(self, other, "DIA_Gorn_DI_Teach_12_01"); //无 伤 大 雅 。

	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach, DIALOG_BACK, DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self, other, "DIA_Gorn_DI_Teach_2H_1_12_00"); //嗯 。 你 以 前 比 那 要 好 。
	};

	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach, DIALOG_BACK, DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_2H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self, other, "DIA_Gorn_DI_Teach_2H_5_12_00"); //你 得 把 武 器 拿 高 一 点 。 一 个 盲 人 也 能 用 他 的 拐 杖 穿 过 你 的 防 卫 。
	};

	Info_ClearChoices(DIA_Gorn_DI_Teach);
	Info_AddChoice(DIA_Gorn_DI_Teach, DIALOG_BACK, DIA_Gorn_DI_Teach_Back);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Gorn_DI_Teach_2H_1);
};

func void DIA_Gorn_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Gorn_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Gorn_DI_UndeadDragonDead(C_INFO)
{
	npc				= PC_Fighter_DI;
	nr				= 2;
	condition		= DIA_Gorn_DI_UndeadDragonDead_Condition;
	information		= DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "你 留 在 船 这 里 ？";
};

func int DIA_Gorn_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Gorn_DI_UndeadDragonDead_OneTime;
func void DIA_Gorn_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Gorn_DI_UndeadDragonDead_15_00"); //你 留 在 船 这 里 ？
	AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_01"); //我 当 然 有 。 只 要 想 想 要 是 它 不 在 那 里 了 我 们 该 怎 么 办 。

	if (DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if (hero.guild == GIL_DJG)
		{
			AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_02"); //现 在 有 什 么 事 情 发 生 ？
			AI_Output(other, self, "DIA_Gorn_DI_UndeadDragonDead_15_03"); //没 什 么 了 。 我 想 回 家 。
			AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_04"); //（ 大 笑 ） 家 ？ 它 在 哪 里 ？ 据 我 所 知 ， 这 样 的 东 西 是 不 属 于 你 的 。
			AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_05"); //让 我 提 一 个 建 议 吧 。 我 们 冲 进 下 一 个 酒 馆 然 后 喝 个 不 省 人 事 。
			AI_Output(other, self, "DIA_Gorn_DI_UndeadDragonDead_15_06"); //嗯 。 也 许 。
			AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_07"); //嘿 ， 别 胡 扯 了 ， 伙 计 。 结 束 了 。
		};

		DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
	};

	if (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
	{
		AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_08"); //还 必 须 有 人 通 知 比 夫 ， 否 则 他 会 死 在 这 座 岛 上 。

		if (Npc_IsDead(Biff_DI) == FALSE)
		{
			AI_Output(other, self, "DIA_Gorn_DI_UndeadDragonDead_15_09"); //他 会 按 时 到 达 这 里 的 。
		};
	};

	AI_Output(self, other, "DIA_Gorn_DI_UndeadDragonDead_12_10"); //这 里 没 有 留 下 任 何 东 西 给 我 们 。 告 诉 船 长 清 理 这 艘 船 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fighter_DI_PICKPOCKET(C_INFO)
{
	npc				= PC_Fighter_DI;
	nr				= 900;
	condition		= DIA_Fighter_DI_PICKPOCKET_Condition;
	information		= DIA_Fighter_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Fighter_DI_PICKPOCKET_Condition()
{
	C_Beklauen(10, 45);
};

func void DIA_Fighter_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET, DIALOG_BACK, DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};

func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DI_PICKPOCKET);
};
