///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP1_EXIT(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 999;
	condition		= DIA_Talamon_KAP1_EXIT_Condition;
	information		= DIA_Talamon_KAP1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talamon_KAP1_EXIT_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************

// ------------------------------------------------------------
const string KDF_507_Checkpoint = "NW_MONASTERY_SEALROOM_01"; // Zugang zur geheimen Bibliothek
// ------------------------------------------------------------
instance DIA_KDF_507_Talamon_FirstWarn(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 1;
	condition		= DIA_KDF_507_Talamon_FirstWarn_Condition;
	information		= DIA_KDF_507_Talamon_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_KDF_507_Talamon_FirstWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_KDF_507_Talamon_FirstWarn_04_00"); //你 不 能 再 往 前 走 了 。 回 去 ！
	// AI_Output(other, self,"DIA_KDF_507_Talamon_FirstWarn_15_01"); //

	AI_StopProcessInfos(self);

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_KDF_507_Talamon_SecondWarn(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 2;
	condition		= DIA_KDF_507_Talamon_SecondWarn_Condition;
	information		= DIA_KDF_507_Talamon_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_KDF_507_Talamon_SecondWarn_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_KDF_507_Talamon_SecondWarn_04_00"); //如 果 你 不 回 去 的 话 ， 英 诺 斯 会 将 他 的 愤 怒 发 泄 到 你 身 上 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, KDF_507_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_KDF_507_Talamon_Attack(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 3;
	condition		= DIA_KDF_507_Talamon_Attack_Condition;
	information		= DIA_KDF_507_Talamon_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_KDF_507_Talamon_Attack_Condition()
{
	if ((Pyrokar_LetYouPassTalamon == FALSE)
	&& (self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, KDF_507_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_KDF_507_Talamon_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_StopProcessInfos(self); // dem Spieler sofort wieder die Kontrolle zurückgeben

	B_Attack(self, other, AR_GuardStopsIntruder, 1);
};

// #######################################################################
// ##
// ## Kapitel 2
// ##
// #######################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP2_EXIT(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 999;
	condition		= DIA_Talamon_KAP2_EXIT_Condition;
	information		= DIA_Talamon_KAP2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talamon_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #######################################################################
// ##
// ## Kapitel 3
// ##
// #######################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP3_EXIT(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 999;
	condition		= DIA_Talamon_KAP3_EXIT_Condition;
	information		= DIA_Talamon_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talamon_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #######################################################################
// ##
// ## Kapitel 4
// ##
// #######################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP4_EXIT(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 999;
	condition		= DIA_Talamon_KAP4_EXIT_Condition;
	information		= DIA_Talamon_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talamon_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #######################################################################
// ##
// ## Kapitel 5
// ##
// #######################################################################

///////////////////////////////////////////////////////////////////////
//	Halt!
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP5_Stop(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 50;
	condition		= DIA_Talamon_KAP5_Stop_Condition;
	information		= DIA_Talamon_KAP5_Stop_Info;
	important		= TRUE;
};

func int DIA_Talamon_KAP5_Stop_Condition()
{
	if (Pyrokar_LetYouPassTalamon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_Stop_Info()
{
	AI_Output(self, other, "DIA_Talamon_KAP5_Stop_04_00"); //你 不 能 再 往 前 走 了 。 回 去 ！
	AI_Output(other, self, "DIA_Talamon_KAP5_Stop_15_01"); //皮 罗 卡 说 我 可 以 查 看 艾 克 萨 达 斯 的 书 。
	AI_Output(self, other, "DIA_Talamon_KAP5_Stop_04_02"); //他 那 么 说 的 。 好 吧 ， 你 可 以 进 去 。 你 要 找 的 书 在 那 边 的 炼 金 术 士 工 作 台 上 。

	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_8);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundSecretDoor
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_FoundSecretDoor(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 51;
	condition		= DIA_Talamon_FoundSecretDoor_Condition;
	information		= DIA_Talamon_FoundSecretDoor_Info;
	description		= "我 发 现 了 一 扇 门 。";
};

func int DIA_Talamon_FoundSecretDoor_Condition()
{
	if (SecretLibraryIsOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Talamon_FoundSecretDoor_Info()
{
	AI_Output(other, self, "DIA_Talamon_FoundSecretDoor_15_00"); //我 发 现 了 一 扇 门 。
	AI_Output(self, other, "DIA_Talamon_FoundSecretDoor_04_01"); //（ 感 到 惊 讶 ） 什 么 ？ 哪 里 ？
	AI_Output(other, self, "DIA_Talamon_FoundSecretDoor_15_02"); //在 一 个 书 架 后 面。
	AI_Output(self, other, "DIA_Talamon_FoundSecretDoor_04_03"); //它 后 面 是 什 么 ？
	AI_Output(other, self, "DIA_Talamon_FoundSecretDoor_15_04"); //它 看 上 去 像 是 一 个 古 老 的 地 下 室 。
	AI_Output(self, other, "DIA_Talamon_FoundSecretDoor_04_05"); //这 是 一 个 重 要 新 闻 ， 我 要 立 即 通 知 皮 罗 卡 。
	AI_Output(self, other, "DIA_Talamon_FoundSecretDoor_04_06"); //同 时 ， 你 必 须 查 明 在 这 个 地 下 室 里 有 什 么 。

	MIS_ScoutLibrary = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info MIS_SCoutLibrary
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_ScoutSecretLibrary(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 51;
	condition		= DIA_Talamon_ScoutSecretLibrary_Condition;
	information		= DIA_Talamon_ScoutSecretLibrary_Info;
	permanent		= TRUE;
	description		= "我 已 经 去 过 地 下 室 了 。";
};

func int DIA_Talamon_ScoutSecretLibrary_Condition()
{
	if ((MIS_SCOUTLIBRARY == LOG_RUNNING)
	&& (HeroWasInLibrary == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Talamon_ScoutSecretLibrary_Info()
{
	AI_Output(other, self, "DIA_Talamon_ScoutSecretLibrary_15_00"); //我 已 经 去 过 地 下 室 了 。
	AI_Output(self, other, "DIA_Talamon_ScoutSecretLibrary_04_01"); //那 么 你 发 现 了 什 么 ？

	if (Npc_IsDead(SecretLibrarySkeleton))
	{
		AI_Output(other, self, "DIA_Talamon_ScoutSecretLibrary_15_02"); //那 下 面 有 一 个 骷 髅 战 士 ， 守 卫 着 一 扇 门 。 我 杀 了 他 。
		AI_Output(self, other, "DIA_Talamon_ScoutSecretLibrary_04_03"); //干 得 好 。
		AI_Output(self, other, "DIA_Talamon_ScoutSecretLibrary_04_04"); //一 旦 我 们 战 胜 邪 恶 ， 我 们 就 会 着 手 处 理 地 下 室 。

		MIS_ScoutLibrary = LOG_SUCCESS;
		B_GivePlayerXP(XP_ScoutSecretLibrary);
	}
	else
	{
		AI_Output(other, self, "DIA_Talamon_ScoutSecretLibrary_15_05"); //那 里 面 充 满 了 怪 物 。
		AI_Output(self, other, "DIA_Talamon_ScoutSecretLibrary_04_06"); //一 定 有 什 么 东 西 ， 继 续 寻 找 。 不 要 怜 悯 那 些 坏 蛋 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talamon_KAP5_EXIT(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 999;
	condition		= DIA_Talamon_KAP5_EXIT_Condition;
	information		= DIA_Talamon_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talamon_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talamon_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Talamon_PICKPOCKET(C_INFO)
{
	npc				= KDF_507_Talamon;
	nr				= 900;
	condition		= DIA_Talamon_PICKPOCKET_Condition;
	information		= DIA_Talamon_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Talamon_PICKPOCKET_Condition()
{
	C_Beklauen(87, 140);
};

func void DIA_Talamon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
	Info_AddChoice(DIA_Talamon_PICKPOCKET, DIALOG_BACK, DIA_Talamon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talamon_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Talamon_PICKPOCKET_DoIt);
};

func void DIA_Talamon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};

func void DIA_Talamon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talamon_PICKPOCKET);
};
