///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Till_EXIT(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 999;
	condition		= DIA_Till_EXIT_Condition;
	information		= DIA_Till_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Till_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Till_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Till_HALLO(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 3;
	condition		= DIA_Till_HALLO_Condition;
	information		= DIA_Till_HALLO_Info;
	description		= "嗯 ， 老 兄 ？";
};

func int DIA_Till_HALLO_Condition()
{
	if (Kapitel < 5)
	{
		return TRUE;
	};
};

func void DIA_Till_HALLO_Info()
{
	AI_Output(other, self, "DIA_Till_HALLO_15_00"); //嗯 ， 老 兄 ？
	AI_Output(self, other, "DIA_Till_HALLO_03_01"); //农 场 工 人 不 要 和 我 说 话 - 还 要 我 提 醒 你 多 少 次 ？
	B_StartOtherRoutine(Till, "Start");

	Info_ClearChoices(DIA_Till_HALLO);

	if (Kapitel < 5)
	{
		Info_AddChoice(DIA_Till_HALLO, "我 不 是 农 场 工 人。？", DIA_Till_HALLO_keinervoneuch);

		if (Npc_IsDead(Sekob) == FALSE)
		{
			Info_AddChoice(DIA_Till_HALLO, "你 负 责 这 里 ？", DIA_Till_HALLO_selber);
		};
	};
};

func void DIA_Till_HALLO_selber()
{
	AI_Output(other, self, "DIA_Till_HALLO_selber_15_00"); //你 负 责 这 里 ？
	AI_Output(self, other, "DIA_Till_HALLO_selber_03_01"); //（ 害 怕 ） 呃 。 不 ， 我 只 是 塞 柯 布 的 儿 子 。 一 旦 我 的 老 头 子 不 在 了 ， 那 么 你 在 这 里 看 到 的 所 有 土 地 就 都 属 于 我 了 。
	AI_Output(other, self, "DIA_Till_HALLO_selber_15_02"); //令 人 惊 异 ！

	Info_ClearChoices(DIA_Till_HALLO);
};

func void DIA_Till_HALLO_keinervoneuch()
{
	AI_Output(other, self, "DIA_Till_HALLO_keinervoneuch_15_00"); //我 不 是 农 场 工 人 。
	AI_Output(self, other, "DIA_Till_HALLO_keinervoneuch_03_01"); //你 想 要 从 这 里 得 到 什 么 ？ 我 们 什 么 都 没 有 。 所 以 你 可 以 马 上 离 开 了 。

	Info_ClearChoices(DIA_Till_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info feldarbeiter
///////////////////////////////////////////////////////////////////////
instance DIA_Till_FELDARBEITER(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 4;
	condition		= DIA_Till_FELDARBEITER_Condition;
	information		= DIA_Till_FELDARBEITER_Info;
	description		= "你 就 是 一 直 那 样 对 待 你 的 农 场 工 人 吗 ？";
};

func int DIA_Till_FELDARBEITER_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_FELDARBEITER_Info()
{
	AI_Output(other, self, "DIA_Till_FELDARBEITER_15_00"); //你 就 是 一 直 那 样 对 待 你 的 农 场 工 人 吗 ？
	AI_Output(self, other, "DIA_Till_FELDARBEITER_03_01"); //当 然 - 他 们 需 要 那 样 。 任 何 不 听 命 令 的 人 都 将 受 到 鞭 打 ， 那 就 是 这 里 的 规 矩 。
};

///////////////////////////////////////////////////////////////////////
//	Info Sekob
///////////////////////////////////////////////////////////////////////
instance DIA_Till_SEKOB(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 9;
	condition		= DIA_Till_SEKOB_Condition;
	information		= DIA_Till_SEKOB_Info;
	description		= "我 需 要 和 你 的 父 亲 谈 谈 。";
};

func int DIA_Till_SEKOB_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
	&& ((Npc_KnowsInfo(other, DIA_Sekob_HALLO)) == FALSE)
	&& (Kapitel < 3)
	&& (Npc_IsDead(Sekob) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Till_SEKOB_Info()
{
	AI_Output(other, self, "DIA_Till_SEKOB_15_00"); //我 需 要 和 你 的 父 亲 谈 谈 。
	AI_Output(self, other, "DIA_Till_SEKOB_03_01"); //他 没 时 间 。 不 过 我 是 他 的 代 理 人 。 我 能 帮 你 吗 ？
	AI_Output(other, self, "DIA_Till_SEKOB_15_02"); //把 我 介 绍 给 你 的 父 亲 。
	AI_Output(self, other, "DIA_Till_SEKOB_03_03"); //你 是 一 个 真 正 的 硬 汉 子 和 一 名 出 色 的 战 士 ， 嗯 ？
	AI_Output(other, self, "DIA_Till_SEKOB_15_04"); //最 好 的 。
	AI_Output(self, other, "DIA_Till_SEKOB_03_05"); //我 想 我 最 好 去 他 那 里 。
	AI_Output(other, self, "DIA_Till_SEKOB_15_06"); //不 用 担 心 ， 小 伙 子 。 我 会 找 到 他 的 ， 我 肯 定 。
	AI_Output(self, other, "DIA_Till_SEKOB_03_07"); //随 便 你 怎 么 说 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WASMACHSTDU(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 10;
	condition		= DIA_Till_WASMACHSTDU_Condition;
	information		= DIA_Till_WASMACHSTDU_Info;
	description		= "那 么 你 做 什 么 ？";
};

func int DIA_Till_WASMACHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Till_HALLO))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Till_WASMACHSTDU_15_00"); //那 么 当 你 不 扮 演 农 场 统 治 者 的 时 候 你 做 什 么 ？
	AI_Output(self, other, "DIA_Till_WASMACHSTDU_03_01"); //站 岗 。
	AI_Output(self, other, "DIA_Till_WASMACHSTDU_03_02"); //城 里 那 些 可 恶 的 民 兵 到 我 们 土 地 上 的 次 数 越 来 越 多 ， 并 且 把 他 们 能 拿 到 的 所 有 东 西 都 偷 走 。
	AI_Output(self, other, "DIA_Till_WASMACHSTDU_03_03"); //就 在 上 周 那 些 混 蛋 还 来 了 这 里 ， 他 们 拿 走 了 我 们 一 些 羊 。
	AI_Output(self, other, "DIA_Till_WASMACHSTDU_03_04"); //如 果 我 能 抓 住 他 们 之 中 的 某 个 人 的 话 ， 我 一 定 会 干 掉 他 。
	AI_Output(other, self, "DIA_Till_WASMACHSTDU_15_05"); //不 过 当 然 ！
};

///////////////////////////////////////////////////////////////////////
//	Info warumnichtsld
///////////////////////////////////////////////////////////////////////
instance DIA_Till_WARUMNICHTSLD(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 11;
	condition		= DIA_Till_WARUMNICHTSLD_Condition;
	information		= DIA_Till_WARUMNICHTSLD_Info;
	description		= "为 什 么 雇 佣 兵 不 帮 你 抵 抗 民 兵 ？";
};

func int DIA_Till_WARUMNICHTSLD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Till_WASMACHSTDU))
	&& (hero.guild != GIL_MIL)
	&& (Kapitel < 5))
	{
		return TRUE;
	};
};

func void DIA_Till_WARUMNICHTSLD_Info()
{
	AI_Output(other, self, "DIA_Till_WARUMNICHTSLD_15_00"); //为 什 么 雇 佣 兵 不 帮 你 抵 抗 民 兵 ？
	AI_Output(self, other, "DIA_Till_WARUMNICHTSLD_03_01"); //在 他 们 还 没 热 身 之 前 ， 我 就 已 经 把 他 们 赶 走 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Bronko
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKO(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 5;
	condition		= DIA_Till_BRONKO_Condition;
	information		= DIA_Till_BRONKO_Info;
	description		= "（ 询 问 有 关 布 隆 科 的 事 ）";
};

func int DIA_Till_BRONKO_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Till_FELDARBEITER))
	&& (Npc_KnowsInfo(other, DIA_Bronko_HALLO))
	&& (Kapitel < 5)
	)
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKO_Info()
{
	AI_Output(other, self, "DIA_Till_BRONKO_15_00"); //有 一 个 自 称 是 农 场 主 的 家 伙 ， 向 所 有 过 路 的 人 收 取 过 路 费。
	AI_Output(self, other, "DIA_Till_BRONKO_03_01"); //（ 胆 怯 的 ） 呃 ， 对 ， 我 知 道 。 那 是 布 隆 科 。 他 想 做 什 么 就 做 什 么 。
	AI_Output(self, other, "DIA_Till_BRONKO_03_02"); //我 千 百 次 千 百 次 地 教 训 他 ， 告 诉 他 应 该 回 去 工 作 。
	AI_Output(other, self, "DIA_Till_BRONKO_15_03"); //但 是 ？
	AI_Output(self, other, "DIA_Till_BRONKO_03_04"); //他 就 是 不 去 做 。

	if (Npc_IsDead(Sekob) == FALSE)
	{
		AI_Output(self, other, "DIA_Till_BRONKO_03_05"); //我 的 父 亲 对 我 非 常 生 气 ， 因 为 我 还 没 有 把 他 劝 回 去 工 作 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Bronkozurarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOZURARBEIT(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 6;
	condition		= DIA_Till_BRONKOZURARBEIT_Condition;
	information		= DIA_Till_BRONKOZURARBEIT_Info;
	permanent		= TRUE;
	description		= "也 许 我 可 以 帮 你 。";
};

var int DIA_Till_BRONKOZURARBEIT_noPerm;

func int DIA_Till_BRONKOZURARBEIT_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Till_BRONKO))
	&& (DIA_Till_BRONKOZURARBEIT_noPerm == FALSE)
	&& (Kapitel < 5)
	)
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOZURARBEIT_Info()
{
	AI_Output(other, self, "DIA_Till_BRONKOZURARBEIT_15_00"); //也 许 我 可 以 帮 你 。
	AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_03_01"); //你 是 认 真 的 吗 ？ 好 吧 ， 听 好 ， 如 果 你 能 让 布 隆 科 回 去 工 作 的 话 ， 我 愿 意 付 你 钱 ， 你 看10枚 金 币 ， 怎 么 样 ？

	Till_Angebot = 10;

	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);

	Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "没 问 题 。 但 是 我 想 要 更 多 的 钱。", DIA_Till_BRONKOZURARBEIT_mehr);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);
	Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "我 要 考 虑 一 下 。", DIA_Till_BRONKOZURARBEIT_nochnicht);
};

func void DIA_Till_BRONKOZURARBEIT_nochnicht()
{
	AI_Output(other, self, "DIA_Till_BRONKOZURARBEIT_nochnicht_15_00"); //我 要 考 虑 一 下 。
	AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_nochnicht_03_01"); //你 自 便 吧 。

	Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_ok()
{
	AI_Output(other, self, "DIA_Till_BRONKOZURARBEIT_ok_15_00"); //好 吧 。 我 会 看 看 能 做 什 么 。
	AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_ok_03_01"); //但 是 要 马 上 去 做 。

	DIA_Till_BRONKOZURARBEIT_noPerm = TRUE;
	MIS_Sekob_Bronko_eingeschuechtert = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Bronkoeingeschuechtert, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Bronkoeingeschuechtert, LOG_RUNNING);
	B_LogEntry(TOPIC_Bronkoeingeschuechtert, TOPIC_Bronkoeingeschuechtert_1);

	AI_StopProcessInfos(self);
};

func void DIA_Till_BRONKOZURARBEIT_mehr()
{
	if (Till_IchMachsNurEinmal == TRUE)
	{
		AI_Output(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_00"); //我 还 要 。
	}
	else
	{
		AI_Output(other, self, "DIA_Till_BRONKOZURARBEIT_mehr_15_01"); //没 问 题 。 但 是 我 想 要 更 多 的 钱。
		Till_IchMachsNurEinmal = TRUE;
	};

	if (Till_Angebot == 10)
	{
		AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_02"); //好 吧 。 那20枚 金 币 。
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "没 问 题 。 但 是 我 想 要 更 多 的 钱。", DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 20;
	}
	else if (Till_Angebot == 20)
	{
		AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_03"); //30?
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "没 问 题 。 但 是 我 想 要 更 多 的 钱。", DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 30;
	}
	else if (Till_Angebot == 30)
	{
		AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_04"); //也 许 … …50？
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "没 问 题 。 但 是 我 想 要 更 多 的 钱。", DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 50;
	}
	else if (Till_Angebot == 50)
	{
		AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_05"); //好 吧 。70？
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "没 问 题 。 但 是 我 想 要 更 多 的 钱。", DIA_Till_BRONKOZURARBEIT_mehr);
		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);
		Till_Angebot = 70;
	}
	else if (Till_Angebot == 70)
	{
		AI_Output(self, other, "DIA_Till_BRONKOZURARBEIT_mehr_03_06"); //好 吧 ， 好 吧 ！ 我 给 你100金 币 。 不 过 那 是 我 所 有 的 钱 了 。
		Info_ClearChoices(DIA_Till_BRONKOZURARBEIT);

		Info_AddChoice(DIA_Till_BRONKOZURARBEIT, "好 吧 。 我 会 看 看 能 做 什 么 。", DIA_Till_BRONKOZURARBEIT_ok);

		Till_Angebot = 100;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info bronkowiederanArbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Till_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 7;
	condition		= DIA_Till_BRONKOWIEDERANARBEIT_Condition;
	information		= DIA_Till_BRONKOWIEDERANARBEIT_Info;
	description		= "布 隆 科 回 去 工 作 了 。";
};

func int DIA_Till_BRONKOWIEDERANARBEIT_Condition()
{
	if (
	(MIS_Sekob_Bronko_eingeschuechtert == LOG_SUCCESS)
	&& (DIA_Till_BRONKOZURARBEIT_noPerm == TRUE)
	&& (Kapitel < 5)
	)
	{
		return TRUE;
	};
};

func void DIA_Till_BRONKOWIEDERANARBEIT_Info()
{
	AI_Output(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_00"); //布 隆 科 回 去 工 作 了 。
	AI_Output(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_01"); //真 的 ？ 那 太 好 了 。
	AI_Output(other, self, "DIA_Till_BRONKOWIEDERANARBEIT_15_02"); //是 的 。 现 在 我 想 要 我 的 钱 。

	IntToFloat(Till_Angebot);

	if (Till_Angebot <= 50)
	{
		AI_Output(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_03"); //（ 吞 吞 吐 吐 ） 嗯 。 好 吧 。 生 意 归 生 意 ， 对 吗 ？

		CreateInvItems(self, ItMi_Gold, Till_Angebot);
		B_GiveInvItems(self, other, ItMi_Gold, Till_Angebot);
	}
	else
	{
		AI_Output(self, other, "DIA_Till_BRONKOWIEDERANARBEIT_03_04"); //不 幸 的 是 ， 我 没 有 那 么 多 钱 。 但 是 我 非 常 感 谢 你 的 帮 助 。

		Till_HatSeinGeldBehalten = TRUE;
	};

	B_GivePlayerXP(XP_BronkoGehtAnDieArbeit);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info permkap1
///////////////////////////////////////////////////////////////////////
instance DIA_Till_PERMKAP1(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 99;
	condition		= DIA_Till_PERMKAP1_Condition;
	information		= DIA_Till_PERMKAP1_Info;
	permanent		= TRUE;
	description		= "（ 骚 扰 提 尔 ）";
};

func int DIA_Till_PERMKAP1_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Till_HALLO))
	|| (Kapitel >= 5))
	{
		return TRUE;
	};
};

func void DIA_Till_PERMKAP1_Info()
{
	if (Kapitel == 5)
	{
		if ((MIS_bringRosiBackToSekob != LOG_SUCCESS)
		&& (Rosi_FleeFromSekob_Kap5 == TRUE))
		{
			AI_Output(other, self, "DIA_Till_PERMKAP1_15_00"); //你 远 离 家 乡 ， 是 吗 ？ 爸 爸 在 这 里 也 帮 不 了 你 。
			AI_Output(self, other, "DIA_Till_PERMKAP1_03_01"); //总 有 一 天 ， 我 会 封 住 你 那 张 大 嘴 巴 。
		};

		AI_Output(other, self, "DIA_Till_PERMKAP1_15_02"); //你 这 个 失 败 者 ， 如 果 我 让 你 留 下 一 条 命 的 话 ， 就 是 你 的 运 气 。
		AI_Output(self, other, "DIA_Till_PERMKAP1_03_03"); //那 马 上 走 开 。
		AI_StopProcessInfos(self);
	}
	else
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(other, self, "DIA_Till_PERMKAP1_15_04"); //也 许 你 应 该 多 吃 一 点 才 能 长 得 高 大 强 壮 。
			AI_Output(self, other, "DIA_Till_PERMKAP1_03_05"); //有 一 天 我 会 让 你 见 识 一 下。
			AI_StopProcessInfos(self);
		}
		else
		{
			if (Till_HatSeinGeldBehalten == TRUE)
			{
				AI_Output(other, self, "DIA_Till_PERMKAP1_15_06"); //你 这 可 怜 的 小 … …
				AI_Output(self, other, "DIA_Till_PERMKAP1_03_07"); //那 就 走 开 点 。
				AI_StopProcessInfos(self);
			}
			else
			{
				AI_Output(other, self, "DIA_Till_PERMKAP1_15_08"); //今 天 有 人 打 你 的 鼻 子 了 吗 ？
				AI_Output(self, other, "DIA_Till_PERMKAP1_03_09"); //别 烦 我 ， 你 这 个 白 痴 。
			};
		};
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Till_PICKPOCKET(C_INFO)
{
	npc				= BAU_931_Till;
	nr				= 900;
	condition		= DIA_Till_PICKPOCKET_Condition;
	information		= DIA_Till_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Till_PICKPOCKET_Condition()
{
	C_Beklauen(36, 40);
};

func void DIA_Till_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
	Info_AddChoice(DIA_Till_PICKPOCKET, DIALOG_BACK, DIA_Till_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Till_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Till_PICKPOCKET_DoIt);
};

func void DIA_Till_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};

func void DIA_Till_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Till_PICKPOCKET);
};
