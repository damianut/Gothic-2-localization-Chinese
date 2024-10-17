// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Hanna_EXIT(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 999;
	condition		= DIA_Hanna_EXIT_Condition;
	information		= DIA_Hanna_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hanna_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Hanna_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Hanna_Hello(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 1;
	condition		= DIA_Hanna_Hello_Condition;
	information		= DIA_Hanna_Hello_Info;
	important		= TRUE;
};

func int DIA_Hanna_Hello_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Hello_Info()
{
	AI_Output(self, other, "DIA_Hanna_Hello_17_00"); //哈 ， 一 个 客 户 - 我 能 为 你 做 些 什 么 ？
};

//*****************************************
//	Ich suche ein Zimmer
//*****************************************
instance DIA_Hanna_Room(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 2;
	condition		= DIA_Hanna_Room_Condition;
	information		= DIA_Hanna_Room_Info;
	description		= "我 想 找 个 房 间 。";
};

func int DIA_Hanna_Room_Condition()
{
	return TRUE;
};

func void DIA_Hanna_Room_Info()
{
	AI_Output(other, self, "DIA_Hanna_Room_15_00"); //我 想 找 个 房 间 。
	AI_Output(self, other, "DIA_Hanna_Room_17_01"); //那 么 ， 你 来 对 了 。
	if (Npc_KnowsInfo(other, DIA_Lothar_Schlafen))
	{
		AI_Output(other, self, "DIA_Hanna_Add_15_03"); //一 个 圣 骑 士 告 诉 过 我 我 可 以 在 这 里 免 费 过 夜 ，
	}
	else
	{
		AI_Output(other, self, "DIA_Hanna_Add_15_00"); //在 这 里 过 夜 要 多 少 钱 ？
		AI_Output(self, other, "DIA_Hanna_Add_17_01"); //什 么 都 不 用 。
		AI_Output(self, other, "DIA_Hanna_Add_17_02"); //那 些 圣 骑 士 负 责 所 有 旅 客 的 住 宿 。
		AI_Output(other, self, "DIA_Hanna_Add_15_04"); //那 么 ， 我 可 以 免 费 在 这 里 住 宿 ？
	};

	AI_Output(self, other, "DIA_Hanna_Add_17_05"); //是 的 ， 是 的 。
	AI_Output(self, other, "DIA_Hanna_Add_17_06"); //直 接 上 楼 吧 。
	AI_Output(self, other, "DIA_Hanna_Add_17_07"); //我 们 还 空 着 一 两 张 床 。
	// AI_Output(self,other,"DIA_Hanna_Room_17_02"); // Geh einfach nach oben und suche dir ein Bett.
};

//*****************************************
//	WhyPay
//*****************************************
instance DIA_Hanna_WhyPay(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 3;
	condition		= DIA_Hanna_WhyPay_Condition;
	information		= DIA_Hanna_WhyPay_Info;
	description		= "为 什 么 圣 骑 士 要 支 付 所 有 的 费 用 ？";
};

func int DIA_Hanna_WhyPay_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WhyPay_Info()
{
	AI_Output(other, self, "DIA_Hanna_Add_15_12"); //为 什 么 圣 骑 士 要 支 付 所 有 的 费 用 ？
	AI_Output(self, other, "DIA_Hanna_Add_17_13"); //我 也 不 知 道 那 是 怎 么 回 事 。
	AI_Output(self, other, "DIA_Hanna_Add_17_14"); //有 一 件 事 ， 我 想 他 们 希 望 让 所 有 的 穷 光 蛋 都 离 开 街 道 ， 那 样 他 们 就 不 会 惹 出 什 么 乱 子 了 。
	AI_Output(self, other, "DIA_Hanna_Add_17_15"); //另 外 ， 他 们 想 讨 好 过 路 商 贩 。
	AI_Output(self, other, "DIA_Hanna_Add_17_16"); //现 在 ， 那 些 农 民 都 在 造 反 ， 我 们 不 得 不 依 靠 商 人 们 维 持 供 给 。
	AI_Output(self, other, "DIA_Hanna_Add_17_17"); //而 且 ， 我 觉 得 他 们 想 要 增 加 城 里 的 士 气 。
	AI_Output(self, other, "DIA_Hanna_Add_17_18"); //安 德 烈 勋 爵 甚 至 在 绞 刑 广 场 发 放 免 费 的 啤 酒 。
};

//*****************************************
//	WerHier - PERM
//*****************************************
instance DIA_Hanna_WerHier(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 4;
	condition		= DIA_Hanna_WerHier_Condition;
	information		= DIA_Hanna_WerHier_Info;
	permanent		= TRUE;
	description		= "现 在 有 谁 留 在 这 里 ？";
};

func int DIA_Hanna_WerHier_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Hanna_Room))
	{
		return TRUE;
	};
};

func void DIA_Hanna_WerHier_Info()
{
	AI_Output(other, self, "DIA_Hanna_Add_15_08"); //现 在 有 谁 留 在 这 里 ？
	AI_Output(self, other, "DIA_Hanna_Add_17_09"); //市 场 里 那 些 人 基 本 都 是 过 路 商 贩 。
	AI_Output(other, self, "DIA_Hanna_Add_15_10"); //啊 哈 。
	AI_Output(self, other, "DIA_Hanna_Add_17_11"); //想 都 不 要 想 去 乱 动 他 们 的 东 西 ！ 我 可 不 想 这 里 出 什 么 乱 子 ！
};

//**********************************************
//	Ich hab noch ein paar Fragen zur Stadt
//**********************************************
instance DIA_Hanna_City(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 5;
	condition		= DIA_Hanna_City_Condition;
	information		= DIA_Hanna_City_Info;
	permanent		= TRUE;
	description		= "我 有 一 些 关 于 城 市 的 问 题 … …";
};

func int DIA_Hanna_City_Condition()
{
	return TRUE;
};

func void DIA_Hanna_City_Info()
{
	AI_Output(other, self, "DIA_Hanna_City_15_00"); //我 有 一 些 关 于 城 市 的 问 题 … …

	Info_ClearChoices(DIA_Hanna_City);
	Info_AddChoice(DIA_Hanna_City, DIALOG_BACK, DIA_Hanna_City_Back);
	Info_AddChoice(DIA_Hanna_City, "我 能 在 哪 里 买 东 西", DIA_Hanna_City_Buy);
	Info_AddChoice(DIA_Hanna_City, "告 诉 我 关 于 这 个 城 镇", DIA_Hanna_City_City);
};

func void DIA_Hanna_City_Back()
{
	Info_ClearChoices(DIA_Hanna_City);
};

func void DIA_Hanna_City_Buy()
{
	AI_Output(other, self, "DIA_Hanna_City_Buy_15_00"); //我 能 在 哪 里 买 东 西 ？
	AI_Output(self, other, "DIA_Hanna_City_Buy_17_01"); //市 场 就 在 那 扇 门 前 面 。 你 可 以 在 那 里 找 到 任 何 东 西 。
	AI_Output(self, other, "DIA_Hanna_City_Buy_17_02"); //城 市 另 一 头 还 有 几 个 商 店 和 几 个 工 匠 。 他 们 大 部 分 都 在 城 门 附 近 。
	AI_Output(self, other, "DIA_Hanna_City_Buy_17_03"); //还 有 ， 港 口 区 还 有 个 鱼 贩 子 。 他 的 商 店 正 在 码 头 上 。 要 找 他 很 容 易 。
};

func void DIA_Hanna_City_City()
{
	AI_Output(other, self, "DIA_Hanna_City_City_15_00"); //告 诉 我 关 于 这 个 城 镇 。
	AI_Output(self, other, "DIA_Hanna_City_City_17_01"); //克 霍 里 尼 斯 是 整 个 王 国 中 最 富 有 的 城 市 之 一 ， 即 使 它 目 前 看 起 来 不 像那 样 。
	AI_Output(self, other, "DIA_Hanna_City_City_17_02"); //但 是 ， 自 从 兽 人 战 争 开 始 后 ， 贸 易 几 乎 已 经 完 全 停 滞 了 。 国 王 征 召 了 所 有 的 商 人 为 军 队 服 务 ，
	AI_Output(self, other, "DIA_Hanna_City_City_17_03"); //那 意 味 着 ， 现 在 几 乎 没 有 船 只 来 港 口 了 。 所 以 ， 目 前 的 货 物 供 应 严 重 不 足 ， 城 里 的 很 多 市 民 都 非 常 担 心 。
	AI_Output(self, other, "DIA_Hanna_City_City_17_04"); //没 有 人 知 道 未 来 会 怎 么 样 。 我 们 基 本 上 无 事 可 做 ， 只 能 等 着 事 态 发 生 。 看 来 我 们 无 法 改 变 任 何 事 情 。
};

// ##################################
// ##
// ## Kapitel 3
// ##
// ##################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Hanna_Kap3_EXIT(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 999;
	condition		= DIA_Hanna_Kap3_EXIT_Condition;
	information		= DIA_Hanna_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hanna_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

var int Hanna_PriceForLetter;

// ************************************************************
// 		Wie sieht´s aus?
// ************************************************************
instance DIA_Hanna_AnyNews(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 31;
	condition		= DIA_Hanna_AnyNews_Condition;
	information		= DIA_Hanna_AnyNews_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Hanna_AnyNews_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AnyNews_Info()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Hanna_AnyNews_17_01"); //你 看 起 来 根 本 就 不 在 乎 别 人 都 在 担 心 的 事 情 。

	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, "是 的 ， 当 然 ， 我 做 。", DIA_Hanna_AnyNews_Yes);
	Info_AddChoice(DIA_Hanna_AnyNews, "看 情 况 再 说 。", DIA_Hanna_AnyNews_Depends);
	Info_AddChoice(DIA_Hanna_AnyNews, "不 太 正 确 。", DIA_Hanna_AnyNews_No);
};

func void DIA_Hanna_AnyNews_No()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_No_15_00"); //不 太 正 确 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_No_17_01"); //我 说 的 就 是 这 个 。 这 里 的 每 个 人 都 只 想 着 自 己 。 那 么 ， 你 想 要 什 么 ？

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Depends()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Depends_15_00"); //看 情 况 再 说 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Depends_17_01"); //你 的 意 思 是 ： 那 要 看 能 得 到 的 有 多 少 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Depends_17_02"); //我 这 里 用 不 上 你 这 样 的 人 。

	MIS_HannaRetrieveLetter = LOG_FAILED;

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_15_00"); //是 的 ， 一 定 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_17_01"); //你 知 道 什 么 ， 这 个 世 界 充 满 了 惊 奇 。 我 最 近 整 理 出 了 一 些 东 西 ， 还 把 一 堆 旧 地 图 卖 给 了 布 拉 希 姆 ， 就 是 码 头 下 面 那 个 制 图 师
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_17_02"); //不 幸 的 是 ， 我 发 现 我 丢 失 了 一 份 文 档 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_17_03"); //我 想 它 一 定 是 夹 在 那 些 纸 里 面 去 了 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_17_04"); //也 许 你 能 帮 我 把 它 找 回 来 ？

	MIS_HannaRetrieveLetter = LOG_RUNNING;

	Log_CreateTopic(TOPIC_HannaRetrieveLetter, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HannaRetrieveLetter, LOG_RUNNING);
	B_LogEntry(TOPIC_HannaRetrieveLetter, TOPIC_HannaRetrieveLetter_1);

	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, "我 不 是 跑 腿 的 仆 人 。", DIA_Hanna_AnyNews_Yes_Footboy);
	Info_AddChoice(DIA_Hanna_AnyNews, "我 有 什 么 好 处 ？", DIA_Hanna_AnyNews_Yes_Reward);
	Info_AddChoice(DIA_Hanna_AnyNews, "我 看 看 能 做 什 么 。", DIA_Hanna_AnyNews_Yes_WillSee);
};

func void DIA_Hanna_AnyNews_Yes_Footboy()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_Footboy_15_00"); //我 不 是 跑 腿 的 仆 人 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Footboy_17_01"); //我 知 道 - 要 你 来 处 理 一 个 普 通 女 人 的 问 题 有 点 不 敬 。 那 么 ， 我 猜 我 只 能 亲 自 处 理 这 件 事 了 。

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_Reward_15_00"); //我 有 什 么 好 处 ？
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_17_01"); //啊 哈 ， 我 就 知 道 - 你 真 的 比 码 头 下 面 那 些 乌 合 之 众 好 不 了 多 少 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_17_02"); //那 么 ， 你 在 问 一 个 可 怜 的 女 人 什 么 呢 ？

	Info_ClearChoices(DIA_Hanna_AnyNews);
	Info_AddChoice(DIA_Hanna_AnyNews, "没 关 系 。", DIA_Hanna_AnyNews_Yes_Reward_OK);
	Info_AddChoice(DIA_Hanna_AnyNews, "你 应 该 对 我 好 一 点 。", DIA_Hanna_AnyNews_Yes_Reward_BeNice);
	Info_AddChoice(DIA_Hanna_AnyNews, "金 币 。", DIA_Hanna_AnyNews_Yes_Reward_Gold);
};

func void DIA_Hanna_AnyNews_Yes_Reward_OK()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_Reward_OK_15_00"); //没 关 系 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_OK_17_01"); //至 少 你 还 留 有 一 点 点 庄 重 。 如 果 你 帮 我 拿 回 了 那 份 文 档 ， 我 会 给 你 7 5 个 金 币 。

	Hanna_PriceForLetter = 75;

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_Reward_BeNice()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00"); //你 应 该 对 我 好 一 点 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01"); //但 那 真 是 无 耻 。 我 … … 从 这 里 滚 出 去 ！ 你 这 个 粗 野 的 笨 蛋 ！

	MIS_HannaRetrieveLetter = LOG_FAILED;

	AI_StopProcessInfos(self);
};

func void DIA_Hanna_AnyNews_Yes_Reward_Gold()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00"); //金 币 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01"); //我 不 能 给 你 不 义 之 财 。 嗯 好 吧 - 它 对 我 来 说 值 5 0 个 金 币 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02"); //如 果 你 设 法 帮 我 找 回 了 那 份 文 档 ， 我 会 给 你 5 0 个 金 币 。

	Hanna_PriceForLetter = 50;

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

func void DIA_Hanna_AnyNews_Yes_WillSee()
{
	AI_Output(other, self, "DIA_Hanna_AnyNews_Yes_WillSee_15_00"); //我 看 看 我 能 做 什 么 。
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_WillSee_17_01"); //你 真 可 爱 。 我 祝 你 好 运 不 断 ！
	AI_Output(self, other, "DIA_Hanna_AnyNews_Yes_WillSee_17_02"); //如 果 你 把 文 档 带 回 来 给 我 ， 我 会 给 你 报 酬 。

	Hanna_PriceForLetter = 200;

	Info_ClearChoices(DIA_Hanna_AnyNews);
};

// ************************************************************
//		Meinst du dieses Schriftstück?
// ************************************************************
instance DIA_Hanna_ThisLetter(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 31;
	condition		= DIA_Hanna_ThisLetter_Condition;
	information		= DIA_Hanna_ThisLetter_Info;
	description		= "你 是 说 这 份 文 件 吗 ？";
};

func int DIA_Hanna_ThisLetter_Condition()
{
	if ((MIS_HannaRetrieveLetter == LOG_RUNNING)
	&& (Npc_HasItems(other, ItWr_ShatteredGolem_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_ThisLetter_Info()
{
	AI_Output(other, self, "DIA_Hanna_ThisLetter_15_00"); //你 是 说 这 份 文 件 吗 ？
	AI_Output(self, other, "DIA_Hanna_ThisLetter_17_01"); //是 的 ， 就 是 它 。 谢 谢 你 。
	AI_Output(other, self, "DIA_Hanna_ThisLetter_15_02"); //我 的 报 酬 是 什 么 ？
	AI_Output(self, other, "DIA_Hanna_ThisLetter_17_03"); //别 急 。 这 是 你 的 钱 。

	CreateInvItems(self, ItMi_Gold, Hanna_PriceForLetter);
	B_GiveInvItems(self, other, ItMi_Gold, Hanna_PriceForLetter);

	MIS_HannaRetrieveLetter = LOG_SUCCESS;
	B_GivePlayerXP(XP_HannaRetrieveLetter);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hanna_PICKPOCKET(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 900;
	condition		= DIA_Hanna_PICKPOCKET_Condition;
	information		= DIA_Hanna_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Hanna_PICKPOCKET_Condition()
{
	C_Beklauen(45, 25);
};

func void DIA_Hanna_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
	Info_AddChoice(DIA_Hanna_PICKPOCKET, DIALOG_BACK, DIA_Hanna_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hanna_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hanna_PICKPOCKET_DoIt);
};

func void DIA_Hanna_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

func void DIA_Hanna_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hanna_PICKPOCKET);
};

// ************************************************************
//						Aus Keller
// ************************************************************
instance DIA_Hanna_AusKeller(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 11;
	condition		= DIA_Hanna_AusKeller_Condition;
	information		= DIA_Hanna_AusKeller_Info;
	important		= TRUE;
};

func int DIA_Hanna_AusKeller_Condition()
{
	if (Npc_HasItems(other, ItKe_ThiefGuildKey_Hotel_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Hanna_AusKeller_Info()
{
	if ((Cassia.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Jesper.aivar[AIV_KilledByPlayer] == TRUE)
	|| (Ramirez.aivar[AIV_KilledByPlayer] == TRUE))
	{
		AI_Output(self, other, "DIA_Hanna_Add_17_27"); //你 从 哪 里 … … 来 的 ？
		AI_Output(other, self, "DIA_Hanna_Add_15_28"); //我 在 你 的 地 下 室 里 发 现 了 一 些 有 趣 的 东 西 … …
		AI_Output(self, other, "DIA_Hanna_Add_17_29"); //你 在 我 的 地 下 室 里 搞 了 些 什 么 名 堂 ？ ！
		AI_Output(other, self, "DIA_Hanna_Add_15_30"); //你 知 道 得 很 清 楚 ！ ！
		AI_Output(self, other, "DIA_Hanna_Add_17_31"); //（ 冷 冷 地 ） 我 不 知 道 你 在 说 些 什 么 … …
	}
	else
	{
		AI_Output(self, other, "DIA_Hanna_Add_17_19"); //（ 不 信 任 的 ） 看 看 你 ！ 你 是 从 哪 里 来 的 ？ 嗯 ？
		AI_Output(other, self, "DIA_Hanna_Add_15_20"); //（ 局 促 不 安 ） 我 … …
		AI_Output(self, other, "DIA_Hanna_Add_17_21"); //（ 大 笑 ） 我 知 道 ！
		AI_Output(self, other, "DIA_Hanna_Add_17_22"); //（ 阴 险 地 ） 你 不 需 要 告 诉 我 。 我 什 么 都 知 道 。
		AI_Output(self, other, "DIA_Hanna_Add_17_23"); //想 都 不 要 想 在 这 里 偷 东 西 ， 明 白 吗 ？
		AI_Output(self, other, "DIA_Hanna_Add_17_24"); //我 们 可 不 想 让 旅 馆 引 起 注 意 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
//						Schuldenbuch zeigen
// ************************************************************
instance DIA_Hanna_Schuldenbuch(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 1;
	condition		= DIA_Hanna_Schuldenbuch_Condition;
	information		= DIA_Hanna_Schuldenbuch_Info;
	description		= "看 我 这 里 有 什 么 书 ！";
};

func int DIA_Hanna_Schuldenbuch_Condition()
{
	if (Npc_HasItems(other, ItWr_Schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Hanna_Schuldenbuch_Info()
{
	AI_Output(other, self, "DIA_Hanna_Add_15_41"); //看 我 这 里 有 什 么 书 ！
	AI_Output(self, other, "DIA_Hanna_Add_17_42"); //雷 玛 尔 的 账 册 。 你 怎 么 拿 到 它 的 ？
	AI_Output(other, self, "DIA_Hanna_Add_15_43"); //嗯 … …
	AI_Output(self, other, "DIA_Hanna_Add_17_44"); //如 果 雷 玛 尔 没 有 了 它 ， 那 是 件 好 事 。 不 过 ， 我 更 希 望 我 自 己 能 拿 着 它 … …
};

// ************************************************************
//						Schuldenbuch geben
// ************************************************************
instance DIA_Hanna_GiveSchuldenbuch(C_INFO)
{
	npc				= VLK_414_Hanna;
	nr				= 1;
	condition		= DIA_Hanna_GiveSchuldenbuch_Condition;
	information		= DIA_Hanna_GiveSchuldenbuch_Info;
	description		= "给 - 拿 走 这 本 书 。";
};

func int DIA_Hanna_GiveSchuldenbuch_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Hanna_Schuldenbuch))
	&& (Npc_HasItems(other, ItWr_Schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Hanna_GiveSchuldenbuch_Info()
{
	AI_Output(other, self, "DIA_Hanna_Add_15_45"); //给 - 拿 走 这 本 书 。
	B_GiveInvItems(other, self, ItWr_Schuldenbuch, 1);
	AI_Output(self, other, "DIA_Hanna_Add_17_46"); //谢 谢。
	AI_Output(self, other, "DIA_Hanna_Add_17_47"); //这 是 你 的 报 酬 。
	B_GiveInvItems(self, other, ItSe_HannasBeutel, 1);
	B_GivePlayerXP(XP_Schuldenbuch);
	AI_Output(other, self, "DIA_Hanna_Add_15_49"); //你 给 我 的 是 什 么 ？
	AI_Output(self, other, "DIA_Hanna_Add_17_48"); //那 是 通 往 财 富 之 门 的 钥 匙 。
};

// ************************************************************
// 
// ************************************************************
func void Hanna_Blubb()
{
	AI_Output(other, self, "DIA_Hanna_Add_15_37"); //隐 蔽 所 里 一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Hanna_Add_17_39"); //我 很 久 没 见 过 他 们 任 何 人 了 。
	AI_Output(self, other, "DIA_Hanna_Add_17_40"); //等 我 有 机 会 查 清 楚 的 时 候 ， 我 就 去 那 里 。
	AI_Output(self, other, "DIA_Hanna_Add_17_38"); //是 的 。 但 是 你 最 好 不 要 提 起 它 … …
	// -------------------
	AI_Output(other, self, "DIA_Hanna_Add_15_25"); //你 知 道 那 些 贼 的 藏 匿 处 吗 ？
	AI_Output(self, other, "DIA_Hanna_Add_17_26"); //（ 假 笑 ） 我 不 知 道 你 在 说 些 什 么 … …
	// -------------------
	AI_Output(self, other, "DIA_Hanna_Add_17_32"); //民 兵 来 了 这 里 … … 有 人 把 这 个 隐 蔽 所 泄 漏 了 ！
	AI_Output(self, other, "DIA_Hanna_Add_17_33"); //他 们 不 能 给 我 定 任 何 罪 状 ， 但 凯 希 亚 和 她 的 人 都 已 经 死 了 ！
	AI_Output(self, other, "DIA_Hanna_Add_17_34"); //我 敢 肯 定 一 定 是 你 … …
	AI_Output(self, other, "DIA_Hanna_Add_17_35"); //我 是 专 门 为 你 在 这 里 买 下 了 这 个 。
	AI_Output(self, other, "DIA_Hanna_Add_17_36"); //它 让 我 花 了 一 大 笔 钱 。 但 是 ， 为 了 你 - 值 得 ！ 你 这 个 卑 鄙 的 家 伙 … …
};
