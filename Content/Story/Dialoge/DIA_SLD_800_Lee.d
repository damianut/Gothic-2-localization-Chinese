// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lee_EXIT(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 999;
	condition		= DIA_Lee_EXIT_Condition;
	information		= DIA_Lee_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lee_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// **************
// B_Lee_Teleport
// **************

var int Lee_Teleport; // damit es nur EINMAL kommt
// ------------------

func void B_Lee_Teleport()
{
	AI_Output(self, other, "DIA_Lee_Add_04_05"); //啊 。 你 来 了 真 好 。
	AI_Output(other, self, "DIA_Lee_Add_15_06"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Lee_Add_04_07"); //我 在 那 个 古 老 的 礼 拜 堂 里 面 找 到 了 这 个 。
	B_GiveInvItems(self, other, ItRu_TeleportFarm, 1);
	AI_Output(self, other, "DIA_Lee_Add_04_08"); //它 是 一 个 魔 法 符 咒 。 我 想 它 可 以 把 你 直 接 传 送 回 农 场 这 里 。
	AI_Output(self, other, "DIA_Lee_Add_04_09"); //我 想 你 也 许 能 使 用 它 。

	Lee_Teleport = TRUE;
};

// ************************************************************
// 					Petzmaster: Schulden offen
// ************************************************************

// ---------------------------
var int Lee_LastPetzCounter;
var int Lee_LastPetzCrime;
// ---------------------------
instance DIA_Lee_PMSchulden(C_INFO)
{
	npc				= Sld_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_PMSchulden_Condition;
	information		= DIA_Lee_PMSchulden_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Lee_PMSchulden_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Lee_Schulden > 0)
	&& (B_GetGreatestPetzCrime(self) <= Lee_LastPetzCrime))
	{
		return TRUE;
	};
};

func void DIA_Lee_PMSchulden_Info()
{
	if ((Kapitel >= 3)
	&& (Lee_Teleport == FALSE))
	{
		B_Lee_Teleport();
	};

	AI_Output(self, other, "DIA_Lee_PMSchulden_04_00"); //你 是 来 这 里 把 钱 交 给 欧 纳 尔 的 吗 ？

	if (B_GetTotalPetzCounter(self) > Lee_LastPetzCounter)
	{
		AI_Output(self, other, "DIA_Lee_PMSchulden_04_01"); //我 已 经 告 诉 过 你 别 在 这 里 干 任 何 傻 事 。
		AI_Output(self, other, "DIA_Lee_PMSchulden_04_02"); //欧 纳 尔 听 说 你 在 这 期 间 创 了 个 真 正 的 记 录 。
		if (Lee_Schulden < 1000)
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_03"); //因 此 ， 他 现 在 想 要 更 多 钱 。
			AI_Output(other, self, "DIA_Lee_PMAdd_15_00"); //多 少 钱 ？

			var int diff; diff = (B_GetTotalPetzCounter(self) - Lee_LastPetzCounter);

			if (diff > 0)
			{
				Lee_Schulden = Lee_Schulden + (diff * 50);
			};

			if (Lee_Schulden > 1000) { Lee_Schulden = 1000; };
			B_Say_Gold(self, other, Lee_Schulden);
		}
		else
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_04"); //我 以 为 你 会 更 聪 明 点 。
		};
	}
	else if (B_GetGreatestPetzCrime(self) < Lee_LastPetzCrime)
	{
		AI_Output(self, other, "DIA_Lee_PMSchulden_04_05"); //那 么 ， 我 有 个 好 消 息 告 诉 你 。

		if (Lee_LastPetzCrime == CRIME_MURDER)
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_06"); //突 然 之 间 ， 曾 看 见 你 杀 人 的 人 一 个 都 不 剩 了 。
		};

		if ((Lee_LastPetzCrime == CRIME_THEFT)
		|| ((Lee_LastPetzCrime > CRIME_THEFT) && (B_GetGreatestPetzCrime(self) < CRIME_THEFT)))
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_07"); //现 在 ， 没 有 一 个 人 证 实 曾 看 到 你 偷 窃 。
		};

		if ((Lee_LastPetzCrime == CRIME_ATTACK)
		|| ((Lee_LastPetzCrime > CRIME_ATTACK) && (B_GetGreatestPetzCrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_08"); //曾 看 见 你 痛 打 某 个 农 民 的 人 一 个 都 不 剩 了 。
		};

		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_09"); //显 然 ， 所 有 针 对 你 的 控 诉 都 已 经 无 影 无 踪 了 。
		};

		AI_Output(self, other, "DIA_Lee_PMSchulden_04_10"); //那 是 一 种 逃 避 这 类 问 题 的 方 式 。

		// ------- Schulden erlassen oder trotzdem zahlen ------
		if (B_GetGreatestPetzCrime(self) == CRIME_NONE)
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_11"); //总 之 ， 你 不 再 需 要 偿 付 了 。
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_12"); //但 是 以 后 还 得 小 心 行 事 。

			Lee_Schulden = 0;
			Lee_LastPetzCounter = 0;
			Lee_LastPetzCrime = CRIME_NONE;
		}
		else
		{
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_13"); //有 件 事 情 很 明 确 ： 你 仍 然 必 须 全 额 支 付 你 的 罚 款 。
			B_Say_Gold(self, other, Lee_Schulden);
			AI_Output(self, other, "DIA_Lee_PMSchulden_04_14"); //那 么 ， 怎 么 样 ？
		};
	};

	// ------ Choices NUR, wenn noch Crime vorliegt ------
	if (B_GetGreatestPetzCrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(DIA_Lee_PMSchulden);
		Info_ClearChoices(DIA_Lee_PETZMASTER);
		Info_AddChoice(DIA_Lee_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Lee_PETZMASTER_PayLater);
		Info_AddChoice(DIA_Lee_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Lee_PMSchulden_HowMuchAgain);
		if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
		{
			Info_AddChoice(DIA_Lee_PMSchulden, "我 想 要 支 付 罚 金 ！", DIA_Lee_PETZMASTER_PayNow);
		};
	};
};

func void DIA_Lee_PMSchulden_HowMuchAgain()
{
	AI_Output(other, self, "DIA_Lee_PMSchulden_HowMuchAgain_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Lee_Schulden);

	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PMSchulden, "我 还 没 有 足 够 的 金 子 ！", DIA_Lee_PETZMASTER_PayLater);
	Info_AddChoice(DIA_Lee_PMSchulden, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Lee_PMSchulden_HowMuchAgain);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PMSchulden, "我 想 要 支 付 罚 金 ！", DIA_Lee_PETZMASTER_PayNow);
	};
};

// ### weitere Choices siehe unten (DIA_Lee_PETZMASTER) ###

// ************************************************************
// 			  			 PETZ-MASTER
// ************************************************************
instance DIA_Lee_PETZMASTER(C_INFO)
{
	npc				= Sld_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_PETZMASTER_Condition;
	information		= DIA_Lee_PETZMASTER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Lee_PETZMASTER_Condition()
{
	if (B_GetGreatestPetzCrime(self) > Lee_LastPetzCrime)
	{
		return TRUE;
	};
};

func void DIA_Lee_PETZMASTER_Info()
{
	if ((Kapitel >= 3)
	&& (Lee_Teleport == FALSE))
	{
		B_Lee_Teleport();
	};

	Lee_Schulden = 0; // weil Funktion nochmal durchlaufen wird, wenn Crime höher ist...

	// ------ SC hat mit Lee noch nicht gesprochen ------
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_00"); //哪 个 混 蛋 让 你 进 来 的 - （ 感 到 惊 讶 的 ） - 你 是 那 个 最 近 一 直 在 惹 麻 烦 新 来 的 家 伙 ？
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_01"); //我 从 戈 恩 那 里 听 说 你 还 活 着 ， 若 非 你 来 了 这 里 … … 总 之 … …
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_MURDER)
	{
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_02"); //你 能 在 所 有 事 情 都 越 发 不 利 于 你 之 前 来 找 我 ， 真 是 很 明 智 。
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_03"); //雇 佣 兵 都 是 粗 暴 的 家 伙 ， 而 这 里 的 农 民 也 不 都 是 那 么 吹 毛 求 疵 ， 不 过 ， 你 不 能 到 处 杀 人 。
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
		Lee_Schulden = Lee_Schulden + 500; // PLUS Mörder-Malus
		if ((PETZCOUNTER_Farm_Theft + PETZCOUNTER_Farm_Attack + PETZCOUNTER_Farm_Sheepkiller) > 0)
		{
			AI_Output(self, other, "DIA_Lee_PETZMASTER_04_04"); //更 不 用 说 你 曾 在 这 里 干 过 的 其 它 坏 事 了 。
		};

		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_05"); //我 可 以 帮 你 把 这 些 事 情 一 笔 勾 销 。
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_06"); //然 而 ， 这 需 要 花 一 笔 钱 。 欧 纳 尔 是 个 贪 婪 的 人 ， 只 有 当 他 装 作 不 知 道 的 时 候 ， 这 些 事 才 会 被 忘 记 。
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_THEFT)
	{
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_07"); //你 来 了 很 好 。 我 听 说 你 在 这 里 偷 了 些 东 西 。
		if (PETZCOUNTER_Farm_Attack > 0)
		{
			AI_Output(self, other, "DIA_Lee_PETZMASTER_04_08"); //还 打 伤 了 这 周 围 的 一 些 农 民 。
		};

		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Lee_PETZMASTER_04_09"); //还 杀 了 几 只 绵 羊 。
		};

		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_10"); //你 不 可 以 在 这 里 胡 作 非 为 。 现 在 ， 欧 纳 尔 坚 持 要 我 把 犯 人 带 过 去 进 行 质 问 。
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_11"); //这 意 味 着 ： 你 付 款 ， 他 收 钱 - 不 过 那 样 的 话 ， 至 少 那 些 事 情 已 经 被 忘 记 了 。

		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	if (B_GetGreatestPetzCrime(self) == CRIME_ATTACK)
	{
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_12"); //如 果 你 去 跟 雇 佣 兵 的 决 斗 ， 那 是 一 回 事 … …
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_13"); //不 过 ， 如 果 你 毒 打 了 一 个 农 民 ， 他 们 就 会 直 接 去 找 欧 纳 尔 。 而 他 会 让 我 去 做 一 些 事 。
		if (PETZCOUNTER_Farm_Sheepkiller > 0)
		{
			AI_Output(self, other, "DIA_Lee_PETZMASTER_04_14"); //更 不 用 说 ， 当 有 人 杀 了 他 的 羊 时 ， 他 会 很 不 高 兴 的 。
		};

		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_15"); //你 将 必 须 支 付 罚 款 。 按 惯 例 ， 欧 纳 尔 亲 自 收 钱 - 不 过 ， 这 是 解 决 问 题 的 唯 一 途 径 。
		Lee_Schulden = (B_GetTotalPetzCounter(self) * 50); // Anzahl der Zeugen * 50
	};

	// ------ Schaf getötet (nahezu uninteressant - in der City gibt es keine Schafe) ------
	if (B_GetGreatestPetzCrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_16"); //欧 纳 尔 希 望 我 保 卫 他 的 农 场 ， 这 也 包 括 他 的 羊 。
		AI_Output(self, other, "DIA_Lee_PETZMASTER_04_17"); //你 必 须 要 支 付 他 赔 偿 金 ！

		Lee_Schulden = 100;
	};

	AI_Output(other, self, "DIA_Lee_PETZMASTER_15_18"); //多 少 钱 ？

	if (Lee_Schulden > 1000) { Lee_Schulden = 1000; };
	B_Say_Gold(self, other, Lee_Schulden);

	Info_ClearChoices(DIA_Lee_PMSchulden);
	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_AddChoice(DIA_Lee_PETZMASTER, "我 还 没 有 足 够 的 金 子 ！", DIA_Lee_PETZMASTER_PayLater);
	if (Npc_HasItems(other, itmi_gold) >= Lee_Schulden)
	{
		Info_AddChoice(DIA_Lee_PETZMASTER, "我 想 要 支 付 罚 金 ！", DIA_Lee_PETZMASTER_PayNow);
	};
};

func void DIA_Lee_PETZMASTER_PayNow()
{
	AI_Output(other, self, "DIA_Lee_PETZMASTER_PayNow_15_00"); //我 想 要 支 付 罚 金 ！
	B_GiveInvItems(other, self, itmi_gold, Lee_Schulden);
	AI_Output(self, other, "DIA_Lee_PETZMASTER_PayNow_04_01"); //很 好 ！ 我 保 证 欧 纳 尔 拿 到 钱 。 你 可 以 认 为 这 些 事 情 已 经 被 忘 记 了 。

	B_GrantAbsolution(LOC_FARM);

	Lee_Schulden = 0;
	Lee_LastPetzCounter = 0;
	Lee_LastPetzCrime = CRIME_NONE;

	Info_ClearChoices(DIA_Lee_PETZMASTER);
	Info_ClearChoices(DIA_Lee_PMSchulden); // !!! Info-Choice wird noch von anderem Dialog angesteuert!
};

func void DIA_Lee_PETZMASTER_PayLater()
{
	AI_Output(other, self, "DIA_Lee_PETZMASTER_PayLater_15_00"); //我 没 有 足 够 的 金 币 ！
	AI_Output(self, other, "DIA_Lee_PETZMASTER_PayLater_04_01"); //现 在 ， 去 把 它 拿 来 ， 越 快 越 好 。
	AI_Output(self, other, "DIA_Lee_PETZMASTER_PayLater_04_02"); //但 是 不 要 考 虑 能 在 农 场 偷 东 西 。 如 果 你 被 发 现 了 ， 事 态 对 你 会 更 加 不 利 。

	Lee_LastPetzCounter = B_GetTotalPetzCounter(self);
	Lee_LastPetzCrime = B_GetGreatestPetzCrime(self);

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				 Hallo
// ************************************************************
instance DIA_Lee_Hallo(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_Hallo_Condition;
	information		= DIA_Lee_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lee_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Hallo_Info()
{
	AI_Output(self, other, "DIA_Lee_Hallo_04_00"); //哪 个 混 蛋 让 你 进 来 的 - （ 感 到 惊 讶 的 ） - 你 在 这 里 干 什 么 ？ 我 以 为 你 已 经 死 了 ！
	AI_Output(other, self, "DIA_Lee_Hallo_15_01"); //你 为 什 么 会 那 么 想 ？
	AI_Output(self, other, "DIA_Lee_Hallo_04_02"); //戈 恩 告 诉 我 说 ， 是 你 把 屏 障 破 坏 掉 了 。
	AI_Output(other, self, "DIA_Lee_Hallo_15_03"); //是 的 ， 正 是 我 。
	AI_Output(self, other, "DIA_Lee_Hallo_04_04"); //我 根 本 想 不 到 有 人 能 在 那 东 西 下 面 活 下 来 。 是 什 么 风 把 你 吹 到 这 里 来 的 ？ 没 有 理 由 的 话 ， 你 不 会 来 这 里 的 … …
};

// ************************************************************
// 			  				Paladine
// ************************************************************
instance DIA_Lee_Paladine(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 2;
	condition		= DIA_Lee_Paladine_Condition;
	information		= DIA_Lee_Paladine_Info;
	description		= "我 确 实 必 须 同 镇 上 的 圣 骑 士 谈 一 下 … …";
};

func int DIA_Lee_Paladine_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Paladine_Info()
{
	AI_Output(other, self, "DIA_Lee_Paladine_15_00"); //我 非 常 需 要 去 城 里 跟 那 些 圣 骑 士 谈 谈 。 你 能 帮 我 见 到 他 们 吗 ？
	AI_Output(self, other, "DIA_Lee_Paladine_04_01"); //（ 不 信 任 的 ） 你 找 那 些 圣 骑 士 有 什 么 事 情 ？
	AI_Output(other, self, "DIA_Lee_Paladine_15_02"); //这 件 事 情 说 来 话 长 … …
	AI_Output(self, other, "DIA_Lee_Paladine_04_03"); //我 有 的 是 时 间 。
	AI_Output(other, self, "DIA_Lee_Paladine_15_04"); //（ 叹 息 ） 艾 克 萨 达 斯 派 给 我 一 个 任 务 。 他 希 望 我 能 拿 到 一 个 威 力 巨 大 的 护 身 符 - 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Lee_Paladine_04_05"); //那 么 说 ， 你 跟 那 个 亡 灵 法 师 还 是 同 盟 。 我 知 道 了 。 圣 骑 士 拿 着 这 个 护 身 符 ？
	AI_Output(other, self, "DIA_Lee_Paladine_15_06"); //据 我 所 知 - 是 的 。
	AI_Output(self, other, "DIA_Lee_Paladine_04_07"); //我 可 以 帮 你 找 到 圣 骑 士 。 但 是 ， 首 先 你 得 成 为 我 们 这 边 的 人 。
};

// ************************************************************
// 			  				PaladineHOW
// ************************************************************
instance DIA_Lee_PaladineHOW(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_PaladineHOW_Condition;
	information		= DIA_Lee_PaladineHOW_Info;
	description		= "你 怎 么 才 能 帮 我 成 为 圣 骑 士 ？";
};

func int DIA_Lee_PaladineHOW_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Npc_KnowsInfo(other, DIA_Lee_Paladine)))
	{
		return TRUE;
	};
};

func void DIA_Lee_PaladineHOW_Info()
{
	AI_Output(other, self, "DIA_Lee_PaladineHOW_15_00"); //你 怎 么 才 能 帮 我 成 为 圣 骑 士 ？
	AI_Output(self, other, "DIA_Lee_PaladineHOW_04_01"); //相 信 我 。 我 有 一 个 计 划 。 我 觉 得 你 是 个 合 适 的 人 选 … …
	AI_Output(self, other, "DIA_Lee_PaladineHOW_04_02"); //我 会 让 你 到 圣 骑 士 那 里 去 帮 我 办 点 事 。 但 是 ， 首 先 ， 加 入 我 们 ！
};

// ************************************************************
// 			  				Lees Plan
// ************************************************************
instance DIA_Lee_LeesPlan(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_LeesPlan_Condition;
	information		= DIA_Lee_LeesPlan_Info;
	description		= "你 究 竟 在 这 里 做 什 么 ？";
};

func int DIA_Lee_LeesPlan_Condition()
{
	if (Lee_IsOnBoard == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_LeesPlan_Info()
{
	AI_Output(other, self, "DIA_Lee_LeesPlan_15_00"); //你 究 竟 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Lee_LeesPlan_04_01"); //非 常 简 单 ： 我 要 负 责 我 们 全 都 离 开 这 座 岛 屿 。
	AI_Output(self, other, "DIA_Lee_LeesPlan_04_02"); //欧 纳 尔 雇 佣 我 们 来 保 卫 他 的 农 场 ， 而 且 这 正 是 我 们 要 去 做 的 。
	AI_Output(self, other, "DIA_Lee_LeesPlan_04_03"); //但 是 ， 我 们 的 报 酬 不 仅 仅 是 工 资 。 在 帮 助 这 些 农 场 主 的 同 时 ， 我 们 切 断 了 城 里 的 供 应 。
	AI_Output(self, other, "DIA_Lee_LeesPlan_04_04"); //这 样 ， 圣 骑 士 能 吃 的 东 西 越 少 ， 当 我 最 终 提 出 一 个 和 平 提 议 时 ， 他 们 就 能 越 快 听 取 我 的 意 见 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Lee_LeesPlan_04_05"); //在 这 么 多 人 当 中 ， 你 却 偏 要 跟 他 们 为 伍 ， 这 太 差 劲 了 。
	};

	AI_Output(other, self, "DIA_Lee_LeesPlan_15_06"); //你 的 提 议 是 什 么 ？
	AI_Output(self, other, "DIA_Lee_LeesPlan_04_07"); //从 本 质 上 说 ， 它 是 关 于 我 们 的 赦 免 以 及 通 往 大 陆 的 自 由 通 道 。 到 时 候 你 就 会 知 道 更 多 。
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Lee_WannaJoin(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 5;
	condition		= DIA_Lee_WannaJoin_Condition;
	information		= DIA_Lee_WannaJoin_Info;
	description		= "我 要 加 入 你 们 ！ ";
};

func int DIA_Lee_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lee_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Lee_WannaJoin_15_00"); //我 要 加 入 你 们 ！
	AI_Output(self, other, "DIA_Lee_WannaJoin_04_01"); //我 希 望 你 能 那 么 说 ！ 我 这 里 需 要 每 一 个 有 本 事 的 人 。
	AI_Output(self, other, "DIA_Lee_WannaJoin_04_02"); //我 接 收 的 前 一 个 雇 佣 兵 除 了 惹 麻 烦 外 没 干 过 别 的 事 ！
	AI_Output(self, other, "DIA_Lee_WannaJoin_04_03"); //原 则 上 来 说 ， 你 可 以 马 上 出 发 。 嗯 ， 首 先 ， 我 们 必 须 解 决 一 两 件 事 情 ， 不 过 不 是 什 么 大 事 情 … …
};

// ************************************************************
// 			  				ClearWhat
// ************************************************************
instance DIA_Lee_ClearWhat(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 6;
	condition		= DIA_Lee_ClearWhat_Condition;
	information		= DIA_Lee_ClearWhat_Info;
	description		= "在 我 加 入 你 们 之 前 ， 我 必 须 要 ‘ 了 解 ’ 什 么 ？";
};

func int DIA_Lee_ClearWhat_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ClearWhat_Info()
{
	AI_Output(other, self, "DIA_Lee_ClearWhat_15_00"); //在 我 加 入 你 们 之 前 ， 我 必 须 要 ‘ 了 解 ’ 什 么 ？
	AI_Output(self, other, "DIA_Lee_ClearWhat_04_01"); //欧 纳 尔 ， 那 个 地 主 ， 是 雇 佣 我 们 的 人 。 只 有 在 他 的 许 可 下 ， 你 才 能 呆 在 农 场 里 。
	AI_Output(self, other, "DIA_Lee_ClearWhat_04_02"); //然 后 是 那 些 小 伙 子 们 。 只 有 当 大 部 分 雇 佣 兵 都 同 意 你 加 入 我 们 时 ， 我 才 能 接 收 你 。
	AI_Output(self, other, "DIA_Lee_ClearWhat_04_03"); //不 过 ， 在 事 情 办 好 之 前 ， 不 要 去 找 欧 纳 尔 。 他 是 个 没 耐 心 的 家 伙 … …

	Log_CreateTopic(TOPIC_BecomeSLD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BecomeSLD, LOG_RUNNING);
	B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_1);
};

// ************************************************************
// 			  				OtherSld
// ************************************************************
instance DIA_Lee_OtherSld(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 7;
	condition		= DIA_Lee_OtherSld_Condition;
	information		= DIA_Lee_OtherSld_Info;
	description		= "我 怎 么 才 能 说 服 雇 佣 兵 们 赞 成 我 加 入 ？";
};

func int DIA_Lee_OtherSld_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_WannaJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lee_OtherSld_Info()
{
	AI_Output(other, self, "DIA_Lee_OtherSld_15_00"); //我 怎 么 才 能 说 服 雇 佣 兵 们 赞 成 我 加 入 ？
	AI_Output(self, other, "DIA_Lee_OtherSld_04_01"); //我 想 ， 是 做 一 名 雇 佣 兵 该 做 的 事 情 。
	AI_Output(self, other, "DIA_Lee_OtherSld_04_02"); //去 跟 托 尔 洛 夫 谈 谈 。 他 通 常 在 屋 子 前 面 。 他 会 给 你 进 行 测 试 。
	AI_Output(self, other, "DIA_Lee_OtherSld_04_03"); //如 果 你 能 通 过 ， 就 应 该 已 经 赢 得 了 大 部 分 的 必 要 的 尊 敬 。
	AI_Output(self, other, "DIA_Lee_OtherSld_04_04"); //他 会 告 诉 你 一 切 你 想 知 道 的 事 情 。

	B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Ranger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lee_Ranger(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 2;
	condition		= DIA_Addon_Lee_Ranger_Condition;
	information		= DIA_Addon_Lee_Ranger_Info;
	description		= "你 了 解 ‘ 水 之 环 ’ 的 事 情 吗 ？";
};

func int DIA_Addon_Lee_Ranger_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_OtherSld))
	&& (SC_KnowsRanger == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lee_Ranger_Info()
{
	AI_Output(other, self, "DIA_Addon_Lee_Ranger_15_00"); //你 了 解 ‘ 水 之 环 ’ 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Addon_Lee_Ranger_04_01"); //（ 大 笑 ） 我 可 能 已 经 知 道 了 。 你 什 么 事 情 都 要 参 与 ， 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Lee_Ranger_15_02"); //快 点 ， 告 诉 我 。
	AI_Output(self, other, "DIA_Addon_Lee_Ranger_04_03"); //我 只 沾 了 沾 边 。 我 知 道 这 个 秘 密 行 会 的 存 在 ， 而 且 幕 后 是 那 些 水 法 师 。
	AI_Output(self, other, "DIA_Addon_Lee_Ranger_04_04"); //自 从 屏 障 崩 溃 后 ， 我 不 再 履 行 以 前 我 跟 水 法 师 同 盟 的 约 定 。
	AI_Output(self, other, "DIA_Addon_Lee_Ranger_04_05"); //当 然 ， 我 能 帮 的 时 候 还 是 会 帮 忙 。 但 是 ， 大 部 分 时 候 ， 我 有 自 己 的 事 情 ， 几 乎 没 有 时 间 干 别 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Lee_Ranger_04_06"); //如 果 你 想 了 解 更 多 ， 你 也 许 可 以 去 跟 考 德 谈 谈 。 据 我 所 知 ， 他 是 他 们 的 人 。

	RangerHelp_gildeSLD = TRUE;
	SC_KnowsCordAsRangerFromLee = TRUE;
};

// ************************************************************
// 			  				JoinNOW
// ************************************************************
var int Lee_ProbeOK;
var int Lee_StimmenOK;
var int Lee_OnarOK;
instance DIA_Lee_JoinNOW(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 8;
	condition		= DIA_Lee_JoinNOW_Condition;
	information		= DIA_Lee_JoinNOW_Info;
	permanent		= TRUE;
	description		= "我 准 备 好 加 入 你 们 了 ！";
};

func int DIA_Lee_JoinNOW_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Npc_KnowsInfo(other, DIA_Lee_OtherSld))
	&& (Lee_OnarOK == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_JoinNOW_Info()
{
	AI_Output(other, self, "DIA_Lee_JoinNOW_15_00"); //我 准 备 好 加 入 你 们 了 ！

	// ------ Probe ------
	if (Lee_ProbeOK == FALSE)
	{
		if ((MIS_Torlof_HolPachtVonSekob != LOG_SUCCESS)
		&& (MIS_Torlof_BengarMilizKlatschen != LOG_SUCCESS))
		{
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_01"); //在 你 通 过 托 尔 洛 夫 的 测 试 之 前 不 行 。
		}
		else // Probe bestanden
		{
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_02"); //那 么 ， 你 已 经 通 过 了 托 尔 洛 夫 的 测 试 ？
			AI_Output(other, self, "DIA_Lee_JoinNOW_15_03"); //是 的 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_04"); //那 样 很 好 。
			Lee_ProbeOK = TRUE;
		};
	};

	// ------ Stimmen -------
	if ((Lee_ProbeOK == TRUE)
	&& (Lee_StimmenOK == FALSE))
	{
		AI_Output(self, other, "DIA_Lee_JoinNOW_04_05"); //其 它 的 雇 佣 兵 怎 么 说 ？
		if (Torlof_GenugStimmen == FALSE)
		{
			AI_Output(other, self, "DIA_Lee_JoinNOW_15_06"); //我 不 太 确 定 是 否 有 足 够 的 人 支 持 我 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_07"); //那 么 ， 去 跟 托 尔 洛 夫 谈 谈 ， 他 知 道 农 场 里 的 所 有 事 情 。
		}
		else // genug Stimmen
		{
			AI_Output(other, self, "DIA_Lee_JoinNOW_15_08"); //大 部 分 人 都 支 持 我 。
			Lee_StimmenOK = TRUE;
		};
	};

	// ------ Onar ------
	if ((Lee_StimmenOK == TRUE)
	&& (Lee_OnarOK == FALSE))
	{
		if (Onar_Approved == FALSE)
		{
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_09"); //很 好 ， 那 现 在 去 见 欧 纳 尔 吧 。 我 已 经 跟 他 谈 过 了 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_10"); //但 你 得 自 己 去 谈 报 酬 的 事 。
			Lee_SendToOnar = TRUE;
			B_LogEntry(TOPIC_BecomeSLD, TOPIC_BecomeSLD_3);
		}
		else // Onar ist einverstanden
		{
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_11"); //你 已 经 见 过 欧 纳 尔 了 吗 ？
			AI_Output(other, self, "DIA_Lee_JoinNOW_15_12"); //他 同 意 。
			Lee_OnarOK = TRUE;

			AI_Output(self, other, "DIA_Lee_JoinNOW_04_13"); //欢 迎 加 入 ， 伙 计 ！
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_14"); //给 ， 先 拿 些 象 样 的 盔 甲 ！
			Npc_SetTrueGuild(other, GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine(Lothar, "START");

			CreateInvItems(other, ItAr_Sld_L, 1);
			AI_EquipArmor(other, ItAr_Sld_L);

			Snd_Play("LEVELUP");

			KDF_Aufnahme = LOG_OBSOLETE;
			SLD_Aufnahme = LOG_SUCCESS;
			MIL_Aufnahme = LOG_OBSOLETE;
			B_GivePlayerXP(XP_BecomeMercenary);

			AI_Output(self, other, "DIA_Lee_JoinNOW_04_15"); //我 很 高 兴 你 能 加 入 我 们 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_16"); //我 已 经 安 排 了 你 的 第 一 个 任 务 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_17"); //与 圣 骑 士 有 关 。 现 在 到 了 去 见 他 们 的 时 候 了 。
			AI_Output(self, other, "DIA_Lee_JoinNOW_04_18"); //不 管 怎 么 样 ， 你 正 好 想 去 那 里 。
		};
	};
};

// ************************************************************
// 			  				KEIN SLD
// ************************************************************
instance DIA_Lee_KeinSld(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_KeinSld_Condition;
	information		= DIA_Lee_KeinSld_Info;
	important		= TRUE;
};

func int DIA_Lee_KeinSld_Condition()
{
	if (((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Lee_KeinSld_Info()
{
	if ((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Lee_KeinSld_04_00"); //我 知 道 你 已 经 为 圣 骑 士 服 务 了 。
	};

	if ((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Lee_KeinSld_04_01"); //你 进 入 了 修 道 院 ？ （ 大 笑 ） 每 件 事 情 我 都 想 到 了 ， 除 了 这 件 。
	};

	AI_Output(self, other, "DIA_Lee_KeinSld_04_02"); //那 么 ， 你 现 在 不 能 成 为 雇 佣 兵 了 。
	AI_Output(self, other, "DIA_Lee_KeinSld_04_03"); //但 谁 知 道 呢 ， 也 许 你 可 以 替 我 做 一 两 件 事 - 或 者 我 为 你 。
	AI_Output(self, other, "DIA_Lee_KeinSld_04_04"); //我 们 再 看 吧 。 总 之 ， 我 祝 你 一 帆 风 顺 。
	AI_Output(self, other, "DIA_Lee_KeinSld_04_05"); //但 是 千 万 别 想 骗 我 ， 明 白 吗 ？
};

// ************************************************************
// 			  				ToHagen
// ************************************************************
instance DIA_Lee_ToHagen(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_ToHagen_Condition;
	information		= DIA_Lee_ToHagen_Info;
	description		= "我 现 在 要 怎 么 到 圣 骑 士 那 里 ？";
};

func int DIA_Lee_ToHagen_Condition()
{
	if (other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void DIA_Lee_ToHagen_Info()
{
	AI_Output(other, self, "DIA_Lee_ToHagen_15_00"); //我 现 在 要 怎 么 到 圣 骑 士 那 里 ？
	AI_Output(self, other, "DIA_Lee_ToHagen_04_01"); //非 常 简 单 。 你 将 把 我 们 的 和 平 提 议 带 给 他 们 。
	AI_Output(self, other, "DIA_Lee_ToHagen_04_02"); //我 认 识 哈 根 勋 爵 ， 从 我 在 皇 家 部 队 的 时 候 ， 他 是 圣 骑 士 的 指 挥 官 。
	AI_Output(self, other, "DIA_Lee_ToHagen_04_03"); //我 知 道 他 怎 么 想 - 他 没 有 足 够 的 人 手 。 他 会 接 受 这 个 提 议 。 至 少 他 会 听 你 的 。
	AI_Output(self, other, "DIA_Lee_ToHagen_04_04"); //我 已 经 写 好 一 封 信 了 - 给 你 。
	B_GiveInvItems(self, other, ItWr_Passage_MIS, 1);
	AI_Output(self, other, "DIA_Lee_ToHagen_04_05"); //无 论 如 何 ， 那 都 让 你 能 见 到 圣 骑 士 的 首 领 。

	MIS_Lee_Friedensangebot = LOG_RUNNING;

	Log_CreateTopic(Topic_Frieden, LOG_MISSION);
	Log_SetTopicStatus(Topic_Frieden, LOG_RUNNING);
	B_LogEntry(Topic_Frieden, Topic_Frieden_1);
};

// ************************************************************
// 			  			AngebotSuccess
// ************************************************************
instance DIA_Lee_AngebotSuccess(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_AngebotSuccess_Condition;
	information		= DIA_Lee_AngebotSuccess_Info;
	description		= "我 给 哈 根 勋 爵 带 去 了 你 的 和 平 协 议 !";
};

func int DIA_Lee_AngebotSuccess_Condition()
{
	if (Hagen_FriedenAbgelehnt == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_AngebotSuccess_Info()
{
	AI_Output(other, self, "DIA_Lee_AngebotSuccess_15_00"); //我 给 哈 根 勋 爵 带 去 了 你 的 和 平 协 议 !
	AI_Output(self, other, "DIA_Lee_AngebotSuccess_04_01"); //他 说 了 些 什 么 ？
	AI_Output(other, self, "DIA_Lee_AngebotSuccess_15_02"); //他 说 我 们 将 会 给 你 赦 免 ， 但 不 会 赦 免 你 们 的 人 。
	AI_Output(self, other, "DIA_Lee_AngebotSuccess_04_03"); //那 个 固 执 的 笨 蛋 。 在 国 王 的 部 队 里 ， 大 部 分 人 都 是 比 我 们 更 残 忍 的 杀 人 犯 。
	AI_Output(other, self, "DIA_Lee_AngebotSuccess_15_04"); //现 在 你 准 备 怎 么 办 ？
	AI_Output(self, other, "DIA_Lee_AngebotSuccess_04_05"); //我 必 须 想 别 的 方 法 让 我 们 离 开 这 里 。 必 要 的 话 ， 我 们 将 夺 取 这 艘 船 。 我 必 须 考 虑 一 下 。
	AI_Output(self, other, "DIA_Lee_AngebotSuccess_04_06"); //把 我 自 己 从 绞 索 中 救 出 来 而 抛 弃 别 的 人 是 不 可 能 的 。

	MIS_Lee_Friedensangebot = LOG_SUCCESS;
};

// ************************************************************
// 			  			Background
// ************************************************************
instance DIA_Lee_Background(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_Background_Condition;
	information		= DIA_Lee_Background_Info;
	description		= "你 为 什 么 这 么 迫 切 地 想 要 去 大 陆 ？";
};

func int DIA_Lee_Background_Condition()
{
	if (MIS_Lee_Friedensangebot == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_Background_Info()
{
	AI_Output(other, self, "DIA_Lee_Add_15_10"); //你 为 什 么 这 么 迫 切 地 想 要 去 大 陆 ？
	AI_Output(self, other, "DIA_Lee_Add_04_11"); //你 知 道 ， 我 曾 经 是 国 王 的 将 军 。
	AI_Output(self, other, "DIA_Lee_Add_04_12"); //但 是 他 的 奸 臣 陷 害 了 我 ， 因 为 我 知 道 一 些 不 该 知 道 的 事 情 。
	AI_Output(self, other, "DIA_Lee_Add_04_13"); //他 们 把 我 扔 到 了 矿 坑 流 放 地 ， 而 国 王 批 准 了 这 件 事 。
	AI_Output(self, other, "DIA_Lee_Add_04_14"); //我 花 了 很 长 一 段 时 间 思 考 这 件 事 情 。
	AI_Output(self, other, "DIA_Lee_Add_04_15"); //我 将 为 自 己 报 仇 雪 恨 。
	AI_Output(other, self, "DIA_Lee_Add_15_16"); //（ 惊 讶 的 ） 向 国 王 ？
	AI_Output(self, other, "DIA_Lee_Add_04_17"); //（ 坚 决 的 ） 向 国 王 ！ 还 有 所 有 奉 承 他 的 人 。 他 们 将 在 痛 苦 中 后 悔 曾 经 对 我 做 过 的 一 切 … …
};

// ************************************************************
// 			  		RescueGorn
// ************************************************************
instance DIA_Lee_RescueGorn(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 2;
	condition		= DIA_Lee_RescueGorn_Condition;
	information		= DIA_Lee_RescueGorn_Info;
	description		= "我 正 在 向 矿 藏 山 谷 前 进 。";
};

func int DIA_Lee_RescueGorn_Condition()
{
	if ((Hagen_BringProof == TRUE)
	&& (Kapitel < 3)
	&& (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_RescueGorn_Info()
{
	AI_Output(other, self, "DIA_Lee_RescueGorn_15_00"); //我 正 在 向 矿 藏 山 谷 前 进 。
	AI_Output(self, other, "DIA_Lee_RescueGorn_04_01"); //我 原 来 就 觉 得 你 不 会 在 农 场 里 呆 太 久 。
	AI_Output(self, other, "DIA_Lee_RescueGorn_04_02"); //如 果 你 回 到 流 放 地 去 的 话 ， 留 意 一 下 戈 恩 。 圣 骑 士 把 他 囚 禁 在 那 里 。
	AI_Output(self, other, "DIA_Lee_RescueGorn_04_03"); //戈 恩 是 个 不 错 的 人 ， 我 这 里 真 的 很 需 要 他 ， 所 以 ， 如 果 有 机 会 救 他 出 来 ， 那 就 别 错 过 。

	KnowsAboutGorn = TRUE;
};

// ************************************************************
// 			 RescueGorn Success
// ************************************************************
instance DIA_Lee_Success(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 2;
	condition		= DIA_Lee_Success_Condition;
	information		= DIA_Lee_Success_Info;
	description		= "我 已 经 释 放 了 戈 恩 。";
};

func int DIA_Lee_Success_Condition()
{
	if ((MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel >= 3)
	&& (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Lee_Success_Info()
{
	AI_Output(other, self, "DIA_Lee_Success_15_00"); //我 已 经 释 放 了 戈 恩 。
	AI_Output(self, other, "DIA_Lee_Success_04_01"); //是 的 ， 他 已 经 告 诉 我 了 。 干 得 漂 亮 。
	AI_Output(self, other, "DIA_Lee_Success_04_02"); //他 比 席 尔 维 欧 和 他 的 那 些 人 加 起 来 都 更 有 价 值 。

	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				AboutGorn
// ************************************************************
instance DIA_Lee_AboutGorn(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 5;
	condition		= DIA_Lee_AboutGorn_Condition;
	information		= DIA_Lee_AboutGorn_Info;
	description		= "戈 恩 和 你 谈 论 过 我 ？ ？ 他 怎 么 了 ？";
};

func int DIA_Lee_AboutGorn_Condition()
{
	if ((Kapitel < 3)
	&& (Npc_KnowsInfo(other, DIA_Lee_RescueGorn) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AboutGorn_Info()
{
	AI_Output(other, self, "DIA_Lee_AboutGorn_15_00"); //戈 恩 和 你 谈 论 过 我 ？ ？ 他 怎 么 了 ？
	AI_Output(self, other, "DIA_Lee_AboutGorn_04_01"); //你 记 得 他 的 ， 是 吗 ？

	Info_ClearChoices(DIA_Lee_AboutGorn);
	Info_AddChoice(DIA_Lee_AboutGorn, "让 我 想 想 … …", DIA_Lee_AboutGorn_Who);
	Info_AddChoice(DIA_Lee_AboutGorn, "好 的 。", DIA_Lee_AboutGorn_Yes);
};

func void DIA_Lee_AboutGorn_Yes()
{
	AI_Output(other, self, "DIA_Lee_AboutGorn_Yes_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Lee_AboutGorn_Yes_04_01"); //他 被 圣 骑 士 抓 住 了 ， 后 来 被 囚 犯 护 卫 队 送 回 了 矿 藏 山 谷 。
	AI_Output(self, other, "DIA_Lee_AboutGorn_Yes_04_02"); //如 果 通 往 矿 藏 山 谷 的 路 上 没 有 挤 满 圣 骑 士 和 兽 人 的 话 ， 我 早 就 派 人 去 把 他 救 出 来 了 。
	AI_Output(self, other, "DIA_Lee_AboutGorn_Yes_04_03"); //但 是 情 况 如 此 ， 没 有 办 法 。 可 怜 的 家 伙 。
	Info_ClearChoices(DIA_Lee_AboutGorn);
};

func void DIA_Lee_AboutGorn_Who()
{
	AI_Output(other, self, "DIA_Lee_AboutGorn_Who_15_00"); //让 我 想 想 … …
	AI_Output(self, other, "DIA_Lee_AboutGorn_Who_04_01"); //庞 大 、 黑 暗 、 邪 恶 、 还 有 一 把 大 斧 子 - 那 时 ， 他 跟 你 一 起 在 流 放 地 夺 回 了 我 们 的 矿 井 。
};

// ************************************************************
// 			  				WegenBullco
// ************************************************************
instance DIA_Lee_WegenBullco(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 6;
	condition		= DIA_Lee_WegenBullco_Condition;
	information		= DIA_Lee_WegenBullco_Info;
	description		= "因 为 布 尔 克 ， 欧 纳 尔 现 在 只 剩 下 很 少 的 绵 羊 … …";
};

func int DIA_Lee_WegenBullco_Condition()
{
	if ((Kapitel < 4)
	&& (MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Lee_WegenBullco_Info()
{
	AI_Output(other, self, "DIA_Lee_Add_15_00"); //因 为 布 尔 克 ， 欧 纳 尔 现 在 只 剩 下 很 少 的 绵 羊 … …
	AI_Output(self, other, "DIA_Lee_Add_04_01"); //哦 ， 别 用 那 些 狗 屁 事 来 烦 我 ！ 我 的 麻 烦 已 经 够 多 的 了 。
	if ((Bullco_scharf == TRUE)
	&& (!Npc_IsDead(Bullco)))
	{
		AI_Output(other, self, "DIA_Lee_Add_15_02"); //我 也 是 。 布 尔 克 看 来 对 我 有 点 意 见 。 他 想 要 我 离 开 农 场 … …
		AI_Output(self, other, "DIA_Lee_Add_04_03"); //是 的 ， 还 有 吗 ？ 坚 持 自 己 的 权 利 。
		AI_Output(self, other, "DIA_Lee_Add_04_04"); //你 去 告 诉 他 要 他 控 制 好 自 己 ， 否 则 我 将 在 他 的 报 酬 中 扣 除 那 些 失 踪 的 羊 … …
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 2
// ##
// ##
// #####################################################################

// ************************************************************
// 							Drachen Report
// ************************************************************
instance DIA_Lee_Report(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_Report_Condition;
	information		= DIA_Lee_Report_Info;
	permanent		= TRUE;
	description		= "我 从 矿 藏 山 谷 来 … …";
};

func int DIA_Lee_Report_Condition()
{
	if ((EnterOW_Kapitel2 == TRUE)
	&& (Kapitel <= 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_Report_Info()
{
	AI_Output(other, self, "DIA_Lee_Add_15_18"); //我 从 矿 藏 山 谷 来 。 那 里 的 城 堡 遭 到 了 龙 的 袭 击 ！
	AI_Output(self, other, "DIA_Lee_Add_04_19"); //那 么 ， 这 是 真 的 ！ 莱 尔 瑞 兹 说 关 于 龙 的 传 言 在 整 个 城 市 里 流 传 … … 我 那 时 不 相 信 … …
	AI_Output(self, other, "DIA_Lee_Add_04_20"); //那 些 圣 骑 士 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Lee_Add_15_21"); //他 们 全 都 被 杀 掉 了 。
	if (other.guild == GIL_SLD)
	{
		AI_Output(self, other, "DIA_Lee_Add_04_22"); //很 好 ！ 也 许 现 在 哈 根 勋 爵 将 会 再 次 考 虑 我 的 提 议 … …
		AI_Output(self, other, "DIA_Lee_Add_04_23"); //如 果 不 行 的 话 … … （ 倔 强 的 ） 我 们 就 找 别 的 途 径 离 开 这 里 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_Add_04_24"); //很 好 ！ 也 许 那 将 会 迫 使 哈 根 勋 爵 带 着 他 的 人 转 移 到 矿 藏 山 谷 … …
		AI_Output(self, other, "DIA_Lee_Add_04_25"); //呆 在 这 里 的 圣 骑 士 越 少 越 好 。
	};
};

// ************************************************************
// 							Armor M freischalten
// ************************************************************

var int Lee_Give_Sld_M;
// -----------------------
instance DIA_Lee_ArmorM(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_ArmorM_Condition;
	information		= DIA_Lee_ArmorM_Info;
	permanent		= TRUE;
	description		= "一 些 更 好 的 盔 甲 怎 么 样 ？";
};

func int DIA_Lee_ArmorM_Condition()
{
	if ((Kapitel == 2)
	&& (other.guild == GIL_SLD)
	&& (Lee_Give_Sld_M == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorM_Info()
{
	AI_Output(other, self, "DIA_Lee_ArmorM_15_00"); //一 些 更 好 的 盔 甲 怎 么 样 ？

	if ((MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS)
	&& (MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Lee_ArmorM_04_01"); //你 完 成 了 任 务 。
		AI_Output(self, other, "DIA_Lee_ArmorM_04_02"); //我 这 里 有 一 些 更 好 的 盔 甲 给 你 。 就 是 这 个 ， 如 果 你 有 必 要 的 资 金 的 话 。

		Lee_Give_Sld_M = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_ArmorM_04_03"); //托 尔 洛 夫 接 到 了 欧 纳 尔 派 遣 的 任 务 ， 那 早 就 应 该 解 决 了 。
		AI_Output(self, other, "DIA_Lee_ArmorM_04_04"); //先 解 决 那 个 问 题 - 然 后 ， 我 们 再 讨 论 更 好 盔 甲 的 事 ！
	};
};

// ************************************************************
// 							Armor M kaufen
// ************************************************************
var int Lee_SldMGiven;
// -------------------
instance DIA_Lee_BuyArmorM(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_BuyArmorM_Condition;
	information		= DIA_Lee_BuyArmorM_Info;
	permanent		= TRUE;
	description		= "购 买 中 型 雇 佣 兵 盔 甲 。 防 护 ： 武 器 ４ ５ ， 箭 ４ ５ 。 花 费 ： １ ００ ０ 金 币";
};

func int DIA_Lee_BuyArmorM_Condition()
{
	if ((Lee_Give_Sld_M == TRUE)
	&& (Lee_SldMGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorM_Info()
{
	AI_Output(other, self, "DIA_Lee_BuyArmorM_15_00"); //给 我 那 个 盔 甲 。

	if (B_GiveInvItems(other, self, itmi_gold, 1000))
	{
		AI_Output(self, other, "DIA_Lee_BuyArmorM_04_01"); //给 你 。 很 好 的 盔 甲 。
		// B_GiveInvItems (self, other, itar_sld_M, 1);
		CreateInvItems(other, ItAr_Sld_M, 1);
		AI_EquipArmor(other, ItAr_Sld_M);

		Lee_SldMGiven = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_BuyArmorM_04_02"); //但 它 不 是 礼 物 ！ 首 先 ， 我 想 看 到 一 些 金 子 ！
	};
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
instance DIA_Lee_KAP3_EXIT(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 999;
	condition		= DIA_Lee_KAP3_EXIT_Condition;
	information		= DIA_Lee_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  				  		Teleport
// ************************************************************
instance DIA_Lee_Teleport(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 1;
	condition		= DIA_Lee_Teleport_Condition;
	information		= DIA_Lee_Teleport_Info;
	important		= TRUE;
};

func int DIA_Lee_Teleport_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Lee_Teleport == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Teleport_Info()
{
	B_Lee_Teleport();
};

// ************************************************************
// 							Armor H freischalten
// ************************************************************
instance DIA_Lee_ArmorH(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_ArmorH_Condition;
	information		= DIA_Lee_ArmorH_Info;
	description		= "你 有 更 好 的 盔 甲 给 我 吗 ？";
};

func int DIA_Lee_ArmorH_Condition()
{
	if ((Kapitel == 3)
	&& ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_ArmorH_Info()
{
	AI_Output(other, self, "DIA_Lee_ArmorH_15_00"); //你 有 更 好 的 盔 甲 给 我 吗 ？
	AI_Output(self, other, "DIA_Lee_ArmorH_04_01"); //我 当 然 会 这 么 做 。
};

// ************************************************************
// 							Armor H kaufen
// ************************************************************
var int Lee_SldHGiven;
// -------------------
instance DIA_Lee_BuyArmorH(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_BuyArmorH_Condition;
	information		= DIA_Lee_BuyArmorH_Info;
	permanent		= TRUE;
	description		= "购 买 重 型 雇 佣 兵 盔 甲 。 防 护 ： 武 器 ６ ０ ， 箭 ６ ０ 。 花 费 ：２ ５ ０ ０ 金 币";
};

func int DIA_Lee_BuyArmorH_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_ArmorH))
	&& (Lee_SldHGiven == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_BuyArmorH_Info()
{
	AI_Output(other, self, "DIA_Lee_BuyArmorH_15_00"); //给 我 那 个 重 盔 甲 。

	if (B_GiveInvItems(other, self, itmi_gold, 2500))
	{
		AI_Output(self, other, "DIA_Lee_BuyArmorH_04_01"); //给 你 ， 相 当 好 的 盔 甲 。 它 跟 我 穿 的 盔 甲 一 样 。
		// CreateInvItems(self,itar_sld_H,1);
		// B_GiveInvItems (self, other, itar_sld_H, 1);

		CreateInvItems(other, ItAr_Sld_H, 1);
		AI_EquipArmor(other, ItAr_Sld_H);

		Lee_SldHGiven = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_BuyArmorH_04_02"); //你 知 道 该 怎 么 做 。 先 拿 金 子 来 ！
	};
};

// ************************************************************
// 	Richter
// ************************************************************
instance DIA_Lee_Richter(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_Richter_Condition;
	information		= DIA_Lee_Richter_Info;
	description		= "你 还 有 其 它 的 事 情 给 我 做 吗 ？";
};

func int DIA_Lee_Richter_Condition()
{
	if ((Kapitel >= 3)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& ((Npc_IsDead(Richter)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_Richter_Info()
{
	AI_Output(other, self, "DIA_Lee_Richter_15_00"); //你 还 有 其 它 的 事 情 给 我 做 吗 ？
	AI_Output(self, other, "DIA_Lee_Richter_04_01"); //你 总 是 没 够 ， 是 吗 ？ 实 际 上 你 现 在 已 经 惹 了 一 身 麻 烦 。 那 你 还 想 干 什 么 ？
	AI_Output(other, self, "DIA_Lee_Richter_15_02"); //另 一 个 任 务 。 我 是 个 雇 佣 兵 ， 记 得 吗 ？
	AI_Output(self, other, "DIA_Lee_Richter_04_03"); //好 吧 。 我 有 一 些 事 情 ， 正 适 合 你 。
	AI_Output(self, other, "DIA_Lee_Richter_04_04"); //我 跟 城 里 的 法 官 有 一 笔 债 要 算 。 我 其 实 更 愿 意 亲 自 去 办 。
	AI_Output(self, other, "DIA_Lee_Richter_04_05"); //但 那 些 圣 骑 士 不 会 让 我 靠 近 他 的 房 子 。
	AI_Output(self, other, "DIA_Lee_Richter_04_06"); //需 要 考 虑 周 全 才 能 办 成 这 件 事 情 。 所 以 要 小 心 点 。 你 要 去 法 官 那 里 想 办 法 为 他 服 务 。
	AI_Output(self, other, "DIA_Lee_Richter_04_07"); //你 要 赢 取 他 的 信 任 ， 并 为 他 做 几 件 坏 事 ， 直 到 你 发 现 可 以 控 告 他 的 证 据 。
	AI_Output(self, other, "DIA_Lee_Richter_04_08"); //那 个 混 蛋 做 了 很 多 丧 尽 天 良 的 事 情 。
	AI_Output(self, other, "DIA_Lee_Richter_04_09"); //给 我 拿 来 一 些 能 让 他 在 民 兵 中 名 义 扫 地 的 东 西 ， 那 么 他 就 要 在 监 狱 里 度 过 他 的 余 生 了 。
	AI_Output(self, other, "DIA_Lee_Richter_04_10"); //不 过 ， 我 不 希 望 你 杀 了 他 ， 那 样 太 快 了 。 我 要 他 受 苦 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Lee_Richter_04_11"); //你 觉 得 你 能 办 到 吗 ？

	Log_CreateTopic(TOPIC_RichterLakai, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichterLakai, LOG_RUNNING);
	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_1);

	MIS_Lee_JudgeRichter = LOG_RUNNING;

	Info_ClearChoices(DIA_Lee_Richter);
	Info_AddChoice(DIA_Lee_Richter, "我 不 准 备 那 样 做 。", DIA_Lee_Richter_nein);
	Info_AddChoice(DIA_Lee_Richter, "没 问 题 。 多 少 ？", DIA_Lee_Richter_wieviel);
};

func void DIA_Lee_Richter_wieviel()
{
	AI_Output(other, self, "DIA_Lee_Richter_wieviel_15_00"); //没 问 题 。 多 少 ？
	AI_Output(self, other, "DIA_Lee_Richter_wieviel_04_01"); //你 的 报 酬 取 决 于 你 能 给 我 带 回 什 么 东 西 。 所 以 ， 努 力 吧 。
	Info_ClearChoices(DIA_Lee_Richter);
};

func void DIA_Lee_Richter_nein()
{
	AI_Output(other, self, "DIA_Lee_Richter_nein_15_00"); //我 不 想 干 。 我 不 想 去 做 那 个 混 蛋 的 受 气 包 。
	AI_Output(self, other, "DIA_Lee_Richter_nein_04_01"); //不 要 这 么 大 惊 小 怪 的 。 总 之 ， 他 是 那 个 把 你 弄 得 身 败 名 裂 ， 又 把 你 扔 进 屏 障 的 人 。 难 道 你 忘 记 那 件 事 了 吗 ？
	AI_Output(self, other, "DIA_Lee_Richter_nein_04_02"); //做 你 想 做 的 事 ， 但 我 想 你 会 作 出 正 确 的 决 定 。
	Info_ClearChoices(DIA_Lee_Richter);
};

// ************************************************************
// 	RichterBeweise
// ************************************************************
instance DIA_Lee_RichterBeweise(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_RichterBeweise_Condition;
	information		= DIA_Lee_RichterBeweise_Info;
	description		= "我 找 到 了 一 些 可 以 指 证 法 官 有 罪 的 东 西 。";
};

func int DIA_Lee_RichterBeweise_Condition()
{
	if ((Kapitel >= 3)
	&& (MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_RichterKomproBrief_MIS))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lee_RichterBeweise_Info()
{
	AI_Output(other, self, "DIA_Lee_RichterBeweise_15_00"); //我 找 到 了 一 些 可 以 指 证 法 官 有 罪 的 东 西 。
	AI_Output(self, other, "DIA_Lee_RichterBeweise_04_01"); //真 的 吗 ？ 是 什 么 ？
	AI_Output(other, self, "DIA_Lee_RichterBeweise_15_02"); //他 雇 了 几 个 暴 徒 去 袭 击 克 霍 里 尼 斯 的 总 督 。
	AI_Output(other, self, "DIA_Lee_RichterBeweise_15_03"); //没 多 久 ， 他 把 他 们 全 关 进 了 监 狱 ， 并 独 占 所 有 的 金 子 。
	AI_Output(other, self, "DIA_Lee_RichterBeweise_15_04"); //我 给 你 带 来 了 法 官 给 那 些 暴 徒 们 的 书 面 指 示 ， 可 以 把 它 作 为 证 据 。
	AI_Output(self, other, "DIA_Lee_RichterBeweise_04_05"); //让 我 看 看 ！
	B_GiveInvItems(other, self, ItWr_RichterKomproBrief_MIS, 1);
	B_UseFakeScroll();

	if ((Npc_IsDead(Richter)) == FALSE)
	{
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_06"); //终 于 。 那 足 够 让 他 出 血 了 。 我 很 感 动 。
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_07"); //我 愿 意 为 它 付 出 大 价 钱 。 这 是 你 的 报 酬 。
		CreateInvItems(self, ItMi_Gold, 500);
		B_GiveInvItems(self, other, ItMi_Gold, 500);
		MIS_Lee_JudgeRichter = LOG_SUCCESS;
		B_GivePlayerXP(XP_JudgeRichter);
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_08"); //关 于 这 件 事 ， 不 要 对 任 何 人 提 一 个 字 ， 明 白 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_09"); //那 太 棒 了 。 不 过 问 题 已 经 迎 刃 而 解 了 ， 法 官 已 经 死 了 。
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_10"); //有 些 笨 蛋 把 他 打 死 了 。 那 对 我 来 说 也 无 所 谓 。
		AI_Output(self, other, "DIA_Lee_RichterBeweise_04_11"); //这 儿 有 一 点 钱 。 现 在 这 张 纸 条 对 我 来 说 就 值 这 些 了 。
		CreateInvItems(self, ItMi_Gold, 50);
		B_GiveInvItems(self, other, ItMi_Gold, 50);
		MIS_Lee_JudgeRichter = LOG_FAILED;
		B_GivePlayerXP(XP_Ambient);
	};
};

// ************************************************************
// 	  				   Was ist mit Bennet?
// ************************************************************
instance DIA_Lee_TalkAboutBennet(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_TalkAboutBennet_Condition;
	information		= DIA_Lee_TalkAboutBennet_Info;
	description		= "那 么 贝 尼 特 呢 ？";
};

func int DIA_Lee_TalkAboutBennet_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (KApitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Lee_TalkAboutBennet_Info()
{
	AI_Output(other, self, "DIA_Lee_TalkAboutBennet_15_00"); //那 么 贝 尼 特 呢 ？
	AI_Output(self, other, "DIA_Lee_TalkAboutBennet_04_01"); //那 么 ， 你 听 说 过 那 件 事 了 。 那 些 混 蛋 把 他 关 起 来 了 ， 就 是 那 样 。
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self, other, "DIA_Lee_TalkAboutBennet_04_02"); //好 象 我 和 自 己 人 之 间 没 有 足 够 的 问 题 要 解 决 一 样 - 现 在 ， 我 还 必 须 要 对 付 那 些 圣 骑 士 。
	};
};

//**************************************************************
//	Was willst du wegen Bennet unternehmen?
//**************************************************************
instance DIA_Lee_DoAboutBennet(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_DoAboutBennet_Condition;
	information		= DIA_Lee_DoAboutBennet_Info;
	description		= "你 打 算 怎 么 对 付 贝 尼 特 ？";
};

func int DIA_Lee_DoAboutBennet_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Lee_TalkAboutBennet)))
	{
		return TRUE;
	};
};

func void DIA_Lee_DoAboutBennet_Info()
{
	AI_Output(other, self, "DIA_Lee_DoAboutBennet_15_00"); //你 打 算 怎 么 对 付 贝 尼 特 ？
	AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_01"); //我 还 不 知 道 。 有 几 个 小 伙 子 想 跑 到 城 里 去 打 掉 哈 根 勋 爵 的 牙 让 他 往 嘴 里 吞 。
	AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_02"); //算 他 走 运 ， 我 们 没 有 足 够 的 人 手 去 干 这 样 的 事 ， 而 且 这 也 不 是 我 的 风 格 。
	AI_Output(other, self, "DIA_Lee_DoAboutBennet_15_03"); //那 么 ， 你 准 备 呆 在 这 里 看 着 事 情 发 生 ？
	AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_04"); //当 然 不 是 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_1);

	if (!Npc_IsDead(Lares))
	{
		AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_05"); //莱 尔 瑞 兹 还 在 城 里 ， 他 想 搞 清 楚 我 们 怎 么 才 能 把 贝 尼 特 从 那 里 弄 出 去 。
		AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_06"); //在 那 之 前 ， 我 会 一 直 稳 住 我 的 人 。 我 只 希 望 莱 尔 瑞 兹 不 会 花 太 长 的 时 间 。
	};

	if ((!Npc_IsDead(Buster))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self, other, "DIA_Lee_DoAboutBennet_04_07"); //哦 ， 是 的 。 趁 我 还 没 忘 … … 巴 斯 特 想 跟 你 谈 谈 。 他 不 告 诉 我 是 什 么 事 。 也 许 你 该 去 见 他 ！
	};
};

//**************************************************************
//	Kann ich dir helfen?
//**************************************************************
instance DIA_Lee_CanHelpYou(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_CanHelpYou_Condition;
	information		= DIA_Lee_CanHelpYou_Info;
	description		= "我 能 帮 你 解 决 贝 尼 特 的 事 吗 ？";
};

func int DIA_Lee_CanHelpYou_Condition()
{
	if ((MIS_RescueBennet == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Lee_DoAboutBennet)))
	{
		return TRUE;
	};
};

func void DIA_Lee_CanHelpYou_Info()
{
	AI_Output(other, self, "DIA_Lee_CanHelpYou_15_00"); //我 能 帮 你 解 决 贝 尼 特 的 事 吗 ？
	AI_Output(self, other, "DIA_Lee_CanHelpYou_04_01"); //当 然 ， 在 这 件 事 情 上 面 ， 一 点 点 聪 明 和 理 智 没 有 什 么 坏 处 。
	AI_Output(self, other, "DIA_Lee_CanHelpYou_04_02"); //英 诺 斯 才 知 道 ， 这 周 围 到 处 都 是 白 痴 。
	AI_Output(self, other, "DIA_Lee_CanHelpYou_04_03"); //去 城 里 ， 看 看 你 能 不 能 想 法 子 把 贝 尼 特 从 那 里 弄 出 来 。
	AI_Output(self, other, "DIA_Lee_CanHelpYou_04_04"); //不 过 ， 这 件 事 别 弄 得 太 久 ， 我 不 知 道 还 能 把 这 些 人 控 制 多 久 。
};

//**************************************************************
//	Gibts was neues wegen Bennet?
//**************************************************************

// ----------------------------------
var int DIA_Lee_AnyNews_OneTime;
// ----------------------------------
instance DIA_Lee_AnyNews(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_AnyNews_Condition;
	information		= DIA_Lee_AnyNews_Info;
	permanent		= TRUE;
	description		= "有 什 么 关 于 贝 尼 特 的 消 息 ？";
};

func int DIA_Lee_AnyNews_Condition()
{
	if ((MIS_RescueBennet != FALSE)
	&& (Npc_KnowsInfo(other, DIA_Lee_DoAboutBennet))
	&& (DIA_Lee_AnyNews_OneTime == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Lee_AnyNews_15_00"); //有 什 么 关 于 贝 尼 特 的 消 息 ？

	if (MIS_RescueBennet == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lee_AnyNews_04_01"); //至 少 他 看 起 来 在 监 狱 里 没 有 受 到 永 久 性 的 伤 害 。
		AI_Output(self, other, "DIA_Lee_AnyNews_04_02"); //干 得 漂 亮 。

		if (DIA_Lee_AnyNews_OneTime == FALSE)
		{
			B_GivePlayerXP(XP_AMBIENT);
			DIA_Lee_AnyNews_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_AnyNews_04_03"); //不 ， 我 们 知 道 的 还 不 够 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Sylvio
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_SYLVIO(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 3;
	condition		= DIA_Lee_SYLVIO_Condition;
	information		= DIA_Lee_SYLVIO_Info;
	description		= "当 时 还 发 生 了 什 么 事 情 ？";
};

func int DIA_Lee_SYLVIO_Condition()
{
	if (MIS_ReadyforChapter4 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_SYLVIO_Info()
{
	AI_Output(other, self, "DIA_Lee_SYLVIO_15_00"); //当 时 还 发 生 了 什 么 事 情 ？
	AI_Output(self, other, "DIA_Lee_SYLVIO_04_01"); //那 个 混 蛋 - 席 尔 维 欧 听 说 了 矿 藏 山 谷 里 有 龙 的 事 情 ， 就 害 得 农 场 里 的 每 一 个 人 都 为 此 而 疯 狂 。
	AI_Output(self, other, "DIA_Lee_SYLVIO_04_02"); //他 企 图 说 服 那 些 小 伙 子 跟 他 一 起 去 矿 藏 山 谷 。 他 拿 名 气 、 荣 誉 、 金 子 和 各 种 东 西 向 他 们 许 诺 。
	AI_Output(self, other, "DIA_Lee_SYLVIO_04_03"); //他 们 中 很 多 人 没 兴 趣 为 席 尔 维 欧 去 送 死 ， 但 还 是 有 几 个 白 痴 被 他 的 胡 言 乱 语 蒙 住 了 。
	AI_Output(self, other, "DIA_Lee_SYLVIO_04_04"); //故 事 的 结 局 是 ： 他 们 从 贝 尼 特 那 里 弄 齐 装 备 就 出 发 了 。
	AI_Output(self, other, "DIA_Lee_SYLVIO_04_05"); //（ 蔑 视 的 ） 啊 。 基 本 上 ， 我 很 高 兴 席 尔 维 欧 终 于 离 开 了 这 农 场 。
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
instance DIA_Lee_KAP4_EXIT(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 999;
	condition		= DIA_Lee_KAP4_EXIT_Condition;
	information		= DIA_Lee_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Can You Teach Me?
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_CanTeach(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 10;
	condition		= DIA_Lee_CanTeach_Condition;
	information		= DIA_Lee_CanTeach_Info;
	permanent		= TRUE;
	description		= "你 能 训 练 我 吗 ？";
};

func int DIA_Lee_CanTeach_Condition()
{
	if (Kapitel >= 4
	&& Lee_TeachPlayer == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lee_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Lee_CanTeach_15_00"); //你 能 训 练 我 吗 ？

	AI_Output(self, other, "DIA_Lee_CanTeach_04_01"); //我 可 以 给 你 示 范 一 下 怎 样 用 双 手 巨 剑 战 斗 。

	if (other.HitChance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self, other, "DIA_Lee_CanTeach_04_02"); //不 过 ， 我 没 有 时 间 象 这 样 来 教 你 基 本 功 。
		AI_Output(self, other, "DIA_Lee_CanTeach_04_03"); //只 要 你 能 达 到 某 一 个 技 能 等 级 ， 我 就 能 教 你 。 到 那 之 前 ， 你 必 须 找 其 它 的 老 师 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_CanTeach_04_04"); //我 听 说 你 非 常 不 错 。 但 我 猜 我 还 是 能 教 你 一 两 件 事 。
		if ((other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG))
		{
			Lee_TeachPlayer = TRUE;
			Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
			B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_1);
		}
		else
		{
			AI_Output(self, other, "DIA_Lee_CanTeach_04_05"); //所 以 ， 如 果 你 愿 意 ， 我 可 以 教 你 些 东 西 。 不 过 ， 那 会 需 要 花 些 钱 。
			AI_Output(other, self, "DIA_Lee_CanTeach_15_06"); //多 少 ？
			AI_Output(self, other, "DIA_Lee_CanTeach_04_07"); //1000个 金 币 就 能 成 交 。

			Info_ClearChoices(DIA_Lee_CanTeach);
			Info_AddChoice(DIA_Lee_CanTeach, "那 对 我 来 说 太 贵 了 。", DIA_Lee_CanTeach_No);

			if (Npc_HasItems(other, ItMi_Gold) >= 1000)
			{
				Info_AddChoice(DIA_Lee_CanTeach, "成 交 。 给 你 钱 。", DIA_Lee_CanTeach_Yes);
			};
		};
	};
};

func void DIA_Lee_CanTeach_No()
{
	AI_Output(other, self, "DIA_Lee_CanTeach_No_15_00"); //那 对 我 来 说 太 贵 了 。
	AI_Output(self, other, "DIA_Lee_CanTeach_No_04_01"); //考 虑 一 下 吧 。 象 我 这 么 棒 的 老 师 很 难 找 到 了 。

	Info_ClearChoices(DIA_Lee_CanTeach);
};

func void DIA_Lee_CanTeach_Yes()
{
	AI_Output(other, self, "DIA_Lee_CanTeach_Yes_15_00"); //成 交 。 给 你 钱 。
	AI_Output(self, other, "DIA_Lee_CanTeach_Yes_04_01"); //好 的 ， 我 向 你 保 证 ： 我 值 这 个 价 钱 。

	B_GiveInvItems(other, self, ItMi_Gold, 1000);
	Lee_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Lee_CanTeach);
	Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
	B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_1);
};

//**************************************
//			Ich will trainieren
//**************************************
instance DIA_Lee_Teach(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 10;
	condition		= DIA_Lee_Teach_Condition;
	information		= DIA_Lee_Teach_Info;
	permanent		= TRUE;
	description		= "让 我 们 开 始 训 练 吧 。";
};

func int DIA_Lee_Teach_Condition()
{
	if (Lee_Teachplayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_Teach_Info()
{
	AI_Output(other, self, "DIA_Lee_Teach_15_00"); //让 我 们 开 始 训 练 吧 。

	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach, DIALOG_BACK, DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_Back()
{
	Info_ClearChoices(DIA_Lee_Teach);
};

func void DIA_Lee_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 100);

	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self, other, "DIA_DIA_Lee_Teach_2H_1_04_00"); //现 在 ， 你 是 个 真 正 的 双 手 搏 击 大 师 了 。
		AI_Output(self, other, "DIA_DIA_Lee_Teach_2H_1_04_01"); //你 不 再 需 要 老 师 了 。
	};

	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach, DIALOG_BACK, DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_Teach_2H_5);
};

func void DIA_Lee_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 100);

	if (other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self, other, "DIA_Lee_Teach_2H_5_04_00"); //现 在 ， 你 是 个 真 正 的 双 手 搏 击 大 师 了 。
		AI_Output(self, other, "DIA_Lee_Teach_2H_5_04_01"); //你 不 再 需 要 老 师 了 。
	};

	Info_ClearChoices(DIA_Lee_Teach);
	Info_AddChoice(DIA_Lee_Teach, DIALOG_BACK, DIA_Lee_Teach_Back);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Lee_Teach_2H_1);
	Info_AddChoice(DIA_Lee_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Lee_Teach_2H_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachenei
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DRACHENEI(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_DRACHENEI_Condition;
	information		= DIA_Lee_DRACHENEI_Info;
	description		= "蜥 蜴 人 在 整 个 国 家 四 处 散 布 龙 蛋 。";
};

func int DIA_Lee_DRACHENEI_Condition()
{
	if (Npc_HasItems(other, ItAt_DragonEgg_MIS))
	{
		return TRUE;
	};
};

func void DIA_Lee_DRACHENEI_Info()
{
	AI_Output(other, self, "DIA_Lee_DRACHENEI_15_00"); //蜥 蜴 人 在 整 个 国 家 四 处 散 布 龙 蛋 。
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self, other, "DIA_Lee_DRACHENEI_04_01"); //我 已 经 知 道 了 ， 我 们 该 离 开 这 里 了 。

	if (hero.guild == GIL_DJG)
	{
		AI_Output(other, self, "DIA_Lee_DRACHENEI_15_02"); //我现在该干吗？
		AI_Output(self, other, "DIA_Lee_DRACHENEI_04_03"); //干 掉 他 们 。 还 能 有 什 么 ？
		AI_Output(self, other, "DIA_Lee_DRACHENEI_04_04"); //也 许 这 些 壳 可 以 用 来 做 成 盔 甲 或 者 其 它 类 似 的 东 西 。
		AI_Output(self, other, "DIA_Lee_DRACHENEI_04_05"); //它 们 看 起 来 非 常 坚 固 。 跟 贝 尼 特 谈 谈 这 件 事 。
		B_LogEntry(TOPIC_DRACHENEIER, TOPIC_DRACHENEIER_2);
	};
};

//********************************************************************
//	Kap 4 Perm
//********************************************************************
instance DIA_Lee_KAP4_Perm(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 49;
	condition		= DIA_Lee_KAP4_Perm_Condition;
	information		= DIA_Lee_KAP4_Perm_Info;
	permanent		= TRUE;
	description		= "农 场 怎 么 样 了 ？ ";
};

func int DIA_Lee_KAP4_Perm_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP4_Perm_Info()
{
	AI_Output(other, self, "DIA_Lee_KAP4_Perm_15_00"); //农 场 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Lee_KAP4_Perm_04_01"); //嗯 ， 自 从 席 尔 维 欧 离 开 这 里 后 ， 我 们 这 周 围 终 于 平 静 了 点 。
	AI_Output(other, self, "DIA_Lee_KAP4_Perm_15_02"); //那 听 起 来 不 错 。
	AI_Output(self, other, "DIA_Lee_KAP4_Perm_04_03"); //可 惜 ， 我 们 的 工 作 并 没 有 减 少 。 大 家 都 越 来 越 不 满 ， 因 为 现 在 他 们 除 了 做 自 己 的 事 外 还 要 处 理 席 尔 维 欧 的 人 负 责 的 事 情 。
	AI_Output(self, other, "DIA_Lee_KAP4_Perm_04_04"); //但 这 个 我 来 操 心，我 能 自 己 摆 平 他 们 。
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
instance DIA_Lee_KAP5_EXIT(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 999;
	condition		= DIA_Lee_KAP5_EXIT_Condition;
	information		= DIA_Lee_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GetShip(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_GetShip_Condition;
	information		= DIA_Lee_GetShip_Info;
	description		= "你 知 道 我 怎 么 才 能 控 制 圣 骑 士 的 船 吗 ？";
};

func int DIA_Lee_GetShip_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lee_GetShip_Info()
{
	AI_Output(other, self, "DIA_Lee_GetShip_15_00"); //你 知 道 我 怎 么 才 能 控 制 圣 骑 士 的 船 吗 ？
	AI_Output(self, other, "DIA_Lee_GetShip_04_01"); //你 觉 得 如 果 我 做 了 ， 我 还 会 在 这 里 吗 ？ 那 个 东 西 被 看 守 得 比 旧 营 地 那 里 的 矿 石 运 输 船 还 严 密 。
	AI_Output(other, self, "DIA_Lee_GetShip_15_02"); //一 定 有 方 法 上 船 。
	AI_Output(self, other, "DIA_Lee_GetShip_04_03"); //当 然 。 要 上 船 很 简 单 。

	Log_CreateTopic(TOPIC_Ship, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ship, LOG_RUNNING);

	if ((MIS_Lee_JudgeRichter == LOG_SUCCESS)
	&& ((Npc_IsDead(Richter)) == FALSE))
	{
		AI_Output(self, other, "DIA_Lee_GetShip_04_04"); //总 之 ， 法 官 在 我 们 的 控 制 下 。 你 必 须 去 找 他 迫 使 他 出 具 一 份 关 于 船 只 的 授 权 书 。
		MIS_RichtersPermissionForShip = LOG_RUNNING;
		B_LogEntry(TOPIC_Ship, TOPIC_Ship_1);
	}
	else if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Lee_GetShip_04_05"); //我 这 里 有 一 份 伪 造 的 授 权 书 。 有 了 它 ， 守 船 的 卫 兵 就 会 让 你 通 过 了 。

		B_LogEntry(TOPIC_Ship, TOPIC_Ship_2);
	};

	AI_Output(self, other, "DIA_Lee_GetShip_04_06"); //不 过 ， 光 有 了 这 个 还 不 行 。 要 让 船 开 起 来 ， 你 还 需 要 一 个 船 长 、 一 队 船 员 以 及 诸 如 此 类 的 东 西 。
	AI_Output(self, other, "DIA_Lee_GetShip_04_07"); //这 牵 扯 到 一 系 列 的 问 题 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);

	Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);

	Info_ClearChoices(DIA_Lee_GetShip);
	Info_AddChoice(DIA_Lee_GetShip, DIALOG_BACK, DIA_Lee_GetShip_back);
	Info_AddChoice(DIA_Lee_GetShip, "我 应 该 雇 谁 来 作 船 员 ？", DIA_Lee_GetShip_crew);

	if ((Npc_IsDead(Torlof)) == FALSE)
	{
		Info_AddChoice(DIA_Lee_GetShip, "你 知 道 有 谁 能 操 控 船 只 吗 ？", DIA_Lee_GetShip_torlof);
	};
};

func void DIA_Lee_GetShip_torlof()
{
	AI_Output(other, self, "DIA_Lee_GetShip_torlof_15_00"); //你 知 道 有 谁 能 操 控 船 只 吗 ？
	AI_Output(self, other, "DIA_Lee_GetShip_torlof_04_01"); //据 我 所 知 ， 托 尔 洛 夫 曾 经 做 过 水 手 。 他 了 解 这 类 事 情 。

	B_LogEntry(TOPIC_Captain, TOPIC_Captain_1);
};

func void DIA_Lee_GetShip_crew()
{
	AI_Output(other, self, "DIA_Lee_GetShip_crew_15_00"); //我 应 该 雇 谁 来 作 船 员 ？
	AI_Output(self, other, "DIA_Lee_GetShip_crew_04_01"); //你 必 须 自 己 作 出 决 定 。 不 过 ， 我 只 会 用 我 信 任 的 人 。 你 有 足 够 的 你 信 得 过 的 人 吗 ？
	AI_Output(self, other, "DIA_Lee_GetShip_crew_04_02"); //如 果 你 的 水 手 队 里 需 要 一 个 铁 匠 ， 你 应 该 去 找 贝 尼 特 。 他 肯 定 是 你 能 找 到 的 最 好 人 选 。

	B_LogEntry(TOPIC_Crew, TOPIC_Crew_1);
};

func void DIA_Lee_GetShip_back()
{
	Info_ClearChoices(DIA_Lee_GetShip);
};

///////////////////////////////////////////////////////////////////////
//	GotRichtersPermissionForShip
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_GotRichtersPermissionForShip(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_GotRichtersPermissionForShip_Condition;
	information		= DIA_Lee_GotRichtersPermissionForShip_Info;
	description		= "书 面 许 可 起 作 用 了 。";
};

func int DIA_Lee_GotRichtersPermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Lee_GotRichtersPermissionForShip_Info()
{
	AI_Output(other, self, "DIA_Lee_GotRichtersPermissionForShip_15_00"); //那 份 书 面 授 权 起 了 作 用 。 现 在 ， 船 是 我 的 了 。 那 个 法 官 非 常 合 作 。
	AI_Output(self, other, "DIA_Lee_GotRichtersPermissionForShip_04_01"); //好 吧 。 你 长 期 以 来 所 受 的 那 个 混 蛋 对 你 的 羞 辱 终 于 得 到 了 洗 雪 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Ich will das Schiff klauen
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StealShip(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_StealShip_Condition;
	information		= DIA_Lee_StealShip_Info;
	description		= "我 想 要 把 船 偷 走 。";
};

func int DIA_Lee_StealShip_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lee_GetShip))
	&& (hero.guild == GIL_DJG)
	&& (MIS_RichtersPermissionForShip == 0)) // Joly: kein Richter Erpressen nötig!
	{
		return TRUE;
	};
};

func void DIA_Lee_StealShip_Info()
{
	AI_Output(other, self, "DIA_Lee_StealShip_15_00"); //我 想 要 把 船 偷 走 。
	AI_Output(self, other, "DIA_Lee_StealShip_04_01"); //接 下 来 究 竟 怎 么 办 ？
	AI_Output(other, self, "DIA_Lee_StealShip_15_02"); //非 常 简 单 - 我 去 那 里 ， 给 他 们 看 你 的 文 档 ， 然 后 接 管 了 船 只 。
	AI_Output(self, other, "DIA_Lee_StealShip_04_03"); //照 你 这 么 说 话 。 给 ， 我 希 望 你 知 道 自 己 在 干 什 么 。

	CreateInvItems(self, ItWr_ForgedShipLetter_Mis, 1);
	B_GiveInvItems(self, other, ItWr_ForgedShipLetter_Mis, 1);
};

// Lee anheuern

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_KnowWhereEnemy(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_KnowWhereEnemy_Condition;
	information		= DIA_Lee_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "你 愿 意 陪 我 上 船 吗 ？";
};

func int DIA_Lee_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Lee_IsOnBoard == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Lee_GetShip)))
	{
		return TRUE;
	};
};

func void DIA_Lee_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_Lee_KnowWhereEnemy_15_00"); //你 愿 意 陪 我 上 船 吗 ？
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_04_01"); //你 在 开 玩 笑 ？ 我 当 然 要 加 入 。 我 在 大 陆 上 有 几 笔 旧 账 要 算 。
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_04_02"); //此 外 ， 我 可 以 教 你 单 手 和 双 手 搏 击 。 我 对 你 会 相 当 有 用 。

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_2);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_Lee_KnowWhereEnemy_15_03"); //现 在 船 已 经 满 了 ， 但 如 果 有 机 会 我 会 回 来 的 。
	}
	else
	{
		Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy, "如 果 我 需 要 你 ， 我 会 告 诉 你 的 。", DIA_Lee_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Lee_KnowWhereEnemy, "那 么 去 把 你 的 东 西 打 好 包 ！", DIA_Lee_KnowWhereEnemy_Yes);
	};
};

func void DIA_Lee_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_Lee_KnowWhereEnemy_Yes_15_00"); //那 么 去 把 你 的 东 西 打 好 包 ！
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_Yes_04_01"); //什 么 ？ 现 在 ？
	AI_Output(other, self, "DIA_Lee_KnowWhereEnemy_Yes_15_02"); //是 的 ， 我 正 在 计 划 离 开 这 里 ， 如 果 你 想 跟 我 一 起 ， 就 到 港 口 来 。 我 们 在 船 上 见 。
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_Yes_04_03"); //为 了 这 一 刻 ， 我 已 经 等 待 很 久 了 。 我 会 去 那 里 的 。

	B_GivePlayerXP(XP_Crewmember_Success);

	Lee_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};

func void DIA_Lee_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_Lee_KnowWhereEnemy_No_15_00"); //如 果 我 需 要 你 ， 我 会 告 诉 你 的 。
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_No_04_01"); //你 一 定 知 道 自 己 想 要 什 么 。 不 过 ， 你 周 围 永 远 不 会 有 足 够 的 好 战 士 。
	AI_Output(self, other, "DIA_Lee_KnowWhereEnemy_No_04_02"); //（ 咧 着 嘴 笑 ） 除 非 他 们 是 像 席 尔 维 欧 那 样 十 足 的 笨 蛋 。

	Lee_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Lee_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_LeaveMyShip(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_LeaveMyShip_Condition;
	information		= DIA_Lee_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "无 论 如 何 我 还 是 用 不 上 你 ！";
};

func int DIA_Lee_LeaveMyShip_Condition()
{
	if ((Lee_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lee_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Lee_LeaveMyShip_15_00"); //无 论 如 何 我 还 是 用 不 上 你 ！
	AI_Output(self, other, "DIA_Lee_LeaveMyShip_04_01"); //随 你 的 便 吧 ， 你 知 道 能 在 哪 里 找 到 我 ！

	Lee_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_StillNeedYou(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 4;
	condition		= DIA_Lee_StillNeedYou_Condition;
	information		= DIA_Lee_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "我 最 终 还 是 需 要 你 帮 忙 ！";
};

func int DIA_Lee_StillNeedYou_Condition()
{
	if (((Lee_IsOnBOard == LOG_OBSOLETE) // Hier braucht man natürlich nur eine variable abfragen
	|| (Lee_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Lee_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Lee_StillNeedYou_15_00"); //我 最 终 还 是 需 要 你 帮 忙 ！

	if (Lee_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Lee_StillNeedYou_04_01"); //我 知 道 你 需 要 我 ！ 我 们 在 船 上 见 ！

		Lee_IsOnBoard = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count + 1);

		if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self, "SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self, "WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Lee_StillNeedYou_04_02"); //你 知 道 什 么 ， 吝 啬 鬼 。 一 开 始 ， 你 要 我 来 ， 然 后 你 又 把 我 一 脚 踢 开 。
		AI_Output(self, other, "DIA_Lee_StillNeedYou_04_03"); //去 找 别 的 白 痴 吧 ！

		AI_StopProcessInfos(self);
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
instance DIA_Lee_KAP6_EXIT(C_INFO)
{
	npc				= SLD_800_Lee;
	nr				= 999;
	condition		= DIA_Lee_KAP6_EXIT_Condition;
	information		= DIA_Lee_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lee_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Lee_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
