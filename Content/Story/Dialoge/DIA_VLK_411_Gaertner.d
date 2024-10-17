// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Gaertner_EXIT(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 999;
	condition		= DIA_Gaertner_EXIT_Condition;
	information		= DIA_Gaertner_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gaertner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gaertner_PICKPOCKET(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 900;
	condition		= DIA_Gaertner_PICKPOCKET_Condition;
	information		= DIA_Gaertner_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Gaertner_PICKPOCKET_Condition()
{
	C_Beklauen(40, 50);
};

func void DIA_Gaertner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET, DIALOG_BACK, DIA_Gaertner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gaertner_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gaertner_PICKPOCKET_DoIt);
};

func void DIA_Gaertner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

func void DIA_Gaertner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gaertner_PICKPOCKET);
};

//*************************************************************
//		Was machst du hier?
//*************************************************************
instance DIA_Gaertner_Job(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 5;
	condition		= DIA_Gaertner_Job_Condition;
	information		= DIA_Gaertner_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Gaertner_Job_Condition()
{
	return TRUE;
};

func void DIA_Gaertner_Job_Info()
{
	AI_Output(other, self, "DIA_Gaertner_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Gaertner_Job_09_01"); //你 是 怎 么 想 的 ， 嗯 ？ 我 是 个 园 丁 ， 我 照 管 花 园 。
	AI_Output(other, self, "DIA_Gaertner_Job_15_02"); //你 在 这 里 就 一 个 人 ，对 吧 ?
	AI_Output(self, other, "DIA_Gaertner_Job_09_03"); //是 的 ， 而 且 最 好 继 续 这 样 。 我 很 高 兴 能 在 这 里 得 到 一 些 安 宁 。
	AI_Output(self, other, "DIA_Gaertner_Job_09_04"); //有 一 次 ， 我 杀 了 人 ， 他 们 想 罚 我 去 罪 犯 流 放 地 。
	AI_Output(self, other, "DIA_Gaertner_Job_09_05"); //但 是 拉 里 厄 斯 - 也 就 是 总 督 还 需 要 一 个 园 丁 ， 就 这 样 把 我 留 在 了 这 里 。
	AI_Output(self, other, "DIA_Gaertner_Job_09_06"); //时 间 流 逝 ， 这 个 花 园 已 经 变 成 了 我 的 家 。 而 且 我 对 此 很 满 足 。
};

//*************************************************************
//
//*************************************************************
instance DIA_Gaertner_Plants(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 5;
	condition		= DIA_Gaertner_Plants_Condition;
	information		= DIA_Gaertner_Plants_Info;
	description		= "你 在 种 植 药 草 ？";
};

func int DIA_Gaertner_Plants_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gaertner_Job))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Plants_Info()
{
	AI_Output(other, self, "DIA_Gaertner_Plants_15_00"); //你 在 种 植 药 草 ？
	AI_Output(self, other, "DIA_Gaertner_Plants_09_01"); //很 少 。 我 种 植 了 柳 兰 和 火 荨 麻 。 我 也 试 过 种 植 沼 生 草 ， 但 它 在 这 里 长 得 不 太 好 。
	AI_Output(self, other, "DIA_Gaertner_Plants_09_02"); //嗯 ， 我 刚 刚 收获 。 所 以 ， 如 果 你 想 买 什 么 东 西 … …

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_18);
};

//*************************************************************
//		Trade
//*************************************************************
instance DIA_Gaertner_Trade(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 5;
	condition		= DIA_Gaertner_Trade_Condition;
	information		= DIA_Gaertner_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Gaertner_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Gaertner_Plants))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Gaertner_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

//*************************************************************
//		Krautabak
//*************************************************************
instance DIA_Gaertner_Krautabak(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 5;
	condition		= DIA_Gaertner_Krautabak_Condition;
	information		= DIA_Gaertner_Krautabak_Info;
	description		= "我 这 里 有 一 些 药 草 烟 。";
};

func int DIA_Gaertner_Krautabak_Condition()
{
	if ((Npc_HasItems(other, ItMi_SumpfTabak) >= 1)
	&& Wld_IsTime(06, 45, 21, 45))
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Krautabak_Info()
{
	AI_Output(other, self, "DIA_Gaertner_Krautabak_15_00"); //我 这 里 有 些 药 草 烟 。 想 抽 口 烟 吗 ？
	AI_Output(self, other, "DIA_Gaertner_Krautabak_09_01"); //我 不 知 道 ，但 是，给 我 吧 。我 给 自 己 卷 根 烟。

	B_GiveInvItems(other, self, ItMi_SumpfTabak, 1);
	Npc_RemoveInvItems(self, ItMi_SumpfTabak, 1);

	CreateInvItems(self, Itmi_Joint, 1);
	B_UseItem(self, itmi_Joint);
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_Output(self, other, "DIA_Gaertner_Krautabak_09_02"); //阿 咳 … … 阿 咳 阿 咳 … …
	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Gaertner_Krautabak_09_03"); //有 害 的 东 西 。 我 想 我 最 好 不 要 再 抽 这 种 东 西 了 。

	B_GivePlayerXP(XP_Ambient);
};

//*************************************************************
//		Sign
//*************************************************************
instance DIA_Gaertner_Sign(C_INFO)
{
	npc				= VLK_411_Gaertner;
	nr				= 6;
	condition		= DIA_Gaertner_Sign_Condition;
	information		= DIA_Gaertner_Sign_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Gaertner_Sign_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Gaertner_Sign_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Gaertner_Sign_09_00"); //那 么 ， 你 是 我 们 的 人 。 那 好 ， 我 这 里 有 些 对 你 有 用 的 信 息 。
	AI_Output(self, other, "DIA_Gaertner_Sign_09_01"); //在 这 里 的 一 些 房 子 里 有 一 些 秘 密 面 板 ， 只 能 通 过 隐 藏 的 开 关 才 能 打 开 。
	AI_Output(self, other, "DIA_Gaertner_Sign_09_02"); //人 们 把 他 们 值 钱 的 东 西 都 放 在 那 里 面 。
};
