// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Greg_NW_EXIT(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 999;
	condition		= DIA_Addon_Greg_NW_EXIT_Condition;
	information		= DIA_Addon_Greg_NW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Greg_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Greg_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
	PlayerTalkedToGregNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

// 1. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info HalloW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Hallo(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_Hallo_Condition;
	information		= DIA_Addon_Greg_NW_Hallo_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_Hallo_Condition()
{
	if (GregLocation == Greg_Farm1)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Hallo_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_01_00"); //噗呲，嘿！你，过来这。
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_15_01"); //这 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_01_02"); //你 要 去 城 里 ？ 也 真 的 很 忙 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_01_03"); //（ 讨 厌 的 ） 听 着 。 你 看 起 来 像 个 聪 明 人 。 我 打 赌 你 的 一 生 一 定 前 途 远 大 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_01_04"); //你 当 然 是 大 智 若 愚 ， 我 立 刻 就 看 出 来 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_01_05"); //我 说 ， 你 一 定 想 要 赚 一 笔 钱 ， 是 吗 ？

	PlayerTalkedToGregNW = TRUE;
	SC_MeetsGregTime = 1; // Joly: erste Mal getroffen.

	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, "关 于 城 市 守 卫 … …", DIA_Addon_Greg_NW_Hallo_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, "别 说 废 话 。 告 诉 我 你 想 要 什 么 。", DIA_Addon_Greg_NW_Hallo_schleim);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, "你 不 象 有 钱 人 。", DIA_Addon_Greg_NW_Hallo_vorsicht);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, "你 在 躲 避 某 个 人 ？", DIA_Addon_Greg_NW_Hallo_hide);
	Info_AddChoice(DIA_Addon_Greg_NW_Hallo, "为 什 么 不 ？", DIA_Addon_Greg_NW_Hallo_ja);
};

func void DIA_Addon_Greg_NW_Hallo_weg()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_weg_15_00"); //我 必 须 走 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_weg_01_01"); //（ 生 气 ） 那 么 说 你 不 想 帮 助 我 。 我 会 记 住 的 ， 朋 友 。 我 们 会 再 见 面 的 。

	AI_StopProcessInfos(self);
	MIS_Addon_Greg_BringMeToTheCity = LOG_FAILED;
};

func void DIA_Addon_Greg_NW_Hallo_ja()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_ja_15_00"); //为 什 么 不 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_01"); //你 一 定 要 原 谅 这 个 无 知 的 老 水 手 ， 我 刚 到 这 些 地 方 ， 真 的 不 知 道 所 有 的 规 则 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_02"); //所 以 我 费 了 很 大 劲 儿 才 知 道 港 口 城 市 不 欢 迎 旅 行 的 陌 生 人 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_03"); //（ 夸 张 的 自 我 同 情 ） 现 在 我 站 在 这 里 ， 不 知 道 我 要 怎 么 才 能 进 入 城 市 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_04"); //我 有 一 些 非 常 重 要 的 事 情 要 处 理 ， 我 的 客 户 不 能 容 忍 拖 延 ， 你 知 道 吗 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_ja_01_05"); //你 会 帮 我 找 到 通 过 那 些 城 市 卫 兵 的 方 法 ， 是 吗 ？
	Info_ClearChoices(DIA_Addon_Greg_NW_Hallo);

	Log_CreateTopic(TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_1);

	MIS_Addon_Greg_BringMeToTheCity = LOG_RUNNING;
};

func void DIA_Addon_Greg_NW_Hallo_vorsicht()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_vorsicht_15_00"); //你 不 象 有 钱 人 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_01"); //（ 夸 张 的 羞 怯 ） 嗯 ， 我 当 然 不 会 在 与 你 这 样 的 绅 士 一 样 在 同 一 个 地 方 绕 圈 子 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_02"); //但 是 你 不 会 拒 绝 我 向 你 那 可 观 的 财 产 中 的 捐 赠 一 点 点 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_vorsicht_01_03"); //嗯 ， 你 认 为 怎 么 样 ？ 我 能 指 望 你 吗 ？
};

func void DIA_Addon_Greg_NW_Hallo_schleim()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_schleim_15_00"); //别 说 废 话 。 告 诉 我 你 想 要 什 么 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_01"); //你 明 白 吗 ？ 那 就 是 我 的 意 思 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_02"); //像 你 那 样 只 说 好 话 的 话 ， 没 人 能 吃 得 开 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_03"); //我 早 就 知 道 了 。 我 正 在 同 一 个 最 棒 的 生 意 人 交 道 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_schleim_01_04"); //你 是 一 个 生 意 人 ， 当 然 乐 意 为 你 的 钱 包 增 加 一 点 额 外 的 收 入 ， 是 吗 ？
};

func void DIA_Addon_Greg_NW_Hallo_hide()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Hallo_hide_15_00"); //你 在 躲 避 某 个 人 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_01"); //当 然 不 ， 多 么 可 笑 。 我 只 是 喜 欢 站 在 树 中 间 ， 那 样 风 不 会 直 接 吹 到 我 的 脸 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Hallo_hide_01_02"); //但 是 你 呢 ， 现 在 ？ 你 想 要 这 件 工 作 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Stadtwachen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Stadtwachen(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_Stadtwachen_Condition;
	information		= DIA_Addon_Greg_NW_Stadtwachen_Info;
	permanent		= TRUE;
	description		= "关 于 城 市 守 卫 … …";
};

func int DIA_Addon_Greg_NW_Stadtwachen_Condition()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	&& (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};

var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein;
var int DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino;

func void DIA_Addon_Greg_NW_Stadtwachen_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_15_00"); //关 于 城 市 守 卫 … …
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_01_01"); //是 的 ？ 有 什 么 想 法 ？

	Info_ClearChoices(DIA_Addon_Greg_NW_Stadtwachen);
	Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, "我 必 须 要 先 考 虑 一 下 。", DIA_Addon_Greg_NW_Stadtwachen_nochnicht);

	if (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld == FALSE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, "贿 赂 行 为 呢 ？", DIA_Addon_Greg_NW_Stadtwachen_geld);
	};

	if ((DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein == FALSE)
	&& (Npc_HasItems(other, ItWr_Passierschein)))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, "我 有 一 张 城 市 通 行 证 。", DIA_Addon_Greg_NW_Stadtwachen_Schein);
	};

	if ((MIS_Addon_Lester_PickForConstantino != 0)
	&& (DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino == FALSE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, "你 可 以 作 为 一 名 采 药 人 进 入 城 市 。", DIA_Addon_Greg_NW_Stadtwachen_constantino);
	};

	if ((Npc_HasItems(other, ItAr_BAU_L)) || (Npc_HasItems(other, ItAr_BAU_M)))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_Stadtwachen, "如 果 你 穿 着 这 些 农 民 的 衣 服 ， 他 们 应 该 会 让 你 通 过 。", DIA_Addon_Greg_NW_Stadtwachen_klamotten);
	};
};

func void DIA_Addon_Greg_NW_Stadtwachen_klamotten()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00"); //如 果 你 穿 着 这 些 农 民 的 衣 服 ， 他 们 应 该 会 让 你 通 过 。

	if (Npc_HasItems(other, ItAr_BAU_L))
	{
		B_GiveInvItems(other, self, ItAr_BAU_L, 1);
	}
	else // ITAR_BAU_M
	{
		B_GiveInvItems(other, self, ITAR_BAU_M, 1);
	};

	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01"); //正 是 我 想 要 的 ， 伙 计 ， 我 就 知 道 你 是 可 以 信 赖 的 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02"); //(敌 意 地) 伪 装 成 乡 巴 佬 就 没 人 烦 我 了 。

	if (Npc_HasItems(self, ItAr_BAU_L))
	{
		AI_EquipArmor(self, ItAr_BAU_L);
	}
	else // ITAR_BAU_M
	{
		AI_EquipArmor(self, ITAR_BAU_M);
	};

	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03"); //干 得 好 。 这 是 你 应 得 的 报 酬 。

	CreateInvItems(self, ItMi_Gold, 50);
	B_GiveInvItems(self, other, ItMi_Gold, 50);
	B_GivePlayerXP(XP_Greg_NW_GiveBauArmor);

	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04"); //(生 气 地)什 么 ？ 就 50 个 金 币 ？ 开 玩 笑 吧 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05"); //(傲 慢 地)金 币 不 代 表 一 切 ， 就 这 些 吧 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06"); //我 相 信 我 们 还 会 见 面 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07"); //天 晓 得 。 我 会 报 答 你 的 。 保 重 。
	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "Markt");

	B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_2);

	MIS_Addon_Greg_BringMeToTheCity = LOG_SUCCESS;
};

func void DIA_Addon_Greg_NW_Stadtwachen_nochnicht()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00"); //我 必 须 要 先 考 虑 一 下 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01"); //(严 肃 地)好 吧 。 快 行 动 吧 。
	AI_StopProcessInfos(self);
};

func void DIA_Addon_Greg_NW_Stadtwachen_Schein()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00"); //我 有 一 张 城 市 通 行 证 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01"); //(嘲 讽 地)哦 ， 我 知 道 了 。 我 就 该 象 城 镇 居 民 那 样 行 动 ， 对 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02"); //(生 气 地)看 看 我 ， 孩 子 。 鬼 才 信 你 的 话 。
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_Schein = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_constantino()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00"); //你 可 以 作 为 一 名 采 药 人 进 入 城 市 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01"); //(生 气 地)什 么 ？ 我 像 个 毛 孩 子 吗 ？
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_constantino = TRUE;
};

func void DIA_Addon_Greg_NW_Stadtwachen_geld()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_Stadtwachen_geld_15_00"); //贿 赂 行 为 呢 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Stadtwachen_geld_01_01"); //(无 耻 地)好 吧 ， 要 是 非 要 这 么 做 ， 我 就 这 么 做 吧 。
	DIA_Addon_Greg_NW_Stadtwachen_ChoiceClose_geld = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PERM(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_PERM_Condition;
	information		= DIA_Addon_Greg_NW_PERM_Info;
	permanent		= TRUE;
	description		= "还 有 一 件 事 … …";
};

func int DIA_Addon_Greg_NW_PERM_Condition()
{
	if (((MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	&& (GregLocation == Greg_Farm1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_PERM_15_00"); //还 有 一 件 事 … …
	AI_Output(self, other, "DIA_Addon_Greg_NW_PERM_01_01"); //(傲 慢 地)听 着 ， 孩 子 。 我 现 在 有 重 要 事 情 要 做 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_PERM_01_02"); //(阴 险 地)我 们 回 头 再 说 ， 好 么 ？
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

// 2. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info MeetGregSecondTime
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_MeetGregSecondTime(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_MeetGregSecondTime_Condition;
	information		= DIA_Addon_Greg_NW_MeetGregSecondTime_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_MeetGregSecondTime_Condition()
{
	if (GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_MeetGregSecondTime_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_00"); //看 看 谁 来 了 。

	if (MIS_Addon_Greg_BringMeToTheCity == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_01"); //乡 下 孩 子 。
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED)
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_02"); //这 家 伙 公 开 侮 辱 我 ， 今 天 我 们 又 见 面 了 ？
	}
	else if (MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_03"); //(恼 火)我 还 以 为 你 要 帮 我 ， 结 果 你 却 跑 了 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_04"); //你 是 不 是 认 为 我 会 永 远 留 在 这 里 ？
		AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_05"); //一切 都 真 相 大 白 了 。 你 要 自 力 更 生 才 对 。 但 我 不 会 再 让 你 跑 了 。
	};

	AI_Output(self, other, "DIA_Addon_Greg_NW_MeetGregSecondTime_01_06"); //你 来 得 正 是 时 候 。
	SC_SawGregInTaverne = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wer
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_wer(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_wer_Condition;
	information		= DIA_Addon_Greg_NW_wer_Info;
	description		= "不 过 ， 你 是 谁 ？";
};

func int DIA_Addon_Greg_NW_wer_Condition()
{
	if (GregLocation >= Greg_Taverne)
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_wer_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_wer_15_00"); //不 过 ， 你 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_wer_01_01"); //那 不 关 你 的 事 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_wer_01_02"); //如 果 我 想 告 诉 你 我 是 谁，我 早 就 说 了，明 白 吗 ?
};

///////////////////////////////////////////////////////////////////////
//	Info was
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_was(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_was_Condition;
	information		= DIA_Addon_Greg_NW_was_Info;
	description		= "你 想 从 我 这 里 得 到 什 么 ？";
};

func int DIA_Addon_Greg_NW_was_Condition()
{
	if (GregLocation == Greg_Taverne)
	{
		return TRUE;
	};
};

func void B_Greg_Search_Dexter()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_00"); //我 在 找 一 个 家 伙 。 城 里 没 有 ， 那 些 笨 蛋 对 此 一 无 所 知 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_01"); //他 瘦 瘦 的 ， 黑 头 发 ， 常 穿 一 件 红 色 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Search_Dexter_01_02"); //据 我 所 知 ， 他 曾 是 这 个 流 放 地 的 囚 犯 。 名 字 开 头 可 能 是 'D'。

	Log_CreateTopic(TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_3);

	SC_KnowsGregsSearchsDexter = TRUE;
};

func void DIA_Addon_Greg_NW_was_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_15_00"); //你 想 从 我 这 里 得 到 什 么 ？

	if (MIS_Addon_Greg_BringMeToTheCity != 0)
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_was_15_01"); //还 对 付 不 了 城 市 守 卫 ？
		AI_Output(self, other, "DIA_Addon_Greg_NW_was_01_02"); //(威 胁 地)我 要 让 你 尝 尝 我 的 厉 害 。
	};

	B_Greg_Search_Dexter();

	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "你 说 的 是 迪 雅 戈 。", DIA_Addon_Greg_NW_was_Diego);

	if ((Bdt13_Dexter_verraten == TRUE)
	|| (Ranger_SCKnowsDexter == TRUE))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_was, "他 的 名 字 可 能 是 德 克 斯 特 ？", DIA_Addon_Greg_NW_was_Dexter);
	};

	Info_AddChoice(DIA_Addon_Greg_NW_was, "我 不 认 识 任 何 符 合 描 述 的 人 。", DIA_Addon_Greg_NW_was_no);
};

func void DIA_Addon_Greg_NW_was_GregUnsicher()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_00"); //可 能 就 是 他 的 名 字 ， 我 不 敢 确 定 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_GregUnsicher_01_01"); //见 了 面 可 能 就 知 道 了 。
};

func void DIA_Addon_Greg_NW_was_UnNun()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_UnNun_15_00"); //还 有 吗 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_01"); //(生 气)闭 嘴 ！ 还 有 其 他 事 情 呢 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_UnNun_01_02"); //我 需 要 一 些 武 器 ， 一 些 装 备 。 价 钱 还 不 能 太 高 。

	Info_ClearChoices(DIA_Addon_Greg_NW_was);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "我 帮 不 了 你 。", DIA_Addon_Greg_NW_was_NoHelp);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "食 物 ？ 你 在 一 个 酒 馆 里 。", DIA_Addon_Greg_NW_was_Orlan);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "武 器 ？ 商 人 有 武 器 。", DIA_Addon_Greg_NW_was_SLD);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "这 是 １ ０ 枚 金 币 。", DIA_Addon_Greg_NW_was_HierGold);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "你 没 在 城 市 里 找 到 武 器 供 货 商 ？", DIA_Addon_Greg_NW_was_Waffenhaendler);
	Info_AddChoice(DIA_Addon_Greg_NW_was, "金 子 ？ 我 们 都 想 要 金 子 。", DIA_Addon_Greg_NW_was_Gold);
};

func void DIA_Addon_Greg_NW_was_NoHelp()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_NoHelp_15_00"); //我 帮 不 了 你 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_01"); //(生 气)哦 ， 你 究 竟 想 要 什 么。

	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_RUNNING) || (MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED))
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_02"); //这 时 你 第 二 次 陷 我 于 不 仁 不 义 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_03"); //我 来 给 你 一 些 建 议 ： 我 们 最 好 别 再 见 面 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_was_NoHelp_01_04"); //记 住 了 ， 没 问 题 。
	};

	MIS_Addon_Greg_RakeCave = LOG_OBSOLETE;
	GregLocation = Greg_Bigcross;
	AI_StopProcessInfos(self);
	AI_UseMob(self, "BENCH", -1);
	Npc_ExchangeRoutine(self, "Bigcross");
	B_StartotherRoutine(BAU_974_Bauer, "Start");
};

func void DIA_Addon_Greg_NW_was_Gold()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Gold_15_00"); //金 子 ？ 我 们 都 想 要 金 子 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_Gold_01_01"); //有 可 能 。你 会 怎 么 处 理 它 ？如 果 我 是 法 官 的 话，你 可 以 在 酒 馆 里 喝 一 杯 ，也 可 以 在 妓 院 里 玩 一 玩 。
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Gold_15_02"); //你 还 有 更 好 的 计 划 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_Gold_01_03"); //(生 气)要 是 知 道 了 我 的 所 作 所 为 ， 你 肯 定 吓 得 要 死 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_Gold_01_04"); //闭 嘴 ， 否 则 我 撕 烂 你 的 嘴 。
};

func void DIA_Addon_Greg_NW_was_Waffenhaendler()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Waffenhaendler_15_00"); //你 没 在 城 市 里 找 到 武 器 供 货 商 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_Waffenhaendler_01_01"); //别 生 气 ， 不 过 说 说 而 已 。
};

func void DIA_Addon_Greg_NW_was_HierGold()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_HierGold_15_00"); //这 是 １ ０ 枚 金 币 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_01"); //(大 笑)该 死 的 ， 留 着 你 的 钱 吧 ， 我 还 有 更 好 的 主 意 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_02"); //附 近 有 个 洞 穴 ！ 我 以 前 去 过 ， 我 把 一 些 东 西 埋 在 那 里 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_HierGold_01_03"); //我 自 己 去 那 个 洞 穴 肯 定 很 危 险 。 希 望 你 和 我 同 行 。

	Log_CreateTopic(TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_4);

	MIS_Addon_Greg_RakeCave = LOG_RUNNING;
	Info_ClearChoices(DIA_Addon_Greg_NW_was);
};

func void DIA_Addon_Greg_NW_was_SLD()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_SLD_15_00"); //武 器 ？ 商 人 有 武 器 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_SLD_01_01"); //有 意 思 ， 听 说 胖 农 夫 欧 纳 尔 曾 雇 了 一 些 人 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_SLD_01_02"); //(大 笑)对 旱 鸭 子 来 说 还 不 坏 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_SLD_01_03"); //不 错 的 主 意 。 我 或 许 应 当 去 看 看 他 们 。
};

func void DIA_Addon_Greg_NW_was_Orlan()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Orlan_15_00"); //食 物 ？ 你 在 一 个 酒 馆 里 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_Orlan_01_01"); //那 个 愚 蠢 的 服 务 生 见 钱 眼 开 ， 没 钱 他 什 么 也 不 给 你 。
};

func void DIA_Addon_Greg_NW_was_no()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_no_15_00"); //我 不 认 识 任 何 符 合 描 述 的 人 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_was_no_01_01"); //我 好 像 听 说 过 。
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Diego()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Diego_15_00"); //你 说 的 是 迪 雅 戈 。
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

func void DIA_Addon_Greg_NW_was_Dexter()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_was_Dexter_15_00"); //他 的 名 字 可 能 是 德 克 斯 特 ？
	DIA_Addon_Greg_NW_was_GregUnsicher();
	DIA_Addon_Greg_NW_was_UnNun();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveLos
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCaveLos(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_RakeCaveLos_Condition;
	information		= DIA_Addon_Greg_NW_RakeCaveLos_Info;
	description		= "我 们 去 探 访 一 下 那 个 洞 穴 。";
};

func int DIA_Addon_Greg_NW_RakeCaveLos_Condition()
{
	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveLos_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCaveLos_15_00"); //我 们 去 探 访 一 下 那 个 洞 穴 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveLos_01_01"); //跟 我 来 。
	AI_StopProcessInfos(self);
	AI_UseMob(self, "BENCH", -1);
	Npc_ExchangeRoutine(self, "RakeCave");
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCaveThere
///////////////////////////////////////////////////////////////////////
func void B_Greg_GoNow()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_03"); //(发 号 施 令 地)还 等 什 么 ？ 快 进 去 把 东 西 拿 出 来 。
};

// --------------------------------------------------------------------
instance DIA_Addon_Greg_NW_RakeCaveThere(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_RakeCaveThere_Condition;
	information		= DIA_Addon_Greg_NW_RakeCaveThere_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_RakeCaveThere_Condition()
{
	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& ((Npc_GetDistToWP(self, "NW_BIGFARM_LAKE_CAVE_01") < 1000)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCaveThere_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_00"); //好 吧 。 就 是 那 个 洞 穴 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_01"); //给 你 一 把 锄 头 。
	B_GiveInvItems(self, other, itmw_2h_Axe_L_01, 1); // Spitzhacke
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_02"); //我 把 东 西 埋 在 那 里 的 某 个 地 方 了 。X 标 记 了 那 个 地 方 。
	B_Greg_GoNow();
	AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCaveThere_15_04"); //然 后 呢 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCaveThere_01_05"); //要 有 人 在 我 们 后 面 担 任 守 卫 ， 现 在 ， 出 发 吧 。

	Log_CreateTopic(TOPIC_Addon_Greg_NW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Greg_NW, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_5);

	MIS_Addon_Greg_RakeCave_Day = Wld_GetDay();
};

///////////////////////////////////////////////////////////////////////
//	Info RakeCavePlundered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RakeCavePlundered(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_RakeCavePlundered_Condition;
	information		= DIA_Addon_Greg_NW_RakeCavePlundered_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_RakeCavePlundered_Condition()
{
	if (((MIS_Addon_Greg_RakeCave_Day <= (Wld_GetDay() - 2)) || (RAKEPLACE[Greg_FirstSecret] == TRUE))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_01_00"); //这 么 长 时 间 ？ 找 到 什 么 了 吗 ？

	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered, "是 的 。 我 挖 出 了 一 小 袋 金 币 。", DIA_Addon_Greg_NW_RakeCavePlundered_gold);
	};

	Info_AddChoice(DIA_Addon_Greg_NW_RakeCavePlundered, "不 。", DIA_Addon_Greg_NW_RakeCavePlundered_No);
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_No()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00"); //不 。
	if (RAKEPLACE[Greg_FirstSecret] == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01"); //你 想 欺 骗 我，是 吗？
		AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02"); //(一 脸 无 辜 地)什 么 也 没 有。
	};

	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03"); //该 死 ， 我 早 该 知 道 这 一 切 。 那 些 贪 心 的 家 伙 又 比 我 抢 先 一 步 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04"); //好 的 ， 没 关 系 。 走 吧 ， 后 会 有 期 。
	AI_StopProcessInfos(self);
	GregLocation = Greg_Bigcross;
	Npc_ExchangeRoutine(self, "Bigcross");
	B_StartotherRoutine(BAU_974_Bauer, "Start");
};

var int B_Greg_RakePlaceBriefing_OneTime;
func void B_Greg_RakePlaceBriefing()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_00"); //嗯 ， 有 个 小 湖 ， 附 近 又 两 个 瀑 布 ， 湖 上 有 个 小 岛 。 我 埋 的 东 西 中 的 一 个 应 该 就 在 那 里 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_01"); //高 地 上 ， 我 在 两 个 地 方 埋 了 一 些 东 西 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_02"); //一 个 就 在 农 场 后 面 ， 另 外 一 个 就 在 瀑 布 旁 的 小 路 口 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_03"); //从 农 田 拾 级 而 上 ， 就 能 到 达 地 主 的 住 地 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakePlaceBriefing_01_04"); //台 阶 尽 头 的 洞 中 埋 着 另 外 一 件 东 西 。

	if (B_Greg_RakePlaceBriefing_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_Addon_Greg_NW, TOPIC_Addon_Greg_NW_6);
		B_Greg_RakePlaceBriefing_OneTime = TRUE;
	};
};

func void DIA_Addon_Greg_NW_RakeCavePlundered_gold()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00"); //是 的 。 我 挖 出 了 一 小 袋 金 币 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01"); //(贪 婪 地)给 我 。

	if ((Npc_HasItems(other, ItSe_GoldPocket25)) || (Npc_HasItems(other, ItMi_Gold) >= 25))
	{
		if (B_GiveInvItems(other, self, ItSe_GoldPocket25, 1))
		{
			AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02"); //吧 - 我 想 我 刚 失 去 了30个 金 币 。 给 你 吧 。
		}
		else if (B_GiveInvItems(other, self, ItMi_Gold, 25))
		{
			AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03"); //其 中 有 25 个 金 币 。 给 ， 拿 去 吧 。
		};

		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04"); //太 好 了 。 它 们 还 在 那 里 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05"); //你 还 有 些 用 处 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06"); //好 的 ， 听 着 。 我 还 埋 了 其 他 东 西 。 我 希 望 你 把 它 们 给 我 找 出 来 。
		B_Greg_RakePlaceBriefing();
		Greg_SuchWeiter = TRUE;
		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07"); //我 在 地 主 农 田 的 十 字 路 口 等 你 。 别 让 我 失 望 好 吗 ？
		AI_StopProcessInfos(self);
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self, "Bigcross");
		B_GivePlayerXP(XP_Addon_RakeCavePlundered);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08"); //我 现 在 没 钱 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09"); //瞎 扯 什 么 ，我 必 须 打 败 你 吗 ？
		AI_StopProcessInfos(self);
		MIS_Addon_Greg_RakeCave = LOG_FAILED; // Joly:SC hat Greg angeschissen.
		GregLocation = Greg_Bigcross;
		Npc_ExchangeRoutine(self, "Bigcross");
		B_Attack(self, other, AR_NONE, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	PERM vor LakeCave
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_LakeCave(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 100; // alle anderen importants wichtiger
	condition		= DIA_Addon_Greg_NW_LakeCave_Condition;
	information		= DIA_Addon_Greg_NW_LakeCave_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_LakeCave_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (GregLocation >= Greg_Taverne)
	&& (GregLocation < Greg_Dexter)
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_LAKE_CAVE_01") < 1000)
	&& (Greg_SuchWeiter == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_LakeCave_Info()
{
	B_Greg_GoNow();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WhereTreasures
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhereTreasures(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 10;
	condition		= DIA_Addon_Greg_NW_WhereTreasures_Condition;
	information		= DIA_Addon_Greg_NW_WhereTreasures_Info;
	permanent		= TRUE;
	description		= "再 问 一 下 你 究 竟 把 东 西 埋 在 哪 里 ？";
};

func int DIA_Addon_Greg_NW_WhereTreasures_Condition()
{
	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhereTreasures_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_WhereTreasures_15_00"); //再 问 一 下 你 究 竟 把 东 西 埋 在 哪 里 ？
	B_Greg_RakePlaceBriefing();
};

///////////////////////////////////////////////////////////////////////
//	Info PermTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_PermTaverne(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 99;
	condition		= DIA_Addon_Greg_NW_PermTaverne_Condition;
	information		= DIA_Addon_Greg_NW_PermTaverne_Info;
	permanent		= TRUE;
	description		= "还 有 一 件 事 … …";
};

func int DIA_Addon_Greg_NW_PermTaverne_Condition()
{
	if ((
	(GregLocation == Greg_Bigcross)
	&& (Npc_KnowsInfo(other, DIA_Addon_Greg_NW_Bigcross) == FALSE)
	&& (((Npc_GetDistToWP(self, "BIGCROSS") < 1000) == FALSE) || (MIS_Addon_Greg_RakeCave == LOG_SUCCESS))
	)
	|| (
	(GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo(other, DIA_Addon_Greg_NW_WasWillstDu))
	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_PermTaverne_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_PermTaverne_15_00"); //还 有 一 件 事 … …

	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_01"); //先 找 到 我 埋 的 东 西 ， 然 后 再 说 其 他 的 。
	}
	else if (MIS_Addon_Greg_RakeCave == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_02"); //感 谢 你 帮 助 我 。 找 到 我 的 东 西 ， 我 们 才 能 做 朋 友，对 吧 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_PermTaverne_01_03"); //我 们 说 得 太 多 了 。
	};
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

// 3. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info Bigcross
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_Bigcross(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_Bigcross_Condition;
	information		= DIA_Addon_Greg_NW_Bigcross_Info;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Addon_Greg_NW_Bigcross_Condition()
{
	if ((GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self, "BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_Bigcross_Info()
{
	if ((MIS_Addon_Greg_BringMeToTheCity == LOG_FAILED) || (MIS_Addon_Greg_RakeCave == LOG_FAILED))
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_00"); //你 这 个 自 私 的 家 伙 。
	};

	AI_Output(other, self, "DIA_Addon_Greg_NW_Bigcross_15_01"); //最 近 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_02"); //还 可 以 。 实 际 上 那 些 雇 佣 兵 帮 不 了 什 么 忙 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_03"); //我 还 曾 指 望 他 们 有 所 作 为 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_04"); //但 他 们 只 会 吹 牛 。

	if ((MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_05"); //我 埋 的 那 些 东 西 呢 ？ 找 到 了 吗 ？
		if ((RAKEPLACE[1] == FALSE)
		|| (RAKEPLACE[2] == FALSE)
		|| (RAKEPLACE[3] == FALSE)
		|| (RAKEPLACE[4] == FALSE)
		|| (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other, self, "DIA_Addon_Greg_NW_Bigcross_15_06"); //没 都 找 到 。
			AI_Output(self, other, "DIA_Addon_Greg_NW_Bigcross_01_07"); //快 点 吧 ！ 没 那 么 难 吧 。
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WhatWantFromSLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WhatWantFromSLD(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_WhatWantFromSLD_Condition;
	information		= DIA_Addon_Greg_NW_WhatWantFromSLD_Info;
	description		= "你 和 雇 佣 兵 之 间 有 什 么 交 易 ？";
};

func int DIA_Addon_Greg_NW_WhatWantFromSLD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& (Npc_GetDistToWP(self, "BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WhatWantFromSLD_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_WhatWantFromSLD_15_00"); //你 和 雇 佣 兵 之 间 有 什 么 交 易 ？

	if (SC_KnowsGregsSearchsDexter == FALSE)
	{
		B_Greg_Search_Dexter();
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_01"); //我 早 就 和 你 说 过 ， 我 在 找 那 个 穿 红 色 盔 甲 的 家 伙 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_WhatWantFromSLD_01_02"); //但 这 里 的 那 些 笨 蛋 不 懂 我 的 意 思 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DexterFound
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_DexterFound(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_DexterFound_Condition;
	information		= DIA_Addon_Greg_NW_DexterFound_Info;
	description		= "我 敢 说 你 是 在 寻 找 一 个 叫 德 克 斯 特 的 人 。";
};

func int DIA_Addon_Greg_NW_DexterFound_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Greg_NW_Bigcross))
	&& (GregLocation == Greg_Bigcross)
	&& ((Bdt13_Dexter_verraten == TRUE) || (Ranger_SCKnowsDexter == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_DexterFound_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_15_00"); //我 敢 说 你 是 在 寻 找 一 个 叫 德 克 斯 特 的 人 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_01_01"); //该 死 。 我 怎 么 知 道 那 家 伙 的 名 字。

	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, "只 是 一 个 想 法 。", DIA_Addon_Greg_NW_DexterFound_weg);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, "也 许 我 们 应 该 一 起 去 看 他 。", DIA_Addon_Greg_NW_DexterFound_together);
	Info_AddChoice(DIA_Addon_Greg_NW_DexterFound, "我 知 道 你 在 哪 里 能 找 到 他 。", DIA_Addon_Greg_NW_DexterFound_wo);
};

func void DIA_Addon_Greg_NW_DexterFound_weg()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_weg_15_00"); //只 是 一 个 想 法 。
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
};

func void DIA_Addon_Greg_NW_DexterFound_wo()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_00"); //我 知 道 你 在 哪 里 能 找 到 他 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_01"); //(不 解 地)真 的 ？ 告 诉 我 呀 ！
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_02"); //离 这 里 不 远 。
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_wo_15_03"); //他 好 像 是 一 群 强 盗 的 头 头 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_04"); //(轻 蔑 地)哈 哈 ， 就 是 他 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_05"); //我 听 说 那 个 老 旱 鸭 子 就 躲 在 这 里 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_06"); //我 要 翻 遍 这 里 ， 找 到 他 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_wo_01_07"); //没 你 的 帮 助 ， 我 也 要 找 到 他 。
	Info_ClearChoices(DIA_Addon_Greg_NW_DexterFound);
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Addon_Greg_NW_DexterFound_together()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_DexterFound_together_15_00"); //也 许 我 们 应 该 一 起 去 看 他 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_DexterFound_together_01_01"); //我 还 得 跟 他 算 账 ，我 自 己 可 以 搞 定 。
};

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

// 4. Treffen

///////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_CaughtDexter_Condition;
	information		= DIA_Addon_Greg_NW_CaughtDexter_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter_Condition()
{
	if ((GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_00"); //(大 声 地)那 个 贱 人 在 哪 里 ？
	AI_Output(other, self, "DIA_Addon_Greg_NW_CaughtDexter_15_01"); //谁 ？ 船 长 ？ 他 就 在 这 里 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_CaughtDexter_01_02"); //(大 声 地)滚 吧 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "DexterHouseRun");
};

///////////////////////////////////////////////////////////////////////
//	Info WodennNu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WodennNu(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_WodennNu_Condition;
	information		= DIA_Addon_Greg_NW_WodennNu_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_WodennNu_Condition()
{
	if ((GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter) == FALSE)
	&& (Npc_GetDistToWP(self, "NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WodennNu_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_WodennNu_01_00"); //(生 气 地)他 到 哪 儿 去 了 ？
	AI_Output(other, self, "DIA_Addon_Greg_NW_WodennNu_15_01"); //他 以 前 就 在 这 里 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_WodennNu_01_02"); //(发 号 施 令 地)好 吧 ， 去 找 他 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info CaughtDexter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_CaughtDexter2(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_CaughtDexter2_Condition;
	information		= DIA_Addon_Greg_NW_CaughtDexter2_Info;
	important		= TRUE;
};

func int DIA_Addon_Greg_NW_CaughtDexter2_Condition()
{
	if ((GregLocation == Greg_Dexter)
	&& (Npc_IsDead(Dexter)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_CaughtDexter2_Info()
{
	AI_Output(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_00"); //德 克 斯 特 把 它 买 走 了 ？
	AI_Output(other, self, "DIA_Addon_Greg_NW_CaughtDexter2_15_01"); //他 好 像 死 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_CaughtDexter2_01_02"); //可 能 还 没 有 死 。 去 看 看 他 拿 走 了 什 么 东 西 。
	Npc_ExchangeRoutine(self, "DexterHouseWalk");
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info RavensLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_RavensLetter(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_RavensLetter_Condition;
	information		= DIA_Addon_Greg_NW_RavensLetter_Info;
	description		= "德 克 斯 特 身 上 除 了 这 封 信 ， 什 么 都 没 有 。";
};

func int DIA_Addon_Greg_NW_RavensLetter_Condition()
{
	if ((GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo(other, DIA_Addon_Greg_NW_CaughtDexter2))
	&& (Npc_HasItems(other, ItWr_RavensKidnapperMission_Addon))
	&& (Npc_IsDead(Dexter)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_RavensLetter_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_00"); //德 克 斯 特 身 上 除 了 这 封 信 ， 什 么 都 没 有 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_01"); //给 我 看 看 。
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_02"); //该 死 的 ， 根 本 没 用 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_03"); //我 们 真 不 应 该 让 他 这 么 唠 唠 叨 叨 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_04"); //你 们 不 知 道 如 何 翻 越 克 霍 里 尼 斯 东 北 群 山 么 ？

	if ((Nefarius_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	&& (Saturas_NW.aivar[AIV_TalkedToPlayer] == TRUE))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_05"); //可 能 要 通 过 一 条 地 下 隧 道 。 水 法 师 们 正 在 研 究 一 种 传 送 门 ， 可 以 到 达 东 北 群 山 。
		AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_06"); //( 生 气 地 ) 这 是 什 么 废 话 ?
		AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_07"); //(嘲 笑 地)哈 哈 ， 水 法 师 ， 还 有 其 他 能 干 的 么 ？
	};

	AI_Output(other, self, "DIA_Addon_Greg_NW_RavensLetter_15_08"); //不 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_09"); //(长 叹 一 声) 那 么 说 ， 我 就 完 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_RavensLetter_01_10"); //德 克 斯 特 曾 是 我 的 最 后 一 线 希 望 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasWillstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_WasWillstDu(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_WasWillstDu_Condition;
	information		= DIA_Addon_Greg_NW_WasWillstDu_Info;
	description		= "你 想 从 德 克 斯 特 身 上 找 什 么 ？";
};

func int DIA_Addon_Greg_NW_WasWillstDu_Condition()
{
	if ((GregLocation == Greg_Dexter)
	&& (Npc_KnowsInfo(other, DIA_Addon_Greg_NW_RavensLetter)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_WasWillstDu_15_00"); //你 想 从 德 克 斯 特 身 上 找 什 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_01"); //我 从 这 座 岛 屿 东 北 群 山 中 来 。 我 要 回 去 了 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_01_02"); //我 本 指 望 那 个 笨 蛋 知 道 如 何 不 坐 船 从 这 里 到 那 边 去 。

	Npc_ExchangeRoutine(self, "DexterThrone");

	Info_ClearChoices(DIA_Addon_Greg_NW_WasWillstDu);
	Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu, "那 些 山 脉 的 后 面 是 什 么 ？", DIA_Addon_Greg_NW_WasWillstDu_da);

	if (Skip_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		Info_AddChoice(DIA_Addon_Greg_NW_WasWillstDu, "我 在 港 口 附 近 看 到 一 个 叫 斯 奇 普 的 海 盗 。", DIA_Addon_Greg_NW_WasWillstDu_Skip);
	};
};

func void DIA_Addon_Greg_NW_WasWillstDu_da()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_WasWillstDu_da_15_00"); //那 些 山 脉 的 后 面 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_01"); //最 好 不 要 去 那 里 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_da_01_02"); //那 是 不 毛 之 地 。 像 你 这 样 的 笨 蛋 在 那 里 活 不 了 多 久 。
};

func void DIA_Addon_Greg_NW_WasWillstDu_Skip()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00"); //我 在 港 口 附 近 看 到 一 个 叫 斯 奇 普 的 海 盗 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01"); //那 个 笨 蛋 ， 我 在 那 里 等 了 三 天 ， 他 为 什 么 来 得 这 么 晚 ？
	AI_Output(self, other, "DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02"); //等 我 恢 复 了 体 力 ， 我 要 好 好 教 训 他 一 下 。
	SC_KnowsConnectionSkipGreg = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundTreasure
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Greg_NW_FoundTreasure(C_INFO)
{
	npc				= PIR_1300_Addon_Greg_NW;
	nr				= 5;
	condition		= DIA_Addon_Greg_NW_FoundTreasure_Condition;
	information		= DIA_Addon_Greg_NW_FoundTreasure_Info;
	permanent		= TRUE;
	description		= "我 找 到 了 你 埋 起 来 的 东 西 。";
};

func int DIA_Addon_Greg_NW_FoundTreasure_Condition()
{
	if ((RAKEPLACE[1] == TRUE)
	&& (RAKEPLACE[2] == TRUE)
	&& (RAKEPLACE[3] == TRUE)
	&& (RAKEPLACE[4] == TRUE)
	&& (RAKEPLACE[5] == TRUE)
	&& (MIS_Addon_Greg_RakeCave == LOG_RUNNING)
	&& (Greg_SuchWeiter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_Info()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_15_00"); //我 找 到 了 你 埋 起 来 的 东 西 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_FoundTreasure_01_01"); //然 后 你 就 能 拿 到 大 约 100 个 金 币 ， 一 个 金 杯 ， 一 个 银 碟 和 一 个 护 身 符 ， 全 是 我 的 。 来 这 里 拿 吧 。

	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);
	Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure, "我 碰 巧 没 有 把 它 带 在 身 上 。", DIA_Addon_Greg_NW_FoundTreasure_not);

	if (((Npc_HasItems(other, ItSe_GoldPocket100)) || (Npc_HasItems(other, itmi_gold) >= 100))
	&& (Npc_HasItems(other, ItMi_GoldCup))
	&& (Npc_HasItems(other, ItMi_SilverChalice))
	&& (Npc_HasItems(other, ItAm_Prot_Point_01)))
	{
		Info_AddChoice(DIA_Addon_Greg_NW_FoundTreasure, "这 是 你 的 东 西 。", DIA_Addon_Greg_NW_FoundTreasure_ja);
	};
};

func void DIA_Addon_Greg_NW_FoundTreasure_ja()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_00"); //这 是 你 的 东 西 。

	if (B_GiveInvItems(other, self, ItSe_GoldPocket100, 1))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_01"); //一 个 装 着 1 0 0 金 币 的 袋 子 。
	}
	else if (B_GiveInvItems(other, self, ItMi_gold, 100))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_02"); //1 0 0 金 币 。
	};

	if (B_GiveInvItems(other, self, ItMi_GoldCup, 1))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_03"); //一 个 金 杯 。
	};

	if (B_GiveInvItems(other, self, ItMi_SilverChalice, 1))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_04"); //一 个 银 碟 。
	};

	if (B_GiveInvItems(other, self, ItAm_Prot_Point_01, 1))
	{
		AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_ja_15_05"); //还 有 一 个 护 身 符 。
	};

	AI_Output(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_06"); //很 好 。 你 没 有 拿 上 东 西 就 跑 ， 这 很 对 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_FoundTreasure_ja_01_07"); //这 是 你 的 那 一 份 分 成 。

	B_GiveInvItems(self, other, ItMi_gold, 30);

	Info_ClearChoices(DIA_Addon_Greg_NW_FoundTreasure);

	MIS_Addon_Greg_RakeCave = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Greg_RakeCave);
};

func void DIA_Addon_Greg_NW_FoundTreasure_not()
{
	AI_Output(other, self, "DIA_Addon_Greg_NW_FoundTreasure_not_15_00"); //我 碰 巧 没 有 把 它 带 在 身 上 。
	AI_Output(self, other, "DIA_Addon_Greg_NW_FoundTreasure_not_01_01"); //在 我 发 怒 之 前 给 我 这 些 东 西 。
	AI_StopProcessInfos(self);
};
