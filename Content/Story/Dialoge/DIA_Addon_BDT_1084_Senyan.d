// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Senyan_EXIT(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 999;
	condition		= DIA_Addon_Senyan_EXIT_Condition;
	information		= DIA_Addon_Senyan_EXIT_Info;
	permanent		= TRUE;
	description		= "再 见 … … ( 结 束 )";
};

func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Senyan_EXIT_12_00"); //你 知 道 你 必 须 要 做 什 么 … …
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Senyan_PICKPOCKET(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 900;
	condition		= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information		= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen(45, 88);
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK, DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

// ----------------------------------------------------------------------
func void B_Senyan_Attack()
{
	AI_Output(self, other, "DIA_Addon_Senyan_Attack_12_00"); //（ 轻 蔑 的 ） 那 我 还 需 要 你 做 什 么 ， 你 这 个 笨 蛋 ？
	AI_Output(self, other, "DIA_Addon_Senyan_Attack_12_01"); //（ 呼 喊 ） 嘿 ， 各 位 ， 看 看 是 谁 来 了 ！

	Senyan_Called = TRUE;
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ----------------------------------------------------------------------
func void B_Senyan_Erpressung()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Erpressung_15_00"); //你 想 要 多 少 ？
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_01"); //（ 假 装 受 伤 ） 哦 ， 请 不 要 。 我 不 想 向 你 勒 索 黄 金 。 我 不 会 那 样 去 想 。
	AI_Output(other, self, "DIA_Addon_Senyan_Erpressung_15_02"); //那 么 你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_03"); //最 近 有 人 想 要 解 决 掉 伊 斯 特 班 ， 但 是 他 撞 上 了 保 镖 。
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_04"); //去 伊 斯 特 班 那 和 他 谈 谈 。 然 后 我 们 再 谈 。

	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Senyan, Topic_Addon_Senyan_1);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_Hi(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 1;
	condition		= DIA_Addon_Senyan_Hi_Condition;
	information		= DIA_Addon_Senyan_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};

// --------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
// --------------------
func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00"); //啊 ！ 那 么 谁 把 我 们 弄 到 这 里 ？
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01"); //瞧 啊 ， 瞧 啊 。 你 在 这 里 。 我 有 好 消 息 和 坏 消 息 告 诉 你 。

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "我 想 先 听 好 消 息 。", DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "先 告 诉 我 坏 消 息 。", DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00"); //我 想 先 听 好 消 息 。
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01"); //好 消 息 是 什 么 ？
	};

	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02"); //嗯 ， 实 际 上 我 也 不 知 道 为 什 么 ， 不 过 你 已 经 给 自 己 惹 上 了 不 少 厉 害 的 敌 人 。
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03"); //你 应 该 感 到 幸 运 ， 是 我 认 出 了 你 ， 而 不 是 别 人 。
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04"); //因 为 我 富 有 同 情 心 ， 而 且 喜 欢 交 际 。

	Senyan_Good = TRUE;

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);

	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "先 告 诉 我 坏 消 息 。", DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00"); //先 告 诉 我 坏 消 息 。
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01"); //坏 消 息 是 什 么 ？
	};

	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02"); //瑞 雯 在 找 你 。 他 的 卫 兵 也 是 。 实 际 上 ， 所 有 的 强 盗 都 在 找 你 … …
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03"); //如 果 是 他 们 找 到 你 的 话 ， 就 会 杀 掉 你 。
	AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04"); //已 经 有 很 多 人 试 过 了 。
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05"); //那 么 你 的 战 斗 技 巧 和 你 的 手 艺 一 样 好 了 。 穿 上 象 我 们 一 样 的 盔 甲 进 入 营 地 … …
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06"); //… … 羊 入 虎 口 ， 你 是 命 悬 一 线 ， 危 险 的 朋 友 。

	Senyan_Bad = TRUE;

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);

	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "我 想 先 听 好 消 息 。", DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};

// ---------------------------------------------------------------------
//	Info unterwegs
// ---------------------------------------------------------------------
instance DIA_Addon_Senyan_unterwegs(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 99;
	condition		= DIA_Addon_Senyan_unterwegs_Condition;
	information		= DIA_Addon_Senyan_unterwegs_Info;
	permanent		= TRUE;
	description		= "关 于 伊 斯 特 班 … …";
};

func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if ((MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_unterwegs_15_00"); //关 于 伊 斯 特 班 … …
	AI_Output(self, other, "DIA_Addon_Senyan_unterwegs_12_01"); //你 已 经 同 他 谈 过 了 ？
	AI_Output(other, self, "DIA_Addon_Senyan_unterwegs_15_02"); //还 没 有 。
	AI_Output(self, other, "DIA_Addon_Senyan_unterwegs_12_03"); //嗯 ， 你 应 该 快 去 做 。
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Senyan_Attentat(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 2;
	condition		= DIA_Addon_Senyan_Attentat_Condition;
	information		= DIA_Addon_Senyan_Attentat_Info;
	description		= "我 已 经 同 伊 斯 特 班 谈 过 了 。";
};

func int DIA_Addon_Senyan_Attentat_Condition()
{
	if ((MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_00"); //我 已 经 同 伊 斯 特 班 谈 过 了 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_01"); //他 告 诉 你 关 于 那 次 袭 击 的 事 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_02"); //他 命 令 我 查 明 是 谁 派 的 刺 客 。 你 知 道 那 些 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_03"); //不 比 你 知 道 得 多 。 我 也 在 追 查 那 个 幕 后 指 使 。 现 在 我 们 进 入 有 趣 的 部 分 了 。
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_04"); //让 我 们 听 听 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_05"); //我 要 你 把 工 作 做 好 。 我 要 你 找 到 叛 徒 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_06"); //（ 冷 淡 的 ） 当 你 找 到 他 的 时 候 - 我 要 你 帮 我 杀 掉 他 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_07"); //然 后 我 就 会 得 到 报 酬 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_08"); //我 有 你 的 通 缉 海 报 - 不 要 忘 记 了 。 做 你 的 事 ， 并 把 它 做 好 。 否 则 你 知 道 将 会 发 生 什 么 事 。

	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, "我 想 我 别 无 选 择 … …", DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, "算 了 吧 ！", DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_NO_15_00"); //算 了 吧 ！

	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_JA_15_00"); //看 来 我 是 别 无 选 择 了 … …
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_JA_12_01"); //我 知 道 我 们 会 达 成 一 个 协 议 。
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_JA_12_02"); //（ 敷 衍 了 事 ） 当 你 查 明 这 个 家 伙 是 谁 的 时 候 - 我 们 就 一 起 杀 死 他 。 现 在 走 开 ！

	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);

	B_LogEntry(Topic_Addon_Senyan, Topic_Addon_Senyan_2);
};

// ----------------------------------------------------------------------
//	Anders Überlegt
// ----------------------------------------------------------------------
instance DIA_Addon_Senyan_ChangePlan(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 3;
	condition		= DIA_Addon_Senyan_ChangePlan_Condition;
	information		= DIA_Addon_Senyan_ChangePlan_Info;
	description		= "我 已 经 改 变 主 意 了 。 我 们 不 再 一 起 行 动 了 ！";
};

func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //我 已 经 改 变 主 意 了 。 我 们 不 再 一 起 行 动 了 ！
	B_Senyan_Attack();

	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Erpressung Found Fisk
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_Found(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 3;
	condition		= DIA_Addon_Senyan_Found_Condition;
	information		= DIA_Addon_Senyan_Found_Info;
	description		= "我 找 到 背 叛 者 了 ， 是 费 斯 克 。";
};

func int DIA_Addon_Senyan_Found_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00"); //我 找 到 背 叛 者 了 ， 是 费 斯 克 。
	B_Senyan_Attack();
};

// ----------------------------------------------------------------------
//	Erpressung derbe
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_derbe(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 1;
	condition		= DIA_Addon_Senyan_derbe_Condition;
	information		= DIA_Addon_Senyan_derbe_Info;
	important		= TRUE;
};

func int DIA_Addon_Senyan_derbe_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead(Fisk)
	|| Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00"); //（ 狂 怒 ） 你 没 有 遵 守 我 们 的 协 议 。

	B_Senyan_Attack();
};
