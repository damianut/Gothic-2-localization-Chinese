///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_EXIT(C_INFO)
{
	npc				= VLK_444_Jack_DI;
	nr				= 999;
	condition		= DIA_Jack_DI_EXIT_Condition;
	information		= DIA_Jack_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jack_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jack_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_GREET(C_INFO)
{
	npc				= VLK_444_Jack_DI;
	nr				= 4;
	condition		= DIA_Jack_DI_GREET_Condition;
	information		= DIA_Jack_DI_GREET_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Jack_DI_GREET_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Npc_IsDead(UndeadDragon) == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Jack_DI_GREET_OneTime;
func void DIA_Jack_DI_GREET_Info()
{
	if (ORkSturmDI == FALSE)
	{
		AI_Output(self, other, "DIA_Jack_DI_GREET_14_00"); //我 希 望 你 知 道 自 己 在 干 什 么 ， 伙 计 。
		AI_Output(other, self, "DIA_Jack_DI_GREET_15_01"); //现 在 ， 那 不 会 太 久 了 。
		AI_Output(self, other, "DIA_Jack_DI_GREET_14_02"); //保 住 你 的 脑 袋 完 整 地 回 来 。
		AI_StopProcessInfos(self);
	}
	else
	{
		if (DIA_Jack_DI_GREET_OneTime == FALSE)
		{
			AI_Output(other, self, "DIA_Jack_DI_GREET_15_03"); //你 在 这 里 做 什 么 ？
			B_GivePlayerXP(XP_Ambient);
			DIA_Jack_DI_GREET_OneTime = TRUE;
		};

		AI_Output(self, other, "DIA_Jack_DI_GREET_14_04"); //如 果 事 情 再 次 变 得 一 团 糟 ， 我 会 弄 条 船 离 开 这 里 。 无 论 有 你 还 是 没 你 ， 你 听 到 了 吗 ？
		AI_Output(other, self, "DIA_Jack_DI_GREET_15_05"); //不 要 说 废 话 。 我 会 处 理 这 些 事 的 。
		AI_Output(self, other, "DIA_Jack_DI_GREET_14_06"); //那 就 快 点 。
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Jack_DI_UndeadDragonDead(C_INFO)
{
	npc				= VLK_444_Jack_DI;
	nr				= 4;
	condition		= DIA_Jack_DI_UndeadDragonDead_Condition;
	information		= DIA_Jack_DI_UndeadDragonDead_Info;
	permanent		= TRUE;
	description		= "我 成 功 了 。 我 消 灭 了 敌 人 。";
};

func int DIA_Jack_DI_UndeadDragonDead_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Jack_DI_UndeadDragonDead_Info()
{
	AI_Output(other, self, "DIA_Jack_DI_UndeadDragonDead_15_00"); //我 成 功 了 。 我 消 灭 了 敌 人 。
	AI_Output(self, other, "DIA_Jack_DI_UndeadDragonDead_14_01"); //我 曾 经 希 望 一 切 会 变 得 好 起 来 。 但 是 ， 我 必 须 承 认 ， 在 刚 刚 过 去 的 几 个 小 时 里 ， 我 无 法 肯 定 。
	AI_Output(self, other, "DIA_Jack_DI_UndeadDragonDead_14_02"); //我 们 现 在 终 于 可 以 重 新 启 航 了 吗 ？

	Info_ClearChoices(DIA_Jack_DI_UndeadDragonDead);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead, "再 等 一 会 。", DIA_Jack_DI_UndeadDragonDead_moment);
	Info_AddChoice(DIA_Jack_DI_UndeadDragonDead, "是 的 。让 我 们 结 束 这 一 切 吧 。", DIA_Jack_DI_UndeadDragonDead_over);
};

func void DIA_Jack_DI_UndeadDragonDead_moment()
{
	AI_Output(other, self, "DIA_Jack_DI_UndeadDragonDead_moment_15_00"); //等 一 下 ， 我 还 有 一 些 事 要 做 。
	AI_Output(self, other, "DIA_Jack_DI_UndeadDragonDead_moment_14_01"); //快 点 ， 行 吗 ？ 我 不 想 在 这 里 染 上 坏 血 病 。
	AI_StopProcessInfos(self);
};

func void DIA_Jack_DI_UndeadDragonDead_over()
{
	AI_StopProcessInfos(self);
	B_Extro_Avi();
};
