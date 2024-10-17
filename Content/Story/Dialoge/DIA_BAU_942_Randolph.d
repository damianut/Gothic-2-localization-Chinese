///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_EXIT(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 999;
	condition		= DIA_Randolph_EXIT_Condition;
	information		= DIA_Randolph_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Randolph_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Randolph_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SchwereLuft
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SchwereLuft(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 4;
	condition		= DIA_Randolph_SchwereLuft_Condition;
	information		= DIA_Randolph_SchwereLuft_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Randolph_SchwereLuft_Condition()
{
	if (!(Npc_IsDead(Alvares))
	&& !(Npc_IsDead(Engardo))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SchwereLuft_Info()
{
	AI_Output(other, self, "DIA_Randolph_SchwereLuft_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Randolph_SchwereLuft_06_01"); //嗯 … … 在 这 附 近 ， 只 要 有 人 说 了 任 何 错 话 ， 那 么 舞 会 就 开 始 了 … … 然 后 小 心 一 些 ， 否 则 他 们 就 会 变 成 屠 夫 。
	AI_Output(other, self, "DIA_Randolph_SchwereLuft_15_02"); //你 想 要 加 入 战 斗 ？
	AI_Output(self, other, "DIA_Randolph_SchwereLuft_06_03"); //在 骚 动 开 始 的 时 候 ， 我 不 会 光 是 站 在 这 里 。 但 是 我 也 不 会 推 波 助 澜 。
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_1);
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_HALLO(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 4;
	condition		= DIA_Randolph_HALLO_Condition;
	information		= DIA_Randolph_HALLO_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Randolph_HALLO_Condition()
{
	if ((Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_HALLO_Info()
{
	AI_Output(other, self, "DIA_Randolph_HALLO_15_00"); //一 切 都 好 吗 ？

	if (Npc_IsDead(Akil)
	&& Npc_IsDead(Kati))
	{
		AI_Output(self, other, "DIA_Randolph_HALLO_06_01"); //既 然 凯 提 和 阿 基 尔 已 经 被 带 到 英 诺 斯 的 国 度 ， 我 只 能 经 营 农 场 了 。

		Npc_ExchangeRoutine(self, "START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Randolph_HALLO_06_02"); //是 的 ， 我 很 好 。 那 个 阿 尔 瓦 雷 斯 最 近 变 得 越 来 越 大 胆 。 现 在 那 已 经 结 束 了 ， 这 样 很 好 。
	};

	AI_Output(self, other, "DIA_Randolph_HALLO_06_03"); //我 现 在 需 要 的 就 是 拜 访 一 下 旅 馆 。
};

///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Baltram(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 5;
	condition		= DIA_Randolph_Baltram_Condition;
	information		= DIA_Randolph_Baltram_Info;
	description		= "贝 尔 卓 姆 派 我 来 … …";
};

func int DIA_Randolph_Baltram_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	&& Npc_IsDead(Akil)
	&& Npc_IsDead(Kati)
	&& (Lieferung_Geholt == FALSE)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Baltram_Info()
{
	AI_Output(other, self, "DIA_Randolph_Baltram_15_00"); //贝 尔 卓 姆 派 我 来 的 。 我 来 取 走 他 的 货 物 。
	AI_Output(self, other, "DIA_Randolph_Baltram_06_01"); //好 。 我 已 经 把 所 有 东 西 都 准 备 好 了 。 这 是 你 的 包 裹 。
	CreateInvItems(self, ItMi_BaltramPaket, 1);
	B_GiveInvItems(self, other, ItMi_BaltramPaket, 1);
	Lieferung_Geholt = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Geschichte
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Geschichte(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 5;
	condition		= DIA_Randolph_Geschichte_Condition;
	information		= DIA_Randolph_Geschichte_Info;
	description		= "你 不 是 这 附 近 的 ， 对 吗 ？ ";
};

func int DIA_Randolph_Geschichte_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Geschichte_Info()
{
	AI_Output(other, self, "DIA_Randolph_Geschichte_15_00"); //你 不 是 这 附 近 的 ， 对 吗 ？
	AI_Output(self, other, "DIA_Randolph_Geschichte_06_01"); //我 从 南 边 的 岛 上 来 。 在 某 个 时 期 ， 他 们 说 克 霍 里 尼 斯 需 要 人 ， 因 为 那 些 魔 法 矿 石 。
	AI_Output(self, other, "DIA_Randolph_Geschichte_06_02"); //但 是 当 我 到 了 那 里 时 ， 他 们 设 置 了 这 个 巨 大 的 屏 障 。 而 我 不 想 进 那 里 去 ， 所 以 我 就 开 始 在 港 口 工 作 。
	AI_Output(self, other, "DIA_Randolph_Geschichte_06_03"); //嗯 ， 船 已 经 不 再 来 了 ， 所 以 我 就 去 为 阿 基 尔 工 作 。 实 际 上 ， 我 找 了 一 个 很 糟 糕 的 工 作 。
};

/*
Du kommst nicht aus der Gegend, richtig?
Ich komme von den südlichen Inseln. Irgendwann hieß es, sie bräuchten Leute in Khorinis, wegen dem magischen Erz.
Aber als ich ankam war da diese riesige Barriere. Und da wollte ich nicht rein. Ich hab dann angefangen im Hafen zu arbeiten.
Und seitdem keine Schiffe mehr kommen, bin ich halt zu Akil gegangen. Naja, ich hab schon schlechtere Jobs gemacht.

Hey, ich kenne da noch jemanden, der dir ein paar Sachen besorgen kann.
Ein Freund, der mit mir zusammen aus dem Süden gekommen ist.
Aber ich brauche 10 Goldmünzen, um beim Wett - Trinken in der Taverne mitzumachen.
Also wenn du die Info willst, dann gib mir das Gold.

// Wenn du die Taverne suchst dann geh einfach über die Brücke und folge dem Weg, dann kommst direkt daran vorbei.
*/
///////////////////////////////////////////////////////////////////////
//	Info Taverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_TAVERNE(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 5;
	condition		= DIA_Randolph_TAVERNE_Condition;
	information		= DIA_Randolph_TAVERNE_Info;
	description		= "你 一 直 在 酒 馆 里 面 呆 着 ？";
};

func int DIA_Randolph_TAVERNE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_HALLO))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_TAVERNE_Info()
{
	AI_Output(other, self, "DIA_Randolph_TAVERNE_15_00"); //你 一 直 在 酒 馆 里 面 呆 着 ？
	AI_Output(self, other, "DIA_Randolph_TAVERNE_06_01"); //那 很 正 确 。 但 是 最 近 不 行 。
	AI_Output(self, other, "DIA_Randolph_TAVERNE_06_02"); //我 没 钱 再 去 那 里 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasistinTaverne
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASISTINTAVERNE(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 6;
	condition		= DIA_Randolph_WASISTINTAVERNE_Condition;
	information		= DIA_Randolph_WASISTINTAVERNE_Info;
	description		= "酒 馆 究 竟 发 生 了 什 么 事 ？";
};

func int DIA_Randolph_WASISTINTAVERNE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_TAVERNE))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASISTINTAVERNE_Info()
{
	AI_Output(other, self, "DIA_Randolph_WASISTINTAVERNE_15_00"); //酒 馆 究 竟 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Randolph_WASISTINTAVERNE_06_01"); //那 里 有 赌 博 。
	AI_Output(self, other, "DIA_Randolph_WASISTINTAVERNE_06_02"); //两 个 人 互 相 较 量 。 喝 啤 酒 最 多 的 人 获 胜 。
	AI_Output(self, other, "DIA_Randolph_WASISTINTAVERNE_06_03"); //最 后 ， 我 一 直 在 输 ， 现 在 我 需 要 先 弄 点 钱 。
	Log_CreateTopic(TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_1);
};

///////////////////////////////////////////////////////////////////////
//	Info GegenWen
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_GEGENWEN(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 7;
	condition		= DIA_Randolph_GEGENWEN_Condition;
	information		= DIA_Randolph_GEGENWEN_Info;
	description		= "你 要 反 对 谁 ？";
};

func int DIA_Randolph_GEGENWEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_WASISTINTAVERNE))
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_GEGENWEN_Info()
{
	AI_Output(other, self, "DIA_Randolph_GEGENWEN_15_00"); //你 要 反 对 谁 ？
	AI_Output(self, other, "DIA_Randolph_GEGENWEN_06_01"); //对 抗 鲁 克 哈 ， 那 个 老 废 物 。 到 现 在 为 止 ， 他 每 次 都 能 打 败 我 。
	AI_Output(self, other, "DIA_Randolph_GEGENWEN_06_02"); //但 是 不 知 怎 么 ， 我 有 一 种 毛 骨 悚 然 的 感 觉 ， 那 个 卑 鄙 的 畜 牲 一 定 每 次 都 在 我 的 啤 酒 里 混 了 姜 酒 。
	AI_Output(self, other, "DIA_Randolph_GEGENWEN_06_03"); //我 怀 疑 他 把 那 些 姜 酒 藏 在 他 那 该 死 的 箱 子 里 。 那 个 恶 心 的 混 蛋 ！
	AI_Output(self, other, "DIA_Randolph_GEGENWEN_06_04"); //应 该 有 人 在 他 的 箱 子 里 放 上 一 些 白 水 。 那 样 就 随 便 他 往 我 的 啤 酒 里 加 东 西 了。
	AI_Output(self, other, "DIA_Randolph_GEGENWEN_06_05"); //只 要 我 还 有 足 够 的 钱 去 与 他 再 来 一 次 比 赛 的 话.

	B_LogEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_2);
	Log_AddEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_3);
};

///////////////////////////////////////////////////////////////////////
//	Info WasBrauchstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WASBRAUCHSTDU(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 8;
	condition		= DIA_Randolph_WASBRAUCHSTDU_Condition;
	information		= DIA_Randolph_WASBRAUCHSTDU_Info;
	description		= "你 需 要 多 少 钱 来 比 赛 ？";
};

func int DIA_Randolph_WASBRAUCHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
	&& (MIS_Rukhar_Wettkampf == LOG_RUNNING)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_WASBRAUCHSTDU_Info()
{
	AI_Output(other, self, "DIA_Randolph_WASBRAUCHSTDU_15_00"); //你 需 要 多 少 钱 来 比 赛 ？
	AI_Output(self, other, "DIA_Randolph_WASBRAUCHSTDU_06_01"); //１ ０ 枚 金 币。
};

///////////////////////////////////////////////////////////////////////
//	Info IchgebedirGeld
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_ICHGEBEDIRGELD(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 9;
	condition		= DIA_Randolph_ICHGEBEDIRGELD_Condition;
	information		= DIA_Randolph_ICHGEBEDIRGELD_Info;
	permanent		= TRUE;
	description		= "我 会 给 你 钱 让 你 和 鲁 克 哈 比 赛 。";
};

var int DIA_Randolph_ICHGEBEDIRGELD_noPerm;

func int DIA_Randolph_ICHGEBEDIRGELD_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Randolph_WASBRAUCHSTDU))
	&& (DIA_Randolph_ICHGEBEDIRGELD_noPerm == FALSE)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

func void DIA_Randolph_ICHGEBEDIRGELD_Info()
{
	AI_Output(other, self, "DIA_Randolph_ICHGEBEDIRGELD_15_00"); //我 会 给 你 钱 让 你 和 鲁 克 哈 比 赛 。

	if (B_GiveInvItems(other, self, ItMi_Gold, 10))
	{
		AI_Output(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_01"); //（ 热 心 的 ） 真 的 ？ 太 谢 谢 你 了 。 我 会 很 快 报 答 你 的 。
		AI_Output(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_02"); //如 果 我 赢 了 的 话 ， 我 甚 至 愿 意 多 付 一 些 。 我 就 靠 你 了 。

		B_LogEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_4);
		B_GivePlayerXP(XP_Randolph_WettkampfStart);

		DIA_Randolph_ICHGEBEDIRGELD_noPerm = TRUE;

		B_NpcClearObsessionByDMT(self);

		MIS_Rukhar_Wettkampf_Day = Wld_GetDay();

		Npc_ExchangeRoutine(self, "Wettkampf");
		B_StartOtherRoutine(Orlan, "Wettkampf");
		B_StartOtherRoutine(Rukhar, "Wettkampf");
	}
	else
	{
		AI_Output(self, other, "DIA_Randolph_ICHGEBEDIRGELD_06_03"); //没 问 题 。 你 自 己 都 不 够 了 。
	};

	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WettkampfZuende
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_WETTKAMPFZUENDE(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 10;
	condition		= DIA_Randolph_WETTKAMPFZUENDE_Condition;
	information		= DIA_Randolph_WETTKAMPFZUENDE_Info;
	permanent		= TRUE;
	description		= "宿 醉 ？";
};

func int DIA_Randolph_WETTKAMPFZUENDE_Condition()
{
	if ((MIS_Rukhar_Wettkampf == LOG_SUCCESS)
	&& (Kapitel < 4))
	{
		return TRUE;
	};
};

var int DIA_Randolph_WETTKAMPFZUENDE_OneTime;
func void DIA_Randolph_WETTKAMPFZUENDE_Info()
{
	AI_Output(other, self, "DIA_Randolph_WETTKAMPFZUENDE_15_00"); //宿 醉 ？

	if (Rukhar_Won_Wettkampf == TRUE)
	{
		AI_Output(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_01"); //这 次 是 最 厉 害 的 一 次 宿 醉 ， 我 摆 脱 不 了 它 。 我 再 也 不 会 喝 一 杯 酒 了 ， 我 发 誓 。
		AI_Output(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_02"); //你 的 钱 没 了 。 我 很 抱 歉 。
	}
	else
	{
		AI_Output(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_03"); //不 。 我 感 觉 很 好 ， 真 的 。

		if (DIA_Randolph_WETTKAMPFZUENDE_OneTime == FALSE)
		{
			AI_Output(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_04"); //这 次 终 于 成 功 了 。 再 次 感 谢 你 的 资 助 。 给 ， 拿 回 去 吧 。
			CreateInvItems(self, ItMi_Gold, 20);
			B_GiveInvItems(self, other, ItMi_Gold, 12);
			DIA_Randolph_WETTKAMPFZUENDE_OneTime = TRUE;
		};

		AI_Output(self, other, "DIA_Randolph_WETTKAMPFZUENDE_06_05"); //看 来 鲁 克 哈 不 会 很 快 爬 起 来 的 。
	};

	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_PERM(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 30;
	condition		= DIA_Randolph_PERM_Condition;
	information		= DIA_Randolph_PERM_Info;
	permanent		= TRUE;
	description		= "你 疯 了 吗 ？";
};

func int DIA_Randolph_PERM_Condition()
{
	if ((Kapitel >= 4)
	&& (NpcObsessedByDMT_Randolph == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Randolph_PERM_GotMoney;

func void DIA_Randolph_PERM_Info()
{
	if (hero.guild == GIL_KDF)
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other, self, "DIA_Randolph_PERM_15_00"); //你 疯 了 吗 ？

		if (((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		&& (MIS_HealRandolph != LOG_SUCCESS))
		{
			if ((DIA_Sagitta_HEALRANDOLPH_GotOne == FALSE)
			&& (DIA_Sagitta_HEALRANDOLPH_KnowsPrice == TRUE)
			&& (DIA_Randolph_PERM_GotMoney == FALSE))
			{
				AI_Output(other, self, "DIA_Randolph_PERM_15_01"); //你 派 我 出 去 而 且 不 给 一 分 钱 ， 而 且 还 不 愿 意 告 诉 我 这 个 东 西 有 那 么 值 钱 ？
				AI_Output(other, self, "DIA_Randolph_PERM_15_02"); //萨 吉 塔 向 我 要300枚 金 币。
				AI_Output(self, other, "DIA_Randolph_PERM_06_03"); //我 最 多 给 你150枚 金 币 。 请 你 一 定 要 帮 助 我 。 求 求 你 。
				CreateInvItems(self, ItMi_Gold, 150);
				B_GiveInvItems(self, other, ItMi_Gold, 150);
				DIA_Randolph_PERM_GotMoney = TRUE;
			}
			else
			{
				AI_Output(self, other, "DIA_Randolph_PERM_06_04"); //真 的 被 打 垮 了 。 自 从 我 不 再 喝 酒 开 始 ， 那 种 空 虚 的 感 觉 快 要 杀 死 我 了 。 我 真 的 需 要 帮 助 。
				AI_Output(self, other, "DIA_Randolph_PERM_06_05"); //有 一 种 药 物 可 能 会 起 作 用 。
				AI_Output(self, other, "DIA_Randolph_PERM_06_06"); //萨 吉 塔 ， 那 个 老 草 药 女 巫 ， 以 前 会 为 我 准 备 一 些 。 但 是 现 在 那 些 兽 人 就 在 附 近 ， 我 根 本 不 可 能 再 到 她 那 里 去 了 。
			};

			Log_CreateTopic(TOPIC_HealRandolph, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HealRandolph, LOG_RUNNING);
			B_LogEntry(TOPIC_HealRandolph, TOPIC_HealRandolph_1);

			MIS_HealRandolph = LOG_RUNNING;
		}
		else
		{
			AI_Output(self, other, "DIA_Randolph_PERM_06_07"); //我 的 腿 还 有 点 颤 抖 ， 但 是 除 此 之 外 ， 我 已 经 好 多 了 。
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_Heilung(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 55;
	condition		= DIA_Randolph_Heilung_Condition;
	information		= DIA_Randolph_Heilung_Info;
	permanent		= TRUE;
	description		= "烈 酒 影 响 了 你 的 头 脑 ， 嗯 ？";
};

func int DIA_Randolph_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Randolph == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Randolph_Heilung_Info()
{
	AI_Output(other, self, "DIA_Randolph_Heilung_15_00"); //烈 酒 影 响 了 你 的 头 脑 ， 嗯 ？
	AI_Output(self, other, "DIA_Randolph_Heilung_06_01"); //我 决 不 会 再 喝 一 杯 酒 了 。 这 一 生 都 不 会 。 你 就 等 着 瞧 吧 ， 老 兄 。
	B_NpcClearObsessionByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info SagittaHeal
///////////////////////////////////////////////////////////////////////
instance DIA_Randolph_SAGITTAHEAL(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 56;
	condition		= DIA_Randolph_SAGITTAHEAL_Condition;
	information		= DIA_Randolph_SAGITTAHEAL_Info;
	description		= "给 。 这 可 以 减 轻 你 的 症 状 。";
};

func int DIA_Randolph_SAGITTAHEAL_Condition()
{
	if ((MIS_HealRandolph == LOG_RUNNING)
	&& (Npc_HasItems(other, ItPo_HealRandolph_MIS)))
	{
		return TRUE;
	};
};

func void DIA_Randolph_SAGITTAHEAL_Info()
{
	AI_Output(other, self, "DIA_Randolph_SAGITTAHEAL_15_00"); //给 。 这 可 以 减 轻 你 的 症 状 。
	B_GiveInvItems(other, self, ItPo_HealRandolph_MIS, 1);

	if (Npc_IsInState(self, ZS_Pick_FP))
	{
		B_UseItem(self, ItPo_HealRandolph_MIS);
	};

	AI_Output(self, other, "DIA_Randolph_SAGITTAHEAL_06_01"); //啊 ！ 谢 谢 ， 老 兄 。 现 在 我 又 能 好 好 休 息 了 。
	AI_Output(self, other, "DIA_Randolph_SAGITTAHEAL_06_02"); //我 怎 么 才 能 报 答 你 呢 ？。

	if (DIA_Randolph_PERM_GotMoney == FALSE)
	{
		AI_Output(self, other, "DIA_Randolph_SAGITTAHEAL_06_03"); //我 想 这 一 点 钱 只 能 让 我 不 太 丢 脸 。 但 是 恐 怕 那 已 经 是 全 部 了 。

		CreateInvItems(self, ItMi_Gold, 150);
		B_GiveInvItems(self, other, ItMi_Gold, 150);
	}
	else
	{
		AI_Output(other, self, "DIA_Randolph_SAGITTAHEAL_15_04"); //我 给 你 付 了 那 么 一 大 笔 钱 ， 而 你 这 点 零 头 连 我 的 花 费 都 抵 不 上 。
		AI_Output(self, other, "DIA_Randolph_SAGITTAHEAL_06_05"); //嗯 - 那 样 的 话 ， 我 只 能 感 谢 我 这 么 幸 运 能 遇 到 你 这 样 愿 意 帮 助 他 人 的 圣 骑 士 ， 你 认 为 呢 ？
	};

	MIS_HealRandolph = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealRandolph);
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Randolph_PICKPOCKET(C_INFO)
{
	npc				= BAU_942_Randolph;
	nr				= 900;
	condition		= DIA_Randolph_PICKPOCKET_Condition;
	information		= DIA_Randolph_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Randolph_PICKPOCKET_Condition()
{
	C_Beklauen(58, 2); // Joly: darf nicht Gold mehr haben!
};

func void DIA_Randolph_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
	Info_AddChoice(DIA_Randolph_PICKPOCKET, DIALOG_BACK, DIA_Randolph_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Randolph_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Randolph_PICKPOCKET_DoIt);
};

func void DIA_Randolph_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};

func void DIA_Randolph_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Randolph_PICKPOCKET);
};
