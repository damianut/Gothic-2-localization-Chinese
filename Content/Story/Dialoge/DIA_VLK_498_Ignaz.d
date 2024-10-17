///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_EXIT(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 999;
	condition		= DIA_Ignaz_EXIT_Condition;
	information		= DIA_Ignaz_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ignaz_PICKPOCKET(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 900;
	condition		= DIA_Ignaz_PICKPOCKET_Condition;
	information		= DIA_Ignaz_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen(38, 50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET, DIALOG_BACK, DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Hallo(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Hallo_Condition;
	information		= DIA_Ignaz_Hallo_Info;
	important		= TRUE;
};

func int DIA_Ignaz_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_00"); //啊 - 你 来 得 正 好 。 我 需 要 一 个 助 手 来 做 一 个 魔 法 试 验 。
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_01"); //我 敢 肯 定 为 了 科 学 你 一 定 愿 意 帮 助 我 。
	AI_Output(other, self, "DIA_Ignaz_Hallo_15_02"); //放 松 ， 我 的 朋 友 。 首 先 告 诉 我 这 都 是 什 么 。
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_03"); //我 已 经 研 究 出 了 一 种 新 魔 法 。 一 个 ‘ 遗 忘 魔 法 ’ 。
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_04"); //我 已 经 成 功 制 造 了 一 些 东 西 。 但 是 ， 我 没 有 时 间 做 最 后 的 试 验 。
};

///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Traenke(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 3;
	condition		= DIA_Ignaz_Traenke_Condition;
	information		= DIA_Ignaz_Traenke_Info;
	description		= "如 果 我 帮 你 ， 有 什 么 好 处 ？";
};

func int DIA_Ignaz_Traenke_Condition()
{
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Traenke_15_00"); //如 果 我 帮 你 ， 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_Ignaz_Traenke_14_01"); //我 可 以 教 你 怎 样 酿 造 药 剂 。
	AI_Output(self, other, "DIA_Ignaz_Traenke_14_02"); //我 知 道 治 疗 、 魔 法 精 华 、 速 度 药 剂 的 配 方 。
	// AI_Output(self, other, "DIA_Ignaz_Traenke_14_03");// Außerdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
};

///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Experiment(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 4;
	condition		= DIA_Ignaz_Experiment_Condition;
	information		= DIA_Ignaz_Experiment_Info;
	description		= "再 告 诉 我 一 些 关 于 实 验 和 魔 法 的 事 。 ";
};

func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Experiment_15_00"); //再 告 诉 我 一 些 关 于 实 验 和 魔 法 的 事 。
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_01"); //这 个 魔 法 可 以 让 人 忘 记 各 种 的 事 情 。
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_02"); //迄 今 为 止 ， 我 发 现 它 只 会 在 人 们 生 气 时 有 效 - 例 如 ， 如 果 那 个 人 刚 刚 被 打 倒 或 者 洗 劫 。
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_03"); //即 使 他 亲 眼 目 睹 了 这 些 行 为 ， 但 他 仍 会 把 这 一 切 从 记 忆 中 抹 去 。
	AI_Output(other, self, "DIA_Ignaz_Experiment_15_04"); //那 我 必 须 去 打 倒 某 个 人 然 后 对 他 使 用 这 个 魔 法 ？
	// AI_Output(other, self, "DIA_Ignaz_Add_15_00"); // Das macht dann wohl nur Sinn, wenn derjenige nach der Schlägerei WIRKLICH verärgert ist.
	// AI_Output(other, self, "DIA_Ignaz_Add_15_01"); // (zu sich) Hier im Hafenviertel sind Schlägereien nichts Ungewöhnliches. Also müßte ich mir schon woanders ein Opfer suchen...
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_05"); //是 的 ， 我 想 你 发 现 了 关 键 。 但 是 要 让 别 人 生 气 ， 只 要 攻 击 他 就 够 了 - 你 不 需 要 把 他 击 倒 。
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_06"); //所 以 你 应 该 找 个 独 自 一 人 的 家 伙 - 如 果 附 近 有 其 它 人 的 话 ， 你 可 能 就 会 惹 上 安 德 烈 勋 爵 了 。
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_07"); //还 有 ， 它 对 某 个 正 在 攻 击 你 的 人 来 说 没 有 用 处 。 等 待 恰 当 的 时 机 。
};

///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_teilnehmen(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 5;
	condition		= DIA_Ignaz_teilnehmen_Condition;
	information		= DIA_Ignaz_teilnehmen_Info;
	description		= "好 吧 ， 我 会 试 验 一 下 那 个 魔 法 。";
};

func int DIA_Ignaz_teilnehmen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other, self, "DIA_Ignaz_teilnehmen_15_00"); //好 吧 ， 我 会 试 验 一 下 那 个 魔 法 。
	AI_Output(self, other, "DIA_Ignaz_teilnehmen_14_01"); //那 么 拿 上 这 个 魔 法 卷 轴 ， 去 找 一 个 合 适 的 小 白 鼠 。
	AI_Output(self, other, "DIA_Ignaz_teilnehmen_14_02"); //一 旦 你 完 成 ， 回 来 告 诉 我 它 的 效 果 如 何 。

	B_GiveInvItems(self, other, ITSC_Charm, 1);
	MIS_Ignaz_Charm = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Ignaz, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz, LOG_RUNNING);
	B_LogEntry(TOPIC_Ignaz, TOPIC_Ignaz_1);
	Log_AddEntry(TOPIC_Ignaz, TOPIC_Ignaz_2);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Running(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Running_Condition;
	information		= DIA_Ignaz_Running_Info;
	description		= "关 于 实 验 … …";
};

func int DIA_Ignaz_Running_Condition()
{
	if ((MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Running_15_00"); //关 于 实 验 … …
	AI_Output(self, other, "DIA_Ignaz_Running_14_01"); //那 么 你 成 功 了 吗 ？ 还 是 你 浪 费 了 那 个 魔 法 卷 轴 ？ 嗯 ？
	AI_Output(self, other, "DIA_Ignaz_Running_14_02"); //如 果 你 需 要 更 多 魔 法 卷 轴 ， 你 可 以 从 我 这 里 买 。
};

///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Danach(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 6;
	condition		= DIA_Ignaz_Danach_Condition;
	information		= DIA_Ignaz_Danach_Info;
	description		= "我 使 用 了 魔 法 卷 轴";
};

func int DIA_Ignaz_Danach_Condition()
{
	if ((Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Danach_15_00"); //我 使 用 了 魔 法 卷 轴 。
	AI_Output(self, other, "DIA_Ignaz_Danach_14_01"); //很 好 ， 很 好 。 你 成 功 了 吗 ？
	AI_Output(other, self, "DIA_Ignaz_Danach_15_02"); //是 的 ， 它 起 作 用 了 。
	AI_Output(self, other, "DIA_Ignaz_Danach_14_03"); //太 棒 了 。 魔 法 上 的 一 小 步 ， 但 是 对 我 来 说 是 一 大 步 ！
	AI_Output(self, other, "DIA_Ignaz_Danach_14_04"); //现 在 我 可 以 抽 出 时 间 教 你 炼 金 术 了 。
	AI_Output(self, other, "DIA_Ignaz_Danach_14_05"); //我 还 可 以 给 你 一 些 有 用 的 东 西 ， 如 果 你 想 要 的 话 。

	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_6);
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP(XP_MIS_Ignaz_Charm);

	// PATCH fallls alle Scrolls aufgekauft oder geplündert wurden
	CreateInvItems(self, ITSC_Charm, 3);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Trade(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 6;
	condition		= DIA_Ignaz_Trade_Condition;
	information		= DIA_Ignaz_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Ignaz_Trade_Condition()
{
	if ((MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo(other, DIA_Ignaz_Running)))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Ignaz_Trade_15_00"); //让 我 看 看 你 的 货 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Teach(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Teach_Condition;
	information		= DIA_Ignaz_Teach_Info;
	permanent		= TRUE;
	description		= "指 导 我 炼 金 术 的 技 巧 。";
};

// ----------------------------------------
var int DIA_Ignaz_Teach_permanent;
// ----------------------------------------

func int DIA_Ignaz_Teach_Condition()
{
	if ((DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other, self, "DIA_Ignaz_Teach_15_00"); //指 导 我 炼 金 术 的 技 巧 。

	if ((PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE))
	{
		Info_ClearChoices(DIA_Ignaz_Teach);
		Info_AddChoice(DIA_Ignaz_Teach, DIALOG_BACK, DIA_Ignaz_Teach_BACK);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_Speed_Potion, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output(self, other, "DIA_Ignaz_Teach_14_01"); //要 准 备 在 炼 金 术 士 工 作 台 上 酿 造 一 瓶 药 剂 的 话 ， 你 需 要 一 个 实 验 室 烧 瓶 。
			AI_Output(self, other, "DIA_Ignaz_Teach_14_02"); //而 且 每 一 种 药 剂 都 需 要 不 同 的 植 物 或 者 其 它 原 料 。
			// AI_Output(self, other,"DIA_Ignaz_Teach_14_03"); // Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benötigten Pflanzen dafür sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Ignaz_Teach_14_04"); //你 想 知 道 什 么 ？
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Ignaz_Teach_14_05"); //你 已 经 学 会 所 有 我 能 教 你 的 配 方 了 。
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};
