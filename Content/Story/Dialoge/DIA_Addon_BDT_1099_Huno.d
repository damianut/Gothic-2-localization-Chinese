// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_EXIT(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 999;
	condition		= DIA_Addon_Huno_EXIT_Condition;
	information		= DIA_Addon_Huno_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Huno_PICKPOCKET(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 900;
	condition		= DIA_Addon_Huno_PICKPOCKET_Condition;
	information		= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen(85, 102);
};

func void DIA_Addon_Huno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK, DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};

func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Huno_PICKPOCKET);
};

// ----------------------------------------------------------------------
//	Abwimmeln
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 1;
	condition		= DIA_Addon_Huno_Abwimmeln_Condition;
	information		= DIA_Addon_Huno_Abwimmeln_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};

	if ((Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo(other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Abwimmeln_Info()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //你 现 在 想 要 什 么 ？ 滚 开 ！
	}
	else // schickt dich in die Kneipe
	{
		AI_Output(self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //你 还 在 等 什 么 ？ 去 酒 吧 ！
	};

	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 1;
	condition		= DIA_Addon_Huno_Hi_Condition;
	information		= DIA_Addon_Huno_Hi_Info;
	description		= "看 来 你 是 你 所 从 事 的 工 艺 中 的 大 师 。";
};

func int DIA_Addon_Huno_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Huno_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Huno_Hi_15_00"); //看 来 你 是 你 所 从 事 的 工 艺 中 的 大 师 。
	AI_Output(self, other, "DIA_Addon_Huno_Hi_06_01"); //我 以 前 听 说 过 … … 你 带 剑 来 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Huno_Hi_15_02"); //剑 ？ 不 ， 我 想 你 一 定 把 我 和 某 人 弄 混 了 … …
	AI_Output(self, other, "DIA_Addon_Huno_Hi_06_03"); //嗯 … … 不 知 怎 么 ， 你 看 起 来 很 熟 悉 。 我 们 在 哪 里 见 过 吗 ？

	Info_ClearChoices(DIA_Addon_Huno_Hi);
	Info_AddChoice(DIA_Addon_Huno_Hi, "当 然 ， 从 旧 营 地 来 。", DIA_Addon_Huno_Hi_JA);
	Info_AddChoice(DIA_Addon_Huno_Hi, "我 不 知 道 从 哪 里 来 。", DIA_Addon_Huno_Hi_NO);

	Log_CreateTopic(Topic_Addon_BDT_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, Topic_Addon_BDT_Trader_1);
};

func void DIA_Addon_Huno_Hi_JA()
{
	AI_Output(other, self, "DIA_Addon_Huno_Hi_JA_15_00"); //当 然 ， 从 旧 营 地 来 。
	AI_Output(self, other, "DIA_Addon_Huno_Hi_JA_06_01"); //旧 营 地 … … 对 … … 你 是 那 个 好 奇 的 家 伙 … … 我 以 为 你 死 了 。
	AI_Output(other, self, "DIA_Addon_Huno_Hi_JA_15_02"); //是 的 ， 大 家 都 那 么 想 。 还 有 谁 活 下 来 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Huno_Hi_JA_06_03"); //很 少 。 有 些 像 我 一 逃 到 瑞 雯 这 里 。 而 其 它 大 多 数 人 ， 旧 营 地 变 成 了 一 个 墓 地 。

	Info_ClearChoices(DIA_Addon_Huno_Hi);

	Knows_Flucht = TRUE;
};

func void DIA_Addon_Huno_Hi_NO()
{
	AI_Output(other, self, "DIA_Addon_Huno_Hi_NO_15_00"); //我 不 知 道 从 哪 里 来 。
	AI_Output(self, other, "DIA_Addon_Huno_Hi_NO_06_01"); //嗯 … … 我 的 大 脑 就 象 一 个 筛 子 … … 无 论 什 么 … …

	Info_ClearChoices(DIA_Addon_Huno_Hi);
};

// ----------------------------------------------------------------------
//	Info Blitz
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Blitz(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 2;
	condition		= DIA_Addon_Huno_Blitz_Condition;
	information		= DIA_Addon_Huno_Blitz_Info;
	description		= "告 诉 我 关 于 你 的 逃 亡 。";
};

func int DIA_Addon_Huno_Blitz_Condition()
{
	if ((Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Blitz_Info()
{
	AI_Output(other, self, "DIA_Addon_Huno_Blitz_15_00"); //告 诉 我 关 于 你 的 逃 亡 。
	AI_Output(self, other, "DIA_Addon_Huno_Blitz_06_01"); //混 乱 在 屏 障 毁 灭 的 那 一 天 爆 发 。
	AI_Output(self, other, "DIA_Addon_Huno_Blitz_06_02"); //有 人 藏 起 来 - 其 它 的 逃 走 ， 到 处 都 是 抢 劫 。
	AI_Output(other, self, "DIA_Addon_Huno_Blitz_15_03"); //你 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Huno_Blitz_06_04"); //在 天 空 突 然 变 明 亮 的 时 候 ， 我 正 要 离 开 ， 随 后 一 种 灼 热 的 刺 痛 撕 咬 着 我 的 皮 肤 。
	AI_Output(self, other, "DIA_Addon_Huno_Blitz_06_05"); //我 被 一 到 闪 电 击 中 了 ！ 我 感 觉 现 在 还 能 听 到 它 … …
	// AI_Output(self, other, "DIA_Blitz_06_07");// BLITZ
	AI_Output(self, other, "DIA_Addon_Huno_Blitz_06_06"); //后 来 有 人 告 诉 我 ， 托 鲁 斯 发 现 了 我 ， 并 带 上 了 我 一 起 。
};

// ----------------------------------------------------------------------
//	Info Armor
// ----------------------------------------------------------------------
var int Huno_ArmorPerm;
// ----------------------------------------------------------
instance DIA_Addon_Huno_Armor(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 3;
	condition		= DIA_Addon_Huno_Armor_Condition;
	information		= DIA_Addon_Huno_Armor_Info;
	permanent		= TRUE;
	description		= "我 需 要 更 好 的 盔 甲 。";
};

func int DIA_Addon_Huno_Armor_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Armor_Info()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);

	AI_Output(other, self, "DIA_Addon_Huno_Armor_15_00"); //我 需 要 更 好 的 盔 甲 。
	if (Huno_ArmorCheap == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Huno_Armor_06_01"); //所 以 - 你 可 以 拿 上 这 个 。 伊 斯 特 班 的 错 误 才 使 它 变 得 如 此 昂 贵 。
		AI_Output(self, other, "DIA_Addon_Huno_Armor_06_02"); //那 该 死 的 家 伙 从 我 出 售 的 每 一 件 盔 甲 中 抽 成 。

		BDT_Armor_H_Value = 2100;
		Info_AddChoice(DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor, "购 买 重 型 强 盗 盔 甲 （ 防 护 ： 武 器 ４ ５ ， 箭 ４ ５ 。 花 费 ： ２ １ ０ ０ 金 币 ）", DIA_Addon_Huno_Armor_BUY);
	}
	else // CHEAP
	{
		AI_Output(other, self, "DIA_Addon_Huno_Armor_15_03"); //费 斯 克 说 你 会 给 我 一 个 好 价 钱 ？
		AI_Output(self, other, "DIA_Addon_Huno_Armor_06_04"); //你 是 说 费 斯 克 ？ 嗯 ， 好 吧 ， 我 还 欠 他 一 个 情 。

		BDT_Armor_H_Value = 1400;
		Info_AddChoice(DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice(DIA_Addon_Huno_Armor, "购 买 重 型 强 盗 盔 甲 （ 防 护 ： 武 器 ４ ５ ， 箭 ４ ５ 。 花 费 ： ２ １ ０ ０ 金 币 ）", DIA_Addon_Huno_Armor_BUY);
	};
};

func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output(other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //好 吧 ， 我 要 那 件 盔 甲 。

	if (B_GiveInvItems(other, self, ItMi_Gold, BDT_Armor_H_Value))
	{
		AI_Output(self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //当 然 了 。

		B_GiveInvItems(self, other, ITAR_BDT_H, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //没 有 金 币 ， 没 有 盔 甲 。
	};

	if (BDT_Armor_H_Value < 2100) // nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};

	Info_ClearChoices(DIA_Addon_Huno_Armor);
};

// ----------------------------------------------------------------------
//	ATTENTAT
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Attentat(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 4;
	condition		= DIA_Addon_Huno_Attentat_Condition;
	information		= DIA_Addon_Huno_Attentat_Info;
	description		= "关 于 伊 斯 特 班 的 谋 杀 未 遂 者 … …";
};

func int DIA_Addon_Huno_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); // Wegen des Attentast auf Esteban
	AI_Output(self, other, "DIA_Addon_Huno_Attentat_06_00"); //（ 危 险 的 ） 你 想 从 我 这 里 得 到 什 么 ？
	AI_Output(other, self, "DIA_Addon_Huno_Attentat_15_01"); //我 正 在 找 那 次 袭 击 的 幕 后 指 使 者 … …
	AI_Output(self, other, "DIA_Addon_Huno_Attentat_06_02"); //你 为 什 么 来 问 我 ？
	AI_Output(other, self, "DIA_Addon_Huno_Attentat_15_03"); //我 认 为 你 可 能 知 道 一 些 相 关 的 事 。
	AI_Output(self, other, "DIA_Addon_Huno_Attentat_06_04"); //我 什 么 都 不 知 道 ！
};

// ----------------------------------------------------------------------
//	Paar Dinge gehört
// ----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
// -------------------------------------

func void B_Addon_Huno_Stress()
{
	AI_Output(self, other, "DIA_Addon_Huno_Stress_06_00"); //（ 叹 息 ） 现 在 听 着 ！ 马 上 挪 屁 股 走 人 ， 在 我 发 脾 气 之 前 ！
	Huno_Angepisst = TRUE;
};
instance DIA_Addon_Huno_SomeThings(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 4;
	condition		= DIA_Addon_Huno_SomeThings_Condition;
	information		= DIA_Addon_Huno_SomeThings_Info;
	permanent		= TRUE;
	description		= "我 听 说 过 一 点 关 于 你 的 事 … …";
};

func int DIA_Addon_Huno_SomeThings_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ((Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_SomeThings_Info()
{
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_00"); //我 听 说 过 一 点 关 于 你 的 事 … …

	if (Huno_nochmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_01"); //真 的 ？
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_02"); //又 来 了 ？ （ 威 胁 ） 这 一 次 最 好 有 什 么 重 要 的 事 … …
	};

	Huno_Counter = 0;

	if (Finn_TellAll == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_03"); //我 听 说 当 袭 击 开 始 时 ， 你 不 在 你 该 在 的 地 方 ！
		AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_04"); //（ 危 险 的 ） 还 有 什 么 ？
		Huno_Counter = Huno_Counter + 1;
	};

	if (Paul_TellAll == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_05"); //保 罗 说 你 恨 伊 斯 特 班 。
		AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_06"); //（ 危 险 的 ） 真 的 吗 ？ 他 真 的 说 了 ？ 还 有 什 么 ？
		Huno_Counter = Huno_Counter + 1;
	};

	if (Emilio_TellAll == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_07"); //艾 米 里 欧 吐 出 了 你 的 名 字 ！ 你 无 疑 知 道 关 于 袭 击 的 事 ！
		AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_08"); //（ 平 静 的 ） 你 已 经 同 老 艾 米 里 欧 谈 过 了 ， 嗯 ？

		if (Huno_Counter > 0)
		{
			AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_09"); //他 并 非 唯 一 一 个 怀 疑 你 的 人 ！
			AI_PlayAni(self, "T_SEARCH");
			AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_10"); //那 是 什 么 意 思 ， 嗯 ？

			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices(DIA_Addon_Huno_SomeThings);
			Info_AddChoice(DIA_Addon_Huno_SomeThings, "我 要 加 入 刺 客 组 织 ！", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice(DIA_Addon_Huno_SomeThings, "如 果 是 你 指 使 的 袭 击 ， 那 么 你 就 要 付 出 代 价 ！", DIA_Addon_Huno_SomeThings_Pro);

			B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_1);
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Huno_SomeThings_06_11"); //（ 威 胁 ） 也 许 我 应 该 和 他 谈 谈 。 我 肯 定 以 后 他 就 会 说 出 截 然 相 反 的 情 况 ！
			B_Addon_Huno_Stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Huno_SomeThings_15_12"); //没 别 的 事 了 … …
		B_Addon_Huno_Stress();
		AI_StopProcessInfos(self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //如 果 是 你 指 使 的 袭 击 ， 那 么 你 就 要 付 出 代 价 ！
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //（ 生 气 ） 你 真 是 一 个 白 痴 ！ 你 真 的 认 为 能 够 讨 好 伊 斯 特 班 ？
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //从 这 里 滚 出 去 ！
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_Contra()
{
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //我 要 加 入 刺 客 组 织 ！
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //反 对 伊 斯 特 班 ？ 真 的 ？ 那 证 明 它 ！
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //我 已 经 等 了 海 盗 的 武 器 货 物 很 久 了 。
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //我 怀 疑 伊 斯 特 班 把 它 扣 留 了 ， 为 了 以 后 可 以 用 更 高 的 价 格 卖 给 我 。
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //当 然 ， 他 不 会 亲 自 去 做 。 在 沼 泽 里 有 一 群 强 盗 拿 他 的 薪 水 。
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //你 怎 么 知 道 那 些 的 ？
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //喝 醉 的 强 盗 说 的 太 多 了 … …
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //这 个 多 嘴 的 强 盗 有 名 字 吗 ？
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //他 的 名 字 不 关 你 的 事 。 不 过 你 在 找 的 那 个 人 叫 胡 安 。 至 少 ， 我 已 经 很 长 时 间 没 在 营 地 看 到 他 了 。
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //你 要 去 沼 泽 找 他 。

	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;

	Log_CreateTopic(Topic_Addon_Huno, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Huno, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Huno, Topic_Addon_Huno_1);

	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	Info_AddChoice(DIA_Addon_Huno_SomeThings, "首 先 告 诉 我 谁 是 袭 击 的 幕 后 指 使 人 ！", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice(DIA_Addon_Huno_SomeThings, "好 吧 ， 我 愿 意 帮 助 你 ！", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //好 吧 ， 我 愿 意 帮 助 你 ！
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //好 。 我 们 看 看 你 是 否 值 得 信 。
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Huno_SomeThings_TellMeNow()
{
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //首 先 告 诉 我 谁 是 袭 击 的 幕 后 指 使 人 ！
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //不 。 我 不 信 任 你 。
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //看 。 我 的 下 一 次 谈 话 要 么 是 和 那 个 刺 杀 的 幕 后 指 使 者 谈 话 ， 要 么 就 是 和 伊 斯 特 班 谈 。
	AI_Output(other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //我 要 同 谁 谈 ， 决 定 权 在 你 。
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //（ 叹 息 ） 好 吧 。 我 会 带 你 去 行 凶 者 那 里 。 但 我 必 须 说 ， 那 只 是 凑 巧 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //去 酒 吧 找 酒 吧 老 板 谈 谈 。 你 可 以 从 他 那 里 了 解 到 所 有 的 情 况 。
	Huno_zuSnaf = TRUE;
	Info_ClearChoices(DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos(self);

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_2);
};

// ----------------------------------------------------------------------
//	Info Paket
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Paket(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 3;
	condition		= DIA_Addon_Huno_Paket_Condition;
	information		= DIA_Addon_Huno_Paket_Info;
	description		= "我 得 到 了 钢 铁 。";
};

func int DIA_Addon_Huno_Paket_Condition()
{
	if ((MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_Addon_Steel_Paket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Paket_Info()
{
	AI_Output(other, self, "DIA_Addon_Huno_Paket_15_00"); //我 得 到 了 钢 铁 。
	B_GiveInvItems(other, self, ItMi_Addon_Steel_Paket, 1);
	AI_Output(self, other, "DIA_Addon_Huno_Paket_06_01"); //还 有 吗 ？ 胡 安 也 在 那 里 ？
	AI_Output(other, self, "DIA_Addon_Huno_Paket_15_02"); //他 在 。
	AI_Output(self, other, "DIA_Addon_Huno_Paket_06_03"); //我 知 道 是 这 样 。 那 个 卑 鄙 的 伊 斯 特 班 在 幕 后 主 使 。

	if (Huno_zuSnaf == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Huno_Paket_06_04"); //你 没 事 吧 。 老 实 说 ， 我 没 指 望 从 你 这 里 得 到 它 。
		AI_Output(self, other, "DIA_Addon_Huno_Paket_06_05"); //给 ， 拿 上 这 个 作 为 酬 劳 。
		B_GiveInvItems(self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Huno_Paket_15_06"); //现 在 ， 我 们 的 协 议 怎 么 办 ？
		AI_Output(self, other, "DIA_Addon_Huno_Paket_06_07"); //你 想 要 找 到 谈 话 的 那 个 人 正 在 酒 吧 等 你 。 去 和 酒 吧 老 板 谈 谈 。
		Huno_zuSnaf = TRUE;
	};

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_2);
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_HunoStahl);
};

// ----------------------------------------------------------------------
//	Info Trade
// ----------------------------------------------------------------------
instance DIA_Addon_Huno_Trade(C_INFO)
{
	npc				= BDT_1099_Addon_Huno;
	nr				= 888;
	condition		= DIA_Addon_Huno_Trade_Condition;
	information		= DIA_Addon_Huno_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Huno_Trade_Condition()
{
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Huno_Trade_Info()
{
	B_Say(other, self, "$TRADE_3");
	B_GiveTradeInv(self);
};
