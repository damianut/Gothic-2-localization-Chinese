// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_HammerPirate_EXIT(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 999;
	condition		= DIA_Addon_HammerPirate_EXIT_Condition;
	information		= DIA_Addon_HammerPirate_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_HammerPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_HammerPirate_Hello(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 1;
	condition		= DIA_Addon_HammerPirate_Hello_Condition;
	information		= DIA_Addon_HammerPirate_Hello_Info;
	permanent		= TRUE;
	description		= "一 切 都 是 船 的 形 状 ？";
};

func int DIA_Addon_HammerPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_HammerPirate_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_HammerPirate_Hello_15_00"); //一 切 都 是 船 的 形 状 ？
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if (C_TowerBanditsDead() == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_HammerPirate_Hello_07_01"); //当 然 ， 现 在 现 在 我 们 必 须 把 那 个 做 完 。 那 些 卑 鄙 的 家 伙 象 比 目 鱼 一 样 滑 头 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_HammerPirate_Hello_07_02"); //我 们 把 它 做 完 ！
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_HammerPirate_Hello_07_03"); //不 ！ 抡 锤 子 不 是 我 的 事 ！
	};
};

// ************************************************************
// *** ***
// 						Mitkommen (Henry)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_Anheuern(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 11;
	condition		= DIA_Addon_HammerPirate_Anheuern_Condition;
	information		= DIA_Addon_HammerPirate_Anheuern_Info;
	description		= "你 应 该 帮 助 我 。";
};

func int DIA_Addon_HammerPirate_Anheuern_Condition()
{
	if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Anheuern_Info()
{
	AI_Output(self, other, "DIA_Addon_HammerPirate_Anheuern_07_00"); //不 要 对 我 讲 ！ 你 想 要 让 我 一 起 去 帮 你 打 那 些 强 盗 ！
	AI_Output(other, self, "DIA_Addon_PIR_6_JoinHenry_15_08"); //你 说 对 了 。
	if (!Npc_IsDead(SawPirate))
	{
		AI_Output(self, other, "DIA_Addon_HammerPirate_Anheuern_07_01"); //你 为 什 么 不 去 问 那 个 拉 锯 子 的 家 伙 ？
	};

	AI_Output(self, other, "DIA_Addon_HammerPirate_Anheuern_07_02"); //我 … … 无 法 习 惯 这 种 压 力 … …
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_ComeOn(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 12;
	condition		= DIA_Addon_HammerPirate_ComeOn_Condition;
	information		= DIA_Addon_HammerPirate_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 来 。";
};

func int DIA_Addon_HammerPirate_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	&& (C_TowerBanditsDead() == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_HammerPirate_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_HammerPirate_ComeOn_15_00"); //跟 我 来 。
	if (SawPirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_HammerPirate_ComeOn_07_01"); //亨 利 需 要 我 们 有 人 留 在 这 里 … …
	}
	else if (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self, other, "DIA_Addon_HammerPirate_ComeOn_07_02"); //先 让 我 们 朝 着 营 地 方 向 走 回 去 一 点 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_HammerPirate_ComeOn_07_03"); //（ 叹 息 ） 是 是 … …
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_GoHome(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 13;
	condition		= DIA_Addon_HammerPirate_GoHome_Condition;
	information		= DIA_Addon_HammerPirate_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_HammerPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_HammerPirate_GoHome_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_HammerPirate_GoHome_07_01"); //我 就 在 那 时 加 入 了 格 雷 格 。 现 在 我 呆 在 这 里 ...

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_HammerPirate_TooFar(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_HammerPirate_TooFar_Condition;
	information		= DIA_Addon_HammerPirate_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_HammerPirate_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_HammerPirate_TooFar_07_01"); //如 果 你 要 继 续 朝 那 个 方 向 走 ， 不 要 让 我 跟 … …
	AI_Output(self, other, "DIA_Addon_HammerPirate_GoHome_07_02"); //我 想 我 现 在 要 往 回 走 了 。

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			 				SUCCESS
// ************************************************************
instance DIA_Addon_HammerPirate_Success(C_INFO)
{
	npc				= PIR_1360_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_HammerPirate_Success_Condition;
	information		= DIA_Addon_HammerPirate_Success_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_HammerPirate_Success_Condition()
{
	if ((C_TowerBanditsDead() == TRUE)
	&& (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_HammerPirate_Success_Info()
{
	AI_Output(self, other, "DIA_Addon_HammerPirate_Success_07_01"); //你 知 道 吗 - 我 一 直 在 这 么 想 。 你 不 是 这 样 的 坏 人 ！
	AI_Output(self, other, "DIA_Addon_HammerPirate_Success_07_02"); //那 我 回 营 地 了 。 再 见 ！

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");

	AI_StopProcessInfos(self);
};
