///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_EXIT(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 999;
	condition		= DIA_Jora_EXIT_Condition;
	information		= DIA_Jora_EXIT_Info;
	permanent		= TRUE;
	description		= "我 必 须 走 了 ！( 结 束 )";
};

func int DIA_Jora_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jora_EXIT_Info()
{
	if (((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS))
	&& (Jora_Gold == LOG_RUNNING))
	{
		AI_Output(self, other, "DIA_Jora_EXIT_08_00"); //嗨 ！ 我 的 钱 怎 么 样 了 ？
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Sperre
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_Sperre(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 2;
	condition		= DIA_Jora_Sperre_Condition;
	information		= DIA_Jora_Sperre_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Jora_Sperre_Condition()
{
	if ((Canthar_Sperre == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Jora_Sperre_Info()
{
	AI_Output(self, other, "DIA_Jora_Sperre_08_00"); //你 是 从 矿 坑 流 放 地 来 的 罪 犯 。 我 不 会 卖 任 何 东 西 给 你 的 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WAREZ
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_WAREZ(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 700;
	condition		= DIA_Jora_WAREZ_Condition;
	information		= DIA_Jora_WAREZ_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Jora_WAREZ_Condition()
{
	return TRUE;
};

func void DIA_Jora_WAREZ_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Jora_WAREZ_15_00"); //让 我 看 看 你 的 货 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Jora_GREET(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 1;
	condition		= DIA_Jora_GREET_Condition;
	information		= DIA_Jora_GREET_Info;
	important		= TRUE;
};

func int DIA_Jora_GREET_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (Canthar_Sperre == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GREET_Info()
{
	AI_Output(self, other, "DIA_Jora_GREET_08_00"); //英 诺 斯 与 你 同 在 ， 陌 生 人 。 如 果 你 在 寻 找 为 旅 行 者 提 供 的 优 良 装 备 的 话 ， 你 就 来 对 了 地 方 。
	AI_Output(self, other, "DIA_Jora_GREET_08_01"); //不 过 ， 我 警 告 你 ： 如 果 你 想 不 付 钱 就 随 便 拿 东 西 的 话 ， 我 就 会 叫 城 里 的 守 卫 来 ！
	AI_Output(other, self, "DIA_Jora_GREET_15_02"); //等 一 下 ， 我 看 起 来 象 个 贼 吗 ？
	AI_Output(self, other, "DIA_Jora_GREET_08_03"); //（ 轻 蔑 的 ） 呸 ！ 你 不 是 今 天 第 一 个 在 我 这 里 拿 了 东 西 就 跑 的 人 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_7);
};

// *******************************************************
// 					Du bestohlen?
// *******************************************************
instance DIA_Jora_Bestohlen(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 1;
	condition		= DIA_Jora_Bestohlen_Condition;
	information		= DIA_Jora_Bestohlen_Info;
	description		= "有 人 偷 了 你 的 东 西 ？";
};

func int DIA_Jora_Bestohlen_Condition()
{
	return TRUE;
};

func void DIA_Jora_Bestohlen_Info()
{
	AI_Output(other, self, "DIA_Jora_Bestohlen_15_00"); //有 人 偷 了 你 的 东 西 ？
	AI_Output(self, other, "DIA_Jora_Bestohlen_08_01"); //我 无 法 证 明 。 那 个 家 伙 真 的 狡 猾 。 他 说 他 叫 伦 加 鲁 - 如 果 他 真 的 叫 这 个 名 字 的 话 。
	AI_Output(self, other, "DIA_Jora_Bestohlen_08_02"); //最 近 这 几 天 ， 他 一 直 在 市 场 周 围 闲 逛 。
	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self, other, "DIA_Jora_Bestohlen_08_03"); //而 且 每 天 晚 上 他 都 在 街 上 那 个 啤 酒 铺 子 里 喝 得 醉 醺 醺 的 。 我 打 赌 ， 那 个 混 蛋 正 在 用 我 的 钱 喝 着 酒 ！
	};

	AI_Output(self, other, "DIA_Jora_Bestohlen_08_04"); //我 只 一 转 脸 ， 我 的 钱 包 就 不 见 了 ！
};

// ******************
// B_Jora_GoldForClue
// ******************

func void B_Jora_GoldForClue()
{
	AI_Output(self, other, "DIA_Jora_Add_08_04"); //听 着 - 如 果 你 从 那 个 叫 伦 加 鲁 的 家 伙 那 里 拿 回 了 我 的 钱 ， 我 就 告 诉 你 我 知 道 所 有 事 请 。
};

// *******************************************************
// 					Ich hol dir dein Gold
// *******************************************************
instance DIA_Jora_HolDeinGold(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 1;
	condition		= DIA_Jora_HolDeinGold_Condition;
	information		= DIA_Jora_HolDeinGold_Info;
	description		= "我 可 以 把 你 的 钱 找 回 来 。";
};

func int DIA_Jora_HolDeinGold_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Jora_Bestohlen))
	{
		return TRUE;
	};
};

func void DIA_Jora_HolDeinGold_Info()
{
	AI_Output(other, self, "DIA_Jora_HolDeinGold_15_00"); //我 可 以 把 你 的 钱 找 回 来 。
	AI_Output(self, other, "DIA_Jora_HolDeinGold_08_01"); //（ 不 信 任 的 ） 哦 ？ 那 你 为 什 么 要 那 么 做 ？

	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, "我 想 要 一 部 分 金 币 作 为 回 报 ！", DIA_Jora_HolDeinGold_WillBelohnung);
	if (Mis_Andre_GuildOfThieves == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Jora_HolDeinGold, "我 在 寻 找 盗 贼 行 会 的 线 索 ！", DIA_Jora_HolDeinGold_GHDG);
	};

	if ((other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE))
	{
		Info_AddChoice(DIA_Jora_HolDeinGold, "那 要 看 - 你 能 帮 我 进 入 富 人 区 吗 ？", DIA_Jora_HolDeinGold_ToOV);
	};
};

func void DIA_Jora_HolDeinGold_ToOV()
{
	AI_Output(other, self, "DIA_Jora_Add_15_00"); //那 要 看 - 你 能 帮 我 进 入 富 人 区 吗 ？
	AI_Output(self, other, "DIA_Jora_HolDeinGold_08_03"); //（ 大 笑 ） 你 找 错 了 人 。 我 从 城 外 来 - 像 市 场 里 大 部 分 商 人 一 样 。
	AI_Output(self, other, "DIA_Jora_Add_08_01"); //如 果 你 想 进 入 富 人 区 ， 去 城 里 的 贫 民 区 找 那 里 的 常 住 商 人 谈 谈 。
};

func void DIA_Jora_HolDeinGold_GHDG()
{
	AI_Output(other, self, "DIA_Jora_Add_15_02"); //我 在 寻 找 盗 贼 行 会 的 线 索 ！
	AI_Output(self, other, "DIA_Jora_Add_08_03"); //我 肯 定 也 能 帮 助 你 。
	B_Jora_GoldForClue();

	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, "我 要 看 看 我 能 做 什 么 。", DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold, "那 个 钱 包 里 面 有 多 少 金 币 ？", DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold, "你 为 什 么 不 喊 城 市 守 卫 ？", DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_WillBelohnung()
{
	AI_Output(other, self, "DIA_Jora_HolDeinGold_WillBelohnung_15_00"); //我 想 要 一 部 分 金 币 作 为 回 报 ！
	AI_Output(self, other, "DIA_Jora_HolDeinGold_WillBelohnung_08_01"); //先 看 看 你 能 不 能 把 我 的 钱 包 拿 回 来 。 然 后 ， 我 们 再 谈 你 的 报 酬 ！
	Info_ClearChoices(DIA_Jora_HolDeinGold);
	Info_AddChoice(DIA_Jora_HolDeinGold, "我 要 看 看 我 能 做 什 么 。", DIA_Jora_HolDeinGold_DoIt);
	Info_AddChoice(DIA_Jora_HolDeinGold, "那 个 钱 包 里 面 有 多 少 金 币 ？", DIA_Jora_HolDeinGold_HowMuch);
	Info_AddChoice(DIA_Jora_HolDeinGold, "你 为 什 么 不 喊 城 市 守 卫 ？", DIA_Jora_HolDeinGold_Wache);
};

func void DIA_Jora_HolDeinGold_Wache()
{
	AI_Output(other, self, "DIA_Jora_HolDeinGold_Wache_15_00"); //你 为 什 么 不 喊 城 市 守 卫 ？
	AI_Output(self, other, "DIA_Jora_HolDeinGold_Wache_08_01"); //只 有 当 小 偷 被 当 场 发 现 时 ， 守 卫 才 会 作 出 回 应 。
	AI_Output(self, other, "DIA_Jora_HolDeinGold_Wache_08_02"); //当 我 发 现 我 的 钱 包 不 见 了 时 ， 那 个 混 蛋 已 经 跑 了 ！
};

func void DIA_Jora_HolDeinGold_HowMuch()
{
	AI_Output(other, self, "DIA_Jora_HolDeinGold_HowMuch_15_00"); //那 个 钱 包 里 面 有 多 少 金 币 ？
	AI_Output(self, other, "DIA_Jora_HolDeinGold_HowMuch_08_01"); //50个 金 币 - 在 这 种 艰 难 的 时 候 这 已 经 是 非 常 多 了 !
};

func void DIA_Jora_HolDeinGold_DoIt()
{
	AI_Output(other, self, "DIA_Jora_HolDeinGold_DoIt_15_00"); //我 要 看 看 我 能 做 什 么 。
	AI_Output(self, other, "DIA_Jora_HolDeinGold_DoIt_08_01"); //小 心 点 ！ 如 果 你 只 是 打 倒 那 个 混 蛋 ， 城 里 的 守 卫 就 会 来 干 预 。
	AI_Output(self, other, "DIA_Jora_HolDeinGold_DoIt_08_02"); //近 来 ， 这 里 的 事 态 变 得 越 来 越 糟 。 自 从 那 些 圣 骑 士 来 到 城 里 ， 守 卫 们 就 一 直 对 打 架 斗 殴 严 厉 惩 处 。
	AI_Output(self, other, "DIA_Jora_HolDeinGold_DoIt_08_03"); //所 以 ， 当 心 点 … …
	AI_Output(other, self, "DIA_Jora_HolDeinGold_DoIt_15_04"); //我 会 的 。

	Jora_Dieb = LOG_RUNNING;
	Jora_Gold = LOG_RUNNING;

	Log_CreateTopic(Topic_JoraDieb, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JoraDieb, LOG_RUNNING);
	Log_CreateTopic(TOPIC_Jora, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Jora, LOG_RUNNING);

	B_LogEntry(TOPIC_Jora, TOPIC_Jora_1);
	Log_AddEntry(TOPIC_Jora, TOPIC_Jora_2);
	Log_AddEntry(TOPIC_JoraDieb, TOPIC_JoraDieb_1);

	Info_ClearChoices(DIA_Jora_HolDeinGold);
};

// *******************************************************
// 					Wegen Dieb...
// *******************************************************
instance DIA_Jora_WegenDieb(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 2;
	condition		= DIA_Jora_WegenDieb_Condition;
	information		= DIA_Jora_WegenDieb_Info;
	permanent		= TRUE;
	description		= "关 于 盗 贼 … … ";
};

func int DIA_Jora_WegenDieb_Condition()
{
	if (Jora_Dieb == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Jora_WegenDieb_Info()
{
	AI_Output(other, self, "DIA_Jora_WegenDieb_15_00"); //关 于 盗 贼 … …
	AI_Output(self, other, "DIA_Jora_WegenDieb_08_01"); //是 的 ， 事 情 怎 么 样 了 ？ 你 抓 住 他 了 吗 - 还 有 更 重 要 的 事 - 你 拿 到 了 我 的 钱 吗 ？

	Info_ClearChoices(DIA_Jora_WegenDieb);

	if (Npc_IsDead(Rengaru))
	{
		Info_AddChoice(DIA_Jora_WegenDieb, "嗯 ， 他 遇 到 了 一 个 致 命 事 件 。", DIA_Jora_WegenDieb_Tot);
	}
	else if (Rengaru_InKnast == TRUE)
	{
		Info_AddChoice(DIA_Jora_WegenDieb, "是 的 ， 我 已 经 抓 住 了 他 。", DIA_Jora_WegenDieb_ImKnast);
	}
	else if (Npc_KnowsInfo(other, DIA_Rengaru_HALLODIEB))
	{
		Info_AddChoice(DIA_Jora_WegenDieb, "他 从 我 这 里 逃 走 了 。", DIA_Jora_WegenDieb_Entkommen);
	};

	Info_AddChoice(DIA_Jora_WegenDieb, "我 还 在 找 ！", DIA_Jora_WegenDieb_Continue);
};

func void DIA_Jora_WegenDieb_Continue()
{
	AI_Output(other, self, "DIA_Jora_WegenDieb_Continue_15_00"); //我 还 在 找 ！
	AI_Output(self, other, "DIA_Jora_WegenDieb_Continue_08_01"); //那 就 等 你 拿 回 我 的 钱 吧 ！
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Entkommen()
{
	AI_Output(other, self, "DIA_Jora_WegenDieb_Entkommen_15_00"); //他 从 我 这 里 逃 走 了 。
	AI_Output(self, other, "DIA_Jora_WegenDieb_Entkommen_08_01"); //我 的 钱 怎 么 样 了 ？ 他 把 它 花 光 了 吗 ？
	Jora_Dieb = LOG_FAILED;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_ImKnast()
{
	AI_Output(other, self, "DIA_Jora_WegenDieb_ImKnast_15_00"); //是 的 ， 毫 无 疑 问 ， 我 抓 住 了 他 。 他 将 要 在 监 狱 里 呆 一 段 时 间 了 。
	AI_Output(self, other, "DIA_Jora_WegenDieb_ImKnast_08_01"); //我 的 钱 怎 么 样 了 ？
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

func void DIA_Jora_WegenDieb_Tot()
{
	AI_Output(other, self, "DIA_Jora_WegenDieb_Tot_15_00"); //嗯 ， 他 遇 到 了 一 个 致 命 事 件 。
	AI_Output(self, other, "DIA_Jora_WegenDieb_Tot_08_01"); //那 至 少 他 不 能 从 别 人 那 里 偷 东 西 了 ！ 英 诺 斯 的 正 义 取 得 了 胜 利 。
	AI_Output(self, other, "DIA_Jora_WegenDieb_Tot_08_02"); //我 的 钱 在 哪 里 ？
	Jora_Dieb = LOG_SUCCESS;
	B_CheckLog();
	Info_ClearChoices(DIA_Jora_WegenDieb);
};

// *******************************************************
// 					Gold zurückbringen
// *******************************************************
instance DIA_Jora_BringGold(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 2;
	condition		= DIA_Jora_BringGold_Condition;
	information		= DIA_Jora_BringGold_Info;
	permanent		= TRUE;
	description		= "这 是 他 偷 你 的 ５ ０ 金 币 。";
};

func int DIA_Jora_BringGold_Condition()
{
	if (((Jora_Dieb == LOG_FAILED) || (Jora_Dieb == LOG_SUCCESS))
	&& (Jora_Gold == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Jora_BringGold_Info()
{
	AI_Output(other, self, "DIA_Jora_BringGold_15_00"); //这 是 他 偷 你 的 ５ ０ 金 币 。

	if (B_GiveInvItems(other, self, itmi_gold, 50))
	{
		AI_Output(self, other, "DIA_Jora_BringGold_08_01"); //赞 美 英 诺 斯 ！ 这 个 城 里 仍 然 有 正 义 。

		Jora_Gold = LOG_SUCCESS;
		B_GivePlayerXP(XP_Jora_Gold);
	}
	else
	{
		AI_Output(self, other, "DIA_Jora_BringGold_08_03"); //嘿 ， 这 不 是50个 金 币 ！ 你 也 想 偷 我 的 东 西 吗 ？
	};
};

// *******************************************************
// 					GHDG Info
// *******************************************************

var int Jora_GhdgHinweis;
// ----------------------
instance DIA_Jora_GHDgInfo(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 2;
	condition		= DIA_Jora_GHDgInfo_Condition;
	information		= DIA_Jora_GHDgInfo_Info;
	permanent		= TRUE;
	description		= "你 知 道 什 么 关 于 盗 贼 行 会 事 ？";
};

func int DIA_Jora_GHDgInfo_Condition()
{
	if ((Mis_Andre_GuildOfThieves == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Jora_Bestohlen))
	&& (Jora_GhdgHinweis == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jora_GHDgInfo_Info()
{
	AI_Output(other, self, "DIA_Jora_Add_15_05"); //你 知 道 什 么 关 于 盗 贼 行 会 事 ？
	if (Jora_Gold != LOG_SUCCESS)
	{
		B_Jora_GoldForClue();
	}
	else
	{
		AI_Output(self, other, "DIA_Jora_Add_08_06"); //对 了 - 听 好 了 - 你 从 来 没 听 到 过 我 准 备 告 诉 你 的 事 情 ， 明 白 吗 ？
		AI_Output(self, other, "DIA_Jora_Add_08_07"); //有 一 些 可 疑 的 人 物 经 常 频 繁 地 出 入 码 头 边 上 那 家 酒 馆 。
		AI_Output(self, other, "DIA_Jora_Add_08_08"); //我 打 赌 那 个 店 主 知 道 一 两 件 事 情 … …
		AI_Output(self, other, "DIA_Jora_Add_08_09"); //如 果 你 计 划 去 抓 捕 那 些 小 偷 ， 你 就 应 该 去 跟 他 谈 谈 。
		AI_Output(self, other, "DIA_Jora_Add_08_10"); //比 如 说 ， 你 可 以 假 装 想 图 谋 一 笔 不 义 之 财 。 也 许 他 会 掉 进 你 的 陷 阱 。
		AI_Output(self, other, "DIA_Jora_Add_08_11"); //不 过 要 非 常 小 心 。 那 些 人 可 不 是 闹 着 玩 的 。

		Jora_GhdgHinweis = TRUE;
	};
};

// *******************************************************
// 						Belohnung
// *******************************************************
instance DIA_Jora_Belohnung(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 1;
	condition		= DIA_Jora_Belohnung_Condition;
	information		= DIA_Jora_Belohnung_Info;
	description		= "我 想 要 一 部 分 金 币 作 为 回 报 ！";
};

func int DIA_Jora_Belohnung_Condition()
{
	if (Jora_Gold == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Jora_Belohnung_Info()
{
	AI_Output(other, self, "DIA_Jora_Belohnung_15_00"); //我 想 要 一 部 分 金 币 作 为 回 报 ！
	if (Jora_GhdgHinweis == TRUE)
	{
		AI_Output(self, other, "DIA_Jora_Add_08_12"); //但 是 ， 我 已 经 给 了 你 一 条 珍 贵 的 线 索 。
		AI_Output(self, other, "DIA_Jora_Add_08_13"); //那 应 该 足 够 作 为 你 的 报 酬 了 。
	};

	AI_Output(self, other, "DIA_Jora_Add_08_14"); //如 果 你 想 要 的 是 金 子 ， 那 就 去 抓 几 个 贼 到 安 德 烈 勋 爵 那 里 领 赏 。

	if (Npc_GetDistToWP(self, "NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self, other, "DIA_Jora_Belohnung_08_03"); //现 在 ， 我 必 须 回 去 招 呼 我 的 客 户 了 … …
	};

	AI_StopProcessInfos(self);
};

// *****************************************************
// 				Nach Alriks Schwert fragen
// *****************************************************
instance DIA_Jora_AlriksSchwert(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 1;
	condition		= DIA_Jora_AlriksSchwert_Condition;
	information		= DIA_Jora_AlriksSchwert_Info;
	description		= "艾 尔 里 克 说 你 拿 了 他 的 剑 … …";
};

func int DIA_Jora_AlriksSchwert_Condition()
{
	if (MIS_Alrik_Sword == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Jora_AlriksSchwert_Info()
{
	AI_Output(other, self, "DIA_Jora_AlriksSchwert_15_00"); //艾 尔 里 克 说 你 拿 了 他 的 剑 … …
	AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_01"); //你 是 说 那 个 为 了 几 个 火 把 和 几 块 肉 就 把 武 器 卖 给 我 的 衣 衫 褴 褛 的 家 伙 ？
	AI_Output(other, self, "DIA_Jora_AlriksSchwert_15_02"); //就 是 他 。

	if (Npc_HasItems(self, ItMw_AlriksSword_Mis) > 0)
	{
		AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_03"); //剑 还 在 我 这 里 。
		AI_Output(other, self, "DIA_Jora_AlriksSchwert_15_04"); //你 想 要 多 少 钱 作 为 回 报 ？
		if (Jora_Gold == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_05"); //好 吧 - 对 于 你 … …
			AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_06"); //啊 ， 那 又 怎 么 样 ！ 给 ， 把 它 拿 走 吧 。 总 之 ， 你 还 是 帮 我 把 钱 拿 回 来 了 … …
			B_GiveInvItems(self, other, ItMw_AlriksSword_Mis, 1);
		}
		else
		{
			AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_07"); //好 吧 - 给 你 - 5 0个 金 币 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Jora_AlriksSchwert_08_08"); //（ 暴 躁 的 ） 它 不 在 我 这 里 了 ！ 鬼 才 知 道 那 个 东 西 现 在 在 哪 里 。
	};
};

// *****************************************************
// 				Alriks Schwert KAUFEN
// *****************************************************
instance DIA_Jora_BUYAlriksSchwert(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 2;
	condition		= DIA_Jora_BUYAlriksSchwert_Condition;
	information		= DIA_Jora_BUYAlriksSchwert_Info;
	permanent		= TRUE;
	description		= "这 是 ５ ０ 枚 金 币 。 然 后 把 艾 尔 里 克 的 剑 给 我。";
};

func int DIA_Jora_BUYAlriksSchwert_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Jora_AlriksSchwert))
	&& (Npc_HasItems(self, ItMw_AlriksSword_Mis) > 0))
	{
		return TRUE;
	};
};

func void DIA_Jora_BUYAlriksSchwert_Info()
{
	AI_Output(other, self, "DIA_Jora_BUYAlriksSchwert_15_00"); //这 是 ５ ０ 枚 金 币 。 然 后 把 艾 尔 里 克 的 剑 给 我 。

	if (B_GiveInvItems(other, self, itmi_gold, 50))
	{
		// if(Jora_Gold == LOG_RUNNING)
		// {
		// AI_Output(other, self, "DIA_Jora_BUYAlriksSchwert_15_02"); // Moment, ich wollte das Schwert kaufen...
		// AI_Output(self, other, "DIA_Jora_BUYAlriksSchwert_08_03"); // Das kannst du doch immer noch tun - für 50 Goldstücke ist es deins...
		// Jora_Gold = LOG_SUCCESS;
		// }
		// else
		// {
		AI_Output(self, other, "DIA_Jora_BUYAlriksSchwert_08_04"); //给 你 吧 - （ 诡 诈 的 ） 那 是 一 笔 不 错 的 买 卖 。
		B_GiveInvItems(self, other, ItMw_AlriksSword_Mis, 1);
		// };
	}
	else
	{
		AI_Output(self, other, "DIA_Jora_BUYAlriksSchwert_08_05"); //你 没 有 足 够 的 钱 。 不 过 别 担 心 - 我 会 把 这 把 剑 保 留 一 段 时 间 。 以 后 再 来 ， 那 时 … …
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Jora_PICKPOCKET(C_INFO)
{
	npc				= VLK_408_Jora;
	nr				= 900;
	condition		= DIA_Jora_PICKPOCKET_Condition;
	information		= DIA_Jora_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Jora_PICKPOCKET_Condition()
{
	C_Beklauen(31, 45);
};

func void DIA_Jora_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
	Info_AddChoice(DIA_Jora_PICKPOCKET, DIALOG_BACK, DIA_Jora_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jora_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Jora_PICKPOCKET_DoIt);
};

func void DIA_Jora_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};

func void DIA_Jora_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jora_PICKPOCKET);
};
