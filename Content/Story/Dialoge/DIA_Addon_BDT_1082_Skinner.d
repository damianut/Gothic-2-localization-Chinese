///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skinner_EXIT(C_INFO)
{
	npc				= BDT_1082_Addon_Skinner;
	nr				= 999;
	condition		= DIA_Addon_Skinner_EXIT_Condition;
	information		= DIA_Addon_Skinner_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Skinner_PICKPOCKET(C_INFO)
{
	npc				= BDT_1082_Addon_Skinner;
	nr				= 900;
	condition		= DIA_Addon_Skinner_PICKPOCKET_Condition;
	information		= DIA_Addon_Skinner_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Addon_Skinner_PICKPOCKET_Condition()
{
	C_Beklauen(100, 200);
};

func void DIA_Addon_Skinner_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skinner_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET, DIALOG_BACK, DIA_Addon_Skinner_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skinner_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Skinner_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skinner_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
};

func void DIA_Addon_Skinner_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Wache_02_PICKPOCKET);
	B_Say(self, self, "$AWAKE");
};

///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skinner_Hi(C_INFO)
{
	npc				= BDT_1082_Addon_Skinner;
	nr				= 2;
	condition		= DIA_Addon_Skinner_Hi_Condition;
	information		= DIA_Addon_Skinner_Hi_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Skinner_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Skinner_Hi_08_00"); //你 为 什 么 叫 醒 我 ， 呃 ？ 我 打 赌 你 一 定 不 知 道 … …
	AI_Output(self, other, "DIA_Addon_Skinner_Hi_08_01"); //不 - 什 么 都 不 要 说 。 现 在 找 借 口 太 晚 了 。
	AI_Output(self, other, "DIA_Addon_Skinner_Hi_08_02"); //现 在 你 有 两 个 选 择 。 你 可 以 与 我 和 我 的 贝 蒂 打 。 或 者 你 可 以 试 着 逃 走 。
	AI_Output(self, other, "DIA_Addon_Skinner_Hi_08_03"); //如 果 我 是 你 ， 我 就 跑 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Attentat
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skinner_Attentat(C_INFO)
{
	npc				= BDT_1082_Addon_Skinner;
	nr				= 9;
	condition		= DIA_Addon_Skinner_Attentat_Condition;
	information		= DIA_Addon_Skinner_Attentat_Info;
	description		= "关 于 这 次 袭 击 … …";
};

func int DIA_Addon_Skinner_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skinner_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Skinner_Attentat_15_00"); //关 于 这 次 袭 击 … …
	AI_Output(self, other, "DIA_Addon_Skinner_Attentat_08_01"); //你 想 要 什 么 ？

	Info_ClearChoices(DIA_Addon_Skinner_Attentat);

	Info_AddChoice(DIA_Addon_Skinner_Attentat, "干 掉 伊 斯 特 班", DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA);
	Info_AddChoice(DIA_Addon_Skinner_Attentat, "找 到 背 叛 者", DIA_Addon_Skinner_ATTENTAT_ADDON_PRO);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA()
{
	AI_Output(other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_15_00"); //我 想 要 伊 斯 特 班 滚 开 。
	AI_Output(self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_CONTRA_08_01"); //棒 极 了 。

	Judas_Counter = (Judas_Counter + 1);

	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};

func void DIA_Addon_Skinner_ATTENTAT_ADDON_PRO()
{
	AI_Output(other, self, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_15_00"); //我 想 要 抓 到 叛 徒 。
	AI_Output(self, other, "DIA_Addon_Skinner_ATTENTAT_ADDON_PRO_08_01"); //狗 屁 。

	Info_ClearChoices(DIA_Addon_Skinner_Attentat);
};
