///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap1
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap1_EXIT(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 999;
	condition		= DIA_Parlan_Kap1_EXIT_Condition;
	information		= DIA_Parlan_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlan_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***************
// B_Parlan_Hammer
// ***************

var int Parlan_Hammer; // damit es nur EINMAL kommt

func void B_Parlan_HAMMER()
{
	AI_Output(self, other, "DIA_Parlan_HAMMER_05_00"); //（ 庄 重 的 ） 等 一 会 ， 我 的 孩 子 。
	AI_Output(self, other, "DIA_Parlan_HAMMER_05_01"); //传 言 说 ， 一 个 珍 贵 的 宝 物 在 圣 所 里 ‘ 失 踪 ’ 了 。
	AI_Output(self, other, "DIA_Parlan_HAMMER_05_02"); //我 根 本 不 想 再 继 续 了 解 此 事 - 我 希 望 它 能 回 到 本 来 的 地 方 。

	Parlan_Hammer = TRUE;
};

// ************************************************************
// 					Petzmaster: Schulden offen
// ************************************************************

// ---------------------------
var int Parlan_LastPetzCounter;
var int Parlan_LastPetzCrime;
// ---------------------------
instance DIA_Parlan_PMSchulden(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 1;
	condition		= DIA_Parlan_PMSchulden_Condition;
	information		= DIA_Parlan_PMSchulden_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Parlan_PMSchulden_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Parlan_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Parlan_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Parlan_PMSchulden_Info()
{
	// ------ Hammer genommen ------
	if ((Parlan_Hammer == FALSE)
	&& (Hammer_Taken == TRUE)
	&& (other.guild == GIL_NOV)
	&& (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};

	AI_Output(self, other, "DIA_Parlan_PMSchulden_05_00"); //你 已 经 违 反 了 我 们 社 团 的 规 则 。

	if (B_GetTotalPetzCounter(self) > Parlan_LastPetzCounter)
	{
		AI_Output(self, other, "DIA_Parlan_PMSchulden_05_01"); //而 且 虽 然 你 已 经 受 到 了 指 控 ， 但 是 你 还 要 承 担 更 多 的 罪 行 ！

		if (Parlan_Schulden < 1000)
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_02"); //你 的 罪 行 只 能 向 修 道 院 进 行 巨 额 的 捐 赠 才 能 清 除 。
			AI_Output(other, self, "DIA_Parlan_PMAdd_15_00"); //多 少 钱 ？

			var int diff; diff = (B_GetTotalPetzCounter(self) - Parlan_LastPetzCounter);

			if (diff > 0)
			{
				Parlan_Schulden = Parlan_Schulden + (diff * 50);
			};

			if (Parlan_Schulden > 1000) { Parlan_Schulden = 1000; };
			B_Say_Gold(self, other, Parlan_Schulden);
		}
		else
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_03"); //你 以 为 你 是 谁 ？ 祈 求 英 诺 斯 宽 恕 你 的 行 为 ！
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Parlan_LastPetzCrime)
	{
		AI_Output(self, other, "DIA_Parlan_PMSchulden_05_04"); //你 的 处 境 已 经 改 变 。

		if (Parlan_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_05"); //没 有 其 它 目 击 证 人 看 到 你 谋 杀 ！
		};

		if ((Parlan_LastPetzCrime == CRIME_THEFT)
		|| ((Parlan_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_06"); //现 在 没 有 人 愿 意 证 明 你 偷 窃 ！
		};

		if ((Parlan_LastPetzCrime == CRIME_ATTACK)
		|| ((Parlan_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_07"); //没 有 其 它 原 告 愿 意 证 明 你 争 吵 ！
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_08"); //所 有 针 对 你 的 指 控 都 终 止 了 ！
		};

		AI_Output(self, other, "DIA_Parlan_PMSchulden_05_09"); //也 许 你 能 欺 骗 我 - 但 是 英 诺 斯 知 道 你 的 所 作 所 为 ！

		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_10"); //你 的 罪 现 在 得 到 了 豁 免 。
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_11"); //注 意 不 要 做 错 事 ！

			Parlan_Schulden = 0;
			Parlan_LastPetzCounter = 0;
			Parlan_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_12"); //你 要 支 付 你 的 罚 金 - 这 是 英 诺 斯 的 意 愿 ！
			B_Say_Gold(self, other, Parlan_Schulden);
			AI_Output(self, other, "DIA_Parlan_PMSchulden_05_13"); //把 你 从 你 的 罪 恶 中 解 脱 出 来 ！
		};
	};

	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Parlan_PMSchulden);
		Info_ClearChoices(DIA_Parlan_PETZMASTER);
		Info_AddChoice(DIA_Parlan_PMSchulden, "我 还 没 有 足 够 的 金 币 ！", DIA_Parlan_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Parlan_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Parlan_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
		{
			Info_AddChoice(DIA_Parlan_PMSchulden, "我 想 要 支 付 罚 金 。", DIA_Parlan_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Parlan_PMSchulden_HowMuchAgain()
{
	AI_Output(other, self, "DIA_Parlan_PMSchulden_HowMuchAgain_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Parlan_Schulden);

	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PMSchulden, "我 还 没 有 足 够 的 金 币 ！", DIA_Parlan_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Parlan_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Parlan_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PMSchulden, "我 想 要 支 付 罚 金 。", DIA_Parlan_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Parlan_PETZMASTER) ###

// ************************************************************
// 			  			 PETZ-MASTER
// ************************************************************
instance DIA_Parlan_PETZMASTER(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 1;
	condition		= DIA_Parlan_PETZMASTER_Condition;
	information		= DIA_Parlan_PETZMASTER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Parlan_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Parlan_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Parlan_PETZMASTER_Info()
{
	// ------ Hammer genommen ------
	if ((Parlan_Hammer == FALSE)
	&& (Hammer_Taken == TRUE)
	&& (other.guild == GIL_NOV)
	&& (Npc_IsDead(Garwig) == FALSE))
	{
		B_Parlan_HAMMER();
	};

	Parlan_Schulden = 0; // weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...

	// ------ SC hat mit Parlan noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_00"); //我 们 还 没 彼 此 交 谈 ， 你 就 已 经 惹 上 了 罪 恶 的 重 担 ！
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_01"); //你 犯 下 了 最 重 的 罪 行 ！ 凶 手 ！

		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
		Parlan_Schulden = Parlan_Schulden + 500; // PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_02"); //你 已 经 给 自 己 背 上 了 更 多 的 罪 行 ！
		};

		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_03"); //如 果 由 我 负 责 的 话 ， 你 已 经 被 当 场 定 罪 了 ， 你 这 个 凶 手 ！
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_04"); //无 论 如 何 ， 如 果 你 为 所 犯 下 的 罪 行 支 付 罚 金 的 话 ， 我 将 赦 免 你 的 罪 行 ！
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_05"); //盗 窃 违 反 了 修 道 院 的 规 定 ！
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_06"); //此 外 ， 你 还 破 坏 了 其 它 的 规 定 。
		};

		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_07"); //这 些 罪 行 一 定 要 受 到 惩 罚 。 那 是 英 诺 斯 的 法 律 。
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_08"); //你 要 向 修 道 院 支 付 适 当 的 罚 金 ！

		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_09"); //我 们 不 允 许 在 修 道 院 中 争 吵 。 这 种 行 为 违 背 了 我 们 的 规 定 。

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_10"); //你 为 什 么 要 杀 我 们 的 绵 羊 ？
		};

		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_11"); //我 们 在 这 里 生 活 要 遵 守 规 则 。 那 也 适 用 于 你 。
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_12"); //因 为 你 的 罪 行 ， 你 需 要 再 次 捐 赠 。

		Parlan_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self, other, "DIA_Parlan_PETZMASTER_05_13"); //你 杀 了 我 们 的 绵 羊 ， 你 必 须 要 赔 偿 ！

		Parlan_Schulden = 100;
	};

	AI_Output(other, self, "DIA_Parlan_PETZMASTER_15_14"); //多 少 ？

	if (Parlan_Schulden > 1000) { Parlan_Schulden = 1000; };
	B_Say_Gold(self, other, Parlan_Schulden);

	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
	Info_AddChoice(DIA_Parlan_PETZMASTER, "我 还 没 有 足 够 的 金 币 ！", DIA_Parlan_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Parlan_Schulden)
	{
		Info_AddChoice(DIA_Parlan_PETZMASTER, "我 想 要 支 付 罚 金 。", DIA_Parlan_PETZMASTER_PayNow);
	};
};

func void DIA_Parlan_PETZMASTER_PayNow()
{
	AI_Output(other, self, "DIA_Parlan_PETZMASTER_PayNow_15_00"); //我 想 要 支 付 罚 金 ！
	B_GiveInvItems(other, self, itmi_gold, Parlan_Schulden);
	AI_Output(self, other, "DIA_Parlan_PETZMASTER_PayNow_05_01"); //我 接 受 你 的 捐 赠 。 你 的 罪 行 将 得 到 宽 恕 。 愿 英 诺 斯 赐 予 你 智 慧 ， 不 要 再 犯 同 样 的 错 误 。

	B_GrantAbsolution(LOC_MONASTERY);

	Parlan_Schulden = 0;
	Parlan_LastPetzCounter = 0;
	Parlan_LastPetzCrime = CRIME_NONE;

	Info_ClearChoices(DIA_Parlan_PMSchulden); // !!! Info-Choice wird noch von anderem Dialog angesteuert!
	Info_ClearChoices(DIA_Parlan_PETZMASTER);
};

func void DIA_Parlan_PETZMASTER_PayLater()
{
	AI_Output(other, self, "DIA_Parlan_PETZMASTER_PayLater_15_00"); //我 还 没 有 足 够 的 金 币 ！
	AI_Output(self, other, "DIA_Parlan_PETZMASTER_PayLater_05_01"); //在 你 犯 下 这 些 罪 行 之 前 ， 你 就 应 该 想 到 后 果 。
	AI_Output(self, other, "DIA_Parlan_PETZMASTER_PayLater_05_02"); //也 许 这 次 你 会 学 到 一 些 东 西 。 不 再 惹 麻 烦 ， 你 就 不 用 再 赔 偿 。

	Parlan_LastPetzCounter = B_GetTotalPetzCounter(self);
	Parlan_LastPetzCrime = B_GetGreatestPetzCrime(self);

	Info_ClearChoices(DIA_Parlan_PMSchulden);
	Info_ClearChoices(DIA_Parlan_PETZMASTER);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_WELCOME(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 1;
	condition		= DIA_Parlan_WELCOME_Condition;
	information		= DIA_Parlan_WELCOME_Info;
	important		= TRUE;
};

func int DIA_Parlan_WELCOME_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void B_DIA_Parlan_WELCOME_GoForTribute()
{
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_09"); //当 你 做 了 那 样 的 事 时 ， 我 们 会 到 修 道 院 这 里 陈 述 你 的 行 为 。
};

func void B_DIA_Parlan_WELCOME_BringTribute2Gorax()
{
	AI_Output(self, other, "DIA_Addon_Parlan_WELCOME_05_00"); //马 上 把 你 的 贡 金 交 到 修 道 院 的 高 莱 克 斯 那 里 。 他 将 会 做 进 一 步 的 处 理 。
};

func void DIA_Parlan_WELCOME_Info()
{
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_00"); //欢 迎 ， 新 信 徒 ， 我 是 帕 兰 。
	AI_Output(other, self, "DIA_Parlan_WELCOME_15_01"); //我 是 … …
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_02"); //（ 插 嘴 ） … … 一 个 新 信 徒 。 你 以 前 是 谁 并 不 重 要 。 现 在 你 是 英 诺 斯 的 仆 人 。 事 实 就 是 这 样 。
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_03"); //在 被 火 焰 兄 弟 会 接 纳 之 后 ， 你 以 前 的 所 有 罪 行 都 将 得 到 赦 免 。
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_04"); //愿 英 诺 斯 祝 福 这 个 人 ， 他 用 一 生 来 贡 献 ， 并 洗 清 他 的 罪 ！
	AI_Output(other, self, "DIA_Parlan_WELCOME_15_05"); //现 在 呢 ？
	AI_Output(self, other, "DIA_Parlan_WELCOME_05_06"); //首 先 你 必 须 履 行 新 信 徒 的 职 责 。 你 将 要 为 兄 弟 会 工 作 和 服 务 。

	B_GrantAbsolution(LOC_ALL);
	Snd_Play("LEVELUP");

	Log_CreateTopic(Topic_Gemeinschaft, LOG_MISSION);
	Log_SetTopicStatus(Topic_Gemeinschaft, LOG_RUNNING);
	B_LogEntry(Topic_Gemeinschaft, Topic_Gemeinschaft_1);

	if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == FALSE) // ADDON
	{
		if (Liesel_Giveaway == FALSE)
		{
			AI_Output(self, other, "DIA_Parlan_WELCOME_05_07"); //但 是 先 把 你 的 绵 羊 送 到 奥 波 罗 斯 那 里 ， 他 会 照 看 它 的 。
		};

		if (DIA_Gorax_GOLD_perm == FALSE)
		{
			AI_Output(self, other, "DIA_Parlan_WELCOME_05_08"); //你 可 以 把 你 的 金 币 交 给 高 莱 克 斯 ， 他 是 我 们 的 管 理 员 。 你 可 以 在 酒 窖 找 到 他 。
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	}
	// ADDON>
	else
	{
		if (DIA_Gorax_GOLD_perm == FALSE)
		{
			B_DIA_Parlan_WELCOME_BringTribute2Gorax();
			B_DIA_Parlan_WELCOME_GoForTribute();
		};
	};

	// ADDON<
};

///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Auge(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 2;
	condition		= DIA_Parlan_Auge_Condition;
	information		= DIA_Parlan_Auge_Info;
	description		= "我 在 找 英 诺 斯 之 眼 。";
};

func int DIA_Parlan_Auge_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Auge_Info()
{
	AI_Output(other, self, "DIA_Parlan_Auge_15_00"); //我 在 找 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Parlan_Auge_05_01"); //我 不 知 道 那 是 谁 告 诉 你 的 - 但 是 这 个 神 圣 的 宝 物 不 是 任 何 人 都 能 得 到 的 。
	AI_Output(other, self, "DIA_Parlan_Auge_15_02"); //英 诺 斯 之 眼 保 存 在 哪 里 ？
	AI_Output(self, other, "DIA_Parlan_Auge_05_03"); //越 少 有 人 知 道 这 个 秘 密 ， 它 的 保 护 就 越 严 密 。 寻 找 它 - 然 而 你 找 不 到 。
};

///////////////////////////////////////////////////////////////////////
//	Info Amulett
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Amulett(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 3;
	condition		= DIA_Parlan_Amulett_Condition;
	information		= DIA_Parlan_Amulett_Info;
	description		= "告 诉 我 关 于 英 诺 斯 之 眼 的 事 。";
};

func int DIA_Parlan_Amulett_Condition()
{
	if ((Kapitel <= 2)
	&& Npc_KnowsInfo(other, DIA_Parlan_Auge))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Amulett_Info()
{
	AI_Output(other, self, "DIA_Parlan_Amulett_15_00"); //告 诉 我 关 于 英 诺 斯 之 眼 的 事 。
	AI_Output(self, other, "DIA_Parlan_Amulett_05_01"); //好 吧 。 英 诺 斯 之 眼 包 含 有 英 诺 斯 的 一 部 分 神 力 。 只 有 英 诺 斯 选 择 的 仆 人 才 能 配 戴 这 个 护 身 符 。
	AI_Output(self, other, "DIA_Parlan_Amulett_05_02"); //制 造 它 是 为 了 在 邪 恶 来 临 的 时 候 ， 保 护 我 们 不 受 侵 害 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Hagen(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 2;
	condition		= DIA_Parlan_Hagen_Condition;
	information		= DIA_Parlan_Hagen_Info;
	description		= "我 需 要 和 圣 骑 士 的 首 领 谈 一 下 ！";
};

func int DIA_Parlan_Hagen_Condition()
{
	if ((Kapitel <= 2)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Hagen_Info()
{
	AI_Output(other, self, "DIA_Parlan_Hagen_15_00"); //我 需 要 和 圣 骑 士 的 首 领 谈 一 下 ！
	AI_Output(self, other, "DIA_Parlan_Hagen_05_01"); //哈 根 勋 爵 不 接 见 新 信 徒 - 只 有 我 们 这 样 的 魔 法 师 可 以 见 他 。
};

///////////////////////////////////////////////////////////////////////
//	Info WORK
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_WORK(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 2;
	condition		= DIA_Parlan_WORK_Condition;
	information		= DIA_Parlan_WORK_Info;
	permanent		= TRUE;
	description		= "我 怎 么 才 能 为 组 织 服 务 ？";
};

// ------------------------------------
var int DIA_Parlan_WORK_perm;
// ------------------------------------
func int DIA_Parlan_WORK_Condition()
{
	if ((Kapitel == 1)
	&& (Npc_KnowsInfo(other, DIA_Parlan_KNOWSJUDGE) == FALSE)
	&& Npc_KnowsInfo(other, DIA_Parlan_WELCOME)
	&& (DIA_Parlan_WORK_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_WORK_Info()
{
	AI_Output(other, self, "DIA_Parlan_WORK_15_00"); //我 怎 么 才 能 为 组 织 服 务 ？

	// HACK
	if ((Liesel_Giveaway == FALSE)
	|| (DIA_Gorax_GOLD_perm == FALSE))
	{
		AI_Output(self, other, "DIA_Parlan_WELCOME_05_06"); //首 先 你 必 须 履 行 新 信 徒 的 职 责 。 你 将 要 为 兄 弟 会 工 作 和 服 务 。

		if (Liesel_Giveaway == FALSE)
		{
			AI_Output(self, other, "DIA_Parlan_WELCOME_05_07"); //但 是 先 把 你 的 绵 羊 送 到 奥 波 罗 斯 那 里 ， 他 会 照 看 它 的 。
		};

		if (DIA_Gorax_GOLD_perm == FALSE)
		{
			// ADDON>
			if (Pedro_NOV_Aufnahme_LostInnosStatue_Daron == TRUE)
			{
				B_DIA_Parlan_WELCOME_BringTribute2Gorax();
				B_DIA_Parlan_WELCOME_GoForTribute();
			}
			// ADDON<
			else
			{
				AI_Output(self, other, "DIA_Parlan_WELCOME_05_08"); //你 可 以 把 你 的 金 币 交 给 高 莱 克 斯 ， 他 是 我 们 的 管 理 员 。 你 可 以 在 酒 窖 找 到 他 。
				AI_Output(self, other, "DIA_Parlan_WELCOME_05_09"); //当 你 做 了 那 样 的 事 时 ， 我 们 会 到 修 道 院 这 里 陈 述 你 的 行 为 。
			};
		};

		AI_StopProcessInfos(self);
	}
	else if (Wld_IsTime(22, 00, 07, 30))
	{
		AI_Output(self, other, "DIA_Parlan_WORK_NIGHT_05_01"); //现 在 是 和 平 时 期 。 新 信 徒 的 工 作 从 早 晨 开 始 ， 一 直 到 天 黑 。
		AI_Output(self, other, "DIA_Parlan_WORK_NIGHT_05_02"); //你 也 该 休 息 了 。 等 工 作 时 间 开 始 的 时 候 再 来 。

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Parlan_WORK_05_03"); //同 其 它 魔 法 师 谈 谈 。 他 们 会 给 你 任 务 。
		AI_Output(self, other, "DIA_Parlan_WORK_05_04"); //我 会 监 督 你 的 工 作 ， 当 你 完 成 了 足 够 多 的 任 务 后 ， 你 将 会 得 到 进 入 图 书 馆 学 习 院 英 诺 斯 的 圣 经 的 许 可 。

		DIA_Parlan_WORK_perm = TRUE;
		MIS_KlosterArbeit = LOG_RUNNING;
		B_LogEntry(Topic_Gemeinschaft, Topic_Gemeinschaft_2);
	};
};

///////////////////////////////////////////////////////////////////////
//	Missions Abfrage Stand der Dinge
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Stand(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 23;
	condition		= DIA_Parlan_Stand_Condition;
	information		= DIA_Parlan_Stand_Info;
	permanent		= TRUE;
	description		= "我 可 以 进 入 图 书 馆 了 吗 ？";
};

func int DIA_Parlan_Stand_Condition()
{
	if ((MIS_KlosterArbeit == LOG_RUNNING)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Stand_Info()
{
	Kloster_Punkte = 0;

	AI_Output(other, self, "DIA_Parlan_Stand_15_00"); //我 可 以 进 入 图 书 馆 了 吗 ？

	if (MIS_NeorasPflanzen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_01"); //你 要 给 尼 欧 莱 斯 兄 弟 找 一 些 火 荨 麻 。
		Kloster_Punkte = (Kloster_Punkte + 2);
	};

	if (MIS_Neorasrezept == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_02"); //你 已 经 找 到 了 尼 欧 莱 斯 修 士 的 配 方 。
		Kloster_Punkte = (Kloster_Punkte + 2);
	};

	if (MIS_IsgarothWolf == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_03"); //你 已 经 消 灭 了 威 胁 神 殿 的 黑 狼 。
		Kloster_Punkte = (Kloster_Punkte + 1);
	};

	if (MIS_ParlanFegen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_04"); //你 已 经 成 功 地 找 到 了 四 名 新 信 徒 来 清 理 房 间 。
		Kloster_Punkte = (Kloster_Punkte + 3);
	};

	if (MIS_GoraxEssen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_05"); //你 已 经 按 照 高 莱 克 斯 修 士 的 指 示 ， 公 正 地 把 食 物 分 配 给 了 所 有 的 新 信 徒 。
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxEssen == LOG_FAILED)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_06"); //高 莱 克 斯 对 你 不 满 意 ， 因 为 你 没 有 公 平 地 分 发 食 物 。
	};

	if (MIS_GoraxWein == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_07"); //你 已 经 卖 掉 了 葡 萄 酒 ， 并 使 高 莱 克 斯 感 到 满 意 。
		Kloster_Punkte = (Kloster_Punkte + 1);
	}
	else if (MIS_GoraxWein == LOG_FAILED)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_08"); //关 于 葡 萄 酒 的 事 情 说 得 越 少 越 好 … …
	};

	if (Kloster_Punkte >= 8)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_09"); //是 的 ， 你 已 经 工 作 得 足 够 了 。 现 在 你 已 经 可 以 研 究 英 诺 斯 的 学 说 了 。 去 和 图 书 馆 的 大 师 希 格 莱 斯 谈 谈 。
		AI_Output(self, other, "DIA_Parlan_Stand_05_10"); //我 因 此 交 给 你 这 把 钥 匙 。
		Parlan_Erlaubnis = TRUE;
		MIS_KlosterArbeit = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02", GIL_PUBLIC);
		B_GiveInvItems(self, other, ItKe_KlosterBibliothek, 1);

		// laufende Arbeiten im Log verschwinden lassen
		if (MIS_NeorasPflanzen == LOG_RUNNING)
		{
			MIS_NeorasPflanzen = LOG_OBSOLETE;
		};

		if (MIS_Neorasrezept == LOG_RUNNING)
		{
			MIS_Neorasrezept = LOG_OBSOLETE;
		};

		if (MIS_IsgarothWolf == LOG_RUNNING)
		{
			MIS_IsgarothWolf = LOG_OBSOLETE;
		};

		if (MIS_ParlanFegen == LOG_RUNNING)
		{
			MIS_ParlanFegen = LOG_OBSOLETE;
		};

		if (MIS_GoraxEssen == LOG_RUNNING)
		{
			MIS_GoraxEssen = LOG_OBSOLETE;
		};

		if (MIS_GoraxWein == LOG_RUNNING)
		{
			MIS_GoraxWein = LOG_OBSOLETE;
		};

		if (MIS_MardukBeten == LOG_RUNNING)
		{
			MIS_MardukBeten = LOG_OBSOLETE;
		};

		B_CheckLog();
	}
	else if (Kloster_Punkte >= 1)
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_11"); //你 当 然 做 了 一 些 工 作 ， 但 是 你 的 职 责 是 继 续 为 组 织 服 务 。
	}
	else // 0 Punkte
	{
		AI_Output(self, other, "DIA_Parlan_Stand_05_12"); //首 先 履 行 你 为 组 织 服 务 的 职 责 。 当 你 的 工 作 完 成 后 ， 我 们 再 谈 这 件 事 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Aufgabe(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 10;
	condition		= DIA_Parlan_Aufgabe_Condition;
	information		= DIA_Parlan_Aufgabe_Info;
	description		= "你 有 任 务 给 我 吗 ？";
};

func int DIA_Parlan_Aufgabe_Condition()
{
	if (MIS_KlosterArbeit == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Parlan_Aufgabe_15_00"); //你 有 任 务 给 我 吗 ？
	AI_Output(self, other, "DIA_Parlan_Aufgabe_05_01"); //嗯 … … 是 的 ， 你 确 实 能 为 组 织 做 某 些 事 情 。
	AI_Output(self, other, "DIA_Parlan_Aufgabe_05_02"); //新 信 徒 的 房 间 需 要 好 好 打 扫 一 下 。 去 干 吧 。
	AI_Output(other, self, "DIA_Parlan_Aufgabe_15_03"); //但 是 那 要 很 久 … …
	AI_Output(self, other, "DIA_Parlan_Aufgabe_05_04"); //那 你 最 好 马 上 开 始 ， 不 是 吗 ？

	MIS_ParlanFegen = LOG_RUNNING;

	Log_CreateTopic(Topic_ParlanFegen, LOG_MISSION);
	Log_SetTopicStatus(Topic_ParlanFegen, LOG_RUNNING);
	B_LogEntry(Topic_ParlanFegen, Topic_ParlanFegen_7);
};

///////////////////////////////////////////////////////////////////////
//	Info alle sind am Fegen
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Fegen(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 3;
	condition		= DIA_Parlan_Fegen_Condition;
	information		= DIA_Parlan_Fegen_Info;
	permanent		= TRUE;
	description		= "关 于 新 信 徒 的 房 间 … …";
};

// ------------------------------------
var int DIA_Parlan_Fegen_permanent;
// ------------------------------------
func int DIA_Parlan_Fegen_Condition()
{
	if ((MIS_ParlanFegen == LOG_RUNNING)
	&& (DIA_Parlan_Fegen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Fegen_Info()
{
	AI_Output(other, self, "DIA_Parlan_Fegen_15_00"); //关 于 新 信 徒 的 房 间 … …

	if (NOV_Helfer >= 4)
	{
		AI_Output(self, other, "DIA_Parlan_Fegen_05_01"); //你 实 际 上 找 到 了 四 名 新 信 徒 来 帮 助 你 。 我 想 他 们 现 在 可 以 回 去 做 他 们 的 日 常 工 作 了 。
		AI_Output(self, other, "DIA_Parlan_Fegen_05_02"); //干 得 好 ， 新 信 徒 。 你 已 经 完 成 了 我 交 给 你 的 任 务 。
		MIS_ParlanFegen = LOG_SUCCESS;
		B_GivePlayerXP(XP_ParlanFegen);
		DIA_Parlan_Fegen_permanent = TRUE;

		B_StartOtherRoutine(Feger1, "START");
		B_StartOtherRoutine(Feger2, "START");
		B_StartOtherRoutine(Feger3, "START");
		B_StartOtherRoutine(Babo, "START");
	}
	else
	{
		AI_Output(self, other, "DIA_Parlan_Fegen_05_03"); //无 可 置 疑 - 这 不 是 一 个 简 单 的 任 务 。 但 是 在 英 诺 斯 的 帮 助 下 ， 你 会 完 成 的 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info LEARN
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_LEARN(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 23;
	condition		= DIA_Parlan_LEARN_Condition;
	information		= DIA_Parlan_LEARN_Info;
	description		= "我 怎 么 才 能 学 习 魔 法 技 能 ？";
};

func int DIA_Parlan_LEARN_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Parlan_Hagen))
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Parlan_LEARN_Info()
{
	AI_Output(other, self, "DIA_Parlan_LEARN_15_00"); //我 怎 么 才 能 学 习 魔 法 技 能 ？
	AI_Output(self, other, "DIA_Parlan_LEARN_05_01"); //你 不 是 到 这 里 来 接 受 魔 法 礼 物 的 - 你 来 这 里 是 为 英 诺 斯 服 务 。
	AI_Output(self, other, "DIA_Parlan_LEARN_05_02"); //但 是 我 能 教 你 如 何 增 强 你 的 魔 法 力 量 。

	B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_9);
};

///////////////////////////////////////////////////////////////////////
//	Info KNOWSJUDGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_KNOWSJUDGE(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 23;
	condition		= DIA_Parlan_KNOWSJUDGE_Condition;
	information		= DIA_Parlan_KNOWSJUDGE_Info;
	description		= "我 要 参 加 火 焰 测 试 。";
};

func int DIA_Parlan_KNOWSJUDGE_Condition()
{
	if ((other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == TRUE)
	&& (Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_KNOWSJUDGE_Info()
{
	AI_Output(other, self, "DIA_Parlan_KNOWSJUDGE_15_00"); //我 要 参 加 火 焰 测 试 。
	AI_Output(self, other, "DIA_Parlan_KNOWSJUDGE_05_01"); //什 么 … … ？ 嗯 … … （ 坚 持 的 ） 你 真 是 认 真 的 吗 ？
	AI_Output(other, self, "DIA_Parlan_KNOWSJUDGE_15_02"); //我 坚 持 。
	AI_Output(self, other, "DIA_Parlan_KNOWSJUDGE_05_03"); //你 是 一 个 特 别 的 新 信 徒 。 好 吧 ， 如 果 你 是 认 真 的 的 话 ， 那 么 去 和 大 师 皮 罗 卡 谈 谈 。

	B_LogEntry(TOPIC_FireContest, TOPIC_FireContest_3);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH_MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH_MANA(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 10;
	condition		= DIA_Parlan_TEACH_MANA_Condition;
	information		= DIA_Parlan_TEACH_MANA_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 魔 法 能 力 。";
};

func int DIA_Parlan_TEACH_MANA_Condition()
{
	if (((other.guild == GIL_KDF)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(hero, DIA_Parlan_LEARN))
	&& (Parlan_Sends == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_MANA_Info()
{
	AI_Output(other, self, "DIA_Parlan_TEACH_MANA_15_00"); //我 想 要 增 加 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, DIALOG_BACK, DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self, other, "DIA_Parlan_TEACH_MANA_05_00"); //你 的 魔 法 力 量 增 强 了 。 我 无 法 再 帮 助 你 继 续 提 高 了 。
		AI_Output(self, other, "DIA_Parlan_TEACH_MANA_05_01"); //如 果 你 想 继 续 学 习 ， 去 请 求 皮 罗 卡 。
		Parlan_Sends = TRUE;
	};

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
};

func void DIA_Parlan_TEACH_MANA_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MED);

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, DIALOG_BACK, DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Parlan_TEACH_MANA_5);
};

func void DIA_Parlan_TEACH_MANA_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MED);

	Info_ClearChoices(DIA_Parlan_TEACH_MANA);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, DIALOG_BACK, DIA_Parlan_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Parlan_TEACH_MANA_1);
	Info_AddChoice(DIA_Parlan_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Parlan_TEACH_MANA_5);
};

///////////////////////////////////////////////////////////////////////
//	Info MAGE
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_MAGE(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 2;
	condition		= DIA_Parlan_MAGE_Condition;
	information		= DIA_Parlan_MAGE_Info;
	important		= TRUE;
};

func int DIA_Parlan_MAGE_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_MAGE_Info()
{
	AI_Output(self, other, "DIA_Parlan_MAGE_05_00"); //你 已 经 宣 读 了 你 的 誓 言 ， 兄 弟 。 欢 迎 加 入 我 们 。
	AI_Output(self, other, "DIA_Parlan_MAGE_05_01"); //当 你 得 到 足 够 的 经 验 后 ， 我 将 指 导 你 学 习 魔 法 环 。
	AI_Output(self, other, "DIA_Parlan_MAGE_05_02"); //拿 上 这 块 咒 语 石 作 为 在 你 手 中 流 淌 的 力 量 的 像 征 。

	B_GiveInvItems(self, other, Itmi_RunebLank, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_01
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE1(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 99;
	condition		= DIA_Parlan_CIRCLE1_Condition;
	information		= DIA_Parlan_CIRCLE1_Info;
	permanent		= TRUE;
	description		= "教 我 第 一 环 魔 法 。";
};

func int DIA_Parlan_CIRCLE1_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE1_Info()
{
	AI_Output(other, self, "DIA_Parlan_TECH_CIRCLE1_15_00"); //教 我 第 一 环 魔 法 。

	if (B_TeachMagicCircle(self, other, 1))
	{
		AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE1_05_01"); //第 一 个 魔 法 环 将 允 许 你 使 用 你 已 经 制 造 出 来 的 咒 语 。
		AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE1_05_02"); //你 现 在 可 以 学 习 魔 法 公 式 来 制 造 你 自 己 的 咒 语 。
		AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE1_05_03"); //我 们 每 个 人 都 擅 长 某 一 方 面 的 魔 法 。 所 以 考 虑 好 你 要 学 习 哪 种 魔 法 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_02
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE2(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 99;
	condition		= DIA_Parlan_CIRCLE2_Condition;
	information		= DIA_Parlan_CIRCLE2_Info;
	permanent		= TRUE;
	description		= "教 我 第 二 环 魔 法 。";
};

func int DIA_Parlan_CIRCLE2_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE2_Info()
{
	AI_Output(other, self, "DIA_Parlan_TECH_CIRCLE2_15_00"); //教 我 第 二 环 魔 法 。

	if (Kapitel >= 2)
	{
		if (B_TeachMagicCircle(self, other, 2))
		{
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE2_05_01"); //现 在 进 入 第 二 环 ， 并 学 习 控 制 更 强 大 的 魔 法 。
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE2_05_02"); //但 是 同 时 要 记 住 ， 你 也 担 负 着 责 任 。 不 是 对 我 ， 也 不 是 对 皮 罗 卡 - 而 是 英 诺 斯 。
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE2_05_03"); //他 指 示 你 方 向 - 但 是 你 的 行 动 形 成 了 道 路 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE2_05_04"); //时 机 还 没 有 到 来 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TECH_CIRCLE_03
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_CIRCLE3(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 99;
	condition		= DIA_Parlan_CIRCLE3_Condition;
	information		= DIA_Parlan_CIRCLE3_Info;
	permanent		= TRUE;
	description		= "教 我 第 三 环 魔 法 。";
};

func int DIA_Parlan_CIRCLE3_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parlan_MAGE)
	&& (other.guild == GIL_KDF)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void DIA_Parlan_CIRCLE3_Info()
{
	AI_Output(other, self, "DIA_Parlan_TECH_CIRCLE3_15_00"); //教 我 第 三 环 魔 法 。

	if (Kapitel >= 3)
	{
		if (B_TeachMagicCircle(self, other, 3))
		{
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE3_05_01"); //是 的 ， 是 时 候 了 。 现 在 进 入 第 三 个 魔 法 环 。 新 魔 法 在 等 着 你 。
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE3_05_02"); //你 需 要 它 们 ， 因 为 邪 恶 正 在 靠 近 ， 只 有 依 靠 英 诺 斯 的 力 量 才 能 阻 止 它 。
			AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE3_05_03"); //我 已 经 把 我 所 会 的 环 都 教 给 你 了 。 卡 拉 斯 将 传 授 你 更 高 级 的 环 。

			B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_10);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Parlan_TECH_CIRCLE3_05_04"); //你 还 没 有 到 学 习 第 三 环 的 时 候 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_TEACH(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 3;
	condition		= DIA_Parlan_TEACH_Condition;
	information		= DIA_Parlan_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我 （ 制 造 咒 语 ）";
};

func int DIA_Parlan_TEACH_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Parlan_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;

	AI_Output(other, self, "DIA_Parlan_TEACH_15_00"); //教 给 我 ！

	Info_ClearChoices(DIA_Parlan_TEACH);
	Info_AddChoice(DIA_Parlan_TEACH, DIALOG_BACK, DIA_Parlan_TEACH_BACK);

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_LightHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LightHeal)), DIA_Parlan_TEACH_LIGHT_HEAL);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_LIGHT, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LIGHT)), DIA_Parlan_TEACH_LIGHT);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_WINDFIST, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_WINDFIST)), DIA_Parlan_TEACH_WINDFIST);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_Sleep, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Sleep)), DIA_Parlan_TEACH_Sleep);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_MediumHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_MediumHeal)), DIA_Parlan_TEACH_MediumHeal);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_Fear, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Fear)), DIA_Parlan_TEACH_Fear);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_DestroyUndead, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_DestroyUndead)), DIA_Parlan_TEACH_DestroyUndead);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE))
	{
		Info_AddChoice(DIA_Parlan_TEACH, B_BuildLearnString(NAME_SPL_FullHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_FullHeal)), DIA_Parlan_TEACH_FullHeal);
		abletolearn = (abletolearn + 1);
	};

	if (abletolearn < 1)
	{
		AI_Output(self, other, "DIA_Parlan_TEACH_05_01"); //现 在 我 无 法 教 你 更 多 的 公 式 。
	};
};

func void DIA_Parlan_TEACH_BACK()
{
	Info_ClearChoices(DIA_Parlan_TEACH);
};

func void DIA_Parlan_TEACH_LIGHT_HEAL()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LightHeal);
};

func void DIA_Parlan_TEACH_LIGHT()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LIGHT);
};

func void DIA_Parlan_TEACH_WINDFIST()
{
	B_TeachPlayerTalentRunes(self, other, SPL_WINDFIST);
};

func void DIA_Parlan_TEACH_Sleep()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Sleep);
};

func void DIA_Parlan_TEACH_MediumHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_MediumHeal);
};

func void DIA_Parlan_TEACH_Fear()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Fear);
};

func void DIA_Parlan_TEACH_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self, other, SPL_DestroyUndead);
};

func void DIA_Parlan_TEACH_FullHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_FullHeal);
};

// ###########################################
// ##
// ## Kapitel 2
// ##
// ###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap2
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap2_EXIT(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 999;
	condition		= DIA_Parlan_Kap2_EXIT_Condition;
	information		= DIA_Parlan_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlan_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ###########################################
// ##
// ## Kapitel 3
// ##
// ###########################################

func void B_Parlan_Exit()
{
	AI_Output(self, other, "DIA_Parlan_EXIT_05_00"); //愿 英 诺 斯 庇 佑 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap3_EXIT(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 999;
	condition		= DIA_Parlan_Kap3_EXIT_Condition;
	information		= DIA_Parlan_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlan_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info IAmParlan // Sprich nicht mit den Schmuddelnovizen;-)
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_IAmParlan(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 39;
	condition		= DIA_Parlan_IAmParlan_Condition;
	information		= DIA_Parlan_IAmParlan_Info;
	important		= TRUE;
};

func int DIA_Parlan_IAmParlan_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_IsInState(self, ZS_Talk))
	&& ((other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_IAmParlan_Info()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Parlan_IAmParlan_05_00"); //我 看 到 你 已 经 决 定 为 我 们 而 战 。 我 很 高 兴 。
		AI_Output(self, other, "DIA_Parlan_IAmParlan_05_01"); //我 们 需 要 每 一 个 人 。 你 应 该 直 接 同 马 杜 克 交 谈 ， 他 负 责 你 们 圣 骑 士 。
	}
	else
	{
		AI_Output(self, other, "DIA_Parlan_IAmParlan_05_02"); //我 不 知 道 为 什 么 会 允 许 你 进 入 修 道 院 。 我 是 帕 兰 ， 我 负 责 我 们 的 新 信 徒 。
		AI_Output(self, other, "DIA_Parlan_IAmParlan_05_03"); //我 不 想 你 用 愚 蠢 的 问 题 阻 碍 他 们 的 工 作 。 明 白 了 吗 ？

		Parlan_DontTalkToNovice = LOG_RUNNING;

		Info_ClearChoices(DIA_Parlan_IAmParlan);
		Info_AddChoice(DIA_Parlan_IAmParlan, "我 将 会 做 我 愿 意 做 的 事 。", DIA_Parlan_IAmParlan_MyChoice);
		Info_AddChoice(DIA_Parlan_IAmParlan, "当 然 。", DIA_Parlan_IAmParlan_OK);
	};

	Wld_InsertItem(ItKe_KlosterBibliothek, "NW_MONASTERY_CORRIDOR_02");
};

func void DIA_Parlan_IAmParlan_MyChoice()
{
	AI_Output(other, self, "DIA_Parlan_IAmParlan_MyChoice_15_00"); //我 将 会 做 我 愿 意 做 的 事 。
	AI_Output(self, other, "DIA_Parlan_IAmParlan_MyChoice_05_01"); //能 容 忍 你 在 这 里 一 定 有 某 些 原 因 ， 但 是 万 事 都 有 限 度 。
	AI_Output(self, other, "DIA_Parlan_IAmParlan_MyChoice_05_02"); //如 果 你 惹 麻 烦 ， 你 就 要 付 出 代 价 。 所 以 不 要 干 扰 新 信 徒 。

	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

func void DIA_Parlan_IAmParlan_OK()
{
	AI_Output(other, self, "DIA_Parlan_IAmParlan_OK_15_00"); //当 然 。
	AI_Output(self, other, "DIA_Parlan_IAmParlan_OK_05_01"); //我 当 然 希 望 如 此 。

	Info_ClearChoices(DIA_Parlan_IAmParlan);
};

///////////////////////////////////////////////////////////////////////
//	Schlüssel für Bibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Bibliothek(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 40;
	condition		= DIA_Parlan_Bibliothek_Condition;
	information		= DIA_Parlan_Bibliothek_Info;
	description		= "你 还 有 其 它 东 西 给 我 吗 ？";
};

func int DIA_Parlan_Bibliothek_Condition()
{
	if ((other.guild != GIL_KDF)
	&& (Kapitel >= 3)
	&& (other.guild != GIL_SLD)
	&& (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Bibliothek_Info()
{
	AI_Output(other, self, "DIA_Parlan_Bibliothek_15_00"); //你 还 有 其 它 东 西 给 我 吗 ？
	AI_Output(self, other, "DIA_Parlan_Bibliothek_05_01"); //是 的 。 作 为 图 书 馆 的 会 员 ， 你 会 得 到 图 书 馆 的 钥 匙 。 你 在 那 里 能 找 到 修 士 卡 拉 斯 和 希 格 莱 斯 。
	AI_Output(self, other, "DIA_Parlan_Bibliothek_05_02"); //他 指 示 你 方 向 - 但 是 你 的 行 动 形 成 了 道 路 。

	if (other.guild != GIL_PAL)
	{
		AI_Output(self, other, "DIA_Parlan_DontDisturb_05_03"); //但 是 不 要 打 扰 我 的 新 信 徒 ！
	};

	B_GiveInvItems(self, other, ItKe_KlosterBibliothek, 1);
};

///////////////////////////////////////////////////////////////////////
//	Ich wiederhole mich nicht gern
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_DontDisturb(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 39;
	condition		= DIA_Parlan_DontDisturb_Condition;
	information		= DIA_Parlan_DontDisturb_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Parlan_DontDisturb_Condition()
{
	if ((Parlan_DontTalkToNovice == LOG_SUCCESS)
	&& (B_GetGreatestPetzCrime(self) == CRIME_NONE)
	&& ((other.guild != GIL_PAL)
	|| (other.guild != GIL_NOV)
	|| (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Parlan_DontDisturb_Info()
{
	AI_Output(self, other, "DIA_Parlan_DontDisturb_05_00"); //（ 威 胁 ） 我 不 想 再 重 复 。 不 要 打 扰 新 信 徒 。
	AI_Output(self, other, "DIA_Parlan_DontDisturb_05_01"); //他 们 需 要 通 过 体 力 劳 动 来 净 化 他 们 的 灵 魂 ， 并 为 在 修 道 院 中 的 生 活 做 准 备 。
	AI_Output(self, other, "DIA_Parlan_DontDisturb_05_02"); //（ 有 力 的 ） 我 不 能 再 容 忍 继 续 分 心 ！

	Parlan_DontTalkToNovice = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Perm Kap3
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap3U4U5_PERM(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 39;
	condition		= DIA_Parlan_Kap3U4U5_PERM_Condition;
	information		= DIA_Parlan_Kap3U4U5_PERM_Info;
	permanent		= TRUE;
	description		= "我 在 哪 里 可 以 找 到 … …";
};

func int DIA_Parlan_Kap3U4U5_PERM_Condition()
{
	if ((Kapitel >= 3)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap3U4U5_PERM_Info()
{
	AI_Output(other, self, "DIA_Parlan_Kap3_PERM_15_00"); //我 在 哪 里 可 以 找 到 … …

	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM, DIALOG_Back, DIA_Parlan_Kap3U4U5_PERM_Back);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM, "… … 教 堂 ？", DIA_Parlan_Kap3U4U5_PERM_Church);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM, "… … 图 书 馆?", DIA_Parlan_Kap3U4U5_PERM_Library);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM, "… … 小 教 堂 ？", DIA_Parlan_Kap3U4U5_PERM_Chapel);
	Info_AddChoice(DIA_Parlan_Kap3U4U5_PERM, "… … 地 下 室 ？", DIA_Parlan_Kap3U4U5_PERM_Cellar);
};

func void DIA_Parlan_Kap3U4U5_PERM_Back()
{
	Info_ClearChoices(DIA_Parlan_Kap3U4U5_PERM);
};

func void DIA_Parlan_Kap3U4U5_PERM_Church()
{
	AI_Output(other, self, "DIA_Parlan_Kap3U4U5_PERM_Church_15_00"); //… … 教 堂 ？
	// AI_Output(self,other,"DIA_Parlan_Kap3U4U5_PERM_Church_05_01"); // Die Kirche ist das größte Gebäude im Kloster. Du kannst sie gar nicht übersehen.
	AI_Output(self, other, "DIA_Parlan_Add_05_00"); //万 能 的 神 ！ 英 诺 斯 让 你 失 明 了 吗 ？
	AI_Output(self, other, "DIA_Parlan_Add_05_01"); //（ 玩 世 不 恭 的 ） 教 堂 在 哪 里 ？ 哦 天 啊 ， 它 应 该 在 哪 里 ？
};

func void DIA_Parlan_Kap3U4U5_PERM_Library()
{
	AI_Output(other, self, "DIA_Parlan_Kap3U4U5_PERM_Library_15_00"); //… … 图 书 馆?
	// AI_Output(self,other,"DIA_Parlan_Kap3U4U5_PERM_Library_05_01"); // Die Bibliothek ist am Ende des Säulenganges, direkt gegenüber der Kirche.
	AI_Output(self, other, "DIA_Parlan_Add_05_02"); //图 书 馆 在 左 边 柱 廊 的 尽 头 ， 直 接 从 教 堂 穿 过 。
};

func void DIA_Parlan_Kap3U4U5_PERM_Chapel()
{
	AI_Output(other, self, "DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00"); //… … 小 教 堂 ？
	// AI_Output(self,other,"DIA_Parlan_Kap3U4U5_PERM_Chapel_05_01"); // Wenn du das Kloster betrittst, findest du die Kapelle auf der halben Höhe des linken Säulenganges.
	AI_Output(self, other, "DIA_Parlan_Add_05_03"); //小 教 堂 是 沿 着 左 边 柱 廊 走 到 一 半 时 的 那 个 房 间 。 圣 骑 士 在 那 里 向 英 诺 斯 祈 祷 。
};

func void DIA_Parlan_Kap3U4U5_PERM_Cellar()
{
	AI_Output(other, self, "DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00"); //… … 地 下 室 ？
	// AI_Output(self,other,"DIA_Parlan_Kap3U4U5_PERM_Cellar_05_01"); // Der Eingang in die Katakomben ist direkt gegenüber der Kapelle auf halber Höhe des Säulenganges.
	AI_Output(self, other, "DIA_Parlan_Add_05_04"); //地 下 室 的 入 口 在 右 边 柱 廊 的 中 部 。
};

// ###########################################
// ##
// ## Kapitel 4
// ##
// ###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap4_EXIT(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 999;
	condition		= DIA_Parlan_Kap4_EXIT_Condition;
	information		= DIA_Parlan_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlan_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap4_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};

	AI_StopProcessInfos(self);
};

// ###########################################
// ##
// ## Kapitel 5
// ##
// ###########################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT Kap5
///////////////////////////////////////////////////////////////////////
instance DIA_Parlan_Kap5_EXIT(C_INFO)
{
	npc				= KDF_504_Parlan;
	nr				= 999;
	condition		= DIA_Parlan_Kap5_EXIT_Condition;
	information		= DIA_Parlan_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlan_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parlan_Kap5_EXIT_Info()
{
	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		B_Parlan_Exit();
	};

	AI_StopProcessInfos(self);
};
