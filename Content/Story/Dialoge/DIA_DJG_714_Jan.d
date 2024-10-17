// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Jan_EXIT(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 999;
	condition		= DIA_Jan_EXIT_Condition;
	information		= DIA_Jan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//***********
//	Begrüßung
//***********
instance DIA_JAN_Hello(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_Hello_Condition;
	information		= DIA_Jan_Hello_Info;
	important		= TRUE;
};

func int DIA_Jan_Hello_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_IsInState(self, ZS_TALK))
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Hello_Info()
{
	AI_Output(self, other, "DIA_Jan_Hello_10_00"); //来 这 里 是 一 个 非 常 、 非 常 愚 蠢 的 主 意 。
	AI_Output(self, other, "DIA_Jan_Hello_10_01"); //我 以 为 这 里 会 有 什 么 东 西 。 但 是 这 里 除 了 傲 慢 的 圣 骑 士 和 兽 人 外 ， 什 么 都 没 有 。
};

//*******************************************
//	Du hast die Drachen vergessen!
//*******************************************
instance DIA_JAN_Dragons(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_Dragons_Condition;
	information		= DIA_Jan_Dragons_Info;
	description		= "你 忘 记 了 龙 ！";
};

func int DIA_Jan_Dragons_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_JAN_Hello))
	&& (MIS_JanBecomesSmith == FALSE)
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Dragons_Info()
{
	AI_Output(other, self, "DIA_Jan_Dragons_15_00"); //你 忘 记 了 龙 ！
	AI_Output(self, other, "DIA_Jan_Dragons_10_01"); //（ 嘲 笑 ） 我 怎 么 能 忘 记 。 我 来 告 诉 你 。 我 是 一 个 铁 匠 ， 不 是 一 名 武 士 。
	AI_Output(self, other, "DIA_Jan_Dragons_10_02"); //我 铸 造 武 器 。 战 斗 我 会 留 给 别 人 去 做 。
	AI_Output(other, self, "DIA_Jan_Dragons_15_03"); //那 么 你 为 什 么 不 站 在 铁 砧 后 面 ？
	AI_Output(self, other, "DIA_Jan_Dragons_10_04"); //这 里 的 圣 骑 士 不 让 我 进 入 铁 匠 铺 。 我 什 么 也 做 不 了 ， 除 非 我 想 进 监 狱 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Jan_Dragons_10_05"); //你 也 是 他 们 的 一 员 。 那 么 帮 我 说 几 句 好 话 怎 么 样 ？。
	};

	Info_ClearChoices(DIA_JAN_Dragons);
	Info_AddChoice(DIA_JAN_Dragons, "我 要 走 了 。", DIA_JAN_Dragons_ShitHappen);
	Info_AddChoice(DIA_JAN_Dragons, "如 果 我 帮 你 ， 有 什 么 好 处 ？", DIA_JAN_Dragons_Reward);
	Info_AddChoice(DIA_JAN_Dragons, "我 会 试 着 帮 你 。", DIA_JAN_Dragons_HelpYou);
};

func void DIA_JAN_Dragons_HelpYou()
{
	AI_Output(other, self, "DIA_JAN_Dragons_HelpYou_15_00"); //我 会 试 着 帮 你 。
	AI_Output(self, other, "DIA_JAN_Dragons_HelpYou_10_01"); //你 打 算 怎 么 做 ？ 帕 西 沃 命 令 一 个 守 卫 监 视 着 我 们 。
	AI_Output(self, other, "DIA_JAN_Dragons_HelpYou_10_02"); //没 人 敢 置 之 不 理 。
	AI_Output(other, self, "DIA_JAN_Dragons_HelpYou_15_03"); //我 会 尽 力 而 为 。
	AI_Output(self, other, "DIA_JAN_Dragons_HelpYou_10_04"); //我 想 象 不 出 他 会 听 你 的 。

	Log_CreateTopic(TOPIC_JanBecomesSmith, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JanBecomesSmith, LOG_RUNNING);
	B_LogEntry(TOPIC_JanBecomesSmith, TOPIC_JanBecomesSmith_1);

	MIS_JanBecomesSmith = LOG_RUNNING;
	Info_ClearChoices(DIA_JAN_Dragons);
};

func void DIA_JAN_Dragons_Reward()
{
	AI_Output(other, self, "DIA_JAN_Dragons_Reward_15_00"); //如 果 我 帮 你 ， 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_JAN_Dragons_Reward_10_01"); //我 什 么 都 没 有 。 我 最 多 可 以 教 你 点 东 西 。
	if ((hero.guild == GIL_SLD)
	|| (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_JAN_Dragons_Reward_10_02"); //我 知 道 一 种 方 法 ， 可 以 让 使 用 魔 法 矿 石 铸 造 的 武 器 更 加 坚 硬 。
	};

	Jan_TeachPlayer = TRUE;
};

func void DIA_JAN_Dragons_ShitHappen()
{
	AI_Output(other, self, "DIA_JAN_Dragons_ShitHappen_15_00"); //我 必 须 走 自 己 的 路 。
	AI_Output(self, other, "DIA_JAN_Dragons_ShitHappen_10_01"); //太 可 怕 了 。 我 现 在 不 能 离 开 城 堡 ， 我 也 不 能 再 铸 造 任 何 东 西 了 。

	Info_ClearChoices(DIA_JAN_Dragons);
};

//*******************************************
//	Wo kommst du her?
//*******************************************
instance DIA_JAN_Home(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_Home_Condition;
	information		= DIA_Jan_Home_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_Jan_Home_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_JAN_Hello))
	&& (Kapitel >= 4)
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Home_Info()
{
	AI_Output(other, self, "DIA_Jan_Home_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_Jan_Home_10_01"); //我 已 经 加 入 了 一 些 从 山 区 来 的 人 。 我 们 要 去 山 谷 猎 龙 ， 去 赚 更 多 的 金 子 。
	AI_Output(self, other, "DIA_Jan_Home_10_02"); //他 们 的 首 领 名 字 叫 席 尔 维 欧 。 那 小 子 真 是 个 混 蛋 ， 他 对 我 就 好 像 我 是 他 的 财 产 一 样 。
};

//*******************************************
//	Was ist in der Burg alles passiert?
//*******************************************
instance DIA_JAN_OldCamp(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_OldCamp_Condition;
	information		= DIA_Jan_OldCamp_Info;
	permanent		= TRUE;
	description		= "城 堡 里 面 发 生 了 什 么 事 ？";
};

func int DIA_Jan_OldCamp_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_JAN_Hello))
	&& (Kapitel == 4)
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_OldCamp_Info()
{
	AI_Output(other, self, "DIA_Jan_OldCamp_15_00"); //城 堡 里 都 发 生 了 什 么 事 情 ？
	AI_Output(self, other, "DIA_Jan_OldCamp_10_01"); //我 什 么 都 没 听 到 。 当 然 ， 我 也 担 心 在 城 堡 外 面 发 生 的 事 情 。
};

//*******************************************
//	Ich hab mit Parcival geredet
//*******************************************
instance DIA_JAN_Parcival(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_Parcival_Condition;
	information		= DIA_Jan_Parcival_Info;
	description		= "我 同 帕 西 沃 谈 了 。";
};

func int DIA_Jan_Parcival_Condition()
{
	if ((MIS_JanBecomesSmith != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Parcival_Jan))
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_Parcival_Info()
{
	AI_Output(other, self, "DIA_Jan_Parcival_15_00"); //我 同 帕 西 沃 谈 了 。
	AI_Output(self, other, "DIA_Jan_Parcival_10_01"); //真 的 ？

	if (hero.guild == GIL_DJG)
	{
		AI_Output(other, self, "DIA_Jan_Parcival_15_02"); //他 不 相 信 我 们 龙 猎 手 。
	}
	else
	{
		AI_Output(other, self, "DIA_Jan_Parcival_15_03"); //他 不 相 信 我 们 龙 猎 手 。
	};

	AI_Output(self, other, "DIA_Jan_Parcival_10_04"); //该 死 。 我 只 是 想 找 个 工 作 。
	AI_Output(self, other, "DIA_Jan_Parcival_10_05"); //那 也 许 我 也 该 放 弃 了 。 现 在 只 有 加 隆 德 能 帮 助 我 。
};

//*******************************************
//	Ich hab mit Garond geredet
//*******************************************
instance DIA_JAN_JanIsSmith(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_JanIsSmith_Condition;
	information		= DIA_Jan_JanIsSmith_Info;
	description		= "去 拿 起 你 的 铁 锤 ， 你 有 工 作 了 。";
};

func int DIA_Jan_JanIsSmith_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_JanIsSmith_Info()
{
	AI_Output(other, self, "DIA_Jan_JanIsSmith_15_00"); //去 拿 起 你 的 铁 锤 ， 你 有 工 作 了 。
	AI_Output(self, other, "DIA_Jan_JanIsSmith_10_01"); //你 成 功 了 ？ 你 怎 么 做 的 ？
	AI_Output(other, self, "DIA_Jan_JanIsSmith_15_02"); //我 必 须 担 保 你 ， 所 以 不 要 让 我 失 望 。
	AI_Output(self, other, "DIA_Jan_JanIsSmith_10_03"); //不 用 担 心 。 我 很 高 兴 我 又 能 工 作 了 。

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "SMITH");
};

//*******************************************
//	Verkaufst du Waffen?
//*******************************************
instance DIA_JAN_SellWeapons(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_SellWeapons_Condition;
	information		= DIA_Jan_SellWeapons_Info;
	description		= "你 出 售 武 器 ？";
};

func int DIA_Jan_SellWeapons_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_JAN_JanIsSmith))
	&& (Jan_TeachPlayer == FALSE)
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellWeapons_Info()
{
	AI_Output(other, self, "DIA_Jan_SellWeapons_15_00"); //你 出 售 武 器 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Jan_SellWeapons_10_01"); //没 门 。 然 后 你 在 这 里 的 同 僚 就 能 把 我 以 黑 市 交 易 的 罪 名 送 进 监 狱 ， 嗯 ？ 不 ， 算 了 吧 。
	}
	else
	{
		AI_Output(self, other, "DIA_Jan_SellWeapons_10_02"); //如 果 我 能 的 话 ， 我 会 那 么 做 。 但 是 我 必 须 优 先 把 武 器 供 应 给 城 堡 里 的 这 些 圣 骑 士 。
	};

	AI_Output(self, other, "DIA_Jan_SellWeapons_10_03"); //但 是 我 能 教 你 如 何 铸 造 自 己 的 武 器 。

	Jan_TeachPlayer = TRUE;
};

//*******************************************
//	Zeig mir wie man schmiedet.
//*******************************************
instance Jan_Training_Talente(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= Jan_Training_Talente_Condition;
	information		= Jan_Training_Talente_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 成 为 一 名 铁 匠 。";
};

func int Jan_Training_Talente_Condition()
{
	if ((Jan_TeachPlayer == TRUE)
	&& (Npc_KnowsInfo(other, DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE))
	{
		return 1;
	};
};

func void Jan_Training_Talente_Info()
{
	AI_Output(other, self, "DIA_Jan_TeachPlayer_15_00"); //教 我 如 何 成 为 一 名 铁 匠 。
	AI_Output(self, other, "DIA_Jan_TeachPlayer_10_01"); //你 究 竟 打 算 制 造 什 么 ？

	Info_ClearChoices(Jan_Training_Talente);

	Info_AddChoice(Jan_Training_Talente, Dialog_Back, Jan_Training_Smith_Back);

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(Jan_Training_Talente, B_BuildLearnString(NAME_LEARN_SMITHING, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common)), Jan_Training_Smith_Common);
	};

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_01)), Jan_Training_Smith_1hSpecial1);
		};

		if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_01)), Jan_Training_Smith_2hSpecial1);
		};

		if ((PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_1H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Special_02)), Jan_Training_Smith_1hSpecial2);
		};

		if ((PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == FALSE)
		&& ((hero.guild == GIL_SLD)
		|| (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(Jan_Training_Talente, B_BuildLearnString(NAME_ItMw_2H_Special_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_2H_Special_02)), Jan_Training_Smith_2hSpecial2);
		};
	};
};

func void Jan_Training_Smith_Back()
{
	Info_ClearChoices(Jan_Training_Talente);
};

func void Jan_Training_Smith_Common()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_Common);
};

func void Jan_Training_Smith_1hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_01);
};

func void Jan_Training_Smith_2hSpecial1()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_01);
};

func void Jan_Training_Smith_1hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Special_02);
};

func void Jan_Training_Smith_2hSpecial2()
{
	B_TeachPlayerTalentSmith(self, other, WEAPON_2H_Special_02);
};

//*******************************************
//	Kann ich bei dir Rüstungen kaufen?
//*******************************************

// -------------------------------------
var int DIA_JAN_SellArmor_permanent;
// ------------------------------------
instance DIA_JAN_SellArmor(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_SellArmor_Condition;
	information		= DIA_Jan_SellArmor_Info;
	permanent		= TRUE;
	description		= "我 能 从 你 这 里 买 些 盔 甲 吗 ？";
};

func int DIA_Jan_SellArmor_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_SellArmor_Info()
{
	AI_Output(other, self, "DIA_Jan_SellArmor_15_00"); //我 能 从 你 这 里 买 些 盔 甲 吗 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Jan_SellArmor_10_01"); //没 有 什 么 比 盔 甲 更 好 了 。 我 们 应 该 制 造 它 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Jan_SellArmor_10_02"); //一 个 想 要 盔 甲 的 法 师 ？ 算 了 吧 - 找 裁 缝 去 。 我 不 能 给 你 造 盔 甲 。
	}
	else
	{
		AI_Output(self, other, "DIA_Jan_SellArmor_10_03"); //就 算 我 只 有 一 点 的 话 ， 也 会 卖 给 你 。 不 幸 的 是 ， 我 一 点 都 没 有 。

		Info_ClearChoices(DIA_JAN_SellArmor);
		Info_AddChoice(DIA_JAN_SellArmor, "我 想 没 有 什 么 事 情 可 做 。", DIA_JAN_SellArmor_Sorry);
		Info_AddChoice(DIA_JAN_SellArmor, "那 你 能 帮 我 做 一 个 吗 ？", DIA_JAN_SellArmor_BuildOne);
	};
};

func void DIA_JAN_SellArmor_Sorry()
{
	AI_Output(other, self, "DIA_JAN_SellArmor_Sorry_15_00"); //我 想 没 有 什 么 事 情 可 做 。
	AI_Output(self, other, "DIA_JAN_SellArmor_Sorry_10_01"); //一 旦 你 弄 到 了 什 么 东 西 的 话 ， 马 上 告 诉 我 。

	Info_ClearChoices(DIA_JAN_SellArmor);
};

func void DIA_JAN_SellArmor_BuildOne()
{
	AI_Output(other, self, "DIA_JAN_SellArmor_BuildOne_15_00"); //那 你 能 帮 我 做 一 个 吗 ？
	AI_Output(self, other, "DIA_JAN_SellArmor_BuildOne_10_01"); //嗯 ， 如 果 你 想 要 更 好 的 东 西 ， 那 你 必 须 给 我 找 到 材 料 。
	AI_Output(other, self, "DIA_JAN_SellArmor_BuildOne_15_02"); //你 都 需 要 什 么 ？
	AI_Output(self, other, "DIA_JAN_SellArmor_BuildOne_10_03"); //你 想 要 和 龙 战 斗 ， 是 吗 ？ 给 我 弄 一 些 龙 鳞 - 用 那 些 ， 我 应 该 能 帮 你 制 造 出 一 些 东 西 来 。
	AI_Output(self, other, "DIA_JAN_SellArmor_BuildOne_10_04"); //20个 鳞 片 应 该 够 用 了 。

	DIA_JAN_SellArmor_permanent = TRUE;
	Info_ClearChoices(DIA_JAN_SellArmor);
};

//*******************************************
//	Ich habe die Drachenschuppen für dich.
//*******************************************

// -------------------------------------------
var int Jan_Sells_Armor;
// -------------------------------------------
instance DIA_JAN_Dragonscales(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_Dragonscales_Condition;
	information		= DIA_Jan_Dragonscales_Info;
	permanent		= TRUE;
	description		= "我 给 你 找 到 了 龙 鳞 。";
};

func int DIA_Jan_Dragonscales_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_JAN_JanIsSmith))
	&& (MIS_OCGateOpen == FALSE)
	&& (DIA_JAN_SellArmor_permanent == TRUE)
	&& (Jan_Sells_Armor == FALSE)
	&& (Npc_HasItems(other, ItAT_Dragonscale) >= 1))
	{
		return 1;
	};
};

var int DIA_JAN_Dragonscales_OneTime;
func void DIA_Jan_Dragonscales_Info()
{
	AI_Output(other, self, "DIA_JAN_Dragonscales_15_00"); //我 给 你 找 到 了 龙 鳞 。
	if (Npc_HasItems(other, ItAT_Dragonscale) >= 20)
	{
		B_GiveInvItems(other, self, ItAT_Dragonscale, 20);
		AI_Output(self, other, "DIA_JAN_Dragonscales_10_01"); //好 ， 用 那 个 可 以 做 出 一 些 东 西 来 。
		AI_Output(self, other, "DIA_JAN_Dragonscales_10_02"); //明 天 再 来 ， 那 时 候 应 该 能 完 成 。

		if (DIA_JAN_Dragonscales_OneTime == FALSE) // Joly:zur sicherheit
		{
			B_GivePlayerXP(XP_Addon_JanSellsArmor);
			DIA_JAN_Dragonscales_OneTime = TRUE;
		};

		Jan_Sells_Armor = Wld_GetDay();
	}
	else
	{
		AI_Output(self, other, "DIA_JAN_Dragonscales_10_03"); //我 需 要20片 龙 鳞 ， 否 则 我 不 能 帮 你 制 造 任 何 盔 甲 。
	};
};

//*******************************************
//	Ist die Rüstung fertig?
//*******************************************

// -------------------------------
var int DJG_Armor_is_offered;
var int DIA_JAN_ArmorReady_NoPerm;
// -------------------------------
instance DIA_JAN_ArmorReady(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_ArmorReady_Condition;
	information		= DIA_Jan_ArmorReady_Info;
	permanent		= TRUE;
	description		= "盔 甲 准 备 好 了 吗 ？";
};

func int DIA_Jan_ArmorReady_Condition()
{
	if ((MIS_OCGateOpen == FALSE)
	&& (Jan_Sells_Armor != FALSE)
	&& (DIA_JAN_ArmorReady_NoPerm == FALSE))
	{
		return 1;
	};
};

func void DIA_Jan_ArmorReady_Info()
{
	AI_Output(other, self, "DIA_JAN_ArmorReady_15_00"); //盔 甲 准 备 好 了 吗 ？
	if (Jan_Sells_Armor == Wld_GetDay())
	{
		AI_Output(self, other, "DIA_JAN_ArmorReady_10_01"); //不 ， 还 没 有 。 明 天 再 回 来 。
	}
	else
	{
		AI_Output(self, other, "DIA_JAN_ArmorReady_10_02"); //是 的 ， 真 正 的 杰 作 。 如 果 你 想 要 的 话 ， 可 以 购 买 它 。
		AI_Output(self, other, "DIA_JAN_ArmorReady_10_03"); //我 会 给 你 一 个 特 价 。12000枚 金 币 。
		AI_Output(other, self, "DIA_JAN_ArmorReady_15_04"); //什 么 ？ 在 我 帮 你 做 了 这 么 多 事 情 之 后 ？
		AI_Output(self, other, "DIA_JAN_ArmorReady_10_05"); //不 要 那 样 。 我 在 这 里 必 须 要 生 活 。 要 是 不 买 就 放 下 。

		DJG_Armor_is_offered = TRUE;
		DIA_JAN_ArmorReady_NoPerm = TRUE;
	};
};

//*********************************************************************
//		DJG_ARMOR_M
//*********************************************************************

// -----------------------------
var int Jan_DIA_Jan_DJG_ARMOR_M_permanent;
// -----------------------------
instance DIA_Jan_DJG_ARMOR_M(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 4;
	condition		= DIA_Jan_DJG_ARMOR_M_Condition;
	information		= DIA_Jan_DJG_ARMOR_M_Info;
	permanent		= TRUE;
	description		= "中 型 龙 猎 手 盔 甲 - 防 护 ： 武 器 ８ ０ ， 箭 ８ ０ （ １ ２ ０ ０ ０ 金 币 ）"; // Wenn ändern, dann bitte auch in der Info-Instanz. s.u.
};

func int DIA_Jan_DJG_ARMOR_M_Condition()
{
	if ((Jan_DIA_Jan_DJG_ARMOR_M_permanent == FALSE)
	&& (hero.guild == GIL_DJG)
	&& (DJG_Armor_is_offered == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jan_DJG_ARMOR_M_Info()
{
	AI_Output(other, self, "DIA_Jan_DJG_ARMOR_M_15_00"); //我 想 要 买 盔 甲 。

	if (Npc_HasItems(other, itmi_Gold) >= 12000)
	{
		AI_Output(self, other, "DIA_Jan_DJG_ARMOR_M_10_01"); //你 能 看 得 出 它 值 你 花 的 每 一 分 钱 。

		B_GiveInvItems(other, self, ItMi_Gold, 12000);
		CreateInvItems(self, ITAR_DJG_M, 1);
		B_GiveInvItems(self, other, ITAR_DJG_M, 1);

		Jan_DIA_Jan_DJG_ARMOR_M_permanent = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Jan_DJG_ARMOR_M_10_02"); //你 没 有 足 够 的 金 币 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonPlettBericht(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 3;
	condition		= DIA_Jan_DragonPlettBericht_Condition;
	information		= DIA_Jan_DragonPlettBericht_Info;
	description		= "关 于 龙 … …";
};

var int DIA_Jan_DragonPlettBericht_NoPerm;
func int DIA_Jan_DragonPlettBericht_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_JAN_Dragons))
	&& (DIA_Jan_DragonPlettBericht_NoPerm == FALSE)
	&& (MIS_OCGateOpen == FALSE)
	&& (MIS_KilledDragons != 0))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonPlettBericht_Info()
{
	if (MIS_KilledDragons == 1)
	{
		AI_Output(other, self, "DIA_Jan_DragonPlettBericht_15_00"); //我 已 经 杀 了 一 条 龙 。
	}
	else if ((MIS_KilledDragons == 2) || (MIS_KilledDragons == 3))
	{
		AI_Output(other, self, "DIA_Jan_DragonPlettBericht_15_01"); //我 已 经 杀 了 一 条 龙 。
	}
	else
	{
		AI_Output(other, self, "DIA_Jan_DragonPlettBericht_15_02"); //我 已 经 杀 了 所 有 的 龙 。
	};

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Jan_DragonPlettBericht_10_03"); //那 又 怎 么 样 ？ 你 是 一 个 龙 猎 手 ， 不 是 吗 ？
		AI_Output(other, self, "DIA_Jan_DragonPlettBericht_15_04"); //你 不 也 是 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Jan_DragonPlettBericht_10_05"); //那 是 不 错 。 但 是 诚 实 地 讲 ， 我 不 是 特 别 感 兴 趣 。
	};

	AI_Output(self, other, "DIA_Jan_DragonPlettBericht_10_06"); //我 已 经 告 诉 你 了 ， 我 宁 愿 制 造 武 器 ， 也 不 想 自 己 去 杀 龙 。

	if ((hero.guild != GIL_DJG)
	&& (hero.guild != GIL_SLD))
	{
		AI_Output(self, other, "DIA_Jan_DragonPlettBericht_10_07"); //可 是 还 有 一 件 事 ， 可 能 会 提 起 我 的 兴 趣 。
		AI_Output(self, other, "DIA_Jan_DragonPlettBericht_10_08"); //如 果 你 能 给 我 带 来 一 些 龙 血 ， 我 愿 意 高 价 购 买 。
		Jan_WantsDragonBlood = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonBlood
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_DragonBlood(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 3;
	condition		= DIA_Jan_DragonBlood_Condition;
	information		= DIA_Jan_DragonBlood_Info;
	permanent		= TRUE;
	description		= "我 给 你 拿 来 了 龙 血 。";
};

func int DIA_Jan_DragonBlood_Condition()
{
	if ((Jan_WantsDragonBlood == TRUE)
	&& (MIS_OCGateOpen == FALSE)
	&& (Npc_HasItems(other, ItAt_DragonBlood))
	&& ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void DIA_Jan_DragonBlood_Info()
{
	AI_Output(other, self, "DIA_Jan_DragonBlood_15_00"); //我 给 你 拿 来 了 龙 血 。
	AI_Output(self, other, "DIA_Jan_DragonBlood_10_01"); //那 好 极 了 。 把 你 所 有 的 东 西 都 卖 给 我 。

	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK);
	if ((Npc_HasItems(other, ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 所 有 东 西 ）", DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 一 瓶 ）", DIA_Jan_DragonBlood_1);
	};
};

func void DIA_Jan_DragonBlood_BACK()
{
	Info_ClearChoices(DIA_Jan_DragonBlood);
};

func void DIA_Jan_DragonBlood_1()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = 1;

	B_GiveInvItems(other, self, ItAt_DragonBlood, DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = (DragonBloodCount * Value_DragonBlood); // Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems(self, ItMi_Gold, DragonBloodGeld);
	B_GiveInvItems(self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK);
	if ((Npc_HasItems(other, ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 所 有 东 西 ）", DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 一 瓶 ）", DIA_Jan_DragonBlood_1);
	};

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString(Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

func void DIA_Jan_DragonBlood_all()
{
	var int DragonBloodCount;
	var int DragonBloodGeld;
	var int XP_DJG_BringDragonBloods;

	DragonBloodCount = Npc_HasItems(other, ItAt_DragonBlood);

	B_GiveInvItems(other, self, ItAt_DragonBlood, DragonBloodCount);
	XP_DJG_BringDragonBloods = (DragonBloodCount * XP_AmbientKap4);
	B_GivePlayerXP(XP_DJG_BringDragonBloods);
	DragonBloodGeld = (DragonBloodCount * Value_DragonBlood); // Joly:ganzer Wert ohne Handelsmultiplier
	CreateInvItems(self, ItMi_Gold, DragonBloodGeld);
	B_GiveInvItems(self, other, ItMi_Gold, DragonBloodGeld);

	Info_ClearChoices(DIA_Jan_DragonBlood);
	Info_AddChoice(DIA_Jan_DragonBlood, DIALOG_BACK, DIA_Jan_DragonBlood_BACK);
	if ((Npc_HasItems(other, ItAt_DragonBlood)) >= 1)
	{
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 所 有 东 西 ）", DIA_Jan_DragonBlood_all);
		Info_AddChoice(DIA_Jan_DragonBlood, "（ 一 瓶 ）", DIA_Jan_DragonBlood_1);
	};

	var string BloodText;
	var string BloodLeft;
	BloodLeft = IntToString(Npc_HasItems(other, ItAt_DragonBlood));
	BloodText = ConcatStrings(BloodLeft, PRINT_NumberLeft);
	AI_PrintScreen(BloodText, -1, -1, FONT_ScreenSmall, 2);
};

///////////////////////////////////////////////////////////////////////
//	Info nachOCGATEOPEN
///////////////////////////////////////////////////////////////////////
instance DIA_Jan_NACHOCGATEOPEN(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 3;
	condition		= DIA_Jan_NACHOCGATEOPEN_Condition;
	information		= DIA_Jan_NACHOCGATEOPEN_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Jan_NACHOCGATEOPEN_Condition()
{
	if (MIS_OCGateOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jan_NACHOCGATEOPEN_Info()
{
	AI_Output(other, self, "DIA_Jan_NACHOCGATEOPEN_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Jan_NACHOCGATEOPEN_10_01"); //绝 对 什 么 都 不 清 楚 ！
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Jan_NACHOCGATEOPEN_10_02"); //你 这 傻 瓜 为 什 么 要 打 开 大 门 ？ 你 们 圣 骑 士 就 是 些 连 一 个 屁 都 不 放 的 家 伙 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Jan_NACHOCGATEOPEN_10_03"); //他 们 就 那 样 走 过 去 ， 然 后 打 开 了 大 门 。 该 死 ！ 我 真 是 无 法 忍 受 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jan_PICKPOCKET(C_INFO)
{
	npc				= DJG_714_Jan;
	nr				= 900;
	condition		= DIA_Jan_PICKPOCKET_Condition;
	information		= DIA_Jan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Jan_PICKPOCKET_Condition()
{
	C_Beklauen(37, 95);
};

func void DIA_Jan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
	Info_AddChoice(DIA_Jan_PICKPOCKET, DIALOG_BACK, DIA_Jan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jan_PICKPOCKET_DoIt);
};

func void DIA_Jan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};

func void DIA_Jan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jan_PICKPOCKET);
};
