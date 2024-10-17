// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_garond_EXIT(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 999;
	condition		= DIA_Garond_EXIT_Condition;
	information		= DIA_Garond_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garond_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					Petzmaster: Schulden offen
// ************************************************************

// ---------------------------
var int Garond_LastPetzCounter;
var int Garond_LastPetzCrime;
// ---------------------------
instance DIA_Garond_PMSchulden(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 1;
	condition		= DIA_Garond_PMSchulden_Condition;
	information		= DIA_Garond_PMSchulden_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Garond_PMSchulden_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Garond_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Garond_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Garond_PMSchulden_Info()
{
	AI_Output(self, other, "DIA_Garond_PMSchulden_10_00"); //在 你 交 付 罚 款 之 前 我 们 不 会 商 量 任 何 事 情 。

	if (B_GetTotalPetzCounter(self) > Garond_LastPetzCounter)
	{
		AI_Output(self, other, "DIA_Garond_PMSchulden_10_01"); //随 着 最 新 的 指 控 ， 那 已 经 上 涨 了 。
		AI_Output(self, other, "DIA_Garond_PMSchulden_10_02"); //你 好 象 陷 入 了 更 多 的 麻 烦 里 了 。

		if (Garond_Schulden < 1000)
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_03"); //但 我 希 望 你 马 上 支 付 全 部 款 项 ！ 总 而 言 之 ， 这 将 是 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_04"); //我 对 你 感 到 非 常 失 望 。 你 的 罚 款 总 额 是 … …
		};

		var int diff; diff = (B_GetTotalPetzCounter(self) - Garond_LastPetzCounter);

		if (diff > 0)
		{
			Garond_Schulden = Garond_Schulden + (diff * 50);
		};

		if (Garond_Schulden > 1000) { Garond_Schulden = 1000; };
		B_Say_Gold(self, other, Garond_Schulden);
	}
	else if (B_GetGreatestPetzCrime(self) < Garond_LastPetzCrime)
	{
		AI_Output(self, other, "DIA_Garond_PMSchulden_10_05"); //发 生 了 一 点 新 情 况 。

		if (Garond_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_06"); //你 突 然 不 再 被 控 谋 杀 了 。
		};

		if ((Garond_LastPetzCrime == CRIME_THEFT)
		|| ((Garond_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_07"); //没 有 人 再 目 击 你 偷 窃 的 事 情 。
		};

		if ((Garond_LastPetzCrime == CRIME_ATTACK)
		|| ((Garond_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_08"); //再 也 没 有 一 个 证 人 证 明 你 参 与 了 斗 殴 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_09"); //看 起 来 好 象 所 有 对 你 的 控 诉 都 已 经 停 止 了 。
		};

		AI_Output(self, other, "DIA_Garond_PMSchulden_10_10"); //我 不 知 道 到 底 发 生 了 什 么 事 情 ， 但 我 警 告 你 ： 别 做 得 太 过 火 ！

		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_11"); //我 决 定 免 除 你 的 债 务 。
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_12"); //还 有 ， 别 再 在 城 堡 里 惹 麻 烦 了 ！

			Garond_Schulden = 0;
			Garond_LastPetzCounter = 0;
			Garond_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_13"); //我 还 要 明 确 一 件 事 ： 无 论 如 何 你 都 要 必 须 支 付 全 额 的 罚 金 。
			B_Say_Gold(self, other, Garond_Schulden);
			AI_Output(self, other, "DIA_Garond_PMSchulden_10_14"); //那 么 ， 怎 么 样 ？
		};
	};

	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Garond_PMSchulden);
		Info_ClearChoices(DIA_Garond_PETZMASTER);
		Info_AddChoice(DIA_Garond_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Garond_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Garond_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Garond_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
		{
			Info_AddChoice(DIA_Garond_PMSchulden, "我 想 要 支 付 罚 金.", DIA_Garond_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Garond_PMSchulden_HowMuchAgain()
{
	AI_Output(other, self, "DIA_Garond_PMSchulden_HowMuchAgain_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Garond_Schulden);

	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Garond_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Garond_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Garond_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PMSchulden, "我 想 要 支 付 罚 金.", DIA_Garond_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Garond_PETZMASTER) ***

// ************************************************************
// 			  			 PETZ-MASTER
// ************************************************************
instance DIA_Garond_PETZMASTER(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 1;
	condition		= DIA_Garond_PETZMASTER_Condition;
	information		= DIA_Garond_PETZMASTER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Garond_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Garond_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Garond_PETZMASTER_Info()
{
	Garond_Schulden = 0; // weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...

	// ------ SC hat mit Garond noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_00"); //那 么 ， 你 就 是 那 个 在 城 堡 这 里 制 造 麻 烦 的 人 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_01"); //我 一 直 在 问 自 己 要 多 久 你 才 会 到 我 这 里 来 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_02"); //谋 杀 正 是 我 在 这 里 要 干 的 最 后 一 件 事!
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_03"); //我 需 要 我 的 每 一 个 人 - 现 在 又 少 一 个 ！
		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
		Garond_Schulden = Garond_Schulden + 500; // PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Garond_PETZMASTER_10_04"); //更 别 说 你 惹 上 的 其 它 麻 烦 事 。
		};

		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_05"); //让 我 跟 你 解 释 一 下 。 我 们 陷 入 了 同 一 个 圈 套 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_06"); //可 我 非 常 需 要 我 的 每 一 个 人 ， 包 括 你 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_07"); //如 果 你 喜 欢 杀 人 ， 只 要 离 开 城 堡 就 可 以 了 。 那 里 有 成 群 的 兽 人 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_08"); //我 准 备 向 你 征 收 一 笔 罚 款 - 尽 管 我 真 的 讨 厌 处 理 这 样 的 破 事 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_09"); //谣 言 传 得 很 厉 害 ， 说 你 一 直 在 这 周 围 偷 东 西 。
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Garond_PETZMASTER_10_10"); //更 不 要 提 起 我 听 说 的 其 它 那 些 事 了 。
		};

		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_11"); //你 不 会 逃 脱 那 笔 处 罚 的 。 你 好 象 没 有 意 识 到 目 前 形 式 的 严 重 性 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_12"); //你 将 被 强 制 支 付 一 笔 罚 款 来 弥 补 你 的 罪 行 ！

		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_13"); //我 不 喜 欢 看 到 自 己 人 之 间 的 争 吵 。

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Garond_PETZMASTER_10_14"); //那 些 小 事 情 真 的 不 必 要 。
		};

		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_15"); //那 么 你 要 为 此 而 支 付 罚 款 ！

		Garond_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (es gibt drei Schafe in der Burg) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_16"); //你 在 到 处 杀 我 们 的 绵 羊 ？ 它 们 属 于 我 们 所 有 人 。
		AI_Output(self, other, "DIA_Garond_PETZMASTER_10_17"); //你 该 付 给 我 肉 钱 。

		Garond_Schulden = 100;
	};

	AI_Output(other, self, "DIA_Garond_PETZMASTER_15_18"); //多 少 ？

	if (Garond_Schulden > 1000) { Garond_Schulden = 1000; };
	B_Say_Gold(self, other, Garond_Schulden);

	Info_ClearChoices(DIA_Garond_PMSchulden);
	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_AddChoice(DIA_Garond_PETZMASTER, "我 还 没 有 足 够 的 金 子 ！", DIA_Garond_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Garond_Schulden)
	{
		Info_AddChoice(DIA_Garond_PETZMASTER, "我 想 要 支 付 罚 金.", DIA_Garond_PETZMASTER_PayNow);
	};
};

func void DIA_Garond_PETZMASTER_PayNow()
{
	AI_Output(other, self, "DIA_Garond_PETZMASTER_PayNow_15_00"); //我 想 要 支 付 罚 金 ！
	B_GiveInvItems(other, self, itmi_gold, Garond_Schulden);
	AI_Output(self, other, "DIA_Garond_PETZMASTER_PayNow_10_01"); //好 吧 ， 那 我 会 叫 我 们 的 人 冷 静 一 下 。 但 别 让 我 再 看 到 你 做 出 这 种 龌 龊 的 事 情 ！

	B_GrantAbsolution(LOC_OLDCAMP);

	Garond_Schulden = 0;
	Garond_LastPetzCounter = 0;
	Garond_LastPetzCrime = CRIME_NONE;

	Info_ClearChoices(DIA_Garond_PETZMASTER);
	Info_ClearChoices(DIA_Garond_PMSchulden); // !!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Garond_PETZMASTER_PayLater()
{
	AI_Output(other, self, "DIA_Garond_PETZMASTER_PayLater_15_00"); //我 没 有 足 够 的 金 币 ！
	AI_Output(self, other, "DIA_Garond_PETZMASTER_PayLater_10_01"); //那 你 应 该 尽 快 带 着 金 子 来 。
	AI_Output(self, other, "DIA_Garond_PETZMASTER_PayLater_10_02"); //但 我 警 告 你 ： 如 果 将 来 再 引 起 更 多 的 麻 烦 ， 这 个 价 格 将 会 上 涨 ！

	Garond_LastPetzCounter = B_GetTotalPetzCounter(self);
	Garond_LastPetzCrime = B_GetGreatestPetzCrime(self);

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
instance DIA_Garond_Hello(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Hello_Condition;
	information		= DIA_Garond_Hello_Info;
	important		= TRUE;
};

func int DIA_Garond_Hello_Condition()
{
	if ((Kapitel == 2)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Garond_Hello_Info()
{
	AI_Output(self, other, "DIA_Garond_Hello_10_00"); //你 从 哪 里 来 ？ 你 既 不 是 矿 工 ， 也 不 是 我 的 人 。 嗯 ？
	AI_Output(other, self, "DIA_Garond_Hello_15_01"); //我 穿 过 了 那 里 的 关 卡 。
	AI_Output(self, other, "DIA_Garond_Hello_10_02"); //越 过 了 关 卡 … … ？ 你 真 的 过 来 了 - 以 英 诺 斯 的 名 义 ！

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Garond_Hello_10_03"); //你 为 什 么 要 选 择 这 样 一 条 路 ， 魔 法 师 ？
	}
	else if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Garond_Hello_10_04"); //你 的 命 令 是 什 么 ， 战 士 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Garond_Hello_10_05"); //我 必 须 要 问 自 己 ， 为 什 么 一 个 雇 佣 兵 会 自 己 承 担 那 样 的 责 任 。 你 在 这 里 干 什 么 ？
	};
};

//**********************************
//	Ich brauch Beweise
//**********************************
instance DIA_Garond_NeedProof(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 1;
	condition		= DIA_Garond_NeedProof_Condition;
	information		= DIA_Garond_NeedProof_Info;
	description		= "我 从 哈 根 勋 爵 那 里 来 。 ";
};

func int DIA_Garond_NeedProof_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Garond_Hello))
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_NeedProof_Info()
{
	AI_Output(other, self, "DIA_Garond_NeedProof_15_00"); //我 从 哈 根 勋 爵 那 里 来 。 他 要 我 给 他 带 去 关 于 龙 的 存 在 的 证 据 。
	AI_Output(self, other, "DIA_Garond_NeedProof_10_01"); //那 么 你 只 是 到 这 里 来 取 回 证 据 然 后 就 再 次 消 失 吗 ？
	AI_Output(other, self, "DIA_Garond_NeedProof_15_02"); //我 就 是 那 样 想 的 。
	AI_Output(self, other, "DIA_Garond_NeedProof_10_03"); //那 么 说 他 想 要 证 据 ？ 他 会 的 。 但 我 不 能 让 你 回 哈 根 勋 爵 那 里 的 时 候 ， 却 不 带 去 关 于 矿 石 的 消 息 。
	AI_Output(self, other, "DIA_Garond_NeedProof_10_04"); //听 着 - 哈 根 勋 爵 必 须 了 解 这 里 的 处 境 以 及 我 们 到 目 前 为 止 开 采 了 多 少 矿 石 。
	AI_Output(other, self, "DIA_Garond_NeedProof_15_05"); //好 吧 ， 你 想 要 我 为 你 做 些 什 么 事 情 ？
	AI_Output(self, other, "DIA_Garond_NeedProof_10_06"); //我 向 那 边 派 了 三 个 小 队 ， 但 他 们 到 现 在 还 没 有 给 我 送 来 一 块 矿 块 。
	AI_Output(self, other, "DIA_Garond_NeedProof_10_07"); //去 矿 场 看 看 ， 回 来 给 我 汇 报 一 下 他 们 已 经 储 存 了 多 少 矿 石 。
	AI_Output(self, other, "DIA_Garond_NeedProof_10_08"); //然 后 ， 我 会 写 封 信 让 你 带 回 去 交 给 哈 根 勋 爵 。
	AI_Output(other, self, "DIA_Garond_NeedProof_15_09"); //那 好 吧 - 我 猜 我 没 得 选 择 。

	MIS_ScoutMine = LOG_RUNNING;
	B_StartOtherRoutine(Jergan, "FAJETH");

	B_LogEntry(TOPIC_MISOLDWORLD, TOPIC_MISOLDWORLD_2);

	Log_CreateTopic(TOPIC_ScoutMine, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ScoutMine, LOG_RUNNING);

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_2);
	Log_AddEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_3);
};

// ************************************************************
// 			  Warum ich?
// ************************************************************
instance DIA_Garond_Why(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Why_Condition;
	information		= DIA_Garond_Why_Info;
	description		= "但 为 什 么 这 么 多 人 偏 偏 选 中 我 ？ ";
};

func int DIA_Garond_Why_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Why_Info()
{
	AI_Output(other, self, "DIA_Garond_Why_15_00"); //但 为 什 么 这 么 多 人 偏 偏 选 中 我 ？
	AI_Output(self, other, "DIA_Garond_Why_10_01"); //因 为 你 知 道 穿 过 兽 人 的 战 线 的 方 法 。 我 的 人 只 会 毫 无 希 望 地 死 在 那 外 面 。
	AI_Output(self, other, "DIA_Garond_Why_10_02"); //另 一 方 面 ， 你 已 经 有 一 次 穿 越 的 经 历 了 - 这 使 得 你 成 为 完 成 这 项 任 务 的 最 佳 人 选 。
};

// ************************************************************
// 			Ausrüstung
// ************************************************************
instance DIA_Garond_Equipment(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Equipment_Condition;
	information		= DIA_Garond_Equipment_Info;
	description		= "我 需 要 一 些 装 备 。 ";
};

func int DIA_Garond_Equipment_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& ((other.guild == GIL_KDF)
	|| (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void DIA_Garond_Equipment_Info()
{
	AI_Output(other, self, "DIA_Garond_Equipment_15_00"); //我 需 要 一 些 装 备 。

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Garond_Equipment_10_01"); //去 跟 城 堡 里 的 魔 法 师 米 尔 腾 谈 谈 吧 。 他 知 道 你 想 要 了 解 的 事 情 。
	};

	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Garond_Equipment_10_02"); //去 和 坦 多 谈 一 下 。 他 有 你 需 要 的 所 有 东 西 。

		Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
		B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_1);
	};
};

// ************************************************************
// 			Zahlen
// ************************************************************
instance DIA_Garond_zahlen(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_zahlen_Condition;
	information		= DIA_Garond_zahlen_Info;
	description		= "这 件 工 作 你 能 付 我 多 少 钱 ？";
};

func int DIA_Garond_zahlen_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_zahlen_Info()
{
	AI_Output(other, self, "DIA_Garond_zahlen_15_00"); //这 件 工 作 你 能 付 我 多 少 钱 ？
	AI_Output(self, other, "DIA_Garond_zahlen_10_01"); //（ 愤 怒 的 ） 我 不 习 惯 跟 雇 佣 兵 讨 价 还 价 。
	AI_Output(self, other, "DIA_Garond_zahlen_10_02"); //那 好 吧 ， 我 想 我 没 得 选 择 。 如 果 你 为 我 完 成 这 个 任 务 的 话 ， 我 会 付 给 你500金 币 。
};

// ************************************************************
// 	Wo finde ich die Schürfstellen?
// ************************************************************
instance DIA_Garond_Wo(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Wo_Condition;
	information		= DIA_Garond_Wo_Info;
	description		= "我 去 哪 里 找 那 些 采 矿 地 点 ？";
};

func int DIA_Garond_Wo_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Wo_Info()
{
	AI_Output(other, self, "DIA_Garond_Wo_15_00"); //我 去 哪 里 找 那 些 采 矿 地 点 ？
	AI_Output(self, other, "DIA_Garond_Wo_10_01"); //给 ， 拿 着 这 张 地 图 。 它 标 明 了 矿 场 分 布 的 两 个 区 域 。

	CreateInvItems(self, ItWr_Map_OldWorld_Oremines_MIS, 1);
	B_GiveInvItems(self, other, ItWr_Map_OldWorld_Oremines_MIS, 1);

	AI_Output(self, other, "DIA_Garond_Wo_10_02"); //如 果 你 还 有 别 的 问 题 ， 去 问 帕 西 沃 。 他 能 告 诉 你 所 有 你 需 要 知 道 的 关 于 矿 工 的 事 情 。

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_4);
};

func void B_Garond_OreCounter3()
{
	AI_Output(self, other, "B_Garond_OreCounter3_10_00"); //混 蛋 ！ 那 外 面 出 什 么 事 了 ？ 难 道 贝 利 尔 已 经 亲 自 来 毁 灭 我 们 了 吗 ？
	AI_Output(self, other, "B_Garond_OreCounter3_10_01"); //我 的 人 已 经 差 不 多 全 都 死 光 了 ， 再 加 上 这 些 矿 石 ， 我 们 甚 至 连 一 个 兽 人 也 挡 不 住 ， 更 何 况 是 一 支 军 队 ！
	AI_Output(self, other, "B_Garond_OreCounter3_10_02"); //这 一 场 远 征 注 定 了 要 以 失 败 告 终 。
};

// ************************************************************
// 	Fajeth
// ************************************************************
instance DIA_Garond_Fajeth(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 2;
	condition		= DIA_Garond_Fajeth_Condition;
	information		= DIA_Garond_Fajeth_Info;
	description		= "我 同 法 捷 斯 谈 过 了 。";
};

func int DIA_Garond_Fajeth_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Fajeth_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Fajeth_Info()
{
	AI_Output(other, self, "DIA_Garond_Fajeth_15_00"); //我 同 法 捷 斯 谈 过 了 。
	AI_Output(self, other, "DIA_Garond_Fajeth_10_01"); //他 有 什 么 事 要 告 诉 我 ？
	AI_Output(other, self, "DIA_Garond_Fajeth_15_02"); //他 的 人 已 经 开 采 了 两 箱 矿 石 。
	AI_Output(self, other, "DIA_Garond_Fajeth_10_03"); //嗯 … … 两 箱 ？ 我 不 要 两 箱 - 我 要 两 百 。
	AI_Output(other, self, "DIA_Garond_Fajeth_15_04"); //他 想 要 我 告 诉 你 ， 他 需 要 更 多 的 人 手 。
	AI_Output(self, other, "DIA_Garond_Fajeth_10_05"); //什 么 ？ 我 要 派 更 多 的 人 去 那 里 送 死 ？ 他 得 死 了 这 条 心 。

	Ore_Counter = (Ore_Counter + 1);
	B_GivePlayerXP(XP_Fajeth_Ore);

	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};

// ************************************************************
// 	Silvestro
// ************************************************************
instance DIA_Garond_Silvestro(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 2;
	condition		= DIA_Garond_Silvestro_Condition;
	information		= DIA_Garond_Silvestro_Info;
	description		= "关 于 席 尔 维 斯 特 罗 的 采 矿 地 点 … …";
};

func int DIA_Garond_Silvestro_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Silvestro_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Silvestro_Info()
{
	AI_Output(other, self, "DIA_Garond_Silvestro_15_00"); //关 于 席 尔 维 斯 特 罗 的 采 矿 地 点 … …
	AI_Output(self, other, "DIA_Garond_Silvestro_10_01"); //你 去 见 他 了 吗 ？ 你 跟 他 说 了 吗 ？
	AI_Output(other, self, "DIA_Garond_Silvestro_15_02"); //所 有 的 人 都 死 在 那 里 了 。 他 们 遭 到 矿 井 爬 行 者 的 袭 击 了 。
	AI_Output(self, other, "DIA_Garond_Silvestro_10_03"); //矿 石 怎 么 样 了 ？ 你 知 不 知 道 他 们 已 经 开 采 了 多 少 ？
	AI_Output(other, self, "DIA_Garond_Silvestro_15_04"); //他 们 设 法 保 住 了 一 两 箱 ， 他 们 现 在 一 个 洞 穴 里 - 在 从 城 堡 到 矿 场 的 道 路 之 间 。
	AI_Output(self, other, "DIA_Garond_Silvestro_10_05"); //该 死 ！ 他 们 可 都 是 一 群 好 人 啊 - 愿 英 诺 斯 怜 悯 他 们 的 灵 魂 。

	Ore_Counter = (Ore_Counter + 1);
	B_GivePlayerXP(XP_Silvestro_Ore);

	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};

// ************************************************************
// 	Marcos
// ************************************************************
instance DIA_Garond_Marcos(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 2;
	condition		= DIA_Garond_Marcos_Condition;
	information		= DIA_Garond_Marcos_Info;
	description		= "我 已 经 遇 到 了 马 科 斯 。";
};

func int DIA_Garond_Marcos_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Marcos_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Marcos_Info()
{
	AI_Output(other, self, "DIA_Garond_Marcos_15_00"); //我 已 经 遇 到 了 马 科 斯 。
	AI_Output(self, other, "DIA_Garond_Marcos_10_01"); //还 有 什 么 ？ 他 要 报 告 什 么 事 情 ？ 他 给 我 们 带 来 了 多 少 矿 石 ？
	AI_Output(other, self, "DIA_Garond_Marcos_15_02"); //四 箱 。 他 已 经 离 开 了 矿 场 ， 并 把 矿 石 带 到 了 一 个 安 全 的 地 方 。
	AI_Output(other, self, "DIA_Garond_Marcos_15_03"); //他 现 在 在 兽 人 阵 线 后 方 的 一 个 小 山 谷 里 守 卫 那 些 箱 子 。 总 之 ， 他 需 要 支 持 。
	AI_Output(self, other, "DIA_Garond_Marcos_10_04"); //什 么 ？ 只 有 四 箱 - 而 且 他 已 经 离 开 了 矿 场 ？ 该 死 ， 那 可 不 妙 。
	AI_Output(self, other, "DIA_Garond_Marcos_10_05"); //而 且 现 在 他 还 要 更 多 人 … … ？ 那 好 吧 ， 我 可 以 派 两 个 人 去 他 那 里 。

	Marcos_Guard1.flags = 0;
	Marcos_Guard2.flags = 0;

	B_StartOtherRoutine(Marcos_Guard1, "MARCOS");
	B_StartOtherRoutine(Marcos_Guard2, "MARCOS");

	AI_Teleport(Marcos_Guard1, "OW_STAND_GUARDS");
	AI_Teleport(Marcos_Guard1, "OW_STAND_GUARDS");

	Ore_Counter = (Ore_Counter + 1);
	MIS_Marcos_Jungs = LOG_SUCCESS;

	B_GivePlayerXP(XP_Marcos_Ore);

	if (Ore_Counter >= 3)
	{
		B_Garond_OreCounter3();
	};
};

// ************************************************************
// Info Success
// ************************************************************
instance DIA_Garond_Success(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Success_Condition;
	information		= DIA_Garond_Success_Info;
	description		= "那 么 给 哈 根 勋 爵 的 信 呢 ？";
};

func int DIA_Garond_Success_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter >= 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Success_Info()
{
	AI_Output(other, self, "DIA_Garond_Success_15_00"); //那 么 给 哈 根 勋 爵 的 信 呢 ？
	AI_Output(self, other, "DIA_Garond_Success_10_01"); //我 们 全 部 的 矿 石 有 十 箱 - 但 我 们 失 去 了 两 倍 于 这 个 数 目 的 好 兄 弟 。
	AI_Output(self, other, "DIA_Garond_Success_10_02"); //你 可 以 拿 走 你 的 信 。 哈 根 勋 爵 必 须 听 听 这 个 。 这 个 山 谷 受 到 了 诅 咒 - 邪 恶 萦 绕 在 这 里 。

	CreateInvItems(self, ItWr_PaladinLetter_MIS, 1);
	B_GiveInvItems(self, other, ItWr_PaladinLetter_MIS, 1);

	KnowsPaladins_Ore = TRUE;

	B_LogEntry(TOPIC_MISOLDWORLD, TOPIC_MISOLDWORLD_3);

	MIS_ScoutMine = LOG_SUCCESS;
	B_GivePlayerXP(XP_ScoutMine);
	MIS_ReadyForChapter3 = TRUE; // Joly: Bei Levelchange ab hier in die Newworld -> Kapitel 3!!!!!!
	B_NPC_IsAliveCheck(OldWorld_Zen);
};

// ************************************************************
// SLD bezahlen
// ************************************************************
instance DIA_Garond_SLD(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_SLD_Condition;
	information		= DIA_Garond_SLD_Info;
	description		= "那 么 我 的 报 酬 呢 ？";
};

func int DIA_Garond_SLD_Condition()
{
	if ((MIS_ScoutMine == LOG_SUCCESS)
	&& (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Garond_SLD_Info()
{
	AI_Output(other, self, "DIA_Garond_SLD_15_00"); //那 么 我 的 报 酬 呢 ？
	AI_Output(self, other, "DIA_Garond_SLD_10_01"); //哦 ， 是 的 ， 对 。 我 还 欠 你 一 些 金 币 。 这 是 你 的 报 酬 。
	B_GiveInvItems(self, other, itMI_Gold, 500);
};

// ************************************************************
// Info Perm wenn Scout Mine == RUNNING
// ************************************************************
instance DIA_Garond_Running(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 10;
	condition		= DIA_Garond_Running_Condition;
	information		= DIA_Garond_Running_Info;
	permanent		= TRUE;
	description		= "状 况 怎 么 样 ？";
};

func int DIA_Garond_Running_Condition()
{
	if ((MIS_ScoutMine == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Ore_Counter < 3))
	{
		return TRUE;
	};
};

func void DIA_Garond_Running_Info()
{
	AI_Output(other, self, "DIA_Garond_Running_15_00"); //状 况 怎 么 样 ？

	if (Ore_Counter == 2)
	{
		AI_Output(self, other, "DIA_Garond_Running_10_01"); //现 在 ， 我 就 等 最 后 那 个 矿 场 的 消 息 了 - 我 希 望 会 是 好 消 息 。
	}
	else if (Ore_Counter == 1)
	{
		AI_Output(self, other, "DIA_Garond_Running_10_02"); //我 需 要 关 于 其 它 两 个 矿 场 的 报 告 。 那 么 我 们 就 会 明 白 了 。
	}
	else // 0
	{
		AI_Output(self, other, "DIA_Garond_Running_10_03"); //你 该 出 发 去 寻 找 矿 场 了 。 我 急 需 知 道 关 于 矿 石 产 出 的 情 况 。
	};
};

// ************************************************************
// Gorn
// ************************************************************
instance DIA_Garond_Gorn(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Gorn_Condition;
	information		= DIA_Garond_Gorn_Info;
	description		= "我 要 你 让 戈 恩 走 。";
};

func int DIA_Garond_Gorn_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_MiltenOW_Gorn))
	&& (Kapitel == 2)
	&& (Npc_KnowsInfo(other, DIA_Garond_NeedProof)))
	{
		return TRUE;
	};
};

func void DIA_Garond_Gorn_Info()
{
	AI_Output(other, self, "DIA_Garond_Gorn_15_00"); //我 要 你 让 戈 恩 走 。
	AI_Output(self, other, "DIA_Garond_Gorn_10_01"); //我 不 能 让 他 走 。 他 被 指 控 多 项 犯 罪 ， 而 且 必 须 要 弥 补 。
	AI_Output(other, self, "DIA_Garond_Gorn_15_02"); //能 让 我 支 付 他 的 罚 款 吗 ？
	AI_Output(self, other, "DIA_Garond_Gorn_10_03"); //这 也 许 有 可 能 - 不 过 当 然 不 会 便 宜 。 我 需 要 1 0 0 0 金 币 换 戈 恩 。
	AI_Output(other, self, "DIA_Garond_Gorn_15_04"); //那 是 一 大 笔 钱 。
	AI_Output(self, other, "DIA_Garond_Gorn_10_05"); //戈 恩 要 负 责 的 东 西 也 很 多 。 给 我 带 来 金 子 ， 我 就 会 让 戈 恩 自 由 。

	MIS_RescueGorn = LOG_RUNNING;
	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_5);
};

// ************************************************************
// Gorn freikaufen
// ************************************************************
instance DIA_Garond_Pay(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 4;
	condition		= DIA_Garond_Pay_Condition;
	information		= DIA_Garond_Pay_Info;
	permanent		= TRUE;
	description		= "我 愿 意 换 取 戈 恩 的 自 由 。 （ 付 １ ０ ０ ０ 金 币 ）";
};

func int DIA_Garond_Pay_Condition()
{
	if ((MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Garond_Kerkerauf == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Garond_Pay_Info()
{
	AI_Output(other, self, "DIA_Garond_Pay_15_00"); //我 想 买 戈 恩 的 自 由 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 1000))
	{
		AI_Output(self, other, "DIA_Garond_Pay_10_01"); //行 。 你 可 以 去 告 诉 盖 洛 德 ， 要 他 按 我 的 命 令 释 放 戈 恩 。

		Garond_Kerkerauf = TRUE;
		B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_6);
	}
	else
	{
		AI_Output(self, other, "DIA_Garond_Pay_10_02"); //然 后 给 我 1 0 0 0 金 币 。
	};
};

// ************************************************************
// Info Perm in Kap.2
// ************************************************************
instance DIA_Garond_Perm2(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 9;
	condition		= DIA_Garond_Perm2_Condition;
	information		= DIA_Garond_Perm2_Info;
	permanent		= TRUE;
	description		= "你 现 在 打 算 做 什 么 ？";
};

func int DIA_Garond_Perm2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garond_Success)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Garond_Perm2_Info()
{
	AI_Output(other, self, "DIA_Garond_Perm2_15_00"); //你 现 在 打 算 做 什 么 ？
	AI_Output(self, other, "DIA_Garond_Perm2_10_01"); //我 试 过 所 有 的 方 法 了 。 现 在 ， 你 是 我 唯 一 的 希 望 - 那 样 哈 根 勋 爵 将 给 我 派 来 增 援 。
	AI_Output(self, other, "DIA_Garond_Perm2_10_02"); //我 们 将 继 续 抵 抗 ， 并 向 英 诺 斯 祈 求 不 要 让 我 们 在 这 黑 暗 的 时 光 中 失 去 希 望 。
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Garond_KAP3_EXIT(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 999;
	condition		= DIA_Garond_KAP3_EXIT_Condition;
	information		= DIA_Garond_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garond_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGibtsNeues
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_WASGIBTSNEUES(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 30;
	condition		= DIA_Garond_WASGIBTSNEUES_Condition;
	information		= DIA_Garond_WASGIBTSNEUES_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_Garond_WASGIBTSNEUES_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Garond_WASGIBTSNEUES_Info()
{
	AI_Output(other, self, "DIA_Garond_WASGIBTSNEUES_15_00"); //有 什 么 新 消 息 ？
	AI_Output(self, other, "DIA_Garond_WASGIBTSNEUES_10_01"); //该 死 。 你 在 这 里 捣 什 么 乱 ？ 我 需 要 该 死 的 增 援 ！
	AI_Output(self, other, "DIA_Garond_WASGIBTSNEUES_10_02"); //就 连 米 尔 腾 都 已 经 离 开 城 堡 了 。 而 我 不 是 需 要 一 两 个 人 - 我 需 要 更 多 ！
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Garond_KAP4_EXIT(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 999;
	condition		= DIA_Garond_KAP4_EXIT_Condition;
	information		= DIA_Garond_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garond_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_BACKINKAP4(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 12;
	condition		= DIA_Garond_BACKINKAP4_Condition;
	information		= DIA_Garond_BACKINKAP4_Info;
	description		= "我 回 来 了 。";
};

func int DIA_Garond_BACKINKAP4_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Garond_BACKINKAP4_Info()
{
	AI_Output(other, self, "DIA_Garond_BACKINKAP4_15_00"); //我 回 来 了 。
	AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_01"); //我 自 己 能 看 见 。 增 援 在 哪 里 ？
	AI_Output(other, self, "DIA_Garond_BACKINKAP4_15_02"); //哈 根 勋 爵 安 顿 好 所 有 的 事 情 后 就 会 来 。 发 生 了 很 多 事 。
	AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_03"); //我 不 在 乎 。 我 需 要 部 队 。 兽 人 越 来 越 多 ， 我 们 已 经 支 撑 不 了 多 久 了 。
	AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_04"); //我 的 人 都 已 经 疲 惫 不 堪 ， 而 且 我 们 的 储 备 快 用 完 了 。
	AI_Output(other, self, "DIA_Garond_BACKINKAP4_15_05"); //已 经 有 一 些 志 愿 兵 来 了 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_06"); //你 是 说 你 自 己 和 你 的 龙 猎 手 们 ， 是 吗 ？ 你 们 可 以 帮 助 我 们 ， 但 是 你 们 远 远 不 够 。
	}
	else
	{
		AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_07"); //你 是 说 外 面 院 子 里 的 那 些 龙 猎 手 ？ 他 们 也 许 能 帮 助 我 们 ， 但 他 们 还 是 不 够 。
	};

	AI_Output(self, other, "DIA_Garond_BACKINKAP4_10_08"); //如 果 哈 根 不 马 上 派 一 些 人 来 ， 我 不 能 作 出 任 何 保 证 。

	B_InitNpcGlobals(); // Joly: zur Sicherheit

	//	Angar wird zum Stonehenge geschickt
	// -----------------------------------------
	AI_Teleport(DJG_Angar, "OW_DJG_WATCH_STONEHENGE_01");
	B_StartOtherRoutine(DJG_Angar, "Start");
	DJG_Angar_SentToStones = TRUE;

	// Die Drachenjäger vom Spielstart verziehen sich in ihr Lager.
	// -----------------------------------------
	B_StartOtherRoutine(Kjorn, "START");
	B_StartOtherRoutine(Godar, "START");
	B_StartOtherRoutine(Hokurn, "START");
	B_StartOtherRoutine(PC_Fighter_DJG, "START");
	B_StartOtherRoutine(Kurgan, "START");

	if (DJG_BiffParty == FALSE)
	{
		B_StartOtherRoutine(Biff, "START");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DragonPlettBericht
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_DragonPlettBericht(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 11;
	condition		= DIA_Garond_DragonPlettBericht_Condition;
	information		= DIA_Garond_DragonPlettBericht_Info;
	permanent		= TRUE;
	description		= "关 于 龙 … …";
};

var int DIA_Garond_DragonPlettBericht_NoPerm;
func int DIA_Garond_DragonPlettBericht_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Garond_BACKINKAP4))
	&& (DIA_Garond_DragonPlettBericht_NoPerm == FALSE))
	{
		return TRUE;
	};
};

var int Garond_DragonCounter;
var int Garond_SwampdragonKilled_OneTime;
var int Garond_RockdragonKilled_OneTime;
var int Garond_FireDragonKilled_OneTime;
var int Garond_IcedragonKilled_OneTime;
var int Garond_OricExperte_OneTime;
func void DIA_Garond_DragonPlettBericht_Info()
{
	B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_3);

	if (Garond_DragonCounter < MIS_KilledDragons)
	{
		AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_00"); //我 已 经 得 到 一 些 关 于 龙 的 消 息 了 。
		AI_Output(self, other, "DIA_Garond_DragonPlettBericht_10_01"); //报 告 。

		var int CurrentDragonCount;
		var int Drachengeld;
		var int XP_LocalGarond;

		CurrentDragonCount = 0; // Joly: funzt sonst nicht. Keine Ahnung warum!

		if ((Npc_IsDead(Swampdragon))
		&& (Garond_SwampdragonKilled_OneTime == FALSE))
		{
			AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_02"); //我 杀 死 了 东 边 的 那 片 沼 泽 里 的 龙 。
			Garond_SwampdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		if ((Npc_IsDead(Rockdragon))
		&& (Garond_RockdragonKilled_OneTime == FALSE))
		{
			AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_03"); //南 边 岩 石 堡 垒 里 的 龙 死 了 。
			Garond_RockdragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		if ((Npc_IsDead(FireDragon))
		&& (Garond_FireDragonKilled_OneTime == FALSE))
		{
			AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_04"); //南 边 火 山 上 的 火 龙 将 不 会 再 带 来 灾 难 。
			Garond_FireDragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		if ((Npc_IsDead(Icedragon))
		&& (Garond_IcedragonKilled_OneTime == FALSE))
		{
			AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_05"); //我 去 了 西 部 的 冰 雪 地 带 ， 杀 死 了 那 里 的 龙 。
			Garond_IcedragonKilled_OneTime = TRUE;
			CurrentDragonCount = (CurrentDragonCount + 1);
		};

		AI_Output(self, other, "DIA_Garond_DragonPlettBericht_10_06"); //真 是 好 消 息 。 给 。 我 会 给 你 一 笔 钱 让 你 更 换 装 备 。

		DrachenGeld = (CurrentDragonCount * Garond_KilledDragonGeld);
		XP_LocalGarond = (CurrentDragonCount * XP_Garond_KilledDragon);

		B_GivePlayerXP(XP_LocalGarond);

		CreateInvItems(self, ItMi_Gold, DrachenGeld);
		B_GiveInvItems(self, other, ItMi_Gold, DrachenGeld);

		Garond_DragonCounter = MIS_KilledDragons;

		if (MIS_AllDragonsDead == TRUE)
		{
			DIA_Garond_DragonPlettBericht_NoPerm = TRUE;
		};
	};

	if ((Garond_OricExperte_OneTime == FALSE)
	&& ((Npc_IsDead(Oric)) == FALSE)
	&& (MIS_AllDragonsDead == FALSE))
	{
		AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_07"); //你 能 给 我 更 多 关 于 龙 的 消 息 吗 ？
		AI_Output(self, other, "DIA_Garond_DragonPlettBericht_10_08"); //我 还 担 心 其 它 的 事 情 。 关 于 这 个 问 题 ， 我 的 战 略 官 员 奥 里 克 可 以 告 诉 你 更 多 。
		B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_4);
		Garond_OricExperte_OneTime = TRUE;
	}
	else if (MIS_AllDragonsDead == FALSE)
	{
		AI_Output(other, self, "DIA_Garond_DragonPlettBericht_15_09"); //在 这 期 间 又 有 龙 在 袭 击 吗 ？
		AI_Output(self, other, "DIA_Garond_DragonPlettBericht_10_10"); //很 幸 运 ， 没 有 。 他 们 暂 时 没 有 靠 近 。
	};
};

//*********************************************************************
//	Ich habe alle drachen getötet
//*********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info BackInKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_AllDragonDead(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 12;
	condition		= DIA_Garond_AllDragonDead_Condition;
	information		= DIA_Garond_AllDragonDead_Info;
	description		= "所 有 的 龙 都 死 了 。";
};

func int DIA_Garond_AllDragonDead_Condition()
{
	if ((MIS_AllDragonsDead == TRUE)
	&& (DIA_Garond_DragonPlettBericht_NoPerm == TRUE)
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Garond_AllDragonDead_Info()
{
	AI_Output(other, self, "DIA_Garond_AllDragonDead_15_00"); //所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Garond_AllDragonDead_10_01"); //（ 怀 疑 的 ） 它 们 全 部 ？ 那 么 邪 恶 被 彻 底 消 灭 了 ？
	AI_Output(other, self, "DIA_Garond_AllDragonDead_15_02"); //唉 ， 不 ， 还 没 有 。 它 们 的 首 领 还 活 着 。
	AI_Output(self, other, "DIA_Garond_AllDragonDead_10_03"); //龙 不 是 兽 人 的 首 领 吗 ？
	AI_Output(other, self, "DIA_Garond_AllDragonDead_15_04"); //是 ， 是 这 样 ， 但 他 们 也 有 自 己 的 主 人 。 我 们 同 样 要 除 掉 他 。
	AI_Output(self, other, "DIA_Garond_AllDragonDead_10_05"); //我 真 的 不 能 去 。 我 必 须 守 卫 这 些 矿 石 ， 而 且 那 些 该 死 的 兽 人 还 在 附 近 。
	AI_Output(self, other, "DIA_Garond_AllDragonDead_10_06"); //你 必 须 一 个 人 去 完 成 那 件 事 。 我 不 能 帮 你 。
	AI_Output(self, other, "DIA_Garond_AllDragonDead_10_07"); //愿 英 诺 斯 保 护 你 。
};

///////////////////////////////////////////////////////////////////////
//	Mission JanBecomeSmith
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_JanBecomeSmith(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 12;
	condition		= DIA_Garond_JanBecomeSmith_Condition;
	information		= DIA_Garond_JanBecomeSmith_Info;
	permanent		= TRUE;
	description		= "铁 匠 那 里 有 一 个 难 题 。";
};

func int DIA_Garond_JanBecomeSmith_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_RUNNING)
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Garond_JanBecomeSmith_Info()
{
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_00"); //铁 匠 那 里 有 一 个 难 题 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_01"); //什 么 铁 匠 ？ 他 已 经 消 失 在 森 林 里 了 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_02"); //他 回 来 了 吗 ？ 那 么 ， 你 可 以 告 诉 他 … …
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_03"); //不 ， 我 是 说 简 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_04"); //他 跟 我 一 样 是 个 龙 猎 手 ， 也 是 个 不 错 的 铁 匠 。
	}
	else
	{
		AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_05"); //龙 猎 手 之 一 。 他 是 个 铁 匠 。
	};

	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_06"); //很 好 。 我 们 先 前 的 那 个 铁 匠 已 经 逃 走 了 ， 那 个 胆 小 鬼 。
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_07"); //简 会 很 乐 意 接 管 这 个 铁 匠 铺 的 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_08"); //我 知 道 。 那 么 你 认 为 我 可 以 信 任 他 。
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_15_09"); //是 的 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_10"); //如 果 你 这 么 肯 定 ， 那 你 可 以 给 他 担 保 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_10_11"); //如 果 他 惹 了 什 么 麻 烦 ， 你 将 为 此 负 责 。 同 意 吗 ？

	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	Info_AddChoice(DIA_Garond_JanBecomeSmith, "我 会 考 虑 的 。", DIA_Garond_JanBecomeSmith_No);
	Info_AddChoice(DIA_Garond_JanBecomeSmith, "我 来 为 简 担 保 。", DIA_Garond_JanBecomeSmith_Yes);
};

func void DIA_Garond_JanBecomeSmith_No()
{
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_No_15_00"); //我 会 考 虑 的 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_No_10_01"); //如 果 连 你 都 不 信 的 话 ， 我 又 怎 么 能 相 信 他 ？
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_No_10_02"); //没 有 人 支 持 他 的 话 ， 这 个 简 就 不 能 干 铸 造 这 份 活 儿 。

	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
};

func void DIA_Garond_JanBecomeSmith_Yes()
{
	AI_Output(other, self, "DIA_Garond_JanBecomeSmith_Yes_15_00"); //我 来 为 简 担 保 。
	AI_Output(self, other, "DIA_Garond_JanBecomeSmith_Yes_10_01"); //好 吧 。 他 可 以 使 用 这 个 铁 匠 铺 。 当 然 ， 他 还 必 须 为 我 的 人 提 供 剑 。

	Info_ClearChoices(DIA_Garond_JanBecomeSmith);
	MIS_JanBecomesSmith = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Garond_KAP5_EXIT(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 999;
	condition		= DIA_Garond_KAP5_EXIT_Condition;
	information		= DIA_Garond_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garond_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm5
///////////////////////////////////////////////////////////////////////
instance DIA_Garond_PERM5(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 59;
	condition		= DIA_Garond_PERM5_Condition;
	information		= DIA_Garond_PERM5_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Garond_PERM5_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Garond_PERM5_Info()
{
	AI_Output(other, self, "DIA_Garond_PERM5_15_00"); //状 况 怎 么 样 ？

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Garond_PERM5_10_01"); //真 是 一 团 糟 ！ 有 个 畜 生 把 大 门 敞 开 了 。 现 在 我 们 只 能 变 成 了 喂 狼 的 饲 料 了 。
		AI_Output(self, other, "DIA_Garond_PERM5_10_02"); //当 我 抓 住 那 个 叛 徒 的 时 候 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Garond_PERM5_10_03"); //如 果 哈 根 不 马 上 来 的 话 ， 我 们 全 都 会 死 。
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Garond_KAP6_EXIT(C_INFO)
{
	npc				= PAL_250_Garond;
	nr				= 999;
	condition		= DIA_Garond_KAP6_EXIT_Condition;
	information		= DIA_Garond_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garond_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Garond_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
