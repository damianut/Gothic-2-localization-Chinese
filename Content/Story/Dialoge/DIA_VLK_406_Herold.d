///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Herold_Info(C_INFO)
{
	npc				= VLK_406_Herold;
	nr				= 10;
	condition		= DIA_Herold_Info_Condition;
	information		= DIA_Herold_Info_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Herold_Info_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Herold_Info_Info()
{
	AI_Output(self, other, "DIA_Herold_Info_04_00"); //别 打 扰 我 ， 我 正 在 值 班 。！

	AI_StopProcessInfos(self);
};

// Joly: Siehe B_Announce_Herold.d
