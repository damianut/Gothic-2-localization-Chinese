///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Franco_EXIT(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 999;
	condition		= DIA_Addon_Franco_EXIT_Condition;
	information		= DIA_Addon_Franco_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Franco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_EXIT_Info()
{
	if ((Franco_Exit == FALSE)
	&& (MIS_HlpLogan == LOG_RUNNING))
	{
		AI_Output(self, other, "DIA_Addon_Franco_EXIT_08_00"); //不 要 迷 路 ， 否 则 你 就 会 变 成 鲨 鱼 的 食 物 。
		Franco_Exit = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Franco_PICKPOCKET(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 900;
	condition		= DIA_Franco_PICKPOCKET_Condition;
	information		= DIA_Franco_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 走 他 的 护 身 符 要 冒 很 大 的 风 险 ）";
};

func int DIA_Franco_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)
	&& (Npc_HasItems(self, ItAm_Addon_Franco) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Franco_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
	Info_AddChoice(DIA_Franco_PICKPOCKET, DIALOG_BACK, DIA_Franco_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Franco_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Franco_PICKPOCKET_DoIt);
};

func void DIA_Franco_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems(self, other, ItAm_Addon_Franco, 1);
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Franco_PICKPOCKET);

		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX] = 196; // boah ey, ist ja ein super trick!
		self.attribute[ATR_HITPOINTS] = 196;
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Franco_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Franco_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_HI(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 1;
	condition		= DIA_Addon_Franco_HI_Condition;
	information		= DIA_Addon_Franco_HI_Info;
	important		= TRUE;
};

func int DIA_Addon_Franco_HI_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_HI_Info()
{
	Log_CreateTopic(Topic_Addon_Franco, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Franco, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_5);

	AI_Output(self, other, "DIA_Addon_Franco_HI_08_00"); //嘿 ， 你 在 这 里 做 什 么 ？ 你 想 要 进 入 营 地 ？
	AI_Output(other, self, "DIA_Addon_Franco_HI_15_01"); //是 的 ， 我 是 … …
	AI_Output(self, other, "DIA_Addon_Franco_HI_08_02"); //我 不 在 乎 你 是 谁 。 我 是 佛 朗 哥 ， 我 是 这 里 的 首 领 。
	AI_Output(self, other, "DIA_Addon_Franco_HI_08_03"); //因 此 ， 如 果 你 在 这 里 干 得 不 错 的 话 ， 我 就 让 你 进 入 营 地 。

	if (Ramon_News == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Franco_HI_08_04"); //雷 蒙 ， 看 门 人 ， 会 告 诉 你 营 地 里 是 否 需 要 新 人 。 去 和 他 谈 谈 。
		B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_6);
	};
};

// ---------------------------------------------------------------------
//	Info Mission SumpfHai
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_Hai(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 2;
	condition		= DIA_Addon_Franco_Hai_Condition;
	information		= DIA_Addon_Franco_Hai_Info;
	description		= "托 鲁 斯 需 要 一 个 新 人 。 ";
};

func int DIA_Addon_Franco_Hai_Condition()
{
	if (Ramon_News == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Hai_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_Hai_15_00"); //托 鲁 斯 需 要 一 个 新 人 。
	AI_Output(self, other, "DIA_Addon_Franco_Hai_08_01"); //好 。 我 会 去 做 的 。
	AI_Output(other, self, "DIA_Addon_Franco_Hai_15_02"); //等 一 下 ， 我 怎 么 办 ？
	AI_Output(self, other, "DIA_Addon_Franco_Hai_08_03"); //你 还 什 么 都 没 有 做 。
	AI_Output(other, self, "DIA_Addon_Franco_Hai_15_04"); //我 已 经 做 了 很 多 ， 不 过 你 不 知 道 。
	AI_Output(self, other, "DIA_Addon_Franco_Hai_08_05"); //好 吧 ， 你 想 要 个 机 会 ？ 那 你 会 得 到 机 会 。 去 找 洛 根 。 沼 泽 鲨 正 让 他 如 鲠 在 喉 。
	AI_Output(self, other, "DIA_Addon_Franco_Hai_08_06"); //帮 助 他 解 决 那 些 野 兽 ， 那 样 你 就 能 进 入 营 地 。

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_7);
};

// ---------------------------------------------------------------------
//	Info Logan Wo?
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_Wo(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 3;
	condition		= DIA_Addon_Franco_Wo_Condition;
	information		= DIA_Addon_Franco_Wo_Info;
	description		= "我 在 哪 里 能 找 到 洛 根 ？";
};

func int DIA_Addon_Franco_Wo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Franco_Hai))
	&& (!Npc_IsDead(Logan))
	&& (MIS_HlpLogan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Wo_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_Wo_15_00"); //我 在 哪 里 能 找 到 洛 根 ？
	AI_Output(self, other, "DIA_Addon_Franco_Wo_08_01"); //如 果 你 站 在 营 地 入 口 的 前 面 ， 沿 着 左 边 的 石 墙 走 。 往 前 面 一 点 就 进 了 营 地 。
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Logan tot
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_tot(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 5;
	condition		= DIA_Addon_Franco_tot_Condition;
	information		= DIA_Addon_Franco_tot_Info;
	description		= "洛 根 死 了 。";
};

func int DIA_Addon_Franco_tot_Condition()
{
	if ((MIS_HlpLogan != LOG_SUCCESS)
	&& Npc_IsDead(Logan)
	&& Npc_KnowsInfo(other, DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tot_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_tot_15_00"); //洛 根 死 了 。
	AI_Output(self, other, "DIA_Addon_Franco_tot_08_01"); //该 死 。 他 是 我 们 这 里 最 好 的 猎 人 。 该 死 的 祸 害 。
	AI_Output(self, other, "DIA_Addon_Franco_tot_08_02"); //无 论 如 阿 ， 我 已 经 派 了 一 些 人 进 营 地 。

	if (MIS_HlpLogan == LOG_RUNNING)
	{
		MIS_HlpLogan = LOG_OBSOLETE;
		B_CheckLog();
	};
};

// ---------------------------------------------------------------------
//	Info Logan Success HAISUCCESS
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_HaiSuccess(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 6;
	condition		= DIA_Addon_Franco_HaiSuccess_Condition;
	information		= DIA_Addon_Franco_HaiSuccess_Info;
	description		= "我 帮 助 了 洛 根 … …";
};

func int DIA_Addon_Franco_HaiSuccess_Condition()
{
	if ((MIS_HlpLogan == LOG_SUCCESS)
	&& Npc_KnowsInfo(other, DIA_Addon_Franco_Hai))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_HaiSuccess_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_HaiSuccess_15_00"); //我 帮 助 了 洛 根 … …

	if (Npc_IsDead(Logan))
	{
		AI_Output(other, self, "DIA_Addon_Franco_HaiSuccess_15_01"); //… … 但 是 他 没 有 活 下 来 。
	};

	AI_Output(self, other, "DIA_Addon_Franco_HaiSuccess_08_02"); //好 吧 ， 这 么 说 你 战 胜 了 沼 泽 鲨 - 你 很 有 用 - 至 少 比 这 里 大 多 数 家 伙 有 用 。
	B_GivePlayerXP(XP_Addon_HlpLogan);

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_8);
};

// ---------------------------------------------------------------------
//	Mis 2 (Edgor)
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_Mis2(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 7;
	condition		= DIA_Addon_Franco_Mis2_Condition;
	information		= DIA_Addon_Franco_Mis2_Info;
	description		= "那 么 我 现 在 可 以 去 营 地 了 吗 ？";
};

func int DIA_Addon_Franco_Mis2_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Franco_HaiSuccess))
	|| (Npc_KnowsInfo(other, DIA_Addon_Franco_tot)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Mis2_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_MIS2_15_00"); //那 么 我 现 在 可 以 去 营 地 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Franco_MIS2_08_01"); //听 着 - 我 还 需 要 你 做 一 件 事 。
	AI_Output(self, other, "DIA_Addon_Franco_MIS2_08_02"); //几 天 前 ， 我 派 艾 德 高 进 入 沼 泽 。
	AI_Output(self, other, "DIA_Addon_Franco_MIS2_08_03"); //他 应 该 给 我 拿 回 一 个 古 老 的 石 片 - 但 是 从 那 时 起 ， 就 再 也 没 有 见 过 他 。
	AI_Output(self, other, "DIA_Addon_Franco_MIS2_08_04"); //去 看 看 他 在 做 什 么 ， 并 把 那 该 死 的 石 片 给 我 拿 来 。

	MIS_HlpEdgor = LOG_RUNNING;

	Log_CreateTopic(Topic_Addon_Stoneplate, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Stoneplate, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Stoneplate, Topic_Addon_Stoneplate_1);

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_9);
};

// ---------------------------------------------------------------------
//	Info Logan While
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_While(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 8;
	condition		= DIA_Addon_Franco_While_Condition;
	information		= DIA_Addon_Franco_While_Info;
	description		= "报 酬 怎 么 办 ？";
};

func int DIA_Addon_Franco_While_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Franco_HaiSuccess))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_While_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_While_15_00"); //报 酬 怎 么 办 ？
	AI_Output(self, other, "DIA_Addon_Franco_While_08_01"); //什 么 ？
	AI_Output(other, self, "DIA_Addon_Franco_While_15_02"); //我 在 沼 泽 的 这 里 的 工 作 能 得 到 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_Franco_While_08_03"); //（ 极 其 友 好 ） 你 想 要 金 子 ？ 当 然 ， 你 想 要 多 少 ？ 五 十 个 金 块 ？ 一 百 个 ？ 只 要 你 能 带 走 ， 想 要 多 少 我 就 给 你 多 少 … …
	AI_Output(self, other, "DIA_Addon_Franco_While_08_04"); //（ 大 声 的 ） 你 以 为 你 是 谁 ？ 你 想 取 笑 我 吗 ？
	AI_Output(self, other, "DIA_Addon_Franco_While_08_05"); //马 上 在 离 开 去 做 点 什 么 事 ！ 否 则 ， 你 连 金 沫 也 得 不 到 ！ ！
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info WOEDGOR
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_WOEDGOR(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 9;
	condition		= DIA_Addon_Franco_WOEDGOR_Condition;
	information		= DIA_Addon_Franco_WOEDGOR_Info;
	permanent		= TRUE;
	description		= "那 么 我 在 哪 里 可 以 找 到 艾 德 高 ？ ";
};

func int DIA_Addon_Franco_WOEDGOR_Condition()
{
	if ((MIS_HlpEdgor == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_Addon_Stone_04) < 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_WOEDGOR_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_WOEDGOR_15_00"); //那 么 我 在 哪 里 可 以 找 到 艾 德 高 ？
	AI_Output(self, other, "DIA_Addon_Franco_WOEDGOR_08_01"); //你 想 走 安 全 的 路 还 是 快 速 的 路 ？

	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR, "我 选 择 最 快 的 方 法 。", DIA_Addon_Franco_WOEDGOR_Fast);
	Info_AddChoice(DIA_Addon_Franco_WOEDGOR, "告 诉 我 简 单 的 方 法 。", DIA_Addon_Franco_WOEDGOR_Easy);
};

func void B_Addon_Franco_There()
{
	AI_Output(self, other, "DIA_Addon_Franco_There_08_00"); //到 处 都 是 废 墟 。 他 就 坐 在 那 里 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Addon_Franco_There_08_01"); //我 要 假 设 他 足 够 聪 明 ， 会 给 自 己 升 一 堆 篝 火 。 你 应 该 可 以 看 到 那 个 。
};

func void DIA_Addon_Franco_WOEDGOR_Easy()
{
	AI_Output(other, self, "DIA_Addon_Franco_WOEDGOR_Easy_15_00"); //告 诉 我 简 单 的 方 法 。
	AI_Output(self, other, "DIA_Addon_Franco_WOEDGOR_Easy_08_01"); //沿 着 路 走 ， 去 前 门 。 桑 卓 应 该 站 在 那 里 。
	AI_Output(self, other, "DIA_Addon_Franco_WOEDGOR_Easy_08_02"); //从 那 里 左 转 ， 然 后 沿 着 木 板 路 走 。

	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

func void DIA_Addon_Franco_WOEDGOR_Fast()
{
	AI_Output(other, self, "DIA_Addon_Franco_WOEDGOR_Fast_15_00"); //我 选 择 最 快 的 方 法 。
	AI_Output(self, other, "DIA_Addon_Franco_WOEDGOR_Fast_08_01"); //好 吧 。 从 这 里 向 左 边 斜 过 木 板 路 ， 进 入 沼 泽 。

	B_Addon_Franco_There();
	Info_ClearChoices(DIA_Addon_Franco_WOEDGOR);
};

// ---------------------------------------------------------------------
//	Info tafel
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_tafel(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 10;
	condition		= DIA_Addon_Franco_tafel_Condition;
	information		= DIA_Addon_Franco_tafel_Info;
	description		= "给 你 石 片 。";
};

func int DIA_Addon_Franco_tafel_Condition()
{
	if ((Npc_HasItems(other, ItMi_Addon_Stone_04) >= 1)
	&& (MIS_HlpEdgor == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_tafel_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_tafel_15_00"); //给 你 石 片 。
	B_GiveInvItems(other, self, ItMi_Addon_Stone_04, 1);

	AI_Output(self, other, "DIA_Addon_Franco_tafel_08_01"); //好 ， 非 常 好 。 瑞 雯 会 对 你 感 到 满 意 的 。
	MIS_HlpEdgor = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HlpEdgor);

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_10);
};

// ---------------------------------------------------------------------
//	JemandAnderen
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_JemandAnderen(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 11;
	condition		= DIA_Addon_Franco_JemandAnderen_Condition;
	information		= DIA_Addon_Franco_JemandAnderen_Info;
	description		= "那 么 营 地 呢 ？ 我 现 在 可 以 进 去 了 吗 ？";
};

func int DIA_Addon_Franco_JemandAnderen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Franco_tafel))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_JemandAnderen_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_JemandAnderen_15_00"); //那 么 营 地 呢 ？ 我 现 在 可 以 进 去 了 吗 ？

	if (!Npc_IsDead(Logan))
	{
		AI_Output(self, other, "DIA_Addon_Franco_JemandAnderen_08_01"); //不 ， 我 已 经 派 洛 根 进 去 了 。 在 名 单 里 他 排 在 你 前 面 。

		Logan_Inside = TRUE;
		AI_Teleport(Logan, "BL_INN_CORNER_02");
		B_StartOtherRoutine(Logan, "LAGER");
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Franco_JemandAnderen_08_02"); //不 ， 我 已 经 派 其 它 人 进 去 了 。
	};

	AI_Output(self, other, "DIA_Addon_Franco_JemandAnderen_08_03"); //现 在 ， 营 地 里 不 需 要 其 它 人 。
	AI_Output(self, other, "DIA_Addon_Franco_JemandAnderen_08_04"); //此 外 ， 我 这 里 非 常 需 要 你 ， （ 露 齿 而 笑 ） 现 在 那 个 洛 根 已 经 不 在 这 里 了 。

	B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_11);
};

// ---------------------------------------------------------------------
//	Info Fight
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_Fight(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 12;
	condition		= DIA_Addon_Franco_Fight_Condition;
	information		= DIA_Addon_Franco_Fight_Info;
	permanent		= TRUE;
	description		= "马 上 让 我 进 去 ！";
};

func int DIA_Addon_Franco_Fight_Condition()
{
	return TRUE;
};

func void DIA_Addon_Franco_Fight_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_Fight_15_00"); //马 上 让 我 进 去 ！
	AI_Output(self, other, "DIA_Addon_Franco_Fight_08_01"); //（ 危 险 的 友 善 ） 那 如 果 我 说 不 呢 ？

	Info_ClearChoices(DIA_Addon_Franco_Fight);
	Info_AddChoice(DIA_Addon_Franco_Fight, "那 么 我 会 在 等 一 回 … …", DIA_Addon_Franco_Fight_Nothing);
	Info_AddChoice(DIA_Addon_Franco_Fight, "然 后 你 就 会 后 悔 。", DIA_Addon_Franco_Fight_Duel);
};

func void DIA_Addon_Franco_Fight_Duel()
{
	AI_Output(other, self, "DIA_Addon_Franco_Fight_Duel_15_00"); //然 后 你 就 会 后 悔 。
	AI_Output(self, other, "DIA_Addon_Franco_Fight_Duel_08_01"); //你 在 威 胁 我 ？ 你 ？ 想 要 威 胁 我 ？ - 该 上 一 堂 课 了 … …
	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Addon_Franco_Fight_Nothing()
{
	AI_Output(other, self, "DIA_Addon_Franco_Fight_Nothing_15_00"); //那 么 我 会 在 等 一 回 … …
	AI_Output(self, other, "DIA_Addon_Franco_Fight_Nothing_08_01"); //（ 嘲 笑 ） 确 实 如 此 。

	Info_ClearChoices(DIA_Addon_Franco_Fight);
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Fight2
// ---------------------------------------------------------------------
instance DIA_Addon_Franco_Pig(C_INFO)
{
	npc				= BDT_1093_Addon_Franco;
	nr				= 13;
	condition		= DIA_Addon_Franco_Pig_Condition;
	information		= DIA_Addon_Franco_Pig_Info;
	permanent		= TRUE;
	description		= "你 这 个 混 蛋 ！ 我 要 干 掉 你 ！";
};

func int DIA_Addon_Franco_Pig_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Franco_JemandAnderen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Franco_Pig_Info()
{
	AI_Output(other, self, "DIA_Addon_Franco_Pig_15_00"); //你 这 个 混 蛋 ！ 我 要 干 掉 你 ！
	AI_Output(self, other, "DIA_Addon_Franco_Pig_08_01"); //（ 紧 张 的 ） 你 这 可 怜 的 小 家 伙 ， 你 想 给 我 捣 乱 ？ 你 等 着 瞧 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};
