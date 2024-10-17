// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BAU_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BAU_1_EXIT_Condition;
	information		= DIA_BAU_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BAU_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_BAU_1_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_BAU_1_JOIN_Condition;
	information		= DIA_BAU_1_JOIN_Info;
	permanent		= TRUE;
	description		= "再 和 我 说 说 那 些 雇 佣 兵 。";
};

func int DIA_BAU_1_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_1_JOIN_Info()
{
	AI_Output(other, self, "DIA_BAU_1_JOIN_15_00"); //再 和 我 说 说 那 些 雇 佣 兵 。
	AI_Output(self, other, "DIA_BAU_1_JOIN_01_01"); //我 只 能 建 议 你 和 他 们 保 持 安 全 距 离 。
	AI_Output(self, other, "DIA_BAU_1_JOIN_01_02"); //如 果 他 们 有 人 不 喜 欢 你 的 脸 ， 他 会 马 上 一 拳 打 中 你 的 鼻 子 。
	AI_Output(self, other, "DIA_BAU_1_JOIN_01_03"); //你 可 以 去 向 李 抱 怨 ， 但 是 你 的 鼻 子 还 是 破 了 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_BAU_1_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_BAU_1_PEOPLE_Condition;
	information		= DIA_BAU_1_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_BAU_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_BAU_1_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_BAU_1_PEOPLE_01_01"); //这 是 欧 纳 尔 的 农 场 。 附 近 所 有 的 事 都 要 他 来 决 定 。
	AI_Output(self, other, "DIA_BAU_1_PEOPLE_01_02"); //让 我 给 你 一 个 提 示 ： 不 要 向 他 的 雇 佣 兵 挑 战 。 那 些 小 子 们 可 不 是 闹 着 玩 的 。
	AI_Output(self, other, "DIA_BAU_1_PEOPLE_01_03"); //席 尔 维 欧 尤 其 是 个 卑 劣 的 流 氓 。 不 过 他 们 的 首 领 ， 李 ， 是 个 不 错 的 人 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_BAU_1_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_BAU_1_LOCATION_Condition;
	information		= DIA_BAU_1_LOCATION_Info;
	permanent		= TRUE;
	description		= "那 么 在 这 个 区 域 里 有 什 么 ？";
};

func int DIA_BAU_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_LOCATION_Info()
{
	AI_Output(other, self, "DIA_BAU_1_LOCATION_15_00"); //那 么 在 这 个 区 域 里 有 什 么 ？
	AI_Output(self, other, "DIA_BAU_1_LOCATION_01_01"); //只 是 原 野 和 农 场 。 还 有 一 群 雇 佣 兵 。 但 是 他 们 几 乎 都 在 欧 纳 尔 农 场 的 东 边 。
	AI_Output(self, other, "DIA_BAU_1_LOCATION_01_02"); //北 边 是 塞 柯 布 的 农 场 ， 不 过 他 们 只 有 收 租 才 去 那 里 。
	AI_Output(self, other, "DIA_BAU_1_LOCATION_01_03"); //西 南 是 通 向 本 加 的 农 场 的 路 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_BAU_1_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_BAU_1_STANDARD_Condition;
	information		= DIA_BAU_1_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_BAU_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_1_STANDARD_Info()
{
	AI_Output(other, self, "DIA_BAU_1_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_BAU_1_STANDARD_01_01"); //欧 纳 尔 雇 了 一 些 雇 佣 兵 来 防 止 来 自 城 市 的 民 兵 抄 他 的 后 路 。 否 则 ， 他 们 甚 至 会 拿 走 我 们 最 后 一 头 绵 羊 ！
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_BAU_1_STANDARD_01_02"); //不 算 多 。 一 直 都 是 同 样 的 问 题 - 民 兵 、 兽 人 和 旷 野 袭 击 者 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_BAU_1_STANDARD_01_03"); //这 里 发 生 了 一 些 奇 怪 的 事 情 。 几 天 前 的 夜 里 ， 我 看 到 一 个 黑 影 。 不 是 人 类 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_BAU_1_STANDARD_01_04"); //你 会 见 到 越 来 越 多 的 兽 人 。 有 时 候 我 想 ， 可 能 每 死 一 个 兽 人 ， 就 会 来 出 现 两 个 兽 人 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_BAU_1_STANDARD_01_05"); //圣 骑 士 正 在 进 入 矿 藏 山 谷 。 这 是 为 什 么 ？ 没 有 留 下 任 何 人 来 控 制 民 兵 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_BAU_1(var C_Npc slf)
{
	DIA_BAU_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_1_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_1_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_1_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
