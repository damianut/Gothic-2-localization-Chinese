// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_VLK_17_EXIT_Condition;
	information		= DIA_VLK_17_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_VLK_17_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_VLK_17_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_VLK_17_JOIN_Condition;
	information		= DIA_VLK_17_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 怎 么 做 才 能 成 为 这 个 城 镇 的 市 民 ？";
};

func int DIA_VLK_17_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_17_JOIN_Info()
{
	AI_Output(other, self, "DIA_VLK_17_JOIN_15_00"); //我 要 怎 么 做 才 能 成 为 这 个 城 镇 的 市 民 ？
	AI_Output(self, other, "DIA_VLK_17_JOIN_17_01"); //城 镇 的 贫 民 区 的 工 匠 大 师 们 在 克 霍 里 尼 斯 这 里 影 响 很 大 。 你 应 该 去 和 他 们 谈 谈 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_VLK_17_PEOPLE_Condition;
	information		= DIA_VLK_17_PEOPLE_Info;
	permanent		= TRUE;
	description		= "这 个 城 镇 最 出 名 的 人 是 谁 ？";
};

func int DIA_VLK_17_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_VLK_17_PEOPLE_15_00"); //这 个 城 镇 最 出 名 的 人 是 谁 ？
	AI_Output(self, other, "DIA_VLK_17_PEOPLE_17_01"); //自 从 圣 骑 士 来 到 这 里 之 后 ， 他 们 接 管 了 整 个 城 市 的 控 制 。
	AI_Output(self, other, "DIA_VLK_17_PEOPLE_17_02"); //安 德 烈 勋 爵 代 表 法 律 。 你 可 以 在 兵 营 找 到 他 。
	AI_Output(self, other, "DIA_VLK_17_PEOPLE_17_03"); //但 是 只 有 当 你 触 犯 了 法 律 ， 或 者 打 算 加 入 民 兵 的 时 候 才 需 要 去 见 他 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_VLK_17_LOCATION_Condition;
	information		= DIA_VLK_17_LOCATION_Info;
	permanent		= TRUE;
	description		= "在 克 霍 里 尼 斯 这 里 最 有 趣 的 地 方 是 哪 ？";
};

func int DIA_VLK_17_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_LOCATION_Info()
{
	AI_Output(other, self, "DIA_VLK_17_LOCATION_15_00"); //在 克 霍 里 尼 斯 这 里 最 有 趣 的 地 方 是 哪 ？
	AI_Output(self, other, "DIA_VLK_17_LOCATION_17_01"); //（ 大 笑 ） 也 许 你 最 好 去 问 其 它 人 。 如 果 你 想 要 找 乐 子 ， 那 就 去 海 港 吧 。
	AI_Output(self, other, "DIA_VLK_17_LOCATION_17_02"); //不 过 如 果 你 想 买 东 西 的 话 ， 去 东 门 的 市 场 那 里 ， 或 者 去 城 镇 的 贫 民 区 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_VLK_17_STANDARD_Condition;
	information		= DIA_VLK_17_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_VLK_17_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_17_STANDARD_Info()
{
	AI_Output(other, self, "DIA_VLK_17_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if ((Kapitel == 1)
	|| (Kapitel == 2))
	{
		AI_Output(self, other, "DIA_VLK_17_STANDARD_17_01"); //我 想 知 道 为 什 么 圣 骑 士 要 来 这 里 。 他 们 驻 扎 在 城 镇 大 厅 、 兵 营 和 港 口 ， 但 是 迄 今 为 止 ， 他 们 还 什 么 事 都 没 做 。
		AI_Output(self, other, "DIA_VLK_17_STANDARD_17_02"); //如 果 他 们 是 为 了 兽 人 或 者 强 盗 才 来 这 里 的 话 ， 他 们 应 该 很 早 之 前 就 开 始 做 些 什 么 。 一 定 有 其 它 的 原 因 … …
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_VLK_17_STANDARD_17_03"); //我 刚 知 道 圣 骑 士 为 什 么 来 这 里 。 全 是 为 了 矿 石 。 那 些 家 伙 最 好 能 保 护 我 们 的 城 市 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_VLK_17_STANDARD_17_04"); //我 希 望 那 些 关 于 龙 的 故 事 是 真 的 ， 那 样 哈 根 勋 爵 就 会 被 迫 做 点 什 么 。 他 不 能 就 那 样 把 我 们 丢 给 那 些 龙 。
	};

	if (Kapitel == 5)
	{
		AI_Output(self, other, "DIA_VLK_17_STANDARD_17_05"); //现 在 龙 死 了 ， 圣 骑 士 将 会 除 掉 剩 余 的 流 氓 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_VLK_17(var C_Npc slf)
{
	DIA_VLK_17_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_17_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_17_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_17_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_17_STANDARD.npc = Hlp_GetInstanceID(slf);
};
