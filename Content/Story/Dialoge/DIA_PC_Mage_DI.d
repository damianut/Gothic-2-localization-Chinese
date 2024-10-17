// ************************************************************
// 	  				   EXIT
// ************************************************************
instance DIA_Milten_DI_EXIT(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 999;
	condition		= DIA_Milten_DI_EXIT_Condition;
	information		= DIA_Milten_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Milten_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Milten_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*************************************************************
// Hello!
//*************************************************************
instance DIA_Milten_DI_Hello(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 3;
	condition		= DIA_Milten_DI_Hello_Condition;
	information		= DIA_Milten_DI_Hello_Info;
	description		= "就 像 过 去 一 样。";
};

func int DIA_Milten_DI_Hello_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Hello_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_Hello_15_00"); //就 像 过 去 一 样。
	AI_Output(self, other, "DIA_Milten_DI_Hello_03_01"); //你 说 中 了 。 我 很 好 奇 ， 想 看 看 这 次 你 会 不 会 成 功 。
	AI_Output(other, self, "DIA_Milten_DI_Hello_15_02"); //什 么 ？
	AI_Output(self, other, "DIA_Milten_DI_Hello_03_03"); //在 你 周 围 的 一 切 都 乱 套 之 前 自 保 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_TRADE(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 12;
	condition		= DIA_Milten_DI_TRADE_Condition;
	information		= DIA_Milten_DI_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "有 多 的 药 剂 能 分 一 点 吗 ？";
};

func int DIA_Milten_DI_TRADE_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Milten_DI_Hello)))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_TRADE_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_TRADE_15_00"); //有 多 的 药 剂 能 分 一 点 吗 ？
	B_GiveTradeInv(self);
	// Joly: Mc ManaHealth
	//////////////////////////////////////////////////////////////////////////////////////
	Npc_RemoveInvItems(self, ItPo_Health_02, Npc_HasItems(self, ItPo_Health_02));
	CreateInvItems(self, ItPo_Health_02, 15);

	Npc_RemoveInvItems(self, ItPo_Mana_02, Npc_HasItems(self, ItPo_Mana_02));
	CreateInvItems(self, ItPo_Mana_02, 15);
	//////////////////////////////////////////////////////////////////////////////////////

	AI_Output(self, other, "DIA_Milten_DI_TRADE_03_01"); //当 还 有 供 应 的 时 候 。
};

//*************************************************************
// Rat!
//*************************************************************
instance DIA_Milten_DI_Rat(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 3;
	condition		= DIA_Milten_DI_Rat_Condition;
	information		= DIA_Milten_DI_Rat_Info;
	description		= "你 能 给 我 什 么 建 议 ？";
};

func int DIA_Milten_DI_Rat_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Milten_DI_Hello))
	&& (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_Rat_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_Rat_15_00"); //你 能 给 我 什 么 建 议 ？
	AI_Output(self, other, "DIA_Milten_DI_Rat_03_01"); //唔 。 在 所 有 人 里 ， 你 挑 选 我 来 征 求 建 议 ， 这 是 一 种 莫 大 的 荣 耀 。 我 的 脑 子 里 一 直 只 想 着 一 件 事 。
	AI_Output(self, other, "DIA_Milten_DI_Rat_03_02"); //你 带 来 了 英 诺 斯 之 眼 吗 ？

	Info_ClearChoices(DIA_Milten_DI_Rat);

	if (SC_InnosEyeVergessen_DI == TRUE)
	{
		Info_AddChoice(DIA_Milten_DI_Rat, "不。", DIA_Milten_DI_Rat_nein);
	}
	else
	{
		Info_AddChoice(DIA_Milten_DI_Rat, "当然。", DIA_Milten_DI_Rat_ja);
	};
};

func void DIA_Milten_DI_Rat_nein()
{
	AI_Output(other, self, "DIA_Milten_DI_Rat_nein_15_00"); //不。
	AI_Output(self, other, "DIA_Milten_DI_Rat_nein_03_01"); //（ 愤 怒 的 ） 你 是 如 此 … … 那 么 ， 如 果 你 在 这 岛 上 遇 到 龙 ， 你 打 算 怎 么 办 ？
	AI_Output(self, other, "DIA_Milten_DI_Rat_nein_03_02"); //到 现 在 你 还 不 能 聪 明 点 吗 ？ 我 们 这 里 连 炼 金 术 士 工 作 台 都 有 ， 所 以 我 们 能 重 新 补 充 那 个 东 西 。
	AI_Output(self, other, "DIA_Milten_DI_Rat_nein_03_03"); //那 你 在 干 什 么 ？ 我 只 能 希 望 你 的 粗 心 大 意 不 会 要 了 我 们 的 命 。
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

func void DIA_Milten_DI_Rat_ja()
{
	AI_Output(other, self, "DIA_Milten_DI_Rat_ja_15_00"); //当然。
	AI_Output(self, other, "DIA_Milten_DI_Rat_ja_03_01"); //对 不 起 ， 我 问 了 这 么 傻 的 问 题 。 我 有 点 紧 张 。
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Milten_DI_Rat);
};

///////////////////////////////////////////////////////////////////////
//	Info PEDROTOT
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_PEDROTOT(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 3;
	condition		= DIA_Milten_DI_PEDROTOT_Condition;
	information		= DIA_Milten_DI_PEDROTOT_Info;
	description		= "我 找 到 了 比 德 罗 。";
};

func int DIA_Milten_DI_PEDROTOT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_PEDROTOT_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_PEDROTOT_15_00"); //我 找 到 了 比 德 罗 。
	AI_Output(self, other, "DIA_Milten_DI_PEDROTOT_03_01"); //（ 感 到 惊 讶 的 ） 什 么 ？ 哪 里 ？ 在 这 座 岛 上 ？ 该 死 ， 但 他 真 的 让 人 难 以 置 信 。
	AI_Output(self, other, "DIA_Milten_DI_PEDROTOT_03_02"); //我 真 的 不 知 道 他 是 一 个 这 么 可 恶 的 混 蛋 。
	B_GivePlayerXP(XP_Ambient);

	if (Npc_IsDead(Pedro_DI))
	{
		AI_Output(other, self, "DIA_Milten_DI_PEDROTOT_15_03"); //他 已 经 死 了 。
		AI_Output(self, other, "DIA_Milten_DI_PEDROTOT_03_04"); //是 吗 ？ 好 吧 。 愿 他 的 灵 魂 得 到 安 宁 。 虽 然 我 不 能 说 我 非 常 难 过 ， 然 而 我 还 是 希 望 能 跟 他 谈 谈 。
	}
	else
	{
		AI_Output(self, other, "DIA_Milten_DI_PEDROTOT_03_05"); //我 临 时 为 他 工 作 ， 就 在 不 久 前 。
	};
};

//*************************************************************
// TeachMagic!
//*************************************************************
instance DIA_Milten_DI_TeachMagic(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 31;
	condition		= DIA_Milten_DI_TeachMagic_Condition;
	information		= DIA_Milten_DI_TeachMagic_Info;
	permanent		= TRUE;
	description		= "我 想 要 提 高 我 的 魔 法 技 能 。";
};

func int DIA_Milten_DI_TeachMagic_Condition()
{
	if ((Npc_IsDead(UndeadDragon) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Milten_DI_Hello)))
	{
		return TRUE;
	};
};

var int DIA_Milten_DI_TeachMagic_OneTime;
func void DIA_Milten_DI_TeachMagic_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_TeachMagic_15_00"); //我 想 要 提 高 我 的 魔 法 技 能 。

	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Milten_DI_TeachMagic_03_01"); //我 会 尽 最 大 努 力 。
	}
	else
	{
		if (DIA_Milten_DI_TeachMagic_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Milten_DI_TeachMagic_03_02"); //我 会 帮 助 你 ， 但 只 有 在 你 能 确 保 那 些 兽 人 呆 在 原 地 不 动 的 情 况 下 。
			DIA_Milten_DI_TeachMagic_OneTime = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Milten_DI_TeachMagic_03_03"); //好 吧 。 你 需 要 些 什 么 ？
		};
	};

	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Milten_DI_TeachMagic_MANA_5);

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, "制 造 咒 语", DIA_Milten_DI_TeachMagic_RUNES);
	};
};

// ------ 1 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_1()
{
	if (B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_HIGH))
	{
		AI_Output(self, other, "DIA_Milten_DI_TeachMagic_MANA_1_03_00"); //愿 英 诺 斯 指 引 你 。
	};

	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Milten_DI_TeachMagic_MANA_5);

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, "制 造 咒 语", DIA_Milten_DI_TeachMagic_RUNES);
	};
};

// ------ 5 Mana ------
func void DIA_Milten_DI_TeachMagic_MANA_5()
{
	if (B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_HIGH))
	{
		AI_Output(self, other, "DIA_Milten_DI_TeachMagic_MANA_5_03_00"); //愿 英 诺 斯 的 光 芒 照 亮 你
	};

	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Milten_DI_TeachMagic_MANA_1);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Milten_DI_TeachMagic_MANA_5);

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, "制 造 咒 语", DIA_Milten_DI_TeachMagic_RUNES);
	};
};

func void DIA_Milten_DI_TeachMagic_RUNES()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	AI_Output(self, other, "DIA_Milten_DI_TeachMagic_RUNES_03_00"); //哦 ， 不 ！ 那 真 的 不 是 我 的 专 长 ， 但 我 们 会 想 办 法 应 付 过 去 的 。

	if (hero.guild == GIL_PAL)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, "圣 骑 士 咒 语", DIA_Milten_DI_TeachMagic_Runen_Paladin);
	}
	else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " 第 四 环", DIA_Milten_DI_TeachMagic_Runen_Circle_4);
	}
	else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " 第五环", DIA_Milten_DI_TeachMagic_Runen_Circle_5);
	}
	else if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, " 第六环", DIA_Milten_DI_TeachMagic_Runen_Circle_6);
	}
	else
	{
		AI_Output(self, other, "DIA_Milten_DI_TeachMagic_RUNES_03_01"); //哦 。 你 仍 然 没 有 完 全 准 备 好 。 先 学 更 高 一 点 的 环 ， 然 后 我 就 能 帮 你 了 。
	};
};

//***************************************************************************
// Talente Runen
// ----------------------
// Paladin Runen
// ----------------------
//***************************************************************************

func void DIA_Milten_DI_TeachMagic_Runen_Paladin()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	if (PLAYER_TALENT_RUNES [SPL_PalLight] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_LIGHT, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalLight)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalLightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_PalLightHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalLightHeal)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalHolyBolt] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_PalHolyBolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalHolyBolt)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalMediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_PalMediumHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalMediumHeal)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalRepelEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_LEARN_REPEL_EVIL2, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalRepelEvil)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalFullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_PalFullHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalFullHeal)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_PalDestroyEvil] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_PalDestroyEvil, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_PalDestroyEvil)), DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLight()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalLight);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalLightHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalLightHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalHolyBolt()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalHolyBolt);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalMediumHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalMediumHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalRepelEvil()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalRepelEvil);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalFullHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalFullHeal);
};

func void DIA_Milten_DI_TeachMagic_Runen_Paladin_SPL_PalDestroyEvil()
{
	B_TeachPlayerTalentRunes(self, other, SPL_PalDestroyEvil);
};

//**********************************************************
// Vierter Kreis
// --------------------------
//**********************************************************
func void DIA_Milten_DI_TeachMagic_Runen_Circle_4()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_SummonGolem, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGolem)), DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem);
	};

	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_DestroyUndead, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_DestroyUndead)), DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead);
	};

	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_LightningFlash, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LightningFlash)), DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash);
	};

	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_ChargeFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ChargeFireball)), DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ChargeFireball);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGolem);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self, other, SPL_DestroyUndead);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LightningFlash);
};

//**********************************************************
// Fünfter Kreis
// --------------------------
//**********************************************************
func void DIA_Milten_DI_TeachMagic_Runen_Circle_5()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_IceWave, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_IceWave)), DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave);
	};

	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_SummonDemon, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonDemon)), DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon);
	};

	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_FullHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_FullHeal)), DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_Pyrokinesis, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Pyrokinesis)), DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Pyrokinesis);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self, other, SPL_IceWave);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonDemon);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_FullHeal);
};

//**********************************************************
// Sechster Kreis
// --------------------------
//**********************************************************
func void DIA_Milten_DI_TeachMagic_Runen_Circle_6()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
	Info_AddChoice(DIA_Milten_DI_TeachMagic, DIALOG_BACK, DIA_Milten_DI_TeachMagic_BACK);

	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_Firerain, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firerain)), DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain);
	};

	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_BreathOfDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_BreathOfDeath)), DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath);
	};

	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_MassDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_MassDeath)), DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath);
	};

	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)), DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness);
	};

	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Milten_DI_TeachMagic, B_BuildLearnString(NAME_SPL_Shrink, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Shrink)), DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink);
	};
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firerain);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_BreathOfDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_MassDeath);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ArmyOfDarkness);
};

func void DIA_Milten_DI_TeachMagic_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Shrink);
};

func void DIA_Milten_DI_TeachMagic_BACK()
{
	Info_ClearChoices(DIA_Milten_DI_TeachMagic);
};

///////////////////////////////////////////////////////////////////////
//	Info DementorObsessionBook
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_DementorObsessionBook(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 99;
	condition		= DIA_Milten_DI_DementorObsessionBook_Condition;
	information		= DIA_Milten_DI_DementorObsessionBook_Info;
	description		= "这 本 书 ， 附 体 名 单 ， 让 你 想 起 了 什 么 吗 ？";
};

func int DIA_Milten_DI_DementorObsessionBook_Condition()
{
	if (Npc_HasItems(other, ITWR_DementorObsessionBook_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DementorObsessionBook_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_DementorObsessionBook_15_00"); //这 本 书 ， 附 体 名 单 ， 让 你 想 起 了 什 么 吗 ？
	AI_Output(self, other, "DIA_Milten_DI_DementorObsessionBook_03_01"); //皮 罗 卡 是 这 种 书 的 专 家 。
	AI_Output(self, other, "DIA_Milten_DI_DementorObsessionBook_03_02"); //对 不 起 。 我 知 道 的 东 西 太 少 ， 所 以 对 于 那 些 事 情 我 发 表 不 了 什 么 聪 明 的 见 解 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info DragonEgg
///////////////////////////////////////////////////////////////////////
instance DIA_Milten_DI_DragonEgg(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 99;
	condition		= DIA_Milten_DI_DragonEgg_Condition;
	information		= DIA_Milten_DI_DragonEgg_Info;
	description		= "你 有 龙 蛋 的 经 验 吗 ？";
};

func int DIA_Milten_DI_DragonEgg_Condition()
{
	if (Npc_HasItems(other, ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Milten_DI_DragonEgg_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_DragonEgg_15_00"); //你 有 龙 蛋 的 经 验 吗 ？
	AI_Output(self, other, "DIA_Milten_DI_DragonEgg_03_01"); //不 ， 不 是 这 样 。 我 曾 经 听 说 一 个 聪 明 的 炼 金 术 士 曾 设 法 用 它 酿 造 出 了 一 种 强 效 的 药 剂 。
	AI_Output(self, other, "DIA_Milten_DI_DragonEgg_03_02"); //但 请 不 要 向 我 要 这 个 配 方 。 我 不 知 道 。
	B_GivePlayerXP(XP_Ambient);
};

//*************************************************************
//	UndeadDragonDead
//*************************************************************
instance DIA_Milten_DI_UndeadDragonDead(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 31;
	condition		= DIA_Milten_DI_UndeadDragonDead_Condition;
	information		= DIA_Milten_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "好 吧 。 就 这 样 ！";
};

func int DIA_Milten_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Milten_DI_UndeadDragonDead_OneTime;
func void DIA_Milten_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Milten_DI_UndeadDragonDead_15_00"); //好 吧 。 就 这 样 ！ 现 在 这 个 神 殿 已 经 失 去 了 力 量 。

	if (DIA_Milten_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_01"); //你 怎 么 总 能 成 功 ， 嗯 ？
		AI_Output(other, self, "DIA_Milten_DI_UndeadDragonDead_15_02"); //鬼 才 知 道 。
		AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_03"); //（ 大 笑 ） 我 们 究 竟 会 不 会 有 一 些 安 宁 日 子 ？ 我 们 当 然 会 有 。

		if (hero.guild == GIL_KDF)
		{
			AI_Output(other, self, "DIA_Milten_DI_UndeadDragonDead_15_04"); //你 现 在 要 做 什 么 ？
			AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_05"); //我 想 建 立 一 所 自 己 的 学 院 ， 在 那 里 宣 传 我 们 的 宗 教 信 仰 。 但 那 也 许 会 以 别 的 方 式 实 现 。
			AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_06"); //我 从 来 没 有 后 悔 成 为 一 名 火 魔 法 师 。 你 是 怎 么 想 的 呢 ？
			AI_Output(other, self, "DIA_Milten_DI_UndeadDragonDead_15_07"); //我 不 很 确 定 。
			AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_08"); //（ 大 笑 ） 口 渴 ， 象 往 常 一 样 。 嘿 ， 伙 计 。 你 刚 刚 拯 救 了 整 个 世 界 。 难 道 这 不 值 得 高 兴 吗 ？
			AI_Output(other, self, "DIA_Milten_DI_UndeadDragonDead_15_09"); //嗯 。 也 许 。
		};

		AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_10"); //好 吧 ， 我 的 朋 友 ， 我 想 你 现 在 最 需 要 的 是 打 个 盹 儿 。
		DIA_Milten_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Milten_DI_UndeadDragonDead_03_11"); //你 应 该 直 接 去 找 船 长 让 他 启 航。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Mage_DI_PICKPOCKET(C_INFO)
{
	npc				= PC_Mage_DI;
	nr				= 900;
	condition		= DIA_Mage_DI_PICKPOCKET_Condition;
	information		= DIA_Mage_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Mage_DI_PICKPOCKET_Condition()
{
	C_Beklauen(45, 120);
};

func void DIA_Mage_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET, DIALOG_BACK, DIA_Mage_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Mage_DI_PICKPOCKET_DoIt);
};

func void DIA_Mage_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};

func void DIA_Mage_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_DI_PICKPOCKET);
};
