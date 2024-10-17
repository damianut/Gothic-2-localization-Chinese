//////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Joe_EXIT(C_INFO)
{
	npc				= VLK_448_Joe;
	nr				= 999;
	condition		= DIA_Joe_EXIT_Condition;
	information		= DIA_Joe_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Joe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Joe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Joe_PICKPOCKET(C_INFO)
{
	npc				= VLK_448_Joe;
	nr				= 900;
	condition		= DIA_Joe_PICKPOCKET_Condition;
	information		= DIA_Joe_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Joe_PICKPOCKET_Condition()
{
	C_Beklauen(25, 25);
};

func void DIA_Joe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
	Info_AddChoice(DIA_Joe_PICKPOCKET, DIALOG_BACK, DIA_Joe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Joe_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Joe_PICKPOCKET_DoIt);
};

func void DIA_Joe_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};

func void DIA_Joe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Joe_PICKPOCKET);
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Joe_Hallo(C_INFO)
{
	npc				= VLK_448_Joe;
	nr				= 2;
	condition		= DIA_Joe_Hallo_Condition;
	information		= DIA_Joe_Hallo_Info;
	important		= TRUE;
};

func int DIA_Joe_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Joe_Hallo_Info()
{
	AI_Output(self, other, "DIA_Joe_Hallo_10_00"); //嘿 ， 谢 谢 你 ， 伙 计 ， 我 要 说 是 ， 谢 谢 你 ， 真 的 。 我 以 为 我 永 远 也 不 能 离 开 这 里 了 ！
	TOPIC_END_Joe = TRUE;
	B_GivePlayerXP((XP_Ambient * 4));

	AI_Output(other, self, "DIA_Joe_Hallo_15_01"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Joe_Hallo_10_02"); //我 被 锁 在 里 面 了 。 那 扇 门 敞 开 着 ， 我 只 想 随 便 看 看 - 但 是 我 刚 一 进 来 ， 那 个 看 守 就 过 来 把 这 该 死 的 门 锁 了 。
	AI_Output(self, other, "DIA_Joe_Hallo_10_03"); //这 场 面 多 少 总 有 点 尴 尬 - 如 果 这 事 只 有 你 知 我 知 的 话 ， 我 会 很 感 激 的 。
	AI_Output(other, self, "DIA_Joe_Hallo_15_04"); //我 明 白 ， 那 真 不 是 什 么 值 得 自 豪 的 事 情 。
	AI_Output(self, other, "DIA_Joe_Hallo_10_05"); //我 想 我 现 在 需 要 喝 一 杯 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

//////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Joe_Perm(C_INFO)
{
	npc				= VLK_448_Joe;
	nr				= 2;
	condition		= DIA_Joe_Perm_Condition;
	information		= DIA_Joe_Perm_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Joe_Perm_Condition()
{
	if (Npc_GetDistToWP(self, "NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Joe_Perm_Info()
{
	AI_Output(other, self, "DIA_Joe_Perm_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Joe_Perm_10_01"); //谢 谢 你 把 我 放 出 来 了 。

	AI_StopProcessInfos(self);
};

//////////////////////////////////////////////////////////////////////
//	Info Sign
///////////////////////////////////////////////////////////////////////
instance DIA_Joe_Sign(C_INFO)
{
	npc				= VLK_448_Joe;
	nr				= 2;
	condition		= DIA_Joe_Sign_Condition;
	information		= DIA_Joe_Sign_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Joe_Sign_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_CITY_HABOUR_TAVERN01_08") <= 500)
	&& (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Joe_Sign_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Joe_Sign_10_00"); //嘿 ， 你 知 道 吗 - 我 们 彼 此 都 是 朋 友 。 既 然 如 此 ， 让 我 为 被 救 表 示 一 点 感 激 之 情 吧 。
	AI_Output(self, other, "DIA_Joe_Sign_10_01"); //给 ， 拿 着 这 些 开 锁 工 具 吧 - 我 敢 肯 定 你 会 发 现 它 们 很 有 用 。

	B_GiveInvItems(self, other, ItKE_Lockpick, 5);

	AI_StopProcessInfos(self);
};
