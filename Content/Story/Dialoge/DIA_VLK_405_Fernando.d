///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_EXIT(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 999;
	condition		= DIA_Fernando_EXIT_Condition;
	information		= DIA_Fernando_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fernando_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fernando_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fernando_PICKPOCKET(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 900;
	condition		= DIA_Fernando_PICKPOCKET_Condition;
	information		= DIA_Fernando_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钱 包 有 些 冒 险 。 ）";
};

func int DIA_Fernando_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItSe_GoldPocket100) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (50 - Theftdiff))
	&& (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	Info_AddChoice(DIA_Fernando_PICKPOCKET, DIALOG_BACK, DIA_Fernando_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fernando_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fernando_PICKPOCKET_DoIt);
};

func void DIA_Fernando_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 50)
	{
		B_GiveInvItems(self, other, ItSe_GoldPocket100, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Fernando_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		B_NpcClearObsessionByDMT(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Fernando_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fernando_PICKPOCKET);
};

//*********************************************************************
//	Info Na.
//*********************************************************************
instance DIA_Fernando_Hello(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 5;
	condition		= DIA_Fernando_Hello_Condition;
	information		= DIA_Fernando_Hello_Info;
	description		= "最 近 生 意 好 吗 ？";
};

func int DIA_Fernando_Hello_Condition()
{
	if (NpcObsessedByDMT_Fernando == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Fernando_Hello_Info()
{
	AI_Output(other, self, "DIA_Fernando_Hello_15_00"); //最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_Fernando_Hello_14_01"); //并 没 那 么 好 。 那 时 ， 当 屏 障 还 在 那 里 的 时 候 ， 时 势 要 好 得 多 。
	AI_Output(self, other, "DIA_Fernando_Hello_14_02"); //囚 犯 们 从 矿 坑 里 收 集 成 箱 成 箱 的 矿 石 ， 然 后 ， 我 用 船 把 它 们 运 到 大 陆 上 去 。
	AI_Output(self, other, "DIA_Fernando_Hello_14_03"); //而 在 回 城 时 ， 就 会 带 上 食 品 和 其 它 物 品
	AI_Output(self, other, "DIA_Fernando_Hello_14_04"); //但 现 在 ， 我 们 跟 大 陆 之 间 的 联 系 切 断 了 ， 必 须 依 靠 这 些 农 民 来 维 持 供 给 。
};

//*********************************************************************
//	Info Perm
//*********************************************************************
instance DIA_Fernando_Perm(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 850;
	condition		= DIA_Fernando_Perm_Condition;
	information		= DIA_Fernando_Perm_Info;
	permanent		= TRUE;
	description		= "你 现 在 以 什 么 为 生 ？ ";
};

func int DIA_Fernando_Perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Perm_Info()
{
	AI_Output(other, self, "DIA_Fernando_Perm_15_00"); //你 现 在 以 什 么 为 生 ？

	if (Fernando_ImKnast == TRUE)
	{
		B_Say(self, other, "$NOTNOW");
	}
	else
	{
		if (Fernando_HatsZugegeben == TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Fernando_Perm_14_00"); //我 不 知 道 。 但 无 论 如 何 ， 我 不 会 做 非 法 交 易 。 这 很 明 确 。
		}
		else if (Npc_KnowsInfo(other, DIA_Fernando_Success) == FALSE)
		{
			AI_Output(self, other, "DIA_Fernando_Perm_14_01"); //现 在 ， 我 靠 自 己 的 积 蓄 生 活 。 但 是 ， 如 果 我 不 能 把 生 意 再 做 起 来 ， 以 后 的 生 活 就 会 变 得 很 艰 难 。
		}
		else
		{
			AI_Output(self, other, "DIA_Fernando_Perm_14_02"); //我 完 蛋 了 。 我 本 来 应 该 听 我 父 亲 的 话 不 来 做 这 些 矿 产 生 意 的 。
		};
	};
};

//*********************************************************************
//	Info Minental
//*********************************************************************
instance DIA_Fernando_Minental(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 2;
	condition		= DIA_Fernando_Minental_Condition;
	information		= DIA_Fernando_Minental_Info;
	important		= TRUE;
};

func int DIA_Fernando_Minental_Condition()
{
	if ((NpcObsessedByDMT_Fernando == FALSE)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	&& (Kapitel == 2)
	&& (EnterOW_Kapitel2 == FALSE)
	&& (Fernando_HatsZugegeben == FALSE) // ADDON
	&& (Fernando_ImKnast == FALSE)) // HACK ADDON PATCH
	{
		return TRUE;
	};
};

func void DIA_Fernando_Minental_Info()
{
	AI_Output(self, other, "DIA_Fernando_Minental_14_00"); //嘿 ， 你 - 等 一 等 。 你 要 去 往 矿 藏 山 谷 ， 是 吗 ？
	AI_Output(other, self, "DIA_Fernando_Minental_15_01"); //还 有 吗 ？
	AI_Output(self, other, "DIA_Fernando_Minental_14_02"); //有 一 桩 买 卖 。 你 给 我 报 告 一 下 关 于 矿 石 的 情 况 ， 作 为 交 换 ， 我 给 你 … …

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Fernando_Minental_14_03"); //… … 一 块 咒 语 石 。
	}
	else
	{
		AI_Output(self, other, "DIA_Fernando_Minental_14_04"); //… … 一 个 能 增 加 生 命 力 的 戒 指 。
	};

	AI_Output(other, self, "DIA_Fernando_Minental_15_05"); //我 要 看 看 我 能 做 什 么 。

	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self, "START");

	Log_CreateTopic(TOPIC_Fernando, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Fernando, LOG_RUNNING);
	B_LogEntry(TOPIC_Fernando, TOPIC_Fernando_1);
};

///////////////////////////////////////////////////////////////////////
//	Info BanditTrader
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Fernando_BanditTrader(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 5;
	condition		= DIA_Addon_Fernando_BanditTrader_Condition;
	information		= DIA_Addon_Fernando_BanditTrader_Info;
	description		= "你 向 强 盗 们 出 售 武 器 。";
};

func int DIA_Addon_Fernando_BanditTrader_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fernando_Hello))
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& (
	(Npc_HasItems(other, ItMw_Addon_BanditTrader))
	|| (Npc_HasItems(other, ItRi_Addon_BanditTrader))
	|| ((Npc_HasItems(other, ItWr_Addon_BanditTrader)) && (BanditTrader_Lieferung_Gelesen == TRUE))
	))
	{
		return TRUE;
	};
};

func void DIA_Addon_Fernando_BanditTrader_Info()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_00"); //你 向 强 盗 们 出 售 武 器 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_01"); //（ 莫 明 其 妙 的 ） 但 是 - 你 为 什 么 会 这 样 想 ？

	B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_6);

	B_GivePlayerXP(XP_Addon_Fernando_HatsZugegeben);
	Fernando_HatsZugegeben = TRUE;

	if ((Npc_HasItems(other, ItWr_Addon_BanditTrader)) && (BanditTrader_Lieferung_Gelesen == TRUE))
	{
		AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_02"); //我 从 一 个 强 盗 那 里 得 到 的 这 份 商 品 清 单 上 有 你 的 签 名 。
	};

	if (Npc_HasItems(other, ItRi_Addon_BanditTrader))
	{
		AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_03"); //我 在 强 盗 那 里 发 现 了 这 个 海 外 贸 易 公 会 阿 莱 克 欧 斯 的 戒 指 。 你 是 个 海 外 贸 易 商 人 。

		if (Npc_HasItems(other, ItMw_Addon_BanditTrader))
		{
			AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_04"); //还 有 ， 那 个 强 盗 佩 带 的 剑 上 有 你 的 名 字 的 首 字 母 。
		};
	}
	else // nur (Npc_HasItems(other,ItMw_Addon_BanditTrader))
	{
		AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_05"); //还 有 ， 那 个 强 盗 佩 带 的 剑 上 有 你 的 名 字 的 首 字 母 。
	};

	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_06"); //现 在 你 可 以 承 认 了 。 我 揭 开 了 你 的 掩 饰 。

	if (Fernando_ImKnast == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_07"); //那 么 是 你 干 的 。 你 就 是 那 个 揭 发 我 的 人 。 我 要 让 你 为 此 付 出 代 价 。
		AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_15_08"); //你 必 须 先 要 离 开 这 里 ， 但 是 我 很 难 想 象 他 们 会 让 你 那 么 快 离 开 。
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_09"); //（ 愤 怒 地 ， 自 言 自 语 ） 我 的 时 间 到 了 。
		B_NpcClearObsessionByDMT(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_10"); //（ 辩 解 ） 我 不 会 那 么 做 的 ， 相 信 我 。
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_11"); //（ 辩 解 ） 最 初 ， 他 们 只 是 想 从 我 这 里 得 到 食 物 供 给 。 那 时 生 意 真 的 很 不 景 气 ， 所 以 我 被 他 们 缠 住 了 。
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_12"); //（ 辩 解 ） 后 来 ， 他 们 变 得 越 来 越 欺 人 太 甚 ， 还 威 胁 说 如 果 不 卖 给 他 们 想 要 的 武 器 就 要 杀 了 我 。
		AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_14_13"); //（ 辩 解 ） 你 不 能 因 为 指 责 我 ， 我 也 是 受 害 者 。

		if (Fernando_ImKnast == FALSE) // Joly:zur Sicherheit
		{
			Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, "如 果 我 让 你 走 的 话 ， 你 给 我 什 么 报 酬 ？。", DIA_Addon_Fernando_BanditTrader_preis);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, "民 兵 会 处 理 你 的 。", DIA_Addon_Fernando_BanditTrader_mil);
			Info_AddChoice(DIA_Addon_Fernando_BanditTrader, "我 发 抖 了 ， 我 发 抖 了 。", DIA_Addon_Fernando_BanditTrader_Uptown);
		};
	};
};

func void DIA_Addon_Fernando_BanditTrader_Uptown()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_00"); //别 让 我 掉 眼 泪 。 某 些 住 在 富 人 区 的 人 对 你 深 恶 痛 绝 。
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_Uptown_15_01"); //你 会 为 一 把 金 币 而 出 卖 自 己 的 灵 魂 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_Uptown_14_02"); //我 为 了 掩 饰 自 己 ， 付 出 了 沉 重 的 代 价 。 如 果 我 不 跑 ， 他 们 会 把 我 抓 去 送 给 港 口 区 些 暴 徒 。
};

func void DIA_Addon_Fernando_BanditTrader_mil()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_00"); //民 兵 会 处 理 你 的 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_01"); //你 不 能 这 么 做 。
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_mil_15_02"); //我 应 该 说 我 能 。 你 会 吃 惊 的 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_mil_14_03"); //以 英 诺 斯 的 名 义 。 我 完 了 。
	B_NpcClearObsessionByDMT(self);
};

func void DIA_Addon_Fernando_BanditTrader_preis()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_preis_15_00"); //如 果 我 让 你 走 的 话 ， 你 给 我 什 么 报 酬 ？
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_01"); //你 知 道 我 过 得 不 是 很 好 。 我 不 能 给 你 太 多 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_02"); //我 会 给 你200个 金 币 和 一 个 珍 贵 的 戒 指 。
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_preis_14_03"); //那 是 必 须 要 做 的 。 现 在 ， 你 会 给 我 那 些 控 告 材 料 吗 ？

	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader, "算 了 吧 。 我 不 会 把 它 卖 掉 的", DIA_Addon_Fernando_BanditTrader_nein);
	Info_AddChoice(DIA_Addon_Fernando_BanditTrader, "嗯 ， 好 吧 。 同 意 。", DIA_Addon_Fernando_BanditTrader_ja);
};

func void DIA_Addon_Fernando_BanditTrader_ja()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_ja_15_00"); //嗯 ， 好 吧 。 同 意 。
	B_GivePlayerXP(XP_Ambient);
	Npc_RemoveInvItems(hero, ItMw_Addon_BanditTrader, Npc_HasItems(other, ItMw_Addon_BanditTrader));
	Npc_RemoveInvItem(hero, ItRi_Addon_BanditTrader);
	Npc_RemoveInvItem(hero, ItWr_Addon_BanditTrader);

	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_01"); //好 ， 这 是 你 的 钱 。

	CreateInvItems(self, ItMi_Gold, 200);
	B_GiveInvItems(self, other, ItMi_Gold, 200);
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_ja_14_02"); //还 有 这 个 戒 指 。 我 们 现 在 扯 平 了 。
	CreateInvItems(self, ItRi_Prot_Point_01, 1);
	B_GiveInvItems(self, other, ItRi_Prot_Point_01, 1);
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

func void DIA_Addon_Fernando_BanditTrader_nein()
{
	AI_Output(other, self, "DIA_Addon_Fernando_BanditTrader_nein_15_00"); //不 。 我 想 我 更 愿 意 留 着 它
	AI_Output(self, other, "DIA_Addon_Fernando_BanditTrader_nein_14_01"); //好 的 。 那 就 留 着 它 ， 如 果 你 出 卖 我 ， 那 厄 运 就 会 降 临 到 你 的 头 上 。
	Info_ClearChoices(DIA_Addon_Fernando_BanditTrader);
};

//*********************************************************************
//	Info Success
//*********************************************************************
instance DIA_Fernando_Success(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 5;
	condition		= DIA_Fernando_Success_Condition;
	information		= DIA_Fernando_Success_Info;
	description		= "我 已 经 去 过 了 矿 藏 山 谷 。";
};

func int DIA_Fernando_Success_Condition()
{
	if ((NpcObsessedByDMT_Fernando == FALSE)
	&& (Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Fernando_Minental)))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Success_Info()
{
	AI_Output(other, self, "DIA_Fernando_Success_15_00"); //我 已 经 去 过 了 矿 藏 山 谷 。

	if (Fernando_ImKnast == FALSE)
	{
		Fernando_Erz = TRUE;
		B_GivePlayerXP(XP_Ambient);

		AI_Output(self, other, "DIA_Fernando_Success_14_01"); //还 有 吗 ？ 那 里 的 情 况 如 何 ？
		AI_Output(other, self, "DIA_Fernando_Success_15_02"); //矿 井 都 枯 竭 了 ， 那 里 只 有 几 箱 矿 石 。 一 点 都 不 值 得 去 挖 掘 了 。
		AI_Output(self, other, "DIA_Fernando_Success_14_03"); //那 不 会 是 真 的 ！ 那 意 味 着 我 完 了 … …

		if (Fernando_HatsZugegeben == FALSE)
		{
			AI_Output(other, self, "DIA_Fernando_Success_15_04"); //我 们 的 交 易 怎 么 办 ？
			AI_Output(self, other, "DIA_Fernando_Success_14_05"); //现 在 ， 关 于 你 的 酬 劳 … …

			if (other.guild == GIL_KDF)
			{
				AI_Output(self, other, "DIA_Fernando_Minental_14_06"); //给 ， 拿 着 这 块 咒 语 石 。
				B_GiveInvItems(self, other, ItmI_RuneBlank, 1);
			}
			else
			{
				AI_Output(self, other, "DIA_Fernando_Minental_14_07"); //这 是 你 的 戒 指 。
				B_GiveInvItems(self, other, ItRi_Hp_02, 1);
			};
		};
	}
	else
	{
		B_Say(self, other, "$NOTNOW");
		Log_SetTopicStatus(TOPIC_Fernando, LOG_OBSOLETE);
		B_LogEntry(TOPIC_Fernando, TOPIC_Fernando_2);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Obsession
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Obsession(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 30;
	condition		= DIA_Fernando_Obsession_Condition;
	information		= DIA_Fernando_Obsession_Info;
	description		= "你 没 事 吧 ？";
};

func int DIA_Fernando_Obsession_Condition()
{
	if ((Kapitel >= 3)
	&& (NpcObsessedByDMT_Fernando == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Obsession_Info()
{
	B_NpcObsessedByDMT(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
instance DIA_Fernando_Heilung(C_INFO)
{
	npc				= VLK_405_Fernando;
	nr				= 55;
	condition		= DIA_Fernando_Heilung_Condition;
	information		= DIA_Fernando_Heilung_Info;
	permanent		= TRUE;
	description		= "你 被 附 体 了 ！。";
};

func int DIA_Fernando_Heilung_Condition()
{
	if ((NpcObsessedByDMT_Fernando == TRUE) && (NpcObsessedByDMT == FALSE)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Fernando_Heilung_Info()
{
	AI_Output(other, self, "DIA_Fernando_Heilung_15_00"); //你 被 附 体 了 ！。
	AI_Output(self, other, "DIA_Fernando_Heilung_14_01"); //走 吧 。 马 上 走 。
	B_NpcClearObsessionByDMT(self);
};
