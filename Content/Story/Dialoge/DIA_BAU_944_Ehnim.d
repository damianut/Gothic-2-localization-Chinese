///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_EXIT(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 999;
	condition		= DIA_Ehnim_EXIT_Condition;
	information		= DIA_Ehnim_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_HALLO(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 3;
	condition		= DIA_Ehnim_HALLO_Condition;
	information		= DIA_Ehnim_HALLO_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Ehnim_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info()
{
	AI_Output(other, self, "DIA_Ehnim_HALLO_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Ehnim_HALLO_12_01"); //我 叫 艾 尼 姆 。 我 是 农 场 工 人 。

	if (
	(Hlp_IsValidNpc(Egill))
	&& (!C_NpcIsDown(Egill))
	)
	{
		AI_Output(self, other, "DIA_Ehnim_HALLO_12_02"); //那 边 那 个 小 个 子 是 我 的 兄 弟 艾 吉 尔 。
	};

	AI_Output(self, other, "DIA_Ehnim_HALLO_12_03"); //我 们 已 经 在 这 个 农 场 为 阿 基 尔 工 作 几 年 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDARBEIT(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 4;
	condition		= DIA_Ehnim_FELDARBEIT_Condition;
	information		= DIA_Ehnim_FELDARBEIT_Info;
	description		= "农 场 的 动 作 怎 么 样 ？";
};

func int DIA_Ehnim_FELDARBEIT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDARBEIT_Info()
{
	AI_Output(other, self, "DIA_Ehnim_FELDARBEIT_15_00"); //农 场 的 动 作 怎 么 样 ？
	AI_Output(self, other, "DIA_Ehnim_FELDARBEIT_12_01"); //你 想 要 帮 忙 吗 ？ 那 边 还 有 一 把 锄 头 。 拿 上 它 ， 然 后 到 地 里 去 。
	AI_Output(self, other, "DIA_Ehnim_FELDARBEIT_12_02"); //你 只 要 小 心 不 要 被 那 些 旷 野 袭 击 者 吓 到 。 它 们 只 要 一 口 就 能 把 你 的 胳 膊 咬 下 来 。
};

///////////////////////////////////////////////////////////////////////
//	Info feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_FELDRAEUBER(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 5;
	condition		= DIA_Ehnim_FELDRAEUBER_Condition;
	information		= DIA_Ehnim_FELDRAEUBER_Info;
	description		= "对 于 那 些 旷 野 袭 击 者 ， 你 为 什 么 不 做 任 何 事 ？";
};

func int DIA_Ehnim_FELDRAEUBER_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ehnim_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDRAEUBER_Info()
{
	AI_Output(other, self, "DIA_Ehnim_FELDRAEUBER_15_00"); //对 于 那 些 旷 野 袭 击 者 ， 你 为 什 么 不 做 任 何 事 ？
	AI_Output(self, other, "DIA_Ehnim_FELDRAEUBER_12_01"); //它 们 被 我 杀 掉 的 不 计 其 数 。 唯 一 的 问 题 就 是 ， 它 们 会 不 断 地 出 现 。
};

///////////////////////////////////////////////////////////////////////
//	Info Streit1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT1(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 6;
	condition		= DIA_Ehnim_STREIT1_Condition;
	information		= DIA_Ehnim_STREIT1_Info;
	description		= "你 的 兄 弟 也 这 么 说 。";
};

func int DIA_Ehnim_STREIT1_Condition()
{
	if (
	(
	(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
	&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
	&& ((Npc_KnowsInfo(other, DIA_Egill_STREIT2)) == FALSE)
	)
	&&
	(
	(Hlp_IsValidNpc(Egill))
	&& (!C_NpcIsDown(Egill))
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT1_Info()
{
	AI_Output(other, self, "DIA_Ehnim_STREIT1_15_00"); //你 的 兄 弟 也 这 么 说 。
	AI_Output(self, other, "DIA_Ehnim_STREIT1_12_01"); //什 么 ？ 那 个 懒 汉 ？ 只 要 那 些 野 兽 一 踏 上 我 们 的 土 地 ， 他 就 消 失 得 无 影 无 踪 。
	AI_Output(self, other, "DIA_Ehnim_STREIT1_12_02"); //他 真 不 应 该 说 这 些 废 话 。
};

///////////////////////////////////////////////////////////////////////
//	Info Streit3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT3(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 7;
	condition		= DIA_Ehnim_STREIT3_Condition;
	information		= DIA_Ehnim_STREIT3_Info;
	description		= "你 的 兄 弟 认 为 你 在 吹 牛 皮 。";
};

func int DIA_Ehnim_STREIT3_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Egill_STREIT2))
	&&
	(
	(Hlp_IsValidNpc(Egill))
	&& (!C_NpcIsDown(Egill))
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT3_Info()
{
	AI_Output(other, self, "DIA_Ehnim_STREIT3_15_00"); //你 的 兄 弟 认 为 你 在 吹 牛 皮 。
	AI_Output(self, other, "DIA_Ehnim_STREIT3_12_01"); //什 么 ？ 他 一 定 鼓 足 了 勇 气 才 那 么 说 的 吧 ？
	AI_Output(self, other, "DIA_Ehnim_STREIT3_12_02"); //他 最 好 小 心 点 ， 不 然 我 会 教 训 他 一 下 。
	AI_Output(self, other, "DIA_Ehnim_STREIT3_12_03"); //去 告 诉 他 吧 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit5
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_STREIT5(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 8;
	condition		= DIA_Ehnim_STREIT5_Condition;
	information		= DIA_Ehnim_STREIT5_Info;
	permanent		= TRUE;
	description		= "我 觉 得 你 们 两 个 都 应 该 放 松 一 下 。";
};

var int DIA_Ehnim_STREIT5_noPerm;

func int DIA_Ehnim_STREIT5_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Egill_STREIT4))
	&&
	(
	(Hlp_IsValidNpc(Egill))
	&& (!C_NpcIsDown(Egill))
	)
	&& (DIA_Ehnim_STREIT5_noPerm == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT5_Info()
{
	AI_Output(other, self, "DIA_Ehnim_STREIT5_15_00"); //我 觉 得 你 们 两 个 都 应 该 放 松 一 下 。
	AI_Output(self, other, "DIA_Ehnim_STREIT5_12_01"); //那 个 混 蛋 没 有 让 步 ， 我 说 的 对 吗 ？
	AI_Output(self, other, "DIA_Ehnim_STREIT5_12_02"); //我 要 把 他 的 挖 出 来 。 告 诉 他 。

	Info_ClearChoices(DIA_Ehnim_STREIT5);

	Info_AddChoice(DIA_Ehnim_STREIT5, "你 爱 怎 么 做 就 怎 么 做 。 我 要 离 开 了 。 ", DIA_Ehnim_STREIT5_gehen);
	Info_AddChoice(DIA_Ehnim_STREIT5, "你 为 什 么 不 亲 自 告 诉 他 ？。", DIA_Ehnim_STREIT5_Attack);
};

func void DIA_Ehnim_STREIT5_Attack()
{
	AI_Output(other, self, "DIA_Ehnim_STREIT5_Attack_15_00"); //你 为 什 么 不 亲 自 告 诉 他 ？。
	AI_Output(self, other, "DIA_Ehnim_STREIT5_Attack_12_01"); //我 去 做 。

	AI_StopProcessInfos(self);

	DIA_Ehnim_STREIT5_noPerm = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self, Egill, AR_NONE, 0);

	B_GivePlayerXP(XP_EgillEhnimStreit);
};

func void DIA_Ehnim_STREIT5_gehen()
{
	AI_Output(other, self, "DIA_Ehnim_STREIT5_gehen_15_00"); //你 爱 怎 么 做 就 怎 么 做 。 我 要 离 开 了 。
	AI_Output(self, other, "DIA_Ehnim_STREIT5_gehen_12_01"); //对 ， 马 上 悄 悄 溜 走 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP1(C_INFO)
{
	npc				= BAU_944_Ehnim;
	condition		= DIA_Ehnim_PERMKAP1_Condition;
	information		= DIA_Ehnim_PERMKAP1_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Ehnim_PERMKAP1_Condition()
{
	if (
	(DIA_Ehnim_STREIT5_noPerm == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	&& ((Kapitel < 3) || (hero.guild == GIL_KDF))
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP1_Info()
{
	AI_Output(self, other, "DIA_Ehnim_PERMKAP1_12_00"); //你 还 想 再 惹 麻 烦 ？ 我 觉 得 如 果 你 马 上 离 开 的 话 更 好 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MoleRatFett
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_MoleRatFett(C_INFO)
{
	npc				= BAU_944_Ehnim;
	condition		= DIA_Ehnim_MoleRatFett_Condition;
	information		= DIA_Ehnim_MoleRatFett_Info;
	important		= TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition()
{
	if (
	(DIA_Ehnim_STREIT5_noPerm == TRUE)
	&& (Kapitel >= 3)
	&& (hero.guild != GIL_KDF)
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_MoleRatFett_Info()
{
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_12_00"); //你 还 在 这 里 。
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_15_01"); //显 然 。 还 在 生 气 ？
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_12_02"); //别 在 意 ， 算 了 。 听 说 ， 你 最 近 去 过 洛 拔 特 的 农 场 ？
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_15_03"); //也 许 。 怎 么 了 ？
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_12_04"); //哦 ， 没 什 么 重 要 的 事 。 我 只 是 想 再 和 维 诺 谈 谈 关 于 他 的 那 个 蒸 馏 器。

	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "很 抱 歉 。 我 现 在 没 时 间 。", DIA_Ehnim_MoleRatFett_nein);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "仍 然 ？ 什 么 仍 然 ？", DIA_Ehnim_MoleRatFett_was);

	if (Npc_IsDead(Vino))
	{
		Info_AddChoice(DIA_Ehnim_MoleRatFett, "维 诺 死 了 。", DIA_Ehnim_MoleRatFett_tot);
	};
};

func void DIA_Ehnim_MoleRatFett_tot()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_tot_15_00"); //维 诺 死 了 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_tot_12_01"); //哦 ， 好 家 伙 。 那 就 不 要 多 说 了 。
};

func void DIA_Ehnim_MoleRatFett_was()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_15_00"); //仍 然 ？ 什 么 仍 然 ？
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_12_01"); //哦 。 我 也 许 不 应 该 那 么 说 。 维 诺 总 是 特 别 在 意 他 的 小 秘 密 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_12_02"); //无 论 怎 么 样 ， 现 在 我 要 把 它 说 出 来 。 在 树 林 里 面 ， 维 诺 组 装 了 一 台 秘 密 蒸 馏 器 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_12_03"); //一 段 时 间 之 前 ， 他 要 我 帮 他 弄 点 东 西 润 滑 他 的 吊 门 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_12_04"); //最 近 雨 下 得 非 常 多 ， 那 个 东 西 锈 住 了 。 现 在 绞 盘 已 经 锈 死 了 ， 没 人 能 再 进 去 了 。 真 是 乱 成 一 团 糟 。

	Log_CreateTopic(TOPIC_FoundVinosKellerei, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei, LOG_RUNNING);
	B_LogEntry(TOPIC_FoundVinosKellerei, TOPIC_FoundVinosKellerei_1);

	Info_AddChoice(DIA_Ehnim_MoleRatFett, "怎 么 样 ？ 你 拿 到 脂 肪 了 吗 ？", DIA_Ehnim_MoleRatFett_was_Fett);
};

func void DIA_Ehnim_MoleRatFett_was_Fett()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_15_00"); //怎 么 样 ？ 你 拿 到 脂 肪 了 吗 ？
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_12_01"); //对 ， 当 然 。 最 好 的 就 是 鼹 鼠 脂 肪 。 让 我 告 诉 你 吧 ， 它 甚 至 可 以 用 来 润 滑 船 上 的 大 炮 。

	Info_AddChoice(DIA_Ehnim_MoleRatFett, "把 脂 肪 卖 给 我 。", DIA_Ehnim_MoleRatFett_was_Fett_habenwill);
};

var int Ehnim_MoleRatFettOffer;
func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00"); //把 脂 肪 卖 给 我 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01"); //那 不 会 便 宜 的 ， 老 兄 。 那 东 西 在 这 个 地 区 相 当 稀 有 。
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02"); //多 少 ？
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03"); //嗯 。100枚 金 币 ？
	Ehnim_MoleRatFettOffer = 100;

	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "那 还 不 够。", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "成 交 。", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00"); //成 交 。

	if (B_GiveInvItems(other, self, ItMi_Gold, Ehnim_MoleRatFettOffer))
	{
		AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01"); //好 吧 。 给 你 。

		if (Npc_HasItems(self, ItMi_Moleratlubric_MIS))
		{
			B_GiveInvItems(self, other, ItMi_Moleratlubric_MIS, 1);

			if (Npc_IsDead(Vino) == FALSE)
			{
				AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02"); //（ 自 言 自 语 ） 哦 ， 好 家 伙 。 维 诺 会 杀 了 我 。
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03"); //该 死 ， 它 到 哪 里 去 了 ？ 该 死 的 东 西 。 嗯 ， 抱 歉 。 很 显 然 ， 那 东 西 已 经 不 在 我 身 上 了 。 把 钱 还 给 你 。
			B_GiveInvItems(self, other, ItMi_Gold, Ehnim_MoleRatFettOffer);

			if (Npc_IsDead(Egill) == FALSE)
			{
				AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04"); //我 打 赌 一 定 是 我 兄 弟 干 的 。 那 个 混 蛋 。
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				B_Attack(self, Egill, AR_NONE, 0);
			};
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05"); //这 不 是 那 个 大 人 物 么 。 首 先 你 小 题 大 做 ， 后 来 你 竟 然 一 分 钱 都 没 有 。 马 上 走 开 。
	};

	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00"); //那 还 不 够 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01"); //好 吧 ， 好 吧 。 那 么 ，70枚 金 币 。 但 是 那 是 我 最 后 一 次 出 价 。
	Ehnim_MoleRatFettOffer = 70;

	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "那 还 是 太 多 。", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, "成 交 。", DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_was_immernoch_15_00"); //那 还 是 太 多 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_was_immernoch_12_01"); //（ 生 气 ） 那 就 算 了 吧 。 祝 你 一 天 开 心 。
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_nein()
{
	AI_Output(other, self, "DIA_Ehnim_MoleRatFett_nein_15_00"); //我 现 在 没 时 间 。
	AI_Output(self, other, "DIA_Ehnim_MoleRatFett_nein_12_01"); //不 要 让 我 留 下 你 ， 老 兄 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap3
///////////////////////////////////////////////////////////////////////
instance DIA_Ehnim_PERMKAP3(C_INFO)
{
	npc				= BAU_944_Ehnim;
	condition		= DIA_Ehnim_PERMKAP3_Condition;
	information		= DIA_Ehnim_PERMKAP3_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Ehnim_PERMKAP3_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Ehnim_MoleRatFett))
	&& (Npc_IsInState(self, ZS_Talk))
	)
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP3_Info()
{
	AI_Output(self, other, "DIA_Ehnim_PERMKAP3_12_00"); //我 现 在 一 点 时 间 都 没 有 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ehnim_PICKPOCKET(C_INFO)
{
	npc				= BAU_944_Ehnim;
	nr				= 900;
	condition		= DIA_Ehnim_PICKPOCKET_Condition;
	information		= DIA_Ehnim_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Ehnim_PICKPOCKET_Condition()
{
	C_Beklauen(76, 35);
};

func void DIA_Ehnim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET, DIALOG_BACK, DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};
