// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_VLK_1_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_VLK_1_EXIT_Condition;
	information		= DIA_VLK_1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_VLK_1_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_VLK_1_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_VLK_1_JOIN_Condition;
	information		= DIA_VLK_1_JOIN_Info;
	permanent		= TRUE;
	description		= "我 怎 么 成 为 这 个 城 镇 的 市 民 ？";
};

func int DIA_VLK_1_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_1_JOIN_Info()
{
	AI_Output(other, self, "DIA_VLK_1_JOIN_15_00"); //我 怎 么 成 为 这 个 城 镇 的 市 民 ？
	AI_Output(self, other, "DIA_VLK_1_JOIN_01_01"); //去 找 一 件 体 面 的 工 作 ！ 每 个 能 在 克 霍 里 尼 斯 工 作 的 人 都 会 被 看 作 这 里 的 市 民 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_VLK_1_PEOPLE_Condition;
	information		= DIA_VLK_1_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 最 出 名 的 人 ？";
};

func int DIA_VLK_1_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_VLK_1_PEOPLE_15_00"); //谁 是 这 里 最 出 名 的 人 ？
	AI_Output(self, other, "DIA_VLK_1_PEOPLE_01_01"); //（ 大 笑 ） 到 最 近 为 止 ， 还 是 总 督 和 法 官 。 不 过 后 来 圣 骑 士 来 了 ， 并 接 管 了 城 市 。
	AI_Output(self, other, "DIA_VLK_1_PEOPLE_01_02"); //哈 根 勋 爵 是 他 们 的 首 领 。 他 也 是 新 的 总 督 ， 差 不 多 吧 。
	AI_Output(self, other, "DIA_VLK_1_PEOPLE_01_03"); //安 德 烈 勋 爵 是 他 的 亲 信 。 他 领 导 城 市 卫 兵 ， 同 时 充 当 法 官 。
	AI_Output(self, other, "DIA_VLK_1_PEOPLE_01_04"); //城 市 中 任 何 有 罪 的 人 都 必 须 向 他 申 报 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_VLK_1_LOCATION_Condition;
	information		= DIA_VLK_1_LOCATION_Info;
	permanent		= TRUE;
	description		= "这 个 城 镇 有 什 么 有 趣 的 事 ？";
};

func int DIA_VLK_1_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_LOCATION_Info()
{
	AI_Output(other, self, "DIA_VLK_1_LOCATION_15_00"); //这 个 城 镇 有 什 么 有 趣 的 事 ？
	AI_Output(self, other, "DIA_VLK_1_LOCATION_01_01"); //你 几 乎 可 以 在 这 里 买 到 任 何 你 能 想 象 到 的 东 西 ， 在 市 场 的 商 人 那 里 ， 或 者 在 城 市 的 贫 民 区 里 。
	AI_Output(self, other, "DIA_VLK_1_LOCATION_01_02"); //不 过 几 乎 所 有 你 能 买 到 的 东 西 都 很 贵 。
	AI_Output(self, other, "DIA_VLK_1_LOCATION_01_03"); //如 果 你 没 有 足 够 的 钱 的 话 ， 那 么 也 许 放 债 者 雷 玛 尔 能 帮 助 你 。 他 的 房 子 在 你 从 城 镇 的 贫 民 区 进 入 海 港 地 区 后 的 最 开 始 的 地 方 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_VLK_1_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_VLK_1_STANDARD_Condition;
	information		= DIA_VLK_1_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_VLK_1_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_1_STANDARD_Info()
{
	AI_Output(other, self, "DIA_VLK_1_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_VLK_1_STANDARD_01_01"); //自 从 屏 障 崩 溃 之 后 ， 与 大 农 场 主 之 间 的 自 由 交 易 戛 然 而 止 。 谁 知 道 他 的 计 划 是 什 么 ， 一 定 正 在 进 行 某 些 可 疑 的 行 动 。
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_VLK_1_STANDARD_01_02"); //欧 纳 尔 做 得 太 过 火 了 。 他 还 不 肯 向 城 市 供 应 粮 食 。 如 果 民 兵 不 尽 快 干 预 的 话 ， 其 它 农 场 主 很 快 也 会 为 所 欲 为 的 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_VLK_1_STANDARD_01_03"); //我 听 说 已 经 有 魔 法 师 加 入 了 强 盗 一 伙 ， 那 些 穿 着 黑 袍 的 、 强 大 的 黑 魔 法 师 。 我 可 以 发 誓 ， 我 昨 天 晚 上 在 城 市 里 看 到 了 其 中 一 个 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_VLK_1_STANDARD_01_04"); //我 听 说 欧 纳 尔 的 一 些 雇 佣 兵 已 经 出 发 去 杀 龙 。 现 在 他 们 终 于 要 去 做 一 些 有 用 的 事 了 ！
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_VLK_1_STANDARD_01_05"); //他 们 说 龙 已 经 被 打 败 了 ！ 哈 根 勋 爵 正 在 集 合 他 的 人 ， 要 把 其 余 的 生 物 赶 出 矿 藏 山 谷 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_VLK_1(var C_Npc slf)
{
	DIA_VLK_1_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_1_STANDARD.npc = Hlp_GetInstanceID(slf);
};
