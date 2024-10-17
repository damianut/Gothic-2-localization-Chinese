// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_MiltenOW_EXIT(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 999;
	condition		= DIA_MiltenOW_EXIT_Condition;
	information		= DIA_MiltenOW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MiltenOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  		Hallo
// ************************************************************
instance DIA_MiltenOW_Hello(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= TRUE;
	condition		= DIA_MiltenOW_Hello_Condition;
	information		= DIA_MiltenOW_Hello_Info;
	important		= TRUE;
};

func int DIA_MiltenOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_MiltenOW_Hello_Info()
{
	AI_Output(self, other, "DIA_MiltenOW_Hello_03_00"); //看 看 谁 回 来 了 ！ 从 屏 障 里 出 来 的 英 雄 ！

	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, "见 到 你 真 好 ， 米 尔 腾 。", DIA_MiltenOW_Hello_YES);
	Info_AddChoice(DIA_MiltenOW_Hello, "我 认 识 你 吗 ？", DIA_MiltenOW_Hello_NO);
};

// ------------------------------------
func void B_Milten_GornDiegoLester()
{
	AI_Output(self, other, "DIA_MiltenOW_Hello_NO_03_02"); //你 还 记 得 戈 恩 、 迪 雅 戈 和 莱 斯 特 吗 ？
};

// ------------------------------------

func void DIA_MiltenOW_Hello_YES()
{
	AI_Output(other, self, "DIA_MiltenOW_Hello_YES_15_00"); //见 到 你 真 好 ， 米 尔 腾 。 你 是 一 直 就 在 这 里 ， 还 是 又 到 这 里 来 了 ？
	AI_Output(self, other, "DIA_MiltenOW_Hello_YES_03_01"); //又 来 了 。 屏 障 崩 溃 之 后 我 进 入 了 火 魔 法 师 修 道 院 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_YES_03_02"); //但 是 很 显 然 ， 圣 骑 士 要 我 来 这 里 ， 我 的 经 验 和 对 这 个 地 方 的 了 解 程 度 都 十 分 有 用 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_YES_03_03"); //所 以 ， 他 们 当 时 就 决 定 委 任 我 一 项 神 圣 的 使 命 ， 为 这 次 远 征 提 供 魔 法 支 持 。
	B_Milten_GornDiegoLester();

	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, "当 然 我 记 得 那 些 孩 子 。 ", DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello, "那 些 名 字 根 本 没 能 让 我 想 起 任 何 东 西 。", DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_NO()
{
	AI_Output(other, self, "DIA_MiltenOW_Hello_NO_15_00"); //我 应 该 认 识 他 们 吗 ？
	AI_Output(self, other, "DIA_MiltenOW_Hello_NO_03_01"); //你 经 历 了 不 少 事 情 ， 是 吗 ？
	B_Milten_GornDiegoLester();

	Info_ClearChoices(DIA_MiltenOW_Hello);
	Info_AddChoice(DIA_MiltenOW_Hello, "当 然 我 记 得 那 些 孩 子 。 ", DIA_MiltenOW_Hello_Friends);
	Info_AddChoice(DIA_MiltenOW_Hello, "那 些 名 字 根 本 没 能 让 我 想 起 任 何 东 西 。", DIA_MiltenOW_Hello_Forget);
};

func void DIA_MiltenOW_Hello_Friends()
{
	AI_Output(other, self, "DIA_MiltenOW_Hello_Friends_15_00"); //当 然 我 记 得 那 些 孩 子 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_Friends_03_01"); //嗯 ， 戈 恩 和 迪 雅 戈 没 走 远 。 他 们 在 山 谷 这 里 被 圣 骑 士 逮 捕 了 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_Friends_03_02"); //可 是 莱 斯 特 消 失 了 - 我 不 知 道 他 在 哪 里 闲 逛 。

	if (Npc_KnowsInfo(other, DIA_Lester_Hello))
	{
		AI_Output(other, self, "DIA_MiltenOW_Hello_Friends_15_03"); //我 碰 到 莱 斯 特 了 - 他 现 在 跟 艾 克 萨 达 斯 在 一 起 。
		AI_Output(self, other, "DIA_MiltenOW_Hello_Friends_03_04"); //至 少 有 个 好 消 息 。
	};

	AI_Output(self, other, "DIA_MiltenOW_Hello_Friends_03_05"); //嗯 ， 我 没 有 什 么 值 得 报 告 的 高 兴 事 。

	Knows_Diego = TRUE;
	Info_ClearChoices(DIA_MiltenOW_Hello);
};

func void DIA_MiltenOW_Hello_Forget()
{
	AI_Output(other, self, "DIA_MiltenOW_Hello_Forget_15_00"); //那 些 名 字 根 本 没 能 让 我 想 起 任 何 东 西 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_Forget_03_01"); //你 忘 了 很 多 事 ， 是 吗 ？ 好 吧 ， 我 们 把 过 去 放 在 一 边 ， 专 心 于 当 前 吧 。
	AI_Output(self, other, "DIA_MiltenOW_Hello_Forget_03_02"); //即 使 没 有 什 么 值 得 报 告 的 高 兴 事 。

	Info_ClearChoices(DIA_MiltenOW_Hello);
};

// ************************************************************
// 		Bericht
// ************************************************************
instance DIA_MiltenOW_Bericht(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 3;
	condition		= DIA_MiltenOW_Bericht_Condition;
	information		= DIA_MiltenOW_Bericht_Info;
	description		= "那么有什么可报告的呢?";
};

func int DIA_MiltenOW_Bericht_Condition()
{
	if (Npc_KnowsInfo(other, DIA_MiltenOW_Hello))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Bericht_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Bericht_15_00"); //那么有什么可报告的呢?
	AI_Output(self, other, "DIA_MiltenOW_Bericht_03_01"); //圣 骑 士 来 这 里 的 目 的 是 拿 走 魔 法 矿 石 。
	AI_Output(self, other, "DIA_MiltenOW_Bericht_03_02"); //但 是 ， 有 了 龙 的 袭 击 和 那 些 兽 人 - 我 无 法 想 象 圣 骑 士 能 带 上 矿 石 离 开 这 里 。
	AI_Output(self, other, "DIA_MiltenOW_Bericht_03_03"); //不 ， 以 英 诺 斯 的 名 义 - 我 感 觉 某 些 黑 暗 … … 某 些 邪 恶 的 势 力 正 在 壮 大 。 有 某 些 东 西 从 这 个 山 谷 中 散 发 出 来 。
	AI_Output(self, other, "DIA_MiltenOW_Bericht_03_04"); //我 们 用 了 高 昂 的 代 价 换 取 了 沉 睡 者 的 覆 没 。 同 样 ， 屏 障 的 毁 灭 也 已 经 毁 了 这 个 地 方 。
	AI_Output(self, other, "DIA_MiltenOW_Bericht_03_05"); //如 果 我 们 这 次 还 能 活 着 的 话 ， 就 应 该 感 到 万 幸 。
};

// ************************************************************
// 		Erz
// ************************************************************
instance DIA_MiltenOW_Erz(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 4;
	condition		= DIA_MiltenOW_Erz_Condition;
	information		= DIA_MiltenOW_Erz_Info;
	description		= "到 目 前 为 止 你 一 共 储 藏 了 多 少 矿 石 ？";
};

func int DIA_MiltenOW_Erz_Condition()
{
	if (Npc_KnowsInfo(other, DIA_MiltenOW_Bericht))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Erz_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Erz_15_00"); //到 目 前 为 止 你 一 共 储 藏 了 多 少 矿 石 ？
	AI_Output(self, other, "DIA_MiltenOW_Erz_03_01"); //多 少 矿 石 … … ？ 不 是 一 箱 ！ 我 们 有 一 阵 子 没 跟 矿 工 联 系 了 。
	AI_Output(self, other, "DIA_MiltenOW_Erz_03_02"); //如 果 他 们 都 已 经 死 了 很 久 的 话 ， 我 也 不 会 觉 得 奇 怪 。 我 们 遭 到 了 龙 的 攻 击 ， 而 且 还 被 兽 人 包 围 着 ！
	AI_Output(self, other, "DIA_MiltenOW_Erz_03_03"); //这 次 远 征 是 一 次 彻 底 的 灾 难 。
};

/*
Diesen Blick kenne ich, den hattest Du auch kurz bevor Du in den Schläfertempel gegangen bist.
*/
// ************************************************************
// 		Wo sind Gorn und Diego?
// ************************************************************
instance DIA_MiltenOW_Wo(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Wo_Condition;
	information		= DIA_MiltenOW_Wo_Info;
	description		= "现 在 戈 恩 和 迪 雅 戈 在 哪 里 ？";
};

func int DIA_MiltenOW_Wo_Condition()
{
	if (Npc_KnowsInfo(other, DIA_MiltenOW_Hello)
	&& (Knows_Diego == TRUE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Wo_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Wo_Forget_15_00"); //现 在 戈 恩 和 迪 雅 戈 在 哪 里 ？
	AI_Output(self, other, "DIA_MiltenOW_Wo_Forget_03_01"); //嗯 ， 戈 恩 正 坐 在 地 牢 里 - 因 为 他 拒 捕 。
	AI_Output(self, other, "DIA_MiltenOW_Wo_Forget_03_02"); //他 们 派 迪 雅 戈 去 了 一 个 矿 工 队 伍 - 去 问 问 圣 骑 士 帕 西 沃 ， 是 他 组 织 的 这 个 队 伍 。

	KnowsAboutGorn = TRUE;
	SearchForDiego = LOG_RUNNING;
};

// ************************************************************
// 		Gorn befreien
// ************************************************************
instance DIA_MiltenOW_Gorn(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Gorn_Condition;
	information		= DIA_MiltenOW_Gorn_Info;
	description		= "我 们 一 起 去 救 戈 恩 ！";
};

func int DIA_MiltenOW_Gorn_Condition()
{
	if ((KnowsAboutGorn == TRUE)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Gorn_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Gorn_15_00"); //我 们 一 起 去 救 戈 恩 ！
	AI_Output(self, other, "DIA_MiltenOW_Gorn_03_01"); //好 吧 ， 这 件 事 的 问 题 是 戈 恩 是 个 有 罪 在 身 的 囚 犯 。
	AI_Output(self, other, "DIA_MiltenOW_Gorn_03_02"); //但 是 ， 如 果 幸 运 的 话 ， 加 隆 德 会 同 意 做 个 交 易 ， 我 们 就 能 买 到 他 的 自 由 了 。
	AI_Output(other, self, "DIA_MiltenOW_Gorn_15_03"); //是 的 ， 也 许 吧 … …
	AI_Output(self, other, "DIA_MiltenOW_Gorn_03_04"); //告 诉 我 基 本 情 况 。

	Log_CreateTopic(TOPIC_RescueGorn, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RescueGorn, LOG_RUNNING);
	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_8);
};

// ************************************************************
// 		Garond will tausend Goldstücke
// ************************************************************
instance DIA_MiltenOW_Preis(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Preis_Condition;
	information		= DIA_MiltenOW_Preis_Info;
	description		= "加 隆 德 索 要 １ ０ ０ ０ 金 币 保 释 戈 恩 。";
};

func int DIA_MiltenOW_Preis_Condition()
{
	if ((MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Preis_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Preis_15_00"); //加 隆 德 索 要 １ ０ ０ ０ 金 币 保 释 戈 恩 。
	AI_Output(self, other, "DIA_MiltenOW_Preis_03_01"); //一 个 不 错 的 数 目 。 我 可 以 拿 出250个 金 币 。

	B_GiveInvItems(self, other, Itmi_gold, 250);
	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_9);
};

// ************************************************************
// 		Nicht genug Gold
// ************************************************************
instance DIA_MiltenOW_Mehr(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Mehr_Condition;
	information		= DIA_MiltenOW_Mehr_Info;
	description		= "我 需 要 更 多 的 金 币 来 换 取 戈 恩 的 自 由 。";
};

func int DIA_MiltenOW_Mehr_Condition()
{
	if ((MIS_RescueGorn == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (Npc_HasItems(other, ItMi_Gold) < 1000)
	&& Npc_KnowsInfo(other, DIA_MiltenOW_Preis))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mehr_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Mehr_15_00"); //我 需 要 更 多 的 金 币 来 换 取 戈 恩 的 自 由 。
	AI_Output(self, other, "DIA_MiltenOW_Mehr_03_01"); //弄 到 更 多 的 金 子 … … 嗯 。 关 于 这 件 事 ， 迪 雅 戈 知 道 很 多 - 但 他 不 在 这 里 。
	AI_Output(self, other, "DIA_MiltenOW_Mehr_03_02"); //也 许 戈 恩 亲 自 把 一 些 金 子 藏 在 什 么 地 方 了 - 我 们 应 该 弄 清 楚 。
	AI_Output(self, other, "DIA_MiltenOW_Mehr_03_03"); //我 会 给 他 写 个 字 条 - 给 ， 想 办 法 把 它 偷 送 到 地 牢 里 去 。

	B_GiveInvItems(self, other, ItWr_LetterForGorn_MIS, 1);
	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_10);
};

// ************************************************************
// 		Ausrüstung
// ************************************************************
instance DIA_MiltenOW_Equipment(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Equipment_Condition;
	information		= DIA_MiltenOW_Equipment_Info;
	description		= "你 能 给 我 一 些 装 备 吗 ？";
};

func int DIA_MiltenOW_Equipment_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garond_Equipment)
	&& (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Equipment_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Equipmentt_15_00"); //你 能 给 我 一 些 装 备 吗 ？ 加 隆 德 要 我 去 矿 场 。
	AI_Output(self, other, "DIA_MiltenOW_Equipment_03_01"); //我 去 哪 里 找 这 些 ？ 我 唯 一 可 以 给 你 的 是 一 块 珍 贵 的 咒 语 石 。
	// AI_Output(self,other,"DIA_MiltenOW_Equipmentt_03_02");// Hier stehen zwar noch ein paar Truhen rum, aber ich kann die Schlösser nicht öffnen.

	B_GiveInvItems(self, other, ItMI_RuneBlank, 1);
	// Schlüssel auf FP inserten
};

//***********************
//	Gorns Versteck
//***********************
instance DIA_MiltenOW_Versteck(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 1;
	condition		= DIA_MiltenOW_Versteck_Condition;
	information		= DIA_MiltenOW_Versteck_Info;
	description		= "我 一 个 来 自 戈 恩 的 回 答 … … ";
};

func int DIA_MiltenOW_Versteck_Condition()
{
	if ((GornsTreasure == TRUE)
	&& (Npc_HasItems(other, ItMi_GornsTreasure_MIS) <= 0)
	&& (Gorns_Beutel == FALSE)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Versteck_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Versteck_15_00"); //我 从 戈 恩 那 里 得 到 了 回 信 。 他 说 金 子 在 南 门 那 里 。
	AI_Output(self, other, "DIA_MiltenOW_Versteck_03_01"); //（ 痛 苦 的 ） 你 是 说 以 前 的 南 门 。 它 已 经 被 龙 踏 成 了 一 堆 烂 石 头 。
	AI_Output(other, self, "DIA_MiltenOW_Versteck_15_02"); //我 怎 样 才 能 到 那 里 ？
	AI_Output(self, other, "DIA_MiltenOW_Versteck_03_03"); //那 里 靠 近 兽 人 的 破 城 锤 。 南 门 就 在 它 右 边 。
	AI_Output(self, other, "DIA_MiltenOW_Versteck_03_04"); //那 不 会 很 容 易 - 所 以 一 定 要 注 意 别 被 发 现 ， 并 且 要 快 。

	B_LogEntry(TOPIC_RescueGorn, TOPIC_RescueGorn_11);
};

// ************************************************************
// 		Gorn ist frei
// ************************************************************
instance DIA_MiltenOW_Frei(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 5;
	condition		= DIA_MiltenOW_Frei_Condition;
	information		= DIA_MiltenOW_Frei_Info;
	description		= "我 已 经 释 放 了 戈 恩 。";
};

func int DIA_MiltenOW_Frei_Condition()
{
	if ((MIS_RescueGorn == LOG_SUCCESS)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Frei_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Frei_15_00"); //我 已 经 释 放 了 戈 恩 。
	AI_Output(self, other, "DIA_MiltenOW_Frei_03_01"); //好 的 。 那 么 我 们 应 该 想 想 接 下 来 发 生 的 事 。
};

// ************************************************************
// 		Lehren
// ************************************************************
instance DIA_MiltenOW_Lehren(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 9;
	condition		= DIA_MiltenOW_Lehren_Condition;
	information		= DIA_MiltenOW_Lehren_Info;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_MiltenOW_Lehren_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Lehren_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Lehren_15_00"); //你 能 教 我 一 些 东 西 吗 ？
	AI_Output(self, other, "DIA_MiltenOW_Lehren_03_01"); //我 可 以 教 你 一 些 第 二 个 魔 法 环 的 魔 法 ， 或 者 我 能 帮 你 增 加 魔 法 能 力 。
	AI_Output(self, other, "DIA_MiltenOW_Lehren_03_02"); //如 果 你 觉 得 已 经 准 备 好 要 增 加 能 力 的 时 候 ， 我 就 指 导 你 。
};

// ************************************************************
// 		Teach zweiter Kreis
// ************************************************************
instance DIA_MiltenOW_TeachCircle2(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 91;
	condition		= DIA_MiltenOW_TeachCircle2_Condition;
	information		= DIA_MiltenOW_TeachCircle2_Info;
	permanent		= TRUE;
	description		= "教 我 第 二 环 魔 法 ！";
};

func int DIA_MiltenOW_TeachCircle2_Condition()
{
	if ((other.guild == GIL_KDF)
	&& (Npc_KnowsInfo(other, DIA_MiltenOW_Lehren))
	&& (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_TeachCircle2_Info()
{
	AI_Output(other, self, "DIA_Milten_Add_15_00"); //教 我 第 二 环 魔 法 ！
	AI_Output(self, other, "DIA_Milten_Add_03_01"); //通 常 ， 这 是 我 们 修 道 会 的 老 师 的 特 权 。
	AI_Output(self, other, "DIA_Milten_Add_03_02"); //但 我 想 ， 这 一 次 ， 我 们 可 以 破 个 例 … …

	if (B_TeachMagicCircle(self, other, 2))
	{
		AI_Output(self, other, "DIA_Milten_Add_03_03"); //我 不 知 道 我 是 否 完 全 记 得 正 式 的 经 文 … …
		AI_Output(self, other, "DIA_Milten_Add_03_04"); //马 上 进 入 第 二 个 环 。 嗯 … … 它 将 为 你 指 示 方 向 - 但 是 你 的 行 为 形 成 道 路 - 或 者 沿 线 的 某 些 东 西 … …
		AI_Output(self, other, "DIA_Milten_Add_03_05"); //我 想 你 明 白 这 是 怎 么 回 事 … …
	};
};

// ************************************************************
// 		Teach
// ************************************************************
instance DIA_MiltenOW_Teach(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 90;
	condition		= DIA_MiltenOW_Teach_Condition;
	information		= DIA_MiltenOW_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 一 些 新 的 魔 法 。";
};

func int DIA_MiltenOW_Teach_Condition()
{
	if ((other.guild == GIL_KDF)
	&& Npc_KnowsInfo(other, DIA_MiltenOW_Lehren)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Teach_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Teach_15_00"); //我 想 要 学 习 一 些 新 的 魔 法 。

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenOW_Teach);
		Info_AddChoice(DIA_MiltenOW_Teach, DIALOG_BACK, DIA_MiltenOW_Teach_BACK);

		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach, B_BuildLearnString(NAME_SPL_WINDFIST, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_WINDFIST)), DIA_MiltenOW_Teach_Windfist);
		};

		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach, B_BuildLearnString(NAME_SPL_InstantFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_InstantFireball)), DIA_MiltenOW_Teach_Feuerball);
		};

		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
		{
			Info_AddChoice(DIA_MiltenOW_Teach, B_BuildLearnString(NAME_SPL_Icebolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Icebolt)), DIA_MiltenOW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenOW_Teach_03_01"); //你 还 没 有 到 达 第 二 个 魔 法 环 。 我 什 么 也 教 不 了 你 。
	};
};

func void DIA_MiltenOW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_Teach);
};

func void DIA_MiltenOW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes(self, other, SPL_WINDFIST);
};

func void DIA_MiltenOW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_InstantFireball);
};

func void DIA_MiltenOW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Icebolt);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenOW_Mana(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 100;
	condition		= DIA_MiltenOW_Mana_Condition;
	information		= DIA_MiltenOW_Mana_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 魔 法 能 力 。";
};

func int DIA_MiltenOW_Mana_Condition()
{
	if ((other.guild == GIL_KDF)
	&& Npc_KnowsInfo(other, DIA_MiltenOW_Lehren)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Mana_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Mana_15_00"); //我 想 要 增 强 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_MiltenOW_Mana);
	Info_AddChoice(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self, other, "DIA_MiltenOW_Mana_03_00"); //你 的 魔 法 能 力 非 常 强 大 。 强 大 得 让 我 无 法 再 帮 你 增 强 它 。
	};

	Info_ClearChoices(DIA_MiltenOW_Mana);
};

func void DIA_MiltenOW_Mana_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MED);

	Info_ClearChoices(DIA_MiltenOW_Mana);

	Info_AddChoice(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenOW_Mana_5);
};

func void DIA_MiltenOW_Mana_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MED);

	Info_ClearChoices(DIA_MiltenOW_Mana);

	Info_AddChoice(DIA_MiltenOW_Mana, DIALOG_BACK, DIA_MiltenOW_Mana_BACK);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenOW_Mana_1);
	Info_AddChoice(DIA_MiltenOW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenOW_Mana_5);
};

// ************************************************************
// 		Perm
// ************************************************************
instance DIA_MiltenOW_Perm(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 101;
	condition		= DIA_MiltenOW_Perm_Condition;
	information		= DIA_MiltenOW_Perm_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 做 什 么 工 作 ？";
};

func int DIA_MiltenOW_Perm_Condition()
{
	if ((Kapitel == 2)
	&& (Npc_KnowsInfo(other, DIA_MiltenOW_Frei) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Perm_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Perm_15_00"); //你 在 这 里 有 什 么 任 务 ？
	AI_Output(self, other, "DIA_MiltenOW_Perm_03_01"); //最 初 ， 我 本 应 该 对 魔 法 矿 石 进 行 化 验 。 但 至 今 我 们 也 没 有 多 少 矿 石 。
	AI_Output(self, other, "DIA_MiltenOW_Perm_03_02"); //现 在 ， 我 正 在 潜 心 研 究 炼 金 术 。
};

// ************************************************************
// 		Perm 2
// ************************************************************
instance DIA_MiltenOW_Plan(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 101;
	condition		= DIA_MiltenOW_Plan_Condition;
	information		= DIA_MiltenOW_Plan_Info;
	permanent		= TRUE;
	description		= "你 的 计 划 是 什 么 ？";
};

func int DIA_MiltenOW_Plan_Condition()
{
	if ((Kapitel == 2)
	&& Npc_KnowsInfo(other, DIA_MiltenOW_Frei))
	{
		return TRUE;
	};
};

func void DIA_MiltenOW_Plan_Info()
{
	AI_Output(other, self, "DIA_MiltenOW_Plan_15_00"); //你 的 计 划 是 什 么 ？
	AI_Output(self, other, "DIA_MiltenOW_Plan_03_01"); //我 该 回 去 了 。 我 会 等 一 会 儿 ， 但 现 在 戈 恩 自 由 了 ， 我 可 以 跟 他 一 起 出 发 了 。
	AI_Output(self, other, "DIA_MiltenOW_Plan_03_02"); //很 有 必 要 让 皮 罗 卡 知 道 这 里 的 情 形 。
	AI_Output(other, self, "DIA_MiltenOW_Plan_15_03"); //如 果 你 这 么 认 为 的 话 。
	AI_Output(self, other, "DIA_MiltenOW_Plan_03_04"); //我 希 望 哈 根 勋 爵 将 会 意 识 到 从 这 个 山 谷 里 散 发 出 来 的 威 胁 。 如 果 兽 人 越 过 关 卡 开 始 进 攻 ， 不 用 想 都 知 道 将 会 发 生 什 么 事 。
	AI_Output(other, self, "DIA_MiltenOW_Plan_15_05"); //好 吧 ， 那 么 ， 一 路 平 安 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_MiltenOW_PICKPOCKET(C_INFO)
{
	npc				= PC_Mage_OW;
	nr				= 888;
	condition		= DIA_MiltenOW_PICKPOCKET_Condition;
	information		= DIA_MiltenOW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 要 偷 他 的 药 剂 很 难 ）";
};

func int DIA_MiltenOW_PICKPOCKET_Condition()
{
	if ((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == TRUE)
	&& (other.attribute[ATR_DEXTERITY] >= (80 - TheftDiff)))
	{
		return 1;
	};
};

func void DIA_MiltenOW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
	Info_AddChoice(DIA_MiltenOW_PICKPOCKET, DIALOG_BACK, DIA_MiltenOW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_MiltenOW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_MiltenOW_PICKPOCKET_DoIt);
};

func void DIA_MiltenOW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self, ItPo_Perm_Mana, 1);
		B_GiveInvItems(self, other, ItPo_Perm_Mana, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_MiltenOW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_MiltenOW_PICKPOCKET);
};
