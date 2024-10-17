///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Haupttorwache_EXIT(C_INFO)
{
	npc				= VLK_4143_HaupttorWache;
	nr				= 999;
	condition		= DIA_Haupttorwache_EXIT_Condition;
	information		= DIA_Haupttorwache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Haupttorwache_AUFGABE(C_INFO)
{
	npc				= VLK_4143_HaupttorWache;
	nr				= 4;
	condition		= DIA_Haupttorwache_AUFGABE_Condition;
	information		= DIA_Haupttorwache_AUFGABE_Info;
	permanent		= TRUE;
	description		= "你 的 工 作 是 什 么 ？";
};

func int DIA_Haupttorwache_AUFGABE_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_AUFGABE_Info()
{
	AI_Output(other, self, "DIA_Haupttorwache_AUFGABE_15_00"); //你 的 工 作 是 什 么 ？
	AI_Output(self, other, "DIA_Haupttorwache_AUFGABE_13_01"); //我 的 工 作 很 简 单 。 我 必 须 确 保 兽 人 呆 在 离 城 门 3 0 英 尺 以 外 的 地 方 。
	AI_Output(self, other, "DIA_Haupttorwache_AUFGABE_13_02"); //如 果 他 们 试 图 冲 入 闸 门 ， 我 就 拉 响 警 报 。 就 是 这 样 。
};

///////////////////////////////////////////////////////////////////////
//	Info Toroeffnen
///////////////////////////////////////////////////////////////////////
instance DIA_Haupttorwache_TOROEFFNEN(C_INFO)
{
	npc				= VLK_4143_HaupttorWache;
	nr				= 5;
	condition		= DIA_Haupttorwache_TOROEFFNEN_Condition;
	information		= DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent		= TRUE;
	description		= "如 果 有 人 要 想 打 开 主 大 门 的 话 ， 他 要 做 什 么 ？";
};

func int DIA_Haupttorwache_TOROEFFNEN_Condition()
{
	if (Kapitel >= 5)
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_TOROEFFNEN_Info()
{
	AI_Output(other, self, "DIA_Haupttorwache_TOROEFFNEN_15_00"); //如 果 有 人 要 想 打 开 主 大 门 的 话 ， 他 要 做 什 么 ？
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_13_01"); //天 啊 。你 为 什 么 想 知 道 这 个 ?

	self.flags = 0; // Joly:zur sicherheit

	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN, "我 担 心 城 堡 的 安 全 。", DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN, "别 担 心 。 只 是 问 问 。", DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_sicherheit()
{
	AI_Output(other, self, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00"); //我 担 心 城 堡 的 安 全 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01"); //我 一 直 是 这 样 ， 相 信 我 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02"); //因 为 我 是 极 其 忠 诚 的 守 卫 者 ， 加 隆 德 终 于 把 城 门 房 间 的 钥 匙 委 托 给 我 保 管 了 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03"); //（ 自 豪 的 ） 这 是 个 伟 大 的 责 任 。 我 将 好 好 保 卫 它 ， 我 曾 经 向 加 隆 德 发 过 誓 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04"); //是 的 。 不 可 想 像要 是 哪 个 人 拉 动 控 制 杆 打 开 了 大 门 ， 随 后 那 生 锈 的 旧 铁 栅 栏 被 卡 住 了 会 怎 么 样 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05"); //那 时 ， 就 没 有 人 能 关 上 那 扇 大 门 了 。 我 不 能 想 像接 下 来 会 发 生 什 么 事 情 。 没 有 人 知 道 我 有 钥 匙 ， 这 可 是 件 好 事 。
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other, self, "DIA_Haupttorwache_TOROEFFNEN_frage_15_00"); //别 担 心 。 只 是 问 问 。
	AI_Output(self, other, "DIA_Haupttorwache_TOROEFFNEN_frage_13_01"); //不 要 把 这 些 事 说 出 来 惹 麻 烦 。 这 样 的 日 子 已 经 够 难 过 的 了 。 马 上 走 吧 。 我 很 忙 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Haupttorwache_PICKPOCKET(C_INFO)
{
	npc				= VLK_4143_HaupttorWache;
	nr				= 900;
	condition		= DIA_Haupttorwache_PICKPOCKET_Condition;
	information		= DIA_Haupttorwache_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 有 如 儿 戏 ）";
};

func int DIA_Haupttorwache_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ITKE_OC_MAINGATE_MIS) >= 1)
	&& (Kapitel >= 5)
	&& (other.attribute[ATR_DEXTERITY] >= (20 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET, DIALOG_BACK, DIA_Haupttorwache_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Haupttorwache_PICKPOCKET_DoIt);
};

func void DIA_Haupttorwache_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 20)
	{
		B_GiveInvItems(self, other, ITKE_OC_MAINGATE_MIS, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1);
	};
};

func void DIA_Haupttorwache_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
};
