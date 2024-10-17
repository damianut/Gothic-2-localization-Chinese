//////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_EXIT(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 999;
	condition		= DIA_Cassia_EXIT_Condition;
	information		= DIA_Cassia_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Cassia_PICKME(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 900;
	condition		= DIA_Cassia_PICKME_Condition;
	information		= DIA_Cassia_PICKME_Info;
	permanent		= TRUE;
	description		= Pickpocket_100_Female;
};

func int DIA_Cassia_PICKME_Condition()
{
	C_Beklauen(100, 400);
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME, DIALOG_BACK, DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME, DIALOG_PICKPOCKET, DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cassia_PICKME);
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};

//////////////////////////////////////////////////////////////////////
//	Info Gilde
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Gilde(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 1;
	condition		= DIA_Cassia_Gilde_Condition;
	information		= DIA_Cassia_Gilde_Info;
	important		= TRUE;
};

func int DIA_Cassia_Gilde_Condition()
{
	if ((Cassia_Gildencheck == TRUE)
	&& (Join_Thiefs == TRUE)
	&& ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Cassia_Gilde_16_00"); //我 明 白 你 已 经 成 为 了 一 个 法 律 和 秩 序 的 战 士 。
		AI_Output(self, other, "DIA_Cassia_Gilde_16_01"); //你 为 英 诺 斯 效 劳 ， 这 没 有 什 么 关 系 。 你 是 我 们 的 人 。 而 且 ， 我 希 望 你 也 这 么 认 为 。
	};

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Cassia_Gilde_16_02"); //所 以 你 现 在 属 于 英 诺 斯 教 会 了。好 吧 ，但 你 仍 然 是 我 们 中 的 一 员，我 希 望 你 不 要 忘 记 这 一 点 。
	};

	AI_StopProcessInfos(self);
};

//////////////////////////////////////////////////////////////////////
//	Info Frist abgelaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Abgelaufen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Abgelaufen_Condition;
	information		= DIA_Cassia_Abgelaufen_Info;
	important		= TRUE;
};

func int DIA_Cassia_Abgelaufen_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Cassia_Frist == TRUE)
	&& (Cassia_Day < (B_GetDayPlus() - 2)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Abgelaufen_Info()
{
	AI_Output(self, other, "DIA_Cassia_Abgelaufen_16_00"); //你 的 最 后 期 限 已 经 过 了 。 你 不 该 回 来 的 。
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 0);
};

//////////////////////////////////////////////////////////////////////
//	Info News
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_News(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 1;
	condition		= DIA_Cassia_News_Condition;
	information		= DIA_Cassia_News_Info;
	important		= TRUE;
};

func int DIA_Cassia_News_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (self.aivar [AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self, other, "DIA_Cassia_News_16_00"); //我 看 到 你 收 到 了 我 们 的 礼 物 。 我 是 凯 希 亚 。
		AI_Output(other, self, "DIA_Cassia_News_15_01"); //好 的 ， 凯 希 亚 ， 那 么 ， 告 诉 我 为 什 么 我 会 在 这 里 。
		AI_Output(self, other, "DIA_Cassia_News_16_02"); //你 引 起 了 我 们 的 注 意 ， 因 为 你 赢 得 了 我 们 某 些 朋 友 的 信 任 。
		AI_Output(self, other, "DIA_Cassia_News_16_03"); //而 且 ， 我 们 希 望 给 你 提 供 一 个 机 会 。 你 可 以 加 入 我 们 。
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_News_16_04"); //看 看 是 谁 找 到 了 来 这 里 的 路 。 阿 提 拉 低 估 了 你 。 我 不 打 算 犯 同 样 的 错 误 。
		AI_Output(other, self, "DIA_Cassia_News_15_05"); //这 里 正 在 做 什 么 ？
		AI_Output(self, other, "DIA_Cassia_News_16_06"); //我 们 想 要 你 的 命 ， 因 为 你 揭 发 了 一 个 朋 友 。 这 就 是 为 什 么 我 们 派 出 了 阿 提 拉 。
		AI_Output(self, other, "DIA_Cassia_News_16_07"); //然 而 ， 你 出 现 在 这 里 ， 这 就 有 了 一 个 新 的 选 择 … …
		AI_Output(other, self, "DIA_Cassia_News_15_08"); //… … 你 想 要 给 我 什 么 提 议 ？
		AI_Output(self, other, "DIA_Cassia_News_16_09"); //你 可 以 加 入 我 们 。
	};

	if ((Npc_GetTrueGuild(other) == GIL_NONE)
	|| (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};

	DG_gefunden = TRUE;
};

//////////////////////////////////////////////////////////////////////
//	Info Erzähle mir mehr
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_mehr(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_mehr_Condition;
	information		= DIA_Cassia_mehr_Info;
	description		= "再 告 诉 我 一 些 关 于 你 的 组 织 的 事 。";
};

func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other, self, "DIA_Cassia_mehr_15_00"); //再 告 诉 我 一 些 关 于 你 的 组 织 的 事 。
	AI_Output(self, other, "DIA_Cassia_mehr_16_01"); //城 里 的 人 都 非 常 害 怕 我 们 。 但 是 ， 没 有 人 知 道 我 们 的 藏 身 之 处 。
	AI_Output(self, other, "DIA_Cassia_mehr_16_02"); //少 数 几 个 知 道 这 个 下 水 道 的 人 相 信 它 们 被 上 了 锁 ， 没 人 能 接 近 这 里 。
	AI_Output(self, other, "DIA_Cassia_mehr_16_03"); //而 且 ， 只 要 他 们 不 发 现 我 们 ， 我 们 就 能 安 心 地 工 作 。
};

//////////////////////////////////////////////////////////////////////
//	Vermisste Leute
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_MissingPeople(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_MissingPeople_Condition;
	information		= DIA_Cassia_MissingPeople_Info;
	description		= "关 于 失 踪 的 人 你 知 道 些 什 么 ？";
};

func int DIA_Cassia_MissingPeople_Condition()
{
	if ((SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Cassia_Add_15_00"); //关 于 失 踪 的 人 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cassia_Add_16_01"); //你 为 什 么 对 那 个 感 兴 趣 ？
	AI_Output(other, self, "DIA_Addon_Cassia_Add_15_02"); //我 想 要 知 道 他 们 发 生 了 什 么 事 。
	AI_Output(self, other, "DIA_Addon_Cassia_Add_16_03"); //当 你 从 下 水 道 浮 出 去 时 ， 沿 着 海 岸 向 右 边 游 一 会 儿 。
	AI_Output(self, other, "DIA_Addon_Cassia_Add_16_04"); //你 肯 定 能 在 那 里 找 到 答 案 … …
};

//////////////////////////////////////////////////////////////////////
//	Info Was habe ich davon?
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Vorteil(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 3;
	condition		= DIA_Cassia_Vorteil_Condition;
	information		= DIA_Cassia_Vorteil_Info;
	description		= "如 果 我 加 入 你 们 能 得 到 什 么 ？ ";
};

func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Vorteil_Info()
{
	AI_Output(other, self, "DIA_Cassia_Vorteil_15_00"); //如 果 我 加 入 你 们 能 得 到 什 么 ？
	AI_Output(self, other, "DIA_Cassia_Vorteil_16_01"); //你 可 以 从 我 们 这 里 学 到 特 殊 的 技 能 - 能 让 你 过 上 奢 华 生 活 的 技 能 。
	AI_Output(other, self, "DIA_Cassia_Vorteil_15_02"); //但 是 ， 我 不 用 躲 在 这 下 面 ， 是 吗 ？
	AI_Output(self, other, "DIA_Cassia_Vorteil_16_03"); //（ 安 静 地 笑 ） 不 。 你 只 需 要 遵 守 我 们 的 规 则 。 就 是 这 样 。
};

//////////////////////////////////////////////////////////////////////
//	Info Was kann ich bei euch lernen?
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Lernen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 4;
	condition		= DIA_Cassia_Lernen_Condition;
	information		= DIA_Cassia_Lernen_Info;
	description		= "我 能 跟 你 学 什 么 ？";
};

func int DIA_Cassia_Lernen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Lernen_Info()
{
	AI_Output(other, self, "DIA_Cassia_Lernen_15_00"); //我 能 跟 你 学 什 么 ？
	AI_Output(self, other, "DIA_Cassia_Lernen_16_01"); //杰 斯 伯 是 盗 窃 大 师 。 他 会 告 诉 你 怎 样 在 行 动 时 不 发 出 任 何 声 音 。
	AI_Output(self, other, "DIA_Cassia_Lernen_16_02"); //雷 米 瑞 兹 是 一 个 非 常 有 天 赋 的 窃 贼 。 没 有 锁 能 挡 住 他 的 开 锁 工 具 。
	AI_Output(self, other, "DIA_Cassia_Lernen_16_03"); //而 我 可 以 教 你 怎 样 成 为 一 名 扒 手 。
	AI_Output(self, other, "DIA_Cassia_Lernen_16_04"); //我 还 能 让 你 变 得 更 敏 捷 。 因 为 敏 捷 是 提 高 你 盗 窃 能 力 的 关 键 。

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_13);
	Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_14);
	Log_AddEntry(Topic_CityTeacher, Topic_CityTeacher_15);
};

//////////////////////////////////////////////////////////////////////
//	Info Regeln
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Regeln(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 3;
	condition		= DIA_Cassia_Regeln_Condition;
	information		= DIA_Cassia_Regeln_Info;
	description		= "你 们 的 规 则 是 什 么 ？";
};

func int DIA_Cassia_Regeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other, self, "DIA_Cassia_Regeln_15_00"); //你 们 的 规 则 是 什 么 ？
	// AI_Output(self, other, "DIA_Cassia_Regeln_16_01");// Wir richten uns nach drei Regeln.
	AI_Output(self, other, "DIA_Cassia_Regeln_16_02"); //第 一 条 规 则 是 ： 你 不 能 提 关 于 我 们 的 任 何 一 个 字 。 对 任 何 人 ， 永 远 。
	AI_Output(self, other, "DIA_Cassia_Regeln_16_03"); //第 二 条 ： 别 被 抓 住 。
	AI_Output(self, other, "DIA_Cassia_Regeln_16_04"); //第 三 条 ： 如 果 你 在 这 下 面 使 用 武 器 攻 击 任 何 一 个 人 ， 我 们 就 会 杀 了 你 。
	AI_Output(self, other, "DIA_Cassia_Regeln_16_05"); //还 有 第 四 条 ， 也 就 是 最 后 一 条 规 则 是 ： 谁 想 加 入 我 们 就 必 须 证 明 自 己 。
};

//////////////////////////////////////////////////////////////////////
//	Info Was passiert, wenn ich erwischt werde?
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Erwischen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Erwischen_Condition;
	information		= DIA_Cassia_Erwischen_Info;
	description		= "如 果 我 被 抓 住 会 发 生 什 么 事 ？";
};

func int DIA_Cassia_Erwischen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Erwischen_Info()
{
	AI_Output(other, self, "DIA_Cassia_Erwischen_15_00"); //如 果 我 被 抓 住 会 发 生 什 么 事 ？
	AI_Output(self, other, "DIA_Cassia_Erwischen_16_01"); //千 万 别 被 抓 住 ， 行 吗 ？
};

//////////////////////////////////////////////////////////////////////
//	Info Wie muss ich mich beweisen?
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_beweisen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_beweisen_Condition;
	information		= DIA_Cassia_beweisen_Info;
	permanent		= TRUE;
	description		= "我 应 该 怎 么 证 明 我 自 己 ？";
};

// --------------------------------------
var int DIA_Cassia_beweisen_permanent;
// -------------------------------------
func int DIA_Cassia_beweisen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cassia_Regeln)
	&& (DIA_Cassia_beweisen_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other, self, "DIA_Cassia_beweisen_15_00"); //我 应 该 怎 么 证 明 我 自 己 ？

	if (Join_Thiefs == FALSE)
	{
		AI_Output(self, other, "DIA_Cassia_beweisen_16_01"); //现 在 你 要 加 入 我 们 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_beweisen_16_02"); //那 个 顽 固 的 老 炼 金 术 士 - 康 斯 坦 提 诺 - 有 一 个 漂 亮 的 戒 指 。
		AI_Output(self, other, "DIA_Cassia_beweisen_16_03"); //不 过 ， 他 并 不 真 的 需 要 它 。 我 想 把 它 戴 在 我 的 手 上 。

		MIS_CassiaRing = LOG_RUNNING;
		DIA_Cassia_beweisen_permanent = TRUE;

		Log_CreateTopic(Topic_CassiaRing, LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing, LOG_RUNNING);
		B_LogEntry(Topic_CassiaRing, Topic_CassiaRing_1);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Beitreten
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Beitreten(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 10;
	condition		= DIA_Cassia_Beitreten_Condition;
	information		= DIA_Cassia_Beitreten_Info;
	description		= "好 吧 ， 我 加 入 。";
};

func int DIA_Cassia_Beitreten_Condition()
{
	if ((Join_Thiefs == FALSE)
	&& Npc_KnowsInfo(other, DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Beitreten_Info()
{
	AI_Output(other, self, "DIA_Cassia_Beitreten_15_00"); //好 吧 ， 我 加 入 。
	AI_Output(self, other, "DIA_Cassia_Beitreten_16_01"); //太 棒 了 。 我 们 会 给 你 一 个 机 会 证 明 你 自 己 。 而 且 ， 如 果 你 想 从 我 们 身 上 学 点 什 么 的 话 ， 非 常 欢 迎 。

	Join_Thiefs = TRUE;
};

//////////////////////////////////////////////////////////////////////
//	Info Und wenn ich euch nicht beitrete...?
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Ablehnen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 9;
	condition		= DIA_Cassia_Ablehnen_Condition;
	information		= DIA_Cassia_Ablehnen_Info;
	description		= "如 果 我 不 想 加 入 你 们 呢 … … ？ ";
};

func int DIA_Cassia_Ablehnen_Condition()
{
	if ((Join_Thiefs == FALSE)
	&& Npc_KnowsInfo(other, DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Ablehnen_Info()
{
	AI_Output(other, self, "DIA_Cassia_Ablehnen_15_00"); //如 果 我 不 想 加 入 你 们 呢 … … ？

	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self, other, "DIA_Cassia_Ablehnen_16_01"); //你 错 过 了 唯 一 的 机 会 ， 但 是 ， 你 可 以 离 开 。
		AI_Output(self, other, "DIA_Cassia_Ablehnen_16_02"); //（ 严 肃 的 ） 想 都 不 要 想 去 出 卖 我 们 。 否 则 你 会 在 痛 苦 中 后 悔 的 。

		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen, "好 吧 ， 我 加 入 。", DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen, "我 需 要 再 考 虑 一 下 。", DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_Ablehnen_16_03"); //如 果 是 那 样 的 话 ， 我 会 杀 了 你 。

		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen, "好 吧 ， 我 加 入 。", DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen, "那 就 来 杀 我 吧 。", DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Ablehnen_Okay()
{
	AI_Output(other, self, "DIA_Cassia_Ablehnen_Okay_15_00"); //好 吧 ， 我 加 入 。
	AI_Output(self, other, "DIA_Cassia_Ablehnen_Okay_16_01"); //（ 微 笑 ） 你 作 出 了 一 个 明 智 的 决 定 。 如 果 你 能 成 功 地 证 明 自 己 的 话 ， 就 可 以 加 入 我 们 的 行 列 。
	AI_Output(self, other, "DIA_Cassia_Ablehnen_Okay_16_02"); //如 果 你 想 先 学 盗 贼 的 技 能 ， 悉 听 尊 便 - 你 会 需 要 它 们 的 。
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other, self, "DIA_Cassia_Ablehnen_Kill_15_00"); //那 就 来 杀 我 吧 。
	AI_Output(self, other, "DIA_Cassia_Ablehnen_Kill_16_01"); //太 糟 糕 了 。 我 以 为 你 会 更 聪 明 些 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Cassia_Ablehnen_Frist()
{
	AI_Output(other, self, "DIA_Cassia_Ablehnen_Frist_15_00"); //我 需 要 再 考 虑 一 下 。
	AI_Output(self, other, "DIA_Cassia_Ablehnen_Frist_16_01"); //去 吧 。 我 会 给 你 两 天 时 间 做 决 定 。 在 那 之 后 ， 这 里 将 不 再 欢 迎 你 。

	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_BevorLernen(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 5;
	condition		= DIA_Cassia_BevorLernen_Condition;
	information		= DIA_Cassia_BevorLernen_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 ？";
};

func int DIA_Cassia_BevorLernen_Condition()
{
	if ((Join_Thiefs == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Cassia_Lernen))
	&& ((Cassia_TeachPickpocket == FALSE)
	|| (Cassia_TeachDEX == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other, self, "DIA_Cassia_BevorLernen_15_00"); //你 能 教 我 什 么 ？

	if (MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self, other, "DIA_Cassia_BevorLernen_16_01"); //当 然 ， 没 问 题 。 你 准 备 好 了 就 告 诉 我 。
		Cassia_TeachPickpocket = TRUE;
		Cassia_TeachDEX = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_BevorLernen_16_02"); //当 然 。 扒 窃 和 敏 捷 之 中 每 一 个 都 需 要 你 花 费 1 0 0 个 金 币 。

		Info_ClearChoices(DIA_Cassia_BevorLernen);
		Info_AddChoice(DIA_Cassia_BevorLernen, "以 后 吧 … … （ 返 回 ）", DIA_Cassia_BevorLernen_Spaeter);

		if (Cassia_TeachPickpocket == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen, "我 想 要 学 习 扒 窃 （ 付 １ ０ ０ 金 币 ）", DIA_Cassia_BevorLernen_Pickpocket);
		};

		if (Cassia_TeachDEX == FALSE)
		{
			Info_AddChoice(DIA_Cassia_BevorLernen, "我 想 要 变 得 更 加 敏 捷 （ 付 １ ０ ０ 金 币 ）", DIA_Cassia_BevorLernen_DEX);
		};
	};
};

func void DIA_Cassia_BevorLernen_Spaeter()
{
	Info_ClearChoices(DIA_Cassia_BevorLernen);
};

func void DIA_Cassia_BevorLernen_DEX()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(other, self, "DIA_Cassia_BevorLernen_DEX_15_00"); //我 想 变 得 更 敏 捷 。 这 是 钱 。
		AI_Output(self, other, "DIA_Cassia_BevorLernen_DEX_16_01"); //当 你 准 备 好 了 后 我 们 就 可 以 开 始 了 。
		Cassia_TeachDEX = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02"); //等 你 有 了 金 币 后 再 来 。
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};

func void DIA_Cassia_BevorLernen_Pickpocket()
{
	if (B_GiveInvItems(other, self, ItMi_Gold, 100))
	{
		AI_Output(other, self, "DIA_Cassia_BevorLernen_Pickpocket_15_00"); //我 想 要 学 习 扒 窃 。 钱 在 这 里 。
		AI_Output(self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_01"); //当 你 准 备 好 了 后 我 们 就 可 以 开 始 了 。
		Cassia_TeachPickpocket = TRUE;
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_BevorLernen_Pickpocket_16_02"); //等 你 有 了 金 币 后 再 来 。
		Info_ClearChoices(DIA_Cassia_BevorLernen);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_TEACH(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 12;
	condition		= DIA_Cassia_TEACH_Condition;
	information		= DIA_Cassia_TEACH_Info;
	permanent		= TRUE;
	description		= "我 想 要 变 得 更 加 敏 捷";
};

func int DIA_Cassia_TEACH_Condition()
{
	if (Cassia_TeachDEX == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other, self, "DIA_Cassia_TEACH_15_00"); //我 想 要 变 得 更 加 敏 捷 。

	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MAX);

	Info_ClearChoices(DIA_Cassia_TEACH);

	Info_AddChoice(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MAX);

	Info_ClearChoices(DIA_Cassia_TEACH);

	Info_AddChoice(DIA_Cassia_TEACH, DIALOG_BACK, DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Cassia_TEACH_5);
};

//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Pickpocket(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 10;
	condition		= DIA_Cassia_Pickpocket_Condition;
	information		= DIA_Cassia_Pickpocket_Info;
	permanent		= TRUE;
	description		= "教 我 怎 么 扒 窃 。 （ １ ０ L P）";
};

func int DIA_Cassia_Pickpocket_Condition()
{
	if ((Cassia_TeachPickpocket == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other, self, "DIA_Cassia_Pickpocket_15_00"); //教 我 怎 么 扒 窃 。

	if (B_TeachThiefTalent(self, other, NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self, other, "DIA_Cassia_Pickpocket_16_01"); //如 果 你 想 掏 空 别 人 的 口 袋 ， 就 要 分 散 他 的 注 意 力 。 就 要 跟 他 说 话 ， 聊 聊 天 。
		AI_Output(self, other, "DIA_Cassia_Pickpocket_16_02"); //在 你 跟 他 说 话 的 时 候 ， 观 察 一 下 他 。 看 清 楚 他 鼓 出 的 口 袋 、 珠 宝 、 或 是 脖 子 上 的 皮 吊 带 。 特 别 是 要 留 意 那 个 家 伙 看 起 来 有 多 机 警 。
		AI_Output(self, other, "DIA_Cassia_Pickpocket_16_03"); //扒 窃 一 个 喝 醉 了 的 临 时 工 和 从 一 个 警 惕 的 商 人 那 里 偷 东 西 可 不 是 一 回 事 ， 你 得 小 心 ？
		AI_Output(self, other, "DIA_Cassia_Pickpocket_16_04"); //当 然 ， 如 果 你 太 笨 的 话 ， 他 会 察 觉 不 对 劲 。 所 以 ， 最 关 键 是 要 保 持 冷 静 。
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Aufnahme
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Aufnahme(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Aufnahme_Condition;
	information		= DIA_Cassia_Aufnahme_Info;
	description		= "我 拿 到 了 康 斯 坦 提 诺 的 戒 指 。";
};

func int DIA_Cassia_Aufnahme_Condition()
{
	if ((MIS_CassiaRing == LOG_RUNNING)
	&& (Npc_HasItems(other, ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Aufnahme_Info()
{
	AI_Output(other, self, "DIA_Cassia_Aufnahme_15_00"); //我 拿 到 了 康 斯 坦 提 诺 的 戒 指 。
	B_GiveInvItems(other, self, ItRi_Prot_Point_01_MIS, 1);

	AI_Output(self, other, "DIA_Cassia_Aufnahme_16_01"); //恭 喜 你 。 你 通 过 了 你 的 入 门 测 试 。 现 在 你 真 正 是 我 们 的 人 了 。
	AI_Output(self, other, "DIA_Cassia_Aufnahme_16_02"); //拿 着 这 把 钥 匙 。 它 能 打 开 旅 馆 的 门 。 （ 微 笑 ） 那 样 ， 你 就 不 用 每 次 来 都 游 泳 了 。
	B_GiveInvItems(self, other, ItKe_ThiefGuildKey_Hotel_MIS, 1);

	AI_Output(self, other, "DIA_Cassia_Aufnahme_16_03"); //此 外 ， 你 应 该 知 道 我 们 有 一 个 秘 密 记 号 。 一 个 特 别 的 点 头 。
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Cassia_Aufnahme_16_04"); //确 切 地 讲 。 当 你 正 好 找 对 了 人 ， 在 跟 他 说 话 的 时 候 作 出 这 个 记 号 ， 他 们 就 会 知 道 你 是 自 己 人 了 。

	MIS_CassiaRing = LOG_SUCCESS;
	B_GivePlayerXP(XP_CassiaRing);
	Knows_SecretSign = TRUE;
	Log_CreateTopic(Topic_Diebesgilde, LOG_NOTE);
	B_LogEntry(Topic_Diebesgilde, Topic_Diebesgilde_1);
	Log_AddEntry(Topic_Diebesgilde, Topic_Diebesgilde_2);
};

//////////////////////////////////////////////////////////////////////
//	Info Versteck
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Versteck(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Versteck_Condition;
	information		= DIA_Cassia_Versteck_Info;
	description		= "那 么 你 把 赃 物 藏 在 哪 里 ？";
};

func int DIA_Cassia_Versteck_Condition()
{
	if ((MIS_CassiaRing == LOG_SUCCESS)
	&& Npc_KnowsInfo(other, DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Versteck_Info()
{
	AI_Output(other, self, "DIA_Cassia_Versteck_15_00"); //那 么 你 把 赃 物 藏 在 哪 里 ？
	AI_Output(self, other, "DIA_Cassia_Versteck_16_01"); //得 了 ， 你 不 会 真 以 为 我 会 告 诉 你 那 些 吧 。
	AI_Output(self, other, "DIA_Cassia_Versteck_16_02"); //你 会 有 足 够 的 机 会 拿 到 你 自 己 的 战 利 品 的 。 记 住 - 那 些 太 贪 婪 的 人 最 终 什 么 也 得 不 到 。
};

//////////////////////////////////////////////////////////////////////
//	Info Blutkelche
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Blutkelche(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Blutkelche_Condition;
	information		= DIA_Cassia_Blutkelche_Info;
	description		= "你 有 给 我 的 工 作 吗 ？ ";
};

func int DIA_Cassia_Blutkelche_Condition()
{
	if ((MIS_CassiaRing == LOG_SUCCESS)
	&& (MIS_CassiaKelche != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other, self, "DIA_Cassia_Blutkelche_15_00"); //你 有 给 我 的 工 作 吗 ？

	if (PETZCOUNTER_City_Theft > 0)
	{
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_01"); //当 你 在 城 里 被 作 为 盗 窃 犯 通 缉 的 时 候 不 行 。
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_02"); //清 除 记 录 - 支 付 你 的 罚 款 或 者 干 掉 那 些 证 人 ， 我 不 在 乎 ， 只 要 你 清 除 它 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_03"); //是 的 。 有 一 套 圣 杯 。 共 有 六 只 。
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_04"); //国 王 罗 巴 尔 在 一 次 战 役 中 获 得 的 战 利 品 - 但 他 牺 牲 了 很 多 人 才 得 到 了 它 们 。 这 就 是 为 什 么 它 们 被 取 名 叫 鲜 血 圣 杯 。
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_05"); //任 何 单 独 的 一 只 圣 杯 并 不 那 么 贵 重 - 但 是 它 们 六 只 一 起 就 值 一 个 相 当 大 的 数 目 。
		AI_Output(other, self, "DIA_Cassia_Blutkelche_15_06"); //这 些 圣 杯 在 哪 里 ？
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_07"); //它 们 就 在 这 里 ， 城 里 面 - 它 们 属 于 富 人 区 里 的 一 个 富 商 。
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_08"); //把 它 们 带 给 我 。 同 时 ， 我 会 试 着 去 给 它 们 找 一 个 买 主 。
		AI_Output(other, self, "DIA_Cassia_Blutkelche_15_09"); //我 有 什 么 好 处 ？
		AI_Output(self, other, "DIA_Cassia_Blutkelche_16_10"); //要 么 是 收 益 的 一 半 ， 要 么 你 可 以 从 我 的 战 利 品 中 挑 一 件 特 别 的 。

		MIS_CassiaKelche = LOG_RUNNING;
		Log_CreateTopic(Topic_Cassiakelche, LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche, LOG_RUNNING);
		B_LogEntry(Topic_CassiaKelche, Topic_CassiaKelche_1);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Kelche abgeben
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_abgeben(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_abgeben_Condition;
	information		= DIA_Cassia_abgeben_Info;
	permanent		= TRUE;
	description		= "关 于 鲜 血 圣 杯 … …  ";
};

func int DIA_Cassia_abgeben_Condition()
{
	if (MIS_CassiaKelche == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Cassia_abgeben_Info()
{
	AI_Output(other, self, "DIA_Cassia_abgeben_15_00"); //关 于 鲜 血 圣 杯 … …

	if (B_GiveInvItems(other, self, ItMi_BloodCup_MIS, 6))
	{
		AI_Output(other, self, "DIA_Cassia_abgeben_15_01"); //我 现 在 已 经 弄 到 全 部 六 只 圣 杯 了 。
		AI_Output(self, other, "DIA_Cassia_abgeben_16_02"); //干 得 漂 亮 。 同 时 ， 我 已 经 找 到 了 买 主 。
		AI_Output(self, other, "DIA_Cassia_abgeben_16_03"); //现 在 ， 你 可 以 得 到 你 的 报 酬 了 。 谢 谢 你 为 我 做 了 这 件 事 。
		AI_Output(self, other, "DIA_Cassia_abgeben_16_04"); //现 在 没 有 什 么 事 必 须 要 你 去 做 的 了 - 但 是 你 可 以 随 时 到 我 这 里 来 打 听 一 下 。 另 外 ， 这 个 岛 上 还 有 足 够 的 东 西 等 着 有 人 去 拿 。 （ 微 笑 ）

		MIS_CassiaKelche = LOG_SUCCESS;
		B_GivePlayerXP(XP_CassiaBlutkelche);
	}
	else
	{
		AI_Output(self, other, "DIA_Cassia_abgeben_16_05"); //我 只 能 把 这 些 圣 杯 整 套 卖 出 去 。 给 我 拿 来 全 部 的 六 只 。
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Belohung
///////////////////////////////////////////////////////////////////////
instance DIA_Cassia_Belohnung(C_INFO)
{
	npc				= VLK_447_Cassia;
	nr				= 2;
	condition		= DIA_Cassia_Belohnung_Condition;
	information		= DIA_Cassia_Belohnung_Info;
	description		= "我 来 拿 我 的 报 酬 。";
};

func int DIA_Cassia_Belohnung_Condition()
{
	if (MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Belohnung_Info()
{
	AI_Output(other, self, "DIA_Cassia_Belohnung_15_00"); //我 来 拿 我 的 报 酬 。
	AI_Output(self, other, "DIA_Cassia_Belohnung_16_01"); //你 的 选 择 是 什 么 ？

	Info_ClearChoices(DIA_Cassia_Belohnung);

	Info_AddChoice(DIA_Cassia_Belohnung, "４ ０ ０ 枚 金 币 。", DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung, "４ 个 治 疗 炼 金 药", DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung, NAME_ADDON_CASSIASBELOHNUNGSRING, DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Belohnung_Gold()
{
	AI_Output(other, self, "DIA_Cassia_Belohnung_15_02"); //给 我 那 些 金 币 。
	B_GiveInvItems(self, other, ItmI_Gold, 400);

	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Trank()
{
	AI_Output(other, self, "DIA_Cassia_Belohnung_15_03"); //给 我 些 药 剂 。
	B_GiveInvItems(self, other, ItPo_Health_03, 4);

	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Belohnung_Ring()
{
	AI_Output(other, self, "DIA_Cassia_Belohnung_15_04"); //给 我 戒 指 。
	B_GiveInvItems(self, other, ItRi_Hp_01, 1);

	Info_ClearChoices(DIA_Cassia_Belohnung);
};
