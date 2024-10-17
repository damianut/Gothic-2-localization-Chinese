// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Andre_EXIT(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 999;
	condition		= DIA_Andre_EXIT_Condition;
	information		= DIA_Andre_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Andre_EXIT_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Andre_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Andre_FIRSTEXIT(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 999;
	condition		= DIA_Andre_FIRSTEXIT_Condition;
	information		= DIA_Andre_FIRSTEXIT_Info;
	description		= DIALOG_ENDE;
};

func int DIA_Andre_FIRSTEXIT_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTEXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
	B_StartOtherRoutine(Wulfgar, "START");
};

// ************************************************************
// 	  				   		Steckbrief
// ************************************************************
var int Andre_Steckbrief; // damit es nur EINMAL kommt
// ------------------------

func void B_Andre_Steckbrief()
{
	AI_Output(self, other, "DIA_Andre_Add_08_00"); //我 的 人 说 ， 强 盗 之 间 正 在 传 递 画 有 你 的 头 像 的 通 缉 海 报 。
	AI_Output(self, other, "DIA_Andre_Add_08_01"); //他 也 说 你 首 先 否 定 了 那 个 。
	AI_Output(self, other, "DIA_Andre_Add_08_02"); //那 么 究 竟 是 为 了 什 么 ？
	AI_Output(other, self, "DIA_Andre_Add_15_03"); //我 不 知 道 那 些 家 伙 为 什 么 要 找 我 … …
	AI_Output(self, other, "DIA_Andre_Add_08_04"); //我 希 望 你 为 自 己 着 想 ， 说 的 是 实 话 。
	AI_Output(self, other, "DIA_Andre_Add_08_05"); //我 不 能 让 任 何 没 有 清 白 记 录 的 人 加 入 民 兵 。
	AI_Output(self, other, "DIA_Andre_Add_08_06"); //这 些 强 盗 大 部 分 是 以 前 矿 井 流 放 地 的 囚 犯 。
	AI_Output(self, other, "DIA_Andre_Add_08_07"); //我 只 希 望 你 没 有 在 任 何 方 面 与 那 些 杀 人 犯 牵 扯 在 一 起 ！
	Andre_Steckbrief = TRUE;
};

// ************************************************************
// 	  				   	Canthar Falle
// ************************************************************
var int Andre_CantharFalle; // damit es nur EINMAL kommt
// ------------------------

func void B_Andre_CantharFalle()
{
	AI_Output(self, other, "B_Andre_CantharFalle_08_00"); //雇 佣 兵 坎 萨 在 这 里 。 他 说 你 是 从 矿 井 流 放 地 逃 出 来 的 罪 犯 。
	AI_Output(self, other, "B_Andre_CantharFalle_08_01"); //我 不 知 道 那 是 否 是 真 的 ， 而 且 我 也 不 想 问 你 ， 但 是 你 应 该 澄 清 那 件 事 。

	B_RemoveNpc(Sarah);

	B_StartOtherRoutine(Canthar, "MARKTSTAND");
	AI_Teleport(Canthar, "NW_CITY_SARAH");

	if ((Canthar_Sperre == FALSE)
	&& (Canthar_Pay == FALSE))
	{
		Canthar_Sperre = TRUE;
	};

	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();

	Andre_CantharFalle = TRUE;
};

// ************************************************************
// 			Canthar Falle als INFO (niedrige Important)
// ************************************************************
instance DIA_Andre_CantharFalle(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 3;
	condition		= DIA_Andre_CantharFalle_Condition;
	information		= DIA_Andre_CantharFalle_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Andre_CantharFalle_Condition()
{
	if ((MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2)
	&& (Andre_CantharFalle == FALSE))
	{
		return TRUE;
	};

	if ((Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE))
	{
		return TRUE;
	};
};

func int DIA_Andre_CantharFalle_Info()
{
	if (Andre_Steckbrief == FALSE)
	{
		B_Andre_Steckbrief();
	};

	if ((Andre_CantharFalle == FALSE)
	&& (MIS_Canthars_KomproBrief_Day <= Wld_GetDay() - 2))
	{
		B_Andre_CantharFalle();
	};
};

// ************************************************************
// 					Petzmaster: Schulden offen
// ************************************************************

// ---------------------------
var int Andre_LastPetzCounter;
var int Andre_LastPetzCrime;
// ---------------------------
instance DIA_Andre_PMSchulden(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_PMSchulden_Condition;
	information		= DIA_Andre_PMSchulden_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Andre_PMSchulden_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Andre_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Andre_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Andre_PMSchulden_Info()
{
	AI_Output(self, other, "DIA_Andre_PMSchulden_08_00"); //你 是 来 付 你 的 罚 金 吗 ？

	// ------ STECKBRIEF ------
	if ((Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};

	// ------- CANTHAR -------
	if ((MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
	&& (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};

	if (B_GetTotalPetzCounter(self) > Andre_LastPetzCounter)
	{
		AI_Output(self, other, "DIA_Andre_PMSchulden_08_01"); //我 早 已 问 过 自 己 ， 你 是 否 还 敢 来 这 里 ！
		AI_Output(self, other, "DIA_Andre_PMSchulden_08_02"); //显 然 ， 针 对 你 的 指 控 又 增 加 了 ！
		if (Andre_Schulden < 1000)
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_03"); //我 警 告 你 ！ 你 现 在 需 要 支 付 的 罚 金 数 目 更 高 了 ！
			AI_Output(other, self, "DIA_Andre_PMAdd_15_00"); //多 少 钱 ？

			var int diff; diff = (B_GetTotalPetzCounter(self) - Andre_LastPetzCounter);

			if (diff > 0)
			{
				Andre_Schulden = Andre_Schulden + (diff * 50);
			};

			if (Andre_Schulden > 1000) { Andre_Schulden = 1000; };
			B_Say_Gold(self, other, Andre_Schulden);
		}
		else
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_04"); //你 让 我 感 到 十 分 失 望 ！
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Andre_LastPetzCrime)
	{
		AI_Output(self, other, "DIA_Andre_PMSchulden_08_05"); //发 生 了 一 些 新 的 事 情 。

		if (Andre_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_06"); //突 然 ， 没 有 任 何 人 再 指 控 你 谋 杀 了 。
		};

		if ((Andre_LastPetzCrime == CRIME_THEFT)
		|| ((Andre_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_07"); //没 人 再 记 得 是 否 见 过 你 偷 窃 。
		};

		if ((Andre_LastPetzCrime == CRIME_ATTACK)
		|| ((Andre_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_08"); //不 再 有 任 何 目 击 证 人 指 证 你 曾 经 涉 及 斗 殴 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_09"); //很 显 然 ， 所 有 针 对 你 的 指 控 都 已 经 被 清 除 了 。
		};

		AI_Output(self, other, "DIA_Andre_PMSchulden_08_10"); //我 不 知 道 那 是 怎 么 发 生 的 ， 但 是 我 警 告 你 ： 别 想 敷 衍 我 。

		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_11"); //无 论 如 何 ， 我 已 经 决 定 免 除 你 的 罪 过 。
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_12"); //你 要 保 证 不 再 卷 入 任 何 麻 烦 。

			Andre_Schulden = 0;
			Andre_LastPetzCounter = 0;
			Andre_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_13"); //我 还 要 明 确 一 件 事 ： 无 论 如 何 你 都 要 必 须 支 付 全 额 的 罚 金 。
			B_Say_Gold(self, other, Andre_Schulden);
			AI_Output(self, other, "DIA_Andre_PMSchulden_08_14"); //那 么 它 是 什 么 ？
		};
	};

	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Andre_PMSchulden);
		Info_ClearChoices(DIA_Andre_PETZMASTER);
		Info_AddChoice(DIA_Andre_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Andre_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Andre_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Andre_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
		{
			Info_AddChoice(DIA_Andre_PMSchulden, "我 想 要 支 付 罚 金。", DIA_Andre_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Andre_PMSchulden_HowMuchAgain()
{
	AI_Output(other, self, "DIA_Andre_PMSchulden_HowMuchAgain_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Andre_Schulden);

	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Andre_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Andre_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Andre_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PMSchulden, "我 想 要 支 付 罚 金。", DIA_Andre_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Andre_PETZMASTER) ###

// ************************************************************
// 			  			 PETZ-MASTER
// ************************************************************
instance DIA_Andre_PETZMASTER(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_PETZMASTER_Condition;
	information		= DIA_Andre_PETZMASTER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Andre_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Andre_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Andre_PETZMASTER_Info()
{
	Andre_Schulden = 0; // weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...

	// ------ SC hat mit Andre noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_00"); //你 一 定 是 那 个 在 城 里 惹 麻 烦 的 家 伙 。
	};

	// ------ STECKBRIEF ------
	if ((Pablo_AndreMelden == TRUE)
	&& (!Npc_IsDead(Pablo))
	&& (Andre_Steckbrief == FALSE))
	{
		B_Andre_Steckbrief();
	};

	// ------- CANTHAR -------
	if ((MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() - 2))
	&& (Andre_CantharFalle == FALSE))
	{
		B_Andre_CantharFalle();
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_01"); //你 能 在 所 有 事 情 都 越 发 不 利 于 你 之 前 来 找 我 ， 真 是 很 明 智 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_02"); //谋 杀 是 重 罪 ！
		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
		Andre_Schulden = Andre_Schulden + 500; // PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Andre_PETZMASTER_08_03"); //更 不 用 说 你 所 做 的 其 它 事 情 了 。
		};

		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_04"); //守 卫 的 命 令 是 当 场 处 决 每 一 个 谋 杀 犯 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_05"); //大 多 数 市 民 都 不 会 容 忍 城 市 中 有 谋 杀 犯 ！
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_06"); //我 不 想 绞 死 你 。 我 们 正 处 于 战 争 之 中 ， 我 们 需 要 每 一 个 人 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_07"); //但 是 让 人 们 再 次 认 可 你 并 不 容 易 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_08"); //你 可 以 通 过 支 付 罚 金 来 表 示 你 的 悔 恨 - 当 然 ， 它 一 定 会 很 高 昂 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_09"); //你 能 来 很 好 ！ 你 被 指 控 盗 窃 ！ 有 目 击 证 人 ！
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Andre_PETZMASTER_08_10"); //我 不 会 提 起 我 听 说 的 其 它 事 情 。
		};

		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_11"); //我 不 能 容 忍 在 城 市 里 有 这 样 的 行 为 ！
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_12"); //你 必 须 支 付 罚 金 来 弥 补 你 的 罪 行 .！

		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_13"); //如 果 你 在 港 口 和 民 众 争 斗 的 话 ， 只 会 发 生 一 件 事 … …
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_14"); //但 是 当 你 攻 击 市 民 或 者 国 王 的 士 兵 的 时 候 ， 我 一 定 会 让 你 接 受 审 判 。
		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Andre_PETZMASTER_08_15"); //那 些 小 事 情 真 的 不 必 要 。
		};

		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_16"); //如 果 我 让 你 逃 脱 处 罚 的 话 ， 很 快 这 里 所 有 的 人 都 会 为 所 欲 为 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_17"); //所 以 ， 你 要 支 付 适 量 的 罚 金 - 然 后 那 件 事 就 会 被 淡 忘 。

		Andre_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_18"); //我 听 说 你 在 杀 我 们 的 绵 羊 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_19"); //你 知 道 我 不 会 不 管 。
		AI_Output(self, other, "DIA_Andre_PETZMASTER_08_20"); //你 必 须 支 付 赔 偿 金 ！

		Andre_Schulden = 100;
	};

	AI_Output(other, self, "DIA_Andre_PETZMASTER_15_21"); //多 少 ？

	if (Andre_Schulden > 1000) { Andre_Schulden = 1000; };
	B_Say_Gold(self, other, Andre_Schulden);

	Info_ClearChoices(DIA_Andre_PMSchulden);
	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_AddChoice(DIA_Andre_PETZMASTER, "我 还 没 有 足 够 的 金 子 ！", DIA_Andre_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Andre_Schulden)
	{
		Info_AddChoice(DIA_Andre_PETZMASTER, "我 想 要 支 付 罚 金。", DIA_Andre_PETZMASTER_PayNow);
	};
};

func void DIA_Andre_PETZMASTER_PayNow()
{
	AI_Output(other, self, "DIA_Andre_PETZMASTER_PayNow_15_00"); //我 想 要 支 付 罚 金 ！
	B_GiveInvItems(other, self, itmi_gold, Andre_Schulden);
	AI_Output(self, other, "DIA_Andre_PETZMASTER_PayNow_08_01"); //好 ！ 我 会 确 保 城 市 里 所 有 的 人 都 知 道 - 那 将 恢 复 一 些 你 的 声 誉 。

	B_GrantAbsolution(LOC_CITY);

	Andre_Schulden = 0;
	Andre_LastPetzCounter = 0;
	Andre_LastPetzCrime = CRIME_NONE;

	Info_ClearChoices(DIA_Andre_PETZMASTER);
	Info_ClearChoices(DIA_Andre_PMSchulden); // !!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Andre_PETZMASTER_PayLater()
{
	AI_Output(other, self, "DIA_Andre_PETZMASTER_PayLater_15_00"); //我 没 有 足 够 的 金 币.！
	AI_Output(self, other, "DIA_Andre_PETZMASTER_PayLater_08_01"); //那 就 尽 快 赚 点 钱 。
	AI_Output(self, other, "DIA_Andre_PETZMASTER_PayLater_08_02"); //而 且 我 警 告 你 ： 如 果 你 的 罪 行 再 增 加 的 话 ， 情 况 将 对 你 更 加 不 利.！

	Andre_LastPetzCounter = B_GetTotalPetzCounter(self);
	Andre_LastPetzCrime = B_GetGreatestPetzCrime(self);

	AI_StopProcessInfos(self);
};

// *********************************************************
//							Hallo
// *********************************************************
instance DIA_Andre_Hallo(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_Hallo_Condition;
	information		= DIA_Andre_Hallo_Info;
	important		= TRUE;
};

func int DIA_Andre_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Hallo_Info()
{
	AI_Output(self, other, "DIA_Andre_Hallo_08_00"); //英 诺 斯 与 你 同 在 ， 陌 生 人 ！ 是 什 么 事 情 让 你 来 到 我 这 里 ？
};

// *********************************************************
//					Nachricht für Lord Hagen
// *********************************************************
instance DIA_Andre_Message(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_Message_Condition;
	information		= DIA_Andre_Message_Info;
	description		= "我 给 哈 根 勋 爵 带 来 了 一 条 重 要 的 信 息 。";
};

func int DIA_Andre_Message_Condition()
{
	if ((Kapitel < 3)
	&& ((hero.guild == GIL_NONE)
	|| (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void DIA_Andre_Message_Info()
{
	AI_Output(other, self, "DIA_Andre_Message_15_00"); //我 有 一 条 重 要 的 消 息 需 要 告 诉 哈 根 勋 爵 。
	AI_Output(self, other, "DIA_Andre_Message_08_01"); //嗯 ， 你 正 站 在 是 他 的 人 面 前 。 是 关 于 什 么 的 事 ？

	Info_ClearChoices(DIA_Andre_Message);
	Info_AddChoice(DIA_Andre_Message, "我 必 须 亲 自 告 诉 哈 根 勋 爵 。", DIA_Andre_Message_Personal);
	Info_AddChoice(DIA_Andre_Message, "兽 人 是 由 龙 率 领 的 ！", DIA_Andre_Message_Dragons);
	Info_AddChoice(DIA_Andre_Message, "是 关 于 一 个 神 圣 的 宝 物 - 英 诺 斯 之 眼 。", DIA_Andre_Message_EyeInnos);
};

func void B_Andre_LordHagenNichtZuSprechen()
{
	AI_Output(self, other, "B_Andre_LordHagenNichtZuSprechen_08_00"); //哈 根 勋 爵 只 接 见 圣 骑 士 或 者 那 些 为 圣 骑 士 服 务 的 人 。
	AI_Output(self, other, "B_Andre_LordHagenNichtZuSprechen_08_01"); //在 普 通 人 身 上 浪 费 时 间 有 损 他 的 高 贵 。
};

func void DIA_Andre_Message_EyeInnos()
{
	AI_Output(other, self, "DIA_Andre_Message_EyeInnos_15_00"); //是 关 于 一 个 神 圣 的 宝 物 - 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Andre_Message_EyeInnos_08_01"); //英 诺 斯 之 眼 - 我 从 没 听 说 过 它 。 但 是 那 肯 定 意 味 着 某 些 东 西 。
	AI_Output(self, other, "DIA_Andre_Message_EyeInnos_08_02"); //如 果 真 的 存 在 一 个 宝 物 叫 这 个 名 字 的 话 ， 那 么 只 有 我 们 组 织 中 最 高 级 的 成 员 才 会 知 道 它 。
	AI_Output(other, self, "DIA_Andre_Message_EyeInnos_15_03"); //所 以 我 才 一 定 要 和 哈 根 勋 爵 交 谈 。

	Andre_EyeInnos = TRUE;

	B_Andre_LordHagenNichtZuSprechen();

	Info_ClearChoices(DIA_Andre_Message);
};

func void DIA_Andre_Message_Dragons()
{
	AI_Output(other, self, "DIA_Andre_Message_Dragons_15_00"); //那 些 兽 人 是 由 龙 -
	AI_Output(self, other, "DIA_Andre_Message_Dragons_08_01"); //（ 打 断 ） 我 知 道 兽 人 军 队 正 变 得 更 加 强 大 。
	AI_Output(self, other, "DIA_Andre_Message_Dragons_08_02"); //你 不 会 要 告 诉 我 那 就 是 你 准 备 向 哈 根 勋 爵 报 告 的 事 吧 。
	AI_Output(self, other, "DIA_Andre_Message_Dragons_08_03"); //如 果 你 用 那 样 的 故 事 来 浪 费 他 的 时 间 ， 他 一 定 会 把 你 的 脑 袋 从 肩 膀 上 拧 下 来 。
	AI_Output(self, other, "DIA_Andre_Message_Dragons_08_04"); //而 且 我 肯 定 你 自 己 也 非 常 清 楚.
	AI_Output(self, other, "DIA_Andre_Message_Dragons_08_05"); //那 么 ， 究 竟 是 关 于 什 么 事 ？
};

func void DIA_Andre_Message_Personal()
{
	AI_Output(other, self, "DIA_Andre_Message_Personal_15_00"); //我 必 须 亲 自 告 诉 哈 根 勋 爵 。
	AI_Output(self, other, "DIA_Andre_Message_Personal_08_01"); //随 你 的 便 吧 。 但 是 你 应 该 知 道 一 件 事 情 ：
	B_Andre_LordHagenNichtZuSprechen();

	Info_ClearChoices(DIA_Andre_Message);
};

// *********************************************************
//	Warum seid ihr Paladine in der Stadt?
// *********************************************************
instance DIA_Andre_Paladine(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 3;
	condition		= DIA_Andre_Paladine_Condition;
	information		= DIA_Andre_Paladine_Info;
	description		= "你 们 圣 骑 士 为 什 么 在 镇 上 ？";
};

func int DIA_Andre_Paladine_Condition()
{
	if ((other.guild != GIL_MIL)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladine_Info()
{
	AI_Output(other, self, "DIA_Andre_Paladine_15_00"); //你 们 圣 骑 士 为 什 么 在 镇 上 ？
	AI_Output(self, other, "DIA_Andre_Paladine_08_01"); //我 们 的 任 务 是 个 秘 密 。
	AI_Output(self, other, "DIA_Andre_Paladine_08_02"); //我 只 能 告 诉 你 城 里 的 市 民 不 会 有 任 何 危 险 。
	AI_Output(self, other, "DIA_Andre_Paladine_08_03"); //你 不 用 担 心 。
};

// *********************************************************
//	Warum seid ihr Paladine in der Stadt?
// *********************************************************
instance DIA_Andre_PaladineAgain(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 3;
	condition		= DIA_Andre_PaladineAgain_Condition;
	information		= DIA_Andre_PaladineAgain_Info;
	description		= "你 们 圣 骑 士 为 什 么 在 镇 上 ？";
};

func int DIA_Andre_PaladineAgain_Condition()
{
	if ((other.guild == GIL_MIL)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_PaladineAgain_Info()
{
	if (Npc_KnowsInfo(other, DIA_Andre_Paladine))
	{
		AI_Output(other, self, "DIA_Andre_PaladineAgain_15_00"); //你 现 在 能 告 诉 我 你 们 圣 骑 士 为 什 么 要 来 克 霍 里 尼 斯 吗 ？
	}
	else
	{
		AI_Output(other, self, "DIA_Andre_PaladineAgain_15_01"); //你 们 圣 骑 士 为 什 么 在 镇 上 ？
	};

	AI_Output(self, other, "DIA_Andre_PaladineAgain_08_02"); //现 在 你 属 于 城 市 卫 兵 ， 所 以 你 也 要 服 从 圣 骑 士 。
	AI_Output(self, other, "DIA_Andre_PaladineAgain_08_03"); //现 在 我 能 够 相 信 你 。
	AI_Output(self, other, "DIA_Andre_PaladineAgain_08_04"); //我 们 接 受 了 国 王 罗 巴 尔 的 一 个 任 务 。 在 屏 障 崩 溃 之 后 ， 矿 石 运 送 已 经 中 断 了 。
	AI_Output(self, other, "DIA_Andre_PaladineAgain_08_05"); //因 此 ， 我 们 要 拿 到 矿 石 ， 并 把 它 送 到 大 陆 去 。 有 了 矿 石 ， 我 们 就 可 以 铸 造 新 的 武 器 ， 并 将 兽 人 赶 走 。

	KnowsPaladins_Ore = TRUE;
};

// *********************************************************
//						AskToJoin
// *********************************************************
instance DIA_Andre_AskToJoin(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_AskToJoin_Condition;
	information		= DIA_Andre_AskToJoin_Info;
	description		= "我 要 为 圣 骑 士 服 务 ！";
};

func int DIA_Andre_AskToJoin_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_AskToJoin_Info()
{
	AI_Output(other, self, "DIA_Andre_AskToJoin_15_00"); //我 要 为 圣 骑 士 服 务 ！

	if (Npc_KnowsInfo(other, DIA_Andre_Message))
	{
		AI_Output(self, other, "DIA_Andre_AskToJoin_08_01"); //好 。 我 这 里 需 要 每 一 个 能 干 的 人 。 无 论 他 加 入 我 们 的 原 因 是 什 么 。
		AI_Output(self, other, "DIA_Andre_AskToJoin_08_02"); //如 果 你 打 算 为 圣 骑 士 服 务 的 话 ， 我 将 会 帮 助 你 觐 见 哈 根 勋 爵 。
	}
	else
	{
		AI_Output(self, other, "DIA_Andre_AskToJoin_08_03"); //一 个 高 贵 的 请 求 。
	};

	AI_Output(self, other, "DIA_Andre_AskToJoin_08_04"); //然 而 ， 我 的 命 令 是 只 能 接 受 镇 上 的 市 民 加 入 民 兵 。
	AI_Output(self, other, "DIA_Andre_AskToJoin_08_05"); //我 的 指 挥 官 担 心 间 谍 和 破 坏 分 子 潜 入 。
	AI_Output(self, other, "DIA_Andre_AskToJoin_08_06"); //他 想 通 过 这 样 的 手 段 来 降 低 风 险 。
	AI_Output(self, other, "DIA_Andre_AskToJoin_08_07"); //因 此 ， 你 必 须 首 先 成 为 镇 上 的 市 民 - 这 条 规 定 是 否 有 意 义 尚 待 商 讨 ， 不 过 命 令 归 命 令 。

	Log_CreateTopic(TOPIC_BecomeMIL, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeMIL, LOG_RUNNING);
	B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_1);
};

// *********************************************************
//						About Miliz
// *********************************************************
instance DIA_Andre_AboutMiliz(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 5;
	condition		= DIA_Andre_AboutMiliz_Condition;
	information		= DIA_Andre_AboutMiliz_Info;
	description		= "我 能 期 待 民 兵 做 些 什 么 呢 ？";
};

func int DIA_Andre_AboutMiliz_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Npc_KnowsInfo(other, DIA_Andre_AskToJoin)))
	{
		return TRUE;
	};
};

func void DIA_Andre_ABOUTMILIZ_Info()
{
	AI_Output(other, self, "DIA_Andre_AboutMiliz_15_00"); //我 能 期 待 民 兵 做 些 什 么 呢 ？
	AI_Output(self, other, "DIA_Andre_AboutMiliz_08_01"); //让 我 说 明 一 件 事 。 作 为 民 兵 成 员 ， 不 仅 仅 是 穿 上 制 服 在 城 市 里 巡 逻 。
	AI_Output(self, other, "DIA_Andre_AboutMiliz_08_02"); //这 是 一 件 肮 脏 甚 至 血 腥 的 工 作 。 一 旦 你 成 为 我 们 一 员 ， 会 有 大 量 的 工 作 等 着 你 。
	AI_Output(self, other, "DIA_Andre_AboutMiliz_08_03"); //但 这 是 值 得 的 。 除 去 薪 水 不 说 ， 有 一 天 你 甚 至 有 机 会 成 为 神 圣 的 英 诺 斯 的 战 士 。
};

///////////////////////////////////////////////////////////////////////
//	Info MartinEmpfehlung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MartinEmpfehlung(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Addon_Andre_MartinEmpfehlung_Condition;
	information		= DIA_Addon_Andre_MartinEmpfehlung_Info;
	description		= "看 ， 我 有 一 封 由 你 们 的 补 给 官 员 写 的 推 荐 信 。";
};

func int DIA_Addon_Andre_MartinEmpfehlung_Condition()
{
	if ((Npc_HasItems(other, ItWr_Martin_MilizEmpfehlung_Addon))
	&& (Npc_KnowsInfo(other, DIA_Andre_AskToJoin)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MartinEmpfehlung_Info()
{
	AI_Output(other, self, "DIA_Addon_Andre_MartinEmpfehlung_15_00"); //看 ， 我 有 一 封 由 你 们 的 补 给 官 员 写 的 推 荐 信 。
	AI_Output(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_01"); //（ 不 相 信 的 ） 什 么 ？ 让 我 看 看 。
	B_GiveInvItems(other, self, ItWr_Martin_MilizEmpfehlung_Addon, 1);
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_02"); //（ 引 人 注 目 的 ） 嗯 ， 我 要 … … ！ 你 一 定 尽 相 当 大 的 努 力 。 能 从 马 丁 那 里 得 到 这 样 的 东 西 绝 对 不 是 简 单 的 小 事 。
	AI_Output(self, other, "DIA_Addon_Andre_MartinEmpfehlung_08_03"); //好 吧 。 我 相 信 。 如 果 马 丁 担 保 你 的 话 ， 我 将 让 你 加 入 。 你 准 备 好 的 时 候 就 告 诉 我 。
	Andre_Knows_MartinEmpfehlung = TRUE;
};

// *********************************************************
//						Alternative // e2
// *********************************************************
instance DIA_Andre_Alternative(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_Alternative_Condition;
	information		= DIA_Andre_Alternative_Info;
	description		= "有 没 有 快 点 的 方 法 加 入 你 们 ？";
};

func int DIA_Andre_Alternative_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Andre_AskToJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Alternative_Info()
{
	AI_Output(other, self, "DIA_Andre_Alternative_15_00"); //有 没 有 快 点 的 方 法 加 入 你 们 ？
	AI_Output(self, other, "DIA_Andre_Alternative_08_01"); //嗯 （ 短 暂 的 中 断 ） - 你 真 的 认 真 考 虑 过 这 件 事 了 ， 是 吗 ？
	AI_Output(self, other, "DIA_Andre_Alternative_08_02"); //好 ， 听 着 。 我 有 一 个 难 题 。 如 果 你 帮 我 解 决 的 话 ， 我 保 证 会 你 加 入 民 兵 。
	AI_Output(self, other, "DIA_Andre_Alternative_08_03"); //但 是 最 重 要 的 是 ： 你 不 能 对 任 何 人 说 一 句 和 这 件 事 有 关 的 话!
};

// *********************************************************
//						GuildOfThieves // e3
// *********************************************************
instance DIA_Andre_GuildOfThieves(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_GuildOfThieves_Condition;
	information		= DIA_Andre_GuildOfThieves_Info;
	description		= "你 的 难 题 是 什 么 ？";
};

func int DIA_Andre_GuildOfThieves_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Andre_Alternative))
	{
		return TRUE;
	};
};

func void DIA_Andre_GuildOfThieves_Info()
{
	AI_Output(other, self, "DIA_Andre_GuildOfThieves_15_00"); //你 的 难 题 是 什 么 ？
	AI_Output(self, other, "DIA_Andre_GuildOfThieves_08_01"); //最 近 在 城 市 里 出 现 了 大 量 盗 窃 行 为 。 到 现 在 为 止 ， 我 们 没 有 抓 住 一 个 人 ， 这 些 盗 贼 技 艺 高 强 。
	AI_Output(self, other, "DIA_Andre_GuildOfThieves_08_02"); //社 会 最 底 层 的 人 知 道 他 们 的 事 。 我 肯 定 我 们 正 在 对 付 的 是 一 个 有 组 织 的 团 伙 。
	AI_Output(self, other, "DIA_Andre_GuildOfThieves_08_03"); //如 果 在 克 霍 里 尼 斯 有 一 个 盗 贼 公 会 并 不 会 让 我 吃 惊 。 找 到 这 个 团 伙 首 领 ， 并 把 他 们 都 抓 住 。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Andre_GuildOfThieves_08_04"); //那 样 我 将 保 证 让 你 加 入 民 兵 - 不 管 你 是 不 是 一 个 市 民 。
		AI_Output(self, other, "DIA_Andre_GuildOfThieves_08_05"); //但 是 你 绝 对 不 能 泄 露 我 们 之 间 的 协 议 ！
	};

	MIS_Andre_GuildOfThieves = LOG_RUNNING;
	B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_2);
};

// *********************************************************
//						WhereThieves // e4
// *********************************************************
instance DIA_Andre_WhereThieves(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_WhereThieves_Condition;
	information		= DIA_Andre_WhereThieves_Info;
	description		= "我 要 从 哪 里 开 始 找 那 些 贼 ？";
};

func int DIA_Andre_WhereThieves_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhereThieves_Info()
{
	AI_Output(other, self, "DIA_Andre_WhereThieves_15_00"); //我 要 从 哪 里 开 始 找 那 些 贼 ？
	AI_Output(self, other, "DIA_Andre_WhereThieves_08_01"); //如 果 我 知 道 的 话 ， 我 就 自 己 去 了 ！
	AI_Output(self, other, "DIA_Andre_WhereThieves_08_02"); //我 只 能 告 诉 你 这 么 多 ： 我 们 最 近 把 整 个 海 港 地 区 翻 了 个 底 朝 天 ， 但 是 什 么 都 没 找 到 ， 完 全 没 有 线 索 。
	AI_Output(self, other, "DIA_Andre_WhereThieves_08_03"); //那 里 的 人 们 并 不 喜 欢 多 说 话 ， 尤 其 是 当 你 穿 着 圣 骑 士 的 盔 甲 时 。
	AI_Output(self, other, "DIA_Andre_WhereThieves_08_04"); //不 过 你 是 一 个 外 来 人 ， 他 们 不 会 这 么 快 就 怀 疑 你 。
	AI_Output(self, other, "DIA_Andre_WhereThieves_08_05"); //你 可 以 先 在 港 口 四 处 询 问 一 下 。 但 是 要 小 心 ， 如 果 那 里 的 人 知 道 你 正 在 为 圣 骑 士 工 作 ， 那 么 你 将 打 探 不 到 任 何 东 西 ！

	B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_3);
};

// *********************************************************
//						WhatToDo // e4
// *********************************************************
instance DIA_Andre_WhatToDo(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 3;
	condition		= DIA_Andre_WhatToDo_Condition;
	information		= DIA_Andre_WhatToDo_Info;
	description		= "一 旦 我 找 到 其 中 某 个 贼 之 后 要 怎 么 做 ？";
};

func int DIA_Andre_WhatToDo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Andre_GuildOfThieves))
	&& (MIS_Andre_GuildOfThieves == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Andre_WhatToDo_Info()
{
	AI_Output(other, self, "DIA_Andre_WhatToDo_15_00"); //一 旦 我 找 到 其 中 某 个 贼 之 后 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Andre_WhatToDo_08_01"); //如 果 遇 到 一 些 马 屁 精 、 党 羽 和 某 些 无 足 轻 重 的 小 人 物 ， 你 最 好 避 免 打 架 。
	AI_Output(self, other, "DIA_Andre_WhatToDo_08_02"); //找 个 适 当 的 时 候 来 向 我 汇 报 ， 我 负 责 把 那 些 家 伙 关 进 监 狱 。
	AI_Output(self, other, "DIA_Andre_WhatToDo_08_03"); //城 市 卫 兵 会 介 入 公 开 械 斗 ， 而 你 不 会 有 任 何 机 会 告 诉 他 们 所 发 生 的 事 情 。
	AI_Output(self, other, "DIA_Andre_WhatToDo_08_04"); //此 外 ， 你 送 进 监 狱 的 每 一 个 坏 家 伙 都 有 一 笔 奖 金 。
	AI_Output(self, other, "DIA_Andre_WhatToDo_08_05"); //然 而 ， 如 果 你 找 到 了 首 领 的 隐 蔽 所 - 嗯 - 那 你 可 能 无 法 避 免 战 斗 。

	B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_4);
};

// *********************************************************
//					Verbrecher ausliefern // e4
// *********************************************************
instance DIA_Andre_Auslieferung(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 200;
	condition		= DIA_Andre_Auslieferung_Condition;
	information		= DIA_Andre_Auslieferung_Info;
	permanent		= TRUE;
	description		= "我 来 收 取 罪 犯 的 赏 金 。";
};

func int DIA_Andre_Auslieferung_Condition()
{
	if ((Rengaru_Ausgeliefert == FALSE)
	|| (Halvor_Ausgeliefert == FALSE)
	|| (Nagur_Ausgeliefert == FALSE)
	|| (MIS_Canthars_KomproBrief == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Andre_Auslieferung_Info()
{
	AI_Output(other, self, "DIA_Andre_Auslieferung_15_00"); //我 来 收 取 罪 犯 的 赏 金 。

	Info_ClearChoices(DIA_Andre_Auslieferung);

	Info_AddChoice(DIA_Andre_Auslieferung, "我 随 后 再 来 （ 返 回 ）", DIA_Andre_Auslieferung_Back);

	// ------ Rengaru -----
	if ((Rengaru_InKnast == TRUE)
	&& (Rengaru_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung, "伦 加 鲁 从 商 人 佐 拉 那 里 偷 东 西 。", DIA_Andre_Auslieferung_Rengaru);
	};

	// ------ Halvor ------
	if ((Betrayal_Halvor == TRUE)
	&& (Halvor_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung, "哈 尔 沃 出 售 赃 物 。", DIA_Andre_Auslieferung_Halvor);
	};

	// ------ Nagur ------
	if ((MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE))
	{
		Info_AddChoice(DIA_Andre_Auslieferung, "纳 格 已 经 杀 了 贝 尔 卓 姆 的 信 使 。", DIA_Andre_Auslieferung_Nagur);
	};

	// ------ Canthar -------
	if ((MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung, "坎 萨 想 要 除 掉 莎 拉。", DIA_Andre_Auslieferung_Canthar);
	};

	if ((MIS_Canthars_KomproBrief == LOG_RUNNING)
	&& (Npc_HasItems(Sarah, ItWr_Canthars_KomproBrief_MIS) >= 1)
	&& (MIS_Canthars_KomproBrief_Day > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(DIA_Andre_Auslieferung, "莎 拉 出 售 武 器 给 欧 纳 尔 。", DIA_Andre_Auslieferung_Sarah);
	};
};

func void DIA_Andre_Auslieferung_Back()
{
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Rengaru()
{
	// Rengaru in den Knast beamen
	AI_Teleport(Rengaru, "NW_CITY_HABOUR_KASERN_RENGARU");

	AI_Output(other, self, "DIA_Andre_Auslieferung_Rengaru_15_00"); //伦 加 鲁 从 商 人 佐 拉 那 里 偷 东 西 。 他 试 图 逃 走 ， 但 是 我 抓 住 了 他 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Rengaru_08_01"); //好 ， 我 的 人 已 经 把 他 抓 起 来 了 。 近 期 他 不 会 再 从 任 何 人 那 里 偷 东 西 了.！
	AI_Output(self, other, "DIA_Andre_Auslieferung_Rengaru_08_02"); //这 是 你 的 钱 。
	B_GiveInvItems(self, other, itmi_gold, Kopfgeld);

	Rengaru_Ausgeliefert = TRUE;
	MIS_ThiefGuild_sucked = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);

	B_StartOtherRoutine(Rengaru, "PRISON");
};

func void DIA_Andre_Auslieferung_Halvor()
{
	// Halvor in den Knast beamen
	AI_Teleport(Halvor, "NW_CITY_HABOUR_KASERN_HALVOR");

	AI_Output(other, self, "DIA_Andre_Auslieferung_Halvor_15_00"); //哈 尔 沃 是 个 销 赃 者 。 他 出 售 强 盗 们 从 商 人 那 里 抢 来 的 货 物 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Halvor_08_01"); //那 么 他 就 是 主 使 者 ， 我 的 人 会 立 刻 把 他 锁 起 来 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Halvor_08_02"); //我 想 他 不 会 再 制 造 任 何 困 难 了 。 我 马 上 给 你 奖 金 。
	B_GiveInvItems(self, other, itmi_gold, Kopfgeld);

	B_StartOtherRoutine(Halvor, "PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Halvor_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Nagur()
{
	// Nagur in den Knast beamen
	AI_Teleport(Nagur, "NW_CITY_HABOUR_KASERN_NAGUR");

	AI_Output(other, self, "DIA_Andre_Auslieferung_Nagur_15_00"); //纳 格 杀 了 贝 尔 卓 姆 的 信 使 。 他 想 让 我 做 他 的 新 信 使 ， 以 便 截 获 阿 基 尔 的 货 物 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Nagur_08_01"); //那 个 家 伙 将 会 受 到 公 正 的 审 判 。 我 会 立 刻 把 他 关 起 来 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Nagur_08_02"); //给 ， 这 是 你 应 得 的 奖 金 。
	B_GiveInvItems(self, other, itmi_gold, Kopfgeld);

	B_StartOtherRoutine(Nagur, "PRISON");
	MIS_ThiefGuild_sucked = TRUE;
	Nagur_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);
	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Canthar()
{
	// Canthar in den Knast beamen
	AI_Teleport(Canthar, "NW_CITY_HABOUR_KASERN_RENGARU");

	AI_Output(other, self, "DIA_Andre_Auslieferung_Canthar_15_00"); //雇 佣 兵 坎 萨 想 要 除 掉 莎 拉 ！
	AI_Output(self, other, "DIA_Andre_Auslieferung_Canthar_08_01"); //莎 拉 ？ 市 场 上 的 武 器 商 ？
	AI_Output(other, self, "DIA_Andre_Auslieferung_Canthar_15_02"); //他 要 我 把 一 封 信 偷 偷 塞 到 莎 拉 身 上 ， 并 宣 称 她 向 欧 纳 尔 提 供 武 器 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Canthar_08_03"); //我 明 白 了 。 我 很 高 兴 为 那 个 混 蛋 支 付 赏 金 。 他 已 经 足 以 被 关 进 监 狱 了 。
	B_GiveInvItems(self, other, itmi_gold, Kopfgeld);

	B_StartOtherRoutine(Canthar, "KNAST");

	MIS_Canthars_KomproBrief = LOG_FAILED;
	B_CheckLog();

	Canthar_Ausgeliefert = TRUE;
	B_GivePlayerXP(XP_Andre_Auslieferung);

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

func void DIA_Andre_Auslieferung_Sarah()
{
	// Sarah in den Knast beamen
	AI_Teleport(Sarah, "NW_CITY_HABOUR_KASERN_RENGARU");
	// Canthar zum markt beamen
	AI_Teleport(Canthar, "NW_CITY_SARAH");

	AI_Output(other, self, "DIA_Andre_Auslieferung_Sarah_15_00"); //莎 拉 出 售 武 器 给 欧 纳 尔 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Sarah_08_01"); //莎 拉 ？ 市 场 上 的 武 器 商 ？ 你 有 证 据 吗 ？
	AI_Output(other, self, "DIA_Andre_Auslieferung_Sarah_15_02"); //她 的 口 袋 里 有 一 封 信 ， 上 面 详 细 记 录 了 她 把 武 器 卖 给 他 。
	AI_Output(self, other, "DIA_Andre_Auslieferung_Sarah_08_03"); //她 不 会 逃 脱 惩 罚 的 ， 我 会 逮 捕 她 。

	B_GiveInvItems(self, other, itmi_gold, Kopfgeld);

	B_StartOtherRoutine(Sarah, "KNAST");

	B_StartOtherRoutine(Canthar, "MARKTSTAND");

	Sarah_Ausgeliefert = TRUE;

	MIS_Canthars_KomproBrief = LOG_SUCCESS;
	B_GivePlayerXP(XP_Andre_Auslieferung);

	Info_ClearChoices(DIA_Andre_Auslieferung);
};

// *********************************************************
//					Diebesgilde Running
// *********************************************************
instance DIA_Andre_DGRunning(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 4;
	condition		= DIA_Andre_DGRunning_Condition;
	information		= DIA_Andre_DGRunning_Info;
	permanent		= TRUE;
	description		= "关 于 盗 贼 行 会 … …";
};

func int DIA_Andre_DGRunning_Condition()
{
	if (MIS_Andre_GuildOfThieves == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_DGRunning_Info()
{
	AI_Output(other, self, "DIA_Andre_DGRunning_15_00"); //关 于 盗 贼 行 会 … …

	if (Andre_Diebesgilde_aufgeraeumt == TRUE)
	{
		AI_Output(self, other, "DIA_Andre_DGRunning_08_01"); //你 不 用 管 这 件 事 了 。 我 已 经 派 了 几 个 人 进 入 下 水 道 。
		AI_Output(self, other, "DIA_Andre_DGRunning_08_02"); //盗 贼 公 会 现 在 仅 仅 是 这 座 城 市 的 历 史 中 一 个 悲 伤 的 章 节 了 。
		MIS_Andre_GuildOfThieves = LOG_OBSOLETE;

		if (MIS_CassiaKelche == LOG_RUNNING)
		{
			MIS_CassiaKelche = LOG_OBSOLETE;
		};

		if (MIS_RamirezSextant == LOG_RUNNING)
		{
			MIS_RamirezSextant = LOG_OBSOLETE;
		};

		return;
	};

	AI_Output(self, other, "DIA_Andre_DGRunning_08_03"); //嗯 ？

	Info_ClearChoices(DIA_Andre_DGRunning);
	Info_AddChoice(DIA_Andre_DGRunning, "我 正 在 调 查 … …", DIA_Andre_DGRunning_BACK);

	if ((Npc_IsDead(Cassia))
	&& (Npc_IsDead(Jesper))
	&& (Npc_IsDead(Ramirez)))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "我 把 他 们 都 抓 住 了 ！", DIA_Andre_DGRunning_Success);
	};

	if (((Cassia.aivar[AIV_TalkedToPlayer] == TRUE) || (Jesper.aivar[AIV_TalkedToPlayer] == TRUE) || (Ramirez.aivar[AIV_TalkedToPlayer] == TRUE))
	&& (Diebesgilde_verraten == FALSE))
	{
		Info_AddChoice(DIA_Andre_DGRunning, "我 找 到 了 盗 贼 行 会 的 藏 身 之 处 ！", DIA_Andre_DGRunning_Verrat);
	};
};

func void DIA_Andre_DGRunning_BACK()
{
	AI_Output(other, self, "DIA_Andre_DGRunning_BACK_15_00"); //我 正 在 调 查 … …
	if (Diebesgilde_verraten == TRUE)
	{
		AI_Output(self, other, "DIA_Andre_DGRunning_BACK_08_01"); //好 吧 。 我 会 多 给 你 一 些 时 间 来 完 成 你 的 任 务 。
	}
	else
	{
		AI_Output(self, other, "DIA_Andre_DGRunning_BACK_08_02"); //好 ！ 继 续 通 知 我 。
	};

	Info_ClearChoices(DIA_Andre_DGRunning);
};

func void DIA_Andre_DGRunning_Verrat()
{
	AI_Output(other, self, "DIA_Andre_DGRunning_Verrat_15_00"); //我 找 到 了 盗 贼 行 会 的 藏 身 之 处 ！
	AI_Output(self, other, "DIA_Andre_DGRunning_Verrat_08_01"); //什 么 ？
	AI_Output(other, self, "DIA_Andre_DGRunning_Verrat_15_02"); //在 城 市 的 下 水 道 里 。
	AI_Output(self, other, "DIA_Andre_DGRunning_Verrat_08_03"); //什 么 ？ 我 们 已 经 封 锁 了 下 水 道 … …
	AI_Output(other, self, "DIA_Andre_DGRunning_Verrat_15_04"); //看 来 那 并 没 有 阻 止 他 们 在 下 面 发 展 。
	AI_Output(self, other, "DIA_Andre_DGRunning_Verrat_08_05"); //你 抓 住 罪 犯 了 吗 ？
	Diebesgilde_verraten = TRUE;
	DG_gefunden = TRUE;
};

func void DIA_Andre_DGRunning_Success()
{
	AI_Output(other, self, "DIA_Andre_DGRunning_Success_15_00"); //我 把 他 们 都 抓 住 了 ！
	AI_Output(self, other, "DIA_Andre_DGRunning_Success_08_01"); //你 为 这 座 城 市 做 出 了 巨 大 的 贡 献 。
	DG_gefunden = TRUE;
	MIS_Andre_GuildOfThieves = LOG_SUCCESS;
	B_GivePlayerXP(XP_GuildOfThievesPlatt);

	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		MIS_CassiaKelche = LOG_OBSOLETE;
	};

	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Andre_DGRunning_Success_08_02"); //如 果 你 仍 对 民 兵 中 的 位 置 感 兴 趣 ， 请 告 诉 我 。
	}
	else if ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Andre_DGRunning_Success_08_03"); //你 已 经 作 为 高 尚 的 英 诺 斯 的 仆 人 和 国 王 的 战 士 履 行 了 你 的 职 责 。
	};

	AI_Output(self, other, "DIA_Andre_DGRunning_Success_08_04"); //你 有 资 格 取 得 那 些 强 盗 们 的 奖 金 。 给 你 。
	B_GiveInvItems(self, other, itmi_gold,(Kopfgeld * 3));

	Info_ClearChoices(DIA_Andre_DGRunning);
};

// *********************************************************
//						JOIN Miliz
// *********************************************************
instance DIA_Andre_JOIN(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 100;
	condition		= DIA_Andre_JOIN_Condition;
	information		= DIA_Andre_JOIN_Info;
	permanent		= TRUE;
	description		= "我 已 经 准 备 好 加 入 民 兵 ！";
};

func int DIA_Andre_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Npc_KnowsInfo(other, DIA_Andre_AskToJoin)))
	{
		return TRUE;
	};
};

func void DIA_Andre_JOIN_Info()
{
	AI_Output(other, self, "DIA_Andre_JOIN_15_00"); //我 已 经 准 备 好 加 入 民 兵 ！

	// ADDON
	if (Andre_Knows_MartinEmpfehlung == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Andre_JOIN_08_00"); //补 给 官 员 马 丁 ， 不 但 为 你 担 保 ， 甚 至 还 推 荐 了 你 。 那 对 我 来 说 已 经 足 够 了 。
	}
	// ADDON
	else if ((MIS_Andre_GuildOfThieves == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE))
	{
		AI_Output(self, other, "DIA_Andre_JOIN_08_01"); //我 会 遵 守 我 在 协 议 中 的 许 诺 ， 同 意 你 加 入 民 兵 ， 即 使 你 不 是 市 民 。
		AI_Output(self, other, "DIA_Andre_JOIN_08_02"); //但 是 不 要 向 全 世 界 去 宣 传 此 事 ！ 知 道 这 个 例 外 的 人 越 少 ， 我 以 后 要 为 自 己 做 辩 护 的 可 能 性 就 越 小 。
	}
	else if (Player_IsApprentice > APP_NONE)
	{
		AI_Output(self, other, "DIA_Andre_JOIN_08_03"); //那 么 说 你 是 克 霍 里 尼 斯 的 市 民 ？

		if (Player_IsApprentice == APP_Harad)
		{
			AI_Output(other, self, "DIA_Andre_JOIN_15_04"); //铁 匠 已 经 同 意 我 做 他 的 学 徒 。
			AI_Output(self, other, "DIA_Andre_JOIN_08_05"); //哈 莱 德 ？ 我 认 识 他 。 他 为 我 们 工 作 。 他 是 一 个 好 人 。
		};

		if (Player_IsApprentice == APP_Constantino)
		{
			AI_Output(other, self, "DIA_Andre_JOIN_15_06"); //我 是 炼 金 术 士 的 学 徒 ！
			AI_Output(self, other, "DIA_Andre_JOIN_08_07"); //我 们 民 兵 中 的 学 者 并 不 多 。 也 许 你 的 技 能 可 以 为 我 们 提 供 很 大 的 帮 助 。
			AI_Output(self, other, "DIA_Andre_JOIN_08_08"); //我 并 不 太 了 解 这 个 炼 金 术 士 。 但 是 人 们 说 他 是 一 个 值 得 尊 敬 的 人 。
		};

		if (Player_IsApprentice == APP_Bosper)
		{
			AI_Output(other, self, "DIA_Andre_JOIN_15_09"); //制 弓 匠 伯 斯 波 已 经 同 意 我 做 他 的 学 徒 。
			AI_Output(self, other, "DIA_Andre_JOIN_08_10"); //那 么 你 已 经 了 解 一 些 关 于 野 外 生 存 的 知 识 了 ？ 很 好 ， 因 为 民 兵 要 执 行 的 任 务 并 不 都 在 城 市 里 。
			AI_Output(self, other, "DIA_Andre_JOIN_08_11"); //我 们 自 然 非 常 需 要 能 在 野 外 认 路 的 人 。
			AI_Output(self, other, "DIA_Andre_JOIN_08_12"); //而 且 制 弓 匠 是 城 市 里 很 重 要 的 人 。
		};

		AI_Output(self, other, "DIA_Andre_JOIN_08_13"); //如 果 他 担 保 你 ， 那 么 你 加 入 民 兵 就 不 会 有 任 何 问 题 。

		// ------- Außerdem noch GuildOfThieves ------
		if (MIS_Andre_GuildOfThieves == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Andre_JOIN_08_14"); //此 外 ， 你 还 要 设 法 解 决 掉 盗 贼 公 会 。 仅 仅 是 那 一 件 事 ， 就 足 以 让 我 接 受 你 加 入 民 兵 。
		};
	}
	else // Player_IsApprentice == APP_NONE
	{
		AI_Output(self, other, "DIA_Andre_JOIN_08_15"); //有 可 能 - 不 过 你 还 不 是 镇 上 的 市 民 ， 而 我 有 我 的 命 令 。
		return;
	};

	AI_Output(self, other, "DIA_Andre_JOIN_08_16"); //如 果 你 愿 意 的 话 ， 你 可 以 加 入 我 们 。 但 是 你 的 决 定 将 是 最 终 的 。
	AI_Output(self, other, "DIA_Andre_JOIN_08_17"); //一 旦 你 穿 上 民 兵 的 盔 甲 ， 你 就 不 是 简 简 单 单 地 脱 掉 它 就 能 够 脱 离 我 们 了 。
	AI_Output(self, other, "DIA_Andre_JOIN_08_18"); //你 准 备 好 与 我 们 一 起 ， 为 了 英 诺 斯 和 国 王 而 战 斗 吗 ？

	Info_ClearChoices(DIA_Andre_JOIN);
	Info_AddChoice(DIA_Andre_JOIN, "我 还 不 太 肯 定 … …", DIA_Andre_JOIN_No);
	Info_AddChoice(DIA_Andre_JOIN, "我 准 备 好 了 ！", DIA_Andre_JOIN_Yes);
};

func void DIA_Andre_JOIN_Yes()
{
	AI_Output(other, self, "DIA_Andre_JOIN_Yes_15_00"); //我 准 备 好 了 ！
	AI_Output(self, other, "DIA_Andre_JOIN_Yes_08_01"); //那 就 这 样 了 。 欢 迎 加 入 民 兵 。

	Npc_SetTrueGuild(other, GIL_MIL);
	other.guild = GIL_MIL;
	Snd_Play("LEVELUP");

	Npc_ExchangeRoutine(Lothar, "START");

	AI_Output(self, other, "DIA_Andre_JOIN_Yes_08_02"); //这 是 你 的 盔 甲 。
	B_GiveInvItems(self, other, ITAR_MIL_L, 1);
	AI_Output(self, other, "DIA_Andre_JOIN_Yes_08_03"); //带 着 自 豪 和 尊 严 穿 上 它 。

	SLD_Aufnahme = LOG_OBSOLETE;
	KDF_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_SUCCESS;
	B_GivePlayerXP(XP_BecomeMiliz);

	Info_ClearChoices(DIA_Andre_JOIN);
};

func void DIA_Andre_JOIN_No()
{
	AI_Output(other, self, "DIA_Andre_JOIN_No_15_00"); //我 还 不 太 肯 定 … …
	AI_Output(self, other, "DIA_Andre_JOIN_No_08_01"); //只 要 你 还 在 怀 疑 自 己 的 决 定 ， 我 就 不 能 同 意 你 加 入 民 兵 。

	Info_ClearChoices(DIA_Andre_JOIN);
};

// *********************************************************
//					Endlich zu Lord Hagen?
// *********************************************************
instance DIA_Andre_LORDHAGEN(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_LORDHAGEN_Condition;
	information		= DIA_Andre_LORDHAGEN_Info;
	description		= "我 现 在 终 于 可 以 见 哈 根 勋 爵 了 ？";
};

func int DIA_Andre_LORDHAGEN_Condition()
{
	if ((other.guild == GIL_MIL)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_LORDHAGEN_Info()
{
	AI_Output(other, self, "DIA_Andre_LORDHAGEN_15_00"); //我 现 在 终 于 可 以 见 哈 根 勋 爵 了 ？
	AI_Output(self, other, "DIA_Andre_LORDHAGEN_08_01"); //你 现 在 已 经 加 入 了 圣 骑 士 的 部 队 。 他 们 会 让 你 进 去 的 ， 但 是 你 最 好 说 点 重 要 的 事 情 。
	AI_Output(other, self, "DIA_Andre_LORDHAGEN_15_02"); //不 用 担 心 ， 我 … …
	AI_Output(self, other, "DIA_Andre_LORDHAGEN_08_03"); //记 住 你 要 见 的 是 圣 骑 士 的 领 袖 。 表 现 好 一 点 ， 你 现 在 不 仅 仅 是 代 表 你 自 己 ， 而 是 所 有 民 兵 。
};

// *********************************************************
//				Waffe
// *********************************************************
instance DIA_Andre_Waffe(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_Waffe_Condition;
	information		= DIA_Andre_Waffe_Info;
	description		= "我 还 能 得 到 一 件 武 器 吗 ？";
};

func int DIA_Andre_Waffe_Condition()
{
	if ((other.guild == GIL_MIL)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Andre_Waffe_Info()
{
	AI_Output(other, self, "DIA_Andre_Waffe_15_00"); //我 还 能 得 到 一 件 武 器 吗 ？
	AI_Output(self, other, "DIA_Andre_Waffe_08_01"); //当 然 。 通 常 由 帕 克 负 责 处 理 那 些 事 情 。 不 过 这 让 我 想 起 ， 我 已 经 有 一 段 时 间 没 见 到 他 了 。
	AI_Output(self, other, "DIA_Andre_Waffe_08_02"); //看 看 他 藏 在 哪 里 ， 并 把 他 带 到 这 里 来 。 然 后 他 会 给 你 武 器 。
	AI_Output(self, other, "DIA_Andre_Waffe_08_03"); //如 果 你 要 休 息 ， 你 可 以 躺 在 简 易 住 所 里 的 任 意 一 张 床 上 。

	MIS_Andre_Peck = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Peck, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Peck, LOG_RUNNING);
	B_LogEntry(TOPIC_Peck, TOPIC_Peck_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_PECK
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_FOUND_PECK(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_FOUND_PECK_Condition;
	information		= DIA_Andre_FOUND_PECK_Info;
	description		= "我 已 经 想 办 法 找 到 了 帕 克";
};

func int DIA_Andre_FOUND_PECK_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Peck_FOUND_PECK)
	&& (MIS_Andre_Peck == LOG_RUNNING)
	&& (Npc_IsDead(Peck) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_PECK_Info()
{
	AI_Output(other, self, "DIA_Andre_FOUND_PECK_15_00"); //我 已 经 想 办 法 找 到 了 帕 克 。
	AI_Output(self, other, "DIA_Andre_FOUND_PECK_08_01"); //是 的 ， 他 已 经 回 到 了 他 的 岗 位 ， 并 继 续 履 行 他 的 职 责 。 你 是 在 哪 里 找 到 他 的 ？

	Info_ClearChoices(DIA_Andre_FOUND_PECK);
	Info_AddChoice(DIA_Andre_FOUND_PECK, "他 和 我 碰 上 了 … …", DIA_Andre_FOUND_PECK_SOMEWHERE);
	Info_AddChoice(DIA_Andre_FOUND_PECK, "在 ‘ 红 灯 笼 ’ 里 面 … …", DIA_Andre_FOUND_PECK_REDLIGHT);
};

func void DIA_Andre_FOUND_PECK_SOMEWHERE()
{
	AI_Output(other, self, "DIA_Andre_FOUND_PECK_SOMEWHERE_15_00"); //正 好 在 镇 上 碰 到 了 他 。
	AI_Output(self, other, "DIA_Andre_FOUND_PECK_SOMEWHERE_08_01"); //好 吧 ， 那 去 他 那 里 取 你 的 武 器 。

	MIS_Andre_Peck = LOG_OBSOLETE; // wird hier benutzt, um Unterscheidung bei Waffenausgabe zu haben, aber Mission ist trotzdem geschafft! M.F.
	B_GivePlayerXP(XP_FoundPeck);
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

func void DIA_Andre_FOUND_PECK_REDLIGHT()
{
	AI_Output(other, self, "DIA_Andre_FOUND_PECK_REDLIGHT_15_00"); //他 在 ‘ 红 灯 笼 ’ 里 。
	AI_Output(self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_01"); //那 么 说 他 在 没 有 履 行 职 责 的 时 候 ， 而 是 在 和 那 些 女 孩 鬼 混 了 。
	AI_Output(self, other, "DIA_Andre_FOUND_PECK_REDLIGHT_08_02"); //我 想 我 有 一 些 话 要 和 他 说 说 。

	B_GivePlayerXP(XP_FoundPeck * 2);
	MIS_Andre_Peck = LOG_SUCCESS;
	Info_ClearChoices(DIA_Andre_FOUND_PECK);
};

// ################################################
// ### ###
// 				_NACH_ MILIZ-AUFNAHME
// ### ###
// ################################################

func void B_AndreSold()
{
	AI_Output(self, other, "DIA_Andre_Sold_08_00"); //这 是 你 的 报 酬 。
	B_GiveInvItems(self, other, itmi_Gold, Andre_Sold);
};

///////////////////////////////////////////////////////////////////////
//	Info
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_FIRSTMISSION(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_FIRSTMISSION_Condition;
	information		= DIA_Andre_FIRSTMISSION_Info;
	description		= "你 有 任 务 给 我 吗 ？";
};

func int DIA_Andre_FIRSTMISSION_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Andre_FIRSTMISSION_Info()
{
	AI_Output(other, self, "DIA_Andre_FIRSTMISSION_15_00"); //你 有 任 务 给 我 吗 ？
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_01"); //最 近 城 市 里 出 售 沼 生 草 的 现 象 多 了 起 来 。
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_02"); //我 们 不 允 许 这 种 东 西 流 行 起 来 。
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_03"); //否 则 ， 这 里 的 每 个 人 都 会 开 始 吸 它 ， 并 且 不 再 工 作 ， 更 不 用 说 使 用 武 器 了 。
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_04"); //尤 其 是 现 在 ， 在 兽 人 或 者 雇 佣 兵 随 时 可 能 进 攻 的 时 候 。
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_05"); //我 怀 疑 有 雇 佣 兵 在 幕 后 操 纵 。 我 打 赌 一 定 是 他 们 把 这 种 东 西 带 进 了 城 市 。
	AI_Output(other, self, "DIA_Andre_FIRSTMISSION_15_06"); //在 那 里 做 什 么 ？
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_07"); //我 们 的 一 个 人 - 莫 提 斯 ， 在 港 口 酒 吧 里 听 说 有 一 包 沼 生 草 已 经 运 进 了 海 港 地 区 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Andre_FIRSTMISSION_08_08"); //去 那 里 找 一 下 ， 并 把 它 给 我 拿 来 。

	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;

	Log_CreateTopic(TOPIC_WAREHOUSE, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE, LOG_RUNNING);
	B_LogEntry(TOPIC_WAREHOUSE, TOPIC_WAREHOUSE_1);
};

///////////////////////////////////////////////////////////////////////
//	Info FOUND_STUFF
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_FOUND_STUFF(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_FOUND_STUFF_Condition;
	information		= DIA_Andre_FOUND_STUFF_Info;
	permanent		= TRUE;
	description		= "关 于 包 裹 … …";
};

func int DIA_Andre_FOUND_STUFF_Condition()
{
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_FOUND_STUFF_Info()
{
	AI_Output(other, self, "DIA_Andre_FOUND_STUFF_15_00"); //关 于 包 裹 … …
	AI_Output(self, other, "DIA_Andre_FOUND_STUFF_08_01"); //你 找 到 它 了 吗 ？

	if ((Npc_HasItems(other, ItMi_HerbPaket) > 0)
	|| (MIS_Cipher_Paket == LOG_SUCCESS))
	{
		Info_ClearChoices(DIA_Andre_FOUND_STUFF);

		if (Npc_HasItems(other, ItMi_HerbPaket) > 0)
		{
			Info_AddChoice(DIA_Andre_FOUND_STUFF, "是 的 ， 它 在 这 里 。", DIA_Andre_FOUND_STUFF_Ja);
		};

		Info_AddChoice(DIA_Andre_FOUND_STUFF, "我 把 它 扔 进 港 口 的 水 里 了 。", DIA_Andre_FOUND_STUFF_Becken);
	}
	else
	{
		AI_Output(other, self, "DIA_Andre_FOUND_STUFF_15_02"); //还 没 有 。
	};
};

func void DIA_Andre_FOUND_STUFF_Ja()
{
	AI_Output(other, self, "DIA_Andre_FOUND_STUFF_Ja_15_00"); //是 的 ， 它 在 这 里 。
	B_GiveInvItems(other, self, ItMi_HerbPaket, 1);
	AI_Output(self, other, "DIA_Andre_FOUND_STUFF_Ja_08_01"); //干 的 不 错 。 我 们 应 该 严 密 看 守 这 些 烟 草 。
	B_AndreSold();

	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_Cipher_Paket = LOG_FAILED;
	B_GivePlayerXP(XP_Warehouse_Super * 2);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

func void DIA_Andre_FOUND_STUFF_Becken()
{
	AI_Output(other, self, "DIA_Andre_FOUND_STUFF_Becken_15_00"); //我 把 它 扔 进 港 口 的 水 里 了 。
	AI_Output(self, other, "DIA_Andre_FOUND_STUFF_Becken_08_01"); //真 的 ？ 嗯 ， 最 主 要 的 是 它 不 会 再 落 入 坏 人 的 手 中 。
	B_AndreSold();

	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	B_GivePlayerXP(XP_Warehouse_Super);
	Info_ClearChoices(DIA_Andre_FOUND_STUFF);
};

///////////////////////////////////////////////////////////////////////
//	Info FIND_DEALER
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_FIND_DEALER(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_FIND_DEALER_Condition;
	information		= DIA_Andre_FIND_DEALER_Info;
	description		= "你 还 有 其 它 工 作 给 我 吗 ？";
};

func int DIA_Andre_FIND_DEALER_Condition()
{
	if ((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	&& (Npc_IsDead(Borka) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Andre_FIND_DEALER_Info()
{
	AI_Output(other, self, "DIA_Andre_FIND_DEALER_15_00"); //你 还 有 其 它 工 作 给 我 吗 ？
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_01"); //你 已 经 阻 止 了 沼 生 草 的 扩 散 - 好 。
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_02"); //但 是 我 想 知 道 是 谁 在 人 们 之 间 散 布 这 种 东 西 。
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_03"); //一 定 是 海 港 地 区 里 的 某 个 人 。
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_04"); //如 果 是 某 个 外 来 人 的 话 ， 他 应 该 早 就 被 抓 住 了 。
	AI_Output(other, self, "DIA_Andre_FIND_DEALER_15_05"); //我 究 竟 要 做 什 么 ？
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_06"); //找 到 那 个 经 销 商 ， 并 让 他 卖 给 你 一 些 烟 草 。 那 不 太 容 易 ， 但 是 我 们 又 不 能 用 别 的 方 法 逮 捕 他 。
	AI_Output(self, other, "DIA_Andre_FIND_DEALER_08_07"); //去 找 莫 提 斯 谈 谈 ， 他 了 解 海 港 地 区 。 也 许 他 能 帮 助 你 。

	MIS_Andre_REDLIGHT = LOG_RUNNING;
	B_StartOtherRoutine(Nadja, "SMOKE");

	Log_CreateTopic(TOPIC_REDLIGHT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT, LOG_RUNNING);
	B_LogEntry(TOPIC_REDLIGHT, TOPIC_REDLIGHT_1);
};

///////////////////////////////////////////////////////////////////////
//	Info REDLIGHT_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_REDLIGHT_SUCCESS(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 2;
	condition		= DIA_Andre_REDLIGHT_SUCCESS_Condition;
	information		= DIA_Andre_REDLIGHT_SUCCESS_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 草 … …";
};

func int DIA_Andre_REDLIGHT_SUCCESS_Condition()
{
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_REDLIGHT_SUCCESS_Info()
{
	AI_Output(other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_00"); //关 于 那 些 草 … …

	if ((Npc_IsDead(Borka) == TRUE)
	|| (Undercover_Failed == TRUE))
	{
		AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_01"); //我 不 认 为 我 们 现 在 要 调 查 海 港 地 区 的 任 何 事 情 。

		if (Npc_IsDead(Borka) == TRUE)
		{
			AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_02"); //自 从 那 个 保 镖 死 后 就 不 用 了 。
		};

		if (Nadja_Victim == TRUE)
		{
			AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_03"); //红 灯 笼 里 的 女 孩 纳 德 加 死 了 ， 一 定 是 某 种 意 外 。
			B_RemoveNpc(Nadja);
		};

		if (Undercover_Failed == TRUE)
		{
			AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_04"); //你 还 不 够 谨 慎 。
		};

		MIS_Andre_REDLIGHT = LOG_FAILED;
		B_CheckLog();
	}
	else if (Borka_Deal == 2)
	{
		AI_Output(other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_05"); //我 知 道 是 谁 在 镇 上 出 售 烟 草 。 是 博 卡 ， 红 灯 笼 的 看 门 人 。
		AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_06"); //真 的 ？ 有 证 据 吗 ？
		AI_Output(other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_07"); //他 卖 了 我 一 些 沼 生 草 。
		AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_08"); //很 好 ， 那 对 我 们 来 说 已 经 足 够 了 。 我 立 即 逮 捕 他 。

		B_StartOtherRoutine(Borka, "PRISON");
		MIS_Andre_REDLIGHT = LOG_SUCCESS;
		B_GivePlayerXP(XP_Redlight);
		B_AndreSold();
	}
	else
	{
		AI_Output(other, self, "DIA_Andre_REDLIGHT_SUCCESS_15_09"); //… … 我 还 在 调 查 。
		AI_Output(self, other, "DIA_Andre_REDLIGHT_SUCCESS_08_10"); //好 ， 记 住 ， 你 必 须 让 那 个 家 伙 与 你 交 易 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HilfBauerLobart
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_HILFBAUERLOBART(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 3;
	condition		= DIA_Andre_HILFBAUERLOBART_Condition;
	information		= DIA_Andre_HILFBAUERLOBART_Info;
	description		= "你 有 其 它 任 务 给 我 吗 ？";
};

func int DIA_Andre_HILFBAUERLOBART_Condition()
{
	if (MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_HILFBAUERLOBART_Info()
{
	AI_Output(other, self, "DIA_Andre_HILFBAUERLOBART_15_00"); //你 有 其 它 任 务 给 我 吗 ？
	AI_Output(self, other, "DIA_Andre_HILFBAUERLOBART_08_01"); //萝 卜 农 场 的 洛 拔 特 地 里 除 了 一 些 问 题 。
	AI_Output(self, other, "DIA_Andre_HILFBAUERLOBART_08_02"); //如 果 我 们 帮 助 他 ， 将 会 巩 固 他 和 城 市 之 间 的 关 系 。 所 以 去 他 那 里 看 看 发 生 了 什 么 事 。

	Log_CreateTopic(TOPIC_Feldraeuber, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Feldraeuber, LOG_RUNNING);
	B_LogEntry(TOPIC_Feldraeuber, TOPIC_Feldraeuber_1);

	MIS_AndreHelpLobart = LOG_RUNNING;

	Wld_InsertNpc(Lobarts_Giant_Bug1, "NW_FARM1_FIELD_06");
	Wld_InsertNpc(Lobarts_Giant_Bug2, "NW_FARM1_FIELD_06");

	Wld_InsertNpc(Lobarts_Giant_Bug3, "NW_FARM1_FIELD_05");
	Wld_InsertNpc(Lobarts_Giant_Bug4, "NW_FARM1_FIELD_05");

	Wld_InsertNpc(Lobarts_Giant_Bug5, "NW_FARM1_FIELD_04");
	Wld_InsertNpc(Lobarts_Giant_Bug6, "NW_FARM1_FIELD_04");

	Wld_InsertNpc(Lobarts_Giant_Bug7, "NW_FARM1_FIELD_03");

	B_StartOtherRoutine(Vino, "BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer1, "BUGSTHERE");
	B_StartOtherRoutine(LobartsBauer2, "BUGSTHERE");

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info LOBART_SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_LOBART_SUCCESS(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 0;
	condition		= DIA_Andre_LOBART_SUCCESS_Condition;
	information		= DIA_Andre_LOBART_SUCCESS_Info;
	description		= "我 已 经 帮 助 了 洛 拔 特 。";
};

func int DIA_Andre_LOBART_SUCCESS_Condition()
{
	if (MIS_AndreHelpLobart == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Andre_LOBART_SUCCESS_Info()
{
	AI_Output(other, self, "DIA_Andre_LOBART_SUCCESS_15_00"); //我 已 经 帮 助 了 洛 拔 特 。
	AI_Output(self, other, "DIA_Andre_LOBART_SUCCESS_08_01"); //好 极 了 。 如 果 洛 拔 特 满 意 的 话 ， 那 他 会 继 续 向 城 市 出 售 他 的 萝 卜 。
	B_GivePlayerXP(XP_LobartBugs);
	B_AndreSold();
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 5;
	condition		= DIA_Addon_Andre_MissingPeople_Condition;
	information		= DIA_Addon_Andre_MissingPeople_Info;
	description		= "那 失 踪 的 人 呢 ？";
};

func int DIA_Addon_Andre_MissingPeople_Condition()
{
	if ((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Andre_MissingPeople_15_00"); //那 失 踪 的 人 呢 ？
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople_08_01"); //他 们 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Addon_Andre_MissingPeople_15_02"); //我 们 不 用 试 着 去 找 他 们 吗 ？
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople_08_03"); //哈 根 勋 爵 命 令 我 保 护 城 镇 和 周 围 的 农 场 。
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople_08_04"); //那 就 是 说 ， 我 们 只 负 责 那 些 还 在 ‘ 这 里 ’ 的 人 。
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople_08_05"); //民 兵 在 夜 里 的 街 道 上 巡 逻 ， 我 能 做 的 只 有 那 些 。
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople_08_06"); //你 要 去 做 我 交 给 你 的 任 务 ， 明 白 吗 ？

	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_MissingPeople2(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 5;
	condition		= DIA_Addon_Andre_MissingPeople2_Condition;
	information		= DIA_Addon_Andre_MissingPeople2_Info;
	description		= "关 于 失 踪 的 人 … …";
};

func int DIA_Addon_Andre_MissingPeople2_Condition()
{
	if ((MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	&& (other.guild != GIL_MIL)
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_MissingPeople2_Info()
{
	AI_Output(other, self, "DIA_Addon_Andre_MissingPeople2_15_00"); //关 于 那 些 失 踪 的 人 们 … …
	AI_Output(self, other, "DIA_Addon_Andre_MissingPeople2_08_01"); //不 要 因 为 那 事 来 烦 我 ， 我 还 有 其 它 的 难 题 。
	MIS_Addon_Andre_MissingPeople = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnedMissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Andre_ReturnedMissingPeople(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 5;
	condition		= DIA_Addon_Andre_ReturnedMissingPeople_Condition;
	information		= DIA_Addon_Andre_ReturnedMissingPeople_Info;
	description		= "我 已 经 救 了 一 些 失 踪 的 人 。";
};

func int DIA_Addon_Andre_ReturnedMissingPeople_Condition()
{
	if ((MissingPeopleReturnedHome == TRUE)
	&& (MIS_Addon_Andre_MissingPeople == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Andre_ReturnedMissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_00"); //我 已 经 救 了 一 些 失 踪 的 人 。
	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_01"); //我 在 这 里 一 直 想 知 道 你 这 些 日 子 究 竟 去 了 哪 里 ！
		AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_02"); //你 是 一 个 民 兵 成 员 ！ 没 有 命 令 让 你 如 此 行 动 ！
		AI_Output(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_03"); //但 是 … …
	};

	AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_04"); //你 找 到 了 多 少 人 ？
	AI_Output(other, self, "DIA_Addon_Andre_ReturnedMissingPeople_15_05"); //所 有 那 些 还 活 着 的 人 … …
	AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_06"); //所 有 ？ ！ 我 … … 呃 … …
	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_07"); //我 为 你 感 到 自 豪 ！ 我 很 高 兴 让 你 加 入 了 我 们 。
		B_AndreSold();
	};

	AI_Output(self, other, "DIA_Addon_Andre_ReturnedMissingPeople_08_08"); //那 是 一 个 重 要 的 成 就 。

	MIS_Addon_Andre_MissingPeople = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Andre_MissingPeople);
};

// ##########################################
// ##
// ## Kapitel 3
// ##
// ##########################################

func void B_Andre_GotoLordHagen()
{
	AI_Output(self, other, "DIA_Andre_Add_08_11"); //你 最 好 直 接 去 见 他 。
};

// *********************************************************
// 						BerichtDrachen
// *********************************************************
instance DIA_Andre_BerichtDrachen(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_BerichtDrachen_Condition;
	information		= DIA_Andre_BerichtDrachen_Info;
	description		= "我 到 了 矿 藏 山 谷 ， 并 看 到 了 龙 ！";
};

func int DIA_Andre_BerichtDrachen_Condition()
{
	if ((EnterOW_Kapitel2 == TRUE)
	&& (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachen_Info()
{
	// AI_Output(other, self,"DIA_Andre_Add_15_12"); // Lord Hagen hat mich auf eine Mission ins Minental geschickt! Ich soll direkt aufbrechen.

	AI_Output(other, self, "DIA_Andre_Add_15_13"); //我 到 了 矿 藏 山 谷 ， 并 看 到 了 龙 ！
	if (Npc_HasItems(hero, ItWr_PaladinLetter_MIS) > 0)
	{
		AI_Output(other, self, "DIA_Andre_Add_15_14"); //我 有 一 封 来 自 指 挥 官 加 隆 德 的 信 ， 可 以 确 认 了 我 所 说 的 一 切 。
	};

	AI_Output(self, other, "DIA_Andre_Add_08_10"); //那 一 定 会 引 起 哈 根 勋 爵 的 兴 趣 ！
	B_Andre_GotoLordHagen();
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_BennetInPrison(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 0;
	condition		= DIA_Andre_BennetInPrison_Condition;
	information		= DIA_Andre_BennetInPrison_Info;
	permanent		= TRUE;
	description		= "铁 匠 贝 尼 特 怎 么 样 了 ？";
};

func int DIA_Andre_BennetInPrison_Condition()
{
	if (MIS_RescueBennet == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Andre_BennetInPrison_Info()
{
	AI_Output(other, self, "DIA_Andre_BennetInPrison_15_00"); //铁 匠 贝 尼 特 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Andre_BennetInPrison_08_01"); //你 是 说 那 个 雇 佣 兵 ？ 他 还 呆 在 属 于 他 的 牢 房 里 。
	AI_Output(other, self, "DIA_Andre_BennetInPrison_Talk_15_00"); //我 能 同 他 谈 谈 吗 ？
	AI_Output(self, other, "DIA_Andre_BennetInPrison_Talk_08_01"); //当 然 ， 进 去 吧 。 但 是 如 果 你 打 算 帮 他 逃 走 ， 那 么 你 就 要 承 担 后 果 。
};

///////////////////////////////////////////////////////////////////////
//		Cornelius lügt
///////////////////////////////////////////////////////////////////////
instance DIA_Andre_Cornelius_Liar(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 0;
	condition		= DIA_Andre_Cornelius_Liar_Condition;
	information		= DIA_Andre_Cornelius_Liar_Info;
	permanent		= TRUE;
	description		= "我 认 为 那 个 考 内 留 斯 在 撒 谎 。";
};

func int DIA_Andre_Cornelius_Liar_Condition()
{
	if ((Cornelius_ThreatenByMilSC == TRUE)
	&& (CorneliusFlee != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Andre_Cornelius_Liar_Info()
{
	AI_Output(other, self, "DIA_Andre_Cornelius_Liar_15_00"); //我 认 为 那 个 考 内 留 斯 在 撒 谎 。
	AI_Output(self, other, "DIA_Andre_Cornelius_Liar_08_01"); //你 肯 定 吗 ？

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
	Info_AddChoice(DIA_Andre_Cornelius_Liar, "不 。", DIA_Andre_Cornelius_Liar_No);
	Info_AddChoice(DIA_Andre_Cornelius_Liar, "是 的.", DIA_Andre_Cornelius_Liar_Yes);
};

func void DIA_Andre_Cornelius_Liar_No()
{
	AI_Output(other, self, "DIA_Andre_Cornelius_Liar_No_15_00"); //不.
	AI_Output(self, other, "DIA_Andre_Cornelius_Liar_No_08_01"); //那 你 不 应 该 这 么 大 声 地 宣 布 你 的 怀 疑 。
	AI_Output(self, other, "DIA_Andre_Cornelius_Liar_No_08_02"); //考 内 留 斯 是 一 个 很 有 影 响 的 人 。 如 果 他 愿 意 的 话 ， 可 以 让 你 的 生 活 变 成 地 狱 。
	AI_Output(self, other, "DIA_Andre_Cornelius_Liar_No_08_03"); //只 要 你 没 有 证 据 ， 我 就 不 能 帮 助 你 。

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

func void DIA_Andre_Cornelius_Liar_Yes()
{
	AI_Output(other, self, "DIA_Andre_Cornelius_Liar_Yes_15_00"); //是的.
	AI_Output(self, other, "DIA_Andre_Cornelius_Liar_Yes_08_01"); //你 有 什 么 证 据 ？

	if (Cornelius_IsLiar == TRUE)
	{
		AI_Output(other, self, "DIA_Andre_Cornelius_Liar_Yes_15_02"); //我 已 经 阅 读 了 他 的 日 记 ！ 他 们 贿 赂 了 他 。 所 有 这 一 切 都 是 谎 言 。
		AI_Output(self, other, "DIA_Andre_Cornelius_Liar_Yes_08_03"); //如 果 真 是 那 样 的 话 ， 那 么 你 必 须 马 上 去 见 哈 根 勋 爵 。
		AI_Output(self, other, "DIA_Andre_Cornelius_Liar_Yes_08_04"); //让 他 看 看 日 记 。 他 会 处 理 剩 下 的 问 题 。
	}
	else
	{
		AI_Output(other, self, "DIA_Andre_Cornelius_Liar_Yes_15_05"); //嗯 ， 好 ， 我 想 … …
		AI_Output(self, other, "DIA_Andre_Cornelius_Liar_Yes_08_06"); //我 需 要 证 据 ， 而 不 是 推 测 。 找 到 证 据 ， 那 样 我 才 能 帮 你 。
		AI_Output(self, other, "DIA_Andre_Cornelius_Liar_Yes_08_07"); //在 那 之 前 ， 你 应 该 仔 细 考 虑 一 下 你 说 的 话 。
	};

	Info_ClearChoices(DIA_Andre_Cornelius_Liar);
};

// ******************************************************
//						Als Paladin
// ******************************************************
instance DIA_Andre_Paladin(C_INFO)
{
	npc				= Mil_311_Andre;
	condition		= DIA_Andre_Paladin_Condition;
	information		= DIA_Andre_Paladin_Info;
	important		= TRUE;
};

func int DIA_Andre_Paladin_Condition()
{
	if (other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Andre_Paladin_Info()
{
	AI_Output(self, other, "DIA_Andre_Paladin_08_00"); //那 么 现 在 你 是 一 名 圣 骑 士 了 ！ 祝 贺 你 ！
	AI_Output(self, other, "DIA_Andre_Paladin_08_01"); //从 开 始 我 就 知 道 你 不 会 一 直 当 民 兵 的 。
};

// ******************************************************
//						PERM
// ******************************************************
instance DIA_Andre_PERM(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 100;
	condition		= DIA_Andre_PERM_Condition;
	information		= DIA_Andre_PERM_Info;
	permanent		= TRUE;
	description		= "镇 上 的 情 况 怎 么 样 ？";
};

func int DIA_Andre_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Andre_PERM_Info()
{
	AI_Output(other, self, "DIA_Andre_PERM_15_00"); //镇 上 的 情 况 怎 么 样 ？

	AI_Output(self, other, "DIA_Andre_PERM_08_01"); //一 切 都 被 控 制 住 了 。
	if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Andre_PERM_08_02"); //执 行 你 的 任 务 。
	};

	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Andre_PERM_08_03"); //从 现 在 起 ， 你 直 接 向 哈 根 勋 爵 报 告 。 去 和 他 谈 谈 。
	};
};

// ###################
//		  Kap 5
// ###################

// *********************************************************
// 						BerichtDrachenTot
// *********************************************************
instance DIA_Andre_BerichtDrachenTot(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_BerichtDrachenTot_Condition;
	information		= DIA_Andre_BerichtDrachenTot_Info;
	description		= "我 已 经 杀 死 了 矿 藏 山 谷 中 所 有 的 龙 ！";
};

func int DIA_Andre_BerichtDrachenTot_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtDrachenTot_Info()
{
	AI_Output(other, self, "DIA_Andre_Add_15_15"); //我 已 经 杀 死 了 矿 藏 山 谷 中 所 有 的 龙 ！
	AI_Output(self, other, "DIA_Andre_Add_08_08"); //如 果 那 是 真 的 话 ， 你 必 须 告 诉 哈 根 勋 爵 。
	B_Andre_GotoLordHagen();
};

// *********************************************************
// 						BerichtTorAuf
// *********************************************************
instance DIA_Andre_BerichtTorAuf(C_INFO)
{
	npc				= Mil_311_Andre;
	nr				= 1;
	condition		= DIA_Andre_BerichtTorAuf_Condition;
	information		= DIA_Andre_BerichtTorAuf_Info;
	description		= "矿 藏 山 谷 里 的 城 堡 遭 到 了 兽 人 的 突 袭 ！";
};

func int DIA_Andre_BerichtTorAuf_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Andre_BerichtDrachenTot)))
	{
		return TRUE;
	};
};

func void DIA_Andre_BerichtTorAuf_Info()
{
	AI_Output(other, self, "DIA_Andre_Add_15_16"); //矿 藏 山 谷 里 的 城 堡 遭 到 了 兽 人 的 突 袭 ！
	AI_Output(self, other, "DIA_Andre_Add_08_09"); //不 ！ 必 须 告 诉 哈 根 勋 爵 必 须 。
	B_Andre_GotoLordHagen();
};
