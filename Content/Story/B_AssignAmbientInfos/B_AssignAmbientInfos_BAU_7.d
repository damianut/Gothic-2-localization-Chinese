// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BAU_7_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BAU_7_EXIT_Condition;
	information		= DIA_BAU_7_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BAU_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_BAU_7_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_BAU_7_JOIN_Condition;
	information		= DIA_BAU_7_JOIN_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 雇 佣 兵 你 都 知 道 什 么 ？";
};

func int DIA_BAU_7_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_7_JOIN_Info()
{
	AI_Output(other, self, "DIA_BAU_7_JOIN_15_00"); //关 于 那 些 雇 佣 兵 你 都 知 道 什 么 ？
	AI_Output(self, other, "DIA_BAU_7_JOIN_07_01"); //欧 纳 尔 雇 他 们 来 保 护 他 的 农 场 。
	AI_Output(self, other, "DIA_BAU_7_JOIN_07_02"); //他 们 大 多 数 人 的 行 为 就 象 农 场 属 于 他 们 一 样 。 不 过 无 论 如 何 ， 他 们 保 护 我 们 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_BAU_7_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_BAU_7_PEOPLE_Condition;
	information		= DIA_BAU_7_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_BAU_7_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_BAU_7_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_BAU_7_PEOPLE_07_01"); //大 农 场 属 于 欧 纳 尔 ， 周 围 的 小 农 场 也 是 ， 不 过 他 把 它 们 租 出 去 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_BAU_7_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_BAU_7_LOCATION_Condition;
	information		= DIA_BAU_7_LOCATION_Info;
	permanent		= TRUE;
	description		= "再 告 诉 我 一 些 关 于 这 个 地 区 的 事 。";
};

func int DIA_BAU_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_LOCATION_Info()
{
	AI_Output(other, self, "DIA_BAU_7_LOCATION_15_00"); //再 告 诉 我 一 些 关 于 这 个 地 区 的 事 。
	AI_Output(self, other, "DIA_BAU_7_LOCATION_07_01"); //山 谷 东 边 的 那 个 大 农 场 是 欧 纳 尔 的 。 塞 柯 布 的 农 场 坐 落 在 北 边 。
	AI_Output(self, other, "DIA_BAU_7_LOCATION_07_02"); //本 加 的 农 场 在 西 南 边 的 高 原 上 。 你 能 从 山 谷 到 达 那 里 - 有 一 个 巨 大 的 石 头 台 阶 通 向 那 里 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_BAU_7_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_BAU_7_STANDARD_Condition;
	information		= DIA_BAU_7_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_BAU_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_7_STANDARD_Info()
{
	AI_Output(other, self, "DIA_BAU_7_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_BAU_7_STANDARD_07_01"); //我 们 已 经 宣 布 了 独 立 - 我 们 不 再 向 城 市 交 付 税 金 。 国 王 没 有 对 我 们 做 出 任 何 举 动 - 我 们 已 经 无 法 再 忍 受 了 ！
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_BAU_7_STANDARD_07_02"); //现 在 ， 这 里 没 有 出 现 太 多 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_BAU_7_STANDARD_07_03"); //你 现 在 听 到 龙 的 故 事 了 ！ 国 王 总 是 想 出 一 些 新 的 东 西 来 从 人 民 手 里 压 榨 更 多 的 钱 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_BAU_7_STANDARD_07_04"); //照 料 好 自 己 吧 ， 非 常 多 的 黑 暗 的 影 子 和 野 生 动 物 正 穿 过 关 卡 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_BAU_7_STANDARD_07_05"); //现 在 龙 已 经 死 了 ， 圣 骑 士 勋 爵 不 屑 于 在 城 市 中 露 面 。 这 里 的 秩 序 将 再 次 获 胜 了 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_BAU_7(var C_Npc slf)
{
	DIA_BAU_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};
