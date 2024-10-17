///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_EXIT(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 999;
	condition		= DIA_Tandor_EXIT_Condition;
	information		= DIA_Tandor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tandor_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Hallo(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 2;
	condition		= DIA_Tandor_Hallo_Condition;
	information		= DIA_Tandor_Hallo_Info;
	important		= TRUE;
};

func int DIA_Tandor_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Hallo_Info()
{
	AI_Output(self, other, "DIA_Tandor_Hallo_08_00"); //你 从 关 卡 来 ？ 干 得 漂 亮 。 我 们 已 经 在 那 里 损 失 了 一 大 批 人 。
	AI_Output(self, other, "DIA_Tandor_Hallo_08_01"); //我 很 清 楚 那 里 是 什 么 样 的 - 我 陪 着 一 个 侦 察 兵 呆 过 一 阵 儿 。
	AI_Output(self, other, "DIA_Tandor_Hallo_08_02"); //你 有 武 器 吗 ？ 如 果 你 需 要 一 件 象 样 的 武 器 ， 我 可 以 帮 你 。

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Spähtrupp
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trupp(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 2;
	condition		= DIA_Tandor_Trupp_Condition;
	information		= DIA_Tandor_Trupp_Info;
	description		= "部 队 遇 到 了 什 么 ？";
};

func int DIA_Tandor_Trupp_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Trupp_Info()
{
	AI_Output(other, self, "DIA_Tandor_Trupp_15_00"); //部 队 遇 到 了 什 么 ？
	AI_Output(self, other, "DIA_Tandor_Trupp_08_01"); //我 们 侦 察 了 这 个 区 域 ， 并 希 望 进 发 到 海 岸 边 。 我 们 把 营 地 设 在 一 个 洞 穴 里 面 。
	AI_Output(self, other, "DIA_Tandor_Trupp_08_02"); //兽 人 来 的 时 候 夜 已 经 很 深 了 。 它 们 拿 着 火 把 ， 敲 着 鼓 从 山 坡 上 冲 过 来 - 然 后 发 现 了 我 们 。
	AI_Output(self, other, "DIA_Tandor_Trupp_08_03"); //我 们 想 跑 ， 但 我 是 唯 一 跑 出 来 的 人 … …
	AI_Output(self, other, "DIA_Tandor_Trupp_08_04"); //接 下 来 ， 很 快 兽 人 把 它 们 的 大 栅 栏 竖 了 起 来 ， 我 们 只 好 撤 退 到 了 城 堡 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Trade(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 900;
	condition		= DIA_Tandor_Trade_Condition;
	information		= DIA_Tandor_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Tandor_Trade_Condition()
{
	return TRUE;
};

func void DIA_Tandor_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Tandor_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info DIA_Tandor_Equipment
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_Equipment(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 3;
	condition		= DIA_Tandor_Equipment_Condition;
	information		= DIA_Tandor_Equipment_Info;
	description		= "加 隆 德 派 我 来 的 - 我 需 要 一 些 工 具 。";
};

func int DIA_Tandor_Equipment_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Garond_Equipment)
	&& (other.guild == GIL_MIL)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Equipment_Info()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_15_00"); //加 隆 德 派 我 来 的 - 我 需 要 一 些 工 具 。
	AI_Output(self, other, "DIA_Tandor_Equipment_08_01"); //近 身 还 是 远 距 离 战 斗 ？

	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment, "近 战", DIA_Tandor_Equipment_Nah);
	Info_AddChoice(DIA_Tandor_Equipment, "远 程 战 斗", DIA_Tandor_Equipment_Fern);
};

func void DIA_Tandor_Equipment_Nah()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Nah_15_00"); //近 战 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Nah_08_01"); //单 手 还 是 双 手 战 士 ？

	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment, "单 手", DIA_Tandor_Equipment_Ein);
	Info_AddChoice(DIA_Tandor_Equipment, "双 手", DIA_Tandor_Equipment_Zwei);
};

func void DIA_Tandor_Equipment_Fern()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Fern_15_00"); //远 程 战 斗 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Fern_08_01"); //弓 还 是 弩 ？

	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment, "弓", DIA_Tandor_Equipment_Bow);
	Info_AddChoice(DIA_Tandor_Equipment, "弩", DIA_Tandor_Equipment_Crossbow);
};

func void DIA_Tandor_Equipment_Ein()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Ein_15_00"); //单 手 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Ein_08_01"); //那 就 带 上 这 个 碎 石 器 吧 。 一 个 不 错 的 武 器 。
	B_GiveInvItems(self, other, ItMw_Steinbrecher, 1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Zwei()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Zwei_15_00"); //双 手 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Zwei_08_01"); //有 了 这 把 双 手 巨 剑 你 就 把 自 己 很 好 地 武 装 起 来 了 。
	B_GiveInvItems(self, other, ItMw_Zweihaender1, 1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Bow()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Bow_15_00"); //弓 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Bow_08_01"); //这 把 猎 弓 正 好 适 合 你 。 我 还 会 给 你 一 些 箭 。
	B_GiveInvItems(self, other, ItRw_Bow_L_03, 1);
	B_GiveInvItems(self, other, ItRw_Arrow, 50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Crossbow()
{
	AI_Output(other, self, "DIA_Tandor_Equipment_Crossbow_15_00"); //弩 。
	AI_Output(self, other, "DIA_Tandor_Equipment_Crossbow_08_01"); //那 就 带 上 这 把 轻 型 弩 吧 。 你 还 可 以 在 我 这 里 拿 到 弩 箭 。
	B_GiveInvItems(self, other, ItRw_Crossbow_L_02, 1);
	B_GiveInvItems(self, other, ItRw_Bolt, 50);
	Info_ClearChoices(DIA_Tandor_Equipment);
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
instance DIA_Tandor_KAP3_EXIT(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 999;
	condition		= DIA_Tandor_KAP3_EXIT_Condition;
	information		= DIA_Tandor_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tandor_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Tandor_KAP4_EXIT(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 999;
	condition		= DIA_Tandor_KAP4_EXIT_Condition;
	information		= DIA_Tandor_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tandor_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_News(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 40;
	condition		= DIA_Tandor_News_Condition;
	information		= DIA_Tandor_News_Info;
	permanent		= TRUE;
	description		= "你 有 什 么 新 消 息 吗 ？";
};

func int DIA_Tandor_News_Condition()
{
	if ((Kapitel == 4)
	&& (Npc_KnowsInfo(hero, DIA_Tandor_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info()
{
	AI_Output(other, self, "DIA_Tandor_News_15_00"); //你 有 什 么 新 消 息 吗 ？

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Tandor_News_08_01"); //最 近 这 里 发 生 的 唯 一 的 事 情 就 是 你 们 龙 猎 手 到 这 里 来 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Tandor_News_08_02"); //龙 猎 手 已 经 到 了 。
		AI_Output(self, other, "DIA_Tandor_News_08_03"); //他 们 拼 死 抵 抗 ， 不 过 ， 我 觉 得 这 样 也 好 ， 否 则 ， 他 们 早 就 没 命 了 。
	};
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
instance DIA_Tandor_KAP5_EXIT(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 999;
	condition		= DIA_Tandor_KAP5_EXIT_Condition;
	information		= DIA_Tandor_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tandor_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Tandor_WASISTLOS(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 51;
	condition		= DIA_Tandor_WASISTLOS_Condition;
	information		= DIA_Tandor_WASISTLOS_Info;
	permanent		= TRUE;
	description		= "你 的 脸 不 是 一 幅 高 兴 的 样 子 。";
};

func int DIA_Tandor_WASISTLOS_Condition()
{
	if ((Kapitel == 5)
	&& (Npc_KnowsInfo(hero, DIA_Tandor_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info()
{
	AI_Output(other, self, "DIA_Tandor_WASISTLOS_15_00"); //你 的 脸 不 是 一 幅 高 兴 的 样 子 。

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Tandor_WASISTLOS_08_01"); //兽 人 还 会 接 踵 而 来 。 直 到 我 们 都 死 掉 。
	}
	else
	{
		AI_Output(self, other, "DIA_Tandor_WASISTLOS_08_02"); //几 个 星 期 来 都 没 有 足 够 的 食 物 了 。 我 快 要 饿 死 了 。
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
instance DIA_Tandor_KAP6_EXIT(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 999;
	condition		= DIA_Tandor_KAP6_EXIT_Condition;
	information		= DIA_Tandor_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Tandor_PICKPOCKET(C_INFO)
{
	npc				= PAL_260_Tandor;
	nr				= 900;
	condition		= DIA_Tandor_PICKPOCKET_Condition;
	information		= DIA_Tandor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Tandor_PICKPOCKET_Condition()
{
	C_Beklauen(47, 90);
};

func void DIA_Tandor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
	Info_AddChoice(DIA_Tandor_PICKPOCKET, DIALOG_BACK, DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};
