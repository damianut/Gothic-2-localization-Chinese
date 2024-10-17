// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_DiegoNW_EXIT(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 999;
	condition		= DIA_DiegoNW_EXIT_Condition;
	information		= DIA_DiegoNW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_DiegoNW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DiegoNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ######################################
// ##
// ## Permanent Info
// ##
// ######################################

// ************************************************************
// 	  	  Wie laufen die Geschäfte? (perm)
// ************************************************************
instance DIA_DiegoNW_Perm(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 998;
	condition		= DIA_DiegoNW_Perm_Condition;
	information		= DIA_DiegoNW_Perm_Info;
	permanent		= TRUE;
	description		= "最 近 生 意 好 吗 ？";
};

func int DIA_DiegoNW_Perm_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Perm_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_Perm_15_00"); //最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_DiegoNW_Perm_11_01"); //该 死 。 应 该 有 人 告 诉 我 克 霍 里 尼 斯 现 在 已 经 完 蛋 了 。
	AI_Output(other, self, "DIA_DiegoNW_Perm_15_02"); //不 知 道 。 我 认 识 的 城 就 是 这 个 样 子 。
	AI_Output(self, other, "DIA_DiegoNW_Perm_11_03"); //你 要 是 几 年 前 看 到 它 的 话 ， 你 那 时 应 该 会 喜 欢 上 它 。
};

// ######################################
// ##
// ## Kapitel 3
// ##
// ######################################

// ************************************************************
// 	  	  Ich brauche deine Hilfe.
// ************************************************************
instance DIA_DiegoNW_NeedHelp(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 1;
	condition		= DIA_DiegoNW_NeedHelp_Condition;
	information		= DIA_DiegoNW_NeedHelp_Info;
	important		= TRUE;
};

func int DIA_DiegoNW_NeedHelp_Condition()
{
	if (Diego_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_NeedHelp_Info()
{
	if (Diego_IsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_DiegoNW_NeedHelp_11_01"); //嘿 ， 你 看 起 来 目 瞪 口 呆 ！
		AI_Output(self, other, "DIA_Addon_DiegoNW_NeedHelp_11_02"); //（ 大 笑 ） 你 以 为 我 死 了 ， 是 吗 ？
		AI_Output(self, other, "DIA_Addon_DiegoNW_NeedHelp_11_03"); //我 有 一 阵 晕 了 过 去 。 但 是 ， 如 你 所 见 ， 我 还 活 着 。
		AI_Output(self, other, "DIA_Addon_DiegoNW_NeedHelp_11_04"); //最 重 要 的 是 ， 我 们 两 个 现 在 都 在 这 里 。
		AI_Output(self, other, "DIA_Addon_DiegoNW_NeedHelp_11_05"); //请 你 一 定 要 帮 助 我 。
	}
	else
	{
		AI_Output(self, other, "DIA_DiegoNW_NeedHelp_11_00"); //你 在 这 里 真 好 。 你 必 须 帮 助 我 。
	};

	Info_ClearChoices(DIA_DiegoNW_NeedHelp);

	if (DiegoOW.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		//	Info_AddChoice(DIA_DiegoNW_NeedHelp,"Wer bist du?",DIA_DiegoNW_NeedHelp_WhoAreYou);// Joly:macht keinen Sinn. Ohne mit Diego gesprochen zu haben -> Kein DiegoNW !! Hauptstory Kapitel 2 OW!!!!
	};

	Info_AddChoice(DIA_DiegoNW_NeedHelp, "这 些 是 什 么 样 的 衣 服 ？", DIA_DiegoNW_NeedHelp_Clothes);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "你 在 这 里 做 什 么 ？", DIA_DiegoNW_NeedHelp_Plan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "这 是 关 于 什 么 的 ？", DIA_DiegoNW_NeedHelp_Problem);
};

func void DIA_DiegoNW_NeedHelp_Plan()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Plan_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Plan_11_01"); //我 一 直 在 观 察 那 些 守 卫 。 他 们 一 直 都 很 警 觉 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Plan_11_02"); //我 想 我 不 会 那 么 容 易 通 过 那 里 。
};

func void DIA_DiegoNW_NeedHelp_WhoAreYou()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_WhoAreYou_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_01"); //我 肯 定 那 是 因 为 我 的 服 装 。 那 些 守 卫 不 会 让 我 进 城 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_02"); //所 以 我 在 城 外 的 商 人 那 里 买 了 这 些 衣 服 。 现 在 ， 我 希 望 你 能 记 得 我 。 我 是 迪 雅 戈 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_03"); //在 监 狱 里 ， 我 告 诉 你 了 所 有 需 要 用 来 求 生 的 方 法 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_04"); //你 不 会 忘 了 所 有 的 事 情 吧 。
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_WhoAreYou_15_05"); //嗯 … … 那 时 确 实 发 生 了 一 些 什 么 事 情 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_06"); //啊 ， 天 哪 ， 你 真 的 一 件 事 都 不 记 得 了 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_07"); //听 着 ， 我 真 的 没 有 时 间 跟 你 解 释 一 切 。 最 后 就 是 这 样 ： 我 们 曾 经 是 铁 哥 们 ， 我 不 止 一 次 地 救 过 你 的 命 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_WhoAreYou_11_08"); //现 在 ， 我 需 要 你 的 帮 助 。
};

func void DIA_DiegoNW_NeedHelp_Clothes()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Clothes_15_00"); //这 些 是 什 么 样 的 衣 服 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Clothes_11_01"); //我 从 城 外 的 商 人 那 里 买 了 这 些 东 西 。 起 初 守 卫 不 会 让 我 进 去 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Clothes_11_02"); //而 且 ， 没 必 要 让 整 个 世 界 都 知 道 我 是 从 哪 里 来 的 。
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Clothes_15_03"); //你 说 到 点 子 上 了 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Clothes_11_04"); //这 就 是 我 的 看 法 。 但 是 尽 管 我 脱 去 了 我 的 影 子 装 束 ， 我 还 是 原 来 的 我 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Clothes_11_05"); //为 了 这 座 城 市 ， 我 有 一 个 重 大 的 计 划。
};

func void DIA_DiegoNW_NeedHelp_Problem()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_15_00"); //是 关 于 什 么 的 事 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_11_01"); //自 从 我 离 开 这 里 后 ， 许 多 事 情 都 变 了 。 我 需 要 设 法 让 自 己 恢 复 一 下 。
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_15_02"); //什 么 难 题 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_11_03"); //我 必 须 想 法 子 进 入 富 人 区 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_11_04"); //但 我 不 是 这 个 城 的 市 民 ， 而 且 我 没 有 足 够 的 钱 来 贿 赂 那 些 守 卫 。 那 就 是 你 进 来 的 地 方 ！
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_15_05"); //那 么 你 是 想 要 我 借 点 金 子 给 你 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_11_06"); //胡 说 。 我 已 经 有 一 些 金 子 了 - 而 且 是 一 大 堆 的 金 子 ！ 不 幸 的 是 ， 我 没 带 着 它 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_11_07"); //你 得 去 帮 我 把 它 拿 来 。

	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "我 没 时 间 做 那 些 。", DIA_DiegoNW_NeedHelp_Problem_NoTime);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "我 有 什 么 好 处 ？", DIA_DiegoNW_NeedHelp_Problem_Reward);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "好 吧 ， 我 会 帮 助 你 。", DIA_DiegoNW_NeedHelp_Problem_WillHelpYou);
};

func void DIA_DiegoNW_NeedHelp_Problem_NoTime()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00"); //我 没 时 间 做 那 些 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01"); //嘿 ， 我 想 我 们 是 兄 弟 ！ 总 之 ， 那 时 他 们 把 你 扔 进 流 放 地 ， 是 我 救 了 你 。
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02"); //你 说 得 真 夸 张 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03"); //是 吗 ， 真 的 ？ 那 就 快 想 想 ， 如 果 那 时 我 没 有 向 你 说 明 要 怎 么 做 的 话 ， 会 发 生 些 什 么 呢 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04"); //矿 石 大 亨 会 把 你 当 成 早 饭 吃 掉 ， 你 会 在 矿 坑 里 痛 苦 地 死 去 。

	MIS_HelpDiegoNW = LOG_FAILED;

	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

func void DIA_DiegoNW_NeedHelp_Problem_Reward()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_Reward_15_00"); //我 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_Reward_11_01"); //我 曾 问 你 要 过 什 么 东 西 作 为 回 报 吗 ？ 我 们 是 朋 友 ， 难 道 这 还 不 够 ？
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00"); //好 吧 ， 我 会 帮 助 你 。
	AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_11_01"); //好 吧 。 听 着 。 那 时 ， 屏 障 还 在 的 时 候 ， 我 藏 了 一 小 笔 财 产 。
	AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_11_02"); //那 已 经 很 久 了 。 所 以 我 忘 了 去 拿 回 它 。
	AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_11_03"); //现 在 ， 我 根 本 没 法 子 离 开 这 里 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03"); //长 话 短 说 ， 你 必 须 去 矿 藏 山 谷 帮 我 拿 回 我 的 金 子 。

	MIS_HelpDiegoNW = LOG_RUNNING;

	Log_CreateTopic(TOPIC_HelpDiegoNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW, LOG_RUNNING);
	B_LogEntry(TOPIC_HelpDiegoNW, TOPIC_HelpDiegoNW_1);

	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "你 打 算 用 金 币 做 什 么 ？", DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "你从哪儿弄来这么多金子?", DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold);
	Info_AddChoice(DIA_DiegoNW_NeedHelp, "那 些 金 币 藏 在 哪 里 ？", DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00"); //你 打 算 用 金 币 做 什 么 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01"); //我 跟 富 人 区 的 一 个 商 人 还 有 一 笔 账 要 算 。 我 得 去 解 决 这 件 事 情 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02"); //到 那 时 我 就 准 备 迎 接 新 生 活 了 ！
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00"); //你从哪儿弄来这么多金子?
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01"); //那 么 ， 我 是 不 是 唯 一 在 矿 藏 山 谷 中 为 自 己 在 某 处 藏 了 一 些 金 子 的 人 呢 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02"); //偷 几 个 金 块 是 小 事 一 桩 ， 就 是 为 了 万 一 我 们 能 有 离 开 那 里 的 一 天 。
	AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03"); //那 个 时 候 ， 每 个 人 都 急 切 地 想 着 那 种 矿 石 ， 甚 至 没 有 人 关 心 过 金 子 … …
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00"); //那 些 金 币 藏 在 哪 里 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01"); //就 在 贸 易 区 。 废 弃 的 矿 区 上 面 。 它 在 一 个 皮 背 包 里 。
	if (Diego_angekommen == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01"); //别 啰 嗦 了 。 我 知 道 我 们 必 须 这 样 做 。
		AI_Output(self, other, "DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02"); //把 那 个 包 给 我 拿 来 。
	};

	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02"); //但 别 忘 了 检 查 一 下 是 不 是 那 个 包 ， 省 得 白 跑 一 趟 。
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03"); //我 怎 么 辨 认 呢 ？
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04"); //它 装 满 了 金 子 。 一 大 堆 金 子 ！

	Info_AddChoice(DIA_DiegoNW_NeedHelp, "我 会 试 着 去 找 你 的 金 子 。", DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt);

	B_LogEntry(TOPIC_HelpDiegoNW, TOPIC_HelpDiegoNW_2);
};

func void DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt()
{
	AI_Output(other, self, "DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00"); //我 会 试 着 去 找 你 的 金 子 。
	AI_Output(self, other, "DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01"); //（ 咧 着 嘴 笑 ） 就 这 么 做 吧 。 那 对 我 已 经 足 够 了 。

	Info_ClearChoices(DIA_DiegoNW_NeedHelp);
};

//***********************************************
//	Ok, ich werde dir doch helfen.
//***********************************************
instance DIA_DiegoNW_HelpYou(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 30;
	condition		= DIA_DiegoNW_HelpYou_Condition;
	information		= DIA_DiegoNW_HelpYou_Info;
	description		= "好 吧 ， 我 无 论 如 何 也 会 帮 助 你 。";
};

func int DIA_DiegoNW_HelpYou_Condition()
{
	if ((Diego_IsOnBoard == FALSE)
	&& (MIS_HElpDiegoNW == LOG_FAILED)
	&& (Diego_IsOnBOard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_HelpYou_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_HelpYou_15_00"); //好 吧 ， 我 无 论 如 何 也 会 帮 助 你 。
	AI_Output(self, other, "DIA_DiegoNW_HelpYou_11_01"); //我 知 道 是 这 样 。
	AI_Output(other, self, "DIA_DiegoNW_HelpYou_15_02"); //好 了 ， 我 们 去 把 生 意 的 事 情 办 好 吧 。
	AI_Output(self, other, "DIA_DiegoNW_HelpYou_11_03"); //好 的 。 我 在 矿 藏 山 谷 藏 了 一 笔 财 宝 ， 你 必 须 去 那 里 帮 我 把 它 拿 回 来 。
	AI_Output(self, other, "DIA_DiegoNW_HelpYou_11_06"); //在 这 期 间 ， 我 会 呆 在 这 里 准 备 好 所 有 的 事 情 。
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold();
	DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_End_TryIt();

	MIS_HelpDiegoNW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HelpDiegoNW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HelpDiegoNW, LOG_RUNNING);
	B_LogEntry(TOPIC_HelpDiegoNW, TOPIC_HelpDiegoNW_1);
};

//***********************************************
//	Ich habe dein Gold gefunden!
//***********************************************
instance DIA_DiegoNW_HaveYourGold(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 31;
	condition		= DIA_DiegoNW_HaveYourGold_Condition;
	information		= DIA_DiegoNW_HaveYourGold_Info;
	permanent		= TRUE;
	description		= "我 找 到 了 你 的 金 子 ！";
};

func int DIA_DiegoNW_HaveYourGold_Condition()
{
	if (((OpenedDiegosBag == TRUE)
	|| (Npc_HasItems(other, ItSe_DiegosTreasure_Mis) >= 1))
	&& (MIS_HelpDiegoNW == LOG_RUNNING)
	&& (Diego_IsOnBOard != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void B_DIEGONW_DIEGOSREVENGE()
{
	AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_05"); //很 好 。 现 在 ， 哲 勃 兰 特 最 好 小 心 点 。
};

var int DiegosRevenge;

func void DIA_DiegoNW_HaveYourGold_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_HaveYourGold_15_00"); //我 找 到 了 你 的 金 子 ！
	AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_01"); //太 棒 了 。 给 我 看 看 。

	if (Npc_HasItems(other, ItSe_DiegosTreasure_Mis) >= 1)
	{
		B_GiveInvItems(other, self, ItSe_DiegosTreasure_Mis, 1);
		B_DIEGONW_DIEGOSREVENGE();
		DiegosRevenge = TRUE;
	}
	else if (Npc_HasItems(other, ItMi_Gold < DiegosTreasure))
	{
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_02"); //但 这 不 是 全 部 的 ！ 你 不 信 任 我 吗 ？ 我 需 要 完 整 的 数 目 。
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_03"); //等 我 的 计 划 完 成 了 ， 会 给 你 留 下 足 够 的 钱 。
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_04"); //所 以 ， 一 定 要 保 证 全 部 给 我 。 这 很 重 要 ！
	}
	else
	{
		B_GiveInvItems(other, self, ItMi_Gold, DiegosTreasure);
		B_DIEGONW_DIEGOSREVENGE();
		DiegosRevenge = TRUE;
	};

	if ((Npc_IsDead(Gerbrandt) == FALSE)
	&& (DiegosRevenge == TRUE))
	{
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_06"); //听 着 ， 我 还 要 应 付 那 些 守 卫 。
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_07"); //我 希 望 你 把 这 封 信 交 给 哲 勃 兰 特 。 他 是 富 人 区 一 个 肥 胖 的 商 人 。
		AI_Output(self, other, "DIA_DiegoNW_HaveYourGold_11_08"); //帮 我 问 候 他 。 然 后 ， 我 会 在 哲 勃 兰 特 的 屋 子 前 面 等 你 。

		CreateInvItems(self, ItWr_DiegosLetter_MIS, 1);
		B_GiveInvItems(self, other, ItWr_DiegosLetter_MIS, 1);

		B_StartOtherRoutine(Gerbrandt, "WaitForDiego");

		MIS_HelpDiegoNW = LOG_SUCCESS;
		MIS_DiegosResidence = LOG_RUNNING;
		B_GivePlayerXP(XP_HelpDiegoNW);

		Log_CreateTopic(TOPIC_DiegosResidence, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DiegosResidence, LOG_RUNNING);
		B_LogEntry(TOPIC_DiegosResidence, TOPIC_DiegosResidence_1);

		AI_StopProcessInfos(self);
	};
};

//***********************************************
//	Ich habe den Brief abgeliefert.
//***********************************************
instance DIA_DiegoNW_DeliveredLetter(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 30;
	condition		= DIA_DiegoNW_DeliveredLetter_Condition;
	information		= DIA_DiegoNW_DeliveredLetter_Info;
	description		= "我 已 经 把 那 封 信 送 到 了 。";
};

func int DIA_DiegoNW_DeliveredLetter_Condition()
{
	if ((Diego_IsOnBoard == FALSE)
	&& (MIS_DiegosResidence == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_DeliveredLetter_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_DeliveredLetter_15_00"); //我 已 经 把 那 封 信 送 到 了 。
	AI_Output(self, other, "DIA_DiegoNW_DeliveredLetter_11_01"); //很 好 。 哲 勃 兰 特 有 什 么 反 应 ？
	AI_Output(other, self, "DIA_DiegoNW_DeliveredLetter_15_02"); //他 非 常 震 惊 ， 然 后 立 刻 逃 走 了 。
	AI_Output(self, other, "DIA_DiegoNW_DeliveredLetter_11_03"); //（ 满 意 的 ） 我 应 该 想 到 。
	AI_Output(self, other, "DIA_DiegoNW_DeliveredLetter_11_04"); //首 先 ， 我 必 须 布 置 一 下 我 的 房 子 。 如 果 我 记 得 不 错 的 话 ， 哲 勃 兰 特 味 道 很 难 闻 。

	B_GivePlayerXP(XP_DiegoHasANewHome);

	Wld_AssignRoomToGuild("reich01", GIL_PUBLIC);

	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, "那 么 你 打 算 怎 么 实 现 ？", DIA_DiegoNW_DeliveredLetter_YourTrick);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, "那 么 说 房 子 是 你 的 ？", DIA_DiegoNW_DeliveredLetter_YourHouse);
};

func void DIA_DiegoNW_DeliveredLetter_Gerbrandt()
{
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00"); //那 么 哲 勃 兰 特 呢 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01"); //他 的 好 日 子 享 受 得 太 久 了 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02"); //他 以 前 住 在 这 里 ， 极 尽 奢 华 ， 那 时 我 却 被 迫 咽 下 炖 肉 虫 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03"); //我 不 知 道 他 从 这 里 跑 到 哪 里 去 了 ， 但 他 永 远 也 不 会 再 在 克 霍 里 尼 斯 里 找 到 立 足 的 地 方 - 我 敢 保 证 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04"); //如 果 你 正 在 找 他 ， 你 应 该 去 港 口 区 看 看 。
};

func void DIA_DiegoNW_DeliveredLetter_YourHouse()
{
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_YourHouse_15_00"); //那 么 说 房 子 是 你 的 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourHouse_11_01"); //是 的 ， 从 地 下 室 到 阁 楼 ， 包 括 所 有 的 摆 设 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourHouse_11_02"); //在 简 陋 的 环 境 中 度 过 几 年 后 ， 我 期 待 着 躺 在 一 张 豪 华 的 床 上 睡 觉 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourHouse_11_03"); //然 后 还 有 ， 早 餐 ， 我 会 喝 一 些 美 酒 ， 吃 一 些 上 等 火 腿 。
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_YourHouse_15_04"); //你 绝 不 会 错 过 任 何 机 会 ， 是 吗 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourHouse_11_05"); //当 然 。
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick()
{
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_YourTrick_15_00"); //那 么 你 打 算 怎 么 实 现 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_11_01"); //你 认 为 哲 勃 兰 特 的 财 富 是 靠 正 当 生 意 来 的 吗 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_11_02"); //当 然 ， 当 真 正 有 一 些 见 不 得 人 的 交 易 的 时 候 ， 他 从 来 不 会 弄 脏 自 己 的 手 。 他 有 个 帮 手 专 门 干 这 个 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_11_03"); //当 然 ， 那 时 我 就 察 觉 了 很 多 事 情 。 哲 勃 兰 特 最 后 要 除 掉 我 ， 他 可 能 害 怕 我 知 道 得 太 多 。
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_YourTrick_15_04"); //你 从 没 告 诉 过 我 这 些 事 情 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_11_05"); //你 从 没 问 过 我 。

	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, DIALOG_BACK, DIA_DiegoNW_DeliveredLetter_YourTrick_BACK);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, "我 的 那 一 份 呢 ？", DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD);
	Info_AddChoice(DIA_DiegoNW_DeliveredLetter, "那 么 哲 勃 兰 特 呢 ？", DIA_DiegoNW_DeliveredLetter_Gerbrandt);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_REWARD()
{
	AI_Output(other, self, "DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00"); //我 的 那 一 份 呢 ？
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01"); //看 起 来 ， 好 象 你 没 有 把 我 教 你 的 所 有 东 西 全 忘 掉 。
	AI_Output(self, other, "DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02"); //不 过 你 是 对 的 ， 没 有 你 ， 我 不 可 能 做 成 这 件 事 。 这 是 你 的 那 一 份 。

	CreateInvItems(self, ItMi_Gold, 500);
	B_GiveInvItems(self, other, ItMi_Gold, 500);
};

func void DIA_DiegoNW_DeliveredLetter_YourTrick_BACK()
{
	Info_ClearChoices(DIA_DiegoNW_DeliveredLetter);
};

// ************************************************************
// 	  	  Kannst du mir was beibringen?
// ************************************************************

// ---------------------------
var int Diego_Teach;
// ---------------------------
instance DIA_DiegoNW_CanYouTeach(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 995;
	condition		= DIA_DiegoNW_CanYouTeach_Condition;
	information		= DIA_DiegoNW_CanYouTeach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_DiegoNW_CanYouTeach_Condition()
{
	if ((Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_CanYouTeach_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_CanYouTeach_15_00"); //你 能 教 我 什 么 吗 ？
	if (Npc_KnowsInfo(other, DIA_DiegoNW_DeliveredLetter))
	{
		AI_Output(self, other, "DIA_DiegoNW_CanYouTeach_11_01"); //是 的 ， 当 然 。 你 准 备 好 了 就 告 诉 我 。

		Diego_Teach = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_DiegoNW_CanYouTeach_11_02"); //我 得 先 处 理 自 己 的 事 情 。
	};
};

// ************************************************************
// 	  	  Bring mir was bei.
// ************************************************************

// -----------------------
var int DiegoNW_Merke_DEX;
// -------------------------
instance DIA_DiegoNW_Teach(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 995;
	condition		= DIA_DiegoNW_Teach_Condition;
	information		= DIA_DiegoNW_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 一 些 技 能 。";
};

func int DIA_DiegoNW_Teach_Condition()
{
	if ((Diego_IsOnBoard == FALSE)
	&& (Diego_Teach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_Teach_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_Teach_15_00"); //教 我 。
	AI_Output(self, other, "DIA_DiegoNW_Teach_11_01"); //我 可 以 教 你 变 得 更 敏 捷 。

	DiegoNW_Merke_Dex = other.attribute[ATR_DEXTERITY];

	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoNW_TeachDEX_5);
};

func void DIA_DiegoNW_Teach_BACK()
{
	if (DiegoNW_Merke_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self, other, "DIA_DiegoNW_Teach_BACK_11_00"); //你 已 经 变 得 更 敏 捷 了 。 别 松 劲 ！
	};

	Info_ClearChoices(DIA_DiegoNW_Teach);
};

// ------ 1 Geschick -----
func void DIA_DiegoNW_TeachDEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoNW_TeachDEX_5);
};

// ------ 5 Geschick ------
func void DIA_DiegoNW_TeachDEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MAX);

	Info_ClearChoices(DIA_DiegoNW_Teach);
	Info_AddChoice(DIA_DiegoNW_Teach, DIALOG_BACK, DIA_DiegoNW_Teach_BACK);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_DiegoNW_TeachDEX_1);
	Info_AddChoice(DIA_DiegoNW_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_DiegoNW_TeachDEX_5);
};

// ######################################
// ##
// ## Kapitel 5
// ##
// ######################################

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_KnowWhereEnemy(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 55;
	condition		= DIA_DiegoNW_KnowWhereEnemy_Condition;
	information		= DIA_DiegoNW_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 正 准 备 离 开 克 霍 里 尼 斯 。";
};

func int DIA_DiegoNW_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Diego_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_00"); //我 正 准 备 离 开 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_01"); //明 智 的 决 定 。 我 希 望 能 跟 随 你 。 这 座 城 市 变 得 太 快 了 - 能 迅 速 致 富 的 时 代 已 经 过 去 了 。
	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_02"); //我 可 以 帮 你 训 练 箭 术 、 开 锁 、 以 及 敏 捷 。
	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_03"); //还 有 ， 我 敢 肯 定 你 需 要 一 个 相 当 好 的 小 盗 贼 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_3);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_DiegoNW_KnowWhereEnemy_15_04"); //我 会 考 虑 考 虑 的 。 现 在 ， 我 的 船 员 队 伍 已 经 满 了 。
		AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_11_05"); //慢 慢 来 。 我 不 会 去 别 的 地 方 。
	}
	else
	{
		Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy, "当 时 机 恰 当 的 时 候 ， 我 会 让 你 知 道 的 。", DIA_DiegoNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_DiegoNW_KnowWhereEnemy, "你 要 跟 我 来 吗 ？", DIA_DiegoNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_DiegoNW_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_DiegoNW_KnowWhereEnemy_Yes_15_00"); //为 什 么 你 不 跟 我 一 起 走 ？ 我 们 在 港 口 碰 面 。
	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_Yes_11_01"); //嗯 。 你 是 对 的 ， 克 霍 里 尼 斯 是 个 垃 圾 场 。 我 跟 你 走 。

	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	B_GivePlayerXP(XP_Crewmember_Success);

	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_Yes_11_02"); //等 一 下 ， 我 马 上 就 准 备 好 了 。
		AI_SetWalkMode(self, NPC_WALK);
		AI_GotoWP(self, "NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self, ItAR_Diego, 1);
		AI_EquipArmor(self, ItAr_Diego);
		AI_Wait(self, 1);
		AI_GotoWP(self, self.wp);
	};

	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_Yes_11_03"); //嗯 ， 我 准 备 好 了 。 我 们 在 船 上 见 。

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

func void DIA_DiegoNW_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_DiegoNW_KnowWhereEnemy_No_15_00"); //也 许 等 时 机 成 熟 了 ， 我 会 让 你 知 道 。
	AI_Output(self, other, "DIA_DiegoNW_KnowWhereEnemy_No_11_01"); //你 就 那 么 办 吧 。 也 许 我 会 跟 你 走 。 谁 知 道 呢 ？

	Diego_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_DiegoNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_LeaveMyShip(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 55;
	condition		= DIA_DiegoNW_LeaveMyShip_Condition;
	information		= DIA_DiegoNW_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "你 要 留 神 这 座 城 市 。";
};

func int DIA_DiegoNW_LeaveMyShip_Condition()
{
	if ((Diego_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_LeaveMyShip_15_00"); //你 要 留 神 这 座 城 市 。
	AI_Output(self, other, "DIA_DiegoNW_LeaveMyShip_11_01"); //真 的 吗 ？ 你 再 也 不 需 要 我 了 ？ 哦 ， 好 吧 。 等 你 回 到 城 里 时 ， 别 忘 了 来 转 转 。
	AI_Output(other, self, "DIA_DiegoNW_LeaveMyShip_15_02"); //你 觉 得 我 们 还 会 再 见 ？
	AI_Output(self, other, "DIA_DiegoNW_LeaveMyShip_11_03"); //我 永 远 不 会 忘 记 我 们 初 次 见 面 时 你 被 布 里 特 打 倒 后 躺 在 地 上 的 样 子 。
	AI_Output(self, other, "DIA_DiegoNW_LeaveMyShip_11_04"); //他 们 不 会 再 碰 到 比 你 更 好 的 了 。 我 们 一 定 会 再 见 面 的 。 保 重 。

	Diego_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_DiegoNW_StillNeedYou(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 55;
	condition		= DIA_DiegoNW_StillNeedYou_Condition;
	information		= DIA_DiegoNW_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "回 来 。 我 想 要 你 陪 伴 我 。";
};

func int DIA_DiegoNW_StillNeedYou_Condition()
{
	if (((Diego_IsOnBOard == LOG_OBSOLETE)
	|| (Diego_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_DiegoNW_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_DiegoNW_StillNeedYou_15_00"); //回 来 。 我 想 要 你 陪 伴 我 。
	AI_Output(self, other, "DIA_DiegoNW_StillNeedYou_11_01"); //你 决 定 要 怎 么 做 ， 我 的 朋 友 ？ 我 肯 定 会 跟 你 走 - 只 要 你 作 出 决 定 。

	self.flags = NPC_FLAG_IMMORTAL;
	Diego_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (Hlp_StrCmp(Npc_GetNearestWP(self), "NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self, other, "DIA_DiegoNW_StillNeedYou_11_02"); //等 一 下 ， 我 马 上 就 准 备 好 了 。
		AI_GotoWP(self, "NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self, ItAR_Diego, 1);
		AI_EquipArmor(self, ItAr_Diego);
		AI_GotoWP(self, self.wp);
	};

	AI_Output(self, other, "DIA_DiegoNW_StillNeedYou_11_03"); //好 的 ， 我 们 可 以 走 了 。

	AI_StopProcessInfos(self);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Thief_NW_PICKPOCKET(C_INFO)
{
	npc				= PC_Thief_NW;
	nr				= 900;
	condition		= DIA_Thief_NW_PICKPOCKET_Condition;
	information		= DIA_Thief_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Thief_NW_PICKPOCKET_Condition()
{
	C_Beklauen(120, 600);
};

func void DIA_Thief_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET, DIALOG_BACK, DIA_Thief_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Thief_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Thief_NW_PICKPOCKET_DoIt);
};

func void DIA_Thief_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};

func void DIA_Thief_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Thief_NW_PICKPOCKET);
};
