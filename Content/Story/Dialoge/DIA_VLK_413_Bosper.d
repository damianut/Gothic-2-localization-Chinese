// ***********************************************************
// 							EXIT
// ***********************************************************
instance DIA_Bosper_EXIT(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 999;
	condition		= DIA_Bosper_EXIT_Condition;
	information		= DIA_Bosper_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bosper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bosper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***********************************************************
// 							Hallo
// ***********************************************************
instance DIA_Bosper_HALLO(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 2;
	condition		= DIA_Bosper_HALLO_Condition;
	information		= DIA_Bosper_HALLO_Info;
	important		= TRUE;
};

func int DIA_Bosper_HALLO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Bosper_HALLO_Info()
{
	AI_Output(self, other, "DIA_Bosper_HALLO_11_00"); //欢 迎 你 来 到 我 的 商 店 ， 陌 生 人 ！
	AI_Output(self, other, "DIA_Bosper_HALLO_11_01"); //我 是 伯 斯 波 。 我 制 作 弓 箭 并 买 卖 兽 皮 。
	AI_Output(self, other, "DIA_Bosper_HALLO_11_02"); //是 什 么 风 把 你 带 到 了 克 霍 里 尼 斯 ？

	Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_10);
};

// ***********************************************************
// 						 	IntoOV // e1
// ***********************************************************
instance DIA_Bosper_IntoOV(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 1;
	condition		= DIA_Bosper_IntoOV_Condition;
	information		= DIA_Bosper_IntoOV_Info;
	description		= "我 需 要 进 入 富 人 区 … …";
};

func int DIA_Bosper_IntoOV_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_IntoOV_Info()
{
	AI_Output(other, self, "DIA_Bosper_IntoOV_15_00"); //我 需 要 进 入 富 人 区 … …
	AI_Output(self, other, "DIA_Bosper_IntoOV_11_01"); //那 些 圣 骑 士 在 哪 里 ？ 别 管 了 。
	AI_Output(self, other, "DIA_Bosper_IntoOV_11_02"); //在 这 里 ， 你 必 须 成 为 一 个 受 尊 敬 的 市 民 ， 或 者 至 少 找 一 个 像样 的 工 作 。
	AI_Output(self, other, "DIA_Bosper_IntoOV_11_03"); //作 为 一 个 陌 生 人 ， 你 没 有 机 会 进 去 。
	if (Torwache_305.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other, self, "DIA_Bosper_IntoOV_15_04"); //所 以 我 注 意 到 … …
	};

	Log_CreateTopic(TOPIC_OV, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV, LOG_RUNNING);
	B_LogEntry(TOPIC_OV, TOPIC_OV_4);
};

// ***********************************************************
// 						 	SeekWork // e1
// ***********************************************************
instance DIA_Bosper_SeekWork(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 2;
	condition		= DIA_Bosper_SeekWork_Condition;
	information		= DIA_Bosper_SeekWork_Info;
	description		= "我 在 找 工 作 ！";
};

func int DIA_Bosper_SeekWork_Condition()
{
	return TRUE;
};

func void DIA_Bosper_SeekWork_Info()
{
	AI_Output(other, self, "DIA_Bosper_SeekWork_15_00"); //我 在 找 工 作 ！
	AI_Output(self, other, "DIA_Bosper_SeekWork_11_01"); //嗯 - 我 需 要 一 个 学 徒 。
	AI_Output(self, other, "DIA_Bosper_SeekWork_11_02"); //上 一 个 学 徒 两 天 前 放 弃 了 他 的 工 作 。
	AI_Output(self, other, "DIA_Bosper_SeekWork_11_03"); //你 了 解 一 些 捕 猎 的 事 ， 是 吗 ？
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(other, self, "DIA_Bosper_SeekWork_15_04"); //好 … …
		AI_Output(self, other, "DIA_Bosper_SeekWork_11_05"); //我 可 以 教 你 怎 样 剥 动 物 的 皮 。
		AI_Output(self, other, "DIA_Bosper_SeekWork_11_06"); //我 会 用 不 错 的 价 钱 收 购 你 带 来 的 兽 皮 。
	}
	else
	{
		AI_Output(other, self, "DIA_Bosper_SeekWork_15_07"); //如 果 你 要 的 话 ， 我 可 以 给 你 弄 些 兽 皮 。
		AI_Output(self, other, "DIA_Bosper_SeekWork_11_08"); //好 极 了 ！ 给 我 所 有 你 能 弄 到 的 兽 皮 - 我 会 花 高 价 向 你 收 购 。
	};

	B_LogEntry(TOPIC_Lehrling, TOPIC_Lehrling_15);
};

// ***********************************************************
// 						 	LEHRLING // e2 PERM
// ***********************************************************
// ----------------------
var int Bosper_HintToJob;
var int Bosper_StartGuild;
// ----------------------
instance DIA_Bosper_LEHRLING(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 2;
	condition		= DIA_Bosper_LEHRLING_Condition;
	information		= DIA_Bosper_LEHRLING_Info;
	permanent		= TRUE;
	description		= "我 想 开 始 做 你 的 学 徒 ！";
};

func int DIA_Bosper_LEHRLING_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;

	AI_Output(other, self, "DIA_Bosper_LEHRLING_15_00"); //我 想 开 始 做 你 的 学 徒 ！

	if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
	{
		// ------ Bosper ------
		AI_Output(self, other, "DIA_Bosper_LEHRLING_11_01"); //（ 咧 着 嘴 笑 ） 好 极 了 ！ 你 看 起 来 已 经 掌 握 了 一 些 要 领 。
		stimmen = stimmen + 1;

		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if ((MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS))
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_02"); //哈 莱 德 认 为 你 是 个 好 人 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_03"); //不 过 哈 莱 德 不 相 信 你 的 能 力 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_04"); //不 过 哈 莱 德 说 他 从 来 没 有 见 过 你 。
		};

		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_05"); //托 尔 本 给 了 你 他 的 祝 福 。 我 不 是 那 么 虔 诚 ， 但 是 ， 我 觉 得 这 样 很 好 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_06"); //托 尔 本 只 有 在 你 得 到 神 的 祝 福 后 才 会 同 意 你 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_07"); //托 尔 本 不 知 道 你 是 谁 。
		};

		// ------ Constantino ------
		if (Constantino.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_08"); //康 斯 坦 提 诺 说 你 想 在 哪 里 都 行 ， 与 他 无 关 。
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_09"); //康 斯 坦 提 诺 说 你 在 城 里 被 指 控 一 项 罪 名 - 我 希 望 那 不 是 什 么 大 不 了 的 事 情 ？
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_10"); //要 保 证 事 情 都 被 澄 清 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_11"); //康 斯 坦 提 诺 从 来 没 听 说 过 你 。
		};

		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_12"); //麦 迪 欧 还 说 你 非 常 有 价 值 。
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_13"); //麦 迪 欧 还 提 起 了 一 些 债 务 - 他 说 的 是 什 么 东 西 ， 你 最 好 跟 他 谈 谈 。
			}
			else
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_14"); //麦 迪 欧 说 他 还 没 跟 你 谈 过 这 件 事 。
			};
		}
		else // noch kein Dialog
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_15"); //麦 迪 欧 说 他 以 前 从 来 没 有 见 过 你 。
		};

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_16"); //这 意 味 着 你 已 经 得 到 了 所 有 的 大 师 的 赞 同 ！
			}
			else // == 4
			{
				AI_Output(self, other, "DIA_Bosper_LEHRLING_11_17"); //你 已 经 得 到 了 四 位 大 师 的 赞 同 。 那 将 足 够 让 你 被 接 受 成 为 一 名 学 徒 了 。
			};

			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_18"); //如 果 你 愿 意 ， 你 可 以 随 时 来 为 我 工 作 。

			Info_ClearChoices(DIA_Bosper_LEHRLING);
			Info_AddChoice(DIA_Bosper_LEHRLING, "好 - 我 会 考 虑 的 。", DIA_Bosper_LEHRLING_Later);
			Info_AddChoice(DIA_Bosper_LEHRLING, "我 加 入 ！", DIA_Bosper_LEHRLING_OK);
		}
		else // stimmen < 4
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_19"); //你 需 要 得 到 至 少 四 位 大 师 的 许 可 才 能 在 城 里 的 贫 民 区 开 始 你 的 学 徒 生 涯 。
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_20"); //这 意 味 着 你 应 该 去 跟 所 有 还 不 完 全 赞 成 你 的 大 师 们 谈 谈 。
		};
	}
	else // keine WolfFurs
	{
		AI_Output(self, other, "DIA_Bosper_LEHRLING_11_21"); //当 然 ， 在 我 接 受 你 之 前 ， 我 必 须 知 道 你 是 不 是 有 某 些 长 处 。

		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Bosper_LEHRLING_11_22"); //你 帮 我 拿 回 了 我 的 弓 ， 但 那 并 不 十 分 表 示 你 有 猎 人 的 天 分 。
		};

		Bosper_HintToJob = TRUE;
	};
};

func void DIA_Bosper_LEHRLING_OK()
{
	AI_Output(other, self, "DIA_Bosper_LEHRLING_OK_15_00"); //我 加 入 ！
	AI_Output(self, other, "DIA_Bosper_LEHRLING_OK_11_01"); //你 不 会 为 此 而 后 悔 的 ！ 我 觉 得 我 们 会 在 一 起 工 作 得 很 愉 快 。

	Player_IsApprentice = APP_BOSPER;
	Npc_ExchangeRoutine(Lothar, "START");

	Bosper_StartGuild = other.guild;

	Bosper_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta", GIL_NONE); // = Bospers Ladem
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP(XP_Lehrling);
	B_LogEntry(Topic_Bonus, Topic_Bonus_9);

	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

func void DIA_Bosper_LEHRLING_Later()
{
	AI_Output(other, self, "DIA_Bosper_LEHRLING_Later_15_00"); //好 - 我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Bosper_LEHRLING_Later_11_01"); //不 要 作 出 错 误 的 决 定 ！ 你 更 适 合 我 。

	Info_ClearChoices(DIA_Bosper_LEHRLING);
};

// ***********************************************************
// 						OtherMasters // e2
// ***********************************************************
instance DIA_Bosper_OtherMasters(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 3;
	condition		= DIA_Bosper_OtherMasters_Condition;
	information		= DIA_Bosper_OtherMasters_Info;
	description		= "如 果 我 又 和 其 它 大 师 签 约 呢 ？";
};

func int DIA_Bosper_OtherMasters_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_OtherMasters_Info()
{
	AI_Output(other, self, "DIA_Bosper_OtherMasters_15_00"); //如 果 我 又 和 其 它 大 师 签 约 呢 ？
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_01"); //（ 暴 躁 的 ） 胡 言 乱 语 ！
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_02"); //哈 莱 德 和 麦 迪 欧 都 已 经 有 学 徒 了 。
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_03"); //炼 金 术 士 康 斯 坦 提 诺 是 独 自 一 人 - 他 很 多 年 都 没 收 过 学 徒 了 。
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_04"); //至 于 托 尔 本 - 每 个 人 都 知 道 他 身 无 分 文 - 他 可 能 连 你 的 报 酬 都 付 不 出 。
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_05"); //另 一 方 面 ， 我 十 分 需 要 一 个 学 徒 - 而 且 我 付 的 报 酬 不 低 。
	AI_Output(self, other, "DIA_Bosper_OtherMasters_11_06"); //不 过 无 论 你 想 在 哪 里 签 约 - 你 必 须 得 到 城 里 贫 民 区 的 其 它 大 师 的 许 可 … …
};

// ***********************************************************
// 							Bartok // e2
// ***********************************************************
instance DIA_Bosper_Bartok(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 4;
	condition		= DIA_Bosper_Bartok_Condition;
	information		= DIA_Bosper_Bartok_Info;
	description		= "你 的 学 徒 为 什 么 要 放 弃 他 的 工 作 ？";
};

func int DIA_Bosper_Bartok_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bosper_SeekWork))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Bartok_Info()
{
	AI_Output(other, self, "DIA_Bosper_Bartok_15_00"); //你 的 学 徒 为 什 么 要 放 弃 他 的 工 作 ？
	AI_Output(self, other, "DIA_Bosper_Bartok_11_01"); //他 只 说 外 面 已 经 变 得 太 危 险 了 。
	AI_Output(self, other, "DIA_Bosper_Bartok_11_02"); //如 果 你 真 的 感 兴 趣 ， 那 你 可 以 自 己 去 问 问 他 。
	AI_Output(self, other, "DIA_Bosper_Bartok_11_03"); //他 的 名 字 叫 做 巴 尔 托 克 。 他 可 能 在 科 拉 贡 的 酒 馆 附 近 转 悠 。
	AI_Output(self, other, "DIA_Bosper_Bartok_11_04"); //从 铁 匠 铺 那 里 的 地 下 通 道 穿 过 去 ， 你 就 能 直 接 往 那 里 去 了 。
};

// ***********************************************************
// 						ZUSTIMMUNG // e3 PERM
// ***********************************************************
instance DIA_Bosper_ZUSTIMMUNG(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 3;
	condition		= DIA_Bosper_ZUSTIMMUNG_Condition;
	information		= DIA_Bosper_ZUSTIMMUNG_Info;
	permanent		= TRUE;
	description		= "我 能 得 到 你 的 许 可 去 跟 另 外 一 位 大 师 签 约 吗 ？";
};

func int DIA_Bosper_ZUSTIMMUNG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

var int Bosper_Zustimmung_Once;

func void DIA_Bosper_ZUSTIMMUNG_Info()
{
	AI_Output(other, self, "DIA_Bosper_ZUSTIMMUNG_15_00"); //我 能 得 到 你 的 许 可 去 跟 另 外 一 位 大 师 签 约 吗 ？
	if ((MIS_Bosper_Bogen == LOG_SUCCESS)
	|| (MIS_Bosper_WolfFurs == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_01"); //（ 失 望 的 ） 我 本 来 希 望 你 能 选 择 我 。
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_02"); //不 过 ， 如 果 你 希 望 这 样 的 话 … …
		AI_Output(other, self, "DIA_Bosper_ZUSTIMMUNG_15_03"); //这 就 是 说 你 会 为 我 投 票 ？
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_04"); //如 果 没 有 别 的 大 师 反 对 的 话 - 是 的 。
		if (MIS_Bosper_Bogen == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_05"); //无 论 如 何 ， 你 拿 回 了 我 的 弓 。
		};

		if (MIS_Bosper_WolfFurs == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_06"); //但 是 ， 你 本 来 肯 定 能 成 为 一 个 好 猎 手 。
		};

		if (Bosper_Zustimmung_Once == FALSE)
		{
			B_GivePlayerXP(XP_Zustimmung);
			Bosper_Zustimmung_Once = TRUE;
		};

		B_LogEntry(Topic_Lehrling, Topic_Lehrling_16);
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_07"); //（ 叹 息 ） 好 吧 ！ 你 可 以 得 到 我 的 许 可 - 但 是 有 一 个 条 件 。
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_08"); //为 我 工 作 ， 至 少 很 短 的 一 段 时 间 里 。
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_09"); //那 样 你 就 能 发 现 自 己 是 否 喜 欢 我 的 工 作 了 。
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_10"); //谁 知 道 呢 - 也 许 你 会 不 再 喜 欢 它 ， 然 后 你 会 跟 我 呆 在 一 起 。
		AI_Output(self, other, "DIA_Bosper_ZUSTIMMUNG_11_11"); //如 果 你 够 格 跟 我 签 约 ， 你 也 同 样 够 格 跟 这 里 的 其 它 人 。
		Bosper_HintToJob = TRUE;
	};
};

// ***********************************************************
// 							Job // e3
// ***********************************************************
instance DIA_Bosper_Job(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 2;
	condition		= DIA_Bosper_Job_Condition;
	information		= DIA_Bosper_Job_Info;
	description		= "你 想 让 我 帮 你 做 什 么 ？";
};

func int DIA_Bosper_Job_Condition()
{
	if (Bosper_HintToJob == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Job_Info()
{
	AI_Output(other, self, "DIA_Bosper_Job_15_00"); //你 想 让 我 帮 你 做 什 么 ？

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self, other, "DIA_Bosper_Job_11_01"); //我 会 教 你 怎 样 剥 动 物 的 皮 ， 然 后 你 给 我 拿 来 - 这 样 吧 （ 6 张 ） 半 打 狼 皮 。

		Log_CreateTopic(TOPIC_CityTeacher, LOG_NOTE);
		B_LogEntry(TOPIC_CityTeacher, Topic_CityTeacher_17);
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_Job_11_02"); //带 给 我 （ 6 张 ） 半 打 狼 皮 。
	};

	AI_Output(self, other, "DIA_Bosper_Job_11_03"); //那 我 就 知 道 你 已 经 学 会 了 你 该 做 的 事 。
	AI_Output(self, other, "DIA_Bosper_Job_11_04"); //如 果 你 没 有 为 此 花 太 长 的 时 间 ， 而 且 那 些 兽 皮 的 质 量 还 能 接 受 的 话 ， 我 就 会 接 收 你 ， 如 果 你 愿 意 的 话 。
	if (Npc_KnowsInfo(other, DIA_Bosper_OtherMasters))
	{
		AI_Output(self, other, "DIA_Bosper_Job_11_05"); //或 者 （ 叹 息 ） 你 可 以 开 始 跟 随 其 它 任 何 一 位 大 师 - 如 果 真 的 那 样 想 的 话 。
	};

	MIS_Bosper_WolfFurs = LOG_RUNNING;

	Log_CreateTopic(TOPIC_BosperWolf, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperWolf, LOG_RUNNING);
	B_LogEntry(TOPIC_BosperWolf, TOPIC_BosperWolf_1);

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		B_LogEntry(TOPIC_BosperWolf, TOPIC_BosperWolf_2);
	};
};

// ***********************************************************
// 					Ich hab deine Felle // e4
// ***********************************************************
instance DIA_Bosper_BringFur(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 102;
	condition		= DIA_Bosper_BringFur_Condition;
	information		= DIA_Bosper_BringFur_Info;
	permanent		= TRUE;
	description		= "关 于 狼 皮 … …";
};

func int DIA_Bosper_BringFur_Condition()
{
	if (MIS_Bosper_WolfFurs == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BringFur_Info()
{
	AI_Output(other, self, "DIA_Bosper_BringFur_15_00"); //关 于 狼 皮 … …

	if (Player_IsApprentice > APP_NONE)
	{
		AI_Output(self, other, "DIA_Bosper_BringFur_11_01"); //你 现 在 已 经 是 另 一 位 大 师 的 学 徒 了 。 我 会 按 照 普 通 价 格 从 你 这 里 买 下 这 些 兽 皮 。
		MIS_Bosper_WolfFurs = LOG_OBSOLETE;
		return;
	};

	if (B_GiveInvItems(other, self, ItAt_WolfFur, 6))
	{
		AI_Output(other, self, "DIA_Bosper_BringFur_15_02"); //我 弄 到 它 们 了 - 在 这 里 。
		AI_Output(self, other, "DIA_Bosper_BringFur_11_03"); //好 极 了 ！ 我 就 知 道 你 很 适 合 这 个 工 作 。
		AI_Output(self, other, "DIA_Bosper_BringFur_11_04"); //这 是 我 答 应 过 你 的 报 酬 。
		B_GiveInvItems(self, other, itmi_gold,(Value_WolfFur * 6));
		AI_Output(self, other, "DIA_Bosper_BringFur_11_05"); //还 有 吗 ？ 你 怎 么 想 ？ 难 道 这 份 工 作 不 比 整 天 忙 忙 碌 碌 地 铸 剑 或 是 在 一 个 脏 乱 的 房 间 里 灌 装 一 些 小 瓶 子 要 好 得 多 ？

		MIS_Bosper_WolfFurs = LOG_SUCCESS;
		B_LogEntry(Topic_Lehrling, TOPIC_Lehrling_5);
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_BringFur_11_06"); //我 们 说 好 是 （ 6 张 ）半 打 - 还 不 够 ，你 还 有 时 间 ， 去 再 弄 点 兽 皮 ！
	};
};

// ***********************************************************
// 							TeachFUR // e4
// ***********************************************************
instance DIA_Bosper_TeachFUR(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 2;
	condition		= DIA_Bosper_TeachFUR_Condition;
	information		= DIA_Bosper_TeachFUR_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 剥 动 物 皮 ！ （ ５L P ）";
};

func int DIA_Bosper_TeachFUR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bosper_Job))
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bosper_TeachFUR_Info()
{
	AI_Output(other, self, "DIA_Bosper_TeachFUR_15_00"); //教 我 如 何 剥 动 物 皮 ！

	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur))
	{
		AI_Output(self, other, "DIA_Bosper_TeachFUR_11_01"); //好 的 ， 听 着 。 这 非 常 容 易 ， 真 的 。
		AI_Output(self, other, "DIA_Bosper_TeachFUR_11_02"); //拿 一 把 尖 刀 划 开 动 物 的 肚 子 。 然 后 在 腿 部 内 侧 划 开 几 条 小 口 子 ， 这 样 就 能 把 皮 剥 下 来 了 。
		if (MIS_Bosper_WolfFurs == LOG_RUNNING)
		{
			AI_Output(self, other, "DIA_Bosper_TeachFUR_11_03"); //给 我 带 一 些 狼 皮 来 ， 我 们 再 看 看 … …
			B_LogEntry(TOPIC_BosperWolf, TOPIC_BosperWolf_3);
		};
	};
};

// **************************************************************
// 							TRADE
// **************************************************************
instance DIA_Bosper_Trade(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 700;
	condition		= DIA_Bosper_Trade_Condition;
	information		= DIA_Bosper_Trade_Info;
	permanent		= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Bosper_Trade_Condition()
{
	if (MIS_Bosper_WolfFurs != LOG_RUNNING)
	{
		DIA_Bosper_Trade.trade = TRUE;
	};

	return TRUE;
};

func void DIA_Bosper_Trade_Info()
{
	AI_Output(other, self, "DIA_Bosper_Trade_15_00"); //让 我 看 看 你 的 货 物 。

	if (DIA_Bosper_Trade.trade == TRUE)
	{
		B_GiveTradeInv(self);
		// Joly: Mc ArrowBolt
		//////////////////////////////////////////////////////////////////////////////////////
		Npc_RemoveInvItems(self, ItRw_Bolt, Npc_HasItems(self, ItRw_Bolt));
		var int McBolzenAmount;
		McBolzenAmount = (Kapitel * 50);
		CreateInvItems(self, ItRw_Bolt, McBolzenAmount);

		Npc_RemoveInvItems(self, ItRw_Arrow, Npc_HasItems(self, ItRw_Arrow));
		var int McArrowAmount;
		McArrowAmount = (Kapitel * 50);
		CreateInvItems(self, ItRw_Arrow, McArrowAmount);
		//////////////////////////////////////////////////////////////////////////////////////
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_Trade_11_01"); //你 不 是 到 这 里 来 参 观 我 的 物 品 的 ， 你 必 须 给 我 弄 那 些 兽 皮 来 ！
		AI_Output(self, other, "DIA_Bosper_Trade_11_02"); //所 以 ， 快 去 ！
	};
};

// **************************************************************
// 						Von Bogen gehört
// **************************************************************
instance DIA_Bosper_BogenRunning(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 5;
	condition		= DIA_Bosper_BogenRunning_Condition;
	information		= DIA_Bosper_BogenRunning_Info;
	description		= "我 听 说 有 人 偷 了 你 的 东 西 。";
};

func int DIA_Bosper_BogenRunning_Condition()
{
	if (MIS_Bosper_Bogen == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenRunning_Info()
{
	AI_Output(other, self, "DIA_Bosper_BogenRunning_15_00"); //我 听 说 有 人 偷 了 你 的 东 西 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_01"); //谁 告 诉 你 的 ？ 或 许 是 巴 尔 托 克 ， 是 吗 ？ 他 没 有 更 好 的 事 情 告 诉 你 吗 ？ 哦 ， 算 了 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_02"); //我 告 诉 你 ， 如 果 我 找 到 了 这 个 混 蛋 的 话 ， 他 就 得 求 上 天 保 佑 了 ！
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_03"); //我 只 离 开 了 商 店 一 会 儿 。 当 我 回 来 时 ， 我 只 看 了 他 离 开 - 肩 上 扛 着 我 的 弓 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_04"); //我 立 即 叫 了 守 卫 ， 但 那 个 混 蛋 往 港 口 跑 了 。 他 们 在 那 里 追 丢 了 他 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_05"); //我 催 过 他 们 ， 然 后 他 们 搜 遍 了 整 个 港 口 区 ， 但 没 找 到 任 何 东 西 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_06"); //那 些 没 用 的 马 屁 精 ！
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_07"); //我 打 赌 我 的 弓 还 在 城 里 某 个 地 方 。 我 通 知 了 两 边 城 门 的 守 卫 ， 而 他 们 没 有 看 到 有 人 拿 着 我 的 弓 离 开 。
	AI_Output(self, other, "DIA_Bosper_BogenRunning_11_08"); //等 我 抓 到 那 个 混 蛋 … …

	Log_CreateTopic(TOPIC_BosperBogen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BosperBogen, LOG_RUNNING);
	B_LogEntry(TOPIC_BosperBogen, TOPIC_BosperBogen_1);
};

// **************************************************************
// 						Bogen gefunden
// **************************************************************
instance DIA_Bosper_BogenSuccess(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 6;
	condition		= DIA_Bosper_BogenSuccess_Condition;
	information		= DIA_Bosper_BogenSuccess_Info;
	description		= "我 觉 得 这 张 弓 是 你 的 … …";
};

func int DIA_Bosper_BogenSuccess_Condition()
{
	if (Npc_HasItems(other, ItRw_Bow_L_03_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Bosper_BogenSuccess_Info()
{
	AI_Output(other, self, "DIA_Bosper_BogenSuccess_15_00"); //我 觉 得 这 张 弓 是 你 的 … …

	B_GiveInvItems(other, self, ItRw_Bow_L_03_MIS, 1);

	AI_Output(self, other, "DIA_Bosper_BogenSuccess_11_01"); //我 的 弓 ！ 你 在 哪 里 找 到 它 的 ？
	AI_Output(other, self, "DIA_Bosper_BogenSuccess_15_02"); //在 一 个 老 鼠 横 行 的 黑 洞 里 。
	AI_Output(self, other, "DIA_Bosper_BogenSuccess_11_03"); //我 希 望 你 没 有 碰 上 什 么 麻 烦 … …
	AI_Output(other, self, "DIA_Bosper_BogenSuccess_15_04"); //没 有 - 我 从 前 就 干 过 这 样 的 事 情 。
	AI_Output(self, other, "DIA_Bosper_BogenSuccess_11_05"); //嗯 - 总 之 ， 谢 谢 你 。 我 欠 你 这 个 人 情 ！

	MIS_Bosper_Bogen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bosper_Bogen);
	Npc_RemoveInvItems(self, ItRw_Bow_L_03_MIS, 1);
};

// **************************************************************
// 							PERM
// **************************************************************
// ------------------------
var int Bosper_Island;
// ------------------------
instance DIA_Bosper_PERM(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 10;
	condition		= DIA_Bosper_PERM_Condition;
	information		= DIA_Bosper_PERM_Info;
	permanent		= TRUE;
	description		= "最 近 镇 上 怎 么 样 ？";
};

func int DIA_Bosper_PERM_Condition()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Bosper_PERM_Info()
{
	AI_Output(other, self, "DIA_Bosper_PERM_15_00"); //最 近 镇 上 怎 么 样 ？

	if (Bosper_Island == FALSE)
	{
		AI_Output(self, other, "DIA_Bosper_PERM_11_01"); //如 果 那 些 兽 人 真 的 来 包 围 了 我 们 ， 这 里 就 会 没 多 少 舒 服 日 子 过 了 。
		AI_Output(self, other, "DIA_Bosper_PERM_11_02"); //只 有 一 艘 船 - 何 况 那 些 圣 骑 士 都 在 看 守 着 它 。 而 且 我 认 为 他 们 不 会 用 它 来 营 救 这 些 市 民 。
		AI_Output(other, self, "DIA_Bosper_PERM_15_03"); //就 没 有 别 的 办 法 离 开 这 里 吗 ？
		AI_Output(self, other, "DIA_Bosper_PERM_11_04"); //没 有 ， 没 有 船 我 们 没 人 能 离 开 这 座 岛 。

		Bosper_Island = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_PERM_11_05"); //到 目 前 为 止 没 有 什 么 新 情 况 。 以 后 再 来 看 看 吧 。
	};
};

// *******************************************************
//				 IMPORTANT als Lehrling
// *******************************************************
// ----------------------------------
var int Bosper_MILKommentar;
var int Bosper_PALKommentar;
var int Bosper_INNOSKommentar;
// ----------------------------------
instance DIA_Bosper_AlsLehrling(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 1;
	condition		= DIA_Bosper_AlsLehrling_Condition;
	information		= DIA_Bosper_AlsLehrling_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Bosper_AlsLehrling_Condition()
{
	if ((Player_IsApprentice == APP_Bosper)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Bosper_AlsLehrling_Info()
{
	if ((other.guild == GIL_MIL)
	&& (Bosper_StartGuild != GIL_MIL)
	&& (Bosper_MILKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_00"); //你 加 入 了 民 兵 ， 是 吗 ？
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_01"); //我 不 在 意 。 只 要 除 了 兽 人 和 强 盗 外 ， 你 还 会 猎 杀 一 些 狼 。 （ 露 齿 而 笑 ）
		Bosper_MILKommentar = TRUE;
	}

	else if ((other.guild == GIL_PAL)
	&& (Bosper_StartGuild != GIL_PAL)
	&& (Bosper_PALKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_02"); //看 起 来 你 的 事 业 像火 箭 一 样 进 展 飞 速 。 国 王 的 圣 骑 士 ！
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_03"); //无 论 你 走 到 哪 里 ， 不 要 忘 了 你 的 老 师 傅 … …
		Bosper_PALKommentar = TRUE;
	}

	else if (((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	&& (Bosper_StartGuild != GIL_NOV)
	&& (Bosper_StartGuild != GIL_KDF)
	&& (Bosper_INNOSKommentar == FALSE))
	{
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_04"); //你 去 加 入 了 修 道 院 ， 是 吗 ？ 我 希 望 他 们 能 经 常 让 你 出 来 ， 那 么 你 就 可 以 一 直 给 我 供 应 兽 皮 了 … …
		Bosper_INNOSKommentar = TRUE;
	}

	else if ((Bosper_Lehrling_Day <= (Wld_GetDay() - 4))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF))
	{
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_05"); //你 去 哪 里 闲 逛 了 这 么 久 ？
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_06"); //我 需 要 更 多 兽 皮 ， 你 带 来 了 一 些 吗 ？
		Bosper_Lehrling_Day = Wld_GetDay();
	}

	else
	{
		AI_Output(self, other, "DIA_Bosper_AlsLehrling_11_07"); //你 又 到 了 这 里 … …
		Bosper_Lehrling_Day = Wld_GetDay();
	};
};

// *******************************************************
//				 Aufgaben als Lehrling
// *******************************************************
instance DIA_Bosper_Aufgaben(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 1;
	condition		= DIA_Bosper_Aufgaben_Condition;
	information		= DIA_Bosper_Aufgaben_Info;
	description		= "我 做 学 徒 的 任 务 是 什 么 ？";
};

func int DIA_Bosper_Aufgaben_Condition()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_Aufgaben_Info()
{
	AI_Output(other, self, "DIA_Bosper_Aufgaben_15_00"); //我 做 学 徒 的 任 务 是 什 么 ？
	AI_Output(self, other, "DIA_Bosper_Aufgaben_11_01"); //那 很 容 易 。 你 能 弄 到 多 少 毛 皮 就 给 我 送 来 多 少 。
	AI_Output(self, other, "DIA_Bosper_Aufgaben_11_02"); //我 会 付 给 你 一 个 更 高 的 价 钱 交 换 它 们 ， 那 比 其 它 商 人 能 给 你 的 价 钱 要 高 。
	AI_Output(self, other, "DIA_Bosper_Aufgaben_11_03"); //此 外 ， 你 不 用 在 我 的 商 店 里 露 面 。 我 自 己 一 个 人 也 过 得 不 错 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(other, self, "DIA_Bosper_Aufgaben_15_04"); //那 我 该 在 哪 里 睡 觉 呢 ？
		AI_Output(self, other, "DIA_Bosper_Aufgaben_11_05"); //我 这 里 没 有 房 间 能 给 你 住 。 市 场 里 的 酒 馆 肯 定 有 地 方 给 你 住 。
	};

	Log_CreateTopic(Topic_Bonus, LOG_NOTE);
	B_LogEntry(Topic_Bonus, Topic_Bonus_8);
};

// *******************************************************
//				 		SellFur
// *******************************************************
// -----------------------------
var int Bosper_TrollFurSold;
// -----------------------------
instance DIA_Bosper_SellFur(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 600;
	condition		= DIA_Bosper_SellFur_Condition;
	information		= DIA_Bosper_SellFur_Info;
	permanent		= TRUE;
	description		= "我 有 一 些 毛 皮 给 你 … …";
};

func int DIA_Bosper_SellFur_Condition()
{
	if (Player_IsApprentice == APP_Bosper)
	{
		return TRUE;
	};
};

func void DIA_Bosper_SellFur_Info()
{
	AI_Output(other, self, "DIA_Bosper_SellFur_15_00"); //我 有 一 些 毛 皮 给 你 … …

	if ((Npc_HasItems(other, ItAt_SheepFur) > 0)
	|| (Npc_HasItems(other, ItAt_WolfFur) > 0)
	|| (Npc_HasItems(other, ItAt_WargFur) > 0)
	|| (Npc_HasItems(other, ItAt_ShadowFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollFur) > 0)
	|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
	|| (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0))
	{
		if (Npc_HasItems(other, ItAt_Addon_KeilerFur) > 0)
		{
			AI_Wait(self, 3);
			B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_Addon_KeilerFur) * Value_KeilerFur));
			B_GiveInvItems(other, self, ItAt_Addon_KeilerFur, Npc_HasItems(other, ItAt_Addon_KeilerFur));
		};

		if (Npc_HasItems(other, ItAt_SheepFur) > 0)
		{
			AI_Output(self, other, "DIA_Bosper_SellFur_11_01"); //一 张 绵 羊 皮 ？ 你 没 有 去 牧 场 屠 宰 哪 个 农 场 主 的 羊 吧 ， 是 吗 ？
			AI_Output(other, self, "DIA_Bosper_SellFur_15_02"); //我 可 不 想 去 做 那 样 的 事 情 … …
			B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_SheepFur) * Value_SheepFur));
			B_GiveInvItems(other, self, ItAt_SheepFur, Npc_HasItems(other, ItAt_SheepFur));
		};

		if (Npc_HasItems(other, ItAt_WolfFur) > 0)
		{
			AI_Output(self, other, "DIA_Bosper_SellFur_11_03"); //狼 皮 ， 那 很 好 … …
			B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_WolfFur) * Value_WolfFur));
			B_GiveInvItems(other, self, ItAt_WolfFur, Npc_HasItems(other, ItAt_WolfFur));
		};

		if (Npc_HasItems(other, ItAt_WargFur) > 0)
		{
			AI_Output(self, other, "DIA_Bosper_SellFur_11_04"); //一 张 座 狼 皮 ？ 那 些 畜 生 都 很 难 对 付 … …
			B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_WargFur) * Value_WargFur));
			B_GiveInvItems(other, self, ItAt_WargFur, Npc_HasItems(other, ItAt_WargFur));
		};

		if (Npc_HasItems(other, ItAt_ShadowFur) > 0)
		{
			AI_Output(self, other, "DIA_Bosper_SellFur_11_05"); //哈 ， 甚 至 还 有 一 张 影 兽 皮 - 那 值 一 大 笔 钱 。
			B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_ShadowFur) * Value_ShadowFur));
			B_GiveInvItems(other, self, ItAt_ShadowFur, Npc_HasItems(other, ItAt_ShadowFur));
		};

		if ((Npc_HasItems(other, ItAt_TrollFur) > 0)
		|| (Npc_HasItems(other, ItAt_TrollBlackFur) > 0))
		{
			if (Bosper_TrollFurSold == FALSE)
			{
				AI_Output(self, other, "DIA_Bosper_SellFur_11_06"); //这 是 什 么 鬼 东 西 的 皮 ？
				AI_Output(other, self, "DIA_Bosper_SellFur_15_07"); //我 从 一 个 巨 魔 身 上 剥 下 来 的 。
				AI_Output(self, other, "DIA_Bosper_SellFur_11_08"); //那 个 … … 那 个 能 发 一 小 笔 小 财 。
				Bosper_TrollFurSold = TRUE;
			}
			else // TRUE
			{
				AI_Output(self, other, "DIA_Bosper_SellFur_11_09"); //又 一 张 巨 大 的 巨 魔 皮 … … 你 在 追 捕 那 些 东 西 吗 ？
				AI_Output(other, self, "DIA_Bosper_SellFur_15_10"); //每 次 我 偶 然 发 现 一 只 时 ， 我 都 会 抓 住 时 机 … …
			};

			if (Npc_HasItems(other, ItAt_TrollFur) > 0)
			{
				B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_TrollFur) * Value_TrollFur));
				B_GiveInvItems(other, self, ItAt_TrollFur, Npc_HasItems(other, ItAt_TrollFur));
			};

			if (Npc_HasItems(other, ItAt_TrollBlackFur) > 0)
			{
				AI_Output(self, other, "DIA_Bosper_SellFur_11_11"); //除 此 之 外 ， 还 有 一 张 黑 巨 魔 皮 ！
				B_GiveInvItems(self, other, itmi_gold,(Npc_HasItems(other, ItAt_TrollBlackFur) * Value_TrollBlackFur));
				B_GiveInvItems(other, self, ItAt_TrollBlackFur, Npc_HasItems(other, ItAt_TrollBlackFur));
			};
		};

		AI_Output(self, other, "DIA_Bosper_SellFur_11_12"); //干 得 漂 亮 。 等 你 有 了 更 多 的 再 来 找 我 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Bosper_SellFur_11_13"); //但 是 ， 你 知 道 - 我 只 对 狼 、 影 兽 以 及 类 似 动 物 的 毛 皮 感 兴 趣 … …
	};
};

// ************************************************************
// 		Minenanteil
// ************************************************************
instance DIA_Bosper_Minenanteil(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 3;
	condition		= DIA_Bosper_Minenanteil_Condition;
	information		= DIA_Bosper_Minenanteil_Info;
	description		= "我 看 见 你 在 出 售 矿 井 股 票 。";
};

func int DIA_Bosper_Minenanteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bosper_Minenanteil_Info()
{
	AI_Output(other, self, "DIA_Bosper_Minenanteil_15_00"); //我 看 见 你 在 出 售 矿 井 股 票 。
	AI_Output(self, other, "DIA_Bosper_Minenanteil_11_01"); //阿 咳 。 对 于 那 个 ， 我 什 么 也 不 知 道 。 如 果 你 想 要 的 话 ， 可 以 留 下 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bosper_PICKPOCKET(C_INFO)
{
	npc				= VLK_413_Bosper;
	nr				= 900;
	condition		= DIA_Bosper_PICKPOCKET_Condition;
	information		= DIA_Bosper_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Bosper_PICKPOCKET_Condition()
{
	C_Beklauen(67, 120);
};

func void DIA_Bosper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
	Info_AddChoice(DIA_Bosper_PICKPOCKET, DIALOG_BACK, DIA_Bosper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bosper_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bosper_PICKPOCKET_DoIt);
};

func void DIA_Bosper_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};

func void DIA_Bosper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bosper_PICKPOCKET);
};
