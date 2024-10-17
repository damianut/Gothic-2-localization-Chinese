///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_EXIT(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 999;
	condition		= DIA_Vatras_DI_EXIT_Condition;
	information		= DIA_Vatras_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Vatras_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Vatras_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_HEAL(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 99;
	condition		= DIA_Vatras_DI_HEAL_Condition;
	information		= DIA_Vatras_DI_HEAL_Info;
	permanent		= TRUE;
	description		= "治 疗 我 。";
};

func int DIA_Vatras_DI_HEAL_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_HEAL_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_HEAL_15_00"); //治 疗 我 。

	if (hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self, other, "DIA_Vatras_DI_HEAL_05_01"); //（ 虔 诚 的 ） 亚 达 诺 斯 祝 福 这 个 躯 体 。 它 注 定 将 要 重 建 这 个 世 界 的 平 衡 。
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_DI_HEAL_05_02"); //你 的 身 体 现 在 没 有 损 伤 了 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_TRADE(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 12;
	condition		= DIA_Vatras_DI_TRADE_Condition;
	information		= DIA_Vatras_DI_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 能 卖 我 什 么 东 西 吗 ？";
};

func int DIA_Vatras_DI_TRADE_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_TRADE_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_TRADE_15_00"); //你 能 卖 我 什 么 东 西 吗 ？
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Vatras_DI_TRADE_05_01"); //那 么 你 想 要 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_OBSESSION(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 35;
	condition		= DIA_Vatras_DI_OBSESSION_Condition;
	information		= DIA_Vatras_DI_OBSESSION_Info;
	permanent		= TRUE;
	description		= "帮 帮 我 。 我 被 附 体 了 。";
};

func int DIA_Vatras_DI_OBSESSION_Condition()
{
	if ((SC_IsObsessed == TRUE)
	&& (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_OBSESSION_Info_OneTime;
func void DIA_Vatras_DI_OBSESSION_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_OBSESSION_15_00"); //帮 帮 我 。 我 被 附 体 了 。

	if (Got_HealObsession_Day <= (Wld_GetDay() - 2))
	{
		if (DIA_Vatras_DI_OBSESSION_Info_OneTime <= 1) // 2 mal
		{
			CreateInvItems(self, ItPo_HealObsession_MIS, 1);
			DIA_Vatras_DI_OBSESSION_Info_OneTime = (DIA_Vatras_DI_OBSESSION_Info_OneTime + 1);
		};

		if (Npc_HasItems(self, ItPo_HealObsession_MIS))
		{
			AI_Output(self, other, "DIA_Vatras_DI_OBSESSION_05_01"); //拿 着 这 个 释 放 药 剂 。 皮 罗 卡 给 了 我 一 些 治 疗 炼 金 药 。
			AI_Output(self, other, "DIA_Vatras_DI_OBSESSION_05_02"); //不 管 怎 样 ， 一 定 要 记 住 ： 我 使 你 摆 脱 恶 梦 的 方 法 是 有 限 的 。
			B_GiveInvItems(self, other, ItPo_HealObsession_MIS, 1);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(self, other, "DIA_Vatras_DI_OBSESSION_05_03"); //皮 罗 卡 的 供 应 品 已 经 用 完 了 。 非 常 对 不 起 ， 我 的 朋 友 。 我 再 也 不 能 帮 助 你 了 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_DI_OBSESSION_05_04"); //我 不 能 在 这 么 短 的 时 间 之 内 冒 险 给 你 另 一 瓶 药 剂 。 以 后 再 来 吧 ， 我 的 朋 友 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RAT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_RAT(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 99;
	condition		= DIA_Vatras_DI_RAT_Condition;
	information		= DIA_Vatras_DI_RAT_Info;
	description		= "你 能 给 我 什 么 建 议 ？";
};

func int DIA_Vatras_DI_RAT_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (SC_IsObsessed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_RAT_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_RAT_15_00"); //你 能 给 我 什 么 建 议 ？
	AI_Output(self, other, "DIA_Vatras_DI_RAT_05_01"); //跟 搜 索 者 保 持 距 离 。 记 住 ， 在 远 离 修 道 院 的 地 方 ， 它 们 的 黑 色 凝 视 会 给 你 造 成 巨 大 的 伤 害 。

	if (Npc_HasItems(other, ItAm_Prot_BlackEye_Mis))
	{
		AI_Output(other, self, "DIA_Vatras_DI_RAT_15_02"); //别 担 心 ， 我 有 灵 魂 召 唤 护 身 符 。
	};

	AI_Output(self, other, "DIA_Vatras_DI_RAT_05_03"); //如 果 你 发 生 了 什 么 事 ， 来 找 我 。 我 会 看 看 能 做 些 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info PEDROTOT
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_PEDROTOT(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 3;
	condition		= DIA_Vatras_DI_PEDROTOT_Condition;
	information		= DIA_Vatras_DI_PEDROTOT_Info;
	description		= "我 找 到 了 叛 徒 比 德 罗 。";
};

func int DIA_Vatras_DI_PEDROTOT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_PEDROTOT_VatrasSucked;
func void DIA_Vatras_DI_PEDROTOT_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_PEDROTOT_15_00"); //我 找 到 了 叛 徒 比 德 罗 。
	B_GivePlayerXP(XP_Ambient);

	if ((MIS_Gorax_KillPedro == LOG_SUCCESS)
	&& (Npc_IsDead(Pedro_DI)))
	{
		AI_Output(other, self, "DIA_Vatras_DI_PEDROTOT_15_01"); //他 已 经 死 了 。
		AI_Output(self, other, "DIA_Vatras_DI_PEDROTOT_05_02"); //我 非 常 失 望 。 我 没 想 到 你 会 这 样 。
		AI_Output(other, self, "DIA_Vatras_DI_PEDROTOT_15_03"); //你 是 什 么 意 思 ？
		AI_Output(self, other, "DIA_Vatras_DI_PEDROTOT_05_04"); //我 知 道 你 跟 瑟 朋 帝 兹 有 分 歧 。 总 之 ， 我 非 常 震 惊 ， 最 终 证 明 我 自 己 是 错 误 的 。
		DIA_Vatras_DI_PEDROTOT_VatrasSucked = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_DI_PEDROTOT_05_05"); //那 么 ， 把 他 带 到 船 这 里 来 。 我 们 要 把 他 交 给 克 霍 里 尼 斯 的 法 律 权 力 机 构 。

		if (Npc_IsDead(Pedro_DI))
		{
			AI_Output(other, self, "DIA_Vatras_DI_PEDROTOT_15_06"); //那 已 经 太 晚 了 。 他 已 经 死 了 。
			AI_Output(self, other, "DIA_Vatras_DI_PEDROTOT_05_07"); //（ 感 到 惊 讶 的 ） 哦 。 那 太 可 惜 了 。 我 会 为 他 的 灵 魂 祈 祷 。
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info VatrasSucked
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_VatrasSucked(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 1;
	condition		= DIA_Vatras_DI_VatrasSucked_Condition;
	information		= DIA_Vatras_DI_VatrasSucked_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Vatras_DI_VatrasSucked_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (DIA_Vatras_DI_PEDROTOT_VatrasSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_VatrasSucked_Info()
{
	AI_Output(self, other, "DIA_Vatras_DI_VatrasSucked_05_00"); //从 我 的 视 线 里 消 失 ， 你 这 个 杀 人 犯 。 你 别 期 望 在 我 这 里 得 到 任 何 帮 助 。
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Talente
//***************************************************************************
instance DIA_Vatras_DI_Talente(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 0;
	condition		= DIA_Vatras_DI_Talente_Condition;
	information		= DIA_Vatras_DI_Talente_Info;
	permanent		= TRUE;
	description		= "把 你 的 技 能 教 给 我 。";
};

func int DIA_Vatras_DI_Talente_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Vatras_DI_Talente_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_Talente_15_00"); //把 你 的 技 能 教 给 我 。
	AI_Output(self, other, "DIA_Vatras_DI_Talente_05_01"); //我 会 尽 力 而 为 的 。

	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, "魔 法 环", DIA_Vatras_DI_Talente_CIRCLES);
	};

	Info_AddChoice(DIA_Vatras_DI_Talente, "炼 金 术 - 酿 造 药 剂 的 艺 术", DIA_Vatras_DI_Talente_ALCHIMIE);
};

//**********************************************************
// Addchoices Talente: Magische Kreise
// ------------------------------------
//**********************************************************
func void DIA_Vatras_DI_Talente_CIRCLES()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_1, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 1)), DIA_Vatras_DI_Talente_Circle_1);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_2, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 2)), DIA_Vatras_DI_Talente_Circle_2);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_3, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 3)), DIA_Vatras_DI_Talente_Circle_3);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_4, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 4)), DIA_Vatras_DI_Talente_Circle_4);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_5, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 5)), DIA_Vatras_DI_Talente_Circle_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_LearnMage_6, B_GetLearnCostTalent(other, NPC_TALENT_MAGE, 6)), DIA_Vatras_DI_Talente_Circle_6);
	};
};

//**********************************************************
// Addchoices Talente: Alchimie
// -----------------------------
//**********************************************************
func void DIA_Vatras_DI_Talente_ALCHIMIE()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	Info_AddChoice(DIA_Vatras_DI_Talente, DIALOG_BACK, DIA_Vatras_DI_Talente_BACK);

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Vatras_DI_Talente_POTION_Health_01);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_HealthPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Vatras_DI_Talente_POTION_Health_02);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_HealthPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Vatras_DI_Talente_POTION_Health_03);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Vatras_DI_Talente_POTION_Mana_01);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_ManaPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Vatras_DI_Talente_POTION_Mana_02);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_ManaPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Vatras_DI_Talente_POTION_Mana_03);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_Speed_Potion, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Vatras_DI_Talente_POTION_Speed);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_Str_Permanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Vatras_DI_Talente_POTION_Perm_STR);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_Dex_Permanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Vatras_DI_Talente_POTION_Perm_DEX);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_ManaPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Vatras_DI_Talente_POTION_Perm_Mana);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(DIA_Vatras_DI_Talente, B_BuildLearnString(NAME_HealthPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Vatras_DI_Talente_POTION_Perm_Health);
	};
};

//***************************************************************************
// Talente Magische Kreise
//***************************************************************************
func void DIA_Vatras_DI_Talente_Circle_1()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 1);
};

func void DIA_Vatras_DI_Talente_Circle_2()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 2);
};

func void DIA_Vatras_DI_Talente_Circle_3()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 3);
};

func void DIA_Vatras_DI_Talente_Circle_4()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 4);
};

func void DIA_Vatras_DI_Talente_Circle_5()
{
	AI_Output(self, other, "DIA_Vatras_DI_Talente_Circle_5_05_00"); //你 现 在 是 第 五 环 的 魔 法 师 。 谨 慎 地 使 用 你 学 会 的 魔 法 。
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 5);
};

func void DIA_Vatras_DI_Talente_Circle_6()
{
	AI_Output(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_00"); //你 现 在 能 进 入 魔 法 的 最 高 知 识 境 界 了 。
	AI_Output(self, other, "DIA_Vatras_DI_Talente_Circle_6_05_01"); //接 受 理 智 的 指 引 ， 并 控 制 自 身 的 人 性 弱 点 。 它 们 会 蒙 蔽 你 的 眼 睛 。
	Info_ClearChoices(DIA_Vatras_DI_Talente);
	B_TeachMagicCircle(self, other, 6);
};

//***************************************************************************
// Talente Alchemy
//***************************************************************************

func void DIA_Vatras_DI_Talente_POTION_Health_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
};

func void DIA_Vatras_DI_Talente_POTION_Health_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_02);
};

func void DIA_Vatras_DI_Talente_POTION_Health_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_03);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_02);
};

func void DIA_Vatras_DI_Talente_POTION_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_03);
};

func void DIA_Vatras_DI_Talente_POTION_Speed()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Speed);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_STR()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_STR);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_DEX()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_DEX);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Mana);
};

func void DIA_Vatras_DI_Talente_POTION_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Health);
};

// ------ Back ------
func void DIA_Vatras_DI_Talente_BACK()
{
	Info_ClearChoices(DIA_Vatras_DI_Talente);
};

///////////////////////////////////////////////////////////////////////
//	Info DementorObsessionBook
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_DementorObsessionBook(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 99;
	condition		= DIA_Vatras_DI_DementorObsessionBook_Condition;
	information		= DIA_Vatras_DI_DementorObsessionBook_Info;
	permanent		= TRUE;
	description		= "我 现 在 已 经 得 到 了 附 体 名 单 。";
};

func int DIA_Vatras_DI_DementorObsessionBook_Condition()
{
	if (Npc_HasItems(other, ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_DementorObsessionBook_OneTime;
func void DIA_Vatras_DI_DementorObsessionBook_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_DementorObsessionBook_15_00"); //我 现 在 已 经 得 到 了 附 体 名 单 。
	if (DIA_Vatras_DI_DementorObsessionBook_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_01"); //嗯 。 我 想 如 果 我 们 又 要 离 开 这 里 的 话 ， 最 好 是 把 它 给 修 道 院 里 的 皮 罗 卡 。

		DIA_Vatras_DI_DementorObsessionBook_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Vatras_DI_DementorObsessionBook_05_02"); //你 还 有 更 多 这 种 东 西 吗 ？ 把 你 能 找 到 的 都 给 我 。
	};

	B_GiveInvItems(other, self, ITWR_DementorObsessionBook_MIS, 1);
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Vatras_DI_UndeadDragonDead(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 99;
	condition		= DIA_Vatras_DI_UndeadDragonDead_Condition;
	information		= DIA_Vatras_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 做 到 了 。";
};

func int DIA_Vatras_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Vatras_DI_UndeadDragonDead_OneTime;
func void DIA_Vatras_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Vatras_DI_UndeadDragonDead_15_00"); //我 做 到 了 。

	if (DIA_Vatras_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_01"); //我 知 道 ， 我 能 感 觉 到 。
		AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_02"); //你 已 经 给 了 贝 利 尔 一 个 严 重 的 打 击 ， 那 能 让 他 忙 一 阵 子 了 。

		if (hero.guild == GIL_DJG)
		{
			AI_Output(other, self, "DIA_Vatras_DI_UndeadDragonDead_15_03"); //我 现 在 能 离 开 了 吗 ， 或 者 说 在 其 它 的 房 间 里 还 有 骷 髅 需 要 被 从 这 个 世 界 驱 逐 走 ？
		}
		else
		{
			AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_04"); //但 是 要 记 住 这 仅 仅 是 善 良 与 邪 恶 之 间 的 永 恒 斗 争 中 的 一 小 段 。
		};

		AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_05"); //邪 恶 总 是 能 找 到 途 径 来 到 这 个 世 界 上 。 这 场 战 争 永 远 不 会 停 止 。

		if (hero.guild == GIL_PAL)
		{
			AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_06"); //作 为 一 名 善 良 的 勇 士 ， 你 应 该 知 道 这 些 。
		};

		AI_Output(self, other, "DIA_Vatras_Add_05_15"); //只 有 亚 达 诺 斯 独 自 站 在 两 个 敌 对 的 神 之 间 来 守 护 平 衡 ！
		AI_Output(other, self, "DIA_Vatras_Add_15_16"); //他 其 实 应 该 帮 助 我 。
		AI_Output(self, other, "DIA_Vatras_Add_05_17"); //（ 顽 皮 地 ） 但 他 做 了 - 这 一 点 你 应 该 确 信 。

		DIA_Vatras_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Vatras_DI_UndeadDragonDead_05_09"); //告 诉 船 长 他 该 尽 快 启 航 了 。 这 种 片 刻 的 宁 静 也 许 是 一 种 假 像 。
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOFFFOREVVER_DI
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Vatras_PISSOFFFOREVVER_DI(C_INFO)
{
	npc				= VLK_439_Vatras_DI;
	nr				= 1;
	condition		= DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition;
	information		= DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Condition()
{
	if ((
	(VatrasPissedOffForever == TRUE)
	|| (
	(MadKillerCount >= 7) // SC hat mehr als 6 unschuldige auf dem Gewissen.
	&& (VatrasMadKillerCount != MadKillerCount) // die letzte Chance von Vatras nicht genutzt
	)
	)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

var int DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime;
func void DIA_Addon_Vatras_PISSOFFFOREVVER_DI_Info()
{
	if (DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime == FALSE)
	{
		B_LastWarningVatras();
		DIA_Addon_Vatras_PISSOFFFOREVVER_DI_OneTime = TRUE;
	};

	B_VatrasPissedOff();
	AI_StopProcessInfos(self);
};
