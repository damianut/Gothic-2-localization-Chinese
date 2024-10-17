// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Thorben_EXIT(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 999;
	condition		= DIA_Thorben_EXIT_Condition;
	information		= DIA_Thorben_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Thorben_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thorben_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Thorben_PICKPOCKET(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 900;
	condition		= DIA_Thorben_PICKPOCKET_Condition;
	information		= DIA_Thorben_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Thorben_PICKPOCKET_Condition()
{
	C_Beklauen(30, 28);
};

func void DIA_Thorben_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
	Info_AddChoice(DIA_Thorben_PICKPOCKET, DIALOG_BACK, DIA_Thorben_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thorben_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Thorben_PICKPOCKET_DoIt);
};

func void DIA_Thorben_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

func void DIA_Thorben_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thorben_PICKPOCKET);
};

// ************************************************************
// 		NEWS - Gritta ist tot Thorben ist angepisst
// ************************************************************
instance DIA_Thorben_angepisst(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 1;
	condition		= DIA_Thorben_angepisst_Condition;
	information		= DIA_Thorben_angepisst_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Thorben_angepisst_Condition()
{
	if ((Npc_IsDead(Gritta))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Thorben_angepisst_Info()
{
	AI_Output(self, other, "DIA_Thorben_angepisst_06_00"); //你 谋 杀 了 我 的 格 里 塔 。 我 永 远 都 不 会 原 谅 你 。 从 我 的 视 线 里 消 失 ， 你 这 个 杀 人 犯 ！
	AI_StopProcessInfos(self);
};

// ************************************************************
// 		Hallo
// ************************************************************
instance DIA_Thorben_Hallo(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_Hallo_Condition;
	information		= DIA_Thorben_Hallo_Info;
	important		= TRUE;
};

func int DIA_Thorben_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Hallo_Info()
{
	AI_Output(self, other, "DIA_Thorben_Hallo_06_00"); //啊 ！ 一 张 新 脸 孔 。 你 不 是 克 霍 里 尼 斯 的 人 ， 是 吗 ？
	AI_Output(self, other, "DIA_Thorben_Hallo_06_01"); //对 于 旅 行 者 ， 现 在 不 是 好 时 候 。 强 盗 密 布 、 失 业 、 而 且 现 在 那 些 农 民 还 起 来 造 反 了 。
	AI_Output(self, other, "DIA_Thorben_Hallo_06_02"); //什 么 风 把 你 吹 来 这 里 了 ？
};

// ************************************************************
// 		Suche Arbeit // E1
// ************************************************************
instance DIA_Thorben_Arbeit(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_Arbeit_Condition;
	information		= DIA_Thorben_Arbeit_Info;
	description		= "我 在 找 工 作 。";
};

func int DIA_Thorben_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Thorben_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Thorben_Arbeit_15_00"); //我 在 找 工 作 。
	AI_Output(self, other, "DIA_Thorben_Arbeit_06_01"); //你 知 道 任 何 关 于 木 工 的 事 情 吗 ？
	AI_Output(other, self, "DIA_Thorben_Arbeit_15_02"); //我 只 会 用 木 头 生 火 。
	AI_Output(self, other, "DIA_Thorben_Arbeit_06_03"); //那 么 ， 关 于 锁 呢 ？
	AI_Output(other, self, "DIA_Thorben_Arbeit_15_04"); //好 … …
	AI_Output(self, other, "DIA_Thorben_Arbeit_06_05"); //对 不 起 ， 但 是 ， 如 果 你 对 我 的 手 艺 一 窍 不 通 的 话 ， 我 不 能 用 你 。
	AI_Output(self, other, "DIA_Thorben_Arbeit_06_06"); //而 且 我 不 会 给 学 徒 付 钱 。

	Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
	B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_13);
};

// ************************************************************
// 		Bei anderem Meister (MIS Blessings) // E2
// ************************************************************
instance DIA_Thorben_OtherMasters(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_OtherMasters_Condition;
	information		= DIA_Thorben_OtherMasters_Info;
	description		= "如 果 我 想 做 这 里 其 它 大 师 的 学 徒 呢 ？";
};

func int DIA_Thorben_OtherMasters_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thorben_Arbeit))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Thorben_OtherMasters_Info()
{
	AI_Output(other, self, "DIA_Thorben_OtherMasters_15_00"); //如 果 我 想 做 这 里 其 它 大 师 的 学 徒 呢 ？
	AI_Output(self, other, "DIA_Thorben_OtherMasters_06_01"); //好 的 ， 我 会 给 你 我 的 许 可 。
	AI_Output(self, other, "DIA_Thorben_OtherMasters_06_02"); //但 是 ， 你 最 好 先 设 法 得 到 神 的 祝 福 。
	AI_Output(self, other, "DIA_Thorben_OtherMasters_06_03"); //说 吧 ， 你 是 一 个 有 信 仰 的 人 吗 ？

	Info_ClearChoices(DIA_Thorben_OtherMasters);
	if ((other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL))
	{
		Info_AddChoice(DIA_Thorben_OtherMasters, "嗯 ， 照 你 看 ， 我 能 说 我 的 祈 祷 合 格 吗 … … ", DIA_Thorben_OtherMasters_Naja);
	};

	Info_AddChoice(DIA_Thorben_OtherMasters, "是 的 。 一 个 最 谦 卑 的 仆 人 ， 大 师 托 尔 本 。", DIA_Thorben_OtherMasters_Devoutly);
};

func void B_Thorben_GetBlessings()
{
	AI_Output(self, other, "B_Thorben_GetBlessings_06_00"); //那 么 去 找 瓦 卓 斯 ， 亚 达 诺 斯 的 牧 师 ， 让 他 给 你 他 的 祝 福 。
	if ((other.guild != GIL_KDF)
	&& (other.guild != GIL_NOV)
	&& (other.guild != GIL_PAL))
	{
		AI_Output(self, other, "B_Thorben_GetBlessings_06_01"); //他 将 告 诉 你 到 哪 里 去 找 英 诺 斯 的 牧 师 。 你 还 必 须 得 到 他 的 祝 福 。
	};

	AI_Output(self, other, "B_Thorben_GetBlessings_06_02"); //一 旦 你 得 到 了 神 的 祝 福 ， 我 就 会 为 你 投 一 票 。

	MIS_Thorben_GetBlessings = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Thorben, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Thorben, LOG_RUNNING);
	B_LogEntry(TOPIC_Thorben, TOPIC_Thorben_3);
};

func void DIA_Thorben_OtherMasters_Devoutly()
{
	AI_Output(other, self, "DIA_Thorben_OtherMasters_Devoutly_15_00"); //是 的 。 一 个 最 谦 卑 的 仆 人 ， 大 师 托 尔 本 。
	B_Thorben_GetBlessings();

	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

func void DIA_Thorben_OtherMasters_Naja()
{
	AI_Output(other, self, "DIA_Thorben_OtherMasters_Naja_15_00"); //嗯 ， 照 你 看 ， 我 能 说 我 的 祈 祷 合 格 吗 … …
	AI_Output(self, other, "DIA_Thorben_OtherMasters_Naja_06_01"); //我 明 白 了 ！
	AI_Output(self, other, "DIA_Thorben_OtherMasters_Naja_06_02"); //一 个 不 在 神 的 祝 福 下 勤 劳 工 作 的 人 是 不 会 得 到 我 的 许 可 的 。
	AI_Output(self, other, "DIA_Thorben_OtherMasters_Naja_06_03"); //请 求 神 宽 恕 你 的 罪 。
	B_Thorben_GetBlessings();

	Info_ClearChoices(DIA_Thorben_OtherMasters);
};

// ************************************************************
// 		ZUSTIMMUNG // E3 (PERM)
// ************************************************************
instance DIA_Thorben_ZUSTIMMUNG(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 1;
	condition		= DIA_Thorben_ZUSTIMMUNG_Condition;
	information		= DIA_Thorben_ZUSTIMMUNG_Info;
	permanent		= TRUE;
	description		= "那 么 你 的 许 可 呢 ， 大 师 ？";
};

func int DIA_Thorben_ZUSTIMMUNG_Condition()
{
	if ((Player_IsApprentice == APP_NONE)
	&& (MIS_Thorben_GetBlessings == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Thorben_ZUSTIMMUNG_Info()
{
	AI_Output(other, self, "DIA_Thorben_ZUSTIMMUNG_15_00"); //那 么 你 的 许 可 呢 ， 大 师 ？
	AI_Output(self, other, "DIA_Thorben_ZUSTIMMUNG_06_01"); //瓦 卓 斯 已 经 给 你 他 的 祝 福 了 吗 ？

	if (Vatras_Segen == TRUE)
	{
		AI_Output(other, self, "DIA_Thorben_ZUSTIMMUNG_15_02"); //是 的 。
		AI_Output(self, other, "DIA_Thorben_ZUSTIMMUNG_06_03"); //你 也 得 到 了 一 位 英 诺 斯 的 牧 师 的 祝 福 吗 ？

		if ((Daron_Segen == TRUE)
		|| (Isgaroth_Segen == TRUE)
		|| (other.guild == GIL_KDF))
		{
			AI_Output(other, self, "DIA_Thorben_ZUSTIMMUNG_15_04"); //是 的 ， 我 得 到 了 。
			AI_Output(self, other, "DIA_Thorben_ZUSTIMMUNG_06_05"); //那 么 ， 你 也 同 样 能 得 到 我 的 祝 福 。 无 论 你 决 定 选 择 那 条 路 - 为 自 己 做 一 份 好 工 作 而 自 豪 吧 ， 我 的 孩 子 ！

			MIS_Thorben_GetBlessings = LOG_SUCCESS;
			B_GivePlayerXP(XP_Zustimmung);

			Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
			B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_14);
		}
		else
		{
			AI_Output(other, self, "DIA_Thorben_ZUSTIMMUNG_15_06"); //不 。 还 没 有 … …
			AI_Output(self, other, "DIA_Thorben_ZUSTIMMUNG_06_07"); //你 知 道 我 的 规 矩 。 你 应 该 在 神 的 祝 福 下 勤 劳 工 作 。
		};
	}
	else
	{
		AI_Output(other, self, "DIA_Thorben_ZUSTIMMUNG_15_08"); //还 没 有 … …
		AI_Output(self, other, "DIA_Thorben_ZUSTIMMUNG_06_09"); //我 不 知 道 你 为 什 么 又 来 问 我 。 你 知 道 我 的 条 件 。
	};
};

// ************************************************************
// 		Was weißt du über Schlösser? // E2
// ************************************************************
instance DIA_Thorben_Locksmith(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_Locksmith_Condition;
	information		= DIA_Thorben_Locksmith_Info;
	description		= "那 么 你 对 锁 了 解 的 非 常 多 ？";
};

func int DIA_Thorben_Locksmith_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Thorben_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Locksmith_Info()
{
	AI_Output(other, self, "DIA_Thorben_Locksmith_15_00"); //那 么 你 对 锁 了 解 的 非 常 多 ？
	AI_Output(self, other, "DIA_Thorben_Locksmith_06_01"); //一 个 漂 亮 的 箱 子 没 有 一 把 不 错 的 锁 又 有 什 么 用 呢 ？
	AI_Output(self, other, "DIA_Thorben_Locksmith_06_02"); //我 自 己 造 锁 。 那 样 的 话 ， 我 至 少 能 确 定 不 会 做 出 一 个 不 够 牢 固 的 箱 子 。
	AI_Output(self, other, "DIA_Thorben_Locksmith_06_03"); //一 把 粗 制 滥 造 的 锁 很 容 易 被 打 开 。 而 且 在 克 霍 里 尼 斯 有 大 批 的 盗 贼 。 尤 其 是 最 近 ！
};

// ************************************************************
// 		Schuldenbuch
// ************************************************************
instance DIA_Thorben_Schuldenbuch(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_Schuldenbuch_Condition;
	information		= DIA_Thorben_Schuldenbuch_Info;
	description		= "我 这 里 得 到 了 雷 玛 尔 账 目 … …";
};

func int DIA_Thorben_Schuldenbuch_Condition()
{
	if (Npc_HasItems(other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Schuldenbuch_Info()
{
	AI_Output(other, self, "DIA_Thorben_Schuldenbuch_15_00"); //我 这 里 得 到 了 雷 玛 尔 账 目 … …
	AI_Output(self, other, "DIA_Thorben_Schuldenbuch_06_01"); //（ 猜 疑 地 ） 你 在 哪 里 弄 到 这 些 的 ？
	AI_Output(other, self, "DIA_Thorben_Schuldenbuch_15_02"); //那 不 应 该 会 让 你 如 此 感 兴 趣 ， 事 实 上 你 的 名 字 在 那 里 面 。
	AI_Output(self, other, "DIA_Thorben_Schuldenbuch_06_03"); //把 它 给 我 ！
	B_GiveInvItems(other, self, ItWr_Schuldenbuch, 1);
	AI_Output(other, self, "DIA_Thorben_Schuldenbuch_15_04"); //那 么 ， 你 会 给 我 什 么 ？
	AI_Output(self, other, "DIA_Thorben_Schuldenbuch_06_05"); //我 没 有 钱 来 施 舍 ， 而 且 除 了 我 的 一 片 诚 挚 的 感 激 之 情 外 ， 什 么 也 给 不 了 你 。
	B_GivePlayerXP(XP_Schuldenbuch);
};

// ************************************************************
// 		Kann ich Schlösser knacken lernen // E3
// ************************************************************
instance DIA_Thorben_PleaseTeach(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_PleaseTeach_Condition;
	information		= DIA_Thorben_PleaseTeach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 开 锁 ？";
};

func int DIA_Thorben_PleaseTeach_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thorben_Locksmith))
	&& (Thorben_TeachPlayer == FALSE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_PleaseTeach_Info()
{
	AI_Output(other, self, "DIA_Thorben_PleaseTeach_15_00"); //你 能 教 我 如 何 开 锁 ？

	if (Npc_HasItems(self, ItWr_Schuldenbuch) > 0)
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_01"); //如 果 不 是 你 的 话 ， 我 这 一 辈 子 都 要 给 雷 玛 尔 付 钱 了 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_02"); //我 会 教 你 你 想 要 知 道 的 。
		Thorben_TeachPlayer = TRUE;
	}
	else if (Thorben_GotGold == TRUE) // 100 Gold bekommen
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_03"); //你 已 经 帮 我 拿 回 了 1 0 0 个 金 币 。 你 真 是 个 大 好 人 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_04"); //我 也 非 常 不 好 意 思 ， 但 是 ， 我 必 须 再 问 你 更 多 的 情 况 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_05"); //如 果 我 不 能 马 上 还 清 雷 玛 尔 的 债 务 ， 他 会 派 他 的 刺 客 来 杀 我 的 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_06"); //再 给 我 1 0 0 个 金 币 ， 那 么 我 就 能 指 导 你 了 。

		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach, "以 后 再 说 吧 … … ", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach, "好 。 这 是 １ ０ ０ 枚 金 币 。", DIA_Thorben_PleaseTeach_Pay100);
	}
	else if (MIS_Matteo_Gold == LOG_SUCCESS) // Grittas Schulden bezahlt
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_07"); //你 已 经 为 格 里 塔 还 清 了 欠 麦 迪 欧 的 钱 。 你 看 来 是 个 非 常 棒 的 家 伙 。 我 会 教 你 你 想 要 知 道 的 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_08"); //然 而 ， 我 不 会 免 费 。 我 还 有 堆 积 如 山 的 债 务 要 还 ， 我 真 的 需 要 这 些 钱 。
		AI_Output(other, self, "DIA_Thorben_PleaseTeach_15_09"); //你 需 要 多 少 ？
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_10"); //2 0 0 个 金 币 。

		Info_ClearChoices(DIA_Thorben_PleaseTeach);
		Info_AddChoice(DIA_Thorben_PleaseTeach, "以 后 再 说 吧 … … ", DIA_Thorben_PleaseTeach_Later);
		Info_AddChoice(DIA_Thorben_PleaseTeach, "好 。 这 是 ２ ０ ０ 枚 金 币 。", DIA_Thorben_PleaseTeach_Pay200);
	}
	else
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_11"); //嗯 … … 我 不 知 道 是 否 可 以 信 任 你 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_12"); //据 我 所 知 ， 你 也 许 是 那 些 懒 汉 中 的 一 个 ， 只 会 到 城 里 来 偷 空 老 实 人 的 箱 子 。
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_06_13"); //我 不 打 算 教 你 任 何 东 西 ， 直 到 我 相 信 你 是 个 诚 实 的 家 伙 。
	};
};

func void DIA_Thorben_PleaseTeach_Pay200()
{
	AI_Output(other, self, "DIA_Thorben_PleaseTeach_Pay200_15_00"); //好 。 这 是 ２ ０ ０ 枚 金 币 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 200))
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_Pay200_06_01"); //这 些 钱 将 会 真 正 地 帮 到 我 。 一 旦 你 准 备 好 了 我 们 就 可 以 开 始 。
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_Pay200_06_02"); //你 还 差 一 点 到200。 我 需 要 那 些 钱 。
	};

	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Pay100()
{
	AI_Output(other, self, "DIA_Thorben_PleaseTeach_Pay100_15_00"); //好 。 这 是 １ ０ ０ 枚 金 币 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_Pay100_06_01"); //既 然 如 此 ， 当 你 准 备 好 了 后 我 们 就 可 以 开 始 了 。
		Thorben_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Thorben_PleaseTeach_Pay100_06_02"); //嘿 ， 你 还 差 一 点 到100。
	};

	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

func void DIA_Thorben_PleaseTeach_Later()
{
	AI_Output(other, self, "DIA_Thorben_PleaseTeach_Later_15_00"); //以 后 再 说 吧 … …

	Info_ClearChoices(DIA_Thorben_PleaseTeach);
};

// ************************************************************
// 		Schlösser knacken lernen // E4
// ************************************************************
instance DIA_Thorben_Teach(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 2;
	condition		= DIA_Thorben_Teach_Condition;
	information		= DIA_Thorben_Teach_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LEARN_LOCKS, B_GetLearnCostTalent(other, NPC_TALENT_PICKLOCK, 1));
};

func int DIA_Thorben_Teach_Condition()
{
	if ((Thorben_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Teach_Info()
{
	AI_Output(other, self, "DIA_Thorben_Teach_15_00"); //教 我 如 何 开 锁 ！

	if (B_TeachThiefTalent(self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output(self, other, "DIA_Thorben_Teach_06_01"); //你 需 要 的 是 一 把 开 锁 工 具 。 如 果 你 小 心 地 在 锁 里 头 左 右 转 动 它 ， 你 就 能 打 开 这 个 机 械 装 置 。
		AI_Output(self, other, "DIA_Thorben_Teach_06_02"); //但 是 ， 如 果 你 朝 错 误 的 方 向 转 动 得 太 多 或 者 太 快 ， 它 就 会 折 断 。
		AI_Output(self, other, "DIA_Thorben_Teach_06_03"); //你 越 熟 练 ， 以 后 所 需 的 开 锁 工 具 就 越 少 。 就 是 这 些 了 ， 真 的 。
	};
};

// ************************************************************
// 		TRADE (PERM)
// ************************************************************
instance DIA_Thorben_TRADE(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 3;
	condition		= DIA_Thorben_TRADE_Condition;
	information		= DIA_Thorben_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 能 卖 我 一 些 开 锁 工 具 吗 ？";
};

func int DIA_Thorben_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Thorben_Locksmith))
	{
		return TRUE;
	};
};

func void DIA_Thorben_TRADE_Info()
{
	AI_Output(other, self, "DIA_Thorben_TRADE_15_00"); //你 能 卖 我 一 些 开 锁 工 具 吗 ？

	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self, other, "DIA_Thorben_TRADE_06_01"); //如 果 我 还 有 剩 下 的 的 话 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Thorben_TRADE_06_02"); //嗯 ， 好 吧 。 不 过 如 果 你 不 知 道 怎 么 使 用 它 的 话 ， 你 拿 着 它 们 就 不 会 有 任 何 用 处 。
	};

	if ((Npc_HasItems(self, ITke_Lockpick) == 0)
	&& (Kapitel > Dietrichgeben))
	{
		CreateInvItems(self, ITKE_LOCKPICK, 5);
		Dietrichgeben = Dietrichgeben + 1;
	};

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_16);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_MissingPeople(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 4;
	condition		= DIA_Addon_Thorben_MissingPeople_Condition;
	information		= DIA_Addon_Thorben_MissingPeople_Info;
	description		= "你 以 前 有 学 徒 吗 ？";
};

func int DIA_Addon_Thorben_MissingPeople_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thorben_Arbeit))
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Elvrich_GoesBack2Thorben == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_15_00"); //你 以 前 有 学 徒 吗 ？
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_06_01"); //是 的 ， 就 在 不 久 以 前 。
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_15_02"); //还 有 吗 ？ 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_06_03"); //他 叫 艾 尔 弗 里 奇 。 他 是 我 的 侄 子 。
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_06_04"); //实 际 上 ， 我 非 常 喜 欢 他 ， 但 有 一 天 他 没 来 上 班 。

	MIS_Thorben_BringElvrichBack = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_6);

	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, DIALOG_BACK, DIA_Addon_Thorben_MissingPeople_Back);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, "你 向 民 兵 报 告 了 吗 ？", DIA_Addon_Thorben_MissingPeople_Mil);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, "自 从 你 上 次 见 到 他 有 多 久 了 ？", DIA_Addon_Thorben_MissingPeople_wann);
	Info_AddChoice(DIA_Addon_Thorben_MissingPeople, "现 在 艾 尔 弗 里 奇 在 哪 里 ？", DIA_Addon_Thorben_MissingPeople_where);
};

func void DIA_Addon_Thorben_MissingPeople_Back()
{
	Info_ClearChoices(DIA_Addon_Thorben_MissingPeople);
};

func void DIA_Addon_Thorben_MissingPeople_wann()
{
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_wann_15_00"); //自 从 你 上 次 见 到 他 有 多 久 了 ？
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_wann_06_01"); //我 猜 那 一 定 是 2 个 星 期 以 前 了 。
};

func void DIA_Addon_Thorben_MissingPeople_where()
{
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_where_15_00"); //现 在 艾 尔 弗 里 奇 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_01"); //我 怎 么 知 道 的 ？ 他 总 是 去 港 口 附 近 的 那 家 下 流 的 妓 院 闲 逛 。
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_where_06_02"); //要 是 他 现 在 还 在 那 里 给 哪 个 婊 子 暖 被 窝 的 话 ， 我 一 点 也 不 会 感 到 奇 怪 。
};

func void DIA_Addon_Thorben_MissingPeople_Mil()
{
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_00"); //你 向 民 兵 报 告 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_01"); //我 当 然 有 。 他 们 应 该 抓 住 他 ， 并 保 证 那 个 懒 骨 头 去 上 班 。 但 是 ， 我 已 经 为 此 后 悔 了 。
	AI_Output(self, other, "DIA_Addon_Thorben_MissingPeople_Mil_06_02"); //他 会 做 自 己 想 做 的 任 何 事 。 迟 早 他 会 意 识 到 没 有 一 个 像 样 的 工 作 是 无 法 在 克 霍 里 尼 斯 立 足 的 。
	AI_Output(other, self, "DIA_Addon_Thorben_MissingPeople_Mil_15_03"); //（ 冷 嘲 热 讽 地 ） 真 是 这 样 吗 ？。
};

///////////////////////////////////////////////////////////////////////
//	Info ElvrichIsBack
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Thorben_ElvrichIsBack(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 5;
	condition		= DIA_Addon_Thorben_ElvrichIsBack_Condition;
	information		= DIA_Addon_Thorben_ElvrichIsBack_Info;
	description		= "艾 尔 弗 里 奇 从 现 在 起 将 再 次 为 你 工 作 。";
};

func int DIA_Addon_Thorben_ElvrichIsBack_Condition()
{
	if ((Elvrich_GoesBack2Thorben == TRUE)
	&& ((Npc_IsDead(Elvrich)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Thorben_ElvrichIsBack_Info()
{
	AI_Output(other, self, "DIA_Addon_Thorben_ElvrichIsBack_15_00"); //艾 尔 弗 里 奇 从 现 在 起 将 再 次 为 你 工 作 。
	AI_Output(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_01"); //我 只 能 希 望 他 下 次 再 看 到 哪 个 小 妓 女 对 他 摆 动 裙 子 的 时 候 不 会 再 次 失 踪 。
	AI_Output(self, other, "DIA_Addon_Thorben_ElvrichIsBack_06_02"); //拿 着 这 些 金 币 作 为 你 帮 忙 找 回 我 的 学 徒 的 酬 劳 。
	CreateInvItems(self, ItMi_Gold, 200);
	B_GiveInvItems(self, other, ItMi_Gold, 200);
	MIS_Thorben_BringElvrichBack = LOG_SUCCESS;
	VLK_4302_Addon_Elvrich.flags = 0;
};

// ************************************************************
// 		Paladine // E1
// ************************************************************
instance DIA_Thorben_Paladine(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 4;
	condition		= DIA_Thorben_Paladine_Condition;
	information		= DIA_Thorben_Paladine_Info;
	description		= "关 于 圣 骑 士 你 都 知 道 些 什 么 ？";
};

func int DIA_Thorben_Paladine_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Thorben_Paladine_Info()
{
	AI_Output(other, self, "DIA_Thorben_Paladine_15_00"); //关 于 圣 骑 士 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Thorben_Paladine_06_01"); //不 多 。 他 们 两 个 礼 拜 前 从 大 陆 乘 船 来 到 了 这 里 。
	AI_Output(self, other, "DIA_Thorben_Paladine_06_02"); //从 那 时 起 ， 他 们 就 撤 退 到 了 城 里 的 富 人 区 那 头 。
	AI_Output(self, other, "DIA_Thorben_Paladine_06_03"); //这 里 没 有 一 个 人 真 正 知 道 他 们 来 这 里 的 真 正 原 因 。
	AI_Output(self, other, "DIA_Thorben_Paladine_06_04"); //很 多 人 担 心 是 因 为 兽 人 的 进 攻 。
	AI_Output(self, other, "DIA_Thorben_Paladine_06_05"); //然 而 ， 我 认 为 他 们 来 这 里 是 为 了 镇 压 农 民 造 反 。
};

// ************************************************************
// 		Bauernaufstand // E2
// ************************************************************
instance DIA_Thorben_Bauernaufstand(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 4;
	condition		= DIA_Thorben_Bauernaufstand_Condition;
	information		= DIA_Thorben_Bauernaufstand_Info;
	description		= "你 知 道 什 么 关 于 农 民 反 叛 的 事 吗 ？";
};

func int DIA_Thorben_Bauernaufstand_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thorben_Paladine))
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Bauernaufstand_Info()
{
	AI_Output(other, self, "DIA_Thorben_Bauernaufstand_15_00"); //你 知 道 什 么 关 于 农 民 反 叛 的 事 吗 ？
	AI_Output(self, other, "DIA_Thorben_Bauernaufstand_06_01"); //有 传 言 说 地 主 欧 纳 尔 已 经 聘 请 了 雇 佣 兵 来 抵 挡 国 王 的 军 队 对 他 的 威 胁 。
	AI_Output(self, other, "DIA_Thorben_Bauernaufstand_06_02"); //他 可 能 已 经 厌 倦 了 不 得 不 把 自 己 的 收 成 和 牲 畜 都 缴 给 那 些 圣 骑 士 和 民 兵 。
	AI_Output(self, other, "DIA_Thorben_Bauernaufstand_06_03"); //我 们 在 城 里 能 看 到 的 结 果 就 是 食 品 的 价 格 持 续 上 涨 。
	AI_Output(self, other, "DIA_Thorben_Bauernaufstand_06_04"); //欧 纳 尔 的 农 场 位 于 东 边 很 远 的 地 方 。 如 果 那 里 发 生 战 斗 的 话 ， 我 们 不 会 知 道 。
	AI_Output(self, other, "DIA_Thorben_Bauernaufstand_06_05"); //如 果 你 想 知 道 更 多 ， 去 问 问 市 场 里 的 商 人 吧 。 他 们 对 这 个 岛 的 了 解 比 我 多 得 多 。
};

// ************************************************************
// 		Gritta
// ************************************************************
instance DIA_Thorben_Gritta(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 5;
	condition		= DIA_Thorben_Gritta_Condition;
	information		= DIA_Thorben_Gritta_Info;
	description		= "我 来 是 关 于 格 里 塔 … …";
};

func int DIA_Thorben_Gritta_Condition()
{
	if ((MIS_Matteo_Gold == LOG_RUNNING)
	&& (!Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Thorben_Gritta_Info()
{
	AI_Output(other, self, "DIA_Thorben_Gritta_15_00"); //我 来 是 关 于 格 里 塔 … …
	AI_Output(self, other, "DIA_Thorben_Gritta_06_01"); //我 的 侄 女 ？ 你 和 她 之 间 有 什 么 事 ？ 不 是 关 于 钱 的 问 题 ， 是 吗 ？
	AI_Output(other, self, "DIA_Thorben_Gritta_15_02"); //她 欠 商 人 麦 迪 欧 1 0 0 个 金 币 。

	AI_Output(self, other, "DIA_Thorben_Gritta_06_03"); //告 诉 我 这 不 是 真 的 。 自 从 那 一 小 点 义 务 转 移 到 我 身 上 后 ， 我 只 得 到 了 一 堆 麻 烦 ！
	AI_Output(self, other, "DIA_Thorben_Gritta_06_04"); //她 几 乎 欠 城 里 的 每 一 个 商 人 的 钱 。
	AI_Output(self, other, "DIA_Thorben_Gritta_06_05"); //我 不 得 不 从 放 高 利 贷 的 雷 玛 尔 那 里 借 了 2 0 0 个 金 币 来 给 她 还 债 ！ 而 现 在 又 是 这 个 ！
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self, other, "DIA_Thorben_Gritta_06_06"); //格 里 塔 应 该 在 屋 里 。
	};

	AI_Output(self, other, "DIA_Thorben_Gritta_06_07"); //去 吧 ， 问 问 她 。 不 过 ， 我 可 以 告 诉 你 ： 她 一 个 子 儿 都 没 有 。
	if (Npc_HasItems(Gritta, itmi_gold) >= 100)
	{
		AI_Output(other, self, "DIA_Thorben_Gritta_15_08"); //我 们 看 看 … …
	};
};

// ************************************************************
// 		Grittas Gold genommen
// ************************************************************
instance DIA_Thorben_GrittaHatteGold(C_INFO)
{
	npc				= VLK_462_Thorben;
	nr				= 5;
	condition		= DIA_Thorben_GrittaHatteGold_Condition;
	information		= DIA_Thorben_GrittaHatteGold_Info;
	description		= "你 的 侄 女 有 １ ０ ０ 枚 金 币 。";
};

func int DIA_Thorben_GrittaHatteGold_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thorben_Gritta))
	&& (Npc_HasItems(Gritta, itmi_gold) < 100)
	&& (!Npc_IsDead(Gritta)))
	{
		return TRUE;
	};
};

func void DIA_Thorben_GrittaHatteGold_Info()
{
	AI_Output(other, self, "DIA_Thorben_GrittaHatteGold_15_00"); //你 的 侄 女 有 １ ０ ０ 枚 金 币 。
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_06_01"); //什 么 ？ 这 条 无 耻 的 小 毒 蛇 - 那 是 我 的 金 币 ！ 她 从 我 箱 子 里 拿 的 。
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_06_02"); //把 它 还 给 我 ！ 我 必 须 先 还 清 雷 玛 尔 的 钱 。 麦 迪 欧 可 以 以 后 再 拿 他 的 钱 ！

	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
	if (MIS_Matteo_Gold == LOG_SUCCESS)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, "我 已 经 把 麦 迪 欧 的 金 币 交 给 他 了 ！", DIA_Thorben_GrittaHatteGold_MatteoHatEs);
	}
	else
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, "不 。 麦 迪 欧 会 从 我 这 里 拿 回 他 的 钱 。", DIA_Thorben_GrittaHatteGold_MatteoSollHaben);
	};

	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice(DIA_Thorben_GrittaHatteGold, "这 是 你 的 金 币 。", DIA_Thorben_GrittaHatteGold_HereItIs);
	};
};

func void B_Thorben_DeletePetzCrimeGritta()
{
	if (Gritta_GoldGiven == FALSE)
	{
		AI_Output(self, other, "B_Thorben_DeletePetzCrimeGritta_06_00"); //从 我 对 这 条 小 毒 蛇 的 了 解 ， 我 敢 肯 定 她 会 直 接 去 找 城 市 守 卫 控 告 你 ！
		AI_Output(self, other, "B_Thorben_DeletePetzCrimeGritta_06_01"); //我 会 确 保 事 情 解 决 的 ！
		B_DeletePetzCrime(Gritta);
	};
};

func void DIA_Thorben_GrittaHatteGold_MatteoHatEs()
{
	AI_Output(other, self, "DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00"); //我 已 经 把 麦 迪 欧 的 金 币 交 给 他 了 ！
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01"); //该 死 ！ 哦 ， 好 吧 - 债 务 就 是 债 务 。 至 少 你 没 有 自 己 留 着 那 些 钱 。 我 猜 我 应 该 为 此 谢 谢 你 。

	B_Thorben_DeletePetzCrimeGritta();

	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_MatteoSollHaben()
{
	AI_Output(other, self, "DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00"); //不 。 麦 迪 欧 会 从 我 这 里 拿 回 他 的 钱 。
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01"); //你 这 样 把 我 推 到 了 一 笔 旧 账 上 去 了 。 在 涉 及 债 务 的 时 候 ， 雷 玛 尔 可 不 是 那 么 慷 慨 大 方 的 。
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02"); //不 过 至 少 你 正 在 准 备 帮 我 侄 女 付 清 债 务 。 我 猜 我 应 该 为 此 谢 谢 你 。

	B_Thorben_DeletePetzCrimeGritta();

	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};

func void DIA_Thorben_GrittaHatteGold_HereItIs()
{
	AI_Output(other, self, "DIA_Thorben_GrittaHatteGold_HereItIs_15_00"); //这 是 你 的 钱 。
	B_GiveInvItems(other, self, itmi_gold, 100);
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_HereItIs_06_01"); //谢 谢 ！ 现 在 我 至 少 还 能 还 雷 玛 尔 一 部 分 钱 ！
	AI_Output(self, other, "DIA_Thorben_GrittaHatteGold_HereItIs_06_02"); //我 无 法 相 信 她 有 这 么 大 的 胆 子 来 偷 我 的 钱 ！

	B_Thorben_DeletePetzCrimeGritta();

	Thorben_GotGold = TRUE;

	Info_ClearChoices(DIA_Thorben_GrittaHatteGold);
};
