//////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_EXIT(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 999;
	condition		= DIA_Ramirez_EXIT_Condition;
	information		= DIA_Ramirez_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ramirez_PICKPOCKET(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 900;
	condition		= DIA_Ramirez_PICKPOCKET_Condition;
	information		= DIA_Ramirez_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Ramirez_PICKPOCKET_Condition()
{
	C_Beklauen(90, 300);
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET, DIALOG_BACK, DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Diebeszeichen
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Zeichen(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 2;
	condition		= DIA_Ramirez_Zeichen_Condition;
	information		= DIA_Ramirez_Zeichen_Info;
	description		= "（ 发 出 盗 贼 信 号 ）";
};

func int DIA_Ramirez_Zeichen_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Zeichen_Info()
{
	AI_PlayAni(other, "T_YES");
	AI_Output(self, other, "DIA_Ramirez_Zeichen_14_00"); //好 吧 ， 好 吧 ， 你 认 识 这 个 标 记 。 （ 打 哈 欠 ） 你 给 我 留 下 了 深 刻 印 象。
};

//////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Hallo(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 2;
	condition		= DIA_Ramirez_Hallo_Condition;
	information		= DIA_Ramirez_Hallo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

// ----------------------------------
var int DIA_Ramirez_Hallo_permanent;
// ----------------------------------
func int DIA_Ramirez_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (DIA_Ramirez_Hallo_permanent == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if ((self.aivar [AIV_TalkedToPlayer] == FALSE)
	&& (Join_Thiefs == FALSE))
	{
		AI_Output(self, other, "DIA_Ramirez_Hallo_14_00"); //你 迷 路 了 吗 ？ 我 不 认 为 这 对 你 来 说 是 个 好 地 方 。
		AI_Output(self, other, "DIA_Ramirez_Hallo_14_01"); //如 果 你 在 这 里 发 生 了 什 么 事 情 ， 没 有 人 能 帮 助 你 。 所 以 ， 小 心 点 。 （ 哈 哈 大 笑 ）
	};

	if (Join_Thiefs == TRUE)
	{
		AI_Output(self, other, "DIA_Ramirez_Hallo_14_02"); //所 以 你 加 入 了 。 好 吧 ， 那 么 我 祝 你 成 功 - 无 论 你 做 什 么 ， 要 小 心 。
		AI_Output(self, other, "DIA_Ramirez_Hallo_14_03"); //哦 ， 还 有 一 件 事 - 我 不 在 乎 你 在 上 面 是 谁 ， 以 及 你 跟 谁 一 起 工 作 。
		AI_Output(self, other, "DIA_Ramirez_Hallo_14_04"); //在 这 下 面 ， 你 只 是 我 们 的 人 。 一 个 贼 。 仅 此 而 已 。
		DIA_Ramirez_Hallo_permanent = TRUE;
	};

	DG_gefunden = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Beute
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Beute(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 3;
	condition		= DIA_Ramirez_Beute_Condition;
	information		= DIA_Ramirez_Beute_Info;
	important		= TRUE;
};

func int DIA_Ramirez_Beute_Condition()
{
	if ((Mob_HasItems("THIEF_CHEST_01", ItMi_Gold) < 50)
	|| (Mob_HasItems("THIEF_CHEST_02", ItMi_Gold) < 100)
	|| (Mob_HasItems("THIEF_CHEST_02", ItMi_Silvercup) == FALSE)
	|| (Mob_HasItems("THIEF_CHEST_03", ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Beute_Info()
{
	AI_Output(self, other, "DIA_Ramirez_Beute_14_00"); //听 着 ， 你 就 不 能 认 真 点 ， 是 吗 ？ 你 正 在 装 我 们 的 金 子 … … 你 想 要 偷 我 们 的 东 西 吗 ？
	AI_Output(other, self, "DIA_Ramirez_Beute_15_01"); //别 为 了 两 个 钱 就 都 激 动 起 来 。
	AI_Output(other, self, "DIA_Ramirez_Beute_15_02"); //我 的 意 思 是，这 一 点 东 西 就 是 你 所 有 的 战 利 品 吗 ？这 就 是 克 霍 里 尼 斯 的 盗 贼 公 会 能 提 供 的 一 切 ？
	AI_Output(self, other, "DIA_Ramirez_Beute_14_03"); //谁 说 我 们 的 战 利 品 存 放 在 这 下 面 ？
	AI_Output(other, self, "DIA_Ramirez_Beute_15_04"); //我 同 样 不 能 完 全 相 信 这 一 点 。 那 么 ， 你 把 你 的 财 宝 都 藏 在 哪 里 了 ？
	AI_Output(self, other, "DIA_Ramirez_Beute_14_05"); //在 一 个 很 安 全 的 地 方 。
	AI_Output(other, self, "DIA_Ramirez_Beute_15_06"); //我 明 白 了 。
	AI_Output(self, other, "DIA_Ramirez_Beute_14_07"); //好 的 ， 你 可 以 拿 着 这 些 金 子 。 但 是 ， 我 会 注 意 你 的 。 所 以 ， 别 做 得 太 过 火 。
};

//////////////////////////////////////////////////////////////////////
//	Info Lernen freischalten
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Bezahlen(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 9;
	condition		= DIA_Ramirez_Bezahlen_Condition;
	information		= DIA_Ramirez_Bezahlen_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 什 么 吗 ？";
};

// --------------------------------------
var int DIA_Ramirez_Bezahlen_permanent;
// --------------------------------------
func int DIA_Ramirez_Bezahlen_Condition()
{
	if ((Join_Thiefs == TRUE)
	&& (DIA_Ramirez_Bezahlen_permanent == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Cassia_Lernen)))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Bezahlen_Info()
{
	if (MIS_ThiefGuild_sucked == FALSE)
	{
		Ramirez_Cost = 150;
	}
	else
	{
		Ramirez_Cost = 300;
	};

	AI_Output(other, self, "DIA_Ramirez_Bezahlen_15_00"); //你 能 教 我 什 么 吗 ？

	if (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self, other, "DIA_Ramirez_Bezahlen_14_01"); //我 什 么 也 教 不 了 你 。 你 已 经 学 会 了 所 有 关 于 开 锁 的 技 能 。
		if (other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self, other, "DIA_Ramirez_Add_14_00"); //现 在 ， 你 只 需 要 增 加 你 的 敏 捷 。
		};

		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self, other, "DIA_Ramirez_Bezahlen_14_02"); //我 可 以 告 诉 你 怎 样 开 锁 。 你 需 要 为 此 花 点 钱 … …
		B_Say_Gold(self, other, Ramirez_Cost);

		Info_ClearChoices(DIA_Ramirez_Bezahlen);
		Info_AddChoice(DIA_Ramirez_Bezahlen, "以 后 吧 … … （ 返 回 ）", DIA_Ramirez_Bezahlen_Spaeter);
		Info_AddChoice(DIA_Ramirez_Bezahlen, "好 吧 ， 我 付 … …", DIA_Ramirez_Bezahlen_Okay);
	};
};

func void DIA_Ramirez_Bezahlen_Spaeter()
{
	Info_ClearChoices(DIA_Ramirez_Bezahlen);
};

func void DIA_Ramirez_Bezahlen_Okay()
{
	AI_Output(other, self, "DIA_Ramirez_Bezahlen_Okay_15_00"); //好 吧 ， 我 付 … …

	if (B_GiveInvItems(other, self, ItMi_Gold, Ramirez_Cost))
	{
		AI_Output(other, self, "DIA_Ramirez_Bezahlen_Okay_15_01"); //… … 钱 在 这 里 。
		AI_Output(self, other, "DIA_Ramirez_Bezahlen_Okay_14_02"); //太 棒 了 。 我 为 你 效 劳 。
		Ramirez_TeachPlayer = TRUE;
		DIA_Ramirez_Bezahlen_permanent = TRUE;
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	}
	else
	{
		AI_Output(self, other, "DIA_Ramirez_Bezahlen_Okay_14_03"); //那 么 ， 去 弄 点 金 子 ， 然 后 再 回 来 。
		Info_ClearChoices(DIA_Ramirez_Bezahlen);
	};
};

//////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Teach(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 99;
	condition		= DIA_Ramirez_Teach_Condition;
	information		= DIA_Ramirez_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 如 何 开 锁 。";
};

func int DIA_Ramirez_Teach_Condition()
{
	if ((Ramirez_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other, self, "DIA_Ramirez_Teach_15_00"); //教 我 如 何 开 锁 。

	if (Ramirez_Zweimal == FALSE)
	{
		AI_Output(self, other, "DIA_Ramirez_Teach_14_06"); //开 锁 是 盗 贼 们 的 高 级 艺 术 。
		AI_Output(self, other, "DIA_Ramirez_Teach_14_01"); //你 需 要 很 多 感 觉 和 直 觉 。 以 及 一 些 不 错 的 开 锁 工 具 。
		AI_Output(self, other, "DIA_Ramirez_Teach_14_02"); //然 而 ， 有 一 些 箱 子 都 配 备 了 一 些 特 殊 的 锁 ， 只 能 用 相 应 的 钥 匙 才 能 打 开 。
		Ramirez_Zweimal = TRUE;
	};

	if (B_TeachThiefTalent(self, other, NPC_TALENT_PICKLOCK))
	{
		AI_Output(self, other, "DIA_Ramirez_Teach_14_03"); //那 么 ， 跪 在 锁 前 面 ， 把 开 锁 工 具 往 左 拧 然 后 再 往 右 。
		AI_Output(self, other, "DIA_Ramirez_Teach_14_04"); //如 果 你 把 它 拧 得 太 快 或 者 太 重 ， 它 都 会 断 掉 。
		AI_Output(self, other, "DIA_Ramirez_Teach_14_05"); //不 过 ， 你 越 熟 练 ， 操 作 这 个 工 具 就 越 容 易 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info oberes Viertel
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Viertel(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 8;
	condition		= DIA_Ramirez_Viertel_Condition;
	information		= DIA_Ramirez_Viertel_Info;
	description		= "那 个 值 得 惹 上 非 法 侵 入 罪 名 的 东 西 在 哪 里 ？";
};

func int DIA_Ramirez_Viertel_Condition()
{
	if (Knows_SecretSign == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Viertel_Info()
{
	AI_Output(other, self, "DIA_Ramirez_Viertel_15_00"); //那 个 值 得 惹 上 非 法 侵 入 罪 名 的 东 西 在 哪 里 ？
	AI_Output(self, other, "DIA_Ramirez_Viertel_14_01"); //当 然 在 城 里 的 富 人 区 里 面 。
	AI_Output(self, other, "DIA_Ramirez_Viertel_14_02"); //但 是 ， 如 果 你 想 闯 进 那 里 的 某 个 地 方 ， 等 着 天 黑 - 那 时 每 个 人 都 睡 熟 了 - 除 了 那 些 城 市 守 卫 。
	AI_Output(self, other, "DIA_Ramirez_Viertel_14_03"); //他 们 在 晚 上 会 巡 逻 。 我 认 识 他 们 中 的 一 个 - 威 姆 波 。 他 是 唯 一 对 钱 感 兴 趣 的 家 伙 。
	AI_Output(self, other, "DIA_Ramirez_Viertel_14_04"); //他 的 价 钱 很 高 ， 不 过 ， 一 旦 你 付 了 钱 给 他 ， 就 再 也 不 需 要 担 心 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info Sextant
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Sextant(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 2;
	condition		= DIA_Ramirez_Sextant_Condition;
	information		= DIA_Ramirez_Sextant_Info;
	description		= "你 有 给 我 的 工 作 吗 ？";
};

func int DIA_Ramirez_Sextant_Condition()
{
	if ((Knows_SecretSign == TRUE)
	&& (MIS_CassiaRing == LOG_SUCCESS)
	&& (Kapitel >= 2))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other, self, "DIA_Ramirez_Sextant_15_00"); //你 有 给 我 的 工 作 吗 ？
	AI_Output(self, other, "DIA_Ramirez_Sextant_14_01"); //嗯 … … 有 一 件 东 西 我 很 想 得 到 。 但 是 ， 我 到 目 前 为 止 还 没 找 到 。
	AI_Output(other, self, "DIA_Ramirez_Sextant_15_02"); //我 能 为 你 弄 些 什 么 ？
	AI_Output(self, other, "DIA_Ramirez_Sextant_14_03"); //一 个 六 分 仪 。 给 我 弄 来 一 个 六 分 仪 - 我 会 付 给 你 一 个 好 价 钱 作 为 交 换 。

	Log_CreateTopic(Topic_RamirezSextant, LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant, LOG_RUNNING);
	B_LogEntry(Topic_RamirezSextant, Topic_RamirezSextant_1);

	MIS_RamirezSextant = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Ramirez_Success(C_INFO)
{
	npc				= VLK_445_Ramirez;
	nr				= 2;
	condition		= DIA_Ramirez_Success_Condition;
	information		= DIA_Ramirez_Success_Info;
	description		= "我 给 你 拿 来 了 六 分 仪。";
};

func int DIA_Ramirez_Success_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ramirez_Sextant)
	&& (Npc_HasItems(other, Itmi_Sextant) > 0))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	AI_Output(other, self, "DIA_Ramirez_Success_15_00"); //我 给 你 拿 来 了 六 分 仪 。
	B_GiveInvItems(other, self, Itmi_Sextant, 1);
	AI_Output(self, other, "DIA_Ramirez_Success_14_01"); //不 可 思 议 。 你 真 的 想 法 子 找 到 了 一 个 。
	AI_Output(self, other, "DIA_Ramirez_Success_14_02"); //给 ， 这 是 你 挣 得 的 报 酬 。

	B_GiveInvItems(self, other, Itmi_Gold, Value_Sextant / 2);
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	B_GivePlayerXP(XP_RamirezSextant);
};
