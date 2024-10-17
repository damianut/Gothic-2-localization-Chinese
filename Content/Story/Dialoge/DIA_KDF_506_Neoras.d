///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Kap1_EXIT(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 999;
	condition		= DIA_Neoras_Kap1_EXIT_Condition;
	information		= DIA_Neoras_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Neoras_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Hallo(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 2;
	condition		= DIA_Neoras_Hallo_Condition;
	information		= DIA_Neoras_Hallo_Info;
	important		= TRUE;
};

func int DIA_Neoras_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	AI_Output(self, other, "DIA_Neoras_Hallo_01_00"); //什 么 … … 发 生 了 什 么 事 ？ 你 为 什 么 要 打 扰 我 ？ 你 没 看 到 我 正 在 进 行 一 项 极 其 复 杂 的 实 验 吗 ？
	AI_Output(other, self, "DIA_Neoras_Hallo_15_01"); //我 没 打 算 打 扰 你 。
	AI_Output(self, other, "DIA_Neoras_Hallo_01_02"); //你 已 经 打 扰 了 。 - 唉 - 嗯 ， 你 想 要 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Arbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Arbeit(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 5;
	condition		= DIA_Neoras_Arbeit_Condition;
	information		= DIA_Neoras_Arbeit_Info;
	description		= "你 有 工 作 给 我 吗 ？";
};

func int DIA_Neoras_Arbeit_Condition()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Neoras_Arbeit_15_00"); //你 有 工 作 给 我 吗 ？
	AI_Output(self, other, "DIA_Neoras_Arbeit_01_01"); //是 的 ， 我 需 要 植 物 来 进 行 我 的 实 验 。 我 们 自 己 种 植 植 物 ， 但 是 我 们 缺 少 火 荨 麻 。
	AI_Output(self, other, "DIA_Neoras_Arbeit_01_02"); //七 朵 应 该 够 了 。 给 我 找 一 些 来 - 哦 ， 还 有 一 件 事 - 我 丢 了 一 张 制 造 魔 法 药 剂 的 配 方
	AI_Output(self, other, "DIA_Neoras_Arbeit_01_03"); //如 果 你 能 找 到 它 的 话 ， 我 会 非 常 感 激 。

	MIS_NeorasPflanzen = LOG_RUNNING;
	MIS_NeorasRezept = LOG_RUNNING;

	Log_CreateTopic(Topic_NeorasPflanzen, LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen, LOG_RUNNING);
	B_LogEntry(Topic_NeorasPflanzen, Topic_NeorasPflanzen_1);

	Log_CreateTopic(Topic_Neorasrezept, LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept, LOG_RUNNING);
	B_LogEntry(Topic_Neorasrezept, Topic_Neorasrezept_1);

	if (Npc_KnowsInfo(other, DIA_Opolos_beibringen))
	{
		B_LogEntry(Topic_Neorasrezept, Topic_Neorasrezept_2);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Rezept abliefern
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Rezept(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 6;
	condition		= DIA_Neoras_Rezept_Condition;
	information		= DIA_Neoras_Rezept_Info;
	permanent		= TRUE;
	description		= "关 于 你 的 配 方 … …";
};

func int DIA_Neoras_Rezept_Condition()
{
	if (MIS_NeorasRezept == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	AI_Output(other, self, "DIA_Neoras_Rezept_15_00"); //关 于 你 的 配 方 … …

	if (B_GiveInvItems(other, self, ItWr_ManaRezept, 1))
	{
		AI_Output(other, self, "DIA_Neoras_Rezept_15_01"); //我 找 到 它 了 。
		AI_Output(self, other, "DIA_Neoras_Rezept_01_02"); //好 。 我 还 担 心 它 就 这 样 永 远 丢 了 。
		AI_Output(self, other, "DIA_Neoras_Rezept_01_03"); //给 ， 拿 上 这 个 魔 法 药 剂 以 表 达 我 的 感 激 。

		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self, other, ItPo_Mana_02, 1);
	}
	else
	{
		AI_Output(other, self, "DIA_Neoras_Rezept_15_04"); //我 还 没 找 到 它 。
		AI_Output(self, other, "DIA_Neoras_Rezept_01_05"); //嗯 ， 如 果 是 那 样 的 话 ， 我 希 望 你 还 能 找 到 它 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Flieder abliefern
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Flieder(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 7;
	condition		= DIA_Neoras_Flieder_Condition;
	information		= DIA_Neoras_Flieder_Info;
	permanent		= TRUE;
	description		= "我 给 你 带 来 了 火 荨 麻 。";
};

func int DIA_Neoras_Flieder_Condition()
{
	if (MIS_NeorasPflanzen == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other, self, "DIA_Neoras_Flieder_15_00"); //我 给 你 带 来 了 火 荨 麻 。

	if (B_GiveInvItems(other, self, ItPl_Mana_Herb_01, 7))
	{
		AI_Output(self, other, "DIA_Neoras_Flieder_01_01"); //好 极 了 ， 我 可 以 用 上 它 了 。 拿 上 这 个 ‘ 风 之 拳 ’ 魔 法 卷 轴 ， 是 我 对 你 的 帮 助 的 感 谢 。

		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self, other, ItSc_Windfist, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_Flieder_01_02"); //哦 ， 真 的 ？ 但 是 你 没 有 找 够 ， 我 需 要 七 朵 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_TEACH(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 10;
	condition		= DIA_Neoras_TEACH_Condition;
	information		= DIA_Neoras_TEACH_Info;
	permanent		= TRUE;
	description		= "我 可 以 向 你 学 习 吗 ？";
};

func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other, self, "DIA_Neoras_TEACH_15_00"); //我 可 以 向 你 学 习 吗 ？

	if ((other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Neoras_TEACH_01_01"); //我 将 会 传 授 你 炼 金 术 的 秘 密 。

		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH, DIALOG_BACK, DIA_Neoras_TEACH_BACK);

		if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Neoras_TEACH_HEALTH_01);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_HealthPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Neoras_TEACH_Health_02);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_HealthPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Neoras_TEACH_Health_03);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_HealthPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Neoras_TEACH_Perm_Health);
		};

		if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Neoras_TEACH_Mana_01);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_ManaPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Neoras_TEACH_Mana_02);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_ManaPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Neoras_TEACH_Mana_03);
		};

		if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
		&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH, B_BuildLearnString(NAME_ManaPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if (hero.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Neoras_TEACH_01_02"); //我 不 传 授 新 信 徒 。 如 果 有 一 天 你 加 入 火 之 环 的 话 。
		AI_Output(self, other, "DIA_Neoras_TEACH_01_03"); //那 我 将 教 你 如 何 制 造 强 力 的 药 剂 。
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_TEACH_01_04"); //我 只 把 知 识 传 授 给 我 们 教 会 的 人 。
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
};

func void DIA_Neoras_TEACH_HEALTH_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_MANA_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
};

func void DIA_Neoras_TEACH_MANA_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_02);
};

func void DIA_Neoras_TEACH_MANA_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Mana);
};

// #####################################################################
// ##
// ## Kapitel 2
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Kap2_EXIT(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 999;
	condition		= DIA_Neoras_Kap2_EXIT_Condition;
	information		= DIA_Neoras_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Neoras_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 3
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Kap3_EXIT(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 999;
	condition		= DIA_Neoras_Kap3_EXIT_Condition;
	information		= DIA_Neoras_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Neoras_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Trank brauen
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_BrewPotion(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 39;
	condition		= DIA_Neoras_BrewPotion_Condition;
	information		= DIA_Neoras_BrewPotion_Info;
	permanent		= TRUE;
	description		= "你 能 帮 我 酿 造 一 种 药 剂 ？";
};

func int DIA_Neoras_BrewPotion_Condition()
{
	if (NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other, self, "DIA_Neoras_BrewPotion_15_00"); //你 能 帮 我 酿 造 一 种 药 剂 ？

	if (hero.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Neoras_BrewPotion_01_01"); //对 于 新 信 徒 而 言 ， 你 非 常 鲁 莽 。 去 完 成 你 的 任 务 。
		AI_Output(self, other, "DIA_Neoras_BrewPotion_01_02"); //你 可 以 从 高 莱 克 斯 那 里 买 到 你 需 要 的 一 切 。
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_BrewPotion_01_03"); //你 怀 疑 我 的 能 力 ？ 我 能 酿 造 一 切 药 剂 。
		AI_Output(other, self, "DIA_Neoras_BrewPotion_15_04"); //很 好 。
		AI_Output(self, other, "DIA_Neoras_BrewPotion_01_05"); //不 要 那 么 急 ， 通 常 你 必 须 给 我 带 来 药 材 ， 并 支 付 一 点 点 经 费 ， 为 了 购 买 原 料 。
		AI_Output(other, self, "DIA_Neoras_BrewPotion_15_06"); //你 想 要 多 少 ？
		AI_Output(self, other, "DIA_Neoras_BrewPotion_01_07"); //酿 造 它 的 话 ， 我 收 费 1 0 枚 金 币 。

		NeorasBrewsForYou = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Was brauche ich für einen...
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Neoras_Ingrediences(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 38;
	condition		= DIA_Neoras_Ingrediences_Condition;
	information		= DIA_Neoras_Ingrediences_Info;
	permanent		= TRUE;
	description		= "Welche Zutaten brauche ich für...";
};

func int DIA_Neoras_Ingrediences_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Ingrediences_Info()
{
	Info_ClearChoices(DIA_Neoras_Ingrediences);
	Info_AddChoice(DIA_Neoras_Ingrediences, DIALOG_BACK, DIA_Neoras_Ingrediences_Back);
	Info_AddChoice(DIA_Neoras_Ingrediences, "einen Trank der Geschwindigkeit?", DIA_Neoras_Ingrediences_Speed);
	Info_AddChoice(DIA_Neoras_Ingrediences, "ein Mana Extrakt?", DIA_Neoras_Ingrediences_Mana);
	Info_AddChoice(DIA_Neoras_Ingrediences, "ein Extrakt der Heilung?", DIA_Neoras_Ingrediences_Health);
};

func void DIA_Neoras_Ingrediences_Back()
{
	Info_ClearChoices(DIA_Neoras_Ingrediences);
};

func void DIA_Neoras_Ingrediences_Speed()
{
	AI_Output(other, self, "DIA_Neoras_Ingrediences_Speed_15_00"); //Welche Zutaten brauche ich für einen Trank der Geschwindigkeit?
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Speed_01_01"); //Für einen Trank, der dich schneller macht, brauche ich fünfmal so genanntes Snapperkraut und einen Kronstöckel.
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Speed_01_02"); //Und vergiss das Gold nicht.
};

func void DIA_Neoras_Ingrediences_Mana()
{
	AI_Output(other, self, "DIA_Neoras_Ingrediences_Mana_15_00"); //Welche Zutaten brauche ich für ein Mana-Extrakt?
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Mana_01_01"); //Ein Manatrank ist nicht wirklich kompliziert.
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Mana_01_02"); //Du musst mir fünfmal Feuerkraut und einen Feldknöterich bringen.
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Mana_01_03"); //Und vergiss das Gold nicht.
};

func void DIA_Neoras_Ingrediences_Health()
{
	AI_Output(other, self, "DIA_Neoras_Ingrediences_Health_15_00"); //Welche Zutaten brauche ich für ein Extrakt der Heilung?
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Health_01_01"); //So ein Trank ist nicht besonders kompliziert.
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Health_01_02"); //Du musst mir nur fünf Heilkräuter und einen Feldknöterich bringen.
	AI_Output(self, other, "DIA_Neoras_Ingrediences_Health_01_03"); //Und vergiss das Gold nicht.
};

*/
///////////////////////////////////////////////////////////////////////
//	Braue mir einen Trank // Ist Perm für KAp 3,4 und 5!!
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_BrewForMe(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 39;
	condition		= DIA_Neoras_BrewForMe_Condition;
	information		= DIA_Neoras_BrewForMe_Info;
	permanent		= TRUE;
	description		= "帮 我 酿 造 … …";
};

func int DIA_Neoras_BrewForMe_Condition()
{
	if (NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe, DIALOG_BACK, DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, "速 度 药 剂 。", DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 魔 力 萃 取 物 。", DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 治 疗 萃 取 物 。", DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other, self, "DIA_Neoras_BrewForMe_Speed_15_00"); //为 我 酿 造 一 瓶 速 度 药 剂 。
	AI_Output(self, other, "DIA_Neoras_BrewForMe_Speed_01_01"); //好 吧 ， 你 有 原 料 和 金 币 吗 ？

	if ((Npc_HasItems(other, ItPl_Speed_Herb_01) >= 1)
	&& (Npc_HasItems(other, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(other, ItMi_Gold) >= 10))
	{
		AI_Output(other, self, "DIA_Neoras_BrewForMe_Speed_15_02"); //是 的 ， 给 。

		B_GiveInvItems(other, self, ItPl_Speed_Herb_01, 1);
		B_GiveInvItems(other, self, ItPl_Temp_Herb, 1);
		B_GiveInvItems(other, self, ItMi_Gold, 10);

		AI_Output(self, other, "DIA_Neoras_BrewForMe_Speed_01_03"); //好 ， 谢 谢 。 我 马 上 给 你 一 瓶 药 剂 ， 那 样 你 就 不 用 等 太 久 了 。

		B_GiveInvItems(self, other, ItPo_Speed, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_BrewForMe_Speed_01_04"); //你 没 有 必 要 的 原 料 。 等 你 把 它 们 都 找 齐 以 后 再 来 。
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe, DIALOG_BACK, DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, "速 度 药 剂 。", DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 魔 力 萃 取 物 。", DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 治 疗 萃 取 物 。", DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other, self, "DIA_Neoras_BrewForMe_Mana_15_00"); //给 我 酿 造 一 份 魔 力 萃 取 物 。
	AI_Output(self, other, "DIA_Neoras_BrewForMe_Mana_01_01"); //好 吧 ， 你 有 原 料 和 金 币 吗 ？

	if ((Npc_HasItems(other, ItPl_Mana_Herb_02) >= 2)
	&& (Npc_HasItems(other, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(other, ItMi_Gold) >= 10))
	{
		AI_Output(other, self, "DIA_Neoras_BrewForMe_Mana_15_02"); //是 的 ， 给 。

		B_GiveInvItems(other, self, ItPl_Mana_Herb_02, 2);
		B_GiveInvItems(other, self, ItPl_Temp_Herb, 1);
		B_GiveInvItems(other, self, ItMi_Gold, 10);

		AI_Output(self, other, "DIA_Neoras_BrewForMe_Mana_01_03"); //好 。 我 马 上 给 你 一 瓶 药 剂 ， 那 样 你 就 不 用 等 太 久 了 。

		B_GiveInvItems(self, other, ItPo_Mana_02, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_BrewForMe_Mana_01_04"); //你 没 有 必 要 的 原 料 。 等 你 把 它 们 都 找 齐 以 后 再 来 。
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe, DIALOG_BACK, DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, "速 度 药 剂 。", DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 魔 力 萃 取 物 。", DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 治 疗 萃 取 物 。", DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other, self, "DIA_Neoras_BrewForMe_Health_15_00"); //给 我 酿 造 一 份 治 疗 炼 金 药 。
	AI_Output(self, other, "DIA_Neoras_BrewForMe_Health_01_01"); //好 吧 ， 你 有 原 料 和 金 币 吗 ？

	if ((Npc_HasItems(other, ItPl_Health_Herb_02) >= 2)
	&& (Npc_HasItems(other, ItPl_Temp_Herb) >= 1)
	&& (Npc_HasItems(other, ItMi_Gold) >= 10))
	{
		AI_Output(other, self, "DIA_Neoras_BrewForMe_Health_15_02"); //是 的 ， 给 。

		B_GiveInvItems(other, self, ItPl_Health_Herb_02, 2);
		B_GiveInvItems(other, self, ItPl_Temp_Herb, 1);
		B_GiveInvItems(other, self, ItMi_Gold, 10);

		AI_Output(self, other, "DIA_Neoras_BrewForMe_Health_01_03"); //好 。 我 马 上 给 你 一 瓶 药 剂 ， 那 样 你 就 不 用 等 太 久 了 。

		B_GiveInvItems(self, other, ItPo_Health_02, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Neoras_BrewForMe_Health_01_04"); //你 没 有 必 要 的 原 料 。 等 你 把 它 们 都 找 齐 以 后 再 来 。
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe, DIALOG_BACK, DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, "速 度 药 剂 。", DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 魔 力 萃 取 物 。", DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, "一 份 治 疗 萃 取 物 。", DIA_Neoras_BrewForMe_Health);
};

// #####################################################################
// ##
// ## Kapitel 4
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Kap4_EXIT(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 999;
	condition		= DIA_Neoras_Kap4_EXIT_Condition;
	information		= DIA_Neoras_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Neoras_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dracheneier
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRACHENEIER(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 40;
	condition		= DIA_Neoras_DRACHENEIER_Condition;
	information		= DIA_Neoras_DRACHENEIER_Info;
	permanent		= TRUE;
	description		= "你 似 乎 工 作 的 满 身 大 汗 。";
};

func int DIA_Neoras_DRACHENEIER_Condition()
{
	if ((Kapitel >= 4)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	&& (MIS_Neoras_DragonEgg == 0))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_15_00"); //你 似 乎 工 作 的 满 身 大 汗 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_01_01"); //是 的 ， 我 已 经 累 死 了 。 几 天 来 我 想 让 这 些 讨 厌 的 调 合 物 起 作 用 ， 但 就 是 无 法 成 功 。

	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, "不 关 我 的 事 。", DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, "那 会 是 什 么 样 的 药 剂 ？", DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, "什 么 难 题 ？", DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_ei_15_00"); //什 么 难 题 ？
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_ei_01_01"); //配 方 里 提 到 一 些 关 于 龙 蛋 的 事 。 当 然 我 没 有 那 种 东 西 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_ei_01_02"); //所 以 我 试 着 模 拟 那 种 成 分 。 然 而 ， 一 点 成 功 的 迹 象 也 没 有 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_ei_01_03"); //如 果 在 山 洞 里 有 那 么 一 个 东 西 正 好 滚 到 你 的 脚 边 上 ， 要 记 得 我 啊。

	Info_AddChoice(DIA_Neoras_DRACHENEIER, "那 你 用 什 么 来 代 替 龙 蛋 ？", DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, "我 要 看 看 我 能 做 什 么 。", DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_00"); //我 要 看 看 我 能 做 什 么 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_ei_jep_01_01"); //嘿 。 那 只 是 一 个 玩 笑 。 我 可 不 相 信 你 真 能 找 到 一 枚 龙 蛋 。
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_ei_jep_15_02"); //等 等 吧 。
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);

	Log_CreateTopic(TOPIC_DRACHENEIERNeoras, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras, LOG_RUNNING);
	B_LogEntry(TOPIC_DRACHENEIERNeoras, TOPIC_DRACHENEIERNeoras_1);

	MIS_Neoras_DragonEgg = LOG_RUNNING;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_ei_statt_15_00"); //那 你 用 什 么 来 代 替 龙 蛋 ？
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_ei_statt_01_01"); //相 信 我 ， 你 一 定 不 想 知 道 的 。
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_trank_15_00"); //那 会 是 什 么 样 的 药 剂 ？
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_trank_01_01"); //我 从 一 个 旅 行 商 人 那 里 买 到 了 这 个 配 方 。 它 提 到 某 些 古 怪 但 是 非 常 有 趣 的 东 西 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_trank_01_02"); //我 无 法 确 定 这 个 药 剂 能 起 什 么 作 用 ， 但 是 我 对 知 识 的 渴 望 促 使 我 继 续 。
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other, self, "DIA_Neoras_DRACHENEIER_no_15_00"); //不 关 我 的 事 。
	AI_Output(self, other, "DIA_Neoras_DRACHENEIER_no_01_01"); //那 么 不 要 再 打 扰 我 了 。
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundDragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_FOUNDDRAGONEGG(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 3;
	condition		= DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information		= DIA_Neoras_FOUNDDRAGONEGG_Info;
	description		= "给 ， 我 给 你 找 到 了 一 枚 龙 蛋 。";
};

func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if ((Npc_HasItems(other, ItAt_DragonEgg_Mis))
	&& (MIS_Neoras_DragonEgg == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int Neoras_DragonEggDrink_Day;
func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_00"); //给 ， 我 给 你 找 到 了 一 枚 龙 蛋 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_01"); //你 在 开 我 的 玩 笑 。
	B_GiveInvItems(other, self, ItAt_DragonEgg_Mis, 1);
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_02"); //这 是 真 的 ！ 我 从 没 想 到 有 这 种 可 能 。 你 在 哪 里 找 到 它 的 ？
	AI_Output(other, self, "DIA_Neoras_FOUNDDRAGONEGG_15_03"); //我 宁 愿 自 己 留 着 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_01_04"); //棒 极 了 。 你 想 用 它 换 什 么 ？

	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);

	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, "真 让 我 吃 惊 。", DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, "那 么 一 些 治 疗 药 剂 怎 么 样 。", DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, "准 备 好 的 话 ， 就 给 我 一 些 药 剂 。", DIA_Neoras_FOUNDDRAGONEGG_trank);
};

var int Neoras_SCWantsDragonEggDrink;
func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other, self, "DIA_Neoras_FOUNDDRAGONEGG_trank_15_00"); //准 备 好 的 话 ， 就 给 我 一 些 药 剂 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_01"); //好 吧 。 但 是 正 像 我 说 的 ， 我 不 知 道 它 会 产 生 什 么 后 果 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_trank_01_02"); //等 我 完 成 它 以 后 再 来 。

	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other, self, "DIA_Neoras_FOUNDDRAGONEGG_heil_15_00"); //那 么 一 些 治 疗 药 剂 怎 么 样 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_heil_01_01"); //明 智 的 选 择 。 给 ， 拿 上 它 们 。 希 望 它 们 对 你 有 用 。

	CreateInvItems(self, ItPo_Health_03, 3);
	B_GiveInvItems(self, other, ItPo_Health_03, 3);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other, self, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00"); //真 让 我 吃 惊 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01"); //嗯 ， 好 。 拿 上 这 个 魔 法 戒 指 。 他 一 定 会 帮 你 战 胜 敌 人 。
	AI_Output(self, other, "DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02"); //它 会 保 护 你 不 受 魔 法 生 物 的 袭 击 。

	CreateInvItems(self, ItRi_Prot_Mage_02, 1);
	B_GiveInvItems(self, other, ItRi_Prot_Mage_02, 1);

	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_DRAGONEGGDRINK(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 3;
	condition		= DIA_Neoras_DRAGONEGGDRINK_Condition;
	information		= DIA_Neoras_DRAGONEGGDRINK_Info;
	description		= "我 来 拿 那 种 不 祥 的 龙 蛋 药 剂 。";
};

func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if ((Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2))
	&& (Neoras_SCWantsDragonEggDrink == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_00"); //我 来 拿 那 种 不 祥 的 龙 蛋 药 剂 。
	AI_Output(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_01"); //是 的 。 我 已 经 完 成 了 。 我 还 没 有 测 试 它 ， 所 以 我 不 承 担 任 何 责 任 ， 你 听 到 了 吗 ？
	AI_Output(other, self, "DIA_Neoras_DRAGONEGGDRINK_15_02"); //马 上 给 我 。
	AI_Output(self, other, "DIA_Neoras_DRAGONEGGDRINK_01_03"); //好 吧 。 希 望 这 个 东 西 不 会 让 你 的 头 爆 炸 。
	CreateInvItems(self, ItPo_DragonEggDrinkNeoras_MIS, 1);
	B_GiveInvItems(self, other, ItPo_DragonEggDrinkNeoras_MIS, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info UsedDragonEggDrink
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_USEDDRAGONEGGDRINK(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 3;
	condition		= DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information		= DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description		= "我 试 用 了 你 的 龙 蛋 酒 。 好 东 西 。";
};

func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if (Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_00"); //我 试 了 你 的 龙 蛋 酒 。 那 真 是 太 棒 了 。
	AI_Output(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_01"); //嗯 。 非 常 有 趣 。 我 绝 对 要 继 续 我 的 研 究 。
	AI_Output(other, self, "DIA_Neoras_USEDDRAGONEGGDRINK_15_02"); //你 还 能 再 帮 我 做 一 些 吗 ？
	AI_Output(self, other, "DIA_Neoras_USEDDRAGONEGGDRINK_01_03"); //最 好 我 们 把 这 个 东 西 再 测 试 几 周 。 否 则 的 话 ， 你 可 能 会 长 出 角 来 。
};

// #####################################################################
// ##
// ## Kapitel 5
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Neoras_Kap5_EXIT(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 999;
	condition		= DIA_Neoras_Kap5_EXIT_Condition;
	information		= DIA_Neoras_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Neoras_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Neoras_PICKPOCKET(C_INFO)
{
	npc				= KDF_506_Neoras;
	nr				= 900;
	condition		= DIA_Neoras_PICKPOCKET_Condition;
	information		= DIA_Neoras_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Neoras_PICKPOCKET_Condition()
{
	C_Beklauen(72, 140);
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET, DIALOG_BACK, DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};
