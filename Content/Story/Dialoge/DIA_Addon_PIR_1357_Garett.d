// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Garett_EXIT(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 999;
	condition		= DIA_Addon_Garett_EXIT_Condition;
	information		= DIA_Addon_Garett_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Garett_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Garett_PICKPOCKET(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 900;
	condition		= DIA_Addon_Garett_PICKPOCKET_Condition;
	information		= DIA_Addon_Garett_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Garett_PICKPOCKET_Condition()
{
	C_Beklauen(36, 55);
};

func void DIA_Addon_Garett_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET, DIALOG_BACK, DIA_Addon_Garett_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Garett_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Garett_PICKPOCKET_DoIt);
};

func void DIA_Addon_Garett_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};

func void DIA_Addon_Garett_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Garett_PICKPOCKET);
};

// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
instance DIA_Addon_Garett_Anheuern(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 1;
	condition		= DIA_Addon_Garett_Anheuern_Condition;
	information		= DIA_Addon_Garett_Anheuern_Info;
	important		= TRUE;
};

func int DIA_Addon_Garett_Anheuern_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Anheuern_Info()
{
	AI_Output(self, other, "DIA_Addon_Garett_Anheuern_09_00"); //想 都 别 想 让 我 会 加 入 你 的 袭 击 部 队 。
	AI_Output(self, other, "DIA_Addon_Garett_Anheuern_09_01"); //如 果 我 离 开 的 话 ， 你 觉 得 其 它 人 会 做 些 什 么 ， 嗯 ？
	AI_Output(self, other, "DIA_Addon_Garett_Anheuern_09_02"); //等 我 回 来 的 时 候 ， 我 的 小 屋 里 不 会 剩 下 一 个 完 整 的 箱 子 ！
	AI_Output(self, other, "DIA_Addon_Garett_Anheuern_09_03"); //我 只 能 留 在 这 里 ， 保 护 我 们 的 补 给 ！
};

// ************************************************************
// 	 				   Hello
// ************************************************************
instance DIA_Addon_Garett_Hello(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 1;
	condition		= DIA_Addon_Garett_Hello_Condition;
	information		= DIA_Addon_Garett_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Garett_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Garett_Hello_09_00"); //看 看 是 谁 来 了 ？ 一 张 新 面 孔 。 我 希 望 不 是 那 些 该 死 的 强 盗 的 人 ！
	AI_Output(self, other, "DIA_Addon_Garett_Hello_09_01"); //我 是 加 略 特 。 如 果 你 需 要 什 么 东 西 的 话 ， 先 来 问 我 。
	AI_Output(self, other, "DIA_Addon_Garett_Hello_09_02"); //我 可 以 给 你 弄 到 几 乎 所 有 的 东 西 。 葡 萄 酒 、 武 器 还 有 其 它 你 也 许 需 要 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Garett_Hello_09_03"); //除 了 烈 性 酒 - 如 果 你 想 要 点 象 样 的 酒 ， 去 找 塞 缪 尔 。

	Log_CreateTopic(Topic_Addon_PIR_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader, Log_Text_Addon_GarettTrade);
};

// ************************************************************
// 	 				  		Samuel
// ************************************************************
instance DIA_Addon_Garett_Samuel(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 2;
	condition		= DIA_Addon_Garett_Samuel_Condition;
	information		= DIA_Addon_Garett_Samuel_Info;
	description		= "谁 是 塞 缪 尔 ？";
};

func int DIA_Addon_Garett_Samuel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Garett_Hello))
	&& (Samuel.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Samuel_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Samuel_15_00"); //谁 是 塞 缪 尔 ？
	AI_Output(self, other, "DIA_Addon_Garett_Samuel_09_01"); //他 是 我 们 的 酿 酒 商 。 他 的 山 洞 在 海 滩 上 ， 离 营 地 有 一 段 距 离 。
	AI_Output(self, other, "DIA_Addon_Garett_Samuel_09_02"); //一 直 向 北 ， 你 不 会 走 错 的 。
	AI_Output(self, other, "DIA_Addon_Garett_Samuel_09_03"); //建 议 你 最 好 随 时 补 充 烈 酒 。
	AI_Output(self, other, "DIA_Addon_Garett_Samuel_09_04"); //这 里 的 一 些 小 子 非 常 不 喜 欢 新 水 手 ， 如 果 你 能 理 解 我 的 意 思 的 话 ？
	AI_Output(self, other, "DIA_Addon_Garett_Samuel_09_05"); //痛 饮 美 妙 的 烈 酒 会 让 你 感 受 到 奇 迹 ！

	B_LogEntry(Topic_Addon_PIR_Trader, Log_Text_Addon_SamuelTrade);
};

// ************************************************************
// 	 				   		Waren
// ************************************************************
instance DIA_Addon_Garett_Warez(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 3;
	condition		= DIA_Addon_Garett_Warez_Condition;
	information		= DIA_Addon_Garett_Warez_Info;
	description		= "你 从 哪 里 弄 到 的 补 给 ？";
};

func int DIA_Addon_Garett_Warez_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Warez_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Warez_15_00"); //你 从 哪 里 弄 到 的 补 给 ？
	AI_Output(self, other, "DIA_Addon_Garett_Warez_09_01"); //当 斯 奇 普 去 过 克 霍 里 尼 斯 之 后 ， 总 是 从 那 里 带 来 大 批 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Garett_Warez_09_02"); //直 到 最 近 ， 他 通 常 把 一 些 东 西 直 接 卖 给 强 盗 。
	AI_Output(self, other, "DIA_Addon_Garett_Warez_09_03"); //不 过 因 为 我 们 已 经 和 强 盗 开 战 了 ， 我 现 在 已 经 弄 不 到 那 些 东 西 了 。
};

// ************************************************************
// 	 				   		Banditen
// ************************************************************
instance DIA_Addon_Garett_Bandits(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 3;
	condition		= DIA_Addon_Garett_Bandits_Condition;
	information		= DIA_Addon_Garett_Bandits_Info;
	description		= "关 于 强 盗 你 知 道 些 什 么 ？";
};

func int DIA_Addon_Garett_Bandits_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Garett_Warez))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Bandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Bandits_15_00"); //关 于 强 盗 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Garett_Bandits_09_01"); //你 最 好 向 斯 奇 普 询 问 那 些 。
	AI_Output(self, other, "DIA_Addon_Garett_Bandits_09_02"); //让 我 告 诉 你 的 话 ， 他 和 那 些 家 伙 的 关 系 已 经 结 束 了 。
	AI_Output(self, other, "DIA_Addon_Garett_Bandits_09_03"); //格 雷 格 已 经 下 达 命 令 ， 杀 死 任 何 在 营 地 附 近 出 现 的 强 盗 。
};

// ************************************************************
// *** ***
// 						Greg + Kompass
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 	 				  		Greg
// ------------------------------------------------------------
instance DIA_Addon_Garett_Greg(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 4;
	condition		= DIA_Addon_Garett_Greg_Condition;
	information		= DIA_Addon_Garett_Greg_Info;
	description		= "你 的 首 领 格 雷 格 。 他 什 么 样 子 ？";
};

func int DIA_Addon_Garett_Greg_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_Greg_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Greg_15_00"); //你 的 首 领 格 雷 格 。 他 什 么 样 子 ？
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_01"); //他 是 一 个 糟 糕 的 老 混 蛋 ， 毫 无 疑 问 。
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_02"); //贪 婪 到 骨 子 里 了 。
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_03"); //他 告 诉 弗 朗 西 斯 ， 我 们 的 会 计 ， 绝 不 为 每 样 东 西 多 付 一 分 钱 ， 以 防 止 暴 动 ！
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_04"); //而 如 果 我 们 有 谁 弄 到 了 真 正 值 钱 的 东 西 ， 他 必 然 会 把 它 据 为 己 有 。
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_05"); //我 曾 经 从 皇 家 军 舰 上 弄 到 一 个 罗 盘 。
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_06"); //当 然 了 ， 那 个 混 蛋 格 雷 格 让 我 把 它 交 出 来 。
	AI_Output(self, other, "DIA_Addon_Garett_Greg_09_07"); //呸 。 他 可 能 把 它 埋 在 什 么 地 方 了 ， 就 像 他 的 其 它 财 宝 一 样 。
};

// ------------------------------------------------------------
// 	 				  		Wo Kompass
// ------------------------------------------------------------
instance DIA_Addon_Garett_Tips(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 5;
	condition		= DIA_Addon_Garett_Tips_Condition;
	information		= DIA_Addon_Garett_Tips_Info;
	description		= "格 雷 格 可 能 会 把 那 个 罗 盘 埋 在 哪 里 ？";
};

func int DIA_Addon_Garett_Tips_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Tips_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Tips_15_00"); //格 雷 格 可 能 会 把 那 个 罗 盘 埋 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Garett_Tips_09_01"); //格 雷 格 曾 经 对 我 说 ， 是 死 神 在 看 管 我 的 罗 盘 。 然 后 他 就 大 笑 起 来 。
	AI_Output(other, self, "DIA_Addon_Garett_Tips_15_02"); //还 有 吗 ？
	AI_Output(self, other, "DIA_Addon_Garett_Tips_09_03"); //南 边 的 海 岸 上 一 个 沙 滩 。 只 能 从 海 上 过 去 。
	AI_Output(self, other, "DIA_Addon_Garett_Tips_09_04"); //据 说 格 雷 格 常 常 去 那 里 。 也 许 你 能 在 那 里 找 到 一 些 东 西 。
	AI_Output(self, other, "DIA_Addon_Garett_Tips_09_05"); //我 曾 经 去 过 那 里 ， 想 看 看 我 自 己 是 否 能 找 到 什 么 ， 不 过 那 个 地 区 布 满 了 怪 物 。
	AI_Output(self, other, "DIA_Addon_Garett_Tips_09_06"); //如 果 你 真 的 想 要 去 试 试 的 话 ， 不 要 忘 记 带 上 一 把 十 字 镐 。
	MIS_Addon_Garett_BringKompass = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_Kompass, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kompass, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Kompass, TOPIC_Addon_Kompass_1);
};

// ------------------------------------------------------------
// 	 						Bring Kompass
// ------------------------------------------------------------
instance DIA_Addon_Garett_GiveKompass(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 6;
	condition		= DIA_Addon_Garett_GiveKompass_Condition;
	information		= DIA_Addon_Garett_GiveKompass_Info;
	description		= "这 是 你 的 罗 盘 。";
};

func int DIA_Addon_Garett_GiveKompass_Condition()
{
	if ((Npc_HasItems(other, ItMI_Addon_Kompass_Mis) >= 1)
	&& (MIS_Addon_Garett_BringKompass == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_GiveKompass_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_GiveKompass_15_00"); //这 是 你 的 罗 盘 。

	// Patch m.f. - weil Händler
	if (B_GiveInvItems(other, self, ItMI_Addon_Kompass_Mis, 1))
	{
		Npc_RemoveInvItems(self, ItMI_Addon_Kompass_Mis, 1);
	};

	AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_01"); //（ 快 乐 的 ） 是 ， 就 是 它 。 我 从 来 没 想 过 还 能 再 见 到 它 。
	AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_02"); //谢 谢 ， 老 兄 ！

	if (Npc_HasItems(self, ItBE_Addon_Prot_EdgPoi) > 0)
	{
		AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_03"); //这 次 不 会 再 让 格 雷 格 占 有 它 了 … …
		AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_04"); //给 ， 拿 上 这 条 腰 带 作 为 酬 劳 。 它 是 我 最 珍 贵 的 一 条 。
		B_GiveInvItems(self, other, ItBE_Addon_Prot_EdgPoi, 1);
	}
	else if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_05"); //你 从 我 这 里 买 走 的 这 条 腰 带 ， 记 得 吗 ？
		AI_Output(self, other, "DIA_Addon_Garett_GiveKompass_09_06"); //而 你 为 它 付 了 一 大 笔 钱 - （ 匆 忙 的 ） 倒 不 是 它 不 值 。 给 - 把 你 的 钱 拿 回 去 。
		B_GiveInvItems(self, other, itmi_gold, Value_ItBE_Addon_Prot_EdgPoi);
	};

	B_LogEntry(TOPIC_Addon_Kompass, TOPIC_Addon_Kompass_2);
	MIS_Addon_Garett_BringKompass = LOG_SUCCESS;
	B_GivePlayerXP(XP_ADDON_Garett_Bring_Kompass);
};

// ************************************************************
// 	 				  			Francis
// ************************************************************
instance DIA_Addon_Garett_Francis(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 7;
	condition		= DIA_Addon_Garett_Francis_Condition;
	information		= DIA_Addon_Garett_Francis_Info;
	description		= "关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_Addon_Garett_Francis_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Garett_Greg))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_Francis_15_00"); //关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Garett_Francis_09_01"); //格 雷 格 在 离 开 的 时 候 ， 让 他 负 责 指 挥 。
	AI_Output(self, other, "DIA_Addon_Garett_Francis_09_02"); //但 是 弗 朗 西 斯 是 个 彻 底 失 败 的 领 导 者 ！
	AI_Output(self, other, "DIA_Addon_Garett_Francis_09_03"); //他 甚 至 不 能 让 摩 根 的 屁 股 从 床 上 离 开 。
	AI_Output(self, other, "DIA_Addon_Garett_Francis_09_04"); //亨 利 和 他 的 人 是 这 里 唯 一 做 事 的 。
	AI_Output(self, other, "DIA_Addon_Garett_Francis_09_05"); //其 它 的 人 都 在 找 乐 子 而 不 是 工 作 。
	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Garett_Francis_09_06"); //我 只 能 希 望 格 雷 格 快 点 回 来 。
		AI_Output(self, other, "DIA_Addon_Garett_Francis_09_07"); //他 会 把 他 们 都 教 训 一 顿 的 。
	};
};

// ************************************************************
// 								PERM
// ************************************************************
instance DIA_Addon_Garett_PERM(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 99;
	condition		= DIA_Addon_Garett_PERM_Condition;
	information		= DIA_Addon_Garett_PERM_Info;
	permanent		= TRUE;
	description		= "还 有 什 么 新 消 息 吗 ？";
};

func int DIA_Addon_Garett_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Garett_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Garett_PERM_15_00"); //还 有 什 么 新 消 息 吗 ？

	if ((GregIsBack == FALSE)
	|| (Npc_IsDead(Greg)))
	{
		AI_Output(self, other, "DIA_Addon_Garett_PERM_09_02"); //自 从 格 雷 格 离 开 之 后 ， 没 有 再 发 生 什 么 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Garett_PERM_09_01"); //自 从 格 雷 格 回 来 以 后 ， 这 里 的 事 情 就 有 些 好 转 了 。
	};
};

// ************************************************************
// 								Trade
// ************************************************************
instance DIA_Addon_Garett_Trade(C_INFO)
{
	npc				= PIR_1357_Addon_Garett;
	nr				= 888;
	condition		= DIA_Addon_Garett_Trade_Condition;
	information		= DIA_Addon_Garett_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Garett_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Garett_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Garett_Trade_Info()
{
	var int Garett_Random; Garett_Random = Hlp_Random(3);
	if (Garett_Random == 0)
	{
		B_Say(other, self, "$TRADE_1");
	}
	else if (Garett_Random == 1)
	{
		B_Say(other, self, "$TRADE_2");
	}
	else
	{
		B_Say(other, self, "$TRADE_3");
	};

	B_GiveTradeInv(self);

	Npc_RemoveInvItems(self, ItRw_Bolt, Npc_HasItems(self, ItRw_Bolt));
	var int McBolzenAmount;
	McBolzenAmount = (Kapitel * 25);
	CreateInvItems(self, ItRw_Bolt, McBolzenAmount);

	Npc_RemoveInvItems(self, ItRw_Arrow, Npc_HasItems(self, ItRw_Arrow));
	var int McArrowAmount;
	McArrowAmount = (Kapitel * 25);
	CreateInvItems(self, ItRw_Arrow, McArrowAmount);
};
