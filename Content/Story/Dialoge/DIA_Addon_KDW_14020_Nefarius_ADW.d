///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_ADW_EXIT(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 999;
	condition		= DIA_Addon_Nefarius_ADW_EXIT_Condition;
	information		= DIA_Addon_Nefarius_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Nefarius_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Nefarius_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 900;
	condition		= DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Nefarius_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Nefarius_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Nefarius_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Nefarius_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Nefarius_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Nefarius_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_ADWHello(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_ADWHello_Condition;
	information		= DIA_Addon_Nefarius_ADWHello_Info;
	important		= TRUE;
};

func int DIA_Addon_Nefarius_ADWHello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADWHello_Info()
{
	AI_Output(self, other, "DIA_Addon_Nefarius_ADWHello_05_00"); //看 到 你 安 然 无 恙 地 抵 达 这 里 ， 我 非 常 地 放 心 。
	AI_Output(other, self, "DIA_Addon_Nefarius_ADWHello_15_01"); //你 怎 么 会 比 我 先 到 这 里 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_ADWHello_05_02"); //我 们 通 过 一 种 奇 特 的 空 间 旅 行 。 谁 知 道 你 绕 了 多 少 路 。
	AI_Output(other, self, "DIA_Addon_Nefarius_ADWHello_15_03"); //那 现 在 呢 ？ 我 能 再 次 使 用 传 送 门 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_ADWHello_05_04"); //我 们 直 接 来 到 这 里 。 显 然 它 运 转 得 非 常 好 。
	AI_Output(self, other, "DIA_Addon_Nefarius_ADWHello_05_05"); //当 然 ， 如 果 我 怀 疑 它 可 能 有 些 不 同 的 时 候 ， 我 会 告 诉 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info Neues
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_Neues(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 5;
	condition		= DIA_Addon_Nefarius_Neues_Condition;
	information		= DIA_Addon_Nefarius_Neues_Info;
	description		= "到 目 前 为 止 ， 你 都 在 这 里 做 了 什 么 ？";
};

func int DIA_Addon_Nefarius_Neues_Condition()
{
	if (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_Neues_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Neues_15_00"); //到 目 前 为 止 ， 你 都 在 这 里 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_01"); //我 在 研 究 建 造 者 的 历 史 ， 并 试 图 弄 清 他 们 为 什 么 要 关 闭 传 送 门 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_02"); //看 来 他 们 好 像 用 了 很 大 的 精 力 来 把 沉 没 的 城 市 与 其 余 的 世 界 分 离 开 来 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_03"); //很 多 年 前 ， 这 里 发 生 了 可 怕 的 事 情 。 他 们 被 某 些 恐 怖 的 东 西 侵 袭 了 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_04"); //如 果 他 们 的 记 录 可 信 的 话 ， 在 城 市 毁 灭 前 ， 发 生 了 一 场 可 怕 的 内 战 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_05"); //街 道 被 火 焰 吞 噬 ， 洪 水 淹 没 了 一 切 ， 最 终 把 建 造 者 的 命 运 封 印 起 来 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_05_06"); //从 地 狱 中 逃 生 的 少 数 人 关 闭 了 岛 的 这 个 部 分 ， 希 望 能 把 混 乱 锁 住 。

	Info_ClearChoices(DIA_Addon_Nefarius_Neues);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, "我 认 为 我 们 能 在 这 里 找 到 什 么 ？", DIA_Addon_Nefarius_Neues_find);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, "我 们 这 些 傻 瓜 重 新 开 启 了 传 送 门 。", DIA_Addon_Nefarius_Neues_auf);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, "是 什 么 让 建 造 者 如 此 焦 虑 不 安 ？", DIA_Addon_Nefarius_Neues_was);
	Info_AddChoice(DIA_Addon_Nefarius_Neues, "你 是 说 有 过 洪 水 吗 ？", DIA_Addon_Nefarius_Neues_flut);
};

func void DIA_Addon_Nefarius_Neues_find()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Neues_find_15_00"); //我 认 为 我 们 能 在 这 里 找 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_find_05_01"); //我 只 能 推 测 出 那 些 。 你 应 该 同 萨 图 拉 斯 谈 谈 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_find_05_02"); //他 有 某 些 看 法 。

	Log_CreateTopic(TOPIC_Addon_Flut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Flut, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Flut, TOPIC_Addon_Flut_1);

	NefariusADW_Talk2Saturas = TRUE;
};

func void DIA_Addon_Nefarius_Neues_flut()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Neues_flut_15_00"); //你 是 说 有 过 洪 水 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_flut_05_01"); //亚 达 诺 斯 自 己 出 现 在 他 们 面 前 来 结 束 这 里 的 疯 狂 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_flut_05_02"); //他 把 城 市 夷 为 平 地 。
};

func void DIA_Addon_Nefarius_Neues_was()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Neues_was_15_00"); //是 什 么 让 建 造 者 如 此 焦 虑 不 安 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_was_05_01"); //他 们 中 有 人 投 身 邪 恶 。 他 是 一 个 伟 大 的 指 挥 官 ， 名 叫 夸 霍 德 隆 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_was_05_02"); //在 保 护 城 市 的 城 墙 之 外 ， 他 凯 旋 而 归 ， 邪 恶 与 他 一 起 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_was_05_03"); //在 保 护 城 市 的 城 墙 之 外 ， 他 凯 旋 而 归 ， 邪 恶 与 他 一 起 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_was_05_04"); //内 战 把 一 切 都 变 成 了 碎 石 。
};

func void DIA_Addon_Nefarius_Neues_auf()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_Neues_auf_15_00"); //我 们 这 些 傻 瓜 重 新 开 启 了 传 送 门 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_auf_05_01"); //我 对 两 者 都 不 喜 欢 ， 你 最 好 相 信 我 。
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_auf_05_02"); //但 是 我 们 有 什 么 选 择 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_Neues_auf_05_03"); //如 果 我 们 不 能 阻 止 发 生 在 这 里 的 事 ， 那 么 克 霍 里 尼 斯 将 会 遭 受 发 生 在 这 座 远 古 城 市 的 建 造 者 身 上 的 同 样 的 灾 难 。
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PermADW(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 10;
	condition		= DIA_Addon_Nefarius_PermADW_Condition;
	information		= DIA_Addon_Nefarius_PermADW_Info;
	permanent		= TRUE;
	description		= "穿 过 传 送 门 的 旅 程 安 全 吗 ？";
};

func int DIA_Addon_Nefarius_PermADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Nefarius_PermADW_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_PermADW_15_00"); //穿 过 传 送 门 的 旅 程 安 全 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_PermADW_05_01"); //到 目 前 为 之 ， 我 没 有 失 约 。
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Nefarius_PreTeach(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 99;
	condition		= DIA_Addon_Nefarius_PreTeach_Condition;
	information		= DIA_Addon_Nefarius_PreTeach_Info;
	description		= "你 能 把 你 关 于 魔 法 的 知 识 传 授 给 我 吗 ？";
};

func int DIA_Addon_Nefarius_PreTeach_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_PreTeach_Info()
{
	AI_Output(other, self, "DIA_Addon_Nefarius_PreTeach_15_00"); //你 能 把 你 关 于 魔 法 的 知 识 传 授 给 我 吗 ？
	AI_Output(self, other, "DIA_Addon_Nefarius_PreTeach_05_01"); //我 可 以 教 你 制 造 咒 语 ， 克 鲁 诺 斯 会 卖 给 你 符 文 的 配 方 。
	AI_Output(self, other, "DIA_Addon_Nefarius_PreTeach_05_02"); //他 总 是 把 他 的 咒 语 书 带 在 身 上 。

	Nefarius_Addon_TeachRunes = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_NefariusTeach);
};

//*********************************************
// Runen
//*********************************************
instance DIA_Addon_Nefarius_ADW_Runen(C_INFO)
{
	npc				= KDW_14020_Addon_Nefarius_ADW;
	nr				= 99;
	condition		= DIA_Addon_Nefarius_ADW_Runen_Condition;
	information		= DIA_Addon_Nefarius_ADW_Runen_Info;
	permanent		= TRUE;
	description		= "教 我 （ 制 造 咒 语 ）";
};

func int DIA_Addon_Nefarius_ADW_Runen_Condition()
{
	if (Nefarius_Addon_TeachRunes == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Nefarius_ADW_Runen_Info()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_6, DIA_Addon_Nefarius_ADW_Runen_6);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_5, DIA_Addon_Nefarius_ADW_Runen_5);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_4, DIA_Addon_Nefarius_ADW_Runen_4);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_3, DIA_Addon_Nefarius_ADW_Runen_3);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_2, DIA_Addon_Nefarius_ADW_Runen_2);
	};

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, NAME_LearnMage_1, DIA_Addon_Nefarius_ADW_Runen_1);
	};
};

//**********************************************************
// BACK
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_BACK()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
};

//**********************************************************
// Erster Kreis
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_1()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)), DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton);
	};

	if (PLAYER_TALENT_RUNES [SPL_LightHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_LightHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LightHeal)), DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_Zap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Zap, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Zap)), DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap);
	};

	if (PLAYER_TALENT_RUNES [SPL_Firebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Firebolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firebolt)), DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt);
	};

	if (PLAYER_TALENT_RUNES [SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_LIGHT, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LIGHT)), DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT);
	};
};

//**********************************************************
// Zweiter Kreis
// --------------------------
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_2()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_InstantFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_InstantFireball)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball);
	};

	if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Icebolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Icebolt)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt);
	};

	if (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_SummonWolf, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonWolf)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf);
	};

	if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_WINDFIST, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_WINDFIST)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST);
	};

	if (PLAYER_TALENT_RUNES [SPL_Sleep] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Sleep, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Sleep)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep);
	};

// ------------- Addon ----------------------

	if (PLAYER_TALENT_RUNES [SPL_Whirlwind] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Whirlwind, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Whirlwind)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind);
	};

	if (PLAYER_TALENT_RUNES [SPL_ICELANCE] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_ICELANCE, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ICELANCE)), DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE);
	};
};

//**********************************************************
// Dritter Kreis
// --------------------------
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_3()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_MediumHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_MediumHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_MediumHeal)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_ChargeZap] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_ChargeZap, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ChargeZap)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall);
	};

	if (PLAYER_TALENT_RUNES [SPL_Firestorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Firestorm, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firestorm)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm);
	};

	if (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_SummonSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonSkeleton)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton);
	};

	if (PLAYER_TALENT_RUNES [SPL_Fear] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Fear, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Fear)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear);
	};

	if (PLAYER_TALENT_RUNES [SPL_IceCube] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_IceCube, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_IceCube)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube);
	};

// ------------------ Addon -------------------

	if (PLAYER_TALENT_RUNES [SPL_Thunderstorm] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Thunderstorm, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Thunderstorm)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm);
	};

	if (PLAYER_TALENT_RUNES [SPL_Geyser] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Geyser, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Geyser)), DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser);
	};
};

//**********************************************************
// Vierter Kreis
// --------------------------
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_4()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_SummonGolem, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGolem)), DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem);
	};

	if (PLAYER_TALENT_RUNES [SPL_DestroyUndead] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_DestroyUndead, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_DestroyUndead)), DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead);
	};

	if (PLAYER_TALENT_RUNES [SPL_LightningFlash] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_LightningFlash, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_LightningFlash)), DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash);
	};

	if (PLAYER_TALENT_RUNES [SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_ChargeFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ChargeFireball)), DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball);
	};

	if (PLAYER_TALENT_RUNES [SPL_Waterfist] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Waterfist, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Waterfist)), DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist);
	};
};

//**********************************************************
// Fünfter Kreis
// --------------------------
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_5()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_IceWave] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_IceWave, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_IceWave)), DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave);
	};

	if (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_SummonDemon, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonDemon)), DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon);
	};

	if (PLAYER_TALENT_RUNES [SPL_FullHeal] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_FullHeal, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_FullHeal)), DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal);
	};

	if (PLAYER_TALENT_RUNES [SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Pyrokinesis, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Pyrokinesis)), DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis);
	};
};

//**********************************************************
// Sechster Kreis
// --------------------------
//**********************************************************
func void DIA_Addon_Nefarius_ADW_Runen_6()
{
	Info_ClearChoices(DIA_Addon_Nefarius_ADW_Runen);
	Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, DIALOG_BACK, DIA_Addon_Nefarius_ADW_Runen_BACK);

	if (PLAYER_TALENT_RUNES [SPL_Firerain] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Firerain, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Firerain)), DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain);
	};

	if (PLAYER_TALENT_RUNES [SPL_BreathOfDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_BreathOfDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_BreathOfDeath)), DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath);
	};

	if (PLAYER_TALENT_RUNES [SPL_MassDeath] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_MassDeath, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_MassDeath)), DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath);
	};

	if (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)), DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness);
	};

	if (PLAYER_TALENT_RUNES [SPL_Shrink] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Nefarius_ADW_Runen, B_BuildLearnString(NAME_SPL_Shrink, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Shrink)), DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink);
	};
};

// ##########################################################
//			LERNEN
// ##########################################################

//******** Kreis 1 **********
func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LIGHT()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LIGHT);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Firebolt()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_Zap()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Zap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_LightHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LightHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_1_SPL_SummonGoblinSkeleton()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGoblinSkeleton);
};

//******* Kreis 2 **********

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Whirlwind()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Whirlwind);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_ICELANCE()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ICELANCE);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_InstantFireball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_InstantFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Icebolt()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Icebolt);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_SummonWolf()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonWolf);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_WINDFIST()
{
	B_TeachPlayerTalentRunes(self, other, SPL_WINDFIST);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_2_SPL_Sleep()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Sleep);
};

//*********** Kreis 3 **********

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Thunderstorm()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Thunderstorm);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Geyser()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Geyser);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_MediumHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_MediumHeal);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonSkeleton);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Fear()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Fear);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_IceCube()
{
	B_TeachPlayerTalentRunes(self, other, SPL_IceCube);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_ThunderBall()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ChargeZap);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_3_SPL_Firestorm()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firestorm);
};

//************** Kreis 4 *********

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_LightningFlash()
{
	B_TeachPlayerTalentRunes(self, other, SPL_LightningFlash);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_ChargeFireball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ChargeFireball);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_Waterfist()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Waterfist);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_SummonGolem()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGolem);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_4_SPL_DestroyUndead()
{
	B_TeachPlayerTalentRunes(self, other, SPL_DestroyUndead);
};

//*********** Kreis 5 ************

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_Pyrokinesis()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Pyrokinesis);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_IceWave()
{
	B_TeachPlayerTalentRunes(self, other, SPL_IceWave);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_SummonDemon()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonDemon);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_5_SPL_FullHeal()
{
	B_TeachPlayerTalentRunes(self, other, SPL_FullHeal);
};

//************* Kreis 6 ************

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Firerain()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Firerain);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_BreathOfDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_BreathOfDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_MassDeath()
{
	B_TeachPlayerTalentRunes(self, other, SPL_MassDeath);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ArmyOfDarkness);
};

func void DIA_Addon_Nefarius_ADW_Runen_Circle_6_SPL_Shrink()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Shrink);
};
