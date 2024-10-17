// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Jarvis_EXIT(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 999;
	condition		= DIA_Jarvis_EXIT_Condition;
	information		= DIA_Jarvis_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Jarvis_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hello
// ************************************************************
instance DIA_Jarvis_Hello(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 1;
	condition		= DIA_Jarvis_Hello_Condition;
	information		= DIA_Jarvis_Hello_Info;
	important		= TRUE;
};

func int DIA_Jarvis_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_Hello_Info()
{
	AI_Output(self, other, "DIA_Jarvis_Hello_04_00"); //嗨 ！ 我 是 不 是 在 哪 里 见 过 你 。
	AI_Output(other, self, "DIA_Jarvis_Hello_15_01"); //这 很 有 可 能 。 我 那 时 也 在 流 放 地 。
	AI_Output(self, other, "DIA_Jarvis_Hello_04_02"); //是 的 … … 你 想 要 什 么 ？
};

// ************************************************************
// 			  					DieLage
// ************************************************************
instance DIA_Jarvis_DieLage(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 2;
	condition		= DIA_Jarvis_DieLage_Condition;
	information		= DIA_Jarvis_DieLage_Info;
	description		= "最 近 怎 么 样 ？";
};

func int DIA_Jarvis_DieLage_Condition()
{
	return TRUE;
};

func void DIA_Jarvis_DieLage_Info()
{
	AI_Output(other, self, "DIA_Jarvis_DieLage_15_00"); //状 况 怎 么 样 ？
	AI_Output(self, other, "DIA_Jarvis_DieLage_04_01"); //现 在 ， 我 们 碰 到 了 真 正 的 麻 烦 。 我 们 雇 佣 兵 正 在 分 裂 为 两 个 派 系 。
	AI_Output(self, other, "DIA_Jarvis_DieLage_04_02"); //席 尔 维 欧 和 他 的 人 怀 疑 李 是 不 是 在 按 照 正 确 的 计 划 行 事 。
};

// ************************************************************
// 			  					TwoFronts
// ************************************************************
instance DIA_Jarvis_TwoFronts(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 3;
	condition		= DIA_Jarvis_TwoFronts_Condition;
	information		= DIA_Jarvis_TwoFronts_Info;
	description		= "这 里 怎 么 会 出 现 两 个 派 别 ？";
};

func int DIA_Jarvis_TwoFronts_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_TwoFronts_Info()
{
	AI_Output(other, self, "DIA_Jarvis_TwoFronts_15_00"); //这 里 怎 么 会 出 现 两 个 派 别 ？
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_01"); //我 们 大 部 分 人 都 是 那 时 跟 着 李 从 流 放 地 出 来 的 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_02"); //但 是 ， 有 一 些 雇 佣 兵 是 后 来 跟 我 们 走 到 一 起 的 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_03"); //他 们 不 是 从 流 放 地 来 的 ， 而 是 在 更 远 的 南 边 跟 兽 人 战 斗 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_04"); //不 知 怎 么 的 ， 他 们 得 到 风 声 说 李 需 要 一 些 人 。 那 时 ， 他 们 的 头 儿 是 席 尔 维 欧 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_05"); //他 同 意 让 李 负 责 ， 但 是 现 在 ， 他 正 在 企 图 分 裂 雇 佣 兵 来 反 对 他 和 他 的 计 划 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_06"); //很 多 李 的 人 不 觉 得 那 是 个 什 么 大 不 了 的 事 ， 但 我 了 解 象 席 尔 维 欧 那 样 的 家 伙 。
	AI_Output(self, other, "DIA_Jarvis_TwoFronts_04_07"); //他 会 走 极 端 来 实 现 他 的 想 法 。
};

// ************************************************************
// 			  					LeesPlan
// ************************************************************
instance DIA_Jarvis_LeesPlan(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 4;
	condition		= DIA_Jarvis_LeesPlan_Condition;
	information		= DIA_Jarvis_LeesPlan_Info;
	description		= "你 知 道 李 的 意 图 是 什 么 吗 ？";
};

func int DIA_Jarvis_LeesPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_LeesPlan_Info()
{
	AI_Output(other, self, "DIA_Jarvis_LeesPlan_15_00"); //你 知 道 李 的 意 图 是 什 么 吗 ？
	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self, other, "DIA_Jarvis_LeesPlan_04_01"); //李 想 要 我 们 等 着 圣 骑 士 饿 死 在 城 里 。
	};

	AI_Output(self, other, "DIA_Jarvis_LeesPlan_04_02"); //他 在 计 划 把 我 们 所 有 的 人 带 出 这 个 岛 。 英 诺 斯 知 道 ， 对 于 离 开 这 里 ， 我 没 有 任 何 异 议 。
	AI_Output(self, other, "DIA_Jarvis_LeesPlan_04_03"); //我 不 太 清 楚 他 正 打 算 怎 么 做 ， 但 是 ， 我 相 信 他 。 到 目 前 为 止 ， 他 领 导 得 很 好 。
};

// ************************************************************
// 			  				SylviosPlan
// ************************************************************
instance DIA_Jarvis_SylviosPlan(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 5;
	condition		= DIA_Jarvis_SylviosPlan_Condition;
	information		= DIA_Jarvis_SylviosPlan_Info;
	description		= "你 知 道 席 尔 维 欧 正 在 计 划 什 么 吗 ？";
};

func int DIA_Jarvis_SylviosPlan_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jarvis_DieLage))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosPlan_Info()
{
	AI_Output(other, self, "DIA_Jarvis_SylviosPlan_15_00"); //你 知 道 席 尔 维 欧 正 在 计 划 什 么 吗 ？
	AI_Output(self, other, "DIA_Jarvis_SylviosPlan_04_01"); //席 尔 维 欧 发 现 有 一 些 圣 骑 士 往 旧 流 放 地 去 了 。
	AI_Output(self, other, "DIA_Jarvis_SylviosPlan_04_02"); //他 说 ， 其 它 的 圣 骑 士 会 不 敢 来 这 里 攻 击 我 们 ， 并 希 望 充 分 利 用 这 种 形 势 。
	AI_Output(self, other, "DIA_Jarvis_SylviosPlan_04_03"); //抢 劫 小 农 场 主 ， 伏 击 在 城 外 训 练 的 民 兵 ， 拦 劫 过 路 人 ， 诸 如 此 类 的 事 。
	AI_Output(self, other, "DIA_Jarvis_SylviosPlan_04_04"); //但 是 ， 李 认 为 以 我 们 的 立 场 来 看 ， 那 样 是 我 们 能 做 的 最 差 劲 的 事 情 。
};

// ************************************************************
// 			  				WannaJoin
// ************************************************************
instance DIA_Jarvis_WannaJoin(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 6;
	condition		= DIA_Jarvis_WannaJoin_Condition;
	information		= DIA_Jarvis_WannaJoin_Info;
	description		= "我 想 要 成 为 一 名 雇 佣 兵 ！";
};

func int DIA_Jarvis_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Jarvis_WannaJoin_15_00"); //我 想 要 成 为 一 名 雇 佣 兵 ！
	AI_Output(self, other, "DIA_Jarvis_WannaJoin_04_01"); //我 不 敢 确 定 那 是 个 好 主 意 … …
	AI_Output(other, self, "DIA_Jarvis_WannaJoin_15_02"); //问 题 出 在 哪 儿 ？
	AI_Output(self, other, "DIA_Jarvis_WannaJoin_04_03"); //嗯 ， 我 必 须 给 你 投 票 或 者 反 对 你 。
	AI_Output(self, other, "DIA_Jarvis_WannaJoin_04_04"); //而 且 ， 在 我 们 现 在 这 种 形 势 下 ， 我 只 有 确 定 你 是 站 在 李 这 边 的 才 能 给 你 投 票 ！
};

// ************************************************************
// 			  				Mission KO
// ************************************************************
instance DIA_Jarvis_MissionKO(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 7;
	condition		= DIA_Jarvis_MissionKO_Condition;
	information		= DIA_Jarvis_MissionKO_Info;
	description		= "那 么 我 应 该 怎 么 做 ？";
};

func int DIA_Jarvis_MissionKO_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jarvis_WannaJoin))
	&& (Npc_KnowsInfo(other, DIA_Jarvis_DieLage)))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_MissionKO_Info()
{
	AI_Output(other, self, "DIA_Jarvis_MissionKO_15_00"); //那 么 我 应 该 怎 么 做 ？
	AI_Output(self, other, "DIA_Jarvis_MissionKO_04_01"); //很 简 单 。 痛 打 几 个 席 尔 维 欧 的 人 ！ 那 样 ， 两 边 的 人 都 知 道 你 真 正 的 立 场 了 。
	AI_Output(self, other, "DIA_Jarvis_MissionKO_04_02"); //而 且 ， 如 果 你 遵 循 决 斗 的 规 则 ， 你 甚 至 将 赢 得 他 人 的 尊 敬 。

	MIS_Jarvis_SldKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_Murder] = TRUE;
	Log_CreateTopic(TOPIC_JarvisSLDKo, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JarvisSLDKo, LOG_RUNNING);
	B_LogEntry(TOPIC_JarvisSLDKo, TOPIC_JarvisSLDKo_1);
};

// ************************************************************
// 			  				DuellRegeln
// ************************************************************
instance DIA_Jarvis_DuellRegeln(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 8;
	condition		= DIA_Jarvis_DuellRegeln_Condition;
	information		= DIA_Jarvis_DuellRegeln_Info;
	description		= "决 斗 的 规 则 是 什 么 ？";
};

func int DIA_Jarvis_DuellRegeln_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_DuellRegeln_Info()
{
	AI_Output(other, self, "DIA_Jarvis_DuellRegeln_15_00"); //决 斗 的 规 则 是 什 么 ？
	AI_Output(self, other, "DIA_Jarvis_DuellRegeln_04_01"); //去 找 托 尔 洛 夫 ， 让 他 跟 你 解 释 吧 ， 如 果 你 感 兴 趣 的 话 。
	AI_Output(self, other, "DIA_Jarvis_DuellRegeln_04_02"); //就 这 样 ， 我 们 说 明 白 了 吧 ： 我 不 在 乎 你 是 否 遵 循 规 则 。 只 要 那 些 小 子 被 打 倒 在 地 上 不 省 人 事 ！

	B_LogEntry(TOPIC_JarvisSLDKo, TOPIC_JarvisSLDKo_2);
};

// ************************************************************
// 			  				SylviosMen
// ************************************************************
instance DIA_Jarvis_SylviosMen(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 8;
	condition		= DIA_Jarvis_SylviosMen_Condition;
	information		= DIA_Jarvis_SylviosMen_Info;
	description		= "席 尔 维 欧 的 人 是 哪 些 ？";
};

func int DIA_Jarvis_SylviosMen_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_SylviosMen_Info()
{
	AI_Output(other, self, "DIA_Jarvis_SylviosMen_15_00"); //席 尔 维 欧 的 人 是 哪 些 ？
	AI_Output(self, other, "DIA_Jarvis_SylviosMen_04_01"); //有 六 个 人 。 首 先 是 席 尔 维 欧 本 人 和 他 的 亲 信 - 布 尔 克 。
	AI_Output(self, other, "DIA_Jarvis_SylviosMen_04_02"); //然 后 是 罗 德 、 森 腾 扎 、 费 斯 特 和 罗 欧 。
	AI_Output(self, other, "DIA_Jarvis_SylviosMen_04_03"); //其 它 的 人 要 么 是 保 持 中 立 ， 要 么 是 站 在 李 这 边 的 。

	B_LogEntry(TOPIC_JarvisSLDKo, TOPIC_JarvisSLDKo_3);
};

// ************************************************************
// 			  				HowMany
// ************************************************************
instance DIA_Jarvis_HowMany(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 8;
	condition		= DIA_Jarvis_HowMany_Condition;
	information		= DIA_Jarvis_HowMany_Info;
	description		= "我 应 该 打 败 多 少 个 席 尔 维 欧 的 人 ？";
};

func int DIA_Jarvis_HowMany_Condition()
{
	if (MIS_Jarvis_SldKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowMany_Info()
{
	AI_Output(other, self, "DIA_Jarvis_HowMany_15_00"); //我 怎 么 样 才 算 打 败 了 席 尔 维 欧 的 人 ？
	AI_Output(self, other, "DIA_Jarvis_HowMany_04_01"); //如 果 你 把 他 们 的 三 个 人 打 倒 在 地 ， 那 么 你 就 证 明 了 你 是 站 在 那 一 边 的 。
	AI_Output(self, other, "DIA_Jarvis_HowMany_04_02"); //至 于 你 选 谁 那 是 你 的 事 。
	AI_Output(self, other, "DIA_Jarvis_HowMany_04_03"); //只 有 一 个 小 小 的 提 示 ： 这 不 是 为 了 证 明 你 的 勇 气 。 不 要 直 接 过 去 冲 撞 席 尔 维 欧 本 人 - 他 会 把 你 剁 成 肉 馅 。

	B_LogEntry(TOPIC_JarvisSLDKo, TOPIC_JarvisSLDKo_4);
};

// ************************************************************
// 			  				HowManyLeft
// ************************************************************
instance DIA_Jarvis_HowManyLeft(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 8;
	condition		= DIA_Jarvis_HowManyLeft_Condition;
	information		= DIA_Jarvis_HowManyLeft_Info;
	permanent		= TRUE;
	description		= "我 在 名 单 上 还 剩 几 个 席 尔 维 欧 的 人 ？";
};

func int DIA_Jarvis_HowManyLeft_Condition()
{
	if ((MIS_Jarvis_SldKO == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Jarvis_HowMany)))
	{
		return TRUE;
	};
};

func void DIA_Jarvis_HowManyLeft_Info()
{
	AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_00"); //我 在 名 单 上 还 剩 几 个 席 尔 维 欧 的 人 ？

	var int victories;
	victories = 0;

	if ((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Bullco.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_01"); //我 打 败 了 布 尔 克 。
		AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_02"); //我 听 说 了 。 不 错 。
		victories = victories + 1;
	};

	if ((Rod.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_03"); //罗 德 看 起 来 有 点 不 堪 一 击 。
		victories = victories + 1;
	};

	if ((Sentenza.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Sentenza.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if (Npc_KnowsInfo(other, DIA_Sentenza_Hello))
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_04"); //森 腾 扎 曾 企 图 从 我 身 上 榨 点 钱 - 这 可 不 是 个 明 智 的 主 意 。
		}
		else
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_05"); //我 打 倒 了 森 腾 扎 。
		};

		victories = victories + 1;
	};

	if ((Fester.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Fester.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if (MIS_Fester_KillBugs == LOG_OBSOLETE)
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_06"); //费 斯 特 试 图 欺 骗 我 - 那 是 他 的 错 误 。
		}
		else
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_07"); //费 斯 特 得 到 了 应 得 的 下 场 。
		};

		victories = victories + 1;
	};

	if ((Raoul.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Raoul.aivar[AIV_KilledByPlayer] == TRUE))
	{
		if (victories == 0)
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_08"); //至 于 罗 欧 … …
		}
		else
		{
			AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_09"); //我 去 见 过 罗 欧 了 … …
		};

		AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_10"); //还 好 吗 ？
		AI_Output(other, self, "DIA_Jarvis_HowManyLeft_15_11"); //他 十 分 欠 揍 。
		victories = victories + 1;
	};

	// ------------------------
	if (victories < 3)
	{
		if (victories == 0)
		{
			AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_12"); //到 目 前 为 止 ， 你 还 没 有 打 倒 过 一 个 席 尔 维 欧 的 人 。
		}
		else // 1-2
		{
			AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_13"); //不 错 - 继 续 下 去 。
		};

		AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_14"); //我 希 望 你 至 少 打 倒 他 们 中 的 三 个 人 。
	}
	else // 3 oder mehr
	{
		AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_15"); //那 就 够 了 ， 那 就 够 了 。
		if (victories == 6)
		{
			AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_16"); //你 真 的 打 赢 了 他 们 每 一 个 人 ， 是 吗 ？
		};

		AI_Output(self, other, "DIA_Jarvis_HowManyLeft_04_17"); //你 给 我 留 下 了 深 刻 的 印 象 - 如 果 李 问 我 的 话 ， 我 会 毫 不 犹 豫 地 投 你 的 票 。

		MIS_Jarvis_SldKO = LOG_SUCCESS;

		self.aivar[AIV_IGNORE_Murder] = FALSE;

		B_GivePlayerXP((XP_Ambient) * victories);
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_3);
	};
};

// ###############################
// ## ##
// 			Höhere Gilden
// ## ##
// ###############################

// ************************************************************
// 			  				HowMany
// ************************************************************
var int Jarvis_GuildComment;
var int Jarvis_SylvioComment;
instance DIA_Jarvis_PERM(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 8;
	condition		= DIA_Jarvis_PERM_Condition;
	information		= DIA_Jarvis_PERM_Info;
	description		= "有 新 闻 吗 ？";
};

func int DIA_Jarvis_PERM_Condition()
{
	if (other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Jarvis_PERM_Info()
{
	AI_Output(other, self, "DIA_Jarvis_PERM_15_00"); //有 新 闻 吗 ？

	if (Kapitel <= 3)
	{
		if (Jarvis_GuildComment == FALSE)
		{
			if ((other.guild == GIL_SLD)
			|| (other.guild == GIL_DJG))
			{
				AI_Output(self, other, "DIA_Jarvis_PERM_04_01"); //现 在 你 是 我 们 的 人 了 。 这 很 好 。
			}
			else
			{
				AI_Output(self, other, "DIA_Jarvis_PERM_04_02"); //你 选 择 错 了 ， 你 本 来 可 以 成 为 我 们 的 人
			};

			Jarvis_GuildComment = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Jarvis_PERM_04_03"); //近 来 ， 席 尔 维 欧 的 人 已 经 真 正 的 屈 服 了 。 （ 卑 鄙 的 笑 ）
		};
	};

	if (Kapitel >= 4)
	{
		if (Jarvis_SylvioComment == FALSE)
		{
			AI_Output(self, other, "DIA_Jarvis_PERM_04_04"); //席 尔 维 欧 终 于 走 了 。 在 他 听 说 龙 的 事 情 后 ， 就 和 他 的 一 些 人 往 矿 区 流 放 地 去 了 。
			AI_Output(self, other, "DIA_Jarvis_PERM_04_05"); //也 许 他 认 为 那 里 有 更 多 油 水 可 以 捞
			Jarvis_SylvioComment = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Jarvis_PERM_04_06"); //没 什 么 事 ， 到 目 前 为 止 一 切 风 平 浪 静 。 我 不 能 等 着 事 情 发 生 。
		};
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jarvis_PICKPOCKET(C_INFO)
{
	npc				= Sld_808_Jarvis;
	nr				= 900;
	condition		= DIA_Jarvis_PICKPOCKET_Condition;
	information		= DIA_Jarvis_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Jarvis_PICKPOCKET_Condition()
{
	C_Beklauen(41, 55);
};

func void DIA_Jarvis_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET, DIALOG_BACK, DIA_Jarvis_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jarvis_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jarvis_PICKPOCKET_DoIt);
};

func void DIA_Jarvis_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};

func void DIA_Jarvis_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jarvis_PICKPOCKET);
};
