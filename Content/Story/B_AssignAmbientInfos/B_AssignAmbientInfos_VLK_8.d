// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_VLK_8_EXIT_Condition;
	information		= DIA_VLK_8_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_VLK_8_EXIT_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_VLK_8_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_VLK_8_JOIN_Condition;
	information		= DIA_VLK_8_JOIN_Info;
	permanent		= TRUE;
	description		= "我 想 成 为 这 个 城 镇 的 市 民 ！";
};

func int DIA_VLK_8_JOIN_Condition()
{
	if ((hero.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_VLK_8_JOIN_Info()
{
	AI_Output(other, self, "DIA_VLK_8_JOIN_15_00"); //我 想 成 为 这 个 城 镇 的 市 民 ！
	AI_Output(self, other, "DIA_VLK_8_JOIN_08_01"); //你 为 什 么 对 我 说 那 些 ？ 去 城 市 的 贫 民 区 找 那 些 工 匠 大 师 。 也 许 ， 如 果 你 足 够 幸 运 的 话 ， 他 们 之 中 应 该 有 人 正 在 招 收 学 徒 。
	AI_Output(self, other, "DIA_VLK_8_JOIN_08_02"); //否 则 ， 你 就 只 能 去 市 政 大 厅 想 办 法 注 册 成 为 市 民 。
	AI_Output(self, other, "DIA_VLK_8_JOIN_08_03"); //但 是 现 在 ， 你 就 不 用 想 了 。 总 督 已 经 不 管 事 了 ， 因 为 圣 骑 士 来 了 。
	AI_Output(self, other, "DIA_VLK_8_JOIN_08_04"); //他 们 的 首 领 ， 哈 根 勋 爵 ， 肯 定 没 有 时 间 去 管 那 样 的 事 情 。
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_VLK_8_PEOPLE_Condition;
	information		= DIA_VLK_8_PEOPLE_Info;
	permanent		= TRUE;
	description		= "谁 是 这 个 镇 上 最 重 要 的 市 民 ？";
};

func int DIA_VLK_8_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_VLK_8_PEOPLE_15_00"); //谁 是 这 个 镇 上 最 重 要 的 市 民 ？
	AI_Output(self, other, "DIA_VLK_8_PEOPLE_08_01"); //除 了 圣 骑 士 以 外 … … 还 有 城 镇 的 贫 民 区 的 工 匠 大 师 们 。 他 们 都 非 常 重 要 。
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_VLK_8_LOCATION_Condition;
	information		= DIA_VLK_8_LOCATION_Info;
	permanent		= TRUE;
	description		= "这 里 能 看 到 什 么 有 趣 的 事 ？";
};

func int DIA_VLK_8_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_LOCATION_Info()
{
	AI_Output(other, self, "DIA_VLK_8_LOCATION_15_00"); //这 里 能 看 到 什 么 有 趣 的 事 ？
	AI_Output(self, other, "DIA_VLK_8_LOCATION_08_01"); //圣 骑 士 乘 坐 的 大 船 停 在 港 口 里 。 那 真 是 一 艘 庞 大 的 船 ！ 你 一 定 要 去 看 看 它 。
	AI_Output(self, other, "DIA_VLK_8_LOCATION_08_02"); //但 是 我 想 不 出 他 们 怎 么 能 让 你 上 船 。 圣 骑 士 看 守 那 条 船 就 象 守 护 王 冠 宝 石 一 样 。
	AI_Output(self, other, "DIA_VLK_8_LOCATION_08_03"); //毫 无 疑 问 。 它 也 是 唯 一 一 艘 可 以 到 处 停 泊 的 船 。
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_VLK_8_STANDARD_Condition;
	information		= DIA_VLK_8_STANDARD_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_VLK_8_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_VLK_8_STANDARD_Info()
{
	AI_Output(other, self, "DIA_VLK_8_STANDARD_15_00"); //有 什 么 新 消 息 ？

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_Addon_VLK_8_STANDARD_08_00"); //近 来 每 个 人 都 很 担 心 。
		AI_Output(self, other, "DIA_Addon_VLK_8_STANDARD_08_01"); //不 仅 仅 是 因 为 圣 骑 士 在 这 里 安 家 ， 现 在 人 们 像 赶 某 种 奇 怪 的 潮 流 一 样 不 断 失 踪 。
		AI_Output(self, other, "DIA_Addon_VLK_8_STANDARD_08_02"); //民 兵 终 于 应 该 为 此 做 些 什 么 事 了 。
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
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_01"); //每 个 人 都 在 等 圣 骑 士 宣 布 他 们 为 什 么 会 来 这 里 。 我 怀 疑 可 能 是 因 为 那 些 兽 人 。 他 们 肯 定 会 很 快 发 起 攻 击 ！
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_02"); //圣 骑 士 可 能 受 到 了 英 诺 斯 的 祝 福 ， 但 是 当 兽 人 大 军 出 现 在 这 里 的 时 候 ， 就 轮 到 我 们 了 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_03"); //他 们 说 圣 骑 士 来 这 里 只 是 为 了 拿 走 岛 上 所 有 的 矿 石 。 他 们 说 ， 都 是 为 了 主 大 陆 上 的 战 争 。
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_04"); //你 知 道 那 意 味 着 什 么 吗 ？ 如 果 我 们 在 兽 人 的 攻 击 中 全 部 悲 惨 得 死 掉 的 话 ， 国 王 根 本 不 会 在 乎 。
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_05"); //我 要 确 保 当 圣 骑 士 起 锚 的 时 候 ， 我 在 船 上 。
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_06"); //他 们 说 兽 人 是 乘 坐 有 这 个 城 市 一 半 那 么 大 的 龙 飞 来 的 ！ 我 们 没 有 一 丝 机 会 ！
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_VLK_8_STANDARD_08_07"); //人 们 传 说 龙 已 经 被 消 灭 了 。 那 会 是 真 的 吗 ？
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_VLK_8(var C_Npc slf)
{
	DIA_VLK_8_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_8_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_8_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_8_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_VLK_8_STANDARD.npc = Hlp_GetInstanceID(slf);
};
