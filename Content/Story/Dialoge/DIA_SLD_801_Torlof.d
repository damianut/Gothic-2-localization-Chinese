// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Torlof_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 999;
	condition		= DIA_Torlof_EXIT_Condition;
	information		= DIA_Torlof_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
instance DIA_Torlof_Hallo(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 1;
	condition		= DIA_Torlof_HALLO_Condition;
	information		= DIA_Torlof_HALLO_Info;
	important		= TRUE;
};

func int DIA_Torlof_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_HALLO_Info()
{
	AI_Output(self, other, "DIA_Torlof_Hallo_01_00"); //（ 暴 躁 的 ） 你 想 从 我 这 里 得 到 些 什 么 ？
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Torlof_WannaJoin(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 2;
	condition		= DIA_Torlof_WannaJoin_Condition;
	information		= DIA_Torlof_WannaJoin_Info;
	description		= "我 想 要 加 入 雇 佣 兵 ！";
};

func int DIA_Torlof_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Torlof_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Torlof_WannaJoin_15_00"); //我 想 要 加 入 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Torlof_WannaJoin_01_01"); //哦 ？ 那 么 ， 你 为 什 么 觉 得 我 会 同 意 接 受 你 ？
};

// ************************************************************
// 			  				Probe
// ************************************************************
var int Torlof_Go;
instance DIA_Torlof_Probe(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 3;
	condition		= DIA_Torlof_Probe_Condition;
	information		= DIA_Torlof_Probe_Info;
	permanent		= TRUE;
	description		= "让 我 参 加 测 试 ！";
};

func int DIA_Torlof_Probe_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Torlof_WannaJoin))
	&& (hero.guild == GIL_NONE)
	&& (Torlof_Go == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Probe_Info()
{
	AI_Output(other, self, "DIA_Torlof_Probe_15_00"); //让 我 参 加 测 试 ！
	AI_Output(self, other, "DIA_Torlof_Probe_01_01"); //是 李 要 你 到 我 这 里 来 的 吗 ？

	if (Npc_KnowsInfo(other, DIA_Lee_OtherSld))
	{
		AI_Output(other, self, "DIA_Torlof_Probe_15_02"); //他 说 你 将 会 帮 助 我 。
		AI_Output(self, other, "DIA_Torlof_Probe_01_03"); //（ 叹 气 ） 好 吧 。 那 我 们 这 样 吧 ： 在 加 入 我 们 之 前 ， 你 必 须 做 到 两 件 事 情 。
		AI_Output(self, other, "DIA_Torlof_Probe_01_04"); //首 先 ： 你 必 须 证 明 你 有 能 力 完 成 一 个 雇 佣 兵 要 干 的 事 情 。 我 将 对 你 进 行 测 试 。
		AI_Output(self, other, "DIA_Torlof_Probe_01_05"); //其 次 ： 你 必 须 得 到 其 它 雇 佣 兵 的 尊 敬 。
		Torlof_Go = TRUE;
		Npc_ExchangeRoutine(self, "Start");

		Log_CreateTopic(TOPIC_BecomeSLD, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BecomeSLD, LOG_RUNNING);
		B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_2);
	}
	else
	{
		AI_Output(other, self, "DIA_Torlof_Probe_15_06"); //不 。
		AI_Output(self, other, "DIA_Torlof_Probe_01_07"); //那 么 ， 你 喋 喋 不 休 地 想 要 干 嘛 ？
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  				Respekt
// ************************************************************
instance DIA_Torlof_Respekt(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 4;
	condition		= DIA_Torlof_Respekt_Condition;
	information		= DIA_Torlof_Respekt_Info;
	description		= "我 怎 么 才 能 赢 得 其 它 雇 佣 兵 的 尊 敬 ？";
};

func int DIA_Torlof_Respekt_Condition()
{
	if ((Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Respekt_Info()
{
	AI_Output(other, self, "DIA_Torlof_Respekt_15_00"); //我 怎 么 才 能 赢 得 其 它 雇 佣 兵 的 尊 敬 ？
	AI_Output(self, other, "DIA_Torlof_Respekt_01_01"); //对 他 们 大 部 分 人 来 说 ， 如 果 你 完 成 了 任 务 并 通 过 了 测 试 就 足 够 了 。
	AI_Output(self, other, "DIA_Torlof_Respekt_01_02"); //但 你 还 得 通 过 一 些 别 的 途 径 来 说 服 他 们 中 的 某 些 人 。
	AI_Output(self, other, "DIA_Torlof_Respekt_01_03"); //有 些 人 会 试 着 趁 机 敲 诈 ， 而 其 它 一 些 人 也 许 不 喜 欢 你 的 嘴 脸 。
	AI_Output(self, other, "DIA_Torlof_Respekt_01_04"); //你 必 须 设 法 跟 所 有 的 人 和 睦 相 处 - 但 是 如 果 这 些 都 没 用 的 话 ， 你 还 是 可 以 挑 起 一 场 决 斗 。
	AI_Output(self, other, "DIA_Torlof_Respekt_01_05"); //如 果 你 赢 了 ， 你 会 赢 得 大 部 分 人 的 尊 敬 。 不 过 ， 你 得 当 心 ， 不 要 失 手 杀 了 他 们 ， 因 为 那 会 让 你 惹 上 大 麻 烦 。

	Log_CreateTopic(TOPIC_SLDRespekt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt, LOG_RUNNING);
	B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_8);
};

// ************************************************************
// 			  				Duellregeln
// ************************************************************
instance DIA_Torlof_Duellregeln(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 5;
	condition		= DIA_Torlof_Duellregeln_Condition;
	information		= DIA_Torlof_Duellregeln_Info;
	description		= "决 斗 的 规 则 是 什 么 ？";
};

func int DIA_Torlof_Duellregeln_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Torlof_Respekt))
	|| (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Duellregeln_Info()
{
	AI_Output(other, self, "DIA_Torlof_Duellregeln_15_00"); //决 斗 的 规 则 是 什 么 ？
	AI_Output(self, other, "DIA_Torlof_Duellregeln_01_01"); //非 常 简 单 。 在 双 方 对 手 开 打 之 前 ， 必 须 让 他 们 有 机 会 拿 出 各 自 的 武 器 。
	AI_Output(self, other, "DIA_Torlof_Duellregeln_01_02"); //你 不 能 在 毫 无 警 告 的 情 况 下 直 接 去 揍 他 们 中 的 某 个 人 。
	AI_Output(self, other, "DIA_Torlof_Duellregeln_01_03"); //必 须 要 有 某 种 口 头 形 式 的 挑 战 。 侮 辱 、 或 者 是 其 它 的 理 由 挑 起 一 场 搏 斗 。
	AI_Output(self, other, "DIA_Torlof_Duellregeln_01_04"); //没 有 其 它 人 会 干 涉 这 样 的 搏 斗 。 除 非 两 个 人 中 的 某 一 个 在 决 斗 中 被 杀 掉 了 。

	B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_9);
};

// ************************************************************
// 			  				DeineStimme
// ************************************************************
instance DIA_Torlof_DeineStimme(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 6;
	condition		= DIA_Torlof_DeineStimme_Condition;
	information		= DIA_Torlof_DeineStimme_Info;
	description		= "你 怎 么 做 ？ 愿 意 投 我 一 票 吗 ？";
};

func int DIA_Torlof_DeineStimme_Condition()
{
	if ((Torlof_Go == TRUE)
	&& (other.guild == GIL_NONE)
	&& (MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DeineStimme_Info()
{
	AI_Output(other, self, "DIA_Torlof_DeineStimme_15_00"); //你 怎 么 做 ？ 愿 意 投 我 一 票 吗 ？
	AI_Output(self, other, "DIA_Torlof_DeineStimme_01_01"); //如 果 你 能 证 明 你 可 以 履 行 雇 佣 兵 的 职 责 的 话 ， 是 的 。
};

// ************************************************************
// 			  					RUF
// ************************************************************
var int Points_Sld;
instance DIA_Torlof_RUF(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 7;
	condition		= DIA_Torlof_RUF_Condition;
	information		= DIA_Torlof_RUF_Info;
	permanent		= TRUE;
	description		= "我 在 雇 佣 兵 中 的 声 望 如 何 ？";
};

func int DIA_Torlof_RUF_Condition()
{
	if ((Torlof_Go == TRUE)
	&& (Torlof_GenugStimmen == FALSE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_RUF_Info()
{
	AI_Output(other, self, "DIA_Torlof_RUF_15_00"); //我 在 雇 佣 兵 中 的 声 望 如 何 ？
	AI_Output(self, other, "DIA_Torlof_RUF_01_01"); //我 们 来 看 看 … …

	Points_Sld = 0;

	// ------ Wolf ------
	if (Npc_IsDead(Sld_Wolf))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Sld_Wolf.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_02"); //狼 说 他 没 有 什 么 理 由 可 以 反 对 你 加 入 。
		Points_Sld = Points_Sld + 1;
	};

	// ------ Jarvis ------
	if (Npc_IsDead(Jarvis))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (MIS_Jarvis_SldKO == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_03"); //加 维 斯 觉 得 你 的 立 场 很 正 确 。
		Points_Sld = Points_Sld + 1;
	}
	else if (Jarvis.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_04"); //加 维 斯 仍 然 不 确 定 你 的 立 场 对 不 对 。
		AI_Output(self, other, "DIA_Torlof_RUF_01_05"); //他 不 希 望 有 更 多 人 附 和 席 尔 维 欧 ， 我 也 不 。
	};

	// ------ Cord ------
	if (Npc_IsDead(Cord))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord_Approved == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_06"); //考 德 认 为 你 很 好 ， 可 以 加 入 。
		Points_Sld = Points_Sld + 1;
	}
	else if (Cord.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_07"); //考 德 的 想 法 是 ： 你 得 先 学 好 怎 样 更 好 地 操 控 武 器 。
	};

	// ------ Cipher ------
	if (Npc_IsDead(Cipher))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if ((MIS_Cipher_Paket == LOG_SUCCESS)
	|| (MIS_Cipher_BringWeed == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_08"); //希 弗 说 ， 他 十 分 清 楚 ， 你 应 该 加 入 。 看 来 ， 有 些 事 情 确 实 让 他 很 高 兴 。
		Points_Sld = Points_Sld + 1;
	}
	else if (Cipher.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_09"); //希 弗 说 ， 你 欠 他 一 点 人 情 ， 你 知 道 那 是 什 么 。
	};

	// ------ Rod ------
	if (Npc_IsDead(Rod))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems(Rod, ItMw_2h_Rod) == 0)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_10"); //罗 德 只 想 要 回 他 的 剑 。
	}
	else if ((Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod_WetteGewonnen == TRUE))
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_11"); //看 起 来 你 已 经 向 罗 德 证 明 了 你 足 够 强 大 。
		if (Rod.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			Points_Sld = Points_Sld + 1; // ### sonst Point bei Duell ###
		};
	}
	else if (Rod.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_12"); //罗 德 认 为 你 是 个 胆 小 鬼 。
	};

	// ------ Sentenza -------
	if (Npc_IsDead(Sentenza))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Npc_HasItems(Sentenza, itmi_gold) >= 50)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_13"); //森 腾 扎 会 投 你 一 票 。 他 说 你 是 个 非 常 通 情 达 理 的 人 。
		Points_Sld = Points_Sld + 1;
		Torlof_SentenzaCounted = TRUE;
	}
	else if (Sentenza.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_14"); //森 腾 扎 不 会 给 你 投 票 。 他 说 你 还 欠 他 5 0 个 金 币 。
	};

	// ------ Raoul ------
	if (Npc_IsDead(Raoul))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Raoul.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_15"); //罗 欧 反 对 你 。 我 想 他 不 会 支 持 你 。
	};

	// ------ Sylvio und Bullco ------
	if (Npc_IsDead(Bullco))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Bullco.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_16"); //我 提 都 不 用 提 席 尔 维 欧 和 布 尔 克 。 那 两 个 白 痴 反 对 每 一 个 人 。
	};

	// ------ Buster ------
	if (Npc_IsDead(Buster))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Buster_Duell == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_17"); //巴 斯 特 说 你 不 错 。
		if (Buster.aivar[AIV_DefeatedByPlayer] == FALSE)
		{
			AI_Output(self, other, "DIA_Torlof_RUF_01_18"); //尽 管 你 输 给 了 他 。
		};

		// ### Point bei Duell ###
	}
	else if (Buster.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_19"); //巴 斯 特 说 ， 他 向 你 挑 战 时 ， 你 吓 得 跟 小 鸡 崽 一 样 。
		AI_Output(self, other, "DIA_Torlof_RUF_01_20"); //这 可 不 是 个 好 主 意 。 也 许 你 应 该 回 到 前 哨 去 向 他 挑 战 。
	};

	// ------ Dar ------
	if (Npc_IsDead(Dar))
	{
		Points_Sld = Points_Sld + 1;
	}
	else if (Dar_LostAgainstCipher == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_21"); //还 有 ， 达 尔 说 你 是 个 长 舌 妇 。 不 过 ， 他 的 投 票 在 这 里 算 不 得 什 么 数 。
	};

	// ----------------------
	// ------ Der Rest ------
	// ----------------------

	if (Points_Sld > 0)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_22"); //其 它 的 雇 佣 兵 什 么 都 没 有 说 。
	};

	if ((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
	&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_23"); //他 们 中 的 大 部 分 人 都 在 等 着 看 你 能 不 能 通 过 测 试 。
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_24"); //因 为 你 通 过 了 测 试 ， 大 部 分 人 都 服 了 你 。

		// ADDON>
		if (Cord_RangerHelp_TorlofsProbe == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Torlof_RUF_01_00"); //（ 咧 着 嘴 笑 ） 尽 管 可 能 考 德 插 了 一 下 手 … …
			Points_Sld = Points_Sld + 4;
		}
		// ADDON<

		else if (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Torlof_RUF_01_25"); //虽 然 他 们 很 多 人 说 ， 去 向 一 个 农 民 去 收 租 ， 这 样 的 测 试 太 容 易 了 。
			Points_Sld = Points_Sld + 3;
		}
		else // miliz klatschen
		{
			Points_Sld = Points_Sld + 5;
		};

		AI_Output(self, other, "DIA_Torlof_RUF_01_26"); //总 之 ， 我 投 你 的 票 。
		Points_Sld = Points_Sld + 1;
	};

	// --------------------
	// ------ Duelle ------
	// --------------------
	if (Sld_Duelle_gewonnen >= 3) // geändert M.F.
	{
		Points_Sld = Points_Sld + 1;

		if (Points_Sld >= 9) // geändert M.F.
		{
			AI_Output(self, other, "DIA_Torlof_RUF_01_27"); //还 有 ， 你 赢 了 一 些 非 常 精 彩 的 决 斗 。
			AI_Output(self, other, "DIA_Torlof_RUF_01_28"); //很 多 雇 佣 兵 对 此 感 到 敬 佩 。
		}
		else
		{
			AI_Output(self, other, "DIA_Torlof_RUF_01_29"); //无 论 如 何 ， 你 已 经 赢 了 一 些 非 常 精 彩 的 决 斗 。
		};
	};

	// ---------------------------
	// ------ ENDABRECHNUNG ------
	// ---------------------------

	if (Points_Sld >= 9) // geändert M.F. // (Maximal 11 - 13 / insgesamt 6 + 3+1 oder 5+1 + 1 für Duell)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_30"); //大 部 分 雇 佣 兵 都 支 持 你 - 我 们 认 为 ， 你 可 以 随 时 加 入 我 们 。
		AI_Output(self, other, "DIA_Torlof_RUF_01_31"); //去 找 李 。 他 会 跟 你 说 明 其 它 的 一 切 。
		Torlof_GenugStimmen = TRUE;
		B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_6);
	}
	else if (Points_Sld >= 7)
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_32"); //那 非 常 多 ， 但 是 还 不 够 。
		AI_Output(self, other, "DIA_Torlof_RUF_01_33"); //你 暂 时 还 必 须 继 续 跟 这 些 小 伙 子 决 斗 。
	}
	else // <7
	{
		AI_Output(self, other, "DIA_Torlof_RUF_01_34"); //你 还 差 得 很 远 ， 小 子 。 如 果 你 希 望 我 们 接 受 你 ， 你 就 必 须 为 此 做 点 什 么 。
	};
};

// ************************************************************
// 			  				Aufgaben
// ************************************************************
instance DIA_Torlof_Aufgaben(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 8;
	condition		= DIA_Torlof_Aufgaben_Condition;
	information		= DIA_Torlof_Aufgaben_Info;
	description		= "我 作 为 雇 佣 兵 的 职 责 是 什 么 ？";
};

func int DIA_Torlof_Aufgaben_Condition()
{
	if ((Torlof_Go == TRUE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Aufgaben_Info()
{
	AI_Output(other, self, "DIA_Torlof_Aufgaben_15_00"); //我 作 为 雇 佣 兵 的 职 责 是 什 么 ？
	AI_Output(self, other, "DIA_Torlof_Aufgaben_01_01"); //欧 纳 尔 雇 佣 我 们 有 两 个 原 因 ： 他 希 望 我 们 能 让 那 些 民 兵 离 他 远 远 的 ， 他 还 希 望 我 们 为 他 的 农 场 维 持 秩 序 。
	AI_Output(self, other, "DIA_Torlof_Aufgaben_01_02"); //那 包 括 在 小 农 场 主 不 想 付 钱 的 时 候 去 收 回 租 金 。
	AI_Output(self, other, "DIA_Torlof_Aufgaben_01_03"); //那 ， 会 有 什 么 事 ？

	Info_ClearChoices(DIA_Torlof_Aufgaben);
	Info_AddChoice(DIA_Torlof_Aufgaben, "让 我 去 收 取 租 金 ！", DIA_Torlof_Aufgaben_Pacht);
	Info_AddChoice(DIA_Torlof_Aufgaben, "我 会 解 决 民 兵 的 问 题 ， 别 担 心 ！", DIA_Torlof_Aufgaben_Miliz);
};

func void B_Torlof_HolPachtVonSekob()
{
	AI_Output(self, other, "B_Torlof_HolPachtvonSekob_01_00"); //很 好 。 听 着 。 有 个 农 场 主 - 塞 柯 布 有 几 个 星 期 没 付 租 金 给 欧 纳 尔 了 。
	AI_Output(self, other, "B_Torlof_HolPachtvonSekob_01_01"); //欧 纳 尔 想 要 他 交 出 5 0 个 金 币 。 有 什 么 问 题 吗 ？
	AI_Output(other, self, "B_Torlof_HolPachtvonSekob_15_02"); //塞 柯 布 的 农 场 在 哪 里 ？
	AI_Output(self, other, "B_Torlof_HolPachtvonSekob_01_03"); //在 山 谷 的 北 边 。 从 这 里 看 过 去 ， 就 在 那 个 十 字 路 口 的 右 边 。
	AI_Output(self, other, "B_Torlof_HolPachtvonSekob_01_04"); //如 果 你 遇 到 什 么 麻 烦 ， 田 里 那 些 农 民 会 告 诉 你 附 近 的 路 。

	MIS_Torlof_HolPachtVonSekob = LOG_RUNNING;
	Sekob.flags = 0;

	CreateInvItems(sekob, ItMi_Gold, 50);
	Log_CreateTopic(TOPIC_TorlofPacht, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofPacht, LOG_RUNNING);
	B_LogEntry(TOPIC_TorlofPacht, TOPIC_TorlofPacht_1);
};

func void B_Torlof_BengarMilizKlatschen()
{
	AI_Output(self, other, "B_Torlof_BengarMilizKlatschen_01_00"); //农 场 主 本 加 抱 怨 说 最 近 城 里 来 的 民 兵 让 他 感 到 烦 恼 。
	AI_Output(self, other, "B_Torlof_BengarMilizKlatschen_01_01"); //他 们 正 在 逼 迫 那 些 农 民 - 也 许 是 在 设 法 让 他 们 跟 欧 纳 尔 决 裂 。
	AI_Output(self, other, "B_Torlof_BengarMilizKlatschen_01_02"); //我 想 要 你 去 他 的 农 场 ， 让 那 些 民 兵 搞 清 楚 ： 那 里 没 他 们 的 事 ！ 有 问 题 吗 ？
	AI_Output(other, self, "B_Torlof_BengarMilizKlatschen_15_03"); //我 怎 么 去 找 本 加 的 农 场 ？
	AI_Output(self, other, "B_Torlof_BengarMilizKlatschen_01_04"); //山 谷 的 西 南 方 有 一 条 梯 形 路 通 往 一 片 高 地 。 本 加 的 农 场 就 在 那 里 。
	AI_Output(self, other, "B_Torlof_BengarMilizKlatschen_01_05"); //如 果 你 迷 路 了 ， 问 一 问 田 里 干 活 的 农 民 怎 么 找 到 附 近 的 路 。

	MIS_Torlof_BengarMilizKlatschen = LOG_RUNNING;
	Bengar.flags = 0;
	Wld_InsertNpc(Mil_335_Rumbold, "FARM3");
	Wld_InsertNpc(Mil_336_Rick, "FARM3");
	B_InitNpcGlobals();

	Log_CreateTopic(TOPIC_TorlofMiliz, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TorlofMiliz, LOG_RUNNING);
	B_LogEntry(TOPIC_TorlofMiliz, TOPIC_TorlofMiliz_1);
};

func void DIA_Torlof_Aufgaben_Pacht()
{
	AI_Output(other, self, "DIA_Torlof_Aufgaben_Pacht_15_00"); //让 我 去 收 取 租 金 ！
	B_Torlof_HolPachtVonSekob();
	Torlof_Probe = Probe_Sekob;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};

func void DIA_Torlof_Aufgaben_Miliz()
{
	AI_Output(other, self, "DIA_Torlof_Aufgaben_Miliz_15_00"); //我 会 解 决 民 兵 的 问 题 ， 别 担 心 ！
	B_Torlof_BengarMilizKlatschen();
	Torlof_Probe = Probe_Bengar;
	Info_ClearChoices(DIA_Torlof_Aufgaben);
};

// ************************************************************
// 			  			Sekob Success
// ************************************************************
var int Torlof_TheOtherMission_Day;
// ------------------------------------------------------------
func void B_Torlof_TheOtherMissionDay()
{
	if (Torlof_TheOtherMission_Day < (Wld_GetDay() - 1))
	{
		AI_Output(self, other, "B_Torlof_TheOtherMissionDay_01_00"); //你 在 那 里 花 了 相 当 长 的 时 间 。 欧 纳 尔 不 会 很 高 兴 。
		Torlof_TheOtherMission_TooLate = TRUE;

		if (EnterOW_Kapitel2 == TRUE)
		{
			AI_Output(self, other, "DIA_Torlof_Add_01_00"); //对 他 来 说 ， 无 论 那 些 圣 骑 士 是 不 是 在 矿 藏 山 谷 里 被 吃 掉 了 都 是 一 样 的 … …
		};
	}
	else
	{
		AI_Output(self, other, "B_Torlof_TheOtherMissionDay_01_01"); //干 得 漂 亮 ！ 有 什 么 新 的 情 况 时 ， 我 会 告 诉 你 。
	};
};

// ------------------------------------------------------------
instance DIA_Torlof_SekobSuccess(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 9;
	condition		= DIA_Torlof_SekobSuccess_Condition;
	information		= DIA_Torlof_SekobSuccess_Info;
	permanent		= TRUE;
	description		= "我 从 塞 柯 布 那 里 拿 到 了 租 金 。";
};

func int DIA_Torlof_SekobSuccess_Condition()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		if ((Sekob.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (Npc_IsDead(Sekob)))
		{
			return TRUE;
		};
	};
};

func void DIA_Torlof_SekobSuccess_Info()
{
	AI_Output(other, self, "DIA_Torlof_SekobSuccess_15_00"); //我 从 塞 柯 布 那 里 拿 到 了 租 金 。
	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Torlof_SekobSuccess_01_01"); //还 有 呢 ？ 他 是 心 甘 情 愿 地 付 钱 的 吗 ？
		if (Npc_IsDead(Sekob))
		{
			AI_Output(other, self, "DIA_Torlof_SekobTot_15_00"); //嗯 ， 他 遇 到 了 一 个 致 命 的 意 外 。
		}
		else
		{
			AI_Output(other, self, "DIA_Torlof_SekobSuccess_15_02"); //我 得 先 说 服 他 。
		};

		if (Torlof_Probe == Probe_Sekob)
		{
			AI_Output(self, other, "DIA_Torlof_SekobSuccess_01_03"); //干 得 漂 亮 ！ 你 通 过 测 试 了 。 那 将 让 很 多 雇 佣 兵 相 信 你 具 备 必 要 的 条 件 。
		}
		else
		{
			B_Torlof_TheOtherMissionDay();
		};

		MIS_Torlof_HolPachtVonSekob = LOG_SUCCESS;
		B_GivePlayerXP(XP_Torlof_SekobsKohlebekommen);
		B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_5);
		Torlof_ProbeBestanden = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_SekobSuccess_01_04"); //你 因 为 喝 酒 把 事 搞 砸 了 吗 ？ 把 钱 给 我 拿 来 ！ 要 快 点 ！
	};
};

// ************************************************************
// 			  			Bengar Success
// ************************************************************
instance DIA_Torlof_BengarSuccess(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 10;
	condition		= DIA_Torlof_BengarSuccess_Condition;
	information		= DIA_Torlof_BengarSuccess_Info;
	description		= "我 解 决 了 本 加 的 民 兵 问 题 。";
};

func int DIA_Torlof_BengarSuccess_Condition()
{
	if ((MIS_Torlof_BengarMilizKlatschen == LOG_RUNNING)
	&& (Npc_IsDead(Rumbold))
	&& (Npc_IsDead(Rick)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BengarSuccess_Info()
{
	AI_Output(other, self, "DIA_Torlof_BengarSuccess_15_00"); //我 解 决 了 本 加 的 民 兵 问 题 。
	AI_Output(self, other, "DIA_Torlof_BengarSuccess_01_01"); //你 确 定 他 们 明 天 不 会 再 站 在 他 的 门 口 吗 ？
	AI_Output(other, self, "DIA_Torlof_BengarSuccess_15_02"); //他 们 要 是 那 么 做 就 会 有 他 们 好 受 的 。
	AI_Output(self, other, "DIA_Torlof_BengarSuccess_01_03"); //干 得 漂 亮 ！

	if (Torlof_Probe == Probe_Bengar)
	{
		AI_Output(self, other, "DIA_Torlof_BengarSuccess_01_04"); //你 通 过 测 试 了 。 如 果 你 能 对 付 那 些 民 兵 ， 这 里 大 部 分 的 人 都 会 敬 重 你 。
	}
	else
	{
		B_Torlof_TheOtherMissionDay();
	};

	MIS_Torlof_BengarMilizKlatschen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Bengar_MILIZKLATSCHEN);
	B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_5);
	Torlof_ProbeBestanden = TRUE;
};

// ************************************************************
// 			  				Welcome
// ************************************************************
instance DIA_Torlof_Welcome(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 11;
	condition		= DIA_Torlof_Welcome_Condition;
	information		= DIA_Torlof_Welcome_Info;
	important		= TRUE;
};

func int DIA_Torlof_Welcome_Condition()
{
	if ((other.guild == GIL_SLD)
	&& (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Welcome_Info()
{
	AI_Output(self, other, "DIA_Torlof_Welcome_01_00"); //欢 迎 加 入 雇 佣 兵 行 列 ， 孩 子 ！
	AI_Output(other, self, "DIA_Torlof_Welcome_15_01"); //谢 谢 ！
	AI_Output(self, other, "DIA_Torlof_Welcome_01_02"); //我 一 有 适 合 你 干 的 事 就 会 告 诉 你 。
};

// ************************************************************
// 			  			The Other Mission
// ************************************************************

var int Torlof_KnowsDragons;

func void B_Torlof_Dragons()
{
	AI_Output(self, other, "DIA_Torlof_Add_01_01"); //你 去 哪 里 了 ？
	AI_Output(other, self, "DIA_Torlof_Add_15_02"); //我 去 了 矿 藏 山 谷 ！ 那 里 有 一 些 龙 ！ 他 们 让 那 些 圣 骑 士 受 够 了 罪 ！
	AI_Output(self, other, "DIA_Torlof_Add_01_03"); //是 吗 ？ 那 么 ， 那 些 传 言 不 是 空 穴 来 风 ！
	AI_Output(self, other, "DIA_Torlof_Add_01_04"); //李 一 定 会 感 兴 趣 的 … …
	Torlof_KnowsDragons = TRUE;
};
instance DIA_Torlof_TheOtherMission(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 11;
	condition		= DIA_Torlof_TheOtherMission_Condition;
	information		= DIA_Torlof_TheOtherMission_Info;
	important		= TRUE;
};

func int DIA_Torlof_TheOtherMission_Condition()
{
	if ((other.guild == GIL_SLD)
	&& (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Torlof_TheOtherMission_Info()
{
	if ((Torlof_KnowsDragons == FALSE)
	&& (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		B_Torlof_Dragons();
	};

	AI_Output(self, other, "DIA_Torlof_TheOtherMission_01_00"); //你 在 这 里 真 好 。 我 有 一 些 事 情 要 你 去 做 … …
	AI_Output(other, self, "DIA_Torlof_TheOtherMission_15_01"); //是 什 么 ？

	if (Torlof_Probe == Probe_Bengar)
	{
		B_Torlof_HolPachtVonSekob();
	}
	else // Probe_Bangar
	{
		B_Torlof_BengarMilizKlatschen();
	};

	AI_Output(self, other, "DIA_Torlof_TheOtherMission_01_02"); //你 要 保 证 明 天 完 成 它 ！
	Torlof_TheOtherMission_Day = Wld_GetDay();
};

// ************************************************************
// 			  			Dragons
// ************************************************************
instance DIA_Torlof_Dragons(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 12;
	condition		= DIA_Torlof_Dragons_Condition;
	information		= DIA_Torlof_Dragons_Info;
	important		= TRUE;
};

func int DIA_Torlof_Dragons_Condition()
{
	if ((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE)
	&& (Kapitel <= 3)
	&& (other.guild == GIL_SLD)
	&& (Torlof_KnowsDragons == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Dragons_Info()
{
	B_Torlof_Dragons();
};

//*******************************************
//	WhatCanYouTeach
//*******************************************
instance DIA_Torlof_WhatCanYouTeach(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 140;
	condition		= DIA_Torlof_WhatCanYouTeach_Condition;
	information		= DIA_Torlof_WhatCanYouTeach_Info;
	description		= "你 能 帮 助 我 提 高 我 的 能 力 吗 ？";
};

func int DIA_Torlof_WhatCanYouTeach_Condition()
{
	return TRUE;
};

func void DIA_Torlof_WhatCanYouTeach_Info()
{
	AI_Output(other, self, "DIA_Torlof_WhatCanYouTeach_15_00"); //你 能 帮 助 我 提 高 我 的 能 力 吗 ？
	AI_Output(self, other, "DIA_Torlof_WhatCanYouTeach_01_01"); //我 可 以 告 诉 你 在 近 战 中 怎 样 更 好 地 运 用 你 的 力 量 。
	AI_Output(self, other, "DIA_Torlof_WhatCanYouTeach_01_02"); //很 多 战 士 都 没 有 什 么 战 斗 力 ， 因 为 他 们 没 有 正 确 使 用 力 量 的 技 巧 。
	AI_Output(self, other, "DIA_Torlof_WhatCanYouTeach_01_03"); //同 样 还 有 敏 捷 和 远 程 武 器 。

	Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_5);
};

// *******************************************
//					Teach
// *******************************************

var int Torlof_Merke_STR;
var int Torlof_Merke_DEX;
// -------------------------------------------
instance DIA_Torlof_Teach(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 150;
	condition		= DIA_Torlof_Teach_Condition;
	information		= DIA_Torlof_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 能 力 ！";
};

func int DIA_Torlof_Teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Torlof_WhatCanYouTeach))
	{
		return TRUE;
	};
};

func void DIA_Torlof_Teach_Info()
{
	AI_Output(other, self, "DIA_Torlof_Teach_15_00"); //我 想 要 增 强 我 的 能 力 ！
	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG)
	|| (other.guild == GIL_NONE))
	{
		Torlof_Merke_STR = other.attribute[ATR_STRENGTH];
		Torlof_Merke_DEX = other.attribute[ATR_DEXTERITY];

		Info_ClearChoices(DIA_Torlof_Teach);
		Info_AddChoice(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
		Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_Teach_DEX_1);
		Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_Teach_DEX_5);
		Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_Teach_STR_1);
		Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_Teach_STR_5);
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_Teach_01_01"); //我 说 过 我 可 以 帮 你 ， 而 不 是 应 该 帮 你 。
		AI_Output(self, other, "DIA_Torlof_Teach_01_02"); //只 要 你 还 不 是 我 们 的 人 ， 你 就 得 去 找 别 的 人 指 导 你 ！
	};
};

func void DIA_Torlof_Teach_Back()
{
	if ((Torlof_Merke_STR < other.attribute[ATR_STRENGTH])
	|| (Torlof_Merke_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self, other, "DIA_Torlof_Teach_Back_01_00"); //很 好 ！ 现 在 ， 你 可 以 更 好 地 发 挥 你 的 能 力 了 ！
	};

	Info_ClearChoices(DIA_Torlof_Teach);
};

func void DIA_Torlof_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MAX);

	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);

	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_Teach_STR_5);
};

func void DIA_Torlof_Teach_DEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);

	Info_ClearChoices(DIA_Torlof_Teach);
	Info_AddChoice(DIA_Torlof_Teach, DIALOG_BACK, DIA_Torlof_Teach_Back);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Torlof_Teach_DEX_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Torlof_Teach_DEX_5);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Torlof_Teach_STR_1);
	Info_AddChoice(DIA_Torlof_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Torlof_Teach_STR_5);
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
instance DIA_Torlof_KAP3_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 999;
	condition		= DIA_Torlof_KAP3_EXIT_Condition;
	information		= DIA_Torlof_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DEMENTOREN(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 30;
	condition		= DIA_Torlof_DEMENTOREN_Condition;
	information		= DIA_Torlof_DEMENTOREN_Info;
	description		= "你 有 什 么 事 要 我 做 吗 ？";
};

func int DIA_Torlof_DEMENTOREN_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Torlof_DEMENTOREN_Info()
{
	AI_Output(other, self, "DIA_Torlof_DEMENTOREN_15_00"); //你 有 什 么 事 要 我 做 吗 ？
	AI_Output(self, other, "DIA_Torlof_DEMENTOREN_01_01"); //你 已 经 看 到 潜 伏 在 这 里 的 那 些 穿 黑 袍 子 的 家 伙 了 吧 ？ 我 告 诉 你 ， 那 些 人 让 我 心 惊 肉 跳 。
	AI_Output(self, other, "DIA_Torlof_DEMENTOREN_01_02"); //当 我 在 海 上 时 ， 见 过 一 些 特 别 古 怪 的 东 西 ， 但 是 那 些 家 伙 真 让 我 害 怕 。
	AI_Output(self, other, "DIA_Torlof_DEMENTOREN_01_03"); //他 们 往 山 谷 南 头 的 山 上 那 个 强 盗 营 地 的 方 向 去 了 。
	AI_Output(self, other, "DIA_Torlof_DEMENTOREN_01_04"); //也 许 你 应 该 去 那 里 打 探 一 下 那 些 家 伙 ， 并 把 他 们 都 干 掉 ！

	Wld_InsertNpc(CastlemineDMT, "FP_STAND_DEMENTOR_KDF_12");

	Log_CreateTopic(TOPIC_Torlof_Dmt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Torlof_Dmt, LOG_RUNNING);
	B_LogEntry(TOPIC_Torlof_Dmt, TOPIC_Torlof_Dmt_1);

	MIS_Torlof_Dmt = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Dementoren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_DmtSuccess(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 30;
	condition		= DIA_Torlof_DmtSuccess_Condition;
	information		= DIA_Torlof_DmtSuccess_Info;
	description		= "那 些 山 上 的 黑 头 罩 们 不 会 再 打 扰 我 们 了 。";
};

func int DIA_Torlof_DmtSuccess_Condition()
{
	if ((MIS_Torlof_Dmt == LOG_RUNNING)
	&& (Npc_IsDead(CastlemineDMT)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_DmtSuccess_Info()
{
	AI_Output(other, self, "DIA_Torlof_DmtSuccess_15_00"); //那 些 山 上 的 黑 头 罩 们 不 会 再 打 扰 我 们 了 。
	AI_Output(self, other, "DIA_Torlof_DmtSuccess_01_01"); //你 解 决 他 们 了 ？ 太 棒 了 ！
	AI_Output(self, other, "DIA_Torlof_DmtSuccess_01_02"); //我 一 点 也 不 相 信 那 些 家 伙 。 他 们 一 定 会 惹 出 很 多 乱 子 … …

	MIS_Torlof_Dmt = LOG_SUCCESS;
	B_GivePlayerXP(XP_Torlof_DMT);
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
instance DIA_Torlof_KAP4_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 999;
	condition		= DIA_Torlof_KAP4_EXIT_Condition;
	information		= DIA_Torlof_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WoistSylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_WOISTSYLVIO(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 40;
	condition		= DIA_Torlof_WOISTSYLVIO_Condition;
	information		= DIA_Torlof_WOISTSYLVIO_Info;
	description		= "有 一 些 雇 佣 兵 离 开 了 ？";
};

func int DIA_Torlof_WOISTSYLVIO_Condition()
{
	if ((MIS_ReadyforChapter4 == TRUE) || (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Torlof_WOISTSYLVIO_Info()
{
	AI_Output(other, self, "DIA_Torlof_WOISTSYLVIO_15_00"); //有 一 些 雇 佣 兵 离 开 了?
	AI_Output(self, other, "DIA_Torlof_WOISTSYLVIO_01_01"); //席 尔 维 欧 带 走 了 几 个 人 ， 然 后 消 失 在 关 卡 那 里 了 。
	AI_Output(self, other, "DIA_Torlof_WOISTSYLVIO_01_02"); //有 传 言 说 一 些 龙 在 那 里 出 现 了 。 当 他 听 说 这 件 事 后 ， 就 没 什 么 能 阻 止 他 了 。
	AI_Output(self, other, "DIA_Torlof_WOISTSYLVIO_01_03"); //谁 知 道 呢 ？ 一 条 龙 ， 这 样 的 战 利 品 在 公 开 市 场 上 肯 定 能 带 来 一 大 笔 钱 。
	AI_Output(self, other, "DIA_Torlof_WOISTSYLVIO_01_04"); //对 我 来 说 一 文 不 值 。 我 是 个 水 手 ， 我 属 于 大 海 而 不 是 一 个 闷 气 的 龙 洞 。
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
instance DIA_Torlof_KAP5_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 999;
	condition		= DIA_Torlof_KAP5_EXIT_Condition;
	information		= DIA_Torlof_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 51;
	condition		= DIA_Torlof_BEMYCAPTAIN_Condition;
	information		= DIA_Torlof_BEMYCAPTAIN_Info;
	description		= "你 是 一 个 水 手 ？";
};

func int DIA_Torlof_BEMYCAPTAIN_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN_15_00"); //你 是 一 个 水 手 ？
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_01"); //你 终 于 明 白 了 吗 ？ 是 ， 见 鬼 ， 我 是 个 水 手 。 你 为 什 么 要 问 ？
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN_15_02"); //我 需 要 你 的 才 干 。 我 必 须 去 一 座 岛 上 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_03"); //（ 大 笑 ） 去 一 座 岛 上 ？ 你 连 船 都 没 一 只 ， 更 不 必 说 一 支 操 纵 它 的 船 员 队 伍 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_04"); //不 ， 我 的 孩 子 。 如 果 你 想 成 为 我 的 船 长 和 力 量 教 练 ， 那 首 先 你 就 必 须 向 我 证 明 你 知 道 自 己 在 说 些 什 么 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_05"); //除 此 之 外 ， 我 又 有 了 其 它 的 担 忧 。 那 些 圣 骑 士 没 有 象 我 想 的 那 样 离 开 那 个 城 市 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_06"); //一 定 会 有 某 些 严 重 的 事 情 要 发 生 ， 迫 使 他 们 来 扫 清 这 片 领 域 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN_01_07"); //到 矿 藏 山 谷 的 城 堡 去 。 从 守 门 的 卫 兵 那 里 偷 走 大 门 的 钥 匙 ， 然 后 把 门 打 开 。 那 些 兽 人 会 解 决 其 它 的 问 题 ！

	Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	B_LogEntry(TOPIC_Captain, TOPIC_Captain_6);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain2s
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN2(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 52;
	condition		= DIA_Torlof_BEMYCAPTAIN2_Condition;
	information		= DIA_Torlof_BEMYCAPTAIN2_Info;
	description		= "通 向 矿 藏 山 谷 城 堡 的 大 门 打 开 了 … …";
};

func int DIA_Torlof_BEMYCAPTAIN2_Condition()
{
	if ((MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN)))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN2_Info()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_00"); //通 往 矿 藏 山 谷 城 堡 的 大 门 打 开 并 被 卡 住 了 。 现 在 ， 没 有 任 何 东 西 可 以 阻 挡 那 些 兽 人 去 侵 袭 城 堡 了 。
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_01"); //城 堡 里 的 圣 骑 士 在 抵 抗 兽 人 时 遭 受 了 巨 大 的 损 失 。
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN2_15_02"); //现 在 不 会 太 久 了 ， 我 猜 ， 那 些 城 里 的 圣 骑 士 就 要 出 发 去 矿 藏 山 谷 把 他 们 的 人 从 城 堡 里 救 出 来 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN2_01_03"); //这 是 个 令 人 愉 快 的 消 息 。 那 么 ， 现 在 没 有 东 西 可 以 阻 止 我 逃 离 这 个 该 死 的 地 方 了 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info BeMyCaptain3
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN3(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 53;
	condition		= DIA_Torlof_BEMYCAPTAIN3_Condition;
	information		= DIA_Torlof_BEMYCAPTAIN3_Info;
	permanent		= TRUE;
	description		= "现 在 你 愿 意 帮 助 我 去 那 个 岛 上 吗 ？ ";
};

var int Torlof_PaidToBeCaptain;
func int DIA_Torlof_BEMYCAPTAIN3_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Torlof_BEMYCAPTAIN2))
	&& (Torlof_PaidToBeCaptain == FALSE)
	&& (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN3_Info()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN3_15_00"); //现 在 你 愿 意 帮 助 我 去 那 个 岛 上 吗 ？
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_01"); //哦 ， 是 啊 。 你 是 想 要 去 一 个 岛 上 。 嗯 。 我 给 你 提 个 建 议 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_02"); //你 付 给 我 2 5 0 0 个 金 币 ， 我 就 会 给 你 开 船 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_01_03"); //为 此 ， 我 还 会 教 你 达 到 你 想 要 拥 有 的 力 量 和 敏 捷 。

	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3, "那 真 是 相 当 多 的 金 子 。", DIA_Torlof_BEMYCAPTAIN3_zuViel);
	Info_AddChoice(DIA_Torlof_BEMYCAPTAIN3, "好 吧 。 这 是 你 的 金 币 。", DIA_Torlof_BEMYCAPTAIN3_ok);
};

func void DIA_Torlof_BEMYCAPTAIN3_zuViel()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00"); //那 真 是 相 当 多 的 金 子 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01"); //好 吧 。 好 的 帮 助 总 是 很 昂 贵 。 你 没 有 别 的 选 择 。 在 这 个 区 域 里 ， 你 找 不 到 其 它 人 来 给 你 开 船 了 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02"); //所 以 ， 付 钱 吧 ， 不 要 找 麻 烦 。
	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
	B_LogEntry(TOPIC_Captain, TOPIC_Captain_7);
};

func void DIA_Torlof_BEMYCAPTAIN3_ok()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN3_ok_15_00"); //好 吧 。 这 是 你 的 金 币 。
	if (B_GiveInvItems(other, self, ItMi_Gold, 2500))
	{
		AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_01"); //好 极 了 。 现 在 ， 你 只 需 要 告 诉 我 你 要 我 做 什 么 事 。
		Torlof_PaidToBeCaptain = TRUE;
		B_LogEntry(TOPIC_Captain, TOPIC_Captain_8);
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN3_ok_01_02"); //你 是 想 用 几 个 金 币 来 糊 弄 我 吗 ？ 先 去 弄 钱 。 然 后 ， 我 们 再 商 量 。
	};

	Info_ClearChoices(DIA_Torlof_BEMYCAPTAIN3);
};

///////////////////////////////////////////////////////////////////////
//	Info BEMYCAPTAIN4
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_BEMYCAPTAIN4(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 54;
	condition		= DIA_Torlof_BEMYCAPTAIN4_Condition;
	information		= DIA_Torlof_BEMYCAPTAIN4_Info;
	permanent		= TRUE;
	description		= "当 我 的 船 长 。";
};

func int DIA_Torlof_BEMYCAPTAIN4_Condition()
{
	if ((SCGotCaptain == FALSE)
	&& (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_BEMYCAPTAIN4_Info()
{
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_00"); //当 我 的 船 长 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_01"); //好 吧 。 给 我 一 艘 船 和 一 支 足 够 强 壮 的 船 员 队 伍 ， 然 后 ， 我 会 把 你 带 到 你 那 个 该 死 的 岛 上 去 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_02"); //你 有 航 海 图 吗 ？ 如 果 没 有 这 个 东 西 ， 我 们 走 不 了 多 远 。
	AI_Output(other, self, "DIA_Torlof_BEMYCAPTAIN4_15_03"); //我 会 安 排 好 一 切 的 。 我 们 在 港 口 见 。
	AI_Output(self, other, "DIA_Torlof_BEMYCAPTAIN4_01_04"); //我 等 不 及 要 看 你 怎 么 做 。

	AI_StopProcessInfos(self);
	SCGotCaptain = TRUE;
	TorlofIsCaptain = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self, "WaitForShipCaptain");

	B_GivePlayerXP(XP_Captain_Success);
};

///////////////////////////////////////////////////////////////////////
//	Info Losfahren
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_LOSFAHREN(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 59;
	condition		= DIA_Torlof_LOSFAHREN_Condition;
	information		= DIA_Torlof_LOSFAHREN_Info;
	permanent		= TRUE;
	description		= "我 们 出 发 去 岛 屿 。";
};

func int DIA_Torlof_LOSFAHREN_Condition()
{
	if ((TorlofIsCaptain == TRUE)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_LOSFAHREN_Info()
{
	AI_Output(other, self, "DIA_Torlof_LOSFAHREN_15_00"); //我 们 出 发 去 岛 屿 。

	if ((B_CaptainConditions(self)) == TRUE)
	{
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_01"); //好 吧 。 给 我 航 海 图 我 们 就 出 发 。
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_02"); //（ 叫 喊 ） 所 有 人 上 船 。
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_03"); //要 确 定 你 已 经 把 所 需 的 一 切 都 带 上 了 ， 没 有 回 头 路 可 走 。
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_04"); //如 果 你 确 定 的 话 ， 那 就 去 船 长 的 船 舱 里 呆 着 吧 。 这 个 旅 程 会 需 要 一 些 时 间 。
		AI_StopProcessInfos(self);
		B_CaptainCallsAllOnBoard(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_05"); //没 有 船 、 没 有 船 员 、 没 有 航 海 图 、 就 没 有 旅 程 ， 我 的 朋 友 。
		AI_Output(self, other, "DIA_Torlof_LOSFAHREN_01_06"); //我 想 看 到 至 少5个 人 ， 自 愿 而 且 有 能 力 驾 驶 一 艘 船 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info perm5_NotCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_Torlof_PERM5_NOTCAPTAIN(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 59;
	condition		= DIA_Torlof_PERM5_NOTCAPTAIN_Condition;
	information		= DIA_Torlof_PERM5_NOTCAPTAIN_Info;
	permanent		= TRUE;
	description		= "我 决 定 另 找 一 名 船 长 。";
};

func int DIA_Torlof_PERM5_NOTCAPTAIN_Condition()
{
	if ((SCGotCaptain == TRUE)
	&& (TorlofIsCaptain == FALSE)
	&& (Torlof_PaidToBeCaptain == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Torlof_PERM5_NOTCAPTAIN_Info()
{
	AI_Output(other, self, "DIA_Torlof_PERM5_NOTCAPTAIN_15_00"); //我 已 经 决 定 找 另 一 个 人 当 船 长 了 。 你 现 在 可 以 退 回 我 的 钱 了 。
	AI_Output(self, other, "DIA_Torlof_PERM5_NOTCAPTAIN_01_01"); //你 别 想 那 样 ， 不 可 能 。 总 之 ， 如 果 你 先 付 钱 给 我 ， 后 来 又 不 想 要 我 做 事 了 ， 那 是 你 的 问 题 。
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
instance DIA_Torlof_KAP6_EXIT(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 999;
	condition		= DIA_Torlof_KAP6_EXIT_Condition;
	information		= DIA_Torlof_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Torlof_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Torlof_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Torlof_PICKPOCKET(C_INFO)
{
	npc				= SLD_801_Torlof;
	nr				= 900;
	condition		= DIA_Torlof_PICKPOCKET_Condition;
	information		= DIA_Torlof_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Torlof_PICKPOCKET_Condition()
{
	C_Beklauen(76, 120);
};

func void DIA_Torlof_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
	Info_AddChoice(DIA_Torlof_PICKPOCKET, DIALOG_BACK, DIA_Torlof_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Torlof_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Torlof_PICKPOCKET_DoIt);
};

func void DIA_Torlof_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};

func void DIA_Torlof_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Torlof_PICKPOCKET);
};
