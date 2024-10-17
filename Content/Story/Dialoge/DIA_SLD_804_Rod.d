// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Rod_EXIT(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 999;
	condition		= DIA_Rod_EXIT_Condition;
	information		= DIA_Rod_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rod_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rod_EXIT_Info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hello
// ************************************************************
instance DIA_Rod_Hello(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 1;
	condition		= DIA_Rod_Hello_Condition;
	information		= DIA_Rod_Hello_Info;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Rod_Hello_Condition()
{
	return TRUE;
};

func void DIA_Rod_Hello_Info()
{
	AI_Output(other, self, "DIA_Rod_Hello_15_00"); //最 近 怎 么 样 ？
	if (other.guild != GIL_SLD)
	{
		AI_Output(self, other, "DIA_Rod_Hello_06_01"); //（ 蔑 视 的 ） 你 想 从 我 这 里 得 到 些 什 么 ， 无 能 的 家 伙 ？

		if (other.guild == GIL_KDF)
		{
			AI_Output(self, other, "DIA_Rod_Hello_06_02"); //在 修 道 院 里 ， 他 们 找 不 到 让 你 呆 的 地 方 吗 ？
		};
	};
};

// ************************************************************
// 			  					WannaLearn
// ************************************************************
var int Rod_SchwachGesagt;
instance DIA_Rod_WannaLearn(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 2;
	condition		= DIA_Rod_WannaLearn_Condition;
	information		= DIA_Rod_WannaLearn_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 控 制 双 手 武 器 ？";
};

func int DIA_Rod_WannaLearn_Condition()
{
	if (Rod_Teach2H == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaLearn_Info()
{
	AI_Output(other, self, "DIA_Rod_WannaLearn_15_00"); //你 能 教 我 如 何 控 制 双 手 武 器 ？

	if ((Rod_WetteGewonnen == TRUE)
	|| (self.aivar[AIV_DefeatedByPlayer] == TRUE))
	{
		AI_Output(self, other, "DIA_Rod_WannaLearn_06_01"); //我 不 是 一 个 很 差 的 战 士 ， 但 是 ， 那 不 意 味 着 我 是 一 个 好 老 师 。
		AI_Output(self, other, "DIA_Rod_WannaLearn_06_02"); //不 过 ， 我 想 我 还 是 能 教 你 双 手 格 斗 的 要 领 。

		if (Npc_HasItems(self, ItMw_2h_Rod) == 0)
		{
			AI_Output(self, other, "DIA_Rod_WannaLearn_06_03"); //是 这 样 ， 如 果 你 能 把 我 的 剑 还 给 我 的 话 。
		}
		else
		{
			Rod_Teach2H = TRUE;
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Rod_WannaLearn_06_04"); //听 着 ， 小 伙 子 。 挥 动 一 把 双 手 武 器 需 要 很 大 的 力 量 。
		AI_Output(self, other, "DIA_Rod_WannaLearn_06_05"); //你 为 什 么 不 溜 到 牧 场 上 去 跟 羊 群 玩 ‘ 绕 着 玫 瑰 转 ’ 的 游 戏 ？
		Rod_SchwachGesagt = TRUE;
	};
};

// ******************************************************
//							Teach
// ******************************************************
var int Rod_Merke_2h;
// ------------------------------------------------------
instance DIA_Rod_Teach(C_INFO)
{
	npc				= SLD_804_Rod;
	nr				= 3;
	condition		= DIA_Rod_Teach_Condition;
	information		= DIA_Rod_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 提 高 我 的 双 手 战 斗 技 巧 ！";
};

func int DIA_Rod_Teach_Condition()
{
	if (Rod_Teach2H == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Rod_Teach_Info()
{
	AI_Output(other, self, "DIA_Rod_Teach_15_00"); //我 想 要 提 高 我 的 双 手 战 斗 技 巧 ！

	Rod_Merke_2h = other.HitChance[NPC_TALENT_2H];

	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_Back()
{
	if (Rod_Merke_2h < other.HitChance[NPC_TALENT_2H])
	{
		AI_Output(self, other, "DIA_Rod_Teach_BACK_06_00"); //你 已 经 在 慢 慢 进 步 了 。
	};

	Info_ClearChoices(DIA_Rod_Teach);
};

func void DIA_Rod_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Rod_Teach_2H_5);
};

func void DIA_Rod_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 90);

	Info_ClearChoices(DIA_Rod_Teach);
	Info_AddChoice(DIA_Rod_Teach, DIALOG_BACK, DIA_Rod_Teach_Back);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Rod_Teach_2H_1);
	Info_AddChoice(DIA_Rod_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5)), DIA_Rod_Teach_2H_5);
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
instance DIA_Rod_WannaJoin(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 4;
	condition		= DIA_Rod_WannaJoin_Condition;
	information		= DIA_Rod_WannaJoin_Info;
	permanent		= TRUE;
	description		= "我 想 要 加 入 雇 佣 兵 ！";
};

func int DIA_Rod_WannaJoin_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rod_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Rod_WannaJoin_15_00"); //我 想 要 加 入 雇 佣 兵 ！

	if (Npc_HasItems(self, ItMw_2h_Rod) == 0)
	{
		AI_Output(self, other, "DIA_Rod_WannaJoin_06_01"); //那 先 把 我 的 剑 交 给 我 ， 怎 么 样 ？
	}
	else if ((self.aivar[AIV_DefeatedByPlayer] == TRUE)
	|| (Rod_WetteGewonnen == TRUE))
	{
		if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
		{
			AI_Output(self, other, "DIA_Rod_WannaJoin_06_02"); //好 吧 。 我 不 会 吝 惜 的 。
			AI_Output(self, other, "DIA_Rod_WannaJoin_06_03"); //你 能 打 ， 那 是 最 有 用 的 。
			AI_Output(self, other, "DIA_Rod_WannaJoin_06_04"); //这 里 大 部 分 的 人 对 朋 友 间 的 一 点 小 打 小 闹 并 不 介 意 。 你 会 习 惯 的 。
		}
		else // WetteGewonnen
		{
			AI_Output(self, other, "DIA_Rod_WannaJoin_06_05"); //哦 ， 好 啊 ， 你 的 剑 运 用 得 相 当 好 。 你 可 以 学 其 它 的 了 。
		};

		AI_Output(self, other, "DIA_Rod_WannaJoin_06_06"); //我 认 为 你 行 ， 你 可 以 加 入 。
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_2);
	}
	else
	{
		AI_Output(self, other, "DIA_Rod_WannaJoin_06_07"); //这 里 没 有 给 软 弱 无 能 的 人 的 容 身 之 地 ！
		Rod_SchwachGesagt = TRUE;
	};
};

// ************************************************************
// 			  					Duell
// ************************************************************
instance DIA_Rod_Duell(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 6;
	condition		= DIA_Rod_Duell_Condition;
	information		= DIA_Rod_Duell_Info;
	permanent		= TRUE;
	description		= "看 来 我 必 须 要 教 你 一 些 礼 节 ， 是 吗 ？";
};

func int DIA_Rod_Duell_Condition()
{
	if (self.aivar[AIV_DefeatedByPlayer] == FALSE)
	{
		if ((Rod_WetteGewonnen == FALSE)
		&& (Rod_SchwachGesagt == TRUE))
		{
			return TRUE;
		};

		if (Mis_Jarvis_SldKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void DIA_Rod_Duell_Info()
{
	AI_Output(other, self, "DIA_Rod_Duell_15_00"); //看 来 我 必 须 要 教 你 一 些 礼 节 ， 是 吗 ？
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_NONE)
	{
		AI_Output(self, other, "DIA_Rod_Duell_06_01"); //继 续 ， 试 一 试 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Rod_Duell_06_02"); //你 就 是 学 不 会 了 ！
	};

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				StarkGenug
// ************************************************************
instance DIA_Rod_StarkGenug(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 5;
	condition		= DIA_Rod_StarkGenug_Condition;
	information		= DIA_Rod_StarkGenug_Info;
	description		= "我 非 常 强 壮 ！";
};

func int DIA_Rod_StarkGenug_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Rod_SchwachGesagt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rod_StarkGenug_Info()
{
	AI_Output(other, self, "DIA_Rod_StarkGenug_15_00"); //我 非 常 强 壮 ！
	AI_Output(self, other, "DIA_Rod_StarkGenug_06_01"); //笑 话 ！ 你 甚 至 连 一 把 像 我 这 样 的 好 剑 都 拿 不 出 来 ！

	Log_CreateTopic(Topic_RodWette, LOG_MISSION);
	Log_SetTopicStatus(Topic_RodWette, LOG_RUNNING);
	B_LogEntry(Topic_RodWette, Topic_RodWette_1);
};

// ************************************************************
// 			  				BINStarkGenug
// ************************************************************
instance DIA_Rod_BINStarkGenug(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 5;
	condition		= DIA_Rod_BINStarkGenug_Condition;
	information		= DIA_Rod_BINStarkGenug_Info;
	description		= "我 说 了 我 非 常 强 壮 ！";
};

func int DIA_Rod_BINStarkGenug_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Rod_StarkGenug)))
	{
		return TRUE;
	};
};

func void DIA_Rod_BINStarkGenug_Info()
{
	AI_Output(other, self, "DIA_Rod_BINStarkGenug_15_00"); //我 说 了 我 非 常 强 壮 ！
	AI_Output(self, other, "DIA_Rod_BINStarkGenug_06_01"); //哦 哦 ， 你 要 害 死 我 了 。 想 要 打 一 个 小 小 的 赌 吗 ？
};

// ************************************************************
// 			  				Wette
// ************************************************************
var int Rod_WetteGewonnen;
var int Rod_WetteAngenommen;
// -------------------------
instance DIA_Rod_Wette(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 5;
	condition		= DIA_Rod_Wette_Condition;
	information		= DIA_Rod_Wette_Info;
	permanent		= TRUE;
	description		= "我 打 赌 我 能 对 付 你 的 剑 ！";
};

func int DIA_Rod_Wette_Condition()
{
	if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
	&& (Rod_WetteGewonnen == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Rod_BINStarkGenug))
	&& (Npc_HasItems(self, ItMw_2h_Rod) > 0)
	&& (Rod_WetteAngenommen == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rod_Wette_Info()
{
	AI_Output(other, self, "DIA_Rod_Wette_15_00"); //我 打 赌 我 能 对 付 你 的 剑 ！
	AI_Output(self, other, "DIA_Rod_Wette_06_01"); //真 的 吗 ？ 嗯 … … （ 沉 思 ） 我 该 问 你 要 多 少 钱 呢 ？
	AI_Output(self, other, "DIA_Rod_Wette_06_02"); //好 吧 ， 你 看 起 来 象 个 穷 小 子 。 那 就 3 0 个 金 币 吧 ！ 你 会 有 那 么 多 钱 吗 ？

	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette, "不 。", DIA_Rod_Wette_No);
	Info_AddChoice(DIA_Rod_Wette, "当 然 。", DIA_Rod_Wette_Yes);

	B_LogEntry(Topic_RodWette, Topic_RodWette_2);
};

func void DIA_Rod_Wette_No()
{
	AI_Output(other, self, "DIA_Rod_Wette_No_15_00"); //不 。
	AI_Output(self, other, "DIA_Rod_Wette_No_06_01"); //哦 ， 那 就 走 开 点 。

	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_Yes()
{
	AI_Output(other, self, "DIA_Rod_Wette_Yes_15_00"); //当 然 。
	AI_Output(self, other, "DIA_Rod_Wette_Yes_06_01"); //那 我 再 看 看 … …

	if (B_GiveInvItems(other, self, itmi_gold, 30))
	{
		Rod_WetteAngenommen = TRUE;

		AI_Output(other, self, "DIA_Rod_Wette_Yes_15_02"); //那 里 ！
		AI_Output(self, other, "DIA_Rod_Wette_Yes_06_03"); //（ 得 意 的 ） 好 的 ， 我 们 来 看 看 你 有 多 结 实 … …

		B_GiveInvItems(self, other, ItMw_2h_Rod, 1);

		if (other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);

			AI_Output(other, self, "DIA_Rod_Wette_Yes_15_04"); //这 么 结 实 ？
			AI_Output(self, other, "DIA_Rod_Wette_Yes_06_05"); //（ 不 知 所 措 的 ） 看 来 你 赢 了 我 。
			AI_Output(self, other, "DIA_Rod_Wette_Yes_06_06"); //我 从 来 没 想 到 。 真 看 不 出 来 你 有 那 么 大 的 力 气 。
			AI_Output(self, other, "DIA_Rod_Wette_Yes_06_07"); //好 吧 - 我 想 我 刚 失 去 了 3 0 个 金 币 。 给 你 吧 。
			B_GiveInvItems(self, other, itmi_gold, 60);
			Rod_WetteGewonnen = TRUE;
			B_GivePlayerXP(XP_Rod);
		}
		else
		{
			AI_Output(other, self, "DIA_Rod_Wette_Yes_15_08"); //我 挥 不 动 这 把 武 器 。
			AI_Output(self, other, "DIA_Rod_Wette_Yes_06_09"); //（ 大 笑 ） 我 就 这 么 说 ！
		};

		AI_Output(self, other, "DIA_Rod_Wette_Yes_06_10"); //那 现 在 把 武 器 还 给 我 吧 。

		Info_ClearChoices(DIA_Rod_Wette);

		// Npc_RemoveInvItems(other,ItMw_2h_Rod,((Npc_HasItems(other,ItMw_2h_Rod))-1)); // Hoshi: Wilder HAck bitte stehen lassen!
		// Mike: AAAARGH!!!! genau DAS war der Fehler!!!

		Info_AddChoice(DIA_Rod_Wette, "我 认 为 不 … …", DIA_Rod_Wette_KeepIt);
		Info_AddChoice(DIA_Rod_Wette, "给 你 。", DIA_Rod_Wette_GiveBack);
	}
	else
	{
		AI_Output(other, self, "DIA_Rod_Wette_Yes_15_11"); //现 在 ， 我 把 它 放 在 哪 里 了 … …
		AI_Output(self, other, "DIA_Rod_Wette_Yes_06_12"); //那 是 合 情 合 理 的 。 有 钱 做 赌 注 了 再 回 来 。

		Info_ClearChoices(DIA_Rod_Wette);
	};
};

func void DIA_Rod_Wette_GiveBack()
{
	AI_RemoveWeapon(other);
	AI_Output(other, self, "DIA_Rod_Wette_GiveBack_15_00"); //给 你 。
	Info_ClearChoices(DIA_Rod_Wette);
	Info_AddChoice(DIA_Rod_Wette, "（ 把 武 器 给 他 ）", DIA_Rod_Wette_GiveBack2);
};

func void DIA_Rod_Wette_GiveBack2()
{
	B_GiveInvItems(other, self, ItMw_2h_Rod, 1);
	if (Rod_WetteGewonnen == FALSE)
	{
		AI_Output(self, other, "DIA_Rod_Wette_GiveBack_06_01"); //反 正 你 只 是 个 软 弱 无 能 的 家 伙 ！
	};

	Info_ClearChoices(DIA_Rod_Wette);
};

func void DIA_Rod_Wette_KeepIt()
{
	AI_Output(other, self, "DIA_Rod_Wette_KeepIt_15_00"); //我 认 为 不 … …
	AI_Output(self, other, "DIA_Rod_Wette_KeepIt_06_01"); //（ 威 胁 ） 那 是 什 么 ？
	AI_Output(other, self, "DIA_Rod_Wette_KeepIt_15_02"); //我 觉 得 我 会 把 它 再 保 留 一 段 时 间 。
	AI_Output(self, other, "DIA_Rod_Wette_KeepIt_06_03"); //等 着 瞧 吧 ， 你 这 个 混 蛋 ！

	Info_ClearChoices(DIA_Rod_Wette);
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				Schwert zurück
// ************************************************************
var int Rod_SchwertXPGiven;
instance DIA_Rod_GiveItBack(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 7;
	condition		= DIA_Rod_GiveItBack_Condition;
	information		= DIA_Rod_GiveItBack_Info;
	permanent		= TRUE;
	description		= "这 是 你 的 剑 的 赌 注 ！";
};

func int DIA_Rod_GiveItBack_Condition()
{
	if (Npc_HasItems(other, ItMw_2h_Rod) > 0)
	{
		return TRUE;
	};
};

func void DIA_Rod_GiveItBack_Info()
{
	B_GiveInvItems(other, self, ItMw_2h_Rod, 1);

	AI_Output(other, self, "DIA_Rod_GiveItBack_15_00"); //这 是 你 的 剑 的 赌 注 ！
	AI_Output(self, other, "DIA_Rod_GiveItBack_06_01"); //时 机 正 好 ！

	if (Rod_SchwertXPGiven == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		Rod_SchwertXPGiven = TRUE;
	};
};

// ************************************************************
// 			  					PERM
// ************************************************************
instance DIA_Rod_PERM(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 1;
	condition		= DIA_Rod_PERM_Condition;
	information		= DIA_Rod_PERM_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Rod_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rod_Hello))
	{
		return TRUE;
	};
};

func void DIA_Rod_PERM_Info()
{
	AI_Output(other, self, "DIA_Rod_PERM_15_00"); //事 情 怎 么 样 了 ？

	if (Kapitel <= 2)
	{
		if (other.guild == GIL_NONE)
		{
			if ((self.aivar[AIV_DefeatedByPlayer] == FALSE)
			&& (Rod_WetteGewonnen == FALSE))
			{
				AI_Output(self, other, "DIA_Rod_PERM_06_01"); //这 不 关 你 的 事 ， 胆 小 鬼 。
				Rod_SchwachGesagt = TRUE;
			}
			else
			{
				AI_Output(self, other, "DIA_Rod_PERM_06_02"); //我 很 想 知 道 他 们 会 不 会 让 你 加 入 。
			};
		}
		else if ((other.guild == GIL_SLD)
		|| (other.guild == GIL_DJG))
		{
			AI_Output(self, other, "DIA_Rod_PERM_06_03"); //你 现 在 是 我 们 的 人 了 ， 小 子 。 我 们 会 设 法 安 排 好 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_Rod_PERM_06_04"); //你 不 属 于 这 里 ， 你 最 好 去 别 的 地 方 游 荡 ！
		};
	};

	if (Kapitel >= 3)
	{
		AI_Output(self, other, "DIA_Rod_PERM_06_05"); //如 果 那 些 关 于 龙 的 传 说 都 是 真 的 ， 我 们 应 该 找 几 个 人 一 起 去 摆 平 那 些 野 兽 ！
	};

	// ### ab Kap 4 in OW ###
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_RodSLD_PICKPOCKET(C_INFO)
{
	npc				= Sld_804_Rod;
	nr				= 900;
	condition		= DIA_RodSLD_PICKPOCKET_Condition;
	information		= DIA_RodSLD_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_RodSLD_PICKPOCKET_Condition()
{
	C_Beklauen(15, 35);
};

func void DIA_RodSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET, DIALOG_BACK, DIA_RodSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_RodSLD_PICKPOCKET, DIALOG_PICKPOCKET, DIA_RodSLD_PICKPOCKET_DoIt);
};

func void DIA_RodSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

func void DIA_RodSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_RodSLD_PICKPOCKET);
};

// NUR Bis Kapitel 3!

/**/
