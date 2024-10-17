// *************************************************
// 						EXIT
// *************************************************
instance DIA_Wulfgar_EXIT(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 999;
	condition		= DIA_Wulfgar_EXIT_Condition;
	information		= DIA_Wulfgar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wulfgar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************
// 						Hallo
// *************************************************
instance DIA_Wulfgar_Hallo(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 1;
	condition		= DIA_Wulfgar_Hallo_Condition;
	information		= DIA_Wulfgar_Hallo_Info;
	description		= "你 的 责 任 呢 ？";
};

func int DIA_Wulfgar_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Wulfgar_Hallo_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_Hallo_15_00"); //你 的 责 任 呢 ？
	AI_Output(self, other, "DIA_Wulfgar_Hallo_04_01"); //（ 轻 蔑 的 ） 这 些 小 子 挥 剑 的 姿 势 就 像 个 农 民 。
	AI_Output(self, other, "DIA_Wulfgar_Hallo_04_02"); //（ 确 信 的 ） 但 是 当 我 训 练 过 他 们 之 后 ， 他 们 每 个 人 都 会 变 成 强 壮 、 冷 酷 的 家 伙 。
};

// *************************************************
// 						WannaJoin
// *************************************************
instance DIA_Wulfgar_WannaJoin(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 2;
	condition		= DIA_Wulfgar_WannaJoin_Condition;
	information		= DIA_Wulfgar_WannaJoin_Info;
	description		= "我 要 加 入 民 兵 ！";
};

func int DIA_Wulfgar_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_WannaJoin_15_00"); //我 要 加 入 民 兵 ！
	AI_Output(self, other, "DIA_Wulfgar_WannaJoin_04_01"); //真 的 ？ 你 是 镇 上 的 市 民 ？
	if (Player_IsApprentice == APP_NONE)
	{
		AI_Output(other, self, "DIA_Wulfgar_WannaJoin_15_02"); //不 。
		AI_Output(self, other, "DIA_Wulfgar_WannaJoin_04_03"); //那 么 安 德 烈 勋 爵 不 会 接 见 你 。
		AI_Output(self, other, "DIA_Wulfgar_WannaJoin_04_04"); //真 的 ， 你 可 以 去 和 他 谈 谈 - 但 是 我 不 认 为 他 会 对 你 破 例 。
	}
	else
	{
		AI_Output(other, self, "DIA_Wulfgar_WannaJoin_15_05"); //是 的 。
		AI_Output(self, other, "DIA_Wulfgar_WannaJoin_04_06"); //那 么 去 和 安 德 烈 勋 爵 谈 谈 。 他 决 定 这 里 要 谁 。
	};
};

// *************************************************
// 						AboutMiliz
// *************************************************
instance DIA_Wulfgar_AboutMiliz(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 3;
	condition		= DIA_Wulfgar_AboutMiliz_Condition;
	information		= DIA_Wulfgar_AboutMiliz_Info;
	description		= "对 于 民 兵 来 说 那 象 什 么 样 ？";
};

func int DIA_Wulfgar_AboutMiliz_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wulfgar_Hallo))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AboutMiliz_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_AboutMiliz_15_00"); //对 于 民 兵 来 说 那 象 什 么 样 ？
	AI_Output(self, other, "DIA_Wulfgar_AboutMiliz_04_01"); //安 德 烈 勋 爵 现 在 是 我 们 的 指 挥 官 。
	AI_Output(self, other, "DIA_Wulfgar_AboutMiliz_04_02"); //民 兵 以 前 向 总 督 报 到 。 （ 大 笑 ） 他 不 知 道 我 们 在 这 里 做 什 么 。
	AI_Output(self, other, "DIA_Wulfgar_AboutMiliz_04_03"); //但 是 安 德 烈 勋 爵 知 道 他 在 做 什 么 。 他 非 常 优 待 他 们 。
	AI_Output(self, other, "DIA_Wulfgar_AboutMiliz_04_04"); //这 里 的 每 个 新 人 都 会 得 到 一 套 得 体 的 盔 甲 和 精 良 的 武 器 。
	AI_Output(self, other, "DIA_Wulfgar_AboutMiliz_04_05"); //而 且 如 果 你 的 工 作 出 色 的 话 ， 还 有 奖 金 。 他 为 每 一 个 被 抓 住 的 罪 犯 支 付 赏 金 。
};

// *************************************************
// 						CanYouTrain
// *************************************************
instance DIA_Wulfgar_CanYouTrain(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 4;
	condition		= DIA_Wulfgar_CanYouTrain_Condition;
	information		= DIA_Wulfgar_CanYouTrain_Info;
	description		= "你 也 能 训 练 我 用 剑 战 斗 的 技 能 吗 ？";
};

func int DIA_Wulfgar_CanYouTrain_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Wulfgar_Hallo))
	&& (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_CanYouTrain_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_CanYouTrain_15_00"); //你 也 能 训 练 我 用 剑 战 斗 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Wulfgar_CanYouTrain_04_01"); //安 德 烈 勋 爵 命 令 我 们 训 练 每 一 个 有 可 能 保 护 城 市 的 人 。
	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Wulfgar_CanYouTrain_04_02"); //不 过 ， 那 不 适 用 于 雇 佣 兵 。 走 开 。
	}
	else
	{
		AI_Output(self, other, "DIA_Wulfgar_CanYouTrain_04_03"); //但 是 那 仅 仅 适 用 于 战 斗 训 练 。 所 有 其 它 类 别 的 训 练 都 仅 限 于 民 兵 。
		AI_Output(self, other, "DIA_Wulfgar_CanYouTrain_04_04"); //你 至 少 了 解 一 些 使 用 武 器 的 方 法 吧 ？
		AI_Output(other, self, "DIA_Wulfgar_CanYouTrain_15_05"); //我 是 这 么 想 … …
		AI_Output(self, other, "DIA_Wulfgar_CanYouTrain_04_06"); //（ 叹 息 ） 好 吧 - 当 你 准 备 好 的 时 候 就 开 始 。
		Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
		B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_21);
		Wulfgar_Teach1H = TRUE;
	};
};

// *************************************************
// 						Advantage
// *************************************************
instance DIA_Wulfgar_Advantage(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 5;
	condition		= DIA_Wulfgar_Advantage_Condition;
	information		= DIA_Wulfgar_Advantage_Info;
	description		= "单 手 或 者 双 手 武 器 的 优 点 是 什 么 ？";
};

func int DIA_Wulfgar_Advantage_Condition()
{
	if ((Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Advantage_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_Advantage_15_00"); //单 手 或 者 双 手 武 器 的 优 点 是 什 么 ？
	AI_Output(self, other, "DIA_Wulfgar_Advantage_04_01"); //非 常 简 单 。 使 用 单 手 武 器 ， 你 攻 击 速 度 就 更 快 。 那 在 战 斗 中 是 相 当 重 要 的 优 势 。
	AI_Output(self, other, "DIA_Wulfgar_Advantage_04_02"); //双 手 武 器 更 加 笨 重 。 你 在 战 斗 的 时 候 必 须 深 谋 远 虑 - 但 是 当 你 击 中 目 标 时 ， 能 造 成 更 大 的 伤 害 。
};

// *************************************************
// 						HowToBegin
// *************************************************
instance DIA_Wulfgar_HowToBegin(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 6;
	condition		= DIA_Wulfgar_HowToBegin_Condition;
	information		= DIA_Wulfgar_HowToBegin_Info;
	description		= "我 从 什 么 武 器 开 始 ？ 单 手 还 是 双 手 武 器 ？";
};

func int DIA_Wulfgar_HowToBegin_Condition()
{
	if ((Wulfgar_Teach1H == TRUE)
	|| (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_HowToBegin_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_HowToBegin_15_00"); //我 从 什 么 武 器 开 始 ？ 单 手 还 是 双 手 武 器 ？
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_01"); //那 都 取 决 于 你 。
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_02"); //如 果 你 专 精 某 类 武 器 ， 你 将 同 时 自 动 学 习 其 它 技 能 。
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_03"); //举 个 例 子 ， 如 果 你 善 于 使 用 单 手 剑 战 斗 ， 但 是 在 双 手 武 器 方 面 还 是 个 初 学 者 … …
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_04"); //… … 你 的 双 手 技 能 将 在 你 训 练 单 手 武 器 的 过 程 中 同 时 增 加 。
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_05"); //在 那 种 情 况 下 ， 训 练 将 比 你 同 时 学 习 两 种 类 型 的 武 器 更 加 疲 劳 。
	AI_Output(self, other, "DIA_Wulfgar_HowToBegin_04_06"); //马 上 开 始 ， 你 就 知 道 我 所 说 的 意 思 了 。
};

// *************************************************
// 						TRAIN
// *************************************************
instance DIA_Wulfgar_Teach(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 7;
	condition		= DIA_Wulfgar_Teach_Condition;
	information		= DIA_Wulfgar_Teach_Info;
	permanent		= TRUE;
	description		= "我 们 开 始 训 练 吧 ！";
};

func int DIA_Wulfgar_Teach_Condition()
{
	if ((Wulfgar_Teach1H == TRUE)
	|| (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Teach_Info()
{
	AI_Output(other, self, "DIA_Wulfgar_Teach_15_00"); //我 们 开 始 训 练 吧！

	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Wulfgar_Add_04_00"); //我 不 训 练 雇 佣 兵 ！
	}
	else
	{
		if (other.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Wulfgar_Add_04_01"); //当 然 ， 大 人 。
		};

		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach, DIALOG_BACK, DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_Back()
{
	Info_ClearChoices(DIA_Wulfgar_Teach);
};

func void DIA_Wulfgar_Teach_1H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach, DIALOG_BACK, DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_1H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach, DIALOG_BACK, DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_2H_1()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach, DIALOG_BACK, DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Wulfgar_Teach_1H_5);
	};
};

func void DIA_Wulfgar_Teach_2H_5()
{
	if (B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 75))
	{
		Info_ClearChoices(DIA_Wulfgar_Teach);
		Info_AddChoice(DIA_Wulfgar_Teach, DIALOG_BACK, DIA_Wulfgar_Teach_Back);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Wulfgar_Teach_2H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Wulfgar_Teach_2H_5);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Wulfgar_Teach_1H_1);
		Info_AddChoice(DIA_Wulfgar_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Wulfgar_Teach_1H_5);
	};
};

// ************************************************************
// 			  				Als Miliz
// ************************************************************
instance DIA_Wulfgar_AlsMil(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 1;
	condition		= DIA_Wulfgar_AlsMil_Condition;
	information		= DIA_Wulfgar_AlsMil_Info;
	important		= TRUE;
};

func int DIA_Wulfgar_AlsMil_Condition()
{
	if (other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_AlsMil_Info()
{
	AI_Output(self, other, "DIA_Wulfgar_AlsMil_04_00"); //那 么 安 德 烈 勋 爵 接 受 你 了 ！
	AI_Output(self, other, "DIA_Wulfgar_AlsMil_04_01"); //我 期 待 你 来 这 里 接 受 正 规 训 练 。
	AI_Output(self, other, "DIA_Wulfgar_AlsMil_04_02"); //鲁 加 可 以 训 练 你 使 用 弩 的 技 巧 ， 而 莫 提 斯 可 以 帮 你 增 加 力 量 。
	AI_Output(self, other, "DIA_Wulfgar_AlsMil_04_03"); //但 是 最 重 要 的 是 学 习 恰 当 的 使 用 你 的 剑 。
	AI_Output(self, other, "DIA_Wulfgar_AlsMil_04_04"); //我 一 定 会 让 你 成 为 一 名 优 秀 的 战 士 ！
};

///////////////////////////////////////////////////////////////////////
//	Info Bonus
///////////////////////////////////////////////////////////////////////
instance DIA_Wulfgar_Bonus(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 2;
	condition		= DIA_Wulfgar_Bonus_Condition;
	information		= DIA_Wulfgar_Bonus_Info;
	important		= TRUE;
};

func int DIA_Wulfgar_Bonus_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Wld_IsTime(05, 02, 06, 54)))
	{
		return TRUE;
	};
};

func void DIA_Wulfgar_Bonus_Info()
{
	AI_Output(self, other, "DIA_Wulfgar_Bonus_04_00"); //这 么 早 就 出 来 走 动 ？ 这 个 时 候 我 通 常 都 是 一 个 人 呆 着 。 不 过 既 然 你 已 经 来 了 ， 你 可 能 想 习 一 些 东 西 。
	AI_Output(self, other, "DIA_Wulfgar_Bonus_04_01"); //那 么 注 意 了 。 如 果 你 躲 开 他 们 的 攻 击 并 抓 住 正 确 的 时 机 进 攻 的 话 ， 你 可 以 骗 过 你 的 对 手 。
	AI_Output(self, other, "DIA_Wulfgar_Bonus_04_02"); //在 你 的 下 一 次 战 斗 中 要 记 住 那 一 点 ！

	B_RaiseFightTalent(other, NPC_TALENT_1H, 2);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wulfgar_PICKPOCKET(C_INFO)
{
	npc				= Mil_312_Wulfgar;
	nr				= 900;
	condition		= DIA_Wulfgar_PICKPOCKET_Condition;
	information		= DIA_Wulfgar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Wulfgar_PICKPOCKET_Condition()
{
	C_Beklauen(58, 80);
};

func void DIA_Wulfgar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET, DIALOG_BACK, DIA_Wulfgar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wulfgar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wulfgar_PICKPOCKET_DoIt);
};

func void DIA_Wulfgar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};

func void DIA_Wulfgar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wulfgar_PICKPOCKET);
};
