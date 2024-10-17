///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EXIT(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 999;
	condition		= DIA_Pedro_EXIT_Condition;
	information		= DIA_Pedro_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pedro_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_WELCOME(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 1;
	condition		= DIA_Pedro_WELCOME_Condition;
	information		= DIA_Pedro_WELCOME_Info;
	important		= TRUE;
};

func int DIA_Pedro_WELCOME_Condition()
{
	return TRUE;
};

func void DIA_Pedro_WELCOME_Info()
{
	AI_Output(self, other, "DIA_Pedro_WELCOME_09_00"); //欢 迎 来 到 英 诺 斯 的 修 道 院 ， 陌 生 人 。
	AI_Output(self, other, "DIA_Pedro_WELCOME_09_01"); //我 是 比 德 罗 修 士 ， 一 个 谦 卑 的 英 诺 斯 的 仆 人 ， 神 圣 的 修 道 院 的 看 门 人 。
	AI_Output(self, other, "DIA_Pedro_WELCOME_09_02"); //你 需 要 的 是 什 么 ？
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Pedro_Wurst(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 2;
	condition		= DIA_Pedro_Wurst_Condition;
	information		= DIA_Pedro_Wurst_Info;
	description		= "给 ， 拿 一 根 香 肠 ， 兄 弟 ！";
};

func int DIA_Pedro_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Wurst_Info()
{
	AI_Output(other, self, "DIA_Pedro_Wurst_15_00"); //给 ， 拿 一 根 香 肠 ， 兄 弟 ！
	AI_Output(self, other, "DIA_Pedro_Wurst_09_01"); //你 能 想 起 我 真 好 。 我 总 是 被 遗 忘 。
	AI_Output(self, other, "DIA_Pedro_Wurst_09_02"); //你 能 再 给 我 一 根 香 肠 吗 。
	AI_Output(other, self, "DIA_Pedro_Wurst_15_03"); //不 行 ， 那 样 我 就 不 够 了 。
	AI_Output(self, other, "DIA_Pedro_Wurst_09_04"); //嘿 ， 一 根 香 肠 - 没 人 会 留 意 到 的 。 我 用 东 西 来 换 - 我 知 道 一 个 生 长 着 火 荨 麻 的 地 方 。
	AI_Output(self, other, "DIA_Pedro_Wurst_09_05"); //如 果 你 把 它 们 交 给 尼 欧 莱 斯 ， 他 一 定 会 给 你 图 书 馆 的 钥 匙 。 你 说 呢 ？

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

	Info_ClearChoices(DIA_Pedro_Wurst);
	Info_AddChoice(DIA_Pedro_Wurst, "好 吧 ， 再 拿 一 根 香 肠 。", DIA_Pedro_Wurst_JA);
	Info_AddChoice(DIA_Pedro_Wurst, "不 ， 算 了 吧 。", DIA_Pedro_Wurst_NEIN);
};

func void DIA_Pedro_Wurst_JA()
{
	AI_Output(other, self, "DIA_Pedro_Wurst_JA_15_00"); //好 吧 ， 再 拿 一 根 香 肠 。
	AI_Output(self, other, "DIA_Pedro_Wurst_JA_09_01"); //好 吧 。 在 桥 的 另 一 侧 ， 左 边 、 右 边 都 长 着 一 些 火 荨 麻 。
	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Info_ClearChoices(DIA_Pedro_Wurst);
};

func void DIA_Pedro_Wurst_NEIN()
{
	AI_Output(other, self, "DIA_Pedro_Wurst_NEIN_15_00"); //不 ， 算 了 吧 。
	AI_Output(self, other, "DIA_Pedro_Wurst_NEIN_09_01"); //你 想 要 和 高 莱 克 斯 搞 好 关 系 ， 嗯 ？ 新 信 徒 总 是 这 样 … …

	Info_ClearChoices(DIA_Pedro_Wurst);
};

///////////////////////////////////////////////////////////////////////
//	Info EINLASS
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_EINLASS(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 0;
	condition		= DIA_Pedro_EINLASS_Condition;
	information		= DIA_Pedro_EINLASS_Info;
	description		= "我 要 进 入 修 道 院 。";
};

func int DIA_Pedro_EINLASS_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pedro_Welcome))
	{
		return TRUE;
	};
};

func void DIA_Pedro_EINLASS_Info()
{
	AI_Output(other, self, "DIA_Pedro_EINLASS_15_00"); //我 要 进 入 修 道 院 。
	AI_Output(self, other, "DIA_Pedro_EINLASS_09_01"); //只 有 英 诺 斯 的 仆 人 才 能 进 入 修 道 院 。
	AI_Output(self, other, "DIA_Pedro_EINLASS_09_02"); //如 果 你 想 要 向 英 诺 斯 祈 祷 ， 去 找 一 个 路 边 的 神 龛 。 在 那 里 祈 祷 你 将 得 到 宁 静 。
};

///////////////////////////////////////////////////////////////////////
//	Info TEMPEL
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_TEMPEL(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 2;
	condition		= DIA_Pedro_TEMPEL_Condition;
	information		= DIA_Pedro_TEMPEL_Info;
	description		= "我 要 怎 么 做 修 道 院 才 能 相 信 我 ？";
};

// -----------------------------------

// -----------------------------------
func int DIA_Pedro_TEMPEL_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pedro_EINLASS))
	&& (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pedro_TEMPEL_Info()
{
	AI_Output(other, self, "DIA_Pedro_TEMPEL_15_00"); //我 要 怎 么 做 修 道 院 才 能 相 信 我 ？

	if (other.guild != GIL_NONE)
	{
		AI_Output(self, other, "DIA_Pedro_TEMPEL_09_01"); //你 不 能 加 入 修 道 院 - 你 已 经 选 择 了 一 个 方 向 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pedro_TEMPEL_09_02"); //如 果 你 想 要 加 入 英 诺 斯 的 兄 弟 会 ， 你 必 须 学 会 并 遵 守 修 道 院 的 规 定 。
		// AI_Output(self, other, "DIA_Pedro_TEMPEL_09_03"); // Außerdem verlangen wir von jedem neuen Novizen die Gaben an Innos. Ein Schaf und ...
		// B_Say_Gold (self, other, Summe_Kloster);
		AI_Output(self, other, "DIA_ADDON_Pedro_TEMPEL_09_03"); //同 时 ， 我 们 需 要 每 个 新 信 徒 向 英 诺 斯 奉 献 礼 物 。
		AI_Output(self, other, "DIA_ADDON_Pedro_TEMPEL_09_04"); //一 只 绵 羊 和1000枚 金 币 。
		AI_Output(other, self, "DIA_Pedro_TEMPEL_15_04"); //那 可 是 一 大 笔 钱 啊。
		AI_Output(self, other, "DIA_Pedro_TEMPEL_09_05"); //那 是 你 作 为 英 诺 斯 的 仆 人 获 得 新 生 的 标 志 。 当 你 得 到 认 可 后 ， 你 以 前 所 有 的 罪 都 将 得 到 宽 恕 。
		AI_Output(self, other, "DIA_Pedro_TEMPEL_09_06"); //考 虑 好 - 在 成 为 英 诺 斯 的 仆 人 后 ， 你 的 决 定 将 无 法 反 悔 。
		SC_KnowsKlosterTribut = TRUE;
		Log_CreateTopic(Topic_Kloster, LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster, LOG_RUNNING);
		B_LogEntry(Topic_Kloster, Topic_Kloster_2);
	};
};

//*********************************************************************
//	ADDON Statuette
//*********************************************************************
instance DIA_Addon_Pedro_Statuette(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 2;
	condition		= DIA_Addon_Pedro_Statuette_Condition;
	information		= DIA_Addon_Pedro_Statuette_Info;
	description		= "我 已 经 得 到 了 这 个 雕 像 … …";
};

func int DIA_Addon_Pedro_Statuette_Condition()
{
	if ((Npc_HasItems(other, ItMi_LostInnosStatue_Daron))
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Pedro_Rules))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Info()
{
	AI_Output(other, self, "DIA_Addon_Pedro_Statuette_15_00"); //我 找 到 了 这 个 雕 像 。 我 想 修 道 院 里 的 人 正 等 着 它 。
	AI_Output(other, self, "DIA_Addon_Pedro_Statuette_15_01"); //我 现 在 能 进 来 了 吗 ？
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Addon_Pedro_Statuette_09_02"); //嗯 ， 在 这 种 特 殊 情 况 下 ， 你 可 以 免 费 成 为 一 名 新 信 徒 。

		Log_CreateTopic(TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_RangerHelpKDF, TOPIC_Addon_RangerHelpKDF_2);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Pedro_Statuette_09_03"); //恐 怕 即 使 有 这 个 珍 贵 的 宝 石 ， 我 也 不 能 让 你 进 去 。
		AI_Output(self, other, "DIA_Addon_Pedro_Statuette_09_04"); //你 已 经 选 择 了 一 条 不 同 的 道 路 ， 进 入 修 道 院 的 路 已 经 对 你 封 闭 了 。
	};
};
instance DIA_Addon_Pedro_Statuette_Abgeben(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 2;
	condition		= DIA_Addon_Pedro_Statuette_Abgeben_Condition;
	information		= DIA_Addon_Pedro_Statuette_Abgeben_Info;
	description		= "我 不 能 把 这 个 雕 像 交 给 你 吗 ？";
};

func int DIA_Addon_Pedro_Statuette_Abgeben_Condition()
{
	if ((Npc_HasItems(other, ItMi_LostInnosStatue_Daron))
	&& (Npc_KnowsInfo(other, DIA_Addon_Pedro_Statuette))
	&& (hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pedro_Statuette_Abgeben_Info()
{
	AI_Output(other, self, "DIA_Addon_Pedro_Statuette_Abgeben_15_00"); //我 不 能 把 这 个 雕 像 交 给 你 吗 ？
	AI_Output(self, other, "DIA_Addon_Pedro_Statuette_Abgeben_09_01"); //当 然 ， 我 会 妥 善 处 理 的 。 感 谢 你 这 种 无 私 的 行 为 。
	MIS_Addon_Daron_GetStatue = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};

///////////////////////////////////////////////////////////////////////
//	Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_Rules(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 2;
	condition		= DIA_Pedro_Rules_Condition;
	information		= DIA_Pedro_Rules_Info;
	description		= "你 生 活 的 准 则 是 什 么 ？";
};

func int DIA_Pedro_Rules_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pedro_Tempel))
	{
		return TRUE;
	};
};

func void DIA_Pedro_Rules_Info()
{
	AI_Output(other, self, "DIA_Pedro_Rules_15_00"); //你 生 活 的 准 则 是 什 么 ？
	AI_Output(self, other, "DIA_Pedro_Rules_09_01"); //英 诺 斯 是 真 理 和 法 律 之 神 ， 因 此 我 们 永 远 不 能 说 谎 或 者 犯 罪 。
	AI_Output(self, other, "DIA_Pedro_Rules_09_02"); //假 如 你 冒 犯 了 社 团 里 的 修 士 或 者 偷 窃 我 们 的 财 物 ， 你 都 要 支 付 罚 金 。
	AI_Output(self, other, "DIA_Pedro_Rules_09_03"); //英 诺 斯 同 样 也 是 规 则 与 火 焰 之 神。
	AI_Output(self, other, "DIA_Pedro_Rules_09_04"); //作 为 新 信 徒 ， 你 必 须 服 从 和 尊 重 所 有 的 火 魔 法 师 。
	AI_Output(other, self, "DIA_Pedro_Rules_15_05"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Pedro_Rules_09_06"); //此 外 ， 在 修 道 院 里 完 成 所 有 对 社 团 有 益 的 工 作 是 新 信 徒 的 职 责 。
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Pedro_Rules_09_07"); //如 果 你 准 备 好 遵 守 这 些 规 定 ， 并 且 向 英 诺 斯 奉 献 的 话 ， 我 们 将 同 意 你 作 为 新 信 徒 进 入 我 们 的 修 道 院 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_AUFNAHME(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 0;
	condition		= DIA_Pedro_AUFNAHME_Condition;
	information		= DIA_Pedro_AUFNAHME_Info;
	permanent		= TRUE;
	description		= "我 想 要 成 为 一 名 新 信 徒";
};

var int DIA_Pedro_AUFNAHME_NOPERM;
func int DIA_Pedro_AUFNAHME_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pedro_Rules)
	&& (DIA_Pedro_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void B_DIA_Pedro_AUFNAHME_Choice()
{
	Info_ClearChoices(DIA_Pedro_AUFNAHME);
	Info_AddChoice(DIA_Pedro_AUFNAHME, "我 还 想 再 考 虑 一 下", DIA_Pedro_AUFNAHME_NO);
	Info_AddChoice(DIA_Pedro_AUFNAHME, "是 的 ， 我 想 用 我 的 生 命 来 为 英 诺 斯 服 务", DIA_Pedro_AUFNAHME_YES);
};

func void DIA_Pedro_AUFNAHME_Info()
{
	AI_Output(other, self, "DIA_Pedro_AUFNAHME_15_00"); //我 想 要 成 为 一 名 新 信 徒 。

	Npc_PerceiveAll(self);

	if (hero.guild != GIL_NONE)
	{
		AI_Output(self, other, "DIA_Pedro_AUFNAHME_09_01"); //你 已 经 选 择 了 你 的 道 路 。 魔 法 之 路 对 你 关 闭 了 。
		DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	}
	// ADDON>
	else if (Npc_KnowsInfo(other, DIA_Addon_Pedro_Statuette))
	{
		AI_Output(self, other, "DIA_Addon_Pedro_AUFNAHME_09_02"); //你 真 的 希 望 那 样 做 吗 ？ 因 为 你 必 须 了 解 ， 那 时 你 将 不 能 反 悔 。
		B_DIA_Pedro_AUFNAHME_Choice();
	}
	// <ADDON
	else if ((hero.guild == GIL_NONE)
	&& (Npc_HasItems(hero, ItMi_Gold) >= Summe_Kloster)
	&& Wld_DetectNpc(self, Follow_Sheep, NOFUNC, -1)
	&& (Npc_GetDistToNpc(self, other) < 1000))
	{
		AI_Output(self, hero, "DIA_Pedro_AUFNAHME_09_03"); //我 看 到 你 已 经 带 来 了 所 需 的 献 礼 。 如 果 你 真 的 愿 意 的 话 ， 你 现 在 可 以 随 时 成 为 一 名 新 信 徒 。
		AI_Output(self, hero, "DIA_Pedro_AUFNAHME_09_04"); //然 而 ， 如 果 你 做 出 决 定 之 后 ， 将 无 法 反 悔 - 仔 细 考 虑 清 楚 ， 这 是 否 就 是 你 要 的 道 路 ！

		B_DIA_Pedro_AUFNAHME_Choice();
	}
	else
	{
		AI_Output(self, other, "DIA_Pedro_AUFNAHME_09_02"); //你 没 有 带 来 足 够 的 献 礼 。
	};
};

func void DIA_Pedro_AUFNAHME_YES()
{
	AI_Output(other, self, "DIA_Pedro_AUFNAHME_YES_15_00"); //是 的 ， 我 想 用 我 的 生 命 来 为 英 诺 斯 服 务 。
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_YES_09_01"); //那 么 欢 迎 你 ， 兄 弟 。 我 给 你 修 道 院 的 大 门 钥 匙 。
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_YES_09_02"); //作 为 你 的 自 由 决 定 的 象 征 ， 需 要 你 自 己 打 开 大 门 并 穿 过 它 。
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_YES_09_03"); //你 现 在 是 一 名 新 信 徒 。 穿 上 这 件 袍 子 ， 作 为 这 个 兄 弟 会 成 员 的 标 志 。
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_YES_09_04"); //当 你 进 入 修 道 院 后 ， 去 找 帕 兰 。 从 现 在 起 ， 由 他 负 责 安 排 你 。
	AI_Output(other, self, "DIA_Pedro_AUFNAHME_YES_15_05"); //现 在 我 的 罪 已 经 得 到 宽 恕 了 ？
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_YES_09_06"); //还 没 有 。 去 和 大 师 帕 兰 谈 谈 。 他 将 祝 福 你 ， 并 洗 清 你 的 罪 。

	CreateInvItems(self, ItKe_Innos_MIS, 1);
	B_GiveInvItems(self, hero, ItKe_Innos_MIS, 1);

	CreateInvItems(other, ITAR_NOV_L, 1);
	AI_EquipArmor(other, ITAR_NOV_L);

	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other, GIL_NOV);

	DIA_Pedro_AUFNAHME_NOPERM = TRUE;
	NOV_Aufnahme = TRUE;
	B_GivePlayerXP(XP_AufnahmeNovize);

	// ADDON>
	if (Npc_KnowsInfo(other, DIA_Addon_Pedro_Statuette))
	{
		Pedro_NOV_Aufnahme_LostInnosStatue_Daron = TRUE;
		Liesel_Giveaway = LOG_OBSOLETE; // Joly: nix mehr mit Liesel
	};

	// ADDON<

	Wld_AssignRoomToGuild("Kloster02", GIL_KDF);

	AI_StopProcessInfos(self);
};

func void DIA_Pedro_AUFNAHME_NO()
{
	AI_Output(other, self, "DIA_Pedro_AUFNAHME_NO_15_00"); //我 还 想 再 考 虑 一 下 。
	AI_Output(self, other, "DIA_Pedro_AUFNAHME_NO_09_01"); //等 你 准 备 好 的 时 候 再 回 来 。

	Info_ClearChoices(DIA_Pedro_AUFNAHME);
};

//*********************************************************************
//	Erzähl mir vom Leben im Kloster.
//*********************************************************************
instance DIA_Pedro_Monastery(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 90;
	condition		= DIA_Pedro_Monastery_Condition;
	information		= DIA_Pedro_Monastery_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 修 道 院 里 的 生 活 。";
};

func int DIA_Pedro_Monastery_Condition()
{
	return TRUE;
};

func void DIA_Pedro_Monastery_Info()
{
	AI_Output(other, self, "DIA_Pedro_Monastery_15_00"); //告 诉 我 关 于 修 道 院 里 的 生 活 。
	AI_Output(self, other, "DIA_Pedro_Monastery_09_01"); //我 们 住 在 修 道 院 里 是 为 了 英 诺 斯 服 务 。 我 们 新 信 徒 完 成 工 作 ， 并 在 取 得 机 会 之 后 研 究 铭 文 。
	AI_Output(self, other, "DIA_Pedro_Monastery_09_02"); //魔 法 师 监 督 我 们 ， 而 他 们 探 索 魔 法 的 技 艺 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Pedro_PICKPOCKET(C_INFO)
{
	npc				= NOV_600_Pedro;
	nr				= 900;
	condition		= DIA_Pedro_PICKPOCKET_Condition;
	information		= DIA_Pedro_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Pedro_PICKPOCKET_Condition()
{
	C_Beklauen(45, 60);
};

func void DIA_Pedro_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
	Info_AddChoice(DIA_Pedro_PICKPOCKET, DIALOG_BACK, DIA_Pedro_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pedro_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Pedro_PICKPOCKET_DoIt);
};

func void DIA_Pedro_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};

func void DIA_Pedro_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pedro_PICKPOCKET);
};
