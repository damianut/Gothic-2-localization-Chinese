///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_EXIT(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 999;
	condition		= DIA_Kati_EXIT_Condition;
	information		= DIA_Kati_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kati_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SLDnochda
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_SLDNOCHDA(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 4;
	condition		= DIA_Kati_SLDNOCHDA_Condition;
	information		= DIA_Kati_SLDNOCHDA_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Kati_SLDNOCHDA_Condition()
{
	if (!(Npc_IsDead(Alvares))
	&& !(Npc_IsDead(Engardo))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Kati_SLDNOCHDA_Info()
{
	// --------------------------------------
	var int Hilfe;
	// --------------------------------------

	if (Hilfe == FALSE)
	{
		AI_Output(self, other, "DIA_Kati_SLDNOCHDA_16_00"); //那 些 杀 人 犯 在 威 胁 我 的 丈 夫 ！ 我 们 是 镇 上 的 市 民 ， 忠 于 国 王 ， 而 那 些 雇 佣 兵 打 算 要 抢 劫 我 们 ！
		Hilfe = TRUE;
	};

	AI_Output(self, other, "DIA_Kati_SLDNOCHDA_16_01"); //现 在 你 不 要 只 是 站 在 那 里 。 做 点 什 么 ！ 帮 帮 我 们 。
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HALLO(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 5;
	condition		= DIA_Kati_HALLO_Condition;
	information		= DIA_Kati_HALLO_Info;
	description		= "你 没 事 吧 ？";
};

func int DIA_Kati_HALLO_Condition()
{
	if ((Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Kati_HALLO_Info()
{
	AI_Output(other, self, "DIA_Kati_HALLO_15_00"); //你 没 事 吧 ？

	if (Npc_IsDead(Akil))
	{
		AI_Output(self, other, "DIA_Kati_HALLO_16_01"); //（ 呜 咽 ） 我 心 爱 的 丈 夫 死 了 ！ 哦 ， 英 诺 斯 ， 你 为 什 么 要 这 么 严 厉 地 惩 罚 我 ？

		Npc_ExchangeRoutine(self, "Start");
		B_StartOtherRoutine(Randolph, "Start");

		B_GivePlayerXP(XP_Akil_Tot);
	}
	else
	{
		AI_Output(self, other, "DIA_Kati_HALLO_16_02"); //是 的 ， 我 很 好 。 谢 谢 你 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Essen
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ESSEN(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 12;
	condition		= DIA_Kati_ESSEN_Condition;
	information		= DIA_Kati_ESSEN_Info;
	description		= "阿 基 尔 说 你 给 我 做 了 饭 。";
};

func int DIA_Kati_ESSEN_Condition()
{
	if ((Kati_Mahlzeit == TRUE)
	&& ((Npc_IsDead(Akil)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_ESSEN_Info()
{
	AI_Output(other, self, "DIA_Kati_ESSEN_15_00"); //阿 基 尔 说 你 给 我 做 了 饭 。
	AI_Output(self, other, "DIA_Kati_ESSEN_16_01"); //自 从 屏 障 崩 溃 之 后 ， 我 们 经 历 了 相 当 困 难 的 时 期 ， 这 片 大 地 不 再 安 全 了 。
	AI_Output(self, other, "DIA_Kati_ESSEN_16_02"); //这 是 一 条 面 包 ， 一 点 肉 和 一 些 水 。 恐 怕 那 是 我 能 分 给 你 的 所 有 东 西 了 。

	B_GiveInvItems(self, other, ItFo_Bread, 1);
	B_GiveInvItems(self, other, ItFo_Water, 1);
	B_GiveInvItems(self, other, ItFoMutton, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Akil ist tot Kati ist der Ersatz
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_Baltram(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 4;
	condition		= DIA_Kati_Baltram_Condition;
	information		= DIA_Kati_Baltram_Info;
	description		= "贝 尔 卓 姆 派 我 来 … … ";
};

func int DIA_Kati_Baltram_Condition()
{
	if ((Npc_IsDead(Akil))
	&& (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&& (Lieferung_Geholt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Kati_Baltram_Info()
{
	AI_Output(other, self, "DIA_Kati_Baltram_15_00"); //贝 尔 卓 姆 派 我 来 的 。 我 要 帮 他 取 一 件 货 物 。
	AI_Output(self, other, "DIA_Kati_Baltram_16_01"); //是 的 ， 当 然 。 给 ， 我 已 经 把 它 包 好 了 。
	CreateInvItems(self, ItMi_BaltramPaket, 1);
	B_GiveInvItems(self, other, ItMi_BaltramPaket, 1);
	Lieferung_Geholt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Bauernaufstand
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_BAUERNAUFSTAND(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 6;
	condition		= DIA_Kati_BAUERNAUFSTAND_Condition;
	information		= DIA_Kati_BAUERNAUFSTAND_Info;
	description		= "你 为 什 么 不 保 护 自 己 、 抵 抗 欧 纳 尔 的 专 制 ？";
};

func int DIA_Kati_BAUERNAUFSTAND_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_BAUERNAUFSTAND_Info()
{
	AI_Output(other, self, "DIA_Kati_BAUERNAUFSTAND_15_00"); //你 为 什 么 不 保 护 自 己 、 抵 抗 欧 纳 尔 的 专 制 ？
	AI_Output(self, other, "DIA_Kati_BAUERNAUFSTAND_16_01"); //对 于 我 们 这 些 靠 近 城 市 的 农 民 来 说 ， 我 们 没 法 指 望 欧 纳 尔 的 雇 佣 兵 ， 当 然 亲 近 城 里 的 民 兵 是 更 加 合 理 的 想 法 。
	AI_Output(self, other, "DIA_Kati_BAUERNAUFSTAND_16_02"); //另 一 方 面 ， 本 加 和 塞 柯 布 宁 愿 放 弃 他 们 的 农 场 ， 也 不 愿 给 国 王 工 作 。
};

///////////////////////////////////////////////////////////////////////
//	Info AndereHoefe
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_ANDEREHOEFE(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 7;
	condition		= DIA_Kati_ANDEREHOEFE_Condition;
	information		= DIA_Kati_ANDEREHOEFE_Info;
	description		= "我 在 哪 里 能 找 到 本 加 和 塞 柯 布 的 农 场 ？";
};

func int DIA_Kati_ANDEREHOEFE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info()
{
	AI_Output(other, self, "DIA_Kati_ANDEREHOEFE_15_00"); //我 在 哪 里 能 找 到 本 加 和 塞 柯 布 的 农 场 ？
	AI_Output(self, other, "DIA_Kati_ANDEREHOEFE_16_01"); //他 们 离 地 主 居 住 的 农 场 不 远 。 从 这 里 向 东 ， 然 后 你 就 能 找 到 他 们 。
};

///////////////////////////////////////////////////////////////////////
//	Info HierWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_HIERWEG(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 9;
	condition		= DIA_Kati_HIERWEG_Condition;
	information		= DIA_Kati_HIERWEG_Info;
	description		= "你 从 来 没 想 过 要 离 开 这 里 吗 ？";
};

func int DIA_Kati_HIERWEG_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kati_BAUERNAUFSTAND))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info()
{
	AI_Output(other, self, "DIA_Kati_HIERWEG_15_00"); //你 从 来 没 想 过 要 离 开 这 里 吗 ？
	AI_Output(self, other, "DIA_Kati_HIERWEG_16_01"); //要 想 离 开 这 里 并 不 是 件 简 单 的 事 。 所 有 的 陆 地 都 被 高 大 的 、 难 以 逾 越 的 连 绵 山 脉 包 围 着 。
	AI_Output(self, other, "DIA_Kati_HIERWEG_16_02"); //离 开 这 里 唯 一 的 两 条 路 是 矿 藏 山 谷 的 关 卡 和 港 口 。
	AI_Output(self, other, "DIA_Kati_HIERWEG_16_03"); //因 为 我 们 付 不 起 船 费 ， 而 矿 藏 山 谷 又 是 个 一 去 不 能 回 的 地 方 ， 所 以 我 们 只 能 留 在 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Pass
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PASS(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 10;
	condition		= DIA_Kati_PASS_Condition;
	information		= DIA_Kati_PASS_Info;
	description		= "关 于 关 卡 你 都 知 道 什 么 ？";
};

func int DIA_Kati_PASS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kati_HIERWEG))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info()
{
	AI_Output(other, self, "DIA_Kati_PASS_15_00"); //关 于 关 卡 你 都 知 道 什 么 ？
	AI_Output(self, other, "DIA_Kati_PASS_16_01"); //我 自 己 从 来 没 有 去 过 那 里 。 但 是 它 应 该 在 高 原 牧 场 上 本 加 的 农 场 附 近 。
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERMKAP1(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 11;
	condition		= DIA_Kati_PERMKAP1_Condition;
	information		= DIA_Kati_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "小 心 你 的 丈 夫 。";
};

func int DIA_Kati_PERMKAP1_Condition()
{
	if (
	(!C_NpcIsDown(Akil))
	&& (Npc_KnowsInfo(other, DIA_KATI_HALLO))
	&& (Npc_KnowsInfo(other, DIA_KATI_BAUERNAUFSTAND))
	&& (Npc_KnowsInfo(other, DIA_KATI_ANDEREHOEFE))
	&& (Npc_KnowsInfo(other, DIA_KATI_HIERWEG))
	&& (Npc_KnowsInfo(other, DIA_KATI_PASS))
	&& (Kapitel < 3)
	)
	{
		return TRUE;
	};
};

func void DIA_Kati_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Kati_PERMKAP1_15_00"); //小 心 你 的 丈 夫 。
	AI_Output(self, other, "DIA_Kati_PERMKAP1_16_01"); //我 将 会 尽 我 的 全 力 。
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Kati_KAP3_EXIT(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 999;
	condition		= DIA_Kati_KAP3_EXIT_Condition;
	information		= DIA_Kati_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kati_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Kati_PERM(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 3;
	condition		= DIA_Kati_PERM_Condition;
	information		= DIA_Kati_PERM_Info;
	permanent		= TRUE;
	description		= "你 一 切 还 好 吗 ？";
};

func int DIA_Kati_PERM_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Kati_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERM_Info()
{
	AI_Output(other, self, "DIA_Kati_PERM_15_00"); //你 一 切 还 好 吗 ？
	AI_Output(self, other, "DIA_Kati_PERM_16_01"); //我 们 能 应 付 过 去 。 我 只 是 想 知 道 我 们 还 要 忍 受 这 些 穿 黑 衣 的 魔 鬼 多 长 时 间。
	AI_Output(self, other, "DIA_Kati_PERM_16_02"); //我 再 也 无 法 忍 受 了 。 他 们 在 房 子 附 近 鬼 鬼 祟 祟 ， 发 出 那 种 古 怪 的 噪 音 。
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
instance DIA_Kati_KAP4_EXIT(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 999;
	condition		= DIA_Kati_KAP4_EXIT_Condition;
	information		= DIA_Kati_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kati_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Kati_KAP5_EXIT(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 999;
	condition		= DIA_Kati_KAP5_EXIT_Condition;
	information		= DIA_Kati_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kati_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP5_EXIT_Info()
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
instance DIA_Kati_KAP6_EXIT(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 999;
	condition		= DIA_Kati_KAP6_EXIT_Condition;
	information		= DIA_Kati_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kati_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Kati_PICKPOCKET(C_INFO)
{
	npc				= BAU_941_Kati;
	nr				= 900;
	condition		= DIA_Kati_PICKPOCKET_Condition;
	information		= DIA_Kati_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20_Female;
};

func int DIA_Kati_PICKPOCKET_Condition()
{
	C_Beklauen(13, 15);
};

func void DIA_Kati_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
	Info_AddChoice(DIA_Kati_PICKPOCKET, DIALOG_BACK, DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};
