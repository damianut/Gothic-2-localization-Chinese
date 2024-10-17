///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_EXIT(C_INFO)
{
	npc				= BDT_1025_Bandit_H;
	nr				= 999;
	condition		= DIA_NAME_BANDIT_EXIT_Condition;
	information		= DIA_NAME_BANDIT_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_NAME_BANDIT_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_EXIT_Info()
{
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, "NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchafBleibthier
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER(C_INFO)
{
	npc				= BDT_1025_Bandit_H;
	nr				= 30;
	condition		= DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition;
	information		= DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info;
	important		= TRUE;
};

func int DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Condition()
{
	return TRUE;
};

func void DIA_NAME_BANDIT_SCHAFBLEIBTHIER_Info()
{
	AI_Output(self, other, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00"); //嘿 ， 你 这 废 物 。 你 没 有 带 来 绵 羊 ， 是 吗 ？

	if (MIS_Akil_SchafDiebe == 0)
	{
		AI_Output(other, self, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01"); //绵 羊 ？ 什 么 绵 羊 ？
		AI_Output(self, other, "DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02"); //来 了 一 个 好 人 。 现 在 马 上 走 开 。 这 里 没 你 的 事 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SchafKlau
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_SchafKlau(C_INFO)
{
	npc				= BDT_1025_Bandit_H;
	nr				= 30;
	condition		= DIA_NAME_BANDIT_SchafKlau_Condition;
	information		= DIA_NAME_BANDIT_SchafKlau_Info;
	important		= TRUE;
};

func int DIA_NAME_BANDIT_SchafKlau_Condition()
{
	if (Npc_GetDistToWP(hero, "NW_FOREST_CAVE1_IN_01") < (hero.aivar[AIV_LastDistToWP] - 50))
	{
		return TRUE;
	};
};

func void DIA_NAME_BANDIT_SchafKlau_Info()
{
	AI_Output(self, other, "DIA_NAME_BANDIT_SchafKlau_09_00"); //嘿 ！ 我 在 和 你 说 话 。

	Info_AddChoice(DIA_NAME_BANDIT_SchafKlau, DIALOG_ENDE, DIA_NAME_BANDIT_SchafKlau_weiter);
};

func void DIA_NAME_BANDIT_SchafKlau_weiter()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info RueckDasSchafraus
///////////////////////////////////////////////////////////////////////
instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS(C_INFO)
{
	npc				= BDT_1025_Bandit_H;
	nr				= 30;
	condition		= DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition;
	information		= DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info;
	permanent		= TRUE;
	description		= "你 偷 了 农 民 阿 基 尔 的 绵 羊 。";
};

func int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Condition()
{
	if ((MIS_Akil_SchafDiebe == LOG_RUNNING)
	&& (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm == FALSE))
	{
		return TRUE;
	};
};

var int DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm;
func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_Info()
{
	AI_Output(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00"); //你 偷 了 农 民 阿 基 尔 的 绵 羊 。
	AI_Output(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01"); //那 又 怎 么 样 ？ 你 想 要 用 它 做 什 么 ？

	Info_ClearChoices(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS);
	Info_AddChoice(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS, "没 有 。 那 是 什 么 样 的 愚 蠢 的 绵 羊 ？", DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts);
	Info_AddChoice(DIA_NAME_BANDIT_RUECKDASSCHAFRAUS, "把 那 绵 羊 给 我 ， 否 则 我 就 打 瞎 你 的 眼 睛 。", DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf);
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf()
{
	AI_Output(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00"); //把 那 绵 羊 给 我 ， 否 则 我 就 打 瞎 你 的 眼 睛 。
	AI_Output(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01"); //那 么 留 神 ， 小 伙 子 。 地 狱 就 要 打 开 了 。

	AI_StopProcessInfos(self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NoPerm = TRUE;
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	BDT_1025_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
	BDT_1026_Bandit_H.aivar[AIV_EnemyOverride] = FALSE;
};

func void DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts()
{
	AI_Output(other, self, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00"); //没 有 。 那 是 什 么 样 的 愚 蠢 的 绵 羊 ？
	AI_Output(self, other, "DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01"); //那 么 不 要 来 烦 我 。 走 开 ！
	hero.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(hero, "NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};
