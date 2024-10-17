// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_BenchPirate_EXIT(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 999;
	condition		= DIA_Addon_BenchPirate_EXIT_Condition;
	information		= DIA_Addon_BenchPirate_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_BenchPirate_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 								Hello - PERM
// *************************************************************************
instance DIA_Addon_BenchPirate_Hello(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 1;
	condition		= DIA_Addon_BenchPirate_Hello_Condition;
	information		= DIA_Addon_BenchPirate_Hello_Info;
	permanent		= TRUE;
	description		= "那 最 近 怎 么 样 ？";
};

func int DIA_Addon_BenchPirate_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_BenchPirate_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Pir_7_Hello_15_00"); //那 最 近 怎 么 样 ？
	var int randy;
	randy = Hlp_Random(3);

	if (GregIsBack == TRUE)
	{
		if (randy == 0)
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_01"); //格 雷 格 终 于 回 来 了 。 恰 到 好 处 。
		}
		else if (randy == 1)
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_02"); //弗 朗 西 斯 要 为 栅 栏 弄 一 些 木 头 。 希 望 对 他 来 说 不 是 太 重 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_03"); //那 么 让 强 盗 来 吧 。 有 格 雷 格 和 我 们 在 一 起 ， 我 们 不 怕 他 们 。
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_04"); //弗 朗 西 斯 ， 营 地 的 首 领 。 就 是 一 个 小 丑 。 怎 么 会 有 人 把 他 真 当 一 回 事 。
		}
		else if (randy == 1)
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_05"); //格 雷 格 信 任 弗 朗 西 斯 是 因 为 他 太 蠢 ， 太 容 易 骗 了 ！ 但 是 让 他 做 首 领 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Pir_7_Hello_07_06"); //如 果 格 雷 格 不 快 点 回 来 让 我 上 船 的 话 ， 我 会 得 陆 地 综 合 症 。
		};
	};
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_Anheuern(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 11;
	condition		= DIA_Addon_BenchPirate_Anheuern_Condition;
	information		= DIA_Addon_BenchPirate_Anheuern_Info;
	description		= "你 应 该 帮 助 我 。";
};

func int DIA_Addon_BenchPirate_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_BenchPirate_Anheuern_15_00"); //你 应 该 帮 助 我 。
	AI_Output(self, other, "DIA_Addon_BenchPirate_Anheuern_07_01"); //格 雷 格 的 命 令 ？
	AI_Output(other, self, "DIA_Addon_BenchPirate_Anheuern_15_08"); //你 明 白 了 。
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_ComeOn(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 12;
	condition		= DIA_Addon_BenchPirate_ComeOn_Condition;
	information		= DIA_Addon_BenchPirate_ComeOn_Info;
	permanent		= TRUE;
	description		= "峡 谷 在 前 面 。";
};

func int DIA_Addon_BenchPirate_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_BenchPirate_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_BenchPirate_ComeOn_15_01"); //峡 谷 在 前 面 。
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_BenchPirate_ComeOn_07_02"); //那 正 是 我 要 回 去 的 地 方 … …
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_BenchPirate_ComeOn_07_01"); //是 是 ， 船 长 ！
		if (C_BodyStateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			B_TurnToNpc(self, other);
		};

		AI_StopProcessInfos(self);
		B_Addon_PiratesFollowAgain();
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_GoHome(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 13;
	condition		= DIA_Addon_BenchPirate_GoHome_Condition;
	information		= DIA_Addon_BenchPirate_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_BenchPirate_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_BenchPirate_GoHome_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_BenchPirate_GoHome_07_01"); //我 回 营 地 ， 船 长 ！

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_BenchPirate_TooFar(C_INFO)
{
	npc				= PIR_1363_Addon_Pirat;
	nr				= 14;
	condition		= DIA_Addon_BenchPirate_TooFar_Condition;
	information		= DIA_Addon_BenchPirate_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_BenchPirate_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_BenchPirate_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_BenchPirate_TooFar_07_01"); //我 们 离 营 地 太 远 了 。
	AI_Output(self, other, "DIA_Addon_BenchPirate_GoHome_07_02"); //我 根 本 不 喜 欢 这 里 。
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self, other, "DIA_Addon_Matt_TooFar_07_02"); //我 要 回 营 地 去 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Matt_TooFar_07_03"); //我 和 我 的 人 正 要 回 营 地 ！
	};

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};
