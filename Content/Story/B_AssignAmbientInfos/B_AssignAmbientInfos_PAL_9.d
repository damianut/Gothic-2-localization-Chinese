// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_PAL_9_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_PAL_9_EXIT_Condition;
	information		= DIA_PAL_9_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_9_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_PAL_9_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_PAL_9_JOIN_Condition;
	information		= DIA_PAL_9_JOIN_Info;
	permanent		= TRUE;
	description		= "我 怎 么 才 能 成 为 圣 骑 士 ？";
};

func int DIA_PAL_9_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_JOIN_Info()
{
	AI_Output(other, self, "DIA_PAL_9_JOIN_15_00"); //我 怎 么 才 能 成 为 圣 骑 士 ？
	AI_Output(self, other, "DIA_PAL_9_JOIN_09_01"); //那 些 证 明 自 己 值 得 为 英 诺 斯 和 国 王 服 务 的 人 将 被 选 中 ！
	AI_Output(self, other, "DIA_PAL_9_JOIN_09_02"); //简 单 地 说 吧 ： 只 有 最 好 的 才 会 被 选 中 。 不 过 你 还 差 的 远 呢 ， 小 伙 子 ！
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_PAL_9_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_PAL_9_PEOPLE_Condition;
	information		= DIA_PAL_9_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人？";
};

func int DIA_PAL_9_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_PAL_9_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人？
	AI_Output(self, other, "DIA_PAL_9_PEOPLE_09_01"); //哈 根 勋 爵 。
	AI_Output(other, self, "DIA_PAL_9_PEOPLE_15_02"); //还 有 吗 ？
	AI_Output(self, other, "DIA_PAL_9_PEOPLE_09_03"); //哈 根 勋 爵 是 整 个 岛 上 独 一 无 二 的 最 高 指 挥 官 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_PAL_9_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_PAL_9_LOCATION_Condition;
	information		= DIA_PAL_9_LOCATION_Info;
	permanent		= TRUE;
	description		= "你 们 圣 骑 士 为 什 么 来 克 霍 里 尼 斯 ？";
};

func int DIA_PAL_9_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_9_LOCATION_Info()
{
	AI_Output(other, self, "DIA_PAL_9_LOCATION_15_00"); //你 们 圣 骑 士 为 什 么 来 克 霍 里 尼 斯 ？
	AI_Output(self, other, "DIA_PAL_9_LOCATION_09_01"); //那 不 关 你 的 事 ， 朋 友 ！ 你 知 道 我 们 是 为 英 诺 斯 和 国 王 服 务 的 就 足 够 了 ！
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_PAL_9_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_PAL_9_STANDARD_Condition;
	information		= DIA_PAL_9_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_PAL_9_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_9_STANDARD_Info()
{
	AI_Output(other, self, "DIA_PAL_9_STANDARD_15_00"); //有 什 么 新 鲜 事 吗 ？

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_PAL_9_STANDARD_09_01"); //既 然 我 们 知 道 要 对 付 的 是 龙 ， 我 们 的 指 挥 官 当 然 会 很 快 做 些 什 么 的 。
			}
			else
			{
				AI_Output(self, other, "DIA_PAL_9_STANDARD_09_02"); //我 们 还 没 收 到 任 何 矿 藏 山 谷 特 遣 队 的 消 息 。 这 太 令 人 担 忧 了 。
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output(self, other, "DIA_PAL_9_STANDARD_09_03"); //感 谢 英 诺 斯 ！ 龙 的 威 胁 已 经 消 除 了 。 现 在 我 们 只 要 解 决 那 些 兽 人 并 拿 到 矿 石 。
		};
	}
	else // KEIN Paladin
	{
		AI_Output(self, other, "DIA_PAL_9_STANDARD_09_04"); //如 果 你 没 有 其 它 事 情 要 说 的 话 ， 那 就 走 开 ， 无 知 的 家 伙 ！
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_PAL_9(var C_Npc slf)
{
	DIA_PAL_9_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_9_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_9_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_9_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_9_STANDARD.npc = Hlp_GetInstanceID(slf);
};
