// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_NOV_3_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_NOV_3_EXIT_Condition;
	information		= DIA_NOV_3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_NOV_3_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 		Fegen
// *************************************************************************
instance DIA_NOV_3_Fegen(C_INFO)
{
	nr				= 2;
	condition		= DIA_NOV_3_Fegen_Condition;
	information		= DIA_NOV_3_Fegen_Info;
	permanent		= TRUE;
	description		= "我 需 要 帮 手 来 打 扫 学 徒 的 房 间 。";
};

// ------------------------------------
var int Feger1_Permanent;
var int Feger2_Permanent;
// ------------------------------------
func int DIA_NOV_3_Fegen_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_KlosterArbeit == LOG_RUNNING)
	&& (NOV_Helfer < 4))
	{
		return TRUE;
	};
};

func void DIA_NOV_3_Fegen_Info()
{
	AI_Output(other, self, "DIA_NOV_3_Fegen_15_00"); //我 需 要 帮 手 来 打 扫 学 徒 的 房 间 。

	// ---------------------------Novize 615 im Keller-----------------------------------------------------------------
	if (Hlp_GetInstanceID(Feger1) == Hlp_GetInstanceID(self))
	{
		if ((NOV_Helfer < 1)
		&& (Feger1_Permanent == FALSE))
		{
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_01"); //到 现 在 为 止 还 没 有 人 帮 助 你 ， 嗯 ？ 我 可 以 帮 助 你 ， 不 过 你 至 少 需 要 再 找 到 一 个 愿 意 加 入 的 人 。

			B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_4);
		}
		else if ((NOV_Helfer >= 1)
		&& (Feger1_Permanent == FALSE))
		{
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_02"); //我 是 唯 一 一 个 能 帮 助 你 的 吗 ？
			AI_Output(other, self, "DIA_NOV_3_Fegen_15_03"); //不 ， 我 已 经 找 到 了 一 些 帮 手 。
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_04"); //那 么 我 加 入 。
			NOV_Helfer = (NOV_Helfer + 1);
			Feger1_Permanent = TRUE;
			B_GivePlayerXP(XP_Feger);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "FEGEN");

			B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_5);
		}
		else if (Feger1_Permanent == TRUE)
		{
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_05"); //嘿 ， 兄 弟 - 我 已 经 在 帮 助 你 了 。 你 不 用 再 提 这 事 了 。
		};
	};

	// ----------------------------Novize 611 steht draussen rum ----------------------------------------------------------------

	if (Hlp_GetInstanceID(Feger2) == Hlp_GetInstanceID(self))
	{
		if (Feger2_Permanent == FALSE)
		{
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_08"); //当 然 ， 我 愿 意 帮 忙 。 我 们 这 些 新 信 徒 必 须 团 结 友 爱 ， 有 来 有 往 。
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_09"); //我 只 需 要50金 币 ， 因 为 我 还 要 拿 去 还 给 帕 兰 。

			B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_6);

			Info_ClearChoices(DIA_NOV_3_Fegen);
			Info_AddChoice(DIA_NOV_3_Fegen, "以 后 再 说 吧 … …", DIA_NOV_3_Fegen_Nein);

			if (Npc_HasItems(other, ItMi_Gold) >= 50)
			{
				Info_AddChoice(DIA_NOV_3_Fegen, "好 吧 。 我 愿 意 付 钱 。", DIA_NOV_3_Fegen_Ja);
			};
		}
		else // if(Feger2_Permanent == TRUE)
		{
			AI_Output(self, other, "DIA_NOV_3_Fegen_03_06"); //但 是 我 已 经 承 诺 过 。 你 帮 助 我 ， 我 也 帮 助 你 。
		};
	};

	// ------------------------------------ alle anderen Novizen mit Stimme 3 --------------------------------------------------------

	if ((Hlp_GetInstanceID(Feger1) != Hlp_GetInstanceID(self))
	&& (Hlp_GetInstanceID(Feger2) != Hlp_GetInstanceID(self)))
	{
		AI_Output(self, other, "DIA_NOV_3_Fegen_03_07"); //算 了 吧 - 我 没 有 时 间 。 找 其 它 人 帮 你 吧 。
	};
};

func void DIA_NOV_3_Fegen_Nein()
{
	AI_Output(other, self, "DIA_NOV_3_Fegen_Nein_15_00"); //以 后 再 说 吧 。 现 在 ， 我 付 不 起 。
	Info_ClearChoices(DIA_NOV_3_Fegen);
};

func void DIA_NOV_3_Fegen_Ja()
{
	AI_Output(other, self, "DIA_NOV_3_Fegen_Ja_15_00"); //好 吧 。 我 愿 意 付 钱 。
	AI_Output(self, other, "DIA_NOV_3_Fegen_Ja_03_01"); //好 ， 那 我 要 开 始 了 。

	B_GiveInvItems(other, self, ItMi_Gold, 50);
	NOV_Helfer = (NOV_Helfer + 1);
	B_GivePlayerXP(XP_Feger);
	Feger2_Permanent = TRUE;
	Info_ClearChoices(DIA_NOV_3_Fegen);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FEGEN");

	B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_8);
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_NOV_3_Wurst(C_INFO)
{
	nr				= 3;
	condition		= DIA_NOV_3_Wurst_Condition;
	information		= DIA_NOV_3_Wurst_Info;
	permanent		= TRUE;
	description		= "你 要 香 肠 吗 ？";
};

func int DIA_NOV_3_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NOV_3_Wurst_Info()
{
	AI_Output(other, self, "DIA_NOV_3_Wurst_15_00"); //你 要 香 肠 吗 ？
	AI_Output(self, other, "DIA_NOV_3_Wurst_03_01"); //当 然 ， 我 要 一 根 。 象 这 样 的 香 肠 ， 值 得 考 虑 。

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

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_NOV_3_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_NOV_3_JOIN_Condition;
	information		= DIA_NOV_3_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 成 为 一 名 法 师 ！";
};

func int DIA_NOV_3_JOIN_Condition()
{
	if (hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_NOV_3_JOIN_Info()
{
	AI_Output(other, self, "DIA_NOV_3_JOIN_15_00"); //我 要 成 为 一 名 法 师 ！
	AI_Output(self, other, "DIA_NOV_3_JOIN_03_01"); //那 是 很 多 新 信 徒 都 希 望 的 。 但 是 只 有 极 少 人 能 被 选 中 ， 并 加 入 火 之 环 。
	AI_Output(self, other, "DIA_NOV_3_JOIN_03_02"); //成 为 火 之 环 的 魔 法 师 是 最 高 荣 誉 ， 并 能 让 你 进 入 我 们 的 修 道 会 。
	AI_Output(self, other, "DIA_NOV_3_JOIN_03_03"); //你 必 须 要 努 力 工 作 ， 才 能 得 到 你 的 机 会 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_NOV_3_PEOPLE(C_INFO)
{
	nr				= 5;
	condition		= DIA_NOV_3_PEOPLE_Condition;
	information		= DIA_NOV_3_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 座 修 道 院 的 领 导 人 ？";
};

func int DIA_NOV_3_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_NOV_3_PEOPLE_15_00"); //谁 是 这 座 修 道 院 的 领 导 人 ？
	AI_Output(self, other, "DIA_NOV_3_PEOPLE_03_01"); //我 们 这 些 新 信 徒 为 火 之 环 的 魔 法 师 服 务 。 他 们 由 高 级 议 会 领 导 ， 那 是 由 三 名 最 强 大 的 魔 法 师 组 成 的 。
	AI_Output(self, other, "DIA_NOV_3_PEOPLE_03_02"); //不 过 帕 兰 负 责 所 有 新 信 徒 的 相 关 事 宜 。 他 常 常 在 庭 院 里 监 视 新 信 徒 们 工 作 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_NOV_3_LOCATION(C_INFO)
{
	nr				= 6;
	condition		= DIA_NOV_3_LOCATION_Condition;
	information		= DIA_NOV_3_LOCATION_Info;
	permanent		= TRUE;
	description		= "你 能 跟 我 说 说 这 座 修 道 院 吗 ？";
};

func int DIA_NOV_3_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_LOCATION_Info()
{
	AI_Output(other, self, "DIA_NOV_3_LOCATION_15_00"); //你 能 跟 我 说 说 这 座 修 道 院 吗 ？
	AI_Output(self, other, "DIA_NOV_3_LOCATION_03_01"); //我 们 在 这 里 自 己 自 足 。 我 们 饲 养 绵 羊 ， 酿 造 葡 萄 酒 。
	AI_Output(self, other, "DIA_NOV_3_LOCATION_03_02"); //我 们 在 这 里 自 己 自 足 。 我 们 饲 养 绵 羊 ， 酿 造 葡 萄 酒 。
	AI_Output(self, other, "DIA_NOV_3_LOCATION_03_03"); //我 们 其 它 新 信 徒 主 要 照 看 那 些 火 之 环 的 魔 法 师 不 需 要 的 东 西 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_NOV_3_STANDARD(C_INFO)
{
	nr				= 10;
	condition		= DIA_NOV_3_STANDARD_Condition;
	information		= DIA_NOV_3_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_NOV_3_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_NOV_3_STANDARD_Info()
{
	AI_Output(other, self, "DIA_NOV_3_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_01"); //问 你 是 最 好 的 。 你 是 新 信 徒 之 间 唯 一 被 谈 论 的 人 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_02"); //象 你 这 样 的 新 来 者 ， 刚 来 就 被 火 之 环 选 中 ， 实 在 是 少 见 。
		}
		else
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_03"); //时 间 再 次 来 到 。 新 信 徒 中 的 一 个 将 被 接 受 加 入 火 之 环 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_04"); //测 试 很 快 就 会 开 始 。
		};
	};

	if ((Kapitel == 2)
	|| (Kapitel == 3))
	{
		if ((Pedro_Traitor == TRUE)
		&& (MIS_NovizenChase != LOG_SUCCESS)) // Kap 3b - SC weiss, das Pedro das Auge Innos geklaut hat
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_05"); //我 们 的 修 道 会 遭 到 了 贝 利 尔 的 触 碰 ！ 如 果 邪 恶 能 在 这 里 找 到 同 盟 ， 那 么 他 一 定 非 常 强 大 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_06"); //比 德 罗 已 经 来 这 个 修 道 院 几 年 了 。 我 相 信 他 在 这 些 高 墙 外 面 待 的 时 间 太 长 ， 因 此 他 的 信 仰 被 消 弱 了 ， 所 以 他 更 容 易 受 到 贝 利 尔 的 引 诱 。
		}
		else if (MIS_NovizenChase == LOG_SUCCESS) // Kap 3c - Das Auge Innos ist wieder da
		{
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_07"); //你 来 的 恰 逢 其 时 。 英 诺 斯 自 己 也 挑 不 出 更 好 的 让 你 出 现 的 时 刻 了 。
			AI_Output(self, other, "DIA_NOV_3_STANDARD_03_08"); //你 将 作 为 ‘ 眼 睛 ’ 的 拯 救 者 被 记 录 到 我 们 修 道 院 的 编 年 史 中 。
		}
		else // Kap 2 - 3a
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_NOV_3_STANDARD_03_09"); //来 自 矿 藏 山 谷 的 消 息 引 起 了 恐 慌 。 我 相 信 英 诺 斯 正 要 让 我 们 接 受 一 个 严 酷 的 考 验 。
			}
			else
			{
				AI_Output(self, other, "DIA_NOV_3_STANDARD_03_10"); //据 说 向 矿 藏 山 谷 进 发 的 圣 骑 士 们 没 有 任 何 消 息 。 高 级 议 会 将 会 清 楚 地 了 解 所 发 生 的 事 情 。
			};
		};
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_NOV_3_STANDARD_03_11"); //他 们 说 我 们 应 该 在 勋 爵 的 帮 助 下 消 灭 那 些 龙 。 伊 诺 斯 的 愤 怒 将 会 毁 灭 贝 利 尔 的 生 物 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_NOV_3_STANDARD_03_12"); //感 谢 英 诺 斯 ， 没 有 新 的 危 机 了 。 我 们 必 须 回 到 我 们 的 神 的 道 路 上 来 ， 因 为 只 有 他 的 帮 助 才 能 让 我 们 面 对 邪 恶 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_NOV_3(var C_Npc slf)
{
	DIA_NOV_3_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_STANDARD.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Fegen.npc = Hlp_GetInstanceID(slf);
	DIA_NOV_3_Wurst.npc = Hlp_GetInstanceID(slf);
};
