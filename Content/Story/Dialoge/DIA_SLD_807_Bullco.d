// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Bullco_EXIT(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 999;
	condition		= DIA_Bullco_EXIT_Condition;
	information		= DIA_Bullco_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bullco_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bullco_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 		  					Hallo (PERM)
// ************************************************************
instance DIA_Bullco_Hallo(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 1;
	condition		= DIA_Bullco_Hallo_Condition;
	information		= DIA_Bullco_Hallo_Info;
	permanent		= TRUE;
	description		= "我 们 两 个 应 该 谈 一 下 … …";
};

func int DIA_Bullco_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bullco_Hallo_Info()
{
	AI_Output(other, self, "DIA_Bullco_HALLO_15_00"); //我 们 两 个 应 该 谈 一 下 … …
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Bullco_HALLO_06_01"); //听 着 ， 你 赢 了 ！ 现 在 不 要 烦 我 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Bullco_HALLO_06_02"); //我 什 么 都 不 知 道 ！
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 		  			Sylvio zu oft angequatscht
// ************************************************************
instance DIA_Bullco_Quatscher(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 2;
	condition		= DIA_Bullco_Quatscher_Condition;
	information		= DIA_Bullco_Quatscher_Info;
	important		= TRUE;
};

func int DIA_Bullco_Quatscher_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Sylvio_angequatscht >= 2))
	{
		return TRUE;
	};
};

func void DIA_Bullco_Quatscher_Info()
{
	AI_Output(self, other, "DIA_Bullco_Quatscher_06_00"); //席 尔 维 欧 不 喜 欢 跟 人 说 话 。 之 前 你 应 该 已 经 领 教 过 了 吧 ？

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "PEE");
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 		  			Please Leave
// ************************************************************
var int Bullco_Leave_Day;
var int Bullco_scharf;
// ---------------------
instance DIA_Bullco_PleaseLeave(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 3;
	condition		= DIA_Bullco_PleaseLeave_Condition;
	information		= DIA_Bullco_PleaseLeave_Info;
	important		= TRUE;
};

func int DIA_Bullco_PleaseLeave_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if ((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE)
		|| (Sylvio_MenDefeated == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Bullco_PleaseLeave_Info()
{
	AI_Output(self, other, "DIA_Bullco_PleaseLeave_06_00"); //我 们 需 要 谈 一 谈 ， 你 和 我 。
	AI_Output(other, self, "DIA_Bullco_PleaseLeave_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Bullco_PleaseLeave_06_02"); //我 认 为 ， 你 最 好 不 要 再 在 农 场 上 露 面 。
	AI_Output(self, other, "DIA_Bullco_PleaseLeave_06_03"); //要 保 证 你 天 明 之 前 离 开 ， 我 们 说 明 白 了 吧 ？

	Bullco_Leave_Day = B_GetDayPlus();
	Bullco_scharf = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "PEE");
};

// ************************************************************
// 			  			Jeden Tag Wieder
// ************************************************************
var int Bullco_HitCounter;
// -----------------------
instance DIA_Bullco_DailyCheck(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 4;
	condition		= DIA_Bullco_DailyCheck_Condition;
	information		= DIA_Bullco_DailyCheck_Info;
	important		= TRUE;
};

func int DIA_Bullco_DailyCheck_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Bullco_scharf == TRUE)
	&& (Wld_GetDay() > Bullco_Leave_Day))
	{
		return TRUE;
	};
};

func void DIA_Bullco_DailyCheck_Info()
{
	if (Bullco_HitCounter == 0)
	{
		AI_Output(self, other, "DIA_Bullco_DailyCheck_06_00"); //不 管 怎 样 ， 你 还 是 在 这 里 … …
		AI_Output(self, other, "DIA_Bullco_DailyCheck_06_01"); //我 想 我 们 已 经 达 成 协 议 ： 我 会 让 你 平 静 地 离 开 。
		AI_Output(self, other, "DIA_Bullco_DailyCheck_06_02"); //你 真 应 该 听 我 的 。
	}
	else
	{
		AI_Output(self, other, "DIA_Bullco_DailyCheck_06_03"); //我 不 相 信 这 是 真 的 ！ 那 个 家 伙 还 在 这 里 ！
	};

	Bullco_HitCounter = Bullco_HitCounter + 1;
	Bullco_Leave_Day = B_GetDayPlus();

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			Ich werde NICHT gehen.
// ************************************************************
instance DIA_Bullco_WontLeave(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 5;
	condition		= DIA_Bullco_WontLeave_Condition;
	information		= DIA_Bullco_WontLeave_Info;
	description		= "我 不 会 离 开 这 里 ！";
};

func int DIA_Bullco_WontLeave_Condition()
{
	if (Bullco_scharf == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bullco_WontLeave_Info()
{
	AI_Output(other, self, "DIA_Bullco_WontLeave_15_00"); //我 不 会 离 开 这 里 ！

	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Bullco_WontLeave_06_01"); //（ 叹 息 ） 我 想 我 们 将 不 得 不 再 讨 论 一 下 了 ！
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_NONE, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Bullco_WontLeave_06_02"); //（ 不 高 兴 的 ） 是 ， 是 ， 去 告 诉 那 些 关 心 这 件 事 的 人 。
		Bullco_scharf = FALSE;
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  			Pepes Schafe
// ************************************************************
instance DIA_Bullco_PepesSchafe(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 6;
	condition		= DIA_Bullco_PepesSchafe_Condition;
	information		= DIA_Bullco_PepesSchafe_Info;
	description		= "皮 皮 这 个 名 字 是 否 让 你 想 起 了 什 么 ？";
};

func int DIA_Bullco_PepesSchafe_Condition()
{
	if ((MIS_Pepe_KillWolves == LOG_SUCCESS)
	&& (Bullco_scharf == TRUE)
	&& (Onar_WegenPepe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bullco_PepesSchafe_Info()
{
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_00"); //皮 皮 这 个 名 字 是 否 让 你 想 起 了 什 么 ？
	AI_Output(self, other, "DIA_Bullco_PepesSchafe_06_01"); //你 喋 喋 不 休 地 说 个 没 完 ， 我 一 个 字 都 没 弄 明 白 ， 但 是 ， 我 不 喜 欢 你 的 语 气 ！
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_02"); //你 应 该 去 看 守 他 的 绵 羊 。
	AI_Output(self, other, "DIA_Bullco_PepesSchafe_06_03"); //我 要 怎 么 照 顾 他 的 绵 羊 ？
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_04"); //李 很 担 心 它 们 。
	AI_Output(self, other, "DIA_Bullco_PepesSchafe_06_05"); //你 在 暗 示 什 么 ？
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_06"); //如 果 你 继 续 惹 我 ， 那 么 我 会 要 让 你 为 那 些 羊 付 款 。
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_07"); //所 以 ， 如 果 你 真 的 对 你 的 报 酬 很 感 兴 趣 的 话 ， 那 就 从 现 在 开 始 离 我 远 点 ！
	AI_Output(self, other, "DIA_Bullco_PepesSchafe_06_08"); //（ 狂 怒 地 ） 你 ， 你 … …
	AI_Output(other, self, "DIA_Bullco_PepesSchafe_15_09"); //（ 平 静 地 ） 怎 么 了 ？
	AI_Output(self, other, "DIA_Bullco_PepesSchafe_06_10"); //（ 自 言 自 语 ） 可 怜 的 人 … …

	Bullco_scharf = FALSE;
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_BullcoSLD_PICKPOCKET(C_INFO)
{
	npc				= SLD_807_Bullco;
	nr				= 900;
	condition		= DIA_BullcoSLD_PICKPOCKET_Condition;
	information		= DIA_BullcoSLD_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_BullcoSLD_PICKPOCKET_Condition()
{
	C_Beklauen(56, 35);
};

func void DIA_BullcoSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET, DIALOG_BACK, DIA_BullcoSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_BullcoSLD_PICKPOCKET, DIALOG_PICKPOCKET, DIA_BullcoSLD_PICKPOCKET_DoIt);
};

func void DIA_BullcoSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};

func void DIA_BullcoSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_BullcoSLD_PICKPOCKET);
};
