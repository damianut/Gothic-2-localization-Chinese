///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_EXIT(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 999;
	condition		= DIA_Albrecht_EXIT_Condition;
	information		= DIA_Albrecht_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Albrecht_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hagen(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 1;
	condition		= DIA_Albrecht_Hagen_Condition;
	information		= DIA_Albrecht_Hagen_Info;
	description		= "我 需 要 同 哈 根 勋 爵 谈 谈 ！";
};

func int DIA_Albrecht_Hagen_Condition()
{
	if (LordHagen.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Hagen_Info()
{
	AI_Output(other, self, "DIA_Albrecht_Hagen_15_00"); //我 需 要 同 哈 根 勋 爵 谈 谈 ！
	AI_Output(self, other, "DIA_Albrecht_Hagen_03_01"); //他 在 大 厅 里 ， 直 接 穿 过 那 里 。
	AI_Output(self, other, "DIA_Albrecht_Hagen_03_02"); //无 论 你 要 从 他 那 里 了 解 什 么 ， 都 请 简 洁 - 他 是 一 个 忙 人 ！
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Hallo(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 2;
	condition		= DIA_Albrecht_Hallo_Condition;
	information		= DIA_Albrecht_Hallo_Info;
	description		= "成 为 圣 骑 士 有 什 么 意 义 ？";
};

func int DIA_Albrecht_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Albrecht_Hallo_Info()
{
	AI_Output(other, self, "DIA_Albrecht_Hallo_15_00"); //成 为 圣 骑 士 有 什 么 意 义 ？
	AI_Output(self, other, "DIA_Albrecht_Hallo_03_01"); //圣 骑 士 是 英 诺 斯 的 战 士 。 他 的 生 命 是 为 他 服 务 ， 战 斗 是 为 了 他 的 荣 耀 。
	AI_Output(self, other, "DIA_Albrecht_Hallo_03_02"); //作 为 回 报 ， 我 们 收 到 了 一 个 魔 法 礼 物 。 这 个 魔 法 咒 语 - 是 作 为 对 我 们 的 功 绩 的 奖 赏 。
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_CanTeach(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 99;
	condition		= DIA_Albrecht_CanTeach_Condition;
	information		= DIA_Albrecht_CanTeach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Albrecht_CanTeach_Condition()
{
	if (Albrecht_TeachMANA == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Albrecht_CanTeach_15_00"); //你 能 教 我 什 么 吗 ？

	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Albrecht_CanTeach_03_01"); //如 果 你 能 证 明 你 的 价 值 ， 我 将 把 圣 骑 士 的 魔 法 咒 语 赠 给 你 。
		AI_Output(self, other, "DIA_Albrecht_CanTeach_03_02"); //除 了 那 个 以 外 ， 我 还 能 增 加 你 的 魔 法 力 量 。
		Albrecht_TeachMANA = TRUE;
		B_LogEntry(TOPIC_CityTeacher, Topic_CityTeacher_20);
	}
	else
	{
		AI_Output(self, other, "DIA_Albrecht_CanTeach_03_03"); //我 只 指 导 圣 骑 士 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACHPalRunes
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_TEACHPalRunes(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 100;
	condition		= DIA_Albrecht_TEACHPalRunes_Condition;
	information		= DIA_Albrecht_TEACHPalRunes_Info;
	permanent		= TRUE;
	description		= "我 理 应 得 到 一 个 咒 语 ？";
};

func int DIA_Albrecht_TEACHPalRunes_Condition()
{
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_TEACHPalRunes_Info()
{
	AI_Output(other, self, "DIA_Albrecht_TEACHPalRunes_15_00"); //我 理 应 得 到 一 个 咒 语 ？

	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		AI_Output(self, other, "DIA_Albrecht_TEACHPalRunes_03_01"); //作 为 你 等 级 的 标 志 ， 我 授 予 你 光 明 咒 语 。 它 是 真 理 和 公 正 的 象 征 。
		AI_Output(self, other, "DIA_Albrecht_TEACHPalRunes_03_02"); //为 所 有 那 些 沿 着 英 诺 斯 的 道 路 前 进 的 人 照 亮 前 途 。
		AI_Output(self, other, "DIA_Albrecht_TEACHPalRunes_03_03"); //你 必 须 取 得 所 有 其 它 的 咒 语 。 当 你 能 证 明 自 己 的 价 值 时 再 回 来 吧 。

		PLAYER_TALENT_RUNES [SPL_PalLight] = TRUE;

		CreateInvItems(self, ItRu_PalLight, 1);
		B_GiveInvItems(self, other, ItRu_PalLight, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Albrecht_TEACHPalRunes_03_04"); //你 选 择 哪 一 条 路 ？
		AI_Output(self, other, "DIA_Albrecht_TEACHPalRunes_03_05"); //治 疗 之 路 还 是 战 斗 之 路 ？

		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, DIALOG_BACK, DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, "我 选 择 治 疗 路 线 。", DIA_Albrecht_TEACHPalRunes_Heal);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, "我 选 择 战 斗 路 线 。", DIA_Albrecht_TEACHPalRunes_Combat);
	};
};

func void DIA_Albrecht_TEACHPalRunes_BACK()
{
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
};

func void B_Albrecht_YouAreNotWorthy()
{
	AI_Output(self, other, "B_Albrecht_YouAreNotWorthy_03_00"); //你 还 不 足 以 接 受 下 一 个 魔 法 。
};

func void DIA_Albrecht_TEACHPalRunes_Heal()
{
	AI_Output(other, self, "DIA_Albrecht_TEACHPalRunes_Heal_15_00"); //我 选 择 治 疗 路 线 。
	if ((PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	&& (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, DIALOG_BACK, DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString(NAME_SPL_LightHeal, CostForPalSpells), DIA_Albrecht_TEACHPalRunes_PalLightHeal);
	}
	else if ((PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	&& (Kapitel >= 5))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, DIALOG_BACK, DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString(NAME_SPL_MediumHeal, CostForPalSpells), DIA_Albrecht_TEACHPalRunes_PalMediumHeal);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func void DIA_Albrecht_TEACHPalRunes_Combat()
{
	AI_Output(other, self, "DIA_Albrecht_TEACHPalRunes_Combat_15_00"); //我 选 择 战 斗 路 线 。

	if ((PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	&& (MIS_ReadyforChapter4 == TRUE))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, DIALOG_BACK, DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString(NAME_SPL_PalHolyBolt, CostForPalSpells), DIA_Albrecht_TEACHPalRunes_PalHolyBolt);
	}
	else if ((PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	&& (Kapitel >= 5))
	{
		Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, DIALOG_BACK, DIA_Albrecht_TEACHPalRunes_BACK);
		Info_AddChoice(DIA_Albrecht_TEACHPalRunes, B_BuildLearnString(NAME_LEARN_REPEL_EVIL, CostForPalSpells), DIA_Albrecht_TEACHPalRunes_PalRepelEvil);
	}
	else
	{
		B_Albrecht_YouAreNotWorthy();
	};
};

func int DIA_Albrecht_TEACHPalRunes_PalLightHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say(self, other, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	PLAYER_TALENT_RUNES [SPL_PalLightHeal] = TRUE;
	CreateInvItems(self, ItRu_PalLightHeal, 1);
	B_GiveInvItems(self, other, ItRu_PalLightHeal, 1);
	other.lp = (other.lp - CostForPalSpells);
	Info_ClearChoices(DIA_Albrecht_TEACHPalRunes);

	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalMediumHeal()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say(self, other, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	PLAYER_TALENT_RUNES [SPL_PalMediumHeal] = TRUE;
	CreateInvItems(self, ItRu_PalMediumHeal, 1);
	B_GiveInvItems(self, other, ItRu_PalMediumHeal, 1);
	other.lp = (other.lp - CostForPalSpells);
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalHolyBolt()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say(self, other, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	PLAYER_TALENT_RUNES [SPL_PalHolyBolt] = TRUE;
	CreateInvItems(self, ItRu_PalHolyBolt, 1);
	B_GiveInvItems(self, other, ItRu_PalHolyBolt, 1);
	other.lp = (other.lp - CostForPalSpells);
	return TRUE;
};

func int DIA_Albrecht_TEACHPalRunes_PalRepelEvil()
{
	if (other.lp < CostForPalSpells)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say(self, other, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	PLAYER_TALENT_RUNES [SPL_PalRepelEvil] = TRUE;
	CreateInvItems(self, ItRu_PalRepelEvil, 1);
	B_GiveInvItems(self, other, ItRu_PalRepelEvil, 1);
	other.lp = (other.lp - CostForPalSpells);
	return TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Albrecht_Teach(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 101;
	condition		= DIA_Albrecht_Teach_Condition;
	information		= DIA_Albrecht_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 加 我 的 魔 法 能 力 。";
};

func int DIA_Albrecht_Teach_Condition()
{
	if (Albrecht_TeachMANA == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Albrecht_Teach_Info()
{
	AI_Output(other, self, "DIA_Albrecht_Teach_15_00"); //我 要 增 加 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_Albrecht_Teach);
	Info_AddChoice(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_BACK()
{
	if (other.attribute [ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self, other, "DIA_Albrecht_Teach_03_00"); //如 果 你 还 想 进 一 步 增 强 你 的 魔 法 力 量 ， 你 必 须 另 找 一 个 老 师 。
	};

	Info_ClearChoices(DIA_Albrecht_TEACH);
};

func void DIA_Albrecht_Teach_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MED);

	Info_ClearChoices(DIA_Albrecht_Teach);

	Info_AddChoice(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_TEACH_BACK);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Albrecht_Teach_5);
};

func void DIA_Albrecht_Teach_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MED);

	Info_ClearChoices(DIA_Albrecht_Teach);

	Info_AddChoice(DIA_Albrecht_Teach, DIALOG_BACK, DIA_Albrecht_Teach_BACK);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Albrecht_Teach_1);
	Info_AddChoice(DIA_Albrecht_Teach, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Albrecht_Teach_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Albrecht_PICKPOCKET(C_INFO)
{
	npc				= PAL_202_Albrecht;
	nr				= 900;
	condition		= DIA_Albrecht_PICKPOCKET_Condition;
	information		= DIA_Albrecht_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Albrecht_PICKPOCKET_Condition()
{
	C_Beklauen(41, 160);
};

func void DIA_Albrecht_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET, DIALOG_BACK, DIA_Albrecht_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Albrecht_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Albrecht_PICKPOCKET_DoIt);
};

func void DIA_Albrecht_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};

func void DIA_Albrecht_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Albrecht_PICKPOCKET);
};
