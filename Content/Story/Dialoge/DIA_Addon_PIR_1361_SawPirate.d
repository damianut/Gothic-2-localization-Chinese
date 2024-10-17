// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_SawPirate_EXIT(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 999;
	condition		= DIA_Addon_SawPirate_EXIT_Condition;
	information		= DIA_Addon_SawPirate_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_SawPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									Hello - PERM
// *************************************************************************
instance DIA_Addon_SawPirate_Hello(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 1;
	condition		= DIA_Addon_SawPirate_Hello_Condition;
	information		= DIA_Addon_SawPirate_Hello_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Addon_SawPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_SawPirate_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_SawPirate_Hello_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_SawPirate_Hello_09_01"); //不 要 向 我 喋 喋 不 休 ！
};

// ************************************************************
// *** ***
// 						Mitkommen (Henry)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_Anheuern(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 11;
	condition		= DIA_Addon_SawPirate_Anheuern_Condition;
	information		= DIA_Addon_SawPirate_Anheuern_Info;
	description		= "你 是 亨 利 的 人 吗 ？";
};

func int DIA_Addon_SawPirate_Anheuern_Condition()
{
	if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_JoinHenry_15_00"); //你 是 亨 利 的 人 吗 ？
	AI_Output(self, other, "DIA_Addon_SawPirate_Anheuern_09_01"); //不 。 我 锯 这 些 树 只 是 为 了 娱 乐 。
	AI_Output(self, other, "DIA_Addon_SawPirate_Anheuern_09_02"); //怎 么 样 了 ？ 亨 利 告 诉 你 要 做 什 么 了 吗 ？
	AI_Output(other, self, "DIA_Addon_Bones_JoinHenry_15_04"); //是 的 。 我 要 帮 他 解 决 一 些 强 盗 。
	AI_Output(self, other, "DIA_Addon_SawPirate_Anheuern_09_03"); //（ 避 开 ） 哦 不 ！ 不 要 那 样 看 着 我 。 我 不 想 去 那 里 。
	AI_Output(self, other, "DIA_Addon_SawPirate_Anheuern_09_04"); //还 是 让 我 锯 木 头 吧 ， 好 吗 ？
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
var int SawPirate_ComeOn_Once;
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_ComeOn(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 12;
	condition		= DIA_Addon_SawPirate_ComeOn_Condition;
	information		= DIA_Addon_SawPirate_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_SawPirate_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	&& (C_TowerBanditsDead() == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_SawPirate_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_SawPirate_ComeOn_15_00"); //跟 我 来 。
	if (HammerPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_SawPirate_ComeOn_09_01"); //为 什 么 ？ 你 已 经 找 到 人 和 你 一 起 了 … …
	}
	else if (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self, other, "DIA_Addon_SawPirate_ComeOn_09_04"); //首 先 让 我 们 朝 营 地 走 回 去 一 点 吧 。
		AI_StopProcessInfos(self);
	}
	else if ((!Npc_IsDead(HammerPirate))
	&& (SawPirate_ComeOn_Once == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_SawPirate_ComeOn_09_02"); //（ 自 言 自 语 ） 他 本 可 以 去 找 别 人 … …
		SawPirate_ComeOn_Once = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_SawPirate_ComeOn_09_03"); //（ 叹 息 ） 是 是 … …
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_GoHome(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 13;
	condition		= DIA_Addon_SawPirate_GoHome_Condition;
	information		= DIA_Addon_SawPirate_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_SawPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_SawPirate_GoHome_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_SawPirate_GoHome_09_01"); //那 么 我 想 应 该 回 去 锯 木 头 了 ！

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_SawPirate_TooFar(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_SawPirate_TooFar_Condition;
	information		= DIA_Addon_SawPirate_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_SawPirate_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_SawPirate_TooFar_09_01"); //我 们 离 营 地 太 远 了 。
	AI_Output(self, other, "DIA_Addon_SawPirate_GoHome_09_02"); //我 一 点 也 不 喜 欢 这 里 。 我 现 在 要 回 去 了 。

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			 				SUCCESS
// ************************************************************
instance DIA_Addon_SawPirate_Success(C_INFO)
{
	npc				= PIR_1361_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_SawPirate_Success_Condition;
	information		= DIA_Addon_SawPirate_Success_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_SawPirate_Success_Condition()
{
	if ((C_TowerBanditsDead() == TRUE)
	&& (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_SawPirate_Success_Info()
{
	AI_Output(self, other, "DIA_Addon_SawPirate_Success_09_01"); //你 知 道 吗 - 我 一 直 在 这 么 想 。 你 是 个 可 恶 的 家 伙 ！
	AI_Output(self, other, "DIA_Addon_SawPirate_Success_09_02"); //我 回 营 地 去 ， 而 且 我 希 望 永 远 不 要 再 见 到 你 ！

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");

	AI_StopProcessInfos(self);
};
