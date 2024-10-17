// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BAU_13_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BAU_13_EXIT_Condition;
	information		= DIA_BAU_13_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BAU_13_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_BAU_13_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_BAU_13_JOIN_Condition;
	information		= DIA_BAU_13_JOIN_Info;
	permanent		= TRUE;
	description		= "再 告 诉 我 一 些 关 于 那 些 雇 佣 兵 的 事 ！";
};

func int DIA_BAU_13_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_13_JOIN_Info()
{
	AI_Output(other, self, "DIA_BAU_13_JOIN_15_00"); //再 告 诉 我 一 些 关 于 那 些 雇 佣 兵 的 事 ！
	AI_Output(self, other, "DIA_BAU_13_JOIN_13_01"); //如 果 你 曾 经 与 他 们 有 矛 盾 ， 那 就 去 找 李 。 我 们 农 民 都 是 那 样 做 的 。 他 对 他 的 人 要 求 非 常 严 。
	AI_Output(self, other, "DIA_BAU_13_JOIN_13_02"); //如 果 他 们 有 人 不 礼 貌 ， 他 真 的 会 教 训 他 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_BAU_13_PEOPLE_Condition;
	information		= DIA_BAU_13_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 主 管 这 里 ？";
};

func int DIA_BAU_13_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_BAU_13_PEOPLE_15_00"); //谁 主 管 这 里 ？
	AI_Output(self, other, "DIA_BAU_13_PEOPLE_13_01"); //依 我 说 ， 是 雇 佣 兵 。 当 然 ， 欧 纳 尔 付 他 们 钱 ， 但 是 只 有 英 诺 斯 才 知 道 他 们 会 听 从 他 的 命 令 多 久 。
	AI_Output(self, other, "DIA_BAU_13_PEOPLE_13_02"); //如 果 雇 佣 兵 认 定 他 在 这 里 毫 无 用 处 的 话 ， 我 不 想 处 于 他 那 种 境 地 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_BAU_13_LOCATION_Condition;
	information		= DIA_BAU_13_LOCATION_Info;
	permanent		= TRUE;
	description		= "关 于 这 个 地 区 的 事 你 能 告 诉 我 什 么 ？";
};

func int DIA_BAU_13_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_LOCATION_Info()
{
	AI_Output(other, self, "DIA_BAU_13_LOCATION_15_00"); //关 于 这 个 地 区 的 事 你 能 告 诉 我 什 么 ？
	AI_Output(self, other, "DIA_BAU_13_LOCATION_13_01"); //这 里 有 三 个 农 场 。 欧 纳 尔 的 在 东 边 ， 塞 柯 布 的 在 北 边 山 谷 的 尽 头 。
	AI_Output(self, other, "DIA_BAU_13_LOCATION_13_02"); //西 南 方 有 一 条 路 通 向 高 处 的 平 原 ， 那 是 本 加 的 农 场 的 所 在 地 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_BAU_13_STANDARD_Condition;
	information		= DIA_BAU_13_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_BAU_13_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_13_STANDARD_Info()
{
	AI_Output(other, self, "DIA_BAU_13_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_BAU_13_STANDARD_13_01"); //来 自 城 市 的 部 队 不 再 抢 我 们 的 家 畜 和 庄 稼 。 因 为 我 们 可 以 自 保 ， 所 以 他 们 不 愿 意 玩 战 争 游 戏 ！
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_BAU_13_STANDARD_13_02"); //城 市 里 的 圣 骑 士 们 不 在 乎 我 们 农 民 的 性 命 。 如 果 兽 人 攻 击 的 话 ， 我 们 只 能 靠 自 己 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_BAU_13_STANDARD_13_03"); //龙 ！ 有 传 言 说 在 矿 藏 山 谷 里 面 有 龙 。 它 们 一 定 很 快 会 来 关 卡 的 ！
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_BAU_13_STANDARD_13_04"); //他 们 甚 至 说 有 一 些 来 自 山 区 的 强 盗 正 向 矿 藏 山 谷 前 进 。 那 对 我 来 说 太 危 险 了 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_BAU_13_STANDARD_13_05"); //等 税 赋 再 次 降 低 ， 并 且 我 们 的 工 作 能 收 到 相 应 的 报 酬 时 ， 我 们 会 再 次 和 城 市 进 行 交 易 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_BAU_13(var C_Npc slf)
{
	DIA_BAU_13_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_13_STANDARD.npc = Hlp_GetInstanceID(slf);
};
