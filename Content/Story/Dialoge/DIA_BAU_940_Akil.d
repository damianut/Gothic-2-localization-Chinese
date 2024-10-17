///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_EXIT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 999;
	condition		= DIA_Akil_EXIT_Condition;
	information		= DIA_Akil_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Akil_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_EXIT_Info()
{
	AI_Output(other, self, "DIA_Akil_EXIT_15_00"); //我 必 须 走 了 。

	if (Akil_Sauer == TRUE)
	{
		AI_Output(self, other, "DIA_Akil_EXIT_13_01"); //我 绝 对 不 阻 止 你 。
	}
	else
	{
		AI_Output(self, other, "DIA_Akil_EXIT_13_02"); //再 见 。 我 真 的 希 望 我 能 为 你 多 做 一 些 事 。
	};

	AI_StopProcessInfos(self);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo mit Söldnern
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hallo(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 4;
	condition		= DIA_Akil_Hallo_Condition;
	information		= DIA_Akil_Hallo_Info;
	description		= "有 问 题 ？";
};

func int DIA_Akil_Hallo_Condition()
{
	if (!(Npc_IsDead(Alvares))
	&& !(Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hallo_Info()
{
	AI_Output(other, self, "DIA_Akil_Hallo_15_00"); //有 问 题 ？
	AI_Output(self, other, "DIA_Akil_Hallo_13_01"); //（ 出 汗 ） … … 呃 … … 不 ， 不 … … 一 切 都 好 。 （ 不 安 的 ） 如 果 … … 你 离 开 的 话 会 更 好 。
	AI_Output(other, self, "DIA_Akil_Hallo_15_02"); //你 肯 定 吗 ？
	AI_Output(self, other, "DIA_Akil_Hallo_13_03"); //呃 … … 对 ， 对 … … 一 切 都 好 。 你 … … 呃 … … 我 … … 我 现 在 不 能 和 你 说 话 。

	Log_CreateTopic(TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_1);

	Akils_SLDStillthere = TRUE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kann nicht reden
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Nichtjetzt(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 7;
	condition		= DIA_Akil_Nichtjetzt_Condition;
	information		= DIA_Akil_Nichtjetzt_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Akil_Nichtjetzt_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& !(Npc_IsDead(Alvares))
	&& !(Npc_IsDead(Engardo))
	&& Npc_KnowsInfo(other, DIA_Akil_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Akil_Nichtjetzt_Info()
{
	AI_Output(self, other, "DIA_Akil_Nichtjetzt_13_00"); //呃 … … 现 在 不 行 ， 我 现 在 不 能 和 你 说 话 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nach dem Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_NachKampf(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 5;
	condition		= DIA_Akil_NachKampf_Condition;
	information		= DIA_Akil_NachKampf_Info;
	important		= TRUE;
};

func int DIA_Akil_NachKampf_Condition()
{
	if ((Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Akil_NachKampf_Info()
{
	AI_Output(self, other, "DIA_Akil_NachKampf_13_00"); //感 谢 英 诺 斯 。 我 想 我 的 时 间 已 经 用 完 了 。
	AI_Output(self, other, "DIA_Akil_NachKampf_13_01"); //我 叫 阿 基 尔 。 我 在 这 片 田 地 上 耕 种 。
	AI_Output(other, self, "DIA_Akil_NachKampf_15_02"); //那 些 人 是 谁 ？

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Akil_NachKampf_13_03"); //你 应 该 能 认 出 他 们 来 。 那 些 人 是 从 欧 纳 尔 的 农 场 过 来 的 雇 佣 兵 ， 和 你 一 样 。
	}
	else
	{
		AI_Output(self, other, "DIA_Akil_NachKampf_13_04"); //那 些 是 欧 纳 尔 农 场 里 的 雇 佣 兵 。 那 些 混 蛋 除 了 掠 夺 和 杀 人 之 外 ， 什 么 都 不 懂 。
	};

	AI_Output(self, other, "DIA_Akil_NachKampf_13_05"); //我 担 心 最 糟 糕 的 情 况 … …
	AI_Output(self, other, "DIA_Akil_NachKampf_13_06"); //（ 深 呼 吸 ） … … 嗯 ， 感 谢 英 诺 斯 没 有 让 事 情 发 展 成 那 样 的 结 果 。 告 诉 我 ， 我 能 为 你 做 些 什 么 。

	Info_ClearChoices(DIA_Akil_NachKampf);
	Info_AddChoice(DIA_Akil_NachKampf, "没 什 么 。 只 要 你 能 安 全 完 成 此 事 。", DIA_Akil_NachKampf_Ehre);
	Info_AddChoice(DIA_Akil_NachKampf, "来 点 金 币 如 何 ？", DIA_Akil_NachKampf_Gold);

	Npc_ExchangeRoutine(self, "Start");

	self.flags = 0;

	if ((Hlp_IsValidNpc(Kati))
	&& (!Npc_IsDead(Kati)))
	{
		Npc_ExchangeRoutine(Kati, "Start");
		AI_ContinueRoutine(Kati);
		Kati.flags = 0;
	};

	if ((Hlp_IsValidNpc(Randolph))
	&& (!Npc_IsDead(Randolph)))
	{
		Npc_ExchangeRoutine(Randolph, "Start");
		AI_ContinueRoutine(Randolph);
		Randolph.flags = 0;
	};

	TOPIC_END_AkilsSLDStillthere = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Akil_NachKampf_Ehre()
{
	AI_Output(other, self, "DIA_Akil_NachKampf_Ehre_15_00"); //没 什 么 。 只 要 你 能 安 全 完 成 此 事 。
	AI_Output(self, other, "DIA_Akil_NachKampf_Ehre_13_01"); //你 是 一 个 很 特 别 的 家 伙 。 愿 英 诺 斯 一 路 守 护 你 。

	B_GivePlayerXP(XP_Akil_SLDWegVomHofEhre);
	Info_ClearChoices(DIA_Akil_NachKampf);
};

func void DIA_Akil_NachKampf_Gold()
{
	AI_Output(other, self, "DIA_Akil_NachKampf_Gold_15_00"); //来 点 金 币 如 何 ？
	AI_Output(self, other, "DIA_Akil_NachKampf_Gold_13_01"); //很 抱 歉 我 只 能 让 你 失 望 了 - 我 是 个 穷 苦 的 农 民 。 刚 刚 能 养 活 我 们 自 己 。
	AI_Output(self, other, "DIA_Akil_NachKampf_Gold_13_02"); //我 只 能 给 你 一 些 面 粉 去 煮 成 食 物 。 去 凯 提 那 里 ， 让 她 帮 你 做 。

	B_GivePlayerXP(XP_Akil_SLDWegVomHof);
	Info_ClearChoices(DIA_Akil_NachKampf);
	Kati_Mahlzeit = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info infos
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Soeldner(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 7;
	condition		= DIA_Akil_Soeldner_Condition;
	information		= DIA_Akil_Soeldner_Info;
	description		= "雇 佣 兵 想 从 你 这 里 得 到 什 么 ？ ";
};

func int DIA_Akil_Soeldner_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	{
		return TRUE;
	};
};

func void DIA_Akil_Soeldner_Info()
{
	AI_Output(other, self, "DIA_Akil_Soeldner_15_00"); //雇 佣 兵 想 从 你 这 里 得 到 什 么 ？

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Akil_Soeldner_13_01"); //你 在 骗 我 。 雇 佣 兵 要 收 租 金 。
	}
	else
	{
		AI_Output(self, other, "DIA_Akil_Soeldner_13_02"); //你 不 知 道 吗 ？ 欧 纳 尔 ， 地 主 ， 雇 了 他 们 。 他 们 保 护 他 的 农 场 ， 并 帮 他 收 租 金 。
		AI_Output(self, other, "DIA_Akil_Soeldner_13_03"); //那 就 意 味 着 他 们 从 一 个 农 场 到 另 一 个 农 场 ， 拿 走 所 有 他 们 想 要 的 东 西 。 如 果 有 人 不 给 的 话 ， 就 要 尝 尝 他 们 的 武 器 的 味 道 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_MissingPeople(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 5;
	condition		= DIA_Addon_Akil_MissingPeople_Condition;
	information		= DIA_Addon_Akil_MissingPeople_Info;
	description		= "你 知 道 任 何 关 于 失 踪 市 民 的 消 息 吗 ？";
};

func int DIA_Addon_Akil_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Akil_NachKampf))
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Akil_MissingPeople_15_00"); //你 知 道 任 何 关 于 失 踪 市 民 的 消 息 吗 ？
	AI_Output(self, other, "DIA_Addon_Akil_MissingPeople_13_01"); //不 要 让 我 发 笑 。 听 说 过 吗 ？ 我 自 己 的 一 些 人 也 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Akil_MissingPeople_13_02"); //托 纳 克 和 特 尔 伯 以 前 在 我 的 田 里 干 活 ， 直 到 三 天 之 前 。
	AI_Output(self, other, "DIA_Addon_Akil_MissingPeople_13_03"); //而 且 我 清 楚 地 知 道 ， 他 们 绝 不 会 那 样 站 起 来 然 后 离 开 农 场 的 。
	AI_Output(self, other, "DIA_Addon_Akil_MissingPeople_13_04"); //还 有 ， 他 们 消 失 之 后 ， 没 人 能 告 诉 我 他 们 去 了 哪 里 。
	AI_Output(self, other, "DIA_Addon_Akil_MissingPeople_13_05"); //如 果 你 碰 巧 知 道 他 们 发 生 了 什 么 事 ， 一 定 要 告 诉 我 ， 好 吗 ？
	B_GivePlayerXP(XP_Ambient);

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_4);

	MIS_Akil_BringMissPeopleBack = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Akil_ReturnPeople(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 5;
	condition		= DIA_Addon_Akil_ReturnPeople_Condition;
	information		= DIA_Addon_Akil_ReturnPeople_Info;
	description		= "关 于 你 的 农 场 工 人 … …";
};

func int DIA_Addon_Akil_ReturnPeople_Condition()
{
	if ((MIS_Akil_BringMissPeopleBack == LOG_RUNNING)
	&& (MissingPeopleReturnedHome == TRUE)
	&& ((Npc_GetDistToWP(Tonak_NW, "NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(Telbor_NW, "NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Akil_ReturnPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Akil_ReturnPeople_15_00"); //关 于 你 的 农 场 工 人 … …

	if ((Npc_GetDistToWP(Tonak_NW, "NW_FARM2_FIELD_TANOK") <= 1000)
	&& (Npc_GetDistToWP(Telbor_NW, "NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self, other, "DIA_Addon_Akil_ReturnPeople_13_01"); //你 把 他 们 带 回 来 了 - 你 真 是 一 个 勇 敢 的 人 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Akil_ReturnPeople_13_02"); //至 少 他 们 还 有 人 活 下 来 了 。
	};

	AI_Output(self, other, "DIA_Addon_Akil_ReturnPeople_13_03"); //拿 着 这 些 金 子 ， 算 我 的 一 点 感 谢 。
	B_GiveInvItems(self, other, itmi_Gold, 100);

	B_GivePlayerXP(XP_Ambient);
	MIS_Akil_BringMissPeopleBack = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Baltrams Lieferung
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Lieferung(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 20;
	condition		= DIA_Akil_Lieferung_Condition;
	information		= DIA_Akil_Lieferung_Info;
	description		= "贝 尔 卓 姆 派 我 来 … …";
};

func int DIA_Akil_Lieferung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Akil_NachKampf)
	&& (MIS_Baltram_ScoutAkil == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Akil_Lieferung_Info()
{
	AI_Output(other, self, "DIA_Akil_Lieferung_15_00"); //贝 尔 卓 姆 派 我 来 的 。 我 要 从 这 里 取 走 一 件 货 物 。
	AI_Output(self, other, "DIA_Akil_Lieferung_13_01"); //那 么 你 是 他 的 新 使 者 了 。 好 吧 ， 我 已 经 把 包 裹 准 备 好 了 。
	CreateInvItems(self, ItMi_BaltramPaket, 1);
	B_GiveInvItems(self, other, ItMi_BaltramPaket, 1);
	Lieferung_Geholt = TRUE;

	B_LogEntry(TOPIC_Baltram, TOPIC_Baltram_1);
	Log_AddEntry(TOPIC_Nagur, TOPIC_Nagur_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Die Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Gegend(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 90;
	condition		= DIA_Akil_Gegend_Condition;
	information		= DIA_Akil_Gegend_Info;
	description		= "你 认 识 这 个 地 区 的 路 … …";
};

func int DIA_Akil_Gegend_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Akil_Soeldner)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

// -------------------------------
var int Knows_Taverne;
// -------------------------------
func void DIA_Akil_Gegend_Info()
{
	AI_Output(other, self, "DIA_Akil_Gegend_15_00"); //你 认 识 这 个 地 区 的 路 … …
	AI_Output(self, other, "DIA_Akil_Gegend_13_01"); //当 然 ， 你 想 知 道 什 么 ？
};

/*
func void DIA_Akil_Gegend_BACK()
{
	Info_ClearChoices(DIA_Akil_Gegend);
};

func void DIA_Akil_Gegend_Onar()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Onar_15_00"); //Wo finde ich den Hof von Onar?
	AI_Output(self, other, "DIA_Akil_Gegend_Onar_13_01"); //Geh einfach wieder die Steinstufen runter und folge dem Weg weiter nach Osten.
	AI_Output(self, other, "DIA_Akil_Gegend_Onar_13_02"); //Irgendwann kommt eine Taverne. Da gehst du weiter nach Osten bis du zu den großen Feldern kommst. Da lungern dann schon die Söldner rum.
	Knows_Taverne = TRUE;
};

func void DIA_Akil_Gegend_Wald()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Wald_15_00"); //Was finde ich in dem Wald hinter deinem Hof?
	AI_Output(self, other, "DIA_Akil_Gegend_Wald_13_01"); //Da gibt's nur jede Menge Monster - wobei die Wölfe noch die ungefährlichsten sind.
	AI_Output(self, other, "DIA_Akil_Gegend_Wald_13_02"); //Angeblich sollen da auch ein paar Banditen ihre Höhle haben. Na - meinen Hof haben sie bis jetzt in Ruhe gelassen.
};

func void DIA_Akil_Gegend_Taverne()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Taverne_15_00"); //Was ist das für eine Taverne im Osten?
	AI_Output(self, other, "DIA_Akil_Gegend_Taverne_13_01"); //Frag mal Randolph. Er weiß mehr darüber als ich. Er war schon ein paar mal dort.
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Onars Hof
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Hof(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 20;
	condition		= DIA_Akil_Hof_Condition;
	information		= DIA_Akil_Hof_Info;
	description		= "我 可 以 在 哪 里 找 到 欧 纳 尔 的 农 场 ？ ";
};

func int DIA_Akil_Hof_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Hof_Info()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Onar_15_00"); //我 可 以 在 哪 里 找 到 欧 纳 尔 的 农 场 ？
	AI_Output(self, other, "DIA_Akil_Gegend_Onar_13_01"); //只 要 从 石 头 台 阶 回 去 ， 然 后 沿 着 道 路 向 东 。
	AI_Output(self, other, "DIA_Akil_Gegend_Onar_13_02"); //等 你 到 了 一 个 酒 馆 ， 从 那 里 继 续 向 东 走 ， 直 到 一 片 很 大 的 田 地 。 那 就 是 雇 佣 兵 聚 集 的 地 方 。
	Knows_Taverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Taverne(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 20;
	condition		= DIA_Akil_Taverne_Condition;
	information		= DIA_Akil_Taverne_Info;
	description		= "这 里 东 边 的 那 个 酒 馆 叫 什 么 ？";
};

func int DIA_Akil_Taverne_Condition()
{
	if (Knows_Taverne == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Akil_Taverne_Info()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Taverne_15_00"); //这 里 东 边 的 那 个 酒 馆 叫 什 么 ？
	AI_Output(self, other, "DIA_Akil_Gegend_Taverne_13_01"); //问 伦 道 夫 去 。 他 比 我 知 道 的 更 清 楚 。 他 曾 经 去 过 那 里 几 次 。
};

///////////////////////////////////////////////////////////////////////
//	Info Wald
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Wald(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 20;
	condition		= DIA_Akil_Wald_Condition;
	information		= DIA_Akil_Wald_Info;
	description		= "你 农 场 后 面 的 树 林 里 有 什 么 ？";
};

func int DIA_Akil_Wald_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Akil_Gegend))
	{
		return TRUE;
	};
};

func void DIA_Akil_Wald_Info()
{
	AI_Output(other, self, "DIA_Akil_Gegend_Wald_15_00"); //你 农 场 后 面 的 树 林 里 有 什 么 ？
	AI_Output(self, other, "DIA_Akil_Gegend_Wald_13_01"); //那 里 有 几 群 怪 物 - 而 狼 只 是 危 险 最 小 的 一 种 。
	AI_Output(self, other, "DIA_Akil_Gegend_Wald_13_02"); //据 说 还 有 几 个 强 盗 住 在 那 边 的 山 洞 里 。 嗯 - 到 现 在 为 止 ， 他 们 还 没 有 来 骚 扰 我 的 农 场 。
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_Perm(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 32;
	condition		= DIA_Akil_Perm_Condition;
	information		= DIA_Akil_Perm_Info;
	permanent		= TRUE;
	description		= "发 生 了 其 它 什 么 事 吗 ？";
};

func int DIA_Akil_Perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Akil_Soeldner))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Akil_Perm_Info()
{
	AI_Output(other, self, "DIA_Akil_Perm_15_00"); //发 生 了 其 它 什 么 事 吗 ？

	if (Kapitel == 3)
	{
		if (MIS_Akil_SchafDiebe == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Akil_Perm_13_01"); //不 。 我 希 望 绵 羊 呆 在 它 们 应 该 呆 的 地 方 。
		}
		else
		{
			AI_Output(self, other, "DIA_Akil_Perm_13_02"); //我 的 绵 羊 不 断 地 消 失 。 很 快 我 们 就 没 有 任 何 能 吃 的 东 西 了 。
		};
	}
	else // Kapitel 4 & 5
	{
		if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self, other, "DIA_Akil_Perm_13_03"); //兽 人 出 现 在 所 有 的 地 方 。 甚 至 有 人 提 到 他 们 的 指 挥 部 。 去 问 农 场 主 洛 拔 特 这 些 事 。
		};

		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self, other, "DIA_Akil_Perm_13_04"); //他 们 还 在 这 个 地 区 看 到 大 量 的 蜥 蜴 人 。 如 果 我 是 你 的 话 ， 就 不 会 去 那 些 山 洞 。
		};

		if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Akil_Perm_13_05"); //那 些 戴 黑 头 罩 的 人 在 找 你 。
			AI_Output(other, self, "DIA_Akil_Perm_15_06"); //现 在 有 个 新 奇 的 想 法 。
			AI_Output(self, other, "DIA_Akil_Perm_13_07"); //好 吧 。 我 只 是 想 ， 我 最 好 提 一 下 。
		};
	};
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
instance DIA_Akil_KAP3_EXIT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 999;
	condition		= DIA_Akil_KAP3_EXIT_Condition;
	information		= DIA_Akil_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Akil_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchafDieb
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEB(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 2;
	condition		= DIA_Akil_SCHAFDIEB_Condition;
	information		= DIA_Akil_SCHAFDIEB_Info;
	description		= "有 其 它 的 新 闻 吗 ？";
};

func int DIA_Akil_SCHAFDIEB_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEB_Info()
{
	AI_Output(other, self, "DIA_Akil_SCHAFDIEB_15_00"); //有 其 它 的 新 闻 吗 ？
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_13_01"); //近 来 有 人 不 断 地 偷 走 我 的 绵 羊 。 我 在 夜 里 也 不 能 好 好 睡 觉 。

	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, "不 关 我 的 事 。", DIA_Akil_SCHAFDIEB_nein);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, "你 丢 了 多 少 绵 羊 ？", DIA_Akil_SCHAFDIEB_wieviel);
	Info_AddChoice(DIA_Akil_SCHAFDIEB, "是 谁 干 的 ？", DIA_Akil_SCHAFDIEB_wer);
	MIS_Akil_SchafDiebe = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AkilSchafDiebe, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilSchafDiebe, LOG_RUNNING);
	B_LogEntry(TOPIC_AkilSchafDiebe, TOPIC_AkilSchafDiebe_1);
};

func void DIA_Akil_SCHAFDIEB_wer()
{
	AI_Output(other, self, "DIA_Akil_SCHAFDIEB_wer_15_00"); //是 谁 干 的 ？
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_wer_13_01"); //我 有 一 种 预 感 。
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_wer_13_02"); //有 些 相 当 可 恶 的 家 伙 已 经 在 森 林 那 边 的 山 洞 里 安 家 了 。
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_wer_13_03"); //我 不 相 信 他 们 会 只 靠 浆 果 过 日 子 。 我 非 常 肯 定 我 的 那 些 绵 羊 失 踪 到 哪 里 去 了 。
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

func void DIA_Akil_SCHAFDIEB_wieviel()
{
	AI_Output(other, self, "DIA_Akil_SCHAFDIEB_wieviel_15_00"); //你 丢 了 多 少 绵 羊 ？
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_wieviel_13_01"); //现 在 至 少 已 经 丢 了 三 只 了 。
};

func void DIA_Akil_SCHAFDIEB_nein()
{
	AI_Output(other, self, "DIA_Akil_SCHAFDIEB_nein_15_00"); //不 关 我 的 事 。
	AI_Output(self, other, "DIA_Akil_SCHAFDIEB_nein_13_01"); //我 明 白 。 你 还 有 其 它 的 事 情 要 担 心 。
	Info_ClearChoices(DIA_Akil_SCHAFDIEB);
};

///////////////////////////////////////////////////////////////////////
//	Info Schafdiebeplatt
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_SCHAFDIEBEPLATT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 2;
	condition		= DIA_Akil_SCHAFDIEBEPLATT_Condition;
	information		= DIA_Akil_SCHAFDIEBEPLATT_Info;
	description		= "我 找 到 了 偷 绵 羊 的 贼 。";
};

func int DIA_Akil_SCHAFDIEBEPLATT_Condition()
{
	if ((Kapitel >= 3)
	&& (MIS_Akil_SchafDiebe == LOG_RUNNING)
	&& (Npc_IsDead(BDT_1025_Bandit_H))
	&& (Npc_IsDead(BDT_1026_Bandit_H))
	&& (Npc_IsDead(BDT_1027_Bandit_H)))
	{
		return TRUE;
	};
};

func void DIA_Akil_SCHAFDIEBEPLATT_Info()
{
	AI_Output(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_00"); //我 找 到 了 偷 绵 羊 的 贼 。
	AI_Output(other, self, "DIA_Akil_SCHAFDIEBEPLATT_15_01"); //你 是 正 确 的 ， 是 那 些 森 林 洞 穴 里 的 家 伙 干 的 。 他 们 再 也 不 会 从 你 这 里 偷 绵 羊 了 。

	if ((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_02"); //谢 谢 你 ， 高 贵 的 英 诺 斯 的 仆 人 。
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_03"); //谢 谢 。 这 么 看 来 民 兵 真 的 会 关 心 我 们 这 些 小 农 民 。
	}
	else
	{
		AI_Output(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_04"); //谢 谢 。 你 真 是 一 个 奇 特 的 雇 佣 兵 。 不 像 我 所 知 道 的 其 它 人 。
	};

	AI_Output(self, other, "DIA_Akil_SCHAFDIEBEPLATT_13_05"); //拿 上 这 个 微 不 足 道 的 东 西 ， 作 为 我 对 你 无 私 帮 助 的 报 答 。

	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);
	MIS_Akil_SchafDiebe = LOG_SUCCESS;
	B_GivePlayerXP(XP_Akil_SchafDiebe);
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsSchaf
///////////////////////////////////////////////////////////////////////
instance DIA_Akil_AkilsSchaf(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 2;
	condition		= DIA_Akil_AkilsSchaf_Condition;
	information		= DIA_Akil_AkilsSchaf_Info;
	description		= "（ 归 还 阿 基 尔 的 绵 羊 ）";
};

func int DIA_Akil_AkilsSchaf_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_GetDistToNpc(self, Follow_Sheep_AKIL) < 1000)
	&& (MIS_Akil_SchafDiebe != 0))
	{
		return TRUE;
	};
};

func void DIA_Akil_AkilsSchaf_Info()
{
	// Joly: AI_Output(other, self, "DIA_Akil_AkilsSchaf_15_00"); // Ich habe die Schafdiebe gefunden.
	AI_Output(self, other, "DIA_Akil_AkilsSchaf_13_01"); //非 常 好 。 这 是 一 点 金 币 。 我 希 望 它 够 用 。

	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);

	Follow_Sheep_AKIL.aivar[AIV_PARTYMEMBER] = FALSE;
	Follow_Sheep_AKIL.wp = "NW_FARM2_OUT_02";
	Follow_Sheep_AKIL.start_aistate = ZS_MM_AllScheduler;

	B_GivePlayerXP(XP_AkilsSchaf);
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
instance DIA_Akil_KAP4_EXIT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 999;
	condition		= DIA_Akil_KAP4_EXIT_Condition;
	information		= DIA_Akil_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Akil_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP4_EXIT_Info()
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
instance DIA_Akil_KAP5_EXIT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 999;
	condition		= DIA_Akil_KAP5_EXIT_Condition;
	information		= DIA_Akil_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Akil_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP5_EXIT_Info()
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
instance DIA_Akil_KAP6_EXIT(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 999;
	condition		= DIA_Akil_KAP6_EXIT_Condition;
	information		= DIA_Akil_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Akil_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Akil_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Akil_PICKPOCKET(C_INFO)
{
	npc				= BAU_940_Akil;
	nr				= 900;
	condition		= DIA_Akil_PICKPOCKET_Condition;
	information		= DIA_Akil_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Akil_PICKPOCKET_Condition()
{
	C_Beklauen(37, 30);
};

func void DIA_Akil_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
	Info_AddChoice(DIA_Akil_PICKPOCKET, DIALOG_BACK, DIA_Akil_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Akil_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Akil_PICKPOCKET_DoIt);
};

func void DIA_Akil_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};

func void DIA_Akil_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Akil_PICKPOCKET);
};
