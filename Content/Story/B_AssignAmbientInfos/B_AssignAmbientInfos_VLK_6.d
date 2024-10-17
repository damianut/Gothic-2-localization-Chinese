// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_VLK_6_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_VLK_6_EXIT_Condition;
	information		= DIA_VLK_6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_VLK_6_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_VLK_6_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_VLK_6_JOIN_Condition;
	information		= DIA_VLK_6_JOIN_Info;
	permanent		= TRUE;
	description		= "成 为 这 个 城 镇 的 市 民 可 以 在 这 里 做 什 么 ？";
};

func int DIA_VLK_6_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6_JOIN_Info()
{
	AI_Output(other, self, "DIA_VLK_6_JOIN_15_00"); //成 为 这 个 城 镇 的 市 民 可 以 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_VLK_6_JOIN_06_01"); //你 想 要 在 这 里 定 居 ？ 现 在 ？ 在 所 有 的 迹 象 表 明 世 界 将 要 毁 灭 的 时 候 ？
	AI_Output(other, self, "DIA_VLK_6_JOIN_15_02"); //我 没 打 算 一 直 留 在 这 里 。
	AI_Output(self, other, "DIA_VLK_6_JOIN_06_03"); //嗯 ， 如 果 你 想 要 听 我 的 建 议 的 话 ， 你 应 该 十 万 火 急 地 离 开 这 里 ， 趁 着 你 还 能 够 。 但 是 如 果 你 坚 持 的 话 ， 你 应 该 同 这 里 那 些 有 影 响 力 的 市 民 谈 谈 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_VLK_6_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_VLK_6_PEOPLE_Condition;
	information		= DIA_VLK_6_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 克 霍 里 尼 斯 最 有 影 响 力 的 市 民 ？";
};

func int DIA_VLK_6_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_VLK_6_PEOPLE_15_00"); //谁 是 克 霍 里 尼 斯 最 有 影 响 力 的 市 民 ？
	AI_Output(self, other, "DIA_VLK_6_PEOPLE_06_01"); //试 试 去 找 城 镇 的 贫 民 区 的 铁 匠 和 木 匠 。 你 也 能 在 那 里 找 到 其 它 倍 受 尊 敬 的 大 师 。
	AI_Output(self, other, "DIA_VLK_6_PEOPLE_06_02"); //如 果 这 里 除 了 城 市 卫 兵 和 圣 骑 士 还 有 谁 能 说 的 上 话 ， 那 就 是 这 些 人 了 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_VLK_6_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_VLK_6_LOCATION_Condition;
	information		= DIA_VLK_6_LOCATION_Info;
	permanent		= TRUE;
	description		= "我 要 怎 么 才 能 适 应 这 座 城 市 ？";
};

func int DIA_VLK_6_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_LOCATION_Info()
{
	AI_Output(other, self, "DIA_VLK_6_LOCATION_15_00"); //我 要 怎 么 才 能 适 应 这 座 城 市 ？
	AI_Output(self, other, "DIA_VLK_6_LOCATION_06_01"); //在 这 周 围 找 路 并 非 那 么 简 单 ， 是 吗 ？ 即 使 路 牌 也 不 是 总 能 帮 得 上 忙 。
	AI_Output(self, other, "DIA_VLK_6_LOCATION_06_02"); //如 果 你 的 方 向 感 很 差 ， 那 你 最 好 先 去 港 口 - 假 设 你 能 找 到 去 那 里 的 路 - 并 找 到 制 图 师 的 房 子 。
	AI_Output(self, other, "DIA_VLK_6_LOCATION_06_03"); //它 就 在 酒 吧 旁 边 ， 在 码 头 那 里 。 布 莱 希 姆 一 定 会 给 你 这 个 城 市 的 地 图 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_VLK_6_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_VLK_6_STANDARD_Condition;
	information		= DIA_VLK_6_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_VLK_6_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_6_STANDARD_Info()
{
	AI_Output(other, self, "DIA_VLK_6_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_VLK_6_STANDARD_06_01"); //自 从 他 们 消 除 了 屏 障 ， 这 座 城 市 就 充 斥 着 强 盗 。 但 是 圣 骑 士 什 么 也 不 做 。 那 么 他 们 究 竟 来 这 里 做 什 么 ？
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_VLK_6_STANDARD_06_02"); //最 近 ， 强 盗 问 题 不 那 么 严 重 了 。 看 来 终 于 有 人 开 始 做 事 了 。
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_VLK_6_STANDARD_06_03"); //他 们 放 了 那 个 谋 杀 了 圣 骑 士 的 卑 劣 的 雇 佣 兵 。 即 便 绞 死 他 也 不 是 什 么 坏 主 意 。
		}
		else
		{
			AI_Output(self, other, "DIA_VLK_6_STANDARD_06_04"); //他 们 说 某 个 欧 纳 尔 的 雇 佣 兵 谋 杀 了 一 名 圣 骑 士 。 他 们 已 经 抓 住 了 那 个 家 伙 ， 并 把 他 关 进 了 监 狱 。 很 快 他 就 会 被 绞 死 。
		};
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_VLK_6_STANDARD_06_05"); //我 想 知 道 那 些 关 于 龙 的 故 事 是 否 有 什 么. . .
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_VLK_6_STANDARD_06_06"); //他 们 说 哈 根 勋 爵 正 在 集 合 他 的 人 准 备 解 放 矿 藏 山 谷 。 事 态 终 于 变 化 了 ！
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_VLK_6(var C_Npc slf)
{
	DIA_VLK_6_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_6_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_6_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_6_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_6_STANDARD.npc = Hlp_GetInstanceID(slf);
};
