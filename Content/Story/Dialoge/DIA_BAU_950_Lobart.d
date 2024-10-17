// *************************************************
// 						EXIT
// *************************************************
instance DIA_Lobart_EXIT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 999;
	condition		= DIA_Lobart_EXIT_Condition;
	information		= DIA_Lobart_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lobart_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************
// 					STOLEN CLOTHS
// *************************************************
instance DIA_Lobart_STOLENCLOTHS(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_STOLENCLOTHS_Condition;
	information		= DIA_Lobart_STOLENCLOTHS_Info;
	important		= TRUE;
};

func int DIA_Lobart_STOLENCLOTHS_Condition()
{
	if ((Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_STOLENCLOTHS_Info()
{
	// ------ SC hat Rüstung an ------

	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	if (Hlp_IsItem(heroArmor, ItAr_BAU_L) == TRUE)
	{
		AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_05_00"); //我 不 敢 相 信 ！ 那 个 混 蛋 穿 着 我 的 衣 服 四 处 乱 跑 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_05_01"); //嘿 ， 你 ！
		AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_05_02"); //自 从 你 上 次 出 现 在 这 里 ， 我 箱 子 里 面 就 有 一 些 东 西 失 踪 了 ！
	};

	// ------ SC hat nach Arbeit gefragt -------
	if (Npc_KnowsInfo(other, DIA_Lobart_WorkNOW))
	{
		AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_05_03"); //你 应 该 在 这 里 找 点 正 经 事 做 ， 而 不 是 在 我 的 房 子 里 乱 翻 ， 你 这 懒 鬼 ！
	};

	AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_05_04"); //你 马 上 把 我 的 衣 服 还 给 我 ！

	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
	Info_AddChoice(DIA_Lobart_STOLENCLOTHS, "算 了 吧 ！", DIA_Lobart_STOLENCLOTHS_ForgetIt);
	if (Npc_HasItems(other, ItAr_BAU_L) > 0)
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS, "给 ， 把 它 们 拿 回 去 。", DIA_Lobart_STOLENCLOTHS_HereYouGo);
	}
	else
	{
		Info_AddChoice(DIA_Lobart_STOLENCLOTHS, "我 现 在 没 有 。", DIA_Lobart_STOLENCLOTHS_DontHaveIt);
	};
};

func void DIA_Lobart_STOLENCLOTHS_HereYouGo()
{
	AI_Output(other, self, "DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00"); //给 ， 把 它 们 拿 回 去 。
	AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01"); //如 果 你 想 要 它 们 ， 你 可 以 花 钱 买 ！
	AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02"); //（ 生 硬 的 ） 现 在 去 做 点 正 经 事 ！

	B_GiveInvItems(other, self, ItAr_BAU_L, 1);

	Info_ClearChoices(DIA_Lobart_STOLENCLOTHS);
};

func void DIA_Lobart_STOLENCLOTHS_DontHaveIt()
{
	AI_Output(other, self, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00"); //我 现 在 没 有 。
	AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01"); //你 已 经 把 它 们 卖 掉 了 ， 嗯 ？ （ 怒 吼 ） 我 要 教 训 你 ， 小 子 ！

	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_Theft, 1);
};

func void DIA_Lobart_STOLENCLOTHS_ForgetIt()
{
	AI_Output(other, self, "DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00"); //忘记它！
	AI_Output(self, other, "DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01"); //（怒 吼 ） 我 要 教 训 你 ， 小 子 ！

	Lobart_Kleidung_gestohlen = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_Theft, 1);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_Hallo(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 2;
	condition		= DIA_Lobart_Hallo_Condition;
	information		= DIA_Lobart_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lobart_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_Hallo_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_Hallo_05_00"); //你 为 什 么 要 在 我 的 土 地 上 游 荡 ？
		AI_Output(self, other, "DIA_Lobart_Hallo_05_01"); //（ 打 量 ） 你 站 在 哪 一 边 ？ 反 抗 的 农 民 还 是 国 王 ？

		Info_ClearChoices(DIA_Lobart_Hallo);
		Info_AddChoice(DIA_Lobart_Hallo, "我 不 明 白 … …", DIA_Lobart_Hallo_What);
		Info_AddChoice(DIA_Lobart_Hallo, "我 站 在 国 王 一 边!", DIA_Lobart_Hallo_ForTheKing);
		Info_AddChoice(DIA_Lobart_Hallo, "我 站 在 农 民 一 边 ！", DIA_Lobart_Hallo_ForThePeasants);
	}
	else
	{
		AI_Output(self, other, "DIA_Lobart_Hallo_05_02"); //我 能 为 你 做 什 么 ？
	};
};

func void DIA_Lobart_Hallo_ForThePeasants()
{
	AI_Output(other, self, "DIA_Lobart_Hallo_ForThePeasants_15_00"); //我 站 在 农 民 一 边 ！
	AI_Output(self, other, "DIA_Lobart_Hallo_ForThePeasants_05_01"); //哈 ！ 那 个 该 死 的 战 争 贩 子 欧 纳 尔 会 把 我 们 都 拉 进 坟 墓 ！
	AI_Output(self, other, "DIA_Lobart_Hallo_ForThePeasants_05_02"); //你 怎 么 看 ， 圣 骑 士 还 会 等 多 久 ？
	AI_Output(self, other, "DIA_Lobart_Hallo_ForThePeasants_05_03"); //在 经 历 了 欧 纳 尔 的 所 做 所 为 之 后 ， 整 个 城 市 都 卷 入 了 骚 乱 。

	Lobart_AgainstKing = TRUE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_ForTheKing()
{
	AI_Output(other, self, "DIA_Lobart_Hallo_ForTheKing_15_00"); //我 站 在 国 王 一 边 ！
	AI_Output(self, other, "DIA_Lobart_Hallo_ForTheKing_05_01"); //（ 轻 蔑 的 ） ‘ 为 了 国 王 ！ ’ 那 些 城 市 里 卫 兵 把 我 的 绵 羊 抢 走 一 半 的 时 候 ， 就 是 这 么 喊 的 。
	AI_Output(self, other, "DIA_Lobart_Hallo_ForTheKing_05_02"); //但 是 在 我 们 追 赶 强 盗 的 时 候 那 些 混 蛋 在 哪 里 ？ 当 兽 人 进 攻 我 们 的 时 候 ， 他 们 又 会 去 哪 里 ？
	AI_Output(self, other, "DIA_Lobart_Hallo_ForTheKing_05_03"); //我 来 告 诉 你 ： 在 城 市 里 ， 在 厚 重 的 城 墙 后 面 。
	AI_Output(self, other, "DIA_Lobart_Hallo_ForTheKing_05_04"); //所 以 呢 ， 和 国 王 一 起 离 开 。

	Lobart_AgainstKing = FALSE;
	Info_ClearChoices(DIA_Lobart_Hallo);
};

func void DIA_Lobart_Hallo_What()
{
	AI_Output(other, self, "DIA_Lobart_Hallo_What_15_00"); //我 不 明 白 … …
	AI_Output(self, other, "DIA_Lobart_Hallo_What_05_01"); //什 么 ？ ！ 别 想 蒙 骗 我 ， 小 子 ！ 我 要 知 道 你 究 竟 站 在 哪 一 边 ！ 所 以 ， 你 拥 护 谁 ？ ！
};

///////////////////////////////////////////////////////////////////////
//	Kleidung
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_KLEIDUNG(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 2;
	condition		= DIA_Lobart_KLEIDUNG_Condition;
	information		= DIA_Lobart_KLEIDUNG_Info;
	description		= "我 需 要 一 些 衣 服 ！";
};

func int DIA_Lobart_KLEIDUNG_Condition()
{
	if ((!Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_KLEIDUNG_Info()
{
	AI_Output(other, self, "DIA_Lobart_KLEIDUNG_15_00"); //我 需 要 一 些 衣 服 ！
	AI_Output(self, other, "DIA_Lobart_KLEIDUNG_05_01"); //我 可 以 给 你 一 套 干 净 的 工 作 服 。
	AI_Output(self, other, "DIA_Lobart_KLEIDUNG_05_02"); //那 么 你 付 得 起 钱 买 吗 ？

	Log_CreateTopic(TOPIC_Kleidung, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Kleidung, LOG_RUNNING);
	B_LogEntry(TOPIC_Kleidung, TOPIC_Kleidung_1);

	if (!Npc_KnowsInfo(other, DIA_Lobart_WorkNOW))
	{
		AI_Output(self, other, "DIA_Lobart_KLEIDUNG_05_03"); //你 可 以 用 工 作 来 抵 消 一 部 分 售 价 … … 如 果 你 正 在 找 工 作 的 话 。
		B_LogEntry(TOPIC_Kleidung, TOPIC_Kleidung_2);
	};
};

///////////////////////////////////////////////////////////////////////
//	KOSTEN
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_BuyClothes(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 2;
	condition		= DIA_Lobart_BuyClothes_Condition;
	information		= DIA_Lobart_BuyClothes_Info;
	permanent		= TRUE;
	description		= "工 作 服 多 少 钱 ？";
};

func int DIA_Lobart_BuyClothes_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_KLEIDUNG) && (Lobart_Kleidung_Verkauft == FALSE))
	|| (Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE) && (Lobart_Kleidung_Verkauft == FALSE))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BuyClothes_Info()
{
	Wert_LobartsRuestung = 80; // initialisieren

	AI_Output(other, self, "DIA_Lobart_BuyClothes_15_00"); //工 作 服 多 少 钱 ？
	AI_Output(self, other, "DIA_Lobart_BuyClothes_05_01"); //嗯 ， 我 们 来 看 看 … …

	if (Lobart_AgainstKing == TRUE)
	{
		// stillschweigender Abzug
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	if (MIS_Lobart_Rueben == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lobart_BuyClothes_05_02"); //你 已 经 帮 我 完 成 了 地 里 的 工 作 。
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	if (MIS_Hilda_PfanneKaufen == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lobart_BuyClothes_05_03"); //你 帮 助 了 我 的 妻 子 。
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	if (MIS_Vino_Wein == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lobart_BuyClothes_05_04"); //维 诺 说 你 真 的 帮 了 他 不 少 忙 。 那 说 明 了 某 些 事 情 - 通 常 他 并 会 不 向 着 临 时 工 。
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	if (MIS_Maleth_Bandits == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Lobart_BuyClothes_05_05"); //玛 勒 斯 说 你 赶 走 了 强 盗 。 那 些 混 蛋 已 经 给 我 们 惹 了 很 多 的 麻 烦 。 因 为 你 ， 我 们 已 经 摆 脱 了 他 们 ！
		Wert_LobartsRuestung = Wert_LobartsRuestung - 10;
	};

	// ------------------------------
	// ------ Wert der Rüstung ------
	// ------------------------------
	B_Say_Gold(self, other, Wert_LobartsRuestung);

	if (Wert_LobartsRuestung == 30)
	{
		AI_Output(self, other, "DIA_Lobart_GOLD_05_06"); //它 不 能 再 便 宜 了。
		B_LogEntry(TOPIC_Kleidung, TOPIC_Kleidung_3);
	};

	Info_ClearChoices(DIA_Lobart_BuyClothes);
	Info_AddChoice(DIA_Lobart_BuyClothes, "那 还 是 太 贵 了 。", DIA_Lobart_BuyClothes_NotYet);
	Info_AddChoice(DIA_Lobart_BuyClothes, "给 我 工 作 服 （ 防 护 ： 武 器 １ ５ ， 箭 １ ５ ）", DIA_Lobart_BuyClothes_BUY);
};

func void DIA_Lobart_BuyClothes_BUY()
{
	AI_Output(other, self, "DIA_Lobart_BuyClothes_BUY_15_00"); //那 么 给 我 工 作 服 。

	if (B_GiveInvItems(other, self, ItMi_gold, Wert_LobartsRuestung))
	{
		if (Npc_HasItems(self, ItAr_BAU_L) > 0)
		{
			AI_Output(self, other, "DIA_Lobart_BuyClothes_BUY_05_01"); //嗯 ， 我 的 孩 子 。 诚 实 是 最 好 的 手 段 。 给 你 ！

			B_GiveInvItems(self, other, ItAr_BAU_L, 1);
		}
		else
		{
			AI_Output(self, other, "DIA_Lobart_BuyClothes_BUY_05_02"); //在 我 的 房 子 里 有 一 个 箱 子 ， 你 可 以 找 到 干 净 的 衣 服 。
			AI_Output(self, other, "DIA_Lobart_BuyClothes_BUY_05_03"); //但 是 不 要 问 都 不 问 就 把 其 它 的 东 西 都 拿 走 ！
		};

		Lobart_Kleidung_Verkauft = TRUE;
		Wld_AssignRoomToGuild("farm03", GIL_NONE); // Schlaf Raum

		B_CheckLog();
	}
	else // nicht genug Gold
	{
		AI_Output(self, other, "DIA_Lobart_BuyClothes_BUY_05_04"); //你 没 有 足 够 的 金 币 ！
	};

	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

func void DIA_Lobart_BuyClothes_NotYet()
{
	AI_Output(other, self, "DIA_Lobart_BuyClothes_NotYet_15_00"); //那 还 是 太 贵 了 。
	AI_Output(self, other, "DIA_Lobart_BuyClothes_NotYet_05_01"); //随 你 的 便 … …

	Info_ClearChoices(DIA_Lobart_BuyClothes);
};

///////////////////////////////////////////////////////////////////////
//	Was ist hier los?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_AufstandInfo(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_AufstandInfo_Condition;
	information		= DIA_Lobart_AufstandInfo_Info;
	description		= "这 里 怎 么 样 了 ？";
};

func int DIA_Lobart_AufstandInfo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_Hallo))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_AufstandInfo_Info()
{
	AI_Output(other, self, "DIA_Lobart_AufstandInfo_15_00"); //这 里 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Lobart_AufstandInfo_05_01"); //你 知 道 发 生 了 什 么 事 吗 ？ 小 子 ， 你 从 哪 里 来 ？ 我 们 就 快 发 生 内 战 了 ！

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_AufstandInfo_05_02"); //到 现 在 为 止 ， 所 有 的 农 民 都 把 交 给 城 里 的 贡 品 看 作 是 公 正 的 课 税 。
		AI_Output(self, other, "DIA_Lobart_AufstandInfo_05_03"); //但 是 自 从 圣 骑 士 来 到 克 霍 里 尼 斯 之 后 ， 城 市 卫 兵 到 我 们 这 里 来 的 次 数 越 来 越 多 - 然 后 一 点 一 点 ， 他 们 把 所 有 的 东 西 都 拿 走 了 。
		AI_Output(self, other, "DIA_Lobart_AufstandInfo_05_04"); //如 果 继 续 那 样 发 展 下 去 的 话 ， 很 快 我 们 自 己 就 什 么 都 剩 不 下 了 。
	};

	AI_Output(self, other, "DIA_Lobart_AufstandInfo_05_05"); //一 些 农 场 主 正 在 陆 续 反 叛 ！ 欧 纳 尔 是 他 们 中 的 第 一 个 ！
};

///////////////////////////////////////////////////////////////////////
//	Mehr über Onar
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_OnarStory(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_OnarStory_Condition;
	information		= DIA_Lobart_OnarStory_Info;
	description		= "跟 我 多 说 说 这 个 欧 纳 尔 … …";
};

func int DIA_Lobart_OnarStory_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_OnarStory_Info()
{
	AI_Output(other, self, "DIA_Lobart_OnarStory_15_00"); //跟 我 多 说 说 这 个 欧 纳 尔 … …

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Lobart_OnarStory_05_01"); //你 是 一 个 雇 佣 兵 ， 不 是 吗 ？ 那 我 还 能 告 诉 你 关 于 你 的 老 板 的 什 么 情 况 呢 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Lobart_OnarStory_05_02"); //欧 纳 尔 是 这 个 地 区 最 大 的 农 场 主 。 他 和 城 市 的 关 系 已 经 破 裂 了 。
		AI_Output(self, other, "DIA_Lobart_OnarStory_05_03"); //据 说 他 雇 了 雇 佣 兵 不 让 城 市 卫 兵 靠 近 ！
		AI_Output(self, other, "DIA_Lobart_OnarStory_05_04"); //不 能 指 责 他 。
		AI_Output(self, other, "DIA_Lobart_OnarStory_05_05"); //无 论 如 何 ， 没 有 皇 家 士 兵 再 敢 踏 上 他 的 农 场 一 步 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Mehr über Söldner
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_SldInfo(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_SldInfo_Condition;
	information		= DIA_Lobart_SldInfo_Info;
	description		= "欧 纳 尔 雇 佣 的 那 些 雇 佣 兵 是 谁 ？";
};

func int DIA_Lobart_SldInfo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_OnarStory))
	&& ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_SldInfo_Info()
{
	AI_Output(other, self, "DIA_Lobart_SldInfo_15_00"); //欧 纳 尔 雇 佣 的 那 些 雇 佣 兵 是 谁 ？
	AI_Output(self, other, "DIA_Lobart_SldInfo_05_01"); //我 不 太 了 解 那 些 家 伙 。 听 说 他 们 中 的 大 部 分 人 都 是 从 矿 坑 流 放 地 过 来 的 前 罪 犯 。
	AI_Output(self, other, "DIA_Lobart_SldInfo_05_02"); //（ 轻 蔑 的 ） 大 家 都 知 道 你 可 以 从 他 们 那 里 期 望 什 么 … …
};

///////////////////////////////////////////////////////////////////////
//	Für wen bist du?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WhichSide(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_WhichSide_Condition;
	information		= DIA_Lobart_WhichSide_Info;
	description		= "你 站 在 哪 一 边 ？ 农 民 还 是 国 王 ？";
};

func int DIA_Lobart_WhichSide_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_WhichSide_Info()
{
	AI_Output(other, self, "DIA_Lobart_WhichSide_15_00"); //那 么 你 呢 ？ 你 站 在 哪 一 边 ？ 农 民 还 是 国 王 ？
	AI_Output(self, other, "DIA_Lobart_WhichSide_05_01"); //我 太 靠 近 城 市 了 ， 真 的 没 有 什 么 选 择 。
	AI_Output(self, other, "DIA_Lobart_WhichSide_05_02"); //但 对 此 我 也 很 高 兴 。 我 真 的 不 知 道 该 如 何 选 择 。

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_WhichSide_05_03"); //国 王 要 榨 干 我 们 的 血 ， 而 欧 纳 尔 派 他 的 雇 佣 兵 攻 击 任 何 不 加 入 他 的 人 。
		AI_Output(self, other, "DIA_Lobart_WhichSide_05_04"); //那 也 是 为 什 么 大 部 分 其 它 的 农 场 主 还 没 有 作 出 决 定 ， 但 是 迟 早 他 们 必 须 选 择 这 边 或 者 那 边 。
	};
};

///////////////////////////////////////////////////////////////////////
//	*** MISSION: Rüben ziehen ***
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_WorkNOW(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_WorkNOW_Condition;
	information		= DIA_Lobart_WorkNOW_Info;
	description		= "我 在 找 工 作 ！";
};

func int DIA_Lobart_WorkNOW_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_AufstandInfo))
	|| (Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS))
	|| (Npc_KnowsInfo(other, DIA_Lobart_Kleidung)))
	{
		if (Kapitel < 3)
		{
			return TRUE;
		};
	};
};

func void DIA_Lobart_WorkNOW_Info()
{
	AI_Output(other, self, "DIA_Lobart_WorkNOW_15_00"); //我 在 找 工 作 ！
	AI_Output(self, other, "DIA_Lobart_WorkNOW_05_01"); //我 不 需 要 其 它 的 农 场 工 人 。 但 是 我 可 以 雇 佣 一 些 临 时 工 。
	AI_Output(self, other, "DIA_Lobart_WorkNOW_05_02"); //我 的 意 思 是 ， 你 可 以 帮 忙 做 点 农 活 。 这 里 当 然 有 一 点 其 它 的 事 情 要 做 。

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_WorkNOW_05_03"); //我 可 以 付 你 金 币 。 或 者 给 你 一 些 象 样 的 衣 服 穿 。
		AI_Output(self, other, "DIA_Lobart_WorkNOW_05_04"); //事 情 应 该 公 平 一 些 。 我 不 能 把 它 们 白 白 送 给 你 ， 但 是 我 可 以 卖 得 便 宜 些 ， 如 果 你 为 我 工 作 的 话 。

		Log_CreateTopic(TOPIC_Kleidung, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Kleidung, LOG_RUNNING);
		B_LogEntry(TOPIC_Kleidung, TOPIC_Kleidung_4);

		if ((Npc_HasEquippedArmor(other) == FALSE)
		|| (Lobart_Kleidung_Verkauft == TRUE))
		{
			AI_Output(self, other, "DIA_Lobart_WorkNOW_05_05"); //看 看 你 的 样 子 ， 我 应 该 说 ： 买 套 衣 服 吧 。
		}
		else
		{
			AI_Output(self, other, "DIA_Lobart_WorkNOW_05_06"); //不 过 你 已 经 有 衣 服 了 ， 所 以 你 可 能 更 想 要 金 币 。
		};
	};

	AI_Output(self, other, "DIA_Lobart_WorkNOW_05_07"); //不 论 如 何 - 谷 仓 旁 边 的 萝 卜 地 需 要 收 割 了 。

	Info_ClearChoices(DIA_Lobart_WorkNOW);
	Info_AddChoice(DIA_Lobart_WorkNOW, "要 我 拔 萝 卜 ？ 你 一 定 在 开 玩 笑 ！？", DIA_Lobart_WorkNOW_WannaFoolMe);
	Info_AddChoice(DIA_Lobart_WorkNOW, "好 吧 … …", DIA_Lobart_WorkNOW_Ok);
};

func void DIA_Lobart_WorkNOW_Ok()
{
	AI_Output(other, self, "DIA_Lobart_WorkNOW_Ok_15_00"); //好 吧 … …

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_WorkNOW_Ok_05_01"); //那 就 快 一 点 ， 在 我 改 变 主 意 之 前 。
	};

	Log_CreateTopic(TOPIC_Rueben, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben, LOG_RUNNING);
	B_LogEntry(TOPIC_Rueben, TOPIC_Rueben_1);

	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

func void DIA_Lobart_WorkNOW_WannaFoolMe()
{
	AI_Output(other, self, "DIA_Lobart_WorkNOW_WannaFoolMe_15_00"); //要 我 拔 萝 卜 ？ 你 一 定 在 开 玩 笑 ！？
	AI_Output(self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_01"); //真 正 男 人 的 工 作 不 应 该 给 这 样 一 位 ‘ 出 色 的 绅 士 ’ 做 ， 嗯 ？

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_02"); //马 上 去 地 里 ， 要 不 就 离 开 我 的 农 场 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Lobart_WorkNOW_WannaFoolMe_05_03"); //我 现 在 没 有 任 何 其 它 工 作 给 你 。
	};

	Log_CreateTopic(TOPIC_Rueben, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Rueben, LOG_RUNNING);
	B_LogEntry(TOPIC_Rueben, TOPIC_Rueben_1);

	MIS_Lobart_Rueben = LOG_RUNNING;
	Info_ClearChoices(DIA_Lobart_WorkNOW);
};

///////////////////////////////////////////////////////////////////////
//	Mis RUEBEN Running
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_RuebenRunning(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_RuebenRunning_Condition;
	information		= DIA_Lobart_RuebenRunning_Info;
	permanent		= TRUE;
	description		= "给 你 萝 卜 ！";
};

func int DIA_Lobart_RuebenRunning_Condition()
{
	if ((MIS_Lobart_Rueben == LOG_RUNNING)
	&& (Npc_HasItems(other, ItPl_Beet) >= 1)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_RuebenRunning_Info()
{
	AI_Output(other, self, "DIA_Lobart_RuebenRunning_15_00"); //给 你 萝 卜 ！

	if (Npc_HasItems(other, ItPl_Beet) >= 20)
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_01"); //嘿 ， 你 并 非 那 么 没 用 。
		};

		if ((Npc_IsDead(Hilda)) == FALSE)
		{
			AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_02"); //把 它 们 送 到 房 子 里 我 妻 子 手 上 ， 并 告 诉 她 把 它 们 煮 熟 。

			MIS_Lobart_RuebenToHilda = LOG_RUNNING;
			Log_CreateTopic(TOPIC_Ruebenbringen, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_Ruebenbringen, LOG_RUNNING);
			B_LogEntry(TOPIC_Ruebenbringen, TOPIC_Ruebenbringen_1);
		};

		MIS_Lobart_Rueben = LOG_SUCCESS;
		B_GivePlayerXP(XP_LobartHolRueben);

		//	Log_SetTopicStatus(TOPIC_BauerLobart, LOG_SUCCESS); ALT
		//	B_LogEntry (TOPIC_BauerLobart,"Ich habe Lobart seine Rüben gebracht, er hat mich dafür entlohnt.");

		AI_Output(other, self, "DIA_Lobart_RuebenRunning_15_03"); //那 么 我 的 报 酬 呢 ？
		AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_04"); //我 可 以 给 你5枚 金 币 。

		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_05"); //… … 或 者 卖 你 衣 服 时 便 宜 一 些 ， 选 哪 个 ？
		};

		Info_ClearChoices(DIA_Lobart_RuebenRunning);

		if (hero.guild == GIL_NONE)
		{
			Info_AddChoice(DIA_Lobart_RuebenRunning, "给 我 一 个 更 低 的 衣 服 价 格 ！", DIA_Lobart_RuebenRunning_Billiger);
		};

		Info_AddChoice(DIA_Lobart_RuebenRunning, "给 我 ５ 金 币 ！", DIA_Lobart_RuebenRunning_Gold);
	}
	else
	{
		AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_06"); //但 是 那 并 不 够20个！

		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_07"); //你 把 剩 下 的 吃 掉 了 ？ 我 希 望 没 有 ， 我 的 孩 子 ， 否 则 你 就 别 想 要 你 的 报 酬 了 ！
			AI_Output(self, other, "DIA_Lobart_RuebenRunning_05_08"); //出 去 多 弄 一 些 ！ 回 去 工 作 ， 否 则 我 就 要 督 促 你 了 ！
		};

		AI_StopProcessInfos(self);
	};
};

func void DIA_Lobart_RuebenRunning_Gold()
{
	AI_Output(other, self, "DIA_Lobart_RuebenRunning_Gold_15_00"); //给 我 ５ 金 币 ！
	AI_Output(self, other, "DIA_Lobart_RuebenRunning_Gold_05_01"); //给 。

	B_GiveInvItems(self, other, ItMi_Gold, 5);

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lobart_RuebenRunning_Gold_05_02"); //不 要 一 次 把 它 喝 光 。
	};

	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

func void DIA_Lobart_RuebenRunning_Billiger()
{
	AI_Output(other, self, "DIA_Lobart_RuebenRunning_Billiger_15_00"); //给 我 一 个 更 低 的 衣 服 价 格 ！
	AI_Output(self, other, "DIA_Lobart_RuebenRunning_Billiger_05_01"); //好 ！ 我 可 以 把 它 们 便 宜10枚 金 币 给 你 。

	Info_ClearChoices(DIA_Lobart_RuebenRunning);
};

///////////////////////////////////////////////////////////////////////
//	Was sonst noch zu tun?
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_MoreWork(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 1;
	condition		= DIA_Lobart_MoreWork_Condition;
	information		= DIA_Lobart_MoreWork_Info;
	permanent		= TRUE;
	description		= "你 还 有 其 它 事 情 要 我 做 吗 ？";
};

func int DIA_Lobart_MoreWork_Condition()
{
	if (((MIS_Lobart_Rueben == LOG_RUNNING)
	|| (MIS_Lobart_Rueben == LOG_SUCCESS))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Lobart_MoreWork_Info()
{
	AI_Output(other, self, "DIA_Lobart_MoreWork_15_00"); //你 还 有 其 它 事 情 要 我 做 吗 ？

	if (MIS_Lobart_Rueben == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Lobart_MoreWork_05_01"); //首 先 把 萝 卜 从 地 里 拔 出 来 。 然 后 我 们 再 谈 。
	}
	else // SUCCESS
	{
		AI_Output(self, other, "DIA_Lobart_MoreWork_05_02"); //我 不 需 要 ， 但 是 你 可 以 问 我 的 妻 子 或 者 地 里 的 其 它 人 。 也 许 他 们 需 要 一 些 帮 助 。
	};
};

// #####################################################################
//
//
//			ANDREs Aufnahmemission Miliz
//
//
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info AndreHelpLobart
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ANDREHELPLOBART(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 0;
	condition		= DIA_Lobart_ANDREHELPLOBART_Condition;
	information		= DIA_Lobart_ANDREHELPLOBART_Info;
	description		= "安 德 烈 让 我 来 找 你。";
};

func int DIA_Lobart_ANDREHELPLOBART_Condition()
{
	if (MIS_AndreHelpLobart == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Lobart_ANDREHELPLOBART_Info()
{
	AI_Output(other, self, "DIA_Lobart_ANDREHELPLOBART_15_00"); //安 德 烈 让 我 来 找 你 。 有 什 么 事 情 我 能 帮 你 吗 ？
	AI_Output(self, other, "DIA_Lobart_ANDREHELPLOBART_05_01"); //对 ， 当 时 。 那 些 该 死 的 旷 野 袭 击 者 让 我 恶 心 。
	AI_Output(self, other, "DIA_Lobart_ANDREHELPLOBART_05_02"); //把 他 们 都 干 掉 。 我 不 管 用 什 么 方 法 ！

	B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_5);
	MIS_LobartKillBugs = LOG_RUNNING;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BugDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_BUGDEAD(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 0;
	condition		= DIA_Lobart_BUGDEAD_Condition;
	information		= DIA_Lobart_BUGDEAD_Info;
	permanent		= TRUE;
	description		= "我 已 经 把 那 些 东 西 解 决 了 ！";
};

var int DIA_Lobart_BUGDEAD_noPerm;

func int DIA_Lobart_BUGDEAD_Condition()
{
	if ((MIS_LobartKillBugs == LOG_RUNNING)
	&& (DIA_Lobart_BUGDEAD_noPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Lobart_BUGDEAD_Info()
{
	if (
	(Npc_IsDead(Lobarts_Giant_Bug1))
	&& (Npc_IsDead(Lobarts_Giant_Bug2))
	&& (Npc_IsDead(Lobarts_Giant_Bug3))
	&& (Npc_IsDead(Lobarts_Giant_Bug4))
	&& (Npc_IsDead(Lobarts_Giant_Bug5))
	&& (Npc_IsDead(Lobarts_Giant_Bug6))
	&& (Npc_IsDead(Lobarts_Giant_Bug7))
	)
	{
		AI_Output(other, self, "DIA_Lobart_BUGDEAD_15_00"); //我 已 经 把 那 些 东 西 解 决 了 ！
		AI_Output(self, other, "DIA_Lobart_BUGDEAD_05_01"); //干 得 好 。 你 是 一 个 不 错 的 除 虫 者 。 我 会 向 周 围 的 人 推 荐 你 的 。 给 ， 拿 上 这 个 作 为 酬 劳 。

		B_StartOtherRoutine(Vino, "Start");
		B_StartOtherRoutine(LobartsBauer1, "Start");
		B_StartOtherRoutine(LobartsBauer2, "Start");

		CreateInvItems(self, ItMi_Gold, 20);
		B_GiveInvItems(self, other, ItMi_Gold, 20);

		MIS_LobartKillBugs = LOG_SUCCESS;
		MIS_AndreHelpLobart = LOG_SUCCESS;
		B_LogEntry(TOPIC_BecomeMIL, TOPIC_BecomeMIL_6);
		DIA_Lobart_BUGDEAD_noPerm = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Lobart_BUGDEAD_15_02"); //我 想 我 已 经 把 那 些 东 西 解 决 了 ！
		AI_Output(self, other, "DIA_Lobart_BUGDEAD_05_03"); //别 想 蒙 我 。 我 还 能 看 到 它 们 。 要 么 你 杀 了 那 些 畜 牲 ， 要 么 我 们 就 忘 了 整 件 事 情 。
		AI_StopProcessInfos(self);
	};
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
instance DIA_Lobart_KAP3_EXIT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 999;
	condition		= DIA_Lobart_KAP3_EXIT_Condition;
	information		= DIA_Lobart_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lobart_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DMT
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_DMT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 30;
	condition		= DIA_Lobart_DMT_Condition;
	information		= DIA_Lobart_DMT_Info;
	description		= "你 的 农 场 怎 么 样 了 ？";
};

func int DIA_Lobart_DMT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Lobart_DMT_Info()
{
	AI_Output(other, self, "DIA_Lobart_DMT_15_00"); //你 的 农 场 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Lobart_DMT_05_01"); //我 再 也 不 能 忍 受 了 。
	AI_Output(self, other, "DIA_Lobart_DMT_05_02"); //突 然 之 间 ， 这 些 戴 着 黑 头 罩 的 家 伙 就 出 现 了 ， 并 在 道 路 上 、 我 的 农 场 里 频 繁 露 面 。

	Info_ClearChoices(DIA_Lobart_DMT);

	Info_AddChoice(DIA_Lobart_DMT, DIALOG_ENDE, DIA_Lobart_DMT_BACK);

	if ((hero.guild == GIL_KDF)
	&& (Vino_isAlive_Kap3 == TRUE))
	{
		AI_Output(self, other, "DIA_Lobart_DMT_05_03"); //他 们 和 维 诺 谈 了 很 长 时 间 ， 然 后 他 们 就 和 他 一 起 消 失 了 。

		if (NpcObsessedByDMT_Vino == FALSE)
		{
			Info_AddChoice(DIA_Lobart_DMT, "他 们 把 维 诺 带 到 哪 里 ？", DIA_Lobart_DMT_VinoWohin);
		};

		Info_AddChoice(DIA_Lobart_DMT, "他 们 和 维 诺 之 间 的 交 易 是 什 么 ？", DIA_Lobart_DMT_VinoWas);
	};

	if (((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self, other, "DIA_Lobart_DMT_05_04"); //不 久 后 ， 我 的 妻 子 就 再 次 患 上 了 致 命 的 疾 病 。 她 大 部 分 时 间 里 都 躺 在 床 上 。 那 样 的 情 况 在 她 身 上 频 繁 发 生 。
	};

	AI_Output(self, other, "DIA_Lobart_DMT_05_05"); //我 在 这 里 正 在 不 断 地 崩 溃 ！

	if ((MIS_HealHilda != LOG_SUCCESS)
	&& ((Npc_IsDead(Hilda)) == FALSE)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(DIA_Lobart_DMT, "你 为 什 么 不 把 你 的 妻 子 带 到 治 疗 者 那 里 ？", DIA_Lobart_DMT_FrauHeilen);
	};

	Info_AddChoice(DIA_Lobart_DMT, "你 为 什 么 不 针 对 那 些 穿 黑 袍 子 的 家 伙 做 点 什 么 ？", DIA_Lobart_DMT_hof);
	Info_AddChoice(DIA_Lobart_DMT, "你 已 经 同 那 些 穿 黑 衣 服 的 人 谈 过 了 吗 ？", DIA_Lobart_DMT_spokeToThem);
};

func void DIA_Lobart_DMT_FrauHeilen()
{
	AI_Output(other, self, "DIA_Lobart_DMT_FrauHeilen_15_00"); //你 为 什 么 不 把 你 的 妻 子 带 到 治 疗 者 那 里 ？
	AI_Output(self, other, "DIA_Lobart_DMT_FrauHeilen_05_01"); //我 们 应 该 进 城 去 找 瓦 卓 斯 谈 谈 这 件 事 ， 但 是 只 要 这 里 还 是 这 样 将 混 乱 的 话 ， 我 就 一 步 也 不 能 离 开 我 的 农 场 。

	Log_CreateTopic(TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry(TOPIC_HealHilda, TOPIC_HealHilda_1);

	MIS_HealHilda = LOG_RUNNING;
};

func void DIA_Lobart_DMT_BACK()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

func void DIA_Lobart_DMT_spokeToThem()
{
	AI_Output(other, self, "DIA_Lobart_DMT_spokeToThem_15_00"); //你 已 经 同 那 些 穿 黑 衣 服 的 人 谈 过 了 吗 ？
	AI_Output(self, other, "DIA_Lobart_DMT_spokeToThem_05_01"); //当 然 。 没 有 办 法 阻 止 它 。
	AI_Output(self, other, "DIA_Lobart_DMT_spokeToThem_05_02"); //我 想 他 们 是 在 找 某 个 人 。
};

func void DIA_Lobart_DMT_hof()
{
	AI_Output(other, self, "DIA_Lobart_DMT_hof_15_00"); //你 为 什 么 不 针 对 那 些 穿 黑 袍 子 的 家 伙 做 点 什 么 ？
	AI_Output(self, other, "DIA_Lobart_DMT_hof_05_01"); //我 非 常 乐 意 。 但 是 我 看 到 他 们 活 活 烧 死 了 一 个 城 里 人 。 就 像 那 样 。
	AI_Output(self, other, "DIA_Lobart_DMT_hof_05_02"); //我 为 什 么 要 冒 生 命 危 险 ？
};

func void DIA_Lobart_DMT_VinoWas()
{
	AI_Output(other, self, "DIA_Lobart_DMT_VinoWas_15_00"); //他 们 和 维 诺 之 间 的 交 易 是 什 么 ？
	AI_Output(self, other, "DIA_Lobart_DMT_VinoWas_05_01"); //他 们 没 有 说 。 他 们 就 是 带 着 他 一 起 。
};

func void DIA_Lobart_DMT_VinoWohin()
{
	AI_Output(other, self, "DIA_Lobart_DMT_VinoWohin_15_00"); //他 们 把 维 诺 带 到 哪 里 ？
	AI_Output(self, other, "DIA_Lobart_DMT_VinoWohin_05_01"); //他 们 带 着 他 上 那 座 山 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info VinoTot
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_VINOTOT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 32;
	condition		= DIA_Lobart_VINOTOT_Condition;
	information		= DIA_Lobart_VINOTOT_Info;
	description		= "维 诺 不 准 备 回 来 。";
};

func int DIA_Lobart_VINOTOT_Condition()
{
	if (((Npc_IsDead(Vino)) || (NpcObsessedByDMT_Vino == TRUE))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Lobart_VINOTOT_Info()
{
	AI_Output(other, self, "DIA_Lobart_VINOTOT_15_00"); //维 诺 不 准 备 回 来 。

	if (Npc_IsDead(Vino))
	{
		AI_Output(other, self, "DIA_Lobart_VINOTOT_15_01"); //他 死 了 。
	}
	else
	{
		AI_Output(other, self, "DIA_Lobart_VINOTOT_15_02"); //他 们 把 他 逼 疯 了 。
	};

	AI_Output(self, other, "DIA_Lobart_VINOTOT_05_03"); //以 英 诺 斯 之 名 。 真 希 望 这 场 噩 梦 能 快 点 结 束 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_PERM(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 80;
	condition		= DIA_Lobart_PERM_Condition;
	information		= DIA_Lobart_PERM_Info;
	permanent		= TRUE;
	description		= "留 神 你 的 农 场 ！";
};

func int DIA_Lobart_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Lobart_DMT))
	&& (Kapitel >= 3)
	&& ((Npc_IsDead(OrcWarrior_Lobart1))
	&& (Npc_IsDead(OrcWarrior_Lobart2))
	&& (Npc_IsDead(OrcWarrior_Lobart3))
	&& (Npc_IsDead(OrcWarrior_Lobart4))
	&& (Npc_IsDead(OrcWarrior_Lobart5))
	&& (Npc_IsDead(OrcWarrior_Lobart6))))
	{
		return TRUE;
	};
};

func void DIA_Lobart_PERM_Info()
{
	AI_Output(other, self, "DIA_Lobart_PERM_15_00"); //留 神 你 的 农 场 ！
	AI_Output(self, other, "DIA_Lobart_PERM_05_01"); //我 会 试 试 。
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
instance DIA_Lobart_KAP4_EXIT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 999;
	condition		= DIA_Lobart_KAP4_EXIT_Condition;
	information		= DIA_Lobart_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lobart_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orkproblem
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKPROBLEM(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 41;
	condition		= DIA_Lobart_ORKPROBLEM_Condition;
	information		= DIA_Lobart_ORKPROBLEM_Info;
	description		= "你 遇 到 了 一 个 兽 人 的 问 题 。";
};

func int DIA_Lobart_ORKPROBLEM_Condition()
{
	if (((Npc_IsDead(OrcWarrior_Lobart1) == FALSE)
	|| (Npc_IsDead(OrcWarrior_Lobart2) == FALSE)
	|| (Npc_IsDead(OrcWarrior_Lobart3) == FALSE)
	|| (Npc_IsDead(OrcWarrior_Lobart4) == FALSE)
	|| (Npc_IsDead(OrcWarrior_Lobart5) == FALSE)
	|| (Npc_IsDead(OrcWarrior_Lobart6) == FALSE))
	&& (Kapitel >= 4)
	&& ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	&& (Npc_KnowsInfo(other, DIA_Lobart_DMT)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKPROBLEM_Info()
{
	AI_Output(other, self, "DIA_Lobart_ORKPROBLEM_15_00"); //你 遇 到 了 一 个 兽 人 的 问 题 。
	AI_Output(self, other, "DIA_Lobart_ORKPROBLEM_05_01"); //（ 怒 吼 ） 该 死 。 这 种 压 力 永 远 不 会 终 止 吗 ？。
	AI_Output(self, other, "DIA_Lobart_ORKPROBLEM_05_02"); //如 果 继 续 这 样 的 话 ， 我 的 农 场 连3枚 金 币 都 值 不 上 。

	Log_CreateTopic(TOPIC_LobartsOrKProblem, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LobartsOrKProblem, LOG_RUNNING);
	B_LogEntry(TOPIC_LobartsOrKProblem, TOPIC_LobartsOrKProblem_1);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Orksweg
///////////////////////////////////////////////////////////////////////
instance DIA_Lobart_ORKSWEG(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 42;
	condition		= DIA_Lobart_ORKSWEG_Condition;
	information		= DIA_Lobart_ORKSWEG_Info;
	description		= "我 干 掉 了 你 地 里 的 兽 人 。";
};

func int DIA_Lobart_ORKSWEG_Condition()
{
	if ((Npc_IsDead(OrcWarrior_Lobart1) == TRUE)
	&& (Npc_IsDead(OrcWarrior_Lobart2) == TRUE)
	&& (Npc_IsDead(OrcWarrior_Lobart3) == TRUE)
	&& (Npc_IsDead(OrcWarrior_Lobart4) == TRUE)
	&& (Npc_IsDead(OrcWarrior_Lobart5) == TRUE)
	&& (Npc_IsDead(OrcWarrior_Lobart6) == TRUE)
	&& (Kapitel >= 4)
	&& ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void DIA_Lobart_ORKSWEG_Info()
{
	AI_Output(other, self, "DIA_Lobart_ORKSWEG_15_00"); //我 干 掉 了 你 地 里 的 兽 人 。
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Lobart_ORKSWEG_05_01"); //不 要 让 任 何 人 说 圣 骑 士 不 会 为 我 们 这 些 小 农 场 主 做 任 何 事 。
	};

	AI_Output(self, other, "DIA_Lobart_ORKSWEG_05_02"); //感 谢 英 诺 斯 。 我 无 法 给 你 很 多 ， 但 是 我 希 望 你 能 意 识 到 我 的 感 激 之 情 。

	B_StartOtherRoutine(Vino, "Start");
	B_StartOtherRoutine(LobartsBauer1, "Start");
	B_StartOtherRoutine(LobartsBauer2, "Start");

	TOPIC_END_LobartsOrKProblem = TRUE;
	B_GivePlayerXP(XP_KilledLobartOrks);
	CreateInvItems(self, ItMi_Gold, 150);
	B_GiveInvItems(self, other, ItMi_Gold, 150);
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
instance DIA_Lobart_KAP5_EXIT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 999;
	condition		= DIA_Lobart_KAP5_EXIT_Condition;
	information		= DIA_Lobart_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lobart_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP5_EXIT_Info()
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
instance DIA_Lobart_KAP6_EXIT(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 999;
	condition		= DIA_Lobart_KAP6_EXIT_Condition;
	information		= DIA_Lobart_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lobart_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Lobart_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lobart_PICKPOCKET(C_INFO)
{
	npc				= BAU_950_Lobart;
	nr				= 900;
	condition		= DIA_Lobart_PICKPOCKET_Condition;
	information		= DIA_Lobart_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Lobart_PICKPOCKET_Condition()
{
	C_Beklauen(65, 80);
};

func void DIA_Lobart_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
	Info_AddChoice(DIA_Lobart_PICKPOCKET, DIALOG_BACK, DIA_Lobart_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lobart_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lobart_PICKPOCKET_DoIt);
};

func void DIA_Lobart_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};

func void DIA_Lobart_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lobart_PICKPOCKET);
};
