///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_EXIT(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 999;
	condition		= DIA_Addon_Nefarius_EXIT_Condition;
	information		= DIA_Addon_Nefarius_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Nefarius_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Nefarius_NW_PICKPOCKET(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 900;
	condition		= DIA_Addon_Nefarius_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Nefarius_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Nefarius_NW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (35 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Nefarius_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Nefarius_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Nefarius_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Nefarius_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Nefarius_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_Windfist, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Nefarius_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Nefarius_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_NW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Hallo(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_Hallo_Condition;
	information		= DIA_Addon_Nefarius_Hallo_Info;
	description		= "进 行 的 怎 么 样 ？";
};

func int DIA_Addon_Nefarius_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Hallo_15_00"); //进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Hallo_05_01"); //你 在 这 里 做 什 么 ？ 这 真 是 奇 遇 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Hallo_05_02"); //我 以 为 你 被 杀 了 。
	AI_Output(other, self, "DIA_Addon_Nefarius_Hallo_15_03"); //差 一 点 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Hallo_05_04"); //有 一 个 关 于 你 的 小 题 大 作 的 事 ， 你 知 道 吗 ？ 我 差 点 认 不 出 萨 图 拉 斯 ， 在 以 前 那 事 发 生 之 后 ， 他 的 变 化 非 常 大 。
};

///////////////////////////////////////////////////////////////////////
//	Info keineahnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_keineahnung(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_keineahnung_Condition;
	information		= DIA_Addon_Nefarius_keineahnung_Info;
	description		= "那 是 什 么 类 型 的 传 送 门 ？";
};

func int DIA_Addon_Nefarius_keineahnung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Nefarius_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_keineahnung_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_keineahnung_15_00"); //那 是 什 么 类 型 的 传 送 门 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_keineahnung_05_01"); //我 们 怀 疑 它 通 向 一 个 不 为 人 知 的 山 谷 ， 那 里 一 定 隐 藏 着 远 古 文 明 的 城 市 。
	AI_Output(self, other, "DIA_Addon_Nefarius_keineahnung_05_02"); //但 是 传 送 门 后 的 石 头 是 用 厚 重 的 岩 石 制 成 的 ， 非 常 厚 。
	AI_Output(self, other, "DIA_Addon_Nefarius_keineahnung_05_03"); //同 时 ， 那 里 没 有 传 送 魔 法 的 迹 象 。 非 常 神 秘 … …
};

///////////////////////////////////////////////////////////////////////
//	Info WieMechanik
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_WieMechanik(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_WieMechanik_Condition;
	information		= DIA_Addon_Nefarius_WieMechanik_Info;
	description		= "你 知 道 怎 么 激 活 它 吗 ？";
};

func int DIA_Addon_Nefarius_WieMechanik_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WieMechanik_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_WieMechanik_15_00"); //你 知 道 怎 么 激 活 它 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_WieMechanik_05_01"); //某 个 失 踪 的 饰 物 看 来 是 一 种 魔 法 钥 匙 。
	AI_Output(self, other, "DIA_Addon_Nefarius_WieMechanik_05_03"); //我 们 需 要 它 才 能 更 进 一 步 。
	AI_Output(self, other, "DIA_Addon_Nefarius_WieMechanik_05_02"); //它 一 定 和 传 送 门 旁 的 环 型 凹 槽 完 全 吻 合 。
};

///////////////////////////////////////////////////////////////////////
//	Info SCbringOrnaments
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_SCbringOrnaments(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_SCbringOrnaments_Condition;
	information		= DIA_Addon_Nefarius_SCbringOrnaments_Info;
	description		= "我 带 来 了 饰 物 的 一 部 分 。";
};

func int DIA_Addon_Nefarius_SCbringOrnaments_Condition()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_SCbringOrnaments_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_00"); //我 带 来 了 饰 物 的 一 部 分 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_01"); //（ 兴 奋 的 ） 真 的 吗 ？ 那 太 好 了 。
	AI_Output(other, self, "DIA_Addon_Nefarius_SCbringOrnaments_15_02"); //你 知 道 其 它 部 分 在 哪 里 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_03"); //根 据 古 代 铭 文 记 载 ， 它 被 分 成 四 部 分 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_04"); //而 且 看 起 来 那 些 部 分 仍 旧 可 以 在 这 个 岛 上 找 到 … … …
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_05"); //在 梅 达 里 昂 的 帮 助 下 ， 我 已 经 翻 译 出 了 一 些 铭 文 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_06"); //有 一 些 线 索 指 出 其 余 的 几 个 部 分 在 哪 里 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_07"); //给 。 我 已 经 在 这 张 地 图 上 标 明 了 几 个 位 置 。
	CreateInvItems(self, ItWr_Map_NewWorld_Ornaments_Addon, 1);
	B_GiveInvItems(self, other, ItWr_Map_NewWorld_Ornaments_Addon, 1);
	MIS_Addon_Nefarius_BringMissingOrnaments = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_1);
	Log_AddEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_2);

	B_StartotherRoutine(BAU_4300_Addon_Cavalorn, "OrnamentSteinring");
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_08"); //在 那 附 近 找 找 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_09"); //你 要 留 意 那 些 古 老 的 建 筑 物 。 它 们 多 少 会 有 些 腐 化 ， 并 且 较 难 识 别 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_10"); //它 可 能 是 任 何 东 西 。 一 块 巨 大 的 岩 石 ， 一 个 石 头 环 ， 一 座 陵 墓 或 者 其 它 类 似 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Nefarius_SCbringOrnaments_05_11"); //但 是 ， 我 在 说 什 么 呢 ？ 你 会 找 到 它 。 祝 你 好 运 。
};

///////////////////////////////////////////////////////////////////////
//	Info WhyPortalClosed
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_WhyPortalClosed(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_WhyPortalClosed_Condition;
	information		= DIA_Addon_Nefarius_WhyPortalClosed_Info;
	description		= "那 个 饰 物 为 什 么 会 破 损 ？";
};

func int DIA_Addon_Nefarius_WhyPortalClosed_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Nefarius_SCbringOrnaments))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_WhyPortalClosed_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_WhyPortalClosed_15_00"); //那 个 饰 物 为 什 么 会 破 损 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_01"); //这 样 做 的 人 是 想 保 护 传 送 门 不 被 在 此 再 次 开 启 。
	AI_Output(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_02"); //我 盯 着 铭 文 的 时 间 越 长 ， 我 就 越 感 觉 到 远 古 文 明 的 牧 师 真 的 很 聪 明 。
	AI_Output(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_03"); //他 们 把 那 个 地 区 隐 藏 起 来 ， 一 定 有 非 常 正 当 的 理 由 。
	AI_Output(self, other, "DIA_Addon_Nefarius_WhyPortalClosed_05_04"); //我 们 不 知 道 是 什 么 在 那 里 等 着 我 们 。 但 是 它 肯 定 不 是 什 么 好 东 西 … …
};

///////////////////////////////////////////////////////////////////////
//	Info MissingOrnaments
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_MissingOrnaments(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_MissingOrnaments_Condition;
	information		= DIA_Addon_Nefarius_MissingOrnaments_Info;
	permanent		= TRUE;
	description		= "关 于 失 踪 的 饰 物 … …";
};

func int DIA_Addon_Nefarius_MissingOrnaments_Condition()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};

var int MissingOrnamentsCounter;
const int Addon_NefariussMissingOrnamentsOffer = 100; // Joly:Kohle für ein Ornament

func void DIA_Addon_Nefarius_MissingOrnaments_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_00"); //关 于 失 踪 的 饰 物 … …
	AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_01"); //（ 期 待 的 ） 是 吗 ？

	if (Npc_HasItems(other, ItMi_Ornament_Addon) >= 1)
	{
		var int MissingOrnamentsCount;
		var int XP_Addon_BringMissingOrnaments;
		var int MissingOrnamentsGeld;
		var string concatText;

		MissingOrnamentsCount = Npc_HasItems(other, ItMi_Ornament_Addon);

		if (MissingOrnamentsCount == 1)
		{
			AI_Output(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_02"); //给 。 我 还 有 一 个 。
			B_GivePlayerXP(XP_Addon_BringMissingOrnament);
			Npc_RemoveInvItems(other, ItMi_Ornament_Addon, 1);
			AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"
			MissingOrnamentsCounter = MissingOrnamentsCounter + 1;
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_03"); //我 找 到 了 他 们 。

			Npc_RemoveInvItems(other, ItMi_Ornament_Addon, MissingOrnamentsCount);
			concatText = ConcatStrings(IntToString(MissingOrnamentsCount), PRINT_ItemsGegeben); // "x Gegenstände gegeben"
			AI_PrintScreen(concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

			XP_Addon_BringMissingOrnaments = (MissingOrnamentsCount * XP_Addon_BringMissingOrnament);
			MissingOrnamentsCounter = (MissingOrnamentsCounter + MissingOrnamentsCount);

			B_GivePlayerXP(XP_Addon_BringMissingOrnaments);
		};

		AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_04"); //那 太 好 了 。

		if (MissingOrnamentsCounter == 1)
		{
			AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_05"); //现 在 只 差 两 个 还 没 找 到 。 没 准 你 也 能 找 到 它 们 。
		}
		else if (MissingOrnamentsCounter == 2)
		{
			AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_06"); //现 在 只 差 一 个 还 没 找 到 ， 那 时 我 们 就 能 把 它 们 组 合 起 来 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_07"); //现 在 我 已 经 找 到 了 所 有 的 部 分 ， 我 们 现 在 要 做 的 就 是 把 他 们 拼 在 一 起 。
			AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_08"); //我 们 将 使 用 我 们 的 组 合 能 力 把 饰 物 修 复 成 一 个 戒 指 。

			MIS_Addon_Nefarius_BringMissingOrnaments = LOG_SUCCESS;
		};

		AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_09"); //给 。 我 可 以 给 你 一 些 金 币 补 偿 你 费 的 心 血 。

		MissingOrnamentsGeld = (MissingOrnamentsCount * Addon_NefariussMissingOrnamentsOffer);

		CreateInvItems(self, ItMi_Gold, MissingOrnamentsGeld);
		B_GiveInvItems(self, other, ItMi_Gold, MissingOrnamentsGeld);

		if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_10"); //跟 我 来 ！
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "PreRingritual");
			B_StartotherRoutine(KDW_1400_Addon_Saturas_NW, "PreRingritual");
			B_StartotherRoutine(KDW_1401_Addon_Cronos_NW, "PreRingritual");
			B_StartotherRoutine(KDW_1403_Addon_Myxir_NW, "PreRingritual");
			B_StartotherRoutine(KDW_1404_Addon_Riordian_NW, "PreRingritual");
			B_StartotherRoutine(KDW_1405_Addon_Merdarion_NW, "PreRingritual");
		};
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Nefarius_MissingOrnaments_15_11"); //再 问 一 下 有 多 少 ？
		AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_12"); //总 共 有 四 个 … …
		AI_Output(self, other, "DIA_Addon_Nefarius_MissingOrnaments_05_13"); //你 应 该 能 在 我 标 记 在 地 图 上 的 位 置 找 到 其 它 的 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Ringritual
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Ringritual(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_Ringritual_Condition;
	information		= DIA_Addon_Nefarius_Ringritual_Info;
	important		= TRUE;
};

func int DIA_Addon_Nefarius_Ringritual_Condition()
{
	if ((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_SUCCESS)
	&& (Npc_GetDistToWP(self, "NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Ringritual_Info()
{
	AI_Output(self, other, "DIA_Addon_Nefarius_Ringritual_05_00"); //那 里 。 现 在 让 开 。
	Npc_SetRefuseTalk(self, 60);
	RitualRingRuns = LOG_RUNNING;
	B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_3);

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Ringritual");
	B_StartotherRoutine(KDW_1400_Addon_Saturas_NW, "Ringritual");
	B_StartotherRoutine(KDW_1401_Addon_Cronos_NW, "Ringritual");
	B_StartotherRoutine(KDW_1403_Addon_Myxir_NW, "Ringritual");
	B_StartotherRoutine(KDW_1404_Addon_Riordian_NW, "Ringritual");
	B_StartotherRoutine(KDW_1405_Addon_Merdarion_NW, "Ringritual");
};

///////////////////////////////////////////////////////////////////////
//	Info RingRitualEnds
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_RingRitualEnds(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_RingRitualEnds_Condition;
	information		= DIA_Addon_Nefarius_RingRitualEnds_Info;
	important		= TRUE;
};

func int DIA_Addon_Nefarius_RingRitualEnds_Condition()
{
	if ((Npc_RefuseTalk(self) == FALSE)
	&& (RitualRingRuns == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_RingRitualEnds_Info()
{
	AI_Output(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_00"); //饰 物 已 经 重 新 组 合 在 一 起 。
	AI_Output(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_01"); //既 然 你 帮 我 们 找 到 了 所 需 的 碎 片 ， 也 应 该 由 你 把 它 们 安 到 传 送 门 上 。
	AI_Output(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_02"); //去 找 萨 图 拉 斯 ， 让 他 把 重 新 组 合 好 的 戒 指 交 给 你 。
	AI_Output(self, other, "DIA_Addon_Nefarius_RingRitualEnds_05_03"); //如 果 希 望 实 现 的 话 ， 传 送 门 就 能 重 新 开 启 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
	B_StartotherRoutine(KDW_1400_Addon_Saturas_NW, "Start");
	B_StartotherRoutine(KDW_1401_Addon_Cronos_NW, "Start");
	B_StartotherRoutine(KDW_1403_Addon_Myxir_NW, "Start");
	B_StartotherRoutine(KDW_1404_Addon_Riordian_NW, "Start");
	B_StartotherRoutine(KDW_1405_Addon_Merdarion_NW, "Start");
	RitualRingRuns = LOG_SUCCESS;
	B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_4);
};

///////////////////////////////////////////////////////////////////////
//	Info OpenedPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_OpenedPortal(C_INFO)
{
	npc				= KDW_1402_Addon_Nefarius_NW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_OpenedPortal_Condition;
	information		= DIA_Addon_Nefarius_OpenedPortal_Info;
	description		= "现 在 该 怎 么 办 ？";
};

func int DIA_Addon_Nefarius_OpenedPortal_Condition()
{
	if (RitualRingRuns == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_OpenedPortal_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_OpenedPortal_15_00"); //现 在 该 怎 么 办 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_OpenedPortal_05_01"); //你 还 在 等 什 么 ？ 不 要 挡 我 的 路 。
};
