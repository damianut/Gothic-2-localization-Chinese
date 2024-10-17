///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_EXIT(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 999;
	condition		= DIA_Addon_Merdarion_EXIT_Condition;
	information		= DIA_Addon_Merdarion_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Merdarion_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Merdarion_NW_PICKPOCKET(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 900;
	condition		= DIA_Addon_Merdarion_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Merdarion_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre schwierig seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Merdarion_NW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Merdarion_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Merdarion_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Merdarion_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		B_GiveInvItems(self, other, ItSc_ArmyOfDarkness, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Merdarion_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Merdarion_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Merdarion_NW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Hallo(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_Hallo_Condition;
	information		= DIA_Addon_Merdarion_Hallo_Info;
	description		= "忙 吗 ？";
};

func int DIA_Addon_Merdarion_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Merdarion_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Hallo_15_00"); //忙 吗 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Hallo_06_01"); //这 些 地 下 室 对 我 来 说 是 一 个 大 秘 密 。 很 难 相 信 ， 这 之 前 没 有 其 它 任 何 人 曾 经 发 现 过 它 们 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Hallo_06_02"); //我 们 不 费 吹 灰 之 力 就 发 现 了 入 口 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Hallo_06_03"); //人 们 总 是 忙 于 他 们 的 日 常 工 作 ， 从 来 没 人 愿 意 靠 近 这 座 建 筑 来 看 个 究 竟 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Hallo_06_04"); //我 对 此 没 有 其 它 的 解 释 。
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Aufgabe(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_Aufgabe_Condition;
	information		= DIA_Addon_Merdarion_Aufgabe_Info;
	description		= "你 在 这 里 有 什 么 任 务 ？";
};

func int DIA_Addon_Merdarion_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Aufgabe_15_00"); //你 在 这 里 有 什 么 任 务 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Aufgabe_06_01"); //我 正 试 图 找 出 这 个 圆 形 传 送 门 通 向 哪 里 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Aufgabe_06_02"); //此 外 ， 我 还 帮 助 内 法 利 尔 斯 寻 找 失 踪 的 装 饰 物 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Aufgabe_06_03"); //这 个 传 送 门 一 定 通 向 岛 上 的 另 一 个 我 们 从 来 没 有 发 现 过 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Aufgabe_06_04"); //（ 考 虑 ） 我 记 不 起 来 以 前 曾 经 听 说 或 阅 读 过 那 些 … …

	Npc_ExchangeRoutine(self, "START");
	B_StartOtherRoutine(Cronos_NW, "START");

	if (Nefarius_NW.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_3);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DaDurch
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_DaDurch(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_DaDurch_Condition;
	information		= DIA_Addon_Merdarion_DaDurch_Info;
	description		= "你 真 的 要 穿 过 传 送 门 ？";
};

func int DIA_Addon_Merdarion_DaDurch_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_DaDurch_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_DaDurch_15_00"); //你 真 的 要 穿 过 传 送 门 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_DaDurch_06_01"); //当 然 。 假 设 我 们 找 到 失 踪 的 饰 物 ， 那 就 行 了 。
	AI_Output(self, other, "DIA_Addon_Merdarion_DaDurch_06_02"); //我 承 认 ， 那 是 有 点 冒 险 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Merdarion_DaDurch_06_03"); //但 是 我 们 必 须 查 明 我 们 针 对 这 些 不 断 的 地 震 还 能 做 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info Bedrohung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Bedrohung(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_Bedrohung_Condition;
	information		= DIA_Addon_Merdarion_Bedrohung_Info;
	description		= "关 于 地 震 你 都 了 解 什 么 ？";
};

func int DIA_Addon_Merdarion_Bedrohung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_DaDurch))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Bedrohung_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Bedrohung_15_00"); //关 于 地 震 你 都 了 解 什 么 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Bedrohung_06_01"); //它 们 是 另 一 边 的 某 些 东 西 引 起 的 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Bedrohung_06_02"); //这 个 源 头 可 能 也 造 成 了 这 些 石 头 哨 兵 的 苏 醒 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Bedrohung_06_03"); //但 那 不 是 我 的 工 作 。 萨 图 拉 斯 和 克 鲁 诺 斯 可 以 告 诉 你 更 多 相 关 的 事 情 。
};

///////////////////////////////////////////////////////////////////////
//	Info Wasdahinter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Wasdahinter2(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_Wasdahinter2_Condition;
	information		= DIA_Addon_Merdarion_Wasdahinter2_Info;
	description		= "你 认 为 你 能 在 那 里 找 到 什 么 ？";
};

func int DIA_Addon_Merdarion_Wasdahinter2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Wasdahinter2_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Wasdahinter2_15_00"); //你 认 为 你 能 在 那 里 找 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_01"); //我 真 的 无 法 确 定 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_02"); //我 这 样 猜 想 ， 在 另 一 边 ， 有 一 个 与 这 里 类 似 的 建 筑 。 与 这 个 传 送 石 相 对 应 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Wasdahinter2_06_03"); //其 它 的 一 切 只 能 等 我 们 到 了 那 边 才 能 看 到 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_PERM(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 99;
	condition		= DIA_Addon_Merdarion_PERM_Condition;
	information		= DIA_Addon_Merdarion_PERM_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 些 魔 法 吗 ？";
};

func int DIA_Addon_Merdarion_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Aufgabe))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_PERM_15_00"); //你 能 教 我 些 魔 法 吗 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_PERM_06_01"); //一 旦 我 们 到 了 那 边 ， 我 就 听 从 你 的 分 配 。
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_Teleportstein(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_Teleportstein_Condition;
	information		= DIA_Addon_Merdarion_Teleportstein_Info;
	description		= "返 回 城 市 最 快 的 方 法 是 什 么 ？";
};

func int DIA_Addon_Merdarion_Teleportstein_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Merdarion_Aufgabe))
	&& (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_Teleportstein_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_15_00"); //返 回 城 市 最 快 的 方 法 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_01"); //我 建 议 你 原 路 返 回 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_02"); //（ 考 虑 ） 但 是 你 也 可 以 … … 不 ， 那 样 太 危 险 了。
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_15_03"); //说 出 来 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_04"); //好 吧 。 这 些 房 子 的 建 造 者 们 有 他 们 自 己 的 旅 行 方 法 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_05"); //就 我 们 目 前 所 能 说 的 ， 他 们 可 以 传 送 。
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_15_06"); //那 没 什 么 特 别 的 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_07"); //我 们 在 克 霍 里 尼 斯 这 里 找 到 的 传 送 石 其 实 是 比 较 特 殊 的 一 种 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_08"); //看 来 似 乎 在 这 些 大 厅 里 的 传 送 石 可 以 通 向 港 口 城 市 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_06_09"); //然 而 ， 我 们 之 间 没 人 有 勇 气 去 尝 试 。

	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, "如 果 我 使 用 了 它 会 怎 么 样 ？", DIA_Addon_Merdarion_Teleportstein_ich);
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, "这 个 传 送 门 的 石 头 在 哪 里 ？", DIA_Addon_Merdarion_Teleportstein_wo);
};

func void DIA_Addon_Merdarion_Teleportstein_wo()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_wo_15_00"); //这 个 传 送 门 的 石 头 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_wo_06_01"); //在 地 下 室 里 有 一 个 房 间 ， 我 已 经 把 它 锁 住 了 。
	Info_AddChoice(DIA_Addon_Merdarion_Teleportstein, "给 我 钥 匙 。 我 要 看 一 下 这 个 东 西 。", DIA_Addon_Merdarion_Teleportstein_key);
};

func void DIA_Addon_Merdarion_Teleportstein_ich()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_ich_15_00"); //如 果 我 使 用 了 它 会 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_ich_06_01"); //不 知 道 。 我 们 对 于 它 所 知 甚 少 。 有 可 能 你 根 本 活 不 了 。
};

func void DIA_Addon_Merdarion_Teleportstein_key()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_00"); //给 我 钥 匙 。 我 要 看 一 下 这 个 东 西 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_01"); //（ 不 确 定 ） 真 的 ？ 但 是 我 不 对 此 负 责 。
	AI_Output(other, self, "DIA_Addon_Merdarion_Teleportstein_key_15_02"); //给 我 。
	AI_Output(self, other, "DIA_Addon_Merdarion_Teleportstein_key_06_03"); //如 果 你 这 么 说 的 话 ， 给 你 ！。
	CreateInvItems(self, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);
	B_GiveInvItems(self, other, ITKE_PORTALTEMPELWALKTHROUGH_ADDON, 1);

	SC_GotPORTALTEMPELWALKTHROUGHKey = TRUE;

	Log_CreateTopic(TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_TeleportsNW, TOPIC_Addon_TeleportsNW_1);

	Info_ClearChoices(DIA_Addon_Merdarion_Teleportstein);
};

///////////////////////////////////////////////////////////////////////
//	Info WHereOtherTeleports
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_WHereOtherTeleports(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_WHereOtherTeleports_Condition;
	information		= DIA_Addon_Merdarion_WHereOtherTeleports_Info;
	description		= "其 它 传 送 石 在 哪 里 ？";
};

func int DIA_Addon_Merdarion_WHereOtherTeleports_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Merdarion_Teleportstein))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_WHereOtherTeleports_Info()
{
	AI_Output(other, self, "DIA_Addon_Merdarion_WHereOtherTeleports_15_00"); //其 它 传 送 石 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_01"); //迄 今 为 止 ， 我 们 只 在 克 霍 里 尼 斯 中 部 找 到 一 个 。
	AI_Output(self, other, "DIA_Addon_Merdarion_WHereOtherTeleports_06_02"); //死 亡 女 妖 酒 馆 附 近 。
	B_LogEntry(TOPIC_Addon_TeleportsNW, TOPIC_Addon_TeleportsNW_2);
};

///////////////////////////////////////////////////////////////////////
//	Info TeleportsteinSuccess
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Merdarion_TeleportsteinSuccess(C_INFO)
{
	npc				= KDW_1405_Addon_Merdarion_NW;
	nr				= 5;
	condition		= DIA_Addon_Merdarion_TeleportsteinSuccess_Condition;
	information		= DIA_Addon_Merdarion_TeleportsteinSuccess_Info;
	description		= "传 送 石 看 起 来 运 转 正 常 。";
};

func int DIA_Addon_Merdarion_TeleportsteinSuccess_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Merdarion_Teleportstein))
	&& (SCUsed_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Merdarion_TeleportsteinSuccess_Info()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_00"); //传 送 石 看 起 来 运 转 正 常 。
	AI_Output(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_01"); //你 真 的 成 功 了 ？ 你 真 的 进 去 了 ？
	AI_Output(other, self, "DIA_Addon_Merdarion_TeleportsteinSuccess_15_02"); //是 的 。 它 们 显 然 仍 旧 能 运 转 。
	AI_Output(self, other, "DIA_Addon_Merdarion_TeleportsteinSuccess_06_03"); //（ 神 魂 颠 倒 ） 难 以 置 信 。 我 一 会 要 离 得 更 近 一 些 去 看 。
};
