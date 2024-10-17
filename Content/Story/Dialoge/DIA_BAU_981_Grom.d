///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_EXIT(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 999;
	condition		= DIA_Grom_EXIT_Condition;
	information		= DIA_Grom_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Grom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grom_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_HALLO(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 3;
	condition		= DIA_Grom_HALLO_Condition;
	information		= DIA_Grom_HALLO_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Grom_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Grom_HALLO_Info()
{
	AI_Output(other, self, "DIA_Grom_HALLO_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Grom_HALLO_08_01"); //啊 ， 一 个 陌 生 的 流 浪 者 。 我 非 常 忙 ， 所 以 你 想 要 做 什 么 ？

	Info_ClearChoices(DIA_Grom_HALLO);
	Info_AddChoice(DIA_Grom_HALLO, "这 里 能 看 到 什 么 有 趣 的 事 ？", DIA_Grom_HALLO_waszusehen);
	Info_AddChoice(DIA_Grom_HALLO, "你 在 这 里 干 什 么 ？", DIA_Grom_HALLO_was);
};

func void DIA_Grom_HALLO_waszusehen()
{
	AI_Output(other, self, "DIA_Grom_HALLO_waszusehen_15_00"); //这 里 能 看 到 什 么 有 趣 的 事 ？
	AI_Output(self, other, "DIA_Grom_HALLO_waszusehen_08_01"); //好 奇 是 一 种 动 力 。 如 果 你 从 这 里 进 入 树 林 深 处 的 话 ， 你 会 遇 到 一 些 十 分 邪 恶 的 家 伙 。
	AI_Output(self, other, "DIA_Grom_HALLO_waszusehen_08_02"); //他 们 大 约 有 十 英 尺 高 ， 长 毛 ， 脾 气 暴 躁 。 所 以 如 果 你 不 比 它 们 更 强 壮 的 话 ， 不 要 去 那 里 。
};

func void DIA_Grom_HALLO_was()
{
	AI_Output(other, self, "DIA_Grom_HALLO_was_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Grom_HALLO_was_08_01"); //嗯 ， 木 匠 和 猎 人 常 做 的 事 情 。
	Info_AddChoice(DIA_Grom_HALLO, DIALOG_BACK, DIA_Grom_HALLO_BACK);
};

func void DIA_Grom_HALLO_BACK()
{
	Info_ClearChoices(DIA_Grom_HALLO);
};

// ************************************************************
// 			  			  ASK TEACHER
// ************************************************************
instance DIA_Grom_AskTeacher(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 10;
	condition		= DIA_Grom_AskTeacher_Condition;
	information		= DIA_Grom_AskTeacher_Info;
	description		= "你 能 教 我 有 关 狩 猎 的 技 能 吗 ？";
};

func int DIA_Grom_AskTeacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Grom_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Grom_AskTeacher_Info()
{
	AI_Output(other, self, "DIA_Grom_AskTeacher_15_00"); //你 能 教 我 有 关 狩 猎 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Grom_AskTeacher_08_01"); //当 然 。 但 是 首 先 给 我 找 一 些 象 样 的 东 西 吃 。 我 在 这 里 已 经 快 饿 死 了 。
	AI_Output(self, other, "DIA_Grom_AskTeacher_08_02"); //我 想 要 一 瓶 牛 奶 ， 一 条 面 包 和 一 块 肥 美 的 火 腿 ， 然 后 我 就 会 教 你 你 想 要 学 的 东 西 。
	Log_CreateTopic(TOPIC_GromAskTeacher, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GromAskTeacher, LOG_RUNNING);
	B_LogEntry(TOPIC_GromAskTeacher, TOPIC_GromAskTeacher_1);
};

// ************************************************************
// 			  			  PAY TEACHER
// ************************************************************
instance DIA_Grom_PayTeacher(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 11;
	condition		= DIA_Grom_PayTeacher_Condition;
	information		= DIA_Grom_PayTeacher_Info;
	description		= "这 是 你 要 的 食 物 。";
};

func int DIA_Grom_PayTeacher_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Grom_AskTeacher))
	&& (Npc_HasItems(other, Itfo_Milk))
	&& (Npc_HasItems(other, Itfo_Bread))
	&& (Npc_HasItems(other, Itfo_Bacon)))
	{
		return TRUE;
	};
};

func void DIA_Grom_PayTeacher_Info()
{
	B_GiveInvItems(other, self, Itfo_Milk, 1);
	B_GiveInvItems(other, self, Itfo_Bread, 1);
	B_GiveInvItems(other, self, Itfo_Bacon, 1);
	AI_Output(other, self, "DIA_Grom_PayTeacher_15_00"); //这 是 你 要 的 食 物 。
	AI_Output(self, other, "DIA_Grom_PayTeacher_08_01"); //妙 极 了 。 现 在 ？
	Grom_TeachAnimalTrophy = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachHunting
///////////////////////////////////////////////////////////////////////
instance DIA_Grom_TEACHHUNTING(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 12;
	condition		= DIA_Grom_TEACHHUNTING_Condition;
	information		= DIA_Grom_TEACHHUNTING_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 狩 猎 。";
};

func int DIA_Grom_TEACHHUNTING_Condition()
{
	if (Grom_TeachAnimalTrophy == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Grom_TEACHHUNTING_Info()
{
	AI_Output(other, self, "DIA_Grom_TEACHHUNTING_15_00"); //教 我 如 何 狩 猎 。
	if (
	(PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	)
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_08_01"); //你 想 要 学 什 么 ？

		Info_AddChoice(DIA_Grom_TEACHHUNTING, DIALOG_BACK, DIA_Grom_TEACHHUNTING_BACK);

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_FUR, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)), DIA_Grom_TEACHHUNTING_Fur);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_TEETH, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Grom_TEACHHUNTING_Teeth);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Heart] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_HEARTS, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Heart)), DIA_Grom_TEACHHUNTING_Heart);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Mandibles] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_MANDIBLES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Mandibles)), DIA_Grom_TEACHHUNTING_Mandibles);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
		{
			Info_AddChoice(DIA_Grom_TEACHHUNTING, B_BuildLearnString(NAME_LEARN_SHADOWBEAST_HORN, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)), DIA_Grom_TEACHHUNTING_ShadowHorn);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_08_02"); //我 不 能 教 你 任 何 你 还 不 会 的 东 西 。
	};
};

func void DIA_Grom_TEACHHUNTING_BACK()
{
	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Fur()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur))
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_Fur_08_00"); //在 动 物 的 腿 上 划 开 一 个 口 子 ， 从 那 里 把 皮 肤 撕 开 。 要 从 前 向 后 ， 不 要 向 其 它 方 向 。
	};

	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth))
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_Teeth_08_00"); //在 拔 下 牙 齿 时 ， 必 须 特 别 小 心 ， 在 把 它 们 从 头 骨 上 弄 下 来 时 不 要 折 断 。
	};

	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Heart()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Heart))
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_Heart_08_00"); //在 动 物 的 胸 口 熟 练 地 下 刀 ， 然 后 把 心 脏 取 出 。 但 是 这 只 能 用 于 一 些 特 殊 的 动 物 和 魔 法 物 种 。
	};

	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_Mandibles()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Mandibles))
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_Mandibles_08_00"); //矿 井 爬 行 者 和 旷 野 袭 击 者 的 颌 骨 必 须 使 用 非 常 坚 硬 的 金 属 棒 才 能 撬 下 。 它 们 深 深 地 嵌 合 在 头 骨 中 。
	};

	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ------ Fell abziehen ------
func void DIA_Grom_TEACHHUNTING_ShadowHorn()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_ShadowHorn))
	{
		AI_Output(self, other, "DIA_Grom_TEACHHUNTING_ShadowHorn_08_00"); //要 取 下 影 兽 的 角 ， 你 必 须 用 全 身 的 力 气 抵 住 它 的 头 骨 ， 拉 住 它 的 角 ， 然 后 用 一 把 硬 刀 将 它 割 下 。
	};

	Info_ClearChoices(DIA_Grom_TEACHHUNTING);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Grom_PICKPOCKET(C_INFO)
{
	npc				= BAU_981_Grom;
	nr				= 900;
	condition		= DIA_Grom_PICKPOCKET_Condition;
	information		= DIA_Grom_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Grom_PICKPOCKET_Condition()
{
	C_Beklauen(75, 40);
};

func void DIA_Grom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
	Info_AddChoice(DIA_Grom_PICKPOCKET, DIALOG_BACK, DIA_Grom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grom_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Grom_PICKPOCKET_DoIt);
};

func void DIA_Grom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};

func void DIA_Grom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grom_PICKPOCKET);
};
