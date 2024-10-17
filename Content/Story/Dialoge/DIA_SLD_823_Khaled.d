// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Khaled_EXIT(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 999;
	condition		= DIA_Khaled_EXIT_Condition;
	information		= DIA_Khaled_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Khaled_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Khaled_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
var int Khaled_weiter;
instance DIA_Khaled_Hallo(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 1;
	condition		= DIA_Khaled_Hallo_Condition;
	information		= DIA_Khaled_Hallo_Info;
	permanent		= TRUE;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_Khaled_Hallo_Condition()
{
	if (Khaled_weiter == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Hallo_Info()
{
	AI_Output(other, self, "DIA_Khaled_Hallo_15_00"); //你 还 好 吧 ？
	if (Npc_KnowsInfo(other, DIA_Lee_WannaJoin))
	{
		AI_Output(self, other, "DIA_Khaled_Hallo_11_01"); //那 么 - 你 想 加 入 我 们 ， 是 吗 ？ 你 有 没 有 一 把 像 样 的 武 器 ？
		Khaled_weiter = TRUE;
		Log_CreateTopic(Topic_SoldierTrader, LOG_NOTE);
		B_LogEntry(Topic_SoldierTrader, Topic_SoldierTrader_3);
	}
	else
	{
		AI_Output(self, other, "DIA_Khaled_Hallo_11_02"); //如 果 有 什 么 重 要 的 事 ， 去 跟 李 谈 谈 。 否 则 就 走 开 点 。
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  				TRADE
// ************************************************************
instance DIA_Khaled_TRADE(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 700;
	condition		= DIA_Khaled_TRADE_Condition;
	information		= DIA_Khaled_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 都 提 供 什 么 武 器 ？";
};

func int DIA_Khaled_TRADE_Condition()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_TRADE_Info()
{
	AI_Output(other, self, "DIA_Khaled_TRADE_15_00"); //你 都 提 供 什 么 武 器 ？
	B_GiveTradeInv(self);
	AI_Output(self, other, "DIA_Khaled_TRADE_11_01"); //只 有 最 好 的 。 来 看 一 下 。
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Khaled_WannaJoin(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 10;
	condition		= DIA_Khaled_WannaJoin_Condition;
	information		= DIA_Khaled_WannaJoin_Info;
	permanent		= TRUE;
	description		= "如 果 我 加 入 你 的 话 ， 你 会 在 意 吗 ？";
};

func int DIA_Khaled_WannaJoin_Condition()
{
	if ((Khaled_weiter == TRUE)
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Khaled_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Khaled_WannaJoin_15_00"); //如 果 我 加 入 你 的 话 ， 你 会 在 意 吗 ？
	AI_Output(self, other, "DIA_Khaled_WannaJoin_11_01"); //只 要 你 通 过 了 测 试 ， 我 就 会 为 你 投 票 。
	if ((MIS_Torlof_HolPachtVonSekob == LOG_SUCCESS)
	|| (MIS_Torlof_BengarMilizKlatschen == LOG_SUCCESS))
	{
		AI_Output(other, self, "DIA_Khaled_WannaJoin_15_02"); //我 已 经 通 过 了 。
		AI_Output(self, other, "DIA_Khaled_WannaJoin_11_03"); //好 吧 ， 那 就 行 了 。
	};
};

// ************************************************************
// 			  				Woher
// ************************************************************
instance DIA_Khaled_Woher(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 3;
	condition		= DIA_Khaled_Woher_Condition;
	information		= DIA_Khaled_Woher_Info;
	description		= "你 怎 么 最 后 会 选 择 了 雇 佣 兵 ？";
};

func int DIA_Khaled_Woher_Condition()
{
	if (Khaled_weiter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Khaled_Woher_Info()
{
	AI_Output(other, self, "DIA_Khaled_Woher_15_00"); //你 怎 么 最 后 会 选 择 了 雇 佣 兵 ？
	AI_Output(self, other, "DIA_Khaled_Woher_11_01"); //我 跟 席 尔 维 欧 从 南 部 来 。 我 们 隶 属 于 一 支 跟 兽 人 作 战 的 雇 佣 兵 部 队 。
};

// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Khaled_AboutSylvio(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 4;
	condition		= DIA_Khaled_AboutSylvio_Condition;
	information		= DIA_Khaled_AboutSylvio_Info;
	description		= "你 对 席 尔 维 欧 的 意 见 呢 ？";
};

func int DIA_Khaled_AboutSylvio_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutSylvio_Info()
{
	AI_Output(other, self, "DIA_Khaled_AboutSylvio_15_00"); //你 对 席 尔 维 欧 的 意 见 呢 ？
	AI_Output(self, other, "DIA_Khaled_AboutSylvio_11_01"); //他 是 一 个 危 险 的 家 伙 ！ 很 多 一 直 跟 随 他 而 来 的 雇 佣 兵 都 对 他 唯 命 是 从 。 最 好 别 跟 他 打 。
};

// ************************************************************
// 			  				AboutLee
// ************************************************************
instance DIA_Khaled_AboutLee(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 5;
	condition		= DIA_Khaled_AboutLee_Condition;
	information		= DIA_Khaled_AboutLee_Info;
	description		= "你 对 李 有 什 么 看 法 ？";
};

func int DIA_Khaled_AboutLee_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Khaled_Woher))
	{
		return TRUE;
	};
};

func void DIA_Khaled_AboutLee_Info()
{
	AI_Output(other, self, "DIA_Khaled_AboutLee_15_00"); //你 对 李 有 什 么 看 法 ？
	AI_Output(self, other, "DIA_Khaled_AboutLee_11_01"); //我 认 为 李 唯 一 感 兴 趣 的 事 情 就 是 离 开 这 个 岛 。
	AI_Output(self, other, "DIA_Khaled_AboutLee_11_02"); //他 想 去 大 陆 。 好 像 是 有 什 么 事 情 要 跟 那 里 的 某 个 人 解 决 … …
	AI_Output(self, other, "DIA_Khaled_AboutLee_11_03"); //无 论 如 何 ， 他 做 的 事 情 比 席 尔 维 欧 要 好 得 多 。
	AI_Output(self, other, "DIA_Khaled_AboutLee_11_04"); //还 有 ， 他 是 一 个 不 错 的 首 领 。 大 部 分 时 候 我 们 在 这 里 能 做 自 己 想 做 的 事 情 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Khaled_PICKPOCKET(C_INFO)
{
	npc				= SLD_823_Khaled;
	nr				= 900;
	condition		= DIA_Khaled_PICKPOCKET_Condition;
	information		= DIA_Khaled_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Khaled_PICKPOCKET_Condition()
{
	C_Beklauen(78, 85);
};

func void DIA_Khaled_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
	Info_AddChoice(DIA_Khaled_PICKPOCKET, DIALOG_BACK, DIA_Khaled_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Khaled_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Khaled_PICKPOCKET_DoIt);
};

func void DIA_Khaled_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};

func void DIA_Khaled_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Khaled_PICKPOCKET);
};
