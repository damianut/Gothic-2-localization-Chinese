///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_EXIT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 999;
	condition		= DIA_Pyrokar_EXIT_Condition;
	information		= DIA_Pyrokar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pyrokar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WELCOME(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_WELCOME_Condition;
	information		= DIA_Pyrokar_WELCOME_Info;
	important		= TRUE;
};

func int DIA_Pyrokar_WELCOME_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WELCOME_Info()
{
	AI_Output(self, other, "DIA_Pyrokar_WELCOME_11_00"); //那 么 说 你 是 一 个 新 信 徒 。 嗯 ， 我 想 你 已 经 接 受 了 大 师 帕 兰 下 达 的 任 务 。
	AI_Output(self, other, "DIA_Pyrokar_WELCOME_11_01"); //（ 略 带 斥 责 ） 你 知 道 ， 任 何 身 在 火 焰 的 社 团 之 中 的 人 ， 都 必 须 遵 照 英 诺 斯 的 意 愿 完 成 他 的 职 责 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hagen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Hagen(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 10;
	condition		= DIA_Pyrokar_Hagen_Condition;
	information		= DIA_Pyrokar_Hagen_Info;
	description		= "我 必 须 同 圣 骑 士 谈 谈 。 十 分 紧 急 。 ";
};

func int DIA_Pyrokar_Hagen_Condition()
{
	if (other.guild == GIL_NOV) // muss kommen
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Hagen_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Hagen_15_00"); //我 必 须 同 圣 骑 士 谈 谈 。 十 分 紧 急 。
	AI_Output(self, other, "DIA_Pyrokar_Hagen_11_01"); //你 准 备 告 诉 我 们 你 为 什 么 想 要 和 他 们 讲 话 吗 ？
	AI_Output(other, self, "DIA_Pyrokar_Hagen_15_02"); //我 给 他 们 带 来 一 条 非 常 重 要 的 消 息 。
	AI_Output(self, other, "DIA_Pyrokar_Hagen_11_03"); //那 是 什 么 消 息 ？
	AI_Output(other, self, "DIA_Pyrokar_Hagen_15_04"); //一 支 邪 恶 的 军 队 正 在 矿 藏 山 谷 里 集 合 ， 由 龙 率 领 ！ 我 们 必 须 在 还 有 能 力 之 前 阻 止 他 们 。
	AI_Output(self, other, "DIA_Pyrokar_Hagen_11_05"); //嗯 。 我 们 会 考 虑 你 的 话 ， 新 信 徒 。 当 时 机 到 来 之 时 ， 我 们 将 会 告 诉 你 我 们 的 议 会 所 做 的 决 定 。
	AI_Output(self, other, "DIA_Pyrokar_Hagen_11_06"); //其 间 ， 你 最 好 履 行 你 作 为 一 个 新 信 徒 的 职 责 。

	if (Npc_KnowsInfo(other, DIA_Pyrokar_Auge))
	{
		AI_Output(self, other, "DIA_Pyrokar_ALL_11_07"); //嗯 ， 我 们 不 会 让 你 长 时 间 脱 离 你 的 工 作 - 你 现 在 可 以 走 了 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Auge
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Auge(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 10;
	condition		= DIA_Pyrokar_Auge_Condition;
	information		= DIA_Pyrokar_Auge_Info;
	description		= "敌 人 发 现 我 在 寻 找 英 诺 斯 之 眼 。 我 该 趁 早 找 到 它 。";
};

func int DIA_Pyrokar_Auge_Condition()
{
	if ((KNOWS_FIRE_CONTEST == FALSE)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Auge_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Auge_15_00"); //敌 人 发 现 我 在 寻 找 英 诺 斯 之 眼 。 我 该 趁 早 找 到 它 。
	AI_Output(self, other, "DIA_Pyrokar_Auge_11_01"); //任 何 以 为 他 不 但 能 找 到 护 身 符 、 并 且 还 能 戴 上 它 的 人 ， 都 是 傻 瓜 。
	AI_Output(self, other, "DIA_Pyrokar_Auge_11_02"); //护 身 符 自 己 会 选 择 它 的 佩 带 者 - 没 人 能 指 定 谁 可 以 戴 上 它 。
	AI_Output(other, self, "DIA_Pyrokar_Auge_15_03"); //我 愿 意 尝 试 一 下 。
	AI_Output(self, other, "DIA_Pyrokar_Auge_11_04"); //新 信 徒 的 职 责 是 表 现 出 谦 逊 - 而 不 是 要 求。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_12);

	if (Npc_KnowsInfo(other, DIA_Pyrokar_Hagen))
	{
		AI_Output(self, other, "DIA_Pyrokar_ALL_11_05"); //嗯 ， 我 们 不 会 让 你 长 时 间 脱 离 你 的 工 作 - 你 现 在 可 以 走 了。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Pyrokar_MissingPeople(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 5;
	condition		= DIA_Addon_Pyrokar_MissingPeople_Condition;
	information		= DIA_Addon_Pyrokar_MissingPeople_Info;
	description		= "克 霍 里 尼 斯 的 一 些 市 民 神 秘 失 踪 了 。";
};

func int DIA_Addon_Pyrokar_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople == TRUE)
	&& (Sklaven_Flucht == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Pyrokar_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_00"); //克 霍 里 尼 斯 的 一 些 市 民 神 秘 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_01"); //结 果 我 已 经 知 道 了 ， 非 常 可 惜 。 但 是 我 们 必 须 认 可 水 法 师 ， 让 他 们 来 处 理 这 个 问 题 。
	AI_Output(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_02"); //在 克 霍 里 尼 斯 东 北 部 地 区 研 究 不 寻 常 的 地 震 这 件 事 上 也 是 一 样 。
	AI_Output(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_03"); //迄 今 为 止 ， 我 还 没 有 收 到 需 要 我 们 援 助 的 通 知 。 因 此 ， 我 们 不 会 在 这 件 事 上 采 取 任 何 行 动 。
	AI_Output(other, self, "DIA_Addon_Pyrokar_MissingPeople_15_04"); //是 的 ， 但 是 … …
	AI_Output(self, other, "DIA_Addon_Pyrokar_MissingPeople_11_05"); //没 有 但 是 ！ 我 们 将 按 照 我 们 的 协 议 行 事 ， 而 且 我 希 望 你 也 能 尊 重 那 个 决 定 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_8);

	if ((other.guild == GIL_NOV)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GOAWAY(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 10;
	condition		= DIA_Pyrokar_GOAWAY_Condition;
	information		= DIA_Pyrokar_GOAWAY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pyrokar_GOAWAY_Condition()
{
	// ADDON>
	if ((Npc_KnowsInfo(hero, DIA_Addon_Pyrokar_MissingPeople) == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE))
	{
		return FALSE;
	};

	// ADDON<

	if ((Npc_IsInState(self, ZS_Talk)
	&& Npc_KnowsInfo(hero, DIA_Pyrokar_Hagen)
	&& Npc_KnowsInfo(hero, DIA_Pyrokar_Auge)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GOAWAY_Info()
{
	AI_Output(self, other, "DIA_Pyrokar_GOAWAY_11_00"); //（ 生 气 ） 服 从 是 你 无 论 如 何 都 需 要 学 习 的 一 种 美 德 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FIRE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FIRE(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 1;
	condition		= DIA_Pyrokar_FIRE_Condition;
	information		= DIA_Pyrokar_FIRE_Info;
	description		= "我 要 参 加 火 焰 测 试 。";
};

func int DIA_Pyrokar_FIRE_Condition()
{
	if ((KNOWS_FIRE_CONTEST == TRUE)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Pyrokar_Hagen))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FIRE_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_FIRE_15_00"); //我 要 参 加 火 焰 测 试 。
	AI_Output(self, other, "DIA_Pyrokar_FIRE_11_01"); //（ 感 到 惊 讶 ） 那 你 知 道 了 … … 你 想 要 参 加 火 焰 测 试 ？
	AI_Output(other, self, "DIA_Pyrokar_FIRE_15_02"); //是 的 ， 我 查 阅 了 火 焰 法 则 ， 上 面 说 … …
	AI_Output(self, other, "DIA_Pyrokar_FIRE_11_03"); //（ 粗 暴 地 打 断 ） 我 们 知 道 火 焰 法 则 。 我 们 已 经 见 过 很 多 新 信 徒 在 测 试 中 死 去 。 你 应 该 重 新 考 虑 这 个 决 定 。
	AI_Output(other, self, "DIA_Pyrokar_FIRE_15_04"); //是 的 ， 我 考 虑 过 了 。 我 想 要 测 试 - 而 且 我 会 通 过 它 的 。
	AI_Output(self, other, "DIA_Pyrokar_FIRE_11_05"); //（ 警 告 ） 如 果 你 绝 对 坚 持 的 话 ， 那 么 高 级 议 会 将 会 给 你 安 排 测 试 。
	AI_Output(other, self, "DIA_Pyrokar_FIRE_15_06"); //我 坚 持 参 加 火 焰 测 试 。
	AI_Output(self, other, "DIA_Pyrokar_FIRE_11_07"); //那 样 的 话 - 就 这 样 。 当 你 准 备 好 时 ， 每 个 高 级 议 会 的 魔 法 师 将 会 给 你 一 个 任 务 ， 你 必 须 将 其 完 成 。
	AI_Output(self, other, "DIA_Pyrokar_FIRE_11_08"); //愿 英 诺 斯 怜 悯 你 的 灵 魂 。

	B_LogEntry(TOPIC_FireContest, TOPIC_FireContest_2);
};

///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEST(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 10;
	condition		= DIA_Pyrokar_TEST_Condition;
	information		= DIA_Pyrokar_TEST_Info;
	description		= "我 已 经 准 备 好 面 对 你 的 考 验 ， 大 师";
};

func int DIA_Pyrokar_TEST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE)
	&& (MIS_SCHNITZELJAGD == FALSE)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEST_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_TEST_15_00"); //我 已 经 准 备 好 面 对 你 的 考 验 ， 大 师 。
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_01"); //而 且 只 有 英 诺 斯 才 知 道 你 是 否 能 通 过 它 。 你 将 要 参 加 与 其 它 被 选 中 的 新 信 徒 同 样 的 测 试 。
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_02"); //魔 法 测 试 。 （ 超 然 的 ） 你 也 许 知 道 ， 在 新 信 徒 中 只 有 一 个 人 能 通 过 测 试 。
	AI_Output(other, self, "DIA_Pyrokar_TEST_15_03"); //我 知 道 。 那 么 谁 是 我 的 竞 争 对 手 ？
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_04"); //英 诺 斯 以 他 的 智 慧 还 选 中 了 三 名 新 信 徒 来 参 加 这 次 测 试 ： 阿 岗 ， 伊 加 莱 兹 和 尤 尔 夫 。 他 们 已 经 开 始 搜 索 了 。
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_05"); //（ 敷 衍 了 事 ） 那 已 经 够 了 ！ 听 好 测 试 的 话 ： ‘ 跟 随 英 诺 斯 的 标 记 ， 然 后 把 信 徒 在 道 路 尽 头 找 到 的 东 西 带 给 我 们 。 ’
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_06"); //你 将 会 用 到 这 把 钥 匙 。
	AI_Output(self, other, "DIA_Pyrokar_TEST_11_07"); //那 是 我 要 对 你 说 的 全 部 。

	Log_CreateTopic(TOPIC_Schnitzeljagd, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Schnitzeljagd, LOG_RUNNING);
	B_LogEntry(TOPIC_Schnitzeljagd, TOPIC_Schnitzeljagd_1);

	B_LogEntry(TOPIC_Schnitzeljagd, TOPIC_Schnitzeljagd_2);

	CreateInvItems(self, ItKe_MagicChest, 1);
	B_GiveInvItems(self, other, ItKe_MagicChest, 1);

	// ------------Igaraz klar machen-------------------
	B_StartOtherRoutine(Igaraz, "CONTEST");
	AI_Teleport(Igaraz, "NW_TAVERNE_BIGFARM_05");
	CreateInvItems(Igaraz, ItKe_MagicChest, 1);
	Igaraz.aivar [AIV_DropDeadAndKill] = TRUE;
	Igaraz.aivar [AIV_NewsOverride] = TRUE;

	// ---------Smalltalk Partner herbeirufen
	B_StartOtherRoutine(NOV607, "EXCHANGE");

	// ------------Agon klar machen-------------------
	B_StartOtherRoutine(Agon, "GOLEMDEAD");
	AI_Teleport(Agon, "NW_MAGECAVE_RUNE");
	CreateInvItems(Agon, ItKe_MagicChest, 1);
	Agon.aivar [AIV_DropDeadAndKill] = TRUE;
	Agon.aivar [AIV_NewsOverride] = TRUE;
	// ------------Ulf klar machen-------------------
	B_StartOtherRoutine(Ulf, "SUCHE");
	AI_Teleport(Ulf, "NW_TROLLAREA_PATH_42");
	CreateInvItems(Ulf, ItKe_MagicChest, 1);
	Ulf.aivar [AIV_DropDeadAndKill] = TRUE;
	Ulf.aivar [AIV_NewsOverride] = TRUE;
	// -------------------------------
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_RUNNING(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 20;
	condition		= DIA_Pyrokar_RUNNING_Condition;
	information		= DIA_Pyrokar_RUNNING_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pyrokar_RUNNING_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& Npc_IsInState(self, ZS_Talk)
	&& (other.guild == GIL_NOV)
	&& (Mob_HasItems("MAGICCHEST", ItMi_RuneBlank)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_RUNNING_Info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);

	if (randomizer == 0)
	{
		AI_Output(self, other, "DIA_Pyrokar_RUNNING_11_00"); //只 要 你 还 在 测 试 当 中 ， 我 们 就 不 会 对 你 说 任 何 事 。
	}
	else if (randomizer == 1)
	{
		AI_Output(self, other, "DIA_Pyrokar_RUNNING_11_01"); //你 还 站 在 这 附 近 做 什 么 ？ 去 迎 接 你 的 测 试 ！
	}
	else if (randomizer == 2)
	{
		AI_Output(self, other, "DIA_Pyrokar_RUNNING_11_02"); //用 你 的 行 动 探 求 伟 大 话 语 的 时 候 到 了 。 你 这 么 想 吗 ， 新 信 徒 ？
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SUCCESS(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_SUCCESS_Condition;
	information		= DIA_Pyrokar_SUCCESS_Info;
	description		= "我 找 到 了 咒 语 石";
};

func int DIA_Pyrokar_SUCCESS_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_RUNNING)
	&& (hero.guild == GIL_NOV)
	&& (!Mob_HasItems("MAGICCHEST", ItMi_RuneBlank))
	&& ((Npc_HasItems(other, itmi_runeblank) >= 1)
	|| (Npc_HasItems(other, itru_firebolt) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SUCCESS_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_SUCCESS_15_00"); //我 找 到 了 咒 语 石 。
	AI_Output(self, other, "DIA_Pyrokar_SUCCESS_11_01"); //（ 表 示 怀 疑 ） 你 … … 成 功 了 ？ ！ 你 跟 随 标 记 并 发 现 了 隐 藏 的 入 口 … …
	AI_Output(other, self, "DIA_Pyrokar_SUCCESS_15_02"); //… … 而 且 我 打 败 了 所 有 想 要 把 我 当 成 点 心 的 怪 物 。
	AI_Output(self, other, "DIA_Pyrokar_SUCCESS_11_03"); //那 么 其 它 新 信 徒 呢 ？ 阿 岗 怎 么 样 了 ？ 他 们 没 有 先 你 一 步 成 功 ？
	AI_Output(other, self, "DIA_Pyrokar_SUCCESS_15_04"); //他 们 已 经 失 败 了 。 我 相 信 他 们 注 定 无 法 通 过 测 试 。
	AI_Output(self, other, "DIA_Pyrokar_SUCCESS_11_05"); //嗯 ， 那 么 我 们 宣 布 你 已 经 通 过 了 这 次 测 试 。 而 且 那 块 咒 语 石 将 归 你 所 有 。

	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	B_GivePlayerXP(XP_SCHNITZELJAGD);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM wenn Prüfung erfolgreich und die anderen noch nicht.
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Todo(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_Todo_Condition;
	information		= DIA_Pyrokar_Todo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Pyrokar_Todo_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (other.guild == GIL_NOV)
	&& ((MIS_RUNE != LOG_SUCCESS)
	|| (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Todo_Info()
{
	AI_Output(self, other, "DIA_Pyrokar_Todo_11_00"); //你 已 经 通 过 了 我 给 你 指 定 的 测 试 。
	AI_Output(self, other, "DIA_Pyrokar_Todo_11_01"); //但 是 ...

	if (MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Pyrokar_Todo_11_02"); //… … 你 还 必 须 通 过 乌 尔 萨 的 测 试 。
	};

	if (MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Pyrokar_Todo_11_03"); //… 你 还 必 须 完 成 瑟 朋 帝 兹 的 测 试 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AUFNAHME
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MAGICAN(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 3;
	condition		= DIA_Pyrokar_MAGICAN_Condition;
	information		= DIA_Pyrokar_MAGICAN_Info;
	description		= "我 现 在 能 加 入 魔 法 师 公 会 了 吗 ？";
};

func int DIA_Pyrokar_MAGICAN_Condition()
{
	if ((MIS_SCHNITZELJAGD == LOG_SUCCESS)
	&& (MIS_RUNE == LOG_SUCCESS)
	&& (MIS_GOLEM == LOG_SUCCESS)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MAGICAN_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_MAGICAN_15_00"); //我 现 在 能 加 入 魔 法 师 公 会 了 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_MAGICAN_11_01"); //你 成 功 了 。 你 已 经 通 过 了 火 焰 测 试 。 我 们 始 终 确 信 你 能 成 功 地 通 过 。
	AI_Output(self, other, "DIA_Pyrokar_MAGICAN_11_02"); //（ 引 人 注 意 的 ） 正 如 我 们 坚 信 的 那 样 ， 你 将 作 为 值 得 尊 敬 的 英 诺 斯 的 仆 人 继 续 努 力 。
	AI_Output(self, other, "DIA_Pyrokar_MAGICAN_11_03"); //那 么 ， 如 果 你 准 备 好 宣 读 火 焰 誓 言 的 话 ， 你 将 被 允 许 作 为 一 名 魔 法 师 加 入 我 们 的 行 列 。
};

///////////////////////////////////////////////////////////////////////
//	Info OATH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_OATH(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 1;
	condition		= DIA_Pyrokar_OATH_Condition;
	information		= DIA_Pyrokar_OATH_Info;
	description		= "我 已 经 做 好 准 备 步 入 火 之 环 。";
};

func int DIA_Pyrokar_OATH_Condition()
{
	if ((Npc_KnowsInfo(hero, DIA_Pyrokar_MAGICAN))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_OATH_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_OATH_15_00"); //我 已 经 做 好 准 备 步 入 火 之 环 。
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_01"); //好 吧 ， 那 宣 读 神 圣 的 火 焰 誓 言 。

	AI_Output(self, other, "DIA_Pyrokar_OATH_11_02"); //（ 庄 严 的 ） 你 愿 意 发 誓 ， 在 全 能 的 英 诺 斯 神 、 他 的 仆 从 们 以 及 神 圣 的 火 焰 面 前 … …
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_03"); //… … 自 此 以 后 直 到 永 远 ， 你 的 一 生 将 与 火 焰 结 合 … …
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_04"); //… … 直 到 你 的 身 体 和 灵 魂 在 圣 堂 中 找 到 栖 所 ， 以 至 你 的 生 命 消 逝 吗 ？
	AI_Output(other, self, "DIA_Pyrokar_OATH_15_05"); //我 发 誓 。
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_06"); //宣 读 了 誓 言 之 后 ， 你 已 经 与 火 焰 缔 结 了 协 约 。
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_07"); //穿 上 这 件 袍 子 ， 作 为 永 恒 结 合 的 象 征 。

	CreateInvItems(hero, ITAR_KDF_L, 1);
	AI_EquipArmor(hero, ITAR_KDF_L);

	other.guild = GIL_KDF;
	Npc_ExchangeRoutine(Lothar, "START");

	Npc_SetTrueGuild(other, GIL_KDF);

	Fire_Contest = TRUE; // fürs Log

	Snd_Play("LEVELUP");

	KDF_Aufnahme = LOG_SUCCESS;
	SLD_Aufnahme = LOG_OBSOLETE;
	MIL_Aufnahme = LOG_OBSOLETE;
	B_GivePlayerXP(XP_BecomeMage);

	AI_Output(self, other, "DIA_Pyrokar_OATH_11_08"); //既 然 你 已 经 加 入 了 我 们 的 行 列 ， 你 可 以 去 和 哈 根 勋 爵 - 圣 骑 士 的 最 高 指 挥 官 - 谈 话 了 。
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_09"); //我 们 也 非 常 想 知 道 他 是 如 何 审 视 目 前 这 种 状 况 的 。 那 么 你 现 在 可 以 自 由 前 往 克 霍 里 尼 斯 了 。
	AI_Output(self, other, "DIA_Pyrokar_OATH_11_10"); //我 们 希 望 你 立 即 将 他 的 回 答 告 诉 我 们 。
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Lernen(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_Lernen_Condition;
	information		= DIA_Pyrokar_Lernen_Info;
	description		= "我 现 在 能 学 习 什 么 ？";
};

func int DIA_Pyrokar_Lernen_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Lernen_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Lernen_15_00"); //我 现 在 都 能 学 习 一 些 什 么 ？
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_01"); //首 先 ， 你 现 在 有 资 格 学 习 关 于 魔 法 环 的 知 识 。 它 们 将 给 予 你 使 用 咒 语 的 能 力 。
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_02"); //你 在 六 个 魔 法 环 中 的 等 级 越 高 ， 你 就 能 使 用 越 强 大 的 魔 法 。
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_03"); //你 可 以 向 修 道 院 里 的 兄 弟 们 学 习 公 式 。 他 们 每 个 人 都 有 自 己 擅 长 的 领 域 可 以 教 你 。
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_04"); //例 如 卡 拉 斯 ， 是 祈 祷 和 召 唤 的 大 师 ， 而 希 格 莱 斯 会 教 你 火 魔 法 。
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_05"); //没 有 人 能 比 马 杜 克 更 了 解 冰 和 雷 的 力 量 。 帕 兰 可 以 教 你 其 它 一 些 咒 语 - 而 且 他 将 指 导 你 进 入 第 一 环 。
	AI_Output(self, other, "DIA_Pyrokar_Lernen_11_06"); //但 是 他 们 每 个 人 都 只 能 教 你 公 式 - 你 必 须 亲 自 制 造 咒 语 。

	Log_CreateTopic(Topic_KlosterTeacher, LOG_NOTE);

	B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_4);

	B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_5);
	Log_AddEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_6);
	Log_AddEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_7);
	Log_AddEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_8);
};

///////////////////////////////////////////////////////////////////////
//	Info Wunsch
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Wunsch(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_Wunsch_Condition;
	information		= DIA_Pyrokar_Wunsch_Info;
	description		= "我 要 表 达 一 下 愿 望 … …";
};

func int DIA_Pyrokar_Wunsch_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (Kapitel < 2))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Wunsch_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Wunsch_15_00"); //我 要 表 达 一 下 愿 望 … …
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_11_01"); //在 一 名 魔 法 师 刚 加 入 时 ， 他 有 权 力 下 达 第 一 次 命 令 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_11_02"); //那 么 ， 你 成 为 魔 法 师 后 的 第 一 个 命 令 是 什 么 ？

	Info_ClearChoices(DIA_Pyrokar_Wunsch);
	Info_AddChoice(DIA_Pyrokar_Wunsch, "没 有 。", DIA_Pyrokar_Wunsch_Nothing);
	if (MIS_HelpBabo == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, "让 白 波 做 修 道 院 的 新 园 丁 。", DIA_Pyrokar_Wunsch_Babo);
	};

	if (MIS_HelpOpolos == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, "让 新 信 徒 奥 波 罗 斯 进 入 图 书 馆 。", DIA_Pyrokar_Wunsch_Opolos);
	};

	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Pyrokar_Wunsch, "让 迪 利 安 留 在 修 道 院 里。", DIA_Pyrokar_Wunsch_Dyrian);
	};
};

func void DIA_Pyrokar_Wunsch_Nothing()
{
	AI_Teleport(Dyrian, "TAVERNE");
	AI_Output(other, self, "DIA_Pyrokar_Wunsch_Nothing_15_00"); //没 有。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Nothing_11_01"); //（ 惊 讶 的 ） 那 就 这 样 吧 。 新 魔 法 师 放 弃 了 他 的 命 令 。

	B_StartOtherRoutine(Dyrian, "NOFAVOUR");

	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};

	if (MIS_HelpOpolos == LOG_RUNNING)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};

	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};

	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Dyrian()
{
	AI_Output(other, self, "DIA_Pyrokar_Wunsch_Dyrian_15_00"); //让 新 信 徒 迪 利 安 留 在 修 道 院 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Dyrian_11_01"); //就 这 样 吧 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Dyrian_11_02"); //这 名 新 信 徒 将 被 允 许 留 在 修 道 院 ， 而 且 他 将 填 补 目 前 空 缺 的 园 丁 一 职 。

	B_GivePlayerXP(XP_HelpDyrian);

	B_StartOtherRoutine(Dyrian, "FAVOUR");

	MIS_HelpDyrian = LOG_SUCCESS;

	if (MIS_HelpOpolos == LOG_RUNNING)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};

	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};

	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Babo()
{
	AI_Teleport(Dyrian, "TAVERNE");

	AI_Output(other, self, "DIA_Pyrokar_Wunsch_Babo_15_00"); //让 新 信 徒 白 波 成 为 修 道 院 花 园 的 主 管 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Babo_11_01"); //就 这 样 吧 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Babo_11_02"); //立 即 生 效 ， 新 信 徒 白 波 将 主 管 修 道 院 的 花 园 。

	B_GivePlayerXP(XP_HelpBabo);

	B_StartOtherRoutine(Babo, "FAVOUR");
	B_StartOtherRoutine(Dyrian, "NOFAVOUR");

	MIS_HelpBabo = LOG_SUCCESS;

	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};

	if (MIS_HelpOpolos == LOG_RUNNING)
	{
		MIS_HelpOpolos = LOG_FAILED;
	};

	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

func void DIA_Pyrokar_Wunsch_Opolos()
{
	AI_Teleport(Dyrian, "TAVERNE");

	AI_Output(other, self, "DIA_Pyrokar_Wunsch_Opolos_15_00"); //让 新 信 徒 奥 波 罗 斯 进 入 图 书 馆 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Opolos_11_01"); //就 这 样 吧 。
	AI_Output(self, other, "DIA_Pyrokar_Wunsch_Opolos_11_02"); //从 现 在 起 ， 新 信 徒 奥 波 罗 斯 将 研 究 英 诺 斯 的 铭 文 。

	B_GivePlayerXP(XP_HelpOpolos);

	B_StartOtherRoutine(Opolos, "FAVOUR");
	B_StartOtherRoutine(Dyrian, "NOFAVOUR");

	MIS_HelpOpolos = LOG_SUCCESS;

	if (MIS_HelpDyrian == LOG_RUNNING)
	{
		MIS_HelpDyrian = LOG_FAILED;
	};

	if (MIS_HelpBabo == LOG_RUNNING)
	{
		MIS_HelpBabo = LOG_FAILED;
	};

	Info_ClearChoices(DIA_Pyrokar_Wunsch);
};

///////////////////////////////////////////////////////////////////////
//	Info war bei LH und nicht in der OW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Nachricht(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_Nachricht_Condition;
	information		= DIA_Pyrokar_Nachricht_Info;
	description		= "我 带 来 了 哈 根 勋 爵 的 消 息 … …";
};

func int DIA_Pyrokar_Nachricht_Condition()
{
	if ((MIS_OLDWORLD == LOG_RUNNING)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Nachricht_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Nachricht_15_00"); //我 带 来 了 哈 根 勋 爵 的 消 息 。 他 想 要 龙 和 邪 恶 军 团 出 现 的 证 据 。

	if (EnterOW_Kapitel2 == FALSE)
	{
		AI_Teleport(Sergio, "NW_MONASTERY_PLACE_09");
		AI_Output(other, self, "DIA_Pyrokar_Nachricht_15_01"); //所 以 我 要 前 往 矿 藏 山 谷 ， 并 给 他 找 到 证 据 。
		AI_Output(self, other, "DIA_Pyrokar_Nachricht_11_02"); //好 。 那 你 去 执 行 这 个 命 令 吧 ， 圣 骑 士 瑟 吉 欧 将 会 护 送 你 到 关 卡 。
		AI_Output(self, other, "DIA_Pyrokar_Nachricht_11_03"); //愿 英 诺 斯 保 护 你 。

		Sergio_Follow = TRUE;
		AI_StopProcessInfos(self);
		B_StartOtherRoutine(Sergio, "WAITFORPLAYER");
	}
	else
	{
		AI_Output(other, self, "DIA_Pyrokar_Nachricht_15_04"); //那 么 我 立 刻 前 往 矿 藏 山 谷 。
		AI_Output(self, other, "DIA_Pyrokar_Nachricht_11_05"); //好 。 既 然 你 已 经 知 道 了 去 山 谷 的 路 ， 你 就 不 需 要 护 送 了 。
		AI_Output(self, other, "DIA_Pyrokar_Nachricht_11_06"); //帮 哈 根 勋 爵 处 理 这 个 事 件 - 愿 英 诺 斯 保 护 你 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 4;
	condition		= DIA_Pyrokar_TEACH_Condition;
	information		= DIA_Pyrokar_TEACH_Info;
	permanent		= TRUE;
	description		= "教 我 最 后 一 环 魔 法 。";
};

func int DIA_Pyrokar_TEACH_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 5)
	&& (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_TEACH_15_00"); //教 我 最 后 一 环 魔 法 。

	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		if (B_TeachMagicCircle(self, other, 6))
		{
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_01"); //自 从 你 与 火 焰 缔 结 契约 之 后 ， 已 经 过 去 了 很 长 时 间 。 发 生 了 很 多 事 ， 令 我 们 无 法 安 心 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_02"); //你 是 英 诺 斯 的 选 择 者 。 所 以 你 必 须 用 尽 全 力 来 赢 得 你 的 战 斗 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_03"); //我 现 在 将 授 予 你 ， 天 选 者 。 你 已 经 进 入 第 六 环 - 愿 你 带 来 光 明 并 驱 散 黑 暗 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_04"); //如 果 你 需 要 的 话 ， 现 在 可 以 从 我 这 里 学 习 最 后 一 环 的 魔 法 公 式 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_05"); //哦 - 还 有 一 件 事 。 我 用 了 一 段 时 间 才 认 出 你 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_06"); //当 他 们 把 你 扔 进 屏 障 的 时 候 ， 你 从 我 这 里 得 到 的 那 封 信 。
			AI_Output(other, self, "DIA_Pyrokar_TEACH_15_07"); //是 的 ， 你 给 我 免 去 了 法 官 的 喋 喋 不 休 的 废 话 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_08"); //而 你 是 英 诺 斯 的 选 择 者 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_09"); //现 在 接 受 我 的 祝 福 ， 哦 ， 天 选 者 ！
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_10"); //英 诺 斯 ， 太 阳 的 光 明 和 世 界 的 火 焰 ， 祝 福 这 个 人 ， 你 选 择 的 仆 人 。
			AI_Output(self, other, "DIA_Pyrokar_TEACH_11_11"); //给 他 勇 气 、 力 量 和 智 慧 来 跟 随 你 为 他 注 定 的 道 路 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Pyrokar_TEACH_11_12"); //时 机 还 没 有 到 来 。 一 旦 你 能 在 英 诺 斯 展 现 给 你 的 道 路 上 更 进 一 步 的 话 ， 我 将 会 指 导 你 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SPELLS
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPELLS(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_SPELLS_Condition;
	information		= DIA_Pyrokar_SPELLS_Info;
	permanent		= TRUE;
	description		= "教 我 （ 制 造 咒 语 ）";
};

func int DIA_Pyrokar_SPELLS_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPELLS_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other, self, "DIA_Pyrokar_SPELLS_15_00"); //教 我 。

	Info_ClearChoices(DIA_Pyrokar_SPELLS);
	Info_AddChoice(DIA_Pyrokar_SPELLS, DIALOG_BACK, DIA_Pyrokar_SPELLS_BACK);

	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS, B_BuildLearnString(NAME_SPL_Firerain, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firerain)), DIA_Pyrokar_SPELLS_Firerain);
		abletolearn = (abletolearn + 1);
	};

	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS, B_BuildLearnString(NAME_SPL_BreathOfDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_BreathOfDeath)), DIA_Pyrokar_SPELLS_BreathOfDeath);
		abletolearn = (abletolearn + 1);
	};

	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS, B_BuildLearnString(NAME_SPL_MassDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_MassDeath)), DIA_Pyrokar_SPELLS_MassDeath);
		abletolearn = (abletolearn + 1);
	};

	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Pyrokar_SPELLS, B_BuildLearnString(NAME_SPL_Shrink, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Shrink)), DIA_Pyrokar_SPELLS_Shrink);
		abletolearn = (abletolearn + 1);
	};

	if (abletolearn < 1)
	{
		AI_Output(self, other, "DIA_Pyrokar_SPELLS_11_01"); //我 不 能 再 教 你 什 么 了 。
	};
};

func void DIA_Pyrokar_SPELLS_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_SPELLS);
};

func void DIA_Pyrokar_SPELLS_Firerain()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firerain);
};

func void DIA_Pyrokar_SPELLS_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_BreathOfDeath);
};

func void DIA_Pyrokar_SPELLS_MassDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_MassDeath);
};

func void DIA_Pyrokar_SPELLS_Shrink()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Shrink);
};

///////////////////////////////////////////////////////////////////////
//	Info Parlan
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_Parlan(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 99;
	condition		= DIA_Pyrokar_Parlan_Condition;
	information		= DIA_Pyrokar_Parlan_Info;
	description		= "帕 兰 派 我 来 … …";
};

func int DIA_Pyrokar_Parlan_Condition()
{
	if ((hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV
	|| hero.guild == GIL_PAL)
	&& (Parlan_Sends == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_Parlan_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_Parlan_15_00"); //帕 兰 让 我 来 的 。 我 想 要 增 强 我 的 魔 法 能 力 。
	AI_Output(self, other, "DIA_Pyrokar_Parlan_11_01"); //嗯 ， 你 已 经 学 会 了 很 多 ， 你 的 力 量 也 已 经 增 强 了 。 从 现 在 起 ， 你 将 从 我 这 里 学 习 。
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH MANA
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_TEACH_MANA(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 99;
	condition		= DIA_Pyrokar_TEACH_MANA_Condition;
	information		= DIA_Pyrokar_TEACH_MANA_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 魔 法 能 力 。";
};

func int DIA_Pyrokar_TEACH_MANA_Condition()
{
	if ((hero.guild == GIL_KDF
	|| hero.guild == GIL_NOV
	|| hero.guild == GIL_PAL)
	&& Npc_KnowsInfo(hero, DIA_Pyrokar_Parlan))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_TEACH_MANA_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_TEACH_MANA_15_00"); //我 想 要 增 强 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, DIALOG_BACK, DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self, other, "DIA_Pyrokar_TEACH_MANA_11_00"); //我 能 感 觉 到 魔 法 力 量 在 你 体 内 确 实 地 流 淌 。 即 便 是 我 ， 也 无 法 教 你 如 何 进 一 步 增 强 。
	};

	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
};

func void DIA_Pyrokar_TEACH_MANA_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MEGA);

	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, DIALOG_BACK, DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Pyrokar_TEACH_MANA_5);
};

func void DIA_Pyrokar_TEACH_MANA_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MEGA);

	Info_ClearChoices(DIA_Pyrokar_TEACH_MANA);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, DIALOG_BACK, DIA_Pyrokar_TEACH_MANA_BACK);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_Pyrokar_TEACH_MANA_1);
	Info_AddChoice(DIA_Pyrokar_TEACH_MANA, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_Pyrokar_TEACH_MANA_5);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PERM(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 900;
	condition		= DIA_Pyrokar_PERM_Condition;
	information		= DIA_Pyrokar_PERM_Info;
	permanent		= TRUE;
	description		= "（ 祝 福 ）";
};

func int DIA_Pyrokar_PERM_Condition()
{
	if (Kapitel >= 2)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PERM_Info()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Pyrokar_PERM_15_00"); //祝 福 我 ，大师。
	}
	else
	{
		AI_Output(other, self, "DIA_Pyrokar_PERM_15_01"); //那 么 一 点 点 的 祝 福 呢 ？ 我 很 需 要 它 。
	};

	if ((Kapitel == 5)
	&& (MIS_PyrokarClearDemonTower == LOG_SUCCESS))
	{
		AI_Output(self, other, "DIA_Pyrokar_PERM_11_02"); //愿 你 与 我 们 最 大 的 敌 人 的 最 终 之 战 以 胜 利 为 冠 。 英 诺 斯 与 你 同 在 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pyrokar_PERM_11_03"); //愿 英 诺 斯 出 现 在 所 有 你 必 须 走 过 的 邪 恶 道 路 上 ， 并 保 护 你 不 受 伤 害 。
	};
};

// ##############################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// ##############################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Pyrokar_KAP3_EXIT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 999;
	condition		= DIA_Pyrokar_KAP3_EXIT_Condition;
	information		= DIA_Pyrokar_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pyrokar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BackFromOW
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BACKFROMOW(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_BACKFROMOW_Condition;
	information		= DIA_Pyrokar_BACKFROMOW_Info;
	description		= "我 来 自 旧 矿 藏 山 谷 。";
};

func int DIA_Pyrokar_BACKFROMOW_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BACKFROMOW_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_BACKFROMOW_15_00"); //我 来 自 旧 矿 藏 山 谷 。
	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_01"); //你 要 报 告 什 么 ？
	AI_Output(other, self, "DIA_Pyrokar_BACKFROMOW_15_02"); //敌 人 已 经 在 那 里 集 合 了 一 支 兽 人 和 龙 的 军 队 。
	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_03"); //我 们 已 经 从 米 尔 腾 那 里 了 解 到 了 - 但 是 国 王 的 矿 石 运 送 情 况 呢 ？
	AI_Output(other, self, "DIA_Pyrokar_BACKFROMOW_15_04"); //他 们 在 山 谷 中 为 加 隆 德 挖 掘 的 矿 井 无 法 满 足 国 王 的 需 求 。
	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_05"); //天 空 变 得 更 加 灰 暗 ， 太 阳 的 光 线 更 加 黯 淡 。
	AI_Output(other, self, "DIA_Pyrokar_BACKFROMOW_15_06"); //我 遭 到 了 一 些 穿 着 黑 袍 子 的 人 的 袭 击 。
	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_07"); //我 知 道 。 那 些 人 是 搜 索 者 。 来 自 贝 利 尔 的 地 下 国 度 的 党 羽 。 当 心 他 们 ， 他 们 会 试 图 附 体 到 你 身 上 。
	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_08"); //一 旦 被 附 体 ， 你 就 不 再 是 你 自 己 了 。 只 有 到 修 道 院 这 里 才 能 得 到 帮 助 。 所 以 要 小 心 。

	if (hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN, LOG_RUNNING);
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_3);
	};

	if (((Npc_IsDead(Karras)) == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_09"); //我 已 经 请 求 卡 拉 斯 来 处 理 此 事 。 他 一 定 会 有 一 些 远 见 让 我 们 把 情 况 看 得 更 清 楚 。
		PyrokarToldKarrasToResearchDMT = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_4);
	};

	AI_Output(self, other, "DIA_Pyrokar_Add_11_00"); //给 - 这 个 咒 语 可 以 让 你 在 需 要 帮 助 时 直 接 返 回 修 道 院 。
	B_GiveInvItems(self, other, itru_teleportmonastery, 1);

	AI_Output(self, other, "DIA_Pyrokar_BACKFROMOW_11_10"); //记 住 ， 我 们 必 须 反 抗 ， 不 然 我 们 全 都 会 死 亡 。
};

///////////////////////////////////////////////////////////////////////
//	Info GiveInnoseye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GIVEINNOSEYE(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 31;
	condition		= DIA_Pyrokar_GIVEINNOSEYE_Condition;
	information		= DIA_Pyrokar_GIVEINNOSEYE_Info;
	description		= "我 是 来 拿 英 诺 斯 之 眼 的 。";
};

func int DIA_Pyrokar_GIVEINNOSEYE_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_HasItems(other, ItWr_PermissionToWearInnosEye_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_GIVEINNOSEYE_15_00"); //我 是 来 拿 英 诺 斯 之 眼 的 。
	B_GiveInvItems(other, self, ItWr_PermissionToWearInnosEye_MIS, 1);
	// Joly: hier kein B_UseFakeScroll(); Pyrokar poppt aus seinem Thron!!!
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_01"); //我 看 到 你 已 经 拿 来 了 哈 根 勋 爵 亲 笔 所 写 的 持 有 英 诺 斯 之 眼 的 许 可 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_02"); //我 恐 怕 要 让 你 失 望 了 。 我 们 已 经 沦 为 敌 人 的 一 个 险 恶 阴 谋 的 牺 牲 品 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_11_03"); //英 诺 斯 之 眼 被 暴 力 从 这 神 圣 的 墙 后 带 走 了 。

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE, "是 谁 这 么 厚 颜 无 耻 ， 大 师 ？", DIA_Pyrokar_GIVEINNOSEYE_wer);
	}
	else
	{
		Info_AddChoice(DIA_Pyrokar_GIVEINNOSEYE, "是 谁 这 么 厚 颜 无 耻 ， 大 师 ？", DIA_Pyrokar_GIVEINNOSEYE_wer);
	};
};

func void DIA_Pyrokar_GIVEINNOSEYE_wer()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_00"); //是 谁 这 么 厚 颜 无 耻 ， 大 师 ？
	}
	else
	{
		AI_Output(other, self, "DIA_Pyrokar_GIVEINNOSEYE_wer_15_01"); //这 是 谁 干 的 ？
	};

	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_02"); //邪 恶 是 狡 猾 的 ， 而 且 通 常 会 悄 悄 地 进 行 。 你 极 少 会 看 到 它 在 大 庭 广 众 下 浮 现 并 实 行 它 邪 恶 的 阴 谋 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_03"); //但 是 这 些 天 来 ， 它 已 经 是 另 一 种 情 况 了 。 敌 人 现 在 公 然 在 街 道 上 、 每 个 人 家 中 和 每 一 个 公 共 场 所 露 面 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_04"); //这 只 能 表 明 ， 他 已 经 不 怕 任 何 敌 人 ， 而 且 不 会 再 对 任 何 事 情 退 缩 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_05"); //我 们 的 一 个 最 忠 实 的 追 随 者 ， 高 贵 的 火 魔 法 师 长 袍 的 继 承 者 ， 突 然 改 变 了 他 的 忠 诚 ， 并 做 出 了 令 人 担 忧 的 邪 恶 的 举 动 。 比 德 罗 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_06"); //敌 人 已 经 占 据 了 他 的 身 体 ， 并 使 我 们 遭 受 了 可 怕 的 挫 折 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_07"); //比 德 罗 已 经 逃 出 我 们 最 神 圣 的 殿 堂 ， 并 且 偷 走 了 ‘ 眼 睛 ’ 。
	AI_Output(self, other, "DIA_Pyrokar_GIVEINNOSEYE_wer_11_08"); //我 担 心 他 只 是 独 自 度 过 了 太 多 的 时 间 ， 在 大 门 和 修 道 院 的 保 护 墙 之 外 ， 暴 露 在 大 量 潜 伏 的 危 险 之 中 。

	Pedro.flags = 0; // Joly: Pedro ist nun mortal und zum Abschuß freigegeben.
	Pedro_Traitor = TRUE; // Joly: Pedro ist für den SC nun als Traitor bekannt. Muß hier stehen bleiben und darf nur einmal auf True gesetzt werden

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_13);
	Log_AddEntry(TOPIC_TraitorPedro, TOPIC_TraitorPedro_2);
};

///////////////////////////////////////////////////////////////////////
//	Info NOVIZENCHASE
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_NOVIZENCHASE(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 34;
	condition		= DIA_Pyrokar_NOVIZENCHASE_Condition;
	information		= DIA_Pyrokar_NOVIZENCHASE_Info;
	description		= "那 个 贼 逃 到 哪 里 去 了 ？";
};

func int DIA_Pyrokar_NOVIZENCHASE_Condition()
{
	if ((Kapitel == 3)
	&& (Pedro_Traitor == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_NOVIZENCHASE_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_NOVIZENCHASE_15_00"); //那 个 贼 逃 到 哪 里 去 了 ？
	AI_Output(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_01"); //比 德 罗 打 到 了 一 些 试 图 阻 止 他 的 新 信 徒 ， 并 消 失 在 晨 雾 之 中 。
	AI_Output(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_02"); //很 多 新 信 徒 已 经 去 追 他 了 ， 并 试 图 把 ‘ 眼 睛 ’ 安 然 无 恙 地 带 回 这 里 。
	AI_Output(self, other, "DIA_Pyrokar_NOVIZENCHASE_11_03"); //如 果 你 想 跟 上 他 们 的 话 ， 那 你 要 尽 快 行 动 ， 赶 在 比 德 罗 消 失 在 你 的 追 击 范 围 之 前 。

	MIS_NovizenChase = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundInnosEye
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_FOUNDINNOSEYE(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 35;
	condition		= DIA_Pyrokar_FOUNDINNOSEYE_Condition;
	information		= DIA_Pyrokar_FOUNDINNOSEYE_Info;
	description		= "我 已 经 找 到 了 英 诺 斯 之 眼 。";
};

func int DIA_Pyrokar_FOUNDINNOSEYE_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_NovizenChase == LOG_RUNNING)
	&& ((Npc_HasItems(other, ItMi_InnosEye_Broken_MIS)) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_FOUNDINNOSEYE_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_00"); //我 已 经 找 到 了 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_01"); //但 是 … … 那 不 可 能 。 发 生 了 什 么 事 ？
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_02"); //有 些 十 分 险 恶 的 家 伙 得 到 了 它 。 无 论 如 何 ， 我 到 的 太 晚 了 。
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_15_03"); //他 们 在 那 边 丛 林 里 一 个 新 月 形 的 祭 坛 上 施 展 了 一 种 奇 怪 的 咒 语 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_04"); //英 诺 斯 与 我 们 同 在 ， 他 们 已 经 玷 污 了 我 们 的 太 阳 之 环 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_11_05"); //即 便 在 我 最 恐 怖 的 噩 梦 中 ， 我 也 无 法 想 象 他 们 竟 然 拥 有 这 样 的 力 量 。

	MIS_SCKnowsInnosEyeIsBroken = TRUE;
	MIS_NovizenChase = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);

	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, "我 们 现 在 能 做 什 么 ？", DIA_Pyrokar_FOUNDINNOSEYE_was);
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was()
{
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_15_00"); //我 们 现 在 能 做 什 么 ？
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_01"); //敌 人 已 经 变 得 非 常 强 大 。 然 而 ， 这 件 远 古 宝 物 对 他 是 一 种 极 大 的 威 胁 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_02"); //我 们 必 须 修 复 ‘ 眼 睛 ’ ， 并 恢 复 它 的 以 前 的 力 量 。 不 过 时 间 是 我 们 最 不 利 的 因 素 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_03"); //我 不 敢 去 想 我 们 将 会 遇 到 什 么 样 的 情 况 。 没 有 了 ‘ 眼 睛 ’ 的 保 护 ， 我 们 将 绝 望 地 任 由 敌 人 摆 布 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_11_04"); //去 找 瓦 卓 斯 ， 镇 上 的 水 法 师 。 在 这 可 怕 的 情 况 下 ， 只 有 他 知 道 我 们 要 怎 么 做 。 带 上 ‘ 眼 睛 ’ 去 找 他 ， 快 点 。

	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, DIALOG_BACK, DIA_Pyrokar_FOUNDINNOSEYE_weiter);
	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, "为 什 么 是 瓦 卓 斯 ？", DIA_Pyrokar_FOUNDINNOSEYE_was_vatras);
	};

	Info_AddChoice(DIA_Pyrokar_FOUNDINNOSEYE, "太 阳 之 环 是 什 么 ？", DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis);

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_14);

	MIS_Pyrokar_GoToVatrasInnoseye = LOG_RUNNING;
};

func void DIA_Pyrokar_FOUNDINNOSEYE_was_vatras()
{
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00"); //为 什 么 是 瓦 卓 斯 ？
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01"); //法 律 的 特 权 并 没 有 给 你 质 疑 我 的 指 令 的 权 力 ， 兄 弟 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02"); //瓦 卓 斯 是 亚 达 诺 斯 的 仆 从 。 水 法 师 的 知 识 将 在 这 黑 暗 时 期 给 我 们 澄 清 道 路 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03"); //你 们 不 能 上 这 艘 船 的 。 这 就 是 你 们 要 知 道 的 。
};

func void DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis()
{
	AI_Output(other, self, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00"); //太 阳 之 环 是 什 么 ？
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01"); //每 年 至 日 的 时 候 ， 修 道 院 所 有 的 魔 法 师 和 新 信 徒 都 要 到 这 个 地 方 来 ， 标 志 着 新 周 期 的 开 始 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02"); //这 个 地 方 充 满 了 太 阳 无 穷 尽 的 力 量 。
	AI_Output(self, other, "DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03"); //我 从 来 没 有 些 许 的 概 念 怀 疑 ， 它 的 力 量 竟 然 可 以 颠 倒 。 而 且 竟 然 真 的 发 生 了 。
};

func void DIA_Pyrokar_FOUNDINNOSEYE_weiter()
{
	Info_ClearChoices(DIA_Pyrokar_FOUNDINNOSEYE);
};

///////////////////////////////////////////////////////////////////////
//	Info spokeToVatras
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SPOKETOVATRAS(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_SPOKETOVATRAS_Condition;
	information		= DIA_Pyrokar_SPOKETOVATRAS_Info;
	description		= "我 已 经 同 瓦 卓 斯 谈 过 了 。";
};

func int DIA_Pyrokar_SPOKETOVATRAS_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SPOKETOVATRAS_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_00"); //我 已 经 同 瓦 卓 斯 谈 过 了 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_01"); //啊 ， 好 。 他 在 哪 里 ？
	AI_Output(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_02"); //他 正 在 太 阳 之 环 准 备 一 个 仪 式 ， 为 了 复 原 英 诺 斯 之 眼 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_03"); //如 果 那 是 真 的 ， 那 么 最 终 也 许 还 有 希 望 。
	AI_Output(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_04"); //瓦 卓 斯 想 要 艾 克 萨 达 斯 和 你 一 起 帮 助 他 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_05"); //什 么 ？ 艾 克 萨 达 斯 也 会 去 那 里 ？ 你 不 是 认 真 的 吧 。
	AI_Output(other, self, "DIA_Pyrokar_SPOKETOVATRAS_15_06"); //嘿 。 这 不 是 我 的 决 定 。 是 瓦 卓 斯 坚 持 的 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_07"); //总 是 那 个 艾 克 萨 达 斯 。 我 讨 厌 他 。 事 情 会 变 得 更 糟 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_08"); //那 我 怎 么 才 能 知 道 那 个 艾 克 萨 达 斯 没 有 和 敌 人 结 盟 呢 ？
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_09"); //我 不 相 信 艾 克 萨 达 斯 ， 无 论 我 们 是 多 需 要 他 。
	AI_Output(self, other, "DIA_Pyrokar_SPOKETOVATRAS_11_10"); //我 很 抱 歉 ， 但 是 在 这 种 情 况 下 ， 我 不 能 帮 助 瓦 卓 斯 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info XardasVertrauen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_XARDASVERTRAUEN(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_XARDASVERTRAUEN_Condition;
	information		= DIA_Pyrokar_XARDASVERTRAUEN_Info;
	description		= "如 果 没 有 你 ， 就 不 可 能 成 功。";
};

func int DIA_Pyrokar_XARDASVERTRAUEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pyrokar_SPOKETOVATRAS))
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_XARDASVERTRAUEN_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_00"); //如 果 没 有 你 不 可 能 成 功 ， 因 为 瓦 卓 斯 无 法 执 行 仪 式 。
	AI_Output(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_01"); //你 一 定 要 信 任 艾 克 萨 达 斯 。
	AI_Output(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_02"); //没 有 什 么 事 情 是 我 必 须 要 做 的 ， 你 知 道 吗 ？ 我 没 有 看 到 一 点 证 据 证 明 艾 克 萨 达 斯 不 是 在 反 对 我 们 。 我 不 能 这 样 做 。
	AI_Output(other, self, "DIA_Pyrokar_XARDASVERTRAUEN_15_03"); //如 果 我 能 给 你 带 来 一 些 证 据 呢 ？
	AI_Output(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_04"); //我 想 那 不 可 能 。 那 一 定 会 让 我 感 到 震 惊 。
	AI_Output(self, other, "DIA_Pyrokar_XARDASVERTRAUEN_11_05"); //只 要 有 艾 克 萨 达 斯 涉 及 其 中 ， 我 怀 疑 他 是 否 又 会 让 我 大 吃 一 惊 。

	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_15);

	Pyrokar_DeniesInnosEyeRitual = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Buchzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHZURUECK(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_BUCHZURUECK_Condition;
	information		= DIA_Pyrokar_BUCHZURUECK_Info;
	description		= "我 从 艾 克 萨 达 斯 那 里 拿 来 了 这 本 书 。";
};

func int DIA_Pyrokar_BUCHZURUECK_Condition()
{
	if ((Npc_HasItems(other, ItWr_XardasBookForPyrokar_Mis))
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHZURUECK_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_BUCHZURUECK_15_00"); //我 从 艾 克 萨 达 斯 那 里 拿 来 了 这 本 书 。
	AI_Output(other, self, "DIA_Pyrokar_BUCHZURUECK_15_01"); //这 是 他 值 得 信 任 的 标 志 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_02"); //让 我 看 看 。
	B_GiveInvItems(other, self, ItWr_XardasBookForPyrokar_Mis, 1);
	Npc_RemoveInvItems(self, ItWr_XardasBookForPyrokar_Mis, 1);
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_03"); //（ 吃 惊 的 ） 这 真 是 难 以 置 信 。 你 对 刚 刚 给 我 的 东 西 是 否 有 一 丁 点 的 了 解 呢 ？
	AI_Output(other, self, "DIA_Pyrokar_BUCHZURUECK_15_04"); //嗯 。 不 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_05"); //（ 恼 怒 的 ） 这 是 一 本 古 代 的 、 失 传 已 久 的 著 作 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_06"); //我 们 都 以 为 它 已 经 永 久 消 失 了 ， 现 在 我 相 信 艾 克 萨 达 斯 一 直 都 了 解 和 它 相 关 的 事 情 。
	AI_Output(other, self, "DIA_Pyrokar_BUCHZURUECK_15_07"); //那 么 你 愿 意 去 那 里 参 加 仪 式 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_08"); //是 的 ， 我 将 起 身 去 太 阳 之 环 ， 但 是 ， 当 然 不 是 因 为 我 确 信 了 艾 克 萨 达 斯 的 善 良 意 图 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_09"); //实 际 上 ， 我 要 让 这 个 骗 子 解 释 他 这 么 多 年 来 把 这 本 书 藏 在 哪 里 了 。 他 这 次 做 得 太 过 火 了 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHZURUECK_11_10"); //我 们 在 太 阳 之 环 见 面 。

	AI_StopProcessInfos(self);
	AI_UseMob(self, "THRONE", -1);
	Npc_ExchangeRoutine(self, "RitualInnosEyeRepair");
	B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_16);
	Pyrokar_GoesToRitualInnosEye = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info preRitual
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PRERITUAL(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_PRERITUAL_Condition;
	information		= DIA_Pyrokar_PRERITUAL_Info;
	permanent		= TRUE;
	description		= "你 认 为 你 能 把 眼 睛 再 修 补 好 吗 ？";
};

func int DIA_Pyrokar_PRERITUAL_Condition()
{
	if ((Pyrokar_GoesToRitualInnosEye == TRUE)
	&& (MIS_RitualInnosEyeRepair == LOG_RUNNING)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PRERITUAL_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_PRERITUAL_15_00"); //你 觉 得 你 能 把 ‘ 眼 睛 ’ 修 补 好 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_PRERITUAL_11_01"); //很 难 说 。 我 们 等 等 看 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info AugeGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AUGEGEHEILT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_AUGEGEHEILT_Condition;
	information		= DIA_Pyrokar_AUGEGEHEILT_Info;
	description		= "你 成 功 了 。 英 诺 斯 之 眼 已 经 复 原 了 。";
};

func int DIA_Pyrokar_AUGEGEHEILT_Condition()
{
	if ((MIS_RitualInnosEyeRepair == LOG_SUCCESS)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AUGEGEHEILT_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_00"); //你 成 功 了 。 英 诺 斯 之 眼 已 经 复 原 了 。
	AI_Output(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_01"); //你 成 功 了 。 英 诺 斯 之 眼 已 经 复 原 了 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Pyrokar_AUGEGEHEILT_15_02"); //是 的 ， 大 师 。
		AI_Output(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_03"); //你 已 经 多 次 证 明 你 已 经 准 备 好 成 为 一 名 高 级 火 魔 法 师 。
		AI_Output(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_04"); //现 在 ， 你 已 经 是 议 会 成 员 ， 并 将 出 席 我 们 在 尘 世 上 的 修 道 会 。 你 现 在 是 一 名 高 级 火 魔 法 师 了 。
		AI_Output(self, other, "DIA_Pyrokar_AUGEGEHEILT_11_05"); //穿 上 这 件 高 贵 的 高 级 法 衣 ， 并 为 修 道 会 带 来 荣 誉 和 财 富 ， 我 的 兄 弟 。

		CreateInvItem(hero, ITAR_KDF_H);
		AI_EquipArmor(hero, ITAR_KDF_H);

		heroGIL_KDF2 = TRUE;
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Kap4_Ready
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_KAP3_READY(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 30;
	condition		= DIA_Pyrokar_KAP3_READY_Condition;
	information		= DIA_Pyrokar_KAP3_READY_Info;
	description		= "这 里 还 有 什 么 要 做 的 ？";
};

func int DIA_Pyrokar_KAP3_READY_Condition()
{
	if ((Kapitel == 3)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_AUGEGEHEILT)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP3_READY_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_KAP3_READY_15_00"); //我 在 这 里 还 有 什 么 要 做 的 ？
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_01"); //不 要 在 琐 事 上 浪 费 你 的 时 间 ， 去 把 龙 打 败 。 给 ， 拿 上 ‘ 眼 睛 ’ 。
	CreateInvItems(self, ItMi_InnosEye_MIS, 1);
	B_GiveInvItems(self, other, ItMi_InnosEye_MIS, 1);
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_02"); //切 记 在 攻 击 龙 之 前 ， 先 和 他 说 话 。
	// AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_03"); // Das Auge wird dir helfen, die Drachen dazu zu zwingen, mit dir zu reden.
	// AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_04"); // Es bietet dir nicht nur Schutz gegen ihre Angriffe, es fügt ihnen auch unerträgliche Schmerzen zu, wenn du es bei dir trägst.
	AI_Output(self, other, "DIA_Pyrokar_Add_11_01"); //‘ 眼 睛 ’ 的 力 量 将 会 迫 使 龙 与 你 交 谈 ， 并 说 出 真 相 。
	AI_Output(self, other, "DIA_Pyrokar_Add_11_02"); //此 外 ， 当 你 装 备 它 的 时 候 ， 它 能 保 护 你 对 抗 他 们 的 攻 击 。
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_05"); //可 是 ， 它 的 力 量 无 法 持 久 。 你 必 须 要 重 新 用 魔 法 能 量 充 满 它 。
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_06"); //要 那 么 做 ， 你 需 要 龙 之 心 的 精 华 ， 并 在 炼 金 术 士 工 作 台 上 把 它 与 ‘ 眼 睛 ’ 结 合 起 来 。
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_07"); //只 有 那 时 你 才 能 去 面 对 另 一 头 龙 。
	AI_Output(other, self, "DIA_Pyrokar_KAP3_READY_15_08"); //谢 谢 。 我 会 记 住 的 。
	AI_Output(self, other, "DIA_Pyrokar_KAP3_READY_11_09"); //你 现 在 已 经 有 了 所 需 的 一 切 。 那 出 发 吧 。 你 没 有 剩 下 多 少 时 间 了 。

	PLAYER_TALENT_ALCHEMY[Charge_InnosEye] = TRUE;
	PrintScreen(PRINT_LearnAlchemyInnosEye, -1, -1, FONT_Screen, 2);
	TOPIC_END_INNOSEYE = TRUE;
	B_GivePlayerXP(XP_Ambient);

	CreateInvItems(Gorax, ItMi_RuneBlank, 1);

	Log_CreateTopic(TOPIC_DRACHENJAGD, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD, LOG_RUNNING);
	B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_10);

	MIS_ReadyforChapter4 = TRUE; // Joly: Mit dieser Varible in den Levelchange zur OW -> Kapitel 4
	B_NPC_IsAliveCheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info BuchderBessenen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHDERBESSENEN(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 39;
	condition		= DIA_Pyrokar_BUCHDERBESSENEN_Condition;
	information		= DIA_Pyrokar_BUCHDERBESSENEN_Info;
	description		= "我 找 到 了 一 本 奇 怪 的 年 鉴 。";
};

func int DIA_Pyrokar_BUCHDERBESSENEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pyrokar_BACKFROMOW))
	&& (Npc_HasItems(other, ITWR_DementorObsessionBook_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHDERBESSENEN_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_00"); //我 找 到 了 一 本 奇 怪 的 年 鉴 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_01"); //真 的 ？ 那 是 什 么 样 的 年 鉴 ？
	AI_Output(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_02"); //我 不 知 道 。 我 以 为 你 知 道 怎 么 处 理 它 。
	B_GiveInvItems(other, self, ITWR_DementorObsessionBook_MIS, 1);
	AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_03"); //的 确 ， 那 相 当 令 人 不 安 。 我 很 高 兴 你 把 它 给 我 拿 来 了 ， 那 非 常 明 智 。
	B_GivePlayerXP(XP_Ambient);

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_04"); //我 认 为 还 有 更 多 这 样 的 书 。 去 寻 找 其 它 那 些 诅 咒 之 书 。
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_05"); //我 怀 疑 它 可 能 是 搜 索 者 力 量 的 工 具 。
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_06"); //他 们 使 用 它 来 控 制 他 们 那 些 受 害 人 的 失 落 灵 魂 。
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_07"); //很 显 然 ， 他 们 把 那 些 准 备 要 附 体 的 人 的 名 字 写 在 这 些 书 上 。
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_08"); //听 着 。 我 要 给 你 这 封 魔 法 信 。 它 将 会 告 诉 你 书 上 写 的 是 谁 的 名 字 。
		CreateInvItems(self, ItWr_PyrokarsObsessionList, 1);
		B_GiveInvItems(self, other, ItWr_PyrokarsObsessionList, 1);
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_09"); //找 到 那 些 受 害 人 ， 并 把 他 们 的 书 给 我 拿 来 。 我 将 来 处 理 他 们 。

		if ((Npc_IsDead(Karras)) == FALSE)
		{
			AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_10"); //但 是 首 先 ， 你 必 须 把 它 们 中 的 一 个 给 卡 拉 斯 看 一 下 ， 也 许 那 对 他 的 研 究 有 帮 助 。
		};

		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_11"); //但 是 不 要 错 误 地 试 图 自 己 消 灭 他 们 。 你 还 没 有 做 好 反 抗 他 们 力 量 的 准 备 。

		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_5);
	};

	AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_12"); //不 要 靠 那 些 搜 索 者 太 近 ， 否 则 他 们 将 会 附 体 到 你 身 上 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_13"); //如 果 你 仍 旧 发 现 自 己 无 法 抵 抗 他 们 的 召 唤 ， 那 就 尽 快 回 到 我 这 里 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_14"); //只 有 在 修 道 院 这 里 ， 你 的 灵 魂 才 能 得 到 拯 救 。

	if (((Npc_IsDead(Karras)) == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		AI_Output(other, self, "DIA_Pyrokar_BUCHDERBESSENEN_15_15"); //没 有 防 护 能 够 抵 抗 他 们 的 精 神 攻 击 吗 ？
		AI_Output(self, other, "DIA_Pyrokar_BUCHDERBESSENEN_11_16"); //有 那 种 可 能 。 卡 拉 斯 可 能 了 解 一 些 情 况 。
		Pyrokar_AskKarrasAboutDMTAmulett = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_6);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SCObsessed
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCOBSESSED(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 70;
	condition		= DIA_Pyrokar_SCOBSESSED_Condition;
	information		= DIA_Pyrokar_SCOBSESSED_Info;
	permanent		= TRUE;
	description		= "（ 治 疗 着 魔 ）";
};

func int DIA_Pyrokar_SCOBSESSED_Condition()
{
	if (SC_IsObsessed == TRUE)
	{
		return TRUE;
	};
};

var int Got_HealObsession_Day;
func void DIA_Pyrokar_SCOBSESSED_Info()
{
	if (((Got_HealObsession_Day <= (Wld_GetDay() - 2)) || (Got_HealObsession_Day == 0))
	&& (Npc_HasItems(other, ItPo_HealObsession_MIS) == FALSE))
	{
		if (hero.guild == GIL_KDF)
		{
			AI_Output(other, self, "DIA_Pyrokar_SCOBSESSED_15_00"); //治 疗 我 ， 大 师 ， 因 为 我 被 附 体 了 。

			AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_01"); //是 这 样 的 ！ 拿 上 这 个 药 剂 。 它 能 把 你 从 噩 梦 中 解 脱 出 来 。
			AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_02"); //愿 英 诺 斯 的 慈 悲 拯 救 你 。
			AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_03"); //以 他 的 名 义 行 事 ， 并 留 神 敌 人 邪 恶 的 眼 睛 。

			if (SC_ObsessionTimes > 3)
			{
				AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_04"); //但 是 事 先 警 告 你 - 如 果 你 过 于 频 繁 地 暴 露 在 他 们 的 力 量 之 下 的 话 ， 有 一 天 你 将 无 法 再 恢 复 。 要 牢 记 。
			};

			CreateInvItems(self, ItPo_HealObsession_MIS, 2);
			B_GiveInvItems(self, other, ItPo_HealObsession_MIS, 2);
			Got_HealObsession_Day = Wld_GetDay();
		}
		else
		{
			AI_Output(other, self, "DIA_Pyrokar_SCOBSESSED_15_05"); //我 想 我 被 附 体 了 ， 你 能 治 好 我 吗 ？
			AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_06"); //没 有 你 对 这 座 修 道 院 表 达 的 尊 敬 是 不 行 的 ， 孩 子 。300枚 金 币 。

			Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED, "这 太 多 了 。", DIA_Pyrokar_SCOBSESSED_nein);
			Info_AddChoice(DIA_Pyrokar_SCOBSESSED, "棒 极 了 。 这 是 钱 。", DIA_Pyrokar_SCOBSESSED_ok);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_11_07"); //但 是 你 刚 刚 拿 过 你 的 治 疗 药 剂 。 只 有 当 你 真 正 需 要 我 的 帮 助 时 再 回 来 。
	};
};

func void DIA_Pyrokar_SCOBSESSED_ok()
{
	AI_Output(other, self, "DIA_Pyrokar_SCOBSESSED_ok_15_00"); //棒 极 了 。 这 是 钱 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 300))
	{
		AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_01"); //给 ， 喝 了 这 个 。 愿 英 诺 斯 的 慈 悲 拯 救 你 。
		CreateInvItems(self, ItPo_HealObsession_MIS, 2);
		B_GiveInvItems(self, other, ItPo_HealObsession_MIS, 2);
		Got_HealObsession_Day = Wld_GetDay();
	}
	else
	{
		AI_Output(self, other, "DIA_Pyrokar_SCOBSESSED_ok_11_02"); //给 我 钱 ， 那 样 才 会 得 到 帮 助 。
	};

	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

func void DIA_Pyrokar_SCOBSESSED_nein()
{
	AI_Output(other, self, "DIA_Pyrokar_SCOBSESSED_nein_15_00"); //那 太 多 了。
	Info_ClearChoices(DIA_Pyrokar_SCOBSESSED);
};

///////////////////////////////////////////////////////////////////////
//	Info AlmanachBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_AlmanachBringen(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 5;
	condition		= DIA_Pyrokar_AlmanachBringen_Condition;
	information		= DIA_Pyrokar_AlmanachBringen_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 中 邪 的 人 我 还 可 以 告 诉 你 一 些 事 。";
};

func int DIA_Pyrokar_AlmanachBringen_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_HasItems(other, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_BUCHDERBESSENEN)))
	{
		return TRUE;
	};
};

var int AlmanachCounter;
var int DIA_Pyrokar_AlmanachBringen_OneTime;

func void DIA_Pyrokar_AlmanachBringen_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_AlmanachBringen_15_00"); //关 于 那 些 中 邪 的 人 我 还 可 以 告 诉 你 一 些 事 。
	AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_01"); //说 吧 ， 兄 弟 。

	var int AlmanachCount;
	var int XP_KDF_BringAlmanachs;
	var int AlmanachGeld;
	var int PyrokarsAlmanachOffer;

	PyrokarsAlmanachOffer = 400; // Joly: Gold für einen Almanach

	AlmanachCount = Npc_HasItems(other, ITWR_DementorObsessionBook_MIS);

	if (AlmanachCount == 1)
	{
		AI_Output(other, self, "DIA_Pyrokar_AlmanachBringen_15_02"); //我 已 经 找 到 了 另 一 本 年 鉴 。
		B_GivePlayerXP(XP_KDF_BringAlmanach);
		B_GiveInvItems(other, self, ITWR_DementorObsessionBook_MIS, 1);
		AlmanachCounter = AlmanachCounter + 1;
	}
	else
	{
		AI_Output(other, self, "DIA_Pyrokar_AlmanachBringen_15_03"); //我 有 更 多 的 搜 索 者 的 书 给 你 。

		B_GiveInvItems(other, self, ITWR_DementorObsessionBook_MIS, AlmanachCount);

		XP_KDF_BringAlmanachs = (AlmanachCount * XP_KDF_BringAlmanach);
		AlmanachCounter = (AlmanachCounter + AlmanachCount);

		B_GivePlayerXP(XP_KDF_BringAlmanachs);
	};

	if (AlmanachCounter <= 5)
	{
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_04"); //很 好 。 不 过 我 认 为 ， 那 些 还 有 更 多 可 以 找 到 。 接 着 去 搜 索 吧 。
	}
	else if (AlmanachCounter <= 8)
	{
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_05"); //大 部 分 都 已 经 找 到 了 。 但 是 我 觉 得 我 们 还 没 有 把 它 们 全 部 找 到 。
	}
	else
	{
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_06"); //你 已 经 给 我 带 来 了 大 量 敌 人 的 书 。
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_07"); //如 果 它 们 还 有 更 多 在 流 通 的 话 ， 我 会 感 到 惊 讶 的 。
	};

	AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_08"); //拿 上 这 个 。 这 件 来 自 修 道 院 的 礼 物 会 帮 助 你 对 抗 邪 恶 。
	if (DIA_Pyrokar_AlmanachBringen_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_09"); //而 且 要 记 住 时 常 看 一 下 我 的 魔 法 信 。
		AI_Output(self, other, "DIA_Pyrokar_AlmanachBringen_11_10"); //有 可 能 他 们 还 会 对 其 他 名 字 没 有 出 现 在 年 鉴 上 的 人 做 出 类 似 的 事 情 。
		DIA_Pyrokar_AlmanachBringen_OneTime = TRUE;
	};

	AlmanachGeld = (AlmanachCount * PyrokarsAlmanachOffer);

	CreateInvItems(self, ItMi_Gold, AlmanachGeld);
	B_GiveInvItems(self, other, ItMi_Gold, AlmanachGeld);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Pyrokar_KAP4_EXIT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 999;
	condition		= DIA_Pyrokar_KAP4_EXIT_Condition;
	information		= DIA_Pyrokar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pyrokar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Pyrokar_KAP5_EXIT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 999;
	condition		= DIA_Pyrokar_KAP5_EXIT_Condition;
	information		= DIA_Pyrokar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pyrokar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Drachentot
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DRACHENTOT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_DRACHENTOT_Condition;
	information		= DIA_Pyrokar_DRACHENTOT_Info;
	description		= "所 有 的 龙 都 死 了 。";
};

func int DIA_Pyrokar_DRACHENTOT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DRACHENTOT_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_DRACHENTOT_15_00"); //所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Pyrokar_DRACHENTOT_11_01"); //那 真 是 一 个 好 消 息 。 但 是 它 对 我 们 目 前 无 望 的 境 地 没 有 丝 毫 改 善 。
	AI_Output(self, other, "DIA_Pyrokar_DRACHENTOT_11_02"); //搜 索 者 仍 旧 没 有 离 开 。 相 反 的 是 ， 我 在 最 近 几 天 中 听 到 更 多 的 报 告 说 ， 他 们 的 数 量 已 经 增 加 了 。
	AI_Output(self, other, "DIA_Pyrokar_DRACHENTOT_11_03"); //杀 掉 了 龙 ， 给 敌 人 造 成 了 一 记 重 击 ， 但 是 这 还 不 够 。 我 们 要 把 邪 恶 的 根 源 挖 掘 出 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info DerMeister
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DERMEISTER(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_DERMEISTER_Condition;
	information		= DIA_Pyrokar_DERMEISTER_Info;
	description		= "我 和 龙 谈 过 了 。";
};

func int DIA_Pyrokar_DERMEISTER_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DERMEISTER_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_DERMEISTER_15_00"); //我 和 龙 谈 过 了 。
	AI_Output(self, other, "DIA_Pyrokar_DERMEISTER_11_01"); //他 们 说 什 么 ？
	AI_Output(other, self, "DIA_Pyrokar_DERMEISTER_15_02"); //他 们 不 断 在 谈 论 他 们 主 人 的 力 量 ， 以 及 他 是 怎 么 在 伊 尔 多 拉 斯 大 厅 安 家 的 。
	AI_Output(self, other, "DIA_Pyrokar_DERMEISTER_11_03"); //英 诺 斯 与 我 们 同 在 。 黑 暗 神 殿 已 经 恢 复 了 它 的 力 量 ， 并 把 他 的 党 羽 送 进 我 们 的 世 界 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasIstIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_WASISTIRDORATH(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_WASISTIRDORATH_Condition;
	information		= DIA_Pyrokar_WASISTIRDORATH_Info;
	description		= "这 些 伊 尔 多 拉 斯 大 厅 是 什 么 ？";
};

func int DIA_Pyrokar_WASISTIRDORATH_Condition()
{
	if ((Kapitel == 5)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_DERMEISTER)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_WASISTIRDORATH_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_00"); //这 些 伊 尔 多 拉 斯 大 厅 是 什 么 ？
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_01"); //东 边 的 贝 利 尔 神 的 诅 咒 神 殿 。 它 们 在 米 尔 塔 纳 的 陆 地 上 共 有 四 个 。 但 是 这 一 座 可 能 是 它 们 之 间 最 恐 怖 的 一 个 。
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_02"); //大 约 在40年 之 前 ， 北 边 和 西 边 的 恐 怖 之 神 的 神 殿 被 摧 毁 了 。
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_03"); //那 个 时 期 勇 敢 的 骑 士 们 全 力 将 那 些 非 凡 的 建 筑 夷 为 平 地 。
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_04"); //那 时 候 ， 黑 暗 部 落 在 面 对 数 量 及 英 雄 般 的 勇 气 均 占 优 势 的 骑 士 和 圣 骑 士 时 ， 毫 无 还 手 之 力 。
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_05"); //那 么 毁 掉 其 它 两 座 神 殿 并 永 远 消 灭 大 地 上 的 邪 恶 也 应 该 很 容 易 …
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_06"); //… 但 是 在 第 二 座 神 殿 倒 下 后 ， 它 们 消 失 了 。
	AI_Output(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_07"); //（ 嘲 弄 的 ） 消 失 。整 座 神 殿 。 是 的 ， 对 ！
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_08"); //不 要 嘲 笑 我 。 情 况 十 分 严 重 。 如 果 伊 尔 多 拉 斯 大 厅 确 实 恢 复 了 它 们 的 力 量 ， 那 么 要 击 败 敌 人 就 没 有 那 么 容 易 。
	AI_Output(self, other, "DIA_Pyrokar_WASISTIRDORATH_11_09"); //为 此 ， 你 首 先 要 找 到 它 ， 而 我 认 为 这 将 是 你 下 一 个 、 以 及 最 困 难 的 任 务 。
	AI_Output(other, self, "DIA_Pyrokar_WASISTIRDORATH_15_10"); //我 们 将 会 留 心 。

	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_5);
};

///////////////////////////////////////////////////////////////////////
//	Info BuchIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_BUCHIRDORATH(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 54;
	condition		= DIA_Pyrokar_BUCHIRDORATH_Condition;
	information		= DIA_Pyrokar_BUCHIRDORATH_Info;
	description		= "艾 克 萨 达 斯 的 书 确 实 已 经 失 踪 了 - 它 在 哪 里 ？";
};

func int DIA_Pyrokar_BUCHIRDORATH_Condition()
{
	if ((Kapitel == 5)
	&& (ItWr_HallsofIrdorathIsOpen == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_WASISTIRDORATH)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_BUCHIRDORATH_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_00"); //艾 克 萨 达 斯 的 书 确 实 已 经 失 踪 了 - 它 在 哪 里 ？
	AI_Output(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_01"); //我 知 道 你 会 问 起 那 事 。 但 恐 怕 那 对 你 也 没 有 帮 助 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_02"); //它 已 经 被 魔 法 封 印 了 。 它 被 送 到 我 们 的 地 下 室 ， 然 而 ， 迄 今 为 止 ， 我 们 试 图 将 它 打 开 的 所 有 努 力 都 是 徒 劳 的 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_03"); //那 个 该 死 的 艾 克 萨 达 斯 对 我 们 耍 了 一 个 卑 鄙 的 手 段 。
	AI_Output(other, self, "DIA_Pyrokar_BUCHIRDORATH_15_04"); //我 能 看 看 那 本 书 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_05"); //随 便 吧 。 我 无 法 想 象 在 我 们 修 道 院 最 伟 大 的 大 师 都 失 败 的 情 况 下 ， 你 怎 么 可 能 成 功 。
	AI_Output(self, other, "DIA_Pyrokar_BUCHIRDORATH_11_06"); //但 是 请 去 试 试 吧 ， 泰 拉 蒙 不 会 阻 拦 你 。

	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_6);

	Pyrokar_LetYouPassTalamon = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info IrdorathBookOpen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_IRDORATHBOOKOPEN(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 3;
	condition		= DIA_Pyrokar_IRDORATHBOOKOPEN_Condition;
	information		= DIA_Pyrokar_IRDORATHBOOKOPEN_Info;
	description		= "我 可 以 打 开 艾 克 萨 达 斯 的 书 了 。";
};

func int DIA_Pyrokar_IRDORATHBOOKOPEN_Condition()
{
	if ((ItWr_HallsofIrdorathIsOpen == TRUE)
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_15_00"); //我 可 以 打 开 艾 克 萨 达 斯 的 书 了 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_11_01"); //什 么 ？ 你 怎 么 做 到 的 ？ 它 几 乎 让 我 绝 望 了 。

	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN, "艾 克 萨 达 斯 告 诉 了 我 这 个 窍 门 。", DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas);
	Info_AddChoice(DIA_Pyrokar_IRDORATHBOOKOPEN, "只 是 偶 然 的 运 气 ， 我 想 。", DIA_Pyrokar_IRDORATHBOOKOPEN_glueck);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_glueck()
{
	AI_Output(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00"); //只 是 偶 然 的 运 气 ， 我 想 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01"); //别 说 废 话 。运 气 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02"); //在 连 我 都 无 法 把 书 打 开 的 时 候 ， 像 你 这 样 的 人 轻 松 地 取 得 成 功 …
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03"); //… 那 告 诉 了 我 一 些 要 思 考 的 东 西 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04"); //无 论 如 何 ， 既 然 你 是 唯 一 一 个 能 把 书 打 开 的 人 ， 那 么 它 将 交 由 你 携 带 。 至 少 直 到 我 们 渡 过 眼 前 的 危 机 之 后 。

	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

func void DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas()
{
	AI_Output(other, self, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00"); //艾 克 萨 达 斯 告 诉 了 我 这 个 窍 门 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01"); //啊 ， 原 来 是 那 样 。 多 有 意 思 。 我 只 希 望 艾 克 萨 达 斯 那 糟 糕 的 影 响 力 不 会 把 你 腐 化 掉 。
	AI_Output(self, other, "DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02"); //我 警 告 你 ， 不 要 被 那 个 老 恶 棍 的 把 戏 所 欺 骗 。 你 可 能 会 为 此 感 到 后 悔 。

	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Pyrokar_IRDORATHBOOKOPEN);
};

///////////////////////////////////////////////////////////////////////
//	Info GeheimeBibliothek
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 3;
	condition		= DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition;
	information		= DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info;
	description		= "书 里 提 到 一 个 秘 密 的 图 书 馆 。";
};

func int DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Condition()
{
	if ((ItWr_SCReadsHallsofIrdorath == TRUE)
	&& (Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_GEHEIMEBIBLIOTHEK_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00"); //书 里 提 到 一 个 秘 密 的 图 书 馆 。
	AI_Output(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01"); //你 到 底 在 说 什 么 ？
	AI_Output(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02"); //在 这 些 围 墙 下 面 有 一 座 图 书 馆 。 想 起 来 什 么 了 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03"); //不 。 一 座 图 书 馆 应 该 在 哪 里 ， 你 说 ？
	AI_Output(other, self, "DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04"); //我 明 白 。 你 不 知 道 。 嗯 。

	B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_7);
};

///////////////////////////////////////////////////////////////////////
//	Info SCKnowsWayToIrdorath
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 2;
	condition		= DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition;
	information		= DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info;
	description		= "我 知 道 在 哪 里 去 找 伊 尔 多 拉 斯 大 厅 。";
};

func int DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_IRDORATHBOOKOPEN)))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00"); //我 知 道 在 哪 里 去 找 伊 尔 多 拉 斯 大 厅 。
	AI_Output(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01"); //神 殿 是 在 一 个 岛 上 ， 我 找 到 的 一 张 海 图 上 面 显 示 了 它 的 方 位 。
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02"); //那 太 棒 了 。 那 么 你 需 要 一 艘 船 和 一 些 船 员 去 迎 战 敌 人 。
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03"); //但 是 记 住 ， 如 果 你 想 要 消 灭 伊 尔 多 拉 斯 的 主 人 ， 那 么 你 必 须 妥 善 准 备 才 行 。
	AI_Output(other, self, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04"); //我 可 以 去 哪 里 找 船 员 ？
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05"); //你 的 船 员 一 定 要 是 那 些 你 能 信 任 的 人 。
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06"); //去 找 你 的 朋 友 聊 聊 ， 并 考 虑 一 下 到 了 岛 上 以 后 ， 你 会 用 到 哪 些 人 。
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07"); //你 同 样 需 要 一 名 魔 法 师 。 但 是 ， 唉 ， 我 无 法 从 修 道 院 给 你 指 派 任 何 人 。
	AI_Output(self, other, "DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08"); //你 只 能 去 找 不 在 修 道 院 里 工 作 的 魔 法 师 。
};

///////////////////////////////////////////////////////////////////////
//	Info SCWillJorgen
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_SCWILLJORGEN(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 59;
	condition		= DIA_Pyrokar_SCWILLJORGEN_Condition;
	information		= DIA_Pyrokar_SCWILLJORGEN_Info;
	description		= "卓 根 是 一 名 老 练 的 水 手 。";
};

func int DIA_Pyrokar_SCWILLJORGEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jorgen_Home))
	&& (Npc_KnowsInfo(other, DIA_Pyrokar_SCKNOWSWAYTOIRDORATH))
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_SCWILLJORGEN_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_00"); //卓 根 是 一 名 经 验 丰 富 的 水 手 。 他 能 帮 我 到 达 伊 尔 多 拉 斯 之 岛 。
	AI_Output(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_01"); //我 担 心 并 没 有 那 么 简 单 。
	AI_Output(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_02"); //他 已 经 受 雇 为 兄 弟 会 工 作 。 但 是 他 既 没 有 付 贡 金 ， 也 没 有 给 我 们 带 羊 来 。
	AI_Output(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_03"); //卓 根 必 须 首 先 完 成 他 的 工 作 ， 然 后 你 才 能 把 他 带 走 。
	AI_Output(other, self, "DIA_Pyrokar_SCWILLJORGEN_15_04"); //那 需 要 多 久 ？
	AI_Output(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_05"); //仅 仅 在 第 一 天 里 ， 他 就 吃 掉 了 一 名 新 信 徒 三 周 的 口 粮 。
	AI_Output(self, other, "DIA_Pyrokar_SCWILLJORGEN_11_06"); //所 以 ， 在 他 在 我 们 的 花 园 里 工 作 三 个 月 之 前 ， 我 不 能 让 他 离 开 。
};

///////////////////////////////////////////////////////////////////////
//	Info MachDTFrei
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_MACHDTFREI(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 59;
	condition		= DIA_Pyrokar_MACHDTFREI_Condition;
	information		= DIA_Pyrokar_MACHDTFREI_Info;
	description		= "现 在 ， 我 必 须 怎 样 做 才 能 让 卓 根 跟 我 一 起 走 ？";
};

func int DIA_Pyrokar_MACHDTFREI_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pyrokar_SCWILLJORGEN))
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_MACHDTFREI_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_MACHDTFREI_15_00"); //现 在 ， 我 必 须 怎 样 做 才 能 让 卓 根 跟 我 一 起 走 ？
	AI_Output(self, other, "DIA_Pyrokar_MACHDTFREI_11_01"); //嗯 。 确 实 有 一 件 事 你 能 给 我 帮 上 忙 。 你 和 艾 克 萨 达 斯 良 好 的 关 系 应 该 有 助 于 你 完 成 那 件 事 。
	AI_Output(self, other, "DIA_Pyrokar_MACHDTFREI_11_02"); //我 注 意 到 ， 在 最 近 的 一 些 日 子 里 ， 在 他 的 塔 里 发 生 了 一 些 奇 怪 的 事 。
	AI_Output(self, other, "DIA_Pyrokar_MACHDTFREI_11_03"); //镇 上 有 许 多 人 在 夜 里 听 到 从 那 边 传 来 大 声 的 尖 叫 ， 并 看 到 在 他 的 塔 上 空 有 奇 怪 的 光 线 闪 动 。
	AI_Output(self, other, "DIA_Pyrokar_MACHDTFREI_11_04"); //似 乎 我 们 还 没 有 完 成 我 们 的 任 务 。 去 查 看 一 下 那 里 发 生 了 什 么 事 ， 并 阻 止 它 。
	AI_Output(self, other, "DIA_Pyrokar_MACHDTFREI_11_05"); //然 后 你 就 可 以 带 走 卓 根 。

	MIS_PyrokarClearDemonTower = LOG_RUNNING;

	Log_CreateTopic(TOPIC_PyrokarClearDemonTower, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PyrokarClearDemonTower, LOG_RUNNING);
	B_LogEntry(TOPIC_PyrokarClearDemonTower, TOPIC_PyrokarClearDemonTower_1);
};

///////////////////////////////////////////////////////////////////////
//	Info DTCleared
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_DTCLEARED(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 59;
	condition		= DIA_Pyrokar_DTCLEARED_Condition;
	information		= DIA_Pyrokar_DTCLEARED_Info;
	description		= "艾 克 萨 达 斯 之 塔 的 事 情 已 经 自 行 解 决 了 。";
};

func int DIA_Pyrokar_DTCLEARED_Condition()
{
	if ((Npc_IsDead(Xardas_DT_Demon1))
	&& (Npc_IsDead(Xardas_DT_Demon2))
	&& (Npc_IsDead(Xardas_DT_Demon3))
	&& (Npc_IsDead(Xardas_DT_Demon4))
	&& (Npc_IsDead(Xardas_DT_Demon5))
	&& (Npc_IsDead(Xardas_DT_DemonLord))
	&& (MIS_PyrokarClearDemonTower == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_DTCLEARED_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_DTCLEARED_15_00"); //艾 克 萨 达 斯 之 塔 的 事 情 已 经 自 行 解 决 了 。
	AI_Output(self, other, "DIA_Pyrokar_DTCLEARED_11_01"); //那 又 怎 么 样 ？ 进 行 得 … … 不 ， 等 等 ， 我 实 际 上 不 想 知 道 。
	AI_Output(self, other, "DIA_Pyrokar_DTCLEARED_11_02"); //如 果 你 还 需 要 卓 根 的 话 ， 那 就 去 吧 ， 带 上 他 开 始 你 的 旅 行 。
	AI_Output(self, other, "DIA_Pyrokar_DTCLEARED_11_03"); //愿 英 诺 斯 保 护 你 。
	MIS_PyrokarClearDemonTower = LOG_SUCCESS;
	B_GivePlayerXP(XP_PyrokarClearDemonTower);
};

///////////////////////////////////////////////////////////////////////
//	Amulett des Todes
///////////////////////////////////////////////////////////////////////

// ---------------------------------
var int Pyro_Gives_Aura;
// ---------------------------------
instance DIA_Pyrokar_AmulettofDeath(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 57;
	condition		= DIA_Pyrokar_AmulettofDeath_Condition;
	information		= DIA_Pyrokar_AmulettofDeath_Info;
	permanent		= TRUE;
	description		= "预 言 里 提 到 关 于 英 诺 斯 的 神 圣 光 环 。";
};

func int DIA_Pyrokar_AmulettofDeath_Condition()
{
	if ((PlayerGetsAmulettOfDeath == TRUE)
	&& (Pyro_Gives_Aura == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_AmulettofDeath_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_AmulettofDeath_15_00"); //预 言 提 到 了 英 诺 斯 的 神 圣 光 环 。
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_11_01"); //英 诺 斯 的 光 环 是 一 个 护 身 符 ， 只 有 一 个 纪 元 中 最 伟 大 的 魔 法 师 才 能 配 戴 。

	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath, DIALOG_BACK, DIA_Pyrokar_AmulettofDeath_BAck);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath, "我 能 拿 走 它 吗 ？", DIA_Pyrokar_AmulettofDeath_CanHaveIt);
	Info_AddChoice(DIA_Pyrokar_AmulettofDeath, "那 是 什 么 样 的 护 身 符 ？", DIA_Pyrokar_AmulettofDeath_Amulett);
};

func void DIA_Pyrokar_AmulettofDeath_BAck()
{
	Info_ClearChoices(DIA_Pyrokar_AmulettofDeath);
};

func void DIA_Pyrokar_AmulettofDeath_CanHaveIt()
{
	AI_Output(other, self, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00"); //我 能 拿 走 它 吗 ？
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01"); //什 么 ？ 你 想 用 那 个 做 什 么 ？
	AI_Output(other, self, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02"); //去 对 抗 那 些 龙 。
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03"); //是 的 ， 当 然 。 我 将 把 护 身 符 交 给 你 ， 但 是 要 小 心 使 用 。
	AI_Output(other, self, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04"); //是 的 ， 一 定 。
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05"); //我 可 不 想 以 后 从 商 人 那 里 把 它 买 回 来 。
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06"); //善 用 它 ， 愿 英 诺 斯 永 远 保 护 你 。

	CreateInvItems(self, ItAm_AmulettofDeath_Mis, 1);
	B_GiveInvItems(self, other, ItAm_AmulettOfDeath_MIS, 1);

	Pyro_Gives_Aura = TRUE;
};

func void DIA_Pyrokar_AmulettofDeath_Amulett()
{
	AI_Output(other, self, "DIA_Pyrokar_AmulettofDeath_Amulett_15_00"); //那 是 什 么 种 类 的 护 身 符 ？
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_Amulett_11_01"); //据 说 那 是 英 诺 斯 亲 自 铸 造 的 ， 并 将 它 作 为 一 个 礼 物 赠 送 给 人 类 。
	AI_Output(self, other, "DIA_Pyrokar_AmulettofDeath_Amulett_11_02"); //它 可 以 保 护 配 戴 者 不 受 任 何 伤 害 。
};

///////////////////////////////////////////////////////////////////////
//	Trank des Todes
///////////////////////////////////////////////////////////////////////
instance DIA_Pyrokar_PotionofDeath(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 57;
	condition		= DIA_Pyrokar_PotionofDeath_Condition;
	information		= DIA_Pyrokar_PotionofDeath_Info;
	permanent		= TRUE;
	description		= "什 么 是 英 诺 斯 之 泪 ？";
};

func int DIA_Pyrokar_PotionofDeath_Condition()
{
	if (Npc_HasItems(other, ItPo_PotionOfDeath_01_MIS))
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_PotionofDeath_Info()
{
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_15_00"); //什 么 是 英 诺 斯 之 泪 ？
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_11_01"); //英 诺 斯 之 泪 只 是 一 个 儿 童 故 事 。 它 讲 述 了 在 时 间 开 始 的 时 候 ， 英 诺 斯 和 贝 利 尔 是 如 何 战 斗 的 。

	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, "我 明 白 了 。", DIA_Pyrokar_PotionofDeath_Aha);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, "我 找 到 了 这 个 药 剂 。", DIA_Pyrokar_PotionofDeath_Potion);
};

func void DIA_Pyrokar_PotionofDeath_Aha()
{
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Aha_15_00"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Aha_11_01"); //我 不 知 道 你 是 否 完 全 意 识 到 了 我 们 的 境 遇 ， 但 是 我 很 难 相 信 可 以 靠 一 个 儿 童 故 事 来 消 灭 我 们 的 敌 人 。

	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Potion()
{
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Potion_15_00"); //我 找 到 了 这 个 药 剂 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Potion_11_01"); //那 不 可 能 。 我 不 相 信 它 。
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Potion_15_02"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Potion_11_03"); //如 果 这 些 的 确 是 真 正 的 英 诺 斯 之 泪 ， 那 么 …
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Potion_15_04"); //（ 插 嘴 ） 不 可 能 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Potion_11_05"); //不 要 打 断 我 。 如 果 这 是 真 正 的 英 诺 斯 之 泪 ， 那 么 我 们 就 拥 有 了 一 个 强 大 的 武 器 来 对 付 敌 人 。

	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, Dialog_back, DIA_Pyrokar_PotionofDeath_BACK);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, "那 什 么 是 英 诺 斯 之 泪 ？", DIA_Pyrokar_PotionofDeath_Teardrops);
	Info_AddChoice(DIA_Pyrokar_PotionofDeath, "你 说 的 ‘ 武 器 ’ 是 什 么 意 思 ？", DIA_Pyrokar_PotionofDeath_Weapon);
};

func void DIA_Pyrokar_PotionofDeath_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Teardrops()
{
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Teardrops_15_00"); //那 么 英 诺 斯 之 泪 是 什 么 ？
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Teardrops_11_01"); //当 英 诺 斯 认 识 到 为 了 保 护 他 的 创 造 物 ， 他 必 须 与 贝 利 尔 - 他 唯 一 的 兄 弟 交 战 时 ， 这 让 他 十 分 悲 痛 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Teardrops_11_02"); //他 开 始 哭 泣 ， 而 他 的 眼 泪 落 到 这 个 世 界 上 ， 非 常 多 ， 因 为 他 的 心 中 充 满 了 悲 伤 ， 以 至 他 哭 了13年 。
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Teardrops_15_03"); //言 归 正 传 吧 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Teardrops_11_04"); //那 些 发 现 他 的 眼 泪 并 品 尝 了 它 们 的 人 ， 身 上 都 充 满 了 超 自 然 的 力 量 和 灵 性 。 他 们 认 识 到 英 诺 斯 的 创 造 物 的 知 识 ， 并 向 为 他 效 忠 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Teardrops_11_05"); //他 们 是 火 焰 社 团 的 第 一 批 成 员 。 眼 泪 给 了 他 们 力 量 、 勇 气 和 智 慧 。 但 是 那 已 经 是 很 久 很 久 以 前 的 事 了 ， 距 离 人 们 最 后 一 次 见 到 英 诺 斯 之 泪 已 经 过 去 了250年 。

	Info_ClearChoices(DIA_Pyrokar_PotionofDeath);
};

func void DIA_Pyrokar_PotionofDeath_Weapon()
{
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Weapon_15_00"); //你 说 的 ‘ 武 器 ’ 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Weapon_11_01"); //传 说 中 讲 到 ， 在 这 种 物 质 的 影 响 下 ， 英 诺 斯 的 战 士 们 可 以 实 现 超 凡 人 的 举 动 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Weapon_11_02"); //他 们 永 远 不 会 疲 惫 ， 并 拥 有 两 头 熊 的 力 量 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Weapon_11_03"); //只 有 英 诺 斯 之 泪 才 能 创 造 出 古 老 岁 月 里 那 些 最 伟 大 的 英 雄 事 迹 。
	AI_Output(other, self, "DIA_Pyrokar_PotionofDeath_Weapon_15_04"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Weapon_11_05"); //但 是 眼 泪 同 样 也 能 才 来 痛 苦 和 死 亡 。 只 有 我 们 修 道 会 的 成 员 才 能 饮 用 这 种 液 体 。
	AI_Output(self, other, "DIA_Pyrokar_PotionofDeath_Weapon_11_06"); //任 何 其 它 人 - 即 使 神 的 圣 骑 士 - 也 会 遭 遇 残 酷 的 死 亡 。

	Npc_RemoveInvItems(hero, ItPo_PotionOfDeath_01_Mis, 1);
	CreateInvItems(hero, ItPo_PotionOfDeath_02_Mis, 1);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Pyrokar_KAP6_EXIT(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 999;
	condition		= DIA_Pyrokar_KAP6_EXIT_Condition;
	information		= DIA_Pyrokar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pyrokar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Pyrokar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Pyrokar_PICKPOCKET(C_INFO)
{
	npc				= KDF_500_Pyrokar;
	nr				= 900;
	condition		= DIA_Pyrokar_PICKPOCKET_Condition;
	information		= DIA_Pyrokar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_120;
};

func int DIA_Pyrokar_PICKPOCKET_Condition()
{
	C_Beklauen(108, 550);
};

func void DIA_Pyrokar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET, DIALOG_BACK, DIA_Pyrokar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pyrokar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Pyrokar_PICKPOCKET_DoIt);
};

func void DIA_Pyrokar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};

func void DIA_Pyrokar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pyrokar_PICKPOCKET);
};
