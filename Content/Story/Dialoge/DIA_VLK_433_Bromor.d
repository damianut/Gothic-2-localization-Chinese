///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_EXIT(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 999;
	condition		= DIA_Bromor_EXIT_Condition;
	information		= DIA_Bromor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bromor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bromor_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GIRLS
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_GIRLS(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 2;
	condition		= DIA_Bromor_GIRLS_Condition;
	information		= DIA_Bromor_GIRLS_Info;
	description		= "是 你 经 营 这 个 地 方 吗 ？";
};

func int DIA_Bromor_GIRLS_Condition()
{
	if (NpcObsessedByDMT_Bromor == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Bromor_GIRLS_Info()
{
	// ADDON>
	AI_Output(other, self, "DIA_Addon_Bromor_GIRLS_15_00"); //是 你 经 营 这 个 地 方 吗 ？
	// ADDON<

	// AI_Output(other, self, "DIA_Bromor_GIRLS_15_00"); // Ich will mich amüsieren.
	// AI_Output(self, other, "DIA_Bromor_GIRLS_07_01"); // Deshalb bist du ja hergekommen.

	AI_Output(self, other, "DIA_Bromor_GIRLS_07_02"); //我 是 布 洛 摩 尔 。 这 是 我 的 房 子 ， 这 些 都 是 我 的 姑 娘 。 我 喜 欢 我 的 姑 娘 们 。
	AI_Output(self, other, "DIA_Bromor_GIRLS_07_03"); //如 果 你 也 喜 欢 我 的 姑 娘 ， 那 你 就 为 她 付 钱 - 5 0 个 金 币 。
	AI_Output(self, other, "DIA_Bromor_GIRLS_07_04"); //不 过 ， 别 想 在 这 里 惹 麻 烦 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_MissingPeople(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 2;
	condition		= DIA_Addon_Bromor_MissingPeople_Condition;
	information		= DIA_Addon_Bromor_MissingPeople_Info;
	description		= "你 所 有 的 女 孩 都 在 吗 ？";
};

func int DIA_Addon_Bromor_MissingPeople_Condition()
{
	if ((NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Bromor_GIRLS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Bromor_MissingPeople_15_00"); //你 所 有 的 女 孩 都 在 吗 ？
	AI_Output(self, other, "DIA_Addon_Bromor_MissingPeople_07_01"); //当 然 了 。还 是 你 以 为 我 想 因 为 这 种 事 进 监 狱 ?
	AI_Output(other, self, "DIA_Addon_Bromor_MissingPeople_15_02"); //（ 愤 怒 的 ） 嗯 … … 我 不 是 在 问 你 的 价 格 。 我 的 意 思 是 ， 她 们 都 在 场 吗 ? 或 者 有 人 失 踪 了 吗 ?
	AI_Output(self, other, "DIA_Addon_Bromor_MissingPeople_07_03"); //哦 。 是 这 样 啊 ， 我 们 这 里 的 确 有 一 个 姑 娘 失 踪 了 。 她 叫 露 西 亚 。
	AI_Output(self, other, "DIA_Addon_Bromor_MissingPeople_07_04"); //我 还 把 这 件 事 报 告 了 民 兵 。 但 是 他 们 说 还 没 有 找 到 她 的 踪 迹 。

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_8);
};

///////////////////////////////////////////////////////////////////////
//	Info Lucia
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_Lucia(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 5;
	condition		= DIA_Addon_Bromor_Lucia_Condition;
	information		= DIA_Addon_Bromor_Lucia_Info;
	description		= "露 西 亚 失 踪 多 久 了 ？";
};

func int DIA_Addon_Bromor_Lucia_Condition()
{
	if ((NpcObsessedByDMT_Bromor == FALSE)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Bromor_MissingPeople)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_Lucia_Info()
{
	AI_Output(other, self, "DIA_Addon_Bromor_Lucia_15_00"); //露 西 亚 失 踪 多 久 了 ？
	AI_Output(self, other, "DIA_Addon_Bromor_Lucia_07_01"); //好 几 天 了 。 我 不 确 定 有 多 久 。
	AI_Output(self, other, "DIA_Addon_Bromor_Lucia_07_02"); //我 猜 她 可 能 跟 她 的 一 个 追 求 者 私 奔 了 。
	AI_Output(self, other, "DIA_Addon_Bromor_Lucia_07_03"); //那 个 贱 人 偷 走 了 我 的 一 部 分 积 蓄 。 一 个 非 常 贵 重 的 金 盘 子 。
	AI_Output(self, other, "DIA_Addon_Bromor_Lucia_07_04"); //如 果 我 抓 到 了 她 ， 我 会 给 她 好 看 。
	AI_Output(self, other, "DIA_Addon_Bromor_Lucia_07_05"); //那 么 ， 那 事 和 你 有 什 么 关 系 吗 ？ 你 在 取 笑 我 吗 ， 还 是 别 的 什 么 ？

	Log_CreateTopic(TOPIC_Addon_BromorsGold, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BromorsGold, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BromorsGold, TOPIC_Addon_BromorsGold_2);

	MIS_Bromor_LuciaStoleGold = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info LuciaGold
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bromor_LuciaGold(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 5;
	condition		= DIA_Addon_Bromor_LuciaGold_Condition;
	information		= DIA_Addon_Bromor_LuciaGold_Info;
	permanent		= TRUE;
	description		= "我 找 到 了 那 个 露 西 亚 偷 走 的 盘 子 。";
};

func int DIA_Addon_Bromor_LuciaGold_Condition()
{
	if ((NpcObsessedByDMT_Bromor == FALSE)
	&& (MIS_Bromor_LuciaStoleGold == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_BromorsGeld_Addon)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bromor_LuciaGold_Info()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_15_00"); //我 找 到 了 那 个 露 西 亚 偷 走 的 盘 子 。
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_07_01"); //好 极 了 ！ 我 早 该 拿 回 它 了 。

	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if (Bromor_Hausverbot == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "那 么 报 酬 呢 ？", DIA_Addon_Bromor_LuciaGold_lohn);
	};

	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "给 你 盘 子 。", DIA_Addon_Bromor_LuciaGold_einfachgeben);
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "你 不 想 知 道 露 西 亚 发 生 了 什 么 事 ？", DIA_Addon_Bromor_LuciaGold_lucia);
	};
};

func void DIA_Addon_Bromor_LuciaGold_einfachgeben()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00"); //给 你 盘 子 。
	B_GiveInvItems(other, self, ItMi_BromorsGeld_Addon, 1);
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01"); //谢 谢 。 你 真 是 非 常 慷 慨 。 还 有 别 的 吗 ？
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};

var int DIA_Addon_Bromor_LuciaGold_lucia_OneTime;
func void DIA_Addon_Bromor_LuciaGold_lucia()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_lucia_15_00"); //你 不 想 知 道 露 西 亚 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_01"); //不 。 我 不 想 知 道 ，毕 竟 我 已 经 拿 回 了 那 个 盘 子 ， 不 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_lucia_07_02"); //到 现 在 为 止 ， 没 有 露 西 亚 我 也 应 付 过 去 了 ， 将 来 也 一 样 。 我 为 什 么 要 让 她 回 来 ？。
	DIA_Addon_Bromor_LuciaGold_lucia_OneTime = TRUE;
};

func void DIA_Addon_Bromor_LuciaGold_lohn()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_lohn_15_00"); //那 么 报 酬 呢 ？
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_lohn_07_01"); //你 可 以 跟 我 的 一 个 姑 娘 享 受 享 受 - 免 费 的 。 你 认 为 怎 么 样 ？

	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	if (DIA_Addon_Bromor_LuciaGold_lucia_OneTime == FALSE)
	{
		Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "你 不 想 知 道 露 西 亚 发 生 了 什 么 事 ？", DIA_Addon_Bromor_LuciaGold_lucia);
	};

	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "那 不 够 。", DIA_Addon_Bromor_LuciaGold_mehr);
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "成 交 。 给 你 盘 子 。", DIA_Addon_Bromor_LuciaGold_geben);
};

func void DIA_Addon_Bromor_LuciaGold_mehr()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_mehr_15_00"); //那 不 够 。
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_mehr_07_01"); //接 受 它 ， 否 则 你 不 用 再 出 现 在 这 附 近 。
	Info_AddChoice(DIA_Addon_Bromor_LuciaGold, "算 了 吧 。", DIA_Addon_Bromor_LuciaGold_nein);
};

func void DIA_Addon_Bromor_LuciaGold_nein()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_nein_15_00"); //算 了 吧 。
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_01"); //那 么 ， 马 上 离 开 我 的 地 盘 ， 你 这 个 混 蛋 。
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_nein_07_02"); //想 都 不 要 想 你 还 能 得 到 这 里 的 服 务 。
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
	Bromor_Hausverbot = TRUE;
	Bromor_Pay = 0;
};

func void DIA_Addon_Bromor_LuciaGold_geben()
{
	AI_Output(other, self, "DIA_Addon_Bromor_LuciaGold_geben_15_00"); //成 交 。 给 你 盘 子 。
	B_GiveInvItems(other, self, ItMi_BromorsGeld_Addon, 1);
	AI_Output(self, other, "DIA_Addon_Bromor_LuciaGold_geben_07_01"); //谢 谢 。 去 找 纳 德 加 。 她 会 在 楼 上 陪 你 。
	Bromor_Pay = 1;
	MIS_Bromor_LuciaStoleGold = LOG_SUCCESS;
	Bromor_Hausverbot = FALSE;
	B_GivePlayerXP(XP_Addon_Bromor_LuciaGold);
	Info_ClearChoices(DIA_Addon_Bromor_LuciaGold);
};

///////////////////////////////////////////////////////////////////////
//	Info bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Pay(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 2;
	condition		= DIA_Bromor_Pay_Condition;
	information		= DIA_Bromor_Pay_Info;
	permanent		= TRUE;
	description		= "我 想 找 乐 子 （ 付 ５ ０ 枚 金 币 ）";
};

func int DIA_Bromor_Pay_Condition()
{
	if ((Bromor_Pay == FALSE)
	&& (Bromor_Hausverbot == FALSE) // ADDON
	&& Npc_KnowsInfo(other, DIA_Bromor_GIRLS)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Npc_IsDead(Nadja) == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Bromor_Pay_OneTime;
func void DIA_Bromor_Pay_Info()
{
	AI_Output(other, self, "DIA_Bromor_Pay_15_00"); //我 想 找 一 些 乐 子 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 50))
	{
		AI_Output(self, other, "DIA_Bromor_Pay_07_01"); //好 的 。 （ 咧 着 嘴 笑 ） 很 快 ， 你 就 永 远 也 忘 不 了 生 命 中 接 下 来 的 几 个 小 时 了 。
		AI_Output(self, other, "DIA_Bromor_Pay_07_02"); //那 就 到 楼 上 去 找 纳 德 加 吧 。 玩 的 开 心 点 。

		if (DIA_Bromor_Pay_OneTime == FALSE)
		{
			DIA_Bromor_Pay_OneTime = TRUE;
		};

		Bromor_Pay = 1;
	}
	else
	{
		AI_Output(self, other, "DIA_Bromor_Pay_07_03"); //我 不 能 忍 受 别 人 糊 弄 我 。 如 果 你 没 有 钱 就 从 这 里 滚 出 去 。
	};

	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DOPE
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_DOPE(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 3;
	condition		= DIA_Bromor_DOPE_Condition;
	information		= DIA_Bromor_DOPE_Info;
	description		= "我 还 能 从 这 里 买 一 些 ‘ 特 殊 ’ 货 物 吗 ？";
};

func int DIA_Bromor_DOPE_Condition()
{
	if ((MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (Bromor_Hausverbot == FALSE)) // ADDON
	{
		return TRUE;
	};
};

func void DIA_Bromor_DOPE_Info()
{
	AI_Output(other, self, "DIA_Bromor_DOPE_15_00"); //我 还 能 从 这 里 买 一 些 ‘ 特 殊 ’ 货 物 吗 ？
	AI_Output(self, other, "DIA_Bromor_DOPE_07_01"); //当 然 ， 我 所 有 的 姑 娘 都 是 很 特 别 的 。 （ 咧 着 嘴 笑 ）
	AI_Output(self, other, "DIA_Bromor_DOPE_07_02"); //如 果 你 有 足 够 的 钱 ， 你 可 以 上 楼 去 找 纳 德 加 。
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Obsession(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 30;
	condition		= DIA_Bromor_Obsession_Condition;
	information		= DIA_Bromor_Obsession_Info;
	description		= "你 没 事 吧 ？";
};

func int DIA_Bromor_Obsession_Condition()
{
	if ((Kapitel >= 3)
	&& (NpcObsessedByDMT_Bromor == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int DIA_Bromor_Obsession_GotMoney;

func void DIA_Bromor_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Bromor_Heilung(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 55;
	condition		= DIA_Bromor_Heilung_Condition;
	information		= DIA_Bromor_Heilung_Info;
	permanent		= TRUE;
	description		= "你 被 附 体 了。";
};

func int DIA_Bromor_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Bromor == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Bromor_Heilung_Info()
{
	AI_Output(other, self, "DIA_Bromor_Heilung_15_00"); //你 被 附 体 了。
	AI_Output(self, other, "DIA_Bromor_Heilung_07_01"); //什 么 ？ 你 在 说 什 么 ？ 从 这 里 滚 出 去 。
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bromor_PICKPOCKET(C_INFO)
{
	npc				= VLK_433_Bromor;
	nr				= 900;
	condition		= DIA_Bromor_PICKPOCKET_Condition;
	information		= DIA_Bromor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 很 冒 险 ）";
};

func int DIA_Bromor_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKE_Bromor) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bromor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	Info_AddChoice(DIA_Bromor_PICKPOCKET, DIALOG_BACK, DIA_Bromor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bromor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bromor_PICKPOCKET_DoIt);
};

func void DIA_Bromor_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self, other, ItKE_Bromor, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bromor_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Bromor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bromor_PICKPOCKET);
};
