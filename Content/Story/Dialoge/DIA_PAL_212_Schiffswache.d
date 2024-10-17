///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_EXIT(C_INFO)
{
	npc				= Pal_212_Schiffswache;
	nr				= 999;
	condition		= DIA_Pal_212_Schiffswache_EXIT_Condition;
	information		= DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info werseidihr
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_WERSEIDIHR(C_INFO)
{
	npc				= Pal_212_Schiffswache;
	nr				= 0;
	condition		= DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information		= DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition()
{
	if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other, self, "DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01"); //我 们 是 罗 巴 尔 国 王 的 使 者 ， 英 诺 斯 的 仆 人 ， 在 普 通 人 嘴 里 我 们 叫 圣 骑 士 。
};

///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU2
///////////////////////////////////////////////////////////////////////
instance DIA_Pal_212_Schiffswache_WASMACHSTDU2(C_INFO)
{
	npc				= Pal_212_Schiffswache;
	nr				= 0;
	condition		= DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information		= DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other, self, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00"); //你 在 这 里 做 什 么 ？

	if (MIS_ShipIsFree == FALSE)
	{
		if ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01"); //你 们 不 能 上 这 艘 船 的 。 这 就 是 你 们 要 知 道 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02"); //我 们 是 这 里 的 守 卫 。 任 何 外 来 者 都 不 能 进 入 这 艘 船 。 你 们 也 不 例 外 ， 对 不 起 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03"); //浪 费 我 的 时 间 。 我 宁 愿 跟 我 的 兄 弟 们 呆 在 矿 藏 山 谷 。
	};

	AI_StopProcessInfos(self);
};
