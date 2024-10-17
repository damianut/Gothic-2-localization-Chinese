// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_EXIT(C_INFO)
{
	npc				= STRF_1118_Addon_Patrick;
	nr				= 999;
	condition		= DIA_Addon_Patrick_EXIT_Condition;
	information		= DIA_Addon_Patrick_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Patrick_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_Hi(C_INFO)
{
	npc				= STRF_1118_Addon_Patrick;
	nr				= 2;
	condition		= DIA_Addon_Patrick_Hi_Condition;
	information		= DIA_Addon_Patrick_Hi_Info;
	description		= "是 水 法 师 派 我 来 的 。 我 来 释 放 你 。";
};

func int DIA_Addon_Patrick_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Patrick_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_15_00"); //是 水 法 师 派 我 来 的 。 我 来 释 放 你 。
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_07_01"); //（ 谨 慎 的 ） 真 的 ？ 我 为 什 么 要 相 信 你 ？
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_15_02"); //你 想 离 开 这 里 ， 还 是 不 想 ？
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_07_03"); //我 当 然 想 离 开 - 但 是 … …
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_15_04"); //瓦 卓 斯 派 我 来 的 。 如 果 你 觉 得 那 么 说 还 不 够 的 话 ， 你 可 以 选 择 烂 在 这 个 洞 里 ， 那 也 不 关 我 的 事 。
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_07_05"); //（ 匆 忙 的 ） 好 吧 ， 我 相 信 你 。
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_15_06"); //（ 徒 劳 的 挣 扎 ） 真 的 ？ 哇 ， 比 我 想 的 要 快 。 好 吧 ， 我 们 现 在 就 差 一 个 计 划 了 。
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_07_07"); //要 想 逃 走 需 要 冒 很 大 的 风 险 。 威 廉 试 过 了 ， 然 后 他 被 杀 了 。
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_07_08"); //囚 犯 们 都 是 农 民 和 工 人 - 他 们 信 任 我 ， 但 是 他 们 不 敢 尝 试 逃 跑。

	Info_ClearChoices(DIA_Addon_Patrick_Hi);
	Info_AddChoice(DIA_Addon_Patrick_Hi, "你 想 要 让 我 做 什 么 - 让 瑞 雯 宽 恕 你 ？", DIA_Addon_Patrick_Hi_Raven);
	Info_AddChoice(DIA_Addon_Patrick_Hi, "我 必 须 要 杀 掉 所 有 的 强 盗 才 能 改 变 你 的 态 度 吗 ？", DIA_Addon_Patrick_Hi_Kill);
};

func void B_Say_Patrick_Plan()
{
	AI_Output(self, other, "DIA_Addon_Patrick_Plan_07_00"); //但 是 那 不 可 能 是 计 划 。
	AI_Output(self, other, "DIA_Addon_Patrick_Plan_07_01"); //只 要 注 意 不 让 那 些 卫 兵 攻 击 我 们 ， 那 样 我 们 就 能 离 开 这 里 。
	AI_Output(other, self, "DIA_Addon_Patrick_Plan_15_02"); //好 吧 ， 那 些 我 来 解 决 。 告 诉 其 它 人 做 好 准 备 。

	B_LogEntry(Topic_Addon_Sklaven, Topic_Addon_Sklaven_1);
};

func void DIA_Addon_Patrick_Hi_Raven()
{
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_Raven_15_00"); //你 想 要 让 我 做 什 么 - 让 瑞 雯 宽 恕 你 ？
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_Raven_07_01"); //（ 露 齿 而 笑 ） 主 意 不 错 。
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

func void DIA_Addon_Patrick_Hi_Kill()
{
	AI_Output(other, self, "DIA_Addon_Patrick_Hi_Kill_15_00"); //我 必 须 要 杀 掉 所 有 的 强 盗 才 能 改 变 你 的 态 度 吗 ？
	AI_Output(self, other, "DIA_Addon_Patrick_Hi_Kill_07_01"); //（ 害 怕 ） 但 那 样 太 疯 狂 了 ！
	B_Say_Patrick_Plan();
	Info_ClearChoices(DIA_Addon_Patrick_Hi);
};

// ---------------------------------------------------------------------
//	ready
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_ready(C_INFO)
{
	npc				= STRF_1118_Addon_Patrick;
	nr				= 2;
	condition		= DIA_Addon_Patrick_ready_Condition;
	information		= DIA_Addon_Patrick_ready_Info;
	description		= "一 切 都 安 排 好 了 ， 你 们 可 以 悄 悄 地 离 开 。";
};

func int DIA_Addon_Patrick_ready_Condition()
{
	if ((Ready_Togo == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Patrick_Hi))
	|| (Npc_IsDead(PrisonGuard)
	&& Npc_IsDead(Bloodwyn)
	&& Npc_KnowsInfo(other, DIA_Addon_Thorus_Answer))
	|| (Npc_IsDead(Thorus)
	&& Npc_IsDead(Bloodwyn)
	&& Npc_IsDead(PrisonGuard)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_ready_Info()
{
	AI_Output(other, self, "DIA_Addon_Patrick_ready_15_00"); //一 切 都 安 排 好 了 ， 你 们 可 以 悄 悄 地 离 开 。
	AI_Output(self, other, "DIA_Addon_Patrick_ready_07_01"); //好 极 了 。 我 知 道 沼 泽 里 的 一 个 山 洞 ， 我 们 暂 时 可 以 在 那 里 汇 合 。 但 是 然 后 呢 ？
	AI_Output(other, self, "DIA_Addon_Patrick_ready_15_02"); //离 开 沼 泽 后 朝 着 西 南 方 走 。 水 法 师 已 经 在 旧 神 殿 废 墟 附 近 设 立 了 一 个 营 地 。
	AI_Output(other, self, "DIA_Addon_Patrick_ready_15_03"); //他 们 会 告 诉 你 们 离 开 这 个 山 谷 的 路 。
	AI_Output(self, other, "DIA_Addon_Patrick_ready_07_04"); //谢 谢 ， 太 谢 谢 你 了 。 （ 开 始 行 动 ） 我 们 都 深 深 地 … …
	AI_Output(other, self, "DIA_Addon_Patrick_ready_15_05"); //没 关 系 。

	Sklaven_Flucht = TRUE;
	B_GivePlayerXP(XP_Addon_Flucht);

	AI_StopProcessInfos(self);

	// AI_UseMob(self,"ORE",-1);

	Npc_ExchangeRoutine(self, "FLUCHT");

	B_StartOtherRoutine(Telbor, "FLUCHT");
	B_StartOtherRoutine(Tonak, "FLUCHT");
	B_StartOtherRoutine(Pardos, "FLUCHT");
	B_StartOtherRoutine(Monty, "FLUCHT");

	B_StartOtherRoutine(Buddler_1, "WORK");
	B_StartOtherRoutine(Buddler_2, "WORK");
	B_StartOtherRoutine(Buddler_3, "WORK");

	B_RemoveNpc(STRF_1128_Addon_Sklave);
	B_RemoveNpc(STRF_1129_Addon_Sklave);
	B_RemoveNpc(STRF_1130_Addon_Sklave);

	B_RemoveNpc(STRF_1136_Addon_Sklave);
	B_RemoveNpc(STRF_1137_Addon_Sklave);
	B_RemoveNpc(STRF_1138_Addon_Sklave);
	B_RemoveNpc(STRF_1139_Addon_Sklave);
	B_RemoveNpc(STRF_1140_Addon_Sklave);
};

// ---------------------------------------------------------------------
//	Killer
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_Killer(C_INFO)
{
	npc				= STRF_1118_Addon_Patrick;
	nr				= 2;
	condition		= DIA_Addon_Patrick_Killer_Condition;
	information		= DIA_Addon_Patrick_Killer_Info;
	description		= "守 卫 已 经 没 用 了 ， 你 们 现 在 可 以 走 了 。";
};

func int DIA_Addon_Patrick_Killer_Condition()
{
	if (Npc_IsDead(PrisonGuard)
	&& (Ready_Togo == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Patrick_Hi)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Killer_Info()
{
	AI_Output(other, self, "DIA_Addon_Patrick_Killer_15_00"); //守 卫 已 经 没 用 了 ， 你 们 现 在 可 以 走 了 。
	AI_Output(self, other, "DIA_Addon_Patrick_Killer_07_01"); //但 是 我 们 离 开 矿 井 以 后 怎 么 办 ？ 其 它 的 卫 兵 会 杀 掉 我 们 。 不 ， 那 样 太 冒 险 了 。
};

// ---------------------------------------------------------------------
//	Hoehle
// ---------------------------------------------------------------------
instance DIA_Addon_Patrick_Hoehle(C_INFO)
{
	npc				= STRF_1118_Addon_Patrick;
	nr				= 2;
	condition		= DIA_Addon_Patrick_Hoehle_Condition;
	information		= DIA_Addon_Patrick_Hoehle_Info;
	permanent		= TRUE;
	description		= "你 们 不 想 离 开 ？";
};

func int DIA_Addon_Patrick_Hoehle_Condition()
{
	if (Npc_GetDistToWP(self, "ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Patrick_Hoehle_Info()
{
	AI_Output(other, self, "DIA_Addon_Patrick_Hoehle_15_00"); //你 们 不 想 离 开 ？
	AI_Output(self, other, "DIA_Addon_Patrick_Hoehle_07_01"); //我 们 当 然 愿 意 。 我 们 只 是 在 等 待 合 适 的 机 会。
};
