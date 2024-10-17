///////////////////////////////////////////////////////////////////////
// DIA_BDT_10XX_Fluechtling
///////////////////////////////////////////////////////////////////////

func void B_DIA_BDT_10XX_Fluechtling_Stimme7()
{
	AI_Output(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_07_00"); //算 了 吧 。 我 不 想 回 到 监 狱 里 去 。
};

func void B_DIA_BDT_10XX_Fluechtling_Stimme6()
{
	AI_Output(self, other, "DIA_B_DIA_BDT_10XX_Fluechtling_06_00"); //你 不 是 来 把 我 们 送 回 监 狱 的 ， 是 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_EXIT(C_INFO)
{
	npc				= BDT_1031_Fluechtling;
	nr				= 999;
	condition		= DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information		= DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip1
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_Tip1(C_INFO)
{
	npc				= BDT_1031_Fluechtling;
	nr				= 2;
	condition		= DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information		= DIA_BDT_1031_Fluechtling_Tip1_Info;
	important		= TRUE;
};

func int DIA_BDT_1031_Fluechtling_Tip1_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Info()
{
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_07_00"); //如 果 你 不 想 进 监 狱 的 话 ， 最 好 跟 我 保 持 距 离 。
	B_GivePlayerXP(XP_AmbientKap3);

	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, "我 不 打 算 举 报 你 。", DIA_BDT_1031_Fluechtling_Tip1_frei);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, "我 来 逮 捕 你 。", DIA_BDT_1031_Fluechtling_Tip1_Knast);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, "默 加 哈 德 - 你 的 首 领 在 哪 里 ？", DIA_BDT_1031_Fluechtling_Tip1_Morgahard);
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard()
{
	AI_Output(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00"); //默 加 哈 德 - 你 的 首 领 在 哪 里 ？
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01"); //我 们 分 散 了 ， 那 样 我 们 就 不 会 很 快 被 抓 到 。 不 知 道 其 它 人 去 哪 里 了 。

	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, "太 糟 了 。 那 我 认 为 我 必 须 去 找 法 官 。", DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen()
{
	AI_Output(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00"); //太 糟 了 。 那 我 认 为 我 必 须 去 找 法 官 。
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01"); //好 吧 ， 好 吧 。 我 想 我 们 有 些 人 向 酒 馆 那 里 去 了 。 但 是 ， 那 可 不 是 你 从 我 这 里 听 说 的 ， 好 吗 ？
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast()
{
	AI_Output(other, self, "DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00"); //我 来 逮 捕 你 。
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01"); //除 非 我 死 了 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei()
{
	AI_Output(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_15_00"); //我 不 打 算 举 报 你 。
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_07_01"); //如 果 是 法 官 派 你 来 的 ， 那 么 你 可 以 告 诉 他 ， 我 们 让 他 滚 蛋 。

	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, "那 么 你 犯 了 什 么 罪 ？", DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen()
{
	AI_Output(other, self, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00"); //那 么 你 犯 了 什 么 罪 ？
	AI_Output(self, other, "DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01"); //那 不 关 你 的 事 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1031_Fluechtling_PERM(C_INFO)
{
	npc				= BDT_1031_Fluechtling;
	nr				= 3;
	condition		= DIA_BDT_1031_Fluechtling_PERM_Condition;
	information		= DIA_BDT_1031_Fluechtling_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1031_Fluechtling_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1032_Fluechtling_EXIT(C_INFO)
{
	npc				= BDT_1032_Fluechtling;
	nr				= 999;
	condition		= DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information		= DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1032_Fluechtling_PERM(C_INFO)
{
	npc				= BDT_1032_Fluechtling;
	nr				= 2;
	condition		= DIA_BDT_1032_Fluechtling_PERM_Condition;
	information		= DIA_BDT_1032_Fluechtling_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1032_Fluechtling_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1032_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_EXIT(C_INFO)
{
	npc				= BDT_1033_Fluechtling;
	nr				= 999;
	condition		= DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information		= DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Tip2
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_Tip2(C_INFO)
{
	npc				= BDT_1033_Fluechtling;
	nr				= 2;
	condition		= DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information		= DIA_BDT_1033_Fluechtling_Tip2_Info;
	important		= TRUE;
};

func int DIA_BDT_1033_Fluechtling_Tip2_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Info()
{
	AI_Output(self, other, "DIA_BDT_1033_Fluechtling_Tip2_07_00"); //（ 害 怕 ） 你 想 从 我 这 里 得 到 什 么 ？ 走 开 ！？
	B_GivePlayerXP(XP_AmbientKap3);

	if (SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, "放 松 。 我 只 是 想 和 你 谈 谈 。", DIA_BDT_1033_Fluechtling_Tip2_frei);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, "法 官 派 我 来 带 你 回 去 。", DIA_BDT_1033_Fluechtling_Tip2_Knast);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, "默 加 哈 德 - 你 的 首 领 在 哪 里 ？", DIA_BDT_1033_Fluechtling_Tip2_Morgahard);
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard()
{
	AI_Output(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00"); //默 加 哈 德 - 你 的 首 领 在 哪 里 ？
	AI_Output(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01"); //（ 恐 惧 的 ） 我 不 想 惹 任 何 麻 烦 。 去 地 主 那 里 。 他 想 要 藏 身 在 雇 佣 兵 之 中 。 现 在 不 要 打 扰 我 。
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast()
{
	AI_Output(other, self, "DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00"); //法 官 派 我 来 带 你 回 去 。
	AI_Output(self, other, "DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01"); //（ 尖 叫 ） 不 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei()
{
	AI_Output(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_15_00"); //放 松 。 我 只 是 想 和 你 谈 谈 。
	AI_Output(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_07_01"); //但 是 ， 我 不 想 跟 你 说 。 走 开 ， 老 兄 。

	Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, "你 真 的 是 非 常 恐 慌 ， 不 是 吗 ？", DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen()
{
	AI_Output(other, self, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00"); //你 真 的 是 非 常 恐 慌 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01"); //你 能 说 的 。 如 果 你 被 抓 住 的 话 ， 绞 架 不 会 等 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1033_Fluechtling_PERM(C_INFO)
{
	npc				= BDT_1033_Fluechtling;
	nr				= 3;
	condition		= DIA_BDT_1033_Fluechtling_PERM_Condition;
	information		= DIA_BDT_1033_Fluechtling_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1033_Fluechtling_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1034_Fluechtling_EXIT(C_INFO)
{
	npc				= BDT_1034_Fluechtling;
	nr				= 999;
	condition		= DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information		= DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1034_Fluechtling_PERM(C_INFO)
{
	npc				= BDT_1034_Fluechtling;
	nr				= 2;
	condition		= DIA_BDT_1034_Fluechtling_PERM_Condition;
	information		= DIA_BDT_1034_Fluechtling_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1034_Fluechtling_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1034_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme6();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1035_Fluechtling_EXIT(C_INFO)
{
	npc				= BDT_1035_Fluechtling;
	nr				= 999;
	condition		= DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information		= DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1035_Fluechtling_PERM(C_INFO)
{
	npc				= BDT_1035_Fluechtling;
	nr				= 2;
	condition		= DIA_BDT_1035_Fluechtling_PERM_Condition;
	information		= DIA_BDT_1035_Fluechtling_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1035_Fluechtling_PERM_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1035_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Fluechtling_Stimme7();
	AI_StopProcessInfos(self);
};
