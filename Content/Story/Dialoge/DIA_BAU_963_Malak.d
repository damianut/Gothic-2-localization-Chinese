///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_EXIT(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 999;
	condition		= DIA_Malak_EXIT_Condition;
	information		= DIA_Malak_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Malak_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_HALLO(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 3;
	condition		= DIA_Malak_HALLO_Condition;
	information		= DIA_Malak_HALLO_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Malak_HALLO_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_HALLO_Info()
{
	AI_Output(other, self, "DIA_Malak_HALLO_15_00"); //一 切 都 好 吗 ？

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Malak_HALLO_08_01"); //又 一 个 不 知 道 要 去 哪 里 的 临 时 工 ？ 没 问 题 。 去 找 我 们 的 农 场 主 本 加 谈 谈 。
	}
	else
	{
		AI_Output(self, other, "DIA_Malak_HALLO_08_02"); //好 的 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WASMACHSTDU(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 4;
	condition		= DIA_Malak_WASMACHSTDU_Condition;
	information		= DIA_Malak_WASMACHSTDU_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Malak_WASMACHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Malak_WASMACHSTDU_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Malak_WASMACHSTDU_08_01"); //我 是 这 里 的 牧 羊 人 。 这 不 是 什 么 费 力 的 工 作 。
	AI_Output(self, other, "DIA_Malak_WASMACHSTDU_08_02"); //不 过 偶 尔 呢 ， 你 必 须 要 非 常 留 神 。 尤 其 是 在 你 靠 近 关 卡 的 时 候 。
};

///////////////////////////////////////////////////////////////////////
//	Info pass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PASS(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 5;
	condition		= DIA_Malak_PASS_Condition;
	information		= DIA_Malak_PASS_Info;
	description		= "关 于 关 卡 你 都 知 道 什 么 ？";
};

func int DIA_Malak_PASS_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PASS_Info()
{
	AI_Output(other, self, "DIA_Malak_PASS_15_00"); //关 于 关 卡 你 都 知 道 什 么 ？
	AI_Output(self, other, "DIA_Malak_PASS_08_01"); //不 多 。 它 通 向 旧 矿 藏 山 谷 ， 直 到 几 周 前 ， 它 还 被 屏 障 笼 罩 着 。
	AI_Output(self, other, "DIA_Malak_PASS_08_02"); //那 时 ， 我 们 农 民 唯 一 要 担 心 的 事 情 就 是 每 月 带 着 各 种 货 物 进 入 矿 藏 山 谷 的 商 队 。
	AI_Output(self, other, "DIA_Malak_PASS_08_03"); //那 些 杀 人 犯 常 常 让 我 们 这 里 的 生 活 变 得 更 加 艰 难 。
};

///////////////////////////////////////////////////////////////////////
//	Info wopass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WOPASS(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 6;
	condition		= DIA_Malak_WOPASS_Condition;
	information		= DIA_Malak_WOPASS_Info;
	description		= "我 在 哪 里 可 以 找 到 通 向 旧 矿 藏 山 谷 的 路 ？";
};

func int DIA_Malak_WOPASS_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WOPASS_Info()
{
	AI_Output(other, self, "DIA_Malak_WOPASS_15_00"); //我 在 哪 里 可 以 找 到 通 向 旧 矿 藏 山 谷 的 路 ？
	AI_Output(self, other, "DIA_Malak_WOPASS_08_01"); //在 高 原 牧 场 另 一 边 的 两 道 瀑 布 附 近 。
};

///////////////////////////////////////////////////////////////////////
//	Info minental
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_MINENTAL(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 7;
	condition		= DIA_Malak_MINENTAL_Condition;
	information		= DIA_Malak_MINENTAL_Info;
	description		= "他 们 说 的 矿 藏 山 谷 是 什 么 ？";
};

func int DIA_Malak_MINENTAL_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_PASS))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_MINENTAL_Info()
{
	AI_Output(other, self, "DIA_Malak_MINENTAL_15_00"); //他 们 说 的 矿 藏 山 谷 是 什 么 ？
	AI_Output(self, other, "DIA_Malak_MINENTAL_08_01"); //各 种 各 样 的 东 西 。 有 人 说 他 们 在 夜 里 听 到 尖 叫 声 ， 有 人 看 到 在 山 上 有 奇 怪 的 光 线 。
	AI_Output(self, other, "DIA_Malak_MINENTAL_08_02"); //不 过 要 我 说 呢 ， 这 些 都 是 无 稽 之 谈 。
};

///////////////////////////////////////////////////////////////////////
//	Info warstduschonda
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_WARSTDUSCHONDA(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 8;
	condition		= DIA_Malak_WARSTDUSCHONDA_Condition;
	information		= DIA_Malak_WARSTDUSCHONDA_Info;
	description		= "你 曾 经 去 过 矿 藏 山 谷 ？";
};

func int DIA_Malak_WARSTDUSCHONDA_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_PASS))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_WARSTDUSCHONDA_Info()
{
	AI_Output(other, self, "DIA_Malak_WARSTDUSCHONDA_15_00"); //你 曾 经 去 过 矿 藏 山 谷 ？
	AI_Output(self, other, "DIA_Malak_WARSTDUSCHONDA_08_01"); //不 。 但 是 我 偶 尔 到 过 关 卡 附 近 。 然 后 我 总 是 看 到 那 两 个 站 在 那 里 的 圣 骑 士 在 放 哨 。
	AI_Output(self, other, "DIA_Malak_WARSTDUSCHONDA_08_02"); //看 起 来 好 像 他 们 要 阻 止 什 么 东 西 离 开 山 谷 。
	AI_Output(self, other, "DIA_Malak_WARSTDUSCHONDA_08_03"); //以 前 矿 藏 山 谷 是 一 座 天 然 监 狱 。 如 果 你 进 去 了 ， 就 再 也 出 不 来 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PALADINE(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 9;
	condition		= DIA_Malak_PALADINE_Condition;
	information		= DIA_Malak_PALADINE_Info;
	description		= "多 告 诉 我 一 些 关 于 圣 骑 士 的 事 。 他 们 在 那 里 驻 扎 多 久 了 ？。";
};

func int DIA_Malak_PALADINE_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
	&& (Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
	&& (Kapitel < 3)
	)
	{
		return TRUE;
	};
};

func void DIA_Malak_PALADINE_Info()
{
	AI_Output(other, self, "DIA_Malak_PALADINE_15_00"); //多 告 诉 我 一 些 关 于 圣 骑 士 的 事 。 他 们 在 那 里 驻 扎 多 久 了 ？
	AI_Output(self, other, "DIA_Malak_PALADINE_08_01"); //我 想 是 一 两 周 前 。 我 也 不 是 很 清 楚 。
	AI_Output(self, other, "DIA_Malak_PALADINE_08_02"); //一 段 时 间 前 ， 他 们 甚 至 派 了 一 支 部 队 进 入 了 关 卡 。 从 那 时 起 ， 我 就 再 也 没 有 见 过 他 们 。
};

///////////////////////////////////////////////////////////////////////
//	Info keineFrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_KEINEFRAUEN(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 10;
	condition		= DIA_Malak_KEINEFRAUEN_Condition;
	information		= DIA_Malak_KEINEFRAUEN_Info;
	description		= "我 在 这 里 根 本 见 不 到 一 个 女 人 。";
};

func int DIA_Malak_KEINEFRAUEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_KEINEFRAUEN_Info()
{
	AI_Output(other, self, "DIA_Malak_KEINEFRAUEN_15_00"); //我 在 这 里 根 本 见 不 到 一 个 女 人 。
	AI_Output(self, other, "DIA_Malak_KEINEFRAUEN_08_01"); //你 让 那 里 恢 复 了 正 常 。 可 以 说 这 是 人 们 的 农 场 。 干 得 好 ， 我 认 为 。
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMKAP1(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 11;
	condition		= DIA_Malak_PERMKAP1_Condition;
	information		= DIA_Malak_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "不 要 工 作 得 太 辛 苦 。";
};

func int DIA_Malak_PERMKAP1_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Malak_HALLO))
	&& (Npc_KnowsInfo(other, DIA_Malak_WASMACHSTDU))
	&& (Npc_KnowsInfo(other, DIA_Malak_PASS))
	&& (Npc_KnowsInfo(other, DIA_Malak_MINENTAL))
	&& (Npc_KnowsInfo(other, DIA_Malak_WARSTDUSCHONDA))
	&& (Npc_KnowsInfo(other, DIA_Malak_PALADINE))
	&& (Npc_KnowsInfo(other, DIA_Malak_KEINEFRAUEN))
	&& (Kapitel < 3)
	)
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Malak_PERMKAP1_15_00"); //不 要 工 作 得 太 辛 苦 。
	AI_Output(self, other, "DIA_Malak_PERMKAP1_08_01"); //我 会 试 一 下 。

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
instance DIA_Malak_KAP3_EXIT(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 999;
	condition		= DIA_Malak_KAP3_EXIT_Condition;
	information		= DIA_Malak_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Malak_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info fleefromPass
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_FLEEFROMPASS(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 30;
	condition		= DIA_Malak_FLEEFROMPASS_Condition;
	information		= DIA_Malak_FLEEFROMPASS_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Malak_FLEEFROMPASS_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info()
{
	if ((NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Malak_FLEEFROMPASS_15_00"); //你 在 这 里 做 什 么 ？
		AI_Output(self, other, "DIA_Malak_FLEEFROMPASS_08_01"); //我 从 本 加 的 农 场 逃 到 这 里 。 我 不 想 被 那 些 从 关 卡 出 来 的 生 物 屠 杀 。
		AI_Output(self, other, "DIA_Malak_FLEEFROMPASS_08_02"); //你 想 象 不 出 前 些 日 子 从 关 卡 里 跑 出 来 了 一 些 什 么 样 的 东 西 。
		AI_Output(other, self, "DIA_Malak_FLEEFROMPASS_15_03"); //我 能 。
		B_LogEntry(TOPIC_BengarALLEIN, TOPIC_BengarALLEIN_3);
		B_GivePlayerXP(XP_FoundMalakFLEEFROMPASS);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_Heilung(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 55;
	condition		= DIA_Malak_Heilung_Condition;
	information		= DIA_Malak_Heilung_Info;
	permanent		= TRUE;
	description		= "你 需 要 帮 助。";
};

func int DIA_Malak_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Malak == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

var int DIA_Malak_Heilung_oneTime;
func void DIA_Malak_Heilung_Info()
{
	AI_Output(other, self, "DIA_Malak_Heilung_15_00"); //你 需 要 帮 助。

	if (DIA_Malak_Heilung_oneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Malak_Heilung_08_01"); //（ 眼 泪 汪 汪 ） 我 只 想 回 家 。 我 要 回 本 加 那 里 去 。 我 希 望 他 还 活 着 。

		B_NpcClearObsessionByDMT(self);
		Npc_ExchangeRoutine(self, "Start");
		B_StartOtherRoutine(BAU_962_Bauer, "Start");
		B_StartOtherRoutine(BAU_964_Bauer, "Start");
		B_StartOtherRoutine(BAU_965_Bauer, "Start");
		B_StartOtherRoutine(BAU_966_Bauer, "Start");
		B_StartOtherRoutine(BAU_967_Bauer, "Start");
		B_StartOtherRoutine(BAU_968_Bauer, "Start");
		B_StartOtherRoutine(BAU_969_Bauer, "Start");

		DIA_Malak_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Malak_Heilung_08_02"); //走 开 ， 魔 法 师 。 我 能 应 付 。
		B_NpcClearObsessionByDMT(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info permcastle
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_PERMCASTLE(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 31;
	condition		= DIA_Malak_PERMCASTLE_Condition;
	information		= DIA_Malak_PERMCASTLE_Info;
	permanent		= TRUE;
	description		= "这 里 怎 么 样 ？";
};

func int DIA_Malak_PERMCASTLE_Condition()
{
	if ((Npc_GetDistToWP(self, "CASTLEMINE") < 4000)
	&& (MIS_GetMalakBack != LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& (NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMCASTLE_Info()
{
	AI_Output(other, self, "DIA_Malak_PERMCASTLE_15_00"); //这 里 怎 么 样 ？
	AI_Output(self, other, "DIA_Malak_PERMCASTLE_08_01"); //我 在 这 里 只 要 忍 受 那 些 强 盗 就 行 了 ， 他 们 的 危 害 还 要 小 一 些 。
};

///////////////////////////////////////////////////////////////////////
//	Info BacktoBengar
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACKTOBENGAR(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 31;
	condition		= DIA_Malak_BACKTOBENGAR_Condition;
	information		= DIA_Malak_BACKTOBENGAR_Info;
	permanent		= TRUE;
	description		= "本 加 需 要 你 。 他 要 你 回 到 他 的 农 场 去 。";
};

func int DIA_Malak_BACKTOBENGAR_Condition()
{
	if ((MIS_GetMalakBack == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Malak_FLEEFROMPASS))
	&& ((Npc_IsDead(Bengar)) == FALSE)
	&& (NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACKTOBENGAR_Info()
{
	AI_Output(other, self, "DIA_Malak_BACKTOBENGAR_15_00"); //本 加 需 要 你 。 他 要 你 回 到 他 的 农 场 去 。
	AI_Output(self, other, "DIA_Malak_BACKTOBENGAR_08_01"); //我 没 有 疯 。 只 要 我 们 还 得 住 在 那 个 毫 无 防 护 的 农 场 里 ， 我 决 不 会 从 这 里 移 动 半 步 ！

	B_LogEntry(TOPIC_BengarALLEIN, TOPIC_BengarALLEIN_4);

	if (MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Malak_BACKTOBENGAR_15_02"); //我 已 经 雇 了 一 个 雇 佣 兵 。 他 会 照 看 农 场 的 。
		AI_Output(self, other, "DIA_Malak_BACKTOBENGAR_08_03"); //那 当 然 完 全 不 同 了 。 但 是 等 一 下 。 那 谁 付 那 个 家 伙 钱 ？
		AI_Output(other, self, "DIA_Malak_BACKTOBENGAR_15_04"); //那 是 我 的 问 题 。
		AI_Output(self, other, "DIA_Malak_BACKTOBENGAR_08_05"); //（ 好 奇 的 ） 呃 。 没 有 机 会 说 不 ， 嗯 ？

		Info_AddChoice(DIA_Malak_BACKTOBENGAR, "不 。", DIA_Malak_BACKTOBENGAR_los);
	};
};

func void DIA_Malak_BACKTOBENGAR_los()
{
	AI_Output(other, self, "DIA_Malak_BACKTOBENGAR_los_15_00"); //不 。
	AI_Output(self, other, "DIA_Malak_BACKTOBENGAR_los_08_01"); //好 。 那 我 回 去 。 我 希 望 那 个 家 伙 能 担 当 一 些 事 。
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self, "Start");
	B_StartOtherRoutine(BAU_962_Bauer, "Start");
	B_StartOtherRoutine(BAU_964_Bauer, "Start");
	B_StartOtherRoutine(BAU_965_Bauer, "Start");
	B_StartOtherRoutine(BAU_966_Bauer, "Start");
	B_StartOtherRoutine(BAU_967_Bauer, "Start");
	B_StartOtherRoutine(BAU_968_Bauer, "Start");
	B_StartOtherRoutine(BAU_969_Bauer, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Back
///////////////////////////////////////////////////////////////////////
instance DIA_Malak_BACK(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 32;
	condition		= DIA_Malak_BACK_Condition;
	information		= DIA_Malak_BACK_Info;
	permanent		= TRUE;
	description		= "你 现 在 愿 意 留 在 本 加 的 农 场 吗？";
};

func int DIA_Malak_BACK_Condition()
{
	if ((MIS_GetMalakBack == LOG_SUCCESS)
	&& (NpcObsessedByDMT_Malak == FALSE)
	&& (hero.guild != GIL_KDF)
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Malak_BACK_Info()
{
	AI_Output(other, self, "DIA_Malak_BACK_15_00"); //你 现 在 愿 意 留 在 本 加 的 农 场 吗 ？
	AI_Output(self, other, "DIA_Malak_BACK_08_01"); //当 然 。 我 必 须 要 度 过 现 在 这 个 难 关 。 我 们 会 设 法 解 决 的 。
	B_NpcClearObsessionByDMT(self);
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
instance DIA_Malak_KAP4_EXIT(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 999;
	condition		= DIA_Malak_KAP4_EXIT_Condition;
	information		= DIA_Malak_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Malak_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
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
instance DIA_Malak_KAP5_EXIT(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 999;
	condition		= DIA_Malak_KAP5_EXIT_Condition;
	information		= DIA_Malak_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Malak_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
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
instance DIA_Malak_KAP6_EXIT(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 999;
	condition		= DIA_Malak_KAP6_EXIT_Condition;
	information		= DIA_Malak_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Malak_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Malak_PICKPOCKET(C_INFO)
{
	npc				= BAU_963_Malak;
	nr				= 900;
	condition		= DIA_Malak_PICKPOCKET_Condition;
	information		= DIA_Malak_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Malak_PICKPOCKET_Condition()
{
	C_Beklauen(43, 40);
};

func void DIA_Malak_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
	Info_AddChoice(DIA_Malak_PICKPOCKET, DIALOG_BACK, DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Malak_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};
