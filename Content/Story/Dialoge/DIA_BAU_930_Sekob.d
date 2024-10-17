// ************************************************************
// 			  					EXIT
// ************************************************************
instance DIA_Sekob_EXIT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 999;
	condition		= DIA_Sekob_EXIT_Condition;
	information		= DIA_Sekob_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sekob_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hallo
// ************************************************************
instance DIA_Sekob_HALLO(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 3;
	condition		= DIA_Sekob_HALLO_Condition;
	information		= DIA_Sekob_HALLO_Info;
	important		= TRUE;
};

func int DIA_Sekob_HALLO_Condition()
{
	if ((Kapitel < 3)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_HALLO_Info()
{
	AI_Output(self, other, "DIA_Sekob_HALLO_01_00"); //你 在 我 的 土 地 上 做 什 么 ？ 这 里 没 有 什 么 可 偷 。 走 开 。
	AI_Output(other, self, "DIA_Sekob_HALLO_15_01"); //在 这 该 死 的 地 区 难 道 就 没 有 哪 片 土 地 不 属 于 什 么 人 吗 ？
	AI_Output(self, other, "DIA_Sekob_HALLO_01_02"); //去 工 作 ， 那 样 也 许 有 一 天 你 可 以 说 某 一 片 土 地 是 属 于 你 的 。 不 过 在 那 之 前 ， 请 到 别 的 地 方 消 磨 时 光 吧 。
};

// ************************************************************
// 			  					PermVorMis
// ************************************************************
instance DIA_Sekob_PermVorMis(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 3;
	condition		= DIA_Sekob_PermVorMis_Condition;
	information		= DIA_Sekob_PermVorMis_Info;
	permanent		= TRUE;
	description		= "听 着 … …";
};

func int DIA_Sekob_PermVorMis_Condition()
{
	if ((Kapitel < 3)
	&& (MIS_Torlof_HolPachtVonSekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info()
{
	AI_Output(other, self, "DIA_Sekob_PermVorMis_15_00"); //听 着 … …
	AI_Output(self, other, "DIA_Sekob_PermVorMis_01_01"); //现 在 我 没 有 什 么 工 作 给 你 。 马 上 走 ！
};

// ************************************************************
// 			  				ZAHL PACHT
// ************************************************************
instance DIA_Sekob_ZAHLPACHT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 5;
	condition		= DIA_Sekob_ZAHLPACHT_Condition;
	information		= DIA_Sekob_ZAHLPACHT_Info;
	description		= "欧 纳 尔 想 要 你 支 付 租 金 。";
};

func int DIA_Sekob_ZAHLPACHT_Condition()
{
	if (MIS_Torlof_HolPachtVonSekob == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info()
{
	AI_Output(other, self, "DIA_Sekob_ZAHLPACHT_15_00"); //这 片 土 地 属 于 大 农 场 主 。 你 只 是 这 里 的 承 租 人 。 欧 纳 尔 想 要 你 上 次 的 租 金 。 你 已 经 晚 了 几 个 星 期 了 。
	AI_Output(self, other, "DIA_Sekob_ZAHLPACHT_01_01"); //什 么 ？ 他 派 了 你 这 样 的 恶 棍 来 ？ 就 算 你 也 不 会 相 信 吧 。
	AI_Output(self, other, "DIA_Sekob_ZAHLPACHT_01_02"); //在 我 发 脾 气 之 前 从 这 里 滚 出 去 。

	self.aivar[AIV_DefeatedByPlayer] = FALSE; // WICHTIG
};

// ************************************************************
// 			  				Kohle Raus (not defeated)
// ************************************************************
instance DIA_Sekob_KohleRaus(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 5;
	condition		= DIA_Sekob_KohleRaus_Condition;
	information		= DIA_Sekob_KohleRaus_Info;
	permanent		= TRUE;
	description		= "把 钱 交 出 来 ， 否 则 我 就 打 落 你 的 牙 齿 !";
};

func int DIA_Sekob_KohleRaus_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info()
{
	AI_Output(other, self, "DIA_Sekob_KohleRaus_15_00"); //把 钱 交 出 来 ， 否 则 我 就 打 落 你 的 牙 齿 ！
	AI_Output(self, other, "DIA_Sekob_KohleRaus_01_01"); //你 不 能 抢 走 我 的 钱 包 ， 你 这 个 罪 犯 。 你 不 能 ！
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				InformOnar
// ************************************************************
instance DIA_Sekob_InformOnar(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 5;
	condition		= DIA_Sekob_InformOnar_Condition;
	information		= DIA_Sekob_InformOnar_Info;
	description		= "那 么 我 想 我 必 须 要 告 诉 欧 纳 尔 这 些 事 。";
};

func int DIA_Sekob_InformOnar_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sekob_ZAHLPACHT))
	&& (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info()
{
	AI_Output(other, self, "DIA_Sekob_InformOnar_15_00"); //那 么 我 想 我 必 须 要 告 诉 欧 纳 尔 这 些 事 。
	AI_Output(self, other, "DIA_Sekob_InformOnar_01_01"); //我 不 在 乎 ！ 你 可 以 告 诉 欧 纳 尔 我 什 么 都 没 有 。 那 是 一 个 悲 哀 的 事 实 。
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Defeated (Kohle Raus II)
// ************************************************************
instance DIA_Sekob_Defeated(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 5;
	condition		= DIA_Sekob_Defeated_Condition;
	information		= DIA_Sekob_Defeated_Info;
	description		= "你 从 哪 里 弄 到 的 钱 ？ ！";
};

func int DIA_Sekob_Defeated_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Sekob_ZAHLPACHT))
	&& (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info()
{
	AI_Output(other, self, "DIA_Sekob_Defeated_15_00"); //你 从 哪 里 弄 到 的 钱 ？ ！
	AI_Output(self, other, "DIA_Sekob_Defeated_01_01"); //请 不 要 再 打 我 了 。 你 说 什 么 我 都 照 做 。
	AI_Output(other, self, "DIA_Sekob_Defeated_15_02"); //那 付 你 的 租 金 。
	AI_Output(self, other, "DIA_Sekob_Defeated_01_03"); //（ 发 牢 骚 ） 但 是 先 生 ， 我 什 么 都 没 有 。 我 只 是 一 个 饿 得 半 死 的 可 怜 的 家 伙 。
	AI_Output(self, other, "DIA_Sekob_Defeated_01_04"); //我 上 次 的 作 物 都 已 经 干 旱 死 了 。 我 想 付 租 金 ， 但 是 我 真 的 什 么 都 没 有 。 同 情 一 下 我 吧 。

	Info_ClearChoices(DIA_Sekob_Defeated);
	Info_AddChoice(DIA_Sekob_Defeated, "马 上 付 租 金 ， 不 然 我 就 杀 了 你 。", DIA_Sekob_Defeated_hart);
	Info_AddChoice(DIA_Sekob_Defeated, "好 吧 ， 我 会 欧 纳 尔 谈 谈。", DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_Weich()
{
	AI_Output(other, self, "DIA_Sekob_Defeated_weich_15_00"); //好 吧 ， 我 会 欧 纳 尔 谈 谈 。
	AI_Output(self, other, "DIA_Sekob_Defeated_weich_01_01"); //谢 谢 你 ， 先 生 。 万 分 感 谢 ！
	MIS_Sekob_RedeMitOnar = LOG_RUNNING;

	AI_StopProcessInfos(self);
};

func void B_Sekob_Kassieren()
{
	AI_Output(other, self, "DIA_Sekob_Kassieren_15_00"); //不 要 再 说 废 话 了 。 这 里 一 直 都 在 下 雨 ， 而 且 你 的 食 物 橱 是 满 的 。 马 上 付 租 金 ， 否 则 我 就 杀 了 你 。
	AI_Output(self, other, "DIA_Sekob_Kassieren_01_01"); //（ 顺 从 的 ） 请 不 要 ， 给 你 金 币 。 如 果 你 让 我 活 着 的 话 ， 我 甚 至 愿 意 多 给 你 一 些 奖 金 。
	B_GiveInvItems(self, other, ItMi_Gold, 60);
	AI_Output(other, self, "DIA_Sekob_Kassieren_15_02"); //看 ， 那 并 不 难 。
	AI_Output(self, other, "DIA_Sekob_Kassieren_01_03"); //（ 绝 望 的 ） 我 破 产 了 。
	Sekob_Pachtbezahlt = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren();
};

// ************************************************************
// 			  				Again (und nach Onar)
// ************************************************************
instance DIA_Sekob_Again(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 5;
	condition		= DIA_Sekob_Again_Condition;
	information		= DIA_Sekob_Again_Info;
	permanent		= TRUE;
	description		= "关 于 你 的 租 金 … …";
};

func int DIA_Sekob_Again_Condition()
{
	if ((MIS_Sekob_RedeMitOnar == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Sekob_Defeated))
	&& (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info()
{
	AI_Output(other, self, "DIA_Sekob_Again_15_00"); //关 于 你 的 租 金 … …
	AI_Output(self, other, "DIA_Sekob_Again_01_01"); //你 会 去 和 欧 纳 尔 说 的 ， 对 吗 ？

	Info_ClearChoices(DIA_Sekob_Again);
	Info_AddChoice(DIA_Sekob_Again, "我 改 变 主 意 了 。", DIA_Sekob_Again_Nein);

	if (Onar_WegenSekob == TRUE)
	{
		Info_AddChoice(DIA_Sekob_Again, "我 已 经 做 过 了 … …", DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice(DIA_Sekob_Again, "好 的 。", DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein()
{
	AI_Output(other, self, "DIA_Sekob_Again_Nein_15_00"); //我 改 变 主 意 了 。
	B_Sekob_Kassieren();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output(other, self, "DIA_Sekob_Again_Ja_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Sekob_Again_Ja_01_01"); //你 可 以 的 。

	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Again_verarscht()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output(other, self, "DIA_Sekob_Again_verarscht_15_00"); //我 已 经 做 过 了 … …
	AI_Output(self, other, "DIA_Sekob_Again_verarscht_01_01"); //是 吗 ？ 他 说 了 什 么 ？
	AI_Output(other, self, "DIA_Sekob_Again_verarscht_15_02"); //我 很 抱 歉 ， 但 是 我 现 在 必 须 把 你 的 脑 袋 揪 下 来 。
	AI_Output(self, other, "DIA_Sekob_Again_verarscht_01_03"); //但 是 为 什 么 ？ 我 做 什 么 了 ？
	AI_Output(other, self, "DIA_Sekob_Again_verarscht_15_04"); //你 骗 了 我 。
	AI_Output(self, other, "DIA_Sekob_Again_verarscht_01_05"); //我 说 的 是 事 实 - 真 的 ！
	B_Sekob_Kassieren();
};

// ************************************************************
// 			  			Perm Kap 1
// ************************************************************
instance DIA_Sekob_PERMKAP1(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 6;
	condition		= DIA_Sekob_PERMKAP1_Condition;
	information		= DIA_Sekob_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "下 次 你 要 及 时 付 钱 ， 明 白 吗 ？";
};

func int DIA_Sekob_PERMKAP1_Condition()
{
	if ((Sekob_Pachtbezahlt == TRUE)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info()
{
	AI_Output(other, self, "DIA_Sekob_PERMKAP1_15_00"); //下 次 你 要 及 时 付 钱 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Sekob_PERMKAP1_01_01"); //（ 自 言 自 语 ） 我 做 了 什 么 要 受 到 这 样 的 处 罚 … …
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
instance DIA_Sekob_KAP3_EXIT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 999;
	condition		= DIA_Sekob_KAP3_EXIT_Condition;
	information		= DIA_Sekob_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sekob_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMt
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 30;
	condition		= DIA_Sekob_DMT_Condition;
	information		= DIA_Sekob_DMT_Info;
	description		= "发 生 了 什 么 事 吗 ？";
};

func int DIA_Sekob_DMT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info()
{
	AI_Output(other, self, "DIA_Sekob_DMT_15_00"); //发 生 了 什 么 事 吗 ？
	AI_Output(self, other, "DIA_Sekob_DMT_01_01"); //你 一 定 要 帮 助 我 。 穿 黑 袍 子 的 人 闯 进 了 我 的 房 子 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Sekob_DMT_01_02"); //你 们 这 些 皇 家 守 卫 应 该 保 证 所 有 人 的 安 宁 ， 对 吗 ？
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Sekob_DMT_01_03"); //我 知 道 你 们 雇 佣 兵 对 慈 善 不 敢 兴 趣 ， 但 是 我 会 付 你 钱 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Sekob_DMT_01_04"); //你 必 须 要 帮 助 我 ， 尊 敬 的 魔 法 师 先 生。
	};

	AI_Output(self, other, "DIA_Sekob_DMT_01_05"); //那 些 家 伙 说 他 们 要 找 某 些 东 西 。 但 显 然 不 在 我 的 房 子 里 。
	AI_Output(self, other, "DIA_Sekob_DMT_01_06"); //请 帮 帮 我 。 再 把 他 们 赶 走 。

	Log_CreateTopic(TOPIC_SekobDMT, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT, LOG_RUNNING);
	B_LogEntry(TOPIC_SekobDMT, TOPIC_SekobDMT_1);
};

///////////////////////////////////////////////////////////////////////
//	Info DMTWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_DMTWEG(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 31;
	condition		= DIA_Sekob_DMTWEG_Condition;
	information		= DIA_Sekob_DMTWEG_Info;
	description		= "你 的 房 子 空 了 。 那 些 黑 衣 强 盗 已 经 离 开 了 。";
};

func int DIA_Sekob_DMTWEG_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Sekob_DMT))
	&& (Npc_IsDead(DMT_DementorAmbientSekob1))
	&& (Npc_IsDead(DMT_DementorAmbientSekob2))
	&& (Npc_IsDead(DMT_DementorAmbientSekob3))
	&& (Npc_IsDead(DMT_DementorAmbientSekob4)))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMTWEG_Info()
{
	AI_Output(other, self, "DIA_Sekob_DMTWEG_15_00"); //你 的 房 子 空 了 。 那 些 黑 衣 强 盗 已 经 离 开 了 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Sekob_DMTWEG_01_01"); //我 知 道 守 卫 能 靠 得 住 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Sekob_DMTWEG_01_02"); //你 干 的 非 常 好 。 有 你 这 样 的 人 在 欧 纳 尔 的 身 旁 ， 他 真 是 走 运 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Sekob_DMTWEG_01_03"); //谢 谢 你 ， 尊 敬 的 魔 法 师 先 生 。 如 果 没 有 神 职 人 员 伸 出 保 护 之 手 ， 我 们 会 变 成 什 么 样 子 啊 ？。
	};

	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP(XP_SekobDMTWEG);

	if (Kapitel < 5)
	{
		Npc_ExchangeRoutine(self, "Start");
	}
	else
	{
		Npc_ExchangeRoutine(self, "Obsessed");
	};

	if (Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi, "Start");
		B_StartOtherRoutine(Till, "Start");
	};

	B_StartOtherRoutine(Balthasar, "Start");
	B_StartOtherRoutine(BAU_933_Rega, "Start");
	B_StartOtherRoutine(BAU_934_Babera, "Start");
	B_StartOtherRoutine(BAU_937_BAUER, "Start");
	B_StartOtherRoutine(BAU_938_BAUER, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info Belohnung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_BELOHNUNG(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 32;
	condition		= DIA_Sekob_BELOHNUNG_Condition;
	information		= DIA_Sekob_BELOHNUNG_Info;
	description		= "没 这 么 快 ， 我 的 朋 友 。";
};

func int DIA_Sekob_BELOHNUNG_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sekob_DMTWEG))
	&& (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_BELOHNUNG_Info()
{
	AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_00"); //没 这 么 快 ， 我 的 朋 友 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if (Npc_KnowsInfo(other, DIA_Rosi_WASMACHSTDU))
		{
			AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_01"); //从 现 在 起 ， 你 要 放 弃 你 的 不 正 当 交 易 ， 而 经 营 普 通 货 物 ， 否 则 我 还 会 回 来 。
		};

		AI_Output(self, other, "DIA_Sekob_BELOHNUNG_01_02"); //我 不 明 白 。 你 还 想 要 什 么 ？
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_03"); //你 在 叨 唠 报 酬 ， 不 是 吗 ？ 或 者 只 是 我 没 听 清 ？
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_04"); //我 只 对 一 件 事 感 兴 趣 。 那 些 戴 着 黑 兜 帽 的 家 伙 想 在 你 的 屋 子 里 找 什 么 ？
		AI_Output(self, other, "DIA_Sekob_BELOHNUNG_01_05"); //我 自 己 也 解 释 不 清 ， 高 贵 的 魔 法 师 先 生 。 也 许 … …
		AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_06"); //什 么 ？
		AI_Output(self, other, "DIA_Sekob_BELOHNUNG_01_07"); //我 很 抱 歉 。 我 几 年 前 发 誓 永 远 不 提 起 它 ， 而 我 不 想 破 坏 我 的 誓 言 。
	};

	AI_Output(self, other, "DIA_Sekob_BELOHNUNG_01_08"); //我 唯 一 能 做 的 就 是 给 你 一 点 钱 ， 然 后 请 求 你 宽 恕 我 。
	AI_Output(other, self, "DIA_Sekob_BELOHNUNG_15_09"); //那 就 给 我 吧 。 我 很 忙 。
	AI_Output(self, other, "DIA_Sekob_BELOHNUNG_01_10"); //给 。
	CreateInvItems(self, ItMi_Gold, 250);
	B_GiveInvItems(self, other, ItMi_Gold, 250);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_PERM(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 80;
	condition		= DIA_Sekob_PERM_Condition;
	information		= DIA_Sekob_PERM_Info;
	permanent		= TRUE;
	description		= "期 间 发 生 了 什 么 事 吗 ？";
};

func int DIA_Sekob_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sekob_BELOHNUNG))
	&& (Kapitel >= 3)
	&& (NpcObsessedByDMT_Sekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERM_Info()
{
	if ((hero.guild == GIL_KDF)
	&& (Kapitel >= 5))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Sekob_PERM_15_00"); //期 间 发 生 了 什 么 事 吗 ？

		if (MIS_bringRosiBackToSekob == LOG_FAILED)
		{
			AI_Output(self, other, "DIA_Sekob_PERM_01_01"); //走 开 。
		}
		else if (MIS_bringRosiBackToSekob == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Sekob_PERM_01_02"); //不 。 没 什 么 特 别 的 。
		}
		else if ((Kapitel >= 5)
		&& (MIS_bringRosiBackToSekob != LOG_SUCCESS))
		{
			AI_Output(self, other, "DIA_Sekob_PERM_01_03"); //我 的 妻 子 已 经 失 踪 了 。 起 初 我 什 么 都 没 有 察 觉 ， 然 后 她 突 然 就 消 失 了 。
			AI_Output(self, other, "DIA_Sekob_PERM_01_04"); //我 想 她 会 逃 向 丛 林 ， 以 便 躲 开 那 些 旷 野 袭 击 者 。
			AI_Output(self, other, "DIA_Sekob_PERM_01_05"); //帮 我 一 个 忙 ， 如 果 你 找 到 她 ， 把 她 安 然 无 恙 地 带 回 来 。
			MIS_bringRosiBackToSekob = LOG_RUNNING;
			Log_CreateTopic(TOPIC_bringRosiBackToSekob, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_bringRosiBackToSekob, LOG_RUNNING);
			B_LogEntry(TOPIC_bringRosiBackToSekob, TOPIC_bringRosiBackToSekob_1);
		}
		else
		{
			AI_Output(self, other, "DIA_Sekob_PERM_01_06"); //自 从 那 些 穿 着 黑 袍 的 恶 棍 留 在 我 的 家 里 之 后 ， 没 发 生 其 它 的 事 情 。
		};
	};
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
instance DIA_Sekob_KAP4_EXIT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 999;
	condition		= DIA_Sekob_KAP4_EXIT_Condition;
	information		= DIA_Sekob_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sekob_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP4_EXIT_Info()
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
instance DIA_Sekob_KAP5_EXIT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 999;
	condition		= DIA_Sekob_KAP5_EXIT_Condition;
	information		= DIA_Sekob_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sekob_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_Heilung(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 55;
	condition		= DIA_Sekob_Heilung_Condition;
	information		= DIA_Sekob_Heilung_Info;
	permanent		= TRUE;
	description		= "你 遇 到 难 题 了 。";
};

func int DIA_Sekob_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF)
	&& (Kapitel >= 5))
	{
		return TRUE;
	};
};

var int DIA_Sekob_Heilung_oneTime;
func void DIA_Sekob_Heilung_Info()
{
	AI_Output(other, self, "DIA_Sekob_Heilung_15_00"); //你 遇 到 难 题 了 。

	if (DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Sekob_Heilung_01_01"); //是 的 ， 是 这 样 。 你 就 是 我 的 难 题 ， 丑 恶 的 魔 法 师 。 马 上 走 开 ， 否 则 我 活 剥 了 你 。
		AI_Output(other, self, "DIA_Sekob_Heilung_15_02"); //（ 自 言 自 语 ） 一 个 困 难 的 事 实 。

		B_NpcClearObsessionByDMT(self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Sekob_Heilung_01_03"); //你 刚 才 没 在 听 ， 是 吗 ？
		AI_Output(other, self, "DIA_Sekob_Heilung_15_04"); //（ 自 言 自 语 ） 一 个 无 望 的 事 实 。
		B_NpcClearObsessionByDMT(self);
		B_Attack(self, other, AR_NONE, 1);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info rosibackatSekob
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSIBACKATSEKOB(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 53;
	condition		= DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information		= DIA_Sekob_ROSIBACKATSEKOB_Info;
	description		= "我 把 你 的 妻 子 带 回 来 。";
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition()
{
	if ((Kapitel >= 5)
	&& (hero.guild != GIL_KDF)
	&& (Npc_GetDistToWP(Rosi, "NW_FARM4_SEKOB") < 3000)
	&& (MIS_bringRosiBackToSekob == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info()
{
	AI_Output(other, self, "DIA_Sekob_ROSIBACKATSEKOB_15_00"); //我 把 你 的 妻 子 带 回 来 。
	AI_Output(self, other, "DIA_Sekob_ROSIBACKATSEKOB_01_01"); //那 好 极 了 。 给 你 ， 用 这 个 补 偿 你 遇 到 的 麻 烦 。
	MIS_bringRosiBackToSekob = LOG_SUCCESS;
	CreateInvItems(self, ItMi_Gold, 650);
	B_GiveInvItems(self, other, ItMi_Gold, 650);
	B_GivePlayerXP(XP_Ambient);
	B_NpcClearObsessionByDMT(self);
	B_StartOtherRoutine(Rosi, "Start");
	B_StartOtherRoutine(Till, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info rosineverback
///////////////////////////////////////////////////////////////////////
instance DIA_Sekob_ROSINEVERBACK(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 56;
	condition		= DIA_Sekob_ROSINEVERBACK_Condition;
	information		= DIA_Sekob_ROSINEVERBACK_Info;
	description		= "罗 希 永 远 不 会 回 到 你 身 边 了 。 我 已 经 把 她 送 到 一 个 安 全 的 地 方 了 。";
};

func int DIA_Sekob_ROSINEVERBACK_Condition()
{
	if ((MIS_bringRosiBackToSekob == LOG_OBSOLETE)
	&& (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSINEVERBACK_Info()
{
	AI_Output(other, self, "DIA_Sekob_ROSINEVERBACK_15_00"); //罗 希 永 远 不 会 回 到 你 身 边 了 。 我 已 经 把 她 送 到 一 个 安 全 的 地 方 了 。
	AI_Output(self, other, "DIA_Sekob_ROSINEVERBACK_01_01"); //安 全 。 因 为 谁 ？
	AI_Output(other, self, "DIA_Sekob_ROSINEVERBACK_15_02"); //因 为 你 。
	AI_Output(self, other, "DIA_Sekob_ROSINEVERBACK_01_03"); //你 会 为 此 感 到 后 悔 的 ， 你 这 个 畜 牲 。
	B_NpcClearObsessionByDMT(self);
	B_Attack(self, other, AR_NONE, 1);
	B_GivePlayerXP(XP_Ambient);
	MIS_bringRosiBackToSekob = LOG_FAILED;
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
instance DIA_Sekob_KAP6_EXIT(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 999;
	condition		= DIA_Sekob_KAP6_EXIT_Condition;
	information		= DIA_Sekob_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sekob_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sekob_PICKPOCKET(C_INFO)
{
	npc				= BAU_930_Sekob;
	nr				= 900;
	condition		= DIA_Sekob_PICKPOCKET_Condition;
	information		= DIA_Sekob_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Sekob_PICKPOCKET_Condition()
{
	C_Beklauen(75, 230);
};

func void DIA_Sekob_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
	Info_AddChoice(DIA_Sekob_PICKPOCKET, DIALOG_BACK, DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sekob_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};

func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};
