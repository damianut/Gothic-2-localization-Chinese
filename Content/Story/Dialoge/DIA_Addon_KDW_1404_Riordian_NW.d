///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_EXIT(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 999;
	condition		= DIA_Addon_Riordian_EXIT_Condition;
	information		= DIA_Addon_Riordian_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Riordian_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Riordian_NW_PICKPOCKET(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 900;
	condition		= DIA_Addon_Riordian_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Riordian_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Riordian_NW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Riordian_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Riordian_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Riordian_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Riordian_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Riordian_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Riordian_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_LightningFlash, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Riordian_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Riordian_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_NW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Hallo(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_Hallo_Condition;
	information		= DIA_Addon_Riordian_Hallo_Info;
	description		= "你 在 做 什 么 ？";
};

func int DIA_Addon_Riordian_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Hallo_15_00"); //你 在 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Hallo_10_01"); //我 正 在 研 究 远 古 民 族 的 文 化 。
	AI_Output(self, other, "DIA_Addon_Riordian_Hallo_10_02"); //根 据 这 些 铭 文 记 载 ， 他 们 生 活 在 很 早 以 前 。
	AI_Output(self, other, "DIA_Addon_Riordian_Hallo_10_03"); //我 不 知 道 他 们 是 什 么 时 候 建 成 这 些 房 间 ， 但 是 他 们 的 文 明 是 高 度 发 展 的 。
	AI_Output(self, other, "DIA_Addon_Riordian_Hallo_10_04"); //他 们 在 山 脉 的 另 一 面 修 建 了 一 个 城 市 。 （ 考 虑 ） 还 有 一 座 亚 达 诺 斯 神 殿 。
};

///////////////////////////////////////////////////////////////////////
//	Info Alter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Alter(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 6;
	condition		= DIA_Addon_Riordian_Alter_Condition;
	information		= DIA_Addon_Riordian_Alter_Info;
	description		= "你 觉 得 这 些 建 筑 有 多 长 时 间 了 ？";
};

func int DIA_Addon_Riordian_Alter_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Alter_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Alter_15_00"); //你 觉 得 这 些 建 筑 有 多 长 时 间 了 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Alter_10_01"); //嗯 。 我 还 无 法 准 确 地 说 明 ， 但 是 它 一 定 有 几 百 年 历 史 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Atlantis
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Atlantis(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 4;
	condition		= DIA_Addon_Riordian_Atlantis_Condition;
	information		= DIA_Addon_Riordian_Atlantis_Info;
	description		= "克 霍 里 尼 斯 岛 上 一 座 消 失 的 城 市 ？";
};

func int DIA_Addon_Riordian_Atlantis_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Riordian_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Atlantis_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Atlantis_15_00"); //克 霍 里 尼 斯 岛 上 一 座 消 失 的 城 市 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Atlantis_10_01"); //是 的 。 到 现 在 为 之 ， 我 们 生 活 在 一 个 我 们 一 直 以 为 已 经 完 全 了 解 的 岛 上 。
	AI_Output(self, other, "DIA_Addon_Riordian_Atlantis_10_02"); //我 们 一 直 以 为 岛 的 整 个 东 北 部 分 是 一 片 庞 大 的 山 脉 。
	AI_Output(self, other, "DIA_Addon_Riordian_Atlantis_10_03"); //但 是 我 们 错 了 。
	AI_Output(self, other, "DIA_Addon_Riordian_Atlantis_10_04"); //在 那 些 山 脉 后 面 ， 坐 落 着 一 个 山 谷 。 远 古 民 族 的 城 市 坐 落 在 那 里 。
	AI_Output(self, other, "DIA_Addon_Riordian_Atlantis_10_05"); //（ 叹 息 ） 如 果 能 见 到 那 座 城 市 的 建 筑 的 话 我 一 定 会 非 常 高 兴 ， 但 是 恐 怕 它 们 很 久 以 前 就 化 为 灰 尘 了 … …

	B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_1);
};

///////////////////////////////////////////////////////////////////////
//	Info SaturasWantYou
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_SaturasWantYou(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_SaturasWantYou_Condition;
	information		= DIA_Addon_Riordian_SaturasWantYou_Info;
	description		= "萨 图 拉 斯 要 见 你 。";
};

func int DIA_Addon_Riordian_SaturasWantYou_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Riordian_Hallo))
	&& (MIS_Addon_Saturas_BringRiordian2Me == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_SaturasWantYou_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_SaturasWantYou_15_00"); //萨 图 拉 斯 要 见 你 。
	AI_Output(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_01"); //他 的 研 究 有 新 的 进 展 吗 ？ 如 果 是 的 话 ， 我 会 立 即 去 找 他 。

	if (Nefarius_NW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_02"); //如 果 你 想 要 多 了 解 一 些 关 于 这 个 建 筑 的 事 ， 那 就 和 内 法 利 尔 斯 谈 谈 。
		AI_Output(self, other, "DIA_Addon_Riordian_SaturasWantYou_10_03"); //你 可 以 在 这 些 地 下 室 的 最 里 面 找 到 他 。
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Saturas");
	MIS_Addon_Saturas_BringRiordian2Me = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
var int Riordian_PermNews;
instance DIA_Addon_Riordian_Perm(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 99;
	condition		= DIA_Addon_Riordian_Perm_Condition;
	information		= DIA_Addon_Riordian_Perm_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 的 发 现 吗 ？";
};

func int DIA_Addon_Riordian_Perm_Condition()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Perm_15_00"); //有 什 么 新 的 发 现 吗 ？
	if (Riordian_PermNews == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Riordian_Perm_10_01"); //已 经 确 认 了 。 这 个 远 古 文 明 的 确 实 信 仰 亚 达 诺 斯 ！
		Riordian_PermNews = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Riordian_Perm_10_02"); //不 太 确 定 。 稍 后 再 来 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachPre
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_TeachPre(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_TeachPre_Condition;
	information		= DIA_Addon_Riordian_TeachPre_Info;
	description		= "瓦 卓 斯 给 了 我 这 个 ‘ 寻 找 磷 火 ’ 护 身 符 … …";
};

func int DIA_Addon_Riordian_TeachPre_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Riordian_Hallo))
	&& (Npc_HasItems(other, ItAm_Addon_WispDetector)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_TeachPre_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_TeachPre_15_00"); //瓦 卓 斯 给 了 我 这 个 ‘ 寻 找 磷 火 ’ 护 身 符 … …
	AI_Output(self, other, "DIA_Addon_Riordian_TeachPre_10_01"); //啊 ！ （ 慎 重 的 ） 一 个 稀 有 宝 物 。 你 可 以 用 它 来 训 练 磷 火 ， 你 知 道 那 个 吗 ？
	AI_Output(other, self, "DIA_Addon_Riordian_TeachPre_15_02"); //你 能 帮 我 吗 ？
	AI_Output(self, other, "DIA_Addon_Riordian_TeachPre_10_03"); //非 常 乐 意 。 我 使 用 这 种 魔 法 已 经 很 长 时 间 了 。
	Riordian_Addon_TeachPlayer = TRUE;

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Teach(C_INFO)
{
	npc				= KDW_1404_Addon_Riordian_NW;
	nr				= 90;
	condition		= DIA_Addon_Riordian_Teach_Condition;
	information		= DIA_Addon_Riordian_Teach_Info;
	permanent		= TRUE;
	description		= "告 诉 我 如 何 训 练 我 的 磷 火 。";
};

var int DIA_Addon_Riordian_Teach_NoPerm;

func int DIA_Addon_Riordian_Teach_Condition()
{
	if ((Riordian_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Npc_HasItems(other, ItAm_Addon_WispDetector)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_Teach);
		Info_AddChoice(DIA_Addon_Riordian_Teach, DIALOG_BACK, DIA_Addon_Riordian_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();

		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)), DIA_Addon_Riordian_Teach_WISPSKILL_FF);
		};

		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)), DIA_Addon_Riordian_Teach_WISPSKILL_NONE);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)), DIA_Addon_Riordian_Teach_WISPSKILL_RUNE);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)), DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)), DIA_Addon_Riordian_Teach_WISPSKILL_FOOD);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)), DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FF()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_FF))
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};

		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_NONE()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_NONE))
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};

		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_RUNE()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_RUNE))
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};

		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_MAGIC()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_MAGIC))
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};

		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_FOOD()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};

func void DIA_Addon_Riordian_Teach_WISPSKILL_POTIONS()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_Teach);
};
