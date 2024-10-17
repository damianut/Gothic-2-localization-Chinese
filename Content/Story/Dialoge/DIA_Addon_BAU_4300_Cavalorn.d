///////////////////////////////////////////////////////////////////////
//	C_BragoBanditsDead
///////////////////////////////////////////////////////////////////////

func int C_BragoBanditsDead()
{
	if ((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE))
	&& (Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015)))
	{
		return TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_EXIT(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 999;
	condition		= DIA_Addon_Cavalorn_EXIT_Condition;
	information		= DIA_Addon_Cavalorn_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Cavalorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Cavalorn_PICKPOCKET(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 900;
	condition		= DIA_Addon_Cavalorn_PICKPOCKET_Condition;
	information		= DIA_Addon_Cavalorn_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 走 他 的 箭 袋 应 该 很 容 易 ）";
};

func int DIA_Addon_Cavalorn_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (25 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_BACK, DIA_Addon_Cavalorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cavalorn_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Cavalorn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cavalorn_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 25)
	{
		B_GiveInvItems(self, other, ItRw_Arrow, 44);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Cavalorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_MeetingIsRunning(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 1;
	condition		= DIA_Addon_Cavalorn_MeetingIsRunning_Condition;
	information		= DIA_Addon_Cavalorn_MeetingIsRunning_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Addon_Cavalorn_MeetingIsRunning_OneTime;
func int DIA_Addon_Cavalorn_MeetingIsRunning_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_MeetingIsRunning_Info()
{
	if (DIA_Addon_Cavalorn_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_MeetingIsRunning_08_00"); //欢 迎 加 入 ‘ 环 ’ ， 我 的 朋 友 。
		DIA_Addon_Cavalorn_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Gaan_MeetingIsRunning_08_01"); //瓦 卓 斯 将 会 给 你 分 派 下 一 个 任 务 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HALLO(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_HALLO_Condition;
	information		= DIA_Addon_Cavalorn_HALLO_Info;
	description		= "你 遇 到 麻 烦 了 ？";
};

func int DIA_Addon_Cavalorn_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cavalorn_HALLO_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_15_00"); //麻 烦 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_08_01"); //（ 生 气 ） 该 死 。 我 不 知 道 他 们 都 藏 在 哪 里 。 你 杀 了 一 个 ， 很 快 他 们 又 全 都 回 来 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_08_02"); //（ 狡 诈 的 ） 等 一 下 。 你 认 识 你 。 你 是 那 个 在 矿 藏 山 谷 不 断 向 我 要 箭 的 人 。

	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO, "你 的 名 字 叫 卡 瓦 隆 ， 对 吗 ？", DIA_Addon_Cavalorn_HALLO_Ja);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO, "我 几 乎 记 不 起 来 … … ？", DIA_Addon_Cavalorn_HALLO_weissNicht);
};

func void DIA_Addon_Cavalorn_HALLO_weissNicht()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_weissNicht_15_00"); //我 几 乎 记 不 起 来 … … ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_weissNicht_08_01"); //哦 ， 来 吧 。 在 旧 营 地 我 的 小 屋 后 面 ， 我 教 你 如 何 使 用 弓 射 击 ， 还 有 如 何 潜 行 。 记 起 来 了 吗 ？
};

func void DIA_Addon_Cavalorn_HALLO_Ja()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_Ja_15_00"); //你 的 名 字 叫 卡 瓦 隆 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_01"); //啊 。 我 知 道 你 还 没 有 忘 记 我 ， 毕 竟 我 们 一 起 穿 过 了 那 该 死 的 流 放 地 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Ja_08_02"); //你 要 往 哪 里 去 ？

	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO, "我 没 有 特 定 的 目 标 。", DIA_Addon_Cavalorn_HALLO_keinZiel);
	Info_AddChoice(DIA_Addon_Cavalorn_HALLO, "返 回 矿 藏 山 谷 。", DIA_Addon_Cavalorn_HALLO_Bauern);

	if (Mil_310_Stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Cavalorn_HALLO, "通 往 城 市 。", DIA_Addon_Cavalorn_HALLO_Stadt);
	};
};

func void DIA_Addon_Cavalorn_HALLO_Stadt()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_Stadt_15_00"); //通 往 城 市 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_01"); //（ 大 笑 ） 不 错 ， 不 错 。 去 城 市 ， 嗯 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_02"); //你 在 卫 兵 那 里 会 遇 到 麻 烦 的 。 他 们 现 在 不 让 任 何 人 进 入 ， 因 为 这 个 地 区 到 处 都 是 强 盗 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_03"); //不 久 前 ， 一 个 以 前 矿 藏 山 谷 的 心 灵 异 能 者 路 过 这 里 。 他 说 他 时 常 进 出 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_04"); //他 进 入 了 一 座 巨 大 的 塔 下 方 的 山 谷 。 在 那 里 的 瀑 布 附 近 一 定 有 一 条 路 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Stadt_08_05"); //也 许 你 应 该 同 那 个 家 伙 谈 谈 。
	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_Bauern()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_Bauern_15_00"); //回 到 矿 藏 山 谷 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_01"); //（ 吃 惊 的 ） 真 的 ？ 嗯 。 我 很 希 望 能 跟 你 走 ， 不 过 我 必 须 先 把 我 这 里 的 任 务 完 成 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_Bauern_08_02"); //如 果 你 到 了 矿 藏 山 谷 ， 能 帮 我 看 看 我 的 旧 屋 子 是 否 还 能 用 吗 ？ 有 一 天 我 想 回 那 里 去 。

	MIS_Addon_Cavalorn_TheHut = LOG_RUNNING;
	Log_CreateTopic(TOPIC_Addon_CavalornTheHut, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_CavalornTheHut, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_CavalornTheHut, TOPIC_Addon_CavalornTheHut_1);

	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

func void DIA_Addon_Cavalorn_HALLO_keinZiel()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HALLO_keinZiel_15_00"); //我 没 有 特 定 的 目 标 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HALLO_keinZiel_08_01"); //你 不 想 告 诉 我 ， 嗯 ？ 好 吧 。

	Info_ClearChoices(DIA_Addon_Cavalorn_HALLO);
};

///////////////////////////////////////////////////////////////////////
//	Info Beutel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Beutel(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_Beutel_Condition;
	information		= DIA_Addon_Cavalorn_Beutel_Info;
	description		= "我 去 过 你 在 矿 藏 山 谷 的 小 屋 。";
};

func int DIA_Addon_Cavalorn_Beutel_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_HALLO))
	&& ((Npc_HasItems(other, ItSe_ADDON_CavalornsBeutel)) || (SC_OpenedCavalornsBeutel == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Beutel_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_15_00"); //我 去 过 你 在 矿 藏 山 谷 的 小 屋 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_08_01"); //那 么 它 还 在 哪 里 。
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_15_02"); //是 的 。 而 我 也 知 道 你 为 什 么 要 去 那 里 。
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_08_03"); //你 找 到 它 了 ？
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_15_04"); //如 果 你 说 的 是 一 小 袋 矿 石 块 的 话 … … 是 的 ， 我 找 到 它 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_08_05"); //你 知 道 吗 ， 你 是 一 个 狡 猾 的 家 伙 ？
	if (MIS_Addon_Cavalorn_TheHut == LOG_RUNNING)
	{
		AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_15_06"); //你 还 能 在 那 座 旧 屋 子 里 找 什 么 ？ 根 本 没 有 其 它 的 东 西 。
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_08_07"); //你 把 它 带 在 身 上 了 吗 ？ 我 可 以 给 你100金 币 买 它 。
	TOPIC_End_CavalornTheHut = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);

	if (Npc_HasItems(other, ItSe_ADDON_CavalornsBeutel))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "好 的 。", DIA_Addon_Cavalorn_Beutel_ja);
	}
	else if (Npc_HasItems(other, ItMi_Nugget))
	{
		Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "不 ， 但 是 我 这 里 有 一 块 矿 石 。", DIA_Addon_Cavalorn_Beutel_jaerz);
	};

	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "不 。", DIA_Addon_Cavalorn_Beutel_no);
};

func void DIA_Addon_Cavalorn_Beutel_back()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	AI_Output(self, other, "DIA_Addon_Cavalorn_back_08_00"); //我 希 望 能 马 上 把 它 拿 回 来 。
};

func void DIA_Addon_Cavalorn_Beutel_jaerz()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_jaerz_15_00"); //不 ， 但 是 我 这 里 有 一 块 矿 石 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_jaerz_08_01"); //也 不 错 。
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "你 为 什 么 把 它 留 在 第 一 个 地 方 ？", DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_ja()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_ja_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_ja_08_01"); //非 常 好 。
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "你 为 什 么 把 它 留 在 第 一 个 地 方 ？", DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_no()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_00"); //不 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_no_08_01"); //那 把 它 还 给 我 吧 。 毕 竟 ， 我 也 曾 经 打 算 回 那 该 死 矿 藏 山 谷 。
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_no_15_02"); //我 的 眼 睛 模 糊 了 。
	Info_ClearChoices(DIA_Addon_Cavalorn_Beutel);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, DIALOG_BACK, DIA_Addon_Cavalorn_Beutel_Back);
	Info_AddChoice(DIA_Addon_Cavalorn_Beutel, "你 为 什 么 把 它 留 在 第 一 个 地 方 ？", DIA_Addon_Cavalorn_Beutel_why);
};

func void DIA_Addon_Cavalorn_Beutel_why()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Beutel_why_15_00"); //你 为 什 么 把 它 留 在 第 一 个 地 方 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_01"); //我 不 知 道 为 什 么 那 矿 石 在 克 霍 里 尼 斯 如 此 珍 贵 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_02"); //为 了 一 小 片 微 不 足 道 的 矿 石 ， 你 在 罪 犯 流 放 地 找 不 到 一 块 地 方 来 睡 觉 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Beutel_why_08_03"); //在 港 口 城 市 里 ， 如 果 他 们 发 现 你 身 上 有 矿 石 的 话 ， 会 立 刻 打 碎 你 的 骨 头 。
};

///////////////////////////////////////////////////////////////////////
//	Info ErzGeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ErzGeben(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_ErzGeben_Condition;
	information		= DIA_Addon_Cavalorn_ErzGeben_Info;
	description		= "给 我 １ ０ ０ 金 币 ， 我 就 把 你 的 矿 石 还 给 你 。";
};

func int DIA_Addon_Cavalorn_ErzGeben_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Beutel))
	&& ((Npc_HasItems(other, ItSe_ADDON_CavalornsBeutel)) || (Npc_HasItems(other, ItMi_Nugget))))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ErzGeben_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_ErzGeben_15_00"); //给 我 １ ０ ０ 金 币 ， 我 就 把 你 的 矿 石 还 给 你 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_01"); //成 交 。 给 你 。
	CreateInvItems(self, ItMi_Gold, 100);
	B_GiveInvItems(self, other, ItMi_Gold, 100);

	if (B_GiveInvItems(other, self, ItSe_ADDON_CavalornsBeutel, 1) == FALSE)
	{
		B_GiveInvItems(other, self, ItMi_Nugget, 1);
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_ErzGeben_08_02"); //你 是 一 个 真 正 的 朋 友 。 非 常 感 谢 。
	MIS_Addon_Cavalorn_TheHut = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_CavalornsBeutel);
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_WASMACHSTDU(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_WASMACHSTDU_Condition;
	information		= DIA_Addon_Cavalorn_WASMACHSTDU_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Cavalorn_WASMACHSTDU_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_HALLO))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_WASMACHSTDU_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_WASMACHSTDU_08_01"); //我 正 在 耐 心 等 待 。 如 果 不 是 有 这 些 该 死 的 强 盗 ， 我 也 不 会 在 这 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Banditen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Banditen(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 10;
	condition		= DIA_Addon_Cavalorn_Banditen_Condition;
	information		= DIA_Addon_Cavalorn_Banditen_Info;
	description		= "强 盗 怎 么 了 ？";
};

func int DIA_Addon_Cavalorn_Banditen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_WASMACHSTDU))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Banditen_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Banditen_15_00"); //强 盗 怎 么 了 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_Banditen_08_01"); //过 去 的 几 个 星 期 你 睡 着 过 吗 ？
	AI_Output(other, self, "DIA_Addon_Cavalorn_Banditen_15_02"); //呃……
	AI_Output(self, other, "DIA_Addon_Cavalorn_Banditen_08_03"); //我 说 的 是 所 有 那 些 从 罪 犯 流 放 地 过 来 ， 并 在 这 个 地 区 安 家 的 流 氓 们 ， 掠 夺 、 谋 杀 他 们 认 为 有 价 值 的 所 有 人 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Banditen_08_04"); //（ 叹 息 ） 我 很 幸 运 ， 他 们 没 杀 我 。 我 惹 怒 了 我 的 卫 兵 ， 他 们 就 从 身 后 用 棒 子 把 我 打 倒 。

	if (C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_Banditen_08_05"); //不 知 道 我 怎 么 把 我 所 有 的 东 西 拿 回 来 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ARTEFAKT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_ARTEFAKT(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_ARTEFAKT_Condition;
	information		= DIA_Addon_Cavalorn_ARTEFAKT_Info;
	description		= "你 被 强 盗 洗 劫 了 ？";
};

func int DIA_Addon_Cavalorn_ARTEFAKT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Banditen))
	&& (MIS_Addon_Cavalorn_KillBrago != LOG_SUCCESS)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_ARTEFAKT_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_ARTEFAKT_15_00"); //你 被 强 盗 洗 劫 了 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_01"); //（ 狂 怒 ） 是 的 。 他 们 把 我 打 倒 ， 并 把 我 扔 给 哥 布 林 们 当 午 餐 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_02"); //那 是 非 常 重 要 的 东 西 。 一 封 信 和 我 所 有 的 钱 。 我 绝 对 要 把 它 拿 回 来 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_ARTEFAKT_08_03"); //但 是 没 人 帮 我 留 意 我 身 后 的 话 ， 我 不 想 回 那 里 。 那 些 懦 弱 的 乌 合 之 众 … …
};

///////////////////////////////////////////////////////////////////////
//	Info HELFEN
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_HELFEN(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_HELFEN_Condition;
	information		= DIA_Addon_Cavalorn_HELFEN_Info;
	description		= "关 于 那 些 强 盗 ， 我 能 帮 你 什 么 忙 吗 ？";
};

func int DIA_Addon_Cavalorn_HELFEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_ARTEFAKT))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead() == FALSE)) // Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_HELFEN_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_HELFEN_15_00"); //关 于 那 些 强 盗 ， 我 能 帮 你 什 么 忙 吗 ？

	if ((Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE))
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_HELFEN_08_01"); //（ 狡 诈 的 ） 也 许 。 不 过 看 看 你 骨 瘦 如 柴 的 样 子 ， 你 的 手 里 一 定 有 几 个 星 期 没 有 拿 过 一 把 象 样 的 长 剑 了 。
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_HELFEN_08_02"); //嗯 。 我 别 无 选 择 ， 只 能 接 受 你 的 提 议 。 我 的 时 间 正 在 流 逝 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HELFEN_08_03"); //那 么 要 注 意 。 从 这 里 往 下 的 路 上 ， 你 能 看 到 地 面 上 的 一 个 污 秽 的 洞 ， 那 些 强 盗 们 可 能 就 藏 在 里 面 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HELFEN_08_04"); //那 边 的 那 些 家 伙 和 偷 我 东 西 的 人 是 一 伙 的 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_HELFEN_08_05"); //如 果 你 准 备 好 了 就 告 诉 我 ， 我 们 一 起 抓 住 那 些 暴 民 。

	MIS_Addon_Cavalorn_KillBrago = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_KillBrago, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KillBrago, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_KillBrago, TOPIC_Addon_KillBrago_1);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info AUSRUESTUNG
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_AUSRUESTUNG(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_AUSRUESTUNG_Condition;
	information		= DIA_Addon_Cavalorn_AUSRUESTUNG_Info;
	description		= "我 需 要 更 好 的 装 备 。";
};

func int DIA_Addon_Cavalorn_AUSRUESTUNG_Condition()
{
	if ((MIS_Addon_Cavalorn_KillBrago != 0)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_AUSRUESTUNG_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_00"); //我 需 要 更 好 的 装 备 。

	if (C_BragoBanditsDead() == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_01"); //那 些 猪 没 给 我 剩 下 什 么 。
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_02"); //我 可 以 给 你 一 把 狼 匕 首 。 那 现 在 够 了 吧 ？
	AI_Output(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_03"); //你 管 那 个 叫 匕 首 ？

	CreateInvItems(self, ItMW_Addon_Knife01, 1);
	B_GiveInvItems(self, other, ItMW_Addon_Knife01, 1);

	AI_Output(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_04"); //但 是 关 于 治 疗 呢 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_AUSRUESTUNG_08_05"); //我 这 里 还 有 两 个 治 疗 药 剂 。 感 兴 趣 吗 ？
	AI_Output(other, self, "DIA_Addon_Cavalorn_AUSRUESTUNG_15_06"); //当 然 。 给 我 。

	CreateInvItems(self, ItPo_Health_01, 2);
	B_GiveInvItems(self, other, ItPo_Health_01, 2);
};

///////////////////////////////////////////////////////////////////////
//	Info LETSKILLBANDITS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_LETSKILLBANDITS(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition;
	information		= DIA_Addon_Cavalorn_LETSKILLBANDITS_Info;
	description		= "让 我 们 狠 狠 教 训 那 些 家 伙 一 下 。";
};

func int DIA_Addon_Cavalorn_LETSKILLBANDITS_Condition()
{
	if ((MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	&& (C_BragoBanditsDead() == FALSE)) // Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_LETSKILLBANDITS_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00"); //让 我 们 狠 狠 教 训 那 些 家 伙 一 下 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01"); //没 问 题 。 只 要 看 好 我 的 身 后 ， 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02"); //现 在 他 们 会 遭 遇 一 次 难 以 应 付 的 突 袭 了 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "KillBandits");

	if (Bdt_1013_Away == FALSE)
	{
		Ambusher_1013.aivar[AIV_EnemyOverride] = FALSE;
	};

	Ambusher_1014.aivar[AIV_EnemyOverride] = FALSE;
	Ambusher_1015.aivar[AIV_EnemyOverride] = FALSE;
};

func void B_Addon_Cavalorn_VatrasBrief()
{
	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_00"); //我 终 于 能 完 成 我 的 任 务 了 ， 我 已 经 损 失 了 不 少 的 时 间 。
		AI_Output(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_01"); //什 么 样 的 任 务 … … ？
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_02"); //（ 自 言 自 语 ） 啊 。 是 的 。 首 先 我 需 要 进 入 城 市 ， 然 后 … …
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_03"); //（ 叹 息 ） 我 不 知 道 怎 么 才 能 及 时 把 所 有 任 务 都 完 成 。
		AI_Output(other, self, "DIA_Addon_Cavalorn_VatrasBrief_15_04"); //（ 冷 淡 的 ） 那 我 怎 么 样 ？
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_05"); //（ 评 价 的 眼 光 ） 嗯 。 为 什 么 不 呢 。 你 可 以 把 这 封 信 送 进 城 里 。
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_06"); //我 就 有 更 多 的 时 间 来 处 理 我 的 装 备 。

	if (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_07"); //一 定 有 某 个 强 盗 把 信 放 在 他 的 口 袋 里 了 。
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_08"); //把 它 送 给 瓦 卓 斯 - 城 里 的 水 法 师 。 你 可 以 在 亚 达 诺 斯 神 殿 里 找 到 他 。 他 整 天 在 那 里 传 道 。
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_09"); //告 诉 他 我 没 有 成 功 。
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_10"); //如 果 他 问 我 在 哪 里 ， 就 说 我 已 经 向 接 头 地 点 前 进 了 ， 好 吗 ？
		B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_7);
	};

	if ((Npc_HasEquippedArmor(other) == FALSE)
	&& (hero.guild == GIL_NONE)
	&& (Mil_310_schonmalreingelassen == FALSE)
	&& (Mil_333_schonmalreingelassen == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_11"); //哦 ， 对 ， 还 有 一 件 事 。 首 先 从 农 民 那 里 买 一 些 象 样 的 衣 服 。
		AI_Output(self, other, "DIA_Addon_Cavalorn_VatrasBrief_08_12"); //否 则 你 会 被 当 成 强 盗 抓 起 来 。 给 你 一 点 钱 。
		CreateInvItems(self, ItMi_Gold, 50);
		B_GiveInvItems(self, other, ItMi_Gold, 50);
	};

	MIS_Addon_Cavalorn_KillBrago = LOG_SUCCESS;

	if (MIS_Addon_Cavalorn_Letter2Vatras == 0)
	{
		MIS_Addon_Cavalorn_Letter2Vatras = LOG_RUNNING;
	};

	Npc_ExchangeRoutine(self, "Start");
	B_GivePlayerXP(XP_Addon_Cavalorn_KillBrago);

	Log_CreateTopic(TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info BragoKilled
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BragoKilled(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_BragoKilled_Condition;
	information		= DIA_Addon_Cavalorn_BragoKilled_Info;
	important		= TRUE;
};

func int DIA_Addon_Cavalorn_BragoKilled_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_XARDAS_BANDITS_LEFT") < 500)
	&& (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING)
	&& (C_BragoBanditsDead() == TRUE)) // Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BragoKilled_Info()
{
	AI_Output(self, other, "DIA_Addon_Cavalorn_BragoKilled_08_00"); //那 就 成 了 。 哈 。 他 们 真 不 应 该 骚 扰 我 。

	B_Addon_Cavalorn_VatrasBrief();
};

///////////////////////////////////////////////////////////////////////
//	Info PCKilledBrago
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_PCKilledBrago(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_PCKilledBrago_Condition;
	information		= DIA_Addon_Cavalorn_PCKilledBrago_Info;
	description		= "强 盗 们 被 解 决 了 。";
};

func int DIA_Addon_Cavalorn_PCKilledBrago_Condition()
{
	if ((MIS_Addon_Cavalorn_KillBrago == 0)
	&& (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Banditen))
	&& (C_BragoBanditsDead() == TRUE)) // Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_PCKilledBrago_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_PCKilledBrago_15_00"); //强 盗 们 被 解 决 了 。

	B_Addon_Cavalorn_VatrasBrief();
};

///////////////////////////////////////////////////////////////////////
//	Info JUNGS
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_JUNGS(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 2;
	condition		= DIA_Addon_Cavalorn_JUNGS_Condition;
	information		= DIA_Addon_Cavalorn_JUNGS_Info;
	description		= "你 穿 的 盔 甲 非 常 有 趣 。";
};

func int DIA_Addon_Cavalorn_JUNGS_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_JUNGS_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_JUNGS_15_00"); //你 穿 的 盔 甲 挺 有 意 思 。 你 现 在 不 再 属 于 ‘ 影 ’ 了 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_JUNGS_08_01"); //‘ 影 ’ ？ 自 从 屏 障 消 失 以 后 ， 他 们 就 不 存 在 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_JUNGS_08_02"); //在 我 们 最 后 可 以 离 开 矿 藏 山 谷 的 时 候 ， 我 没 有 理 由 再 和 他 们 粘 在 一 起 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_JUNGS_08_03"); //现 在 我 为 水 法 师 工 作 。 我 属 于 ‘ 水 之 环 ’ 。

	SC_KnowsRanger = TRUE;

	Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_8);

	Cavalorn_RangerHint = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Ring
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ring(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_Ring_Condition;
	information		= DIA_Addon_Cavalorn_Ring_Info;
	description		= "再 告 诉 我 一 些 关 于 ‘ 水 之 环 ’ 的 事 ！";
};

func int DIA_Addon_Cavalorn_Ring_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ring_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Ring_15_00"); //再 告 诉 我 一 些 关 于 ‘ 水 之 环 ’ 的 事 ！
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ring_08_01"); //其 实 组 织 并 不 允 许 我 谈 论 它 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ring_08_02"); //我 所 能 做 的 就 是 送 你 去 见 瓦 卓 斯 。 他 是 克 霍 里 尼 斯 水 法 师 的 代 表 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ring_08_03"); //最 好 的 方 法 应 该 是 同 他 谈 话 。 告 诉 他 你 从 我 这 里 来 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ring_08_04"); //也 许 他 会 接 纳 你 成 为 我 们 的 一 员 。 我 们 迫 切 需 要 更 多 的 好 人 … …
	B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_9);
};

///////////////////////////////////////////////////////////////////////
//	Gegner
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Feinde(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 6;
	condition		= DIA_Addon_Cavalorn_Feinde_Condition;
	information		= DIA_Addon_Cavalorn_Feinde_Info;
	description		= "那 么 你 和 你 的 人 是 不 是 水 法 师 的 敌 人 ？";
};

func int DIA_Addon_Cavalorn_Feinde_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_JUNGS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Feinde_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Feinde_15_00"); //那 么 你 和 你 的 人 是 不 是 水 法 师 的 敌 人 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_Feinde_08_01"); //那 些 疯 狂 的 旧 日 子 结 束 了 。 不 再 有 什 么 ‘ 新 营 地 ’ 或 者 ‘ 旧 营 地 ’ 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Feinde_08_02"); //现 在 那 个 罪 犯 流 放 地 已 经 不 存 在 了 ， 所 有 人 都 自 由 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Feinde_08_03"); //大 多 数 我 们 这 些 以 前 的 囚 犯 还 在 被 追 捕 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Feinde_08_04"); //水 法 师 减 轻 了 我 的 刑 期 ， 现 在 我 可 以 自 由 行 动 了 。
};

///////////////////////////////////////////////////////////////////////
//	Wo KdW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_KdWTask(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 6;
	condition		= DIA_Addon_Cavalorn_KdWTask_Condition;
	information		= DIA_Addon_Cavalorn_KdWTask_Info;
	description		= "水 法 师 现 在 在 做 什 么 ？";
};

func int DIA_Addon_Cavalorn_KdWTask_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_JUNGS))
	&& (MIS_Addon_Nefarius_BringMissingOrnaments == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_KdWTask_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_KdWTask_15_00"); //水 法 师 现 在 在 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_KdWTask_08_01"); //他 们 在 忙 于 一 件 大 事 。 应 该 是 关 于 这 个 岛 上 一 个 未 知 的 区 域 。
	AI_Output(other, self, "DIA_Addon_Cavalorn_KdWTask_15_02"); //一 个 未 知 区 域 ？ 那 它 可 能 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_KdWTask_08_03"); //我 不 能 再 告 诉 你 了 。 去 和 克 霍 里 尼 斯 的 瓦 卓 斯 谈 谈 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info BroughtLetter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_BroughtLetter(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_BroughtLetter_Condition;
	information		= DIA_Addon_Cavalorn_BroughtLetter_Info;
	description		= "我 把 你 的 信 交 给 瓦 卓 斯 了 。";
};

func int DIA_Addon_Cavalorn_BroughtLetter_Condition()
{
	if ((MIS_Addon_Cavalorn_Letter2Vatras == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_JUNGS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_BroughtLetter_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_BroughtLetter_15_00"); //我 把 你 的 信 交 给 瓦 卓 斯 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_BroughtLetter_08_01"); //我 没 指 望 任 何 其 它 的 事 情 ，谢 谢。
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Ornament(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 2;
	condition		= DIA_Addon_Cavalorn_Ornament_Condition;
	information		= DIA_Addon_Cavalorn_Ornament_Info;
	description		= "你 在 找 什 么 东 西 吗 ？";
};

func int DIA_Addon_Cavalorn_Ornament_Condition()
{
	if ((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_HALLO)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Ornament_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Ornament_15_00"); //你 在 找 什 么 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_01"); //那 很 明 显 ？ 是 的 ， 我 正 在 执 行 水 法 师 交 给 我 的 任 务 ， 寻 找 一 些 失 踪 的 装 饰 物 。
	AI_Output(other, self, "DIA_Addon_Cavalorn_Ornament_15_02"); //那 很 合 理 。 我 也 从 内 法 利 尔 斯 那 得 到 了 同 样 的 任 务 。

	if (SC_KnowsRanger == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_03"); //那 么 你 属 于 ‘ 水 之 环 ’ 了 ？
		if (SC_IsRanger == TRUE)
		{
			AI_Output(other, self, "DIA_Addon_Cavalorn_Ornament_15_04"); //是 的 。
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Cavalorn_Ornament_15_05"); //还 没 有 ， 不 过 我 为 它 工 作 。
		};
	};

	AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_06"); //我 很 高 兴 。 那 么 我 不 用 独 自 做 这 个 任 务 了 。
	AI_Output(other, self, "DIA_Addon_Cavalorn_Ornament_15_07"); //你 已 经 找 到 了 一 个 装 饰 物 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_08"); //我 发 现 了 一 个 地 方 ， 我 们 应 该 能 在 那 里 找 到 一 个 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_09"); //这 个 石 环 应 该 就 是 内 法 利 尔 斯 描 述 的 那 种 建 筑 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Ornament_08_10"); //现 在 我 们 只 要 找 到 那 个 要 找 的 机 关 。
};

///////////////////////////////////////////////////////////////////////
//	Info Triggered
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_Triggered(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_Triggered_Condition;
	information		= DIA_Addon_Cavalorn_Triggered_Info;
	description		= "我 打 开 了 这 个 机 关 。";
};

func int DIA_Addon_Cavalorn_Triggered_Condition()
{
	if ((MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Ornament))
	&& (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_Triggered_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_Triggered_15_00"); //我 试 了 那 个 机 关 ， 但 是 不 起 任 何 作 用 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_08_01"); //那 么 洛 拔 特 的 农 民 说 的 是 对 的 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_08_02"); //他 们 说 ， 他 们 之 间 有 人 已 经 使 用 过 了 这 里 的 机关 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_08_03"); //一 个 石 头 哨 兵 不 知 道 从 哪 里 蹦 了 出 来 ， 并 攻 击 了他们。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_08_04"); //农 民 们 喊 来 了 民 兵 ， 民 兵 又 喊 来 了 圣 骑 士 ， 他 们 把 那 个 怪 物 消 灭 了 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_08_05"); //我 已 经 搜 索 了 整 个 地 区 。 如 果 这 里 有 一 个 饰品 的 话 ， 也 一 定 被 圣 骑 士 拿 走 了 。

	Info_ClearChoices(DIA_Addon_Cavalorn_Triggered);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered, "那 么 我 们 中 已 经 有 人 进 入 了 城 市 的 富 人 区 。", DIA_Addon_Cavalorn_Triggered_Pal);
	Info_AddChoice(DIA_Addon_Cavalorn_Triggered, "那 么 我 去 找 他 们 ， 并 把 饰品 拿 回 来 。", DIA_Addon_Cavalorn_Triggered_OBack);
};

func void B_Cavalorn_Triggered_Wohin()
{
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_Wohin_08_00"); //我 现 在 去 城 市 我 们 将 在 瓦 卓 斯 那 里 再 见 面 。
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Stadt");

	Log_CreateTopic(TOPIC_Addon_Ornament, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Ornament, TOPIC_Addon_Ornament_5);

	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_RUNNING;
	self.flags = 0;
};

func void DIA_Addon_Cavalorn_Triggered_OBack()
{
	AI_UnequipArmor(self);
	CreateInvItems(self, ITAR_BAU_L, 1);
	Npc_RemoveInvItems(self, ITAR_RANGER_Addon, Npc_HasItems(self, ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self, ITAR_Fake_RANGER, Npc_HasItems(self, ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other, self, "DIA_Addon_Cavalorn_Triggered_OBack_15_00"); //那 么 我 去 找 他 们 ， 并 把 饰品 拿 回 来 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_OBack_08_01"); //好 吧 。
	B_Cavalorn_Triggered_Wohin();
};

func void DIA_Addon_Cavalorn_Triggered_Pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self, ITAR_BAU_L, 1);
	Npc_RemoveInvItems(self, ITAR_RANGER_Addon, Npc_HasItems(self, ITAR_RANGER_Addon));
	Npc_RemoveInvItems(self, ITAR_Fake_RANGER, Npc_HasItems(self, ITAR_Fake_RANGER));
	AI_EquipBestArmor(self);
	AI_Output(other, self, "DIA_Addon_Cavalorn_Triggered_Pal_15_00"); //那 么 我 们 中 已 经 有 人 进 入 了 城 市 的 富 人 区 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_Triggered_Pal_08_01"); //我 没 时 间 ， 你 必 须 去 完 成 它 。
	B_Cavalorn_Triggered_Wohin();
};

///////////////////////////////////////////////////////////////////////
//	Info GotOrnaFromHagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cavalorn_GotOrnaFromHagen(C_INFO)
{
	npc				= Bau_4300_Addon_Cavalorn;
	nr				= 5;
	condition		= DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition;
	information		= DIA_Addon_Cavalorn_GotOrnaFromHagen_Info;
	description		= "我 从 哈 根 勋 爵 身 上 得 到 了 失 踪 的饰品。";
};

func int DIA_Addon_Cavalorn_GotOrnaFromHagen_Condition()
{
	if (Lord_Hagen_GotOrnament == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_GotOrnaFromHagen_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00"); //我 从 哈 根 勋 爵 身 上 得 到 了 失 踪 的 饰品 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01"); //你 明 白 吗 ？ 我 想 圣 骑 士 得 到 了 它 。
	B_GivePlayerXP(XP_Ambient);
	MIS_Addon_Cavalorn_GetOrnamentFromPAL = LOG_SUCCESS;
};

// ************************************************************
// 			  				WannaLearn
// ************************************************************
instance DIA_Addon_Cavalorn_WannaLearn(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 7;
	condition		= DIA_Addon_Cavalorn_WannaLearn_Condition;
	information		= DIA_Addon_Cavalorn_WannaLearn_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Addon_Cavalorn_WannaLearn_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Cavalorn_Hallo))
	&& (C_BragoBanditsDead() == TRUE)) // Joly:VORSICHT!!!!!muss als letztes Stehen
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_WannaLearn_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_WannaLearn_15_00"); //你 能 教 我 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_Cavalorn_WannaLearn_08_01"); //真 的 ， 你 知 道 的 。 老 兄 ， 他 们 真 的 拿 走 了 你 不 少 东 西 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_WannaLearn_08_02"); //你 根 本 记 不 起 任 何 事 情 ， 是 吗 ？

	Cavalorn_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher, LOG_NOTE);
	B_LogEntry(Topic_OutTeacher, LogText_Addon_Cavalorn_Teach);
};

// ************************************************************
// 			  				TEACH
// ************************************************************
var int Addon_Cavalorn_Merke_Bow;
var int Addon_Cavalorn_Merke_1h;
// ------------------------------------------------------
instance DIA_Addon_Cavalorn_TEACH(C_INFO)
{
	npc				= BAU_4300_Addon_Cavalorn;
	nr				= 8;
	condition		= DIA_Addon_Cavalorn_TEACH_Condition;
	information		= DIA_Addon_Cavalorn_TEACH_Info;
	permanent		= TRUE;
	description		= "我 想 学 习 你 的 技 能 。";
};

func int DIA_Addon_Cavalorn_TEACH_Condition()
{
	if (Cavalorn_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Cavalorn_TEACH_Choices()
{
	Info_ClearChoices(DIA_Addon_Cavalorn_Teach);
	Info_AddChoice(DIA_Addon_Cavalorn_Teach, DIALOG_BACK, DIA_Addon_Cavalorn_Teach_Back);

	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE)
	{
//#if zpe
//		Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(TXT_TALENTS[NPC_TALENT_SNEAK], B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Addon_Cavalorn_Teach_Sneak);
//#else
		Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(NAME_TALENT_SNEAK, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Addon_Cavalorn_Teach_Sneak);
//#endif
	};

	Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Addon_Cavalorn_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1) * 5), DIA_Addon_Cavalorn_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1)), DIA_Addon_Cavalorn_Teach_1H_1);
	Info_AddChoice(DIA_Addon_Cavalorn_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1) * 5), DIA_Addon_Cavalorn_Teach_1H_5);
};

func void DIA_Addon_Cavalorn_TEACH_Info()
{
	AI_Output(other, self, "DIA_Addon_Cavalorn_TEACH_15_00"); //我 想 学 习 你 的 技 能 。
	AI_Output(self, other, "DIA_Addon_Cavalorn_TEACH_08_01"); //当 然 。 你 想 知 道 什 么

	Addon_Cavalorn_Merke_Bow = other.HitChance[NPC_TALENT_BOW];
	Addon_Cavalorn_Merke_1h = other.HitChance[NPC_TALENT_1H];

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Sneak()
{
	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_Teach_Sneak_08_00"); //有 了 柔 软 的 鞋 底 ， 你 可 以 更 加 靠 近 你 的 对 手 而 不 惊 动 他 们 。
	};

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 90);

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 90);

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 1, 30);

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_1H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_1H, 5, 30);

	DIA_Addon_Cavalorn_TEACH_Choices();
};

func void DIA_Addon_Cavalorn_Teach_Back()
{
	if ((Addon_Cavalorn_Merke_Bow < other.HitChance[NPC_TALENT_BOW])
	|| (Addon_Cavalorn_Merke_1h < other.HitChance[NPC_TALENT_1H]))
	{
		AI_Output(self, other, "DIA_Addon_Cavalorn_Teach_BACK_08_00"); //那 好 多 了 。 从 那 时 起 ， 你 已 经 忘 记 了 很 多 ， 不 过 我 们 会 把 它 找 回 来 。
	};

	Info_ClearChoices(DIA_Addon_Cavalorn_Teach);
};
