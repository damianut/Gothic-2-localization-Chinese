///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_EXIT(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 999;
	condition		= DIA_Ulthar_EXIT_Condition;
	information		= DIA_Ulthar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulthar_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_GREET(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 2;
	condition		= DIA_Ulthar_GREET_Condition;
	information		= DIA_Ulthar_GREET_Info;
	important		= TRUE;
};

func int DIA_Ulthar_GREET_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (!Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE))
	&& (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_GREET_Info()
{
	AI_Output(self, other, "DIA_Ulthar_GREET_05_00"); //看 ， 新 信 徒 出 现 在 高 级 议 会 之 前 。 英 诺 斯 与 你 同 在 ， 孩 子 。
	AI_Output(other, self, "DIA_Ulthar_GREET_15_01"); //高 级 议 会 的 任 务 究 竟 是 什 么 ？
	AI_Output(self, other, "DIA_Ulthar_GREET_05_02"); //我 们 的 职 责 就 是 宣 布 英 诺 斯 的 意 愿 。 因 此 ， 我 们 指 定 那 些 被 选 中 参 加 魔 法 测 试 的 新 信 徒 。
	AI_Output(self, other, "DIA_Ulthar_GREET_05_03"); //尽 管 我 们 过 着 隐 居 生 活 ， 但 我 们 仍 然 关 注 着 世 间 诸 事 ， 因 为 英 诺 斯 教 会 代 表 了 尘 世 上 最 高 的 法 律 。
	AI_Output(other, self, "DIA_Ulthar_GREET_15_04"); //啊 ， 那 么 你 仍 对 世 上 发 生 的 那 些 事 感 兴 趣 …
	AI_Output(other, self, "DIA_Ulthar_GREET_15_05"); //那 么 你 怎 么 看 那 些 盘 踞 在 矿 藏 山 谷 的 龙 ， 还 有 他 们 日 增 的 军 队 ？
	AI_Output(self, other, "DIA_Ulthar_GREET_05_06"); //我 明 白 你 很 生 气 ， 但 是 我 们 在 采 取 任 何 行 动 之 前 必 须 先 衡 量 一 下 你 话 语 的 份 量 。
	AI_Output(self, other, "DIA_Ulthar_GREET_05_07"); //如 果 现 在 我 们 失 去 自 制 力 而 轻 举 妄 动 的 话 ， 什 么 事 都 无 法 完 成 。 因 此 ， 完 成 你 的 任 务 - 然 后 我 们 再 讨 论 将 要 做 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_MAGETEST(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 2;
	condition		= DIA_Ulthar_MAGETEST_Condition;
	information		= DIA_Ulthar_MAGETEST_Info;
	description		= "告 诉 我 关 于 魔 法 测 试 的 事 情 。";
};

func int DIA_Ulthar_MAGETEST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulthar_GREET))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_MAGETEST_Info()
{
	AI_Output(other, self, "DIA_Ulthar_MAGETEST_15_00"); //告 诉 我 关 于 魔 法 测 试 的 事 情 。
	AI_Output(self, other, "DIA_Ulthar_MAGETEST_05_01"); //这 是 被 选 择 的 新 信 徒 进 入 魔 法 师 公 会 的 一 次 机 会 。 但 是 只 有 一 个 人 能 够 通 过 测 试 。
	AI_Output(self, other, "DIA_Ulthar_MAGETEST_05_02"); //而 英 诺 斯 会 自 己 选 择 那 个 新 信 徒 。
};

///////////////////////////////////////////////////////////////////////
//	Info WHEN
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_WHEN(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 3;
	condition		= DIA_Ulthar_WHEN_Condition;
	information		= DIA_Ulthar_WHEN_Info;
	permanent		= TRUE;
	description		= "测 试 什 么 时 候 开 始 ？";
};

func int DIA_Ulthar_WHEN_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Ulthar_MAGETEST)
	&& (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_WHEN_Info()
{
	AI_Output(other, self, "DIA_Ulthar_WHEN_15_00"); //测 试 什 么 时 候 开 始 ？
	AI_Output(self, other, "DIA_Ulthar_WHEN_05_01"); //一 旦 我 们 听 到 英 诺 斯 的 意 愿 ， 我 们 将 通 知 选 中 的 新 信 徒 ， 然 后 让 他 们 参 加 测 试 。
};

///////////////////////////////////////////////////////////////////////
//	Info TEST
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_TEST(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 10;
	condition		= DIA_Ulthar_TEST_Condition;
	information		= DIA_Ulthar_TEST_Info;
	description		= "我 已 经 准 备 好 面 对 你 的 考 验 ， 大 师";
};

func int DIA_Ulthar_TEST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Pyrokar_FIRE))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_TEST_Info()
{
	AI_Output(other, self, "DIA_Ulthar_TEST_15_00"); //我 已 经 准 备 好 面 对 你 的 考 验 ， 大 师。
	AI_Output(self, other, "DIA_Ulthar_TEST_05_01"); //你 了 解 旧 法 则 并 不 会 让 我 感 到 吃 惊 。
	AI_Output(self, other, "DIA_Ulthar_TEST_05_02"); //但 是 我 想 你 可 能 不 知 道 你 将 会 冒 什 么 样 的 风 险 。 牢 记 在 心 ， 急 躁 的 灵 魂 无 法 抵 挡 火 焰 测 试 。
	AI_Output(self, other, "DIA_Ulthar_TEST_05_03"); //已 经 很 久 没 有 人 参 加 这 个 测 试 了 。 只 有 一 个 人 曾 经 活 下 来 ， 并 通 过 了 测 试 。
	AI_Output(self, other, "DIA_Ulthar_TEST_05_04"); //那 是 一 个 年 青 而 且 雄 心 勃 勃 的 新 信 徒 ， 从 那 时 起 他 就 在 高 级 议 会 中 确 立 了 他 的 地 位 - 我 说 的 是 瑟 朋 帝 兹 。
	AI_Output(other, self, "DIA_Ulthar_TEST_15_05"); //他 绝 不 会 是 在 那 么 长 时 间 中 唯 一 一 个 通 过 测 试 的 人 。
	AI_Output(self, other, "DIA_Ulthar_TEST_05_06"); //那 么 我 不 会 让 你 久 等 。 听 好 我 给 你 的 测 试 ：
	AI_Output(self, other, "DIA_Ulthar_TEST_05_07"); //制 造 一 个 火 箭 咒 语 。 就 是 这 样 - 愿 英 诺 斯 帮 助 你 。

	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_Rune, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rune, LOG_RUNNING);
	B_LogEntry(TOPIC_Rune, TOPIC_Rune_3);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info RUNNING
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_RUNNING(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 10;
	condition		= DIA_Ulthar_RUNNING_Condition;
	information		= DIA_Ulthar_RUNNING_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Ulthar_RUNNING_Condition()
{
	if ((MIS_RUNE == LOG_RUNNING)
	&& Npc_IsInState(self, ZS_Talk)
	&& (Npc_HasItems(other, ItRu_FireBolt) == 0))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_RUNNING_Info()
{
	AI_Output(self, other, "DIA_Ulthar_RUNNING_05_00"); //你 知 道 了 你 的 任 务 。 去 完 成 它 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SUCCESS
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SUCCESS(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 2;
	condition		= DIA_Ulthar_SUCCESS_Condition;
	information		= DIA_Ulthar_SUCCESS_Info;
	description		= "我 已 经 制 造 了 咒 语 ！";
};

func int DIA_Ulthar_SUCCESS_Condition()
{
	if ((MIS_RUNE == LOG_RUNNING)
	&& (Npc_HasItems(hero, ItRu_FireBolt) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SUCCESS_Info()
{
	AI_Output(other, self, "DIA_Ulthar_SUCCESS_15_00"); //我 已 经 制 造 了 咒 语 ！
	AI_Output(self, other, "DIA_Ulthar_SUCCESS_05_01"); //干 得 好 ， 新 信 徒 。 你 可 以 保 留 它 ， 你 的 第 一 个 咒 语 。
	AI_Output(self, other, "DIA_Ulthar_SUCCESS_05_02"); //一 旦 你 达 到 了 第 一 级 火 之 环 时 ， 你 就 能 使 用 它 了 。
	AI_Output(self, other, "DIA_Ulthar_SUCCESS_05_03"); //你 必 须 完 成 这 个 测 试 以 使 我 满 意 。

	if ((MIS_GOLEM == LOG_RUNNING)
	&& ((Npc_IsDead(Magic_Golem)) == FALSE))
	{
		AI_Output(self, other, "DIA_Ulthar_SUCCESS_05_04"); //但 是 瑟 朋 帝 兹 给 你 指 定 的 危 险 任 务 仍 在 前 面 等 着 你 ！
	};

	MIS_RUNE = LOG_SUCCESS;
	B_GivePlayerXP(XP_RUNE);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Ulthar_KAP3_EXIT(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 999;
	condition		= DIA_Ulthar_KAP3_EXIT_Condition;
	information		= DIA_Ulthar_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulthar_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermAbKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_PermAbKap3(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 99;
	condition		= DIA_Ulthar_PermAbKap3_Condition;
	information		= DIA_Ulthar_PermAbKap3_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Ulthar_PermAbKap3_Condition()
{
	if ((Kapitel >= 3)
	|| Npc_KnowsInfo(other, DIA_Ulthar_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_PermAbKap3_Info()
{
	AI_Output(other, self, "DIA_Ulthar_PermAbKap3_15_00"); //有 新 闻 吗 ？

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Ulthar_PermAbKap3_05_01"); //现 在 不 行 。 去 完 成 你 的 任 务 。 你 还 有 很 多 事 要 做 。
	}
	else
	{
		AI_Output(self, other, "DIA_Ulthar_PermAbKap3_05_02"); //不 。 没 有 什 么 你 不 知 道 的 了 ， 兄 弟 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineVergiftet
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SCHREINEVERGIFTET(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 30;
	condition		= DIA_Ulthar_SCHREINEVERGIFTET_Condition;
	information		= DIA_Ulthar_SCHREINEVERGIFTET_Info;
	important		= TRUE;
};

func int DIA_Ulthar_SCHREINEVERGIFTET_Condition()
{
	if (Pedro_Traitor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SCHREINEVERGIFTET_Info()
{
	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_00"); //还 有 一 件 事 。 一 些 路 边 的 英 诺 斯 神 龛 已 经 遭 到 敌 人 的 亵 渎 。 它 们 已 经 失 去 了 魔 法 祭 祀 的 能 力 。
		AI_Output(other, self, "DIA_Ulthar_SCHREINEVERGIFTET_15_01"); //我 知 道 。 现 在 呢 ？
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_02"); //要 靠 你 来 净 化 这 些 神 龛 了 ， 以 使 这 种 情 况 不 再 恶 化 。
		CreateInvItems(self, ItMi_UltharsHolyWater_Mis, 1);
		B_GiveInvItems(self, other, ItMi_UltharsHolyWater_Mis, 1);
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_03"); //拿 上 这 个 圣 水 ， 然 后 让 它 流 到 神 龛 的 基 座 上 。
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_04"); //诵 念 净 化 圣 言 之 后 ， 神 龛 将 会 恢 复 以 往 的 力 量 。

		if ((Npc_HasItems(other, ItWr_Map_Shrine_MIS)) == FALSE)
		{
			if (((Npc_HasItems(Gorax, ItWr_Map_Shrine_MIS)))
			&& ((Npc_IsDead(Gorax)) == FALSE))
			{
				AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_05"); //高 莱 克 斯 会 卖 给 你 一 张 标 出 了 我 们 的 神 龛 位 置 的 地 图 。
			}
			else
			{
				AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_06"); //这 是 给 你 的 地 图 。 我 们 已 经 把 设 立 神 龛 的 位 置 在 上 面 标 明 了 。
				CreateInvItems(self, ItWr_Map_Shrine_MIS, 1);
				B_GiveInvItems(self, other, ItWr_Map_Shrine_MIS, 1);
			};
		};

		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_07"); //现 在 ， 去 执 行 你 的 任 务 。
		MIS_Ulthar_HeileSchreine_PAL = LOG_RUNNING;

		Log_CreateTopic(TOPIC_Ulthar_HeileSchreine_PAL, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Ulthar_HeileSchreine_PAL, LOG_RUNNING);
		B_LogEntry(TOPIC_Ulthar_HeileSchreine_PAL, TOPIC_Ulthar_HeileSchreine_PAL_1);

		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_08"); //还 有 一 件 小 事 。 不 要 靠 近 路 边 的 神 龛 。 我 们 听 说 它 们 之 中 有 些 已 经 遭 到 亵 渎 。
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_09"); //没 人 知 道 它 们 现 在 会 产 生 什 么 效 果 。
		AI_Output(self, other, "DIA_Ulthar_SCHREINEVERGIFTET_05_10"); //解 决 这 个 问 题 不 是 你 的 任 务 ， 圣 骑 士 会 处 理 此 事 的 。
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheilt
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheilt(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 30;
	condition		= DIA_Ulthar_SchreineGeheilt_Condition;
	information		= DIA_Ulthar_SchreineGeheilt_Info;
	description		= "我 已 经 净 化 了 所 有 的 神 龛 。";
};

func int DIA_Ulthar_SchreineGeheilt_Condition()
{
	if (MIS_Ulthar_HeileSchreine_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheilt_Info()
{
	AI_Output(other, self, "DIA_Ulthar_SchreineGeheilt_15_00"); //我 已 经 净 化 了 所 有 的 神 龛 。
	AI_Output(self, other, "DIA_Ulthar_SchreineGeheilt_05_01"); //干 得 很 好 ， 我 的 孩 子 。 我 为 你 感 到 自 豪 。 愿 英 诺 斯 守 护 你 。
	AI_Output(self, other, "DIA_Ulthar_SchreineGeheilt_05_02"); //拿 上 这 个 力 量 护 身 符 ， 它 也 许 能 在 你 对 抗 敌 人 的 战 斗 中 起 一 些 作 用 。
	CreateInvItems(self, ItAm_Dex_Strg_01, 1);
	B_GiveInvItems(self, other, ItAm_Dex_Strg_01, 1);
	B_GivePlayerXP(XP_Ulthar_SchreineGereinigt);
	AI_StopProcessInfos(self);
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
instance DIA_Ulthar_KAP4_EXIT(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 999;
	condition		= DIA_Ulthar_KAP4_EXIT_Condition;
	information		= DIA_Ulthar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulthar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchreineGeheiltNoPAL
///////////////////////////////////////////////////////////////////////
instance DIA_Ulthar_SchreineGeheiltNoPAL(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 30;
	condition		= DIA_Ulthar_SchreineGeheiltNoPAL_Condition;
	information		= DIA_Ulthar_SchreineGeheiltNoPAL_Info;
	important		= TRUE;
};

func int DIA_Ulthar_SchreineGeheiltNoPAL_Condition()
{
	if (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Ulthar_SchreineGeheiltNoPAL_Info()
{
	AI_Output(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_00"); //好 消 息 ， 路 边 的 神 龛 已 经 被 净 化 了 。 英 诺 斯 的 力 量 帮 助 圣 骑 士 把 这 个 问 题 从 这 个 世 界 中 排 除 出 去 了 。
	AI_Output(self, other, "DIA_Ulthar_SchreineGeheiltNoPAL_05_01"); //你 可 以 再 次 毫 无 保 留 和 遗 憾 地 向 英 诺 斯 奉 献 了 。
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
instance DIA_Ulthar_KAP5_EXIT(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 999;
	condition		= DIA_Ulthar_KAP5_EXIT_Condition;
	information		= DIA_Ulthar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulthar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Ulthar_KAP6_EXIT(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 999;
	condition		= DIA_Ulthar_KAP6_EXIT_Condition;
	information		= DIA_Ulthar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ulthar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Ulthar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ulthar_PICKPOCKET(C_INFO)
{
	npc				= KDF_502_Ulthar;
	nr				= 900;
	condition		= DIA_Ulthar_PICKPOCKET_Condition;
	information		= DIA_Ulthar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Ulthar_PICKPOCKET_Condition()
{
	C_Beklauen(74, 320);
};

func void DIA_Ulthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET, DIALOG_BACK, DIA_Ulthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ulthar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ulthar_PICKPOCKET_DoIt);
};

func void DIA_Ulthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};

func void DIA_Ulthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ulthar_PICKPOCKET);
};
