//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Igaranz_Kap1_EXIT(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 999;
	condition		= DIA_Igaraz_Kap1_EXIT_Condition;
	information		= DIA_Igaraz_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Igaraz_Kap1_EXIT_Condition()
{
	if (kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//**************************************************************************
//	ABSCHNITT 1 IM KLOSTER, SPIELER IST NOVIZE
//**************************************************************************

//**************************************************************************
//	Info Hello
//**************************************************************************
instance DIA_Igaranz_Hello(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_Hello_Condition;
	information		= DIA_Igaraz_Hello_Info;
	important		= TRUE;
};

func int DIA_Igaraz_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Hello_Info()
{
	if (other.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Igaranz_Hello_13_00"); //我 能 帮 你 做 什 么 ， 兄 弟 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Igaranz_Hello_13_01"); //我 能 帮 你 什 么 忙 ？
	};
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Igaraz_Wurst(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_Wurst_Condition;
	information		= DIA_Igaraz_Wurst_Info;
	description		= "我 忙 着 发 香 肠 。";
};

func int DIA_Igaraz_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Wurst_Info()
{
	AI_Output(other, self, "DIA_Igaraz_Wurst_15_00"); //我 忙 着 发 香 肠 。
	AI_Output(self, other, "DIA_Igaraz_Wurst_13_01"); //那 么 说 你 为 高 莱 克 斯 工 作 ， 嗯 ？ 好 吧 ， 那 么 给 我 香 肠 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

///////////////////////////////////////////////////////////////////////
// Wieso arbeitest Du nicht?
///////////////////////////////////////////////////////////////////////
instance DIA_Igaranz_NotWork(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 3;
	condition		= DIA_Igaraz_NotWork_Condition;
	information		= DIA_Igaraz_NotWork_Info;
	description		= "你 为 什 么 不 工 作 ？";
};

func int DIA_Igaraz_NotWork_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_NotWork_Info()
{
	AI_Output(other, self, "DIA_Igaranz_NotWork_15_00"); //你 为 什 么 不 工 作 ？
	AI_Output(self, other, "DIA_Igaranz_NotWork_13_01"); //我 已 经 得 到 许 可 研 究 英 诺 斯 的 学 说 。 我 要 在 他 的 话 语 中 寻 找 智 慧 。
	AI_Output(self, other, "DIA_Igaranz_NotWork_13_02"); //有 一 天 他 会 选 择 我 - 那 时 我 将 接 受 魔 法 测 试 并 进 入 火 之 环 。
};

///////////////////////////////////////////////////////////////////////
// Wer sind die Erwählten?
///////////////////////////////////////////////////////////////////////
instance DIA_Igaranz_Choosen(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_Choosen_Condition;
	information		= DIA_Igaraz_Choosen_Info;
	permanent		= TRUE;
	description		= "那 个 被 选 中 的 人 是 谁 ？";
};

func int DIA_Igaraz_Choosen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Igaranz_NotWork))
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Choosen_Info()
{
	AI_Output(other, self, "DIA_Igaranz_Choosen_15_00"); //那 个 被 选 中 的 人 是 谁 ？
	AI_Output(self, other, "DIA_Igaranz_Choosen_13_01"); //英 诺 斯 授 权 的 新 信 徒 将 参 加 魔 法 测 试 。
	AI_Output(self, other, "DIA_Igaranz_Choosen_13_02"); //通 过 的 人 将 被 允 许 加 入 火 魔 法 师 阶 级 。

	Info_ClearChoices(DIA_Igaranz_Choosen);
	Info_AddChoice(DIA_Igaranz_Choosen, Dialog_Back, DIA_Igaranz_Choosen_back);
	Info_AddChoice(DIA_Igaranz_Choosen, "魔 法 测 试 是 什 么 ？", DIA_Igaranz_Choosen_TestOfMagic);
	Info_AddChoice(DIA_Igaranz_Choosen, "我 怎 么 会 被 选 中 ？", DIA_Igaranz_Choosen_HowChoosen);
};

func void DIA_Igaranz_Choosen_back()
{
	Info_ClearChoices(DIA_Igaranz_Choosen);
};

func void DIA_Igaranz_Choosen_TestOfMagic()
{
	AI_Output(other, self, "DIA_Igaranz_Choosen_TestOfMagic_15_00"); //魔 法 测 试 是 什 么 ？
	AI_Output(self, other, "DIA_Igaranz_Choosen_TestOfMagic_13_01"); //一 项 由 高 级 议 会 通 知 所 有 被 选 择 的 新 信 徒 的 测 试 。
	AI_Output(self, other, "DIA_Igaranz_Choosen_TestOfMagic_13_02"); //它 是 为 那 些 忠 诚 、 聪 明 的 新 信 徒 准 备 的 测 试 。
	AI_Output(self, other, "DIA_Igaranz_Choosen_TestOfMagic_13_03"); //所 有 被 选 定 的 新 信 徒 都 参 加 - 但 是 他 们 之 中 只 能 有 一 个 人 成 功 完 成 。
};

func void DIA_Igaranz_Choosen_HowChoosen()
{
	AI_Output(other, self, "DIA_Igaranz_Choosen_HowChoosen_15_00"); //我 怎 么 会 被 选 中 ？
	AI_Output(self, other, "DIA_Igaranz_Choosen_HowChoosen_13_01"); //你 不 能 改 变 它 。 英 诺 斯 亲 自 选 择 他 的 新 信 徒 ， 高 级 议 会 负 责 宣 布 他 的 意 愿 。
};

///////////////////////////////////////////////////////////////////////
//	Erzähl mir was über Innos Lehren
///////////////////////////////////////////////////////////////////////
instance DIA_Igaranz_StudyInnos(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_StudyInnos_Condition;
	information		= DIA_Igaraz_StudyInnos_Info;
	description		= "我 怎 么 能 研 究 经 文 ？";
};

func int DIA_Igaraz_StudyInnos_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Igaranz_NotWork)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_GRASS_01") <= 500)
	&& (Parlan_Erlaubnis == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_StudyInnos_Info()
{
	AI_Output(other, self, "DIA_Igaranz_StudyInnos_15_00"); //我 怎 么 能 研 究 经 文 ？
	AI_Output(self, other, "DIA_Igaranz_StudyInnos_13_01"); //你 一 定 要 获 得 进 入 图 书 馆 的 许 可 。
	AI_Output(self, other, "DIA_Igaranz_StudyInnos_13_02"); //然 而 ， 只 有 当 你 完 成 你 的 职 责 后 ， 大 师 帕 兰 才 会 给 你 钥 匙 。
};

//**************************************************************************
//	ABSCHNITT 2 DIE PRÜFUNG DER MAGIE
//**************************************************************************
///////////////////////////////////////////////////////////////////////
//	Info CHOOSEN
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_IMTHEMAN(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_IMTHEMAN_Condition;
	information		= DIA_Igaraz_IMTHEMAN_Info;
	important		= TRUE;
};

func int DIA_Igaraz_IMTHEMAN_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_IMTHEMAN_Info()
{
	AI_Output(self, other, "DIA_Igaraz_IMTHEMAN_13_00"); //（ 自 豪 的 ） 它 发 生 了 。 英 诺 斯 已 经 选 择 了 我 ， 我 将 参 加 魔 法 测 试 。
};

///////////////////////////////////////////////////////////////////////
//	Info METOO
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_METOO(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 19;
	condition		= DIA_Igaraz_METOO_Condition;
	information		= DIA_Igaraz_METOO_Info;
	description		= "我 也 被 卷 进 来 了 … …";
};

var int DIA_Igaraz_METOO_NOPERM;

func int DIA_Igaraz_METOO_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	// && Npc_KnowsInfo(hero,DIA_Igaraz_IMTHEMAN)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_METOO_Info()
{
	AI_Output(other, self, "DIA_Igaraz_METOO_15_00"); //我 也 参 加 - 我 请 求 了 火 焰 测 试 。
	AI_Output(self, other, "DIA_Igaraz_METOO_13_01"); //你 做 了 什 么 ？ 那 样 的 话 ， 你 要 么 是 英 诺 斯 的 宠 儿 ， 要 么 就 是 彻 底 疯 了 。
	AI_Output(other, self, "DIA_Igaraz_METOO_15_02"); //我 已 经 做 过 了 很 多 疯 狂 的 事 ， 所 以 我 肯 定 这 次 也 能 赢 … …
	AI_Output(self, other, "DIA_Igaraz_METOO_13_03"); //英 诺 斯 的 手 在 保 护 着 我 - 因 为 我 将 会 通 过 这 个 测 试 。

	Info_ClearChoices(DIA_Igaraz_METOO);
	Info_AddChoice(DIA_Igaraz_METOO, DIALOG_BACK, DIA_Igaraz_METOO_BACK);
	Info_AddChoice(DIA_Igaraz_METOO, "也 许 我 们 可 以 一 起 工 作 … … ", DIA_Igaraz_METOO_HELP);
	Info_AddChoice(DIA_Igaraz_METOO, "那 么 已 经 发 现 什 么 事 了 吗 ？", DIA_Igaraz_METOO_TELL);
	Info_AddChoice(DIA_Igaraz_METOO, "你 看 到 阿 岗 或 者 尤 尔 夫 了 吗 ？", DIA_Igaraz_METOO_AGON);
};

func void DIA_Igaraz_METOO_BACK()
{
	Info_ClearChoices(DIA_Igaraz_METOO);
};

func void DIA_Igaraz_METOO_TELL()
{
	AI_Output(other, self, "DIA_Igaraz_METOO_TELL_15_00"); //那 么 发 现 了 什 么 事 吗 ？
	AI_Output(self, other, "DIA_Igaraz_METOO_TELL_13_01"); //既 然 你 根 本 毫 无 机 会 ， 我 也 许 可 以 告 诉 你 ：
	AI_Output(self, other, "DIA_Igaraz_METOO_TELL_13_02"); //不 要 费 心 去 农 场 那 里 找 - 那 里 不 会 有 任 何 对 你 有 用 的 东 西 。
};

func void DIA_Igaraz_METOO_HELP()
{
	AI_Output(other, self, "DIA_Igaraz_METOO_HELP_15_00"); //也 许 我 们 可 以 一 起 工 作 … …
	AI_Output(self, other, "DIA_Igaraz_METOO_HELP_13_01"); //算 了 吧 。 我 要 独 自 完 成 这 个 任 务 ， 你 只 会 成 为 我 的 障 碍 。
};

func void DIA_Igaraz_METOO_AGON()
{
	AI_Output(other, self, "DIA_Igaraz_METOO_AGON_15_00"); //你 看 到 阿 岗 或 者 尤 尔 夫 了 吗 ？
	AI_Output(self, other, "DIA_Igaraz_METOO_AGON_13_01"); //我 们 在 酒 馆 分 开 了 。 我 去 了 农 场 ， 那 两 个 人 一 起 走 的 - 但 是 我 不 知 道 他 们 去 了 哪 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info ADD
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_ADD(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 23;
	condition		= DIA_Igaraz_ADD_Condition;
	information		= DIA_Igaraz_ADD_Info;
	description		= "你 知 道 那 个 ‘ 活 的 岩 石 ’ 吗 ？";
};

func int DIA_Igaraz_ADD_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_TAVERNE_TROLLAREA_05") <= 3500)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (Npc_IsDead(Magic_Golem) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Igaraz_Stein) == FALSE)
	&& Npc_KnowsInfo(other, DIA_Igaraz_METOO))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_ADD_Info()
{
	AI_Output(other, self, "DIA_Igaraz_Add_15_00"); //你 知 道 那 个 ‘ 活 的 岩 石 ’ 吗 ？
	AI_Output(self, other, "DIA_Igaraz_Add_13_01"); //（ 咯 咯 地 笑 ） 不 ！ 是 瑟 朋 帝 兹 给 了 你 这 个 测 试 ？
	AI_Output(other, self, "DIA_Igaraz_Add_15_02"); //是 的 ， 怎 么 ？
	AI_Output(self, other, "DIA_Igaraz_Add_13_03"); //我 想 我 知 道 他 是 什 么 意 思 … …
	AI_Output(self, other, "DIA_Igaraz_Add_13_04"); //你 不 是 第 一 个 在 这 项 测 试 中 失 败 的 人 … …
	AI_Output(other, self, "DIA_Igaraz_Add_15_05"); //我 究 竟 在 哪 里 可 以 找 到 这 个 活 着 的 岩 石 ？
	AI_Output(self, other, "DIA_Igaraz_Add_13_06"); //只 要 继 续 沿 着 这 条 路 走 。 一 段 距 离 之 后 ， 你 就 走 到 一 条 河 边 上 。
	AI_Output(self, other, "DIA_Igaraz_Add_13_07"); //只 要 继 续 沿 路 走 到 山 顶 。 应 该 就 在 那 上 面 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Igaraz_Add_13_08"); //当 你 走 到 一 座 桥 边 上 时 ， 就 不 太 远 了 。
	AI_Output(self, other, "DIA_Igaraz_Add_13_09"); //（ 大 笑 ） 即 使 你 走 那 么 远 到 了 那 个 地 方 … …
	AI_Output(self, other, "DIA_Igaraz_Add_13_10"); //我 就 能 告 诉 你 那 么 多 了 … … （ 讽 刺 的 ） 毕 竟 那 是 你 的 ‘ 测 试 ’ ！...
};

///////////////////////////////////////////////////////////////////////
//	Info Perm Prüfung
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Pruefung(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 22;
	condition		= DIA_Igaraz_Pruefung_Condition;
	information		= DIA_Igaraz_Pruefung_Info;
	description		= "你 有 什 么 新 的 发 现 吗 ？";
};

func int DIA_Igaraz_Pruefung_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (Npc_HasItems(other, ItMi_Runeblank) < 1)
	&& (Npc_KnowsInfo(other, DIA_Igaraz_METOO)))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Pruefung_Info()
{
	AI_Output(other, self, "DIA_Igaraz_Pruefung_15_00"); //你 有 什 么 新 的 发 现 吗 ？
	AI_Output(self, other, "DIA_Igaraz_Pruefung_13_01"); //还 没 有 ， 但 是 我 还 在 找 。

	AI_StopProcessInfos(self);

	if (Igaraz_Wait == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "CONTESTWAIT");
		Igaraz_Wait = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Stein
///////////////////////////////////////////////////////////////////////
instance DIA_Igaraz_Stein(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 1;
	condition		= DIA_Igaraz_Stein_Condition;
	information		= DIA_Igaraz_Stein_Info;
	important		= TRUE;
};

func int DIA_Igaraz_Stein_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_TAVERNE_TROLLAREA_66") <= 3500)
	&& (other.guild == GIL_NOV)
	&& (Npc_HasItems(other, ItMi_Runeblank) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Stein_Info()
{
	AI_Output(self, other, "DIA_Igaraz_Seufz_13_00"); //嘿 ， 等 等 。 我 们 要 谈 谈 … …
	AI_Output(other, self, "DIA_Igaraz_Seufz_15_01"); //实 际 上 ， 我 不 这 么 认 为 … …
	AI_Output(self, other, "DIA_Igaraz_Seufz_13_02"); //这 个 测 试 我 已 经 等 了 几 年 了 。 英 诺 斯 与 我 同 在 ， 我 必 须 通 过 这 个 测 试 。

	if (Npc_KnowsInfo(other, DIA_Ulf_Abrechnung))
	{
		AI_Output(other, self, "DIA_Igaraz_Seufz_15_03"); //那 听 起 来 很 耳 熟 。
	}
	else
	{
		AI_Output(other, self, "DIA_Igaraz_Seufz_15_04"); //你 不 是 唯 一 一 个 那 么 说 的 人 。
	};

	AI_Output(self, other, "DIA_Igaraz_Seufz_13_05"); //说 的 够 多 了 。 我 需 要 你 找 到 的 东 西 。 那 么 ， 你 该 去 死 了 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 0);
};

// ################################################
// ##
// ## Kapitel 2
// ##
// ################################################

//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Igaranz_Kap2_EXIT(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 999;
	condition		= DIA_Igaraz_Kap2_EXIT_Condition;
	information		= DIA_Igaraz_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Igaraz_Kap2_EXIT_Condition()
{
	if (kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ################################################
// ##
// ## Kapitel 3
// ##
// ################################################

//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Igaranz_Kap3_EXIT(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 999;
	condition		= DIA_Igaraz_Kap3_EXIT_Condition;
	information		= DIA_Igaraz_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Igaraz_Kap3_EXIT_Condition()
{
	if (kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//**************************************************************************
//	Info TalkAboutBabo
//**************************************************************************
instance DIA_Igaranz_TalkAboutBabo(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_TalkAboutBabo_Condition;
	information		= DIA_Igaraz_TalkAboutBabo_Info;
	description		= "我 们 需 要 谈 谈 白 波 。";
};

func int DIA_Igaraz_TalkAboutBabo_Condition()
{
	if (MIS_BabosDocs == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_TalkAboutBabo_Info()
{
	AI_Output(other, self, "DIA_Igaranz_TalkAboutBabo_15_00"); //我 们 需 要 谈 谈 白 波 。
	AI_Output(self, other, "DIA_Igaranz_TalkAboutBabo_13_01"); //（ 腼 腆 的 ） 是 的 ， 怎 么 了 ？
};

//**************************************************************************
//	Du hast etwas was Babo gehört
//**************************************************************************
instance DIA_Igaranz_BabosBelongings(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_BabosBelongings_Condition;
	information		= DIA_Igaraz_BabosBelongings_Info;
	description		= "你 已 经 得 到 了 一 些 属 于 白 波 的 东 西 。";
};

func int DIA_Igaraz_BabosBelongings_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Igaranz_TalkAboutBabo))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosBelongings_Info()
{
	AI_Output(other, self, "DIA_Igaranz_BabosBelongings_15_00"); //你 已 经 得 到 了 一 些 属 于 白 波 的 东 西 。
	AI_Output(self, other, "DIA_Igaranz_BabosBelongings_13_01"); //那 会 是 什 么 ？
	AI_Output(other, self, "DIA_Igaranz_BabosBelongings_15_02"); //几 张 纸 。 白 波 想 把 它 们 拿 回 去 。
	AI_Output(self, other, "DIA_Igaranz_BabosBelongings_13_03"); //（ 嘲 弄 的 ） 他 很 想 ， 不 是 吗 。 我 能 想 象 的 到 。 不 幸 的 是 ， 我 很 想 留 着 它 们 - 把 我 们 带 入 进 退 两 难 境 地 的 东 西 。
};

//**************************************************************************
//	Wo hast du die Papiere?
//**************************************************************************
instance DIA_Igaranz_WhereDocs(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_WhereDocs_Condition;
	information		= DIA_Igaraz_WhereDocs_Info;
	description		= "你 从 哪 里 得 到 这 文 档 的 ？";
};

func int DIA_Igaraz_WhereDocs_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_WhereDocs_Info()
{
	AI_Output(other, self, "DIA_Igaranz_WhereDocs_15_00"); //你 从 哪 里 得 到 这 文 档 的 ？
	AI_Output(self, other, "DIA_Igaranz_WhereDocs_13_01"); //（ 洋 洋 自 得 ） 嗯 ， 当 然 我 不 想 把 它 们 留 在 身 上 。 恐 怕 我 不 能 继 续 帮 助 你 。
	AI_Output(other, self, "DIA_Igaranz_WhereDocs_15_02"); //那 它 们 在 哪 里 ？
	AI_Output(self, other, "DIA_Igaranz_WhereDocs_13_03"); //我 已 经 把 它 们 锁 在 安 全 的 地 方 了 。 而 你 永 远 别 想 从 我 这 里 拿 到 钥 匙 。
};

//**************************************************************************
//	Was soll Babo für dich tun?
//**************************************************************************
instance DIA_Igaranz_BabosJob(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_BabosJob_Condition;
	information		= DIA_Igaraz_BabosJob_Info;
	description		= "白 波 原 本 要 为 你 做 什 么 ？";
};

func int DIA_Igaraz_BabosJob_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BabosJob_Info()
{
	AI_Output(other, self, "DIA_Igaranz_BabosJob_15_00"); //白 波 原 本 要 为 你 做 什 么 ？
	AI_Output(self, other, "DIA_Igaranz_BabosJob_13_01"); //如 果 我 早 知 道 那 个 家 伙 一 直 想 种 沼 生 草 的 话 ， 那 我 一 定 会 让 别 人 来 照 管 修 道 院 的 花 园 。
	AI_Output(other, self, "DIA_Igaranz_BabosJob_15_02"); //他 想 要 种 植 沼 生 草 ？
	AI_Output(self, other, "DIA_Igaranz_BabosJob_13_03"); //当 然 。 自 从 那 东 西 不 再 从 屏 障 后 面 流 出 之 后 ， 城 里 的 价 格 已 经 长 了 三 倍 。
	AI_Output(self, other, "DIA_Igaranz_BabosJob_13_04"); //那 对 每 个 人 来 说 都 是 一 个 赚 钱 的 生 意 。 但 是 白 波 不 想 合 作 。
};

//**************************************************************************
//	Wieviel willst du für die Papiere haben?
//**************************************************************************
instance DIA_Igaranz_Price(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_Price_Condition;
	information		= DIA_Igaraz_Price_Info;
	description		= "这 些 档 案 你 出 多 少 钱 ？";
};

func int DIA_Igaraz_Price_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Igaranz_BabosBelongings))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Price_Info()
{
	AI_Output(other, self, "DIA_Igaranz_Price_15_00"); //这 些 档 案 你 出 多 少 钱 ？
	AI_Output(self, other, "DIA_Igaranz_Price_13_01"); //（ 大 笑 ） 哈 ， 实 际 上 它 们 是 无 价 的 。 在 这 里 你 几 乎 看 不 到 那 样 的 东 西 。
	AI_Output(self, other, "DIA_Igaranz_Price_13_02"); //但 是 我 不 想 让 我 的 未 来 和 金 币 做 对 。
	AI_Output(self, other, "DIA_Igaranz_Price_13_03"); //300枚 金 币 ， 然 后 你 可 以 随 便 拿 那 些 纸 去 做 什 么 。
};

//**************************************************************************
//	Ich will die Papiere kaufen.
//**************************************************************************
instance DIA_Igaranz_BuyIt(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 31;
	condition		= DIA_Igaraz_BuyIt_Condition;
	information		= DIA_Igaraz_BuyIt_Info;
	description		= "我 想 要 买 那 些 档 案 。";
};

func int DIA_Igaraz_BuyIt_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Igaranz_Price))
	&& (Npc_HasItems(other, ItMi_Gold) >= 300))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_BuyIt_Info()
{
	AI_Output(other, self, "DIA_Igaranz_BuyIt_15_00"); //我 想 要 买 那 些 档 案 。
	AI_Output(self, other, "DIA_Igaranz_BuyIt_13_01"); //看 ， 我 不 能 马 上 离 开 这 里 。 我 会 把 我 的 箱 子 钥 匙 给 你 ， 不 管 怎 么 说 ， 那 里 没 有 其 它 的 东 西 。

	B_GiveInvItems(other, self, ItMi_Gold, 300);
	B_GiveInvItems(self, other, ItKe_IgarazChest_mis, 1);
};

//****************************************************
//	Taschendiebstahl
//***************************************************
instance DIA_Igaraz_PICKPOCKET(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 900;
	condition		= DIA_Igaraz_PICKPOCKET_Condition;
	information		= DIA_Igaraz_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Igaraz_PICKPOCKET_Condition()
{
	if ((MIS_BaBosDocs == LOG_RUNNING)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_IgarazChest_mis) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (40 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
	Info_AddChoice(DIA_Igaraz_PICKPOCKET, DIALOG_BACK, DIA_Igaraz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Igaraz_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Igaraz_PICKPOCKET_DoIt);
};

func void DIA_Igaraz_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 40)
	{
		B_GiveInvItems(self, other, ItKe_IgarazChest_mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // AR_Theft führt zu NEWS!
	};
};

func void DIA_Igaraz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Igaraz_PICKPOCKET);
};

// ################################################
// ##
// ## Kapitel 4
// ##
// ################################################

//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Igaranz_Kap4_EXIT(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 999;
	condition		= DIA_Igaraz_Kap4_EXIT_Condition;
	information		= DIA_Igaraz_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Igaraz_Kap4_EXIT_Condition()
{
	if (kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ################################################
// ##
// ## Kapitel 5
// ##
// ################################################

//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Igaranz_Kap5_EXIT(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 999;
	condition		= DIA_Igaraz_Kap5_EXIT_Condition;
	information		= DIA_Igaraz_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Igaraz_Kap5_EXIT_Condition()
{
	if (kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//**************************************************************************
//	Info Perm
//**************************************************************************
instance DIA_Igaranz_Perm(C_INFO)
{
	npc				= Nov_601_Igaraz;
	nr				= 2;
	condition		= DIA_Igaraz_Perm_Condition;
	information		= DIA_Igaraz_Perm_Info;
	description		= "你 有 什 么 能 让 我 感 兴 趣 的 东 西 吗 ？";
};

func int DIA_Igaraz_Perm_Condition()
{
	if ((Kapitel >= 3)
	&& (other.guild != GIL_KDF)
	&& (MIS_BabosDocs != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Igaraz_Perm_Info()
{
	AI_Output(other, self, "DIA_Igaranz_Perm_15_00"); //你 有 什 么 能 让 我 感 兴 趣 的 东 西 吗 ？
	AI_Output(self, other, "DIA_Igaranz_Perm_13_01"); //呃 … … 不 。

	AI_StopProcessInfos(self);
};
