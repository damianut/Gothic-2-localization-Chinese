// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Buster_EXIT(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 999;
	condition		= DIA_Buster_EXIT_Condition;
	information		= DIA_Buster_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Buster_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hallo
// ************************************************************
instance DIA_Buster_Hello(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 1;
	condition		= DIA_Buster_Hello_Condition;
	information		= DIA_Buster_Hello_Info;
	important		= TRUE;
};

func int DIA_Buster_Hello_Condition()
{
	if ((self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST) // Wegen News - Info kommt nicht mehr gut, wenn schonmal geprügelt
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_Hello_Info()
{
	AI_Output(self, other, "DIA_Buster_Hello_13_00"); //看 看 谁 来 了 ？ 我 是 不 是 在 哪 里 见 过 你 ？

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "如 果 你 那 么 说 的 话 。 我 就 去 找 地 主 。", DIA_Buster_Hello_GoingToFarm);
	Info_AddChoice(DIA_Buster_Hello, "谁 想 知 道 ？", DIA_Buster_Hello_WhoAreYou);
};

func void DIA_Buster_Hello_WhoAreYou()
{
	AI_Output(other, self, "DIA_Buster_Hello_WhoAreYou_15_00"); //谁 想 知 道 ？
	AI_Output(self, other, "DIA_Buster_Hello_WhoAreYou_13_01"); //我 是 巴 斯 特 ， 是 李 的 一 个 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Buster_Hello_WhoAreYou_13_02"); //那 你 最 好 对 我 友 好 些 ， 否 则 ， 我 将 剥 了 你 的 皮 ！
	AI_Output(self, other, "DIA_Buster_Hello_WhoAreYou_13_03"); //好 吧 ， 你 现 在 想 要 什 么 ？

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "那 不 关 你 的 事 。", DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello, "我 认 识 李 ！", DIA_Buster_Hello_IKnowLee);
	Info_AddChoice(DIA_Buster_Hello, "如 果 你 那 么 说 的 话 。 我 就 去 找 地 主 。", DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_IKnowLee()
{
	AI_Output(other, self, "DIA_Buster_Hello_IKnowLee_15_00"); //我 认 识 李 ！
	AI_Output(self, other, "DIA_Buster_Hello_IKnowLee_13_01"); //所 有 的 人 都 知 道 李 ！ 那 并 不 代 表 什 么 ， 伙 计 。 现 在 ， 你 正 在 跟 我 讲 话 ！
	AI_Output(self, other, "DIA_Buster_Hello_IKnowLee_13_02"); //那 么 ， 你 往 哪 里 去 ？

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "那 不 关 你 的 事 。", DIA_Buster_Hello_NotYourBusiness);
	Info_AddChoice(DIA_Buster_Hello, "如 果 你 那 么 说 的 话 。 我 就 去 找 地 主 。", DIA_Buster_Hello_GoingToFarm);
};

func void DIA_Buster_Hello_NotYourBusiness()
{
	AI_Output(other, self, "DIA_Buster_Hello_NotYourBusiness_15_00"); //那 不 关 你 的 事 。
	AI_Output(self, other, "DIA_Buster_Hello_NotYourBusiness_13_01"); //没 有 人 跟 我 这 样 说 话 ， 你 这 个 小 人 物 ！ 我 想 现 在 该 给 一 顿 响 亮 的 鞭 子 了 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Buster_Hello_GoingToFarm()
{
	AI_Output(other, self, "DIA_Buster_Hello_GoingToFarm_15_00"); //如 果 你 那 么 说 的 话 。 我 就 去 找 地 主 。
	AI_Output(self, other, "DIA_Buster_Hello_GoingToFarm_13_01"); //真 的 吗 … … 哼 - 对 我 来 说 ， 你 看 起 来 并 不 那 么 危 险 。

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "想 要 查 清 楚 ？", DIA_Buster_Hello_WannaTestIt);
	Info_AddChoice(DIA_Buster_Hello, "我 偶 然 杀 了 一 两 头 野 兽 。", DIA_Buster_Hello_SlewBeasts);
	Info_AddChoice(DIA_Buster_Hello, "你 做 得 正 确 。", DIA_Buster_Hello_ImNoDanger);
};

func void DIA_Buster_Hello_ImNoDanger()
{
	AI_Output(other, self, "DIA_Buster_Hello_ImNoDanger_15_00"); //你 做 得 正 确 。
	AI_Output(self, other, "DIA_Buster_Hello_ImNoDanger_13_01"); //（ 自 以 为 是 的 ） 是 的 ， 这 些 年 来 你 学 会 了 观 察 这 些 东 西 ， 老 兄 。
	AI_Output(self, other, "DIA_Buster_Hello_ImNoDanger_13_02"); //我 们 时 常 在 这 里 与 兽 人 交 战 ， 或 者 是 城 里 来 的 守 卫 。 他 们 是 顽 固 的 小 混 蛋 。 （ 大 笑 ）。

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "你 是 说 ‘ 真 的 ’ 兽 人 ？ 那 些 大 家 伙 ？", DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello, "真 的 ？", DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello, "印 象 深 刻 。", DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_SlewBeasts()
{
	AI_Output(other, self, "DIA_Buster_Hello_SlewBeasts_15_00"); //我 偶 然 杀 了 一 两 头 野 兽 。
	AI_Output(self, other, "DIA_Buster_Hello_SlewBeasts_13_01"); //哈 ！ （ 大 笑 ） 你 也 许 在 田 里 捏 死 了 几 只 象 鼻 虫 ， 或 是 把 几 只 田 鼠 从 它 们 的 洞 里 头 赶 出 来 。
	AI_Output(self, other, "DIA_Buster_Hello_SlewBeasts_13_02"); //我 们 正 在 对 付 这 里 的 兽 人 ！ 嗯 ， 是 的 ， 还 有 那 些 城 里 的 垃 圾 守 卫 。 （ 嘲 笑 ）

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "你 是 说 ‘ 真 的 ’ 兽 人 ？ 那 些 大 家 伙 ？", DIA_Buster_Hello_RealOrcs);
	Info_AddChoice(DIA_Buster_Hello, "真 的 ？", DIA_Buster_Hello_SoWhat);
	Info_AddChoice(DIA_Buster_Hello, "印 象 深 刻 。", DIA_Buster_Hello_Impressive);
};

func void DIA_Buster_Hello_WannaTestIt()
{
	AI_Output(other, self, "DIA_Buster_Hello_WannaTestIt_15_00"); //想 要 查 清 楚 ？
	AI_Output(self, other, "DIA_Buster_Hello_WannaTestIt_13_01"); //哎 呀 ！ 我 嘲 笑 的 对 象 错 了 ， 是 吗 ？
	AI_Output(other, self, "DIA_Buster_Hello_WannaTestIt_15_02"); //你 可 以 这 么 说 。
	AI_Output(self, other, "DIA_Buster_Hello_WannaTestIt_13_03"); //那 好 吧 ， 让 我 看 看 你 的 本 事 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Buster_Hello_Impressive()
{
	AI_Output(other, self, "DIA_Buster_Hello_Impressive_15_00"); //印 象 深 刻 。
	AI_Output(self, other, "DIA_Buster_Hello_Impressive_13_01"); //（ 大 笑 ） 那 是 我 们 的 事 ， 小 子 ！ 我 们 连 武 器 和 盔 甲 都 是 自 己 生 产 的 ！
	AI_Output(self, other, "DIA_Buster_Hello_Impressive_13_02"); //我 们 每 天 都 在 跟 死 亡 作 斗 争 。 不 过 ， 象 你 这 样 的 乡 下 土 包 子 不 会 懂 的 ！

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "我 想 我 必 须 让 你 看 看 关 于 那 些 我 了 解 的 有 多 少 ！", DIA_Buster_Hello_LetMeShowYou);
	Info_AddChoice(DIA_Buster_Hello, "随 便 你 说 吧 。", DIA_Buster_Hello_IfYouSaySo);
};

func void DIA_Buster_Hello_IfYouSaySo()
{
	AI_Output(other, self, "DIA_Buster_Hello_IfYouSaySo_15_00"); //随 便 你 说 吧 。
	AI_Output(self, other, "DIA_Buster_Hello_IfYouSaySo_13_01"); //（ 发 出 一 个 无 聊 的 哼 声 ） 赶 快 ， 胆 小 鬼 ！

	AI_StopProcessInfos(self);
};

func void DIA_Buster_Hello_LetMeShowYou()
{
	AI_Output(other, self, "DIA_Buster_Hello_LetMeShowYou_15_00"); //我 想 我 必 须 让 你 看 看 关 于 那 些 我 了 解 的 有 多 少 ！
	AI_Output(self, other, "DIA_Buster_Hello_LetMeShowYou_13_01"); //那 么 是 你 自 己 发 动 的 农 民 起 义 ， 是 吗 ？
	AI_Output(self, other, "DIA_Buster_Hello_LetMeShowYou_13_02"); //那 好 吧 ， 让 我 看 看 你 的 本 事 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Buster_Hello_SoWhat()
{
	AI_Output(other, self, "DIA_Buster_Hello_SoWhat_15_00"); //真 的 ？
	AI_Output(self, other, "DIA_Buster_Hello_SoWhat_13_01"); //（ 轻 蔑 地 哼 ） 似 乎 你 知 道 我 在 说 什 么 。 你 觉 得 你 非 常 强 壮 ， 是 吗 ？
	AI_Output(self, other, "DIA_Buster_Hello_SoWhat_13_02"); //（ 愤 怒 的 ） 也 许 是 时 候 让 人 教 训 你 一 下 了 ！

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "随 时 奉 陪 ！", DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello, "只 是 在 开 玩 笑 … …", DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_RealOrcs()
{
	AI_Output(other, self, "DIA_Buster_Hello_RealOrcs_15_00"); //你 是 说 ‘ 真 的 ’ 兽 人 ？ 那 些 大 家 伙 ？
	AI_Output(self, other, "DIA_Buster_Hello_RealOrcs_13_01"); //（ 叹 息 ） 我 的 意 思 是 … … 等 一 下 ！ 你 在 跟 我 开 玩 笑 ？！
	AI_Output(other, self, "DIA_Buster_Hello_RealOrcs_15_02"); //（ 微 笑 着 ） 比 我 差 得 远 了 。
	AI_Output(self, other, "DIA_Buster_Hello_RealOrcs_13_03"); //你 这 条 虫 ！ （ 愚 蠢 地 挑 战 ） 你 真 的 要 自 找 吗 ， 嗯 ？
	AI_Output(self, other, "DIA_Buster_Hello_RealOrcs_13_04"); //那 就 来 给 我 看 看 你 的 本 事 吧 ， 你 这 个 ‘ 英 雄 ’ ！

	Info_ClearChoices(DIA_Buster_Hello);

	Info_AddChoice(DIA_Buster_Hello, "随 时 奉 陪 ！", DIA_Buster_Hello_Whenever);
	Info_AddChoice(DIA_Buster_Hello, "只 是 在 开 玩 笑 … …", DIA_Buster_Hello_JustJoking);
};

func void DIA_Buster_Hello_Whenever()
{
	AI_Output(other, self, "DIA_Buster_Hello_Whenever_15_00"); //随 时 奉 陪 ！
	AI_Output(self, other, "DIA_Buster_Hello_Whenever_13_01"); //走 近 点 吧 ， 老 兄 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Buster_Hello_JustJoking()
{
	AI_Output(other, self, "DIA_Buster_Hello_JustJoking_15_00"); //只 是 在 开 玩 笑 … …
	AI_Output(self, other, "DIA_Buster_Hello_JustJoking_13_01"); //是 的 ， 对 了 ， 缩 回 去 吧 ！ 从 我 的 视 线 里 滚 出 去 ！

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				 FightNone
// ************************************************************
instance DIA_Buster_FightNone(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 1;
	condition		= DIA_Buster_FightNone_Condition;
	information		= DIA_Buster_FightNone_Info;
	important		= TRUE;
};

func int DIA_Buster_FightNone_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Buster_Hello))
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Buster_FightNone_Info()
{
	AI_Output(self, other, "DIA_Buster_FightNone_13_00"); //你 想 干 什 么 ， 胆 小 鬼 ？
};

// ************************************************************
// 		  				 Wanna Join
// ************************************************************
instance DIA_Buster_Duell(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 3;
	condition		= DIA_Buster_Duell_Condition;
	information		= DIA_Buster_Duell_Info;
	permanent		= TRUE;
	description		= "我 要 和 你 决 斗 ！";
};

func int DIA_Buster_Duell_Condition()
{
	if (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void DIA_Buster_Duell_Info()
{
	AI_Output(other, self, "DIA_Buster_Duell_15_00"); //我 要 和 你 决 斗 ！
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self, other, "DIA_Buster_Duell_13_01"); //啊 哈 ！ 你 不 想 坐 下 来 ， 嗯 ？ 好 吧 - 到 这 儿 来 ！
	}
	else // WON oder CANCEL
	{
		AI_Output(self, other, "DIA_Buster_Duell_13_02"); //你 还 要 试 一 下 吗 ？ 讨 厌 的 小 混 蛋 - 好 吧 ， 到 这 儿 来 ！
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self, other, "DIA_Buster_Duell_13_03"); //但 是 不 要 再 逃 跑 了 ！
		};
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 		  				 Wanna Join
// ************************************************************
instance DIA_Buster_WannaJoin(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 2;
	condition		= DIA_Buster_WannaJoin_Condition;
	information		= DIA_Buster_WannaJoin_Info;
	permanent		= TRUE;
	description		= "我 想 要 加 入 雇 佣 兵 ！";
};

func int DIA_Buster_WannaJoin_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Buster_Duell == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Buster_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Buster_WannaJoin_15_00"); //我 想 要 加 入 雇 佣 兵 ！
	if ((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	|| (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, other, "DIA_Buster_WannaJoin_13_01"); //像 你 这 么 能 打 的 人 应 该 不 会 惹 出 一 身 的 麻 烦 。
		}
		else // FIGHT_WON
		{
			AI_Output(self, other, "DIA_Buster_WannaJoin_13_02"); //你 不 是 最 好 的 战 士 ， 但 也 不 是 胆 小 鬼 。
		};

		AI_Output(self, other, "DIA_Buster_WannaJoin_13_03"); //我 的 投 票 不 算 什 么 数 ， 因 为 我 来 这 里 还 不 久 ， 不 过 要 是 李 来 问 我 ， 我 会 投 你 一 票 。
		Buster_Duell = TRUE;
		Log_CreateTopic(TOPIC_SLDRespekt, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRespekt, LOG_RUNNING);
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_5);
	}
	else // FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output(self, other, "DIA_Buster_WannaJoin_13_04"); //你 ？ 我 不 记 得 他 们 让 哪 个 胆 小 鬼 加 入 过 雇 佣 兵 … …
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_CANCEL)
		{
			AI_Output(self, other, "DIA_Buster_WannaJoin_13_05"); //在 决 斗 中 逃 跑 - 你 在 这 里 是 混 不 下 去 的 ！
		};
	};
};

// ************************************************************
// 		  				 Mehr über Söldner
// ************************************************************
var int Buster_SentenzaTip;
instance DIA_Buster_OtherSld(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 1;
	condition		= DIA_Buster_OtherSld_Condition;
	information		= DIA_Buster_OtherSld_Info;
	description		= "我 想 要 了 解 更 多 关 于 雇 佣 兵 和 这 个 地 区 的 事 。";
};

func int DIA_Buster_OtherSld_Condition()
{
	if ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Buster_OtherSld_Info()
{
	AI_Output(other, self, "DIA_Buster_OtherSld_15_00"); //我 想 要 了 解 更 多 关 于 雇 佣 兵 和 这 个 地 区 的 事 。
	AI_Output(self, other, "DIA_Buster_OtherSld_13_01"); //我 不 会 告 诉 你 很 多 关 于 这 个 地 区 的 事 。 你 最 好 还 是 去 问 问 那 些 农 民 。
	AI_Output(self, other, "DIA_Buster_OtherSld_13_02"); //对 我 们 雇 佣 兵 来 说 - 我 们 有 一 个 非 常 简 单 的 规 矩 ： 如 果 你 能 立 住 脚 ， 你 就 行 。
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Buster_OtherSld_13_03"); //我 想 你 天 生 适 合 于 干 我 们 这 一 行 。
		AI_Output(self, other, "DIA_Buster_OtherSld_13_04"); //但 你 不 该 招 惹 那 样 的 事 ， 幸 而 在 我 们 最 后 一 次 搏 斗 时 你 逢 凶 化 吉 了 。
		AI_Output(self, other, "DIA_Buster_OtherSld_13_05"); //农 场 里 有 很 多 家 伙 比 我 厉 害 得 多 … …
		AI_Output(self, other, "DIA_Buster_OtherSld_13_06"); //森 腾 扎 就 是 一 个 。 他 守 卫 进 入 农 场 的 大 门 。 无 论 你 做 什 么 都 行 ， 就 是 不 要 跟 他 打 。
		Buster_SentenzaTip = TRUE;
	}
	else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
	{
		// NICHTS (s.o.)
	}
	else // FIGHT_NONE oder FIGHT_CANCEL
	{
		AI_Output(self, other, "DIA_Buster_OtherSld_13_07"); //但 我 为 什 么 要 把 那 些 告 诉 你 ， 你 这 个 笨 蛋 ！
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 		  				About Sentenza
// ************************************************************
var int Buster_GoldZumBrennen;
var int Buster_Bonus;
instance DIA_Buster_AboutSentenza(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 1;
	condition		= DIA_Buster_AboutSentenza_Condition;
	information		= DIA_Buster_AboutSentenza_Info;
	description		= "那 么 这 森 腾 扎 呢 ？";
};

func int DIA_Buster_AboutSentenza_Condition()
{
	if (Buster_SentenzaTip == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_AboutSentenza_Info()
{
	AI_Output(other, self, "DIA_Buster_AboutSentenza_15_00"); //那 么 这 森 腾 扎 呢 ？
	AI_Output(self, other, "DIA_Buster_AboutSentenza_13_01"); //等 你 来 农 场 时 ， 他 会 设 法 向 你 敲 诈 一 些 金 子 - 他 对 所 有 新 来 的 都 这 么 做 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_13_02"); //而 如 果 我 是 你 ， 我 会 付 钱 。 我 当 时 就 是 这 么 做 的 。 好 在 后 来 他 投 了 我 一 票 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_13_03"); //他 说 ， 礼 尚 往 来 。 出 乎 意 料 ， 那 次 我 失 去 了 所 有 的 金 子 ， 不 过 本 来 也 没 多 少 钱 。 而 且 后 来 我 还 为 此 而 庆 幸 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_13_04"); //我 曾 经 看 见 过 他 毒 打 一 个 不 想 付 钱 给 他 的 家 伙 。
	AI_Output(other, self, "DIA_Buster_AboutSentenza_15_05"); //谢 谢 你 的 提 醒 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_13_06"); //真 的 。 这 对 你 有 什 么 价 值 吗 ？

	Info_ClearChoices(DIA_Buster_AboutSentenza);
	Info_AddChoice(DIA_Buster_AboutSentenza, "不 。", DIA_Buster_AboutSentenza_No);
	Info_AddChoice(DIA_Buster_AboutSentenza, "给 你 - ５ 枚 金 币 。", DIA_Buster_AboutSentenza_Give);
};

func void DIA_Buster_AboutSentenza_Give()
{
	AI_Output(other, self, "DIA_Buster_AboutSentenza_Give_15_00"); //给 你 - ５ 枚 金 币 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_Give_13_01"); //谢 谢 你 ， 老 兄 。 总 之 ， 看 来 我 今 天 晚 上 学 了 点 东 西 。 我 不 会 忘 记 这 些 的 。
	Buster_GoldZumBrennen = TRUE;
	Buster_Bonus = 50;
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

func void DIA_Buster_AboutSentenza_No()
{
	AI_Output(other, self, "DIA_Buster_AboutSentenza_No_15_00"); //不 。
	AI_Output(self, other, "DIA_Buster_AboutSentenza_No_13_01"); //我 也 这 么 想 。
	Info_ClearChoices(DIA_Buster_AboutSentenza);
};

// ************************************************************
// 		  				 LeeLeader
// ************************************************************
instance DIA_Buster_LeeLeader(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 2;
	condition		= DIA_Buster_LeeLeader_Condition;
	information		= DIA_Buster_LeeLeader_Info;
	description		= "李 是 雇 佣 兵 的 首 领 ， 对 吗 ？";
};

func int DIA_Buster_LeeLeader_Condition()
{
	if (Buster_Duell == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Buster_LeeLeader_Info()
{
	AI_Output(other, self, "DIA_Buster_LeeLeader_15_00"); //李 是 雇 佣 兵 的 首 领 ， 对 吗 ？
	AI_Output(self, other, "DIA_Buster_LeeLeader_13_01"); //对 了 - 嘿 ， 现 在 我 想 起 来 我 是 在 哪 里 认 识 你 的 了 ！ 你 也 在 流 放 地 呆 过 。
	AI_Output(other, self, "DIA_Buster_LeeLeader_15_02"); //（ 叹 息 ） 我 是 在 那 里 呆 过 。
	AI_Output(self, other, "DIA_Buster_LeeLeader_13_03"); //在 那 次 大 爆 炸 发 生 时 我 没 看 到 你 。 在 那 之 前 我 也 没 见 到 你 。
	AI_Output(other, self, "DIA_Buster_LeeLeader_15_04"); //我 有 别 的 事 。
	AI_Output(self, other, "DIA_Buster_LeeLeader_13_05"); //那 么 ， 你 错 过 了 很 多 事 情 - 从 我 们 一 起 在 监 狱 里 起 ， 事 情 就 改 变 了 。
};

// ************************************************************
// 		  				 WhatHappened
// ************************************************************
instance DIA_Buster_WhatHappened(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 2;
	condition		= DIA_Buster_WhatHappened_Condition;
	information		= DIA_Buster_WhatHappened_Info;
	description		= "流 放 地 的 雇 佣 兵 发 生 了 什 么 事 ？ ";
};

func int DIA_Buster_WhatHappened_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Buster_LeeLeader))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Buster_WhatHappened_Info()
{
	AI_Output(other, self, "DIA_Buster_WhatHappened_15_00"); //流 放 地 的 雇 佣 兵 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Buster_WhatHappened_13_01"); //当 屏 障 消 失 后 ， 李 带 领 我 们 离 开 了 流 放 地 。 他 说 如 果 我 们 拧 紧 一 股 绳 ， 我 们 就 不 会 出 什 么 事 ， 而 他 是 对 的 。
	AI_Output(self, other, "DIA_Buster_WhatHappened_13_02"); //没 过 多 久 我 们 在 这 里 找 到 了 一 个 安 身 之 地 。 这 里 的 地 主 雇 我 们 去 教 训 那 些 城 里 来 的 民 兵 。
	AI_Output(self, other, "DIA_Buster_WhatHappened_13_03"); //而 且 ， 就 算 没 有 钱 赚 ， 我 们 大 部 分 人 都 会 自 愿 去 干 这 件 事 。
	AI_Output(self, other, "DIA_Buster_WhatHappened_13_04"); //但 是 欧 纳 尔 养 着 我 们 所 有 的 人 ， 而 我 们 一 直 在 等 待 离 开 这 座 该 死 的 岛 的 好 时 机 。
};

//**************************************
//			TrainingGold
//**************************************
instance DIA_Buster_Teach(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 8;
	condition		= DIA_Buster_Teach_Condition;
	information		= DIA_Buster_Teach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 战 斗 得 更 好 吗 ？";
};

func int DIA_Buster_Teach_Condition()
{
	if (Npc_GetTalentSkill(other, NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void DIA_Buster_Teach_Info()
{
	AI_Output(other, self, "DIA_Buster_Teach_15_00"); //你 能 教 我 如 何 战 斗 得 更 好 吗 ？
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output(self, other, "DIA_Buster_Teach_13_01"); //我 也 许 能 适 当 地 给 你 一 两 个 暗 示 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Buster_Teach_13_02"); //你 并 不 象 看 起 来 那 样 沉 默 寡 言 。 好 吧 ， 我 会 教 你 我 所 知 道 的 。 那 么 ， 也 许 那 样 你 还 能 有 机 会 和 我 打 … …
	};

	if (BusterLOG == FALSE)
	{
		Log_CreateTopic(Topic_SoldierTeacher, LOG_NOTE);
		B_LogEntry(Topic_SoldierTeacher, Topic_SoldierTeacher_6);
		BusterLOG = TRUE;
	};

	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach, DIALOG_BACK, DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_Back()
{
	Info_ClearChoices(DIA_Buster_Teach);
};

func void DIA_Buster_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach, DIALOG_BACK, DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Buster_Teach_1H_5);
};

func void DIA_Buster_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices(DIA_Buster_Teach);
	Info_AddChoice(DIA_Buster_Teach, DIALOG_BACK, DIA_Buster_Teach_Back);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Buster_Teach_1H_1);
	Info_AddChoice(DIA_Buster_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Buster_Teach_1H_5);
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
instance DIA_Buster_KAP3_EXIT(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 999;
	condition		= DIA_Buster_KAP3_EXIT_Condition;
	information		= DIA_Buster_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Buster_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Shadowbeasts
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_SHADOWBEASTS(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 30;
	condition		= DIA_Buster_SHADOWBEASTS_Condition;
	information		= DIA_Buster_SHADOWBEASTS_Info;
	important		= TRUE;
};

func int DIA_Buster_SHADOWBEASTS_Condition()
{
	if (((Kapitel == 3) || (Kapitel == 4))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void B_DIA_Buster_SHADOWBEASTS_OK()
{
	AI_StopProcessInfos(self);
};

func void DIA_Buster_SHADOWBEASTS_Info()
{
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_13_00"); //嘿 ， 你 ， 老 兄 ！
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_13_02"); //最 近 这 两 天 ， 我 一 直 在 想 ， 怎 么 才 能 在 这 个 乱 七 八 糟 的 地 方 让 钱 来 得 快 点 。
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_15_03"); //还 有 吗 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_13_04"); //我 觉 得 我 偶 然 发 现 了 一 个 迅 速 致 富 的 可 能 。
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_13_05"); //城 里 来 的 一 个 商 人 愿 意 为 某 样 东 西 支 付 一 大 笔 钱 。

	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, "你 说 的 这 个 商 人 是 谁 ？", DIA_Buster_SHADOWBEASTS_wer);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, "这 是 关 于 什 么 的 ？", DIA_Buster_SHADOWBEASTS_was);
	Info_AddChoice(DIA_Buster_SHADOWBEASTS, "你 为 什 么 告 诉 我 这 些 ？", DIA_Buster_SHADOWBEASTS_ich);
};

func void DIA_Buster_SHADOWBEASTS_ich()
{
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_00"); //你 为 什 么 告 诉 我 这 些 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_01"); //我 不 能 亲 自 去 干 这 件 事 。 我 必 须 呆 在 这 里 看 好 那 些 笨 羊 。
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_ich_15_02"); //你 是 说 ， 那 些 农 民 。
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_ich_13_03"); //我 说 的 就 是 这 个 。
};

func void DIA_Buster_SHADOWBEASTS_was()
{
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_was_15_00"); //这 是 关 于 什 么 的 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_was_13_01"); //那 个 商 人 声 称 他 可 以 在 市 场 上 把 影 兽 角 卖 出 大 价 钱 。
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_was_13_02"); //必 须 有 人 去 树 林 里 捕 获 那 些 野 兽 。 你 就 是 从 那 里 进 来 的 。

	Info_AddChoice(DIA_Buster_SHADOWBEASTS, "在 那 里 能 得 到 多 少 ？", DIA_Buster_SHADOWBEASTS_was_wieviel);
};

func void DIA_Buster_SHADOWBEASTS_was_wieviel()
{
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_00"); //在 那 里 能 得 到 多 少 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_01"); //一 大 笔 钱 ， 我 告 诉 你 。 那 对 我 们 俩 来 说 足 够 了 。
	if (Buster_GoldZumBrennen == TRUE)
	{
		AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_was_wieviel_13_02"); //而 且 ， 因 为 那 时 你 把 那 些 金 子 给 了 我 ， 我 将 给 你 一 个 特 殊 的 价 钱 。
	};

	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_was_wieviel_15_03"); //听 起 来 不 错 ！ 我 想 办 法 弄 到 一 些 影 兽 角 后 就 会 告 诉 你 。
	MIS_Buster_KillShadowbeasts_DJG = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Buster_KillShadowbeasts, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Buster_KillShadowbeasts, LOG_RUNNING);
	B_LogEntry(TOPIC_Buster_KillShadowbeasts, TOPIC_Buster_KillShadowbeasts_1);

	Info_ClearChoices(DIA_Buster_SHADOWBEASTS);
};

func void DIA_Buster_SHADOWBEASTS_wer()
{
	AI_Output(other, self, "DIA_Buster_SHADOWBEASTS_wer_15_00"); //你 说 的 这 个 商 人 是 谁 ？
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_01"); //没 门 儿 ， 伙 计 。 我 要 是 告 诉 你 我 的 消 息 来 源 我 就 真 的 太 蠢 了 。 你 想 把 我 当 成 傻 子 .
	AI_Output(self, other, "DIA_Buster_SHADOWBEASTS_wer_13_02"); //要 不 你 就 跟 我 交 易 ， 要 不 就 什 么 都 别 做 ， 明 白 了 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info BringTrophyShadowbeast
///////////////////////////////////////////////////////////////////////
instance DIA_Buster_BringTrophyShadowbeast(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 2;
	condition		= DIA_Buster_BringTrophyShadowbeast_Condition;
	information		= DIA_Buster_BringTrophyShadowbeast_Info;
	permanent		= TRUE;
	description		= "关 于 影 兽 角 … …";
};

func int DIA_Buster_BringTrophyShadowbeast_Condition()
{
	if ((MIS_Buster_KillShadowbeasts_DJG == LOG_RUNNING)
	&& ((Npc_HasItems(other, ItAt_ShadowHorn)) || (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE))
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

var int BusterTrophyShadowbeastCounter;

func void DIA_Buster_BringTrophyShadowbeast_Info()
{
	if ((Kapitel >= 5))
	{
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_13_00"); //我 的 城 市 商 人 已 经 永 别 了 。
		AI_Output(other, self, "DIA_Buster_BringTrophyShadowbeast_15_01"); //那 是 什 么 意 思 ？
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_13_02"); //他 已 经 死 了 。 你 可 以 留 着 那 些 影 兽 角 。 现 在 ， 我 不 知 道 要 拿 它 们 做 什 么 。
		MIS_Buster_KillShadowbeasts_DJG = LOG_SUCCESS; // Joly: Feierabend ab Kapitel 5!!!!!!!
		B_GivePlayerXP(XP_Ambient);
	}
	else if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ShadowHorn] == FALSE)
	{
		AI_Output(other, self, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03"); //你 是 怎 么 把 影 兽 开 膛 破 肚 的 ？
		AI_Output(self, other, "DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04"); //你 不 知 道 吗 ？ 哦 ， 伙 计 ， 我 对 你 的 估 计 过 高 了 。

		Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast, "关 于 那 个 ， 我 会 再 回 来 和 你 谈 。", DIA_Buster_BringTrophyShadowbeast_back);
		Info_AddChoice(DIA_Buster_BringTrophyShadowbeast, B_BuildLearnString(NAME_LEARN_TEACH_ME, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ShadowHorn)), DIA_Buster_BringTrophyShadowbeast_teach);
	}
	else
	{
		var int BusterTrophyShadowbeastCount;
		var int XP_BringBusterTrophyShadowbeast;
		var int XP_BringBusterTrophyShadowbeasts;
		var int BustersBusterTrophyShadowbeastOffer;
		var int BusterTrophyShadowbeastGeld;

		BusterTrophyShadowbeastCount = Npc_HasItems(other, ItAt_ShadowHorn);
		XP_BringBusterTrophyShadowbeast = (Shadowbeast.level * XP_PER_VICTORY);
		BustersBusterTrophyShadowbeastOffer = Value_ShadowHorn + Buster_Bonus; // Joly: Wert ohne Handelmultiplier!!!!!!!!!!!!!

		if (BusterTrophyShadowbeastCount == 1)
		{
			AI_Output(other, self, "DIA_Buster_BringTrophyShadowbeast_15_05"); //我 给 你 弄 到 了 一 个 影 兽 角 。
			B_GivePlayerXP(XP_BringBusterTrophyShadowbeast);
			B_GiveInvItems(other, self, ItAt_ShadowHorn, 1);
			BusterTrophyShadowbeastCounter = BusterTrophyShadowbeastCounter + 1;
		}
		else
		{
			AI_Output(other, self, "DIA_Buster_BringTrophyShadowbeast_15_06"); //我 给 你 的 商 人 弄 到 了 更 多 的 影 兽 角 。

			B_GiveInvItems(other, self, ItAt_ShadowHorn, BusterTrophyShadowbeastCount);

			XP_BringBusterTrophyShadowbeasts = (BusterTrophyShadowbeastCount * XP_BringBusterTrophyShadowbeast);
			BusterTrophyShadowbeastCounter = (BusterTrophyShadowbeastCounter + BusterTrophyShadowbeastCount);

			B_GivePlayerXP(XP_BringBusterTrophyShadowbeasts);
		};

		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_13_07"); //太 棒 了 ， 拿 来 吧 。 还 要 再 弄 些 。 谁 知 道 那 个 商 人 什 么 时 候 就 不 要 这 些 东 西 了 。
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_13_08"); //这 是 你 的 那 一 份 。

		BusterTrophyShadowbeastGeld = (BusterTrophyShadowbeastCount * BustersBusterTrophyShadowbeastOffer);

		CreateInvItems(self, ItMi_Gold, BusterTrophyShadowbeastGeld);
		B_GiveInvItems(self, other, ItMi_Gold, BusterTrophyShadowbeastGeld);
	};
};

func void DIA_Buster_BringTrophyShadowbeast_teach()
{
	AI_Output(other, self, "DIA_Buster_BringTrophyShadowbeast_teach_15_00"); //教 我 。

	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_ShadowHorn))
	{
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_01"); //那 就 听 好 了 。 你 去 杀 影 兽 ， 然 后 右 手 尽 最 大 力 气 握 紧 它 的 角 。
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_02"); //接 着 把 刀 子 插 进 它 的 额 头 ， 绕 着 角 把 周 围 的 肉 切 开 。
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_03"); //然 后 用 刀 子 把 角 从 头 骨 里 面 撬 出 来 ， 最 后 把 它 放 进 你 的 口 袋 里 。
		AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_teach_13_04"); //好 吧 。 然 后 就 把 它 带 给 我 。 那 对 你 来 说 不 会 太 难 做 。
	};

	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
};

func void DIA_Buster_BringTrophyShadowbeast_back()
{
	AI_Output(other, self, "DIA_Buster_BringTrophyShadowbeast_back_15_00"); //关 于 那 个 ， 我 会 再 回 来 和 你 谈 。
	AI_Output(self, other, "DIA_Buster_BringTrophyShadowbeast_back_13_01"); //我 希 望 如 此 。
	Info_ClearChoices(DIA_Buster_BringTrophyShadowbeast);
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
instance DIA_Buster_KAP4_EXIT(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 999;
	condition		= DIA_Buster_KAP4_EXIT_Condition;
	information		= DIA_Buster_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Buster_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 		  				 	PERM Kapitel 4
// ************************************************************
instance DIA_Buster_Perm4(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 2;
	condition		= DIA_Buster_Perm4_Condition;
	information		= DIA_Buster_Perm4_Info;
	permanent		= TRUE;
	description		= "你 怎 么 看 待 龙 猎 手 ？";
};

func int DIA_Buster_Perm4_Condition()
{
	if (Kapitel >= 4)
	{
		return TRUE;
	};
};

func void DIA_Buster_Perm4_Info()
{
	AI_Output(other, self, "DIA_Buster_Perm4_15_00"); //你 怎 么 看 待 龙 猎 手 ？
	AI_Output(self, other, "DIA_Buster_Perm4_13_01"); //那 些 小 伙 子 可 以 拿 着 一 堆 金 子 离 开 - 如 果 他 们 没 有 先 死 掉 的 话 。
	AI_Output(self, other, "DIA_Buster_Perm4_13_02"); //我 自 己 ， 我 宁 愿 跟 李 呆 在 一 起 。
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
instance DIA_Buster_KAP5_EXIT(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 999;
	condition		= DIA_Buster_KAP5_EXIT_Condition;
	information		= DIA_Buster_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Buster_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP5_EXIT_Info()
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
instance DIA_Buster_KAP6_EXIT(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 999;
	condition		= DIA_Buster_KAP6_EXIT_Condition;
	information		= DIA_Buster_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Buster_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Buster_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Buster_PICKPOCKET(C_INFO)
{
	npc				= Sld_802_Buster;
	nr				= 900;
	condition		= DIA_Buster_PICKPOCKET_Condition;
	information		= DIA_Buster_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Buster_PICKPOCKET_Condition()
{
	C_Beklauen(34, 60);
};

func void DIA_Buster_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
	Info_AddChoice(DIA_Buster_PICKPOCKET, DIALOG_BACK, DIA_Buster_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Buster_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Buster_PICKPOCKET_DoIt);
};

func void DIA_Buster_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};

func void DIA_Buster_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Buster_PICKPOCKET);
};
