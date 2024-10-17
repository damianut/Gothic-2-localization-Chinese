// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_VLK_16_EXIT_Condition;
	information		= DIA_VLK_16_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_VLK_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_VLK_16_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_VLK_16_JOIN_Condition;
	information		= DIA_VLK_16_JOIN_Info;
	permanent		= TRUE;
	description		= "我 想 成 为 这 个 城 镇 的 市 民 ！";
};

func int DIA_VLK_16_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_16_JOIN_Info()
{
	AI_Output(other, self, "DIA_VLK_16_JOIN_15_00"); //我 想 成 为 这 个 城 镇 的 市 民 ！
	AI_Output(self, other, "DIA_VLK_16_JOIN_16_01"); //你 愿 意 帮 助 我 们 保 护 城 市 抵 抗 兽 人 吗 ？
	AI_Output(self, other, "DIA_VLK_16_JOIN_16_02"); //如 果 你 是 克 霍 里 尼 斯 的 市 民 ， 你 可 以 加 入 民 兵 - 你 应 该 同 某 位 城 市 卫 兵 谈 谈 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_VLK_16_PEOPLE_Condition;
	information		= DIA_VLK_16_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 里 最 出 名 的 人 ？";
};

func int DIA_VLK_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_VLK_16_PEOPLE_15_00"); //谁 是 这 里 最 出 名 的 人 ？
	AI_Output(self, other, "DIA_VLK_16_PEOPLE_16_01"); //圣 骑 士 驻 扎 在 富 人 区 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_VLK_16_LOCATION_Condition;
	information		= DIA_VLK_16_LOCATION_Info;
	permanent		= TRUE;
	description		= "这 里 能 看 到 什 么 有 趣 的 事 ？";
};

func int DIA_VLK_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_LOCATION_Info()
{
	AI_Output(other, self, "DIA_VLK_16_LOCATION_15_00"); //这 里 能 看 到 什 么 有 趣 的 事 ？
	AI_Output(self, other, "DIA_VLK_16_LOCATION_16_01"); //在 市 场 里 有 各 种 各 样 的 货 物 展 示 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_VLK_16_STANDARD_Condition;
	information		= DIA_VLK_16_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_VLK_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_16_STANDARD_Info()
{
	AI_Output(other, self, "DIA_VLK_16_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_Addon_VLK_16_STANDARD_16_00"); //我 希 望 民 兵 最 后 能 查 明 为 什 么 克 霍 里 尼 斯 的 人 口 不 断 减 少 。
		AI_Output(self, other, "DIA_Addon_VLK_16_STANDARD_16_01"); //当 你 听 说 有 那 么 多 人 不 断 失 踪 时 ， 你 也 会 为 你 的 生 命 担 忧 。
		if (SC_HearedAboutMissingPeople == FALSE)
		{
			Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
			B_LogEntry(TOPIC_Addon_WhoStolePeople, LogText_Addon_SCKnowsMisspeapl);
		};

		SC_HearedAboutMissingPeople = TRUE;
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_VLK_16_STANDARD_16_01"); //你 听 说 了 吗 ？ 在 城 市 外 面 发 现 了 兽 人 。 我 们 只 能 希 望 圣 骑 士 有 足 够 的 人 手 。
		AI_Output(self, other, "DIA_VLK_16_STANDARD_16_02"); //我 怀 疑 那 就 是 农 场 主 不 再 来 市 场 的 原 因 。
	};

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_VLK_16_STANDARD_16_03"); //那 个 据 称 谋 杀 了 洛 萨 的 雇 佣 兵 是 无 辜 的 。 他 们 找 到 了 证 据 说 明 他 是 被 诬 陷 的 。 我 是 在 市 场 里 听 说 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_VLK_16_STANDARD_16_04"); //真 是 暴 行 。 地 主 的 雇 佣 兵 在 大 街 当 中 谋 杀 了 高 贵 的 圣 骑 士 洛 萨 。
			AI_Output(self, other, "DIA_VLK_16_STANDARD_16_05"); //但 是 英 诺 斯 将 会 惩 罚 那 些 罪 人 的 罪 行 。 决 不 允 许 有 人 反 对 神 的 战 士 。
		};
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_VLK_16_STANDARD_16_06"); //我 听 说 罪 犯 逃 向 欧 纳 尔 的 农 场 了 。 据 说 ， 因 为 害 怕 哈 根 勋 爵 的 人 ， 他 们 逃 回 了 矿 藏 山 谷 。
	};

	if (Kapitel == 5)
	{
		AI_Output(self, other, "DIA_VLK_16_STANDARD_16_07"); //我 听 说 圣 骑 士 的 军 队 打 算 击 败 在 矿 藏 山 谷 里 面 那 些 可 怕 的 龙 。
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_VLK_16(var C_Npc slf)
{
	DIA_VLK_16_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_16_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_16_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_16_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_16_STANDARD.npc = Hlp_GetInstanceID(slf);
};
