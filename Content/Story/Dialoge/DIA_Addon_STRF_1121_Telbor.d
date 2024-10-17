// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Telbor_EXIT(C_INFO)
{
	npc				= STRF_1121_Addon_Telbor;
	nr				= 999;
	condition		= DIA_Addon_Telbor_EXIT_Condition;
	information		= DIA_Addon_Telbor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Telbor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Telbor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------

var int Telbor_Once;
instance DIA_Addon_Telbor_Hi(C_INFO)
{
	npc				= STRF_1121_Addon_Telbor;
	nr				= 2;
	condition		= DIA_Addon_Telbor_Hi_Condition;
	information		= DIA_Addon_Telbor_Hi_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Telbor_Hi_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& !Npc_IsDead(Patrick)
	&& !Npc_IsDead(Pardos))
	{
		return TRUE;
	};
};

func void DIA_Addon_Telbor_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Telbor_Hi_12_00"); //嘿 ， 我 没 事 。

	if (Sklaven_Flucht == FALSE)
	{
		if (Pardos_Geheilt == FALSE)
		{
			AI_Output(self, other, "DIA_Addon_Telbor_Hi_12_01"); //但 是 帕 多 斯 非 常 落 魄 。
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Telbor_Hi_12_02"); //多 谢 帮 助 帕 多 斯 。

			if (Telbor_once == FALSE)
			{
				B_GivePlayerXP(XP_Ambient);
				Telbor_Once = TRUE;
			};
		};
	};

	AI_Output(self, other, "DIA_Addon_Telbor_Hi_12_03"); //如 果 你 还 想 要 什 么 ， 去 和 帕 特 里 克 说 。 他 是 我 们 的 发 言 人 。

	AI_StopProcessInfos(self);
};
