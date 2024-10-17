// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lester_DI_EXIT(C_INFO)
{
	npc				= PC_Psionic_DI;
	nr				= 999;
	condition		= DIA_Lester_DI_EXIT_Condition;
	information		= DIA_Lester_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lester_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lester_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Lester_DI_Hello(C_INFO)
{
	npc				= PC_Psionic_DI;
	nr				= 1;
	condition		= DIA_Lester_DI_Hello_Condition;
	information		= DIA_Lester_DI_Hello_Info;
	permanent		= TRUE;
	description		= "你 有 什 么 事 情 要 告 诉 我 吗 ？";
};

func int DIA_Lester_DI_Hello_Condition()
{
	if (Npc_IsDead(UndeadDragon) == FALSE)
	{
		return TRUE;
	};
};

var int DIA_Lester_DI_SCGotWarning1;
var int DIA_Lester_DI_SCGotWarning2;
func void DIA_Lester_DI_Hello_Info()
{
	AI_Output(other, self, "DIA_Lester_DI_Hello_15_00"); //你 有 什 么 事 情 要 告 诉 我 吗 ？

	if ((Npc_IsDead(Mario_DI) == FALSE)
	&& (ORkSturmDI == TRUE)
	&& (DIA_Lester_DI_SCGotWarning1 == FALSE))
	{
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_01"); //兽 人 攻 击 的 时 候 马 里 澳 溜 走 了 。 尽 管 船 上 很 混 乱 ， 我 还 是 留 意 了 他 。
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_02"); //他 直 接 穿 过 了 兽 人 的 封 锁 走 了 ， 而 兽 人 碰 都 没 碰 他 就 让 他 过 去 了 。
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_03"); //我 一 开 始 就 对 这 个 混 蛋 有 点 怪 怪 的 想 法 。 他 跟 敌 人 是 同 谋。
		B_GivePlayerXP(XP_Ambient);
		DIA_Lester_DI_SCGotWarning1 = TRUE;
	}
	else if ((Npc_IsDead(Mario_DI) == FALSE)
	&& (DIA_Lester_DI_SCGotWarning2 == FALSE))
	{
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_04"); //那 个 管 自 己 叫 马 里 澳 的 奇 怪 的 家 伙 让 我 不 安 。 他 有 一 种 邪 恶 的 光 环 。
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_05"); //小 心 背 后 ， 我 的 朋 友 。
		DIA_Lester_DI_SCGotWarning2 = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Lester_DI_Hello_13_06"); //不 是 现 在 。 也 许 以 后 吧 。
	};
};

// ************************************************************
// 			  				   MarioArsch
// ************************************************************
instance DIA_Lester_DI_MarioArsch(C_INFO)
{
	npc				= PC_Psionic_DI;
	nr				= 2;
	condition		= DIA_Lester_DI_MarioArsch_Condition;
	information		= DIA_Lester_DI_MarioArsch_Info;
	description		= "你 是 对 的 。 马 里 澳 已 经 背 叛 了 我 们 。";
};

func int DIA_Lester_DI_MarioArsch_Condition()
{
	if (((DIA_Lester_DI_SCGotWarning2 == TRUE) || (DIA_Lester_DI_SCGotWarning2 == TRUE))
	&& (MIS_Mario_Ambush == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Lester_DI_MarioArsch_Info()
{
	AI_Output(other, self, "DIA_Lester_DI_MarioArsch_15_00"); //你 是 对 的 。 马 里 澳 已 经 背 叛 了 我 们 。
	AI_Output(self, other, "DIA_Lester_DI_MarioArsch_13_01"); //是 的 。 或 者 ， 也 许 我 不 是 那 么 敏 锐 ， 但 这 件 事 对 我 来 说 十 分 清 楚 。
	AI_Output(self, other, "DIA_Lester_DI_MarioArsch_13_02"); //以 后 在 选 择 跟 随 你 的 人 时 要 更 加 小 心 一 点 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 	  	  UndeadDragonDead
// ************************************************************
instance DIA_PC_Lester_DI_UndeadDragonDead(C_INFO)
{
	npc				= PC_Psionic_DI;
	nr				= 5;
	condition		= DIA_PC_Lester_DI_UndeadDragonDead_Condition;
	information		= DIA_PC_Lester_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 们 在 这 里 不 会 呆 上 太 久 。";
};

func int DIA_PC_Lester_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_PC_Lester_DI_UndeadDragonDead_OneTime;
func void DIA_PC_Lester_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_PC_Lester_DI_UndeadDragonDead_15_00"); //我 们 在 这 里 不 会 呆 上 太 久 。

	if (DIA_PC_Lester_DI_UndeadDragonDead_OneTime == FALSE)
	{
		if ((Npc_GetDistToWP(self, "DI_DRACONIANAREA_19") < 4000))
		{
			AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_01"); //好 象 我 的 头 痛 已 经 被 驱 散 了 。
			AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_02"); //你 怎 么 办 到 的 ？
			AI_Output(other, self, "DIA_PC_Lester_DI_UndeadDragonDead_15_03"); //我 已 经 把 敌 人 消 灭 了 。
			AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_04"); //那 一 定 是 某 些 非 常 厉 害 的 东 西 。 那 到 底 是 什 么 呢 ？
			AI_Output(other, self, "DIA_PC_Lester_DI_UndeadDragonDead_15_05"); //一 只 亡 灵 龙 。
		};

		if (SC_KnowsMadPsi == TRUE)
		{
			AI_Output(other, self, "DIA_PC_Lester_DI_UndeadDragonDead_15_06"); //你 以 前 在 沼 泽 营 地 的 那 些 朋 友 让 我 吃 了 个 大 苦 头 。
			AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_07"); //是 的 。 信 仰 能 移 走 大 山 。 长 期 以 来 就 是 这 样 。 不 幸 的 是 ， 他 们 效 忠 了 一 个 错 误 的 神 。
			AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_08"); //我 需 要 一 些 时 间 才 能 真 正 克 服 这 一 切 。
		};

		DIA_PC_Lester_DI_UndeadDragonDead_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_PC_Lester_DI_UndeadDragonDead_13_09"); //但 愿 这 样 的 事 情 永 远 不 要 再 发 生 。 现 在 ， 世 界 上 已 经 没 有 那 么 多 沼 生 草 让 我 抽 个 够 了 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Psionic_DI_PICKPOCKET(C_INFO)
{
	npc				= PC_Psionic_DI;
	nr				= 900;
	condition		= DIA_Psionic_DI_PICKPOCKET_Condition;
	information		= DIA_Psionic_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Psionic_DI_PICKPOCKET_Condition()
{
	C_Beklauen(56, 25);
};

func void DIA_Psionic_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET, DIALOG_BACK, DIA_Psionic_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Psionic_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Psionic_DI_PICKPOCKET_DoIt);
};

func void DIA_Psionic_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};

func void DIA_Psionic_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Psionic_DI_PICKPOCKET);
};
