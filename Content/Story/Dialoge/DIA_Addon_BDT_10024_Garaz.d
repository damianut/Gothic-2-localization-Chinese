// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_EXIT(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 999;
	condition		= DIA_Addon_Garaz_EXIT_Condition;
	information		= DIA_Addon_Garaz_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Garaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Garaz_PICKPOCKET(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 900;
	condition		= DIA_Addon_Garaz_PICKPOCKET_Condition;
	information		= DIA_Addon_Garaz_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Garaz_PICKPOCKET_Condition()
{
	C_Beklauen(66, 80);
};

func void DIA_Addon_Garaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET, DIALOG_BACK, DIA_Addon_Garaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garaz_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Garaz_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

func void DIA_Addon_Garaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garaz_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Probleme
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Probleme(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 2;
	condition		= DIA_Addon_Garaz_Probleme_Condition;
	information		= DIA_Addon_Garaz_Probleme_Info;
	important		= TRUE;
};

func int DIA_Addon_Garaz_Probleme_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garaz_Probleme_Info()
{
	AI_Output(self, other, "DIA_Addon_Garaz_Probleme_08_00"); //等 一 下 。
	AI_Output(other, self, "DIA_Addon_Garaz_Probleme_15_01"); //有 问 题 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Probleme_08_02"); //矿 井 爬 行 者 。 越 来 越 多 的 矿 井 爬 行 者 。 我 们 冲 进 了 一 个 巢 穴 。
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Hi(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 3;
	condition		= DIA_Addon_Garaz_Hi_Condition;
	information		= DIA_Addon_Garaz_Hi_Info;
	description		= "我 们 为 什 么 不 攻 击 爬 行 者 ？ ";
};

func int DIA_Addon_Garaz_Hi_Condition()
{
	if (!Npc_IsDead(Bloodwyn)
	&& (Minecrawler_Killed < 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Garaz_Hi_15_00"); //我 们 为 什 么 不 攻 击 爬 行 者 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Hi_08_01"); //我 也 问 了 。 但 是 卫 兵 有 ‘ 更 重 要 的 事 情 ’ 要 做 。
	AI_Output(self, other, "DIA_Addon_Garaz_Hi_08_02"); //布 拉 德 维 恩 让 我 来 解 决 这 个 问 题 。
	AI_Output(other, self, "DIA_Addon_Garaz_Hi_15_03"); //我 不 认 为 你 准 备 同 那 些 爬 行 者 战 斗 。
	AI_Output(self, other, "DIA_Addon_Garaz_Hi_08_04"); //我 什 么 要 那 么 做 ？ 那 样 我 们 就 能 发 现 洞 穴 里 面 的 金 子 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Hi_08_05"); //只 有 布 拉 德 维 恩 自 己 能 得 到 更 多 。 而 我 不 会 为 了 那 么 一 点 点 的 工 资 去 用 自 己 的 生 命 去 冒 险 。
	AI_Output(self, other, "DIA_Addon_Garaz_Hi_08_06"); //如 果 你 想 要 去 和 爬 行 者 战 斗 - 我 绝 对 不 阻 止 你 。 只 是 - 别 把 它 们 引 到 这 里 来 ， 好 吗 ？
};

// ---------------------------------------------------------------------
//	Info Bloodwyn
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Bloodwyn(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 8;
	condition		= DIA_Addon_Garaz_Bloodwyn_Condition;
	information		= DIA_Addon_Garaz_Bloodwyn_Info;
	description		= "你 可 以 告 诉 我 关 于 布 拉 德 维 恩 的 事 情 吗 ？";
};

func int DIA_Addon_Garaz_Bloodwyn_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Garaz_Hi)
	&& (Minecrawler_Killed < 9)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Bloodwyn_Info()
{
	AI_Output(other, self, "DIA_Addon_Garaz_Bloodwyn_15_00"); //你 可 以 告 诉 我 关 于 布 拉 德 维 恩 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Bloodwyn_08_01"); //是 的 。 他 是 一 个 对 黄 金 饥 渴 的 混 蛋 。 他 检 查 每 一 处 新 矿 脉 和 每 一 块 金 块 。
	AI_Output(self, other, "DIA_Addon_Garaz_Bloodwyn_08_02"); //他 在 追 求 黄 金 的 路 上 走 不 了 多 远 。 但 是 我 们 不 是 要 取 笑 他 。
	AI_Output(other, self, "DIA_Addon_Garaz_Bloodwyn_15_03"); //否 则 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Bloodwyn_08_04"); //他 认 为 他 是 最 伟 大 的 ， 而 且 无 法 忍 受 别 人 比 他 强 。 好 吧 - 即 使 这 样 ， 我 也 不 会 站 出 来 反 对 他 。
	AI_Output(self, other, "DIA_Addon_Garaz_Bloodwyn_08_05"); //只 是 不 要 挡 他 的 路 ， 不 要 激 怒 他 - 除 非 你 想 要 他 狂 怒 并 失 去 理 智 … …

	B_LogEntry(Topic_Addon_Tempel, Topic_Addon_Tempel_1);
	Log_AddEntry(Topic_Addon_Tempel, Topic_Addon_Tempel_2);
};

// ---------------------------------------------------------------------
//	Info Sieg
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Sieg(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 3;
	condition		= DIA_Addon_Garaz_Sieg_Condition;
	information		= DIA_Addon_Garaz_Sieg_Info;
	description		= "爬 行 者 们 已 经 成 为 历 史 了 。";
};

func int DIA_Addon_Garaz_Sieg_Condition()
{
	if ((Minecrawler_Killed >= 9)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Sieg_Info()
{
	AI_Output(other, self, "DIA_Addon_Garaz_Sieg_15_00"); //就 是 那 样 。 爬 行 者 已 经 被 解 决 了 。
	AI_Output(self, other, "DIA_Addon_Garaz_Sieg_08_01"); //布 拉 德 维 恩 已 经 在 路 上 了 。 那 是 你 想 要 的 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Garaz_Sieg_08_02"); //我 是 说 ， 你 杀 了 那 些 爬 行 者 ， 那 样 布 拉 德 维 恩 就 会 来 这 里 。 所 以 ， 无 论 你 在 计 划 什 么 ， 马 上 开 始 吧 。

	B_StartOtherRoutine(Bloodwyn, "GOLD");
};

// ---------------------------------------------------------------------
//	Info Blood
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Blood(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 3;
	condition		= DIA_Addon_Garaz_Blood_Condition;
	information		= DIA_Addon_Garaz_Blood_Info;
	important		= TRUE;
};

func int DIA_Addon_Garaz_Blood_Condition()
{
	if (Npc_IsDead(Bloodwyn)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Blood_Info()
{
	AI_Output(self, other, "DIA_Addon_Garaz_Blood_08_00"); //你 狠 狠 地 教 训 了 那 个 笨 蛋 。 干 得 好 。
	AI_Output(self, other, "DIA_Addon_Garaz_Blood_08_01"); //那 我 将 在 洞 穴 里 四 处 看 看 。

	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "GOLD");
	B_StartOtherRoutine(Thorus, "TALK");
};

// ---------------------------------------------------------------------
//	Info Gold
// ---------------------------------------------------------------------
instance DIA_Addon_Garaz_Gold(C_INFO)
{
	npc				= BDT_10024_Addon_Garaz;
	nr				= 3;
	condition		= DIA_Addon_Garaz_Gold_Condition;
	information		= DIA_Addon_Garaz_Gold_Info;
	important		= TRUE;
};

func int DIA_Addon_Garaz_Gold_Condition()
{
	if ((Npc_GetDistToWP(self, "ADW_MINE_MC_GARAZ") <= 500)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garaz_Gold_Info()
{
	AI_Output(self, other, "DIA_Addon_Garaz_Gold_08_00"); //哇 ， 老 兄 ， 这 里 一 定 有 非 常 多 的 金 子 。
	AI_Output(self, other, "DIA_Addon_Garaz_Gold_08_01"); //要 想 到 那 边 去 ， 我 们 需 要 一 架 梯 子 。
	AI_Output(self, other, "DIA_Addon_Garaz_Gold_08_02"); //不 过 自 从 屏 障 被 破 坏 之 后 ， 没 有 人 再 用 梯 子 了 … … 这 真 是 糟 糕 … …
};
