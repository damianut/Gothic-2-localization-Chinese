// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Wambo_EXIT(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 999;
	condition		= DIA_Wambo_EXIT_Condition;
	information		= DIA_Wambo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wambo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wambo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wambo_PICKPOCKET(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 900;
	condition		= DIA_Wambo_PICKPOCKET_Condition;
	information		= DIA_Wambo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 很 冒 险 ）";
};

func int DIA_Wambo_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_04) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void DIA_Wambo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	Info_AddChoice(DIA_Wambo_PICKPOCKET, DIALOG_BACK, DIA_Wambo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wambo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wambo_PICKPOCKET_DoIt);
};

func void DIA_Wambo_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self, other, ItKe_City_Tower_04, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Wambo_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Wambo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wambo_PICKPOCKET);
};

//*************************************************************
//		Was machst du hier?
//*************************************************************
instance DIA_Wambo_Job(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 5;
	condition		= DIA_Wambo_Job_Condition;
	information		= DIA_Wambo_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Wambo_Job_Condition()
{
	return TRUE;
};

func void DIA_Wambo_Job_Info()
{
	AI_Output(other, self, "DIA_Wambo_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Wambo_Job_03_01"); //我 要 确 保 没 人 进 入 这 座 房 子 。
	AI_Output(self, other, "DIA_Wambo_Job_03_02"); //哈 根 勋 爵 的 明 令 。 别 想 违 抗 这 个 命 令 ！
};

//*************************************************************
//		Wie ist die Lage?
//*************************************************************
instance DIA_Wambo_Situation(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 10;
	condition		= DIA_Wambo_Situation_Condition;
	information		= DIA_Wambo_Situation_Info;
	permanent		= TRUE;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Wambo_Situation_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Wambo_Job))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Situation_Info()
{
	AI_Output(other, self, "DIA_Wambo_Situation_15_00"); //最 近 怎 么 样 ？
	AI_Output(self, other, "DIA_Wambo_Situation_03_01"); //现 在 ， 一 切 都 安 静 了 。
};

//*************************************************************
//		Ramirez
//*************************************************************
instance DIA_Wambo_Ramirez(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 5;
	condition		= DIA_Wambo_Ramirez_Condition;
	information		= DIA_Wambo_Ramirez_Info;
	description		= "我 从 我 们 共 同 的 朋 友 雷 米 瑞 兹 那 来 。";
};

func int DIA_Wambo_Ramirez_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ramirez_Viertel))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Ramirez_Info()
{
	AI_Output(other, self, "DIA_Wambo_Ramirez_15_00"); //我 从 我 们 共 同 的 朋 友 雷 米 瑞 兹 那 来 。
	AI_Output(self, other, "DIA_Wambo_Ramirez_03_01"); //哦 ？ 那 个 雷 米 瑞 兹 是 一 只 小 老 鼠 。 他 不 是 我 的 朋 友 。 别 在 意 。 你 给 我 带 来 了 什 么 东 西 吗 ？
	AI_Output(other, self, "DIA_Wambo_Ramirez_15_02"); //那 要 看 你 想 要 什 么 了 。
	AI_PlayAni(self, "T_SEARCH");
	AI_Output(self, other, "DIA_Wambo_Ramirez_03_03"); //（ 沉 着 的 ） 好 吧 ， 我 会 告 诉 你 怎 么 做 。 你 给 我250枚 金 币 ， 然 后 晚 上 我 就 不 会 出 现 在 这 里 。
	AI_Output(self, other, "DIA_Wambo_Ramirez_03_04"); //如 果 你 太 明 目 张 胆 ， 而 且 我 碰 巧 在 这 个 地 区 的 时 候 ， 协 议 就 终 止 。
};

//*************************************************************
//	Deal
//*************************************************************
instance DIA_Wambo_Deal(C_INFO)
{
	npc				= Mil_316_Wambo;
	nr				= 5;
	condition		= DIA_Wambo_Deal_Condition;
	information		= DIA_Wambo_Deal_Info;
	permanent		= TRUE;
	description		= "（ 支 付 ２ ５ ０ 金 币 ）";
};

// -----------------------------------
var int DIA_Wambo_Deal_permanent;
// -----------------------------------
func int DIA_Wambo_Deal_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Wambo_Ramirez)
	&& (DIA_Wambo_Deal_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Wambo_Deal_Info()
{
	AI_Output(other, self, "DIA_Wambo_Deal_15_00"); //我 已 经 拿 到 了 你 的 钱 … …

	if (B_GiveInvItems(other, self, ItMi_Gold, 250))
	{
		AI_Output(self, other, "DIA_Wambo_Deal_03_01"); //好 吧 ， 那 从 现 在 起 ， 我 会 在 夜 里 离 开 这 里 。
		AI_Output(self, other, "DIA_Wambo_Deal_03_02"); //记 住 - 如 果 你 想 给 我 惹 麻 烦 的 话 ， 我 可 不 认 识 你 。

		DIA_Wambo_Deal_permanent = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "DRINK");
	}
	else
	{
		AI_Output(other, self, "DIA_Wambo_Deal_15_03"); //… … 但 是 现 在 不 要 和 我 呆 在 一 起 。
		AI_Output(self, other, "DIA_Wambo_Deal_03_04"); //如 果 有 人 想 耍 我 ， 我 绝 对 不 会 忍 受 。 所 以 ， 把 金 币 拿 走 。
		AI_StopProcessInfos(self);
	};
};
