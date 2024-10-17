///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Isgaroth_EXIT(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 999;
	condition		= DIA_Isgaroth_EXIT_Condition;
	information		= DIA_Isgaroth_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_EXIT_Info()
{
	AI_Output(self, other, "DIA_Isgaroth_EXIT_01_00"); //愿 英 诺 斯 永 远 保 护 你 。
	AI_StopProcessInfos(self);
};

//****************************************************************************
//	Begrüssung
//****************************************************************************
instance DIA_Isgaroth_Hello(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 2;
	condition		= DIA_Isgaroth_Hello_Condition;
	information		= DIA_Isgaroth_Hello_Info;
	important		= TRUE;
};

func int DIA_Isgaroth_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Hello_Info()
{
	AI_Output(self, other, "DIA_Isgaroth_Hello_01_00"); //英 诺 斯 与 你 同 在 。 我 能 帮 你 做 什 么 ， 徘 徊 者 ？
};

//****************************************************************************
//	Segen
//****************************************************************************
instance DIA_Isgaroth_Segen(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 10;
	condition		= DIA_Isgaroth_Segen_Condition;
	information		= DIA_Isgaroth_Segen_Info;
	permanent		= TRUE;
	description		= "祝 福 我 ！";
};

func int DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};

func void DIA_Isgaroth_Segen_Info()
{
	AI_Output(other, self, "DIA_Isgaroth_Segen_15_00"); //祝 福 我 ！
	AI_Output(self, other, "DIA_Isgaroth_Segen_01_01"); //我 以 英 诺 斯 之 名 祝 福 你 。 愿 神 的 火 焰 在 你 心 中 燃 烧 ， 并 赐 予 你 力 量 实 现 他 的 公 正 。

	Isgaroth_Segen = TRUE;
};

//********************************************************************************
//	Sergio schickt mich (Wolf Mission)
//********************************************************************************
instance DIA_Isgaroth_Wolf(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 2;
	condition		= DIA_Isgaroth_Wolf_Condition;
	information		= DIA_Isgaroth_Wolf_Info;
	description		= "瑟 吉 欧 派 我 来 的 … …";
};

func int DIA_Isgaroth_Wolf_Condition()
{
	if ((MIS_KlosterArbeit == LOG_RUNNING)
	&& (Sergio_Sends == TRUE)
	&& (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Wolf_Info()
{
	AI_Output(other, self, "DIA_Isgaroth_Wolf_15_00"); //瑟 吉 欧 派 我 来 的 。 由 我 负 责 完 成 他 的 任 务 。 是 什 么 任 务 ？
	AI_Output(self, other, "DIA_Isgaroth_Wolf_01_01"); //最 近 有 一 头 黑 狼 在 这 个 地 区 活 动 。 找 到 并 杀 死 它 。

	MIS_IsgarothWolf = LOG_RUNNING;
	B_LogEntry(Topic_IsgarothWolf, Topic_IsgarothWolf_2);
};

//********************************************************************************
// Wolf tot
//********************************************************************************
instance DIA_Isgaroth_tot(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 2;
	condition		= DIA_Isgaroth_tot_Condition;
	information		= DIA_Isgaroth_tot_Info;
	permanent		= TRUE;
	description		= "我 已 经 杀 了 黑 狼 。";
};

func int DIA_Isgaroth_tot_Condition()
{
	Wolfi = Hlp_GetNpc(BlackWolf);

	if ((MIS_IsgarothWolf == LOG_RUNNING)
	&& Npc_IsDead(Wolfi))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_tot_Info()
{
	AI_Output(other, self, "DIA_Isgaroth_tot_15_00"); //我 已 经 杀 了 黑 狼 。
	AI_Output(self, other, "DIA_Isgaroth_tot_01_01"); //干 得 好 ， 新 信 徒 。 你 是 一 个 勇 敢 的 人 。 但 是 现 在 回 修 道 院 去 ， 并 继 续 尽 你 的 职 责 。

	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP(XP_IsgarothWolf);
	AI_StopProcessInfos(self);
};

//********************************************************************************
//	Was machst Du hier
//********************************************************************************
instance DIA_Isgaroth_Job(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 4;
	condition		= DIA_Isgaroth_Job_Condition;
	information		= DIA_Isgaroth_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Isgaroth_Job_Condition()
{
	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Job_Info()
{
	AI_Output(other, self, "DIA_Isgaroth_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Isgaroth_Job_01_01"); //我 是 一 名 火 魔 法 师 。 我 们 英 诺 斯 神 的 牧 师 。
	AI_Output(self, other, "DIA_Isgaroth_Job_01_02"); //这 座 神 龛 是 用 来 祭 祀 他 ， 最 高 的 神 ， 火 焰 的 创 造 者 和 公 正 的 统 治 者 。
	AI_Output(self, other, "DIA_Isgaroth_Job_01_03"); //人 们 来 我 这 里 向 英 诺 斯 祈 祷 并 祈 求 祝 福 。
	AI_Output(self, other, "DIA_Isgaroth_Job_01_04"); //只 要 一 点 捐 赠 ， 你 就 能 从 我 这 里 得 到 很 多 有 用 的 东 西 。

	Log_CreateTopic(Topic_KlosterTrader, LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, Topic_KlosterTrader_1);
};

//****************************************************************************
//	Trade
//****************************************************************************
instance DIA_Isgaroth_Trade(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 99;
	condition		= DIA_Isgaroth_Trade_Condition;
	information		= DIA_Isgaroth_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Isgaroth_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Isgaroth_Job))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Isgaroth_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

//********************************************************************************
//	Kloster
//********************************************************************************
instance DIA_Isgaroth_Kloster(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 3;
	condition		= DIA_Isgaroth_Kloster_Condition;
	information		= DIA_Isgaroth_Kloster_Info;
	description		= "这 条 路 通 向 哪 里 ？";
};

func int DIA_Isgaroth_Kloster_Condition()
{
	if ((other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Kloster_Info()
{
	AI_Output(other, self, "DIA_Isgaroth_Kloster_15_00"); //这 条 路 通 向 哪 里 ？
	AI_Output(self, other, "DIA_Isgaroth_Kloster_01_01"); //那 条 路 通 向 火 魔 法 师 的 修 道 院 。 然 而 ， 只 有 英 诺 斯 的 仆 人 才 能 进 去 。

	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Isgaroth_Kloster_01_02"); //如 果 你 想 要 成 为 修 道 院 的 新 信 徒 ， 你 必 须 带 来 一 头 绵 羊 和 … …
		B_Say_Gold(self, other, Summe_Kloster);

		Log_CreateTopic(Topic_Kloster, LOG_MISSION);
		Log_SetTopicStatus(Topic_Kloster, LOG_RUNNING);
		B_LogEntry(Topic_Kloster, Topic_Kloster_1);
	}
	else
	{
		AI_Output(self, other, "DIA_Isgaroth_Kloster_01_03"); //既 然 你 已 经 选 择 了 加 入 其 它 团 体 ， 入 口 将 拒 绝 对 你 开 放 。
	};
};

//******************************************************************************************
//	Vatras Auftrag
//******************************************************************************************
instance DIA_Isgaroth_Vatras(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 3;
	condition		= DIA_Isgaroth_Vatras_Condition;
	information		= DIA_Isgaroth_Vatras_Info;
	permanent		= TRUE;
	description		= "我 带 来 了 瓦 卓 斯 的 消 息 。";
};

func int DIA_Isgaroth_Vatras_Condition()
{
	if ((MIS_Vatras_Message == LOG_RUNNING)
	&& ((Npc_HasItems(other, ItWr_VatrasMessage) == 1)
	|| (Npc_HasItems(other, ItWr_VatrasMessage_open) == 1)))
	{
		return TRUE;
	};
};

func void DIA_Isgaroth_Vatras_Info()
{
	AI_Output(other, self, "DIA_ISgaroth_Vatras_15_00"); //我 带 来 了 瓦 卓 斯 的 消 息 。
	AI_Output(self, other, "DIA_Isgaroth_Vatras_01_01"); //是 什 么 消 息 ？
	AI_Output(other, self, "DIA_Isgaroth_Vatras_15_02"); //是 一 封 信 。 给 。

	if (Npc_HasItems(other, ItWr_VatrasMessage) == 1)
	{
		if (B_GiveInvItems(other, self, ItWr_VatrasMessage, 1))
		{
			Npc_RemoveInvItems(self, ItWr_VatrasMessage, 1);
		};

		B_UseFakeScroll();

		AI_Output(self, other, "DIA_Isgaroth_Vatras_01_03"); //好 ， 你 可 以 告 诉 瓦 卓 斯 我 已 经 收 到 了 消 息 。
		AI_Output(self, other, "DIA_Isgaroth_Vatras_01_04"); //拿 上 这 些 药 剂 作 为 你 的 服 务 的 奖 赏 ， 它 们 肯 定 对 你 有 用 。

		CreateInvItems(self, ItPo_Health_02, 2);
		B_GiveInvItems(self, other, ItPo_Health_02, 2);

		B_GivePlayerXP((XP_Ambient) * 2);
	}
	else if (Npc_HasItems(other, ItWr_VatrasMessage_open) == 1)
	{
		if (B_GiveInvItems(other, self, ItWr_VatrasMessage_open, 1))
		{
			Npc_RemoveInvItems(self, ItWr_VatrasMessage_open, 1);
		};

		B_UseFakeScroll();

		AI_Output(self, other, "DIA_Isgaroth_Vatras_01_05"); //封 印 已 经 破 损 了 。 你 是 怎 么 想 的 ， 你 这 个 傻 瓜 。
		AI_Output(self, other, "DIA_Isgaroth_Vatras_01_06"); //去 告 诉 瓦 卓 斯 我 已 经 收 到 了 他 的 消 息 。
		AI_StopProcessInfos(self);
	};

	Vatras_Return = TRUE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Isgaroth_PICKPOCKET(C_INFO)
{
	npc				= KDF_509_Isgaroth;
	nr				= 900;
	condition		= DIA_Isgaroth_PICKPOCKET_Condition;
	information		= DIA_Isgaroth_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Isgaroth_PICKPOCKET_Condition()
{
	C_Beklauen(48, 50);
};

func void DIA_Isgaroth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET, DIALOG_BACK, DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Isgaroth_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};

func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Isgaroth_PICKPOCKET);
};
