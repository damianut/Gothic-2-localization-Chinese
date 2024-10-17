// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_MIL_7_EXIT_Condition;
	information		= DIA_MIL_7_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MIL_7_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_MIL_7_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_MIL_7_JOIN_Condition;
	information		= DIA_MIL_7_JOIN_Info;
	permanent		= TRUE;
	description		= "我 要 加 入 民 兵 ！";
};

func int DIA_MIL_7_JOIN_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_JOIN_Info()
{
	AI_Output(other, self, "DIA_MIL_7_JOIN_15_00"); //我 要 加 入 民 兵 ！
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output(self, other, "DIA_MIL_7_JOIN_07_01"); //你 甚 至 连 克 霍 里 尼 斯 的 市 民 都 不 是 ！ 你 凭 什 么 认 为 安 德 烈 勋 爵 应 该 接 纳 你 ？
		AI_Output(self, other, "DIA_MIL_7_JOIN_07_02"); //每 个 人 都 想 来 - 领 一 件 武 器 ， 拿 一 套 盔 甲 ， 然 后 带 着 它 们 消 失 ！

		if (C_NpcIsInQuarter(self) != Q_KASERNE)
		{
			AI_Output(other, self, "DIA_MIL_7_JOIN_15_03"); //但 我 是 认 真 的 ！
			AI_Output(self, other, "DIA_MIL_7_JOIN_07_04"); //不 用 向 我 解 释 ， 向 安 德 烈 勋 爵 说 吧 。 你 可 以 在 兵 营 找 到 他 。
		};
	}
	else
	{
		B_Say(self, other, "$ABS_GOOD");
	};
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_MIL_7_PEOPLE_Condition;
	information		= DIA_MIL_7_PEOPLE_Info;
	permanent		= TRUE;
	description		= "关 于 圣 骑 士 你 都 知 道 些 什 么 ？";
};

func int DIA_MIL_7_PEOPLE_Condition()
{
	if (hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_MIL_7_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_MIL_7_PEOPLE_15_00"); //关 于 圣 骑 士 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_MIL_7_PEOPLE_07_01"); //不 多 。 没 人 知 道 他 们 为 什 么 在 这 里 。 即 使 我 们 城 市 卫 兵 的 人 也 不 知 道 。
	AI_Output(self, other, "DIA_MIL_7_PEOPLE_07_02"); //他 们 已 经 控 制 了 城 市 ， 把 总 督 从 议 会 房 间 中 赶 走 ， 把 法 官 赶 出 他 的 办 公 室 。
	AI_Output(self, other, "DIA_MIL_7_PEOPLE_07_03"); //依 我 说 ， 我 说 那 是 好 事 。 那 些 浮 夸 的 混 蛋 们 急 需 上 一 堂 谦 虚 的 课 程 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_MIL_7_LOCATION_Condition;
	information		= DIA_MIL_7_LOCATION_Info;
	permanent		= TRUE;
	description		= "我 在 这 个 城 镇 有 什 么 特 权 ？";
};

func int DIA_MIL_7_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_LOCATION_Info()
{
	AI_Output(other, self, "DIA_MIL_7_LOCATION_15_00"); //我 在 这 个 城 镇 有 什 么 特 权 ？
	AI_Output(self, other, "DIA_MIL_7_LOCATION_07_01"); //如 果 你 不 想 死 在 海 港 地 区 的 贫 民 区 里 ， 就 去 找 一 件 工 作 。 在 城 镇 的 贫 民 区 四 处 打 听 一 下 - 也 许 你 会 很 幸 运 。
	AI_Output(self, other, "DIA_MIL_7_LOCATION_07_02"); //如 果 你 打 算 在 整 个 城 里 多 待 一 阵 时 间 ， 你 应 该 加 入 民 兵 ， 或 者 至 少 进 行 一 下 战 斗 训 练 。
	AI_Output(self, other, "DIA_MIL_7_LOCATION_07_03"); //兵 营 里 的 战 斗 教 员 也 训 练 平 民 。
	AI_Output(self, other, "DIA_MIL_7_LOCATION_07_04"); //兽 人 很 快 就 会 来 ， 那 时 你 就 会 为 你 在 训 练 场 付 出 的 每 一 个 小 时 而 感 到 高 兴 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_MIL_7_STANDARD_Condition;
	information		= DIA_MIL_7_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_MIL_7_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_MIL_7_STANDARD_Info()
{
	AI_Output(other, self, "DIA_MIL_7_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		var int randy;
		randy = Hlp_Random(2);
		if (randy == 0)
		{
			AI_Output(self, other, "DIA_Addon_MIL_7_STANDARD_07_00"); //市 民 们 从 这 里 一 个 接 一 个 的 失 踪 了 。 到 目 前 为 止 ， 我 们 还 没 有 查 明 他 们 发 生 了 什 么 事 。 难 道 是 兽 人 ？

			if (SC_HearedAboutMissingPeople == FALSE)
			{
				Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
				Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
				B_LogEntry(TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl);
			};

			SC_HearedAboutMissingPeople = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_MIL_7_STANDARD_07_01"); //他 们 说 农 民 们 已 经 叛 乱 了 。 当 我 们 在 与 兽 人 作 战 的 时 候 ， 我 们 不 需 要 他 们 那 样 的 废 物 ！
		};
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_MIL_7_STANDARD_07_02"); //到 了 圣 骑 士 结 束 农 民 叛 乱 的 时 候 了 。 破 坏 法 律 的 人 必 须 受 到 惩 罚 。 尤 其 是 现 在 ， 当 我 们 处 于 战 争 中 时 。
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_MIL_7_STANDARD_07_03"); //那 个 被 指 控 谋 杀 洛 萨 的 雇 佣 兵 可 能 是 无 辜 的 。 有 人 找 到 了 证 据 ， 他 可 能 被 陷 害 了 。
		}
		else
		{
			AI_Output(self, other, "DIA_MIL_7_STANDARD_07_04"); //欧 纳 尔 的 一 个 雇 佣 兵 谋 杀 了 高 贵 的 圣 骑 士 洛 萨 。 不 过 那 个 混 蛋 已 经 被 抓 住 ， 并 被 投 入 了 监 狱 。
		};
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_MIL_7_STANDARD_07_05"); //有 些 雇 佣 兵 已 经 离 开 了 欧 纳 尔 的 农 场 。 有 些 问 题 会 自 然 化 解 。
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_MIL_7_STANDARD_07_06"); //龙 被 消 灭 了 ， 但 是 事 情 还 没 有 完 。 兽 人 是 下 一 个 。 我 们 会 把 事 情 合 理 解 决 的 ！
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_MIL_7(var C_Npc slf)
{
	DIA_MIL_7_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_7_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_7_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_7_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_MIL_7_STANDARD.npc = Hlp_GetInstanceID(slf);
};
