///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_EXIT(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 999;
	condition		= DIA_Salandril_EXIT_Condition;
	information		= DIA_Salandril_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Salandril_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Salandril_PICKPOCKET(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 900;
	condition		= DIA_Salandril_PICKPOCKET_Condition;
	information		= DIA_Salandril_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

// ----------------------------------------
var int DIA_Salandril_PICKPOCKET_perm;
// ----------------------------------------
func int DIA_Salandril_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (DIA_Salandril_PICKPOCKET_perm == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Salandril_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	Info_AddChoice(DIA_Salandril_PICKPOCKET, DIALOG_BACK, DIA_Salandril_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Salandril_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Salandril_PICKPOCKET_DoIt);
};

func void DIA_Salandril_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems(self, ItKe_Salandril, 1);
		B_GiveInvItems(self, other, ItKe_Salandril, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;

		DIA_Salandril_PICKPOCKET_perm = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Salandril_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1);
	};
};

func void DIA_Salandril_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Salandril_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Hallo(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 2;
	condition		= DIA_Salandril_Hallo_Condition;
	information		= DIA_Salandril_Hallo_Info;
	important		= TRUE;
};

func int DIA_Salandril_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Hallo_Info()
{
	AI_Output(self, other, "DIA_Salandril_PERM_13_00"); //欢 迎 你 ， 过 路 人 。 想 找 一 瓶 不 错 的 药 剂 吗 ？
	AI_Output(self, other, "DIA_Salandril_PERM_13_01"); //我 提 供 丰 富 的 选 择 和 合 理 的 价 格 。 而 且 我 的 药 剂 比 祖 里 斯 卖 的 那 些 东 西 好 很 多 。

	Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_9);
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trank(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 2;
	condition		= DIA_Salandril_Trank_Condition;
	information		= DIA_Salandril_Trank_Info;
	important		= TRUE;
};

func int DIA_Salandril_Trank_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_OLDWORLD == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Salandril_KLOSTER) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trank_Info()
{
	AI_Output(self, other, "DIA_Salandril_Trank_13_00"); //我 听 说 你 跟 那 些 圣 骑 士 去 了 矿 藏 山 谷 。 这 给 我 留 下 了 深 刻 的 印 像 。
	AI_Output(self, other, "DIA_Salandril_Trank_13_01"); //你 可 以 随 便 看 看 我 的 货 物 。 现 在 ， 我 还 有 一 瓶 非 常 特 别 的 药 剂 出 售 。

	CreateInvItems(self, ItPo_Perm_DEX, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Trade(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 9;
	condition		= DIA_Salandril_Trade_Condition;
	information		= DIA_Salandril_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Salandril_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Salandril_KLOSTER) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Salandril_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Salandril_Trade_15_00"); //让 我 看 看 你 的 货 物 。

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Salandril_Trade_13_01"); //这 是 我 的 荣 幸 ， 尊 敬 的 修 士 。
		if (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
		{
			SC_KnowsProspektorSalandril = TRUE;
		};
	};

	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Salandril_Trade_13_02"); //这 是 我 的 荣 幸 ， 高 尚 的 勇 士 。
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
instance DIA_Salandril_KAP3_EXIT(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 999;
	condition		= DIA_Salandril_KAP3_EXIT_Condition;
	information		= DIA_Salandril_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Salandril_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_KLOSTER(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 2;
	condition		= DIA_Salandril_KLOSTER_Condition;
	information		= DIA_Salandril_KLOSTER_Info;
	description		= "你 现 在 去 修 道 院 接 受 审 判 。";
};

func int DIA_Salandril_KLOSTER_Condition()
{
	if ((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Salandril_KLOSTER_Info()
{
	AI_Output(other, self, "DIA_Salandril_KLOSTER_15_00"); //你 现 在 去 修 道 院 接 受 审 判 。
	AI_Output(self, other, "DIA_Salandril_KLOSTER_13_01"); //什 么 ？ 你 神 经 失 常 了 吗 ？ 我 绝 对 不 会 。 那 些 可 恶 的 魔 法 师 没 有 任 何 反 驳 我 的 证 据 。

	if ((hero.guild == GIL_KDF)
	&& (SC_KnowsProspektorSalandril == TRUE))
	{
		AI_Output(other, self, "DIA_Salandril_KLOSTER_15_02"); //还 有 你 在 整 个 地 区 叫 卖 的 那 些 伪 造 矿 井 股 票 又 怎 么 样 ？ 它 们 有 你 的 签 名 。 你 犯 罪 了 。
	}
	else
	{
		AI_Output(other, self, "DIA_Salandril_KLOSTER_15_03"); //我 有 我 的 命 令 ， 我 正 要 完 成 它 。 所 以 ， 要 么 你 现 在 自 己 走 ， 要 么 我 让 你 走 。
	};

	AI_Output(self, other, "DIA_Salandril_KLOSTER_13_04"); //什 么 ？ 我 会 揪 着 你 的 领 子 把 你 像 块 破 抹 布 一 样 拖 着 穿 过 整 个 城 市 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info GehinsKloster
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_GehinsKloster(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 2;
	condition		= DIA_Salandril_GehinsKloster_Condition;
	information		= DIA_Salandril_GehinsKloster_Info;
	description		= "那 么 你 就 去 修 道 院 ， 还 是 我 给 你 另 外 … … ？";
};

func int DIA_Salandril_GehinsKloster_Condition()
{
	if (((SC_KnowsProspektorSalandril == TRUE) || (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	&& (Npc_KnowsInfo(other, DIA_Salandril_KLOSTER)))
	{
		return TRUE;
	};
};

func void DIA_Salandril_GehinsKloster_Info()
{
	AI_Output(other, self, "DIA_Salandril_GehinsKloster_15_00"); //那 么 你 就 去 修 道 院 ， 还 是 我 给 你 另 外 … … ？
	AI_Output(self, other, "DIA_Salandril_GehinsKloster_13_01"); //你 会 终 身 后 悔 这 件 事 的 。 是 的 ， 该 死 ， 我 会 去 那 个 修 道 院 ， 但 不 要 以 为 这 样 你 就 可 以 逃 脱 了 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "KlosterUrteil");
	MIS_Serpentes_BringSalandril_SLD = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Salandril_Verschwinde(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 2;
	condition		= DIA_Salandril_Verschwinde_Condition;
	information		= DIA_Salandril_Verschwinde_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Salandril_Verschwinde_Condition()
{
	if ((MIS_Serpentes_BringSalandril_SLD == LOG_SUCCESS)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Salandril_Verschwinde_Info()
{
	B_Verschwinde_Stimme13();
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
instance DIA_Salandril_KAP4_EXIT(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 999;
	condition		= DIA_Salandril_KAP4_EXIT_Condition;
	information		= DIA_Salandril_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Salandril_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Salandril_KAP5_EXIT(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 999;
	condition		= DIA_Salandril_KAP5_EXIT_Condition;
	information		= DIA_Salandril_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Salandril_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Salandril_KAP6_EXIT(C_INFO)
{
	npc				= VLK_422_Salandril;
	nr				= 999;
	condition		= DIA_Salandril_KAP6_EXIT_Condition;
	information		= DIA_Salandril_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Salandril_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Salandril_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};
