// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Raoul_EXIT(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 999;
	condition		= DIA_Raoul_EXIT_Condition;
	information		= DIA_Raoul_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Raoul_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				NoSentenza
// ************************************************************
instance DIA_Raoul_NoSentenza(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 1;
	condition		= DIA_Raoul_NoSentenza_Condition;
	information		= DIA_Raoul_NoSentenza_Info;
	important		= TRUE;
};

func int DIA_Raoul_NoSentenza_Condition()
{
	if ((!Npc_KnowsInfo(other, DIA_Sentenza_Hello))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_NoSentenza_Info()
{
	AI_Output(self, other, "DIA_Raoul_NoSentenza_01_00"); //等 一 下 ， 朋 友 ！
	AI_Output(self, other, "DIA_Raoul_NoSentenza_01_01"); //我 没 看 到 森 腾 扎 搜 查 你 。

	if ((Hlp_IsValidNpc(Sentenza))
	&& (!C_NpcIsDown(Sentenza)))
	{
		AI_Output(self, other, "DIA_Raoul_NoSentenza_01_02"); //森 腾 扎 ！ 到 这 儿 来 ！
		AI_Output(self, other, "DIA_Raoul_NoSentenza_01_03"); //（ 假 客 气 ） 等 一 会 儿 ， 他 马 上 来 ！
		AI_Output(self, other, "DIA_Raoul_NoSentenza_01_04"); //那 么 你 要 大 吃 一 惊 了 ！

		B_Attack(Sentenza, other, AR_NONE, 0);
	}
	else
	{
		AI_Output(self, other, "DIA_Raoul_NoSentenza_01_05"); //那 么 ， 他 在 哪 里 ？ 好 吧 ， 没 关 系 ， 你 走 运 了 … …
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Raoul_Hello(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 1;
	condition		= DIA_Raoul_Hello_Condition;
	information		= DIA_Raoul_Hello_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Raoul_Hello_Condition()
{
	if ((other.guild == GIL_NONE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Hello_Info()
{
	if (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Raoul_Hello_01_00"); //（ 厌 烦 的 ） 你 想 要 干 什 么 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Raoul_Hello_01_01"); //（ 生 气 的 ） 这 次 你 想 要 干 什 么 ？
	};
};

// ************************************************************
// 			  				PERM (Gil_None)
// ************************************************************

var int Raoul_gesagt;
// -------------------------
instance DIA_Raoul_PERMNone(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 1;
	condition		= DIA_Raoul_PERMNone_Condition;
	information		= DIA_Raoul_PERMNone_Info;
	permanent		= TRUE;
	description		= "我 想 要 在 农 场 附 近 看 一 下 ！";
};

func int DIA_Raoul_PERMNone_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERMNone_Info()
{
	AI_Output(other, self, "DIA_Raoul_PERMNone_15_00"); //我 想 要 在 农 场 附 近 看 一 下 ！

	if (Raoul_gesagt == FALSE)
	{
		AI_Output(self, other, "DIA_Raoul_PERMNone_01_01"); //不 要 进 左 边 的 房 子 。 席 尔 维 欧 在 那 里 面 。 他 现 在 心 情 不 好 。
		AI_Output(self, other, "DIA_Raoul_PERMNone_01_02"); //如 果 他 看 到 不 属 于 农 场 的 瘦 弱 的 人 ， 他 可 能 会 考 虑 把 他 当 成 出 气 筒 。
		Raoul_gesagt = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Raoul_PERMNone_01_03"); //玩 得 开 心 点 ！
		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  				Wanna Join
// ************************************************************
instance DIA_Raoul_WannaJoin(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_WannaJoin_Condition;
	information		= DIA_Raoul_WannaJoin_Info;
	description		= "我 想 加 入 李 的 队 伍 ! ";
};

func int DIA_Raoul_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Raoul_WannaJoin_15_00"); //我 想 加 入 李 的 队 伍 !
	AI_Output(self, other, "DIA_Raoul_WannaJoin_01_01"); //李 如 果 继 续 这 样 下 去 ， 在 这 里 就 会 没 有 什 么 发 言 权 了 ！
	AI_Output(other, self, "DIA_Raoul_WannaJoin_15_02"); //你 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Raoul_WannaJoin_01_03"); //他 希 望 我 们 都 坐 在 这 里 玩 大 拇 指 。 偶 尔 恐 吓 几 个 农 民 ， 就 是 这 样 。
	AI_Output(self, other, "DIA_Raoul_WannaJoin_01_04"); //席 尔 维 欧 经 常 说 进 攻 是 最 好 的 防 守 ， 他 说 得 对 极 了 。
};

// ************************************************************
// 			  				AboutSylvio
// ************************************************************
instance DIA_Raoul_AboutSylvio(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_AboutSylvio_Condition;
	information		= DIA_Raoul_AboutSylvio_Info;
	description		= "谁 是 席 尔 维 欧 ？";
};

func int DIA_Raoul_AboutSylvio_Condition()
{
	if ((Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo(other, DIA_Raoul_WannaJoin)))
	{
		return TRUE;
	};
};

func void DIA_Raoul_AboutSylvio_Info()
{
	AI_Output(other, self, "DIA_Raoul_AboutSylvio_15_00"); //谁 是 席 尔 维 欧 ？
	AI_Output(self, other, "DIA_Raoul_AboutSylvio_01_01"); //我 们 的 下 一 任 首 领 ， 照 我 说 。 如 果 你 想 问 他 你 是 不 是 能 加 入 我 们 - 还 是 算 了 吧 ！
	AI_Output(self, other, "DIA_Raoul_AboutSylvio_01_02"); //你 看 起 来 只 能 去 放 羊 。
};

// ************************************************************
// 			  				Stimme
// ************************************************************
instance DIA_Raoul_Stimme(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_Stimme_Condition;
	information		= DIA_Raoul_Stimme_Info;
	description		= "我 想 成 为 这 里 的 雇 佣 兵 。 你 有 意 见 吗 ？";
};

func int DIA_Raoul_Stimme_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_Stimme_Info()
{
	AI_Output(other, self, "DIA_Raoul_Stimme_15_00"); //我 想 成 为 这 里 的 雇 佣 兵 。 你 有 意 见 吗 ？
	AI_Output(self, other, "DIA_Raoul_Stimme_01_01"); //哈 ， 做 你 想 做 的 去 吧 … …

	Log_CreateTopic(TOPIC_SLDRespekt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRespekt, LOG_RUNNING);
	B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_7);
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Raoul_Duell(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_Duell_Condition;
	information		= DIA_Raoul_Duell_Info;
	permanent		= TRUE;
	description		= "我 认 为 我 要 用 拳 头 砸 烂 你 的 脸 … …";
};

func int DIA_Raoul_Duell_Condition()
{
	if ((Raoul_gesagt == TRUE)
	|| (Npc_KnowsInfo(other, DIA_Raoul_AboutSylvio))
	|| (Npc_KnowsInfo(other, DIA_Jarvis_MissionKO)))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Duell_Info()
{
	AI_Output(other, self, "DIA_Raoul_Duell_15_00"); //我 认 为 我 要 用 拳 头 砸 烂 你 的 脸 … …
	AI_Output(self, other, "DIA_Raoul_Duell_01_01"); //什 么 ？
	AI_Output(other, self, "DIA_Raoul_Duell_15_02"); //那 正 是 你 现 在 需 要 的 … …
	AI_Output(self, other, "DIA_Raoul_Duell_01_03"); //至 今 ， 我 一 直 对 你 太 好 了 ， 不 是 吗 ？

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// #####################################################################

//							Mit erster Gilde

// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_PERM(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 900;
	condition		= DIA_Raoul_PERM_Condition;
	information		= DIA_Raoul_PERM_Info;
	permanent		= TRUE;
	description		= "其 它 事 情 都 好 吗 ？";
};

func int DIA_Raoul_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_PERM_Info()
{
	AI_Output(other, self, "DIA_Raoul_PERM_15_00"); //其 它 事 情 都 好 吗 ？

	if (MIS_Raoul_KillTrollBlack == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Raoul_PERM_01_01"); //别 啰 唆 。 去 把 黑 巨 魔 皮 给 我 弄 来 。
	}
	else
	{
		AI_Output(self, other, "DIA_Raoul_PERM_01_02"); //你 现 在 想 要 拍 我 的 马 屁 ， 还 是 别 的 ？ 滚 吧 ！

		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, other, "DIA_Raoul_PERM_01_03"); //我 还 没 忘 记 你 对 我 做 过 的 事 情 。
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Troll
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLL(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_TROLL_Condition;
	information		= DIA_Raoul_TROLL_Info;
	important		= TRUE;
};

func int DIA_Raoul_TROLL_Condition()
{
	if (hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLL_Info()
{
	AI_Output(self, other, "DIA_Raoul_TROLL_01_00"); //（ 愤 世 嫉 俗 的 ） 你 会 看 到 的 ！
	AI_Output(other, self, "DIA_Raoul_TROLL_15_01"); //你 想 要 什 么 ？

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Raoul_TROLL_01_02"); //你 看 起 来 像 是 加 入 了 城 市 乞 丐 吗？
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Raoul_TROLL_01_03"); //别 以 为 你 是 我 们 的 人 ， 我 现 在 就 会 尊 重 你 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Raoul_TROLL_01_04"); //在 这 里 扮 演 大 魔 法 师 ， 嗯 ？
	};

	AI_Output(self, other, "DIA_Raoul_TROLL_01_05"); //我 可 以 告 诉 你 ， 无 论 你 穿 成 什 么 样 ， 我 都 能 一 眼 看 穿 你 。
	AI_Output(self, other, "DIA_Raoul_TROLL_01_06"); //在 我 看 来 ， 你 只 是 个 油 腔 滑 调 的 小 混 混 ， 仅 此 而 已 。

	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL, "我 必 须 走 了 。", DIA_Raoul_TROLL_weg);
	Info_AddChoice(DIA_Raoul_TROLL, "你 的 问 题 是 什 么 ？", DIA_Raoul_TROLL_rechnung);
};

func void DIA_Raoul_TROLL_weg()
{
	AI_Output(other, self, "DIA_Raoul_TROLL_weg_15_00"); //我 必 须 走 了 。
	AI_Output(self, other, "DIA_Raoul_TROLL_weg_01_01"); //是 。 走 开 。
	AI_StopProcessInfos(self);
};

func void DIA_Raoul_TROLL_rechnung()
{
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_15_00"); //你 的 问 题 是 什 么 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_01"); //我 知 道 你 这 种 人 。 光 说 不 练 。
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_02"); //我 讨 厌 那 些 装 扮 得 像 个 大 人 物 、 到 处 吹 嘘 自 己 的 英 雄 事 迹 的 人 。
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_03"); //就 在 昨 天 ， 我 在 这 里 狠 狠 地 打 了 一 个 家 伙 的 嘴 巴 ， 因 为 他 说 就 算 把 他 的 一 只 手 绑 在 背 后 ， 也 能 打 死 一 只 黑 巨 魔 。
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_15_04"); //那 又 怎 么 样 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_05"); //（ 尖 刻 的 ） ‘ 结 果 怎 样 ’ 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_06"); //你 曾 经 见 过 黑 巨 魔 吗 ， 大 嘴 巴 ？ 你 想 象 得 出 那 些 怪 物 有 多 大 吗 ， 伙 计 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_01_07"); //哪 怕 你 多 靠 近 一 步 ， 它 们 都 会 把 你 撕 成 碎 片 。

	Info_ClearChoices(DIA_Raoul_TROLL);
	Info_AddChoice(DIA_Raoul_TROLL, "那 与 我 无 关 。", DIA_Raoul_TROLL_rechnung_hastrecht);

	if (Npc_IsDead(Troll_Black))
	{
		Info_AddChoice(DIA_Raoul_TROLL, "我 已 经 杀 了 一 个 黑 巨 魔 。", DIA_Raoul_TROLL_rechnung_ich);
	}
	else
	{
		Info_AddChoice(DIA_Raoul_TROLL, "黑 巨 魔 ？ 没 问 题 。", DIA_Raoul_TROLL_rechnung_noProb);
	};
};

func void B_Raoul_Blame()
{
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00"); //你 要 自 讨 苦 吃 ， 是 吧 ？ 我 应 该 扭 断 你 的 头 。 不 过 ， 我 有 了 一 个 更 好 的 主 意 。
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01"); //如 果 你 真 是 这 么 厉 害 的 一 个 战 士 ， 那 就 证 明 一 下 。
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02"); //我 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03"); //愚 蠢 的 问 题 。 你 的 荣 誉 写 在 你 的 脸 上 吗 ？
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04"); //这 不 是 很 多 ， 是 吗 ？
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05"); //嗯 。 我 们 这 样 吧 ， 如 果 你 给 我 弄 到 一 张 黑 巨 魔 皮 ， 我 就 给 你 一 大 笔 钱 。 怎 么 样 ？
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06"); //好 多 了 。
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07"); //那 你 还 在 等 什 么 ？

	Log_CreateTopic(TOPIC_KillTrollBlack, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillTrollBlack, LOG_RUNNING);
	B_LogEntry(TOPIC_KillTrollBlack, TOPIC_KillTrollBlack_1);

	MIS_Raoul_KillTrollBlack = LOG_RUNNING;

	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_hastrecht()
{
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_hastrecht_15_00"); //我 不 感 兴 趣 。
	AI_Output(self, other, "DIA_Raoul_TROLL_rechnung_hastrecht_01_01"); //那 也 许 对 你 更 好 。
	Info_ClearChoices(DIA_Raoul_TROLL);
};

func void DIA_Raoul_TROLL_rechnung_ich()
{
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_ich_15_00"); //我 已 经 杀 了 一 个 黑 巨 魔 。
	B_Raoul_Blame();
};

func void DIA_Raoul_TROLL_rechnung_noProb()
{
	AI_Output(other, self, "DIA_Raoul_TROLL_rechnung_noProb_15_00"); //黑 巨 魔 ？ 没 问 题 。
	B_Raoul_Blame();
};

///////////////////////////////////////////////////////////////////////
//	Info TrophyFur
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TrophyFur(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 3;
	condition		= DIA_Raoul_TrophyFur_Condition;
	information		= DIA_Raoul_TrophyFur_Info;
	permanent		= TRUE;
	description		= "首 先 告 诉 我 怎 么 把 巨 魔 的 皮 剥 下 来 。";
};

func int DIA_Raoul_TrophyFur_Condition()
{
	if ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	&& (MIS_Raoul_KillTrollBlack == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TrophyFur_Info()
{
	AI_Output(other, self, "DIA_Raoul_TrophyFur_15_00"); //首 先 告 诉 我 怎 么 把 巨 魔 的 皮 剥 下 来 。

	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Fur))
	{
		AI_Output(self, other, "DIA_Raoul_TrophyFur_01_01"); //那 就 竖 起 你 的 耳 朵 。 这 个 消 息 是 免 费 的 。
		AI_Output(self, other, "DIA_Raoul_TrophyFur_01_02"); //你 抓 住 那 畜 生 ， 然 后 在 它 每 条 腿 上 割 开 一 条 口 子 。
		AI_Output(self, other, "DIA_Raoul_TrophyFur_01_03"); //然 后 把 这 个 东 西 的 皮 一 直 拉 到 它 的 耳 朵 上 。 这 很 难 吗 ？
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TrollFell
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_TROLLFELL(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 3;
	condition		= DIA_Raoul_TROLLFELL_Condition;
	information		= DIA_Raoul_TROLLFELL_Info;
	description		= "我 有 黑 巨 魔 的 皮 。";
};

func int DIA_Raoul_TROLLFELL_Condition()
{
	if ((Npc_HasItems(other, ItAt_TrollBlackFur))
	&& (Npc_KnowsInfo(other, DIA_Raoul_TROLL)))
	{
		return TRUE;
	};
};

func void DIA_Raoul_TROLLFELL_Info()
{
	AI_Output(other, self, "DIA_Raoul_TROLLFELL_15_00"); //我 有 黑 巨 魔 的 皮 。
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_01_01"); //不 可 能 。 给 我 看 看 。
	B_GiveInvItems(other, self, ItAt_TrollBlackFur, 1);
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_01_02"); //不 可 思 议 。 你 想 要 什 么 作 为 交 换 ？
	AI_Output(other, self, "DIA_Raoul_TROLLFELL_15_03"); //你 有 什 么 就 给 我 什 么 。
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_01_04"); //好 。 我 会 给 你 5 0 0 个 金 币 还 有 三 瓶 强 效 治 疗 药 剂 ， 你 认 为 怎 么 样 ？

	Info_ClearChoices(DIA_Raoul_TROLLFELL);
	Info_AddChoice(DIA_Raoul_TROLLFELL, "那 不 够 。", DIA_Raoul_TROLLFELL_nein);
	Info_AddChoice(DIA_Raoul_TROLLFELL, "成 交 。", DIA_Raoul_TROLLFELL_ja);

	MIS_Raoul_KillTrollBlack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Raoul_KillTrollBlack);
};

func void DIA_Raoul_TROLLFELL_ja()
{
	AI_Output(other, self, "DIA_Raoul_TROLLFELL_ja_15_00"); //卖 了 。
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_ja_01_01"); //真 是 愉 快 。
	CreateInvItems(self, ItPo_Health_03, 3);
	B_GiveInvItems(self, other, ItPo_Health_03, 3);
	CreateInvItems(self, ItMi_Gold, 500);
	B_GiveInvItems(self, other, ItMi_Gold, 500);
	Info_ClearChoices(DIA_Raoul_TROLLFELL);
};

func void DIA_Raoul_TROLLFELL_nein()
{
	AI_Output(other, self, "DIA_Raoul_TROLLFELL_nein_15_00"); //那 不 够 。
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_nein_01_01"); //随 便 你 。 总 之 ， 我 会 留 下 这 张 皮 。
	AI_Output(self, other, "DIA_Raoul_TROLLFELL_nein_01_02"); //我 不 想 让 这 个 机 会 从 我 手 里 溜 走 。
	MIS_Raoul_DoesntPayTrollFur = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info FellZurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_FELLZURUECK(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 3;
	condition		= DIA_Raoul_FELLZURUECK_Condition;
	information		= DIA_Raoul_FELLZURUECK_Info;
	permanent		= TRUE;
	description		= "把 巨 魔 皮 还 给 我 。";
};

func int DIA_Raoul_FELLZURUECK_Condition()
{
	if ((MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems(self, ItAt_TrollBlackFur)))
	{
		return TRUE;
	};
};

func void DIA_Raoul_FELLZURUECK_Info()
{
	AI_Output(other, self, "DIA_Raoul_FELLZURUECK_15_00"); //把 巨 魔 皮 还 给 我 。
	AI_Output(self, other, "DIA_Raoul_FELLZURUECK_01_01"); //不 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info GotTrollFurBack
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_GotTrollFurBack(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 3;
	condition		= DIA_Raoul_GotTrollFurBack_Condition;
	information		= DIA_Raoul_GotTrollFurBack_Info;
	description		= "别 想 再 敲 诈 我 ， 明 白 吗 ？";
};

func int DIA_Raoul_GotTrollFurBack_Condition()
{
	if ((MIS_Raoul_DoesntPayTrollFur == LOG_RUNNING)
	&& (Npc_HasItems(self, ItAt_TrollBlackFur) == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void DIA_Raoul_GotTrollFurBack_Info()
{
	AI_Output(other, self, "DIA_Raoul_GotTrollFurBack_15_00"); //别 想 再 敲 诈 我 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Raoul_GotTrollFurBack_01_01"); //好 吧 。 你 知 道 这 里 的 情 况 ， 是 吗 ？ 那 就 冷 静 点 。
	MIS_Raoul_DoesntPayTrollFur = LOG_SUCCESS;
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
instance DIA_Raoul_KAP3_EXIT(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 999;
	condition		= DIA_Raoul_KAP3_EXIT_Condition;
	information		= DIA_Raoul_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Raoul_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
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
instance DIA_Raoul_KAP4_EXIT(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 999;
	condition		= DIA_Raoul_KAP4_EXIT_Condition;
	information		= DIA_Raoul_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Raoul_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP4_EXIT_Info()
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
instance DIA_Raoul_KAP5_EXIT(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 999;
	condition		= DIA_Raoul_KAP5_EXIT_Condition;
	information		= DIA_Raoul_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Raoul_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ship
///////////////////////////////////////////////////////////////////////
instance DIA_Raoul_Ship(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 2;
	condition		= DIA_Raoul_Ship_Condition;
	information		= DIA_Raoul_Ship_Info;
	description		= "你 想 从 这 里 来 一 次 海 上 巡 游 吗 ？";
};

func int DIA_Raoul_Ship_Condition()
{
	if ((Kapitel >= 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Raoul_Ship_Info()
{
	AI_Output(other, self, "DIA_Raoul_Ship_15_00"); //你 想 从 这 里 来 一 次 海 上 巡 游 吗 ？
	AI_Output(self, other, "DIA_Raoul_Ship_01_01"); //你 在 计 划 什 么 ？ 你 准 备 夺 取 圣 骑 士 的 船 吗 ？ （ 大 笑 ）
	AI_Output(other, self, "DIA_Raoul_Ship_15_02"); //如 果 是 的 话 又 怎 么 样 ？
	AI_Output(self, other, "DIA_Raoul_Ship_01_03"); //（ 严 肃 的 ） 你 完 全 疯 了 。 不 ， 谢 谢 。 我 不 行 。
	AI_Output(self, other, "DIA_Raoul_Ship_01_04"); //我 找 不 到 任 何 理 由 离 开 克 霍 里 尼 斯 。 无 论 在 这 里 还 是 在 大 陆 赚 钱 - 对 我 来 说 都 一 样 。
	AI_Output(self, other, "DIA_Raoul_Ship_01_05"); //去 找 别 人 吧 。

	if ((Npc_IsDead(Torlof)) == FALSE)
	{
		AI_Output(self, other, "DIA_Raoul_Ship_01_06"); //问 问 托 尔 洛 夫 。 据 我 所 知 ， 他 曾 经 当 过 水 手 。
	};
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
instance DIA_Raoul_KAP6_EXIT(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 999;
	condition		= DIA_Raoul_KAP6_EXIT_Condition;
	information		= DIA_Raoul_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Raoul_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Raoul_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Raoul_PICKPOCKET(C_INFO)
{
	npc				= Sld_822_Raoul;
	nr				= 900;
	condition		= DIA_Raoul_PICKPOCKET_Condition;
	information		= DIA_Raoul_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Raoul_PICKPOCKET_Condition()
{
	C_Beklauen(45, 85);
};

func void DIA_Raoul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
	Info_AddChoice(DIA_Raoul_PICKPOCKET, DIALOG_BACK, DIA_Raoul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Raoul_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Raoul_PICKPOCKET_DoIt);
};

func void DIA_Raoul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};

func void DIA_Raoul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Raoul_PICKPOCKET);
};
