// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Ramon_EXIT(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 999;
	condition		= DIA_Addon_Ramon_EXIT_Condition;
	information		= DIA_Addon_Ramon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Ramon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Ramon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// -----------------------------------------------------------
const string BDT_1071_Checkpoint = "BL_UP_CHECK";
// -----------------------------------------------------------
instance DIA_Addon_Ramon_FirstWarn(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 1;
	condition		= DIA_Addon_Ramon_FirstWarn_Condition;
	information		= DIA_Addon_Ramon_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Ramon_FirstWarn_Condition()
{
	if (Npc_GetDistToWP(other, BDT_1071_Checkpoint) <= 700) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_FirstWarn_Info()
{
	if (Npc_IsDead(Franco))
	{
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_00"); //嘿 ， 那 下 面 发 生 了 什 么 事 ？
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_01"); //我 放 倒 了 佛 朗 哥 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_02"); //真 的 ？ 那 现 在 由 你 来 每 天 监 督 那 些 懒 狗 做 好 他 们 的 工 作 。
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_03"); //嘿 ， 我 不 是 到 这 里 来 忍 受 猎 人 的 骚 扰 的 。 我 要 进 入 营 地 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_04"); //算 了 吧 。 你 干 掉 了 佛 朗 哥 - 现 在 你 是 这 里 的 首 领 。 所 以 去 干 你 的 事 。
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_05"); //如 果 我 是 首 领 ， 那 么 我 决 定 下 一 个 进 去 的 人 是 谁 。
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_06"); //我 决 定 ， 下 个 人 是 我 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_07"); //（ 大 笑 ） 没 那 么 简 单 。 我 们 还 没 有 征 求 所 有 人 的 意 见 ， 所 以 没 人 能 进 去 。
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_08"); //托 鲁 斯 可 以 派 一 个 新 的 猎 人 首 领 ， 那 么 我 将 会 有 一 段 空 闲 时 间 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_09"); //（ 大 笑 ） 你 不 会 放 弃 ， 是 吗 ？ 好 吧 ， 那 么 你 进 去 吧 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_10"); //托 鲁 斯 会 确 保 猎 人 们 不 会 以 无 领 导 状 态 生 活 的 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_11"); //你 在 等 什 么 ？ 去 给 自 己 找 个 十 字 镐 来 。

		self.aivar[AIV_PASSGATE] = TRUE;
		Player_HasTalkedToBanditCamp = TRUE;
		B_GivePlayerXP(XP_Addon_Hinein);
		AI_StopProcessInfos(self);

		AI_Teleport(Carlos, "BL_WAIT_FINN"); // 40 m Glumpsche

		B_StartOtherRoutine(Carlos, "START");
		B_StartOtherRoutine(Finn, "START");
	}
	else if (Ramon_News == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_12"); //嘿 ， 你 想 要 什 么 ？ 我 无 法 想 象 你 得 到 了 营 地 的 许 可 。

		if (Npc_KnowsInfo(other, DIA_Addon_Franco_HI))
		{
			AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_13"); //佛 朗 哥 派 我 来 的 。 他 想 要 知 道 营 地 是 否 要 人 。
		};

		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_14"); //是 的 ， 我 们 需 要 人 员 。 昨 天 有 个 家 伙 挂 掉 了 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_15"); //那 个 白 痴 和 伊 斯 特 班 吵 架 。
		AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_15_16"); //谁 是 伊 斯 特 班 ？
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_17"); //下 面 营 地 的 首 领 。 他 决 定 谁 进 入 矿 井 。
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_18"); //那 么 告 诉 佛 朗 哥 说 托 鲁 斯 想 要 一 个 新 人 。 明 白 吗 ？

		Log_CreateTopic(Topic_Addon_Franco, LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Franco, LOG_RUNNING);
		B_LogEntry(Topic_Addon_Franco, Topic_Addon_Franco_4);

		Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn, "托 鲁 斯 ！ 那 个 托 鲁 斯 ？", DIA_Addon_Ramon_FirstWarn_YES);
		Info_AddChoice(DIA_Addon_Ramon_FirstWarn, "托 鲁 斯 ！ 从 没 听 说 过 他 … …", DIA_Addon_Ramon_FirstWarn_NO);

		Ramon_News = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_07_19"); //嘿 ， 慢 点 ！ 你 不 能 进 那 里 - 所 以 走 开 ！
		AI_StopProcessInfos(self);
	};

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

func void DIA_Addon_Ramon_FirstWarn_YES()
{
	AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_YES_15_00"); //托 鲁 斯 ！ 那 个 托 鲁 斯 ？
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_YES_07_01"); //是 的 。 托 鲁 斯 。 那 个 人 说 需 要 新 的 人 员 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_YES_07_02"); //那 人 决 定 是 否 、 以 及 何 时 新 人 可 以 离 开 沼 泽 和 进 入 营 地 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_YES_07_03"); //你 不 是 想 要 告 诉 我 你 早 就 认 识 他 了 吧 ？
	AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_YES_15_04"); //嗯 … … 是 的 … …
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_YES_07_05"); //听 着 - 所 有 人 都 知 道 托 鲁 斯 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_YES_07_06"); //虽 然 如 此 ， 你 还 是 不 能 进 去 - 而 我 也 不 会 给 他 传 信 ！

	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};

func void DIA_Addon_Ramon_FirstWarn_NO()
{
	AI_Output(other, self, "DIA_Addon_Ramon_FirstWarn_NO_15_00"); //托 鲁 斯 ！ 从 没 听 说 过 他 … …
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_NO_07_01"); //哦 ， 老 兄 ， 你 不 知 道 他 ？ 他 是 旧 营 地 的 卫 兵 头 子 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_NO_07_02"); //他 是 一 个 大 家 都 信 任 的 人 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_NO_07_03"); //他 需 要 信 任 ， 而 且 由 他 决 定 是 否 需 要 新 人 ， 以 及 新 人 什 么 时 候 可 以 进 入 营 地 。
	AI_Output(self, other, "DIA_Addon_Ramon_FirstWarn_NO_07_04"); //如 果 你 活 的 够 长 的 话 ， 那 就 会 知 道 他 。

	Info_ClearChoices(DIA_Addon_Ramon_FirstWarn);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_Ramon_SecondWarn(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 2;
	condition		= DIA_Addon_Ramon_SecondWarn_Condition;
	information		= DIA_Addon_Ramon_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Ramon_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Addon_Ramon_SecondWarn_07_00"); //再 向 前 迈 一 步 的 话 ， 那 就 是 你 最 后 一 步 了 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_1071_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_Ramon_Attack(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 3;
	condition		= DIA_Addon_Ramon_Attack_Condition;
	information		= DIA_Addon_Ramon_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Ramon_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_1071_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Addon_Ramon_Attack_07_00"); //有 些 人 永 远 也 不 会 学 会 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// 			News
// ************************************************************
instance DIA_Addon_Ramon_News(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 10;
	condition		= DIA_Addon_Ramon_News_Condition;
	information		= DIA_Addon_Ramon_News_Info;
	description		= "我 就 是 那 个 新 人 。";
};

func int DIA_Addon_Ramon_News_Condition()
{
	if (!Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_News_Info()
{
	AI_Output(other, self, "DIA_Addon_Ramon_News_15_00"); //我 就 是 那 个 新 人 。
	AI_Output(self, other, "DIA_Addon_Ramon_News_07_01"); //嘿 ， 别 想 愚 弄 我 。 现 在 还 是 由 佛 朗 哥 决 定 你 们 谁 能 进 入 营 地 。
};

// ************************************************************
// 			Lie
// ************************************************************
instance DIA_Addon_Ramon_Lie(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 10;
	condition		= DIA_Addon_Ramon_Lie_Condition;
	information		= DIA_Addon_Ramon_Lie_Info;
	description		= "佛 朗 哥 派 我 来 的 … …";
};

func int DIA_Addon_Ramon_Lie_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Ramon_News)
	&& !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Lie_Info()
{
	AI_Output(other, self, "DIA_Addon_Ramon_Lie_15_00"); //佛 朗 哥 派 我 来 的 … …
	AI_Output(self, other, "DIA_Addon_Ramon_Lie_07_01"); //不 是 他 。 所 以 走 开 吧 ， 否 则 我 就 打 碎 你 的 骨 头 … …

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			Perm
// ************************************************************
instance DIA_Addon_Ramon_Perm(C_INFO)
{
	npc				= BDT_1071_Addon_Ramon;
	nr				= 99;
	condition		= DIA_Addon_Ramon_Perm_Condition;
	information		= DIA_Addon_Ramon_Perm_Info;
	permanent		= TRUE;
	description		= "一 切 都 受 到 控 制 了 吗 ？";
};

func int DIA_Addon_Ramon_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Ramon_News)
	&& !Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Ramon_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Ramon_Perm_15_00"); //一 切 都 受 到 控 制 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Ramon_Perm_07_01"); //这 里 一 切 顺 利 - 只 要 没 有 不 应 该 的 人 进 去 就 行 。

	AI_StopProcessInfos(self);
};
