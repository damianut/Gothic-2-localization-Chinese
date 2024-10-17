///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_EXIT(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 999;
	condition		= DIA_Parcival_EXIT_Condition;
	information		= DIA_Parcival_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parcival_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Schurfer(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_Schurfer_Condition;
	information		= DIA_Parcival_Schurfer_Info;
	description		= "关 于 矿 工 们 你 能 告 诉 什 么 事 ？";
};

func int DIA_Parcival_Schurfer_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Schurfer_Info()
{
	AI_Output(other, self, "DIA_Parcival_Schurfer_15_00"); //关 于 矿 工 们 你 能 告 诉 什 么 事 ？
	AI_Output(self, other, "DIA_Parcival_Schurfer_13_01"); //我 安 排 了 三 个 小 组 。
	AI_Output(self, other, "DIA_Parcival_Schurfer_13_02"); //马 科 斯 ， 法 捷 斯 以 及 席 尔 维 斯 特 罗 都 是 圣 骑 士 ， 每 人 领 导 一 个 小 组 。
	AI_Output(self, other, "DIA_Parcival_Schurfer_13_03"); //马 科 斯 小 组 向 一 座 老 矿 井 的 方 向 出 发 - 由 一 名 老 矿 工 带 路 ， 他 叫 格 里 梅 斯 。
	AI_Output(self, other, "DIA_Parcival_Schurfer_13_04"); //另 外 两 组 一 起 出 发 。
	AI_Output(self, other, "DIA_Parcival_Schurfer_13_05"); //哲 根 ， 我 们 的 一 名 侦 察 兵 ， 报 告 说 他 们 在 一 座 巨 大 的 塔 附 近 扎 了 营 。

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_7);
	Log_AddEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_8);
	Log_AddEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_9);
};

///////////////////////////////////////////////////////////////////////
//	Info Schürfer
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Diego(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 9;
	condition		= DIA_Parcival_Diego_Condition;
	information		= DIA_Parcival_Diego_Info;
	description		= "迪 雅 戈 是 和 哪 一 组 一 起 走 的 ？";
};

func int DIA_Parcival_Diego_Condition()
{
	if ((SearchForDiego == LOG_RUNNING)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Diego_Info()
{
	AI_Output(other, self, "DIA_Parcival_Diego_15_00"); //迪 雅 戈 是 和 哪 一 组 一 起 走 的 ？
	AI_Output(self, other, "DIA_Parcival_Diego_13_01"); //这 个 囚 犯 - 迪 雅 戈 ？ 他 在 圣 骑 士 席 尔 维 斯 特 罗 的 小 组 里 。

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_10);
};

///////////////////////////////////////////////////////////////////////
//	Info Weg
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Weg(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 8;
	condition		= DIA_Parcival_Weg_Condition;
	information		= DIA_Parcival_Weg_Info;
	description		= "你 知 道 怎 么 去 采 矿 地 点 吗 ？";
};

func int DIA_Parcival_Weg_Condition()
{
	if (MIS_ScoutMine == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Parcival_Weg_Info()
{
	AI_Output(other, self, "DIA_Parcival_Weg_15_00"); //你 知 道 怎 么 去 采 矿 地 点 吗 ？
	AI_Output(self, other, "DIA_Parcival_Weg_13_01"); //没 有 一 条 通 往 山 谷 的 路 是 安 全 的 。 这 给 我 一 种 感 觉 ， 最 好 不 要 走 直 线 。
	AI_Output(self, other, "DIA_Parcival_Weg_13_02"); //离 那 些 兽 人 和 树 林 子 远 一 些 - 愿 英 诺 斯 庇 佑 你 们 。

	B_LogEntry(TOPIC_ScoutMine, TOPIC_ScoutMine_11);
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGON
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGON(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_DRAGON_Condition;
	information		= DIA_Parcival_DRAGON_Info;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Parcival_DRAGON_Condition()
{
	return TRUE;
};

func void DIA_Parcival_DRAGON_Info()
{
	AI_Output(other, self, "DIA_Parcival_DRAGON_15_00"); //状 况 怎 么 样 ？
	AI_Output(self, other, "DIA_Parcival_DRAGON_13_01"); //营 地 被 兽 人 包 围 了 。 他 们 实 际 上 已 经 构 筑 好 了 工 事 。
	AI_Output(self, other, "DIA_Parcival_DRAGON_13_02"); //但 更 令 人 担 忧 的 是 龙 的 袭 击 。 现 在 它 们 已 经 毁 掉 了 整 个 外 围 。
	AI_Output(self, other, "DIA_Parcival_DRAGON_13_03"); //龙 的 再 次 进 攻 将 会 使 我 们 损 失 惨 重 。
};

///////////////////////////////////////////////////////////////////////
//	Info DRAGONS
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_DRAGONS(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_DRAGONS_Condition;
	information		= DIA_Parcival_DRAGONS_Info;
	description		= "那 里 有 多 少 龙 ？";
};

func int DIA_Parcival_DRAGONS_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parcival_DRAGON)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Parcival_DRAGONS_Info()
{
	AI_Output(other, self, "DIA_Parcival_DRAGONS_15_00"); //那 里 有 多 少 龙 ？
	AI_Output(self, other, "DIA_Parcival_DRAGONS_13_01"); //总 之 ， 我 们 不 知 道 它 们 的 数 量 ， 但 一 定 不 止 一 个 。
	AI_Output(self, other, "DIA_Parcival_DRAGONS_13_02"); //这 还 不 是 全 部 。 整 个 矿 藏 山 谷 里 充 满 着 邪 恶 的 生 物 ， 它 们 都 是 龙 的 帮 手 。
	AI_Output(self, other, "DIA_Parcival_DRAGONS_13_03"); //我 们 还 是 不 要 骗 自 己 了 - 如 果 没 有 外 来 的 增 援 ， 我 们 活 着 离 开 这 里 的 机 会 几 乎 为 零 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BRAVE
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_BRAVE(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 8;
	condition		= DIA_Parcival_BRAVE_Condition;
	information		= DIA_Parcival_BRAVE_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Parcival_BRAVE_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& Npc_KnowsInfo(hero, DIA_Parcival_DRAGONS)
	&& (Kapitel < 3)
	&& (Parcival_BRAVE_LaberCount <= 6))
	{
		return TRUE;
	};
};

var int Parcival_BRAVE_LaberCount;
func void DIA_Parcival_BRAVE_Info()
{
	if (Parcival_BRAVE_LaberCount < 6)
	{
		var int randy;
		randy = Hlp_Random(3);

		if (randy == 0)
		{
			AI_Output(self, other, "DIA_Parcival_BRAVE_13_00"); //一 切 都 还 很 平 静 。 但 那 也 能 迅 速 改 变 。
		};

		if (randy == 1)
		{
			AI_Output(self, other, "DIA_Parcival_BRAVE_13_01"); //我 们 将 尽 一 切 所 能 坚 持 下 去 。
		};

		if (randy == 2)
		{
			AI_Output(self, other, "DIA_Parcival_BRAVE_13_02"); //英 诺 斯 将 帮 助 我 们 。 他 的 光 芒 照 亮 了 我 们 的 心 ！
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Parcival_BRAVE_13_03"); //嘿 ！ 你 能 不 能 做 点 别 的 更 好 的 事 情 ， 而 不 是 一 直 在 我 面 前 唠 叨 ？ 走 开 ！
		B_GivePlayerXP(XP_Ambient);
	};

	Parcival_BRAVE_LaberCount = Parcival_BRAVE_LaberCount + 1;
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
instance DIA_Parcival_KAP3_EXIT(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 999;
	condition		= DIA_Parcival_KAP3_EXIT_Condition;
	information		= DIA_Parcival_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parcival_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info AllesKlar
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ALLESKLAR(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 31;
	condition		= DIA_Parcival_ALLESKLAR_Condition;
	information		= DIA_Parcival_ALLESKLAR_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Parcival_ALLESKLAR_Condition()
{
	if ((Kapitel == 3)
	&& (DIA_Parcival_ALLESKLAR_NervCounter < 3)
	&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON)))
	{
		return TRUE;
	};
};

var int DIA_Parcival_ALLESKLAR_NervCounter;
func void DIA_Parcival_ALLESKLAR_Info()
{
	AI_Output(other, self, "DIA_Parcival_ALLESKLAR_15_00"); //一 切 都 好 吗 ？

	if (DIA_Parcival_ALLESKLAR_NervCounter == 0)
	{
		AI_Output(self, other, "DIA_Parcival_ALLESKLAR_13_01"); //到 现 在 为 止 ！
	}
	else if (DIA_Parcival_ALLESKLAR_NervCounter == 1)
	{
		AI_Output(self, other, "DIA_Parcival_ALLESKLAR_13_02"); //耶 ， 该 死 。
	}
	else if (Parcival_BRAVE_LaberCount > 6)
	{
		AI_Output(self, other, "DIA_Parcival_ALLESKLAR_13_03"); //（ 大 笑 ） 啊 。 现 在 我 明 白 你 在 想 什 么 了 。 不 ， 我 的 朋 友 。 这 次 不 行 。
	}
	else
	{
		AI_Output(self, other, "DIA_Parcival_ALLESKLAR_13_04"); //别 打 扰 我 。
	};

	DIA_Parcival_ALLESKLAR_NervCounter = DIA_Parcival_ALLESKLAR_NervCounter + 1;
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
instance DIA_Parcival_KAP4_EXIT(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 999;
	condition		= DIA_Parcival_KAP4_EXIT_Condition;
	information		= DIA_Parcival_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parcival_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Ist irgendwas wichtiges passiert?
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_AnyNews(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_AnyNews_Condition;
	information		= DIA_Parcival_AnyNews_Info;
	description		= "发 生 了 什 么 重 要 的 事 吗 ？";
};

func int DIA_Parcival_AnyNews_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON)))
	{
		return TRUE;
	};
};

func void DIA_Parcival_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Parcival_AnyNews_15_00"); //发 生 了 什 么 重 要 的 事 吗 ？
	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_Parcival_AnyNews_13_01"); //你 属 于 那 些 自 称 龙 猎 手 的 人 渣 ？
		AI_Output(self, other, "DIA_Parcival_AnyNews_13_02"); //确 实 ， 我 曾 经 认 为 你 的 荣 誉 感 会 阻 止 你 加 入 那 些 人 。
	}
	else
	{
		AI_Output(self, other, "DIA_Parcival_AnyNews_13_03"); //我 很 担 心 。 非 常 担 心 。
		AI_Output(other, self, "DIA_Parcival_AnyNews_15_04"); //为 了 什 么 ？
		AI_Output(self, other, "DIA_Parcival_AnyNews_13_05"); //最 近 出 现 的 这 些 人 。 他 们 自 称 是 龙 猎 手 。
		AI_Output(self, other, "DIA_Parcival_AnyNews_13_06"); //依 我 看 来 ， 他 们 只 是 一 些 游 民 和 罪 犯 。
	};

	AI_Output(self, other, "DIA_Parcival_AnyNews_13_07"); //如 果 是 我 ， 就 会 把 他 们 全 都 赶 出 这 座 城 堡 。 让 兽 人 去 收 拾 他 们 。

	Info_ClearChoices(DIA_Parcival_AnyNews);
	Info_AddChoice(DIA_Parcival_AnyNews, "和 哈 根 勋 爵 不 同 ， 他 们 在 这 里 。", DIA_Parcival_AnyNews_LordHagen);
	Info_AddChoice(DIA_Parcival_AnyNews, "你 应 该 给 他 们 一 个 机 会 。", DIA_Parcival_AnyNews_Chance);
	Info_AddChoice(DIA_Parcival_AnyNews, "你 不 认 为 你 有 些 夸 大 其 辞 吗 ？", DIA_Parcival_AnyNews_Overact);
};

func void DIA_Parcival_AnyNews_LordHagen()
{
	AI_Output(other, self, "DIA_Parcival_AnyNews_LordHagen_15_00"); //和 哈 根 勋 爵 不 同 ， 他 们 在 这 里 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_LordHagen_13_01"); //（ 苦 笑 ） 是 的 ， 不 幸 的 是 ， 除 了 他 们 就 是 全 部 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_LordHagen_13_02"); //英 诺 斯 真 是 在 让 我 们 承 受 一 次 非 常 严 酷 的 考 验 。

	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Chance()
{
	AI_Output(other, self, "DIA_Parcival_AnyNews_Chance_15_00"); //你 应 该 给 他 们 一 个 机 会 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_Chance_13_01"); //他 们 正 在 承 受 。 不 幸 的 是 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_Chance_13_02"); //加 隆 德 确 信 他 们 能 帮 助 我 们 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_Chance_13_03"); //但 我 仍 会 留 意 他 们 。 兽 人 已 经 给 我 们 造 成 太 多 的 问 题 ， 我 们 真 的 不 想 要 更 多 的 麻 烦 了 。

	Info_ClearChoices(DIA_Parcival_AnyNews);
};

func void DIA_Parcival_AnyNews_Overact()
{
	AI_Output(other, self, "DIA_Parcival_AnyNews_Overact_15_00"); //你 不 认 为 你 有 些 夸 大 其 辞 吗 ？
	AI_Output(self, other, "DIA_Parcival_AnyNews_Overact_13_01"); //绝 对 不 。 在 这 样 的 形 式 下 ， 我 们 需 要 能 树 立 光 辉 形 象 的 人 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_Overact_13_02"); //唤 醒 战 士 们 心 中 的 英 诺 斯 之 火 的 勇 士 。
	AI_Output(self, other, "DIA_Parcival_AnyNews_Overact_13_03"); //相 反 ， 这 些 垃 圾 毁 掉 了 我 的 战 士 们 的 士 气 。
};

///////////////////////////////////////////////////////////////////////
//	Ich muss mit dir über Jan reden
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_Jan(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_Jan_Condition;
	information		= DIA_Parcival_Jan_Info;
	description		= "我 需 要 同 你 谈 谈 关 于 简 的 事";
};

func int DIA_Parcival_Jan_Condition()
{
	if ((MIS_JanBecomesSmith == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON)))
	{
		return TRUE;
	};
};

func void DIA_Parcival_Jan_Info()
{
	AI_Output(other, self, "DIA_Parcival_Jan_15_00"); //我 需 要 同 你 谈 谈 关 于 简 的 事
	AI_Output(self, other, "DIA_Parcival_Jan_13_01"); //简 ？ 他 是 谁 ？
	AI_Output(other, self, "DIA_Parcival_Jan_15_02"); //一 个 龙 猎 手 。 他 是 个 铁 匠 。
	AI_Output(self, other, "DIA_Parcival_Jan_13_03"); //哦 ， 是 的 ， 我 记 得 了 。 他 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Parcival_Jan_15_04"); //他 想 在 铁 匠 铺 里 工 作 。
	AI_Output(self, other, "DIA_Parcival_Jan_13_05"); //不 可 能 。 他 不 是 我 们 的 人 ， 而 且 我 也 不 信 任 他 。
};

///////////////////////////////////////////////////////////////////////
//	Kannst du das mit Jan noch mal überdenken?
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_ThinkAgain(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_ThinkAgain_Condition;
	information		= DIA_Parcival_ThinkAgain_Info;
	permanent		= TRUE;
	description		= "你 不 能 重 新 考 虑 一 下 简 的 情 况 吗 ？";
};

func int DIA_Parcival_ThinkAgain_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Parcival_ThinkAgain_Info()
{
	AI_Output(other, self, "DIA_Parcival_ThinkAgain_15_00"); //你 不 能 重 新 考 虑 一 下 简 的 情 况 吗 ？
	AI_Output(self, other, "DIA_Parcival_ThinkAgain_13_01"); //不 ， 我 的 决 定 很 坚 决 。
};

///////////////////////////////////////////////////////////////////////
//	Garond will, dass Jan die Schmiede übernimmt.
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_TalkedGarond(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 2;
	condition		= DIA_Parcival_TalkedGarond_Condition;
	information		= DIA_Parcival_TalkedGarond_Info;
	description		= "加 隆 德 想 让 简 接 管 铁 匠 铺 。";
};

func int DIA_Parcival_TalkedGarond_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Parcival_Jan))
	&& (MIS_JanBecomesSmith == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Parcival_DRAGON)))
	{
		return TRUE;
	};
};

func void DIA_Parcival_TalkedGarond_Info()
{
	AI_Output(other, self, "DIA_Parcival_TalkedGarond_15_00"); //加 隆 德 想 让 简 接 管 铁 匠 铺 。
	AI_Output(self, other, "DIA_Parcival_TalkedGarond_13_01"); //嗯 。 如 果 是 这 样 ， 那 么 我 认 为 他 可 以 拥 有 这 个 铁 匠 铺 。
	AI_Output(self, other, "DIA_Parcival_TalkedGarond_13_02"); //即 使 我 觉 得 相 信 这 个 简 是 个 错 误 。
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_PERMKAP4(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 43;
	condition		= DIA_Parcival_PERMKAP4_Condition;
	information		= DIA_Parcival_PERMKAP4_Info;
	permanent		= TRUE;
	description		= "除 了 那 以 外 呢 ？";
};

func int DIA_Parcival_PERMKAP4_Condition()
{
	if ((Kapitel >= 4)
	&& (Npc_KnowsInfo(other, DIA_Parcival_AnyNews)))
	{
		return TRUE;
	};
};

func void DIA_Parcival_PERMKAP4_Info()
{
	AI_Output(other, self, "DIA_Parcival_PERMKAP4_15_00"); //除 了 那 以 外 呢 ？
	AI_Output(self, other, "DIA_Parcival_PERMKAP4_13_01"); //啊 ， 别 打 扰 我 ！
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
instance DIA_Parcival_KAP5_EXIT(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 999;
	condition		= DIA_Parcival_KAP5_EXIT_Condition;
	information		= DIA_Parcival_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parcival_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verraeter
///////////////////////////////////////////////////////////////////////
instance DIA_Parcival_VERRAETER(C_INFO)
{
	npc				= PAL_252_Parcival;
	condition		= DIA_Parcival_VERRAETER_Condition;
	information		= DIA_Parcival_VERRAETER_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Parcival_VERRAETER_Condition()
{
	if ((Npc_RefuseTalk(self) == FALSE)
	&& (MIS_OCGateOpen == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Parcival_VERRAETER_Info()
{
	AI_Output(self, other, "DIA_Parcival_VERRAETER_13_00"); //叛 徒 ！ 我 非 常 肯 定 是 你 打 开 了 大 门 。
	AI_Output(self, other, "DIA_Parcival_VERRAETER_13_01"); //你 得 为 此 付 出 代 价 。

	Npc_SetRefuseTalk(self, 30);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
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
instance DIA_Parcival_KAP6_EXIT(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 999;
	condition		= DIA_Parcival_KAP6_EXIT_Condition;
	information		= DIA_Parcival_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parcival_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Parcival_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Parcival_PICKPOCKET(C_INFO)
{
	npc				= PAL_252_Parcival;
	nr				= 900;
	condition		= DIA_Parcival_PICKPOCKET_Condition;
	information		= DIA_Parcival_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Parcival_PICKPOCKET_Condition()
{
	C_Beklauen(84, 460);
};

func void DIA_Parcival_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
	Info_AddChoice(DIA_Parcival_PICKPOCKET, DIALOG_BACK, DIA_Parcival_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parcival_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Parcival_PICKPOCKET_DoIt);
};

func void DIA_Parcival_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};

func void DIA_Parcival_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parcival_PICKPOCKET);
};
