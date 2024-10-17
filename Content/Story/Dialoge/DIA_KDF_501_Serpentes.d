///////////////////////////////////////////////////////////////////////
//	Info Kap1 EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_Kap1_EXIT(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 999;
	condition		= DIA_Serpentes_Kap1_EXIT_Condition;
	information		= DIA_Serpentes_Kap1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Serpentes_Kap1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Serpentes_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NOTALK
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOTALK(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 10;
	condition		= DIA_Serpentes_NOTALK_Condition;
	information		= DIA_Serpentes_NOTALK_Info;
	important		= TRUE;
};

func int DIA_Serpentes_NOTALK_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (KNOWS_FIRE_CONTEST == FALSE)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOTALK_Info()
{
	AI_Output(self, other, "DIA_Serpentes_NOTALK_10_00"); //（ 斥 责 ） 你 胆 敢 抗 议 我 ， 新 信 徒 ？ 回 去 做 你 的 工 作 。

	Info_ClearChoices(DIA_Serpentes_NOTALK);
	Info_AddChoice(DIA_Serpentes_NOTALK, "我 马 上 去 （ 结 束 ）", DIA_Serpentes_NOTALK_EXIT);
	Info_AddChoice(DIA_Serpentes_NOTALK, "我 还 有 一 个 问 题 … ", DIA_Serpentes_NOTALK_QUESTION);
};

func void DIA_Serpentes_NOTALK_QUESTION()
{
	AI_Output(other, self, "DIA_Serpentes_NOTALK_QUESTION_15_00"); //我 还 有 一 个 问 题 …
	AI_Output(self, other, "DIA_Serpentes_NOTALK_QUESTION_10_01"); //（ 狂 怒 的 ） 看 来 你 没 弄 明 白 ， 由 我 来 决 定 和 你 谈 话 的 时 机 。 你 以 为 你 是 谁 ？
	AI_Output(self, other, "DIA_Serpentes_NOTALK_QUESTION_10_02"); //现 在 回 去 工 作 ！

	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_NOTALK_EXIT()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GOAWAY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOAWAY(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 10;
	condition		= DIA_Serpentes_GOAWAY_Condition;
	information		= DIA_Serpentes_GOAWAY_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Serpentes_GOAWAY_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Serpentes_NOTALK)
	&& Npc_IsInState(self, ZS_Talk)
	&& !(Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOAWAY_Info()
{
	AI_Output(self, other, "DIA_Serpentes_GOAWAY_10_00"); //你 出 现 在 这 里 不 仅 证 明 了 你 缺 乏 尊 敬 ， 同 时 也 证 明 了 你 的 愚 蠢 ， 新 信 徒 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info YOURSTORY
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_YOURSTORY(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 24;
	condition		= DIA_Serpentes_YOURSTORY_Condition;
	information		= DIA_Serpentes_YOURSTORY_Info;
	description		= "我 听 说 你 通 过 了 火 焰 测 试 。";
};

func int DIA_Serpentes_YOURSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulthar_TEST)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo(hero, DIA_Pyrokar_MAGICAN) == FALSE)
	&& (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_YOURSTORY_Info()
{
	AI_Output(other, self, "DIA_Serpentes_YOURSTORY_15_00"); //我 听 说 你 通 过 了 火 焰 测 试 。
	AI_Output(self, other, "DIA_Serpentes_YOURSTORY_10_01"); //（ 谦 逊 的 ） 我 可 以 这 样 告 诉 你 ， 要 绝 对 地 谦 逊 。 其 它 所 有 尝 试 过 的 人 都 死 了 。
	AI_Output(self, other, "DIA_Serpentes_YOURSTORY_10_02"); //（ 谦 逊 的 ） 你 真 的 不 应 该 参 加 这 个 测 试 。 你 的 精 神 很 虚 弱 。 最 好 在 修 道 院 中 继 续 服 务 ， 那 样 也 许 你 几 年 后 可 以 被 选 中 。
	AI_Output(other, self, "DIA_Serpentes_YOURSTORY_15_03"); //我 会 通 过 测 试 。
	AI_Output(self, other, "DIA_Serpentes_YOURSTORY_10_04"); //如 果 这 是 英 诺 斯 的 意 愿 的 话 ， 那 么 你 就 可 以 。 但 如 果 不 是 的 话 - 你 就 会 失 败 。
};

///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_TEST(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 10;
	condition		= DIA_Serpentes_TEST_Condition;
	information		= DIA_Serpentes_TEST_Info;
	description		= "我 已 经 准 备 好 面 对 你 的 考 验，大 师";
};

func int DIA_Serpentes_TEST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_TEST_Info()
{
	AI_Output(other, self, "DIA_Serpentes_TEST_15_00"); //我 已 经 准 备 好 面 对 你 的 考 验，大 师。
	AI_Output(self, other, "DIA_Serpentes_TEST_10_01"); //这 么 说 ， 你 想 要 参 加 这 个 测 试 了 。 只 有 勇 敢 的 新 信 徒 才 会 申 请 测 试 。 但 是 勇 气 并 不 是 你 所 需 的 全 部 。
	AI_Output(self, other, "DIA_Serpentes_TEST_10_02"); //你 是 否 足 够 聪 明 到 可 以 通 过 测 试 ？ 你 是 否 足 够 强 壮 来 面 对 等 待 着 你 的 危 险 ？
	AI_Output(self, other, "DIA_Serpentes_TEST_10_03"); //如 果 不 是 的 话 ， 那 你 将 付 出 生 命 的 代 价 。
	AI_Output(self, other, "DIA_Serpentes_TEST_10_04"); //现 在 听 着 你 的 测 试 ： 在 石 头 的 位 置 ， 寻 找 那 个 从 未 出 生 过 的 - 找 到 那 个 曾 经 被 召 唤 的 。
	AI_Output(self, other, "DIA_Serpentes_TEST_10_05"); //战 胜 那 个 从 未 被 战 胜 的 - 让 你 与 那 个 活 着 的 岩 石 较 量 ， 与 不 朽 的 石 头 战 斗 - 并 消 灭 它 。

	// ----- Der Magische Golem ----
	Wld_InsertNpc(MagicGolem, "FP_MAGICGOLEM");
	Magic_Golem = Hlp_GetNpc(MagicGolem); // Damits auch initialisiert ist!!

	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_Golem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Golem, LOG_RUNNING);
	B_LogEntry(TOPIC_Golem, TOPIC_Golem_1);
};

///////////////////////////////////////////////////////////////////////
//	Info NOIDEA
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOIDEA(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 10;
	condition		= DIA_Serpentes_NOIDEA_Condition;
	information		= DIA_Serpentes_NOIDEA_Info;
	description		= "那 究 竟 是 什 么 样 的 生 物 ？";
};

func int DIA_Serpentes_NOIDEA_Condition()
{
	if ((MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOIDEA_Info()
{
	AI_Output(other, self, "DIA_Serpentes_NOIDEA_15_00"); //活 着 的 岩 石 … … ？ 那 会 是 什 么 样 的 生 物 ？
	AI_Output(self, other, "DIA_Serpentes_NOIDEA_10_01"); //我 已 经 把 一 切 都 告 诉 了 你 。 （ 嘲 笑 ） 难 道 你 觉 得 这 个 测 试 太 困 难 吗 ？
	AI_Output(self, other, "DIA_Serpentes_NOIDEA_10_02"); //现 在 你 将 体 会 到 接 受 火 焰 测 试 的 真 正 含 义 - 我 将 不 再 回 答 你 的 任 何 其 它 问 题 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info NOHELP
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_NOHELP(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 10;
	condition		= DIA_Serpentes_NOHELP_Condition;
	information		= DIA_Serpentes_NOHELP_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Serpentes_NOHELP_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Serpentes_NOIDEA)
	&& ((Npc_IsDead(Magic_Golem)) == FALSE)
	&& (MIS_GOLEM == LOG_RUNNING)
	&& Npc_IsInState(self, ZS_Talk)
	&& (other.guild == GIL_NOV)
	&& ((Npc_KnowsInfo(other, DIA_Ulthar_TEST) == FALSE)
	|| Npc_KnowsInfo(other, DIA_Serpentes_YOURSTORY)))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_NOHELP_Info()
{
	AI_Output(self, other, "DIA_Serpentes_NOHELP_10_00"); //（ 轻 视 的 ） 去 执 行 你 的 任 务 ， 新 信 徒 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SUCCESS(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 3;
	condition		= DIA_Serpentes_SUCCESS_Condition;
	information		= DIA_Serpentes_SUCCESS_Info;
	description		= "我 已 经 击 败 了 巨 人";
};

func int DIA_Serpentes_SUCCESS_Condition()
{
	if ((Npc_IsDead(MagicGolem))
	&& (MIS_GOLEM == LOG_RUNNING)
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SUCCESS_Info()
{
	var C_Npc garwig;
	garwig = Hlp_GetNpc(NOV_608_Garwig);

	AI_Output(other, self, "DIA_Serpentes_SUCCESS_15_00"); //我 已 经 击 败 了 巨 人 。
	AI_Output(self, other, "DIA_Serpentes_SUCCESS_10_01"); //什 么 ？ 你 真 的 完 成 了 它 ？ 但 是 没 有 英 诺 斯 之 锤 ， 你 永 远 也 不 可 能 消 灭 石 巨 人 。

	if (Npc_IsDead(garwig))
	{
		AI_Output(self, other, "DIA_Serpentes_SUCCESS_10_02"); //（ 耀 武 扬 威 的 ） 但 是 现 在 你 背 叛 了 你 自 己 ！ 是 你 杀 了 加 维 格 ！
		AI_Output(self, other, "DIA_Serpentes_SUCCESS_10_03"); //接 受 谋 杀 英 诺 斯 仆 从 的 惩 罚 ！ ！ ！

		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_HumanMurderedHuman, 0);
	}
	else
	{
		AI_Output(self, other, "DIA_Serpentes_SUCCESS_10_04"); //（ 懊 悔 的 ） 虽 然 如 此 ， 我 必 须 承 认 你 完 成 了 我 交 给 你 的 任 务 。
	};

	if (Npc_HasItems(other, Holy_Hammer_Mis) >= 1)
	{
		AI_Output(self, other, "DIA_Serpentes_SUCCESS_10_05"); //我 最 好 亲 自 拿 着 铁 锤 。

		Npc_RemoveInvItems(other, Holy_Hammer_MIS, 1);
		Wld_InsertItem(Holy_Hammer_MIS, "FP_HAMMER");
	};

	MIS_GOLEM = LOG_SUCCESS;
	B_GivePlayerXP(XP_GOLEM);
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_PERM(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 99;
	condition		= DIA_Serpentes_PERM_Condition;
	information		= DIA_Serpentes_PERM_Info;
	permanent		= TRUE;
	description		= "你 还 有 其 它 的 事 要 告 诉 我 吗 ？";
};

func int DIA_Serpentes_PERM_Condition()
{
	if ((Kapitel >= 3)
	|| Npc_KnowsInfo(other, DIA_Serpentes_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_PERM_Info()
{
	AI_Output(other, self, "DIA_Serpentes_PERM_15_00"); //你 还 有 其 它 的 事 要 告 诉 我 吗 ？

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Serpentes_PERM_10_01"); //不 。 现 在 不 行 ， 兄 弟 。
	}
	else
	{
		AI_Output(self, other, "DIA_Serpentes_PERM_10_02"); //解 散 。 你 知 道 你 要 做 什 么 。
	};

	AI_StopProcessInfos(self);
};

// ##################################################################
// ##
// ## Kapitel 2
// ##
// ##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_Kap2_EXIT(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 999;
	condition		= DIA_Serpentes_Kap2_EXIT_Condition;
	information		= DIA_Serpentes_Kap2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Serpentes_Kap2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Serpentes_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##################################################################
// ##
// ## Kapitel 3
// ##
// ##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap3 EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_Kap3_EXIT(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 999;
	condition		= DIA_Serpentes_Kap3_EXIT_Condition;
	information		= DIA_Serpentes_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Serpentes_Kap3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Serpentes_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteile
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteile(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 30;
	condition		= DIA_Serpentes_MinenAnteile_Condition;
	information		= DIA_Serpentes_MinenAnteile_Info;
	important		= TRUE;
};

func int DIA_Serpentes_MinenAnteile_Condition()
{
	if ((Pedro_Traitor == TRUE)
	&& ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_MinenAnteile_Info()
{
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_10_00"); //不 要 那 么 急 。 我 还 有 其 它 任 务 交 给 你 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Serpentes_MinenAnteile_15_01"); //（ 叹 息 ） 那 是 ？
		AI_Output(self, other, "DIA_Serpentes_MinenAnteile_10_02"); //现 在 你 属 于 火 焰 兄 弟 会 了 ， 你 同 样 必 须 履 行 成 为 我 们 一 员 后 的 职 责 。
		AI_Output(self, other, "DIA_Serpentes_MinenAnteile_10_03"); //你 知 道 ， 教 堂 不 仅 仅 参 与 魔 法 事 件 - 它 也 是 政 府 的 公 正 性 最 后 的 权 威 机 构 。
		AI_Output(self, other, "DIA_Serpentes_MinenAnteile_10_04"); //必 须 在 打 开 无 底 深 渊 前 ， 把 最 后 一 件 事 一 次 性 并 且 永 远 地 解 决 。

		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, "其 实 我 有 足 够 的 事 情 要 做 。 去 找 其 它 人 吧 。", DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, "这 是 关 于 什 么 的 ？", DIA_Serpentes_MinenAnteile_was);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, "那 不 是 民 兵 的 事 情 吗 ？", DIA_Serpentes_MinenAnteile_miliz);
	}
	else
	{
		AI_Output(self, other, "DIA_Serpentes_MinenAnteile_10_05"); //在 这 次 事 件 中 ， 我 需 要 你 的 雇 佣 兵 中 的 一 个 人 。

		Info_ClearChoices(DIA_Serpentes_MinenAnteile);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, "其 实 我 有 足 够 的 事 情 要 做 。 去 找 其 它 人 吧 。", DIA_Serpentes_MinenAnteile_nein);
		Info_AddChoice(DIA_Serpentes_MinenAnteile, "我 要 杀 谁 ？", DIA_Serpentes_MinenAnteile_KillSLD);
	};
};

func void DIA_Serpentes_MinenAnteile_miliz()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_miliz_15_00"); //那 不 是 民 兵 的 事 情 吗 ？
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_miliz_10_01"); //民 兵 只 对 城 市 负 责 。 这 次 的 事 件 超 出 了 考 虑 的 范 围 。
};

func void DIA_Serpentes_MinenAnteile_nein()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_nein_15_00"); //其 实 我 有 足 够 的 事 情 要 做 。 去 找 其 它 人 吧 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_nein_10_01"); //（ 愤 怒 的 ） 那 太 无 礼 了 。 如 果 你 不 愿 意 为 兄 弟 会 服 务 的 话 ， 你 将 永 远 无 法 到 达 更 高 级 的 魔 法 环 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_nein_10_02"); //我 因 此 严 责 你 。 我 希 望 这 样 的 事 永 远 不 要 再 发 生 - 否 则 将 对 你 非 常 不 利 。
	AI_StopProcessInfos(self);
};

func void DIA_Serpentes_MinenAnteile_was()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_was_15_00"); //这 是 关 于 什 么 的 ？
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_10_01"); //在 城 市 里 有 人 出 售 以 前 的 罪 犯 流 放 地 矿 井 的 伪 造 股 票 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_10_02"); //这 些 纸 实 际 上 完 全 没 有 价 值 ， 也 不 重 要 。 然 而 ， 它 们 仍 有 在 人 民 中 引 起 骚 乱 的 可 能 ， 这 种 情 况 在 现 在 是 我 们 负 担 不 起 的 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_10_03"); //这 个 骗 子 可 能 会 接 近 城 市 和 乡 村 里 所 有 出 名 的 商 人 ， 并 且 显 然 将 要 他 伪 造 的 矿 井 股 票 出 售 给 他 们 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_10_04"); //找 到 这 个 坏 人 ， 并 将 他 带 到 这 里 受 审 。 在 这 样 的 困 难 时 期 ， 我 们 绝 对 不 容 许 骗 子 和 盗 贼 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_10_05"); //我 们 必 须 让 他 成 为 一 个 例 子 ， 以 威 慑 其 余 的 暴 徒 。

	Info_AddChoice(DIA_Serpentes_MinenAnteile, "我 会 试 着 解 决 问 题 。", DIA_Serpentes_MinenAnteile_was_ja);
};

func void DIA_Serpentes_MinenAnteile_was_ja()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_00"); //我 会 试 着 解 决 问 题 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_01"); //还 有 一 件 事 。 当 你 访 问 那 些 商 人 的 时 候 ， 不 要 让 他 们 知 道 你 在 寻 找 矿 井 股 票 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_02"); //我 想 他 们 可 能 原 本 打 算 要 出 售 它 们 ， 但 是 如 果 他 们 知 道 你 是 在 为 教 会 解 决 这 个 问 题 时 ， 当 然 不 会 把 它 们 卖 给 你 ， 明 白 吗 ？
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_was_ja_15_03"); //是 的 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_ja_10_04"); //那 去 工 作 。 我 希 望 你 一 定 会 成 功 ， 兄 弟 。
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);

	MIS_Serpentes_MinenAnteil_KDF = LOG_RUNNING;

	if ((Npc_IsDead(Salandril)) == FALSE)
	{
		CreateInvItems(Salandril, ItWr_MinenAnteil_Mis, 2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};

	if ((Npc_IsDead(VLK_416_Matteo)) == FALSE)
	{
		CreateInvItems(VLK_416_Matteo, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(VLK_413_Bosper)) == FALSE)
	{
		CreateInvItems(VLK_413_Bosper, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(VLK_409_Zuris)) == FALSE)
	{
		CreateInvItems(VLK_409_Zuris, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(BAU_911_Elena)) == FALSE)
	{
		CreateInvItems(BAU_911_Elena, ItWr_MinenAnteil_Mis, 2);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 2;
	};

	if ((Npc_IsDead(BAU_970_Orlan)) == FALSE)
	{
		CreateInvItems(BAU_970_Orlan, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(VLK_407_Hakon)) == FALSE)
	{
		CreateInvItems(VLK_407_Hakon, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(BAU_936_Rosi)) == FALSE)
	{
		CreateInvItems(BAU_936_Rosi, ItWr_MinenAnteil_Mis, 1);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 1;
	};

	if ((Npc_IsDead(VLK_468_Canthar)) == FALSE)
	{
		CreateInvItems(VLK_468_Canthar, ItWr_MinenAnteil_Mis, 3);
		SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter + 3;
	};

	SalandrilVerteilteMinenAnteil = SalandrilMinenAnteil_MAINCounter;

	Log_CreateTopic(TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_3);
};

func void DIA_Serpentes_MinenAnteile_KillSLD()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_Kill_15_00"); //我 要 杀 谁 ？
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_01"); //以 英 诺 斯 之 名 ， 当 然 不 会 有 人 。 这 件 事 需 要 一 点 策 略 ， 你 这 粗 鲁 的 蠢 货 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_02"); //萨 伦 德 里 尔 ， 镇 上 尽 头 的 炼 金 术 士 ， 犯 下 了 一 系 列 罪 行 ， 并 且 一 定 要 受 到 惩 罚 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_03"); //然 而 ， 他 拒 绝 来 修 道 院 接 受 审 判 。 把 他 带 到 这 里 来 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_Kill_10_04"); //你 怎 么 完 成 这 个 任 务 我 们 不 管 。 当 然 ， 你 会 得 到 奖 赏 。

	Info_AddChoice(DIA_Serpentes_MinenAnteile, "那 不 是 民 兵 的 事 情 吗 ？", DIA_Serpentes_MinenAnteile_miliz);
	Info_AddChoice(DIA_Serpentes_MinenAnteile, "没 问 题 。 我 会 处 理 它 的 。", DIA_Serpentes_MinenAnteile_was_jaSLD);
};

var int MIS_Serpentes_BringSalandril_SLD;
func void DIA_Serpentes_MinenAnteile_was_jaSLD()
{
	AI_Output(other, self, "DIA_Serpentes_MinenAnteile_was_jaSLD_15_00"); //没 问 题 。 我 会 处 理 它 的 。
	AI_Output(self, other, "DIA_Serpentes_MinenAnteile_was_jaSLD_10_01"); //好 。 我 们 希 望 很 快 能 听 到 你 的 消 息 。
	MIS_Serpentes_BringSalandril_SLD = LOG_RUNNING;
	Info_ClearChoices(DIA_Serpentes_MinenAnteile);

	Log_CreateTopic(TOPIC_MinenAnteile, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MinenAnteile, LOG_RUNNING);
	B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_4);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteileBringen
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_MinenAnteileBringen(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 2;
	condition		= DIA_Serpentes_MinenAnteileBringen_Condition;
	information		= DIA_Serpentes_MinenAnteileBringen_Info;
	permanent		= TRUE;
	description		= "关 于 伪 造 的 矿 井 股 票 …";
};

func int DIA_Serpentes_MinenAnteileBringen_Condition()
{
	if ((MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_MinenAnteil_Mis))
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int SerpentesMinenAnteilCounter;
func void DIA_Serpentes_MinenAnteileBringen_Info()
{
	var int SerpentesMinenAnteilCount;
	var int XP_BringSerpentesMinenAnteils;
	var int SerpentesMinenAnteilOffer;
	var int SerpentesMinenAnteilGeld;

	SerpentesMinenAnteilCount = Npc_HasItems(other, ItWr_MinenAnteil_Mis);
	SerpentesMinenAnteilOffer = 200;

	if (SerpentesMinenAnteilCount == 1)
	{
		AI_Output(other, self, "DIA_Serpentes_MinenAnteileBringen_15_00"); //我 已 经 找 回 了 一 份 矿 井 股 票 。
		B_GivePlayerXP(XP_BringSerpentesMinenAnteil);
		B_GiveInvItems(other, self, ItWr_MinenAnteil_Mis, 1);
		SerpentesMinenAnteilCounter = SerpentesMinenAnteilCounter + 1;
	}
	else
	{
		AI_Output(other, self, "DIA_Serpentes_MinenAnteileBringen_15_01"); //我 已 经 找 回 了 一 些 矿 井 股 票 。

		B_GiveInvItems(other, self, ItWr_MinenAnteil_Mis, SerpentesMinenAnteilCount);

		XP_BringSerpentesMinenAnteils = (SerpentesMinenAnteilCount * XP_BringSerpentesMinenAnteil);
		SerpentesMinenAnteilCounter = (SerpentesMinenAnteilCounter + SerpentesMinenAnteilCount);

		B_GivePlayerXP(XP_BringSerpentesMinenAnteils);
	};

	SalandrilMinenAnteil_MAINCounter = SalandrilMinenAnteil_MAINCounter - SerpentesMinenAnteilCount;

	var string MinenAnteilText;
	var string MinenAnteilLeft;
	MinenAnteilLeft = IntToString(SalandrilMinenAnteil_MAINCounter);
	MinenAnteilText = ConcatStrings(MinenAnteilLeft, PRINT_NumberLeft);
	AI_PrintScreen(MinenAnteilText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);

	if (SerpentesMinenAnteilCounter < SalandrilVerteilteMinenAnteil)
	{
		AI_Output(self, other, "DIA_Serpentes_MinenAnteileBringen_10_02"); //非 常 好 。 你 必 须 把 它 们 从 市 场 流 通 中 清 除 出 去 。 这 对 人 民 来 说 就 是 毒 药 。 把 它 们 都 给 我 拿 来 。
		AI_Output(self, other, "DIA_Serpentes_MinenAnteileBringen_10_03"); //给 。 我 会 给 你 必 要 的 资 金 。
	}
	else if (SerpentesMinenAnteilCounter == SalandrilVerteilteMinenAnteil) // Joly:kein Exploid
	{
		AI_Output(other, self, "DIA_Serpentes_MinenAnteileBringen_15_04"); //我 想 ， 那 些 是 全 部 的 了 。
		AI_Output(self, other, "DIA_Serpentes_MinenAnteileBringen_10_05"); //干 得 好 。 你 已 经 赢 得 了 一 个 奖 赏 。
		AI_Output(self, other, "DIA_Serpentes_MinenAnteileBringen_10_06"); //拿 上 这 个 防 护 护 身 符 。 它 将 帮 助 你 通 过 尚 未 走 过 的 道 路 。
		CreateInvItems(self, ItAm_Prot_Mage_01, 1);
		B_GiveInvItems(self, other, ItAm_Prot_Mage_01, 1);
	}
	else // Joly: zur Sicherheit!
	{
		AI_Output(self, other, "DIA_Serpentes_MinenAnteileBringen_10_07"); //这 真 的 是 现 在 最 后 一 份 ， 对 吗 ？
	};

	SerpentesMinenAnteilGeld = (SerpentesMinenAnteilCount * SerpentesMinenAnteilOffer);

	CreateInvItems(self, ItMi_Gold, SerpentesMinenAnteilGeld);
	B_GiveInvItems(self, other, ItMi_Gold, SerpentesMinenAnteilGeld);
};

///////////////////////////////////////////////////////////////////////
//	Info GotSalandril
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_GOTSalandril(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 32;
	condition		= DIA_Serpentes_GOTSalandril_Condition;
	information		= DIA_Serpentes_GOTSalandril_Info;
	description		= "我 知 道 是 谁 让 那 些 矿 井 股 票 进 入 流 通 的 。";
};

func int DIA_Serpentes_GOTSalandril_Condition()
{
	if ((SC_KnowsProspektorSalandril == TRUE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_GOTSalandril_Info()
{
	AI_Output(other, self, "DIA_Serpentes_GOTSalandril_15_00"); //我 知 道 是 谁 让 那 些 矿 井 股 票 进 入 市 场 的 。 是 萨 伦 德 里 尔 ， 镇 上 富 人 区 里 的 炼 金 术 士 。
	AI_Output(self, other, "DIA_Serpentes_GOTSalandril_10_01"); //那 么 把 他 带 到 这 里 来 。 我 们 有 事 情 要 和 他 讨 论 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilHere
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SalandrilHERE(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 33;
	condition		= DIA_Serpentes_SalandrilHERE_Condition;
	information		= DIA_Serpentes_SalandrilHERE_Info;
	description		= "萨 伦 德 里 尔 来 了 ， 在 修 道 院 里 。";
};

func int DIA_Serpentes_SalandrilHERE_Condition()
{
	if (Npc_GetDistToWP(Salandril, "ALTAR") < 10000)
	{
		if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if ((Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
		&& (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void DIA_Serpentes_SalandrilHERE_Info()
{
	AI_Output(other, self, "DIA_Serpentes_SalandrilHERE_15_00"); //萨 伦 德 里 尔 来 了 ， 在 修 道 院 里 。
	AI_Output(self, other, "DIA_Serpentes_SalandrilHERE_10_01"); //干 得 好 。 我 们 稍 后 再 处 理 他 。

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Serpentes_SalandrilHERE_10_02"); //这 是 你 的 奖 赏 。 关 于 这 件 事 ， 不 要 再 说 一 句 话 ， 明 白 了 吗 ？
		CreateInvItems(self, ItMi_Gold, 400);
		B_GiveInvItems(self, other, ItMi_Gold, 400);
	};

	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_SalandrilInKloster);
};

///////////////////////////////////////////////////////////////////////
//	Info SalandrilDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_SalandrilDEAD(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 33;
	condition		= DIA_Serpentes_SalandrilDEAD_Condition;
	information		= DIA_Serpentes_SalandrilDEAD_Info;
	description		= "萨 伦 德 里 尔 死 了 。";
};

func int DIA_Serpentes_SalandrilDEAD_Condition()
{
	if ((
	(Npc_KnowsInfo(other, DIA_Serpentes_GOTSalandril))
	|| (
	((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (MIS_Serpentes_BringSalandril_SLD == LOG_RUNNING)
	)
	)
	&& (Npc_IsDead(Salandril)))
	{
		return TRUE;
	};
};

func void DIA_Serpentes_SalandrilDEAD_Info()
{
	AI_Output(other, self, "DIA_Serpentes_SalandrilDEAD_15_00"); //萨 伦 德 里 尔 死 了 。
	AI_Output(self, other, "DIA_Serpentes_SalandrilDEAD_10_01"); //嗯 ， 那 么 他 的 行 为 并 没 有 逃 脱 惩 罚 。 愿 英 诺 斯 宽 恕 他 可 怜 的 灵 魂 。
	TOPIC_END_MinenAnteile = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

// ##################################################################
// ##
// ## Kapitel 4
// ##
// ##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap2 EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_Kap4_EXIT(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 999;
	condition		= DIA_Serpentes_Kap4_EXIT_Condition;
	information		= DIA_Serpentes_Kap4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Serpentes_Kap4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Serpentes_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ##################################################################
// ##
// ## Kapitel 5
// ##
// ##################################################################

///////////////////////////////////////////////////////////////////////
//	Info Kap5 EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Serpentes_Kap5_EXIT(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 999;
	condition		= DIA_Serpentes_Kap5_EXIT_Condition;
	information		= DIA_Serpentes_Kap5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Serpentes_Kap5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Serpentes_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Serpentes_PICKPOCKET(C_INFO)
{
	npc				= KDF_501_Serpentes;
	nr				= 900;
	condition		= DIA_Serpentes_PICKPOCKET_Condition;
	information		= DIA_Serpentes_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Serpentes_PICKPOCKET_Condition()
{
	C_Beklauen(86, 380);
};

func void DIA_Serpentes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET, DIALOG_BACK, DIA_Serpentes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Serpentes_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Serpentes_PICKPOCKET_DoIt);
};

func void DIA_Serpentes_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
};

func void DIA_Serpentes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Serpentes_PICKPOCKET);
};
