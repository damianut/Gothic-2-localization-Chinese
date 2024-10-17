///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_EXIT(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 999;
	condition		= DIA_Talbin_EXIT_Condition;
	information		= DIA_Talbin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Talbin_Runs;
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_HALLO(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 5;
	condition		= DIA_Talbin_HALLO_Condition;
	information		= DIA_Talbin_HALLO_Info;
	important		= TRUE;
};

func int DIA_Talbin_HALLO_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_HALLO_Info()
{
	AI_Output(self, other, "DIA_Talbin_HALLO_07_00"); //停 下 ！ 站 在 那 里 别 动 ！
	AI_Output(other, self, "DIA_Talbin_HALLO_15_01"); //阿 咳 ！ 没 问 题 ！
	AI_Output(self, other, "DIA_Talbin_HALLO_07_02"); //真 的 吗 ！ 又 一 只 迷 途 的 小 羊 羔 ， 嗯 ？ 最 初 我 以 为 你 是 那 些 时 常 出 现 在 这 里 的 可 恶 的 混 账 。
	AI_Output(self, other, "DIA_Talbin_HALLO_07_03"); //我 看 的 出 你 不 像 是 他 们 的 人 。 你 看 起 来 没 有 恶 意 ！
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachtIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASMACHTIHR(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 6;
	condition		= DIA_Talbin_WASMACHTIHR_Condition;
	information		= DIA_Talbin_WASMACHTIHR_Info;
	description		= "你 看 起 来 像 是 一 个 不 知 道 如 何 过 日 子 的 猎 人 。 ";
};

func int DIA_Talbin_WASMACHTIHR_Condition()
{
	if (Talbin_Runs == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASMACHTIHR_Info()
{
	AI_Output(other, self, "DIA_Talbin_WASMACHTIHR_15_00"); //你 看 起 来 像 是 一 个 不 知 道 如 何 过 日 子 的 猎 人 ！
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_07_01"); //哈 哈 ！ 是 - 你 说 到 点 子 上 了 。 但 是 我 能 做 什 么 - 我 不 能 通 过 关 卡 回 去 ！
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_07_02"); //所 以 ， 我 只 能 呆 在 这 里 ， 做 我 最 拿 手 的 事 情 。

	if ((Npc_IsDead(Engrom)) == FALSE)
	{
		AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_07_03"); //不 过，我 为 我 的 朋 友恩 格 罗 姆 感 到 遗 憾 。
	};

	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_07_04"); //靠 近 我 的 火 堆 ， 暖 暖 身 子 吧 。

	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR, DIALOG_BACK, DIA_Talbin_WASMACHTIHR_back);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR, "可 是 你 似 乎 做 的 还 不 错 。", DIA_Talbin_WASMACHTIHR_gut);
	Info_AddChoice(DIA_Talbin_WASMACHTIHR, "你 是 屏 障 以 前 的 囚 犯 吗 ？", DIA_Talbin_WASMACHTIHR_strf);
};

func void DIA_Talbin_WASMACHTIHR_back()
{
	Info_ClearChoices(DIA_Talbin_WASMACHTIHR);
};

func void DIA_Talbin_WASMACHTIHR_strf()
{
	AI_Output(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_00"); //你 是 屏 障 以 前 的 囚 犯 吗 ？
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_01"); //不 ， 不 ！ 你 在 想 什 么 ？ 我 真 正 的 意 思 是 在 这 里 发 点 横 财 。
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_02"); //周 围 的 人 告 诉 过 我 这 里 是 最 适 宜 捕 猎 的 地 方 。
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_03"); //获 取 财 富 ， 如 果 你 知 道 我 的 意 思 的 话 。
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_04"); //在 那 些 兽 人 出 现 以 后 ， 如 果 你 冒 险 跑 得 太 远 的 话 ， 这 里 唯 一 能 得 到 的 东 西 就 是 打 到 脸 上 的 拳 头 ！
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_strf_07_05"); //我 会 让 那 些 白 痴 来 碰 钉 子 。
	AI_Output(other, self, "DIA_Talbin_WASMACHTIHR_strf_15_06"); //我 了 解 那 些 讨 厌 的 家 伙 ！
};

func void DIA_Talbin_WASMACHTIHR_gut()
{
	AI_Output(other, self, "DIA_Talbin_WASMACHTIHR_gut_15_00"); //可 是 你 似 乎 做 的 还 不 错 。
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_01"); //哦 ， 好 吧 ！ 我 想 我 不 能 抱 怨 。 不 管 那 些 兽 人 的 话 ， 靠 近 河 流 的 这 个 区 域 还 是 危 险 最 小 的 地 方 。
	AI_Output(self, other, "DIA_Talbin_WASMACHTIHR_gut_07_02"); //看 来 它 们 不 敢 靠 近 水 。 嗯 。 也 许 只 是 凑 巧 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info SorryForEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_SORRYFORENGROM(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 7;
	condition		= DIA_Talbin_SORRYFORENGROM_Condition;
	information		= DIA_Talbin_SORRYFORENGROM_Info;
	description		= "你 为 什 么 为 恩 格 罗 姆 感 到 难 过 ？ ";
};

func int DIA_Talbin_SORRYFORENGROM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_SORRYFORENGROM_Info()
{
	AI_Output(other, self, "DIA_Talbin_SORRYFORENGROM_15_00"); //你 为 什 么 为 恩 格 罗 姆 感 到 难 过 ？
	AI_Output(self, other, "DIA_Talbin_SORRYFORENGROM_07_01"); //因 为 他 只 是 跟 着 我 ， 什 么 问 题 都 不 问 。
	AI_Output(self, other, "DIA_Talbin_SORRYFORENGROM_07_02"); //现 在 ， 我 们 已 经 陷 入 了 困 境 。 总 之 ， 贪 婪 不 会 有 回 报 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasJagdIhr
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WASJAGDIHR(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 8;
	condition		= DIA_Talbin_WASJAGDIHR_Condition;
	information		= DIA_Talbin_WASJAGDIHR_Info;
	description		= "你 在 河 边 这 里 狩 猎 什 么 ？";
};

func int DIA_Talbin_WASJAGDIHR_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WASJAGDIHR_Info()
{
	AI_Output(other, self, "DIA_Talbin_WASJAGDIHR_15_00"); //你 在 河 边 这 里 狩 猎 什 么 ？
	AI_Output(self, other, "DIA_Talbin_WASJAGDIHR_07_01"); //问 得 好 ！ 只 管 沿 着 河 流 走 ， 你 就 会 知 道 我 在 这 里 捕 猎 什 么 东 西 了 。 当 然 是 潜 伏 者 ！
	AI_Output(self, other, "DIA_Talbin_WASJAGDIHR_07_02"); //那 些 东 西 不 好 猎 捕 ， 但 是 它 们 的 味 道 好 极 了 。
	AI_Output(self, other, "DIA_Talbin_WASJAGDIHR_07_03"); //偶 尔 我 还 能 碰 到 尖 嘴 鸟 。 我 也 不 会 小 看 它 们 ！
};

///////////////////////////////////////////////////////////////////////
//	Info EngromAngry
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_ENGROMANGRY(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 9;
	condition		= DIA_Talbin_ENGROMANGRY_Condition;
	information		= DIA_Talbin_ENGROMANGRY_Info;
	description		= "我 觉 得 你 的 同 伴 压 力 有 点 太 大 了 ！";
};

func int DIA_Talbin_ENGROMANGRY_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
	&& (Npc_KnowsInfo(other, DIA_Talbin_SORRYFORENGROM))
	&& ((Npc_IsDead(Engrom)) == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Kapitel <= 3)
	&& (Talbin_Runs == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Talbin_ENGROMANGRY_Info()
{
	AI_Output(other, self, "DIA_Talbin_ENGROMANGRY_15_00"); //我 觉 得 你 的 同 伴 压 力 有 点 太 大 了 ！
	AI_Output(self, other, "DIA_Talbin_ENGROMANGRY_07_01"); //马 上 闭 嘴 。 别 进 一 步 激 怒 他 ， 不 然 他 会 要 了 我 的 脑 袋 。 在 这 种 时 候 ， 我 们 呆 在 这 里 没 有 任 何 办 法 。
	AI_Output(self, other, "DIA_Talbin_ENGROMANGRY_07_02"); //有 一 天 我 会 补 偿 他 的 ！
};

// ************************************************************
// 			  			  ASK TEACHER
// ************************************************************
instance DIA_Talbin_AskTeacher(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 10;
	condition		= DIA_Talbin_AskTeacher_Condition;
	information		= DIA_Talbin_AskTeacher_Info;
	description		= "你 能 教 我 狩 猎 吗 ？";
};

func int DIA_Talbin_AskTeacher_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_WASJAGDIHR))
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_AskTeacher_Info()
{
	AI_Output(other, self, "DIA_Talbin_AskTeacher_15_00"); //你 能 教 我 有 关 狩 猎 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Talbin_AskTeacher_07_01"); //我 明 白 了 ！ 那 么 ， 你 现 在 已 经 喜 欢 它 了 。 好 吧 。 不 过 这 会 要 付 出 点 代 价 ！
	AI_Output(other, self, "DIA_Talbin_AskTeacher_15_02"); //你 想 要 什 么 作 为 交 换 ？
	AI_Output(self, other, "DIA_Talbin_AskTeacher_07_03"); //除 了 潜 伏 者 的 肉 ， 你 偶 尔 也 能 弄 点 别 的 东 西 吃 吗 ？ 也 许 一 大 块 奶 酪 。 是 的 ， 一 大 块 奶 酪 。 为 了 一 大 块 我 可 以 去 死 … …
	AI_Output(other, self, "DIA_Talbin_AskTeacher_15_04"); //我 看 看 我 能 做 些 什 么 。

	Log_CreateTopic(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, TOPIC_Teacher_3);
};

// ************************************************************
// 			  			  PAY TEACHER
// ************************************************************
instance DIA_Talbin_PayTeacher(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 11;
	condition		= DIA_Talbin_PayTeacher_Condition;
	information		= DIA_Talbin_PayTeacher_Info;
	permanent		= TRUE;
	description		= "给 你 奶 酪 。 你 现 在 能 教 我 吗 ？";
};

var int DIA_Talbin_PayTeacher_noPerm;

func int DIA_Talbin_PayTeacher_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Talbin_AskTeacher))
	&& (DIA_Talbin_PayTeacher_noPerm == FALSE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Talbin_PayTeacher_Info()
{
	if (B_GiveInvItems(other, self, itfo_Cheese, 1))
	{
		AI_Output(other, self, "DIA_Talbin_PayTeacher_15_00"); //给 你 奶 酪 。 你 现 在 能 教 我 吗 ？
		AI_Output(self, other, "DIA_Talbin_PayTeacher_07_01"); //真 的 吗 ， 你 有 一 些 ？ 哦 ， 伙 计 ， 好 久 了 我 都 再 没 吃 到 过 那 样 的 东 西 。 谢 谢 你 。 嗯 ， 那 个 … … 哦 ， 是 啊 。 当 然 ！
		Talbin_TeachAnimalTrophy = TRUE;
		DIA_Talbin_PayTeacher_noPerm = TRUE;
	}
	else // SC hat keinen Käse
	{
		AI_Output(other, self, "DIA_Talbin_PayTeacher_15_02"); //我 现 在 没 有 奶 酪 ！
		AI_Output(self, other, "DIA_Talbin_PayTeacher_07_03"); //要 是 真 的 就 太 好 了 。 等 你 有 的 时 候 告 诉 我。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_TEACHHUNTING(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 12;
	condition		= DIA_Talbin_TEACHHUNTING_Condition;
	information		= DIA_Talbin_TEACHHUNTING_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 ？";
};

func int DIA_Talbin_TEACHHUNTING_Condition()
{
	if ((Talbin_TeachAnimalTrophy == TRUE)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_TEACHHUNTING_Info()
{
	AI_Output(other, self, "DIA_Talbin_TEACHHUNTING_15_00"); //你 能 教 我 什 么 ？
	if (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
	)
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_07_01"); //你 想 要 知 道 什 么 ？

		Info_AddChoice(DIA_Talbin_TEACHHUNTING, DIALOG_BACK, DIA_Talbin_TEACHHUNTING_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_CLAWS, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)), DIA_Talbin_TEACHHUNTING_Claws);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_FUR, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), DIA_Talbin_TEACHHUNTING_Fur);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_SHADOWBEAST_HORN, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)), DIA_Talbin_TEACHHUNTING_ShadowHorn);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Talbin_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_HEART, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)), DIA_Talbin_TEACHHUNTING_Heart);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_07_02"); //我 要 让 你 失 望 了 。 我 能 教 你 的 你 已 经 都 会 了 。 不 过 ， 再 次 谢 谢 你 的 奶 酪 ！
	};
};

func void DIA_Talbin_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

// ------ Klauen hacken ------
func void DIA_Talbin_TEACHHUNTING_Claws()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Claws))
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_00"); //砍 断 爪 子 非 常 简 单 。 只 要 抓 住 爪 子 的 关 节 把 它 按 在 地 上 。
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_Claws_07_01"); //然 后 用 刀 子 小 心 地 把 爪 子 砍 下 来 。
	};

	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Talbin_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur))
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_00"); //最 简 单 的 方 法 来 剥 掉 潜 伏 者 的 皮 是 顺 着 它 的 腹 部 切 出 一 条 口 子 … …
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_Fur_07_01"); //… … 然 后 使 劲 拉 它 住 它 的 后 腿 ， 就 这 样 把 皮 从 后 往 前 整 个 剥 掉 。
	};

	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Shadowhorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_ShadowHorn))
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00"); //影 兽 角 非 常 坚 硬 ， 可 以 用 来 做 成 雕 像 或 者 工 具 。
	};

	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
};

func void DIA_Talbin_TEACHHUNTING_Heart()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Heart))
	{
		AI_Output(self, other, "DIA_Talbin_TEACHHUNTING_Heart_07_00"); //魔 法 生 物 的 心 脏 非 常 稀 有 因 此 很 难 弄 到 。 你 做 这 件 事 的 时 候 要 特 别 小 心 ， 尤 其 是 碰 上 各 种 类 型 的 巨 人 时 。
	};

	Info_ClearChoices(DIA_Talbin_TEACHHUNTING);
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
instance DIA_Talbin_KAP3_EXIT(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 999;
	condition		= DIA_Talbin_KAP3_EXIT_Condition;
	information		= DIA_Talbin_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP3_EXIT_Info()
{
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
instance DIA_Talbin_KAP4_EXIT(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 999;
	condition		= DIA_Talbin_KAP4_EXIT_Condition;
	information		= DIA_Talbin_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap4_Wasneues
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASNEUES(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 13;
	condition		= DIA_Talbin_KAP4_WASNEUES_Condition;
	information		= DIA_Talbin_KAP4_WASNEUES_Info;
	description		= "你 看 到 有 人 路 过 这 里 吗 ？";
};

func int DIA_Talbin_KAP4_WASNEUES_Condition()
{
	if ((Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASNEUES_Info()
{
	AI_Output(other, self, "DIA_Talbin_KAP4_WASNEUES_15_00"); //你 看 到 有 人 路 过 这 里 吗 ？
	AI_Output(self, other, "DIA_Talbin_KAP4_WASNEUES_07_01"); //是 的 。 最 近 ， 这 周 围 来 了 一 些 特 别 可 笑 的 家 伙 ！ 他 们 穿 着 漂 亮 的 盔 甲 ， 好 像自 己 是 什 么 大 人 物 一 样 在 这 里 炫 耀 ！
};

///////////////////////////////////////////////////////////////////////
//	Info WaswolltenDJG
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 14;
	condition		= DIA_Talbin_KAP4_WASWOLLTENDJG_Condition;
	information		= DIA_Talbin_KAP4_WASWOLLTENDJG_Info;
	description		= "那 些 ‘ 有 趣 的 家 伙 ’ 想 从 这 里 得 到 什 么 ？ ";
};

func int DIA_Talbin_KAP4_WASWOLLTENDJG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_KAP4_WASNEUES))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP4_WASWOLLTENDJG_Info()
{
	AI_Output(other, self, "DIA_Talbin_KAP4_WASWOLLTENDJG_15_00"); //那 些 ‘ 有 趣 的 家 伙 ’ 想 从 这 里 得 到 什 么 ？
	AI_Output(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_01"); //他 们 问 了 我 关 于 供 应 品 和 装 备 的 事 情 。 伙 计 ， 我 的 东 西 刚 刚 够 自 己 用 ！
	AI_Output(self, other, "DIA_Talbin_KAP4_WASWOLLTENDJG_07_02"); //他 们 准 备 去 杀 龙 还 是 什 么 的 。 天 知 道 那 些 小 子 从 哪 里 来 的 ， 不 过 他 们 看 起 来 不 是 特 别 可 靠 ！

	if (Kapitel == 4)
	{
		B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_5);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info woEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOENGROM(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 15;
	condition		= DIA_Talbin_WOENGROM_Condition;
	information		= DIA_Talbin_WOENGROM_Info;
	description		= "你 现 在 独 自 在 这 里 吗 ？";
};

func int DIA_Talbin_WOENGROM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_WASMACHTIHR))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (EngromIsGone == TRUE)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOENGROM_Info()
{
	AI_Output(other, self, "DIA_Talbin_WOENGROM_15_00"); //你 现 在 独 自 在 这 里 吗 ？
	AI_Output(self, other, "DIA_Talbin_WOENGROM_07_01"); //是 的 。 我 的 伙 伴 恩 格 罗 姆 发 了 狂 然 后 离 开 了 。 昨 天 他 说 他 有 一 个 幻 觉 - 有 人 非 常 温 柔 地 对 他 说 着 话 。
	AI_Output(self, other, "DIA_Talbin_WOENGROM_07_02"); //我 什 么 都 没 有 听 到 。 我 只 是 想 着 自 己 的 事 ， 他 行 动 太 仓 促 … …
	AI_Output(self, other, "DIA_Talbin_WOENGROM_07_03"); //… … 然 后 他 突 然 就 离 开 了 。 我 不 知 道 他 去 了 哪 里 。
	AI_Output(self, other, "DIA_Talbin_WOENGROM_07_04"); //如 果 你 在 什 么 地 方 碰 到 恩 格 罗 姆 ， 告 诉 他 ， 他 还 欠 我 一 张 潜 伏 者 的 皮 ， 那 个 混 蛋 。

	if (Npc_KnowsInfo(other, DIA_Engrom_WhatAboutLeaving))
	{
		AI_Output(other, self, "DIA_Talbin_WOENGROM_15_05"); //但 在 我 的 印 象 中 ，他 甚 至 不 想 离 开 这 里 ，直 到 兽 人 消 失 。
		AI_Output(self, other, "DIA_Talbin_WOENGROM_07_06"); //就 像我 说 的 - 他 出 了 什 么 毛 病 。
	};

	MIS_Tabin_LookForEngrom = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info FoundEngrom
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_FOUNDENGROM(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 16;
	condition		= DIA_Talbin_FOUNDENGROM_Condition;
	information		= DIA_Talbin_FOUNDENGROM_Info;
	description		= "我 找 到 了 你 的 同 伴 恩 格 罗 姆 。";
};

func int DIA_Talbin_FOUNDENGROM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_WOENGROM))
	&& ((NpcObsessedByDMT_Engrom == TRUE) || (Npc_HasItems(other, ItAt_TalbinsLurkerSkin)))
	&& (Kapitel >= 4)
	&& (Talbin_FollowsThroughPass == 0)
	&& (Talbin_Runs == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Talbin_FOUNDENGROM_Info()
{
	AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_00"); //我 找 到 了 你 的 同 伴 恩 格 罗 姆 。
	AI_Output(self, other, "DIA_Talbin_FOUNDENGROM_07_01"); //是 吗 ？ 他 在 哪 里 ？

	if (Npc_IsDead(Engrom))
	{
		AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_02"); //他 已 经 死 了 。
	}
	else
	{
		AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_03"); //我 不 觉 得 你 还 能 看 见 他 。
	};

	if (B_GiveInvItems(other, self, ItAt_TalbinsLurkerSkin, 1))
	{
		AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_04"); //给 。 我 在 他 身 上 找 到 了 这 张 潜 伏 者 的 皮 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_05"); //搜 索 者 附 在 了 他 身 上 。
		AI_Output(self, other, "DIA_Talbin_FOUNDENGROM_07_06"); //搜 索 者 ？ 那 是 什 么 东 西 ？
		AI_Output(other, self, "DIA_Talbin_FOUNDENGROM_15_07"); //地 下 世 界 的 仆 从 。 他 们 是 兽 人 真 正 的 首 领 。
	};

	AI_Output(self, other, "DIA_Talbin_FOUNDENGROM_07_08"); //以 英 诺 斯 的 名 义 。 就 算 它 杀 了 我 ， 我 也 必 须 离 开 这 里 。 机 不 可 失 ！
	AI_StopProcessInfos(self);

	Log_CreateTopic(TOPIC_Talbin_Runs, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Talbin_Runs, LOG_RUNNING);
	B_LogEntry(TOPIC_Talbin_Runs, TOPIC_Talbin_Runs_1);

	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self, "FleePass");
	Wld_InsertNpc(Snapper, "START");
	Talbin_Runs = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_WOHIN(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 17;
	condition		= DIA_Talbin_WOHIN_Condition;
	information		= DIA_Talbin_WOHIN_Info;
	permanent		= TRUE;
	description		= "你 要 去 哪 里 ?";
};

func int DIA_Talbin_WOHIN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Talbin_FOUNDENGROM))
	&& (Talbin_FollowsThroughPass == 0))
	{
		return TRUE;
	};
};

func void DIA_Talbin_WOHIN_Info()
{
	AI_Output(other, self, "DIA_Talbin_WOHIN_15_00"); //你 要 去 哪 里 ?

	if (Npc_GetDistToWP(self, "START") < 1000)
	{
		AI_Output(self, other, "DIA_Talbin_WOHIN_07_01"); //带 我 穿 过 关 卡 。 求 你 了 ！

		Info_ClearChoices(DIA_Talbin_WOHIN);
		Info_AddChoice(DIA_Talbin_WOHIN, "我 没 有 时 间 帮 你 。", DIA_Talbin_WOHIN_);
		Info_AddChoice(DIA_Talbin_WOHIN, "尽 管 前 进 ， 然 后 穿 过 去 。", DIA_Talbin_WOHIN_durch);
		Info_AddChoice(DIA_Talbin_WOHIN, "好 的 。", DIA_Talbin_WOHIN_ok);
	}
	else
	{
		AI_Output(self, other, "DIA_Talbin_WOHIN_07_02"); //我 必 须 离 开 这 里 ， 穿 过 关 卡 。 别 挡 我 的 路 。
		AI_StopProcessInfos(self);
	};
};

func void DIA_Talbin_WOHIN_ok()
{
	AI_Output(other, self, "DIA_Talbin_WOHIN_ok_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Talbin_WOHIN_ok_07_01"); //谢 谢 你 。 等 你 穿 过 去 之 后 ， 我 就 跟 着 你 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "IntoPass");
	Talbin_FollowsThroughPass = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL; // Joly: eh nur so lange, bis der SC durch den Levelchange geht!
};

func void DIA_Talbin_WOHIN_durch()
{
	AI_Output(other, self, "DIA_Talbin_WOHIN_durch_15_00"); //就 向 前 走 ， 然 后 穿 过 去 。
	AI_Output(self, other, "DIA_Talbin_WOHIN_durch_07_01"); //那 里 面 太 黑 了 。 我 自 己 是 不 会 进 去 的 。
};

func void DIA_Talbin_WOHIN_()
{
	AI_Output(other, self, "DIA_Talbin_WOHIN_schwein_15_00"); //我 没 有 时 间 帮 你 。
	AI_Output(self, other, "DIA_Talbin_WOHIN_schwein_07_01"); //就 让 我 在 这 里 等 死 吧 。 你 会 因 此 进 地 狱 下 油 锅 。
	Talbin_FollowsThroughPass = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_VERSCHWINDE(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 15;
	condition		= DIA_Talbin_VERSCHWINDE_Condition;
	information		= DIA_Talbin_VERSCHWINDE_Info;
	permanent		= TRUE;
	description		= "嘿 。";
};

func int DIA_Talbin_VERSCHWINDE_Condition()
{
	if (Talbin_FollowsThroughPass == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Talbin_VERSCHWINDE_Info()
{
	AI_Output(other, self, "DIA_Talbin_VERSCHWINDE_15_00"); //嘿 。
	AI_Output(self, other, "DIA_Talbin_VERSCHWINDE_07_01"); //滚 吧 。 没 有 你 ， 我 照 样 行 ， 无 耻 的 家 伙 。
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
instance DIA_Talbin_KAP5_EXIT(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 999;
	condition		= DIA_Talbin_KAP5_EXIT_Condition;
	information		= DIA_Talbin_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP5_EXIT_Info()
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
instance DIA_Talbin_KAP6_EXIT(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 999;
	condition		= DIA_Talbin_KAP6_EXIT_Condition;
	information		= DIA_Talbin_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Talbin_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Talbin_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Talbin_PICKPOCKET(C_INFO)
{
	npc				= VLK_4130_Talbin;
	nr				= 900;
	condition		= DIA_Talbin_PICKPOCKET_Condition;
	information		= DIA_Talbin_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Talbin_PICKPOCKET_Condition()
{
	C_Beklauen(40, 25);
};

func void DIA_Talbin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
	Info_AddChoice(DIA_Talbin_PICKPOCKET, DIALOG_BACK, DIA_Talbin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Talbin_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Talbin_PICKPOCKET_DoIt);
};

func void DIA_Talbin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};

func void DIA_Talbin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Talbin_PICKPOCKET);
};
