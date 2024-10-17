///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_EXIT(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 999;
	condition		= DIA_Babera_EXIT_Condition;
	information		= DIA_Babera_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Babera_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Babera_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_HALLO(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 1;
	condition		= DIA_Babera_HALLO_Condition;
	information		= DIA_Babera_HALLO_Info;
	description		= "你 好 ， 美 丽 的 少 女 。";
};

func int DIA_Babera_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Babera_HALLO_Info()
{
	AI_Output(other, self, "DIA_Babera_HALLO_15_00"); //你 好 ， 美 丽 的 少 女 。
	AI_Output(self, other, "DIA_Babera_HALLO_16_01"); //不 要 再 向 我 花 言 巧 语 了 ， 小 子 。 告 诉 我 你 想 要 什 么 。 我 很 忙 。
};

///////////////////////////////////////////////////////////////////////
//	Info Wiesiehtsaus
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_WIESIEHTSAUS(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 2;
	condition		= DIA_Babera_WIESIEHTSAUS_Condition;
	information		= DIA_Babera_WIESIEHTSAUS_Info;
	description		= "农 场 的 工 作 进 行 的 怎 么 样 ？";
};

func int DIA_Babera_WIESIEHTSAUS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Babera_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Babera_WIESIEHTSAUS_Info()
{
	AI_Output(other, self, "DIA_Babera_WIESIEHTSAUS_15_00"); //农 场 的 工 作 进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_16_01"); //看 看 这 些 我 们 必 须 在 广 阔 田 地 上 面 劳 作 ， 你 知 道 它 是 怎 么 来 的 。
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_16_02"); //你 在 找 农 场 工 作 吗 ？

	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);

	if (hero.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS, "不 。 实 际 上 ， 我 想 要 加 入 雇 佣 兵 。", DIA_Babera_WIESIEHTSAUS_Nein);
		Info_AddChoice(DIA_Babera_WIESIEHTSAUS, "也 许 。", DIA_Babera_WIESIEHTSAUS_Vielleicht);
	};
};

func void DIA_Babera_WIESIEHTSAUS_Vielleicht()
{
	AI_Output(other, self, "DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00"); //也 许 。
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01"); //那 样 的 话 ， 你 应 该 去 找 我 们 的 农 场 主 塞 柯 布 ， 那 个 老 监 工 。 也 许 他 有 工 作 给 你 。
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02"); //当 然 ， 你 也 可 以 去 长 路 尽 头 欧 纳 尔 的 农 场 试 试 。
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03"); //但 是 要 小 心 雇 佣 兵 。 他 们 不 喜 欢 陌 生 人 。

	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

func void DIA_Babera_WIESIEHTSAUS_Nein()
{
	AI_Output(other, self, "DIA_Babera_WIESIEHTSAUS_Nein_15_00"); //不 。 实 际 上 ， 我 想 要 加 入 雇 佣 兵 。
	AI_Output(self, other, "DIA_Babera_WIESIEHTSAUS_Nein_16_01"); //那 你 来 错 地 方 了 。 你 通 常 可 以 在 地 主 的 农 场 里 找 到 雇 佣 兵 。

	Info_ClearChoices(DIA_Babera_WIESIEHTSAUS);
};

///////////////////////////////////////////////////////////////////////
//	Info bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_BRONKO(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 3;
	condition		= DIA_Babera_BRONKO_Condition;
	information		= DIA_Babera_BRONKO_Info;
	description		= "（ 询 问 有 关 布 隆 科 的 事 ）";
};

func int DIA_Babera_BRONKO_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Bronko_Hallo))
	&& (Npc_KnowsInfo(other, DIA_Babera_WIESIEHTSAUS))
	)
	{
		return TRUE;
	};
};

func void DIA_Babera_BRONKO_Info()
{
	AI_Output(other, self, "DIA_Babera_BRONKO_15_00"); //嗯 ， 那 边 那 个 讨 厌 的 家 伙 … …
	AI_Output(self, other, "DIA_Babera_BRONKO_16_01"); //那 是 布 隆 科 。 他 怎 么 了 ？
	AI_Output(other, self, "DIA_Babera_BRONKO_15_02"); //那 是 你 们 的 农 场 主 吗 ？
	AI_Output(self, other, "DIA_Babera_BRONKO_16_03"); //（ 大 笑 ） 他 是 那 么 告 诉 你 的 吗 ？ 塞 柯 布 是 我 们 的 农 场 主 ， 布 隆 科 只 是 一 个 懒 汉 和 废 物 。 但 是 强 壮 如 牛 。
	AI_Output(self, other, "DIA_Babera_BRONKO_16_04"); //所 以 他 什 么 工 作 都 不 做 ， 也 没 人 说 什 么 。

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Babera_BRONKO_16_05"); //他 除 了 你 们 雇 佣 兵 谁 都 不 怕 。
	}
	else
	{
		AI_Output(self, other, "DIA_Babera_BRONKO_16_06"); //唯 一 可 以 让 他 回 去 工 作 的 人 就 是 雇 佣 兵 。 他 害 怕 他 们 。
	};

	Babera_BronkoKeinBauer = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Rosi
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_Rosi(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 3;
	condition		= DIA_Babera_Rosi_Condition;
	information		= DIA_Babera_Rosi_Info;
	description		= "罗 希 在 哪 里 ？";
};

func int DIA_Babera_Rosi_Condition()
{
	if ((MIS_bringRosiBackToSekob == LOG_RUNNING)
	&& (Kapitel >= 5)
	&& (RosiFoundKap5 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Babera_Rosi_Info()
{
	AI_Output(other, self, "DIA_Babera_Rosi_15_00"); //罗 希 在 哪 里 ？
	AI_Output(self, other, "DIA_Babera_Rosi_16_01"); //她 无 法 再 忍 受 这 里 ， 向 北 走 了 ， 进 了 树 林 。
	B_LogEntry(TOPIC_RosisFlucht, TOPIC_RosisFlucht_1);
	Log_AddEntry(TOPIC_bringRosiBackToSekob, TOPIC_bringRosiBackToSekob_2);
};

///////////////////////////////////////////////////////////////////////
//	Info dustoerst
///////////////////////////////////////////////////////////////////////
instance DIA_Babera_DUSTOERST(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 10;
	condition		= DIA_Babera_DUSTOERST_Condition;
	information		= DIA_Babera_DUSTOERST_Info;
	permanent		= TRUE;
	description		= "除 了 那 以 外 呢 ？";
};

func int DIA_Babera_DUSTOERST_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Babera_BRONKO))
	{
		return TRUE;
	};
};

func void DIA_Babera_DUSTOERST_Info()
{
	AI_Output(other, self, "DIA_Babera_DUSTOERST_15_00"); //除 了 那 以 外 呢 ？
	AI_Output(self, other, "DIA_Babera_DUSTOERST_16_01"); //我 很 忙 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Babera_PICKPOCKET(C_INFO)
{
	npc				= BAU_934_Babera;
	nr				= 900;
	condition		= DIA_Babera_PICKPOCKET_Condition;
	information		= DIA_Babera_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20_Female;
};

func int DIA_Babera_PICKPOCKET_Condition()
{
	C_Beklauen(20, 30);
};

func void DIA_Babera_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
	Info_AddChoice(DIA_Babera_PICKPOCKET, DIALOG_BACK, DIA_Babera_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Babera_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Babera_PICKPOCKET_DoIt);
};

func void DIA_Babera_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};

func void DIA_Babera_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Babera_PICKPOCKET);
};
