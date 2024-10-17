///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_EXIT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 999;
	condition		= DIA_Bengar_EXIT_Condition;
	information		= DIA_Bengar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bengar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_HALLO(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 3;
	condition		= DIA_Bengar_HALLO_Condition;
	information		= DIA_Bengar_HALLO_Info;
	description		= "你 是 这 里 的 农 民 ？";
};

func int DIA_Bengar_HALLO_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_HALLO_Info()
{
	AI_Output(other, self, "DIA_Bengar_HALLO_15_00"); //你 是 这 里 的 农 民 ？
	AI_Output(self, other, "DIA_Bengar_HALLO_10_01"); //你 可 以 那 么 说 ， 但 是 我 真 的 只 是 一 个 租 户 。
	AI_Output(self, other, "DIA_Bengar_HALLO_10_02"); //这 里 所 有 的 土 地 都 属 于 一 个 大 农 场 主。
};

///////////////////////////////////////////////////////////////////////
//	Info wovonlebtihr
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_WOVONLEBTIHR(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 5;
	condition		= DIA_Bengar_WOVONLEBTIHR_Condition;
	information		= DIA_Bengar_WOVONLEBTIHR_Info;
	description		= "你 怎 么 谋 生 ？";
};

func int DIA_Bengar_WOVONLEBTIHR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_WOVONLEBTIHR_Info()
{
	AI_Output(other, self, "DIA_Bengar_WOVONLEBTIHR_15_00"); //你 怎 么 谋 生 ？
	AI_Output(self, other, "DIA_Bengar_WOVONLEBTIHR_10_01"); //主 要 是 狩 猎 和 伐 木 。 当 然 ， 我 们 也 养 羊 和 在 地 里 干 活 。
	AI_Output(self, other, "DIA_Bengar_WOVONLEBTIHR_10_02"); //欧 纳 尔 把 所 有 这 些 劳 工 交 给 我 ， 我 必 须 想 办 法 让 他 们 不 停 地 忙 。 他 们 只 有 很 少 人 是 好 猎 手 ， 你 明 白 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info tageloehner
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_TAGELOEHNER(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 6;
	condition		= DIA_Bengar_TAGELOEHNER_Condition;
	information		= DIA_Bengar_TAGELOEHNER_Info;
	description		= "你 在 雇 佣 临 时 工 吗 ？";
};

func int DIA_Bengar_TAGELOEHNER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_TAGELOEHNER_Info()
{
	AI_Output(other, self, "DIA_Bengar_TAGELOEHNER_15_00"); //你 在 雇 佣 临 时 工 吗 ？
	AI_Output(self, other, "DIA_Bengar_TAGELOEHNER_10_01"); //欧 纳 尔 把 他 农 场 里 用 不 了 的 工 人 都 送 走 。
	AI_Output(self, other, "DIA_Bengar_TAGELOEHNER_10_02"); //然 后 他 把 他 们 送 给 了 我 。 我 养 活 他 们 ， 他 们 在 这 里 为 我 工 作 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_MissingPeople(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 5;
	condition		= DIA_Addon_Bengar_MissingPeople_Condition;
	information		= DIA_Addon_Bengar_MissingPeople_Info;
	description		= "这 里 最 近 发 生 了 什 么 奇 怪 的 事 情 吗 ？";
};

func int DIA_Addon_Bengar_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_15_00"); //这 里 最 近 发 生 了 什 么 奇 怪 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_10_01"); //这 些 日 子 里 发 生 了 很 多 奇 怪 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_10_02"); //但 是 没 有 什 么 比 帕 多 斯 的 神 秘 失 踪 更 奇 怪 了 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_10_03"); //他 是 我 的 一 个 农 田 工 人 ， 当 然 不 是 那 种 会 放 下 一 切 事 情 在 夜 里 偷 偷 溜 走 的 人 ， 你 知 道 的 。?

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_3);

	MIS_Bengar_BringMissPeopleBack = LOG_RUNNING;
	B_GivePlayerXP(XP_Ambient);

	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, DIALOG_BACK, DIA_Addon_Bengar_MissingPeople_back);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, "有 什 么 线 索 吗 ？", DIA_Addon_Bengar_MissingPeople_Hint);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, "也 许 他 只 是 刚 刚 吃 饱 。", DIA_Addon_Bengar_MissingPeople_voll);
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, "他 的 失 踪 有 什 么 特 别 奇 怪 的 地 方 吗 ？", DIA_Addon_Bengar_MissingPeople_was);
};

func void DIA_Addon_Bengar_MissingPeople_was()
{
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_00"); //他 的 失 踪 有 什 么 特 别 奇 怪 的 地 方 吗 ？
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_01"); //帕 多 斯 是 非 常 胆 怯 的 人 - 他 在 我 的 农 场 里 去 的 最 远 的 地 方 就 是 田 地 的 尽 头 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_02"); //即 使 见 到 一 只 肉 虫 他 也 会 立 刻 逃 走 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_03"); //那 些 东 西 也 许 看 着 不 怎 么 样 ， 但 是 你 真 的 没 法 把 它 们 看 成 是 危 险 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_was_10_04"); //（ 愤 慨 的 ） 听 说 有 人 吃 它 们 。 恶 心 。
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_was_15_05"); //你 会 习 惯 它 的 。
};

func void DIA_Addon_Bengar_MissingPeople_voll()
{
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_voll_15_00"); //也 许 他 只 是 刚 刚 吃 饱 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_01"); //在 田 里 工 作 就 是 他 的 生 活 。 我 无 法 想 象 他 会 去 给 别 的 农 场 主 干 活 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_voll_10_02"); //在 我 这 里 ， 他 可 以 做 他 想 做 的 任 何 事 。
};

func void DIA_Addon_Bengar_MissingPeople_Hint()
{
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_Hint_15_00"); //有 什 么 线 索 吗 ？
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_01"); //我 想 一 定 是 那 些 强 盗 把 他 抓 走 了 。 他 们 已 经 在 这 个 地 区 游 荡 几 天 了 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_02"); //我 曾 经 看 到 他 们 把 一 个 城 里 人 拉 进 他 们 的 营 地 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Hint_10_03"); //看 样 子 他 们 打 算 把 他 当 作 奴 隶 。
	Info_AddChoice(DIA_Addon_Bengar_MissingPeople, "这 个 强 盗 营 地 在 哪 里 ？", DIA_Addon_Bengar_MissingPeople_Lager);
};

var int Bengar_ToldAboutRangerBandits;
func void DIA_Addon_Bengar_MissingPeople_Lager()
{
	AI_Output(other, self, "DIA_Addon_Bengar_MissingPeople_Lager_15_00"); //这 个 强 盗 营 地 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_01"); //在 我 的 田 地 尽 头 ， 有 一 些 台 阶 通 向 下 面 的 一 个 小 山 谷 。 他 们 就 在 那 里 安 家 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_02"); //我 很 想 去 那 里 寻 找 帕 多 斯 ， 但 是 我 不 可 能 对 付 那 些 家 伙 。
	AI_Output(self, other, "DIA_Addon_Bengar_MissingPeople_Lager_10_03"); //你 也 最 好 和 他 们 保 持 安 全 距 离 。 他 们 都 是 没 有 幽 默 感 的 家 伙。
	Bengar_ToldAboutRangerBandits = TRUE;
};

func void DIA_Addon_Bengar_MissingPeople_back()
{
	Info_ClearChoices(DIA_Addon_Bengar_MissingPeople);
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnPardos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_ReturnPardos(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 5;
	condition		= DIA_Addon_Bengar_ReturnPardos_Condition;
	information		= DIA_Addon_Bengar_ReturnPardos_Info;
	description		= "帕 多 斯 回 来 了 吗 ？";
};

func int DIA_Addon_Bengar_ReturnPardos_Condition()
{
	if ((MIS_Bengar_BringMissPeopleBack == LOG_RUNNING)
	&& (Npc_GetDistToWP(Pardos_NW, "NW_FARM3_HOUSE_IN_NAVI_2") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_ReturnPardos_Info()
{
	AI_Output(other, self, "DIA_Addon_Bengar_ReturnPardos_15_00"); //帕 多 斯 回 来 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Bengar_ReturnPardos_10_01"); //是 的 ， 他 在 里 面 休 息 。 感 谢 你 做 的 一 切 … …
	AI_Output(other, self, "DIA_Addon_Bengar_ReturnPardos_15_02"); //没 关 系 。
	AI_Output(self, other, "DIA_Addon_Bengar_ReturnPardos_10_03"); //等 等 ， 我 很 想 给 你 一 点 报 酬 ， 但 是 我 没 有 … …
	AI_Output(other, self, "DIA_Addon_Bengar_ReturnPardos_15_04"); //算 了 吧 。

	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bengar_FernandosWeapons(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 5;
	condition		= DIA_Addon_Bengar_FernandosWeapons_Condition;
	information		= DIA_Addon_Bengar_FernandosWeapons_Info;
	description		= "在 强 盗 们 经 过 这 里 时 ， 他 们 带 着 武 器 吗 ？";
};

func int DIA_Addon_Bengar_FernandosWeapons_Condition()
{
	if ((Bengar_ToldAboutRangerBandits == TRUE)
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bengar_FernandosWeapons_Info()
{
	AI_Output(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_00"); //在 强 盗 们 经 过 这 里 时 ， 他 们 带 着 武 器 吗 ？
	AI_Output(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_01"); //那 是 多 么 愚 蠢 的 问 题 啊 ？ 如 果 他 们 没 有 武 器 的 话 ， 怎 么 能 当 强 盗 ？
	AI_Output(other, self, "DIA_Addon_Bengar_FernandosWeapons_15_02"); //我 是 说 整 车 的 武 器 。 一 大 批 货 物 。
	AI_Output(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_03"); //我 明 白 了 。 是 的 ， 既 然 你 提 到 了 ， 他 们 是 带 了 非 常 非 常 多 。
	AI_Output(self, other, "DIA_Addon_Bengar_FernandosWeapons_10_04"); //有 些 在 桶 里 ， 有 些 在 袋 子 里 ， 还 有 一 些 在 他 们 拉 的 车 上 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info rebellieren
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_REBELLIEREN(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 8;
	condition		= DIA_Bengar_REBELLIEREN_Condition;
	information		= DIA_Bengar_REBELLIEREN_Info;
	description		= "你 怎 么 看 欧 纳 尔 ？";
};

func int DIA_Bengar_REBELLIEREN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Bengar_REBELLIEREN_Info()
{
	AI_Output(other, self, "DIA_Bengar_REBELLIEREN_15_00"); //你 怎 么 看 欧 纳 尔 ？
	AI_Output(self, other, "DIA_Bengar_REBELLIEREN_10_01"); //他 是 一 个 贪 婪 的 混 蛋 ， 最 后 会 让 我 们 都 上 绞 架 。
	AI_Output(self, other, "DIA_Bengar_REBELLIEREN_10_02"); //总 有 一 天 ， 圣 骑 士 会 离 开 城 市 来 这 里 ， 让 我 们 这 些 小 农 场 主 为 他 在 这 里 所 做 的 一 切 流 血 而 死 。
	AI_Output(self, other, "DIA_Bengar_REBELLIEREN_10_03"); //但 是 我 别 无 选 择 。 民 兵 来 这 里 只 是 拿 东 西 ， 而 不 是 保 护 农 场 。
	AI_Output(self, other, "DIA_Bengar_REBELLIEREN_10_04"); //如 果 我 选 择 忠 于 城 市 ， 我 就 只 能 靠 自 己 。
	AI_Output(self, other, "DIA_Bengar_REBELLIEREN_10_05"); //至 少 现 在 欧 纳 尔 还 会 派 出 雇 佣 兵 ， 并 看 看 我 们 耕 种 的 怎 么 样 。
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PALADINE(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 9;
	condition		= DIA_Bengar_PALADINE_Condition;
	information		= DIA_Bengar_PALADINE_Info;
	description		= "你 用 什 么 来 对 抗 国 王 的 军 队 ？";
};

func int DIA_Bengar_PALADINE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_REBELLIEREN))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PALADINE_Info()
{
	AI_Output(other, self, "DIA_Bengar_PALADINE_15_00"); //你 用 什 么 来 对 抗 国 王 的 军 队 ？
	AI_Output(self, other, "DIA_Bengar_PALADINE_10_01"); //很 明 显 。 因 为 圣 骑 士 在 城 里 ， 没 有 任 何 改 善 。 只 有 对 立 。
	AI_Output(self, other, "DIA_Bengar_PALADINE_10_02"); //现 在 这 些 该 死 的 民 兵 来 我 们 这 里 的 次 数 更 加 频 繁 了 ， 并 把 他 们 能 拿 的 一 切 都 拿 走 ， 而 圣 骑 士 对 此 什 么 都 不 管 。
	AI_Output(self, other, "DIA_Bengar_PALADINE_10_03"); //我 唯 一 看 到 过 的 圣 骑 士 就 是 那 两 个 看 守 关 卡 的 卫 兵 。
	AI_Output(self, other, "DIA_Bengar_PALADINE_10_04"); //即 使 在 民 兵 把 我 们 全 都 杀 死 ， 他 们 也 不 会 挪 动 一 步 。
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PASS(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 10;
	condition		= DIA_Bengar_PASS_Condition;
	information		= DIA_Bengar_PASS_Info;
	description		= "关 卡 ？";
};

func int DIA_Bengar_PASS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PASS_Info()
{
	AI_Output(other, self, "DIA_Bengar_PASS_15_00"); //关 卡 ？
	AI_Output(self, other, "DIA_Bengar_PASS_10_01"); //是 的 。 通 向 旧 矿 藏 山 谷 的 关 卡 在 高 原 牧 场 另 一 头 的 瀑 布 旁 边 。
	AI_Output(self, other, "DIA_Bengar_PASS_10_02"); //向 玛 莱 克 询 问 关 于 它 的 事 情 。 他 上 周 去 过 那 里 几 次 。
};

// ************************************************************
// 			  				Miliz klatschen
// ************************************************************
instance DIA_Bengar_MILIZ(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 11;
	condition		= DIA_Bengar_MILIZ_Condition;
	information		= DIA_Bengar_MILIZ_Info;
	description		= "我 应 该 解 决 你 的 民 兵 问 题 。";
};

func int DIA_Bengar_MILIZ_Condition()
{
	if ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZ_Info()
{
	AI_Output(other, self, "DIA_Bengar_MILIZ_15_00"); //我 应 该 解 决 你 的 民 兵 问 题 。

	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Bengar_MILIZ_10_01"); //什 么 ？ 我 告 诉 欧 纳 尔 他 应 该 派 几 个 雇 佣 兵 来 。
		AI_Output(other, self, "DIA_Bengar_MILIZ_15_02"); //这 是 我 证 明 自 己 的 机 会 。
		AI_Output(self, other, "DIA_Bengar_MILIZ_10_03"); //太 可 怕 了 。 你 知 道 如 果 你 失 败 的 话 ， 民 兵 会 怎 么 对 付 我 们 吗 ？
	}
	else // SLD oder DJG
	{
		AI_Output(self, other, "DIA_Bengar_MILIZ_10_04"); //我 想 现 在 不 会 有 人 来 这 里 。
		AI_Output(self, other, "DIA_Bengar_MILIZ_10_05"); //我 几 天 前 就 告 诉 欧 纳 尔 了 。 我 付 的 租 金 是 干 什 么 的 ？
	};

	AI_Output(self, other, "DIA_Bengar_MILIZ_10_06"); //那 些 混 蛋 每 周 来 这 里 一 次 ， 为 城 市 征 税 。
	AI_Output(self, other, "DIA_Bengar_MILIZ_10_07"); //你 来 得 刚 刚 好 。 现 在 正 是 他 们 通 常 来 的 时 间 。
	AI_Output(self, other, "DIA_Bengar_MILIZ_10_08"); //他 们 随 时 会 到 这 里 。
};

// ************************************************************
// 			  				Selber vorknöpfen
// ************************************************************
instance DIA_Bengar_Selber(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 11;
	condition		= DIA_Bengar_Selber_Condition;
	information		= DIA_Bengar_Selber_Info;
	description		= "你 为 什 么 不 亲 自 抵 抗 那 些 民 兵 ？";
};

func int DIA_Bengar_Selber_Condition()
{
	if ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Bengar_MilSuccess == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bengar_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Bengar_Selber_Info()
{
	AI_Output(other, self, "DIA_Bengar_Selber_15_00"); //你 们 有 那 么 多 人 。 你 们 为 什 么 不 站 起 来 反 抗 那 些 民 兵 ？
	AI_Output(self, other, "DIA_Bengar_Selber_10_01"); //我 们 的 人 的 确 很 多 。 但 是 我 们 不 像 民 兵 那 样 受 过 战 斗 训 练 。
};

// ************************************************************
// 			  				Miliz klatschen
// ************************************************************
instance DIA_Bengar_MILIZKLATSCHEN(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 12;
	condition		= DIA_Bengar_MILIZKLATSCHEN_Condition;
	information		= DIA_Bengar_MILIZKLATSCHEN_Info;
	description		= "那 就 让 民 兵 来 吧 ， 我 会 解 决 他 们 的 ！";
};

func int DIA_Bengar_MILIZKLATSCHEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (!Npc_IsDead(Rick))
	&& (!Npc_IsDead(Rumbold))
	&& (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MILIZKLATSCHEN_Info()
{
	AI_Output(other, self, "DIA_Bengar_MILIZKLATSCHEN_15_00"); //那 就 让 民 兵 来 吧 ， 我 会 解 决 他 们 的 ！
	AI_Output(self, other, "DIA_Bengar_MILIZKLATSCHEN_10_01"); //我 不 能 等 。 他 们 现 在 来 这 里 了 。 看 ， 我 已 经 告 诉 过 你 了 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Bengar_MILIZKLATSCHEN_10_02"); //别 把 事 情 弄 砸 ！
	}
	else // SLD oder DJG
	{
		AI_Output(self, other, "DIA_Bengar_MILIZKLATSCHEN_10_03"); //那 好 吧 ， 祝 你 好 运 ！ 你 去 摆 平 他 们 !
	};

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "MilComing");

	if ((Hlp_IsValidNpc(Rick))
	&& (!Npc_IsDead(Rick)))
	{
		Npc_ExchangeRoutine(Rick, "MilComing");
		AI_ContinueRoutine(Rick);
	};

	if ((Hlp_IsValidNpc(Rumbold))
	&& (!Npc_IsDead(Rumbold)))
	{
		Npc_ExchangeRoutine(Rumbold, "MilComing");
		AI_ContinueRoutine(Rumbold);
	};
};

// ************************************************************
// 			  				Miliz weg
// ************************************************************
var int Bengar_MilSuccess;
instance DIA_Bengar_MILIZWEG(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 12;
	condition		= DIA_Bengar_MILIZWEG_Condition;
	information		= DIA_Bengar_MILIZWEG_Info;
	permanent		= TRUE;
	description		= "你 的 民 兵 问 题 是 过 去 的 事 了 。";
};

func int DIA_Bengar_MILIZWEG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_MILIZ))
	&& (Bengar_MilSuccess == FALSE))
	{
		if ((Npc_IsDead(Rick) && Npc_IsDead(Rumbold))
		|| (Rumbold_Bezahlt == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bengar_MILIZWEG_Info()
{
	AI_Output(other, self, "DIA_Bengar_MILIZWEG_15_00"); //你 的 民 兵 问 题 是 过 去 的 事 了 。
	if ((Rumbold_Bezahlt == TRUE)
	&& (Npc_IsDead(Rumbold) == FALSE))
	{
		AI_Output(self, other, "DIA_Bengar_MILIZWEG_10_01"); //你 疯 了 吗 ？ 等 你 走 了 以 后 ， 你 知 道 那 些 家 伙 对 怎 么 对 付 我 们 吗 ？
		AI_Output(self, other, "DIA_Bengar_MILIZWEG_10_02"); //他 们 还 站 在 那 边 。 告 诉 他 们 ， 他 们 应 该 完 全 消 失 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Bengar_MILIZWEG_10_03"); //不 坏 。 现 在 也 许 到 月 底 的 时 候 还 会 剩 下 一 些 东 西 换 点 别 的 。 谢 谢 。

		if (Rumbold_Bezahlt == TRUE)
		{
			AI_Output(self, other, "DIA_Bengar_MILIZWEG_10_04"); //你 甚 至 想 要 为 我 付 账 。 你 真 是 太 可 敬 了 。
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN + 50);
		}
		else
		{
			B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
		};

		Bengar_MilSuccess = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info balthasar
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASAR(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 13;
	condition		= DIA_Bengar_BALTHASAR_Condition;
	information		= DIA_Bengar_BALTHASAR_Info;
	description		= "你 不 允 许 牧 羊 人 巴 尔 塞 萨 去 你 的 牧 场 ？";
};

func int DIA_Bengar_BALTHASAR_Condition()
{
	if (
	(MIS_Balthasar_BengarsWeide == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bengar_WOVONLEBTIHR))
	)
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASAR_Info()
{
	AI_Output(other, self, "DIA_Bengar_BALTHASAR_15_00"); //你 不 允 许 牧 羊 人 巴 尔 塞 萨 去 你 的 牧 场 ？
	AI_Output(self, other, "DIA_Bengar_BALTHASAR_10_01"); //哦 ， 是 的 。 我 告 诉 他 了,塞 柯 布 应 该 付 我 钱 ， 如 果 他 想 把 绵 羊 带 到 我 的 牧 场 上 的 话 。
	AI_Output(self, other, "DIA_Bengar_BALTHASAR_10_02"); //说 实 话 ， 那 是 唯 一 的 烦 恼 。 我 只 是 无 法 忍 受 巴 尔 塞 萨 。
	B_LogEntry(TOPIC_BalthasarsSchafe, TOPIC_BalthasarsSchafe_1);
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info balthasardarfaufweide
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 14;
	condition		= DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition;
	information		= DIA_Bengar_BALTHASARDARFAUFWEIDE_Info;
	description		= "民 兵 走 了 ， 巴 尔 塞 萨 可 以 在 使 用 你 的 土 地 了 。";
};

func int DIA_Bengar_BALTHASARDARFAUFWEIDE_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Bengar_BALTHASAR))
	&& (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (Bengar_MilSuccess == TRUE)
	)
	{
		return TRUE;
	};
};

func void DIA_Bengar_BALTHASARDARFAUFWEIDE_Info()
{
	AI_Output(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00"); //民 兵 走 了 ， 巴 尔 塞 萨 可 以 在 使 用 你 的 土 地 了 。
	AI_Output(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01"); //为 什 么 ?
	AI_Output(other, self, "DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02"); //（ 威 胁 ） 因 为 我 说 这 样 。
	AI_Output(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03"); //嗯 。 好 吧 ， 随 便 你 说 吧 。
	AI_Output(self, other, "DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04"); //让 他 在 野 地 后 面 给 他 的 牲 口 找 个 地 方 。

	MIS_Balthasar_BengarsWeide = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERMKAP1(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 15;
	condition		= DIA_Bengar_PERMKAP1_Condition;
	information		= DIA_Bengar_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "多 保 重 。";
};

func int DIA_Bengar_PERMKAP1_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_BALTHASARDARFAUFWEIDE))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Bengar_PERMKAP1_15_00"); //多 保 重 。
	AI_Output(self, other, "DIA_Bengar_PERMKAP1_10_01"); //你 也 是 。

	AI_StopProcessInfos(self);
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
instance DIA_Bengar_KAP3_EXIT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 999;
	condition		= DIA_Bengar_KAP3_EXIT_Condition;
	information		= DIA_Bengar_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bengar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Allein
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_ALLEIN(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 30;
	condition		= DIA_Bengar_ALLEIN_Condition;
	information		= DIA_Bengar_ALLEIN_Info;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Bengar_ALLEIN_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Bengar_ALLEIN_Info()
{
	AI_Output(other, self, "DIA_Bengar_ALLEIN_15_00"); //最 近 怎 么 样 ？

	if ((Malak_isAlive_Kap3 == TRUE) && ((Npc_GetDistToWP(Malak, "FARM3") < 3000) == FALSE))
	{
		AI_Output(self, other, "DIA_Bengar_ALLEIN_10_01"); //玛 莱 克 不 见 了 ， 并 且 带 走 了 所 有 的 东 西 ， 还 有 所 有 那 些 和 他 一 起 为 我 工 作 的 人 。 他 说 他 要 去 山 里 。
		AI_Output(self, other, "DIA_Bengar_ALLEIN_10_02"); //他 再 也 无 法 忍 受 这 里 了 。
		MIS_GetMalakBack = LOG_RUNNING;
	}
	else
	{
		AI_Output(self, other, "DIA_Bengar_ALLEIN_10_03"); //艰 苦 时 期 。 我 不 知 道 我 还 能 坚 持 多 久 。
	};

	AI_Output(self, other, "DIA_Bengar_ALLEIN_10_04"); //每 天 都 从 关 卡 涌 出 大 批 的 怪 物 ， 并 在 高 原 牧 场 出 没 ， 它 们 离 我 非 常 近 了 。
	AI_Output(self, other, "DIA_Bengar_ALLEIN_10_05"); //如 果 我 还 能 有 几 个 帮 手 或 者 雇 佣 兵 的 话 。
	AI_Output(self, other, "DIA_Bengar_ALLEIN_10_06"); //曾 经 有 一 个 人 愿 意 为 我 工 作 。 然 而 他 改 变 主 意 了 。 我 想 他 的 名 字 是 ‘ 狼 ’ 。
	MIS_BengarsHelpingSLD = LOG_RUNNING;

	Log_CreateTopic(TOPIC_BengarALLEIN, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BengarALLEIN, LOG_RUNNING);
	B_LogEntry(TOPIC_BengarALLEIN, TOPIC_BengarALLEIN_1);
	Log_AddEntry(TOPIC_BengarALLEIN, TOPIC_BengarALLEIN_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Malaktot
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKTOT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 32;
	condition		= DIA_Bengar_MALAKTOT_Condition;
	information		= DIA_Bengar_MALAKTOT_Info;
	description		= "玛 莱 克 死 了 。";
};

func int DIA_Bengar_MALAKTOT_Condition()
{
	if ((Npc_IsDead(Malak))
	&& (Malak_isAlive_Kap3 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKTOT_Info()
{
	AI_Output(other, self, "DIA_Bengar_MALAKTOT_15_00"); //玛 莱 克 死 了 。
	AI_Output(self, other, "DIA_Bengar_MALAKTOT_10_01"); //然 后 所 有 的 事 情 只 会 变 得 更 糟 糕 。
};

///////////////////////////////////////////////////////////////////////
//	Info SLDda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_SLDDA(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 32;
	condition		= DIA_Bengar_SLDDA_Condition;
	information		= DIA_Bengar_SLDDA_Info;
	description		= "我 找 到 了 你 要 找 的 那 个 雇 佣 兵 。";
};

func int DIA_Bengar_SLDDA_Condition()
{
	if ((Npc_GetDistToWP(SLD_Wolf, "FARM3") < 3000)
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	&& ((Npc_IsDead(SLD_Wolf)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_SLDDA_Info()
{
	AI_Output(other, self, "DIA_Bengar_SLDDA_15_00"); //我 找 到 了 你 要 找 的 那 个 雇 佣 兵 。
	AI_Output(self, other, "DIA_Bengar_SLDDA_10_01"); //我 从 没 见 过 象 在 我 农 场 里 那 样 的 人 。 我 只 能 希 望 有 办 法 解 决 。
	AI_Output(self, other, "DIA_Bengar_SLDDA_10_02"); //给 ， 拿 上 这 个 。 我 想 你 会 发 现 它 的 用 途 。
	CreateInvItems(self, ItMi_Gold, 400);
	B_GiveInvItems(self, other, ItMi_Gold, 400);
	B_GivePlayerXP(XP_BengarsHelpingSLDArrived);
};

///////////////////////////////////////////////////////////////////////
//	Info Malakwiederda
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_MALAKWIEDERDA(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 35;
	condition		= DIA_Bengar_MALAKWIEDERDA_Condition;
	information		= DIA_Bengar_MALAKWIEDERDA_Info;
	description		= "玛 莱 克 回 来 了 。";
};

func int DIA_Bengar_MALAKWIEDERDA_Condition()
{
	if ((Npc_GetDistToWP(Malak, "FARM3") < 3000)
	&& ((MIS_GetMalakBack == LOG_SUCCESS) || (NpcObsessedByDMT_Malak == TRUE))
	&& ((Npc_IsDead(Malak)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bengar_MALAKWIEDERDA_Info()
{
	AI_Output(other, self, "DIA_Bengar_MALAKWIEDERDA_15_00"); //玛 莱 克 回 来 了 。
	AI_Output(self, other, "DIA_Bengar_MALAKWIEDERDA_10_01"); //时 间 差 不 多 了 。 我 想 我 永 远 不 会 再 见 到 他 了 。
	B_GivePlayerXP(XP_GetMalakBack);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Bengar_PERM(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 80;
	condition		= DIA_Bengar_PERM_Condition;
	information		= DIA_Bengar_PERM_Info;
	permanent		= TRUE;
	description		= "一 切 都 会 顺 利 。";
};

func int DIA_Bengar_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bengar_ALLEIN))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Bengar_PERM_Info()
{
	AI_Output(other, self, "DIA_Bengar_PERM_15_00"); //一 切 都 会 顺 利 。

	if ((Npc_GetDistToWP(Malak, "FARM3") < 3000)
	&& ((Npc_IsDead(Malak)) == FALSE))
	{
		AI_Output(self, other, "DIA_Bengar_PERM_10_01"); //玛 莱 克 又 来 这 里 了 ， 但 是 情 况 已 经 完 全 不 同 了 。
		AI_Output(self, other, "DIA_Bengar_PERM_10_02"); //除 非 出 现 奇 迹 ， 我 们 这 里 所 有 的 人 都 会 被 杀 死 。
	}
	else if ((Npc_KnowsInfo(other, DIA_Bengar_SLDDA))
	&& ((Npc_IsDead(SLD_Wolf)) == FALSE)
	&& (Npc_GetDistToWP(SLD_Wolf, "FARM3") < 3000))
	{
		AI_Output(self, other, "DIA_Bengar_PERM_10_03"); //狼 是 个 奇 怪 的 家 伙 ， 但 是 我 想 它 会 起 作 用 的 。
	}
	else
	{
		AI_Output(self, other, "DIA_Bengar_PERM_10_04"); //没 有 了 玛 莱 克 ， 这 里 不 会 再 有 人 做 事 了 。 如 果 某 人 不 尽 快 出 现 的 话 ， 我 就 只 能 放 弃 我 的 农 场 。

		if ((Malak_isAlive_Kap3 == TRUE)
		&& ((Npc_IsDead(Malak)) == FALSE))
		{
			AI_Output(self, other, "DIA_Bengar_PERM_10_05"); //希 望 他 能 尽 快 回 来 。
		};
	};

	AI_StopProcessInfos(self);

	if ((Npc_IsDead(SLD_Wolf))
	&& (MIS_BengarsHelpingSLD == LOG_SUCCESS))
	{
		B_StartOtherRoutine(SLD_815_Soeldner, "Start");
		B_StartOtherRoutine(SLD_817_Soeldner, "Start");
	};
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
instance DIA_Bengar_KAP4_EXIT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 999;
	condition		= DIA_Bengar_KAP4_EXIT_Condition;
	information		= DIA_Bengar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bengar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Bengar_KAP5_EXIT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 999;
	condition		= DIA_Bengar_KAP5_EXIT_Condition;
	information		= DIA_Bengar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bengar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP5_EXIT_Info()
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
instance DIA_Bengar_KAP6_EXIT(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 999;
	condition		= DIA_Bengar_KAP6_EXIT_Condition;
	information		= DIA_Bengar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bengar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Bengar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bengar_PICKPOCKET(C_INFO)
{
	npc				= BAU_960_Bengar;
	nr				= 900;
	condition		= DIA_Bengar_PICKPOCKET_Condition;
	information		= DIA_Bengar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Bengar_PICKPOCKET_Condition()
{
	C_Beklauen(28, 50);
};

func void DIA_Bengar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
	Info_AddChoice(DIA_Bengar_PICKPOCKET, DIALOG_BACK, DIA_Bengar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bengar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bengar_PICKPOCKET_DoIt);
};

func void DIA_Bengar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};

func void DIA_Bengar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bengar_PICKPOCKET);
};
