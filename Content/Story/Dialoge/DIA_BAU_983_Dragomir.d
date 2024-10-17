// ***********************************************************
// 							EXIT
// ***********************************************************
instance DIA_Dragomir_EXIT(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 999;
	condition		= DIA_Dragomir_EXIT_Condition;
	information		= DIA_Dragomir_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragomir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***********************************************************
// 							Hello
// ***********************************************************
instance DIA_Dragomir_Hello(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 1;
	condition		= DIA_Dragomir_Hello_Condition;
	information		= DIA_Dragomir_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragomir_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragomir_Hello_12_00"); //从 家 里 长 途 旅 行 过 来 ？
	AI_Output(self, other, "DIA_Dragomir_Hello_12_01"); //在 这 里 你 一 定 要 小 心 ， 尤 其 是 当 你 一 个 人 的 时 候 。
};

// ***********************************************************
// 							OutHere
// ***********************************************************
instance DIA_Dragomir_OutHere(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_OutHere_Condition;
	information		= DIA_Dragomir_OutHere_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Dragomir_OutHere_Condition()
{
	return TRUE;
};

func void DIA_Dragomir_OutHere_Info()
{
	AI_Output(other, self, "DIA_Dragomir_OutHere_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Dragomir_OutHere_12_01"); //嗯 ， 酒 馆 对 我 来 说 太 贵 了 ， 所 以 我 才 在 这 里 安 家 。
	AI_Output(self, other, "DIA_Dragomir_OutHere_12_02"); //以 前 的 居 住 者 看 来 不 再 需 要 它 了 。
};

// ***********************************************************
// 							OutHere
// ***********************************************************
instance DIA_Dragomir_Settlers(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_Settlers_Condition;
	information		= DIA_Dragomir_Settlers_Info;
	description		= "以 前 谁 住 在 这 个 营 地 ？";
};

func int DIA_Dragomir_Settlers_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Settlers_Info()
{
	AI_Output(other, self, "DIA_Dragomir_Settlers_15_00"); //以 前 谁 住 在 这 个 营 地 ？
	AI_Output(self, other, "DIA_Dragomir_Settlers_12_01"); //不 知 道 ， 也 许 是 猎 人 。 我 想 这 里 对 他 们 来 说 太 危 险 了 。
};

// ***********************************************************
// 							Dangerous
// ***********************************************************
instance DIA_Dragomir_Dangerous(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_Dangerous_Condition;
	information		= DIA_Dragomir_Dangerous_Info;
	description		= "这 里 不 是 非 常 危 险 吗 ？";
};

func int DIA_Dragomir_Dangerous_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragomir_OutHere))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Dangerous_Info()
{
	AI_Output(other, self, "DIA_Dragomir_Dangerous_15_00"); //这 里 不 是 非 常 危 险 吗 ？
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_01"); //嗯 ， 如 果 你 能 自 保 的 话 就 不 会 。 我 的 弩 已 经 多 次 发 挥 了 作 用 。
	AI_Output(other, self, "DIA_Dragomir_Dangerous_15_02"); //它 并 没 有 那 么 大 。
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_03"); //如 果 你 知 道 如 何 使 用 它 的 话 ， 它 是 致 命 的 。 以 前 我 有 一 个 更 大 的 。 不 幸 的 是 ， 我 把 它 丢 了 。
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_04"); //我 向 北 边 的 山 区 走 得 太 远 了 。 那 里 有 一 个 巨 大 的 石 圈 ， 还 有 一 个 祭 坛 。
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_05"); //当 我 在 那 里 捕 猎 尖 嘴 鸟 时 ， 这 些 邪 恶 的 亡 灵 生 物 从 树 林 蹿 里 出 来 ， 并 向 我 攻 击 。
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_06"); //我 能 做 的 只 有 逃 命。
	AI_Output(self, other, "DIA_Dragomir_Dangerous_12_07"); //在 我 逃 走 的 时 候 ， 弩 从 我 手 上 滑 落 了 。 我 肯 定 它 还 在 北 边 那 个 奇 怪 的 石 头 圈 附 近 。

	Log_CreateTopic(TOPIC_DragomirsArmbrust, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragomirsArmbrust, LOG_RUNNING);
	B_LogEntry(TOPIC_DragomirsArmbrust, TOPIC_DragomirsArmbrust_1);

	MIS_DragomirsArmbrust = LOG_RUNNING;
};

// ***********************************************************
// 							Armbrust
// ***********************************************************
instance DIA_Dragomir_Armbrust(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_Armbrust_Condition;
	information		= DIA_Dragomir_Armbrust_Info;
	description		= "给 你 。 我 找 到 了 你 的 弩 。";
};

func int DIA_Dragomir_Armbrust_Condition()
{
	if ((MIS_DragomirsArmbrust == LOG_RUNNING)
	&& (Npc_HasItems(other, ItRw_DragomirsArmbrust_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Armbrust_Info()
{
	AI_Output(other, self, "DIA_Dragomir_Armbrust_15_00"); //给 你 。 我 找 到 了 你 的 弩 。
	B_GiveInvItems(other, self, ItRw_DragomirsArmbrust_MIS, 1);
	AI_Output(self, other, "DIA_Dragomir_Armbrust_12_01"); //这 真 是 我 的 。 不 要 对 我 说 你 去 了 石 头 圈 那 里 ？ 。
	AI_Output(other, self, "DIA_Dragomir_Armbrust_15_02"); //毫 无 疑 问 ！
	AI_Output(self, other, "DIA_Dragomir_Armbrust_12_03"); //你 相 当 鲁 莽 。 但 是 还 要 谢 谢 你 。
	AI_Output(self, other, "DIA_Dragomir_Armbrust_12_04"); //自 然 ， 我 要 报 答 这 种 行 为 。 我 希 望 这 些 能 够 。

	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);
	MIS_DragomirsArmbrust = LOG_SUCCESS;
	B_GivePlayerXP(XP_DragomirsArmbrust);
};

// ***********************************************************
// 							Kannst du mir was beibringen?
// ***********************************************************

// ---------------------------------------
var int Dragomir_TeachPlayer;
const int Dragomir_TeachingCost = 150;
// ---------------------------------------
instance DIA_Dragomir_Learn(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_Learn_Condition;
	information		= DIA_Dragomir_Learn_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Dragomir_Learn_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dragomir_Dangerous))
	&& (Dragomir_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Learn_Info()
{
	AI_Output(other, self, "DIA_Dragomir_Learn_15_00"); //你 能 教 我 什 么 吗 ？

	if (other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self, other, "DIA_Dragomir_Learn_12_01"); //在 我 教 你 东 西 之 前 ， 你 必 须 要 增 加 你 的 敏 捷 。
	}
	else
	{
		AI_Output(self, other, "DIA_Dragomir_Learn_12_02"); //如 果 你 能 付 钱 的 话 。 如 我 所 说 ， 现 在 我 有 点 缺 钱 。
		AI_Output(other, self, "DIA_Dragomir_Learn_15_03"); //你 想 要 多 少 ？
		B_Say_Gold(self, other, Dragomir_TeachingCost);

		Info_ClearChoices(DIA_Dragomir_Learn);
		Info_AddChoice(DIA_Dragomir_Learn, "以 后 再 说 。", DIA_Dragomir_Learn_Later);
		if (Npc_HasItems(other, ItMi_Gold) >= Dragomir_TeachingCost)
		{
			Info_AddChoice(DIA_Dragomir_Learn, "这 是 给 你 的 金 币 。", DIA_Dragomir_Learn_Here);
		};
	};
};

func void DIA_Dragomir_Learn_Later()
{
	AI_Output(other, self, "DIA_Dragomir_Learn_Later_15_00"); //也 许 以 后 吧 。
	Info_ClearChoices(DIA_Dragomir_Learn);
};

func void DIA_Dragomir_Learn_Here()
{
	AI_Output(other, self, "DIA_Dragomir_Learn_Here_15_00"); //这 是 你 的 金 币。
	B_GiveInvItems(other, self, ItMi_Gold, Dragomir_TeachingCost);
	AI_Output(self, other, "DIA_Dragomir_Learn_Here_12_01"); //好 ， 只 要 告 诉 我 ， 我 们 可 以 马 上 开 始 。

	Dragomir_TeachPlayer = TRUE;
	Info_ClearChoices(DIA_Dragomir_Learn);
};

// ***********************************************************
// 							Teach
// ***********************************************************

// ------------------------------------------------------------
var int DIA_Dragomir_Teach_permanent;
// ------------------------------------------------------------
instance DIA_Dragomir_Teach(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 2;
	condition		= DIA_Dragomir_Teach_Condition;
	information		= DIA_Dragomir_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 一 些 技 能 。";
};

func int DIA_Dragomir_Teach_Condition()
{
	if ((Dragomir_TeachPlayer == TRUE)
	&& (DIA_Dragomir_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dragomir_Teach_Info()
{
	AI_Output(other, self, "DIA_Dragomir_Teach_15_00"); //教 我 一 些 技 能 。

	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach, DIALOG_BACK, DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1) * 5), DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self, other, "DIA_Dragomir_Teach_12_00"); //我 教 不 了 你 什 么 东 西 了 。 你 应 该 去 找 其 它 老 师 。
		DIA_Dragomir_Teach_permanent = TRUE;
	};

	Info_ClearChoices(DIA_Dragomir_Teach);
};

func void DIA_Dragomir_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 75);

	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach, DIALOG_BACK, DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1) * 5), DIA_Dragomir_Teach_1H_5);
};

func void DIA_Dragomir_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 75);

	Info_ClearChoices(DIA_Dragomir_Teach);
	Info_AddChoice(DIA_Dragomir_Teach, DIALOG_BACK, DIA_Dragomir_Teach_Back);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Dragomir_Teach_1H_1);
	Info_AddChoice(DIA_Dragomir_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1) * 5), DIA_Dragomir_Teach_1H_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Dragomir_PICKPOCKET(C_INFO)
{
	npc				= BAU_983_Dragomir;
	nr				= 900;
	condition		= DIA_Dragomir_PICKPOCKET_Condition;
	information		= DIA_Dragomir_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Dragomir_PICKPOCKET_Condition()
{
	C_Beklauen(47, 70);
};

func void DIA_Dragomir_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET, DIALOG_BACK, DIA_Dragomir_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dragomir_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Dragomir_PICKPOCKET_DoIt);
};

func void DIA_Dragomir_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};

func void DIA_Dragomir_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dragomir_PICKPOCKET);
};
