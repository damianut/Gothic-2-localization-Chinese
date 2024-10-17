// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_OCVLK_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_OCVLK_1_EXIT_Condition;
	information		= DIA_OCVLK_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_OCVLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_OCVLK_1_PEOPLE_Condition;
	information		= DIA_OCVLK_1_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 的 负 责 人 ？";
};

func int DIA_OCVLK_1_PEOPLE_Condition()
{
	if ((Kapitel <= 4)
	&& (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_OCVLK_1_PEOPLE_15_00"); //谁 是 这 里 的 负 责 人 ？
	AI_Output(self, other, "DIA_OCVLK_1_PEOPLE_01_01"); //指 挥 官 加 隆 德 。 但 是 自 从 这 里 的 情 况 变 得 更 糟 时 ， 就 从 没 在 王 座 室 之 外 的 地 方 见 到 过 他 。 我 担 心 会 有 一 个 坏 结 局 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_OCVLK_1_LOCATION_Condition;
	information		= DIA_OCVLK_1_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 矿 藏 山 谷 你 知 道 些 什 么 ？";
};

func int DIA_OCVLK_1_LOCATION_Condition()
{
	if ((Kapitel <= 4)
	&& (MIS_KilledDragons < 4))
	{
		return TRUE;
	};
};

func void DIA_OCVLK_1_LOCATION_Info()
{
	AI_Output(other, self, "DIA_OCVLK_1_LOCATION_15_00"); //关 于 矿 藏 山 谷 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_OCVLK_1_LOCATION_01_01"); //据 我 所 知 ， 我 们 还 有 一 些 小 伙 子 还 在 矿 井 里 进 行 勘 探 。
	AI_Output(self, other, "DIA_OCVLK_1_LOCATION_01_02"); //我 不 想 和 他 们 打 交 道 。 整 个 山 谷 遍 布 兽 人 ， 更 不 用 说 龙 了 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_OCVLK_1_STANDARD_Condition;
	information		= DIA_OCVLK_1_STANDARD_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_OCVLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_OCVLK_1_STANDARD_Info()
{
	AI_Output(other, self, "DIA_OCVLK_1_STANDARD_15_00"); //最 近 怎 么 样 ？

	if (Kapitel <= 3)
	{
		AI_Output(self, other, "DIA_OCVLK_1_STANDARD_01_01"); //兽 人 们 想 把 我 们 赶 到 哪 里 就 赶 到 哪 里 ！ 没 有 援 军 的 话 ， 我 们 谁 都 活 不 了 ！ 我 很 惊 讶 的 是 ， 龙 到 现 在 还 没 有 把 我 们 全 部 消 灭 。！
	};

	if (Kapitel == 4)
	{
		if (MIS_KilledDragons < 4)
		{
			AI_Output(self, other, "DIA_OCVLK_1_STANDARD_01_02"); //至 少 我 们 终 于 等 来 了 一 些 援 军 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCVLK_1_STANDARD_01_03"); //我 听 说 所 有 的 龙 都 被 杀 死 了 ？ 感 谢 英 诺 斯 ！
		};
	};

	if (Kapitel >= 5)
	{
		if (MIS_OCGateOpen == FALSE)
		{
			AI_Output(self, other, "DIA_OCVLK_1_STANDARD_01_04"); //这 些 该 死 的 矿 石 。 我 们 应 该 把 全 部 的 矿 石 都 从 城 墙 上 扔 下 去 。 也 许 那 样 兽 人 就 会 安 静 地 离 开 。
		}
		else
		{
			AI_Output(self, other, "DIA_OCVLK_1_STANDARD_01_05"); //他 们 堆 在 入 口 前 的 那 些 可 笑 箱 子 根 本 无 法 阻 挡 兽 人 ！
		};
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_OCVLK_1(var C_Npc slf)
{
	DIA_OCVLK_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_OCVLK_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
