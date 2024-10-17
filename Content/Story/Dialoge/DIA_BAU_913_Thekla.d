// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Thekla_EXIT(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 999;
	condition		= DIA_Thekla_EXIT_Condition;
	information		= DIA_Thekla_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Thekla_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Thekla_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Thekla_HALLO(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 1;
	condition		= DIA_Thekla_HALLO_Condition;
	information		= DIA_Thekla_HALLO_Info;
	important		= TRUE;
};

func int DIA_Thekla_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Thekla_HALLO_Info()
{
	AI_Output(self, other, "DIA_Thekla_HALLO_17_00"); //你 在 我 的 厨 房 这 里 做 什 么 ？
};

// ************************************************************
// 			  				   Lecker
// ************************************************************
instance DIA_Thekla_Lecker(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 2;
	condition		= DIA_Thekla_Lecker_Condition;
	information		= DIA_Thekla_Lecker_Info;
	description		= "这 里 有 什 么 东 西 闻 着 这 么 美 味 ！";
};

func int DIA_Thekla_Lecker_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Lecker_Info()
{
	AI_Output(other, self, "DIA_Thekla_Lecker_15_00"); //这 里 有 什 么 东 西 闻 着 这 么 美 味 ！
	AI_Output(self, other, "DIA_Thekla_Lecker_17_01"); //哦 ， 当 然 ！ 我 清 楚 你 们 这 样 的 人 ！ 他 们 整 天 在 这 里 出 没 。
	AI_Output(self, other, "DIA_Thekla_Lecker_17_02"); //首 先 他 们 会 博 得 你 的 好 感 ， 然 后 ， 当 你 需 要 他 们 的 时 候 ， 在 哪 里 都 找 不 到 他 们 ！
};

// ************************************************************
// 			  				   Hunger
// ************************************************************
var int Thekla_GaveStew;
// ---------------------
instance DIA_Thekla_Hunger(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 3;
	condition		= DIA_Thekla_Hunger_Condition;
	information		= DIA_Thekla_Hunger_Info;
	description		= "我 饿 了 ！";
};

func int DIA_Thekla_Hunger_Condition()
{
	if (Thekla_GaveStew == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Hunger_Info()
{
	AI_Output(other, self, "DIA_Thekla_Hunger_15_00"); //我 饿 了 ！
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Thekla_Hunger_17_01"); //我 不 会 给 流 浪 汉 施 舍 食 物 。 我 只 给 工 作 的 人 做 饭 。
		AI_Output(self, other, "DIA_Thekla_Hunger_17_02"); //（ 轻 蔑 的 ） 那 些 雇 佣 兵 流 氓 ， 当 然 了 。
	}
	else if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Thekla_Hunger_17_03"); //给 ， 你 的 食 物 ！
		B_GiveInvItems(self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Thekla_Hunger_17_04"); //我 们 这 里 不 为 民 兵 服 务 。
	}
	else // Pal, Kdf oder Nov
	{
		AI_Output(self, other, "DIA_Thekla_Hunger_17_05"); //我 怎 么 能 拒 绝 英 诺 斯 的 代 表 的 要 求 呢 ？。
		B_GiveInvItems(self, other, ItFo_XPStew, 1);
		Thekla_GaveStew = TRUE;
	};
};

// ************************************************************
// 			  				   Arbeit
// ************************************************************
instance DIA_Thekla_Arbeit(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 4;
	condition		= DIA_Thekla_Arbeit_Condition;
	information		= DIA_Thekla_Arbeit_Info;
	description		= "我 在 找 工 作 。";
};

func int DIA_Thekla_Arbeit_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Thekla_Arbeit_15_00"); //我 在 找 工 作 … …
	AI_Output(self, other, "DIA_Thekla_Arbeit_17_01"); //你 想 在 农 场 这 里 工 作 ？
	AI_Output(self, other, "DIA_Thekla_Arbeit_17_02"); //只 有 欧 纳 尔 能 够 做 决 定 。 农 场 是 他 的 ， 整 个 山 谷 也 是 。
};

// ************************************************************
// 			  				   WannaJoin
// ************************************************************
instance DIA_Thekla_WannaJoin(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 5;
	condition		= DIA_Thekla_WannaJoin_Condition;
	information		= DIA_Thekla_WannaJoin_Info;
	description		= "实 际 上 ， 我 正 打 算 加 入 雇 佣 兵 … …";
};

func int DIA_Thekla_WannaJoin_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Npc_KnowsInfo(other, DIA_Thekla_Arbeit)))
	{
		return TRUE;
	};
};

func void DIA_Thekla_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Thekla_WannaJoin_15_00"); //实 际 上 ， 我 正 打 算 加 入 雇 佣 兵 … …
	AI_Output(self, other, "DIA_Thekla_WannaJoin_17_01"); //那 么 你 也 是 从 罪 犯 流 放 地 过 来 的 重 犯 ？
	AI_Output(self, other, "DIA_Thekla_WannaJoin_17_02"); //我 应 该 猜 到 的 ！ 离 我 远 点 ！ 象 你 这 样 的 人 ， 这 里 已 经 有 很 多 了 ！
};

// ************************************************************
// 			  				   Schlafen
// ************************************************************
instance DIA_Thekla_Schlafen(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 6;
	condition		= DIA_Thekla_Schlafen_Condition;
	information		= DIA_Thekla_Schlafen_Info;
	description		= "我 要 找 个 地 方 睡 觉。";
};

func int DIA_Thekla_Schlafen_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_Schlafen_Info()
{
	AI_Output(other, self, "DIA_Thekla_Schlafen_15_00"); //我 要 找 个 地 方 睡 觉 。
	AI_Output(self, other, "DIA_Thekla_Schlafen_17_01"); //别 想 在 我 的 厨 房 里 睡 觉 。 去 谷 仓 里 找 个 地 方 吧 。
};

// ************************************************************
// 			  				   Problem
// ************************************************************
instance DIA_Thekla_Problem(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 7;
	condition		= DIA_Thekla_Problem_Condition;
	information		= DIA_Thekla_Problem_Info;
	description		= "你 和 雇 佣 兵 之 间 有 什 么 问 题 ？";
};

func int DIA_Thekla_Problem_Condition()
{
	if ((kapitel <= 3)
	&& (Npc_KnowsInfo(other, DIA_Thekla_WannaJoin)))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Problem_Info()
{
	AI_Output(other, self, "DIA_Thekla_Problem_15_00"); //你 和 雇 佣 兵 之 间 有 什 么 问 题 ？
	AI_Output(self, other, "DIA_Thekla_Problem_17_01"); //啊 ， 那 些 白 痴 真 的 让 我 发 疯 ！ 尤 其 是 席 尔 维 欧 和 他 的 胖 搭 档 布 尔 克 。
	AI_Output(self, other, "DIA_Thekla_Problem_17_02"); //那 两 个 家 伙 已 经 在 角 落 里 坐 了 几 天 了 ， 让 我 的 生 活 痛 苦 不 堪 。
	AI_Output(self, other, "DIA_Thekla_Problem_17_03"); //汤 太 烫 了 ， 肉 太 硬 了 ， 等 等 等 等 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(other, self, "DIA_Thekla_Problem_15_04"); //那 你 为 什 么 不 教 训 他 们 呢 ？
		AI_Output(self, other, "DIA_Thekla_Problem_17_05"); //我 要 怎 么 做 ， 聪 明 先 生 ？ 用 我 的 擀 面 杖 敲 他 们 ？ 我 可 以 对 农 民 那 么 做 ， 但 是 那 些 卑 鄙 的 混 蛋 只 会 一 拳 打 回 来 。
	};
};

// ************************************************************
// 			  				   Manieren
// ************************************************************
instance DIA_Thekla_Manieren(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 7;
	condition		= DIA_Thekla_Manieren_Condition;
	information		= DIA_Thekla_Manieren_Info;
	description		= "想 让 我 教 他 们 两 个 一 点 礼 节 吗 ？";
};

func int DIA_Thekla_Manieren_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Thekla_Problem))
	&& (Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Thekla_Manieren_Info()
{
	AI_Output(other, self, "DIA_Thekla_Manieren_15_00"); //想 让 我 教 他 们 两 个 一 点 礼 节 吗 ？
	AI_Output(self, other, "DIA_Thekla_Manieren_17_01"); //你 最 好 不 要 那 么 做 ， 亲 爱 的 。 据 我 所 知 ， 席 尔 维 欧 有 一 件 魔 法 盔 甲 。 他 是 无 法 被 击 败 的 。
	AI_Output(other, self, "DIA_Thekla_Manieren_15_02"); //那 布 尔 克 怎 么 样 ？
	AI_Output(self, other, "DIA_Thekla_Manieren_17_03"); //那 家 伙 壮 得 象 头 牛 一 样 。 迄 今 为 止 ， 所 有 想 打 扰 他 或 者 席 尔 维 欧 的 人 都 被 他 放 倒 了 。
};

// ************************************************************
// 			  				  After Fight
// ************************************************************
instance DIA_Thekla_AfterFight(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 7;
	condition		= DIA_Thekla_AfterFight_Condition;
	information		= DIA_Thekla_AfterFight_Info;
	important		= TRUE;
};

func int DIA_Thekla_AfterFight_Condition()
{
	if ((Sylvio.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Thekla_AfterFight_Info()
{
	if (Bullco.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Thekla_AfterFight_17_00"); //你 真 的 让 布 尔 克 受 到 了 惩 罚 ， 亲 爱 的 。
		AI_Output(self, other, "DIA_Thekla_AfterFight_17_01"); //打 那 头 肥 猪 一 定 让 你 精 疲 力 竭 。
	}
	else // Sylvio oder Bullco gewonnen
	{
		AI_Output(self, other, "DIA_Thekla_AfterFight_17_02"); //你 在 那 里 打 的 真 是 精 彩 ， 亲 爱 的 。
		AI_Output(self, other, "DIA_Thekla_AfterFight_17_03"); //我 没 有 对 你 说 吗 ？ 现 在 你 知 道 我 的 意 思 了 。
		AI_Output(other, self, "DIA_Thekla_AfterFight_15_04"); //我 很 高 兴 见 到 你 玩 的 开 心 。
		AI_Output(self, other, "DIA_Thekla_AfterFight_17_05"); //现 在 你 不 要 象 那 样 拉 着 脸 。 你 不 是 第 一 个 被 那 个 混 蛋 痛 打 的 人 。
	};

	AI_Output(self, other, "DIA_Thekla_AfterFight_17_06"); //给 ， 吃 点 东 西 ， 那 样 你 就 能 恢 复 力 气 。
	B_GiveInvItems(self, other, ItFo_XPStew, 1);
	Thekla_GaveStew = TRUE;
};

// ************************************************************
// 			  				 PaketSuccess
// ************************************************************
instance DIA_Thekla_SagittaPaket(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 4;
	condition		= DIA_Thekla_SagittaPaket_Condition;
	information		= DIA_Thekla_SagittaPaket_Info;
	permanent		= TRUE;
	description		= "这 是 来 自 萨 吉 塔 的 包 裹 。";
};

func int DIA_Thekla_SagittaPaket_Condition()
{
	if ((Npc_HasItems(other, ItMi_TheklasPaket))
	&& (MIS_Thekla_Paket == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Thekla_SagittaPaket_Info()
{
	B_GiveInvItems(other, self, ItMi_TheklasPaket, 1);
	AI_Output(other, self, "DIA_Thekla_SagittaPaket_15_00"); //这 是 来 自 萨 吉 塔 的 包 裹 。
	AI_Output(self, other, "DIA_Thekla_SagittaPaket_17_01"); //非 常 感 谢 。 那 样 你 总 能 让 自 己 有 点 用 处 。
	MIS_Thekla_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_TheklasPaket);
};

// ************************************************************
// 			  				   PERM
// ************************************************************
var int Thekla_MehrEintopfKap1;
var int Thekla_MehrEintopfKap3;
var int Thekla_MehrEintopfKap5;
// ------------------------
instance DIA_Thekla_PERM(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 900;
	condition		= DIA_Thekla_PERM_Condition;
	information		= DIA_Thekla_PERM_Info;
	permanent		= TRUE;
	description		= "我 还 能 多 要 一 些 你 做 的 炖 肉 吗 ？";
};

func int DIA_Thekla_PERM_Condition()
{
	if (Thekla_GaveStew == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Thekla_PERM_Info()
{
	AI_Output(other, self, "DIA_Thekla_PERM_15_00"); //我 还 能 多 要 一 些 你 做 的 炖 肉 吗 ？

	if (MIS_Thekla_Paket == FALSE)
	{
		AI_Output(self, other, "DIA_Thekla_PERM_17_01"); //我 现 在 一 点 都 没 有 了 。
		AI_Output(other, self, "DIA_Thekla_PERM_15_02"); //连 一 小 碗 都 没 有 ？
		AI_Output(self, other, "DIA_Thekla_PERM_17_03"); //没 有 。
		AI_Output(other, self, "DIA_Thekla_PERM_15_04"); //那 我 能 舔 舔 那 个 罐 子 吗 ？
		AI_Output(self, other, "DIA_Thekla_PERM_17_05"); //你 能 住 口 吗 ！
		AI_Output(self, other, "DIA_Thekla_PERM_17_06"); //如 果 你 这 么 想 要 我 的 炖 肉 ， 那 你 一 定 要 做 点 事 情 才 能 得 到 它 。
		AI_Output(other, self, "DIA_Thekla_PERM_15_07"); //做 什 么 ？
		AI_Output(self, other, "DIA_Thekla_PERM_17_08"); //去 见 萨 吉 塔 ， 住 在 塞 柯 布 的 农 场 后 面 的 治 疗 者 ， 给 我 拿 来 一 包 她 的 草 药 。
		AI_Output(self, other, "DIA_Thekla_PERM_17_09"); //如 果 你 给 我 拿 来 草 药 ， 我 就 给 你 做 一 些 炖 肉 。

		MIS_Thekla_Paket = LOG_RUNNING;

		CreateInvItems(Sagitta, ItMi_TheklasPaket, 1);

		Log_CreateTopic(TOPIC_TheklaEintopf, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_TheklaEintopf, LOG_RUNNING);
		B_LogEntry(TOPIC_TheklaEintopf, TOPIC_TheklaEintopf_1);
	}
	else if (MIS_Thekla_Paket == LOG_SUCCESS)
	{
		if (Kapitel <= 2)
		{
			if (Thekla_MehrEintopfKap1 == FALSE)
			{
				AI_Output(self, other, "DIA_Thekla_PERM_17_10"); //好 吧 。 那 我 就 发 发 慈 悲 。 给 ， 这 样 你 就 不 会 饿 死 在 我 眼 前 了。
				B_GiveInvItems(self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap1 = TRUE;
			}
			else
			{
				AI_Output(self, other, "DIA_Thekla_PERM_17_11"); //嘿 ， 嘿 ， 嘿 ， 不 要 那 么 贪 心 ！ 如 果 我 有 其 它 事 情 要 你 做 的 话 ， 我 会 告 诉 你 的 。
				AI_Output(self, other, "DIA_Thekla_PERM_17_12"); //然 后 你 就 可 以 得 到 更 多 的 炖 肉 了 ， 明 白 了 吗 ？
			};
		};

		if ((Kapitel == 3)
		|| (Kapitel == 4))
		{
			if ((Thekla_MehrEintopfKap3 == FALSE)
			&& (MIS_RescueBennet == LOG_SUCCESS))
			{
				AI_Output(self, other, "DIA_Thekla_PERM_17_13"); //我 听 说 你 帮 助 贝 尼 特 出 了 监 狱 。 干 的 好 ， 小 子 。
				B_GiveInvItems(self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap3 = TRUE;
			}
			else
			{
				if (MIS_RescueBennet != LOG_SUCCESS)
				{
					AI_Output(self, other, "DIA_Thekla_PERM_17_14"); //那 些 民 兵 混 蛋 们 把 贝 尼 特 扔 进 了 地 牢 。
					AI_Output(self, other, "DIA_Thekla_PERM_17_15"); //帮 我 一 个 忙 ， 把 他 从 那 里 弄 出 来 ， 可 以 吗 ？ 在 那 期 间 ， 我 会 给 你 做 一 些 美 味 的 炖 肉 。
				}
				else
				{
					AI_Output(self, other, "DIA_Thekla_PERM_17_16"); //我 什 么 都 没 剩 下 。 稍 后 再 回 来 吧 。
				};
			};
		};

		if (Kapitel >= 5)
		{
			if (Thekla_MehrEintopfKap5 == FALSE)
			{
				AI_Output(self, other, "DIA_Thekla_PERM_17_17"); //你 怎 么 那 么 饿 ， 不 是 吗 ？ 你 一 直 都 在 做 什 么 ？
				AI_Output(other, self, "DIA_Thekla_PERM_15_18"); //我 干 掉 了 一 些 龙。
				AI_Output(self, other, "DIA_Thekla_PERM_17_19"); //哦 ！ 那 我 想 应 该 来 一 大 碗 丰 盛 的 炖 肉 了。
				B_GiveInvItems(self, other, ItFo_XPStew, 1);
				Thekla_MehrEintopfKap5 = TRUE;
			}
			else
			{
				AI_Output(self, other, "DIA_Thekla_PERM_17_20"); //就 那 么 多 。 没 有 多 余 的 炖 肉 剩 下 了 。
			};
		};
	}
	else // Running oder Failed
	{
		AI_Output(self, other, "DIA_Thekla_PERM_17_21"); //没 有 草 药 ， 就 没 有 炖 肉 - 明 白 了 吗 ？
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Thekla_PICKPOCKET(C_INFO)
{
	npc				= BAU_913_Thekla;
	nr				= 900;
	condition		= DIA_Thekla_PICKPOCKET_Condition;
	information		= DIA_Thekla_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Thekla_PICKPOCKET_Condition()
{
	C_Beklauen(53, 60);
};

func void DIA_Thekla_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
	Info_AddChoice(DIA_Thekla_PICKPOCKET, DIALOG_BACK, DIA_Thekla_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thekla_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Thekla_PICKPOCKET_DoIt);
};

func void DIA_Thekla_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};

func void DIA_Thekla_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thekla_PICKPOCKET);
};
