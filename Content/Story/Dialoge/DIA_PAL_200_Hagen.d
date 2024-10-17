// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Hagen_EXIT(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 999;
	condition		= DIA_Hagen_EXIT_Condition;
	information		= DIA_Hagen_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hagen_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hagen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 					Petzmaster: Schulden offen
// ************************************************************

// ---------------------------
var int Hagen_LastPetzCounter;
var int Hagen_LastPetzCrime;
// ---------------------------
instance DIA_Hagen_PMSchulden(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 1;
	condition		= DIA_Hagen_PMSchulden_Condition;
	information		= DIA_Hagen_PMSchulden_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Hagen_PMSchulden_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Hagen_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Hagen_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Hagen_PMSchulden_Info()
{
	AI_Output(self, other, "DIA_Hagen_PMSchulden_04_00"); //你 来 了 ， 非 常 好 。 你 要 立 刻 支 付 你 的 罚 金 。

	if (B_GetTotalPetzCounter(self) > Hagen_LastPetzCounter)
	{
		var int diff; diff = (B_GetTotalPetzCounter(self) - Hagen_LastPetzCounter);

		if (diff > 0)
		{
			Hagen_Schulden = Hagen_Schulden + (diff * 50);
		};

		if (Hagen_Schulden > 1000) { Hagen_Schulden = 1000; };
		AI_Output(self, other, "DIA_Hagen_PMSchulden_04_01"); //你 并 没 有 严 格 地 遵 守 城 市 的 法 律 ， 是 吗 ？
		AI_Output(self, other, "DIA_Hagen_PMSchulden_04_02"); //你 的 犯 罪 记 录 又 增 加 了 。
		if (Hagen_Schulden < 1000)
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_03"); //而 且 别 告 诉 我 你 不 知 道 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_04"); //你 将 要 支 付 最 高 额 度 的 罚 金 。
			B_Say_Gold(self, other, Hagen_Schulden);
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Hagen_LastPetzCrime)
	{
		AI_Output(self, other, "DIA_Hagen_PMSchulden_04_05"); //嗯 ， 看 起 来 情 况 已 经 改 变 了 。

		if (Hagen_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_06"); //没 有 其 它 目 击 证 人 看 到 你 谋 杀 。
		};

		if ((Hagen_LastPetzCrime == CRIME_THEFT)
		|| ((Hagen_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_07"); //现 在 没 有 人 愿 意 证 明 你 偷 窃 。
		};

		if ((Hagen_LastPetzCrime == CRIME_ATTACK)
		|| ((Hagen_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_08"); //没 有 其 它 人 看 到 你 与 人 争 斗 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_09"); //所 有 针 对 你 的 指 控 都 没 有 效 力 了 。
		};

		AI_Output(self, other, "DIA_Hagen_PMSchulden_04_10"); //我 不 知 道 在 城 市 里 发 生 了 什 么 事 - 我 也 不 想 知 道 。
		AI_Output(self, other, "DIA_Hagen_PMSchulden_04_11"); //只 是 你 要 保 证 别 在 这 里 惹 麻 烦 。
		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_12"); //无 论 如 何 ， 我 已 经 决 定 赦 免 你 的 罪 过 。
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_13"); //你 要 保 证 别 再 卷 入 其 它 的 麻 烦 里 。

			Hagen_Schulden = 0;
			Hagen_LastPetzCounter = 0;
			Hagen_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_14"); //尽 管 如 此 ， 你 还 要 支 付 全 部 的 罚 金 。
			B_Say_Gold(self, other, Hagen_Schulden);
			AI_Output(self, other, "DIA_Hagen_PMSchulden_04_15"); //那 么 ， 你 要 付 吗 ？
		};
	};

	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Hagen_PMSchulden);
		Info_ClearChoices(DIA_Hagen_PETZMASTER);
		Info_AddChoice(DIA_Hagen_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Hagen_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Hagen_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Hagen_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
		{
			Info_AddChoice(DIA_Hagen_PMSchulden, "我 想 要 支 付 罚 金 。", DIA_Hagen_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Hagen_PMSchulden_HowMuchAgain()
{
	AI_Output(other, self, "DIA_Hagen_PMSchulden_HowMuchAgain_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Hagen_Schulden);

	Info_ClearChoices(DIA_Hagen_PMSchulden);
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_AddChoice(DIA_Hagen_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Hagen_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Hagen_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Hagen_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice(DIA_Hagen_PMSchulden, "我 想 要 支 付 罚 金 。", DIA_Hagen_PETZMASTER_PayNow);
	};
};

// *** weitere Choices siehe unten (DIA_Hagen_PETZMASTER) ***

// ************************************************************
// 			  			 PETZ-MASTER
// ************************************************************
instance DIA_Hagen_PETZMASTER(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 1;
	condition		= DIA_Hagen_PETZMASTER_Condition;
	information		= DIA_Hagen_PETZMASTER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Hagen_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Hagen_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Hagen_PETZMASTER_Info()
{
	Hagen_Schulden = 0; // weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...

	// ------ SC hat mit Hagen noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_00"); //久 仰 大 名 。 你 已 经 违 反 了 城 市 的 法 律 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_01"); //你 已 经 给 自 己 惹 了 一 身 麻 烦 。
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_02"); //谋 杀 是 重 罪 ！
		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
		Hagen_Schulden = Hagen_Schulden + 500; // PLUS Mörder-Malus
		if ((PETZCOUNTER_City_Theft + PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_03"); //不 用 提 起 你 的 其 它 犯 罪 。
		};

		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_04"); //卫 兵 得 到 命 令 是 当 场 处 决 杀 人 犯 。
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_05"); //这 座 城 市 里 不 允 许 有 杀 人 犯 。 但 是 你 可 以 支 付 罚 金 以 表 示 你 的 忏 悔 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_06"); //你 被 指 控 盗 窃 ！
		if ((PETZCOUNTER_City_Attack + PETZCOUNTER_City_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_07"); //不 用 提 及 我 听 到 的 其 它 事 了 。
		};

		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_08"); //那 是 对 城 市 法 律 的 违 背 ， 为 此 你 要 支 付 罚 金 。

		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_09"); //你 已 经 涉 嫌 斗 殴 。 因 此 ， 你 已 经 违 反 了 法 律 。

		if (PETZCOUNTER_City_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_10"); //那 么 那 些 关 于 绵 羊 的 事 呢 ？
		};

		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_11"); //违 反 城 市 的 法 律 - 就 是 违 反 英 诺 斯 的 法 律 。
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_12"); //因 此 ， 你 要 付 出 代 价 。

		Hagen_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_13"); //你 在 觊 觎 我 们 的 绵 羊 - 起 初 我 还 不 愿 相 信 。
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_14"); //我 为 什 么 要 为 这 样 的 琐 事 忙 碌 呢 ？
		AI_Output(self, other, "DIA_Hagen_PETZMASTER_04_15"); //你 必 须 支 付 赔 偿 金 ！

		Hagen_Schulden = 100;
	};

	AI_Output(other, self, "DIA_Hagen_PETZMASTER_15_16"); //多 少 钱 ？

	if (Hagen_Schulden > 1000) { Hagen_Schulden = 1000; };
	B_Say_Gold(self, other, Hagen_Schulden);

	Info_ClearChoices(DIA_Hagen_PMSchulden);
	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_AddChoice(DIA_Hagen_PETZMASTER, "我 还 没 有 足 够 的 金 子 ！", DIA_Hagen_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Hagen_Schulden)
	{
		Info_AddChoice(DIA_Hagen_PETZMASTER, "我 想 要 支 付 罚 金 。", DIA_Hagen_PETZMASTER_PayNow);
	};
};

func void DIA_Hagen_PETZMASTER_PayNow()
{
	AI_Output(other, self, "DIA_Hagen_PETZMASTER_PayNow_15_00"); //我 想 要 支 付 罚 金 ！
	B_GiveInvItems(other, self, itmi_gold, Hagen_Schulden);
	AI_Output(self, other, "DIA_Hagen_PETZMASTER_PayNow_04_01"); //好 ！ 我 会 保 证 城 里 的 所 有 人 都 听 说 此 事 - 这 将 恢 复 你 的 一 部 分 声 誉 。

	B_GrantAbsolution(LOC_CITY);

	Hagen_Schulden = 0;
	Hagen_LastPetzCounter = 0;
	Hagen_LastPetzCrime = CRIME_NONE;

	Info_ClearChoices(DIA_Hagen_PETZMASTER);
	Info_ClearChoices(DIA_Hagen_PMSchulden); // !!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Hagen_PETZMASTER_PayLater()
{
	AI_Output(other, self, "DIA_Hagen_PETZMASTER_PayLater_15_00"); //我 没 有 足 够 的 金 币 ！
	AI_Output(self, other, "DIA_Hagen_PETZMASTER_PayLater_04_01"); //那 就 尽 快 赚 点 钱 。
	AI_Output(self, other, "DIA_Hagen_PETZMASTER_PayLater_04_02"); //而 且 我 警 告 你 ： 如 果 你 的 罪 行 再 增 加 的 话 ， 情 况 将 对 你 更 加 不 利 ！

	Hagen_LastPetzCounter = B_GetTotalPetzCounter(self);
	Hagen_LastPetzCrime = B_GetGreatestPetzCrime(self);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Hallo(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Hallo_Condition;
	information		= DIA_Lord_Hagen_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lord_Hagen_Hallo_Condition()
{
	if ((hero.guild != GIL_NONE)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Hallo_Info()
{
	AI_Output(self, other, "DIA_Lord_Hagen_Hallo_04_00"); //我 已 经 听 说 过 你 了 。
	if ((Npc_KnowsInfo(other, DIA_Lothar_EyeInnos))
	|| (Andre_EyeInnos == TRUE))
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_03"); //洛 萨 已 经 汇 报 说 你 要 和 我 说 话 。
		AI_Output(self, other, "DIA_Lord_Hagen_Hallo_04_01"); //你 是 那 个 想 要 英 诺 斯 之 眼 的 陌 生 人 。
	};

	AI_Output(self, other, "DIA_Lord_Hagen_Hallo_04_02"); //我 是 哈 根 勋 爵 。
	AI_Output(self, other, "DIA_Lord_Hagen_Hallo_04_03"); //国 王 的 圣 骑 士 ， 英 诺 斯 神 的 战 士 ， 克 霍 里 尼 斯 的 总 司 令 。
	AI_Output(self, other, "DIA_Lord_Hagen_Hallo_04_04"); //我 有 很 多 事 要 做 。 所 以 不 要 浪 费 我 的 时 间 - 确 切 地 告 诉 我 ， 你 为 什 么 来 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Frieden
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Frieden(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Frieden_Condition;
	information		= DIA_Lord_Hagen_Frieden_Info;
	description		= "我 带 来 了 雇 佣 兵 的 和 平 提 议 ！";
};

func int DIA_Lord_Hagen_Frieden_Condition()
{
	if ((MIS_Lee_Friedensangebot == LOG_RUNNING)
	&& (Npc_HasItems(other, itwr_Passage_MIS) > 0))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Frieden_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Frieden_15_00"); //我 带 来 了 雇 佣 兵 的 和 平 提 议 ！
	B_GiveInvItems(other, self, itwr_Passage_MIS, 1);
	AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_01"); //（ 粗 暴 的 ） 嗯 - 让 我 看 看 ！
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_02"); //我 知 道 李 将 军 。 我 也 知 道 他 被 定 罪 以 后 被 迫 在 流 放 地 劳 动 的 事 。
	AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_03"); //我 认 为 他 是 一 个 值 得 尊 敬 的 人 。 我 准 备 完 全 赦 免 他 - 只 是 他 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_04"); //然 而 ， 那 不 适 用 于 他 的 手 下 。 他 们 大 多 数 都 是 无 耻 的 凶 手 ， 应 该 受 到 那 样 的 惩 罚 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_05"); //我 当 然 不 会 赦 免 他 们 。 就 那 样 向 他 回 报 。
	Hagen_FriedenAbgelehnt = TRUE;
	if (!Npc_KnowsInfo(other, DIA_Lord_Hagen_Armee))
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Frieden_04_06"); //那 是 全 部 的 吗 ？
	};

	B_LogEntry(Topic_Frieden, Topic_Frieden_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Armee
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Armee(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Armee_Condition;
	information		= DIA_Lord_Hagen_Armee_Info;
	description		= "邪 恶 之 源 正 在 离 这 里 非 常 近 的 地 方 聚 集 。 在 矿 藏 山 谷 里 。";
};

func int DIA_Lord_Hagen_Armee_Condition()
{
	if ((!MIS_Lee_Friedensangebot == LOG_RUNNING)
	|| (Hagen_FriedenAbgelehnt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Armee_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Armee_15_00"); //邪 恶 之 源 正 在 离 这 里 非 常 近 的 地 方 聚 集 。 在 矿 藏 山 谷 里 。
	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_01"); //在 矿 藏 山 谷 里 ？ 我 们 已 经 向 那 里 派 遣 了 一 支 远 征 队 。 我 们 也 得 到 报 告 说 关 卡 被 兽 人 占 领 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_02"); //但 是 迄 今 为 止 ， 我 没 收 到 任 何 关 于 邪 恶 军 队 的 消 息 。
	if (Npc_KnowsInfo(other, DIA_Lord_Hagen_Frieden))
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_03"); //难 道 这 只 是 一 个 为 了 让 我 相 信 必 须 要 和 那 些 雇 佣 兵 结 盟 的 诡 计 吗 ？
		AI_Output(other, self, "DIA_Lord_Hagen_Armee_15_04"); //不。
	};

	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_05"); //（ 怀 疑 的 ） 那 是 什 么 样 的 军 队 ？
	AI_Output(other, self, "DIA_Lord_Hagen_Armee_15_06"); //一 支 由 龙 集 合 起 来 的 、 大 批 走 狗 组 成 的 部 队 。
	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_07"); //龙 ？ 按 照 古 铭 文 记 载 ， 自 从 最 后 一 次 见 到 龙 ， 已 经 过 了 几 百 年 。
	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_08"); //告 诉 我 - 我 为 什 么 要 相 信 你 说 的 话 ？
	AI_Output(other, self, "DIA_Lord_Hagen_Armee_15_09"); //但 是 问 题 不 在 于 你 是 否 能 相 信 我 ， 问 题 是 ， 你 是 否 能 承 担 不 相 信 我 陈 述 的 事 实 而 产 生 的 后 果 。
	AI_Output(self, other, "DIA_Lord_Hagen_Armee_04_10"); //只 要 我 没 有 证 据 ， 我 就 不 会 向 那 里 派 一 个 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info Proof
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Proof(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Proof_Condition;
	information		= DIA_Lord_Hagen_Proof_Info;
	permanent		= TRUE;
	description		= "那 你 想 让 我 给 你 找 到 证 据 ？";
};

func int DIA_Lord_Hagen_Proof_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lord_Hagen_Armee)
	&& (Hagen_BringProof == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Proof_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Proof_15_00"); //那 你 想 让 我 给 你 找 到 证 据 ？

	if ((hero.guild != GIL_NONE)
	&& (hero.guild != GIL_NOV))
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Proof_04_01"); //确 实 如 此 。 穿 过 关 卡 ， 然 后 进 入 矿 藏 山 谷 。 到 了 那 里 之 后 ， 寻 找 远 征 军 - 当 你 找 到 他 们 时 ， 去 和 指 挥 官 加 隆 德 谈 谈 。
		AI_Output(self, other, "DIA_Lord_Hagen_Proof_04_02"); //如 果 有 谁 了 解 那 里 的 情 况 的 话 ， 一 定 是 他 。
		AI_Output(self, other, "DIA_Lord_Hagen_Proof_04_03"); //如 果 他 确 认 了 你 的 话 ， 那 么 我 就 帮 助 你 。
		AI_Output(other, self, "DIA_Lord_Hagen_Proof_15_04"); //那 是 说 你 会 把 英 诺 斯 之 眼 交 给 我 ？
		AI_Output(self, other, "DIA_Lord_Hagen_Proof_04_05"); //英 诺 斯 之 眼 … … 好 。 给 我 带 来 证 据 ， 然 后 我 保 证 你 将 得 到 配 戴 那 个 护 身 符 的 许 可 。
		AI_Output(other, self, "DIA_Lord_Hagen_Proof_15_06"); //那 么 ， 我 能 说 在 这 件 事 情 上 我 已 经 得 到 了 你 的 许 诺 吗 ？
		AI_Output(self, other, "DIA_Lord_Hagen_Proof_04_07"); //你 能 - 因 为 那 是 你 应 得 的 。
		Hagen_BringProof = TRUE;
	}
	else
	{
		if (hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_Addon_GuildNeeded_NOV, -1, -1, FONT_Screen, 2);
		}
		else
		{
			PrintScreen(PRINT_Addon_GuildNeeded, -1, -1, FONT_Screen, 2);
		};

		B_Say(self, other, "$NOLEARNNOPOINTS");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Auge(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Auge_Condition;
	information		= DIA_Lord_Hagen_Auge_Info;
	description		= "关 于 英 诺 斯 之 眼 你 了 解 些 什 么 ？";
};

func int DIA_Lord_Hagen_Auge_Condition()
{
	return TRUE;
};

func void DIA_Lord_Hagen_Auge_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Auge_15_00"); //你对伊诺之眼了解多少？
	AI_Output(self, other, "DIA_Lord_Hagen_Auge_04_01"); //它 是 一 个 神 圣 的 宝 物 。 （ 深 思 ） 在 古 老 的 预 言 中 提 到 ， 它 与 龙 之 间 有 联 系 。
	AI_Output(self, other, "DIA_Lord_Hagen_Auge_04_02"); //然 而 ， 铭 文 也 说 到 ， 只 有 英 诺 斯 的 选 择 者 才 能 配 戴 它 。

	if (other.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Lord_Hagen_Auge_15_03"); //我 就 是 英 诺 斯 的 选 择 者 ！
		AI_Output(self, other, "DIA_Lord_Hagen_Auge_04_04"); //那 么 也 许 你 能 戴 上 那 个 护 身 符 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Pass(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Pass_Condition;
	information		= DIA_Lord_Hagen_Pass_Info;
	description		= "我 应 该 怎 么 穿 过 道 路 ？";
};

func int DIA_Lord_Hagen_Pass_Condition()
{
	if ((Hagen_BringProof == TRUE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Pass_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Pass_15_00"); //我 应 该 怎 么 穿 过 道 路 ？
	AI_Output(self, other, "DIA_Lord_Hagen_Pass_04_01"); //我 会 把 关 卡 大 门 的 钥 匙 给 你 ， 但 是 你 要 自 己 设 法 穿 过 兽 人 的 封 锁 。
	AI_Output(self, other, "DIA_Lord_Hagen_Pass_04_02"); //愿 英 诺 斯 保 护 你 。

	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	B_Kapitelwechsel(2, NEWWORLD_ZEN);
	CreateInvItems(self, ItKe_Pass_MIS, 1);
	B_GiveInvItems(self, other, ItKe_Pass_MIS, 1);

	Log_CreateTopic(Topic_MISOLDWORLD, LOG_MISSION);
	Log_SetTopicStatus(Topic_MISOLDWORLD, LOG_RUNNING);
	B_LogEntry(Topic_MISOLDWORLD, Topic_MISOLDWORLD_1);

	if (Fernando_ImKnast == FALSE)
	{
		B_StartOtherRoutine(Fernando, "WAIT");
	};

	Wld_InsertNpc(BDT_1020_Bandit_L, "NW_TROLLAREA_PATH_47"); // Joly: // ADDON stört dann nicht mehr
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lord_Hagen_Ornament(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 10;
	condition		= DIA_Addon_Lord_Hagen_Ornament_Condition;
	information		= DIA_Addon_Lord_Hagen_Ornament_Info;
	description		= "我 在 寻 找 一 个 金 属 的 装 饰 物 。";
};

func int DIA_Addon_Lord_Hagen_Ornament_Condition()
{
	if ((MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_RUNNING)
	&& (Lord_Hagen_GotOrnament == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lord_Hagen_Ornament_Info()
{
	AI_Output(other, self, "DIA_Addon_Lord_Hagen_GiveOrnament_15_00"); //我 在 寻 找 一 个 金 属 的 装 饰 物 。 它 应 该 在 洛 拔 特 的 农 场 附 近 的 石 头 圈 里 。
	AI_Output(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_01"); //如 果 你 说 的 是 这 个 东 西 … … 我 们 曾 经 怀 疑 它 是 一 个 魔 法 咒 语 ， 但 事 实 证 明 它 根 本 毫 无 用 处 。
	AI_Output(self, other, "DIA_Addon_Lord_Hagen_GiveOrnament_04_02"); //如 果 你 想 要 的 话 ， 可 以 给 你 。 我 拿 它 没 用 。

	CreateInvItems(self, ItMi_Ornament_Addon, 1);
	B_GiveInvItems(self, other, ItMi_Ornament_Addon, 1);
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Khorinis
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Khorinis(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Khorinis_Condition;
	information		= DIA_Lord_Hagen_Khorinis_Info;
	description		= "你 为 什 么 要 来 克 霍 里 尼 斯 ？";
};

func int DIA_Lord_Hagen_Khorinis_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lord_Hagen_Armee))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Khorinis_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Khorinis_15_00"); //你 为 什 么 要 来 克 霍 里 尼 斯 ？
	AI_Output(self, other, "DIA_Lord_Hagen_Khorinis_04_01"); //我 们 在 为 王 国 执 行 一 个 重 要 的 任 务 。 我 们 的 命 令 是 由 国 王 罗 巴 尔 直 接 下 达 的 。
	AI_Output(self, other, "DIA_Lord_Hagen_Khorinis_04_02"); //我 告 诉 过 你 ， 我 们 已 经 向 矿 藏 山 谷 派 遣 了 一 支 远 征 队 。 那 就 是 我 们 来 这 里 的 原 因 。
};

///////////////////////////////////////////////////////////////////////
//	Info Minental
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_Minental(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_Minental_Condition;
	information		= DIA_Lord_Hagen_Minental_Info;
	permanent		= TRUE;
	description		= "你 的 人 在 矿 藏 山 谷 里 做 什 么 ？";
};

func int DIA_Lord_Hagen_Minental_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lord_Hagen_Khorinis))
	&& (KnowsPaladins_Ore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Minental_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Minental_15_00"); //你 的 人 在 矿 藏 山 谷 里 做 什 么 ？

	if (Hagen_BringProof == FALSE)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_01"); //我 没 有 理 由 告 诉 你 ！
	}
	else
	{
		if (Garond.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_02"); //你 到 了 那 里 ， 你 就 会 知 道 。
		}
		else
		{
			AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_03"); //好 吧 ， 既 然 你 一 定 会 去 那 里 ， 我 最 好 告 诉 你 。
		};

		AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_04"); //都 是 为 了 魔 法 矿 石 ， 它 可 以 决 定 战 争 的 结 果 。
		AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_05"); //如 果 没 有 足 够 多 的 使 用 魔 法 矿 石 制 造 的 武 器 的 话 ， 国 王 的 军 队 根 本 没 有 任 何 机 会 与 兽 人 精 英 战 士 对 抗 。
		if (other.guild != GIL_SLD)
		{
			AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_06"); //而 这 个 岛 上 的 矿 石 矿 是 我 们 最 后 能 挖 掘 的 了 。
		};

		AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_07"); //一 旦 我 们 的 船 装 满 矿 石 之 后 ， 我 们 将 会 返 航 回 到 本 土 。
		KnowsPaladins_Ore = TRUE;

		AI_Output(other, self, "DIA_Lord_Hagen_Minental_15_08"); //那 么 说 对 抗 兽 人 的 战 争 更 加 恶 化 了 ？
		AI_Output(self, other, "DIA_Lord_Hagen_Minental_04_09"); //我 已 经 告 诉 你 太 多 了 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Hagen_CanTeach(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 5;
	condition		= DIA_Hagen_CanTeach_Condition;
	information		= DIA_Hagen_CanTeach_Info;
	description		= "我 在 寻 找 剑 术 大 师 。";
};

func int DIA_Hagen_CanTeach_Condition()
{
	if ((LordHagen_Teach2H == FALSE)
	&& (other.guild == GIL_PAL)
	&& (other.aivar[REAL_TALENT_2H] >= 90)
	&& (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void DIA_Hagen_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Hagen_CanTeach_15_00"); //我 在 寻 找 剑 术 大 师 。
	AI_Output(self, other, "DIA_Hagen_CanTeach_04_01"); //真 的 ？ 你 已 经 找 到 了 一 个 。

	LordHagen_Teach2H = TRUE;
	B_LogEntry(TOPIC_CityTeacher, TOPIC_CityTeacher_8);
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Hagen_Teach(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 100;
	condition		= DIA_Hagen_Teach_Condition;
	information		= DIA_Hagen_Teach_Info;
	permanent		= TRUE;
	description		= "让 我 们 开 始 吧 。 （ 学 习 双 手 战 斗 ）";
};

// ----------------------------------
var int DIA_Hagen_Teach_permanent;
// ----------------------------------
func int DIA_Hagen_Teach_Condition()
{
	if ((LordHagen_Teach2H == TRUE)
	&& (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Hagen_Teach_Info()
{
	AI_Output(other, self, "DIA_Hagen_Teach_15_00"); //我 们 开 始 吧 。

	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach, DIALOG_BACK, DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self, other, "DIA_Hagen_Teach_04_00"); //你 现 在 是 一 个 杰 出 的 剑 术 大 师 了 。 我 不 能 再 教 你 了 。
		AI_Output(self, other, "DIA_Hagen_Teach_04_01"); //愿 你 未 来 的 行 动 可 以 得 到 剑 术 大 师 智 慧 的 指 引 。
		DIA_Hagen_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Hagen_Teach);
};

func void DIA_Hagen_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 100);

	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach, DIALOG_BACK, DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Hagen_Teach_2H_5);
};

func void DIA_Hagen_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 100);

	Info_ClearChoices(DIA_Hagen_Teach);
	Info_AddChoice(DIA_Hagen_Teach, DIALOG_BACK, DIA_Hagen_Teach_Back);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Hagen_Teach_2H_1);
	Info_AddChoice(DIA_Hagen_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Hagen_Teach_2H_5);
};

// ##############################################################
// ###
// ### RitterAufnahme
// ###
// ##############################################################

//**************************************************************
//	Ich will auch ein Paladin werden.
//**************************************************************
instance DIA_Lord_Hagen_Knight(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 990;
	condition		= DIA_Lord_Hagen_Knight_Condition;
	information		= DIA_Lord_Hagen_Knight_Info;
	permanent		= TRUE;
	description		= "我 想 要 从 事 同 修 道 会 一 起 的 服 务 。";
};

func int DIA_Lord_Hagen_Knight_Condition()
{
	if (hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Knight_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Knight_15_00"); //我 想 要 从 事 同 修 道 会 一 起 的 服 务 。

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_01"); //好 ， 你 已 经 证 明 自 己 拥 有 勇 气 、 技 艺 和 知 识 来 为 英 诺 斯 服 务 。
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_02"); //你 的 事 迹 正 是 纯 洁 心 灵 的 证 明 。
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_03"); //如 果 那 就 是 你 的 愿 望 的 话 ， 我 将 欢 迎 请 你 加 入 我 们 。

		Info_ClearChoices(DIA_Lord_Hagen_Knight);
		Info_AddChoice(DIA_Lord_Hagen_Knight, "我 还 不 太 确 定 。", DIA_Lord_Hagen_Knight_No);
		Info_AddChoice(DIA_Lord_Hagen_Knight, "我 准 备 好 了 ！", DIA_Lord_Hagen_Knight_Yes);
	}
	else
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_04"); //作 为 英 诺 斯 的 战 士 ， 意 味 着 你 要 将 自 己 全 部 奉 献 给 英 诺 斯 的 事 业 。
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_05"); //只 有 最 高 贵 、 最 勇 敢 的 战 士 才 能 加 入 我 们 。
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_04_06"); //如 果 你 真 的 决 定 要 成 为 一 名 圣 骑 士 ， 你 必 须 证 明 你 自 己 的 价 值 。
	};

	Hagen_GaveInfoKnight = TRUE;
};

func void DIA_Lord_Hagen_Knight_No()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Knight_No_15_00"); //我 还 不 太 确 定 。
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_No_04_01"); //那 么 就 去 解 放 你 心 中 的 犹 疑 。 当 你 准 备 好 的 时 候 再 回 来 。

	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

func void DIA_Lord_Hagen_Knight_Yes()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Knight_Yes_15_00"); //我 准 备 好 了 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_01"); //（ 严 肃 的 ） 那 么 就 这 样 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_02"); //（ 严 肃 的 ） 很 多 人 选 择 了 这 条 路 ， 并 以 英 诺 斯 之 名 献 出 他 们 的 生 命 。
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_03"); //（ 严 肃 的 ） 你 愿 意 发 誓 ， 你 的 行 为 将 为 他 们 带 来 光 荣 ， 并 宣 扬 英 诺 斯 的 声 名 吗 ？
	AI_Output(other, self, "DIA_Lord_Hagen_Knight_Yes_15_04"); //我 发 誓 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_05"); //那 么 ， 从 现 在 起 ， 你 是 我 们 团 体 的 成 员 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_06"); //我 因 此 指 定 你 成 为 英 诺 斯 的 战 士 。
	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_07"); //我 将 骑 士 的 武 器 和 盔 甲 交 给 你 。 带 着 自 豪 穿 上 它 们 ， 骑 士 ！

	CreateInvItems(self, ITAR_PAL_M, 1);
	B_GiveInvItems(self, other, ITAR_PAL_M, 1);

	if ((other.HitChance[NPC_TALENT_2H]) >= (other.HitChance[NPC_TALENT_1H])) // Damit der SC auch seine Lieblingswaffe bekommt;-)
	{
		CreateInvItems(self, ItMw_2h_Pal_Sword, 1);
		B_GiveInvItems(self, other, ItMw_2h_Pal_Sword, 1);
	}
	else
	{
		CreateInvItems(self, ItMw_1h_Pal_Sword, 1);
		B_GiveInvItems(self, other, ItMw_1h_Pal_Sword, 1);
	};

	AI_UnequipArmor(other);
	AI_EquipArmor(other, ITAR_PAL_M);

	AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_08"); //今 后 ， 凭 你 的 等 级 和 美 德 ， 你 有 权 进 入 修 道 院 。

	if ((Npc_IsDead(Albrecht)) == FALSE)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Knight_Yes_04_09"); //阿 尔 布 里 奇 将 教 给 你 我 们 的 魔 法 ， 马 上 去 和 他 谈 谈 吧 。
	};

	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_02"); //同 时 ， 我 们 在 城 市 富 人 区 的 营 房 也 将 向 你 开 放 。

	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other, GIL_PAL);

	Info_ClearChoices(DIA_Lord_Hagen_Knight);
};

//***********************************************
//	Wie kann ich mich würdig erweisen
//***********************************************
instance DIA_Lord_Hagen_WhatProof(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 991;
	condition		= DIA_Lord_Hagen_WhatProof_Condition;
	information		= DIA_Lord_Hagen_WhatProof_Info;
	description		= "我 怎 么 证 明 我 自 己 的 价 值 ？";
};

func int DIA_Lord_Hagen_WhatProof_Condition()
{
	if ((Hagen_GaveInfoKnight == TRUE)
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_WhatProof_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_WhatProof_15_00"); //我 怎 么 证 明 我 自 己 的 价 值 ？
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_01"); //你 的 行 为 将 会 证 明 你 的 价 值 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_02"); //我 们 以 英 诺 斯 之 名 为 自 由 和 公 正 而 战 斗 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_03"); //我 们 与 贝 利 尔 和 他 的 党 羽 战 斗 ， 他 们 想 要 毁 灭 英 诺 斯 的 公 正 。
	AI_Output(other, self, "DIA_Lord_Hagen_WhatProof_15_04"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_05"); //你 根 本 不 明 白 ！ 我 们 的 荣 誉 就 是 我 们 的 生 命 ， 我 们 的 生 命 就 是 英 诺 斯 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_06"); //圣 骑 士 以 战 斗 来 赞 美 英 诺 斯 ， 我 们 有 很 多 人 在 正 义 与 邪 恶 之 间 永 恒 的 战 争 中 奉 献 出 了 他 们 的 生 命 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_07"); //我 们 每 一 个 人 都 致 力 于 这 个 传 统 。 如 果 我 们 忘 记 了 ， 我 们 就 会 让 我 们 逝 去 的 同 志 的 作 为 蒙 羞 。
	AI_Output(self, other, "DIA_Lord_Hagen_WhatProof_04_08"); //只 有 真 正 理 解 这 些 的 人 ， 才 配 成 为 圣 骑 士 。
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
instance DIA_Lord_Hagen_KAP3_EXIT(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 999;
	condition		= DIA_Lord_Hagen_KAP3_EXIT_Condition;
	information		= DIA_Lord_Hagen_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lord_Hagen_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  				   PERM KAP 3
// ************************************************************

var int Hagen_KnowsEyeKaputt;
// --------------------------
instance DIA_Lord_Hagen_KAP3U4_PERM(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 998;
	condition		= DIA_Lord_Hagen_KAP3U4_PERM_Condition;
	information		= DIA_Lord_Hagen_KAP3U4_PERM_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Lord_Hagen_KAP3U4_PERM_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP3U4_PERM_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_KAP3U4_PERM_15_00"); //最 近 怎 么 样 ？

	if (MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_04"); //我 必 须 找 到 救 援 这 支 远 征 队 的 方 法 。
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_05"); //我 们 必 须 想 办 法 对 抗 龙 。
		if (Hagen_KnowsEyeKaputt == FALSE)
		{
			AI_Output(self, other, "DIA_Lord_Hagen_Add_04_06"); //（ 自 言 自 语 ） 现 在 ， 也 许 英 诺 斯 之 眼 能 拯 救 我 们 所 有 人 … …
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Lord_Hagen_KAP3U4_PERM_04_01"); //我 在 这 里 已 经 要 疯 了 。 我 是 一 个 战 士 ， 不 是 官 僚 。
		AI_Output(self, other, "DIA_Lord_Hagen_KAP3U4_PERM_04_02"); //有 这 么 多 的 文 书 工 作 要 我 来 做 ， 我 简 直 都 快 忘 记 剑 拿 在 手 里 是 什 么 感 觉 了 。
	};
};

// ************************************************************
// 	  				   PERM KAP3U4
// ************************************************************
instance DIA_Lord_Hagen_EyeBroken(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 1;
	condition		= DIA_Lord_Hagen_EyeBroken_Condition;
	information		= DIA_Lord_Hagen_EyeBroken_Info;
	description		= "我 得 到 了 眼 睛 - 它 已 经 损 坏 了 。";
};

func int DIA_Lord_Hagen_EyeBroken_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_ReadyForChapter4 == FALSE)
	&& (((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	&& (MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_EyeBroken_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_07"); //我 得 到 了 眼 睛 - 它 已 经 损 坏 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_08"); //什 么 ？ 以 英 诺 斯 的 名 义 ！ 你 做 了 什 么 ？ 我 们 需 要 ‘ 眼 睛 ’ ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_09"); //去 找 皮 罗 卡 谈 谈 ！ 一 定 有 办 法 让 它 恢 复 !
	Hagen_KnowsEyeKaputt = TRUE;
};

//*********************************************************************
//	Info BACKINTOWN
//*********************************************************************
instance DIA_Lord_Hagen_BACKINTOWN(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 2;
	condition		= DIA_Lord_Hagen_BACKINTOWN_Condition;
	information		= DIA_Lord_Hagen_BACKINTOWN_Info;
	description		= "我 给 你 带 来 了 加 隆 德 的 消 息 。";
};

func int DIA_Lord_Hagen_BACKINTOWN_Condition()
{
	if ((MIS_OLDWORLD == LOG_RUNNING)
	&& (Npc_HasItems(hero, ItWr_PaladinLetter_MIS) >= 1)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_BACKINTOWN_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_00"); //我 给 你 带 来 了 加 隆 德 的 消 息 。 给 ， 这 是 他 让 我 交 给 你 的 信 。
	B_GiveInvItems(other, self, ItWr_PaladinLetter_MIS, 1);
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Lord_Hagen_BACKINTOWN_04_01"); //我 们 的 情 况 比 我 预 期 的 更 糟 。 但 是 先 向 我 汇 报 矿 藏 山 谷 的 情 况 。
	AI_Output(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_02"); //圣 骑 士 躲 在 矿 藏 山 谷 的 城 堡 里 ， 被 兽 人 包 围 着 。
	AI_Output(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_03"); //探 矿 作 业 伤 亡 惨 重 ， 几 乎 没 有 剩 下 什 么 矿 石 。
	AI_Output(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_04"); //嗯 ， 我 应 该 这 样 说 ， 没 有 你 的 帮 助 ， 这 些 人 就 完 了 。 看 起 来 是 这 样 的 。
	AI_Output(self, other, "DIA_Lord_Hagen_BACKINTOWN_04_05"); //我 要 找 到 援 救 远 征 队 的 方 法 。 你 已 经 帮 我 们 做 了 很 多 事 。 英 诺 斯 将 感 谢 你 … …
	AI_Output(other, self, "DIA_Lord_Hagen_BACKINTOWN_15_06"); //我 对 他 的 感 激 并 没 有 多 大 兴 趣 ， 我 想 要 他 的 眼 睛 。
	AI_Output(self, other, "DIA_Lord_Hagen_BACKINTOWN_04_07"); //当 然 ， 当 然 。 我 遵 守 我 的 诺 言 。 拿 上 这 封 信 ， 他 会 为 你 打 开 修 道 院 的 大 门 。
	AI_Output(self, other, "DIA_Lord_Hagen_BACKINTOWN_04_08"); //去 和 皮 罗 卡 - 最 高 级 的 火 魔 法 师 谈 谈 ， 然 后 把 这 个 许 可 给 他 。 他 会 让 你 拿 走 英 诺 斯 之 眼 。

	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_00"); //还 有 一 件 事 ， 在 你 走 之 前 … …
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_01"); //拿 上 这 个 咒 语 表 达 我 的 谢 意 。 它 可 以 让 你 随 时 随 地 安 全 地 返 回 城 市 。
	B_GiveInvItems(self, other, ItRu_TeleportSeaport, 1);

	CreateInvItems(self, ItWr_PermissionToWearInnosEye_MIS, 1);
	B_GiveInvItems(self, other, ItWr_PermissionToWearInnosEye_MIS, 1);
	MIS_InnosEyeStolen = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_2);

	Wld_InsertNpc(VLK_4250_Jorgen, "NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(BDT_1050_Landstreicher, "NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(BDT_1051_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(BDT_1052_Wegelagerer, "NW_TROLLAREA_RITUALFOREST_09");
	B_KillNpc(BDT_1020_Bandit_L); // Joly: macht Platz für DMT_1200_Dementor
	Wld_InsertNpc(DMT_1200_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	// Wld_InsertNpc(DMT_1201_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(DMT_1202_Dementor, "NW_TROLLAREA_RITUAL_01");
	// Wld_InsertNpc(DMT_1203_Dementor, "NW_TROLLAREA_RITUAL_02");// Joly:waren zu viele!
	Wld_InsertNpc(DMT_1204_Dementor, "NW_TROLLAREA_RITUAL_03");
	// Wld_InsertNpc(DMT_1205_Dementor, "NW_TROLLAREA_RITUAL_04");
	Wld_InsertNpc(DMT_1206_Dementor, "NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(DMT_1207_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	// Wld_InsertNpc(DMT_1208_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(DMT_1209_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(DMT_1210_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(DMT_1211_Dementor, "NW_TROLLAREA_RITUALPATH_01");
	B_StartOtherRoutine(Pedro, "Tot");
	if (Npc_IsDead(MiltenNW)) // Wichtig, damit Milten vor dem Kloster steht!!!!!
	{
		Wld_InsertNpc(PC_MAGE_NW, "NW_MONASTERY_ENTRY_01");
		B_StartOtherRoutine(MiltenNW, "START"); // zur Sicherheit
	};

	Wld_InsertNpc(NOV_650_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_650_ToterNovize);
	Wld_InsertNpc(NOV_651_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_651_ToterNovize);
	Wld_InsertNpc(NOV_652_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_652_ToterNovize);
	Wld_InsertNpc(NOV_653_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_653_ToterNovize);
	Wld_InsertNpc(NOV_654_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_654_ToterNovize);
	Wld_InsertNpc(NOV_655_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_655_ToterNovize);
	Wld_InsertNpc(NOV_656_ToterNovize, "NW_TROLLAREA_RITUALPATH_01"); B_KillNpc(NOV_656_ToterNovize);

	TEXT_Innoseye_Setting = TEXT_Innoseye_Setting_Broken;
	Wld_InsertItem(ItMi_InnosEye_Broken_Mis, "FP_TROLLAREA_RITUAL_ITEM");
};

// --------Hier kommt der gesamte Befreie den schmied Klumpatsch-------------

//*********************************************************
//		Lasse Bennet aus dem Knast
//*********************************************************

var int Hagen_einmalBennet;
// -----------------------
instance DIA_Lord_Hagen_RescueBennet(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 3;
	condition		= DIA_Lord_Hagen_RescueBennet_Condition;
	information		= DIA_Lord_Hagen_RescueBennet_Info;
	permanent		= TRUE;
	description		= "我 需 要 同 你 谈 谈 关 于 贝 尼 特 的 事 。";
};

func int DIA_Lord_Hagen_RescueBennet_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Cornelius_IsLiar == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_RescueBennet_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_15_00"); //我 需 要 同 你 谈 谈 关 于 贝 尼 特 的 事 。

	if (Hagen_einmalBennet == FALSE)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_04_01"); //但 是 雇 佣 兵 谋 杀 了 我 的 一 个 人 。
		Hagen_einmalBennet = TRUE;
	};

	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet, DIALOG_BACK, DIA_Lord_Hagen_RescueBennet_Back);
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet, "你 为 什 么 那 么 确 定 贝 尼 特 是 凶 手 呢 ？", DIA_Lord_Hagen_RescueBennet_WhySure);
	/*
	if (RescueBennet_KnowsWitness == TRUE)
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet, "Wer ist der Zeuge?", DIA_Lord_Hagen_RescueBennet_Witness);
	};

	*/
	Info_AddChoice(DIA_Lord_Hagen_RescueBennet, "我 相 信 贝 尼 特 是 无 辜 的 。", DIA_Lord_Hagen_RescueBennet_Innoscent);

	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Hagen_KnowsEyeKaputt == TRUE))
	{
		Info_AddChoice(DIA_Lord_Hagen_RescueBennet, "贝 尼 特 可 以 帮 助 我 修 理 英 诺 斯 之 眼 。", DIA_Lord_Hagen_RescueBennet_Hilfe);
	};
};

func void DIA_Lord_Hagen_RescueBennet_Hilfe()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_16"); //贝 尼 特 可 以 帮 助 我 修 理 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_17"); //即 使 他 能 把 英 诺 斯 的 力 量 召 唤 到 尘 世 间 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_18"); //他 谋 杀 了 一 个 圣 骑 士 。 他 将 因 此 而 被 处 决 ！
};

func void DIA_Lord_Hagen_RescueBennet_Back()
{
	Info_ClearChoices(DIA_Lord_Hagen_RescueBennet);
};

func void DIA_Lord_Hagen_RescueBennet_WhySure()
{
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_WhySure_15_00"); //你 为 什 么 那 么 确 定 贝 尼 特 是 凶 手 呢 ？
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_01"); //我 们 有 一 个 目 击 证 人 。
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_WhySure_04_02"); //正 如 你 所 见 ， 那 个 雇 佣 兵 的 罪 行 无 可 置 疑 。
	// neu zusammengefasst M.F.
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //这 个 目 击 证 人 是 谁 ？
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //考 内 留 斯 ， 总 督 的 秘 书 ， 看 到 了 那 个 凶 手 。
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //他 的 描 述 非 常 符 合 贝 尼 特 - 无 疑 他 就 是 那 个 人 。 在 我 得 到 通 知 的 时 候 ， 他 们 已 经 解 决 了 那 个 事 件 。
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //雇 佣 兵 将 以 叛 国 罪 处 以 绞 刑 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_5);

	RecueBennet_KnowsCornelius = TRUE;
	// RescueBennet_KnowsWitness = TRUE;
};

/*
func void DIA_Lord_Hagen_RescueBennet_Witness()
{
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_Witness_15_00"); //Wer ist der Zeuge?
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_01"); //Cornelius, der Sekretär des Statthalters, hat den Mord gesehen.
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_02"); //Seine Beschreibung trifft zweifelsfrei auf Bennet zu. Damit ist die Sache für mich erledigt.
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Witness_04_03"); //Der Söldner wird wegen Landesverrats hängen.

	B_LogEntry(TOPIC_RESCUEBENNET, "Cornelius, der Sekretär des Stadthalters, ist also der Zeuge. Er behauptet, den Mord beobachtet zu haben.");

	RecueBennet_KnowsCornelius = TRUE;
};

*/
func void DIA_Lord_Hagen_RescueBennet_Innoscent()
{
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_00"); //我 相 信 贝 尼 特 是 无 辜 的 。
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_01"); //证 据 很 清 楚 ， 他 是 罪 犯 。
	AI_Output(other, self, "DIA_Lord_Hagen_RescueBennet_Innoscent_15_02"); //那 又 怎 么 样 ？ 如 果 证 据 是 错 的 呢 ？
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_03"); //注 意 你 的 言 辞 。 你 提 出 了 一 些 非 常 严 重 的 指 控 。
	AI_Output(self, other, "DIA_Lord_Hagen_RescueBennet_Innoscent_04_04"); //如 果 你 不 能 向 我 提 供 证 人 说 谎 的 证 据 ， 那 么 你 最 好 闭 上 嘴 。
};

//**************************************************************
//	Cornelius hat gelogen.
//**************************************************************
instance DIA_Lord_Hagen_Cornelius(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 3;
	condition		= DIA_Lord_Hagen_Cornelius_Condition;
	information		= DIA_Lord_Hagen_Cornelius_Info;
	permanent		= TRUE;
	description		= "考 内 留 斯 在 说 谎 。";
};

func int DIA_Lord_Hagen_Cornelius_Condition()
{
	if ((Npc_HasItems(other, ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (Cornelius_IsLiar == TRUE)
	&& (MIS_RescueBennet == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Cornelius_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Cornelius_15_00"); //考 内 留 斯 在 说 谎 。
	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_01"); //你 怎 么 知 道 那 些 的 ？
	AI_Output(other, self, "DIA_Lord_Hagen_Cornelius_15_02"); //给 ， 我 找 到 了 这 本 日 记 。 上 面 写 明 了 一 切 。
	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_03"); //（ 狂 怒 ） 那 个 令 人 作 呕 的 、 卑 鄙 的 罪 犯 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_04"); //由 于 新 的 证 物 ， 我 没 有 其 它 可 说 的 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_05"); //按 照 以 国 王 和 教 会 赋 予 我 的 职 责 ， 我 宣 布 … …
	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_06"); //… … 囚 犯 贝 尼 特 解 除 一 切 指 控 ， 并 因 此 成 为 一 个 自 由 人 。

	B_StartOtherRoutine(Bennet, "START");
	B_StartOtherRoutine(Hodges, "START");

	AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_07"); //考 内 留 斯 将 因 作 伪 证 立 即 执 行 监 禁 。

	if (Npc_IsDead(Cornelius) == TRUE)
	{
		AI_Output(other, self, "DIA_Lord_Hagen_Cornelius_15_08"); //不 用 麻 烦 你 了 。 考 内 留 斯 死 定 了 。
		AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_09"); //那 么 说 他 已 经 受 到 了 公 正 的 处 罚 。 干 得 好 。
	}
	else if (CorneliusFlee == TRUE)
	{
		AI_Output(other, self, "DIA_Lord_Hagen_Cornelius_15_10"); //他 溜 走 了 。
		AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_11"); //迟 早 他 会 露 面 ， 那 时 我 们 就 会 逮 捕 他 。
		B_StartOtherRoutine(Cornelius, "FLED");
	}
	else
	{
		B_StartOtherRoutine(Cornelius, "PRISON");
	};

	MIS_RescueBennet = LOG_SUCCESS;

	B_GivePlayerXP(XP_RescueBennet);

	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Cornelius_04_12"); //你 的 行 为 将 会 增 加 我 们 的 荣 誉 。
	};
};

// --------Hier endet der gesamte Befreie den Schmied Klumpatsch-------------

//**************************************************************
//	Auge Innos ganz!
//**************************************************************
instance DIA_Lord_Hagen_AugeAmStart(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 4;
	condition		= DIA_Lord_Hagen_AugeAmStart_Condition;
	information		= DIA_Lord_Hagen_AugeAmStart_Info;
	description		= "我 带 着 眼 睛 ！ ";
};

func int DIA_Lord_Hagen_AugeAmStart_Condition()
{
	if ((Kapitel <= 4)
	&& (MIS_ReadyForChapter4 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AugeAmStart_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_10"); //我 带 着 眼 睛 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_11"); //（ 虔 诚 的 ） 你 戴 着 ‘ 眼 睛 ’ ！
	if (Hagen_KnowsEyeKaputt == TRUE)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_12"); //你 一 定 要 把 它 拼 起 来 ！
	};

	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_13"); //那 么 你 是 英 诺 斯 的 选 择 者 ！
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_14"); //我 要 出 发 去 杀 死 矿 藏 山 谷 里 所 有 的 龙 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_15"); //与 英 诺 斯 相 伴 ， 以 他 的 力 量 消 灭 邪 恶 ！
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
instance DIA_Lord_Hagen_KAP4_EXIT(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 999;
	condition		= DIA_Lord_Hagen_KAP4_EXIT_Condition;
	information		= DIA_Lord_Hagen_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lord_Hagen_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Antipaladine
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_ANTIPALADINE(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 3;
	condition		= DIA_Lord_Hagen_ANTIPALADINE_Condition;
	information		= DIA_Lord_Hagen_ANTIPALADINE_Info;
	permanent		= TRUE;
	description		= "兽 人 精 英 战 士 在 攻 击 这 里 的 领 土 。";
};

func int DIA_Lord_Hagen_ANTIPALADINE_Condition()
{
	if (((TalkedTo_AntiPaladin == TRUE) || (Npc_HasItems(other, ItRi_OrcEliteRing)))
	&& (Hagen_SawOrcRing == FALSE)
	&& (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

var int Hagen_SawOrcRing;

func void DIA_Lord_Hagen_ANTIPALADINE_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_00"); //兽 人 精 英 战 士 在 攻 击 这 里 的 领 土 。

	Log_CreateTopic(TOPIC_OrcElite, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcElite, LOG_RUNNING);
	B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_1);

	if ((TalkedTo_AntiPaladin == TRUE)
	&& (MIS_KillOrkOberst == 0))
	{
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_01"); //你 为 什 么 要 那 么 说 ？
		AI_Output(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_02"); //我 同 他 们 中 的 某 人 说 过 话 ， 并 谈 到 了 你 的 名 字 。
	};

	AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_03"); //胡 说 。 我 的 人 迄 今 为 止 还 没 有 报 告 有 大 批 兽 人 入 侵 。
	AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_04"); //也 许 是 他 们 的 侦 察 兵 在 附 近 的 树 林 里 迷 路 了 。

	if (Npc_HasItems(other, ItRi_OrcEliteRing))
	{
		AI_Output(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_05"); //那 些 不 是 侦 察 兵 。 我 从 他 们 一 个 人 身 上 拿 到 了 这 个 戒 指 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_06"); //让 我 看 看 。
		B_GiveInvItems(other, self, ItRi_OrcEliteRing, 1);
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_07"); //嗯 。 那 真 有 些 令 人 不 安 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_08"); //那 是 他 们 力 量 的 标 记 。 那 么 说 兽 人 已 经 离 开 了 他 们 的 栅 栏 ， 并 准 备 在 开 阔 地 面 战 斗 。
		AI_Output(other, self, "DIA_Lord_Hagen_ANTIPALADINE_15_09"); //我 还 没 有 看 到 那 么 多 人 。 主 要 是 他 们 的 军 阀 ， 还 有 少 量 的 战 士 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_10"); //真 的 ？ 那 么 他 们 一 定 在 计 划 其 它 某 些 事 情 。 他 们 的 首 领 亲 自 离 开 保 护 栅 栏 ， 这 不 像 是 兽 人 的 风 格 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_11"); //然 而 这 应 该 是 一 个 好 机 会 ， 给 他 们 一 记 重 击 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_12"); //如 果 他 们 失 去 了 首 领 ， 士 气 自 然 也 会 下 降 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_13"); //你 有 了 一 个 新 任 务 ， 骑 士 。 去 杀 死 这 个 地 区 里 的 兽 人 首 领 。
		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_14"); //把 他 们 的 戒 指 给 我 拿 来 ， 那 应 该 是 给 兽 人 的 严 厉 打 击 。

		B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_2);

		if ((Npc_IsDead(Ingmar) == FALSE)
		&& (MIS_KillOrkOberst == 0))
		{
			AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_15"); //去 问 一 下 英 格 玛 。 他 能 告 诉 你 一 些 在 和 兽 人 首 领 战 斗 时 应 该 注 意 的 战 术 提 示 。
			AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_16"); //对 付 兽 人 精 英 战 士 是 他 的 专 长 。 他 以 前 经 常 要 对 付 他 们 。
			B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_3);
		};

		Hagen_SawOrcRing = TRUE;
		B_GivePlayerXP(XP_PAL_OrcRing);
	}
	else
	{
		if (MIS_KillOrkOberst == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_17"); //你 仅 仅 口 述 你 杀 死 了 兽 人 军 阀 的 首 领 ， 这 对 我 来 说 不 够 。
		};

		AI_Output(self, other, "DIA_Lord_Hagen_ANTIPALADINE_04_18"); //如 果 要 我 对 此 作 出 响 应 的 话 ， 我 需 要 一 些 切 实 的 证 据 。

		B_LogEntry(TOPIC_OrcElite, TOPIC_OrcElite_4);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info RingeBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Lord_Hagen_RINGEBRINGEN(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 5;
	condition		= DIA_Lord_Hagen_RINGEBRINGEN_Condition;
	information		= DIA_Lord_Hagen_RINGEBRINGEN_Info;
	permanent		= TRUE;
	description		= "我 还 有 一 些 关 于 兽 人 军 阀 的 报 告 。";
};

func int DIA_Lord_Hagen_RINGEBRINGEN_Condition()
{
	if ((Hagen_SawOrcRing == TRUE)
	&& (Npc_HasItems(other, ItRi_OrcEliteRing) >= 1)
	&& (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

var int OrkRingCounter;

func void DIA_Lord_Hagen_RINGEBRINGEN_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_00"); //我 还 有 一 些 关 于 兽 人 军 阀 的 报 告 。
	AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_01"); //那 告 诉 我 。

	var int Ringcount;
	var int XP_PAL_OrcRings;
	var int OrcRingGeld;
	var int HagensRingOffer;

	HagensRingOffer = 150; // Joly: Geld für einen Orkring

	Ringcount = Npc_HasItems(other, ItRi_OrcEliteRing);

	if (Ringcount == 1)
	{
		AI_Output(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_02"); //我 能 再 给 你 一 个 兽 人 戒 指 。
		B_GivePlayerXP(XP_PAL_OrcRing);
		B_GiveInvItems(other, self, ItRi_OrcEliteRing, 1);
		OrkRingCounter = OrkRingCounter + 1;
	}
	else
	{
		AI_Output(other, self, "DIA_Lord_Hagen_RINGEBRINGEN_15_03"); //我 能 给 你 更 多 的 兽 人 戒 指 。

		B_GiveInvItems(other, self, ItRi_OrcEliteRing, Ringcount);

		XP_PAL_OrcRings = (Ringcount * XP_PAL_OrcRing);
		OrkRingCounter = (OrkRingCounter + Ringcount);

		B_GivePlayerXP(XP_PAL_OrcRings);
	};

	AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_04"); //我 为 你 而 自 豪 。 继 续 ！

	if (OrkRingCounter <= 10)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_05"); //他 们 在 那 里 还 有 一 些 人 。
	}
	else if (OrkRingCounter <= 20)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_06"); //很 快 我 们 就 会 迫 使 他 们 屈 服 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_07"); //如 果 你 还 能 找 出 他 们 更 多 人 的 话 ， 我 会 震 惊 的 。
		AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_08"); //欢 迎 你 继 续 把 他 们 的 戒 指 给 我 拿 来 ， 不 过 我 相 信 兽 人 现 在 已 经 知 道 了 这 个 消 息 。
		TOPIC_END_OrcElite = TRUE;
	};

	AI_Output(self, other, "DIA_Lord_Hagen_RINGEBRINGEN_04_09"); //给 。 我 给 你 一 些 钱 让 你 去 换 装 备 。

	OrcRingGeld = (Ringcount * HagensRingOffer);

	CreateInvItems(self, ItMi_Gold, OrcRingGeld);
	B_GiveInvItems(self, other, ItMi_Gold, OrcRingGeld);
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
instance DIA_Lord_Hagen_KAP5_EXIT(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 999;
	condition		= DIA_Lord_Hagen_KAP5_EXIT_Condition;
	information		= DIA_Lord_Hagen_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lord_Hagen_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//****************************************************************************
//		Die Drachen sind tot
//****************************************************************************
instance DIA_Lord_Hagen_AllDragonsDead(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 4;
	condition		= DIA_Lord_Hagen_AllDragonsDead_Condition;
	information		= DIA_Lord_Hagen_AllDragonsDead_Info;
	description		= "那 些 龙 死 了 。";
};

func int DIA_Lord_Hagen_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_AllDragonsDead_15_00"); //就 是 那 样 。 所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_19"); //我 知 道 英 诺 斯 会 给 你 力 量 击 败 龙 ！
	AI_Output(self, other, "DIA_Lord_Hagen_AllDragonsDead_04_02"); //矿 石 在 哪 里 ？
	AI_Output(other, self, "DIA_Lord_Hagen_AllDragonsDead_15_03"); //兽 人 仍 旧 包 围 着 矿 藏 山 谷 的 城 堡 。 在 围 攻 结 束 前 ， 加 隆 德 没 有 机 会 离 开 城 堡 。

	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_20"); //（ 狂 怒 ） 该 死 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_21"); //如 果 加 隆 德 不 能 处 理 这 种 情 况 ， 那 我 就 必 须 亲 自 去 处 理 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_22"); //几 个 兽 人 阻 止 不 了 我 ！ 绝 对 不 是 我 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_23"); //我 已 经 通 知 了 我 的 人 。 我 们 正 准 备 出 发 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_24"); //我 们 都 走 。 我 只 会 在 船 上 留 一 点 卫 兵 。
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_25"); //那 应 该 足 够 解 决 最 后 那 些 兽 人 ！

	MIS_SCVisitShip = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "ShipFree");
};

// ************************************************************
// 	  				   Ich brauche das Schiff
// ************************************************************
instance DIA_Lord_Hagen_NeedShip(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 4;
	condition		= DIA_Lord_Hagen_NeedShip_Condition;
	information		= DIA_Lord_Hagen_NeedShip_Info;
	description		= "我 需 要 一 条 船 。";
};

func int DIA_Lord_Hagen_NeedShip_Condition()
{
	if (ItWr_SCReadsHallsofIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_NeedShip_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_NeedShip_15_00"); //我 需 要 一 条 船 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_NeedShip_04_01"); //人 真 的 很 多 ， 士 兵 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_NeedShip_04_02"); //（ 大 笑 ） 我 几 乎 每 天 都 能 听 到 那 些 ， 教 士 。 但 是 … …
	};

	AI_Output(self, other, "DIA_Lord_Hagen_NeedShip_04_03"); //你 甚 至 连 船 长 都 没 有 ， 更 别 说 船 员 了 。
	AI_Output(other, self, "DIA_Lord_Hagen_NeedShip_15_04"); //那 港 口 里 的 船 怎 么 样 ？
	AI_Output(self, other, "DIA_Lord_Hagen_NeedShip_04_05"); //它 是 属 于 我 的 ， 就 是 那 样 。 我 们 要 用 这 艘 船 运 送 矿 石 。
	AI_Output(self, other, "DIA_Lord_Hagen_NeedShip_04_06"); //等 那 任 务 完 成 之 后 ， 你 可 以 再 来 问 我 。
};

// ************************************************************
// 	  				 Tor auf
// ************************************************************
instance DIA_Lord_Hagen_GateOpen(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 5;
	condition		= DIA_Lord_Hagen_GateOpen_Condition;
	information		= DIA_Lord_Hagen_GateOpen_Info;
	description		= "兽 人 突 袭 了 矿 藏 山 谷 的 城 堡 ！";
};

func int DIA_Lord_Hagen_GateOpen_Condition()
{
	if ((MIS_OCGateOpen == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Lord_Hagen_AllDragonsDead)))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_GateOpen_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_29"); //兽 人 突 袭 了 矿 藏 山 谷 的 城 堡 ！
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_30"); //以 英 诺 斯 的 名 义 ！ 那 里 究 竟 发 生 了 什 么 ？
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_31"); //不 知 怎 么 大 门 被 打 开 了 … …
	AI_Output(self, other, "DIA_Lord_Hagen_Add_04_32"); //不 知 怎 么 ？ ！ 那 怎 么 可 能 … … 城 堡 里 面 一 定 有 一 个 叛 徒 ！
};

// ************************************************************
// 	  						 PERM
// ************************************************************
instance DIA_Lord_Hagen_Perm5(C_INFO)
{
	npc				= PAL_200_Hagen;
	nr				= 5;
	condition		= DIA_Lord_Hagen_Perm5_Condition;
	information		= DIA_Lord_Hagen_Perm5_Info;
	permanent		= TRUE;
	description		= "那 你 还 在 等 什 么 ？";
};

func int DIA_Lord_Hagen_Perm5_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lord_Hagen_AllDragonsDead))
	{
		return TRUE;
	};
};

func void DIA_Lord_Hagen_Perm5_Info()
{
	AI_Output(other, self, "DIA_Lord_Hagen_Add_15_33"); //你 还 在 等 什 么 ？
	if (MIS_OCGateOpen == FALSE)
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_26"); //我 们 还 在 等 装 备 和 粮 食 。 然 后 我 们 再 出 发 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_27"); //由 于 城 堡 遭 到 了 猛 攻 ， 我 们 需 要 更 多 的 粮 食 。
		AI_Output(self, other, "DIA_Lord_Hagen_Add_04_28"); //但 是 我 们 离 开 的 时 间 不 能 延 期 太 久 。
	};
};
