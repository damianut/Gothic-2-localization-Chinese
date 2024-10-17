///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_EXIT(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 999;
	condition		= DIA_Sergio_EXIT_Condition;
	information		= DIA_Sergio_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sergio_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sergio_EXIT_Info()
{
	if (Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500) // Nur wenn Sergio in der Kapelle ist M.F.
	{
		AI_Output(self, other, "DIA_Sergio_EXIT_04_00"); //愿 英 诺 斯 照 亮 你 的 路 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WELCOME
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WELCOME(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 5;
	condition		= DIA_Sergio_WELCOME_Condition;
	information		= DIA_Sergio_WELCOME_Info;
	important		= TRUE;
};

func int DIA_Sergio_WELCOME_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo(other, DIA_Sergio_Isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WELCOME_Info()
{
	AI_Output(self, other, "DIA_Sergio_WELCOME_04_00"); //英 诺 斯 与 你 同 在 ， 我 能 为 你 做 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Isgaroth
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Isgaroth(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 2;
	condition		= DIA_Sergio_Isgaroth_Condition;
	information		= DIA_Sergio_Isgaroth_Info;
	important		= TRUE;
};

func int DIA_Sergio_Isgaroth_Condition()
{
	if (Npc_KnowsInfo(hero, PC_PrayShrine_Paladine)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Isgaroth_Info()
{
	AI_Output(self, other, "DIA_Sergio_Isgaroth_04_00"); //你 已 经 为 我 的 同 胞 们 祈 祷 了 。 我 要 为 此 感 谢 你 。 告 诉 我 ， 我 能 为 你 做 什 么 。

	Info_ClearChoices(DIA_Sergio_Isgaroth);
	Info_AddChoice(DIA_Sergio_Isgaroth, "如 果 捐 赠 一 点 怎 么 样 ？", DIA_Sergio_Isgaroth_Spende);
	Info_AddChoice(DIA_Sergio_Isgaroth, "让 我 分 享 你 的 战 斗 经 验 。", DIA_Sergio_Isgaroth_XP);
};

func void DIA_Sergio_Isgaroth_Spende()
{
	AI_Output(other, self, "DIA_Sergio_Isgaroth_Spende_15_00"); //如 果 捐 赠 一 点 怎 么 样 ？
	AI_Output(self, other, "DIA_Sergio_Isgaroth_Spende_04_01"); //也 许 这 些 金 子 对 你 有 用 。

	B_GiveInvItems(self, other, ItMi_Gold, 100);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

func void DIA_Sergio_Isgaroth_XP()
{
	AI_Output(other, self, "DIA_Sergio_Isgaroth_XP_15_00"); //让 我 分 享 你 的 战 斗 经 验 。
	AI_Output(self, other, "DIA_Sergio_Isgaroth_XP_04_01"); //当 你 战 斗 时 ， 永 远 要 确 保 没 人 从 后 面 向 你 进 攻 。

	other.HitChance[NPC_TALENT_2H] = (other.HitChance[NPC_TALENT_2H] + 2);
	PrintScreen(PRINT_Learn2H, -1, -1, FONT_ScreenSmall, 2);
	Info_ClearChoices(DIA_Sergio_Isgaroth);
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Aufgabe(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 3;
	condition		= DIA_Sergio_Aufgabe_Condition;
	information		= DIA_Sergio_Aufgabe_Info;
	description		= "我 需 要 进 入 图 书 馆 。";
};

func int DIA_Sergio_Aufgabe_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& (Npc_KnowsInfo(other, DIA_Sergio_Isgaroth)))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Sergio_Aufgabe_15_00"); //我 需 要 进 入 图 书 馆 。
	AI_Output(self, other, "DIA_Sergio_Aufgabe_04_01"); //嗯 ， 我 不 能 给 你 通 行 权 。 因 为 你 必 须 先 履 行 你 的 任 务 。
	AI_Output(self, other, "DIA_Sergio_Aufgabe_04_02"); //但 我 可 以 帮 你 。 去 找 军 官 伊 斯 加 罗 斯 说 说 吧 。 我 听 说 他 需 要 帮 手 ， 本 来 我 想 去 - 但 是 我 把 这 份 差 事 交 给 你 。

	Sergio_Sends = TRUE;
	Wld_InsertNpc(BlackWolf, "NW_PATH_TO_MONASTER_AREA_01"); // ist richtig geschrieben!

	Log_CreateTopic(Topic_IsgarothWolf, LOG_MISSION);
	Log_SetTopicStatus(Topic_IsgarothWolf, LOG_RUNNING);
	B_LogEntry(Topic_IsgarothWolf, Topic_IsgarothWolf_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WHAT
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHAT(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 3;
	condition		= DIA_Sergio_WHAT_Condition;
	information		= DIA_Sergio_WHAT_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Sergio_WHAT_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHAT_Info()
{
	AI_Output(other, self, "DIA_Sergio_WHAT_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Sergio_WHAT_04_01"); //我 在 向 英 诺 斯 祈 求 使 我 的 躯 体 和 精 神 都 更 坚 强 。
	AI_Output(self, other, "DIA_Sergio_WHAT_04_02"); //那 么 ， 我 就 武 装 好 来 抵 抗 一 切 危 险 并 消 灭 他 所 有 的 敌 人 ， 为 他 增 添 荣 耀 。
	AI_Output(other, self, "DIA_Sergio_WHAT_15_03"); //什 么 敌 人 ？
	AI_Output(self, other, "DIA_Sergio_WHAT_04_04"); //所 有 违 抗 英 诺 斯 的 旨 意 的 人 。 无 论 它 们 是 人 类 还 是 被 召 唤 出 来 的 生 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info Babo
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Babo(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 3;
	condition		= DIA_Sergio_Babo_Condition;
	information		= DIA_Sergio_Babo_Info;
	description		= "你 能 和 白 波 进 行 一 些 练 习 吗 ？";
};

func int DIA_Sergio_Babo_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (other.guild == GIL_NOV)
	&& Npc_KnowsInfo(other, DIA_Babo_Anliegen))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Babo_Info()
{
	AI_Output(other, self, "DIA_Sergio_Babo_15_00"); //你 能 和 白 波 进 行 一 些 练 习 吗 ？
	AI_Output(self, other, "DIA_Sergio_Babo_04_01"); //为 什 么 他 不 亲 自 向 我 请 求 ？
	AI_Output(other, self, "DIA_Sergio_Babo_15_02"); //我 想 他 害 羞 。
	AI_Output(self, other, "DIA_Sergio_Babo_04_03"); //我 明 白 了 。 很 好 ， 如 果 这 对 他 的 意 义 如 此 重 大 ， 我 每 天 早 上 会 陪 他 训 练 两 小 时 。 我 们 五 点 钟 开 始 。 告 诉 他 。

	Npc_ExchangeRoutine(self, "TRAIN");
	B_StartOtherRoutine(Babo, "TRAIN");

	B_LogEntry(Topic_BaboTrain, Topic_BaboTrain_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WHY
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_WHY(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 4;
	condition		= DIA_Sergio_WHY_Condition;
	information		= DIA_Sergio_WHY_Info;
	description		= "你 为 什 么 不 和 其 它 圣 骑 士 一 起 呢 ？";
};

func int DIA_Sergio_WHY_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Sergio_WELCOME)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_WHY_Info()
{
	AI_Output(other, self, "DIA_Sergio_WHY_15_00"); //你 为 什 么 不 和 其 它 圣 骑 士 一 起 呢 ？
	AI_Output(self, other, "DIA_Sergio_WHY_04_01"); //我 在 这 里 也 许 显 得 不 太 寻 常 ， 不 过 ， 我 们 圣 骑 士 还 是 会 为 魔 法 师 服 务 ， 因 为 他 们 宣 扬 英 诺 斯 的 旨 意 。
	AI_Output(self, other, "DIA_Sergio_WHY_04_02"); //我 们 圣 骑 士 都 是 以 英 诺 斯 的 名 而 存 在 的 勇 士 。 他 的 旨 意 就 是 我 们 的 法 律 。 此 时 ， 我 正 在 等 待 着 魔 法 师 的 新 命 令 。
};

///////////////////////////////////////////////////////////////////////
//	Info ORDERS
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_ORDERS(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 10;
	condition		= DIA_Sergio_ORDERS_Condition;
	information		= DIA_Sergio_ORDERS_Info;
	permanent		= TRUE;
	description		= "你 已 经 有 了 新 的 命 令 ？";
};

func int DIA_Sergio_ORDERS_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Sergio_WHY)
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void DIA_Sergio_ORDERS_Info()
{
	AI_Output(other, self, "DIA_Sergio_ORDERS_15_00"); //你 已 经 有 了 新 的 命 令 ？
	AI_Output(self, other, "DIA_Sergio_ORDERS_04_01"); //到 那 时 我 仍 然 有 时 间 通 过 祈 祷 找 到 力 量 。
};

///////////////////////////////////////////////////////////////////////
//	Info Guide Start
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Start(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 10;
	condition		= DIA_Sergio_Start_Condition;
	information		= DIA_Sergio_Start_Info;
	description		= "你 要 护 送 我 到 关 卡 。";
};

func int DIA_Sergio_Start_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_MONASTERY_CHAPELL_02") <= 1500)
	&& (Sergio_Follow == TRUE)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Start_Info()
{
	AI_Output(other, self, "DIA_Sergio_Start_15_00"); //你 要 护 送 我 到 关 卡 。
	AI_Output(self, other, "DIA_Sergio_Start_04_01"); //好 的 ， 那 么 我 会 那 么 做 。 我 认 识 路 ， 跟 我 走 。

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NpcType_Friend;
	Npc_ExchangeRoutine(self, "GUIDE");
};

///////////////////////////////////////////////////////////////////////
//	Info Guide Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Guide(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 10;
	condition		= DIA_Sergio_Guide_Condition;
	information		= DIA_Sergio_Guide_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Sergio_Guide_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Guide_Info()
{
	AI_Output(other, self, "DIA_Sergio_Guide_15_00"); //怎 么 样 了 ？
	AI_Output(self, other, "DIA_Sergio_Guide_04_01"); //我 会 带 你 到 关 卡 。 但 危 险 的 旅 程 从 那 里 才 刚 刚 开 始 。
	AI_Output(self, other, "DIA_Sergio_Guide_04_02"); //但 我 们 不 要 浪 费 时 间 。 我 们 必 须 启 程 了 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Guide Ende
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Ende(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 2;
	condition		= DIA_Sergio_Ende_Condition;
	information		= DIA_Sergio_Ende_Info;
	important		= TRUE;
};

func int DIA_Sergio_Ende_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Ende_Info()
{
	AI_Output(self, other, "DIA_Sergio_Ende_04_00"); //我 们 到 了 。 无 论 是 什 么 在 矿 藏 山 谷 里 等 着 你 ， 我 都 希 望 你 能 找 到 回 来 的 路 。
	AI_Output(other, self, "DIA_Sergio_Ende_15_01"); //不 要 怕 - 我 会 回 来 的 。
	AI_Output(self, other, "DIA_Sergio_Ende_04_02"); //与 英 诺 斯 同 行 。 愿 他 永 远 庇 佑 你 。

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "START");
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sergio_Perm(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 2;
	condition		= DIA_Sergio_Perm_Condition;
	information		= DIA_Sergio_Perm_Info;
	important		= TRUE;
};

func int DIA_Sergio_Perm_Condition()
{
	if ((Kapitel >= 3)
	&& (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sergio_Perm_Info()
{
	if (other.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Sergio_Perm_04_00"); //为 了 英 诺 斯 ， 兄 弟 。 如 果 你 是 来 了 解 关 于 神 圣 化 剑 的 事 ， 那 就 去 问 马 杜 克 。
	}
	else
	{
		AI_Output(self, other, "DIA_Sergio_Perm_04_01"); //我 听 说 过 你 。 你 是 来 自 农 场 的 朋 友 ， 曾 去 过 矿 藏 山 谷 。 我 向 你 致 敬 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sergio_PICKPOCKET(C_INFO)
{
	npc				= PAL_299_Sergio;
	nr				= 900;
	condition		= DIA_Sergio_PICKPOCKET_Condition;
	information		= DIA_Sergio_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Sergio_PICKPOCKET_Condition()
{
	C_Beklauen(78, 85);
};

func void DIA_Sergio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
	Info_AddChoice(DIA_Sergio_PICKPOCKET, DIALOG_BACK, DIA_Sergio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sergio_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sergio_PICKPOCKET_DoIt);
};

func void DIA_Sergio_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};

func void DIA_Sergio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sergio_PICKPOCKET);
};
