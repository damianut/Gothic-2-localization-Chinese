// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Dexter_EXIT(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 999;
	condition		= DIA_Dexter_EXIT_Condition;
	information		= DIA_Dexter_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dexter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Dexter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
instance DIA_Dexter_Hallo(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 1;
	condition		= DIA_Dexter_Hallo_Condition;
	information		= DIA_Dexter_Hallo_Info;
	important		= TRUE;
};

func int DIA_Dexter_Hallo_Condition()
{
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Hallo_Info()
{
	AI_Output(self, other, "DIA_Dexter_Hallo_09_00"); //看 看 谁 来 了 。 伟 大 的 解 放 者 。 嗯 ， 英 雄 - 你 在 这 里 做 什 么 ？
	AI_Output(other, self, "DIA_Dexter_Hallo_15_01"); //我 在 寻 找 一 些 答 案 。

	if (Ranger_SCKnowsDexter == TRUE) // ADDON
	{
		// ADDON>
		AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_00"); //我 永 远 也 想 不 到 你 会 自 愿 来 这 里 。
		AI_Output(other, self, "DIA_Addon_Dexter_Hallo_15_01"); //你 那 是 什 么 意 思 ？
		AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_02"); //我 是 说 我 一 直 在 找 你 。 你 没 有 见 过 我 的 通 缉 海 报 吗 ？
		AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_03"); //他 们 都 带 着 你 的 画 像 。 哦 是 的 … … 你 是 个 遭 到 全 面 通 缉 的 人 。 你 不 知 道 吗 ？
		// ADDON<
	}
	else // (Bdt13_Dexter_verraten == TRUE) // Gothic2
	{
		AI_Output(other, self, "DIA_Dexter_Hallo_15_02"); //某 人 在 四 处 分 发 画 着 我 头 像 的 纸 。 有 人 告 诉 我 那 个 家 伙 是 你 。
		AI_Output(self, other, "DIA_Dexter_Hallo_09_03"); //有 人 说 的 太 多 了 。

		AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_04"); //不 过 你 说 对 了 。 是 我 把 那 些 通 缉 海 报 发 出 去 的 。 而 且 ， 看 看 - 你 来 了 。

		/*// ADDON>
		AI_Output(self, other, "DIA_Dexter_Hallo_09_04"); //Aber es stimmt. Ich habe meinen Jungs die Steckbriefe gegeben. Ich hatte keine andere Wahl.
		AI_Output(self, other, "DIA_Dexter_Hallo_09_05"); //Als ich versuchte, aus dem Minental zu entfliehen, entdeckten mich die Soldaten und trieben mich in eine Falle.
		AI_Output(self, other, "DIA_Dexter_Hallo_09_06"); //Ich dachte schon, das wäre mein Ende, aber dann tauchte plötzlich aus der Dunkelheit diese ... Gestalt auf.
		AI_Output(self, other, "DIA_Dexter_Hallo_09_07"); //Er trug eine schwarze Robe mit Kapuze und eine Maske überm Gesicht. Und er sprach mit einer Stimme, die alles andere als menschlich war.
		AI_Output(self, other, "DIA_Dexter_Hallo_09_08"); //Aber er bot mir seine Hilfe an. Er brachte mich aus dem Tal und bot mir eintausend Goldstücke für deinen Kopf.
		AI_Output(self, other, "DIA_Dexter_Hallo_09_09"); //Hey, was sollte ich machen? Wenn ich abgelehnt hätte, dann hätte er mich getötet!
		*/// ADDON<
		// ADDON B_LogEntry (Topic_Bandits,"Dexter hat die Steckbriefe verteilt. Typen mit schwarzen Kapuzen haben ihn damit beauftragt.");

		MIS_Steckbriefe = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
	};

	AI_Output(other, self, "DIA_Addon_Dexter_Hallo_15_05"); //那 又 怎 么 样 ？ 你 想 从 我 这 里 得 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_06"); //我 ？ 什 么 都 不 想 要 。 但 是 我 的 老 板 决 意 要 看 到 你 的 脑 袋 。
	AI_Output(self, other, "DIA_Addon_Dexter_Hallo_09_07"); //所 以 他 要 我 找 到 你 ， 并 把 你 的 头 给 他 带 去 。
};

// ************************************************************
// 			Glaube
// ************************************************************
instance DIA_Dexter_Glaube(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 5;
	condition		= DIA_Dexter_Glaube_Condition;
	information		= DIA_Dexter_Glaube_Info;
	description		= "我 不 相 信 你 说 的 每 一 句 话 。";
};

func int DIA_Dexter_Glaube_Condition()
{
	if (Knows_Dexter == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dexter_Glaube_Info()
{
	AI_Output(other, self, "DIA_Dexter_Glaube_15_00"); //我 不 相 信 你 说 的 每 一 句 话 。
	AI_Output(self, other, "DIA_Dexter_Glaube_09_01"); //嘿 ， 这 是 真 的 。 我 在 我 兄 弟 的 坟 前 发 誓 。
};

///////////////////////////////////////////////////////////////////////
//	Info Patrick
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Patrick(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 2;
	condition		= DIA_Addon_Dexter_Patrick_Condition;
	information		= DIA_Addon_Dexter_Patrick_Info;
	description		= "据 说 这 里 曾 经 见 过 一 个 叫 帕 特 里 克 的 雇 佣 兵 。";
};

func int DIA_Addon_Dexter_Patrick_Condition()
{
	if ((MIS_Addon_Cord_Look4Patrick == LOG_RUNNING)
	&& (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Patrick_Info()
{
	AI_Output(other, self, "DIA_Addon_Dexter_Patrick_15_00"); //据 说 这 里 曾 经 见 过 一 个 叫 帕 特 里 克 的 雇 佣 兵 。
	AI_Output(self, other, "DIA_Addon_Dexter_Patrick_09_01"); //帕 特 里 克 ， 呃 ？ 不 知 道 你 在 说 什 么 。
	AI_Output(self, other, "DIA_Addon_Dexter_Patrick_09_02"); //我 倒 记 起 曾 经 有 个 喜 欢 高 谈 阔 论 的 雇 佣 兵 常 常 和 那 边 小 伙 子 们 混 在 一 起 。
	AI_Output(self, other, "DIA_Addon_Dexter_Patrick_09_03"); //（ 明 显 在 撒 谎 ） 但 是 我 已 经 很 久 没 见 到 他 了 。
	AI_Output(self, other, "DIA_Addon_Dexter_Patrick_09_04"); //（ 假 装 天 真 ） 也 许 他 最 后 完 蛋 了 。 我 不 清 楚 。

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_5);

	Dexter_KnowsPatrick = TRUE;
	B_GivePlayerXP(XP_Addon_Dexter_KnowsPatrick);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Greg(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 5;
	condition		= DIA_Addon_Dexter_Greg_Condition;
	information		= DIA_Addon_Dexter_Greg_Info;
	description		= "这 个 家 伙 戴 着 眼 罩 。 他 说 正 在 找 你 ！";
};

func int DIA_Addon_Dexter_Greg_Condition()
{
	if ((SC_KnowsGregsSearchsDexter == TRUE)
	&& (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Greg_Info()
{
	AI_Output(other, self, "DIA_Addon_Dexter_Greg_15_00"); //这 个 家 伙 戴 着 眼 罩 。 他 说 正 在 找 你 ！
	AI_Output(self, other, "DIA_Addon_Dexter_Greg_09_01"); //所 有 人 都 在 找 我 。 我 不 在 乎 。
	AI_Output(self, other, "DIA_Addon_Dexter_Greg_09_02"); //如 果 那 个 家 伙 有 事 找 我 ， 让 他 来 这 里 。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info missingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_missingPeople(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 2;
	condition		= DIA_Addon_Dexter_missingPeople_Condition;
	information		= DIA_Addon_Dexter_missingPeople_Info;
	description		= "他 们 说 你 在 克 霍 里 尼 斯 里 绑 架 市 民 。";
};

func int DIA_Addon_Dexter_missingPeople_Condition()
{
	if ((SC_KnowsDexterAsKidnapper == TRUE)
	&& (Knows_Dexter == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_missingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Dexter_missingPeople_15_00"); //他 们 说 你 在 克 霍 里 尼 斯 里 绑 架 市 民 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_09_01"); //那 么 你 也 发 现 了 。 干 得 好 ， 老 兄 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_09_02"); //我 现 在 正 在 考 虑 掩 盖 我 的 踪 迹 。

	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, "谁 给 你 下 达 的 这 个 命 令 ？", DIA_Addon_Dexter_missingPeople_wer);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, "那 些 人 消 失 到 哪 里 了 ？ 也 许 在 矿 井 下 面 ， 这 里 的 某 个 地 方 ？", DIA_Addon_Dexter_missingPeople_Wo);
};

func void DIA_Addon_Dexter_missingPeople_Wo()
{
	AI_Output(other, self, "DIA_Addon_Dexter_missingPeople_Wo_15_00"); //那 些 人 消 失 到 哪 里 了 ？ 也 许 在 矿 井 下 面 ， 这 里 的 某 个 地 方 ？
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_01"); //（ 大 笑 ） 他 们 现 在 东 北 边 很 远 的 地 方 ， 你 到 不 了 他 们 那 里 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Wo_09_02"); //我 可 以 准 确 地 告 诉 你 位 置 ， 不 过 我 不 明 白 我 为 什 么 会 那 么 做 。
};

func void DIA_Addon_Dexter_missingPeople_wer()
{
	AI_Output(other, self, "DIA_Addon_Dexter_missingPeople_wer_15_00"); //谁 给 你 下 达 的 这 个 命 令 ？
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_01"); //我 的 老 板 。 他 是 一 个 危 险 的 人 。 你 认 识 他 ： 瑞 雯 ， 以 前 在 矿 藏 山 谷 旧 营 地 的 一 个 矿 石 大 亨 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_wer_09_02"); //他 需 要 那 些 人 来 实 现 他 的 计 划 。 你 只 能 知 道 那 些 。

	Info_AddChoice(DIA_Addon_Dexter_missingPeople, "瑞 雯 ， 危 险 ？ 哦 ， 好 … …", DIA_Addon_Dexter_missingPeople_Raven);
	Info_AddChoice(DIA_Addon_Dexter_missingPeople, "这 里 有 个 矿 石 大 亨 ， 在 克 霍 里 尼 斯 ？", DIA_Addon_Dexter_missingPeople_RavenTot);
};

func void DIA_Addon_Dexter_missingPeople_Raven()
{
	AI_Output(other, self, "DIA_Addon_Dexter_missingPeople_Raven_15_00"); //瑞 雯 ， 危 险 ？ 哦 ， 好 … …
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_01"); //（ 恼 怒 的 ） 你 知 道 什 么 ？ 你 不 会 比 我 更 了 解 他 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_02"); //（ 不 确 定 ） 从 那 时 起 ， 他 就 是 一 头 卑 鄙 的 畜 牲 ， 但 是 现 在 这 些 日 子 … …
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_03"); //自 从 屏 障 崩 溃 之 后 ， 他 变 了 。 在 他 的 脸 上 有 一 层 阴 影 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_04"); //（ 害 怕 ） 如 果 你 看 着 他 的 眼 睛 太 久 的 话 ， 他 凶 狠 的 目 光 会 象 猛 禽 的 爪 子 一 样 把 你 刺 穿 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_05"); //我 能 给 你 的 唯 一 建 议 就 是 ： 尽 快 离 开 克 霍 里 尼 斯 ， 越 早 越 好 。
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_Raven_09_06"); //（ 阴 沉 的 ） 这 里 没 有 你 的 东 西 。 除 了 死 亡 。

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_9);

	Info_ClearChoices(DIA_Addon_Dexter_missingPeople);
};

func void DIA_Addon_Dexter_missingPeople_RavenTot()
{
	AI_Output(other, self, "DIA_Addon_Dexter_missingPeople_RavenTot_15_00"); //这 里 有 个 矿 石 大 亨 ， 在 克 霍 里 尼 斯 ？
	AI_Output(self, other, "DIA_Addon_Dexter_missingPeople_RavenTot_09_01"); //他 不 再 是 矿 石 大 亨 。 他 有 自 己 的 计 划 ， 克 霍 里 尼 斯 很 快 就 能 尝 到 滋 味 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Boss
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Dexter_Boss(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 3;
	condition		= DIA_Addon_Dexter_Boss_Condition;
	information		= DIA_Addon_Dexter_Boss_Info;
	description		= "你 的 老 板 ？ 是 谁 ？";
};

func int DIA_Addon_Dexter_Boss_Condition()
{
	if ((Knows_Dexter == TRUE)
	&& (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Dexter_Boss_Info()
{
	AI_Output(other, self, "DIA_Addon_Dexter_Boss_15_00"); //你 的 老 板 ？ 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Dexter_Boss_09_01"); //（ 大 笑 ） 你 不 想 知 道 那 些 吗 ？ 是 的 ， 我 能 想 象 。
	AI_Output(self, other, "DIA_Addon_Dexter_Boss_09_02"); //（ 严 肃 的 ） 我 没 有 任 何 理 由 要 告 诉 你 。
};

// ************************************************************
// 			Vor
// ************************************************************
instance DIA_Dexter_Vor(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 5;
	condition		= DIA_Dexter_Vor_Condition;
	information		= DIA_Dexter_Vor_Info;
	description		= "那 么 现 在 你 要 做 什 么 ？ 杀 了 我 ？";
};

func int DIA_Dexter_Vor_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Dexter_missingPeople))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Vor_Info()
{
	AI_Output(other, self, "DIA_Dexter_Vor_15_00"); //那 么 现 在 你 要 做 什 么 ？ 杀 了 我 ？
	AI_Output(self, other, "DIA_Dexter_Vor_09_01"); //是 的 。 但 是 你 给 了 我 们 自 由 。 所 以 我 才 要 给 你 另 外 一 次 机 会 。 走 开 - 消 失 ， 藏 起 来 。 走 开 ， 不 要 再 碰 上 我 。
	AI_Output(other, self, "DIA_Addon_Dexter_Vor_15_00"); //我 要 知 道 你 把 那 些 人 们 带 到 了 哪 里 。
	AI_Output(self, other, "DIA_Addon_Dexter_Vor_09_01"); //（ 大 笑 ） 嗯 。 你 要 试 一 下 从 我 嘴 里 逼 出 来 才 行 … …
	AI_Output(self, other, "DIA_Addon_Dexter_Vor_09_02"); //（ 威 胁 的 ） 如 果 你 现 在 离 开 的 话 对 你 更 好 。
	AI_Output(self, other, "DIA_Dexter_Vor_09_02"); //如 果 我 再 在 附 近 发 现 你 ， 我 会 毫 不 犹 豫 地 杀 死 你 。
	Dexter_NoMoreSmallTalk = TRUE;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			Kill
// ************************************************************
instance DIA_Dexter_Kill(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 2;
	condition		= DIA_Dexter_Kill_Condition;
	information		= DIA_Dexter_Kill_Info;
	important		= TRUE;
};

func int DIA_Dexter_Kill_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& ((Dexter_NoMoreSmallTalk == TRUE)
	|| (Knows_Dexter == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kill_Info()
{
	if (Knows_Dexter == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Dexter_Add_09_02"); //（ 开 始 攻 击 ） 你 自 找 的 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Dexter_Kill_09_01"); //哦 ， 老 兄 ， 你 最 好 不 要 再 在 这 里 露 面 了 。 你 是 一 个 错 误 的 人 ， 出 现 在 一 个 错 误 的 地 方 的 。
	};

	MIS_Steckbriefe = LOG_OBSOLETE;
	B_CheckLog();
	B_Greg_ComesToDexter();
	Info_ClearChoices(DIA_Dexter_Kill);
	Info_AddChoice(DIA_Dexter_Kill, DIALOG_ENDE, DIA_Dexter_Kill_ENDE);
};

func void DIA_Dexter_Kill_ENDE()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(Greg_NW);

	if (Hlp_IsItem(itm, ITAR_PIR_H_Addon) == FALSE)
	{
		AI_EquipArmor(Greg_NW, ITAR_PIR_H_Addon);
	};
};

// ************************************************************
// 			Mein Kopf?
// ************************************************************
instance DIA_Dexter_Kopf(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 5;
	condition		= DIA_Dexter_Kopf_Condition;
	information		= DIA_Dexter_Kopf_Info;
	description		= "你 想 要 我 的 头 ？ 那 来 拿 吧 ！";
};

func int DIA_Dexter_Kopf_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dexter_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Kopf_Info()
{
	AI_Output(other, self, "DIA_Addon_Dexter_Add_15_00"); //你 想 要 我 的 头 ？ 那 来 拿 吧 ！
	AI_Output(self, other, "DIA_Addon_Dexter_Add_09_01"); //（ 开 始 攻 击 ） 如 果 那 是 你 想 要 的 话 … …

	DIA_Dexter_Kill_ENDE();
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Dexter_PICKPOCKET(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 900;
	condition		= DIA_Dexter_PICKPOCKET_Condition;
	information		= DIA_Dexter_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Dexter_PICKPOCKET_Condition()
{
	C_Beklauen(96, 370);
};

func void DIA_Dexter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
	Info_AddChoice(DIA_Dexter_PICKPOCKET, DIALOG_BACK, DIA_Dexter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Dexter_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Dexter_PICKPOCKET_DoIt);
};

func void DIA_Dexter_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

func void DIA_Dexter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Dexter_PICKPOCKET);
};

/*
// ************************************************************
// 			Wo
// ************************************************************
instance DIA_Dexter_Wo(C_INFO)
{
	npc				= BDT_1060_Dexter;
	nr				= 3;
	condition		= DIA_Dexter_Wo_Condition;
	information		= DIA_Dexter_Wo_Info;
	description		= "Wo finde ich diesen Mann?";
};

func int DIA_Dexter_Wo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Dexter_Glaube) == FALSE)
	&& (Knows_Dexter == TRUE)
	&& (Bdt13_Dexter_verraten == TRUE)
	&& (Ranger_SCKnowsDexter == FALSE)
	&& (SC_KnowsDexterAsKidnapper == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Dexter_Wo_Info()
{
	AI_Output(other, self, "DIA_Dexter_Wo_15_00"); //Wo finde ich diesen Mann?

	if (Kapitel < 3)
	{
		AI_Output(self, other, "DIA_Dexter_Wo_09_01"); //Ich glaube, der sitzt irgendwo im Minental.
	}
	else
	{
		AI_Output(self, other, "DIA_Dexter_Wo_09_02"); //Der Typ ist hier! Und nicht alleine. Da ist ein ganzer Haufen dieser Kerle überall unterwegs! Und die suchen dich.
	};
};

*/
