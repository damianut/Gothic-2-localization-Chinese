// ************************************************************
// 			  					EXIT
// ************************************************************
instance DIA_Elena_EXIT(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 999;
	condition		= DIA_Elena_EXIT_Condition;
	information		= DIA_Elena_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Elena_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Elena_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
instance DIA_Elena_HALLO(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 1;
	condition		= DIA_Elena_HALLO_Condition;
	information		= DIA_Elena_HALLO_Info;
	description		= "你 好 ， 漂 亮 姑 娘。";
};

func int DIA_Elena_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Elena_HALLO_Info()
{
	AI_Output(other, self, "DIA_Elena_HALLO_15_00"); //你 好 ， 漂 亮 姑 娘。
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Elena_HALLO_16_01"); //嗯 。 你 刚 从 什 么 地 方 逃 出 来 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Elena_HALLO_16_02"); //你 想 要 什 么 ？
	};
};

// ************************************************************
// 			  					Aufstand
// ************************************************************
instance DIA_Elena_Aufstand(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 2;
	condition		= DIA_Elena_Aufstand_Condition;
	information		= DIA_Elena_Aufstand_Info;
	description		= "他 们 说 你 背 叛 了 国 王 ？";
};

func int DIA_Elena_Aufstand_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_Aufstand_Info()
{
	AI_Output(other, self, "DIA_Elena_Aufstand_15_00"); //他 们 说 你 背 叛 了 国 王 ？
	AI_Output(self, other, "DIA_Elena_Aufstand_16_01"); //我 的 父 亲 决 定 ， 现 在 是 我 们 保 护 自 己 的 时 候 了 。
	if (other.guild != GIL_MIL)
	{
		AI_Output(self, other, "DIA_Elena_Aufstand_16_02"); //民 兵 从 来 没 有 帮 助 过 我 们 。 他 们 只 是 来 这 里 拿 走 我 们 的 粮 食 。
	};
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Arbeit(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 3;
	condition		= DIA_Elena_Arbeit_Condition;
	information		= DIA_Elena_Arbeit_Info;
	description		= "农 场 这 里 有 什 么 工 作 可 做 ？";
};

func int DIA_Elena_Arbeit_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Arbeit_Info()
{
	AI_Output(other, self, "DIA_Elena_Arbeit_15_00"); //农 场 这 里 有 什 么 工 作 可 做 ？
	AI_Output(self, other, "DIA_Elena_Arbeit_16_01"); //我 父 亲 愿 意 付 钱 给 任 何 帮 助 我 们 保 护 农 场 的 人 。
	AI_Output(self, other, "DIA_Elena_Arbeit_16_02"); //你 感 兴 趣 吗 ？ 你 看 起 来 不 像 是 那 种 在 田 地 里 辛 苦 劳 作 过 的 人 。
	AI_Output(other, self, "DIA_Elena_Arbeit_15_03"); //你 的 父 亲 愿 意 付 多 少 钱？
	AI_Output(self, other, "DIA_Elena_Arbeit_16_04"); //你 必 须 去 和 他 交 涉 。
	AI_Output(self, other, "DIA_Elena_Arbeit_16_05"); //我 就 知 道 这 里 的 每 个 雇 佣 兵 每 天 都 能 拿 到 工 资 。
};

// ************************************************************
// 			  					Arbeit
// ************************************************************
instance DIA_Elena_Regeln(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 4;
	condition		= DIA_Elena_Regeln_Condition;
	information		= DIA_Elena_Regeln_Info;
	description		= "这 里 有 什 么 规 矩 我 必 须 要 遵 守 吗 ？";
};

func int DIA_Elena_Regeln_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Elena_Hallo))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Elena_Regeln_Info()
{
	AI_Output(other, self, "DIA_Elena_Regeln_15_00"); //这 里 有 什 么 规 矩 我 必 须 要 遵 守 吗 ？
	AI_Output(self, other, "DIA_Elena_Regeln_16_01"); //你 不 要 碰 这 里 任 何 不 属 于 你 的 东 西 。
	AI_Output(self, other, "DIA_Elena_Regeln_16_02"); //不 要 靠 近 任 何 和 你 无 关 的 地 方。
	AI_Output(self, other, "DIA_Elena_Regeln_16_03"); //如 果 你 一 定 想 要 打 架 的 话 ， 去 找 雇 佣 兵 。
	AI_Output(self, other, "DIA_Elena_Regeln_16_04"); //如 果 你 同 农 民 争 吵 的 话 ， 这 里 所 有 人 都 会 反 对 你 。
};

// ************************************************************
// 			  					Aufgabe
// ************************************************************
instance DIA_Elena_AUFGABE(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 5;
	condition		= DIA_Elena_AUFGABE_Condition;
	information		= DIA_Elena_AUFGABE_Info;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_Elena_AUFGABE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_AUFGABE_Info()
{
	AI_Output(other, self, "DIA_Elena_AUFGABE_15_00"); //你 在 这 里 做 什 么 工 作 ？
	AI_Output(self, other, "DIA_Elena_AUFGABE_16_01"); //我 出 售 我 们 自 己 生 产 的 东 西 。 如 果 你 想 要 买 什 么 东 西 的 话 ， 就 对 我 说 。
	AI_Output(self, other, "DIA_Elena_AUFGABE_16_02"); //但 是 我 要 警 告 你 。 我 不 会 接 受 讨 价 还 价 和 偷 窃 ， 明 白 了 吗 ？

	Log_CreateTopic(Topic_SoldierTrader, LOG_NOTE);
	B_LogEntry(Topic_SoldierTrader, Topic_SoldierTrader_2);
};

// ************************************************************
// 			  					TRADE
// ************************************************************

// ---------------------------------
var int Elena_Trade_mit_mir;
// ---------------------------------
instance DIA_Elena_TRADE(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 7;
	condition		= DIA_Elena_TRADE_Condition;
	information		= DIA_Elena_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 ！";
};

func int DIA_Elena_TRADE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Elena_AUFGABE))
	|| (Elena_Trade_mit_mir == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Elena_TRADE_Info()
{
	AI_Output(other, self, "DIA_Elena_TRADE_15_00"); //让 我 看 看 你 的 货 物 ！
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Elena_TRADE_16_01"); //那 么 ， 我 能 为 你 提 供 什 么 ？
};

// ************************************************************
// 			  					PERM
// ************************************************************
instance DIA_Elena_PERM(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 900;
	condition		= DIA_Elena_PERM_Condition;
	information		= DIA_Elena_PERM_Info;
	permanent		= TRUE;
	description		= "近 来 发 生 了 什 么 重 要 事 情 吗 ？";
};

func int DIA_Elena_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Elena_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Elena_PERM_Info()
{
	AI_Output(other, self, "DIA_Elena_PERM_15_00"); //近 来 发 生 了 什 么 重 要 事 情 吗 ？

	if (kapitel <= 1)
	{
		AI_Output(self, other, "DIA_Elena_PERM_16_01"); //几 天 前 ， 我 父 亲 宣 布 ， 我 们 不 再 向 镇 上 出 售 任 何 东 西 。
		AI_Output(self, other, "DIA_Elena_PERM_16_02"); //所 以 现 在 我 只 能 呆 在 农 场 这 里 向 路人 出 售 我 的 货 物 。

		Elena_Trade_mit_mir = TRUE;
	}
	else if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_Elena_PERM_16_03"); //民 兵 袭 击 临 近 农 场 的 次 数 越 来 越 多 。 我 父 亲 插 手 干 预 只 是 时 间 问 题 。
	}
	else if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_Elena_PERM_16_04"); //路 上 已 经 变 得 非 常 不 安 全 ， 现 在 没 人 敢 走 出 他 自 己 的 地 方 。 我 们 已 经 很 长 时 间 没 去 镇 上 了 。
	}
	else if (kapitel == 4)
	{
		AI_Output(self, other, "DIA_Elena_PERM_16_05"); //雇 佣 兵 变 得 越 来 越 不 安 分 。 不 过 自 从 席 尔 维 欧 和 他 的 人 离 开 之 后 ， 他 们 看 起 来 也 放 松 一 些 了 。
	}
	else // Kapitel 5
	{
		AI_Output(self, other, "DIA_Elena_PERM_16_06"); //所 有 人 都 在 谈 论 即 将 到 来 的 兽 人 的 攻 击 。 但 是 我 一 点 也 不 相 信 那 些 。 我 想 我 们 在 农 场 这 里 很 安 全 。
	};
};

// ##################################################################
// ##
// ## Kapitel 3
// ##
// ##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Minenanteil
///////////////////////////////////////////////////////////////////////
instance DIA_Elena_MINENANTEIL(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 2;
	condition		= DIA_Elena_MINENANTEIL_Condition;
	information		= DIA_Elena_MINENANTEIL_Info;
	description		= "你 在 出 售 矿 井 股 票 ？";
};

func int DIA_Elena_MINENANTEIL_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Elena_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Elena_MINENANTEIL_Info()
{
	AI_Output(other, self, "DIA_Elena_MINENANTEIL_15_00"); //你 在 出 售 矿 井 股 票 ？
	AI_Output(self, other, "DIA_Elena_MINENANTEIL_16_01"); //那 又 怎 么 样 ？ 我 自 己 为 他 们 付 出 了 很 高 的 代 价 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Elena_PICKPOCKET(C_INFO)
{
	npc				= BAU_911_Elena;
	nr				= 900;
	condition		= DIA_Elena_PICKPOCKET_Condition;
	information		= DIA_Elena_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Elena_PICKPOCKET_Condition()
{
	C_Beklauen(30, 35);
};

func void DIA_Elena_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
	Info_AddChoice(DIA_Elena_PICKPOCKET, DIALOG_BACK, DIA_Elena_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Elena_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Elena_PICKPOCKET_DoIt);
};

func void DIA_Elena_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};

func void DIA_Elena_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Elena_PICKPOCKET);
};
