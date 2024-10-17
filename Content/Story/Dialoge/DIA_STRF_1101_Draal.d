///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Draal_EXIT(C_INFO)
{
	npc				= STRF_1101_Draal;
	nr				= 999;
	condition		= DIA_Draal_EXIT_Condition;
	information		= DIA_Draal_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Draal_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Draal_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Draal_DRAGON(C_INFO)
{
	npc				= STRF_1101_Draal;
	nr				= 1;
	condition		= DIA_Draal_DRAGON_Condition;
	information		= DIA_Draal_DRAGON_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Draal_DRAGON_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Draal_DRAGON_Info()
{
	AI_Output(self, other, "DIA_Draal_DRAGON_03_00"); //龙 袭 击 的 时 候 我 在 外 面 。
	AI_Output(self, other, "DIA_Draal_DRAGON_03_01"); //我 看 见 了 ， 有10个 人 那 么 大 - 它 的 口 中 喷 出 火 焰 ， 一 眨 眼 就 把 那 些 小 屋 都 摧 毁 了 ！
	AI_Output(self, other, "DIA_Draal_DRAGON_03_02"); //一 条 龙 ！ 我 留 在 这 里 。 没 有 什 么 能 动 摇 我 。 我 没 有 发 疯 ！
};
