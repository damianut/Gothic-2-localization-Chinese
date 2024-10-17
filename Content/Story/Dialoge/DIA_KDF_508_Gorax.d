///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Kap1_EXIT(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 999;
	condition		= DIA_Gorax_Kap1_EXIT_Condition;
	information		= DIA_Gorax_KAp1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorax_Kap1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gorax_PICKPOCKET(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 888;
	condition		= DIA_Gorax_PICKPOCKET_Condition;
	information		= DIA_Gorax_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 他 的 钥 匙 很 难 ）";
};

func int DIA_Gorax_PICKPOCKET_Condition()
{
	if ((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff)))
	{
		return 1;
	};
};

func void DIA_Gorax_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	Info_AddChoice(DIA_Gorax_PICKPOCKET, DIALOG_BACK, DIA_Gorax_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gorax_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gorax_PICKPOCKET_DoIt);
};

func void DIA_Gorax_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self, ItKe_KlosterSchatz, 1);
		B_GiveInvItems(self, other, ItKe_KlosterSchatz, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Gorax_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Gorax_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gorax_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info HELP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_HELP(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 2;
	condition		= DIA_Gorax_HELP_Condition;
	information		= DIA_Gorax_HELP_Info;
	important		= TRUE;
};

func int DIA_Gorax_HELP_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Gorax_HELP_Info()
{
	AI_Output(self, other, "DIA_Gorax_HELP_14_00"); //我 能 协 助 你 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info GOLD
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_GOLD(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 2;
	condition		= DIA_Gorax_GOLD_Condition;
	information		= DIA_Gorax_GOLD_Info;
	permanent		= TRUE;
	description		= "我 带 来 了 一 堆 金 币";
};

// -----------------------------------
var int DIA_Gorax_GOLD_perm;
// -----------------------------------
func int DIA_Gorax_GOLD_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE)
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE)) // ADDON
	{
		return TRUE;
	};
};

func void DIA_Gorax_GOLD_Info()
{
	AI_Output(other, self, "DIA_Gorax_GOLD_15_00"); //我 带 来 了 一 堆 金 子 。

	if (Npc_HasItems(other, ItMi_Gold) >= Summe_Kloster)
	{
		AI_Output(self, other, "DIA_Gorax_GOLD_14_01"); //（ 带 有 直 觉 ） 啊 - 你 带 来 了 给 英 诺 斯 的 奉 献 。 那 是 你 的 善 行 ， 我 的 孩 子 。
		AI_Output(self, other, "DIA_Gorax_GOLD_14_02"); //我 将 使 用 你 的 捐 赠 最 好 地 让 修 道 院 来 侍 奉 英 诺 斯 。

		DIA_Gorax_GOLD_perm = TRUE; // WICHTIG
		B_GiveInvItems(other, self, ItMi_Gold, Summe_Kloster);
	}
	else
	{
		AI_Output(self, other, "DIA_Gorax_Orlan_14_02"); //你 用 那 些 金 币 做 了 什 么 ？ 你 把 它 花 完 了 ？ 去 把 它 挣 回 来 ！
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DaronsStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Gorax_DaronsStatue(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 2;
	condition		= DIA_Addon_Gorax_DaronsStatue_Condition;
	information		= DIA_Addon_Gorax_DaronsStatue_Info;
	permanent		= TRUE;
	description		= "给 ， 我 找 到 了 达 隆 想 要 送 到 修 道 院 的 雕 像 。";
};

func int DIA_Addon_Gorax_DaronsStatue_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (DIA_Gorax_GOLD_perm == FALSE)
	&& (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)) // ADDON
	{
		return TRUE;
	};
};

func void DIA_Addon_Gorax_DaronsStatue_Info()
{
	AI_Output(other, self, "DIA_Addon_Gorax_DaronsStatue_15_00"); //给 ， 我 找 到 了 本 该 由 达 隆 送 到 修 道 院 的 雕 像 。

	if (Npc_HasItems(other, ItMi_LostInnosStatue_Daron))
	{
		AI_Output(self, other, "DIA_Addon_Gorax_DaronsStatue_14_01"); //（ 叹 息 ） 真 是 令 人 为 难 啊 ， 这 样 珍 贵 的 东 西 竟 然 由 一 个 热 心 的 新 信 徒 给 我 们 送 来 。
		AI_Output(self, other, "DIA_Addon_Gorax_DaronsStatue_14_02"); //虽 然 如 此 ， 这 证 明 你 致 力 于 为 英 诺 斯 服 务 。

		// -----------PATCH M.F.----------------------
		if (B_GiveInvItems(other, self, ItMi_LostInnosStatue_Daron, 1))
		{
			Npc_RemoveInvItems(self, ItMi_LostInnosStatue_Daron, 1);
		};

		AI_Output(self, other, "DIA_Addon_Gorax_DaronsStatue_14_03"); //我 非 常 感 谢 你 ， 年 青 的 新 信 徒 。
		MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
		B_GivePlayerXP(XP_Addon_ReturnedLostInnosStatue_Daron);
		DIA_Gorax_GOLD_perm = TRUE; // WICHTIG
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Gorax_DaronsStatue_14_04"); //雕 像 ？ 我 没 看 到 雕 像 。 把 它 给 我 拿 来 ， 那 样 我 也 许 会 相 信 你 的 小 故 事 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_SLEEP(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 4;
	condition		= DIA_Gorax_SLEEP_Condition;
	information		= DIA_Gorax_SLEEP_Info;
	description		= "我 在 找 个 地 方 睡 觉 。";
};

func int DIA_Gorax_SLEEP_Condition()
{
	if ((DIA_Gorax_GOLD_perm == TRUE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Gorax_SLEEP_Info()
{
	AI_Output(other, self, "DIA_Gorax_SLEEP_15_00"); //我 在 找 个 地 方 睡 觉 。
	AI_Output(self, other, "DIA_Gorax_SLEEP_14_01"); //隔 壁 的 房 间 里 有 一 张 空 床 。 右 手 第 一 间 ， 在 入 口 旁 边 。 你 可 以 在 那 里 睡 觉 。
	AI_Output(self, other, "DIA_Gorax_SLEEP_14_02"); //你 可 以 把 你 的 物 品 存 放 到 没 有 使 用 的 箱 子 里 。
	AI_Output(self, other, "DIA_Gorax_SLEEP_14_03"); //要 记 住 - 你 不 能 进 魔 法 师 的 卧 房 。 你 也 不 可 以 进 入 图 书 馆 ， 除 非 你 得 到 许 可 。
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 3;
	condition		= DIA_Gorax_Aufgabe_Condition;
	information		= DIA_Gorax_Aufgabe_Info;
	description		= "你 有 任 务 给 我 吗 ？";
};

func int DIA_Gorax_Aufgabe_Condition()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Gorax_Aufgabe_15_00"); //你 有 任 务 给 我 吗 ？
	AI_Output(self, other, "DIA_Gorax_Aufgabe_14_01"); //你 们 新 信 徒 近 来 工 作 很 辛 苦 。 那 些 工 作 得 多 的 人 ， 吃 的 也 多 。
	AI_Output(self, other, "DIA_Gorax_Aufgabe_14_02"); //我 要 把 食 物 储 藏 室 的 钥 匙 给 你 ， 你 可 以 在 那 里 找 到 一 些 羊 肉 香 肠 。 把 它 们 分 发 给 新 信 徒 们 - 但 是 要 公 平 ！
	AI_Output(self, other, "DIA_Gorax_Aufgabe_14_03"); //一 旦 你 分 完 之 后 ， 可 以 再 来 找 我 。

	CreateInvItems(self, ItKe_KlosterStore, 1);
	B_GiveInvItems(self, other, ItKe_KlosterStore, 1);
	MIS_GoraxEssen = LOG_RUNNING;

	Log_CreateTopic(Topic_GoraxEssen, LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxEssen, LOG_RUNNING);
	B_LogEntry(Topic_GoraxEssen, Topic_GoraxEssen_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Würste verteilt
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Wurst(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 2;
	condition		= DIA_Gorax_Wurst_Condition;
	information		= DIA_Gorax_Wurst_Info;
	permanent		= TRUE;
	description		= "我 已 经 分 发 了 香 肠 （ 完 成 任 务 ）";
};

func int DIA_Gorax_Wurst_Condition()
{
	if ((MIS_GoraxEssen == LOG_RUNNING)
	&& (Mob_HasItems("WURSTTRUHE", ItFo_SchafsWurst) == 0))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Wurst_Info()
{
	AI_Output(other, self, "DIA_Gorax_Wurst_15_00"); //我 已 经 把 火 腿 分 完 了 。

	if (Wurst_Gegeben >= 13)
	{
		AI_Output(self, other, "DIA_Gorax_Wurst_14_01"); //你 做 的 非 常 公 平 。 拿 上 这 些 治 疗 之 魔 法 卷 轴 - 然 后 回 去 工 作 。

		MIS_GoraxEssen = LOG_SUCCESS;
		B_GivePlayerXP(XP_GoraxEssen);
		B_GiveInvItems(self, other, ItSc_LightHeal, 2);
	}
	else
	{
		AI_Output(self, other, "DIA_Gorax_Wurst_14_02"); //真 的 ？ 那 么 你 并 没 有 努 力 去 完 成 你 的 任 务 。
		AI_Output(self, other, "DIA_Gorax_Wurst_14_03"); //这 样 看 来 ， 要 么 是 你 把 那 些 火 腿 自 己 吃 了 ， 要 么 就 是 你 给 某 些 人 的 份 额 太 多 。
		AI_Output(self, other, "DIA_Gorax_Wurst_14_04"); //听 着 ， 因 为 你 是 新 来 的 - 那 也 是 唯 一 的 理 由 - 我 会 让 你 离 开 。 要 记 住 ， 新 信 徒 ！

		MIS_GoraxEssen = LOG_FAILED;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe 2
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Aufgabe2(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 3;
	condition		= DIA_Gorax_Aufgabe2_Condition;
	information		= DIA_Gorax_Aufgabe2_Info;
	description		= "你 还 有 其 它 任 务 交 给 我 吗 ？";
};

func int DIA_Gorax_Aufgabe2_Condition()
{
	if (((MIS_GoraxEssen == LOG_SUCCESS)
	|| (MIS_GoraxEssen == LOG_FAILED))
	&& (Npc_IsDead(Orlan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Aufgabe2_Info()
{
	AI_Output(other, self, "DIA_Gorax_Aufgabe2_15_00"); //你 还 有 其 它 任 务 交 给 我 吗 ？
	AI_Output(self, other, "DIA_Gorax_Aufgabe2_14_01"); //是 的 。 正 如 你 知 道 的 那 样 ， 我 们 在 这 里 酿 造 最 好 的 葡 萄 酒 ， 我 们 也 出 售 它 。
	AI_Output(self, other, "DIA_Gorax_Aufgabe2_14_02"); //奥 兰 ， ‘ 死 亡 女 妖’ 酒 馆 的 主 人 ， 定 了 一 批 货 。 我 们 已 经 协 商 好 2 4 0 枚 金 币 出 售 那 些 酒 。
	AI_Output(self, other, "DIA_Gorax_Aufgabe2_14_03"); //把 这 些 酒 给 他 送 去 - 但 是 不 要 让 他 少 给 你 钱 。

	B_GiveInvItems(self, other, ItFo_Wine, 12);
	MIS_GoraxWein = LOG_RUNNING;

	Log_CreateTopic(Topic_GoraxWein, LOG_MISSION);
	Log_SetTopicStatus(Topic_GoraxWein, LOG_RUNNING);
	B_LogEntry(Topic_GoraxWein, Topic_GoraxWein_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Orlan
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Orlan(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 3;
	condition		= DIA_Gorax_Orlan_Condition;
	information		= DIA_Gorax_Orlan_Info;
	permanent		= TRUE;
	description		= "我 去 找 奥 兰 。";
};

// ----------------------------------
var int DIA_Gorax_Orlan_permanent;
// -----------------------------------
func int DIA_Gorax_Orlan_Condition()
{
	if ((MIS_GoraxWein == LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Orlan_Wein)
	&& (DIA_Gorax_Orlan_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gorax_Orlan_Info()
{
	if (Npc_HasItems(other, ItmI_Gold) >= 100)
	{
		AI_Output(other, self, "DIA_Gorax_Orlan_15_00"); //我 去 找 奥 兰 。
		AI_Output(self, other, "DIA_Gorax_Orlan_14_01"); //那 么 ， 你 收 到 了 2 4 0 枚 金 币 ？

		DIA_Gorax_Orlan_permanent = TRUE;
		Info_ClearChoices(DIA_Gorax_Orlan);

		Info_AddChoice(DIA_Gorax_Orlan, "他 骗 了 我 ！ （ 给 １ ０ ０ 金 币 ）", DIA_Gorax_Orlan_100);
		Info_AddChoice(DIA_Gorax_Orlan, "我 拿 到 了 钱 。 （ 给 ２ ４ ０ 金 币 ）", DIA_Gorax_Orlan_240);
	}
	else
	{
		AI_Output(self, other, "DIA_Gorax_Orlan_14_02"); //你 用 那 些 金 币 做 了 什 么 ？ 你 把 它 花 完 了 ？ 去 把 它 挣 回 来 ！
	};
};

func void DIA_Gorax_Orlan_100()
{
	AI_Output(other, self, "DIA_Gorax_Orlan_100_15_00"); //他 骗 了 我 ！
	AI_Output(self, other, "DIA_Gorax_Orlan_100_14_01"); //你 便 宜 卖 给 他 了 ？ 哦 不 ， 为 什 么 这 里 有 这 么 多 人 ， 我 偏 偏 会 派 你 去 ？
	AI_Output(self, other, "DIA_Gorax_Orlan_100_14_02"); //你 真 是 没 用 。 别 让 我 再 看 见 你 ！

	B_GiveInvItems(other, self, ItMI_Gold, 100);

	MIS_GoraxWein = LOG_FAILED;

	Info_ClearChoices(DIA_Gorax_Orlan);
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_Orlan_240()
{
	AI_Output(other, self, "DIA_Gorax_Orlan_240_15_00"); //我 拿 到 了 金 币 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 240))
	{
		AI_Output(self, other, "DIA_Gorax_Orlan_240_14_01"); //好 极 了 。 你 真 是 好 帮 手 。 拿 上 这 个 治 疗 之 魔 法 卷 轴 作 为 奖 赏 。 现 在 去 找 点 其 它 事 情 做 。
		MIS_GoraxWein = LOG_SUCCESS;
		B_GivePlayerXP(XP_Goraxwein);
	}
	else
	{
		AI_Output(self, other, "DIA_Gorax_Orlan_240_14_02"); //但 是 你 已 经 把 那 些 钱 花 掉 了 一 部 分 ， 不 是 吗 ？ 你 真 是 废 物 - 走 开 ！
		MIS_GoraxWein = LOG_FAILED;
		B_GiveInvItems(other, self, ItMI_Gold, Npc_HasItems(other, ItmI_Gold));
	};

	Info_ClearChoices(DIA_Gorax_Orlan);
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_JOB(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 35;
	condition		= DIA_Gorax_JOB_Condition;
	information		= DIA_Gorax_JOB_Info;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_Gorax_JOB_Condition()
{
	return TRUE;
};

func void DIA_Gorax_JOB_Info()
{
	AI_Output(other, self, "DIA_Gorax_JOB_15_00"); //你 在 这 里 做 什 么 工 作 ？
	AI_Output(self, other, "DIA_Gorax_JOB_14_01"); //我 的 工 作 多 而 且 繁 杂 。 我 不 仅 仅 是 管 理 员 ， 还 是 会 计 。
	AI_Output(self, other, "DIA_Gorax_JOB_14_02"); //此 外 ， 我 还 监 管 酒 窖 ， 并 管 理 整 个 修 道 院 的 食 物 供 应 。
	AI_Output(self, other, "DIA_Gorax_JOB_14_03"); //所 以 ， 如 果 你 需 要 什 么 东 西 话 ， 一 定 能 在 我 这 里 找 到 - 而 且 只 需 要 很 少 的 捐 赠 。

	Log_CreateTopic(Topic_KlosterTrader, LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, Topic_KlosterTrader_2);
};

///////////////////////////////////////////////////////////////////////
//	Info TRADE
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_TRADE(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 99;
	condition		= DIA_Gorax_TRADE_Condition;
	information		= DIA_Gorax_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "我 需 要 一 些 东 西 … …";
};

func int DIA_Gorax_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorax_JOB))
	{
		return TRUE;
	};
};

func void DIA_Gorax_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Gorax_TRADE_15_00"); //我 需 要 一 些 东 西 … …
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP für KDF
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KDF(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 5;
	condition		= DIA_Gorax_KDF_Condition;
	information		= DIA_Gorax_KDF_Info;
	description		= "我 需 要 一 个 新 地 方 睡 觉 。";
};

func int DIA_Gorax_KDF_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Gorax_KDF_Info()
{
	AI_Output(other, self, "DIA_Gorax_KDF_15_00"); //我 需 要 一 个 新 地 方 睡 觉 。
	AI_Output(self, other, "DIA_Gorax_KDF_14_01"); //这 里 有 一 间 空 房 。 拿 上 钥 匙 ， 你 可 以 在 那 里 找 到 你 需 要 的 一 切 。

	B_GiveInvItems(self, other, ItKe_KDFPlayer, 1);
	Wld_InsertItem(ItPo_Perm_Mana, "FP_ITEM_KDFPLAYER");
};

// ########################################################################
// ##
// ## Kapitel 2
// ##
// ########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Kap2_EXIT(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 999;
	condition		= DIA_Gorax_Kap2_EXIT_Condition;
	information		= DIA_Gorax_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorax_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ########################################################################
// ##
// ## Kapitel 3
// ##
// ########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Kap3_EXIT(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 999;
	condition		= DIA_Gorax_Kap3_EXIT_Condition;
	information		= DIA_Gorax_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorax_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info KillPedro
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_KILLPEDRO(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 3;
	condition		= DIA_Gorax_KILLPEDRO_Condition;
	information		= DIA_Gorax_KILLPEDRO_Info;
	important		= TRUE;
};

func int DIA_Gorax_KILLPEDRO_Condition()
{
	if ((Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Gorax_KILLPEDRO_Info()
{
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_14_00"); //等 等 ， 雇 佣 兵 。 我 要 同 你 谈 谈 。
	AI_Output(other, self, "DIA_Gorax_KILLPEDRO_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_14_02"); //修 道 院 正 面 临 非 常 微 妙 的 境 遇 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_14_03"); //现 在 ， 每 个 人 似 乎 都 不 信 任 别 人 。 其 次 ， 那 个 比 德 罗 拿 走 的 东 西 ， 那 是 非 常 … … （ 噎 住 ）
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_14_04"); //我 有 一 个 任 务 给 你 ， 是 来 自 最 高 权 威 机 构 的 。 你 不 是 火 焰 兄 弟 会 的 成 员 ， 因 此 是 这 里 唯 一 一 个 可 以 帮 我 们 解 决 这 个 问 题 的 人 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_14_05"); //但 是 我 必 须 警 告 你 。 如 果 我 给 了 你 这 个 任 务 ， 你 就 必 须 要 完 成 它 。 一 旦 你 知 道 这 个 任 务 的 内 容 ， 那 你 就 没 有 选 择 的 余 地 了 。 你 明 白 了 吗 ？

	Info_ClearChoices(DIA_Gorax_KILLPEDRO);
	Info_AddChoice(DIA_Gorax_KILLPEDRO, "算 了 吧 。 那 样 对 我 来 说 太 冒 险 。", DIA_Gorax_KILLPEDRO_nein);
	Info_AddChoice(DIA_Gorax_KILLPEDRO, "告 诉 我 你 想 要 什 么 。", DIA_Gorax_KILLPEDRO_ja);
};

func void DIA_Gorax_KILLPEDRO_nein()
{
	AI_Output(other, self, "DIA_Gorax_KILLPEDRO_nein_15_00"); //算 了 吧 。 那 样 对 我 来 说 太 冒 险 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_nein_14_01"); //好 吧 。 那 样 的 话 ， 就 算 我 没 有 说 。
	AI_StopProcessInfos(self);
};

func void DIA_Gorax_KILLPEDRO_ja()
{
	AI_Output(other, self, "DIA_Gorax_KILLPEDRO_ja_15_00"); //告 诉 我 你 想 要 什 么 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_ja_14_01"); //好 吧 。 那 么 听 好 了 ， 因 为 我 只 说 一 次 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_ja_14_02"); //因 为 比 德 罗 的 叛 变 ， 瑟 朋 帝 兹 要 你 抓 住 他 后 立 即 把 他 杀 死 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_ja_14_03"); //你 一 旦 完 成 这 个 任 务 ， 马 上 就 会 得 到 报 酬 。
	AI_Output(self, other, "DIA_Gorax_KILLPEDRO_ja_14_04"); //我 从 来 没 有 说 过 ， 你 也 从 来 没 有 听 到 过 ， 明 白 吗 ？

	B_LogEntry(TOPIC_TraitorPedro, TOPIC_TraitorPedro_3);

	B_GivePlayerXP(XP_Gorax_KILLPEDRO_GotMission);
	MIS_Gorax_KillPedro = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

// ########################################################################
// ##
// ## Kapitel 4
// ##
// ########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Kap4_EXIT(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 999;
	condition		= DIA_Gorax_Kap4_EXIT_Condition;
	information		= DIA_Gorax_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorax_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ########################################################################
// ##
// ## Kapitel 5
// ##
// ########################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
instance DIA_Gorax_Kap5_EXIT(C_INFO)
{
	npc				= KDF_508_Gorax;
	nr				= 999;
	condition		= DIA_Gorax_Kap5_EXIT_Condition;
	information		= DIA_Gorax_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gorax_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Gorax_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
