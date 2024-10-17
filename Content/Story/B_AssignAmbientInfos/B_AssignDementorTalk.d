// ************************************************************
// 		 EXIT
// ************************************************************
instance DIA_AmbientDementor_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_AmbientDementor_EXIT_Condition;
	information		= DIA_AmbientDementor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_AmbientDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AmbientDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	B_SCIsObsessed(self);
	Npc_SetRefuseTalk(self, 5);
	Snd_Play("MFX_FEAR_CAST");

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	}
	else
	{
		B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	AmbientDementor Info
///////////////////////////////////////////////////////////////////////
instance DIA_AmbientDementor(C_INFO)
{
	nr				= 1;
	condition		= DIA_AmbientDementor_Condition;
	information		= DIA_AmbientDementor_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_AmbientDementor_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_AmbientDementor_Info()
{
	Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_PRACTICEMAGIC5");

	var int randy;
	randy = Hlp_Random(4);

	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3))
	|| (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		AI_Output(self, other, "DIA_VinoDementor_19_00"); //你 是 来 破 坏 我 们 的 仪 式 的 吗 ？ 他 的 灵 魂 属 于 我 们 。 你 现 在 无 法 拯 救 他 了 ， 魔 法 师 。
	}
	else if (CurrentLevel == DRAGONISLAND_ZEN)
	{
		if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_01"); //（ 大 笑 ） 你 想 来 质 疑 我 和 我 的 成 果 吗 ？ 你 注 定 要 失 败 。
			AI_Output(self, other, "DIA_AmbientDementor_19_02"); //从 来 没 有 人 能 成 功 通 过 我 的 地 穴 。 回 去 ， 因 为 你 永 远 也 不 能 到 达 神 圣 的 伊 尔 多 拉 斯 大 厅 。
		}
		else
		{
			if (randy == 0)
			{
				AI_Output(self, other, "DIA_AmbientDementor_19_03"); //你 已 经 深 入 了 这 么 远 ， 可 怜 的 爬 虫 。 你 永 远 也 无 法 到 达 我 们 内 部 的 圣 所 。
			};

			if (randy == 1)
			{
				AI_Output(self, other, "DIA_AmbientDementor_19_04"); //停 在 你 现 在 的 位 置 。 不 要 再 向 前 迈 步 ！。
			};

			if (randy == 2)
			{
				AI_Output(self, other, "DIA_AmbientDementor_19_05"); //你 已 经 走 了 这 么 远 ， 但 是 你 无 法 通 过 我 这 里 。
			};

			if (randy == 3)
			{
				AI_Output(self, other, "DIA_AmbientDementor_19_06"); //你 来 挑 战 主 人 ， 但 是 你 首 先 要 从 我 这 里 通 过 。
			};
		};
	}
	else if (hero.guild == GIL_KDF)
	{
		if (randy == 0)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_07"); //虚 弱 的 魔 法 师 ， 你 永 远 无 法 与 主 人 的 力 量 相 匹 敌 。
		};

		if (randy == 1)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_08"); //你 选 择 了 魔 法 之 路 ， 想 来 战 胜 我 们 。 很 聪 明 的 举 动 ， 但 那 也 不 会 对 你 有 任 何 帮 助 。
		};

		if (randy == 2)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_09"); //即 使 作 为 一 名 魔 法 师 ， 你 也 无 法 阻 止 我 们 。
		};

		if (randy == 3)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_10"); //我 的 主 人 将 会 毁 灭 你 。 你 那 可 怜 的 小 魔 法 救 不 了 你 。
		};
	}
	else
	{
		if (randy == 0)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_11"); //趁 你 还 能 的 时 候 赶 快 投 降 。 否 则 你 将 无 法 逃 脱 。
		};

		if (randy == 1)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_12"); //现 在 你 将 会 体 会 到 主 人 的 力 量 。 你 无 法 逃 避 。
		};

		if (randy == 2)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_13"); //主 人 想 要 你 的 脑 袋 。 现 在 没 有 人 能 救 你 。
		};

		if (randy == 3)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_14"); //我 们 已 经 把 你 困 在 陷 阱 中 ， 现 在 我 们 将 要 毁 灭 你 。
		};
	};
};

func void B_AssignDementorTalk(var C_Npc slf)
{
	if ((slf.guild == GIL_DMT)
	&& (slf.npctype == NPCTYPE_AMBIENT))
	{
		DIA_AmbientDementor_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc = Hlp_GetInstanceID(slf);
	};
};
