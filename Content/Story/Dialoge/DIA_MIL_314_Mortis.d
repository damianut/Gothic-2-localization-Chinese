///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_EXIT(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 999;
	condition		= DIA_Mortis_EXIT_Condition;
	information		= DIA_Mortis_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mortis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Mortis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Hallo(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 2;
	condition		= DIA_Mortis_Hallo_Condition;
	information		= DIA_Mortis_Hallo_Info;
	important		= TRUE;
};

func int DIA_Mortis_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& ((Npc_KnowsInfo(other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Hallo_Info()
{
	AI_Output(self, other, "DIA_Mortis_Hallo_13_00"); //你 想 要 什 么 ？ 帕 克 不 在 这 里 。 所 以 你 什 么 也 弄 不 到 。 以 后 再 来 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info Waffe
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Waffe(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 2;
	condition		= DIA_Mortis_Waffe_Condition;
	information		= DIA_Mortis_Waffe_Info;
	description		= "帕 克 在 哪 里 ？";
};

func int DIA_Mortis_Waffe_Condition()
{
	if ((MIS_Andre_Peck == LOG_RUNNING)
	&& ((Npc_KnowsInfo(other, DIA_Peck_FOUND_PECK) == FALSE)
	&& (Kapitel < 3)))
	{
		return TRUE;
	};
};

func void DIA_Mortis_Waffe_Info()
{
	AI_Output(other, self, "DIA_Mortis_Waffe_15_00"); //帕 克 在 哪 里 ？
	AI_Output(self, other, "DIA_Mortis_Waffe_13_01"); //你 刚 刚 加 入 我 们 ， 嗯 ？ 那 好 ， 欢 迎 入 队 。
	AI_Output(self, other, "DIA_Mortis_Waffe_13_02"); //帕 克 已 经 去 城 里 很 久 了 。 我 想 他 一 定 是 在 红 灯 笼 里 和 漂 亮 的 雯 嘉 鬼 混 。
};

///////////////////////////////////////////////////////////////////////
//	Info Paket
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Paket(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 2;
	condition		= DIA_Mortis_Paket_Condition;
	information		= DIA_Mortis_Paket_Info;
	description		= "关 于 那 包 水 草 你 知 道 些 什 么 ？";
};

func int DIA_Mortis_Paket_Condition()
{
	if (MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Paket_Info()
{
	AI_Output(other, self, "DIA_Mortis_Paket_15_00"); //关 于 那 包 水 草 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Mortis_Paket_13_01"); //嗯 … … 上 次 我 去 港 口 酒 吧 的 时 候 ， 我 听 到 卡 迪 夫 和 其 它 一 些 家 伙 在 谈 论 这 件 事 。
	AI_Output(other, self, "DIA_Mortis_Paket_15_02"); //另 一 个 人 是 谁 ？
	AI_Output(self, other, "DIA_Mortis_Paket_13_03"); //不 知 道 。 不 过 他 说 他 已 经 找 到 了 一 个 更 好 的 地 方 储 藏 他 的 草 药 - 然 后 他 们 两 个 就 像 喝 醉 的 兽 人 一 样 大 笑 起 来 。

	B_LogEntry(TOPIC_WAREHOUSE, TOPIC_WAREHOUSE_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Redlight
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Redlight(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 2;
	condition		= DIA_Mortis_Redlight_Condition;
	information		= DIA_Mortis_Redlight_Info;
	description		= "关 于 海 港 地 区 你 知 道 些 什 么 ？";
};

func int DIA_Mortis_Redlight_Condition()
{
	if (MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Redlight_Info()
{
	AI_Output(other, self, "DIA_Mortis_Redlight_15_00"); //你 对 海 港 地 区 了 解 多 少 ？ 我 想 要 找 一 个 出 售 沼 生 草 的 人 。
	AI_Output(self, other, "DIA_Mortis_Redlight_13_01"); //嗯 ， 那 里 的 人 们 真 的 很 少 说 话 ， 而 且 他 们 肯 定 不 会 对 城 市 卫 兵 说 任 何 事 情 。
	AI_Output(self, other, "DIA_Mortis_Redlight_13_02"); //如 果 你 想 去 那 里 了 解 什 么 事 情 的 话 ， 你 应 该 - 不 ， 你 必 须 脱 掉 你 的 盔 甲 。
	AI_Output(other, self, "DIA_Mortis_Redlight_15_03"); //好 吧 ， 然 后 呢 ？
	AI_Output(self, other, "DIA_Mortis_Redlight_13_04"); //酒 馆 和 妓 院 应 该 是 最 好 的 地 方 。 如 果 你 能 打 探 到 什 么 的 话 ， 那 也 一 定 是 在 那 里 听 到 的 。

	B_LogEntry(TOPIC_REDLIGHT, TOPIC_REDLIGHT_2);
};

///////////////////////////////////////////////////////////////////////
//	Info CanTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_CanTeach(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 5;
	condition		= DIA_Mortis_CanTeach_Condition;
	information		= DIA_Mortis_CanTeach_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 强 壮 。";
};

func int DIA_Mortis_CanTeach_Condition()
{
	if (Mortis_TeachSTR == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_CanTeach_Info()
{
	AI_Output(other, self, "DIA_Mortis_CanTeach_15_00"); //我 要 变 得 强 壮 。

	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Mortis_CanTeach_13_01"); //明 白 了 。 如 果 你 有 了 足 够 的 经 验 ， 我 能 帮 你 进 行 训 练 。
		Mortis_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Mortis_CanTeach_13_02"); //你 当 然 行 。 但 只 要 你 不 是 我 们 的 人 或 者 一 名 圣 骑 士 ， 我 就 不 会 帮 你 。
	};

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_16);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Mortis_Teach(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 100;
	condition		= DIA_Mortis_Teach_Condition;
	information		= DIA_Mortis_Teach_Info;
	permanent		= TRUE;
	description		= "我 要 变 得 强 壮 。";
};

func int DIA_Mortis_Teach_Condition()
{
	if (Mortis_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mortis_Teach_Info()
{
	AI_Output(other, self, "DIA_Mortis_Teach_15_00"); //我 要 变 得 强 壮 。

	Info_ClearChoices(DIA_Mortis_Teach);
	Info_AddChoice(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_BACK()
{
	if (other.attribute[ATR_STRENGTH] >= T_LOW)
	{
		AI_Output(self, other, "DIA_Mortis_Teach_13_00"); //你 已 经 够 强 壮 了 。 如 果 你 还 想 继 续 训 练 的 话 ， 去 别 的 地 方 。
	};

	Info_ClearChoices(DIA_Mortis_TEACH);
};

func void DIA_Mortis_Teach_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_LOW);

	Info_ClearChoices(DIA_Mortis_Teach);

	Info_AddChoice(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_TEACH_BACK);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Mortis_Teach_5);
};

func void DIA_Mortis_Teach_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_LOW);

	Info_ClearChoices(DIA_Mortis_Teach);

	Info_AddChoice(DIA_Mortis_Teach, DIALOG_BACK, DIA_Mortis_Teach_BACK);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Mortis_Teach_1);
	Info_AddChoice(DIA_Mortis_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Mortis_Teach_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Mortis_PICKPOCKET(C_INFO)
{
	npc				= Mil_314_Mortis;
	nr				= 900;
	condition		= DIA_Mortis_PICKPOCKET_Condition;
	information		= DIA_Mortis_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Mortis_PICKPOCKET_Condition()
{
	C_Beklauen(38, 60);
};

func void DIA_Mortis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
	Info_AddChoice(DIA_Mortis_PICKPOCKET, DIALOG_BACK, DIA_Mortis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mortis_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Mortis_PICKPOCKET_DoIt);
};

func void DIA_Mortis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};

func void DIA_Mortis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mortis_PICKPOCKET);
};
