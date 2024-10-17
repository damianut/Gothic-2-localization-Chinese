func void B_KommMit()
{
	AI_Output(other, self, "DIA_AkilsSchaf_KommMit_15_00"); //跟 我 来 ！
};

func void B_BIFF_VERARSCHEN()
{
	AI_Output(self, other, "DIA_Biff_ARBEITEN_lebenlassen_07_01"); //我 不 需 要 你 来 糊 弄 我 。
};

func void B_BiffsAnteil_Berechnung() // Joly: Wieviel Kohle muß der SC Biff nun geben:
{
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero, ItMi_Gold);
	UeberschussKohle = (momentanKohle - DJG_Biff_SCGold);
	BiffsAnteil = ((UeberschussKohle) / 2);
};

func void B_BiffsAnteil_PrintScreen()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString(BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil, Anteil);
	BiffsAnteilText = ConcatStrings(BiffsAnteilText_Teil, PRINT_BiffGold);
	AI_PrintScreen(BiffsAnteilText, -1, 45, FONT_ScreenSmall, 4);
};

func void B_Biff_SetRefuseTalk() // Joly: Biffs Geld eintreiberei kommt beim HalbeHalbe Deal nicht so häufig.
{
	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk(Biff, 1000); // Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	}
	else
	{
		Npc_SetRefuseTalk(Biff, 600); // Joly:Biff stehet hier wegen INIT und setrefusetalk. SAVEGAMEFIX
	};
};

//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Biff_EXIT(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 999;
	condition		= DIA_Biff_EXIT_Condition;
	information		= DIA_Biff_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HALLO(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 5;
	condition		= DIA_Biff_HALLO_Condition;
	information		= DIA_Biff_HALLO_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Biff_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info()
{
	AI_Output(other, self, "DIA_Biff_HALLO_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Biff_HALLO_07_01"); //那 真 是 我 这 么 长 时 间 以 来 听 到 的 最 愚 蠢 的 故 事 。 它 长 得 什 么 样 子 ？?

	Info_AddChoice(DIA_Biff_HALLO, "面 对 着 你 的 白 痴 面 孔 ， 我 不 会 说 任 何 事 。", DIA_Biff_HALLO_spott);
	Info_AddChoice(DIA_Biff_HALLO, "我 没 有 任 何 线 索。", DIA_Biff_HALLO_keineAhnung);
	Info_AddChoice(DIA_Biff_HALLO, "别 在 意 ！", DIA_Biff_HALLO_doof);
};

func void DIA_Biff_HALLO_doof()
{
	AI_Output(other, self, "DIA_Biff_HALLO_doof_15_00"); //别 在 意 。
	Info_ClearChoices(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott()
{
	AI_Output(other, self, "DIA_Biff_HALLO_spott_15_00"); //我 从 你 那 猪 头 猪 脑 的 鬼 脸 上 看 不 出 任 何 东 西 。 所 以 我 必 须 要 问 。
	AI_Output(self, other, "DIA_Biff_HALLO_spott_07_01"); //我 觉 得 你 的 嘴 巴 太 大 了 。 应 该 有 人 帮 你 闭 上 它 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

func void DIA_Biff_HALLO_keineAhnung()
{
	AI_Output(other, self, "DIA_Biff_HALLO_keineAhnung_15_00"); //我 没 有 任 何 线 索 。
	AI_Output(self, other, "DIA_Biff_HALLO_keineAhnung_07_01"); //我 在 这 里 等 待 某 些 注 定 会 发 生 的 事 。

	Info_AddChoice(DIA_Biff_HALLO, "你 认 为 会 发 生 什 么 ？", DIA_Biff_HALLO_keineAhnung_was);
};

func void DIA_Biff_HALLO_keineAhnung_was()
{
	AI_Output(other, self, "DIA_Biff_HALLO_keineAhnung_was_15_00"); //你 认 为 会 发 生 什 么 ？
	AI_Output(self, other, "DIA_Biff_HALLO_keineAhnung_was_07_01"); //哦 ， 老 兄 ， 你 真 的 不 是 很 能 干 。 如 果 我 早 知 道 的 话 ， 我 是 不 会 等 的 。

	Info_AddChoice(DIA_Biff_HALLO, "那 可 能 会 发 生 什 么 事 ？ ", DIA_Biff_HALLO_keineAhnung_was_was2);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2()
{
	AI_Output(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_15_00"); //那 可 能 会 发 生 什 么 事 ？
	AI_Output(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_07_01"); //你 令 我 不 安 。 看 ， 我 不 在 乎 发 生 了 什 么 ， 只 要 某 件 事 没 有 发 生 就 行 。

	Info_AddChoice(DIA_Biff_HALLO, "那 你 为 什 么 不 做 些 什 么 ？", DIA_Biff_HALLO_keineAhnung_was_was2_was3);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3()
{
	AI_Output(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00"); //那 你 为 什 么 不 做 些 什 么 ？
	AI_Output(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01"); //如 果 你 不 立 即 停 止 提 问 那 些 愚 蠢 的 问 题 ， 我 就 要 帮 你 封 上 那 张 臭 嘴 。

	Info_AddChoice(DIA_Biff_HALLO, "如 果 你 只 是 在 这 里 等 待 ， 那 么 什 么 事 都 不 会 发 生 ！", DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4()
{
	AI_Output(other, self, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00"); //如 果 你 只 是 在 这 里 等 待 ， 那 么 什 么 事 都 不 会 发 生 ！
	AI_Output(self, other, "DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01"); //就 这 样 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info washierimTal
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_WASHIERIMTAL(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 7;
	condition		= DIA_Biff_WASHIERIMTAL_Condition;
	information		= DIA_Biff_WASHIERIMTAL_Info;
	description		= "你 希 望 能 在 矿 藏 山 谷 里 找 到 什 么 ？";
};

func int DIA_Biff_WASHIERIMTAL_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Biff_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Biff_WASHIERIMTAL_Info()
{
	AI_Output(other, self, "DIA_Biff_WASHIERIMTAL_15_00"); //你 希 望 能 在 矿 藏 山 谷 里 找 到 什 么 ？
	AI_Output(self, other, "DIA_Biff_WASHIERIMTAL_07_01"); //金 币 和 荣 誉 。 还 有 什 么 ？ 当 我 干 掉 那 些 龙 之 后 ， 我 就 要 在 金 币 里 游 泳 。
	AI_Output(self, other, "DIA_Biff_WASHIERIMTAL_07_02"); //足 够 让 我 在 余 生 中 游 遍 所 有 的 酒 馆 和 妓 院 。

	Info_AddChoice(DIA_Biff_WASHIERIMTAL, "那 好 吧 ， 我 祝 你 好 运 。", DIA_Biff_WASHIERIMTAL_vielglueck);
	Info_AddChoice(DIA_Biff_WASHIERIMTAL, "要 么 那 样 ， 要 么 你 就 会 死 ！", DIA_Biff_WASHIERIMTAL_ihrtot);
};

func void DIA_Biff_WASHIERIMTAL_ihrtot()
{
	AI_Output(other, self, "DIA_Biff_WASHIERIMTAL_ihrtot_15_00"); //要 么 那 样 ， 要 么 你 就 会 死 ！
	AI_Output(self, other, "DIA_Biff_WASHIERIMTAL_ihrtot_07_01"); //那 又 怎 么 样 ？ 那 只 是 其 中 的 一 部 分 。 如 果 你 想 发 财 的 话 ， 就 必 须 要 冒 一 点 险 。

	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck()
{
	AI_Output(other, self, "DIA_Biff_WASHIERIMTAL_vielglueck_15_00"); //那 好 吧 ， 我 祝 你 好 运 。
	AI_Output(self, other, "DIA_Biff_WASHIERIMTAL_vielglueck_07_01"); //我 不 需 要 运 气 。 只 要 我 的 斧 子 。

	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

///////////////////////////////////////////////////////////////////////
//	Info arbeiten
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ARBEITEN(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 8;
	condition		= DIA_Biff_ARBEITEN_Condition;
	information		= DIA_Biff_ARBEITEN_Info;
	permanent		= TRUE;
	description		= "从 现 在 起 ， 你 打 算 怎 么 为 我 工 作 ？";
};

func int DIA_Biff_ARBEITEN_Condition()
{
	if ((DJG_BiffParty == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Biff_HALLO))
	&& (DJG_Biff_Stay == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_ARBEITEN_Info()
{
	AI_Output(other, self, "DIA_Biff_ARBEITEN_15_00"); //从 现 在 起 ， 你 打 算 怎 么 为 我 工 作 ？

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_4);

	if (DJG_BiffParty_nomore >= 6) // Joly: Biff hat bei 3 die Schnauze voll vom SC
	{
		AI_Output(self, other, "DIA_Biff_ARBEITEN_07_01"); //我 们 试 过 一 次 。 根 本 不 行 。 谢 谢 了 ， 没 兴 趣 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_ARBEITEN_07_02"); //嗯 。 为 什 么 不 ？ 你 在 盘 算 什 么 ？
	};

	Info_ClearChoices(DIA_Biff_ARBEITEN);

	Info_AddChoice(DIA_Biff_ARBEITEN, "如 果 我 饶 恕 了 你 的 性 命 ， 就 算 你 幸 运。", DIA_Biff_ARBEITEN_lebenlassen);
	Info_AddChoice(DIA_Biff_ARBEITEN, "你 可 以 得 到 一 半 的 战 利 品 。", DIA_Biff_ARBEITEN_HalbeHalbe);
	Info_AddChoice(DIA_Biff_ARBEITEN, "我 现 在 付 你 １ ０ ０ 金 币", DIA_Biff_ARBEITEN_100);
};

func void DIA_Biff_ARBEITEN_100()
{
	AI_Output(other, self, "DIA_Biff_ARBEITEN_100_15_00"); //我 现 在 付 你 １ ０ ０ 金 币

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(self, other, "DIA_Biff_ARBEITEN_100_07_01"); //那 好 吧 。 无 论 如 何 ， 它 已 经 开 始 了 。 前 进 ， 我 会 跟 着 你 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Follow");
		B_Biff_SetRefuseTalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BiffParty = TRUE;
	}
	else
	{
		B_BIFF_VERARSCHEN();
		AI_StopProcessInfos(self);
		DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
	};
};

func void DIA_Biff_ARBEITEN_HalbeHalbe()
{
	AI_Output(other, self, "DIA_Biff_ARBEITEN_HalbeHalbe_15_00"); //你 可 以 得 到 一 半 的 战 利 品 。
	AI_Output(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_01"); //那 听 起 来 不 错 。 但 是 我 警 告 你 ， 不 要 惹 我 发 火 ， 否 则 你 会 后 悔 的 。
	AI_Output(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_02"); //而 且 还 有 一 件 事 ， 我 不 要 任 何 武 器 和 其 它 那 些 你 在 这 里 收 集 的 垃 圾 。 我 只 对 黄 金 感 兴 趣 ， 明 白 吗 ？

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe = TRUE;
	B_Biff_SetRefuseTalk();

	if (DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff schaut, wieviel Geld der Spieler jetzt hat.
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_ARBEITEN_HalbeHalbe_07_03"); //但 是 ， 我 所 说 的 那 些 事 ， 你 已 经 全 都 知 道 了 。
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen()
{
	AI_Output(other, self, "DIA_Biff_ARBEITEN_lebenlassen_15_00"); //如 果 我 饶 恕 了 你 的 性 命 ， 就 算 你 幸 运 。
	B_BIFF_VERARSCHEN();
	AI_StopProcessInfos(self);
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Geldeintreiben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_GELDEINTREIBEN(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 9;
	condition		= DIA_Biff_GELDEINTREIBEN_Condition;
	information		= DIA_Biff_GELDEINTREIBEN_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int BIFF_LABERT_GELDEINTREIBEN;
func int DIA_Biff_GELDEINTREIBEN_Condition()
{
	if ((DJG_Biff_SCGold < Npc_HasItems(hero, ItMi_Gold) - 1)
	&& ((Npc_GetBodyState(hero)) != BS_INVENTORY) // Joly: wegen Truhen
	&& ((Npc_GetBodyState(hero)) != BS_MOBINTERACT_INTERRUPT)
	&& (((Npc_GetBodyState(hero)) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) // Joly: wegen Plündern von NSC-Invs
	&& (((Npc_GetBodyState(hero)) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) // Joly: wegen Geldbeutel
	&& (DJG_Biff_HalbeHalbe == TRUE)
	&& (DJG_BiffParty == TRUE)
	&& (DJG_Biff_Stay == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void DIA_Biff_GELDEINTREIBEN_Info()
{
	AI_Output(self, other, "DIA_Biff_GELDEINTREIBEN_07_00"); //等 一 下 ！ 你 不 是 说 战 利 品 的 一 半 归 我 吗 ？ 给 我 ！

	B_BiffsAnteil_Berechnung();
	B_BiffsAnteil_PrintScreen();

	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);

	Info_AddChoice(DIA_Biff_GELDEINTREIBEN, "我 付 不 起 你 的 钱 。", DIA_Biff_GELDEINTREIBEN_zuTeuer);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN, "这 是 你 的 那 一 份 。", DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_geben()
{
	AI_Output(other, self, "DIA_Biff_GELDEINTREIBEN_geben_15_00"); //这 是 你 的 那 一 份 。
	AI_Output(self, other, "DIA_Biff_GELDEINTREIBEN_geben_07_01"); //好 吧 。 我 们 出 发 。
	AI_StopProcessInfos(self);
	B_GiveInvItems(other, self, ItMi_Gold, BiffsAnteil);
	B_Biff_SetRefuseTalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff schaut, wieviel Geld der Spieler jetzt hat.
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer()
{
	AI_Output(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00"); //我 付 不 起 你 的 钱 。
	AI_Output(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01"); //别 向 我 嘀 咕 了 。 我 们 已 经 达 成 协 议 按 一 半 算 。

	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN, "恐 怕 从 现 在 起 ， 我 们 必 须 分 开 了 。", DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN, "这 是 你 的 那 一 份 。", DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen()
{
	AI_Output(other, self, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00"); //我必须和你分手。
	AI_Output(self, other, "DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01"); //如 果 你 这 么 说 的 话 ， 那 我 必 须 拿 到 我 的 一 份 。

	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	B_Attack(self, other, AR_NONE, 1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info IchBleibhier
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_ICHBLEIBHIER(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 6;
	condition		= DIA_Biff_ICHBLEIBHIER_Condition;
	information		= DIA_Biff_ICHBLEIBHIER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Biff_ICHBLEIBHIER_Condition()
{
	if (
	((Npc_GetBodyState(hero)) != BS_INVENTORY) // Joly: wegen Truhen
	&& ((Npc_GetBodyState(hero)) != BS_MOBINTERACT_INTERRUPT)
	&& (DJG_BiffParty == TRUE)
	&& (DJG_Biff_Stay == FALSE)
	&& (
	(
	(
	// Joly: Biff stört nicht das Drachengespräch!
	((Npc_GetDistToWP(self, "OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(SwampDragon) == FALSE) && (SwampDragon.flags != 0))
	|| ((Npc_GetDistToWP(self, "LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(RockDragon) == FALSE) && (RockDragon.flags != 0))
	|| ((Npc_GetDistToWP(self, "CASTLE_36") < 4000) && (Npc_IsDead(FireDragon) == FALSE) && (FireDragon.flags != 0))
	|| ((Npc_GetDistToWP(self, "OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(IceDragon) == FALSE) && (IceDragon.flags != 0))
	)
	&& (Npc_HasItems(hero, ItMi_InnosEye_Mis) >= 1)
	)
	|| (Npc_GetDistToWP(self, "OC_CENTER_GUARD_02") < 4500) // Joly: Biff kommt nicht in die Burg
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Biff_ICHBLEIBHIER_Info()
{
	AI_Output(self, other, "DIA_Biff_ICHBLEIBHIER_07_00"); //这 是 相 当 危 险 的 地 区 。 你 在 前 面 走 ， 我 在 后 面 。

	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 300);

	if (Npc_GetDistToWP(self, "OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self, "Stay_Swamp");
	};

	if (Npc_GetDistToWP(self, "LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self, "Stay_Rock");
	};

	if (Npc_GetDistToWP(self, "CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self, "Stay_Fire");
	};

	if (Npc_GetDistToWP(self, "OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self, "Stay_Ice");
	};

	if (Npc_GetDistToWP(self, "OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self, "Stay_AwayFromOC");
	};

	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Stay_AwayFromOC
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Stay_AwayFromOC(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 3;
	condition		= DIA_Biff_Stay_AwayFromOC_Condition;
	information		= DIA_Biff_Stay_AwayFromOC_Info;
	permanent		= TRUE;
	description		= "（ 再 次 带 上 比 夫 ）";
};

func int DIA_Biff_Stay_AwayFromOC_Condition()
{
	if ((
	(Npc_GetDistToWP(self, "OW_PATH_298") < 500)
	|| (Npc_GetDistToWP(self, "LOCATION_19_01") < 500)
	)
	&& (DJG_BiffParty == TRUE)
	&& (DJG_Biff_Stay == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Biff_Stay_AwayFromOC_Info()
{
	B_KommMit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info Kohleweggeben
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KOHLEWEGGEBEN(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 10;
	condition		= DIA_Biff_KOHLEWEGGEBEN_Condition;
	information		= DIA_Biff_KOHLEWEGGEBEN_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Biff_KOHLEWEGGEBEN_Condition()
{
	if ((DJG_Biff_SCGold > Npc_HasItems(hero, ItMi_Gold))
	&& (DJG_Biff_HalbeHalbe == TRUE)
	&& (DJG_BiffParty == TRUE)
	&& (DJG_Biff_Stay == FALSE))
	{
		// Joly:return TRUE;
	};
};

func void DIA_Biff_KOHLEWEGGEBEN_Info()
{
	AI_Output(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_00"); //不 要 把 你 的 金 子 丢 的 到 处 都 是 。
	AI_Output(self, other, "DIA_Biff_KOHLEWEGGEBEN_07_01"); //那 最 好 把 它 给 我 。

	AI_StopProcessInfos(self);
	DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff merkt sich wieder, wieviel Geld der Spieler jetzt hat.
};

///////////////////////////////////////////////////////////////////////
//	Info BiffLosWerden
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_BIFFLOSWERDEN(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 11;
	condition		= DIA_Biff_BIFFLOSWERDEN_Condition;
	information		= DIA_Biff_BIFFLOSWERDEN_Info;
	permanent		= TRUE;
	description		= "我 想 ， 这 就 是 我 们 的 合 作 结 束 的 地 方 。";
};

func int DIA_Biff_BIFFLOSWERDEN_Condition()
{
	if (DJG_BiffParty == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_BIFFLOSWERDEN_Info()
{
	AI_Output(other, self, "DIA_Biff_BIFFLOSWERDEN_15_00"); //我 想 ， 这 就 是 我 们 的 合 作 结 束 的 地 方 。
	AI_Output(self, other, "DIA_Biff_BIFFLOSWERDEN_07_01"); //随 便 吧 。 我 也 能 考 虑 更 多 的 事 情 。 再 见 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 1);
};

///////////////////////////////////////////////////////////////////////
//	Info MehrGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_MEHRGELD(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 12;
	condition		= DIA_Biff_MEHRGELD_Condition;
	information		= DIA_Biff_MEHRGELD_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Biff_MEHRGELD_Condition()
{
	if ((DJG_BiffParty == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (DJG_Biff_Stay == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Biff_MEHRGELD_Info_OneTime;
func void DIA_Biff_MEHRGELD_Info()
{
	AI_Output(self, other, "DIA_Biff_MEHRGELD_07_00"); //我 有 一 种 感 觉 ， 我 可 以 从 你 那 里 弄 到 更 多 的 钱 。

	if (DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output(self, other, "DIA_Biff_MEHRGELD_07_01"); //100枚 金 币 应 该 可 以 。
		if (DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Biff_MEHRGELD_07_02"); //没 问 题 。 当 然 ， 我 没 有 忘 记 我 们 要 分 配 战 利 品 。
			AI_Output(self, other, "DIA_Biff_MEHRGELD_07_03"); //所 以 我 才 没 有 不 时 要 求 你 给 我 更 多 的 钱 。
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_MEHRGELD_07_04"); //我 还 要100枚 金 币 。
	};

	Info_ClearChoices(DIA_Biff_MEHRGELD);

	Info_AddChoice(DIA_Biff_MEHRGELD, "我 付 不 起 你 的 钱 。", DIA_Biff_MEHRGELD_zuTeuer);
	Info_AddChoice(DIA_Biff_MEHRGELD, "好 吧 。 你 值 那 个 价 。", DIA_Biff_MEHRGELD_ok);
};

func void DIA_Biff_MEHRGELD_ok()
{
	AI_Output(other, self, "DIA_Biff_MEHRGELD_ok_15_00"); //好 吧 。 你 值 那 个 价 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(self, other, "DIA_Biff_MEHRGELD_ok_07_01"); //我 应 该 这 么 说 。 那 么 我 们 走 吧 。

		AI_StopProcessInfos(self);

		if (DJG_Biff_HalbeHalbe == TRUE)
		{
			DJG_Biff_SCGold = Npc_HasItems(hero, ItMi_Gold); // Biff schaut, wieviel Geld der Spieler jetzt hat.
		};

		B_Biff_SetRefuseTalk();
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_MEHRGELD_ok_07_02"); //你 这 可 怜 的 混 蛋 ， 你 甚 至 连 一 名 士 兵 的 钱 都 付 不 出 。
		AI_Output(self, other, "DIA_Biff_MEHRGELD_ok_07_03"); //我 想 我 会 找 到 另 外 一 个 生 意 伙 伴 。

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_Biff_HalbeHalbe = FALSE;
		DJG_BiffParty = FALSE;
		DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
	};
};

func void DIA_Biff_MEHRGELD_zuTeuer()
{
	AI_Output(other, self, "DIA_Biff_MEHRGELD_zuTeuer_15_00"); //我 付 不 起 你 的 钱 。
	AI_Output(self, other, "DIA_Biff_MEHRGELD_zuTeuer_07_01"); //我 付 不 起 你 的 钱 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = (DJG_BiffParty_nomore + 2);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_HEILUNG(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 4;
	condition		= DIA_Biff_HEILUNG_Condition;
	information		= DIA_Biff_HEILUNG_Info;
	permanent		= TRUE;
	description		= "你 需 要 治 疗 药 剂 吗 ？";
};

func int DIA_Biff_HEILUNG_Condition()
{
	if (DJG_BiffParty == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_HEILUNG_Info()
{
	AI_Output(other, self, "DIA_Biff_HEILUNG_15_00"); //你 需 要 治 疗 药 剂 吗 ？
	AI_Output(self, other, "DIA_Biff_HEILUNG_07_01"); //当 然 ， 又 没 什 么 坏 处 。

	Info_ClearChoices(DIA_Biff_HEILUNG);
	Info_AddChoice(DIA_Biff_HEILUNG, "我 稍 后 给 你 一 些 东 西 。", DIA_Biff_HEILUNG_spaeter);
	Info_AddChoice(DIA_Biff_HEILUNG, "（ 最 小 的 治 疗 药 剂 ）", DIA_Biff_HEILUNG_heiltrankLow);
	Info_AddChoice(DIA_Biff_HEILUNG, "（ 最 好 的 治 疗 药 剂 ）", DIA_Biff_HEILUNG_heiltrank);
};

func void DIA_Biff_HEILUNG_heiltrank()
{
	if (B_GiveInvItems(other, self, ItPo_Health_03, 1))
	{
		B_UseItem(self, ItPo_Health_03);
	}
	else if (B_GiveInvItems(other, self, ItPo_Health_02, 1))
	{
		B_UseItem(self, ItPo_Health_02);
	}
	else if (B_GiveInvItems(other, self, ItPo_Health_01, 1))
	{
		B_UseItem(self, ItPo_Health_01);
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_HEILUNG_heiltrank_07_00"); //我 想 ， 我 要 一 直 等 到 你 给 我 一 个 的 时 候 。
	};

	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_heiltrankLow()
{
	if (B_GiveInvItems(other, self, ItPo_Health_01, 1))
	{
		B_UseItem(self, ItPo_Health_01);
	}
	else if (B_GiveInvItems(other, self, ItPo_Health_02, 1))
	{
		B_UseItem(self, ItPo_Health_02);
	}
	else if (B_GiveInvItems(other, self, ItPo_Health_03, 1))
	{
		B_UseItem(self, ItPo_Health_03);
	}
	else
	{
		AI_Output(self, other, "DIA_Biff_HEILUNG_heiltrankLow_07_00"); //不 幸 的 是 ， 你 现 在 什 么 都 没 有 。 我 稍 后 再 回 来 。
	};

	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_spaeter()
{
	AI_Output(other, self, "DIA_Biff_HEILUNG_spaeter_15_00"); //我 稍 后 给 你 一 些 东 西 。
	AI_Output(self, other, "DIA_Biff_HEILUNG_spaeter_07_01"); //但 是 不 要 忘 记 了 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DRACHENTOT(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 5;
	condition		= DIA_Biff_DRACHENTOT_Condition;
	information		= DIA_Biff_DRACHENTOT_Info;
	description		= "就 是 那 样 。 所 有 的 龙 都 死 了 。";
};

func int DIA_Biff_DRACHENTOT_Condition()
{
	if (DJG_BiffSurvivedLastDragon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DRACHENTOT_Info()
{
	AI_Output(other, self, "DIA_Biff_DRACHENTOT_15_00"); //就 是 那 样 。 所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Biff_DRACHENTOT_07_01"); //是 的 。 我 还 站 着 呢 。
	AI_Output(self, other, "DIA_Biff_DRACHENTOT_07_02"); //你 确 定 那 是 最 后 一 个 吗 ？
	AI_Output(other, self, "DIA_Biff_DRACHENTOT_15_03"); //我 应 该 这 么 想 。
	AI_Output(self, other, "DIA_Biff_DRACHENTOT_07_04"); //太 糟 了 。 我 才 刚 刚 热 身 。
	B_GivePlayerXP(XP_BiffSurvivedLastDragon);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_KnowWhereEnemy(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 2;
	condition		= DIA_Biff_KnowWhereEnemy_Condition;
	information		= DIA_Biff_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "你 不 想 在 这 个 世 界 上 进 行 一 些 旅 行 吗 ？";
};

func int DIA_Biff_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Biff_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_15_00"); //你 不 想 在 这 个 世 界 上 进 行 一 些 旅 行 吗 ？
	AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_07_01"); //什 么 ？

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_15_02"); //没 关 系 。 至 少 我 的 船 装 满 了 。
		AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_07_03"); //别 烦 我 了 ， 老 兄 。
	}
	else
	{
		AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_15_04"); //我 要 离 开 克 霍 里 尼 斯 ， 然 后 到 一 个 岛 上 去 寻 找 新 的 敌 人 。

		Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy, "我 只 是 想 ， 我 最 好 提 一 下 。", DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy, "你 要 跟 我 来 吗 ？。", DIA_Biff_KnowWhereEnemy_Yes);
	};
};

func void DIA_Biff_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_Yes_15_00"); //你 要 跟 我 来 吗 ？。
	AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_Yes_07_01"); //我 担 心 的 不 是 更 多 的 敌 人 。 我 想 要 … …
	AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_Yes_15_02"); //我 们 去 的 地 方 ， 金 子 多 得 你 都 拿 不 起 来 。
	AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_Yes_07_03"); //如 果 是 那 样 的 话 ， 我 加 入 。 我 们 去 哪 里 ？
	AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_Yes_15_04"); //但 是 首 先 我 们 要 带 你 离 开 矿 藏 山 谷 。
	AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_Yes_07_05"); //没 问 题 。 我 出 发 了 。 在 关 卡 和 我 碰 头 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_4);

	B_GivePlayerXP(XP_Crewmember_Success);

	self.flags = NPC_FLAG_IMMORTAL;
	Biff_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);
	Biff_FollowsThroughPass = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "RunsToPass");

	Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
};

func void DIA_Biff_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Biff_KnowWhereEnemy_No_15_00"); //我 只 是 想 ， 我 最 好 提 一 下 。
	AI_Output(self, other, "DIA_Biff_KnowWhereEnemy_No_07_01"); //嗯 ， 嗯 。 那 玩 的 开 心 。

	Biff_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	Gleich geht´s los
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_Pass(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 55;
	condition		= DIA_Biff_Pass_Condition;
	information		= DIA_Biff_Pass_Info;
	permanent		= TRUE;
	description		= "你 能 穿 过 关 卡 ？";
};

func int DIA_Biff_Pass_Condition()
{
	if ((Npc_GetDistToWP(self, "START") < 1000)
	&& (Biff_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Biff_Pass_Info()
{
	AI_Output(other, self, "DIA_Biff_Pass_15_00"); //你 能 穿 过 关 卡 ？
	AI_Output(self, other, "DIA_Biff_Pass_07_01"); //别 胡 说 了 。 继 续 。 我 想 要 最 终 爬 到 顶 上 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Biff_PICKPOCKET(C_INFO)
{
	npc				= DJG_713_Biff;
	nr				= 900;
	condition		= DIA_Biff_PICKPOCKET_Condition;
	information		= DIA_Biff_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Biff_PICKPOCKET_Condition()
{
	C_Beklauen(92, 320);
};

func void DIA_Biff_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
	Info_AddChoice(DIA_Biff_PICKPOCKET, DIALOG_BACK, DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
};

func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
};
