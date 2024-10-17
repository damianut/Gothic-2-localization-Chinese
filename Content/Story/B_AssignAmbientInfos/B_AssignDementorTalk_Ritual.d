// ***************************************************
//  	B_AssignDementorTalk_Ritual
// ***************************************************

func void B_AssignDementorTalk_Ritual()
{
	Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_PRACTICEMAGIC5");

	if (MIS_SCKnowsInnosEyeIsBroken == FALSE)
	{
		AI_Output(self, other, "DIA_RitualDementor_19_00"); //你 来 的 太 晚 了 。
		AI_Output(self, other, "DIA_RitualDementor_19_01"); //我 们 已 经 破 坏 了 英 诺 斯 之 眼 ， 所 以 它 永 远 无 法 再 恢 复 它 的 力 量 。
		AI_Output(self, other, "DIA_RitualDementor_19_02"); //我 们 现 在 将 要 让 你 看 看 你 对 主 人 的 挑 战 是 多 么 没 有 价 值 。

		MIS_SCKnowsInnosEyeIsBroken = TRUE;
		B_LogEntry(TOPIC_INNOSEYE, TOPIC_INNOSEYE_1);
		Log_AddEntry(TOPIC_TraitorPedro, TOPIC_TraitorPedro_1);
		B_GivePlayerXP(XP_SCKnowsInnosEyeIsBroken);
	}
	else
	{
		var int randy;
		randy = Hlp_Random(4);

		if (randy == 0)
		{
			AI_Output(self, other, "DIA_RitualDementor_19_03"); //现 在 感 受 我 们 的 力 量 吧 。
		};

		if (randy == 1)
		{
			AI_Output(self, other, "DIA_RitualDementor_19_04"); //为 了 主 人 。
		};

		if (randy == 2)
		{
			AI_Output(self, other, "DIA_RitualDementor_19_05"); //你 无 处 躲 藏 。
		};

		if (randy == 3)
		{
			AI_Output(self, other, "DIA_RitualDementor_19_06"); //我 们 会 杀 掉 你 。
		};
	};

	Npc_SetRefuseTalk(self, 30);
};

func void B_AssignDementorTalk_Ritual_Exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_EnemyOverride] = FALSE;
	/*
	DMT_1201.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1202.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1203.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1204.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1205.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1206.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1207.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1208.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1209.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1210.aivar[AIV_EnemyOverride] = FALSE;
	DMT_1211.aivar[AIV_EnemyOverride] = FALSE;
	*/
};
