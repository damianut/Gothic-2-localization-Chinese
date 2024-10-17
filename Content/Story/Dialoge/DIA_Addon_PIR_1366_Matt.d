// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Matt_EXIT(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 999;
	condition		= DIA_Addon_Matt_EXIT_Condition;
	information		= DIA_Addon_Matt_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Matt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Matt_PICKPOCKET(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 900;
	condition		= DIA_Addon_Matt_PICKPOCKET_Condition;
	information		= DIA_Addon_Matt_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Matt_PICKPOCKET_Condition()
{
	C_Beklauen(55, 91);
};

func void DIA_Addon_Matt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET, DIALOG_BACK, DIA_Addon_Matt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Matt_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Matt_PICKPOCKET_DoIt);
};

func void DIA_Addon_Matt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};

func void DIA_Addon_Matt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Matt_PICKPOCKET);
};

// ************************************************************
// 			  Hello
// ************************************************************
instance DIA_Addon_Matt_Hello(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 1;
	condition		= DIA_Addon_Matt_Hello_Condition;
	information		= DIA_Addon_Matt_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Matt_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Matt_Hello_10_01"); //新 来 的 ， 是 吗 ？ 好 极 了 。 我 们 需 要 每 一 个 人 ！
};

// ************************************************************
// 			 				PERM
// ************************************************************
instance DIA_Addon_Matt_PERM(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 2;
	condition		= DIA_Addon_Matt_PERM_Condition;
	information		= DIA_Addon_Matt_PERM_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Addon_Matt_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_Alright_15_01"); //最 近 怎 么 样 ？

	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self, other, "DIA_Addon_Matt_Alright_10_02"); //治 疗 药 剂 的 哪 一 部 分 你 不 明 白 ？！
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Matt_Alright_10_01"); //一 切 都 井 然 有 序 - （ 玩 世 不 恭 的 ） 船 长 ！
		};
	}
	else if ((GregIsBack == TRUE)
	&& (!Npc_IsDead(Greg)))
	{
		AI_Output(self, other, "DIA_Addon_Matt_Job_10_01"); //非 常 有 趣 。 我 们 没 有 一 艘 船 了 。
		AI_Output(self, other, "DIA_Addon_Matt_Job_10_02"); //我 就 等 等 看 格 雷 格 下 面 做 什 么 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Matt_Job_10_03"); //营 地 里 刚 刚 全 部 安 静 下 来 。 所 以 我 要 休 息 一 下 。
		AI_Output(self, other, "DIA_Addon_Matt_Job_10_04"); //如 果 我 是 你 的 话 ， 我 也 会 这 么 做 。
		AI_Output(self, other, "DIA_Addon_Matt_Job_10_05"); //因 为 现 在 强 盗 已 经 到 这 里 了 ， 情 况 可 能 比 我 们 预 想 的 变 化 更 快 。
	};
};

// ************************************************************
// 			 				Banditen
// ************************************************************
instance DIA_Addon_Matt_Bandits(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 3;
	condition		= DIA_Addon_Matt_Bandits_Condition;
	information		= DIA_Addon_Matt_Bandits_Info;
	description		= "关 于 强 盗 你 知 道 些 什 么 ？";
};

func int DIA_Addon_Matt_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Matt_Bandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_Bandits_15_03"); //关 于 强 盗 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Matt_Bandits_10_01"); //你 的 意 思 是 ， 除 了 他 们 致 命 的 威 胁 、 而 且 数 量 远 远 超 过 我 们 这 个 事 实 之 外 ？
	AI_Output(other, self, "DIA_Addon_Matt_Bandits_15_02"); //是 的 。
	AI_Output(self, other, "DIA_Addon_Matt_Bandits_10_02"); //他 们 一 身 都 是 金 币 。
	AI_Output(self, other, "DIA_Addon_Matt_Bandits_10_03"); //嗯 ， 至 少 曾 经 他 们 满 身 都 是 金 子 。 他 们 根 本 没 有 付 上 次 的 船 费 。
	AI_Output(self, other, "DIA_Addon_Matt_Bandits_10_04"); //不 过 我 怀 疑 那 是 因 为 那 些 混 蛋 的 金 子 已 经 用 完 了 。
	AI_Output(self, other, "DIA_Addon_Matt_Bandits_10_05"); //更 像 是 他 们 自 以 为 有 多 了 不 起 。
};

// ************************************************************
// 			 				Francis
// ************************************************************
instance DIA_Addon_Matt_Francis(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 4;
	condition		= DIA_Addon_Matt_Francis_Condition;
	information		= DIA_Addon_Matt_Francis_Info;
	description		= "你 知 道 些 弗 朗 西 斯 的 什 么 ？";
};

func int DIA_Addon_Matt_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Matt_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Brandon_Matt_15_00"); //你 知 道 些 弗 朗 西 斯 的 什 么 ？
	AI_Output(self, other, "DIA_Addon_Matt_Francis_10_01"); //你 的 意 思 是 ， 除 了 他 又 懒 又 无 能 的 事 实 之 外 ？
	AI_Output(other, self, "DIA_Addon_Brandon_Matt_15_02"); //是 的 。
	AI_Output(self, other, "DIA_Addon_Matt_Francis_10_03"); //让 我 想 想 。 嗯 … … 不 。 那 只 是 突 然 跳 到 脑 海 中 的 。
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Matt_Anheuern(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 11;
	condition		= DIA_Addon_Matt_Anheuern_Condition;
	information		= DIA_Addon_Matt_Anheuern_Info;
	description		= "跟 我 来 。";
};

func int DIA_Addon_Matt_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_15_00"); //跟 我 来 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_10_01"); //我 现 在 不 能 离 开 ， 我 正 要 放 松 一 下 。
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_15_02"); //来 自 格 雷 格 的 命 令 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_10_03"); //（ 匆 忙 的 ） 啊 ， 我 明 白 了 。 那 当 然 是 不 同 的 了 。 我 是 说 ， 当 然 我 来 了 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_10_04"); //他 们 要 去 哪 里 ？

	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	Info_AddChoice(DIA_Addon_Matt_Anheuern, "闭 嘴 ， 跟 上 。", DIA_Addon_Matt_Anheuern_ShutUp);
	Info_AddChoice(DIA_Addon_Matt_Anheuern, "我 们 应 该 把 峡 谷 清 理 好 。", DIA_Addon_Matt_Anheuern_ClearCanyon);
};

func void DIA_Addon_Matt_Anheuern_ShutUp()
{
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_ShutUp_15_00"); //闭 嘴 ， 跟 上 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_ShutUp_10_01"); //（ 傲 慢 的 ） 对 对 - （ 讽 刺 的 ） 船 长 ！

	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void DIA_Addon_Matt_Anheuern_ClearCanyon()
{
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_ClearCanyon_15_00"); //我 们 应 该 把 峡 谷 清 理 好 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_ClearCanyon_10_01"); //你 疯 了 吗 ， 那 里 到 处 都 是 野 兽 。 那 些 剃 刀 龙 可 不 是 闹 着 玩 的 。
	AI_Output(other, self, "DIA_Addon_Matt_FollowMe_ClearCanyon_15_02"); //我 知 道 。 你 现 在 来 吗 。
	AI_Output(self, other, "DIA_Addon_Matt_FollowMe_ClearCanyon_10_03"); //（ 叹 息 ） 你 最 好 带 上 一 些 治 疗 药 剂 ， 我 们 会 需 要 它 们 的 ！

	Info_ClearChoices(DIA_Addon_Matt_Anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Matt_ComeOn(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 12;
	condition		= DIA_Addon_Matt_ComeOn_Condition;
	information		= DIA_Addon_Matt_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_Matt_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Matt_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_ComeOn_15_00"); //跟 我 来 。

	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Matt_ComeOn_10_01"); //对 对 - （ 玩 世 不 恭 的 ） 船 长 ！
		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_Matt_GoHome(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 13;
	condition		= DIA_Addon_Matt_GoHome_Condition;
	information		= DIA_Addon_Matt_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_Matt_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_Matt_DontNeedYou_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_Matt_GoHome_10_01"); //（ 自 言 自 语 ） 我 需 要 好 好 地 痛 饮 一 顿 烈 酒 ！

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START"); // START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_Matt_TooFar(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 14;
	condition		= DIA_Addon_Matt_TooFar_Condition;
	information		= DIA_Addon_Matt_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Matt_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_Matt_TooFar_10_01"); //从 这 里 开 始 ， 你 可 以 一 个 人 去 干 - （ 玩 世 不 恭 的 ） 船 长 。
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self, other, "DIA_Addon_Matt_TooFar_10_03"); //我 和 我 的 人 正 要 回 营 地 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Matt_TooFar_10_02"); //我 要 回 营 地 去 ！
	};

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 			 Ich könnte 'nen Heiltrank gebrauchen!
// ------------------------------------------------------------
instance DIA_Addon_Matt_Healing(C_INFO)
{
	npc				= PIR_1365_Addon_Matt;
	nr				= 15;
	condition		= DIA_Addon_Matt_Healing_Condition;
	information		= DIA_Addon_Matt_Healing_Info;
	important		= TRUE;
};

func int DIA_Addon_Matt_Healing_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Matt_Healing_Info()
{
	AI_Output(self, other, "DIA_Addon_Matt_Healing_10_01"); //（ 玩 世 不 恭 的 ） 你 好 船 长 ！ 我 需 要 治 疗 药 剂 ！
};
