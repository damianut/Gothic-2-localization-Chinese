///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_EXIT(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 999;
	condition		= DIA_Ruga_EXIT_Condition;
	information		= DIA_Ruga_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ruga_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ruga_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ruga_PICKPOCKET(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 900;
	condition		= DIA_Ruga_PICKPOCKET_Condition;
	information		= DIA_Ruga_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Ruga_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_03) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Ruga_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	Info_AddChoice(DIA_Ruga_PICKPOCKET, DIALOG_BACK, DIA_Ruga_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ruga_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ruga_PICKPOCKET_DoIt);
};

func void DIA_Ruga_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self, other, ItKe_City_Tower_03, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Ruga_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Ruga_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ruga_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Hallo(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 2;
	condition		= DIA_Ruga_Hallo_Condition;
	information		= DIA_Ruga_Hallo_Info;
	important		= TRUE;
};

func int DIA_Ruga_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Hallo_Info()
{
	AI_Output(other, self, "DIA_Ruga_Hallo_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Ruga_Hallo_11_01"); //我 在 训 练 小 伙 子 们 如 何 使 用 弩 ， 并 帮 助 他 们 变 得 更 加 敏 捷 。

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_7);
};

///////////////////////////////////////////////////////////////////////
//	Info Train
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_Train(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 5;
	condition		= DIA_Ruga_Train_Condition;
	information		= DIA_Ruga_Train_Info;
	permanent		= TRUE;
	description		= "你 能 训 练 我 吗 ？";
};

func int DIA_Ruga_Train_Condition()
{
	if (Ruga_TeachCrossbow == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Ruga_Train_Info()
{
	AI_Output(other, self, "DIA_Ruga_Train_15_00"); //你 能 训 练 我 吗 ？

	if ((hero.guild == GIL_MIL)
	|| (hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Ruga_Train_11_01"); //当 然 了 。 如 果 你 有 足 够 的 经 验 ， 我 能 帮 助 你 。
		AI_Output(self, other, "DIA_Ruga_Train_11_02"); //要 一 直 记 住 ， 敏 捷 和 远 程 战 斗 的 关 系 就 像 弩 和 箭 矢 一 样 。 二 者 … …
		AI_Output(other, self, "DIA_Ruga_Train_15_03"); //… … 缺 一 不 可 。 我 明 白 了 。

		Ruga_TeachCrossbow = TRUE;
		Ruga_TeachDEX = TRUE;
	}
	else if ((hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Ruga_Train_11_04"); //别 让 我 看 到 你 ， （ 轻 蔑 的 ） 雇 佣 兵 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Ruga_Train_11_05"); //不 ， 我 只 训 练 国 王 的 军 人 。 别 人 不 行 。
		AI_Output(self, other, "DIA_Ruga_Train_11_06"); //不 过 我 们 一 直 都 需 要 优 秀 的 人 才 。 所 以 ， 如 果 你 想 要 加 入 民 兵 的 话 ， 去 和 安 德 烈 勋 爵 谈 谈 。
	};
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Ruga_Teach(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 100;
	condition		= DIA_Ruga_Teach_Condition;
	information		= DIA_Ruga_Teach_Info;
	permanent		= TRUE;
	description		= "如 何 使 用 弩 。";
};

// -------------------------------------
var int DIA_Ruga_Teach_permanent;
// -------------------------------------
func int DIA_Ruga_Teach_Condition()
{
	if ((Ruga_TeachCrossbow == TRUE)
	&& (DIA_Ruga_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ruga_Teach_Info()
{
	AI_Output(other, self, "DIA_Ruga_Teach_15_00"); //如 何 使 用 弩 。

	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach, DIALOG_BACK, DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 90)
	{
		AI_Output(self, other, "DIA_Ruga_Teach_11_00"); //我 没 有 什 么 可 以 再 教 你 的 了 。 现 在 你 应 该 去 找 其 它 的 老 师 了 。
		DIA_Ruga_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Ruga_Teach);
};

func void DIA_Ruga_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 90);

	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach, DIALOG_BACK, DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Ruga_Teach_1H_5);
};

func void DIA_Ruga_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 90);

	Info_ClearChoices(DIA_Ruga_Teach);
	Info_AddChoice(DIA_Ruga_Teach, DIALOG_BACK, DIA_Ruga_Teach_Back);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Ruga_Teach_1H_1);
	Info_AddChoice(DIA_Ruga_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Ruga_Teach_1H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Ruga_TEACHDEX(C_INFO)
{
	npc				= Mil_317_Ruga;
	nr				= 101;
	condition		= DIA_Ruga_TEACHDEX_Condition;
	information		= DIA_Ruga_TEACHDEX_Info;
	permanent		= TRUE;
	description		= "我 想 变 得 更 敏 捷 。";
};

// ------------------------------------
var int DIA_Ruga_TEACHDEX_permanent;
// ------------------------------------
func int DIA_Ruga_TEACHDEX_Condition()
{
	if ((Ruga_TeachDEX == TRUE)
	&& (DIA_Ruga_TEACHDEX_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ruga_TEACHDEX_Info()
{
	AI_Output(other, self, "DIA_Ruga_TEACHDEX_15_00"); //我 想 变 得 更 敏 捷 。

	Info_ClearChoices(DIA_Ruga_TEACHDEX);
	Info_AddChoice(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_BACK()
{
	if (other.attribute[ATR_DEXTERITY] >= T_LOW)
	{
		AI_Output(self, other, "DIA_Ruga_TEACHDEX_11_00"); //这 是 我 能 教 给 你 的 全 部 。 如 果 你 想 变 得 更 加 敏 捷 ， 去 找 别 的 老 师 吧 。
		DIA_Ruga_TEACHDEX_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Ruga_TEACHDEX);
};

func void DIA_Ruga_TEACHDEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_LOW);

	Info_ClearChoices(DIA_Ruga_TEACHDEX);

	Info_AddChoice(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ruga_TEACHDEX_5);
};

func void DIA_Ruga_TEACHDEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_LOW);

	Info_ClearChoices(DIA_Ruga_TEACHDEX);

	Info_AddChoice(DIA_Ruga_TEACHDEX, DIALOG_BACK, DIA_Ruga_TEACHDEX_BACK);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ruga_TEACHDEX_1);
	Info_AddChoice(DIA_Ruga_TEACHDEX, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ruga_TEACHDEX_5);
};
