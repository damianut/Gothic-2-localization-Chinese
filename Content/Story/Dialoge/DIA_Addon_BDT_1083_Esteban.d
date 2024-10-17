// --------------------------------------------------------------------
//	Info EXIT
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_EXIT(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 999;
	condition		= DIA_Addon_Esteban_EXIT_Condition;
	information		= DIA_Addon_Esteban_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Esteban_EXIT_Condition()
{
	if (Bodyguard_Killer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Esteban_PICKPOCKET(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 900;
	condition		= DIA_Addon_Esteban_PICKPOCKET_Condition;
	information		= DIA_Addon_Esteban_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Addon_Esteban_PICKPOCKET_Condition()
{
	C_Beklauen(105, 500);
};

func void DIA_Addon_Esteban_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET, DIALOG_BACK, DIA_Addon_Esteban_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Esteban_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Esteban_PICKPOCKET_DoIt);
};

func void DIA_Addon_Esteban_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

func void DIA_Addon_Esteban_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Esteban_PICKPOCKET);
};

// --------------------------------------------------------------------
//	Info Hi
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Hi(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 2;
	condition		= DIA_Addon_Esteban_Hi_Condition;
	information		= DIA_Addon_Esteban_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Esteban_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Esteban_Hi_07_00"); //那 么 你 就 是 那 个 打 进 营 地 的 家 伙 。
	AI_Output(other, self, "DIA_Addon_Esteban_Hi_15_01"); //那 事 传 的 很 快 … …
	AI_Output(self, other, "DIA_Addon_Esteban_Hi_07_02"); //佛 朗 哥 是 个 狂 暴 的 疯 子 。 没 人 愿 意 和 他 搅 在 一 起 。 没 有 人 - 除 了 你 。
	AI_Output(self, other, "DIA_Addon_Esteban_Hi_07_03"); //只 是 要 澄 清 一 下 ， 如 果 你 也 想 糊 弄 我 的 话 ， 我 就 杀 了 你 。
};

// --------------------------------------------------------------------
//	Info Mine
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Mine(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 3;
	condition		= DIA_Addon_Esteban_Mine_Condition;
	information		= DIA_Addon_Esteban_Mine_Info;
	description		= "我 要 进 入 矿 井 ！";
};

func int DIA_Addon_Esteban_Mine_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Mine_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Mine_15_00"); //我 要 进 入 矿 井 ！
	AI_Output(self, other, "DIA_Addon_Esteban_Mine_07_01"); //（ 露 齿 而 笑 ） 你 当 然 会 。 然 后 你 就 和 我 一 起 呆 在 同 样 的 地 方 了 。
	AI_Output(self, other, "DIA_Addon_Esteban_Mine_07_02"); //因 为 每 个 在 矿 井 里 挖 金 子 的 人 都 有 大 量 的 黄 金 。
	AI_Output(self, other, "DIA_Addon_Esteban_Mine_07_03"); //我 会 分 发 你 所 需 要 的 红 石 头 ， 那 样 托 鲁 斯 就 会 让 你 进 去 。
};

// --------------------------------------------------------------------
//	Info Rot
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Rot(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 3;
	condition		= DIA_Addon_Esteban_Rot_Condition;
	information		= DIA_Addon_Esteban_Rot_Info;
	description		= "把 那 些 红 石 头 给 我 一 块 。";
};

func int DIA_Addon_Esteban_Rot_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Mine))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Rot_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Rot_15_00"); //把 那 些 红 石 头 给 我 一 块 。
	AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_01"); //好 吧 ， 不 过 它 们 不 是 免 费 的 。
	AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_02"); //通 常 ， 我 需 要 从 那 些 小 子 们 挖 到 的 黄 金 中 抽 一 份 。
	AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_03"); //（ 打量 ） 你 知 道 多 少 挖 掘 黄 金 的 事 呢 ， 嗯 ？
	if (Hero_HackChance > 25)
	{
		AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_04"); //你 也 许 已 经 学 会 了 一 些 小 窍 门 ， 对 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_05"); //你 看 起 来 并 不 十 分 了 解 … …
	};

	AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_06"); //（ 嘲 弄 的 ） 如 果 我 给 你 一 块 红 石 头 ， 并 不 是 因 为 你 是 一 名 出 色 的 矿 工 。
	AI_Output(self, other, "DIA_Addon_Esteban_Rot_07_07"); //不 ， 我 有 其 它 的 工 作 交 给 你 … …
};

// --------------------------------------------------------------------
//	Info MIS
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_MIS(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 4;
	condition		= DIA_Addon_Esteban_MIS_Condition;
	information		= DIA_Addon_Esteban_MIS_Info;
	description		= "什 么 样 的 工 作 ？";
};

func int DIA_Addon_Esteban_MIS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Rot))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_MIS_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_MIS_15_00"); //什 么 样 的 工 作 ？
	AI_Output(self, other, "DIA_Addon_Esteban_MIS_07_01"); //有 一 个 强 盗 企 图 杀 掉 我 ， 但 是 他 反 而 被 我 的 卫 兵 杀 死 了 。
	AI_Output(other, self, "DIA_Addon_Esteban_MIS_15_02"); //他 很 嫉 妒 你 的 工 作 ， 呃 ？
	AI_Output(self, other, "DIA_Addon_Esteban_MIS_07_03"); //他 是 一 个 白 痴 ！ 一 个 没 有 大 脑 的 杀 手 。 他 自 己 永 远 也 不 会 想 到 要 来 杀 我 。
	AI_Output(self, other, "DIA_Addon_Esteban_MIS_07_04"); //不 ， 他 只 是 在 完 成 一 个 合 同 - 派 他 来 的 另 有 其 人 … …
	AI_Output(other, self, "DIA_Addon_Esteban_MIS_15_05"); //所 以 ， 我 想 要 查 明 谁 是 幕 后 指 使 。
	AI_Output(self, other, "DIA_Addon_Esteban_MIS_07_06"); //无 论 是 谁 派 这 个 刺 客 来 杀 我 ， 他 都 要 付 出 代 价 。 找 到 他 - 然 后 我 就 让 你 进 入 矿 井 。

	if (!Npc_IsDead(Senyan)
	&& Npc_KnowsInfo(other, DIA_Addon_BDT_1084_Senyan_Hi))
	{
		AI_Output(other, self, "DIA_Addon_Esteban_MIS_15_07"); //森 延 让 我 来 找 你 谈 这 件 事 。
		AI_Output(self, other, "DIA_Addon_Esteban_MIS_07_08"); //森 延 ？ 他 也 为 我 工 作 。 我 告 诉 他 要 把 眼 睛 睁 大 点 。
	};

	MIS_Judas = LOG_RUNNING;
	Log_CreateTopic(Topic_Addon_Esteban, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Esteban, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_4);
};

// --------------------------------------------------------------------
//	Info Attentäter (Kerl)
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Kerl(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 5;
	condition		= DIA_Addon_Esteban_Kerl_Condition;
	information		= DIA_Addon_Esteban_Kerl_Info;
	description		= "我 要 怎 么 开 始 ？";
};

func int DIA_Addon_Esteban_Kerl_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Kerl_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Kerl_15_00"); //我 要 怎 么 开 始 ？
	AI_Output(self, other, "DIA_Addon_Esteban_Kerl_07_01"); //这 事 营 地 的 每 个 人 都 知 道 。 所 以 你 所 有 的 牌 都 摊 在 桌 面 上 了 。
	AI_Output(self, other, "DIA_Addon_Esteban_Kerl_07_02"); //去 查 清 谁 站 在 我 这 边 ， 谁 不 是 ， 而 且 不 要 让 那 些 小 子 糊 弄 了 你 ！
	AI_Output(self, other, "DIA_Addon_Esteban_Kerl_07_03"); //同 斯 耐 夫 谈 谈 。 那 个 胖 厨 师 知 道 很 多 。

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_5);
};

// --------------------------------------------------------------------
//	Info Armor
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Armor(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 9;
	condition		= DIA_Addon_Esteban_Armor_Condition;
	information		= DIA_Addon_Esteban_Armor_Info;
	description		= "我 需 要 更 好 的 盔 甲 。 ";
};

func int DIA_Addon_Esteban_Armor_Condition()
{
	if (Huno_ArmorCheap == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Armor_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Armor_15_00"); //我 需 要 更 好 的 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Esteban_Armor_07_01"); //为 什 么 ？ 你 已 经 查 清 一 些 事 了 。 那 对 你 现 在 来 说 已 经 足 够 好 了 ！
	if (MIS_Judas == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Esteban_Armor_07_02"); //如 果 你 完 成 了 任 务 ， 我 们 会 再 谈 此 事 … …
	};
};

// --------------------------------------------------------------------
//	Info Auftrag
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Auftrag(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 99;
	condition		= DIA_Addon_Esteban_Auftrag_Condition;
	information		= DIA_Addon_Esteban_Auftrag_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 任 务 … …";
};

func int DIA_Addon_Esteban_Auftrag_Condition()
{
	if (((MIS_Judas == LOG_RUNNING)
	|| (MIS_Judas == LOG_SUCCESS))
	&& (Bodyguard_Killer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Auftrag_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Auftrag_15_00"); //关 于 这 个 任 务 … …
	AI_Output(self, other, "DIA_Addon_Esteban_Auftrag_07_01"); //听 着 ， 我 还 有 其 它 的 事 必 须 要 处 理 。

	if (MIS_Judas == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Addon_Esteban_Auftrag_15_02"); //我 以 为 你 有 兴 趣 知 道 谁 是 这 次 袭 击 的 幕 后 指 使 … …
		AI_Output(self, other, "DIA_Addon_Esteban_Auftrag_07_03"); //是 谁 ？ 告 诉 我 他 的 名 字 ， 我 的 卫 兵 会 拧 断 他 的 脖 子 … …
		AI_Output(other, self, "DIA_Addon_Esteban_Auftrag_15_04"); //是 商 人 费 斯 克 指 使 的 。 现 在 ， 他 正 毫 无 疑 虑 地 坐 在 酒 吧 里 喝 酒 … …
		AI_Output(self, other, "DIA_Addon_Esteban_Auftrag_07_05"); //哈 ！ 干 得 好 ， 小 子 。 我 的 卫 兵 会 解 决 他 的 。

		AI_TurnToNpc(self, Wache_01);
		AI_Output(self, other, "DIA_Addon_Esteban_Auftrag_07_06"); //你 听 到 他 说 的 了 ， 小 子 们 。 去 抓 费 斯 克 。
		AI_TurnToNpc(self, other);

		Bodyguard_Killer = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Esteban_Auftrag_07_07"); //等 你 查 明 那 个 家 伙 是 谁 以 后 ， 回 这 里 来 。
		AI_StopProcessInfos(self);
	};
};

// --------------------------------------------------------------------
//	Info Guards Away
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Away(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 5;
	condition		= DIA_Addon_Esteban_Away_Condition;
	information		= DIA_Addon_Esteban_Away_Info;
	description		= "接 下 来 发 生 了 什 么 ？";
};

func int DIA_Addon_Esteban_Away_Condition()
{
	if (Bodyguard_Killer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Away_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Away_15_00"); //接 下 来 发 生 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Esteban_Away_07_01"); //接 下 来 会 发 生 什 么 事 ？ 我 会 告 诉 你 发 生 了 什 么 。
	AI_Output(self, other, "DIA_Addon_Esteban_Away_07_02"); //费 斯 克 会 悲 惨 地 死 去 ， 营 地 里 所 有 的 人 都 会 看 到 。
	AI_Output(self, other, "DIA_Addon_Esteban_Away_07_03"); //那 是 对 他 们 的 一 个 警 告 。

	B_StartotherRoutine(Wache_01, "AMBUSH");
	B_StartotherRoutine(Wache_02, "AMBUSH");
};

// --------------------------------------------------------------------
//	Info Stone
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_Stone(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 5;
	condition		= DIA_Addon_Esteban_Stone_Condition;
	information		= DIA_Addon_Esteban_Stone_Info;
	description		= "我 要 现 在 拿 走 红 色 的 石 头 吗 ？";
};

func int DIA_Addon_Esteban_Stone_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Away)
	&& (Bodyguard_Killer == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Stone_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Stone_15_00"); //我 要 现 在 拿 走 红 色 的 石 头 吗 ？
	AI_Output(self, other, "DIA_Addon_Esteban_Stone_07_01"); //你 的 工 作 干 得 不 错 。 象 你 这 样 的 人 在 矿 井 里 一 定 会 无 事 可 做 。
	AI_Output(self, other, "DIA_Addon_Esteban_Stone_07_02"); //我 这 里 会 更 需 要 你 。 你 将 留 在 营 地 里 继 续 为 我 工 作 。
};

// --------------------------------------------------------------------
//	Info nicht arbeiten
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_not(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 5;
	condition		= DIA_Addon_Esteban_not_Condition;
	information		= DIA_Addon_Esteban_not_Info;
	description		= "我 会 考 虑 一 下 的 。";
};

func int DIA_Addon_Esteban_not_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_not_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_not_15_00"); //我 会 考 虑 一 下 的 。
	AI_Output(self, other, "DIA_Addon_Esteban_not_07_01"); //你 忘 记 了 你 正 在 和 谁 说 话 。 我 掌 管 这 里 ， 你 要 按 照 我 说 的 去 做 。
	AI_Output(self, other, "DIA_Addon_Esteban_not_07_02"); //而 且 我 说 了 ， 你 要 为 我 工 作 ， 而 不 是 其 它 什 么 人 。 明 白 吗 ？
};

// --------------------------------------------------------------------
//	Info Leibwache weg (fight)
// --------------------------------------------------------------------
instance DIA_Addon_Esteban_fight(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 6;
	condition		= DIA_Addon_Esteban_fight_Condition;
	information		= DIA_Addon_Esteban_fight_Info;
	description		= "你 在 跟 我 开 玩 笑 ？";
};

func int DIA_Addon_Esteban_fight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Esteban_Stone))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_fight_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_fight_15_00"); //你 想 把 我 当 作 傻 瓜 耍 吗 ？ 我 从 来 没 有 提 过 要 为 你 工 作 。
	AI_Output(self, other, "DIA_Addon_Esteban_fight_07_01"); //并 非 所 有 人 都 能 听 到 这 样 的 提 议 。 但 是 如 果 你 不 想 要 的 话 ， 你 可 以 随 时 离 开 营 地 … …
	AI_Output(other, self, "DIA_Addon_Esteban_fight_15_02"); //你 遵 守 诺 言 把 红 石 头 交 给 我 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Esteban_fight_07_03"); //嘿 - 再 多 说 一 句 话 ， 我 的 卫 兵 也 就 不 得 不 伤 害 你 了 。
	AI_Output(other, self, "DIA_Addon_Esteban_fight_15_04"); //（ 露 齿 而 笑 ） 什 么 卫 兵 … … ？
	AI_Output(self, other, "DIA_Addon_Esteban_fight_07_05"); //什 么 … … ？ 啊 ， 我 明 白 了 … … 你 想 捣 鬼 ， 那 就 等 着 … …

	Bodyguard_Killer = FALSE;

	B_KillNpc(Wache_01);
	B_KillNpc(Wache_02);

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ---------------------------------------------------------------------
//	Info Duell
// ---------------------------------------------------------------------
instance DIA_Addon_Esteban_Duell(C_INFO)
{
	npc				= BDT_1083_Addon_Esteban;
	nr				= 99;
	condition		= DIA_Addon_Esteban_Duell_Condition;
	information		= DIA_Addon_Esteban_Duell_Info;
	description		= "马 上 把 石 头 给 我 ， 不 然 我 就 自 己 动 手 了 ！";
};

func int DIA_Addon_Esteban_Duell_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Esteban_Rot))
	&& (Bodyguard_Killer != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Esteban_Duell_Info()
{
	AI_Output(other, self, "DIA_Addon_Esteban_Duell_15_00"); //马 上 把 石 头 给 我 ， 不 然 我 就 自 己 动 手 了 ！
	AI_Output(self, other, "DIA_Addon_Esteban_Duell_07_01"); //哦 ， 你 想 要 去 死 。 好 吧 ， 我 会 帮 你 这 个 忙 ， 打 消 你 的 愚 蠢 念 头 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};
