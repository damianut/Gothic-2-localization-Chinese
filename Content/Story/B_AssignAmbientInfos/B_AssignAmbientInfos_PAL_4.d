// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_PAL_4_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_PAL_4_EXIT_Condition;
	information		= DIA_PAL_4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_PAL_4_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_PAL_4_JOIN_Condition;
	information		= DIA_PAL_4_JOIN_Info;
	permanent		= TRUE;
	description		= "我 怎 么 成 为 圣 骑 士 ？";
};

func int DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other, self, "DIA_PAL_4_JOIN_15_00"); //我 怎 么 成 为 圣 骑 士 ？
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_01"); //如 果 你 的 确 是 认 真 的 话 ， 那 你 应 该 为 圣 骑 士 服 务 。
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_02"); //去 兵 营 找 安 德 烈 勋 爵 谈 话 。 你 要 先 获 取 民 兵 的 许 可 。
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_03"); //也 许 你 会 找 到 机 会 ， 然 后 证 明 你 自 己 的 价 值 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_PAL_4_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_PAL_4_PEOPLE_Condition;
	information		= DIA_PAL_4_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人？";
};

func int DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_PAL_4_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人？
	AI_Output(self, other, "DIA_PAL_4_PEOPLE_04_01"); //哈 根 勋 爵 是 这 个 岛 上 所 有 军 队 的 总 司 令 。 而 且 当 我 们 在 这 里 的 时 候 ， 他 同 时 也 是 总 督 。
	AI_Output(self, other, "DIA_PAL_4_PEOPLE_04_02"); //不 过 他 非 常 忙 。 如 果 你 有 什 么 需 要 解 决 的 话 ， 去 兵 营 找 安 德 烈 勋 爵 谈 一 下。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_PAL_4_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_PAL_4_LOCATION_Condition;
	information		= DIA_PAL_4_LOCATION_Info;
	permanent		= TRUE;
	description		= "你 们 圣 骑 士 克 霍 里 尼 斯 这 里 做 什 么 ？";
};

func int DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other, self, "DIA_PAL_4_LOCATION_15_00"); //你 们 圣 骑 士 克 霍 里 尼 斯 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_PAL_4_LOCATION_04_01"); //我 不 能 告 诉 你 那 些 事 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_PAL_4_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_PAL_4_STANDARD_Condition;
	information		= DIA_PAL_4_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 ？";
};

func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other, self, "DIA_PAL_4_STANDARD_15_00"); //有 什 么 新 鲜 事 ？

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_PAL_4_STANDARD_04_01"); //既 然 我 们 知 道 要 对 付 的 是 龙 ， 我 们 的 指 挥 官 当 然 会 很 快 做 些 什 么 的 。
			}
			else
			{
				AI_Output(self, other, "DIA_PAL_4_STANDARD_04_02"); //我 们 还 没 收 到 任 何 矿 藏 山 谷 特 遣 队 的 消 息 。 这 太 令 人 担 忧 了 。
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output(self, other, "DIA_PAL_4_STANDARD_04_03"); //感 谢 英 诺 斯 ！ 龙 的 威 胁 已 经 消 除 了 。 现 在 我 们 只 要 解 决 那 些 兽 人 并 拿 到 矿 石 。
		};
	}
	else // KEIN Paladin
	{
		AI_Output(self, other, "DIA_PAL_4_STANDARD_04_04"); //我 没 时 间 为 城 市 里 的 这 些 流 言 分 心 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	DIA_PAL_4_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc = Hlp_GetInstanceID(slf);
};
