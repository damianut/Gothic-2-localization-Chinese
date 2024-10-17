// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_MIL_6_EXIT_Condition;
	information		= DIA_MIL_6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MIL_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_MIL_6_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_MIL_6_JOIN_Condition;
	information		= DIA_MIL_6_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 怎 么 才 能 加 入 民 兵 ？";
};

func int DIA_MIL_6_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_JOIN_Info()
{
	AI_Output(other, self, "DIA_MIL_6_JOIN_15_00"); //我 要 怎 么 才 能 加 入 民 兵 ？
	AI_Output(self, other, "DIA_MIL_6_JOIN_06_01"); //去 找 安 德 烈 勋 爵 谈 谈 。 既 然 圣 骑 士 已 经 到 镇 上 来 了 ， 他 应 该 能 命 令 所 有 的 民 兵 。
	if (C_NpcIsInQuarter(self) != Q_KASERNE)
	{
		AI_Output(self, other, "DIA_MIL_6_JOIN_06_02"); //你 可 以 在 兵 营 找 到 他 。 他 几 乎 一 直 在 那 里 。
	};
};

// *************************************************************************
// 						MissingPeople
// *************************************************************************
instance DIA_Addon_MIL_6_MissingPeople(C_INFO)
{
	nr				= 2;
	condition		= DIA_Addon_MIL_6_MissingPeople_Condition;
	information		= DIA_Addon_MIL_6_MissingPeople_Info;
	permanent		= TRUE;
	description		= "我 听 说 有 些 市 民 失 踪 了 。";
};

func int DIA_Addon_MIL_6_MissingPeople_Condition()
{
	if ((Kapitel == 1)
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_MIL_6_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_MIL_6_MissingPeople_15_00"); //我 听 说 有 些 市 民 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_MIL_6_MissingPeople_06_01"); //实 际 上 ， 我 最 近 听 到 不 少 关 于 有 人 失 踪 的 传 言 。
	AI_Output(self, other, "DIA_Addon_MIL_6_MissingPeople_06_02"); //要 我 的 命 也 解 释 不 了 。
	AI_Output(self, other, "DIA_Addon_MIL_6_MissingPeople_06_03"); //但 是 我 们 只 能 睁 大 眼 睛 ， 并 尽 我 们 的 哨 兵 职 责 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_MIL_6_PEOPLE_Condition;
	information		= DIA_MIL_6_PEOPLE_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 这 些 圣 骑 士 的 事 。";
};

func int DIA_MIL_6_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_6_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_MIL_6_PEOPLE_15_00"); //告 诉 我 关 于 这 些 圣 骑 士 的 事 。
	AI_Output(self, other, "DIA_MIL_6_PEOPLE_06_01"); //自 从 圣 骑 士 到 达 克 霍 里 尼 斯 之 后 ， 他 们 就 退 到 内 城 的 尽 头 。
	AI_Output(self, other, "DIA_MIL_6_PEOPLE_06_02"); //他 们 不 让 任 何 人 去 那 里 。 当 然 除 了 镇 上 的 市 民 和 民 兵 。
	AI_Output(self, other, "DIA_MIL_6_PEOPLE_06_03"); //在 港 口 也 有 一 些 圣 骑 士 看 守 船 只 。 但 是 那 些 人 不 喜 欢 多 说 话 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_MIL_6_LOCATION_Condition;
	information		= DIA_MIL_6_LOCATION_Info;
	permanent		= TRUE;
	description		= "这 个 城 镇 有 什 么 事 要 了 解 ？";
};

func int DIA_MIL_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_LOCATION_Info()
{
	AI_Output(other, self, "DIA_MIL_6_LOCATION_15_00"); //这 个 城 镇 有 什 么 事 要 了 解 ？
	AI_Output(self, other, "DIA_MIL_6_LOCATION_06_01"); //圣 骑 士 现 在 已 经 控 制 了 整 个 城 市 。 所 有 的 民 兵 都 向 他 们 报 告 。
	AI_Output(self, other, "DIA_MIL_6_LOCATION_06_02"); //安 德 烈 勋 爵 是 民 兵 的 指 挥 官 - 同 时 ， 他 也 充 当 法 官 。
	AI_Output(self, other, "DIA_MIL_6_LOCATION_06_03"); //如 果 你 已 经 违 背 了 法 律 ， 你 应 该 去 他 那 里 请 求 裁 决 。
	AI_Output(self, other, "DIA_MIL_6_LOCATION_06_04"); //不 过 很 多 人 说 他 相 当 温 和 。 他 通 常 让 人 完 好 如 初 地 离 开 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_MIL_6_STANDARD_Condition;
	information		= DIA_MIL_6_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_MIL_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_6_STANDARD_Info()
{
	AI_Output(other, self, "DIA_MIL_6_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_01"); //近 来 越 来 越 多 的 暴 徒 拥 进 镇 里 。
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_02"); //盗 窃 行 为 正 在 增 加 ， 安 德 烈 勋 爵 认 为 这 是 团 伙 作 案 。
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_03"); //不 久 前 ， 我 们 把 整 个 海 港 地 区 翻 了 个 底 朝 天 ， 但 是 我 们 依 旧 什 么 都 没 找 到 。
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_04"); //看 来 我 们 现 在 已 经 或 多 或 少 控 制 了 海 盗 问 题 。 除 了 那 些 已 经 死 掉 的 以 外 ， 最 近 的 搜 捕 抓 住 了 所 有 其 它 的 人 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_05"); //随 着 那 些 流 氓 来 到 镇 上 ， 事 态 变 的 越 来 越 糟 。 昨 天 晚 上 ， 我 尾 随 一 个 穿 着 黑 袍 的 男 人 穿 过 镇 子 的 尽 头 。
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_06"); //我 肯 定 他 不 怀 好 意 。 但 是 当 我 跟 随 他 到 了 总 督 的 房 子 时 ， 他 就 那 么 消 失 了 。 那 是 一 个 奇 怪 的 人 … …
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_07"); //他 们 说 哈 根 勋 爵 雇 佣 了 雇 佣 兵 来 对 付 龙 。 我 无 所 谓 ， 我 才 不 会 自 己 去 和 龙 打 仗 呢 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_MIL_6_STANDARD_06_08"); //他 们 说 龙 已 经 被 消 灭 了 ！ 哈 根 勋 爵 正 在 集 合 他 的 部 队 把 矿 藏 山 谷 里 的 其 它 生 物 也 赶 出 去 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_MIL_6(var C_Npc slf)
{
	DIA_MIL_6_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_6_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_6_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_6_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_6_STANDARD.npc = Hlp_GetInstanceID(slf);
};
