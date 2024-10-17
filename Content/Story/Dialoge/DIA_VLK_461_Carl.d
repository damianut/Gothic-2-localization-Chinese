///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_EXIT(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 999;
	condition		= DIA_Carl_EXIT_Condition;
	information		= DIA_Carl_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Carl_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Carl_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
func void B_CarlSayHallo()
{
	AI_Output(self, other, "DIA_Carl_Hallo_05_00"); //看 样 子 ， 城 里 有 几 个 贼 专 门 从 富 人 那 里 盗 窃 东 西 。
	AI_Output(self, other, "DIA_Carl_Hallo_05_01"); //那 些 城 市 守 卫 最 近 把 港 口 地 区 翻 了 个 底 朝 天 - 但 是 ， 他 们 什 么 也 没 找 到 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Carl_PICKPOCKET(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 900;
	condition		= DIA_Carl_PICKPOCKET_Condition;
	information		= DIA_Carl_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Carl_PICKPOCKET_Condition()
{
	C_Beklauen(34, 40);
};

func void DIA_Carl_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
	Info_AddChoice(DIA_Carl_PICKPOCKET, DIALOG_BACK, DIA_Carl_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Carl_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Carl_PICKPOCKET_DoIt);
};

func void DIA_Carl_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

func void DIA_Carl_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Carl_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_Hallo(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 2;
	condition		= DIA_Carl_Hallo_Condition;
	information		= DIA_Carl_Hallo_Info;
	important		= TRUE;
};

func int DIA_Carl_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Carl_Hallo_Info()
{
	AI_Output(self, other, "DIA_Carl_Hallo_05_02"); //什 么 让 你 来 到 了 这 个 穷 地 方 ？ 你 在 这 里 找 什 么 ？

	Info_ClearChoices(DIA_Carl_Hallo);
	Info_AddChoice(DIA_Carl_Hallo, "我 已 经 迷 路 了 。", DIA_Carl_Hallo_verlaufen);
	Info_AddChoice(DIA_Carl_Hallo, "我 只 是 四 处 转 转 。", DIA_Carl_Hallo_umsehen);
};

func void DIA_Carl_Hallo_verlaufen()
{
	AI_Output(other, self, "DIA_Carl_Hallo_verlaufen_15_00"); //我 已 经 迷 路 了 。
	AI_Output(self, other, "DIA_Carl_Hallo_verlaufen_05_01"); //那 么 ， 小 心 别 被 抢 了 。
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

func void DIA_Carl_Hallo_umsehen()
{
	AI_Output(other, self, "DIA_Carl_Hallo_umsehen_15_00"); //我 只 是 四 处 转 转 。
	AI_Output(self, other, "DIA_Carl_Hallo_umsehen_05_01"); //啊 哈 。 那 么 你 最 好 在 四 处 转 的 时 候 别 被 抓 住 。
	B_CarlSayHallo();
	Info_ClearChoices(DIA_Carl_Hallo);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebe
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_Diebe(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 3;
	condition		= DIA_Carl_Diebe_Condition;
	information		= DIA_Carl_Diebe_Info;
	description		= "关 于 那 些 盗 贼 你 知 道 些 什 么 ？ ";
};

func int DIA_Carl_Diebe_Condition()
{
	return TRUE;
};

func void DIA_Carl_Diebe_Info()
{
	AI_Output(other, self, "DIA_Carl_Diebe_15_00"); //关 于 那 些 盗 贼 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Carl_Diebe_05_01"); //没 事 。 不 过 ， 所 有 的 市 民 都 很 恐 惧 ， 他 们 变 得 更 加 多 疑 - 尤 其 是 对 待 陌 生 人 。
	AI_Output(self, other, "DIA_Carl_Diebe_05_02"); //不 要 在 陌 生 的 房 子 里 被 发 现 - 没 有 人 会 和 善 地 对 待 这 样 的 事 。
	AI_Output(self, other, "DIA_Carl_Diebe_05_03"); //是 的 ， 必 须 保 护 自 己 免 遭 盗 贼 光 顾 。 一 顿 结 实 的 棍 棒 会 起 到 最 好 的 效 果 。
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_Lernen(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 3;
	condition		= DIA_Carl_Lernen_Condition;
	information		= DIA_Carl_Lernen_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Carl_Lernen_Condition()
{
	return TRUE;
};

func void DIA_Carl_Lernen_Info()
{
	AI_Output(other, self, "DIA_Carl_Lernen_15_00"); //你 能 教 我 些 什 么 吗 ？
	AI_Output(self, other, "DIA_Carl_Lernen_05_01"); //哦 ， 我 在 铸 造 一 些 配 件 和 钉 子 ， 并 修 理 铁 制 的 部 件 。
	AI_Output(self, other, "DIA_Carl_Lernen_05_02"); //但 是 ， 我 所 了 解 的 铸 造 武 器 的 技 能 不 足 以 指 导 你 。
	AI_Output(self, other, "DIA_Carl_Lernen_05_03"); //如 果 你 想 学 习 这 个 ， 那 么 去 见 见 哈 莱 德 吧 。 他 肯 定 知 道 怎 样 铸 造 武 器 ！
	AI_Output(self, other, "DIA_Carl_Lernen_05_04"); //但 是 ， 如 果 你 想 锻 炼 一 下 你 的 肌 肉 ， 我 可 以 帮 你 这 个 忙 。

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_3);
};

///////////////////////////////////////////////////////////////////////
//	Info Für's lernen bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_Wieviel(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 3;
	condition		= DIA_Carl_Wieviel_Condition;
	information		= DIA_Carl_Wieviel_Info;
	description		= "训 练 的 收 费 是 多 少 ？";
};

func int DIA_Carl_Wieviel_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Carl_Lernen))
	{
		return TRUE;
	};
};

func void DIA_Carl_Wieviel_Info()
{
	AI_Output(other, self, "DIA_Carl_Wieviel_15_00"); //训 练 的 收 费 是 多 少 ？

	if (Npc_KnowsInfo(other, DIA_Edda_Statue))
	{
		AI_Output(self, other, "DIA_Carl_Wieviel_05_01"); //我 听 说 了 你 为 埃 达 做 的 那 些 事 。 我 会 免 费 训 练 你 。
		Carl_TeachSTR = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Carl_Wieviel_05_02"); //5 0 个 金 币 就 能 帮 你 变 得 更 强 壮 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Gold zahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Carl_bezahlen(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 3;
	condition		= DIA_Carl_bezahlen_Condition;
	information		= DIA_Carl_bezahlen_Info;
	permanent		= TRUE;
	description		= "我 想 要 接 受 你 的 训 练 （ 付 ５ ０ 金 币 ）";
};

func int DIA_Carl_bezahlen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Carl_Wieviel)
	&& (Carl_TeachSTR == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Carl_bezahlen_Info()
{
	AI_Output(other, self, "DIA_Carl_bezahlen_15_00"); //我 想 要 跟 你 一 起 训 练 。

	if (Npc_KnowsInfo(other, DIA_Edda_Statue))
	{
		AI_Output(self, other, "DIA_Carl_bezahlen_05_01"); //我 听 说 了 你 为 埃 达 做 的 那 些 事 。 我 会 免 费 训 练 你 。
		Carl_TeachSTR = TRUE;
	}
	else
	{
		if (B_GiveInvItems(other, self, ItMi_Gold, 50))
		{
			AI_Output(self, other, "DIA_Carl_bezahlen_05_02"); //很 好 ， 一 旦 你 准 备 好 了 我 们 就 可 以 开 始 。
			Carl_TeachSTR = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Carl_bezahlen_05_03"); //拿 金 币 来 ， 然 后 我 会 训 练 你 。
		};
	};
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Carl_Teach(C_INFO)
{
	npc				= VLK_461_Carl;
	nr				= 7;
	condition		= DIA_Carl_Teach_Condition;
	information		= DIA_Carl_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 变 得 更 强 壮";
};

func int DIA_Carl_Teach_Condition()
{
	if (Carl_TeachSTR == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Carl_Teach_Info()
{
	AI_Output(other, self, "DIA_Carl_Teach_15_00"); //我 想 要 变 得 更 强 壮 。

	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_Back()
{
	Info_ClearChoices(DIA_Carl_Teach);
};

func void DIA_Carl_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_HIGH);

	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Carl_Teach_STR_5);
};

func void DIA_Carl_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_HIGH);

	Info_ClearChoices(DIA_Carl_Teach);
	Info_AddChoice(DIA_Carl_Teach, DIALOG_BACK, DIA_Carl_Teach_Back);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Carl_Teach_STR_1);
	Info_AddChoice(DIA_Carl_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Carl_Teach_STR_5);
};
