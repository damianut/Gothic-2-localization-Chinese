// ************************************************************
// 								EXIT
// ************************************************************
instance DIA_Pepe_EXIT(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 999;
	condition		= DIA_Pepe_EXIT_Condition;
	information		= DIA_Pepe_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Pepe_Hallo(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 1;
	condition		= DIA_Pepe_Hallo_Condition;
	information		= DIA_Pepe_Hallo_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Pepe_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Pepe_Hallo_Info()
{
	AI_Output(other, self, "DIA_Pepe_Hallo_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Pepe_Hallo_03_01"); //（ 无 聊 的 ） 看 羊 ！ （ 叹 息 ） 如 果 可 能 的 话 ， 不 要 惹 麻 烦 。

	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other, self, "DIA_Pepe_Hallo_15_02"); //并 不 是 总 有 效 ， 对 吗 ？
		AI_Output(self, other, "DIA_Pepe_Hallo_03_03"); //不 ， 尤 其 对 雇 佣 兵 没 用 。 我 非 常 高 兴 能 出 来 呆 在 牧 场 这 里 ， 虽 然 可 能 也 很 危 险 。
	};
};

// ************************************************************
// 								Danger
// ************************************************************
instance DIA_Pepe_Danger(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 2;
	condition		= DIA_Pepe_Danger_Condition;
	information		= DIA_Pepe_Danger_Info;
	description		= "牧 场 有 什 么 危 险 ？";
};

func int DIA_Pepe_Danger_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Danger_Info()
{
	AI_Output(other, self, "DIA_Pepe_Danger_15_00"); //牧 场 有 什 么 危 险 ？
	AI_Output(self, other, "DIA_Pepe_Danger_03_01"); //有 一 些 狼 在 附 近 游 荡 。 近 来 那 些 该 死 的 野 兽 几 乎 每 天 都 要 来 吃 掉 我 的 一 头 绵 羊 。
	AI_Output(self, other, "DIA_Pepe_Danger_03_02"); //几 天 前 ， 我 几 乎 有 现 在 两 倍 数 量 的 绵 羊 。 我 不 敢 去 想 ， 如 果 欧 纳 尔 知 道 这 事 的 话 ， 他 会 怎 么 对 付 我 。
};

// ************************************************************
// 								WhyNotSLD
// ************************************************************
instance DIA_Pepe_WhyNotSLD(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 3;
	condition		= DIA_Pepe_WhyNotSLD_Condition;
	information		= DIA_Pepe_WhyNotSLD_Info;
	description		= "你 为 什 么 不 告 诉 雇 佣 兵 关 于 狼 的 事 ？ 我 想 他 们 现 在 为 你 们 工 作 ？";
};

func int DIA_Pepe_WhyNotSLD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pepe_Danger))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Pepe_WhyNotSLD_Info()
{
	AI_Output(other, self, "DIA_Pepe_WhyNotSLD_15_00"); //你 为 什 么 不 告 诉 雇 佣 兵 关 于 狼 的 事 ？ 我 想 他 们 现 在 为 你 们 工 作 。
	AI_Output(self, other, "DIA_Pepe_WhyNotSLD_03_01"); //对 ， 我 知 道 。 我 真 应 该 那 么 做 。 但 是 我 没 有 ， 该 死 。
	AI_Output(self, other, "DIA_Pepe_WhyNotSLD_03_02"); //现 在 ， 丢 了 这 么 多 的 羊 ， 我 害 怕 对 任 何 人 提 起 这 件 事 。
	AI_Output(other, self, "DIA_Pepe_WhyNotSLD_15_03"); //但 是 你 刚 刚 告 诉 了 我 … …
	AI_Output(self, other, "DIA_Pepe_WhyNotSLD_03_04"); //（ 恼 怒 的 ） 我 已 经 感 到 后 悔 了 。
};

// ************************************************************
// 								KillWolves
// ************************************************************
instance DIA_Pepe_KillWolves(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 4;
	condition		= DIA_Pepe_KillWolves_Condition;
	information		= DIA_Pepe_KillWolves_Info;
	description		= "如 果 我 杀 了 那 些 狼 呢 ？";
};

func int DIA_Pepe_KillWolves_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Danger))
	{
		return TRUE;
	};
};

func void DIA_Pepe_KillWolves_Info()
{
	AI_Output(other, self, "DIA_Pepe_KillWolves_15_00"); //如 果 我 杀 了 那 些 狼 呢 ？
	AI_Output(self, other, "DIA_Pepe_KillWolves_03_01"); //（ 嘲 弄 的 ） 你 ， 你 自 己 ？ 哈 哈 。 我 不 相 信 。 我 还 不 如 相 信 我 的 领 头 羊 会 那 么 做 。
	AI_Output(other, self, "DIA_Pepe_KillWolves_15_02"); //算 了 吧 。 那 只 是 一 个 建 议 。 我 要 去 其 它 人 那 里 ， 看 看 他 们 对 此 有 什 么 意 见 … …
	AI_Output(self, other, "DIA_Pepe_KillWolves_03_03"); //（ 害 怕 ） 等 一 下 。 好 吧 ， 好 吧 ！ 嗯 … … 你 是 最 棒 的 ， 你 可 以 一 次 解 决 几 百 头 狼 。 没 问 题 ！
	AI_Output(self, other, "DIA_Pepe_KillWolves_03_04"); //它 们 大 多 数 都 潜 伏 在 牧 场 附 近 的 树 木 之 中 。 （ 顺 便 带 上 一 句 ） 我 想 只 有 四 头 … …

	AI_StopProcessInfos(self);

	Wld_InsertNpc(PEPES_YWolf1, "FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(PEPES_YWolf2, "FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(PEPES_YWolf3, "FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(PEPES_YWolf4, "FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");

	MIS_Pepe_KillWolves = LOG_RUNNING;

	Log_CreateTopic(TOPIC_PepeWolves, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PepeWolves, LOG_RUNNING);
	B_LogEntry(TOPIC_PepeWolves, TOPIC_PepeWolves_1);
};

// ************************************************************
// 								KilledWolves
// ************************************************************
instance DIA_Pepe_KilledWolves(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 5;
	condition		= DIA_Pepe_KilledWolves_Condition;
	information		= DIA_Pepe_KilledWolves_Info;
	permanent		= TRUE;
	description		= "我 已 经 解 决 了 狼 。";
};

func int DIA_Pepe_KilledWolves_Condition()
{
	if (MIS_Pepe_KillWolves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Pepe_KilledWolves_Info()
{
	AI_Output(other, self, "DIA_Pepe_KilledWolves_15_00"); //我 已 经 解 决 了 狼 。

	if ((Npc_IsDead(PEPES_YWolf1))
	&& (Npc_IsDead(PEPES_YWolf2))
	&& (Npc_IsDead(PEPES_YWolf3))
	&& (Npc_IsDead(PEPES_YWolf4)))
	{
		AI_Output(self, other, "DIA_Pepe_KilledWolves_03_01"); //（ 吃 惊 的 ） 你 成 功 了 ！ 感 谢 英 诺 斯 ！
		AI_Output(self, other, "DIA_Pepe_KilledWolves_03_02"); //但 是 现 在 我 还 是 不 知 道 怎 么 告 诉 欧 纳 尔 羊 丢 了。
		AI_Output(self, other, "DIA_Pepe_KilledWolves_03_03"); //（ 自 言 自 语 ） 这 都 是 那 个 该 死 的 布 尔 克 的 错 ！

		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP(XP_PepeWolves);
	}
	else
	{
		AI_Output(self, other, "DIA_Pepe_KilledWolves_03_04"); //我 不 需 要 你 来 嘲 弄 我 ， 那 些 野 兽 还 没 有 全 部 死 掉 。
	};
};

// ************************************************************
// 					Was hast du über Bullco gesagt?
// ************************************************************
instance DIA_Pepe_Bullco(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 5;
	condition		= DIA_Pepe_Bullco_Condition;
	information		= DIA_Pepe_Bullco_Info;
	description		= "你 说 布 尔 克 怎 么 了 ？";
};

func int DIA_Pepe_Bullco_Condition()
{
	if ((MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (!Npc_IsDead(Bullco))
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Bullco_Info()
{
	AI_Output(other, self, "DIA_Pepe_Bullco_15_00"); //你 说 布 尔 克 怎 么 了 ？
	AI_Output(self, other, "DIA_Pepe_Bullco_03_01"); //他 是 一 个 雇 佣 兵 。 事 实 上 他 的 工 作 就 是 保 护 牧 场 。
	AI_Output(self, other, "DIA_Pepe_Bullco_03_02"); //但 实 际 上 ， 他 和 他 的 朋 友 席 尔 维 欧 整 天 都 在 特 赫 克 拉 的 厨 房 里 鬼 混 。
	AI_Output(self, other, "DIA_Pepe_Bullco_03_03"); //如 果 因 为 那 些 丢 失 的 羊 而 让 我 得 不 到 几 周 的 薪 水 的 话 ， 那 都 是 那 个 混 蛋 的 错 。
	AI_Output(self, other, "DIA_Pepe_Bullco_03_04"); //我 希 望 我 能 一 拳 打 在 他 的 嘴 上 ， 让 他 了 解 一 下 后 果 。 但 是 没 人 敢 动 他 。 那 家 伙 是 个 杀 人 犯 。

	MIS_Pepe_KickBullco = LOG_RUNNING;

	Log_CreateTopic(TOPIC_KickBullco, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KickBullco, LOG_RUNNING);
	B_LogEntry(TOPIC_KickBullco, TOPIC_KickBullco_1);
};

// ************************************************************
// 						Bullco geschlagen
// ************************************************************
instance DIA_Pepe_BullcoDefeated(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 5;
	condition		= DIA_Pepe_BullcoDefeated_Condition;
	information		= DIA_Pepe_BullcoDefeated_Info;
	description		= "布 尔 克 得 到 了 他 应 得 的 。";
};

func int DIA_Pepe_BullcoDefeated_Condition()
{
	if (MIS_Pepe_KickBullco == LOG_RUNNING)
	{
		if ((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
		|| (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pepe_BullcoDefeated_Info()
{
	AI_Output(other, self, "DIA_Pepe_BullcoDefeated_15_00"); //布 尔 克 已 经 得 到 报 应 了 。 我 已 经 给 他 上 了 一 课 。
	AI_Output(self, other, "DIA_Pepe_BullcoDefeated_03_01"); //那 个 畜 牲 罪 有 应 得 。

	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP(XP_KickBullco);
};

// ************************************************************
// 			  					PERM
// ************************************************************
instance DIA_Pepe_PERM(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 6;
	condition		= DIA_Pepe_PERM_Condition;
	information		= DIA_Pepe_PERM_Info;
	permanent		= TRUE;
	description		= "你 好 啊 ， 你 的 绵 羊 怎 么 样 了 ？";
};

func int DIA_Pepe_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info()
{
	AI_Output(other, self, "DIA_Pepe_PERM_15_00"); //你 好 啊 ， 你 的 绵 羊 怎 么 样 了 ？

	if (kapitel <= 1)
	{
		AI_Output(self, other, "DIA_Pepe_PERM_03_01"); //我 很 好 。 那 些 绵 羊 也 没 事 。 那 是 因 为 这 里 剩 下 的 那 些 人 干 的 不 错 。
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_Pepe_PERM_03_02"); //好 。 那 是 那 些 狼 肯 定 有 一 天 还 会 回 来 。 而 且 那 时 他 们 可 能 数 量 会 更 多 ！
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_Pepe_PERM_03_03"); //我 听 到 一 件 非 常 奇 怪 的 事 。 据 说 有 些 不 怀 好 意 的 家 伙 出 现 在 塞 柯 布 的 农 场 里 。 他 们 正 在 包 围 他 的 房 子 。
	};

	if (kapitel >= 4)
	{
		AI_Output(self, other, "DIA_Pepe_PERM_03_04"); //我 听 说 有 些 凶 手 在 洛 拔 特 的 农 场 安 了 家 。 也 许 应 该 有 人 去 帮 帮 他 。
	};
};

// ************************************************************
// 			  					Liesel
// ************************************************************
instance DIA_Pepe_Liesel(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 7;
	condition		= DIA_Pepe_Liesel_Condition;
	information		= DIA_Pepe_Liesel_Info;
	description		= "我 能 买 一 头 绵 羊 吗 ？";
};

func int DIA_Pepe_Liesel_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pepe_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Liesel_Info()
{
	AI_Output(other, self, "DIA_Pepe_Liesel_15_00"); //我 能 买 一 头 绵 羊 吗 ？
	AI_Output(self, other, "DIA_Pepe_Liesel_03_01"); //随 时 都 可 以 ， 只 要 你 能 付 钱 。 一 头 绵 羊 需 要100枚 金 币 。
	AI_Output(self, other, "DIA_Pepe_Liesel_03_02"); //如 果 你 付 钱 ， 就 能 拿 走 一 头 绵 羊 。 但 是 你 一 定 要 对 它 好 点 。
};

// ************************************************************
// 			  				Buy Liesel
// ************************************************************
var int Pepe_SchafGekauft;
instance DIA_Pepe_BuyLiesel(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 8;
	condition		= DIA_Pepe_BuyLiesel_Condition;
	information		= DIA_Pepe_BuyLiesel_Info;
	permanent		= TRUE;
	description		= "这 是 １ ０ ０ 枚 金 币 。 那 么 给 我 一 头 绵 羊 。";
};

func int DIA_Pepe_BuyLiesel_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Pepe_LIESEL))
	{
		return TRUE;
	};
};

func void DIA_Pepe_BuyLiesel_Info()
{
	AI_Output(other, self, "DIA_Pepe_BuyLiesel_15_00"); //这 是 １ ０ ０ 枚 金 币 。 那 么 给 我 一 头 绵 羊 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		if (Pepe_SchafGekauft == 0)
		{
			AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_01"); //好 。 那 带 走 贝 斯 蒂 吧 - 你 可 以 在 牧 场 上 找 到 它 。
			AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_02"); //只 要 对 它 说 它 应 该 跟 你 走 就 行 。 它 是 一 头 非 常 聪 明 的 绵 羊 。 对 它 好 一 些 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_03"); //还 要 ？ 好 吧 。 带 走 贝 斯 蒂。
			AI_Output(other, self, "DIA_Pepe_BuyLiesel_15_04"); //贝 斯 蒂 ？ 但 是 上 一 头 绵 羊 就 叫 贝 斯 蒂 … …
			AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_05"); //所 有 的 绵 羊 都 叫 贝 斯 蒂 。
			if (Pepe_SchafGekauft == 3)
			{
				AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_06"); //当 然 ， 除 了 公 羊 以 外 。
				AI_Output(other, self, "DIA_Pepe_BuyLiesel_15_07"); //那 它 们 叫 什 么？
				AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_08"); //布 鲁 斯 。
			};
		};

		Pepe_SchafGekauft = Pepe_SchafGekauft + 1;
		Wld_InsertNpc(Follow_Sheep, "NW_BIGFARM_SHEEP2_02"); // *** FIXME *** noch entsprechenden WP/FP eintragen

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Pepe_BuyLiesel_03_09"); //你 没 有 那 么 多 金 币 。 我 不 会 打 折 卖 给 你 绵 羊 的 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Pepe_PICKPOCKET(C_INFO)
{
	npc				= BAU_912_Pepe;
	nr				= 900;
	condition		= DIA_Pepe_PICKPOCKET_Condition;
	information		= DIA_Pepe_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Pepe_PICKPOCKET_Condition()
{
	C_Beklauen(15, 25);
};

func void DIA_Pepe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
	Info_AddChoice(DIA_Pepe_PICKPOCKET, DIALOG_BACK, DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};
