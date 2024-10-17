///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_EXIT(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 999;
	condition		= DIA_Addon_Fortuno_EXIT_Condition;
	information		= DIA_Addon_Fortuno_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Fortuno_PICKPOCKET(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 900;
	condition		= DIA_Addon_Fortuno_PICKPOCKET_Condition;
	information		= DIA_Addon_Fortuno_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Fortuno_PICKPOCKET_Condition()
{
	C_Beklauen(10, 25);
};

func void DIA_Addon_Fortuno_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_BACK, DIA_Addon_Fortuno_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Fortuno_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Fortuno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Fortuno_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};

func void DIA_Addon_Fortuno_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_Hi(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 2;
	condition		= DIA_Addon_Fortuno_Hi_Condition;
	information		= DIA_Addon_Fortuno_Hi_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Fortuno_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Fortuno_Geheilt_01 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Hi_Info()
{
	if (Fortuno_Einmal == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Fortuno_Hi_13_00"); //（ 不 安 的 ） 一 片 黑 云 笼 罩 在 房 子 上 方 … … 那 个 家 伙 接 近 了 … …
		AI_Output(self, other, "DIA_Addon_Fortuno_Hi_13_01"); //带 着 鲜 血 … … 用 来 召 唤 他 … … 他 看 着 我 … … 他 看 着 我 … … 哦 ， 不 ， 走 开 ， 走 开 … …
		AI_Output(other, self, "DIA_Addon_Fortuno_Hi_15_02"); //你 没 事 吧 ？
		Fortuno_Einmal = TRUE;

		Log_CreateTopic(Topic_Addon_Fortuno, LOG_MISSION);
		Log_SetTopicStatus(Topic_Addon_Fortuno, LOG_RUNNING);

		B_LogEntry(Topic_Addon_Fortuno, Topic_Addon_Fortuno_1);
	};

	AI_Output(self, other, "DIA_Addon_Fortuno_Hi_13_03"); //绿 色 … … 绿 色 新 信 徒 … … 我 找 不 到 它 … …

	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Info_AddChoice(DIA_Addon_Fortuno_Hi, "我 很 快 回 来 … … （ 结 束 ）", DIA_Addon_Fortuno_Hi_BACK);

	Info_AddChoice(DIA_Addon_Fortuno_Hi, "我 怎 么 帮 助 你 ？", DIA_Addon_Fortuno_Hi_HILFE);

	if (Npc_HasItems(other, ItMi_Joint) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi, "给 ， 拿 上 这 个 沼 生 草 。", DIA_Addon_Fortuno_Hi_JOINT);
	};

	if (Npc_HasItems(other, ItMi_Addon_Joint_01) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Hi, "给 ， 拿 上 这 个 ‘ 绿 色 新 信 徒 ’ 。", DIA_Addon_Fortuno_Hi_GREEN);
	};
};

func void DIA_Addon_Fortuno_Hi_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Fortuno_Hi_HILFE()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Hi_HILFE_15_00"); //我 怎 么 帮 助 你 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_Hi_HILFE_13_01"); //绿 色 … … 绿 色 新 信 徒 能 帮 助 新 信 徒 … …
};

func void DIA_Addon_Fortuno_Hi_JOINT()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Hi_JOINT_15_00"); //给 ， 拿 上 这 个 沼 生 草 。

	if (B_GiveInvItems(other, self, ItMi_Joint, 1))
	{
		AI_UseItem(self, ItMI_Joint);
	};

	AI_Output(self, other, "DIA_Addon_Fortuno_Hi_JOINT_13_01"); //不 是 绿 色 ， 不 够 有 劲 ， 不 是 绿 色 ， 不 够 有 劲 … …
};

func void DIA_Addon_Fortuno_Hi_GREEN()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Hi_GREEN_15_00"); //给 ， 拿 上 这 个 ‘ 绿 色 新 信 徒 ’ 。

	if (B_GiveInvItems(other, self, ItMi_Addon_Joint_01, 1))
	{
		AI_UseItem(self, ItMI_Addon_Joint_01);
	};

	AI_Output(self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_01"); //（ 正 在 恢 复 ） 啊 啊 … …
	AI_Output(self, other, "DIA_Addon_Fortuno_Hi_GREEN_13_02"); //我 的 头 … … 谁 … … 我 是 … … 佛 图 诺 … … 出 了 什 么 … … 什 么 问 题 ？

	Info_ClearChoices(DIA_Addon_Fortuno_Hi);
	Fortuno_Geheilt_01 = TRUE;

	B_GivePlayerXP(XP_Addon_Fortuno_01);

	B_LogEntry(Topic_Addon_Fortuno, Topic_Addon_Fortuno_2);
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_wer(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 2;
	condition		= DIA_Addon_Fortuno_wer_Condition;
	information		= DIA_Addon_Fortuno_wer_Info;
	description		= "那 么 ， 告 诉 我 你 发 生 了 什 么 事 。";
};

func int DIA_Addon_Fortuno_wer_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_wer_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_wer_15_00"); //那 么 ， 告 诉 我 你 发 生 了 什 么 事 。
	AI_Output(self, other, "DIA_Addon_Fortuno_wer_13_01"); //当 我 加 入 沉 睡 者 兄 弟 会 之 后 ， 一 切 事 情 都 不 错 。
	AI_Output(self, other, "DIA_Addon_Fortuno_wer_13_02"); //好 ， 我 们 全 都 是 已 被 定 罪 的 罪 犯 ， 但 是 对 我 们 来 说 ， 新 信 徒 的 命 不 用 去 管 … …
	AI_Output(other, self, "DIA_Addon_Fortuno_wer_15_03"); //嘿 ， 我 自 己 就 是 矿 藏 山 谷 的 囚 犯 。 告 诉 我 一 些 新 鲜 事 。
	AI_Output(self, other, "DIA_Addon_Fortuno_wer_13_04"); //我 … … 我 什 么 事 都 记 不 起 。 黑 暗 在 我 的 思 想 中 萦 绕 … …
	AI_Output(other, self, "DIA_Addon_Fortuno_wer_15_05"); //来 吧 ， 集 中 。 发 生 了 什 么 事 ？ 你 什 么 时 候 恢 复 意 识 的 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_wer_13_06"); //瑞 雯 … … 我 只 记 得 瑞 雯 ， 还 有 … … 还 有 黑 暗 的 房 间 。
	AI_Output(other, self, "DIA_Addon_Fortuno_wer_15_07"); //瑞 雯 怎 么 了 ？ 他 对 你 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_wer_13_08"); //（ 叹 息 ） 我 很 抱 歉 。 好 像 我 的 思 想 被 囚 禁 了 一 样 … … 我 自 己 也 不 明 白 … …
};

///////////////////////////////////////////////////////////////////////
//	Info FREE
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_FREE(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 5;
	condition		= DIA_Addon_Fortuno_FREE_Condition;
	information		= DIA_Addon_Fortuno_FREE_Info;
	description		= "一 定 有 方 法 重 新 整 理 你 的 记 忆 。";
};

func int DIA_Addon_Fortuno_FREE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Fortuno_wer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_FREE_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_FREE_15_00"); //一 定 有 方 法 重 新 整 理 你 的 记 忆 。
	AI_Output(self, other, "DIA_Addon_Fortuno_FREE_13_01"); //是 的 … … 是 的 ， 也 许 有 一 个 方 法 。
	AI_Output(self, other, "DIA_Addon_Fortuno_FREE_13_02"); //那 个 宗 教 老 师 知 道 很 多 方 式 来 改 变 精 神 和 意 志 。
	AI_Output(other, self, "DIA_Addon_Fortuno_FREE_15_03"); //你 还 记 得 和 那 有 关 的 任 何 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_FREE_13_04"); //不 ， 恐 怕 这 些 知 识 已 经 和 宗 教 老 师 一 起 消 失 了 … …
	AI_Output(other, self, "DIA_Addon_Fortuno_FREE_15_05"); //该 死 。 嗯 - 如 果 有 方 法 解 放 你 的 精 神 ， 我 会 找 到 它 的 。

	Wld_InsertNpc(Bloodfly, "ADW_PATH_TO_BL_09");
	Wld_InsertNpc(Bloodfly, "ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly, "ADW_PATH_TO_BL_10");
	Wld_InsertNpc(Bloodfly, "ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(Bloodfly, "ADW_PATH_TO_LOCH_01");

	B_LogEntry(Topic_Addon_Fortuno, Topic_Addon_Fortuno_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Herb
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_Herb(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 99;
	condition		= DIA_Addon_Fortuno_Herb_Condition;
	information		= DIA_Addon_Fortuno_Herb_Info;
	description		= "你 还 需 要 沼 生 草 吗？";
};

func int DIA_Addon_Fortuno_Herb_Condition()
{
	if (Fortuno_Geheilt_01 == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Herb_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Herb_15_00"); //你 还 需 要 沼 生 草 吗？
	AI_Output(self, other, "DIA_Addon_Fortuno_Herb_13_01"); //是 的 ， 一 点 也 不 错 。 我 会 买 下 你 手 上 所 有 的 沼 生 草 。
	AI_Output(self, other, "DIA_Addon_Fortuno_Herb_13_02"); //我 付 的 价 钱 甚 至 会 比 费 斯 克 的 更 高 。
};

func void B_Fortuno_InfoManager()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
	Info_AddChoice(DIA_Addon_Fortuno_Trade, DIALOG_BACK, DIA_Addon_Fortuno_Trade_BACK);
	if (Npc_HasItems(other, ITPl_SwampHerb) >= 1)
	{
		Info_AddChoice(DIA_Addon_Fortuno_Trade, "（ 交 出 所 有 的 沼 生 草 ） ", DIA_Addon_Fortuno_Trade_all);
		Info_AddChoice(DIA_Addon_Fortuno_Trade, "（ 交 出 １ 个 沼 生 草 ） ", DIA_Addon_Fortuno_Trade_1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade (kein Trade Modul!)
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_Trade(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 100;
	condition		= DIA_Addon_Fortuno_Trade_Condition;
	information		= DIA_Addon_Fortuno_Trade_Info;
	permanent		= TRUE;
	description		= "我 给 你 找 到 了 沼 生 草 … …";
};

func int DIA_Addon_Fortuno_Trade_Condition()
{
	if ((Npc_HasItems(other, ITPl_SwampHerb) >= 1)
	&& Npc_KnowsInfo(other, DIA_Addon_Fortuno_Herb))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trade_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Trade_15_00"); //我 给 你 找 到 了 沼 生 草 … …
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_BACK()
{
	Info_ClearChoices(DIA_Addon_Fortuno_Trade);
};

func void DIA_Addon_Fortuno_Trade_all()
{
	var int amount;
	amount = Npc_HasItems(other, Itpl_Swampherb);

	if (B_GiveInvItems(other, self, ITPL_Swampherb, amount))
	{
		Npc_RemoveInvItems(self, ITPL_Swampherb, Npc_HasItems(self, ITPL_Swampherb));
	};

	B_GiveInvItems(self, other, ItMi_Gold, amount * Value_SwampHerb);

	B_GivePlayerXP(amount * 10);
	B_Fortuno_InfoManager();
};

func void DIA_Addon_Fortuno_Trade_1()
{
	if (B_GiveInvItems(other, self, ITPL_Swampherb, 1))
	{
		Npc_RemoveInvItems(self, ITPL_Swampherb, Npc_HasItems(self, ITPL_Swampherb));
	};

	B_GiveInvItems(self, other, ItMi_Gold, Value_SwampHerb);

	B_GivePlayerXP(10);
	B_Fortuno_InfoManager();
};

///////////////////////////////////////////////////////////////////////
//	Info Trank
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_Trank(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 3;
	condition		= DIA_Addon_Fortuno_Trank_Condition;
	information		= DIA_Addon_Fortuno_Trank_Info;
	description		= "我 给 你 找 到 了 药 剂 … …";
};

func int DIA_Addon_Fortuno_Trank_Condition()
{
	if ((Fortuno_Geheilt_01 == TRUE)
	&& Npc_KnowsInfo(other, DIA_Addon_Fortuno_FREE)
	&& ((Npc_HasItems(other, ItPo_Addon_Geist_01) >= 1)
	|| (Npc_HasItems(other, ItPo_Addon_Geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Trank_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_Trank_15_00"); //我 给 你 一 个 药 剂 。 它 能 唤 醒 你 的 记 忆 。
	AI_Output(self, other, "DIA_Addon_Fortuno_Trank_13_01"); //我 相 信 你 。

	if (Npc_HasItems(other, ItPo_Addon_Geist_02) >= 1) // der richtige
	{
		if (B_GiveInvItems(other, self, ItPo_Addon_Geist_02, 1))
		{
			AI_UseItem(self, ItPo_Addon_Geist_02);
		};

		B_GivePlayerXP(XP_Addon_Fortuno_02);
	}
	else
	{
		if (B_GiveInvItems(other, self, ItPo_Addon_Geist_01, 1)) // der...äh...tödliche
		{
			Log_SetTopicStatus(Topic_Addon_Fortuno, LOG_OBSOLETE);
			AI_StopProcessInfos(self);
			AI_UseItem(self, ItPo_Addon_Geist_01);
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info No more Secrets
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fortuno_more(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 2;
	condition		= DIA_Addon_Fortuno_more_Condition;
	information		= DIA_Addon_Fortuno_more_Info;
	description		= "然 后 … … ？";
};

func int DIA_Addon_Fortuno_more_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_more_Info()
{
	AI_Output(other, self, "DIA_Addon_Fortuno_more_15_00"); //然 后 … … ？
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_01"); //啊 ！ 我 … … 我 又 记 起 来 了 ！ 现 在 我 看 到 了 … … 亚 达 诺 斯 我 和 在 一 起 - 我 做 了 什 么 ？
	AI_Output(other, self, "DIA_Addon_Fortuno_more_15_02"); //是 的 ， 你 做 了 什 么 ？ 最 重 要 的 是 - 瑞 雯 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_03"); //我 帮 助 他 … … 我 帮 助 他 … … 制 作 催 化 剂 。 和 他 一 起 。 他 想 要 各 种 的 练 金 药 … … 我 帮 他 酿 造 。
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_04"); //他 想 要 打 开 传 送 门 进 入 神 殿 。
	AI_Output(other, self, "DIA_Addon_Fortuno_more_15_05"); //为 什 么 ？ 他 想 要 从 神 殿 拿 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_06"); //一 个 强 大 的 宝 物 … … 它 和 那 个 曾 经 携 带 它 的 人 一 起 被 埋 葬 在 里 面 。 一 个 曾 经 败 给 ‘ 他 ’ 的 强 大 的 战 士 … …
	AI_Output(other, self, "DIA_Addon_Fortuno_more_15_07"); //然 后 呢 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_08"); //我 们 无 法 打 开 传 送 门 … …
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_09"); //但 是 瑞 雯 肯 定 自 己 能 行 ， 如 果 他 能 把 牧 师 的 坟 墓 挖 出 来 的 话 。
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_10"); //所 以 他 才 把 奴 隶 带 到 这 里 来 。 他 可 以 强 迫 那 些 牺 牲 品 在 时 间 的 能 量 安 息 的 地 方 挖 掘 。
	AI_Output(other, self, "DIA_Addon_Fortuno_more_15_11"); //牧 师 的 坟 墓 ？
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_12"); //亚 达 诺 斯 的 牧 师 的 安 息 之 地 。 它 就 坐 落 在 矿 井 里 。
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_13"); //我 也 记 得 那 些 石 片 。 他 相 信 它 们 可 以 给 他 指 示 道 路 。
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_14"); //一 旦 他 破 译 了 它 们 上 面 那 些 字 母 的 意 义 ， 他 就 不 再 需 要 我 了 。
	AI_Output(self, other, "DIA_Addon_Fortuno_more_13_15"); //他 向 我 施 展 了 遗 忘 魔 法 … … 现 在 你 已 经 救 了 我 。

	SC_KnowsFortunoInfos = TRUE;

	B_LogEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_3);
	Log_AddEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_4);
	Log_AddEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_5);

	Npc_ExchangeRoutine(self, "START");
	B_GivePlayerXP(XP_Addon_Fortuno_03);
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Fortuno_Attentat(C_INFO)
{
	npc				= BDT_1075_Addon_Fortuno;
	nr				= 9;
	condition		= DIA_Addon_Fortuno_Attentat_Condition;
	information		= DIA_Addon_Fortuno_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Fortuno_Attentat_Condition()
{
	if ((MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Addon_Fortuno_Trank))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fortuno_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Fortuno_Attentat_13_00"); //攻 击 ？ 对 不 起 ， 我 已 经 … … 很 长 时 间 … … 一 直 都 心 不 在 焉 。 我 不 知 道 任 何 关 于 它 的 事 情 。
};
