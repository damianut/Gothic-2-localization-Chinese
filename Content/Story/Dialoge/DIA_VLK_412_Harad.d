// *****************************************************
// 							EXIT
// *****************************************************
instance DIA_Harad_EXIT(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 999;
	condition		= DIA_Harad_EXIT_Condition;
	information		= DIA_Harad_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Harad_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Harad_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************
// 							Hallo
// *****************************************************
instance DIA_Harad_Hallo(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 2;
	condition		= DIA_Harad_Hallo_Condition;
	information		= DIA_Harad_Hallo_Info;
	important		= TRUE;
};

func int DIA_Harad_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Harad_Hallo_Info()
{
	AI_Output(self, other, "DIA_Harad_Hallo_12_00"); //（ 暴 躁 的 ） 你 想 要 什 么 ？
};

// *****************************************************
// 							Arbeit
// *****************************************************
instance DIA_Harad_Arbeit(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_Arbeit_Condition;
	information		= DIA_Harad_Arbeit_Info;
	description		= "我 在 找 工 作 ！";
};

func int DIA_Harad_Arbeit_Condition()
{
	return TRUE;
};

func void DIA_Harad_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Harad_Arbeit_15_00"); //我 在 找 工 作 ！
	AI_Output(self, other, "DIA_Harad_Arbeit_12_01"); //嗯 - 我 正 需 要 一 个 新 学 徒 。
	AI_Output(self, other, "DIA_Harad_Arbeit_12_02"); //布 赖 恩 的 学 徒 生 涯 就 要 结 束 了 ， 然 后 ， 他 会 离 开 这 个 城 市 。
	AI_Output(self, other, "DIA_Harad_Arbeit_12_03"); //你 擅 长 做 什 么 事 情 ？
	AI_Output(other, self, "DIA_Harad_Arbeit_15_04"); //你 的 意 思 是 ， 我 是 否 了 解 铁 匠 的 工 作 … …
	AI_Output(self, other, "DIA_Harad_Arbeit_12_05"); //不 。 我 不 是 这 个 意 思 。
	AI_Output(self, other, "DIA_Harad_Arbeit_12_06"); //迟 早 那 些 兽 人 会 包 围 这 座 城 市 ， 那 么 ， 只 有 那 些 保 卫 我 们 城 市 的 人 才 有 他 的 价 值 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Harad_Arbeit_12_07"); //我 不 会 接 纳 那 些 玷 辱 我 的 名 声 的 人 当 学 徒 ， 他 们 只 会 带 着 女 人 和 一 些 没 用 的 东 西 从 城 里 逃 出 去 ， 而 不 是 留 在 这 里 跟 其 它 人 一 起 坚 守 堡 垒 。
	};

	Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);
	B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_3);
};

// *****************************************************
// 						MIS_Orc
// *****************************************************
instance DIA_Harad_Taugenichts(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_Taugenichts_Condition;
	information		= DIA_Harad_Taugenichts_Info;
	description		= "我 不 是 废 物 ！";
};

func int DIA_Harad_Taugenichts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Harad_Arbeit))
	{
		return TRUE;
	};
};

func void DIA_Harad_Taugenichts_Info()
{
	AI_Output(other, self, "DIA_Harad_Taugenichts_15_00"); //我 不 是 废 物 ！
	AI_Output(self, other, "DIA_Harad_Taugenichts_12_01"); //那 都 是 吹 牛 ！ 你 能 做 出 什 么 行 动 来 证 明 ？
	AI_Output(other, self, "DIA_Harad_Taugenichts_15_02"); //你 在 暗 示 什 么 ？
	AI_Output(self, other, "DIA_Harad_Taugenichts_12_03"); //给 我 拿 一 件 兽 人 的 武 器 来 。
	AI_Output(self, other, "DIA_Harad_Taugenichts_12_04"); //城 市 附 近 有 兽 人 出 没 。 要 是 稍 微 走 点 运 ， 你 很 快 就 能 找 到 它 们 。
	AI_Output(self, other, "DIA_Harad_Taugenichts_12_05"); //如 果 你 能 想 办 法 干 掉 一 个 ， 我 就 收 你 作 为 学 徒 。
	AI_Output(self, other, "DIA_Harad_Taugenichts_12_06"); //倘 若 其 它 的 大 师 都 同 意 的 话 。

	MIS_Harad_Orc = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HaradOrk, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaradOrk, LOG_RUNNING);
	B_LogEntry(TOPIC_HaradOrk, TOPIC_HaradOrk_1);
};

// *****************************************************
// 						Orc Running
// *****************************************************
instance DIA_Harad_OrcRunning(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_OrcRunning_Condition;
	information		= DIA_Harad_OrcRunning_Info;
	description		= "让 我 们 在 谈 谈 关 于 那 个 兽 人 的 事 情 … …";
};

func int DIA_Harad_OrcRunning_Condition()
{
	if ((MIS_Harad_Orc == LOG_RUNNING)
	&& (Harad_HakonMission == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Harad_OrcRunning_Info()
{
	AI_Output(other, self, "DIA_Harad_OrcRunning_15_00"); //让 我 们 在 谈 谈 关 于 那 个 兽 人 的 事 情 … …
	AI_Output(self, other, "DIA_Harad_OrcRunning_12_01"); //（ 唐 突 的 ） 什 么 ？

	Info_ClearChoices(DIA_Harad_OrcRunning);
	Info_AddChoice(DIA_Harad_OrcRunning, "你 说 的 兽 人 实 际 上 已 经 死 了 ！", DIA_Harad_OrcRunning_Done);
	Info_AddChoice(DIA_Harad_OrcRunning, "兽 人 是 一 个 非 常 难 对 付 的 对 手 … …", DIA_Harad_OrcRunning_TooHard);

	// AI_Output(self, other, "DIA_Harad_OrcRunning_12_02"); // Ah, ich verstehe schon. Du hast Wichtigeres zu tun. Schon in Ordnung, die Sache hat sich erledigt.
};

func void DIA_Harad_OrcRunning_TooHard()
{
	AI_Output(other, self, "DIA_Harad_OrcRunning_TooHard_15_00"); //但 是 ， 兽 人 是 一 个 非 常 难 对 付 的 对 手 … …
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_01"); //嗯 - 看 看 你 ， 我 可 能 是 对 的 。 你 身 上 没 有 多 少 肌 肉 。 但 那 是 可 以 改 变 的 。
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_02"); //不 过 ， 你 必 须 向 我 证 明 你 有 战 斗 的 勇 气 。
	AI_Output(other, self, "DIA_Harad_OrcRunning_TooHard_15_03"); //那 它 不 会 是 小 事 了 ？
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_04"); //嗯 - （ 考 虑 ） 哈 肯 ， 就 是 市 场 里 的 武 器 商 人 ， 他 告 诉 我 几 天 前 他 被 强 盗 袭 击 了 。
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_05"); //据 说 那 些 混 蛋 在 东 门 外 的 某 些 地 方 游 荡 。
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_06"); //那 些 胆 小 如 鼠 的 流 氓 是 不 会 很 聪 明 的 。
	AI_Output(self, other, "DIA_Harad_OrcRunning_TooHard_12_07"); //去 抓 住 那 些 混 蛋 ！ 一 个 都 不 能 漏 。 那 样 的 话 ， 我 就 能 肯 定 你 在 城 里 能 派 得 上 用 场 。

	Harad_HakonMission = TRUE;
	Log_CreateTopic(TOPIC_Lehrling, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Lehrling, LOG_RUNNING);

	if (MIS_HakonBandits != LOG_RUNNING)
	{
		B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_4);
	}
	else
	{
		B_LogEntry(TOPIC_Lehrling, Topic_Lehrling_17);
	};

	Info_ClearChoices(DIA_Harad_OrcRunning);
};

func void DIA_Harad_OrcRunning_Done()
{
	AI_Output(other, self, "DIA_Harad_OrcRunning_Done_15_00"); //你 说 的 兽 人 实 际 上 已 经 死 了 ！
	AI_Output(self, other, "DIA_Harad_OrcRunning_Done_12_01"); //很 好 ！ 那 就 别 在 这 里 白 费 口 舌 了 ， 用 你 的 行 动 说 话 吧 。！

	Info_ClearChoices(DIA_Harad_OrcRunning);
};

// *****************************************************
// 						Orc Success
// *****************************************************
instance DIA_Harad_OrcSuccess(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_OrcSuccess_Condition;
	information		= DIA_Harad_OrcSuccess_Info;
	description		= "我 已 经 拿 到 了 你 要 的 兽 人 武 器 。";
};

func int DIA_Harad_OrcSuccess_Condition()
{
	if (MIS_Harad_Orc == LOG_RUNNING)
	{
		if ((Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
		|| (Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_OrcSuccess_Info()
{
	AI_Output(other, self, "DIA_Harad_OrcSuccess_15_00"); //我 已 经 拿 到 了 你 要 的 兽 人 武 器 。
	AI_Output(self, other, "DIA_Harad_OrcSuccess_12_01"); //给 我 看 看 … …

	if (Npc_HasItems(other, ItMw_2H_OrcAxe_01) > 0)
	{
		B_GiveInvItems(other, self, ItMw_2H_OrcAxe_01, 1);
	}
	else if (Npc_HasItems(other, ItMw_2H_OrcAxe_02) > 0)
	{
		B_GiveInvItems(other, self, ItMw_2H_OrcAxe_02, 1);
	}
	else if (Npc_HasItems(other, ItMw_2H_OrcAxe_03) > 0)
	{
		B_GiveInvItems(other, self, ItMw_2H_OrcAxe_03, 1);
	}
	else if (Npc_HasItems(other, ItMw_2H_OrcAxe_04) > 0)
	{
		B_GiveInvItems(other, self, ItMw_2H_OrcAxe_04, 1);
	}
	else // if(Npc_HasItems(other, ItMw_2H_OrcSword_01) > 0)
	{
		B_GiveInvItems(other, self, ItMw_2H_OrcSword_01, 1);
	};

	if (Harad_HakonMission == TRUE)
	{
		AI_Output(self, other, "DIA_Harad_OrcSuccess_12_02"); //你 成 功 了 ？ 好 样 的 ！
	};

	AI_Output(self, other, "DIA_Harad_OrcSuccess_12_03"); //我 已 经 有 一 段 时 间 没 有 这 样 的 武 器 了 — — 我 在 兽 人 战 争 中 是 一 名 士 兵 。
	AI_Output(self, other, "DIA_Harad_OrcSuccess_12_04"); //我 可 以 告 诉 你 ，那 段 时 间 很 难 熬 。

	if (Player_IsApprentice == APP_Harad)
	{
		AI_Output(self, other, "DIA_Harad_OrcSuccess_12_05"); //我 就 知 道 ， 我 收 你 做 学 徒 是 有 理 由 的 。 干 得 漂 亮 ！
	}
	else if (Player_IsApprentice == APP_NONE)
	{
		AI_Output(self, other, "DIA_Harad_OrcSuccess_12_06"); //我 没 有 想 到 你 能 办 成 。 你 给 我 留 下 了 深 刻 的 印 象 。
	}
	else // anderer Weg
	{
		AI_Output(self, other, "DIA_Harad_OrcSuccess_12_07"); //你 选 择 了 另 一 条 路 真 是 太 糟 了 。
		AI_Output(self, other, "DIA_Harad_OrcSuccess_12_08"); //我 本 来 真 的 很 需 要 你 。
	};

	MIS_Harad_Orc = LOG_SUCCESS;
	B_GivePlayerXP(XP_Harad_Orc);
	B_LogEntry(Topic_Lehrling, Topic_Lehrling_6);
};

// *****************************************************
// 						LEHRLING (PERM)
// *****************************************************
var int Harad_StartGuild;
// ----------------------
instance DIA_Harad_LEHRLING(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_LEHRLING_Condition;
	information		= DIA_Harad_LEHRLING_Info;
	permanent		= TRUE;
	description		= "我 什 么 时 候 可 以 开 始 做 你 的 学 徒 ？";
};

func int DIA_Harad_LEHRLING_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Harad_Arbeit))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Harad_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;

	AI_Output(other, self, "DIA_Harad_LEHRLING_15_00"); //我 什 么 时 候 可 以 开 始 做 你 的 学 徒 ？

	if ((MIS_Harad_Orc == LOG_SUCCESS)
	|| ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		// ------ Harad ------
		if (MIS_Harad_Orc == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_01"); //我 们 这 里 真 的 很 需 要 能 够 打 败 兽 人 的 人 。

			if (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_02"); //还 有 ， 哈 肯 告 诉 了 我 你 是 如 何 解 决 那 些 强 盗 的 。 好 样 的 ！
			};
		}
		else // HakonBandits SUCCESS
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_03"); //你 没 有 杀 掉 一 个 兽 人 ， 但 是 哈 肯 告 诉 我 你 是 怎 样 解 决 了 那 些 强 盗 。 好 样 的 ！
		};

		AI_Output(self, other, "DIA_Harad_LEHRLING_12_04"); //我 认 为 ， 你 可 以 现 在 就 开 始 。

		stimmen = stimmen + 1;

		AI_Output(self, other, "DIA_Harad_LEHRLING_12_05"); //至 于 其 它 的 大 师 们 … …

		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_06"); //托 尔 本 给 了 他 的 祝 福 给 你。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_07"); //老 好 人 托 尔 本 希 望 你 能 得 到 神 的 祝 福 。 我 想 那 是 个 好 主 意 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_08"); //托 尔 本 说 他 从 来 没 跟 你 说 过 话 。
		};

		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_09"); //伯 斯 波 试 图 要 我 放 弃 。 他 自 己 想 让 你 做 他 的 学 徒 。
			if ((MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS))
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_10"); //关 于 这 件 事 ， 我 跟 他 进 行 了 一 次 简 短 但 激 烈 的 讨 论 。
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_11"); //最 后 ， 他 同 意 了 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_12"); //他 要 求 我 至 少 给 他 个 机 会 ， 让 你 看 看 是 否 会 对 他 的 专 业 感 兴 趣 。
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_13"); //看 一 看 - 然 后 再 作 决 定 。 除 非 你 不 想 要 他 的 投 票 ， 就 这 样 吧 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_14"); //伯 斯 波 还 不 认 识 你 。
		};

		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_15"); //像 往 常 一 样 ， 康 斯 坦 提 诺 对 任 何 事 情 都 不 关 心 。 他 说 ， 就 他 而 言 ， 你 可 以 从 你 喜 欢 的 任 何 地 方 开 始 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_16"); //康 斯 坦 提 诺 说 你 在 这 个 城 里 被 指 控 有 一 项 犯 罪 - 那 是 真 的 吗 ？
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_17"); //如 果 是 这 样 话 ， 那 么 你 就 必 须 立 即 澄 清 这 件 事 情 ！
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_18"); //康 斯 坦 提 诺 从 来 没 听 说 过 你 。
		};

		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_19"); //麦 迪 欧 说 你 帮 他 拿 回 了 他 的 金 子 。 我 看 你 是 个 值 得 尊 敬 的 年 青 人 。
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_20"); //麦 迪 欧 说 你 还 欠 他 一 些 东 西 。 我 不 知 道 你 们 之 间 的 事 ， 但 是 ， 你 必 须 澄 清 这 件 事 情 。
			}
			else
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_21"); //麦 迪 欧 说 他 从 来 没 有 跟 你 说 过 这 件 事 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_22"); //麦 迪 欧 说 他 从 来 没 有 在 他 的 商 店 里 见 过 你 。
		};

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_23"); //这 就 意 味 着 你 得 到 了 所 有 大 师 们 的 许 可 ！
			}
			else // == 4
			{
				AI_Output(self, other, "DIA_Harad_LEHRLING_12_24"); //这 就 意 味 着 你 得 到 了 四 位 大 师 的 许 可 。 那 就 足 够 成 为 一 个 学 徒 了 。
			};

			AI_Output(self, other, "DIA_Harad_LEHRLING_12_25"); //你 已 经 准 备 好 跟 我 一 起 开 始 你 的 学 徒 生 涯 了 吗 ？

			Info_ClearChoices(DIA_Harad_LEHRLING);
			Info_AddChoice(DIA_Harad_LEHRLING, "好 - 我 会 考 虑 的 。", DIA_Harad_LEHRLING_Later);
			Info_AddChoice(DIA_Harad_LEHRLING, "我 加 入 ！", DIA_Harad_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_26"); //你 需 要 得 到 至 少 四 位 大 师 的 许 可 才 能 在 城 市 的 贫 民 区 当 学 徒 。
			AI_Output(self, other, "DIA_Harad_LEHRLING_12_27"); //所 以 你 应 该 跟 所 有 还 不 信 任 你 的 大 师 谈 谈 。
		};
	}
	else // Mission nicht erfüllt
	{
		AI_Output(self, other, "DIA_Harad_LEHRLING_12_28"); //在 你 向 我 证 明 自 己 有 某 些 方 面 的 特 长 前 ， 不 行 ！
	};
};

func void DIA_Harad_LEHRLING_OK()
{
	AI_Output(other, self, "DIA_Harad_LEHRLING_OK_15_00"); //算 我 一 个 ！
	AI_Output(self, other, "DIA_Harad_LEHRLING_OK_12_01"); //很 好 ！ 我 会 教 你 怎 样 铸 造 一 把 像 样 的 剑 。

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other, self, "DIA_Harad_LEHRLING_OK_15_02"); //我 已 经 知 道 怎 么 做 了 ！
		AI_Output(self, other, "DIA_Harad_LEHRLING_OK_12_03"); //嗯 ， 那 样 更 好 ！
	};

	if (other.attribute[ATR_STRENGTH] < (T_MED - 30))
	{
		AI_Output(self, other, "DIA_Harad_LEHRLING_OK_12_04"); //除 了 这 个 ， 现 在 是 时 候 让 你 变 得 更 强 壮 一 些 了 。 我 看 着 你 日 渐 消 瘦 了 ！
	};

	Player_IsApprentice = APP_Harad;
	Npc_ExchangeRoutine(Lothar, "START");

	Harad_StartGuild = other.guild;

	Harad_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied", GIL_NONE);
	MIS_Apprentice = LOG_SUCCESS;
	B_LogEntry(Topic_Bonus, Topic_Bonus_3);
	Log_AddEntry(Topic_Bonus, Topic_Bonus_4);

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_GivePlayerXP(XP_Lehrling);
	Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_12);
	Info_ClearChoices(DIA_Harad_LEHRLING);
};

func void DIA_Harad_LEHRLING_Later()
{
	AI_Output(other, self, "DIA_Harad_LEHRLING_Later_15_00"); //好 - 我 会 考 虑 的 。
	if (!Npc_IsDead(Brian))
	{
		AI_Output(self, other, "DIA_Harad_LEHRLING_Later_12_01"); //慢 慢 来 。 布 赖 恩 还 会 在 这 里 呆 一 段 时 间 。
	};

	Info_ClearChoices(DIA_Harad_LEHRLING);
};

// *****************************************************
// 						Zustimmung
// *****************************************************
instance DIA_Harad_Zustimmung(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 2;
	condition		= DIA_Harad_Zustimmung_Condition;
	information		= DIA_Harad_Zustimmung_Info;
	permanent		= TRUE;
	description		= "我 可 以 做 其 它 大 师 的 学 徒 吗 ？";
};

func int DIA_Harad_Zustimmung_Condition()
{
	if ((Player_IsApprentice == APP_NONE)
	&& (Npc_KnowsInfo(other, DIA_Harad_Arbeit)))
	{
		return TRUE;
	};
};

// ------------------------------------
var int DIA_Harad_Zustimmung_Permanent;
// ------------------------------------

func void DIA_Harad_Zustimmung_Info()
{
	AI_Output(other, self, "DIA_Harad_Zustimmung_15_00"); //我 可 以 做 其 它 大 师 的 学 徒 吗 ？

	if ((MIS_Harad_Orc == LOG_SUCCESS)
	|| ((MIS_HakonBandits == LOG_SUCCESS) && (Harad_HakonMission == TRUE)))
	{
		AI_Output(self, other, "DIA_Harad_Zustimmung_12_01"); //你 是 一 个 好 人 。
		if (MIS_HakonBandits == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Harad_Zustimmung_12_02"); //哈 肯 告 诉 过 我 你 是 怎 么 对 付 那 些 强 盗 的 。
		};

		AI_Output(self, other, "DIA_Harad_Zustimmung_12_03"); //我 会 给 你 我 的 许 可 。

		if (DIA_Harad_Zustimmung_Permanent == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			DIA_Harad_Zustimmung_Permanent = TRUE;
		};

		B_LogEntry(Topic_Lehrling, Topic_Lehrling_7);

		if (!Npc_IsDead(Brian))
		{
			AI_Output(self, other, "DIA_Harad_Zustimmung_12_04"); //布 赖 恩 还 会 在 这 里 呆 一 段 时 间 。 而 且 ， 到 时 候 会 有 一 个 强 壮 的 小 伙 子 来 取 代 他 的 位 置 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Harad_Zustimmung_12_05"); //其 它 的 大 师 们 也 许 都 批 准 了 。 但 是 ， 你 必 须 先 向 我 证 明 自 己 有 某 些 方 面 的 特 长 ， 我 才 会 批 准 你 ！
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling
// *******************************************************
// ----------------------------------
var int Harad_MILKommentar;
var int Harad_PALKommentar;
var int Harad_INNOSKommentar;
// ----------------------------------
instance DIA_Harad_AlsLehrling(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_AlsLehrling_Condition;
	information		= DIA_Harad_AlsLehrling_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Harad_AlsLehrling_Condition()
{
	if ((Player_IsApprentice == APP_Harad)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Harad_AlsLehrling_Info()
{
	if ((other.guild == GIL_MIL)
	&& (Harad_StartGuild != GIL_MIL)
	&& (Harad_MILKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_00"); //你 现 在 是 民 兵 了 ？ 我 为 你 感 到 骄 傲 ！
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_01"); //只 要 你 在 军 队 里 ， 我 自 然 不 会 要 求 你 履 行 一 个 学 徒 的 职 责 。
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_02"); //不 过 ， 如 果 你 需 要 什 么 东 西 的 话 ， 可 以 随 时 来 找 我 。
		Harad_MILKommentar = TRUE;
	}

	else if ((other.guild == GIL_PAL)
	&& (Harad_StartGuild != GIL_PAL)
	&& (Harad_PALKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_03"); //你 设 法 让 圣 骑 士 接 受 你 了 ！
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_04"); //我 很 高 兴 能 收 你 作 学 徒 ， 即 便 你 没 有 在 铁 砧 后 面 花 很 多 功 夫 。

		Harad_PALKommentar = TRUE;
	}

	else if (((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	&& (Harad_StartGuild != GIL_NOV)
	&& (Harad_StartGuild != GIL_KDF)
	&& (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_05"); //那 么 ， 你 进 入 了 修 道 院 。 我 本 来 宁 可 要 你 呆 在 城 里 。 我 们 需 要 任 何 一 个 有 用 的 人 。
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_06"); //但 是 ， 如 果 你 必 须 追 随 英 诺 斯 的 召 唤 ， 那 就 只 能 这 样 了 。
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_07"); //如 果 你 想 找 我 要 什 么 东 西 的 话 ， 我 在 这 里 等 着 你 。
		Harad_INNOSKommentar = TRUE;
	}

	else if ((Harad_Lehrling_Day <= (Wld_GetDay() - 4))
	&& (Harad_MILKommentar == FALSE)
	&& (Harad_PALKommentar == FALSE)
	&& (Harad_INNOSKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_08"); //自 从 你 上 一 次 到 这 里 后 ， 已 经 有 一 阵 子 了 。 你 到 哪 里 去 闲 逛 去 了 ， 嗯 ？
		Harad_Lehrling_Day = Wld_GetDay();
	}

	else
	{
		AI_Output(self, other, "DIA_Harad_AlsLehrling_12_09"); //你 又 到 了 这 里 … …
		Harad_Lehrling_Day = Wld_GetDay();
	};
};

// *****************************************************
// 					Verkaufst du Waffen?
// *****************************************************
instance DIA_Harad_Waffen(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 3;
	condition		= DIA_Harad_Waffen_Condition;
	information		= DIA_Harad_Waffen_Info;
	description		= "你 也 出 售 武 器 吗 ？";
};

func int DIA_Harad_Waffen_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Harad_Waffen_Info()
{
	AI_Output(other, self, "DIA_Harad_Waffen_15_00"); //你 也 出 售 武 器 吗 ？
	AI_Output(self, other, "DIA_Harad_Waffen_12_01"); //算 了 吧 。 我 做 的 每 一 件 事 都 归 功 给 了 那 些 圣 骑 士 或 者 民 兵 。
	AI_Output(self, other, "DIA_Harad_Add_12_00"); //哈 根 勋 爵 委 任 我 筹 集 1 0 0 把 剑 。 他 想 把 城 市 守 卫 装 备 起 来 。
};

// *****************************************************
// 					Aufgaben als Lehrling
// *****************************************************
instance DIA_Harad_Aufgaben(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 1;
	condition		= DIA_Harad_Aufgaben_Condition;
	information		= DIA_Harad_Aufgaben_Info;
	description		= "我 做 学 徒 的 任 务 是 什 么 ？";
};

func int DIA_Harad_Aufgaben_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

func void DIA_Harad_Aufgaben_Info()
{
	AI_Output(other, self, "DIA_Harad_Aufgaben_15_00"); //我 做 学 徒 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Harad_Aufgaben_12_01"); //猜 三 次 。
	AI_Output(other, self, "DIA_Harad_Aufgaben_15_02"); //铸 造 、 铸 造 、 和 铸 造 ？
	AI_Output(self, other, "DIA_Harad_Aufgaben_12_03"); //你 并 不 像 你 看 起 来 那 样 沉 默 寡 言 。 我 为 每 一 把 剑 付 钱 。 如 果 你 不 工 作 ， 就 没 有 钱 。 就 是 这 么 简 单 。
	AI_Output(self, other, "DIA_Harad_Aufgaben_12_05"); //此 外 ， 我 会 教 你 一 切 关 于 铸 造 长 剑 的 技 能 。
	AI_Output(self, other, "DIA_Harad_Aufgaben_12_06"); //只 有 经 验 丰 富 的 铁 匠 才 能 制 造 魔 法 剑 - 而 你 离 这 还 差 得 远 … …
	AI_Output(self, other, "DIA_Harad_Aufgaben_12_07"); //如 果 你 要 睡 觉 ， 你 可 以 在 我 的 房 子 里 找 个 地 方 躺 下 。 现 在 什 么 都 清 楚 了 吗 ？
};

// ************************************************************
// 						Klingen verkaufen
// ************************************************************
instance DIA_Harad_SellBlades(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 200;
	condition		= DIA_Harad_SellBlades_Condition;
	information		= DIA_Harad_SellBlades_Info;
	permanent		= TRUE;
	description		= "我 想 出 售 我 铸 造 的 武 器 。";
};

func int DIA_Harad_SellBlades_Condition()
{
	if (Player_IsApprentice == APP_Harad)
	{
		return TRUE;
	};
};

func void DIA_Harad_SellBlades_Info()
{
	AI_Output(other, self, "DIA_Harad_SellBlades_15_00"); //我 想 出 售 我 铸 造 的 武 器 。

	var C_ITEM equipWeap; equipWeap = Npc_GetEquippedMeleeWeapon(other);

	var int anzahl_common; anzahl_common = Npc_HasItems(other, ItMw_1H_Common_01);
	if (Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE) { anzahl_common = anzahl_common - 1; };
	var int anzahl_schwert1; anzahl_schwert1 = Npc_HasItems(other, ItMw_Schwert1);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE) { anzahl_schwert1 = anzahl_schwert1 - 1; };
	var int anzahl_schwert4; anzahl_schwert4 = Npc_HasItems(other, ItMw_Schwert4);
	if (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE) { anzahl_schwert4 = anzahl_schwert4 - 1; };
	var int anzahl_rubinklinge; anzahl_rubinklinge = Npc_HasItems(other, ItMw_Rubinklinge);
	if (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE) { anzahl_rubinklinge = anzahl_rubinklinge - 1; };
	var int anzahl_elbastardo; anzahl_elbastardo = Npc_HasItems(other, ItMw_ElBastardo);
	if (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE) { anzahl_elbastardo = anzahl_elbastardo - 1; };
	var int gesamt; gesamt = (anzahl_common + anzahl_schwert1 + anzahl_schwert4 + anzahl_rubinklinge + anzahl_elbastardo);

	if (gesamt == 0)
	{
		if ((Hlp_IsItem(equipWeap, ItMw_1H_Common_01) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert1) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Schwert4) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_Rubinklinge) == TRUE)
		|| (Hlp_IsItem(equipWeap, ItMw_ElBastardo) == TRUE))
		{
			AI_Output(self, other, "DIA_Harad_SellBlades_12_01"); //你 的 全 部 家 当 就 是 你 腰 带 上 那 个 东 西 。 你 最 好 保 管 好 它 。
		}
		else
		{
			AI_Output(self, other, "DIA_Harad_SellBlades_12_04"); //那 就 做 一 些 ！ 我 只 要 长 剑 。
		};
	}
	else // (gesamt >= 1) - die verbeliebenden Klingen verkaufen ------
	{
		AI_Output(self, other, "DIA_Harad_SellBlades_12_02"); //好 - 给 我 吧 。

		Npc_RemoveInvItems(other, ItMw_1H_Common_01, anzahl_common);
		Npc_RemoveInvItems(other, ItMw_Schwert1, anzahl_Schwert1);
		Npc_RemoveInvItems(other, ItMw_Schwert4, anzahl_Schwert4);
		Npc_RemoveInvItems(other, ItMw_Rubinklinge, anzahl_Rubinklinge);
		Npc_RemoveInvItems(other, ItMw_ElBastardo, anzahl_ElBastardo);

		var string concatText;
		concatText = ConcatStrings(IntToString(gesamt), PRINT_ItemsGegeben); // "x Gegenstände gegeben"
		AI_PrintScreen(concatText, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);

		AI_Output(self, other, "DIA_Harad_SellBlades_12_03"); //不 错 ， 这 是 你 的 报 酬 。
		var int lohn;
		lohn = (anzahl_common * Value_Common1)
		+ (anzahl_schwert1 * Value_Schwert1)
		+ (anzahl_schwert4 * Value_Schwert4)
		+ (anzahl_rubinklinge * Value_Rubinklinge)
		+ (anzahl_elbastardo * Value_ElBastardo);

		lohn = (lohn / 3);

		B_GiveInvItems(self, other, itmi_gold, lohn);
	};
};

// ************************************************************
// 						Weapon_Common Lehrer
// ************************************************************
func void B_Harad_TeachSmith()
{
	AI_Output(self, other, "DIA_Harad_TeachCommon_12_01"); //这 非 常 简 单 ， 小 伙 子 。 找 一 块 生 铁 ， 把 它 放 到 火 里 一 直 烧 到 发 红 。
	AI_Output(self, other, "DIA_Harad_TeachCommon_12_02"); //然 后 在 铁 砧 上 把 刀 片 锤 打 成 型 。
};

// ------------------------------------------------------------
func void B_HaradSmithChoices()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
	Info_AddChoice(DIA_Harad_TeachSmith, DIALOG_BACK, DIA_Harad_TeachSmith_BACK);
	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_04, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_04)), DIA_Harad_TeachSmith_Harad04);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_03, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_03)), DIA_Harad_TeachSmith_Harad03);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_02, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_02)), DIA_Harad_TeachSmith_Harad02);
	};

	if ((PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	{
		Info_AddChoice(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_Addon_Harad_01, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_1H_Harad_01)), DIA_Harad_TeachSmith_Harad01);
	};

	if (PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
	{
		Info_AddChoice(DIA_Harad_TeachSmith, B_BuildLearnString(NAME_LEARN_SMITHING, B_GetLearnCostTalent(other, NPC_TALENT_SMITH, WEAPON_Common)), DIA_Harad_TeachSmith_Common);
	};
};

// ------------------------------------------------------------
instance DIA_Harad_TeachSmith(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 50;
	condition		= DIA_Harad_TeachSmith_Condition;
	information		= DIA_Harad_TeachSmith_Info;
	permanent		= TRUE;
	description		= "教 我 怎 么 锻 造 像 样 的 剑 ！";
};

func int DIA_Harad_TeachSmith_Condition()
{
	if (Player_IsApprentice == APP_Harad)
	{
		if ((PLAYER_TALENT_SMITH[WEAPON_Common] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == FALSE)
		|| (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == FALSE))
		{
			return TRUE;
		};
	};
};

func void DIA_Harad_TeachSmith_Info()
{
	AI_Output(other, self, "DIA_Harad_TeachCommon_15_00"); //教 我 怎 么 锻 造 像 样 的 剑 ！

	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_BACK()
{
	Info_ClearChoices(DIA_Harad_TeachSmith);
};

func void DIA_Harad_TeachSmith_Common()
{
	if (B_TeachPlayerTalentSmith(self, other, WEAPON_Common))
	{
		B_Harad_TeachSmith();
		AI_Output(self, other, "DIA_Harad_TeachCommon_12_03"); //你 的 第 一 把 剑 不 会 是 什 么 大 作 ， 但 是 ， 你 以 后 就 能 学 会 其 它 所 有 的 东 西。
	};

	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad01()
{
	if (B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Harad_01))
	{
		B_Harad_TeachSmith();
	};

	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad02()
{
	if (B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Harad_02))
	{
		B_Harad_TeachSmith();
	};

	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad03()
{
	if (B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Harad_03))
	{
		B_Harad_TeachSmith();
	};

	B_HaradSmithChoices();
};

func void DIA_Harad_TeachSmith_Harad04()
{
	if (B_TeachPlayerTalentSmith(self, other, WEAPON_1H_Harad_04))
	{
		B_Harad_TeachSmith();
	};

	B_HaradSmithChoices();
};

// ************************************************************
// 							STR Lehrer bis 50
// ************************************************************
// -------------------------
var int Harad_Merke_STR;
// -------------------------
instance DIA_Harad_TeachSTR(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 100;
	condition		= DIA_Harad_TeachSTR_Condition;
	information		= DIA_Harad_TeachSTR_Info;
	permanent		= TRUE;
	description		= "我 想 变 得 更 强 壮 ！";
};

func int DIA_Harad_TeachSTR_Condition()
{
	if (Player_IsApprentice == APP_HARAD)
	{
		return TRUE;
	};
};

func void DIA_Harad_TeachSTR_Info()
{
	AI_Output(other, self, "DIA_Harad_TeachSTR_15_00"); //我 想 变 得 更 强 壮 ！

	Harad_Merke_STR = other.attribute[ATR_STRENGTH];

	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Harad_TeachSTR_5);
};

func void DIA_Harad_TeachSTR_BACK()
{
	if (Harad_Merke_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self, other, "DIA_Harad_TeachSTR_BACK_12_01"); //你 已 经 练 出 了 一 点 肌 肉 。
	};

	if (other.attribute[ATR_STRENGTH] < T_MED)
	{
		AI_Output(self, other, "DIA_Harad_TeachSTR_BACK_12_02"); //如 果 你 想 学 习 更 多 的 东 西 就 回 这 里 来，
	};

	Info_ClearChoices(DIA_Harad_TeachSTR);
};

func void DIA_Harad_TeachSTR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Harad_TeachSTR_5);
};

// ------ 5 Stärke ------
func void DIA_Harad_TeachSTR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Harad_TeachSTR);
	Info_AddChoice(DIA_Harad_TeachSTR, DIALOG_BACK, DIA_Harad_TeachSTR_BACK);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Harad_TeachSTR_1);
	Info_AddChoice(DIA_Harad_TeachSTR, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Harad_TeachSTR_5);
};

// ############################
// ## ##
// ## Kapitel 2 ##
// ## ##
// ############################

// *****************************************************
// 					Immer noch
// *****************************************************
instance DIA_Harad_ImmerNoch(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 3;
	condition		= DIA_Harad_ImmerNoch_Condition;
	information		= DIA_Harad_ImmerNoch_Info;
	description		= "你 还 在 为 圣 骑 士 工 作 吗 ？";
};

func int DIA_Harad_ImmerNoch_Condition()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Harad_ImmerNoch_Info()
{
	AI_Output(other, self, "DIA_Harad_Add_15_01"); //你 还 在 为 圣 骑 士 工 作 吗 ？
	AI_Output(self, other, "DIA_Harad_Add_12_02"); //我 完 成 了 哈 根 勋 爵 委 任 的 事 情 。
	AI_Output(self, other, "DIA_Harad_Add_12_03"); //现 在 我 在 为 他 制 造 魔 法 矿 石 剑 - 不 过 这 一 次 有 报 酬 。
	AI_Output(self, other, "DIA_Harad_Add_12_04"); //不 过 还 是 有 时 间 给 市 场 里 的 商 人 制 造 几 把 武 器 。
	AI_Output(self, other, "DIA_Harad_Add_12_05"); //那 么 ， 如 果 你 正 在 找 一 把 好 剑 ， 你 可 以 找 他 们 试 试 。
};

// *****************************************************
// 					About Erzklingen
// *****************************************************
instance DIA_Harad_AboutErzklingen(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 3;
	condition		= DIA_Harad_AboutErzklingen_Condition;
	information		= DIA_Harad_AboutErzklingen_Info;
	description		= "告 诉 我 关 于 魔 法 矿 石 剑 的 事 ！";
};

func int DIA_Harad_AboutErzklingen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Harad_ImmerNoch))
	{
		return TRUE;
	};
};

func void DIA_Harad_AboutErzklingen_Info()
{
	AI_Output(other, self, "DIA_Harad_Add_15_06"); //告 诉 我 关 于 魔 法 矿 石 剑 的 事 ！
	AI_Output(self, other, "DIA_Harad_Waffen_12_02"); //制 造 一 把 魔 法 剑 是 一 个 非 常 复 杂 而 且 昂 贵 的 过 程 ， 但 是 它 的 结 果 是 一 把 操 作 简 便 而 且 几 乎 牢 不 可 破 的 剑 。
	AI_Output(self, other, "DIA_Harad_Waffen_12_03"); //这 样 的 剑 当 然 是 质 量 优 良 的 ， 但 它 只 能 在 圣 骑 士 的 手 中 显 示 出 真 正 的 威 力 。
	AI_Output(self, other, "DIA_Harad_Waffen_12_04"); //一 把 圣 骑 士 的 剑 是 以 英 诺 斯 的 名 义 被 圣 化 的 。 因 此 ， 魔 法 剑 成 为 了 被 施 过 魔 法 的 武 器 而 能 造 成 无 与 伦 比 的 伤 害 ！
};

// *****************************************************
// 					Ich möchte eine Erzklinge kaufen
// *****************************************************
instance DIA_Harad_Erzklingen(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 3;
	condition		= DIA_Harad_Erzklingen_Condition;
	information		= DIA_Harad_Erzklingen_Info;
	permanent		= TRUE;
	description		= "我 想 要 买 魔 法 矿 石 剑";
};

func int DIA_Harad_Erzklingen_Condition()
{
	if ((OreBladeBought == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Harad_AboutErzklingen)))
	{
		return TRUE;
	};
};

// ---------------------------------------------

var int OreBladeBought;

// ---------------------------------------------

func void DIA_Harad_Erzklingen_Info()
{
	AI_Output(other, self, "DIA_Harad_Erzklingen_15_00"); //我 想 要 买 魔 法 矿 石 剑 。
	if (hero.guild != GIL_PAL)
	{
		AI_Output(self, other, "DIA_Harad_Erzklingen_12_01"); //我 只 能 把 魔 法 剑 卖 给 圣 骑 士 。 即 使 是 这 样 ， 每 人 也 只 能 拿 一 把 。
	}
	else
	{
		AI_Output(self, other, "DIA_Harad_Erzklingen_12_02"); //你 们 圣 骑 士 应 该 能 感 到 自 己 的 幸 运 ， 因 为 你 们 可 以 使 用 如 此 卓 越 的 剑 。
		AI_Output(self, other, "DIA_Harad_Erzklingen_12_03"); //根 据 哈 根 勋 爵 的 法 令 ， 我 只 能 卖 给 你 一 把 魔 法 武 器 。
		AI_Output(self, other, "DIA_Harad_Erzklingen_12_04"); //那 么 ， 我 能 为 你 提 供 什 么 ？

		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen, DIALOG_BACK, DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, "双 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, "单 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_Back()
{
	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void B_Harad_NotEnoughGold()
{
	AI_Output(self, other, "B_Harad_NotEnoughGold_12_00"); //你 没 有 足 够 的 金 币 。
};

func void B_Harad_HaveFunWithYourSword()
{
	AI_Output(self, other, "B_Harad_HaveGunWithYourSword_12_00"); //好 好 看 管 好 你 的 新 武 器 。 它 是 一 大 笔 财 富 。

	OreBladeBought = TRUE;

	Info_ClearChoices(DIA_Harad_Erzklingen);
};

func void DIA_Harad_Erzklingen_2h()
{
	AI_Output(other, self, "DIA_Harad_Erzklingen_2h_15_00"); //我 会 选 择 双 手 魔 法 矿 石 剑 ！

	if (Npc_HasItems(other, ItMi_Gold) >= Value_Blessed_2H_1)
	{
		B_GiveInvItems(other, self, ItMi_Gold, Value_Blessed_2H_1);
		CreateInvItems(self, ItMw_2H_Blessed_01, 1);
		B_GiveInvItems(self, other, ItMw_2H_Blessed_01, 1);

		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen, DIALOG_BACK, DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, "双 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, "单 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_1h);
	};
};

func void DIA_Harad_Erzklingen_1h()
{
	AI_Output(other, self, "DIA_Harad_Erzklingen_1h_15_00"); //我 会 选 择 单 手 魔 法 矿 石 剑 ！

	if (Npc_HasItems(other, ItMi_Gold) >= Value_Blessed_1H_1)
	{
		B_GiveInvItems(other, self, ItMi_Gold, Value_Blessed_1H_1);
		CreateInvItems(self, ItMw_1H_Blessed_01, 1);
		B_GiveInvItems(self, other, ItMw_1H_Blessed_01, 1);

		B_Harad_HaveFunWithYourSword();
	}
	else
	{
		B_Harad_NotEnoughGold();
		Info_ClearChoices(DIA_Harad_Erzklingen);
		Info_AddChoice(DIA_Harad_Erzklingen, DIALOG_BACK, DIA_Harad_Erzklingen_Back);
		Info_AddChoice(DIA_Harad_Erzklingen, "双 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_2h);
		Info_AddChoice(DIA_Harad_Erzklingen, "单 手 魔 法 矿 石 剑 （ ２ ０ ０ ０ 金 币 ）", DIA_Harad_Erzklingen_1h);
	};
};

// ############################
// ## ##
// ## Kapitel 3 ##
// ## ##
// ############################

//*********************************************************************
//	Kannst du auch Schmuckstücke reparieren?
//*********************************************************************
instance DIA_Harad_RepairNecklace(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 8;
	condition		= DIA_Harad_RepairNecklace_Condition;
	information		= DIA_Harad_RepairNecklace_Info;
	description		= "你 能 修 理 首 饰 吗 ？";
};

func int DIA_Harad_RepairNecklace_Condition()
{
	if ((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS)
	&& ((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS))
	|| (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Harad_RepairNecklace_Info()
{
	AI_Output(other, self, "DIA_Harad_RepairNecklace_15_00"); //你 能 修 理 首 饰 吗 ？
	AI_Output(self, other, "DIA_Harad_RepairNecklace_12_01"); //我 是 个 制 造 武 器 的 铁 匠 ， 不 是 金 匠 。 你 也 许 在 城 里 找 不 到 人 来 帮 你 。
	AI_Output(self, other, "DIA_Harad_RepairNecklace_12_02"); //人 们 口 袋 里 已 经 没 有 钱 了 ， 很 长 时 间 以 来 ， 这 里 没 人 发 财 。
	AI_Output(self, other, "DIA_Harad_RepairNecklace_12_03"); //他 们 大 部 分 人 只 要 有 足 够 的 东 西 吃 就 非 常 高 兴 了 。

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};

//*********************************************************************
//	Wo finde ich einen Goldschmied?
//*********************************************************************
instance DIA_Harad_Goldsmith(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 8;
	condition		= DIA_Harad_Goldsmith_Condition;
	information		= DIA_Harad_Goldsmith_Info;
	description		= "我 在 哪 里 能 找 到 金 匠 ？";
};

func int DIA_Harad_Goldsmith_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Harad_RepairNecklace))
	{
		return TRUE;
	};
};

func void DIA_Harad_Goldsmith_Info()
{
	AI_Output(other, self, "DIA_Harad_Goldsmith_15_00"); //我 在 哪 里 能 找 到 金 匠 ？
	AI_Output(self, other, "DIA_Harad_Goldsmith_12_01"); //也 许 欧 纳 尔 农 场 里 的 雇 佣 兵 中 有 个 好 铁 匠 。
	AI_Output(self, other, "DIA_Harad_Goldsmith_12_02"); //也 许 你 应 该 去 那 里 看 看 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Harad_PICKPOCKET(C_INFO)
{
	npc				= VLK_412_Harad;
	nr				= 900;
	condition		= DIA_Harad_PICKPOCKET_Condition;
	information		= DIA_Harad_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Harad_PICKPOCKET_Condition()
{
	C_Beklauen(14, 35);
};

func void DIA_Harad_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
	Info_AddChoice(DIA_Harad_PICKPOCKET, DIALOG_BACK, DIA_Harad_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Harad_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Harad_PICKPOCKET_DoIt);
};

func void DIA_Harad_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};

func void DIA_Harad_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Harad_PICKPOCKET);
};
