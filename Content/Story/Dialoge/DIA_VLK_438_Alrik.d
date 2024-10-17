// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Alrik_EXIT(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 999;
	condition		= DIA_Alrik_EXIT_Condition;
	information		= DIA_Alrik_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Alrik_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alrik_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Alrik_PICKPOCKET(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 900;
	condition		= DIA_Alrik_PICKPOCKET_Condition;
	information		= DIA_Alrik_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Alrik_PICKPOCKET_Condition()
{
	C_Beklauen(55, 50);
};

func void DIA_Alrik_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
	Info_AddChoice(DIA_Alrik_PICKPOCKET, DIALOG_BACK, DIA_Alrik_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alrik_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Alrik_PICKPOCKET_DoIt);
};

func void DIA_Alrik_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

func void DIA_Alrik_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alrik_PICKPOCKET);
};

// ************************************************************
// 			  				  Hallo
// ************************************************************
instance DIA_Alrik_Hallo(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_Hallo_Condition;
	information		= DIA_Alrik_Hallo_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Alrik_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Alrik_Hallo_Info()
{
	AI_Output(other, self, "DIA_Alrik_Hallo_15_00"); //你 在 这 里 干 什 么 ？

	if (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") <= 500) // In Ecke
	{
		AI_Output(self, other, "DIA_Alrik_Hallo_09_01"); //（ 大 笑 ） 这 是 我 的 家 ！
	}
	else // In Kneipe oder auf dem Weg
	{
		if (Npc_GetDistToWP(self, "NW_CITY_HABOUR_TAVERN01_01") <= 500)
		{
			AI_Output(self, other, "DIA_Alrik_Hallo_09_02"); //我 还 能 在 这 里 做 些 什 么 呢 ？ 我 在 喝 酒 。
		}
		else
		{
			AI_Output(self, other, "DIA_Alrik_Hallo_09_03"); //我 要 散 一 会 步 。
		};
	};

	AI_Output(self, other, "DIA_Alrik_Hallo_09_04"); //但 是 如 果 你 问 ， 我 整 天 在 干 什 么 - 我 组 织 搏 击 赛 。
};

// ************************************************************
// 			  				Du kämpfst?
// ************************************************************
instance DIA_Alrik_YouFight(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_YouFight_Condition;
	information		= DIA_Alrik_YouFight_Info;
	description		= "你 准 备 格 斗 ？";
};

func int DIA_Alrik_YouFight_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Alrik_YouFight_Info()
{
	AI_Output(other, self, "DIA_Alrik_YouFight_15_00"); //你 准 备 格 斗 ？
	AI_Output(self, other, "DIA_Alrik_YouFight_09_01"); //每 天 ， 从 中 午 到 傍 晚 。
	if (Npc_GetDistToWP(self, "NW_CITY_PATH_HABOUR_16_01") <= 500) // In Ecke
	{
		AI_Output(self, other, "DIA_Alrik_YouFight_09_02"); //而 且 就 在 这 里 ！
	};

	AI_Output(self, other, "DIA_Alrik_YouFight_09_03"); //在 港 口 区 的 仓 库 后 面 - 家 ， 可 爱 的 家 ！
};

// ************************************************************
// 			  				Regeln
// ************************************************************
instance DIA_Alrik_Regeln(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_Regeln_Condition;
	information		= DIA_Alrik_Regeln_Info;
	description		= "格 斗 的 规 则 是 什 么 ？";
};

func int DIA_Alrik_Regeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Regeln_Info()
{
	AI_Output(other, self, "DIA_Alrik_Regeln_15_00"); //格 斗 的 规 则 是 什 么 ？
	AI_Output(self, other, "DIA_Alrik_Regeln_09_01"); //非 常 简 单 ： 所 有 的 常 规 武 器 都 可 以 用 。 不 能 用 弓 或 者 弩 ， 不 能 用 魔 法 ！
	AI_Output(self, other, "DIA_Alrik_Regeln_09_02"); //我 们 一 直 打 到 其 中 一 个 人 倒 下 。 一 旦 我 们 有 人 后 背 着 地 ， 就 结 束 了 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Alrik_Regeln_09_03"); //论 谁 离 开 了 那 个 角 落 就 输 了 ！ 所 以 ， 如 果 你 退 出 ， 我 就 赢 了 ！
	AI_Output(self, other, "DIA_Alrik_Regeln_09_04"); //赌 注 是 5 0 个 金 币 。 如 果 你 赢 了 ， 你 就 拿 回 1 0 0 个 金 币 。 如 果 没 有 - 嗯 - 那 你 的 钱 就 打 水 漂 了 。 （ 咧 着 嘴 笑 ）
	AI_Output(self, other, "DIA_Alrik_Regeln_09_05"); //明 白 了 吗 ？
	AI_Output(other, self, "DIA_Alrik_Regeln_15_06"); //好 ！
};

// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 3
// ************************************************************

func void B_Alrik_Again()
{
	AI_Output(self, other, "DIA_Alrik_Add_09_03"); //怎 么 样 了 ？ 你 又 想 要 上 来 挑 战 吗 ？ 我 想 我 现 在 已 经 好 多 了 … …
};
instance DIA_Alrik_NewFights3(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_NewFights3_Condition;
	information		= DIA_Alrik_NewFights3_Info;
	important		= TRUE;
};

func int DIA_Alrik_NewFights3_Condition()
{
	if ((Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren <= 6))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights3_Info()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter(self, 4);
	B_Alrik_Again();
};

// ************************************************************
// 		  			Important für NEUE 3 Kämpfe ab Kap 5
// ************************************************************
instance DIA_Alrik_NewFights5(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_NewFights5_Condition;
	information		= DIA_Alrik_NewFights5_Info;
	important		= TRUE;
};

func int DIA_Alrik_NewFights5_Condition()
{
	if ((Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren <= 9))
	{
		return TRUE;
	};
};

func void DIA_Alrik_NewFights5_Info()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 20);
	B_SetAttributesToChapter(self, 6);
	B_Alrik_Again();
};

// ************************************************************
// 			  			WannaFight
// ************************************************************

func void B_Alrik_Enough()
{
	AI_Output(self, other, "DIA_Alrik_WannaFight_09_05"); //我 想 你 已 经 赢 够 了 。
	AI_Output(self, other, "DIA_Alrik_WannaFight_09_06"); //别 误 会 我 ， 自 从 上 次 以 来 ， 我 的 脑 子 还 在 嗡 嗡 响 … …
};

func void B_Alrik_ComeBackLater()
{
	AI_Output(self, other, "DIA_Alrik_Add_09_02"); //以 后 再 来 。 在 这 期 间 ， 我 要 训 练 …，
};
instance DIA_Alrik_WannaFight(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_WannaFight_Condition;
	information		= DIA_Alrik_WannaFight_Info;
	permanent		= TRUE;
	description		= "我 想 再 和 你 格 斗 ！";
};

func int DIA_Alrik_WannaFight_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alrik_Regeln))
	&& (self.aivar[AIV_ArenaFight] == AF_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WannaFight_Info()
{
	AI_Output(other, self, "DIA_Alrik_WannaFight_15_00"); //我 想 再 和 你 格 斗 ！

	Info_ClearChoices(DIA_Alrik_WannaFight);

	// ------ EXIT: Wenn Alrik schonmal verloren, nächster Kampf erst, wenn Alrik das bessere Schwert hat ------
	if (((Alrik_ArenaKampfVerloren > 0) && (Npc_HasItems(self, ItMW_AlriksSword_Mis) == 0))
	|| (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if (MIS_Alrik_Sword == LOG_SUCCESS) // Wenn nach Schwert-Mission niedergeschlagen und Schwert weggenommen
		{
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_01"); //先 把 我 的 剑 还 给 我 。 然 后 我 们 再 讨 论 … …
		}
		else
		{
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_02"); //不 ， 不 。 在 我 再 次 挑 战 你 之 前 ， 我 需 要 一 件 更 好 的 武 器 ！
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_03"); //前 几 天 ， 我 不 得 不 卖 掉 了 我 的 剑。
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_04"); //有 了 那 个 宝 贝 ， 我 就 战 无 不 胜 了 ！ 如 果 你 帮 我 找 回 了 它 ， 我 会 再 次 接 受 你 的 挑 战 ！

			Alrik_VomSchwertErzaehlt = TRUE;

			Log_CreateTopic(TOPIC_AlrikSchwert, LOG_MISSION);
			Log_SetTopicStatus(TOPIC_AlrikSchwert, LOG_RUNNING);
			B_LogEntry(TOPIC_AlrikSchwert, TOPIC_AlrikSchwert_1);
		};
	}

	// ----- EXIT: ÜBER DREI MAL Alrik_ArenaKampfVerloren ------
	else if ((Kapitel <= 2)
	&& (Alrik_ArenaKampfVerloren > 3))
	{
		AI_Output(self, other, "DIA_Alrik_Add_09_00"); //我 想 现 在 这 就 应 该 够 了 … …
		AI_Output(self, other, "DIA_Alrik_Add_09_01"); //让 我 休 息 一 会 儿 。
		B_Alrik_ComeBackLater();
	}

	else if ((Kapitel >= 3)
	&& (Kapitel <= 4)
	&& (Alrik_ArenaKampfVerloren > 6))
	{
		B_Alrik_Enough();
		B_Alrik_ComeBackLater();
	}

	else if ((Kapitel >= 5)
	&& (Alrik_ArenaKampfVerloren > 9))
	{
		B_Alrik_Enough();
		AI_Output(self, other, "DIA_Alrik_Add_09_04"); //此 外 ， 我 现 在 已 经 攒 了 足 够 的 钱 了 。
		AI_Output(self, other, "DIA_Alrik_Add_09_05"); //我 要 退 出 ， 而 且 我 正 要 去 城 里 去 找 个 地 方 住 下 … …
		AI_Output(self, other, "DIA_Alrik_Add_09_06"); //谁 知 道 呢 ， 也 许 我 能 开 一 个 武 器 店 … …
	}

	// ------ normaler KAMPF ------
	else if (Wld_IsTime(11, 00, 19, 00))
	{
		AI_Output(self, other, "DIA_Alrik_WannaFight_09_07"); //你 有 5 0 个 金 币 吗 ？
		Info_ClearChoices(DIA_Alrik_WannaFight);
		Info_AddChoice(DIA_Alrik_WannaFight, "不 … …", DIA_Alrik_WannaFight_NoGold);
		if (Npc_HasItems(other, itmi_gold) >= 50)
		{
			Info_AddChoice(DIA_Alrik_WannaFight, "给 你 … …", DIA_Alrik_WannaFight_Gold);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Alrik_WannaFight_09_08"); //我 只 在 从 中 午 到 傍 晚 这 段 时 间 里 安 排 搏 击 赛 。
		AI_Output(self, other, "DIA_Alrik_WannaFight_09_09"); //要 有 足 够 的 观 众 来 赌 钱 才 值 得 开 始 一 场 搏 击 赛 ！
		if (Wld_IsTime(19, 00, 03, 30))
		{
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_10"); //现 在 太 晚 了 。 明 天 中 午 再 来 ！
		}
		else // 03,30 - 11,00
		{
			AI_Output(self, other, "DIA_Alrik_WannaFight_09_11"); //现 在 还 太 早 ， 等 一 会 儿 再 来 ！
		};
	};
};

func void DIA_Alrik_WannaFight_Gold()
{
	AI_Output(other, self, "DIA_Alrik_WannaFight_Gold_15_00"); //给 你 … …
	B_GiveInvItems(other, self, itmi_gold, 50);
	AI_Output(self, other, "DIA_Alrik_WannaFight_Gold_09_01"); //（ 大 声 地 ） 我 们 有 一 个 新 挑 战 者 ！
	AI_Output(self, other, "DIA_Alrik_WannaFight_Gold_09_02"); //赌 注 都 下 好 了 … …

	Npc_RemoveInvItems(self, itmi_gold, Npc_HasItems(self, itmi_gold));
	CreateInvItems(self, itmi_gold, 100); // 50 vom Spieler und 50 Einsatz von Alrik...

	AI_Output(self, other, "DIA_Alrik_WannaFight_Gold_09_03"); //你 准 备 好 了 吗 ？

	// --------------------------------------
	self.aivar[AIV_ArenaFight] = AF_RUNNING;
	Alrik_Kaempfe = Alrik_Kaempfe + 1;
	// --------------------------------------

	Info_ClearChoices(DIA_Alrik_WannaFight);
	Info_AddChoice(DIA_Alrik_WannaFight, "稍 等 … …", DIA_Alrik_WannaFight_Moment);
	Info_AddChoice(DIA_Alrik_WannaFight, "来 吧 ！", DIA_Alrik_WannaFight_NOW);
};

func void DIA_Alrik_WannaFight_NoGold()
{
	AI_Output(other, self, "DIA_Alrik_WannaFight_NoGold_15_00"); //不 … …
	AI_Output(self, other, "DIA_Alrik_WannaFight_NoGold_09_01"); //那 么 ， 去 拿 它 们 吧 ！ 没 有 赌 注 就 没 有 搏 击 赛 ！

	Info_ClearChoices(DIA_Alrik_WannaFight);
};

func void DIA_Alrik_WannaFight_NOW()
{
	AI_Output(other, self, "DIA_Alrik_WannaFight_NOW_15_00"); //来 吧 ！
	AI_Output(self, other, "DIA_Alrik_WannaFight_NOW_09_01"); //那 么 ， 我 们 来 看 看 你 能 做 什 么 ！

	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self, ItPo_Health_03, 1);
		B_UseItem(self, ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Alrik_WannaFight_Moment()
{
	AI_Output(other, self, "DIA_Alrik_WannaFight_Moment_15_00"); //稍 等 … …
	AI_Output(self, other, "DIA_Alrik_WannaFight_Moment_09_01"); //慢 慢 来 … … 我 现 在 就 开 始 了 ！

	if (self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self, ItPo_Health_03, 1);
		B_UseItem(self, ItPo_Health_03);
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  			NACH Kampf
// ************************************************************
instance DIA_Alrik_AfterFight(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_AfterFight_Condition;
	information		= DIA_Alrik_AfterFight_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Alrik_AfterFight_Condition()
{
	if ((self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		if (self.aivar[AIV_ArenaFight] != AF_NONE)
		{
			return TRUE; // direkt ansprechen
		}
		else if (Npc_IsInState(self, ZS_Talk))
		{
			return TRUE; // wenn kein Kampf war, nur reagieren, wenn SC ihn angesprochen hat
		};
	};
};

func void DIA_Alrik_AfterFight_Info()
{
	if ((self.aivar[AIV_LastPlayerAR] == AR_NONE) // Kampf aus Dialog heraus.
	&& (self.aivar[AIV_ArenaFight] != AF_NONE)
	&& (self.aivar[AIV_ArenaFight] != AF_AFTER_PLUS_DAMAGE))
	{
		if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
		{
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_00"); //哦 ， 伙 计 ！ 你 的 拳 够 重 。

			if (Npc_HasItems(self, itmi_gold) >= 100)
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_01"); //这 是 你 的 1 0 0 个 金 币 ！ 你 已 经 赢 了 ！
				B_GiveInvItems(self, other, itmi_gold, 100);
			}
			else if (Npc_HasItems(self, itmi_gold) == 0)
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_02"); //我 看 到 你 已 经 拿 了 钱 。
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_03"); //你 本 来 应 该 等 到 我 给 你 - 我 讲 信 用 ！
			}
			else // zwischen 1 und 99 Gold...
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_04"); //你 在 我 昏 昏 沉 沉 的 时 候 翻 遍 了 我 的 口 袋 ！
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_05"); //这 种 行 为 可 真 不 好 ， 伙 计 ！ 算 了 ， 反 正 钱 是 你 的 ！ 这 是 剩 下 的 。
				B_GiveInvItems(self, other, itmi_gold, Npc_HasItems(self, itmi_gold));
			};

			Alrik_ArenaKampfVerloren = Alrik_ArenaKampfVerloren + 1;
		}
		else if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON)
		{
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_06"); //真 是 一 场 精 彩 的 搏 击 赛 。 你 的 赌 注 没 了 - 别 太 在 意 ， 那 是 给 你 上 了 一 堂 好 课 ！ （ 咧 着 嘴 笑 ）
		}
		else // FIGHT_CANCEL
		{
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_07"); //嘿 ， 像 我 说 从 那 样 ， 谁 要 是 离 开 了 那 个 角 落 就 输 了 ！ 如 果 你 想 再 试 一 次 ， 我 乐 意 奉 陪 ！
		};

		// ------ nur einmal ------
		if (Alrik_Kaempfe == 1)
		{
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_08"); //还 有 一 件 事 ： 谁 也 不 能 谈 论 仓 库 后 面 发 生 的 这 些 事 情 。

			if ((other.guild != GIL_MIL)
			&& (other.guild != GIL_PAL))
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_09"); //民 兵 会 把 任 何 一 个 在 这 里 犯 了 一 点 小 事 的 人 送 进 监 狱 ， 而 且 那 些 小 子 不 喜 欢 看 到 搏 击 赌 博 。
			};
		};

		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;

		// ------ AIVAR resetten! ------
		self.aivar[AIV_LastFightComment] = TRUE;
	}
	else // anderer Kampfgrund gegen den Spieler ODER kein sauberer Kampf
	{
		if (self.aivar[AIV_ArenaFight] == AF_AFTER_PLUS_DAMAGE) // NACH Kampf und VOR Bewertung nochmal angegriffen.
		{
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_10"); //比 赛 结 束 了 ， 你 这 个 废 物 ！
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_11"); //我 不 喜 欢 人 们 不 遵 守 规 则 。
			AI_Output(self, other, "DIA_Alrik_AfterFight_09_12"); //离 开 这 里 ！
		}
		else // einfach so angegriffen (unvorbereitet)
		{
			if (Alrik_Kaempfe == 0)
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_13"); //如 果 你 想 跟 我 打 ， 你 只 需 要 向 我 挑 战 。
			}
			else // > 0
			{
				AI_Output(self, other, "DIA_Alrik_AfterFight_09_14"); //如 果 你 还 想 再 打 ， 你 必 须 向 我 挑 战 ！
			};

			AI_Output(self, other, "DIA_Alrik_AfterFight_09_15"); //我 不 想 跟 你 这 样 的 下 等 人 扯 上 什 么 关 系 ！ 滚 吧 ！
		};

		// ------ In jedem Fall: Arena-Kampf abgeschlossen ------
		self.aivar[AIV_ArenaFight] = AF_NONE;

		AI_StopProcessInfos(self);
	};
};

// ************************************************************
// 			  			Du wohnst hier?
// ************************************************************
instance DIA_Alrik_DuWohnst(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_DuWohnst_Condition;
	information		= DIA_Alrik_DuWohnst_Info;
	description		= "你 ‘ 住 在 ’ 仓 库 后 面 ？";
};

func int DIA_Alrik_DuWohnst_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alrik_YouFight))
	{
		return TRUE;
	};
};

func void DIA_Alrik_DuWohnst_Info()
{
	AI_Output(other, self, "DIA_Alrik_DuWohnst_15_00"); //（ 感 到 惊 讶 的 ） 你 ‘ 住 ’ 在 仓 库 后 面 ？
	AI_Output(self, other, "DIA_Alrik_DuWohnst_09_01"); //只 是 暂 时 的 。 （ 咧 着 嘴 笑 ） 如 果 你 有 我 这 么 多 钱 ， 你 就 负 担 得 起 一 点 小 小 的 奢 侈 ！
	AI_Output(self, other, "DIA_Alrik_DuWohnst_09_02"); //我 原 来 是 军 队 里 面 的 练 兵 教 头 ， 但 是 ， 我 离 开 了 那 帮 家 伙 ， 靠 冒 险 来 寻 求 自 己 的 财 富 。
	AI_Output(self, other, "DIA_Alrik_DuWohnst_09_03"); //现 在 我 居 然 到 了 这 么 一 个 鬼 地 方 。 我 最 后 的 1 0 0 个 金 币 去 了 城 门 口 的 卫 兵 那 里 。
	AI_Output(self, other, "DIA_Alrik_DuWohnst_09_04"); //所 以 ， 我 一 直 盼 望 着 自 己 能 再 挣 到 钱 。 我 甚 至 不 得 不 卖 掉 了 我 的 剑 。

	Alrik_VomSchwertErzaehlt = TRUE;
};

// ************************************************************
// 			  		Wer hat dein Schwert?
// ************************************************************
instance DIA_Alrik_WerSchwert(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_WerSchwert_Condition;
	information		= DIA_Alrik_WerSchwert_Info;
	description		= "你 把 剑 卖 给 谁 ？";
};

func int DIA_Alrik_WerSchwert_Condition()
{
	if ((Alrik_VomSchwertErzaehlt == TRUE)
	&& (MIS_Alrik_Sword != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Alrik_WerSchwert_Info()
{
	AI_Output(other, self, "DIA_Alrik_WerSchwert_15_00"); //你 把 剑 卖 给 谁 ？
	AI_Output(self, other, "DIA_Alrik_WerSchwert_09_01"); //我 在 市 场 里 用 它 跟 一 个 商 人 换 了 点 东 西 。
	AI_Output(self, other, "DIA_Alrik_WerSchwert_09_02"); //那 个 家 伙 叫 佐 拉 。 他 给 我 的 火 把 和 那 点 肉 早 就 没 了 。
	AI_Output(other, self, "DIA_Alrik_WerSchwert_15_03"); //看 来 ， 他 不 会 白 白 地 把 剑 还 给 我 … …
	AI_Output(self, other, "DIA_Alrik_WerSchwert_09_04"); //那 是 一 把 旧 剑 。 他 不 会 要 价 太 高 。 就 把 那 些 钱 当 作 搏 击 赛 的 一 个 额 外 赌 注 吧 。 （ 咧 着 嘴 笑 ）

	MIS_Alrik_Sword = LOG_RUNNING;
};

// **************************************
//			Ich hab dein Schwert
// **************************************
var int Alrik_EinmalSchwertBonus;
instance DIA_Alrik_HaveSword(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_HaveSword_Condition;
	information		= DIA_Alrik_HaveSword_Info;
	permanent		= TRUE;
	description		= "我 已 经 拿 到 了 你 的 剑 ！";
};

func int DIA_Alrik_HaveSword_Condition()
{
	if (Npc_HasItems(other, ItMw_AlriksSword_Mis) > 0)
	{
		return TRUE;
	};
};

func void DIA_Alrik_HaveSword_Info()
{
	AI_Output(other, self, "DIA_Alrik_HaveSword_15_00"); //我 已 经 拿 到 了 你 的 剑 ！
	B_GiveInvItems(other, self, ItMW_AlriksSword_Mis, 1);

	if (MIS_Alrik_Sword != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Alrik_HaveSword_09_01"); //啊 ！ 那 会 比 拿 着 一 根 破 木 棍 打 起 来 要 好 得 多 ！

		MIS_Alrik_Sword = LOG_SUCCESS;
		B_GivePlayerXP(XP_AlriksSword);
	}
	else
	{
		AI_Output(self, other, "DIA_Alrik_HaveSword_09_02"); //很 好 ！ 我 很 好 奇 ， 不 知 道 你 是 不 是 还 敢 向 我 挑 战 ！
	};

	if (Alrik_EinmalSchwertBonus == FALSE)
	{
		B_AddFightSkill(self, NPC_TALENT_1H, 20);
		Alrik_EinmalSchwertBonus = TRUE;
	};

	AI_EquipBestMeleeWeapon(self);
};

// ************************************************************
// 			  			Krieg mit Orks
// ************************************************************
instance DIA_Alrik_Krieg(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_Krieg_Condition;
	information		= DIA_Alrik_Krieg_Info;
	description		= "关 于 抵 抗 兽 人 的 战 争 你 都 知 道 些 什 么 ？";
};

func int DIA_Alrik_Krieg_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Krieg_Info()
{
	AI_Output(other, self, "DIA_Alrik_Krieg_15_00"); //关 于 抵 抗 兽 人 的 战 争 你 都 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Alrik_Krieg_09_01"); //没 有 太 多 可 说 的 。 这 场 战 争 已 经 持 续 了 太 长 的 时 间 。
	AI_Output(self, other, "DIA_Alrik_Krieg_09_02"); //乡 下 的 人 都 快 饿 死 了 。 到 处 都 有 农 民 起 义 ， 他 们 被 国 王 残 忍 地 镇 压 了 。
	AI_Output(self, other, "DIA_Alrik_Krieg_09_03"); //但 是 ， 这 样 的 人 太 多 了 。 如 果 这 场 战 争 不 马 上 结 束 ， 这 个 王 国 就 要 土 崩 瓦 解 了 。
};

// ************************************************************
// 			  			Mich ausbilden?
// ************************************************************

// -------------------------------
var int Alrik_VorausErzaehlt;
// -------------------------------
instance DIA_Alrik_Ausbilden(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_Ausbilden_Condition;
	information		= DIA_Alrik_Ausbilden_Info;
	permanent		= TRUE;
	description		= "你 能 训 练 我 吗 ？";
};

func int DIA_Alrik_Ausbilden_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Alrik_DuWohnst))
	|| (hero.guild != GIL_NONE))
	&& (Alrik_Teach1H == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alrik_Ausbilden_Info()
{
	AI_Output(other, self, "DIA_Alrik_Ausbilden_15_00"); //你 能 训 练 我 吗 ？

	if ((Alrik_Kaempfe == 0)
	&& (hero.guild == GIL_NONE))
	{
		AI_Output(self, other, "DIA_Alrik_Ausbilden_09_01"); //如 果 你 真 的 想 知 道 怎 样 搏 击 ， 那 就 上 来 跟 我 对 打 。 （ 假 笑 ） 这 堂 课 不 另 收 费 。
		Alrik_VorausErzaehlt = TRUE;
	}
	else // >0
	{
		if (Alrik_VorausErzaehlt == TRUE)
		{
			AI_Output(self, other, "DIA_Alrik_Ausbilden_09_02"); //我 遵 守 诺 言 。 我 会 教 你 我 知 道 的 一 切 - 倘 若 你 有 必 要 的 经 验 。
		}
		else
		{
			AI_Output(self, other, "DIA_Alrik_Ausbilden_09_03"); //当 然 ，如 果 你 有 经 验 的 话。
		};

		Alrik_Teach1H = TRUE;
		Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
		B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_5);
	};
};

//**************************************
//			Ich will trainieren
//**************************************

// -------------------------------------
var int Alrik_Merke_1h;
// -------------------------------------
instance DIA_Alrik_Teach(C_INFO)
{
	npc				= VLK_438_Alrik;
	nr				= 1;
	condition		= DIA_Alrik_Teach_Condition;
	information		= DIA_Alrik_Teach_Info;
	permanent		= TRUE;
	description		= "训 练 我 成 为 剑 斗 士 ！";
};

func int DIA_Alrik_Teach_Condition()
{
	if (Alrik_Teach1H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Alrik_Teach_Info()
{
	AI_Output(other, self, "DIA_Alrik_Teach_15_00"); //训 练 我 成 为 剑 斗 士 ！

	Alrik_Merke_1h = other.HitChance[NPC_TALENT_1H];

	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach, DIALOG_BACK, DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self, other, "DIA_Alrik_Teach_Back_09_00"); //你 不 是 个 初 学 者 了 ！
	}
	else if (other.HitChance[NPC_TALENT_1H] > Alrik_Merke_1h)
	{
		AI_Output(self, other, "DIA_Alrik_Teach_Back_09_01"); //你 已 经 进 步 了 。 很 快 你 就 会 成 为 一 个 合 格 的 斗 士 ！
	};

	Info_ClearChoices(DIA_Alrik_Teach);
};

func void DIA_Alrik_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 60);

	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach, DIALOG_BACK, DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Alrik_Teach_1H_5);
};

func void DIA_Alrik_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 60);

	Info_ClearChoices(DIA_Alrik_Teach);
	Info_AddChoice(DIA_Alrik_Teach, DIALOG_BACK, DIA_Alrik_Teach_Back);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Alrik_Teach_1H_1);
	Info_AddChoice(DIA_Alrik_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5)), DIA_Alrik_Teach_1H_5);
};
