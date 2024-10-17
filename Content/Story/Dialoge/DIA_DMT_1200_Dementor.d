// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_BridgeDementor_EXIT(C_INFO)
{
	npc				= DMT_1200_Dementor;
	nr				= 999;
	condition		= DIA_BridgeDementor_EXIT_Condition;
	information		= DIA_BridgeDementor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BridgeDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BridgeDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 30);
	B_Attack(self, other, AR_NONE, 1);
	Snd_Play("MFX_FEAR_CAST");
};

///////////////////////////////////////////////////////////////////////
//	Info BridgeDementor (steht an der Brücke)
///////////////////////////////////////////////////////////////////////
instance DIA_BridgeDementor(C_INFO)
{
	npc				= DMT_1200_Dementor;
	nr				= 1;
	condition		= DIA_BridgeDementor_Condition;
	information		= DIA_BridgeDementor_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BridgeDementor_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_BridgeDementor_Info()
{
	Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_PRACTICEMAGIC5");

	AI_Output(self, other, "DIA_BridgeDementor_19_00"); //我 们 知 道 你 会 来 的 ！
	AI_Output(self, other, "DIA_BridgeDementor_19_01"); //我 的 主 人 一 定 会 胜 利 ， 并 将 整 个 世 界 置 于 他 的 统 治 之 下 。
	AI_Output(self, other, "DIA_BridgeDementor_19_02"); //你 这 误 入 歧 途 的 傻 瓜 ！ 你 不 知 道 你 正 在 和 谁 对 抗 ， 而 我 马 上 就 要 惩 罚 你 ！

	Npc_SetRefuseTalk(self, 30);
};
