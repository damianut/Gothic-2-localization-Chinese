///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_EXIT(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 999;
	condition		= DIA_Addon_Myxir_EXIT_Condition;
	information		= DIA_Addon_Myxir_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Myxir_NW_PICKPOCKET(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 900;
	condition		= DIA_Addon_Myxir_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Myxir_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Myxir_NW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Myxir_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Myxir_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_LightningFlash, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Hallo(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_Hallo_Condition;
	information		= DIA_Addon_Myxir_Hallo_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_Hallo_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Myxir_Hallo_12_01"); //能 在 这 里 行 走 ， 说 明 你 非 常 勇 敢。
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WasMachstDu(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_WasMachstDu_Condition;
	information		= DIA_Addon_Myxir_WasMachstDu_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_WasMachstDu_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_01"); //我 正 在 研 究 建 造 者 的 语 言 。
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_02"); //这 种 语 言 是 了 解 这 个 古 老 民 族 的 关 键 。
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_03"); //我 们 每 个 人 都 必 须 学 习 它 ， 否 则 这 次 调 查 还 没 开 始 就 会 结 束 。
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_04"); //建 造 者 使 用 石 片 来 传 达 他 们 的 知 识 。 不 幸 的 是 ， 它 们 中 的 大 部 分 都 已 经 破 损 ， 或 者 在 多 年 前 就 失 窃 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Steintafeln
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Steintafeln(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_Steintafeln_Condition;
	information		= DIA_Addon_Myxir_Steintafeln_Info;
	description		= "那 这 些 石 片 上 有 什 么 ？";
};

func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_Steintafeln_15_00"); //那 这 些 石 片 上 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_01"); //它 们 包 含 那 个 远 古 民 族 收 藏 的 知 识 。
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_02"); //它 们 中 有 些 会 增 加 战 斗 的 知 识 ， 还 有 使 用 神 奇 的 方 法 增 强 魔 法 的 能 力 。
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_03"); //对 于 那 些 能 够 读 懂 石 片 的 人 来 说 ， 它 们 是 真 正 的 宝 藏 。

	Log_CreateTopic(TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Stoneplates, TOPIC_Addon_Stoneplates_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WillYouTeachMe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WillYouTeachMe(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 10;
	condition		= DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information		= DIA_Addon_Myxir_WillYouTeachMe_Info;
	description		= "你 能 教 我 如 何 阅 读 这 种 预 言 吗 ？";
};

func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_WillYouTeachMe_15_00"); //你 能 教 我 如 何 阅 读 这 种 预 言 吗 ？
	AI_Output(self, other, "DIA_Addon_Myxir_WillYouTeachMe_12_01"); //嗯 。 为 什 么 不 ？ 我 很 乐 意 把 我 的 知 识 传 授 给 你 。
	Myxir_Addon_TeachPlayer = TRUE;

	Log_CreateTopic(TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Stoneplates, LogText_Addon_MyxirTeach);

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Teach(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 90;
	condition		= DIA_Addon_Myxir_Teach_Condition;
	information		= DIA_Addon_Myxir_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 那 种 语 言 。";
};

var int DIA_Addon_Myxir_Teach_NoPerm;

func int DIA_Addon_Myxir_Teach_Condition()
{
	if ((Myxir_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();

	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach, DIALOG_BACK, DIA_Addon_Myxir_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)), DIA_Addon_Myxir_Teach_LANGUAGE_1);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)), DIA_Addon_Myxir_Teach_LANGUAGE_2);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)), DIA_Addon_Myxir_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};
