///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_EXIT(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 999;
	condition		= DIA_Orlan_EXIT_Condition;
	information		= DIA_Orlan_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Orlan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Orlan_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wein
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Wein(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 3;
	condition		= DIA_Orlan_Wein_Condition;
	information		= DIA_Orlan_Wein_Info;
	description		= "我 从 修 道 院 拿 来 的 葡 萄 酒 。";
};

func int DIA_Orlan_Wein_Condition()
{
	if ((MIS_GoraxWein == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFo_Wine) >= 12))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Wein_Info()
{
	AI_Output(other, self, "DIA_Orlan_Wein_15_00"); //我 从 修 道 院 拿 来 的 葡 萄 酒 。
	AI_Output(self, other, "DIA_Orlan_Wein_05_01"); //好 极 了 。 那 是 我 一 直 在 等 的 。
	AI_Output(self, other, "DIA_Orlan_Wein_05_02"); //我 已 经 和 大 师 高 莱 克 斯 谈 好 价 格 了 。 我 会 立 刻 给 你100枚 金 币 。

	Info_ClearChoices(DIA_Orlan_Wein);

	Info_AddChoice(DIA_Orlan_Wein, "好 ， 那 给 我 钱 吧 。", DIA_Orlan_Wein_JA);
	Info_AddChoice(DIA_Orlan_Wein, "你 想 要 捣 鬼 吗 ？ 价 格 是 ２ ４ ０ 金 币 。 ", DIA_Orlan_Wein_NEIN);
};

func void DIA_Orlan_Wein_JA()
{
	AI_Output(other, self, "DIA_Orlan_Wein_JA_15_00"); //好 ， 那 给 我 钱 吧 。
	AI_Output(self, other, "DIA_Orlan_Wein_JA_05_01"); //给 你 。 和 你 做 生 意 非 常 愉 快。

	B_GiveInvItems(self, other, ItmI_Gold, 100);
	B_GiveInvItems(other, self, ItFo_Wine, 12);

	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_NEIN()
{
	AI_Output(other, self, "DIA_Orlan_Wein_NEIN_15_00"); //你 想 要 捣 鬼 吗 ？ 价 格 是 ２ ４ ０ 金 币 。
	AI_Output(self, other, "DIA_Orlan_Wein_NEIN_05_01"); //那 么 ， 高 莱 克 斯 警 告 过 你 ， 对 吗 ？ 好 吧 ， 也 许 我 们 两 个 能 谈 一 笔 交 易 。 看 - 我 会 给 你100枚 金 币 买 葡 萄 酒 。
	AI_Output(self, other, "DIA_Orlan_Wein_NEIN_05_02"); //你 告 诉 高 莱 克 斯 说 我 欺 骗 了 你 ， 然 后 你 可 以 从 我 这 里 得 到 四 个 魔 法 卷 轴 。

	Info_ClearChoices(DIA_Orlan_Wein);
	Info_AddChoice(DIA_Orlan_Wein, "嘿 ， 应 该 给 我 ２ ４ ０ 枚 金 币 。", DIA_Orlan_Wein_Nie);
	Info_AddChoice(DIA_Orlan_Wein, "好 的 ， 听 起 来 足 够 了 。 给 我 那 些 魔 法 卷 轴 。", DIA_Orlan_Wein_Okay);
	Info_AddChoice(DIA_Orlan_Wein, "那 些 是 什 么 种 类 的 魔 法 卷 轴 ？ ", DIA_Orlan_Wein_Was);
};

func void DIA_Orlan_Wein_Nie()
{
	AI_Output(other, self, "DIA_Orlan_Wein_Nie_15_00"); //嘿 ， 应 该 给 我 ２ ４ ０ 枚 金 币 。
	AI_Output(self, other, "DIA_Orlan_Wein_Nie_05_01"); //你 不 想 做 这 个 交 易 ， 嗯 ？ - 叹 息 - 好 吧 ， 给 你 金 币 。

	B_GiveInvItems(self, other, ItmI_Gold, 240);
	B_GiveInvItems(other, self, ItFo_Wine, 12);

	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Okay()
{
	var string Text;

	Text = ConcatStrings("4", PRINT_ItemsErhalten);
	PrintScreen(Text, -1, -1, FONT_ScreenSmall, 2);

	B_GiveInvItems(self, other, ItmI_Gold, 100);

	AI_Output(other, self, "DIA_Orlan_Wein_Okay_15_00"); //好 的 ， 听 起 来 足 够 了 。 给 我 那 些 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Orlan_Wein_Okay_05_01"); //这 是 魔 法 卷 轴 和 金 币 。

	B_GiveInvItems(other, self, ItFo_Wine, 12);

	CreateInvItems(hero, ITSC_Light, 2);
	CreateInvItems(hero, ItSc_LightHeal, 1);
	CreateInvItems(hero, ItSc_SumGobSkel, 1);

	Info_ClearChoices(DIA_Orlan_Wein);
};

func void DIA_Orlan_Wein_Was()
{
	AI_Output(other, self, "DIA_Orlan_Wein_Was_15_00"); //那 些 是 什 么 种 类 的 魔 法 卷 轴 ？
	AI_Output(self, other, "DIA_Orlan_Wein_Was_05_01"); //不 知 道 - 我 不 知 道 任 何 关 于 那 些 东 西 的 事 。 它 们 是 一 个 客 人 … … 呃 … … 落 在 这 里 的 ， 对 。
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WERBISTDU(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 2;
	condition		= DIA_Orlan_WERBISTDU_Condition;
	information		= DIA_Orlan_WERBISTDU_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Orlan_WERBISTDU_Condition()
{
	return TRUE;
};

func void DIA_Orlan_WERBISTDU_Info()
{
	AI_Output(other, self, "DIA_Orlan_WERBISTDU_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Orlan_WERBISTDU_05_01"); //我 是 奥 兰 ， 这 座 朴 素 的 旅 馆 的 管 理 人 。
	AI_Output(self, other, "DIA_Orlan_WERBISTDU_05_02"); //你 在 找 什 么 ， 陌 生 人 ？ 也 许 一 把 象 样 的 长 剑 ， 或 者 是 一 套 坚 固 的 盔 甲 ？。
	AI_Output(self, other, "DIA_Orlan_WERBISTDU_05_03"); //来 自 乡 村 蒸 馏 器 的 好 酒 ， 或 者 是 一 些 消 息 ？。
	AI_Output(self, other, "DIA_Orlan_WERBISTDU_05_04"); //我 可 以 给 你 所 有 那 些 ， 甚 至 更 多 ， 如 果 你 的 钱 足 够 的 话 。
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Greg(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 5;
	condition		= DIA_Addon_Orlan_Greg_Condition;
	information		= DIA_Addon_Orlan_Greg_Info;
	description		= "你 知 道 那 个 戴 着 眼 罩 的 家 伙 吗 ？";
};

func int DIA_Addon_Orlan_Greg_Condition()
{
	if ((SC_SawGregInTaverne == TRUE)
	&& (Kapitel <= 3)
	&& (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Greg_Info()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Greg_15_00"); //你 知 道 那 个 戴 着 眼 罩 的 家 伙 吗 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Greg_05_01"); //我 以 前 在 这 里 见 过 他 。 一 个 非 常 讨 厌 的 家 伙 。
	AI_Output(self, other, "DIA_Addon_Orlan_Greg_05_02"); //那 时 ， 他 进 了 楼 上 的 一 个 房 间 ， 带 着 一 个 巨 大 的 箱 子 。
	AI_Output(self, other, "DIA_Addon_Orlan_Greg_05_03"); //一 定 要 不 断 提 醒 他 交 房 租 。 即 使 那 个 时 候 ， 他 还 是 那 么 洋 洋 自 得 。
	AI_Output(self, other, "DIA_Addon_Orlan_Greg_05_04"); //然 后 ， 有 一 天 ， 他 就 那 样 消 失 了 - 带 着 箱 子 一 起 。 无 论 怎 样 我 都 不 想 忍 受 他 那 样 的 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Ranger(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 2;
	condition		= DIA_Addon_Orlan_Ranger_Condition;
	information		= DIA_Addon_Orlan_Ranger_Info;
	description		= "是 我 多 疑 ， 还 是 说 你 正 在 盯 着 我 的 戒 指 ？";
};

func int DIA_Addon_Orlan_Ranger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (SCIsWearingRangerRing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Ranger_Info()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Ranger_15_00"); //是 我 多 疑 ， 还 是 说 你 正 在 盯 着 我 的 戒 指 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Ranger_05_01"); //我 不 太 清 楚 怎 么 解 释 那 些 。

	Orlan_KnowsSCAsRanger = TRUE;

	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	Info_AddChoice(DIA_Addon_Orlan_Ranger, "老 兄 ！ 我 属 于 ‘ 水 之 环 ’ ！", DIA_Addon_Orlan_Ranger_Idiot);
	Info_AddChoice(DIA_Addon_Orlan_Ranger, "那 是 一 块 蓝 宝 石 。 以 前 见 过 吗 ？", DIA_Addon_Orlan_Ranger_Aqua);
};

func void DIA_Addon_Orlan_Ranger_Aqua()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Ranger_Aqua_15_00"); //那 是 一 块 蓝 宝 石 。 以 前 见 过 吗 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_01"); //是 的 ， 我 有 。 欢 迎 来 到 司 令 部 ， 环 之 兄 弟 。
	if (Npc_KnowsInfo(other, DIA_Addon_Orlan_NoMeeting)) // verrissen
	{
		AI_Output(self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_02"); //… … 即 使 你 看 起 来 不 是 最 聪 明 的 。
	};

	AI_Output(self, other, "DIA_Addon_Orlan_Ranger_Aqua_05_03"); //我 能 为 你 做 些 什 么 ？
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Orlan_Ranger_Idiot()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Ranger_Lares_15_00"); //老 兄 ！ 我 属 于 ‘ 水 之 环 ’ ！
	AI_Output(self, other, "DIA_Addon_Orlan_Ranger_Lares_05_01"); //你 知 道 吗 ？ 真 难 相 信 他 们 会 选 那 样 一 个 白 痴 。
	AI_Output(self, other, "DIA_Addon_Orlan_Ranger_Lares_05_02"); //你 想 要 什 么 ？
	Info_ClearChoices(DIA_Addon_Orlan_Ranger);
};

///////////////////////////////////////////////////////////////////////
//	Info Teleportstein
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_Teleportstein(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 2;
	condition		= DIA_Addon_Orlan_Teleportstein_Condition;
	information		= DIA_Addon_Orlan_Teleportstein_Info;
	description		= "你 曾 经 使 用 过 传 送 石 吗 ？";
};

func int DIA_Addon_Orlan_Teleportstein_Condition()
{
	if ((Orlan_KnowsSCAsRanger == TRUE)
	&& (SCUsed_TELEPORTER == TRUE)) // SC hat schon mal einen Teleporter benutzt
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_Teleportstein_Info()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Teleportstein_15_00"); //你 曾 经 使 用 过 传 送 石 吗 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Teleportstein_05_01"); //你 疯 了 吗 ？ 只 要 没 有 任 何 水 法 师 向 我 保 证 没 有 危 险 ， 我 绝 对 不 会 去 任 何 靠 近 那 些 东 西 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Orlan_Teleportstein_05_02"); //他 们 命 令 我 把 那 块 传 送 石 藏 起 起 来 ， 除 此 之 外 ， 我 一 直 不 接 触 他 们 。

	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Orlan_Teleportstein);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein, "我 能 看 一 下 这 块 传 送 石 吗 ？", DIA_Addon_Orlan_Teleportstein_sehen);
	Info_AddChoice(DIA_Addon_Orlan_Teleportstein, "传 送 石 在 哪 里?", DIA_Addon_Orlan_Teleportstein_wo);
};

func void DIA_Addon_Orlan_Teleportstein_sehen()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Teleportstein_sehen_15_00"); //我 能 看 一 下 这 块 传 送 石 吗 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Teleportstein_sehen_05_01"); //我 不 在 乎 。 这 是 钥 匙 。 我 已 经 封 锁 了 入 口 。
	CreateInvItems(self, ITKE_ORLAN_TELEPORTSTATION, 1);
	B_GiveInvItems(self, other, ITKE_ORLAN_TELEPORTSTATION, 1);

	Log_CreateTopic(TOPIC_Addon_TeleportsNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_TeleportsNW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_TeleportsNW, TOPIC_Addon_TeleportsNW_7);
};

func void DIA_Addon_Orlan_Teleportstein_wo()
{
	AI_Output(other, self, "DIA_Addon_Orlan_Teleportstein_wo_15_00"); //这 个 传 送 门 的 石 头 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Orlan_Teleportstein_wo_05_01"); //在 南 边 有 个 山 洞 ， 离 我 的 酒 馆 不 远 。 那 是 水 法 师 发 现 那 些 东 西 的 地 方 。
};

///////////////////////////////////////////////////////////////////////
//	Info Meeting OHNE RING
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_NoMeeting(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 2;
	condition		= DIA_Addon_Orlan_NoMeeting_Condition;
	information		= DIA_Addon_Orlan_NoMeeting_Info;
	description		= "我 是 来 这 里 加 入 水 之 环 的 ！";
};

func int DIA_Addon_Orlan_NoMeeting_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (!Npc_KnowsInfo(other, DIA_Addon_Orlan_Ranger))
	&& (SCIsWearingRangerRing == FALSE)
	&& (MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_NoMeeting_Info()
{
	AI_Output(other, self, "DIA_Addon_Orlan_NoMeeting_15_00"); //我 是 来 这 里 加 入 水 之 环 的 ！
	AI_Output(self, other, "DIA_Addon_Orlan_NoMeeting_05_01"); //（ 敷 衍 了 事 ） 我 看 不 到 你 的 戒 指 。 我 能 请 你 喝 一 杯 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info WhenRangerMeeting
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Orlan_WhenRangerMeeting(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 5;
	condition		= DIA_Addon_Orlan_WhenRangerMeeting_Condition;
	information		= DIA_Addon_Orlan_WhenRangerMeeting_Info;
	description		= "我 听 说 ‘ 环 ’ 要 在 你 的 酒 馆 里 聚 会 。";
};

func int DIA_Addon_Orlan_WhenRangerMeeting_Condition()
{
	if ((MIS_Addon_Lares_ComeToRangerMeeting == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Orlan_Ranger)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Info()
{
	AI_Output(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_15_00"); //我 听 说 ‘ 环 ’ 要 在 你 的 酒 馆 里 聚 会 。
	AI_Output(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_01"); //很 正 确 。 刚 才 就 应 该 开 始 了 。
	AI_Output(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_05_02"); //我 想 知 道 是 什 么 拖 延 了 他 们 这 么 久 ？

	B_GivePlayerXP(XP_Ambient);
	B_Addon_Orlan_RangersReadyForcoming();
	self.flags = 0;

	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, "他 们 很 早 就 该 到 这 里 了 。", DIA_Addon_Orlan_WhenRangerMeeting_theyCome);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, "他 们 今 天 聚 会 ？", DIA_Addon_Orlan_WhenRangerMeeting_Today);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Today()
{
	AI_Output(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00"); //他 们 今 天 聚 会 ？
	AI_Output(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01"); //是 的 ， 至 少 那 是 我 似 乎 能 回 想 起 的 事 。
	AI_Output(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02"); //我 希 望 不 要 再 这 么 晚 了 。
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, "（ 更 多 ）", DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_theyCome()
{
	AI_Output(other, self, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00"); //他 们 很 早 就 该 到 这 里 了 。
	AI_Output(self, other, "DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01"); //到 时 候 就 知 道 了 。
	B_MakeRangerReadyForMeetingALL();
	Info_ClearChoices(DIA_Addon_Orlan_WhenRangerMeeting);
	Info_AddChoice(DIA_Addon_Orlan_WhenRangerMeeting, "（ 更 多 ）", DIA_Addon_Orlan_WhenRangerMeeting_Los);
};

func void DIA_Addon_Orlan_WhenRangerMeeting_Los()
{
	AI_StopProcessInfos(self);
	B_Addon_Orlan_ComingRanger();
};

// -----------------------------------------------------
// BESSERE RÜSTUNG
// -----------------------------------------------------
instance DIA_Orlan_RUESTUNG(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 5;
	condition		= DIA_Orlan_RUESTUNG_Condition;
	information		= DIA_Orlan_RUESTUNG_Info;
	permanent		= TRUE;
	description		= "你 能 给 我 什 么 样 的 盔 甲 ？";
};

var int DIA_Orlan_RUESTUNG_noPerm;

func int DIA_Orlan_RUESTUNG_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (DIA_Orlan_RUESTUNG_noPerm == FALSE)
	&& (hero.guild == GIL_NONE)
	)
	{
		return TRUE;
	};
};

func void DIA_Orlan_RUESTUNG_Info()
{
	AI_Output(other, self, "DIA_Orlan_RUESTUNG_15_00"); //你 能 给 我 什 么 样 的 盔 甲 ？
	AI_Output(self, other, "DIA_Orlan_RUESTUNG_05_01"); //我 这 里 有 非 常 棒 的 东 西 ， 一 定 让 你 的 满 意 的 。

	Info_ClearChoices(DIA_Orlan_RUESTUNG);

	Info_AddChoice(DIA_Orlan_RUESTUNG, DIALOG_BACK, DIA_Orlan_RUESTUNG_BACK);
	Info_AddChoice(DIA_Orlan_RUESTUNG, "皮 甲 。 防 护 ： 武 器 ２ ５ ， 箭 ２ ０ ， 火 防 护 ５ （ ２ ５ ０ 金 币 ）", DIA_Orlan_RUESTUNG_Buy);
};

func void DIA_Orlan_RUESTUNG_Buy()
{
	AI_Output(other, self, "DIA_Orlan_RUESTUNG_Buy_15_00"); //我 想 买 皮 甲 。

	if (B_GiveInvItems(other, self, ItMi_Gold, VALUE_ITAR_Leather_L))
	{
		AI_Output(self, other, "DIA_Orlan_RUESTUNG_Buy_05_01"); //明 智 的 决 定 。

		CreateInvItems(self, ItAr_Leather_L, 1);
		B_GiveInvItems(self, other, ItAr_Leather_L, 1);
		AI_EquipBestArmor(other);
		DIA_Orlan_RUESTUNG_noPerm = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_RUESTUNG_Buy_05_02"); //抱 歉 ， 只 有 当 你 有 足 够 的 资 金 时 ， 我 们 才 能 交 易 。
	};

	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

func void DIA_Orlan_RUESTUNG_BACK()
{
	AI_Output(other, self, "DIA_Orlan_RUESTUNG_BACK_15_00"); //我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Orlan_RUESTUNG_BACK_05_01"); //随 便 你 。 但 是 不 要 等 太 久 。

	Info_ClearChoices(DIA_Orlan_RUESTUNG);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_TRADE(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 70;
	condition		= DIA_Orlan_TRADE_Condition;
	information		= DIA_Orlan_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Orlan_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_TRADE_Info()
{
	AI_Output(other, self, "DIA_Orlan_TRADE_15_00"); //让 我 看 看 你 的 货 物 。
	B_GiveTradeInv(self);

	// ADDON>
	if ((SC_IsRanger == TRUE) || (Orlan_KnowsSCAsRanger == TRUE) || (SCIsWearingRangerRing == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Orlan_TRADE_05_00"); //当 然 ， 环 之 兄 弟 。
		Orlan_KnowsSCAsRanger = TRUE;
	}
	// ADDON<
	else if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Orlan_TRADE_05_01"); //当 然 。 接 待 这 样 重 要 的 客 人 是 我 的 荣 幸 。
	}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self, other, "DIA_Orlan_TRADE_05_02"); //当 然 ， 先 生 。
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_TRADE_05_03"); //如 果 你 能 付 钱 的 话 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HotelZimmer
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_HotelZimmer(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 6;
	condition		= DIA_Orlan_HotelZimmer_Condition;
	information		= DIA_Orlan_HotelZimmer_Info;
	permanent		= TRUE;
	description		= "一 个 房 间 你 要 价 多 少 ？";
};

var int Orlan_SCGotHotelZimmer;
var int Orlan_SCGotHotelZimmerDay;
func int DIA_Orlan_HotelZimmer_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	&& (Orlan_SCGotHotelZimmer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_HotelZimmer_Info()
{
	AI_Output(other, self, "DIA_Orlan_HotelZimmer_15_00"); //一 个 房 间 你 要 价 多 少 ？

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
	{
		// ADDON>
		if ((SC_IsRanger == TRUE) || (SCIsWearingRangerRing == TRUE) || (Orlan_KnowsSCAsRanger == TRUE))
		{
			AI_Output(self, other, "DIA_Addon_Orlan_HotelZimmer_05_00"); //对 于 ‘ 环 ’ 的 兄 弟 ？ 没 有 。
			Orlan_RangerHelpZimmer = TRUE;
			Orlan_KnowsSCAsRanger = TRUE;
		}
		// ADDON<
		else if (hero.guild == GIL_PAL)
		{
			AI_Output(self, other, "DIA_Orlan_HotelZimmer_05_01"); //对 于 国 王 的 骑 士 ， 我 总 是 有 可 用 的 房 间 。 当 然 免 费 。
		}
		else
		{
			AI_Output(self, other, "DIA_Orlan_HotelZimmer_05_02"); //我 永 远 也 不 敢 向 英 诺 斯 在 世 间 的 代 表 收 服 务 费 。
		};

		AI_Output(self, other, "DIA_Orlan_HotelZimmer_05_03"); //这 是 楼 上 房 间 的 钥 匙 。 你 随 便 挑 房 间 。
		CreateInvItems(self, ITKE_ORLAN_HOTELZIMMER, 1);
		B_GiveInvItems(self, other, ITKE_ORLAN_HOTELZIMMER, 1);
		Orlan_SCGotHotelZimmer = TRUE;
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_HotelZimmer_05_04"); //一 周 给 我50枚 金 币 ， 你 可 以 挑 选 一 个 房 间 。

		Info_ClearChoices(DIA_Orlan_HotelZimmer);
		Info_AddChoice(DIA_Orlan_HotelZimmer, "太 贵 了 。", DIA_Orlan_HotelZimmer_nein);
		Info_AddChoice(DIA_Orlan_HotelZimmer, "好 吧 。 给 你 钱 。", DIA_Orlan_HotelZimmer_ja);
	};
};

func void DIA_Orlan_HotelZimmer_ja()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(other, self, "DIA_Orlan_HotelZimmer_ja_15_00"); //好 吧 。 给 你 钱 。
		AI_Output(self, other, "DIA_Orlan_HotelZimmer_ja_05_01"); //这 是 钥 匙 。 房 间 在 楼 上 。 但 是 不 要 把 东 西 都 弄 脏 ， 而 且 要 及 时 付 房 租 ， 明 白 吗 ？
		CreateInvItems(self, ITKE_ORLAN_HOTELZIMMER, 1);
		B_GiveInvItems(self, other, ITKE_ORLAN_HOTELZIMMER, 1);
		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Orlan_SCGotHotelZimmer = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_HotelZimmer_ja_05_02"); //你 没 有50块 。 先 钱 ， 然 后 才 是 娱 乐 。
	};

	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

func void DIA_Orlan_HotelZimmer_nein()
{
	AI_Output(other, self, "DIA_Orlan_HotelZimmer_nein_15_00"); //太 贵 了 。
	AI_Output(self, other, "DIA_Orlan_HotelZimmer_nein_05_01"); //那 你 只 能 去 别 的 地 方 看 看 了 ， 我 的 朋 友 。
	Info_ClearChoices(DIA_Orlan_HotelZimmer);
};

///////////////////////////////////////////////////////////////////////
//	Info MieteFaellig
///////////////////////////////////////////////////////////////////////

var int Orlan_AngriffWegenMiete;
////////////////////////////////
instance DIA_Orlan_MieteFaellig(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 10;
	condition		= DIA_Orlan_MieteFaellig_Condition;
	information		= DIA_Orlan_MieteFaellig_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Orlan_MieteFaellig_NoMore;
func int DIA_Orlan_MieteFaellig_Condition()
{
	// ADDON>
	if ((SC_IsRanger == TRUE) || (Orlan_RangerHelpZimmer == TRUE))
	{
		return FALSE;
	};

	// ADDON<

	// GEFRUDEL wegen kein Labern nach Kampf!

	if ((Orlan_AngriffWegenMiete == TRUE)
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		// ------ keine Miete, wenn Kampf verloren ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			return FALSE;
		};

		// ------ wenn gewonnen, Gold genommen --> Miete in 7 Tagen ------
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			Orlan_SCGotHotelZimmerDay = Wld_GetDay();
			Orlan_AngriffWegenMiete = FALSE;
			return FALSE;
		};
	};

	// CONDITION

	if ((Orlan_SCGotHotelZimmer == TRUE)
	&& (Orlan_SCGotHotelZimmerDay <= (Wld_GetDay() - 7))
	&& (DIA_Orlan_MieteFaellig_NoMore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Orlan_MieteFaellig_Info()
{
	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Orlan_MieteFaellig_05_00"); //（ 谄 媚 的 ） 高 贵 的 您 造 访 令 我 快 乐 万 分 。 您 想 待 多 久 就 待 多 久 。 这 是 一 种 荣 幸 。
		DIA_Orlan_MieteFaellig_NoMore = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_MieteFaellig_05_01"); //我 什 么 时 候 才 能 拿 到 我 的 租 金 ？

		Info_ClearChoices(DIA_Orlan_MieteFaellig);
		Info_AddChoice(DIA_Orlan_MieteFaellig, "绝 对 不 行 。 我 不 会 再 多 付 了 。", DIA_Orlan_MieteFaellig_nein);
		Info_AddChoice(DIA_Orlan_MieteFaellig, "给 你 ５ ０ 金 币 。", DIA_Orlan_MieteFaellig_ja);
	};
};

var int DIA_Orlan_MieteFaellig_OneTime;
func void DIA_Orlan_MieteFaellig_ja()
{
	AI_Output(other, self, "DIA_Orlan_MieteFaellig_ja_15_00"); //给 你 ５ ０ 金 币 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Orlan_MieteFaellig_ja_05_01"); //嗯 ， 时 间 到 了 。

		if (DIA_Orlan_MieteFaellig_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Orlan_MieteFaellig_ja_05_02"); //你 整 天 都 在 哪 里 闲 逛 ？
			AI_Output(other, self, "DIA_Orlan_MieteFaellig_ja_15_03"); //你 一 定 不 想 知 道 的 。
			AI_Output(self, other, "DIA_Orlan_MieteFaellig_ja_05_04"); //嗯 。 好 吧 ， 毕 竟 和 我 无 关 。
			DIA_Orlan_MieteFaellig_OneTime = TRUE;
		};

		Orlan_SCGotHotelZimmerDay = Wld_GetDay();
		Info_ClearChoices(DIA_Orlan_MieteFaellig);
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_MieteFaellig_ja_05_05"); //说 吧 ， 你 想 骗 我 吗 ？ 你 根 本 连 吃 饭 的 钱 都 没 有 。 我 会 教 训 你 的 ， 你 … …
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	};
};

func void DIA_Orlan_MieteFaellig_nein()
{
	AI_Output(other, self, "DIA_Orlan_MieteFaellig_nein_15_00"); //绝 对 不 行 。 我 不 会 再 多 付 了 。
	AI_Output(self, other, "DIA_Orlan_MieteFaellig_nein_05_01"); //嗯 ， 我 要 教 训 你 ， 你 这 可 悲 的 骗 子 。
	Orlan_AngriffWegenMiete = TRUE;

	Info_ClearChoices(DIA_Orlan_MieteFaellig);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfLaeuft
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_WETTKAMPFLAEUFT(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 7;
	condition		= DIA_Orlan_WETTKAMPFLAEUFT_Condition;
	information		= DIA_Orlan_WETTKAMPFLAEUFT_Info;
	important		= TRUE;
};

func int DIA_Orlan_WETTKAMPFLAEUFT_Condition()
{
	if (
	(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
	&& (MIS_Rukhar_Wettkampf_Day <= (Wld_GetDay() - 2))
	)
	{
		return TRUE;
	};
};

func void DIA_Orlan_WETTKAMPFLAEUFT_Info()
{
	AI_Output(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_00"); //你 终 于 来 了 。 我 一 直 在 等 你 。
	AI_Output(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_01"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_02"); //饮 酒 比 赛 终 于 结 束 了 。
	AI_Output(other, self, "DIA_Orlan_WETTKAMPFLAEUFT_15_03"); //谁 赢 了 ？

	if (
	((Mob_HasItems("CHEST_RUKHAR", ItFo_Booze)) == FALSE)
	&& ((Mob_HasItems("CHEST_RUKHAR", ItFo_Water)) == TRUE)
	)
	{
		AI_Output(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_04"); //这 次 伦 道 夫 赢 了 。 鲁 克 哈 一 定 会 经 历 难 受 的 一 天 。
	}
	else
	{
		AI_Output(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_05"); //鲁 克 哈 又 一 次 把 伦 道 夫 灌 得 烂 醉 如 泥 。 只 是 早 就 知 道 的 结 果 。
		Rukhar_Won_Wettkampf = TRUE;
	};

	if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Orlan_WETTKAMPFLAEUFT_05_06"); //那 么 ， 嗯 ， 我 希 望 那 是 最 后 一 次 。 我 不 想 我 的 房 子 里 再 出 现 那 种 骚 乱 ， 记 住 。
	};

	B_GivePlayerXP(XP_Rukhar_WettkampfVorbei);

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "Start");
	B_StartotherRoutine(Randolph, "Start");

	if (Hlp_IsValidNpc(Rukhar))
	{
		if (Rukhar_Won_Wettkampf == TRUE)
		{
			B_StartotherRoutine(Rukhar, "WettkampfRukharWon");
		}
		else
		{
			B_StartotherRoutine(Rukhar, "WettkampfRukharLost");
		};
	};

	MIS_Rukhar_Wettkampf = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Eingebrockt
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_EINGEBROCKT(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 8;
	condition		= DIA_Orlan_EINGEBROCKT_Condition;
	information		= DIA_Orlan_EINGEBROCKT_Info;
	important		= TRUE;
};

func int DIA_Orlan_EINGEBROCKT_Condition()
{
	if (
	(DIA_Randolph_ICHGEBEDIRGELD_noPerm == TRUE)
	&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
	)
	{
		return TRUE;
	};
};

func void DIA_Orlan_EINGEBROCKT_Info()
{
	AI_Output(self, other, "DIA_Orlan_EINGEBROCKT_05_00"); //你 让 我 卷 入 了 一 场 混 乱 。 现 在 我 可 以 再 次 监 视 鲁 克 哈 了 。
	AI_Output(other, self, "DIA_Orlan_EINGEBROCKT_15_01"); //为 什 么 ？
	AI_Output(self, other, "DIA_Orlan_EINGEBROCKT_05_02"); //只 要 他 还 在 那 里 举 行 他 的 小 比 赛 ， 如 果 没 有 外 来 者 识 破 它 最 好 。 那 对 生 意 不 好 ， 你 明 白 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Orlan_Perm(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 99;
	condition		= DIA_Orlan_Perm_Condition;
	information		= DIA_Orlan_Perm_Info;
	permanent		= TRUE;
	description		= "你 的 酒 馆 最 近 怎 么 样 ？";
};

func int DIA_Orlan_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Perm_Info()
{
	AI_Output(other, self, "DIA_Orlan_Perm_15_00"); //你 的 酒 馆 最 近 怎 么 样 ？

	if (Kapitel <= 2)
	{
		AI_Output(self, other, "DIA_Orlan_Perm_05_01"); //时 机 好 转 了 ， 你 知 道 吗 ？
		AI_Output(self, other, "DIA_Orlan_Perm_05_02"); //人 们 的 钱 不 像 以 前 那 样 好 赚 了 。
	}
	else if (Kapitel >= 3)
	{
		AI_Output(self, other, "DIA_Orlan_Perm_05_03"); //希 望 那 些 黑 魔 法 师 快 点 走 ， 否 则 我 只 能 关 闭 酒 馆 。
		AI_Output(self, other, "DIA_Orlan_Perm_05_04"); //几 乎 没 人 敢 再 到 这 里 来 。
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
instance DIA_Orlan_Minenanteil(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 3;
	condition		= DIA_Orlan_Minenanteil_Condition;
	information		= DIA_Orlan_Minenanteil_Info;
	description		= "你 在 出 售 矿 井 股 票 ？";
};

func int DIA_Orlan_Minenanteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Orlan_WERBISTDU)))
	{
		return TRUE;
	};
};

func void DIA_Orlan_Minenanteil_Info()
{
	AI_Output(other, self, "DIA_Orlan_Minenanteil_15_00"); //你 在 出 售 矿 井 股 票 ？
	AI_Output(self, other, "DIA_Orlan_Minenanteil_05_01"); //当 然 。 你 可 以 从 我 这 里 得 到 任 何 东 西 ， 只 要 价 格 合 适 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Orlan_PICKPOCKET(C_INFO)
{
	npc				= BAU_970_Orlan;
	nr				= 900;
	condition		= DIA_Orlan_PICKPOCKET_Condition;
	information		= DIA_Orlan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Orlan_PICKPOCKET_Condition()
{
	C_Beklauen(89, 260);
};

func void DIA_Orlan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
	Info_AddChoice(DIA_Orlan_PICKPOCKET, DIALOG_BACK, DIA_Orlan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Orlan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Orlan_PICKPOCKET_DoIt);
};

func void DIA_Orlan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};

func void DIA_Orlan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Orlan_PICKPOCKET);
};
