
instance DIA_Addon_Myxir_CITY_EXIT(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 999;
	condition = DIA_Addon_Myxir_CITY_EXIT_Condition;
	information = DIA_Addon_Myxir_CITY_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Myxir_CITY_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_CITY_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Myxir_CITY_HelloCITY(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 5;
	condition = DIA_Addon_Myxir_CITY_HelloCITY_Condition;
	information = DIA_Addon_Myxir_CITY_HelloCITY_Info;
	permanent = TRUE;
	description = "Will you stay in the city now?";
};


func int DIA_Addon_Myxir_CITY_HelloCITY_Condition()
{
	return TRUE;
};


var int DIA_Addon_Myxir_CITY_HelloCITY_OneTime;

func void DIA_Addon_Myxir_CITY_HelloCITY_Info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Will you stay in the city now?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//One of us has to be HERE if Vatras leaves the city.
	VatrasAbloeseIstDa = TRUE;
	if((RavenIsDead == TRUE) && (DIA_Addon_Myxir_CITY_HelloCITY_OneTime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//One more thing I wanted to say to you.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//That really was a heroic feat that you accomplished in Jharkendar.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//Unfortunately, I'm still not finished with my tasks here in Khorinis.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//True, but I am sure that you will master them as well, Preserver.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//We'll see.
		DIA_Addon_Myxir_CITY_HelloCITY_OneTime = TRUE;
		B_GivePlayerXP(XP_Ambient);
	};
};


instance DIA_Addon_Myxir_CITY_Teach(C_Info)
{
	npc = KDW_140300_Addon_Myxir_CITY;
	nr = 90;
	condition = DIA_Addon_Myxir_CITY_Teach_Condition;
	information = DIA_Addon_Myxir_CITY_Teach_Info;
	permanent = TRUE;
	description = "Teach me that language.";
};


var int DIA_Addon_Myxir_CITY_Teach_NoPerm;
var int DIA_Addon_Myxir_CITY_Teach_OneTime;

func int DIA_Addon_Myxir_CITY_Teach_Condition()
{
	if((Myxir_Addon_TeachPlayer == TRUE) && (DIA_Addon_Myxir_CITY_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_Teach_NoPerm == FALSE) && (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();
	if(DIA_Addon_Myxir_CITY_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_CITY_Teach_OneTime = TRUE;
	};
	if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) || (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,Dialog_Back,DIA_Addon_Myxir_CITY_Teach_BACK);
	};
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_CITY_Teach,B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_CITY_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_CITY_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_1()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_2()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

func void DIA_Addon_Myxir_CITY_Teach_LANGUAGE_3()
{
	if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
	{
		DIA_Addon_Myxir_CITY_Teach_LANGUAGE_X();
	};
	Info_ClearChoices(DIA_Addon_Myxir_CITY_Teach);
};

