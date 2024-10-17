///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_EXIT(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 999;
	condition		= DIA_Nagur_EXIT_Condition;
	information		= DIA_Nagur_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Nagur_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Nagur_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Nagur_PICKPOCKET(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 900;
	condition		= DIA_Nagur_PICKPOCKET_Condition;
	information		= DIA_Nagur_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Nagur_PICKPOCKET_Condition()
{
	C_Beklauen(75, 150);
};

func void DIA_Nagur_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
	Info_AddChoice(DIA_Nagur_PICKPOCKET, DIALOG_BACK, DIA_Nagur_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Nagur_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Nagur_PICKPOCKET_DoIt);
};

func void DIA_Nagur_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};

func void DIA_Nagur_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Nagur_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info vor dem Auftrag (Spieler hat noch nicht mit Kardif geredet)
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Hallo(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 2;
	condition		= DIA_Nagur_Hallo_Condition;
	information		= DIA_Nagur_Hallo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nagur_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (DIA_Kardif_Diebeswerk_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Hallo_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Nagur_Hallo_08_00"); //嘿 ， 我 没 时 间 和 你 聊 天 了 。 如 果 你 需 要 信 息 的 话 ， 去 跟 卡 迪 夫 谈 谈 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Nagur_Hallo_08_01"); //老 兄 ， 不 要 打 扰 我 ， 好 吗 ？
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Job Angebot
///////////////////////////////////////////////////////////////////////
var int NagurHack;

func void B_Nagur_Abfertigen()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);
	if ((Hlp_IsItem(heroArmor, ItAr_MIL_L) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_MIL_M) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_PAL_M) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_PAL_H) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_NOV_L) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_KDF_L) == FALSE)
	&& (Hlp_IsItem(heroArmor, ItAr_KDF_H) == FALSE))
	{
		AI_Output(self, other, "DIA_Nagur_Add_08_02"); //而 且 不 要 以 为 你 穿 了 另 一 身 衣 服 我 就 认 不 出 你 ！
	};

	AI_Output(self, other, "DIA_Nagur_Add_08_03"); //（ 阴 险 地 ） 你 正 在 插 手 和 你 无 关 的 事 ！
	AI_Output(self, other, "DIA_Nagur_Add_08_04"); //走 开 ！

	MIS_Nagur_Bote = LOG_SUCCESS; // HACK: Attila kommt bei 3* Success oder 1* suckt --> nur noch die anderen beiden Missionen sind Trigger
	NagurHack = TRUE;
	AI_StopProcessInfos(self);
};
instance DIA_Nagur_Job(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 3;
	condition		= DIA_Nagur_Job_Condition;
	information		= DIA_Nagur_Job_Info;
	description		= "卡 迪 夫 说 你 可 能 有 工 作 给 我 。";
};

func int DIA_Nagur_Job_Condition()
{
	if (DIA_Kardif_Diebeswerk_permanent == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Job_Info()
{
	AI_Output(other, self, "DIA_Nagur_Job_15_00"); //卡 迪 夫 说 你 可 能 有 工 作 给 我 。
	if ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Nagur_Add_08_00"); //在 港 口 这 里 没 有 工 作 给 修 道 院 里 的 人 ！ （ 大 笑 ）
		B_Nagur_Abfertigen();
	}
	else if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Nagur_Add_08_01"); //在 港 口 这 里 没 有 工 作 给 国 王 的 士 兵 。
		B_Nagur_Abfertigen();
	}
	else
	{
		AI_Output(self, other, "DIA_Nagur_Job_08_01"); //（ 打 量 ） 不 错 ， 不 错 ， 那 么 你 正 在 找 一 件 特 殊 工 作 。 好 吧 ， 但 是 游 戏 要 按 我 的 规 则 来 玩 ， 明 白 吗 ？
		AI_Output(other, self, "DIA_Nagur_Job_15_02"); //那 是 什 么 意 思 ？
		AI_Output(self, other, "DIA_Nagur_Job_08_03"); //那 是 说 你 要 按 我 说 的 去 做 ， 然 后 你 可 以 分 到 利 润 的 三 分 之 一 。
		AI_Output(self, other, "DIA_Nagur_Job_08_04"); //如 果 你 不 愿 意 的 话 ， 那 就 没 有 工 作 。

		Info_ClearChoices(DIA_Nagur_Job);
		Info_AddChoice(DIA_Nagur_Job, "我 们 是 商 业 伙 伴 ， 所 以 五 五 分 。", DIA_Nagur_Job_Halbe);
		Info_AddChoice(DIA_Nagur_Job, "好 吧 ， 听 你 的 。", DIA_Nagur_Job_Klar);
	};
};

func void DIA_Nagur_Job_Klar()
{
	AI_Output(other, self, "DIA_Nagur_Job_Klar_15_00"); //好 吧 ， 听 你 的 。
	AI_Output(self, other, "DIA_Nagur_Job_Klar_08_01"); //很 好 ， 那 么 等 你 准 备 好 去 赚 一 大 笔 钱 的 时 候 就 告 诉 我 一 声 。
	Nagur_Deal = 80;
	Info_ClearChoices(DIA_Nagur_Job);
};

func void DIA_Nagur_Job_Halbe()
{
	AI_Output(other, self, "DIA_Nagur_Job_Halbe_15_00"); //我 们 是 商 业 伙 伴 ， 所 以 五 五 分 。
	AI_Output(self, other, "DIA_Nagur_Job_Halbe_08_01"); //好 吧 ， 我 想 最 好 试 一 试 。 当 然 我 们 会 公 平 地 分 配 我 们 的 利 益 。
	Nagur_Deal = 120;
	Info_ClearChoices(DIA_Nagur_Job);
};

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Auftrag(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 4;
	condition		= DIA_Nagur_Auftrag_Condition;
	information		= DIA_Nagur_Auftrag_Info;
	description		= "好 吧 ， 你 的 计 划 是 什 么 ？";
};

func int DIA_Nagur_Auftrag_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Nagur_Job))
	&& (MIS_Nagur_Bote != LOG_SUCCESS)) // also hier NICHT B_Nagur_Abfertigen durchlaufen
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftrag_Info()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_15_00"); //好 吧 ， 你 的 计 划 是 什 么 ？
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_01"); //你 知 道 商 人 贝 尔 卓 姆 ， 是 吗 ？ 如 果 不 是 ， 那 么 你 现 在 该 和 他 谈 谈 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_02"); //这 个 贝 尔 卓 姆 有 一 个 信 使 ， 从 阿 基 尔 的 农 场 给 他 送 货 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_03"); //那 是 说 ， 他 曾 经 有 个 信 使 - 在 我 割 断 了 他 的 喉 咙 之 前 。 现 在 贝 尔 卓 姆 必 须 要 找 一 个 新 人 ， 那 当 然 就 是 你 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_04"); //你 的 任 务 是 让 贝 尔 卓 姆 雇 你 ， 并 从 阿 基 尔 那 里 取 货 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_05"); //你 把 货 物 拿 给 我 ， 然 后 我 把 它 卖 给 感 兴 趣 的 顾 客 。 他 会 为 它 付 一 笔 数 额 可 观 的 钱 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_08_06"); //但 是 你 不 要 打 算 自 己 卖 掉 它 。 都 清 楚 了 吗 ？

	Info_ClearChoices(DIA_Nagur_Auftrag);
	Info_AddChoice(DIA_Nagur_Auftrag, "那 么 好 吧 ， 我 都 准 备 好 了 。 （ 结 束 ）", DIA_Nagur_Auftrag_Okay);
	Info_AddChoice(DIA_Nagur_Auftrag, "我 在 哪 里 能 找 到 贝 尔 卓 姆 ？", DIA_Nagur_Auftrag_Baltram);
	Info_AddChoice(DIA_Nagur_Auftrag, "我 什 么 时 候 可 以 与 贝 尔 卓 姆 谈 话 ？", DIA_Nagur_Auftrag_Wann);
	Info_AddChoice(DIA_Nagur_Auftrag, "阿 基 尔 的 农 场 在 哪 里 ？", DIA_Nagur_Auftrag_Akil);
	Info_AddChoice(DIA_Nagur_Auftrag, "利 润 有 多 少 ？", DIA_Nagur_Auftrag_Gewinn);
};

func void DIA_Nagur_Auftrag_Akil()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_Akil_15_00"); //阿 基 尔 的 农 场 在 哪 里 ？
	AI_Output(self, other, "DIA_Nagur_Auftrag_Akil_08_01"); //从 东 门 离 开 城 市 ， 就 在 市 场 那 里 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_Akil_08_02"); //如 果 你 沿 着 路 走 ， 你 很 快 就 能 看 到 一 些 用 岩 石 做 成 的 台 阶 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_Akil_08_03"); //从 那 里 上 去 ， 你 就 来 到 了 阿 基 尔 的 农 场 。
};

func void DIA_Nagur_Auftrag_Gewinn()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_Gewinn_15_00"); //利 益 大 概 有 多 少 ？
	AI_Output(self, other, "DIA_Nagur_Auftrag_Gewinn_08_01"); //我 无 法 说 出 精 确 的 数 字 。 但 是 ， 我 估 计 大 约 是 4 0 0 个 金 币 。
};

func void DIA_Nagur_Auftrag_Baltram()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_Baltram_15_00"); //我 在 哪 里 能 找 到 贝 尔 卓 姆 ？
	AI_Output(self, other, "DIA_Nagur_Auftrag_Baltram_08_01"); //他 在 市 场 有 个 货 摊 。
};

func void DIA_Nagur_Auftrag_Wann()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_Wann_15_00"); //我 什 么 时 候 可 以 与 贝 尔 卓 姆 谈 话 ？
	AI_Output(self, other, "DIA_Nagur_Auftrag_Wann_08_01"); //你 可 以 马 上 出 发 。 他 现 在 应 该 已 经 得 知 他 的 信 使 再 也 不 会 出 现 了 。 （ 卑 鄙 的 笑 ）
};

func void DIA_Nagur_Auftrag_Okay()
{
	AI_Output(other, self, "DIA_Nagur_Auftrag_Okay_15_00"); //那 好 ， 我 准 备 就 绪 了 。
	AI_Output(self, other, "DIA_Nagur_Auftrag_Okay_08_01"); //很 好 ， 那 么 你 上 路 吧 - 但 是 如 果 你 想 要 骗 我 的 话 ， 你 很 快 就 会 像 那 个 信 使 一 样 死 掉 ！ 别 忘 了 ！
	MIS_Nagur_Bote = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Nagur, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Nagur, LOG_RUNNING);
	B_LogEntry(TOPIC_Nagur, TOPIC_Nagur_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Success(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 5;
	condition		= DIA_Nagur_Success_Condition;
	information		= DIA_Nagur_Success_Info;
	description		= "我 带 来 了 包 裹 。";
};

func int DIA_Nagur_Success_Condition()
{
	if ((MIS_Nagur_Bote == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMi_BaltramPaket) >= 1)
	&& (Nagur_Ausgeliefert == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Success_Info()
{
	AI_Output(other, self, "DIA_Nagur_Success_15_00"); //我 带 来 了 包 裹 。
	AI_Output(self, other, "DIA_Nagur_Success_08_01"); //干 的 漂 亮 。 我 要 把 它 卖 掉 。 明 天 再 来 。

	B_LogEntry(TOPIC_Nagur, TOPIC_Nagur_2);

	AI_StopProcessInfos(self);

	if (B_GiveInvItems(other, self, ItMi_BaltramPaket, 1))
	{
		Npc_RemoveInvItems(self, ItMi_BaltramPaket, 1);
	};

	NagurDay = B_GetDayPlus();
};

///////////////////////////////////////////////////////////////////////
//	Info Deal
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Deal(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 6;
	condition		= DIA_Nagur_Deal_Condition;
	information		= DIA_Nagur_Deal_Info;
	permanent		= TRUE;
	description		= "那 么 你 卖 掉 货 物 了 吗 ？ ";
};

// ---------------------------------
var int DIA_Nagur_Deal_permanent;
// ---------------------------------
func int DIA_Nagur_Deal_Condition()
{
	if ((DIA_Nagur_Deal_permanent == FALSE)
	&& (MIS_Nagur_Bote == LOG_RUNNING)
	&& (Nagur_Ausgeliefert == FALSE)
	&& Npc_KnowsInfo(other, DIA_Nagur_Success))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Deal_Info()
{
	AI_Output(other, self, "DIA_Nagur_Deal_15_00"); //那 么 你 卖 掉 货 物 了 吗 ？

	if (B_GetDayPlus() > NagurDay)
	{
		AI_Output(self, other, "DIA_Nagur_Deal_08_01"); //是 的 ， 但 是 比 我 预 想 的 要 少 。 我 只 拿 到 了 3 0 0 个 金 币 。
		AI_Output(self, other, "DIA_Nagur_Deal_08_02"); //有 一 部 分 被 我 的 雇 主 拿 走 了 … …
		AI_Output(self, other, "DIA_Nagur_Deal_08_03"); //而 且 卡 迪 夫 拿 走 了 他 通 常 的 佣 金 - 加 上 你 的 佣 金 。
		AI_Output(self, other, "DIA_Nagur_Deal_08_04"); //那 样 总 共 还 剩 下 2 4 0 枚 金 币 。 我 们 按 照 事 先 约 定 的 来 分 成 。 这 是 你 的 部 分 。
		AI_Output(self, other, "DIA_Nagur_Deal_08_05"); //你 干 得 漂 亮 。 我 已 经 把 那 个 交 给 我 的 雇 主 了 。
		AI_Output(self, other, "DIA_Nagur_Deal_08_06"); //那 东 西 卖 的 钱 还 没 到 我 手 上 呢 。

		B_GiveInvItems(self, other, ItMi_Gold, Nagur_Deal);
		MIS_Nagur_Bote = LOG_SUCCESS;
		MIS_Baltram_ScoutAkil = LOG_FAILED;
		B_GivePlayerXP(XP_Nagur_Bote);
		DIA_Nagur_Deal_permanent = TRUE;
		Diebesgilde_Okay = (Diebesgilde_Okay + 1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Nagur_Deal_08_07"); //不 ， 还 没 有 。 这 些 东 西 需 要 花 他 们 一 些 时 间 。 毕 竟 我 想 要 有 个 好 价 钱 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Auftraggeber(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 7;
	condition		= DIA_Nagur_Auftraggeber_Condition;
	information		= DIA_Nagur_Auftraggeber_Info;
	description		= "谁 是 你 的 老 板 ？";
};

func int DIA_Nagur_Auftraggeber_Condition()
{
	if (MIS_Nagur_Bote == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Nagur_Auftraggeber_Info()
{
	AI_Output(other, self, "DIA_Nagur_Auftraggeber_15_00"); //谁 是 你 的 老 板 ？
	AI_Output(self, other, "DIA_Nagur_Auftraggeber_08_01"); //我 不 是 真 的 以 为 我 会 告 诉 你 那 些 ， 是 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info erneutes ansprechen
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Fazit(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 7;
	condition		= DIA_Nagur_Fazit_Condition;
	information		= DIA_Nagur_Fazit_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nagur_Fazit_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Nagur_Auftraggeber)
	&& Npc_IsInState(self, ZS_Talk))
	&& (Knows_SecretSign == FALSE)
	&& (NagurHack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Fazit_Info()
{
	AI_Output(self, other, "DIA_Nagur_Fazit_08_00"); //工 作 进 行 得 很 顺 利 ， 但 是 ， 我 不 想 谈 论 我 的 雇 主 。 所 以 请 保 持 冷 静 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nagur im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Knast(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 7;
	condition		= DIA_Nagur_Knast_Condition;
	information		= DIA_Nagur_Knast_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nagur_Knast_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_NAGUR") <= 1000)
	&& (Nagur_ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Knast_Info()
{
	AI_Output(self, other, "DIA_Nagur_Knast_08_00"); //你 背 叛 了 我 ！ 那 是 个 大 错 误 - 现 在 滚 出 去 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
/////////////////////////////////////////
instance DIA_Nagur_Sign(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 7;
	condition		= DIA_Nagur_Sign_Condition;
	information		= DIA_Nagur_Sign_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Nagur_Sign_Condition()
{
	if ((MIS_Nagur_Bote == LOG_SUCCESS)
	&& (Knows_SecretSign == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Sign_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Nagur_Sign_08_00"); //那 么 你 成 功 了 。 现 在 你 知 道 了 我 的 雇 主 是 谁 。
	AI_Output(self, other, "DIA_Nagur_Sign_08_01"); //按 凯 希 亚 告 诉 你 的 做 - 我 们 不 在 乎 你 是 别 的 什 么 人 - 你 是 我 们 的 一 员 ， 那 是 最 重 要 的 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Nagur_Perm(C_INFO)
{
	npc				= VLK_493_Nagur;
	nr				= 7;
	condition		= DIA_Nagur_Perm_Condition;
	information		= DIA_Nagur_Perm_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Nagur_Perm_Condition()
{
	if ((MIS_Nagur_Bote == LOG_SUCCESS)
	&& Npc_KnowsInfo(other, DIA_Nagur_Sign)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Nagur_Perm_Info()
{
	AI_Output(self, other, "DIA_Nagur_Perm_08_00"); //找 别 的 人 吧 ， 附 近 有 很 多 人 。 我 没 有 其 它 的 事 情 给 你 做 。
	AI_StopProcessInfos(self);
};
