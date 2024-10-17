// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lutero_EXIT(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 999;
	condition		= DIA_Lutero_EXIT_Condition;
	information		= DIA_Lutero_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if ((Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};

//************************************************************
//	Hallo
//************************************************************
instance DIA_Lutero_Hallo(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Hallo_Condition;
	information		= DIA_Lutero_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lutero_Hallo_Condition()
{
	if (((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV))
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self, other, "DIA_Lutero_Hallo_13_00"); //我 叫 鲁 特 罗 。 我 买 卖 各 种 物 品 。
	AI_Output(other, self, "DIA_Lutero_Hallo_15_01"); //你 都 提 供 什 么 货 物 ？
	AI_Output(self, other, "DIA_Lutero_Hallo_13_02"); //嗯 ， 尤 其 是 珍 贵 的 以 及 不 寻 常 的 东 西 。 至 今 ， 我 一 直 都 能 设 法 满 足 我 的 客 户 们 的 希 望 。

	Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_19);
};

//************************************************************
//	GetLost
//************************************************************
instance DIA_Lutero_GetLost(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_GetLost_Condition;
	information		= DIA_Lutero_GetLost_Info;
	important		= TRUE;
};

func int DIA_Lutero_GetLost_Condition()
{
	if (((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV))
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lutero_GetLost_13_00"); //滚 开 ， 小 鬼 ！ 你 没 有 任 何 事 可 做 吗 ？ 那 就 去 找 点 事 做 - 但 是 得 去 别 的 地 方 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_GetLost_13_01"); //你 想 干 什 么 ， 新 信 徒 ？ 你 不 是 该 在 修 道 院 里 吗 ？
	};

	AI_StopProcessInfos(self);
};

//************************************************************
//	Snapper
//************************************************************
instance DIA_Lutero_Snapper(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Snapper_Condition;
	information		= DIA_Lutero_Snapper_Info;
	description		= "你 在 找 什 么 特 别 的 东 西 吗 ？";
};

func int DIA_Lutero_Snapper_Condition()
{
	if ((other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other, self, "DIA_Lutero_Snapper_15_00"); //你 在 找 什 么 特 别 的 东 西 吗 ？
	AI_Output(self, other, "DIA_Lutero_Snapper_13_01"); //是 的 ， 我 现 在 的 任 务 需 要 一 些 暴 龙 爪 。
	AI_Output(self, other, "DIA_Lutero_Snapper_13_02"); //不 过 不 是 随 便 哪 些 爪 子 都 行 。 那 必 须 是 一 些 很 特 殊 的 东 西 - 一 个 杀 过 很 多 人 的 凶 猛 的 野 兽 的 爪 子 ， 或 者 类 似 的 东 西 。
	AI_Output(other, self, "DIA_Lutero_Snapper_15_03"); //我 到 哪 里 能 找 到 暴 龙 ？
	AI_Output(self, other, "DIA_Lutero_Snapper_13_04"); //这 座 岛 上 就 有 几 只 ， 但 它 们 大 部 分 都 栖 息 在 矿 藏 山 谷 那 里 。
	AI_Output(other, self, "DIA_Lutero_Snapper_15_05"); //那 对 我 有 什 么 好 处 ？

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_06"); //我 可 以 给 你 一 块 咒 语 石 。
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_07"); //我 可 以 帮 你 弄 到 一 个 无 敌 戒 指 。
	};

	AI_Output(other, self, "DIA_Lutero_Hello_15_08"); //我 要 看 看 我 能 做 什 么 。

	Log_CreateTopic(Topic_Lutero, LOG_MISSION);
	Log_SetTopicStatus(Topic_Lutero, LOG_RUNNING);
	B_LogEntry(Topic_Lutero, Topic_Lutero_1);

	Lutero_Krallen = LOG_RUNNING;
};

//************************************************************
//	Kralle abliefern
//************************************************************
instance DIA_Lutero_Kralle(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Kralle_Condition;
	information		= DIA_Lutero_Kralle_Info;
	description		= "我 给 你 找 到 了 一 些 特 殊 的 暴 龙 爪 子 。 ";
};

func int DIA_Lutero_Kralle_Condition()
{
	if ((Npc_HasItems(other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo(other, DIA_Lutero_Snapper)))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other, self, "DIA_Lutero_Kralle_15_00"); //我 给 你 找 到 了 一 些 特 殊 的 暴 龙 爪 子 。
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self, other, "DIA_Lutero_Kralle_13_01"); //我 的 客 户 会 很 高 兴 听 到 这 些 的 。
	B_GiveInvItems(other, self, ItAt_ClawLeader, 1);

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_02"); //我 这 里 没 有 咒 语 石 。 不 过 ， 我 知 道 去 哪 里 能 找 到 它 。
		AI_Output(self, other, "DIA_Lutero_Hello_13_03"); //从 城 里 往 客 栈 的 路 上 ， 你 会 从 一 座 桥 底 下 经 过 。
		AI_Output(self, other, "DIA_Lutero_Hello_13_04"); //在 一 个 洞 穴 里 面 ， 我 的 一 个 朋 友 把 一 块 咒 语 石 存 放 在 一 个 箱 子 里 。 这 是 钥 匙 。
		B_GiveInvItems(self, other, ITKE_RUNE_MIS, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_05"); //这 是 我 许 诺 给 你 的 戒 指 。
		B_GiveInvItems(self, other, ItRi_Prot_Total_01, 1);
	};
};

//************************************************************
//	Trade
//************************************************************
instance DIA_Lutero_Trade(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Trade_Condition;
	information		= DIA_Lutero_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Lutero_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Lutero_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lutero_PICKPOCKET(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 900;
	condition		= DIA_Lutero_PICKPOCKET_Condition;
	information		= DIA_Lutero_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen(58, 65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET, DIALOG_BACK, DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};
