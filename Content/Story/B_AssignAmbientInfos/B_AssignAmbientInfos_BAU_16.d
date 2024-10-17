// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BAU_16_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BAU_16_EXIT_Condition;
	information		= DIA_BAU_16_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_BAU_16_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_BAU_16_JOIN_Condition;
	information		= DIA_BAU_16_JOIN_Info;
	permanent		= TRUE;
	description		= "再 告 诉 我 一 些 关 于 那 些 雇 佣 兵 的 事 ！";
};

func int DIA_BAU_16_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other, self, "DIA_BAU_16_JOIN_15_00"); //再 告 诉 我 一 些 关 于 那 些 雇 佣 兵 的 事 ！
	AI_Output(self, other, "DIA_BAU_16_JOIN_16_01"); //他 们 整 天 在 农 场 附 近 游 荡 ， 偶 尔 互 相 攻 击 ， 还 以 为 自 己 是 猫 头 鹰 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_BAU_16_PEOPLE_Condition;
	information		= DIA_BAU_16_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_BAU_16_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_BAU_16_PEOPLE_16_01"); //依 我 说 ， 是 雇 佣 兵 。
	AI_Output(self, other, "DIA_BAU_16_PEOPLE_16_02"); //欧 纳 尔 付 他 们 钱 ， 但 是 他 们 大 多 数 人 想 做 什 么 就 做 什 么 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_BAU_16_LOCATION_Condition;
	information		= DIA_BAU_16_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 地 区 的 事 你 能 告 诉 我 什 么 ？";
};

func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other, self, "DIA_BAU_16_LOCATION_15_00"); //关 于 这 个 地 区 的 事 你 能 告 诉 我 什 么 ？
	AI_Output(self, other, "DIA_BAU_16_LOCATION_16_01"); //这 里 有 三 个 农 场 。 欧 纳 尔 的 在 东 边 ， 塞 柯 布 的 在 北 边 山 谷 的 尽 头 。
	AI_Output(self, other, "DIA_BAU_16_LOCATION_16_02"); //西 南 方 有 一 条 路 通 向 高 处 的 平 原 ， 那 是 本 加 的 农 场 的 所 在 地 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_BAU_16_STANDARD_Condition;
	information		= DIA_BAU_16_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other, self, "DIA_BAU_16_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_01"); //来 自 城 市 的 部 队 不 再 抢 我 们 的 家 畜 和 庄 稼 。 我 们 不 再 玩 战 争 游 戏 ， 我 们 现 在 能 够 自 保 ！
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_02"); //他 们 说 军 队 正 在 矿 藏 山 谷 里 集 合 。 他 们 很 快 就 会 到 这 里 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_03"); //我 听 到 谣 传 说 在 矿 藏 山 谷 里 有 龙 。 我 真 不 敢 相 信 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_04"); //有 些 雇 佣 兵 已 经 离 开 了 。 我 不 知 道 那 是 好 事 还 是 坏 事 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_05"); //派 圣 骑 士 去 矿 藏 山 谷 - 那 是 为 了 什 么 ？
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	DIA_BAU_16_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc = Hlp_GetInstanceID(slf);
};
