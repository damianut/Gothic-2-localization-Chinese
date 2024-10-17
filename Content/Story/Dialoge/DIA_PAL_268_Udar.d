// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Udar_EXIT(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 999;
	condition		= DIA_Udar_EXIT_Condition;
	information		= DIA_Udar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Udar_EXIT_Condition()
{
	if (Kapitel < 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
instance DIA_Udar_Hello(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 2;
	condition		= DIA_Udar_Hello_Condition;
	information		= DIA_Udar_Hello_Info;
	important		= TRUE;
};

func int DIA_Udar_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_Hello_Info()
{
	AI_Output(self, other, "DIA_Udar_Hello_09_00"); //你 进 来 的 时 候 可 是 走 了 大 运 。 我 差 一 点 就 击 中 你 了 。
	AI_Output(other, self, "DIA_Udar_Hello_15_01"); //那 我 想 我 该 为 你 的 锐 利 的 眼 光 而 感 到 高 兴 了 。
	AI_Output(self, other, "DIA_Udar_Hello_09_02"); //别 说 废 话 了 。 如 果 你 要 什 么 东 西 ， 去 跟 森 格 雷 斯 说 。

	AI_StopProcessInfos(self);
};

//***************************************
//	Armbrustlehrer
//***************************************
instance DIA_Udar_YouAreBest(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 3;
	condition		= DIA_Udar_YouAreBest_Condition;
	information		= DIA_Udar_YouAreBest_Info;
	description		= "我 听 说 你 是 最 好 的 弩 手 … …";
};

func int DIA_Udar_YouAreBest_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Keroloth_Udar))
	{
		return 1;
	};
};

func void DIA_Udar_YouAreBest_Info()
{
	AI_Output(other, self, "DIA_Udar_YouAreBest_15_00"); //我 听 说 你 是 远 近 闻 名 的 最 好 的 弩 手 。
	AI_Output(self, other, "DIA_Udar_YouAreBest_09_01"); //如 果 有 人 这 么 说 ， 那 就 是 吧 。 你 想 要 什 么 ？
};

//***********************************
//	Bring wir was bei!
//***********************************
instance DIA_Udar_TeachMe(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 3;
	condition		= DIA_Udar_TeachMe_Condition;
	information		= DIA_Udar_TeachME_Info;
	description		= "教 我 如 何 发 射 弩。";
};

func int DIA_Udar_TeachMe_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Udar_YouAreBest))
	&& (Udar_TeachPlayer != TRUE))
	{
		return 1;
	};
};

func void DIA_Udar_TeachME_Info()
{
	AI_Output(other, self, "DIA_Udar_Teacher_15_00"); //教 我 如 何 发 射 弩 。
	AI_Output(self, other, "DIA_Udar_Teacher_09_01"); //滚 吧 ！ 城 堡 外 面 到 处 都 有 足 够 的 靶 子 。 找 它 们 去 练 习 吧 。
};

//***********************************
//	Ich bin auch nicht schlecht!
//***********************************
instance DIA_Udar_ImGood(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 3;
	condition		= DIA_Udar_ImGood_Condition;
	information		= DIA_Udar_ImGood_Info;
	description		= "我 是 最 厉 害 的 。";
};

func int DIA_Udar_ImGood_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Udar_YouAreBest))
	{
		return 1;
	};
};

func void DIA_Udar_ImGood_Info()
{
	AI_Output(other, self, "DIA_Udar_ImGood_15_00"); //我 是 最 厉 害 的 。
	AI_Output(self, other, "DIA_Udar_ImGood_09_01"); //（ 大 笑 着 ） 你 说 得 对 ！
	AI_Output(self, other, "DIA_Udar_ImGood_09_02"); //好 吧 ， 如 果 你 想 学 习 ， 那 我 就 帮 帮 你 。

	Udar_TeachPlayer = TRUE;
	B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_3);
};

//***********************************
//	Bring mir was bei
//***********************************
instance DIA_Udar_Teach(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 3;
	condition		= DIA_Udar_Teach_Condition;
	information		= DIA_Udar_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 向 你 学 习 。";
};

func int DIA_Udar_Teach_Condition()
{
	if (Udar_TeachPlayer == TRUE)
	{
		return 1;
	};
};

func void DIA_Udar_Teach_Info()
{
	AI_Output(other, self, "DIA_Udar_Teach_15_00"); //我 想 向 你 学 习 。
	AI_Output(self, other, "DIA_Udar_Teach_09_01"); //好 吧 ， 开 始 ！

	Info_ClearChoices(DIA_Udar_Teach);

	Info_AddChoice(DIA_Udar_Teach, DIALOG_BACK, DIA_Udar_Teach_Back);
	Info_AddChoice(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Udar_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Udar_Teach_CROSSBOW_5);
};

func void DIA_Udar_Teach_BACK()
{
	Info_ClearChoices(DIA_Udar_Teach);
};

func void B_Udar_TeachNoMore1()
{
	AI_Output(self, other, "B_Udar_TeachNoMore1_09_00"); //你 已 经 掌 握 要 领 了 - 我 们 没 有 时 间 再 做 更 多 的 了 。
};

func void B_Udar_TeachNoMore2()
{
	AI_Output(self, other, "B_Udar_TeachNoMore2_09_00"); //要 改 进 你 的 武 器 操 控 本 领 就 得 找 一 个 合 适 的 老 师 。
};

func void DIA_Udar_Teach_Crossbow_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 60);

	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();

		if (Npc_GetTalentSkill(other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};

	Info_AddChoice(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Udar_Teach_Crossbow_1);
};

func void DIA_Udar_Teach_Crossbow_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 60);

	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 60)
	{
		B_Udar_TeachNoMore1();

		if (Npc_GetTalentSkill(other, NPC_TALENT_CROSSBOW) == 1)
		{
			B_Udar_TeachNoMore2();
		};
	};

	Info_AddChoice(DIA_Udar_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Udar_Teach_Crossbow_5);
};

//***********************************
//	Perm
//***********************************
instance DIA_Udar_Perm(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 11;
	condition		= DIA_Udar_Perm_Condition;
	information		= DIA_Udar_Perm_Info;
	description		= "最 近 城 堡 里 面 怎 么 样 ？";
};

func int DIA_Udar_Perm_Condition()
{
	if (Kapitel <= 3)
	{
		return TRUE;
	};
};

func void DIA_Udar_Perm_Info()
{
	AI_Output(other, self, "DIA_Udar_Perm_15_00"); //最 近 城 堡 里 面 怎 么 样 ？
	AI_Output(self, other, "DIA_Udar_Perm_09_01"); //有 几 个 小 伙 子 正 在 练 习 ， 但 基 本 上 来 说 ， 我 们 只 是 在 等 待 着 某 些 事 情 的 发 生 。
	AI_Output(self, other, "DIA_Udar_Perm_09_02"); //就 是 这 种 不 确 定 性 使 我 们 疲 惫 不 堪 。 这 是 那 些 该 死 的 兽 人 的 策 略 。 它 们 要 等 到 我 们 精 神 崩 溃 。
};

//***********************************
//	Ring
//***********************************
instance DIA_Udar_Ring(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 11;
	condition		= DIA_Udar_Ring_Condition;
	information		= DIA_Udar_Ring_Info;
	description		= "给 ， 我 给 你 带 来 了 腾 格 荣 的 戒 指 … …";
};

func int DIA_Udar_Ring_Condition()
{
	if (Npc_HasItems(other, ItRi_Tengron) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Udar_Ring_Info()
{
	AI_Output(other, self, "DIA_Udar_Ring_15_00"); //给 ， 我 给 你 带 来 了 腾 格 荣 的 戒 指 。 它 应 该 能 保 护 你 。 腾 格 荣 说 他 回 来 的 时 候 会 取 回 它 。
	AI_Output(self, other, "DIA_Udar_Ring_09_01"); //什 么 ？ 你 知 不 知 道 那 是 什 么 戒 指 ？ 那 枚 戒 指 是 因 为 他 在 战 斗 中 的 勇 气 而 获 得 的 奖 励 。
	AI_Output(self, other, "DIA_Udar_Ring_09_02"); //你 说 他 想 要 找 回 它 ？ 如 果 这 是 英 诺 斯 的 旨 意 ， 那 他 就 能 办 到 。 如 果 这 是 英 诺 斯 的 旨 意 … …

	B_GiveInvItems(other, self, ItRi_Tengron, 1);
	TengronRing = TRUE;
	B_GivePlayerXP(XP_TengronRing);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Udar_KAP4_EXIT(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 999;
	condition		= DIA_Udar_KAP4_EXIT_Condition;
	information		= DIA_Udar_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Udar_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Kap4WiederDa(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 40;
	condition		= DIA_Udar_Kap4WiederDa_Condition;
	information		= DIA_Udar_Kap4WiederDa_Info;
	important		= TRUE;
};

func int DIA_Udar_Kap4WiederDa_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Udar_Kap4WiederDa_Info()
{
	AI_Output(self, other, "DIA_Udar_Kap4WiederDa_09_00"); //你 来 了 真 好 。 这 里 的 一 切 都 乱 了 套 。

	if (hero.guild != GIL_DJG)
	{
		AI_Output(other, self, "DIA_Udar_Kap4WiederDa_15_01"); //发 生 了 什 么 事 ？
		AI_Output(self, other, "DIA_Udar_Kap4WiederDa_09_02"); //这 些 龙 猎 手 在 城 堡 里 趾 高 气 昂 ， 还 鼓 吹 他 们 能 解 决 龙 的 问 题 。
		AI_Output(self, other, "DIA_Udar_Kap4WiederDa_09_03"); //但 我 告 诉 你 ， 他 们 看 起 来 连 一 只 生 病 的 老 暴 龙 都 杀 不 了 。
	};

	AI_Output(self, other, "DIA_Udar_Kap4WiederDa_09_04"); //现 在 ， 我 们 中 的 很 多 人 都 十 分 担 忧 ， 而 且 不 再 相 信 我 们 有 办 法 活 着 离 开 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Sengrath
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_Sengrath(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 41;
	condition		= DIA_Udar_Sengrath_Condition;
	information		= DIA_Udar_Sengrath_Info;
	description		= "这 里 不 是 只 有 你 们 两 个 守 卫 吧 ？";
};

func int DIA_Udar_Sengrath_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Udar_Kap4WiederDa))
	&& (Sengrath_Missing == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Udar_Sengrath_Info()
{
	AI_Output(other, self, "DIA_Udar_Sengrath_15_00"); //这 里 不 是 只 有 你 们 两 个 守 卫 吧 ？
	AI_Output(self, other, "DIA_Udar_Sengrath_09_01"); //再 也 不 了 。 森 格 雷 斯 站 在 城 垛 上 ， 突 然 睡 着 了 。
	AI_Output(self, other, "DIA_Udar_Sengrath_09_02"); //当 他 睡 着 时 ， 他 那 把 优 良 的 弩 掉 了 下 去 。
	AI_Output(self, other, "DIA_Udar_Sengrath_09_03"); //我 们 只 能 看 着 一 个 兽 人 把 它 掠 了 去 消 失 在 黑 暗 之 中 。
	AI_Output(self, other, "DIA_Udar_Sengrath_09_04"); //森 格 雷 斯 当 时 就 醒 来 了 ， 他 在 黑 夜 里 一 直 跑 到 兽 人 的 木 栅 栏 那 里 。 从 那 以 后 他 就 没 有 再 回 来 。
	AI_Output(self, other, "DIA_Udar_Sengrath_09_05"); //英 诺 斯 与 我 们 同 在 ！

	Log_CreateTopic(TOPIC_Sengrath_Missing, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Sengrath_Missing, LOG_RUNNING);
	B_LogEntry(TOPIC_Sengrath_Missing, TOPIC_Sengrath_Missing_1);
};

///////////////////////////////////////////////////////////////////////
//	Info SENGRATHgefunden
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_SENGRATHGEFUNDEN(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 42;
	condition		= DIA_Udar_SENGRATHGEFUNDEN_Condition;
	information		= DIA_Udar_SENGRATHGEFUNDEN_Info;
	description		= "我 已 经 找 到 了 森 格 雷 斯 。";
};

func int DIA_Udar_SENGRATHGEFUNDEN_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Udar_Sengrath))
	&& (Npc_HasItems(other, ItRw_SengrathsArmbrust_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Udar_SENGRATHGEFUNDEN_Info()
{
	AI_Output(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_00"); //我 已 经 找 到 了 森 格 雷 斯 。
	AI_Output(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_01"); //真 的 吗 ？ 他 在 哪 里 ？
	AI_Output(other, self, "DIA_Udar_SENGRATHGEFUNDEN_15_02"); //他 死 了 ， 这 是 他 的 弩 。 他 把 它 带 在 身 边 。
	AI_Output(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_03"); //他 一 定 拿 回 了 他 的 弩 ， 但 是 ， 看 来 后 来 兽 人 还 是 凶 残 地 杀 害 了 他 。
	AI_Output(self, other, "DIA_Udar_SENGRATHGEFUNDEN_09_04"); //该 死 的 笨 蛋 。 我 知 道 ， 我 们 都 会 死 。

	TOPIC_END_Sengrath_Missing = TRUE;
	B_GivePlayerXP(XP_SengrathFound);
};

///////////////////////////////////////////////////////////////////////
//	Info BadFeeling
///////////////////////////////////////////////////////////////////////
instance DIA_Udar_BADFEELING(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 50;
	condition		= DIA_Udar_BADFEELING_Condition;
	information		= DIA_Udar_BADFEELING_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Udar_BADFEELING_Condition()
{
	if ((Npc_RefuseTalk(self) == FALSE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Udar_SENGRATHGEFUNDEN))
	&& (Kapitel >= 4))
	{
		return TRUE;
	};
};

func void DIA_Udar_BADFEELING_Info()
{
	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Udar_BADFEELING_09_00"); //再 来 一 次 那 样 的 偷 袭 之 后 ， 我 们 都 会 成 为 历 史 。
	}
	else if (MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self, other, "DIA_Udar_BADFEELING_09_01"); //兽 人 们 都 非 常 担 心 。 有 什 么 事 情 使 他 们 尝 到 了 恐 惧 的 痛 苦 。 我 能 感 觉 到 。
	}
	else
	{
		AI_Output(self, other, "DIA_Udar_BADFEELING_09_02"); //关 于 这 个 ， 我 有 一 个 非 常 不 好 的 感 觉 。
	};

	Npc_SetRefuseTalk(self, 30);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Udar_KAP5_EXIT(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 999;
	condition		= DIA_Udar_KAP5_EXIT_Condition;
	information		= DIA_Udar_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Udar_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Udar_KAP6_EXIT(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 999;
	condition		= DIA_Udar_KAP6_EXIT_Condition;
	information		= DIA_Udar_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Udar_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Udar_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Udar_PICKPOCKET(C_INFO)
{
	npc				= PAL_268_Udar;
	nr				= 900;
	condition		= DIA_Udar_PICKPOCKET_Condition;
	information		= DIA_Udar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Udar_PICKPOCKET_Condition()
{
	C_Beklauen(20, 15);
};

func void DIA_Udar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
	Info_AddChoice(DIA_Udar_PICKPOCKET, DIALOG_BACK, DIA_Udar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Udar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Udar_PICKPOCKET_DoIt);
};

func void DIA_Udar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};

func void DIA_Udar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Udar_PICKPOCKET);
};
