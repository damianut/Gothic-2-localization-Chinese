// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Alwin_EXIT(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 999;
	condition		= DIA_Alwin_EXIT_Condition;
	information		= DIA_Alwin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Alwin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alwin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Alwin_PICKPOCKET(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 900;
	condition		= DIA_Alwin_PICKPOCKET_Condition;
	information		= DIA_Alwin_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Alwin_PICKPOCKET_Condition()
{
	C_Beklauen(20, 10);
};

func void DIA_Alwin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
	Info_AddChoice(DIA_Alwin_PICKPOCKET, DIALOG_BACK, DIA_Alwin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alwin_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Alwin_PICKPOCKET_DoIt);
};

func void DIA_Alwin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

func void DIA_Alwin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alwin_PICKPOCKET);
};

//***************************************************
//		Schafe
//***************************************************
instance DIA_Alwin_Sheep(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 3;
	condition		= DIA_Alwin_Sheep_Condition;
	information		= DIA_Alwin_Sheep_Info;
	description		= "那 些 是 你 的 绵 羊 吗 ？";
};

func int DIA_Alwin_Sheep_Condition()
{
	return TRUE;
};

func void DIA_Alwin_Sheep_Info()
{
	AI_Output(other, self, "DIA_Alwin_Sheep_15_00"); //那 些 是 你 的 绵 羊 吗 ？
	AI_Output(self, other, "DIA_Alwin_Sheep_12_01"); //唯 一 属 于 我 的 一 个 人 是 一 个 叫 露 西 的 人 。 （ 大 笑 ） 那 就 是 我 的 老 婆 - 露 西 。
	AI_Output(self, other, "DIA_Alwin_Sheep_12_02"); //那 些 绵 羊 属 于 民 兵 。 他 们 把 从 农 民 们 那 里 收 来 的 羊 都 带 到 我 这 里 。
};

//***************************************************
//		Der irre Fellan
//***************************************************
instance DIA_Alwin_Fellan(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 2;
	condition		= DIA_Alwin_Fellan_Condition;
	information		= DIA_Alwin_Fellan_Info;
	important		= TRUE;
};

func int DIA_Alwin_Fellan_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Fellan_Info()
{
	AI_Output(self, other, "DIA_Alwin_Fellan_12_00"); //小 子 ， 那 个 疯 子 的 锤 打 声 让 我 神 经 衰 弱 !
	AI_Output(other, self, "DIA_Alwin_Fellan_15_01"); //你 说 的 是 谁 ？
	AI_Output(self, other, "DIA_Alwin_Fellan_12_02"); //你 听 不 见 那 些 锤 打 声 吗 ？ 你 觉 得 那 是 谁 整 天 在 港 口 区 那 里 挥 动 锤 子 ？
	AI_Output(self, other, "DIA_Alwin_Fellan_12_03"); //我 的 意 思 是 那 个 疯 子 费 伦 。 他 每 天 都 拿 着 那 把 锤 子 去 敲 他 的 小 屋 。
};

//***************************************************
//		Der irre Fellan
//***************************************************
instance DIA_Alwin_FellanRunning(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 2;
	condition		= DIA_Alwin_FellanRunning_Condition;
	information		= DIA_Alwin_FellanRunning_Info;
	description		= "我 可 以 解 决 费 伦 … …";
};

func int DIA_Alwin_FellanRunning_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Npc_IsDead(Fellan) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanRunning_Info()
{
	AI_Output(other, self, "DIA_Alwin_FellanRunning_15_00"); //我 可 以 解 决 费 伦 … …
	AI_Output(self, other, "DIA_Alwin_FellanRunning_12_01"); //你 想 帮 我 ？ 那 对 你 有 什 么 好 处 ？
	AI_Output(other, self, "DIA_Alwin_FellanRunning_15_02"); //你 告 诉 我 。
	AI_Output(self, other, "DIA_Alwin_FellanRunning_12_03"); //哦 ， 就 是 这 么 回 事 ！ 好 吧 - 如 果 你 能 使 他 停 止 锤 打 ， 我 会 付 给 你 2 5 个 金 币 。
	AI_Output(self, other, "DIA_Alwin_FellanRunning_12_04"); //不 过 ， 我 现 在 就 告 诉 你 一 件 事 - 你 没 法 跟 那 个 家 伙 说 话 。 他 是 个 疯 子 。 唯 一 起 作 用 的 就 是 几 记 拳 头 ！

	MIS_AttackFellan = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Alwin, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alwin, LOG_RUNNING);
	B_LogEntry(TOPIC_Alwin, TOPIC_Alwin_1);

	Info_ClearChoices(DIA_Alwin_FellanRunning);
	Info_AddChoice(DIA_Alwin_FellanRunning, "我 会 看 看 我 能 做 些 什 么 … …", DIA_Alwin_FellanRunning_Ok);
	if ((hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	&& (hero.guild != GIL_KDF))
	{
		Info_AddChoice(DIA_Alwin_FellanRunning, "如 果 我 揍 了 他 ， 我 就 会 惹 上 那 些 民 兵 … …", DIA_Alwin_FellanRunning_Problems);
	};
};

func void DIA_Alwin_FellanRunning_Ok()
{
	AI_Output(other, self, "DIA_Alwin_FellanRunning_Ok_15_00"); //我 会 看 看 我 能 做 些 什 么 … …
	AI_Output(self, other, "DIA_Alwin_FellanRunning_Ok_12_01"); //你 可 以 考 虑 一 下 。 记 住 ， 我 会 付 给 你 2 5 个 金 币 。

	Info_ClearChoices(DIA_Alwin_FellanRunning);
};

func void DIA_Alwin_FellanRunning_Problems()
{
	AI_Output(other, self, "DIA_Alwin_FellanRunning_Problems_15_00"); //如 果 我 揍 了 他 ， 我 就 会 惹 上 那 些 民 兵 … …
	AI_Output(self, other, "DIA_Alwin_Add_12_00"); //在 码 头 这 里 ， 没 有 人 会 注 意 一 些 打 架 的 事 情 的 。
	AI_Output(self, other, "DIA_Alwin_Add_12_01"); //但 是 ， 如 果 你 在 这 周 围 偷 东 西 ， 或 者 乱 动 那 些 绵 羊 ， 你 会 遇 到 麻 烦 的 。

	// AI_Output(self,other,"DIA_Alwin_FellanRunning_Problems_12_01"); // Der irre Fellan wird nicht zur Miliz rennen und dich anzeigen. Du könntest höchstens ein Problem bekommen, wenn seine Nachbarn was davon mitbekommen.
	// AI_Output(self,other,"DIA_Alwin_FellanRunning_Problems_12_02"); // Schlägereien sind hier nicht gerne gesehen, und je mehr Zeugen es gibt, desto schlimmer wird die Sache.
	// AI_Output(self,other,"DIA_Alwin_FellanRunning_Problems_12_03"); // Aber wenn du ihn dazu bringst, dass ER dich angreift, werden alle Leute, die den Kampf mitkriegen, auf deiner Seite sein.
};

//***************************************************
//		Fellan auf's Maul gehauen
//***************************************************
instance DIA_Alwin_FellanSuccess(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 4;
	condition		= DIA_Alwin_FellanSuccess_Condition;
	information		= DIA_Alwin_FellanSuccess_Info;
	description		= "费 伦 不 会 再 敲 打 了 。";
};

func int DIA_Alwin_FellanSuccess_Condition()
{
	if ((MIS_AttackFellan == LOG_RUNNING)
	&& ((FellanGeschlagen == TRUE)
	|| Npc_IsDead(Fellan)))
	{
		return TRUE;
	};
};

func void DIA_Alwin_FellanSuccess_Info()
{
	AI_Output(other, self, "DIA_Alwin_FellanSuccess_15_00"); //费 伦 不 会 再 敲 打 了 。
	AI_Output(self, other, "DIA_Alwin_FellanSuccess_12_01"); //听 到 了 吗 ？ 没 有 锤 打 声 了 。 终 于 。 我 以 为 那 个 家 伙 永 远 都 不 会 停 止 。

	if (Npc_IsDead(Fellan) == FALSE)
	{
		AI_Output(self, other, "DIA_Alwin_FellanSuccess_12_02"); //你 帮 了 我 一 个 大 忙 。 你 知 道 吗 ， 我 会 给 你 3 0 个 金 币 。

		B_GiveInvItems(self, other, ItMi_Gold, 30);

		MIS_AttackFellan = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		MIS_AttackFellan = LOG_FAILED;
	};
};

//***************************************************
//		Perm Info
//***************************************************
instance DIA_Alwin_Endlos(C_INFO)
{
	npc				= Vlk_424_Alwin;
	nr				= 8;
	condition		= DIA_Alwin_Endlos_Condition;
	information		= DIA_Alwin_Endlos_Info;
	permanent		= TRUE;
	description		= "那 些 绵 羊 怎 么 样 了 ？";
};

func int DIA_Alwin_Endlos_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Alwin_Sheep))
	{
		return TRUE;
	};
};

func void DIA_Alwin_Endlos_Info()
{
	AI_Output(other, self, "DIA_Alwin_Endlos_15_00"); //那 些 绵 羊 怎 么 样 了 ？

	if ((MIS_AttackFellan != LOG_SUCCESS)
	&& (Npc_IsDead(Fellan) == FALSE))
	{
		AI_Output(self, other, "DIA_Alwin_Endlos_12_01"); //费 伦 的 锤 打 声 都 快 让 它 们 发 疯 了 。它 们 迟 早 都 会 爆 炸 。
	}
	else if (Kapitel <= 2)
	{
		AI_Output(self, other, "DIA_Alwin_Endlos_12_02"); //那 些 羊 吃 得 越 来 越 肥 。 就 像 我 的 老 婆 。 哈 哈 哈 （ 大 笑 ）
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Alwin_Endlos_12_03"); //我 也 许 不 得 不 宰 了 它 们 中 的 一 只 。 为 了 最 后 的 一 餐 ！
			AI_Output(other, self, "DIA_Alwin_Endlos_15_04"); //为 了 什 么 ？
			AI_Output(self, other, "DIA_Alwin_Endlos_12_05"); //为 了 那 个 谋 杀 圣 骑 士 的 雇 佣 兵 。 他 肯 定 会 被 处 死 的 。
			AI_Output(self, other, "DIA_Alwin_Endlos_12_06"); //我 只 需 要 决 定 哪 一 只 畜 生 将 要 上 屠 宰 板 上 去 。
		}
		else
		{
			AI_Output(self, other, "DIA_Alwin_Endlos_12_07"); //露 西 能 活 着 真 是 走 了 大 运 。
			AI_Output(other, self, "DIA_Alwin_Endlos_15_08"); //我 想 你 说 过 露 西 是 你 的 老 婆 。
			AI_Output(self, other, "DIA_Alwin_Endlos_12_09"); //正 确 ， 但 是 ， 我 也 管 那 些 羊 叫 做 露 西 。 我 说 的 是 要 成 为 贝 尼 特 最 后 的 一 餐 的 那 只 羊 。
			AI_Output(self, other, "DIA_Alwin_Endlos_12_10"); //不 过 那 一 切 都 解 决 了 。 露 西 会 感 到 高 兴 的 。
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_Alwin_Endlos_12_11"); //日 子 一 天 天 过 去 ， 看 着 这 些 羊 吃 草 真 是 非 常 无 聊 。
	}
	else // Kapitel 5
	{
		AI_Output(self, other, "DIA_Alwin_Endlos_12_12"); //我 要 跟 它 们 说 再 见 了 。 哈 根 勋 爵 下 了 命 令 ， 要 把 所 有 的 绵 羊 都 供 应 给 他 的 军 队 。
		AI_Output(self, other, "DIA_Alwin_Endlos_12_13"); //嗯 ， 那 么 ， 至 少 我 有 更 多 的 时 间 陪 老 婆 了 。
	};
};
