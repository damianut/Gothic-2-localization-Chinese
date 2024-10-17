// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_EXIT(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 999;
	condition		= DIA_Addon_Carlos_EXIT_Condition;
	information		= DIA_Addon_Carlos_EXIT_Info;
	permanent		= TRUE;
	description		= "再 见 。( 结 束 )";
};

func int DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Carlos_PICKPOCKET(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 900;
	condition		= DIA_Addon_Carlos_PICKPOCKET_Condition;
	information		= DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	C_Beklauen(71, 85);
};

func void DIA_Addon_Carlos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET, DIALOG_BACK, DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_HI(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 1;
	condition		= DIA_Addon_Carlos_HI_Condition;
	information		= DIA_Addon_Carlos_HI_Info;
	important		= TRUE;
};

func int DIA_Addon_Carlos_HI_Condition()
{
	if (Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_HI_Info()
{
	AI_Output(self, other, "DIA_Addon_Carlos_HI_12_00"); //嘿 ， 你 是 新 来 的 那 个 打 倒 佛 朗 哥 的 小 子 ？

	Info_ClearChoices(DIA_Addon_Carlos_HI);
	Info_AddChoice(DIA_Addon_Carlos_HI, "什 么 ？ 我 ？ 不 ！", DIA_Addon_Carlos_HI_No);
	Info_AddChoice(DIA_Addon_Carlos_HI, "是 的 。 为 什 么 ？", DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output(other, self, "DIA_Addon_Carlos_HI_Yes_15_00"); //是 的 。 为 什 么 ？
	AI_Output(self, other, "DIA_Addon_Carlos_HI_Yes_12_01"); //（ 生 气 ） 因 为 现 在 我 要 接 管 他 的 工 作 。 你 干 得 不 错 ！ 万 分 感 谢 ！
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output(other, self, "DIA_Addon_Carlos_HI_No_15_00"); //什 么 ？ 我 ？ 不 ！
	AI_Output(self, other, "DIA_Addon_Carlos_HI_No_12_01"); //啊 ！ 不 想 冒 犯 ！
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_Attentat(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 2;
	condition		= DIA_Addon_Carlos_Attentat_Condition;
	information		= DIA_Addon_Carlos_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Carlos_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");

	AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_00"); //在 袭 击 者 死 掉 之 后 ， 托 鲁 斯 让 我 给 营 地 找 个 新 人 。

	if (Logan_Inside == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_01"); //佛 朗 哥 派 了 洛 根 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_02"); //佛 朗 哥 派 遣 了 一 个 新 人 。
	};

	AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_03"); //嘿 ， 我 只 是 按 照 托 鲁 斯 告 诉 我 的 去 做 。 对 于 那 次 攻 击 ， 我 一 点 也 不 了 解 。
};

// ---------------------------------------------------------------------
//	PERM
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_PERM(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 3;
	condition		= DIA_Addon_Carlos_PERM_Condition;
	information		= DIA_Addon_Carlos_PERM_Info;
	permanent		= TRUE;
	description		= "那 么 谁 在 领 导 猎 人 ？";
};

func int DIA_Addon_Carlos_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Carlos_PERM_15_00"); //那 么 谁 在 领 导 猎 人 ？
	AI_Output(self, other, "DIA_Addon_Carlos_PERM_12_00"); //别 惹 我 ！
	AI_StopProcessInfos(self);
};
