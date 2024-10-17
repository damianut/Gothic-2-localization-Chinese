///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_EXIT(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 999;
	condition		= DIA_Sagitta_EXIT_Condition;
	information		= DIA_Sagitta_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sagitta_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HALLO(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 4;
	condition		= DIA_Sagitta_HALLO_Condition;
	information		= DIA_Sagitta_HALLO_Info;
	description		= "你 自 己 一 个 人 到 了 这 里 ？";
};

func int DIA_Sagitta_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sagitta_HALLO_Info()
{
	AI_Output(other, self, "DIA_Sagitta_HALLO_15_00"); //你 自 己 一 个 人 到 了 这 里 ？
	AI_Output(self, other, "DIA_Sagitta_HALLO_17_01"); //告 诉 我 你 想 要 什 么 ， 然 后 走 开 。 我 很 忙 。

	Info_ClearChoices(DIA_Sagitta_HALLO);
	Info_AddChoice(DIA_Sagitta_HALLO, DIALOG_BACK, DIA_Sagitta_HALLO_ende);
	Info_AddChoice(DIA_Sagitta_HALLO, "你 能 治 好 我 吗 ？", DIA_Sagitta_HALLO_Heil);
	Info_AddChoice(DIA_Sagitta_HALLO, "你 在 这 里 做 什 么 ？", DIA_Sagitta_HALLO_was);
	Info_AddChoice(DIA_Sagitta_HALLO, "你 是 谁 ？", DIA_Sagitta_HALLO_wer);
};

func void DIA_Sagitta_HALLO_wer()
{
	AI_Output(other, self, "DIA_Sagitta_HALLO_wer_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Sagitta_HALLO_wer_17_01"); //那 么 你 没 有 听 我 说 话 ？
	AI_Output(self, other, "DIA_Sagitta_HALLO_wer_17_02"); //他 们 说 ， 草 药 女 巫 。 他 们 叫 我 冒 牌 医 生 。
	AI_Output(self, other, "DIA_Sagitta_HALLO_wer_17_03"); //但 是 当 他 们 病 情 严 重 的 时 候 ， 他 们 就 会 突 然 记 起 善 良 的 老 萨 吉 塔 和 她 的 治 疗 草 药 。
};

func void DIA_Sagitta_HALLO_was()
{
	AI_Output(other, self, "DIA_Sagitta_HALLO_was_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Sagitta_HALLO_was_17_01"); //自 从 我 能 记 事 的 时 候 ， 我 就 住 在 这 里 ， 处 理 我 的 草 药 。
	AI_Output(self, other, "DIA_Sagitta_HALLO_was_17_02"); //森 林 是 我 的 朋 友 。 它 向 我 提 供 所 需 的 一 切 。
};

func void DIA_Sagitta_HALLO_Heil()
{
	AI_Output(other, self, "DIA_Sagitta_HALLO_Heil_15_00"); //你 能 治 好 我 吗 ?
	AI_Output(self, other, "DIA_Sagitta_HALLO_Heil_17_01"); //那 就 是 你 来 的 目 的 ， 不 是 吗 ？ 那 就 告 诉 我 你 有 哪 里 不 舒 服 。

	Log_CreateTopic(Topic_SoldierTrader, LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader, Topic_SoldierTrader_1);
};

func void DIA_Sagitta_HALLO_ende()
{
	Info_ClearChoices(DIA_Sagitta_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemyRequest
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TeachAlchemyRequest(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 6;
	condition		= DIA_Sagitta_TeachAlchemyRequest_Condition;
	information		= DIA_Sagitta_TeachAlchemyRequest_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 你 的 草 药 知 识 吗 ？";
};

func int DIA_Sagitta_TeachAlchemyRequest_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	&& (MIS_Sagitta_Herb == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Sagitta_TeachAlchemyRequest_OneTime;
func void DIA_Sagitta_TeachAlchemyRequest_Info()
{
	AI_Output(other, self, "DIA_Sagitta_TeachAlchemyRequest_15_00"); //你 能 教 我 你 的 草 药 知 识 吗 ？

	if (DIA_Sagitta_TeachAlchemyRequest_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_01"); //多 么 有 意 思 。 我 不 是 经 常 接 到 那 样 的 请 求 。
		AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_02"); //你 想 成 为 我 的 学 生 ？ 那 么 你 首 先 需 要 证 明 你 的 请 求 是 认 真 的 。
		AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_03"); //现 在 ， 我 正 在 制 作 一 种 非 常 稀 有 的 药 剂 ， 它 要 使 用 极 其 完 美 的 草 药 和 汁 液 。
		AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_04"); //如 果 你 能 给 我 找 到 一 种 原 料 - 一 种 非 常 稀 有 、 而 且 我 这 里 没 有 的 药 草 - 我 就 会 训 练 你 。
		DIA_Sagitta_TeachAlchemyRequest_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_17_05"); //我 已 经 告 诉 你 了 ： 是 的 ， 在 你 给 你 带 来 那 种 稀 有 原 料 之 后 。
	};

	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, "对 不 起 ， 不 感 兴 趣 。", DIA_Sagitta_TeachAlchemyRequest_nein);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, "我 在 哪 里 能 找 到 这 种 原 料 ？", DIA_Sagitta_TeachAlchemyRequest_wo);
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, "那 是 什 么 原 料 ？", DIA_Sagitta_TeachAlchemyRequest_was);
};

func void DIA_Sagitta_TeachAlchemyRequest_was()
{
	AI_Output(other, self, "DIA_Sagitta_TeachAlchemyRequest_was_15_00"); //那 是 什 么 原 料 ？
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_was_17_01"); //它 是 一 种 极 稀 有 的 植 物 - 一 种 叫 作 太 阳 芦 荟 的 药 草 。 你 可 以 从 它 特 别 浓 烈 的 杏 仁 味 道 分 辨 出 它 来 。
};

func void DIA_Sagitta_TeachAlchemyRequest_wo()
{
	AI_Output(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_15_00"); //我 在 哪 里 能 找 到 这 种 原 料 ？
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_01"); //我 需 要 的 这 种 药 草 只 生 长 在 它 能 获 得 生 长 所 需 的 所 有 养 分 的 地 方 。
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_02"); //这 些 都 可 以 从 黑 巨 魔 的 粪 便 中 获 得 。
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_17_03"); //所 以 对 我 来 说 ， 想 得 到 它 才 会 那 么 困 难 ， 你 明 白 了 吗 ？
	Info_AddChoice(DIA_Sagitta_TeachAlchemyRequest, "看 看 我 是 否 能 在 其 它 地 方 得 到 它 。", DIA_Sagitta_TeachAlchemyRequest_wo_ja);
};

func void DIA_Sagitta_TeachAlchemyRequest_wo_ja()
{
	AI_Output(other, self, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00"); //看 看 我 是 否 能 在 其 它 地 方 得 到 它 。
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01"); //那 么 ， 祝 你 在 搜 索 的 过 程 中 好 运 。
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
	MIS_Sagitta_Herb = LOG_RUNNING;

	Log_CreateTopic(TOPIC_SagittaHerb, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SagittaHerb, LOG_RUNNING);
	B_LogEntry(TOPIC_SagittaHerb, TOPIC_SagittaHerb_1);
};

func void DIA_Sagitta_TeachAlchemyRequest_nein()
{
	AI_Output(other, self, "DIA_Sagitta_TeachAlchemyRequest_nein_15_00"); //对 不 起 ， 不 感 兴 趣 。
	AI_Output(self, other, "DIA_Sagitta_TeachAlchemyRequest_nein_17_01"); //不 要 再 说 废 话 浪 费 我 的 时 间 。
	Info_ClearChoices(DIA_Sagitta_TeachAlchemyRequest);
};

///////////////////////////////////////////////////////////////////////
//	Info Sagitta_Herb
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Sagitta_Herb(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 3;
	condition		= DIA_Sagitta_Sagitta_Herb_Condition;
	information		= DIA_Sagitta_Sagitta_Herb_Info;
	description		= "我 找 到 了 太 阳 芦 荟 。";
};

func int DIA_Sagitta_Sagitta_Herb_Condition()
{
	if ((Npc_HasItems(other, ItPl_Sagitta_Herb_MIS))
	&& (MIS_Sagitta_Herb == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Sagitta_Herb_Info()
{
	AI_Output(other, self, "DIA_Sagitta_Sagitta_Herb_15_00"); //我 找 到 了 太 阳 芦 荟 。
	AI_Output(self, other, "DIA_Sagitta_Sagitta_Herb_17_01"); //谢 谢 你 。 现 在 你 可 以 随 便 问 我 你 想 要 了 解 的 酿 造 药 剂 的 知 识 。
	B_GiveInvItems(other, self, ItPl_Sagitta_Herb_MIS, 1);
	Sagitta_TeachAlchemy = TRUE;
	MIS_Sagitta_Herb = LOG_SUCCESS;
	B_GivePlayerXP(XP_Sagitta_Sonnenaloe);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Teach(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 2;
	condition		= DIA_Sagitta_Teach_Condition;
	information		= DIA_Sagitta_Teach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 酿 造 什 么 药 剂 ？";
};

// ----------------------------------------
var int DIA_Sagitta_Teach_permanent;
// ----------------------------------------

func int DIA_Sagitta_Teach_Condition()
{
	if ((DIA_Sagitta_Teach_permanent == FALSE)
	&& (Sagitta_TeachAlchemy == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other, self, "DIA_Sagitta_Teach_15_00"); //你 能 教 我 酿 造 什 么 药 剂 ？

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE))
	{
		Info_ClearChoices(DIA_Sagitta_Teach);
		Info_AddChoice(DIA_Sagitta_Teach, DIALOG_BACK, DIA_Sagitta_Teach_BACK);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Sagitta_Teach_Health_01);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_HealthPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Sagitta_Teach_Health_02);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Sagitta_Teach_Mana_01);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_ManaPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Sagitta_Teach_Mana_02);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_ManaPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Sagitta_Teach_Mana_03);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_ManaPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Sagitta_Teach_Perm_Mana);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Sagitta_Teach, B_BuildLearnString(NAME_Dex_Permanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Sagitta_Teach_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output(self, other, "DIA_Sagitta_Teach_17_01"); //在 我 教 你 炼 金 术 之 前 ， 我 首 先 要 告 诉 你 酿 造 药 剂 需 要 什 么 。
			AI_Output(self, other, "DIA_Sagitta_Teach_17_02"); //炼 金 术 士 工 作 台 就 是 酿 造 药 剂 的 厨 房 。 你 还 需 要 一 支 空 的 实 验 烧 瓶 来 存 放 酿 好 的 药 剂 。
			AI_Output(self, other, "DIA_Sagitta_Teach_17_03"); //然 后 你 需 要 添 加 所 需 的 原 料 ， 最 后 你 的 药 剂 就 好 了 。
			AI_Output(self, other, "DIA_Sagitta_Teach_17_04"); //当 然 ， 你 可 以 从 我 这 里 学 到 这 些 知 识 。
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Sagitta_Teach_17_05"); //那 么 你 想 学 习 酿 造 哪 种 药 剂 ？
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Sagitta_Teach_17_06"); //你 已 经 学 会 了 我 所 有 能 够 传 授 的 技 能 。
		DIA_Sagitta_Teach_permanent = TRUE;
	};
};

func void DIA_Sagitta_Teach_BACK()
{
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Health_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_02);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_03);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Mana);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

func void DIA_Sagitta_Teach_Perm_Dex()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_DEX);
	Info_ClearChoices(DIA_Sagitta_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info HEAL
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEAL(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 99; // Joly: braucht ne hohe Nummer, denn wird in den späteren Kapiteln auch verwendet.
	condition		= DIA_Sagitta_HEAL_Condition;
	information		= DIA_Sagitta_HEAL_Info;
	permanent		= TRUE;
	description		= "治 疗 我 。";
};

func int DIA_Sagitta_HEAL_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEAL_Info()
{
	AI_Output(other, self, "DIA_Sagitta_HEAL_15_00"); //治 疗 我 。

	if (hero.attribute [ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self, other, "DIA_Sagitta_HEAL_17_01"); //让 我 看 看 。 嗯 ， 我 的 药 膏 可 以 治 好 你 最 严 重 的 伤 口 。
		hero.attribute [ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);
	}
	else
	{
		AI_Output(self, other, "DIA_Sagitta_HEAL_17_02"); //你 现 在 不 需 要 治 疗 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_TRADE(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 0;
	condition		= DIA_Sagitta_TRADE_Condition;
	information		= DIA_Sagitta_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 都 提 供 什 么 货 物 ？";
};

func int DIA_Sagitta_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sagitta_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_TRADE_Info()
{
	AI_Output(other, self, "DIA_Sagitta_TRADE_15_00"); //你 都 提 供 什 么 货 物 ？
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Sagitta_TRADE_17_01"); //告 诉 我 你 想 要 什 么 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Sagitta_KAP3_EXIT(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 999;
	condition		= DIA_Sagitta_KAP3_EXIT_Condition;
	information		= DIA_Sagitta_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sagitta_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_OBSESSION(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 30;
	condition		= DIA_Sagitta_OBSESSION_Condition;
	information		= DIA_Sagitta_OBSESSION_Info;
	description		= "我 感 到 惊 恐 。 我 需 要 帮 助 。";
};

func int DIA_Sagitta_OBSESSION_Condition()
{
	if ((SC_IsObsessed == TRUE)
	&& (SC_ObsessionTimes < 1)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_OBSESSION_Info()
{
	AI_Output(other, self, "DIA_Sagitta_OBSESSION_15_00"); //我 感 到 惊 恐 。 我 需 要 帮 助 。
	AI_Output(self, other, "DIA_Sagitta_OBSESSION_17_01"); //我 看 得 出 ， 睡 眠 也 无 法 让 你 复 原 。 你 已 经 暴 露 在 搜 索 者 的 黑 色 凝 视 中 了 。
	AI_Output(self, other, "DIA_Sagitta_OBSESSION_17_02"); //去 找 皮 罗 卡 ， 修 道 院 里 最 高 级 的 魔 法 师 。 我 这 可 怜 药 物 不 起 作 用 。
};

///////////////////////////////////////////////////////////////////////
//	Info Thekla
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_Thekla(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 3;
	condition		= DIA_Sagitta_Thekla_Condition;
	information		= DIA_Sagitta_Thekla_Info;
	description		= "特 赫 克 拉 让 我 来 帮 她 拿 一 个 包 裹 。";
};

func int DIA_Sagitta_Thekla_Condition()
{
	if ((MIS_Thekla_Paket == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_Thekla_Info()
{
	AI_Output(other, self, "DIA_Sagitta_Thekla_15_00"); //特 赫 克 拉 让 我 来 帮 她 拿 一 个 包 裹 。
	AI_Output(self, other, "DIA_Sagitta_Thekla_17_01"); //啊 ， 是 的 。 实 际 上 我 已 经 等 她 几 天 了 。
	AI_Output(self, other, "DIA_Sagitta_Thekla_17_02"); //这 是 包 裹 。 拿 好 它 ！
	B_GivePlayerXP(XP_AmbientKap3);
	B_GiveInvItems(self, other, ItMi_TheklasPaket, 1);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Sagitta_KAP4_EXIT(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 999;
	condition		= DIA_Sagitta_KAP4_EXIT_Condition;
	information		= DIA_Sagitta_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sagitta_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HealRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Sagitta_HEALRANDOLPH(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 30;
	condition		= DIA_Sagitta_HEALRANDOLPH_Condition;
	information		= DIA_Sagitta_HEALRANDOLPH_Info;
	permanent		= TRUE;
	description		= "伦 道 夫 的 症 状 消 退 了 。";
};

var int DIA_Sagitta_HEALRANDOLPH_GotOne;
var int DIA_Sagitta_HEALRANDOLPH_KnowsPrice;

func int DIA_Sagitta_HEALRANDOLPH_Condition()
{
	if ((MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems(other, ItPo_HealRandolph_MIS) == 0)
	&& (Npc_KnowsInfo(other, DIA_Sagitta_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Sagitta_HEALRANDOLPH_Info()
{
	AI_Output(other, self, "DIA_Sagitta_HEALRANDOLPH_15_00"); //伦 道 夫 的 症 状 消 退 了 。

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_17_01"); //那 个 家 伙 什 么 时 候 才 能 明 白 ？
		DIA_Sagitta_HEALRANDOLPH_KnowsPrice = TRUE;
	};

	if (DIA_Sagitta_HEALRANDOLPH_GotOne == TRUE)
	{
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_17_02"); //我 已 经 给 了 你 一 剂 治 疗 他 的 药 物 。 只 是 不 要 把 它 打 翻 。
	}
	else
	{
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_17_03"); //我 会 给 他 一 服 药 。 那 样 他 在 接 下 来 的 几 天 内 会 好 转 起 来 。
	};

	AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_17_04"); //那 需 要300枚 金 币 。

	if (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == FALSE)
	{
		AI_Output(other, self, "DIA_Sagitta_HEALRANDOLPH_15_05"); //什 么 ？
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_17_06"); //唯 一 你 能 免 费 得 到 的 东 西 就 是 死 亡 ， 小 子 。
	};

	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH, "不 。 不 要 为 了 那 样 毫 无 意 义 的 事 。", DIA_Sagitta_HEALRANDOLPH_no);
	Info_AddChoice(DIA_Sagitta_HEALRANDOLPH, "这 是 给 你 的 钱 。", DIA_Sagitta_HEALRANDOLPH_geld);
};

func void DIA_Sagitta_HEALRANDOLPH_geld()
{
	AI_Output(other, self, "DIA_Sagitta_HEALRANDOLPH_geld_15_00"); //这 是 给 你 的 钱 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 300))
	{
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_01"); //非 常 好 。 你 总 是 能 从 他 身 上 把 钱 拿 回 来 。
		CreateInvItems(self, ItPo_HealRandolph_MIS, 1);
		B_GiveInvItems(self, other, ItPo_HealRandolph_MIS, 1);
		DIA_Sagitta_HEALRANDOLPH_GotOne = TRUE;
		B_LogEntry(TOPIC_HealRandolph, TOPIC_HealRandolph_2);
	}
	else
	{
		AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_geld_17_02"); //在 你 有 足 够 的 资 金 之 前 ， 我 们 不 能 做 任 何 交 易 。
	};

	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

func void DIA_Sagitta_HEALRANDOLPH_no()
{
	AI_Output(other, self, "DIA_Sagitta_HEALRANDOLPH_no_15_00"); //不 。 不 要 为 了 那 样 毫 无 意 义 的 事 。
	AI_Output(self, other, "DIA_Sagitta_HEALRANDOLPH_no_17_01"); //（ 大 笑 ） 他 一 点 钱 都 没 有 给 你 ？ 那 太 像 他 了 ！。
	Info_ClearChoices(DIA_Sagitta_HEALRANDOLPH);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Sagitta_KAP5_EXIT(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 999;
	condition		= DIA_Sagitta_KAP5_EXIT_Condition;
	information		= DIA_Sagitta_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sagitta_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Sagitta_KAP6_EXIT(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 999;
	condition		= DIA_Sagitta_KAP6_EXIT_Condition;
	information		= DIA_Sagitta_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sagitta_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sagitta_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sagitta_PICKPOCKET(C_INFO)
{
	npc				= BAU_980_Sagitta;
	nr				= 900;
	condition		= DIA_Sagitta_PICKPOCKET_Condition;
	information		= DIA_Sagitta_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120_Female;
};

func int DIA_Sagitta_PICKPOCKET_Condition()
{
	C_Beklauen(103, 360);
};

func void DIA_Sagitta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET, DIALOG_BACK, DIA_Sagitta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sagitta_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sagitta_PICKPOCKET_DoIt);
};

func void DIA_Sagitta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};

func void DIA_Sagitta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sagitta_PICKPOCKET);
};
