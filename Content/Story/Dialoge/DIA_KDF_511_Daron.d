func void B_DaronSegen()
{
	Daron_Segen = TRUE;

	var string concatText;

	var int Bonus_1;
	var int Bonus_2;
	var int Bonus_3;

	if (Daron_Spende < 100)
	{
		if (other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute [ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FullyHealed, - 1, - 1, FONT_Screen, 2);
		};
	}
	else if ((Daron_Spende < 250)
	&& (Bonus_1 == FALSE))
	{
		B_RaiseAttribute(other, ATR_MANA_MAX, 2);

		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];

		Bonus_1 = TRUE;
	}
	else if ((Daron_Spende < 500)
	&& (Bonus_2 == FALSE))
	{
		B_GivePlayerXP(XP_Ambient);
		Bonus_2 = TRUE;
	}
	else if ((Daron_Spende >= 750)
	&& (Daron_Spende < 1000)
	&& (Bonus_3 == FALSE))
	{
		other.lp = (other.lp + 1);

		concatText = ConcatStrings(PRINT_LearnLP, IntToString(1));
		PrintScreen(concatText, -1, -1, FONT_SCREEN, 2);
		Bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];

		other.attribute[ATR_HITPOINTS_MAX] = (other.attribute[ATR_HITPOINTS_MAX] + 5);

		concatText = ConcatStrings(PRINT_Learnhitpoints_MAX, IntToString(5));
		PrintScreen(concatText, -1, -1, FONT_Screen, 2);
	};
};

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Daron_EXIT(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 999;
	condition		= DIA_Daron_EXIT_Condition;
	information		= DIA_Daron_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Daron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Daron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Daron_Hallo(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 2;
	condition		= DIA_Daron_Hallo_Condition;
	information		= DIA_Daron_Hallo_Info;
	important		= TRUE;
};

func int DIA_Daron_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Hallo_Info()
{
	AI_Output(self, other, "DIA_Daron_Hallo_10_00"); //我 能 怎 么 帮 助 你 ？ 你 在 寻 求 精 神 上 的 安 慰 吗 ？
	AI_Output(self, other, "DIA_Daron_Hallo_10_01"); //你 想 要 向 我 们 的 英 诺 斯 神 祈 祷 ， 还 是 要 向 他 的 教 堂 捐 赠 一 些 钱 财 呢 ？
};

// ************************************************************
// 			  	Oberes Viertel - Paladine
// ************************************************************
instance DIA_Daron_Paladine(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 2;
	condition		= DIA_Daron_Paladine_Condition;
	information		= DIA_Daron_Paladine_Info;
	description		= "我 需 要 同 圣 骑 士 谈 谈 … …";
};

func int DIA_Daron_Paladine_Condition()
{
	if ((other.guild != GIL_KDF)
	&& (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Daron_Paladine_Info()
{
	AI_Output(other, self, "DIA_Daron_Paladine_15_00"); //我 要 同 圣 骑 士 谈 谈 。 你 能 帮 助 我 见 到 他 们 吗 ？
	AI_Output(self, other, "DIA_Daron_Paladine_10_01"); //哦 ， 你 想 要 进 入 城 里 的 富 人 区 。 然 而 只 有 市 民 和 城 市 的 守 卫 才 能 进 去 。
	AI_Output(self, other, "DIA_Daron_Paladine_10_02"); //当 然 ， 还 有 我 们 火 魔 法 师 。
	AI_Output(other, self, "DIA_Daron_Paladine_15_03"); //我 怎 么 才 能 成 为 一 名 火 魔 法 师 ？
	AI_Output(self, other, "DIA_Daron_Paladine_10_04"); //你 必 须 作 为 一 名 新 信 徒 加 入 我 们 的 修 道 会 。 在 你 服 务 了 一 段 时 间 后 ， 也 许 你 可 以 加 入 魔 法 师 的 行 列 。
	AI_Output(self, other, "DIA_Daron_Paladine_10_05"); //不 过 ， 得 到 认 同 的 道 路 很 长 ， 而 且 需 要 大 量 的 工 作 和 学 习 。
};

// ************************************************************
// 			  				About Segen
// ************************************************************
instance DIA_Daron_AboutSegen(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 2;
	condition		= DIA_Daron_AboutSegen_Condition;
	information		= DIA_Daron_AboutSegen_Info;
	description		= "我 来 求 得 你 的 祝 福 ！";
};

func int DIA_Daron_AboutSegen_Condition()
{
	if ((MIS_Thorben_GetBlessings == LOG_RUNNING)
	&& (Player_IsApprentice == APP_NONE)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_AboutSegen_Info()
{
	AI_Output(other, self, "DIA_Daron_AboutSegen_15_00"); //我 来 求 得 你 的 祝 福 ！
	AI_Output(self, other, "DIA_Daron_AboutSegen_10_01"); //那 很 好 ， 那 很 好 - 那 么 你 也 许 愿 意 向 神 圣 的 英 诺 斯 的 教 堂 捐 赠 一 些 金 币 ， 是 吗 ？
	AI_Output(other, self, "DIA_Daron_AboutSegen_15_02"); //实 际 上 ， 我 需 要 你 的 祝 福 ， 那 样 我 就 可 以 成 为 城 镇 贫 民 区 的 一 名 学 徒 … …
	if (Daron_Segen == TRUE)
	{
		AI_Output(self, other, "DIA_Daron_AboutSegen_10_03"); //但 是 我 已 经 给 了 你 我 的 祝 福 ， 孩 子 。
		AI_Output(self, other, "DIA_Daron_AboutSegen_10_04"); //与 英 诺 斯 同 行 ， 我 的 孩 子 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Daron_AboutSegen_10_05"); //但 是 ， 我 的 孩 子 ！ 没 有 给 教 堂 进 行 适 度 的 捐 赠 的 话 ， 我 不 可 能 给 你 祝 福 。
		AI_Output(self, other, "DIA_Daron_AboutSegen_10_06"); //那 我 怎 么 确 定 你 对 神 圣 的 英 诺 斯 教 堂 所 表 达 的 善 良 意 图 呢 ？
	};
};

// ************************************************************
// 			  		Spenden
// ************************************************************
instance DIA_Daron_Spenden(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 3;
	condition		= DIA_Daron_Spenden_Condition;
	information		= DIA_Daron_Spenden_Info;
	description		= "那 这 里 一 次 捐 赠 通 常 要 多 少 钱 ？";
};

func int DIA_Daron_Spenden_Condition()
	{ if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Daron_Spenden_Info()
{
	AI_Output(other, self, "DIA_Daron_Spenden_15_00"); //那 这 里 一 次 捐 赠 通 常 要 多 少 钱 ？
	AI_Output(self, other, "DIA_Daron_Spenden_10_01"); //嗯 ， 那 取 决 你 想 要 捐 赠 的 比 例 。 让 我 看 看 有 多 少 财 产 。
	AI_Output(self, other, "DIA_Daron_Spenden_10_02"); //（ 看 钱 袋 里 面 ） 嗯 ， 嗯 … …

	if (Npc_HasItems(other, ItMi_Gold) < 10)
	{
		AI_Output(self, other, "DIA_Daron_Spenden_10_03"); //嗯 ， 你 是 一 个 穷 人 ， 不 是 吗 ？ 留 着 你 的 钱 吧 。

		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_4);
		};
	}
	else // Gold >= 10
	{
		if (Npc_HasItems(other, ItMi_Gold) < 50)
		{
			AI_Output(self, other, "DIA_Daron_Spenden_10_04"); //嗯 ， 你 不 富 有 ， 但 也 不 穷 。 向 英 诺 斯 捐 赠10枚 金 币 - 我 们 谦 卑 地 生 活 。
			B_GiveInvItems(other, self, ItMi_Gold, 10);
		}
		else if (Npc_HasItems(other, ItMi_Gold) < 100)
		{
			AI_Output(self, other, "DIA_Daron_Spenden_10_05"); //你 有 超 过50枚 金 币 。 向 英 诺 斯 捐 赠25枚 ， 然 后 接 受 他 的 祝 福 。
			B_GiveInvItems(other, self, ItMi_Gold, 25);
		}
		else
		{
			AI_Output(self, other, "DIA_Daron_Spenden_10_06"); //你 有 超 过 一 百 枚 金 币 - 神 说 ， 如 果 你 有 的 话 ， 请 赠 予 。
			AI_Output(self, other, "DIA_Daron_Spenden_10_07"); //教 会 接 受 你 慷 慨 的 捐 赠 。
			B_GiveInvItems(other, self, ItMi_Gold, 50);
		};

		AI_Output(self, other, "DIA_Daron_Spenden_10_08"); //我 以 英 诺 斯 之 名 祝 福 你 。 因 为 他 是 光 明 而 公 正 的 。
		Daron_Segen = TRUE;
		B_GivePlayerXP(XP_InnosSegen);

		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_2);
		};
	};
};

// ************************************************************
// 			  Wo kommst du her?
// ************************************************************
instance DIA_Daron_Woher(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 9;
	condition		= DIA_Daron_Woher_Condition;
	information		= DIA_Daron_Woher_Info;
	description		= "你 是 从 哪 里 来 的 ？";
};

func int DIA_Daron_Woher_Condition()
{
	if ((other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Daron_Woher_Info()
{
	AI_Output(other, self, "DIA_Daron_Woher_15_00"); //你 是 从 哪 里 来 的 ？
	AI_Output(self, other, "DIA_Daron_Woher_10_01"); //我 从 魔 法 师 的 修 道 院 来 ， 它 坐 落 在 山 区 里 。

	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Daron_Woher_10_02"); //我 们 接 受 任 何 拥 有 纯 洁 的 心 、 并 且 渴 望 为 我 们 全 能 的 神 英 诺 斯 服 务 的 人 。
	};
};

// ************************************************************
// 			Innos
// ************************************************************
instance DIA_Daron_Innos(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 9;
	condition		= DIA_Daron_Innos_Condition;
	information		= DIA_Daron_Innos_Info;
	description		= "告 诉 我 关 于 英 诺 斯 的 事 。";
};

func int DIA_Daron_Innos_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Daron_Woher)
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Daron_Innos_Info()
{
	AI_Output(other, self, "DIA_Daron_Innos_15_00"); //告 诉 我 关 于 英 诺 斯 的 事 。
	AI_Output(self, other, "DIA_Daron_Innos_10_01"); //英 诺 斯 ， 我 们 全 能 的 神 ， 是 光 明 和 火 焰 。
	AI_Output(self, other, "DIA_Daron_Innos_10_02"); //他 选 择 人 类 作 为 他 的 工 具 ， 并 赐 予 他 们 魔 法 和 法 律 。
	AI_Output(self, other, "DIA_Daron_Innos_10_03"); //我 们 以 他 的 名 义 行 事 。 我 们 按 照 他 的 意 愿 执 行 审 判 ， 并 宣 传 他 的 话 语 。
};

// ************************************************************
// 			  Kloster
// ************************************************************
instance DIA_Daron_Kloster(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 9;
	condition		= DIA_Daron_Kloster_Condition;
	information		= DIA_Daron_Kloster_Info;
	description		= "再 告 诉 我 一 些 关 于 修 道 院 的 事 。";
};

func int DIA_Daron_Kloster_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Daron_Woher)
	|| Npc_KnowsInfo(other, DIA_Daron_Paladine)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Kloster_Info()
{
	AI_Output(other, self, "DIA_Daron_Kloster_15_00"); //再 告 诉 我 一 些 关 于 修 道 院 的 事 。
	AI_Output(self, other, "DIA_Daron_Kloster_10_01"); //我 们 向 学 生 传 授 所 有 形 式 的 魔 法 。 但 是 火 魔 法 师 的 技 艺 不 仅 仅 是 那 些 。
	AI_Output(self, other, "DIA_Daron_Kloster_10_02"); //我 们 同 样 精 通 炼 金 术 ， 以 及 制 造 强 大 的 咒 语 。
	AI_Output(self, other, "DIA_Daron_Kloster_10_03"); //我 们 还 能 酿 造 优 良 的 葡 萄 酒 。
};

// ************************************************************
// 			 Stadt
// ************************************************************
instance DIA_Daron_Stadt(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 99;
	condition		= DIA_Daron_Stadt_Condition;
	information		= DIA_Daron_Stadt_Info;
	description		= "你 在 镇 上 做 什 么 ？";
};

func int DIA_Daron_Stadt_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Daron_Woher))
	{
		return TRUE;
	};
};

func void DIA_Daron_Stadt_Info()
{
	AI_Output(other, self, "DIA_Daron_Stadt_15_00"); //你 在 镇 上 做 什 么 ？
	AI_Output(self, other, "DIA_Daron_Stadt_10_01"); //我 已 经 同 圣 骑 士 讨 论 过 ， 并 用 我 的 建 议 和 有 益 的 话 语 帮 助 市 民 。
	AI_Output(self, other, "DIA_Daron_Stadt_10_02"); //尤 其 是 在 这 困 难 时 期 ， 我 们 的 职 责 就 是 去 人 民 那 里 ， 并 帮 助 穷 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info GuildHelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_GuildHelp(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 2;
	condition		= DIA_Addon_Daron_GuildHelp_Condition;
	information		= DIA_Addon_Daron_GuildHelp_Info;
	description		= "我 听 到 一 些 关 于 雕 像 的 传 言 … …";
};

func int DIA_Addon_Daron_GuildHelp_Condition()
{
	if ((MIS_Addon_Vatras_Go2Daron == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Daron_Stadt)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_GuildHelp_Info()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_15_00"); //我 听 到 传 言 说 你 丢 了 一 个 雕 像 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_10_01"); //你 听 说 了 ？ 你 只 可 能 从 水 法 师 瓦 卓 斯 那 里 听 说 。
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_15_02"); //什 么 难 题 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_10_03"); //一 个 从 大 陆 送 往 修 道 院 的 珍 贵 雕 像 。 但 是 它 一 直 没 有 送 抵 至 修 道 院 。
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_15_04"); //船 被 袭 击 了 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_10_05"); //（ 羞 愧 的 ） 不 。 它 安 然 无 恙 地 到 达 了 克 霍 里 尼 斯 ， 而 我 去 那 里 领 取 它 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_10_06"); //然 后 ， 在 我 在 去 修 道 院 的 途 中 ， 一 群 哥 布 林 抢 走 了 它 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_10_07"); //（ 愤 怒 的 ） 不 要 那 样 看 着 我 。 你 很 清 楚 ， 我 们 魔 法 师 也 是 人 。

	MIS_Addon_Vatras_Go2Daron = LOG_SUCCESS;
	MIS_Addon_Daron_GetStatue = LOG_RUNNING;

	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, "你 说 哥 布 林 现 在 得 到 了 它 ？", DIA_Addon_Daron_GuildHelp_gobbos);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, "你 是 在 哪 里 把 那 个 雕 像 丢 掉 的 ？", DIA_Addon_Daron_GuildHelp_wo);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, "你 没 试 过 把 那 个 雕 像 找 回 来 ？", DIA_Addon_Daron_GuildHelp_wiederholen);
};

func void DIA_Addon_Daron_GuildHelp_wiederholen()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_wiederholen_15_00"); //你 没 试 过 把 那 个 雕 像 找 回 来 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_wiederholen_10_01"); //我 当 然 找 了 ！ 我 到 处 去 找 它 ， 但 是 没 有 头 绪 。
};

func void DIA_Addon_Daron_GuildHelp_gobbos()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_gobbos_15_00"); //你 说 哥 布 林 现 在 得 到 了 它 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_01"); //他 们 偷 走 了 它 ， 并 钻 进 了 灌 木 丛 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_gobbos_10_02"); //我 没 有 再 见 过 他 们 ， 他 们 也 许 钻 进 地 洞 了 。
};

func void DIA_Addon_Daron_GuildHelp_wo()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_wo_15_00"); //你 是 在 哪 里 把 那 个 雕 像 丢 掉 的 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_wo_10_01"); //是 在 去 修 道 院 的 路 上 ， 在 奥 兰 的 酒 馆 附 近 。

	Info_AddChoice(DIA_Addon_Daron_GuildHelp, "我 已 经 听 够 了 。 我 会 把 那 个 东 西 给 你 找 回 来 。", DIA_Addon_Daron_GuildHelp_auftrag);
	Info_AddChoice(DIA_Addon_Daron_GuildHelp, "奥 兰 的 酒 馆？ 在 哪 里？", DIA_Addon_Daron_GuildHelp_woTaverne);
};

func void DIA_Addon_Daron_GuildHelp_woTaverne()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_woTaverne_15_00"); //奥 兰 的 酒 馆 ？ 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_01"); //如 果 你 从 这 个 城 门 出 去 ， 并 沿 着 路 一 直 走 ， 你 就 会 找 到 一 座 孤 零 零 的 房 子 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_woTaverne_10_02"); //那 就 是 奥 兰 的 酒 馆 - ‘ 死 亡 女 妖 ’ 。
};

func void DIA_Addon_Daron_GuildHelp_auftrag()
{
	AI_Output(other, self, "DIA_Addon_Daron_GuildHelp_auftrag_15_00"); //我 已 经 听 够 了 。 我 会 把 那 个 东 西 给 你 找 回 来 。
	AI_Output(self, other, "DIA_Addon_Daron_GuildHelp_auftrag_10_01"); //愿 英 诺 斯 指 引 你 、 保 护 你 ， 远 离 城 门 外 的 危 险 。
	Info_ClearChoices(DIA_Addon_Daron_GuildHelp);

	Log_CreateTopic(TOPIC_Addon_RangerHelpKDF, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RangerHelpKDF, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RangerHelpKDF, TOPIC_Addon_RangerHelpKDF_4);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_FoundStatue(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 2;
	condition		= DIA_Addon_Daron_FoundStatue_Condition;
	information		= DIA_Addon_Daron_FoundStatue_Info;
	description		= "我 找 到 了 你 的 雕 像 。";
};

func int DIA_Addon_Daron_FoundStatue_Condition()
{
	if ((Npc_HasItems(other, ItMi_LostInnosStatue_Daron))
	&& (DIA_Gorax_GOLD_perm == FALSE)
	&& (MIS_Addon_Daron_GetStatue == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_FoundStatue_Info()
{
	AI_Output(other, self, "DIA_Addon_Daron_FoundStatue_15_00"); //我 找 到 了 你 的 雕 像 。
	AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_01"); //赞 美 英 诺 斯 ！
	AI_Output(other, self, "DIA_Addon_Daron_FoundStatue_15_02"); //你 现 在 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_03"); //什 么 也 不 做 。 它 只 会 给 我 带 来 坏 运 气 。
	AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_04"); //你 一 定 愿 意 帮 我 把 它 送 回 修 道 院 ， 孩 子 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_05"); //很 自 然 ， 除 非 你 愿 意 用 一 生 来 为 修 道 院 服 务 ， 否 则 他 们 不 会 让 你 进 去 。
		AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_06"); //不 过 我 肯 定 ， 如 果 那 意 味 着 对 我 有 帮 助 的 话 ， 你 一 定 不 会 介 意 那 样 去 做 的 ， 对 吗 ？
	};

	AI_Output(self, other, "DIA_Addon_Daron_FoundStatue_10_07"); //与 英 诺 斯 同 行 ， 我 的 孩 子 ！
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedStatue
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Daron_ReturnedStatue(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 5;
	condition		= DIA_Addon_Daron_ReturnedStatue_Condition;
	information		= DIA_Addon_Daron_ReturnedStatue_Info;
	description		= "我 把 你 的 雕 像 送 到 了 修 道 院 。";
};

func int DIA_Addon_Daron_ReturnedStatue_Condition()
{
	if ((DIA_Gorax_GOLD_perm == TRUE)
	&& (MIS_Addon_Daron_GetStatue == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Daron_ReturnedStatue_Info()
{
	AI_Output(other, self, "DIA_Addon_Daron_ReturnedStatue_15_00"); //我 把 雕 像 送 到 修 道 院 了 ， 所 以 你 现 在 可 以 放 心 了 。
	AI_Output(self, other, "DIA_Addon_Daron_ReturnedStatue_10_01"); //那 真 是 一 个 好 消 息 。 愿 英 诺 斯 保 护 你 。
	AI_Output(self, other, "DIA_Addon_Daron_ReturnedStatue_10_02"); //给 你 这 个 ， 以 表 达 我 的 感 激 ， 孩 子 。
	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);
	TOPIC_End_RangerHelpKDF = TRUE;
	B_GivePlayerXP(XP_Addon_ReportLostInnosStatue2Daron);
};

// ************************************************************
// 			arm
// ************************************************************
instance DIA_Daron_arm(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 10;
	condition		= DIA_Daron_arm_Condition;
	information		= DIA_Daron_arm_Info;
	description		= "我 很 穷 ！";
};

func int DIA_Daron_arm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Daron_Stadt)
	&& (Npc_HasItems(other, ItMi_Gold) < 10)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Daron_arm_Info()
{
	AI_Output(other, self, "DIA_Daron_arm_15_00"); //我 很 穷 ！
	AI_Output(self, other, "DIA_Daron_arm_10_01"); //那 么 说 你 很 穷 困 ， 这 在 当 前 不 足 为 奇 。 拿 上 这 些 金 币 ， 它 会 帮 助 你 的 。
	AI_Output(self, other, "DIA_Daron_arm_10_02"); //但 是 你 应 该 去 找 工 作 ， 然 后 你 就 会 知 道 赚 钱 是 多 么 简 单 。 那 时 你 就 能 向 英 诺 斯 的 教 堂 捐 赠 了 ， 就 像 她 帮 助 了 你 一 样 。

	B_GiveInvItems(self, other, ItMi_Gold, 20);
};

// ************************************************************
// 			 Immer wieder spenden
// ************************************************************
instance DIA_Daron_Spende(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 990;
	condition		= DIA_Daron_Spende_Condition;
	information		= DIA_Daron_Spende_Info;
	permanent		= TRUE;
	description		= "我 想 要 捐 赠 … …";
};

// -------------------------------------
var int DIA_Daron_Spende_permanent;
// -------------------------------------
func int DIA_Daron_Spende_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (DIA_Daron_Spende_permanent == FALSE)
	&& Npc_KnowsInfo(other, DIA_Daron_Spenden)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Daron_Spende_Info()
{
	AI_Output(other, self, "DIA_Daron_Spende_15_00"); //我 想 要 捐 赠 … …

	Info_ClearChoices(DIA_Daron_Spende);

	if (Daron_Spende < 1000)
	{
		Info_AddChoice(DIA_Daron_Spende, "不 过 我 没 有 带 够 钱 … … （ 返 回 ）", DIA_Daron_Spende_BACK);

		Info_AddChoice(DIA_Daron_Spende, "（ ５ ０ 金 币 ）", DIA_Daron_Spende_50);
		Info_AddChoice(DIA_Daron_Spende, "（ １ ０ ０ 金 币 ）", DIA_Daron_Spende_100);
		Info_AddChoice(DIA_Daron_Spende, "（ ２ ０ ０ 金 币 ）", DIA_Daron_Spende_200);
	}
	else
	{
		AI_Output(self, other, "DIA_Daron_Spende_10_01"); //你 已 经 向 我 捐 赠 了 超 过1000枚 的 金 币 。
		AI_Output(self, other, "DIA_Daron_Spende_10_02"); //英 诺 斯 神 的 祝 福 永 远 伴 随 着 你 。

		DIA_Daron_Spende_permanent = TRUE;
		B_DaronSegen();
	};
};

func void DIA_Daron_Spende_BACK()
{
	AI_Output(other, self, "DIA_Daron_Spende_BACK_15_00"); //但 是 我 没 有 带 够 钱 … …
	AI_Output(self, other, "DIA_Daron_Spende_BACK_10_01"); //那 没 有 关 系 ， 我 的 孩 子 。 你 以 后 同 样 可 以 按 自 己 的 想 法 捐 赠 。

	Info_ClearChoices(DIA_Daron_Spende);
};

// ----------------------------
var int Daron_Spende;
// ----------------------------
func void DIA_Daron_Spende_50()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Daron_Spende_50_10_00"); //我 以 英 诺 斯 之 名 祝 福 你 。 因 为 他 是 光 明 而 公 正 的 。
		Daron_Spende = (Daron_Spende + 50);
		B_DaronSegen();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_2);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Daron_Spende_50_10_01"); //如 果 你 有 足 够 的 金 币 ， 你 可 以 随 时 捐 赠 。
	};

	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_100()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(self, other, "DIA_Daron_Spende_100_10_00"); //英 诺 斯 ， 你 是 照 亮 公 正 之 路 的 光 明 。
		AI_Output(self, other, "DIA_Daron_Spende_100_10_01"); //以 你 的 名 义 ， 我 祝 福 这 个 人 。 愿 你 的 光 明 照 耀 着 他 。
		Daron_Spende = (Daron_Spende + 100);
		B_DaronSegen();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_2);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Daron_Spende_100_10_02"); //神 说 - 如 果 你 愿 意 祈 祷 ， 开 启 你 的 灵 魂 。 如 果 你 愿 意 捐 赠 ， 就 带 来 你 的 礼 物 。
	};

	Info_ClearChoices(DIA_Daron_Spende);
};

func void DIA_Daron_Spende_200()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{
		AI_Output(self, other, "DIA_Daron_Spende_200_10_00"); //英 诺 斯 ， 祝 福 这 个 人 。 让 你 的 光 明 照 耀 着 他 。
		AI_Output(self, other, "DIA_Daron_Spende_200_10_01"); //赐 予 他 公 正 行 事 的 力 量 。
		Daron_Spende = (Daron_Spende + 200);
		B_DaronSegen();
		Daron_Segen = TRUE;
		if (MIS_Thorben_GetBlessings == LOG_RUNNING)
		{
			B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_2);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Daron_Spende_200_10_02"); //如 果 你 想 捐 赠 那 么 多 的 金 币 的 话 ， 你 就 应 该 把 它 带 来 。
	};

	Info_ClearChoices(DIA_Daron_Spende);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Daron_PICKPOCKET(C_INFO)
{
	npc				= KDF_511_Daron;
	nr				= 900;
	condition		= DIA_Daron_PICKPOCKET_Condition;
	information		= DIA_Daron_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Daron_PICKPOCKET_Condition()
{
	C_Beklauen(47, 80);
};

func void DIA_Daron_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
	Info_AddChoice(DIA_Daron_PICKPOCKET, DIALOG_BACK, DIA_Daron_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Daron_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Daron_PICKPOCKET_DoIt);
};

func void DIA_Daron_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};

func void DIA_Daron_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Daron_PICKPOCKET);
};
