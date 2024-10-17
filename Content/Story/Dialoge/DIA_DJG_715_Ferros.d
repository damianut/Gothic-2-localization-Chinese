//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_DJG_715_Ferros_EXIT(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 999;
	condition		= DIA_DJG_715_Ferros_EXIT_Condition;
	information		= DIA_DJG_715_Ferros_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_DJG_715_Ferros_Hello(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 4;
	condition		= DIA_DJG_715_Ferros_Hello_Condition;
	information		= DIA_DJG_715_Ferros_Hello_Info;
	description		= "你 从 哪 里 来 ？";
};

func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_Hello_15_00"); //你 从 哪 里 来 ？
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_01"); //从 大 陆 来 。 我 和 我 的 人 一 起 逃 到 这 里 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_02"); //那 里 的 情 况 越 来 越 糟 糕 了 。 兽 人 过 后 ， 除 了 烧 焦 的 村 庄 以 外 ， 什 么 都 不 留 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_03"); //国 王 已 经 无 法 控 制 他 的 王 国 了 。

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_04"); //我 认 为 ， 你 们 圣 骑 士 已 经 失 败 了 。
	};
};

//*********************************************************************
//	Info Friends
//*********************************************************************
instance DIA_DJG_715_Ferros_Friends(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 5;
	condition		= DIA_DJG_715_Ferros_Friends_Condition;
	information		= DIA_DJG_715_Ferros_Friends_Info;
	description		= "你 的 人 现 在 在 哪 里 ？";
};

func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_Friends_15_00"); //你 的 人 现 在 在 哪 里 ？
	AI_Output(self, other, "DIA_DJG_715_Ferros_Friends_01_01"); //我 离 开 了 他 们 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_Friends_01_02"); //他 们 认 为 他 们 可 以 拿 走 一 切 想 要 的 东 西 ， 即 使 是 那 些 不 属 于 他 们 的 东 西 。 我 退 出 了 。
};

//*********************************************************************
//	Info War
//*********************************************************************
instance DIA_DJG_715_Ferros_War(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_War_Condition;
	information		= DIA_DJG_715_Ferros_War_Info;
	description		= "关 于 那 场 战 争 你 还 知 道 什 么 ？";
};

func int DIA_DJG_715_Ferros_War_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_War_15_00"); //关 于 那 场 战 争 你 还 知 道 什 么 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_01"); //你 已 经 很 长 时 间 没 见 过 你 的 国 王 了 ， 嗯 ？
	};

	AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_02"); //兽 人 在 首 都 的 外 面 。 但 是 它 是 否 已 经 沦 陷 ， 我 不 知 道 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_03"); //我 听 说 的 最 后 一 件 事 就 是 国 王 已 经 死 了 。 不 过 我 不 相 信 。
};

//*********************************************************************
//	Was machst du hier in der Burg?
//*********************************************************************
instance DIA_DJG_715_Ferros_OldCamp(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 7;
	condition		= DIA_DJG_715_Ferros_OldCamp_Condition;
	information		= DIA_DJG_715_Ferros_OldCamp_Info;
	description		= "你 在 城 堡 这 里 做 什 么 ？";
};

func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_15_00"); //你 在 城 堡 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_01"); //我 听 说 了 龙 的 事 ， 并 想 要 出 力 和 它 们 战 斗 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_02"); //不 幸 的 是 ， 在 我 悄 悄 穿 过 兽 人 营 地 的 时 候 ， 我 把 剑 丢 了 。 现 在 我 被 困 在 这 里 了 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_03"); //没 有 一 把 长 剑 的 话 ， 我 没 法 离 开 这 里 ， 而 我 在 这 里 能 买 到 的 剑 都 是 垃 圾 。

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "我 希 望 你 的 搜 索 顺 利 。", DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "如 果 我 给 你 找 到 一 把 好 剑 ， 你 能 给 我 什 么 ？", DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "我 会 为 你 找 剑 。", DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis, "FP_OW_ITEM_08");
	MIS_FerrosSword = LOG_RUNNING;

	Log_CreateTopic(TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry(TOPIC_FerrosSword, TOPIC_FerrosSword_1);
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_No_15_00"); //我 希 望 你 的 搜 索 顺 利 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_No_01_01"); //我 真 的 想 问 自 己 ， 我 为 什 么 要 到 这 里 来 。

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //如 果 我 给 你 找 到 一 把 好 剑 ， 你 能 给 我 什 么 ？
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //唉，我什么都给不了你。我把最后一块金子都花在剑上了。

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //我 会 为 你 找 剑 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //那 太 好 了 。 你 应 该 在 南 边 的 高 崖 上 寻 找 它 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //我 可 能 把 它 丢 在 那 里 了 ， 在 兽 人 的 帐 篷 附 近 。
	B_LogEntry(TOPIC_FerrosSword, TOPIC_FerrosSword_2);

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

//*********************************************************************
//	Info FerrosAnySword
//*********************************************************************
instance DIA_DJG_715_Ferros_FerrosAnySword(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information		= DIA_DJG_715_Ferros_FerrosAnySword_Info;
	description		= "也 许 我 能 再 帮 你 找 一 把 剑 。";
};

func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if ((MIS_FerrosSword == LOG_RUNNING)
	&& ((Npc_HasItems(other, ItMW_1H_Special_01) >= 1)
	|| (Npc_HasItems(other, ItMW_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //也 许 我 能 再 帮 你 找 一 把 剑 。

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);

	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, DIALOG_BACK, DIA_DJG_715_Ferros_FerrosAnySword_Back);

	if (Npc_HasItems(other, ItMW_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, NAME_ItMw_1H_Special_01, DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};

	if (Npc_HasItems(other, ItMW_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, NAME_ItMw_1H_Special_02, DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //那 是 一 把 精 良 的 武 器 ， 做 工 极 佳 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //你 真 的 打 算 就 那 样 把 它 给 我 ？
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "不 ， 我 只 要 我 自 己 的 。", DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "是 的 ， 拿 上 它 。！", DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "不 ， 我 只 要 我 自 己 的 。", DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "是 的 ， 拿 上 它 。！", DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //是 的 ， 拿 上 它 。
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //谢 谢 ， 我 欠 你 的 人 情 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //作 为 回 报 ， 我 要 教 你 一 些 小 窍 门 ， 那 样 你 可 以 在 战 斗 中 更 好 地 发 挥 你 的 力 量 和 敏 捷 。

	Log_CreateTopic(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, TOPIC_Teacher_4);
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00"); //不 ， 我 只 要 我 自 己 的 。
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01"); //我 能 理 解 。
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other, self, ItMW_1H_Special_01, 1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other, self, ItMW_1H_Special_02, 1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

//*********************************************************************
//	Info FerrosHisSword
//*********************************************************************
instance DIA_DJG_715_Ferros_FerrosHisSword(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information		= DIA_DJG_715_Ferros_FerrosHisSword_Info;
	description		= "我 找 到 了 你 的 剑 。";
};

func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if ((MIS_FerrosSword == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //我 找 到 了 你 的 剑 。
	B_GiveInvItems(other, self, ItMw_1h_FerrosSword_Mis, 1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Ferros_Teach(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 1;
	condition		= DIA_Ferros_Teach_Condition;
	information		= DIA_Ferros_Teach_Info;
	permanent		= TRUE;
	description		= "告 诉 我 怎 么 提 高 我 的 能 力 。";
};

func int DIA_Ferros_Teach_Condition()
{
	if (MIS_FerrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other, self, "DIA_Ferros_Teach_15_00"); //告 诉 我 怎 么 提 高 我 的 能 力 。

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Ferros_Teach_01_01"); //在 那 些 兽 人 进 攻 之 后 ， 我 退 出 了 。 我 真 高 兴 还 能 活 着 ， 老 兄 。
	}
	else
	{
		AI_Output(self, other, "DIA_Ferros_Teach_01_02"); //一 个 优 秀 的 战 士 必 须 学 会 把 他 的 技 巧 直 接 运 用 到 武 器 上 去 。

		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach, DIALOG_BACK, DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ferros_Teach_DEX_5);
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Ferros_AllDragonsDead(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 5;
	condition		= DIA_Ferros_AllDragonsDead_Condition;
	information		= DIA_Ferros_AllDragonsDead_Info;
	description		= "所 有 的 龙 都 死 了 。";
};

func int DIA_Ferros_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Ferros_AllDragonsDead_15_00"); //所 有 的 龙 都 死 了 。
	AI_Output(self, other, "DIA_Ferros_AllDragonsDead_01_01"); //干 得 好 ！ 如 果 我 有 更 多 像 你 这 样 的 人 ， 情 况 就 不 会 变 成 这 样 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ferros_PICKPOCKET(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 900;
	condition		= DIA_Ferros_PICKPOCKET_Condition;
	information		= DIA_Ferros_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Ferros_PICKPOCKET_Condition()
{
	C_Beklauen(56, 75);
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET, DIALOG_BACK, DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};
