///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_304_Torwache_EXIT(C_INFO)
{
	npc				= Mil_304_Torwache;
	nr				= 999;
	condition		= DIA_Mil_304_Torwache_EXIT_Condition;
	information		= DIA_Mil_304_Torwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mil_304_Torwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mil_304_Torwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Mil_304_Torwache_WASMACHSTDU(C_INFO)
{
	npc				= Mil_304_Torwache;
	nr				= 3;
	condition		= DIA_Mil_304_Torwache_WASMACHSTDU_Condition;
	information		= DIA_Mil_304_Torwache_WASMACHSTDU_Info;
	permanent		= TRUE;
	description		= "那 最 近 怎 么 样 ？";
};

func int DIA_Mil_304_Torwache_WASMACHSTDU_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Mil_304_Torwache_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Mil_304_Torwache_WASMACHSTDU_15_00"); //那 最 近 怎 么 样 ？
	if ((hero.guild == GIL_PAL)
	|| (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_01"); //我 不 会 抱 怨 。 我 按 照 英 诺 斯 对 我 的 期 望 来 履 行 我 的 职 责。
	}
	else
	{
		AI_Output(self, other, "DIA_Mil_304_Torwache_WASMACHSTDU_08_02"); //嘿 ， 不 要 在 这 里 问 那 些 ‘ 最 近 怎 么 样 ’ 之 类 的 话 。 马 上 走 开 ， 好 吗 ？
	};

	AI_StopProcessInfos(self);
};
