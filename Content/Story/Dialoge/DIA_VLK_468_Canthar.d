// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Canthar_PICKPOCKET(C_INFO)
{
	npc				= VLK_468_Canthar;
	nr				= 900;
	condition		= DIA_Canthar_PICKPOCKET_Condition;
	information		= DIA_Canthar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Canthar_PICKPOCKET_Condition()
{
	C_Beklauen(20, 25);
};

func void DIA_Canthar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
	Info_AddChoice(DIA_Canthar_PICKPOCKET, DIALOG_BACK, DIA_Canthar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Canthar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Canthar_PICKPOCKET_DoIt);
};

func void DIA_Canthar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

func void DIA_Canthar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Canthar_PICKPOCKET);
};

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Canthar_EXIT(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 999;
	condition		= DIA_Canthar_EXIT_Condition;
	information		= DIA_Canthar_EXIT_Info;
	permanent		= TRUE;
	description		= "我 必 须 走 了 ！( 结 束 )";
};

func int DIA_Canthar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Canthar_EXIT_Info()
{
	AI_Output(other, self, "DIA_Canthar_EXIT_15_00"); //我 必 须 走 了 ！
	AI_Output(self, other, "DIA_Canthar_EXIT_09_01"); //随 你 的 便 吧 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Personal CRIMES
// ************************************************************
instance DIA_Canthar_PersonalCRIMES(C_INFO)
{
	npc				= VLK_468_Canthar;
	nr				= 1;
	condition		= DIA_Canthar_PersonalCRIMES_Condition;
	information		= DIA_Canthar_PersonalCRIMES_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Canthar_PersonalCRIMES_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_LastFightComment] == FALSE)
	&& (self.aivar[AIV_LastFightAgainstPlayer] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PersonalCRIMES_Info()
{
	// ------ Spieler hat mich besiegt ------
	if (self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST)
	{
		AI_Output(self, other, "DIA_Canthar_PersonalCRIMES_09_00"); //你 竟 愚 蠢 到 敢 来 攻 击 我 ！
	}

	// ------ ich habe Spieler besiegt ODER keiner wurde besiegt ------
	else // FIGHT_WON oder FIGHT_CANCEL
	{
		AI_Output(self, other, "DIA_Canthar_PersonalCRIMES_09_01"); //（ 嘲 笑 ） 难 道 你 认 为 自 己 可 以 那 么 容 易 地 打 败 我 ？
	};

	AI_Output(self, other, "DIA_Canthar_PersonalCRIMES_09_02"); //你 要 么 赔 偿 ， 要 么 我 保 证 让 你 为 自 己 的 行 为 后 悔 ！
	AI_Output(other, self, "DIA_Canthar_PersonalCRIMES_15_03"); //那 么 ， 你 脑 子 里 到 底 在 想 些 什 么 东 西 ？
	B_Say_Gold(self, other, 100);

	Info_ClearChoices(DIA_Canthar_PersonalCRIMES);
	Info_AddChoice(DIA_Canthar_PersonalCRIMES, "我 没 有 那 么 多 ！", DIA_Canthar_PersonalCRIMES_NotEnough);
	if (Npc_HasItems(other, itmi_gold) >= 100)
	{
		Info_AddChoice(DIA_Canthar_PersonalCRIMES, "这 是 你 的 金 币 - 我 们 忘 了 那 件 事 吧 ！", DIA_Canthar_PersonalCRIMES_Pay);
	};
};

func void DIA_Canthar_PersonalCRIMES_Pay()
{
	AI_Output(other, self, "DIA_Canthar_PersonalCRIMES_Pay_15_00"); //这 是 你 的 金 币 - 我 们 忘 了 那 件 事 吧 ！
	AI_Output(self, other, "DIA_Canthar_PersonalCRIMES_Pay_09_01"); //你 真 是 通 情 达 理 ！

	// ------ AIVARs resetten! ------
	self.aivar[AIV_LastFightComment] = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Canthar_PersonalCRIMES_NotEnough()
{
	AI_Output(other, self, "DIA_Canthar_PersonalCRIMES_NotEnough_15_00"); //我 没 有 那 么 多 ！
	AI_Output(self, other, "DIA_Canthar_PersonalCRIMES_NotEnough_09_01"); //那 么 你 为 什 么 要 浪 费 我 的 时 间 ？！

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				 Hallo
// ************************************************************
instance DIA_Canthar_Hallo(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 1;
	condition		= DIA_Canthar_Hallo_Condition;
	information		= DIA_Canthar_Hallo_Info;
	important		= TRUE;
};

func int DIA_Canthar_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Hallo_Info()
{
	var C_Item itm; itm = Npc_GetEquippedArmor(other);

	// ------ OHNE Rüstung ------
	if (Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self, other, "DIA_Canthar_Hallo_09_00"); //那 么 我 们 这 里 都 有 谁 ？
		AI_Output(self, other, "DIA_Canthar_Hallo_09_01"); //你 正 要 去 城 里 - 我 说 对 了 吗 ？
		AI_Output(other, self, "DIA_Canthar_Hallo_15_02"); //也 许 。
		AI_Output(self, other, "DIA_Canthar_Hallo_09_03"); //哼 ！ （ 轻 蔑 地 哼 ） 你 看 起 来 像 个 流 浪 汉 ！ 所 有 的 流 浪 汉 都 在 往 城 里 去 。
		AI_Output(self, other, "DIA_Canthar_Hallo_09_04"); //你 甚 至 可 能 是 以 前 在 矿 坑 流 放 地 的 罪 犯 。
		AI_Output(self, other, "DIA_Canthar_Hallo_09_05"); //（ 匆 忙 地 ） 我 不 在 乎 你 从 哪 里 来 。 但 是 ， 我 相 信 我 有 一 个 提 议 你 会 很 感 兴 趣 … …

		Canthar_GotMe = TRUE;
	}

	// ------ Bauernkleidung ------
	else if ((Hlp_IsItem(itm, ItAr_Bau_L))
	|| (Hlp_IsItem(itm, ItAr_Bau_M)))
	{
		AI_Output(self, other, "DIA_Canthar_HelloArmor_09_06"); //工 作 顺 利 吗 ， 乡 下 人 ？

		Info_ClearChoices(DIA_Canthar_Hallo);
		Info_AddChoice(DIA_Canthar_Hallo, "我 看 起 来 像 个 农 民 ？！", DIA_Canthar_Hallo_NoBauer);
		Info_AddChoice(DIA_Canthar_Hallo, "我 不 能 抱 怨 。", DIA_Canthar_Hallo_Bauer);
	}

	// ------ alle anderen Rüstungen (höchst unwahrscheinlich) ------
	else
	{
		AI_Output(self, other, "DIA_Canthar_Hallo_09_07"); //我 能 为 你 做 什 么 ？
	};
};

func void DIA_Canthar_Hallo_Bauer()
{
	AI_Output(other, self, "DIA_Canthar_Hallo_Bauer_15_00"); //我 不 能 抱 怨 。
	AI_Output(self, other, "DIA_Canthar_Hallo_Bauer_09_01"); //我 能 为 你 做 些 什 么 吗 ？

	Info_ClearChoices(DIA_Canthar_Hallo);
};

func void DIA_Canthar_Hallo_NoBauer()
{
	AI_Output(other, self, "DIA_Canthar_Hallo_NoBauer_15_00"); //我 看 起 来 像 个 农 民 ？！
	AI_Output(self, other, "DIA_Canthar_Hallo_NoBauer_09_01"); //就 像 一 个 农 民 那 样 。 但 是 ， 你 说 起 话 来 可 不 像 ！
	AI_Output(self, other, "DIA_Canthar_Hallo_NoBauer_09_02"); //（ 沉 思 ） 如 果 我 没 有 全 错 的 话 ， 我 有 一 个 提 议 你 会 很 感 兴 趣 … …

	Canthar_GotMe = TRUE;

	Info_ClearChoices(DIA_Canthar_Hallo);
};

// ************************************************************
// 		  				 	WhatOffer // E3
// ************************************************************
instance DIA_Canthar_WhatOffer(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 1;
	condition		= DIA_Canthar_WhatOffer_Condition;
	information		= DIA_Canthar_WhatOffer_Info;
	description		= "你 可 以 给 我 提 供 一 些 什 么 ？";
};

func int DIA_Canthar_WhatOffer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Canthar_WhatOffer_Info()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_15_00"); //你 供 应 什 么 ？

	if (Canthar_GotME == TRUE)
	{
		if (Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self, other, "DIA_Canthar_WhatOffer_09_01"); //就 凭 你 的 样 子 ， 那 些 守 卫 永 远 都 不 会 让 你 进 城 。
		}
		else
		{
			AI_Output(self, other, "DIA_Canthar_WhatOffer_09_02"); //（ 讽 刺 的 ） 如 果 你 给 那 些 守 卫 的 感 觉 跟 给 我 的 感 觉 一 样 的 ‘ 让 人 心 悦 诚 服 ’ ， 他 们 永 远 都 不 会 让 你 进 城 。
		};

		AI_Output(self, other, "DIA_Canthar_WhatOffer_09_03"); //我 可 以 帮 你 设 法 进 城 。
		AI_Output(self, other, "DIA_Canthar_WhatOffer_09_04"); //我 这 里 有 一 张 小 小 的 纸 片 。 盖 着 皇 室 大 印 ， 并 有 总 督 的 签 名 。 一 份 通 行 证 。

		if (Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self, other, "DIA_Canthar_WhatOffer_09_05"); //有 了 这 张 小 纸 片 在 你 口 袋 里 ， 你 可 以 随 便 穿 成 什 么 破 破 烂 烂 的 样 子 到 处 跑 ， 而 那 些 守 卫 理 都 不 会 理 你 。
		};

		AI_Output(self, other, "DIA_Canthar_WhatOffer_09_06"); //有 兴 趣 吗 ？

		Info_ClearChoices(DIA_Canthar_WhatOffer);
		Info_AddChoice(DIA_Canthar_WhatOffer, "不 ！ 留 着 你 的 通 行 证 吧 ！", DIA_Canthar_WhatOffer_No);
		Info_AddChoice(DIA_Canthar_WhatOffer, "你 想 用 你 的 通 行 证 换 什 么 ？", DIA_Canthar_WhatOffer_Price);
		Info_AddChoice(DIA_Canthar_WhatOffer, "你 怎 么 进 入 城 镇 ？", DIA_Canthar_WhatOffer_HowYouIn);
		Info_AddChoice(DIA_Canthar_WhatOffer, "这 一 定 有 圈 套 … …", DIA_Canthar_WhatOffer_Strings);
	}
	else
	{
		AI_Output(self, other, "DIA_Canthar_WhatOffer_09_07"); //我 是 一 个 旅 行 商 人 。 我 什 么 东 西 都 卖 一 点 。
	};

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_14);
};

func void DIA_Canthar_WhatOffer_Strings()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_Strings_15_00"); //这 一 定 有 圈 套 … …
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Strings_09_01"); //（ 夸 张 的 ） 不 。 不 合 算 。 你 只 是 欠 我 一 个 人 情 。
};

func void DIA_Canthar_WhatOffer_HowYouIn()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_HowYouIn_15_00"); //你 怎 么 进 入 城 镇 ？
	AI_Output(self, other, "DIA_Canthar_WhatOffer_HowYouIn_09_01"); //那 些 守 卫 认 识 我 。 我 只 要 告 诉 他 们 我 的 通 行 证 丢 了 就 行 了 。
};

func void DIA_Canthar_WhatOffer_Price()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_Price_15_00"); //你 想 用 你 的 通 行 证 换 什 么 ？
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Price_09_01"); //（ 高 兴 的 ） 我 就 知 道 找 你 找 对 了 人 ！
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Price_09_02"); //听 着 。 你 将 从 我 这 里 拿 到 通 行 证 - 马 上 。
	AI_Output(other, self, "DIA_Canthar_WhatOffer_Price_15_03"); //就 像 那 样 ？
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Price_09_04"); //就 是 那 样 。 但 是 ： 如 果 我 在 城 里 碰 到 你 ， 你 欠 我 一 个 人 情 。
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Price_09_05"); //我 们 能 成 交 了 吗 ？

	Info_AddChoice(DIA_Canthar_WhatOffer, "当 然 。 给 我 那 份 文 件 。", DIA_Canthar_WhatOffer_Ok);
};

func void DIA_Canthar_WhatOffer_Ok()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_Ok_15_00"); //当 然 。 给 我 那 份 文 件 。
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Ok_09_01"); //给 。 拿 着 它 要 小 心 ， 它 非 常 珍 贵 。
	CreateInvItems(self, ItWr_Passierschein, 1);
	B_GiveInvItems(self, other, ItWr_Passierschein, 1);
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Ok_09_02"); //还 有 一 件 事 ： 千 万 不 要 想 违 背 你 的 诺 言 ！
	AI_Output(self, other, "DIA_Canthar_WhatOffer_Ok_09_03"); //作 为 一 个 商 人 ， 我 在 城 里 有 着 非 常 大 的 影 响 力 - 那 对 你 不 会 有 什 么 好 处 ， 相 信 我 ！

	Canthar_Gefallen = TRUE;
	Info_ClearChoices(DIA_Canthar_WhatOffer);

	Log_CreateTopic(TOPIC_City, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City, LOG_RUNNING);
	B_LogEntry(TOPIC_City, TOPIC_City_4);
};

func void DIA_Canthar_WhatOffer_No()
{
	AI_Output(other, self, "DIA_Canthar_WhatOffer_No_15_00"); //不 ！ 留 着 你 的 通 行 证 吧 ！
	AI_Output(self, other, "DIA_Canthar_WhatOffer_No_09_01"); //嗯 。 我 好 象 看 错 了 你 ， 是 吗 ？
	AI_Output(self, other, "DIA_Canthar_WhatOffer_No_09_02"); //好 吧 。 你 想 要 别 的 东 西 吗 ？ 我 的 货 物 会 让 你 感 兴 趣 吗 ？

	Info_ClearChoices(DIA_Canthar_WhatOffer);
};

// ************************************************************
// 		  				 	TRADE
// ************************************************************
instance DIA_Canthar_TRADE(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 888;
	condition		= DIA_Canthar_TRADE_Condition;
	information		= DIA_Canthar_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 ！";
};

func int DIA_Canthar_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_WhatOffer))
	{
		return TRUE;
	};
};

func void DIA_Canthar_TRADE_Info()
{
	AI_Output(other, self, "DIA_Canthar_TRADE_15_00"); //让 我 看 看 你 的 货 物 ！

	B_GiveTradeInv(self);

	AI_Output(self, other, "DIA_Canthar_TRADE_09_01"); //挑 你 想 要 的 东 西 吧 。
};

// ###########################################
// ###########################################

// 				In der Stadt

// ###########################################
// ###########################################
/*
-- >
Aber ein Händler namnes Canthar hat das erzählt.
	*/

///////////////////////////////////////////////////////////////////////
//	Info PayPriceInCity
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_PAYPRICEINCITY(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 2;
	condition		= DIA_Canthar_PAYPRICEINCITY_Condition;
	information		= DIA_Canthar_PAYPRICEINCITY_Info;
	important		= TRUE;
};

func int DIA_Canthar_PAYPRICEINCITY_Condition()
{
	if ((Canthar_InStadt == TRUE)
	&& (Npc_IsDead(Sarah) == FALSE)
	&& (Canthar_GotMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_PAYPRICEINCITY_Info()
{
	if (Canthar_Gefallen == TRUE)
	{
		AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_00"); //你 还 欠 我 一 个 人 情 。 现 在 是 时 候 还 你 的 债 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_01"); //嘿 ， 你 ， 我 对 你 有 个 建 议 。
	};

	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_15_02"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_03"); //我 想 要 回 在 市 场 后 面 我 自 己 的 那 个 货 摊 。 莎 拉 从 我 手 里 把 它 抢 走 了 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_04"); //不 过 她 占 着 那 个 位 置 已 经 够 久 了 。 我 想 要 她 放 弃 那 个 货 摊 。
	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_15_05"); //那 我 在 这 里 起 什 么 作 用 ？
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_06"); //我 会 给 你 一 封 信 去 放 进 她 的 口 袋 里 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_07"); //然 后 你 去 找 安 德 烈 ， 告 诉 他 莎 拉 在 向 欧 纳 尔 出 售 武 器 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_08"); //她 进 监 狱 ， 你 拿 奖 金 ， 而 我 就 得 到 了 货 摊 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_09"); //你 有 两 天 时 间 来 做 这 件 事 。

	if (Canthar_Gefallen == FALSE)
	{
		AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_15_10"); //对 我 有 什 么 好 处 ？
		AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_09_11"); //当 我 有 了 这 个 货 摊 后 ， 你 可 以 从 我 这 里 拿 走 一 件 武 器 - 而 且 是 一 把 非 常 好 的 。
	};

	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, "不 ， 我 不 想 参 与 此 事 。 ", DIA_Canthar_PAYPRICEINCITY_Nein);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, "好 吧 ， 我 愿 意 去 做 。", DIA_Canthar_PAYPRICEINCITY_Ok);
	Info_AddChoice(DIA_Canthar_PAYPRICEINCITY, "如 果 我 拒 绝 那 么 做 的 话 ， 会 发 生 什 么 事 ？", DIA_Canthar_PAYPRICEINCITY_If);
};

func void DIA_Canthar_PAYPRICEINCITY_if ()
{
	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_if_15_00"); //如 果 我 拒 绝 那 么 做 的 话 ， 会 发 生 什 么 事 ？
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_01"); //你 这 样 简 直 真 是 太 蠢 了 ， 因 为 你 明 白 ， 我 知 道 你 是 个 逃 犯 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_if_09_02"); //如 果 这 些 事 被 散 到 四 处 ， 那 会 对 你 在 城 里 的 处 境 有 着 相 当 的 损 害 … …
};

func void DIA_Canthar_PAYPRICEINCITY_Nein()
{
	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_Nein_15_00"); //不 ， 我 不 想 参 与 此 事 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_Nein_09_01"); //那 是 个 错 误 的 决 定 ， 小 伙 子 。 我 们 会 再 谈 谈 的 。

	MIS_Canthars_KomproBrief = LOG_OBSOLETE;
	B_CheckLog();
	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

func void DIA_Canthar_PAYPRICEINCITY_Ok()
{
	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_00"); //好 的 ， 看 来 我 没 得 选 择 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_01"); //你 是 个 聪 明 的 小 伙 子 。 这 是 那 封 信 。

	CreateInvItems(self, ItWr_Canthars_KomproBrief_MIS, 1);
	B_GiveInvItems(self, other, ItWr_Canthars_KomproBrief_MIS, 1);

	AI_Output(other, self, "DIA_Canthar_PAYPRICEINCITY_Ok_15_02"); //我 要 怎 样 才 能 把 这 封 信 偷 偷 地 放 在 她 身 上 ？
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_03"); //让 她 把 货 物 拿 给 你 看 - 当 她 这 么 做 的 时 候 ， 你 把 信 藏 到 她 身 上 。
	AI_Output(self, other, "DIA_Canthar_PAYPRICEINCITY_Ok_09_04"); //而 且 ， 始 终 要 记 住 ， 我 在 城 里 是 个 很 有 势 力 的 人 ， 所 以 ， 别 想 耍 我 。

	MIS_Canthars_KomproBrief = LOG_RUNNING;
	MIS_Canthars_KomproBrief_Day = Wld_GetDay();

	Log_CreateTopic(TOPIC_Canthar, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Canthar, LOG_RUNNING);

	if (Canthar_Gefallen == TRUE)
	{
		B_LogEntry(TOPIC_Canthar, TOPIC_Canthar_1);
	}
	else
	{
		B_LogEntry(TOPIC_Canthar, TOPIC_Canthar_2);
	};

	B_LogEntry(TOPIC_Canthar, TOPIC_Canthar_3);

	Info_ClearChoices(DIA_Canthar_PAYPRICEINCITY);
};

///////////////////////////////////////////////////////////////////////
//	Info SarahErledigt
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_SARAHERLEDIGT(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 5;
	condition		= DIA_Canthar_SARAHERLEDIGT_Condition;
	information		= DIA_Canthar_SARAHERLEDIGT_Info;
	permanent		= TRUE;
	description		= "关 于 莎 拉 … …";
};

func int DIA_Canthar_SARAHERLEDIGT_Condition()
{
	if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Canthar_SARAHERLEDIGT_Info()
{
	if ((Npc_IsDead(Sarah)) == FALSE)
	{
		if (MIS_Canthars_KomproBrief_Day <= (Wld_GetDay() + 2))
		{
			AI_Output(self, other, "DIA_Canthar_SARAHERLEDIGT_09_00"); //你 没 有 工 作 可 做 吗 ？
			AI_Output(self, other, "DIA_Canthar_SARAHERLEDIGT_09_01"); //先 把 信 偷 偷 放 在 莎 拉 身 上 ， 然 后 ， 去 找 安 德 烈 控 告 她 。
			AI_Output(self, other, "DIA_Canthar_SARAHERLEDIGT_09_02"); //去 办 吧 - 不 过 ， 别 想 欺 骗 我 ， 否 则 你 会 后 悔 的 。
		}
		else
		{
			AI_Output(self, other, "DIA_Canthar_SARAHERLEDIGT_09_03"); //你 在 这 件 事 里 头 也 有 自 己 的 甜 头 。 去 吧 。
		};
	}
	else
	{
		AI_Output(other, self, "DIA_Canthar_SARAHERLEDIGT_15_04"); //莎 拉 死 了 。
		AI_Output(self, other, "DIA_Canthar_SARAHERLEDIGT_09_05"); //真 的 吗 ？ 好 极 了 。 那 么 你 完 成 了 我 们 这 笔 小 小 的 交 易 的 一 半 。

		MIS_Canthars_KomproBrief = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient);
		Npc_ExchangeRoutine(self, "MARKTSTAND");
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Success(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 5;
	condition		= DIA_Canthar_Success_Condition;
	information		= DIA_Canthar_Success_Info;
	description		= "关 于 莎 拉 … …";
};

func int DIA_Canthar_Success_Condition()
{
	if ((MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& ((Npc_IsDead(Sarah)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Success_Info()
{
	AI_Output(self, other, "DIA_Canthar_Success_09_00"); //干 的 漂 亮 。 莎 拉 去 了 她 该 去 的 地 方 。
	AI_Output(self, other, "DIA_Canthar_Success_09_01"); //我 已 经 接 管 了 她 的 货 物 ， 所 以 ， 如 果 你 需 要 一 把 武 器 的 话 ， 来 找 我 。

	if (Kapitel == 1)
	{
		CreateInvItems(self, ItMw_ShortSword3, 1);
		CreateInvItems(self, ItMw_ShortSword4, 1);
		CreateInvItems(self, ItMw_ShortSword5, 1);
		CreateInvItems(self, ItMw_Kriegshammer1, 1);

		CreateInvItems(self, ItMw_1h_Vlk_Sword, 1);
		CreateInvItems(self, ItMw_1h_Nov_Mace, 1);
	};

	if (Kapitel == 2)
	{
		CreateInvItems(self, ItMw_Stabkeule, 1);
		CreateInvItems(self, ItMw_Steinbrecher, 1);
		CreateInvItems(self, ItMw_Schwert2, 1);
		CreateInvItems(self, ItMw_Bartaxt, 1);
	};

	if (Canthar_Gefallen == FALSE)
	{
		AI_Output(other, self, "DIA_Canthar_Success_15_02"); //你 那 时 准 备 给 我 一 把 武 器 。
		AI_Output(self, other, "DIA_Canthar_Success_09_03"); //对 了 。 给 ， 这 把 武 器 可 是 铁 匠 工 艺 的 杰 作 。

		B_GiveInvItems(self, other, ItMW_Schiffsaxt, 1);
	};

	B_GivePlayerXP(XP_Canthars_KomproBrief);
};

// ---------------------------------------------------------------------

// Canthat hat seinen Marktstand OHNE Spieler Hilfe

// ---------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////
//	Info Canthar hat den Stand
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Again(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 5;
	condition		= DIA_Canthar_Again_Condition;
	information		= DIA_Canthar_Again_Info;
	important		= TRUE;
};

func int DIA_Canthar_Again_Condition()
{
	if ((Canthar_Sperre == TRUE)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Again_Info()
{
	AI_Output(self, other, "DIA_Canthar_Again_09_00"); //哦 ， 你 又 来 了 。

	if (MIS_Canthars_KomproBrief == LOG_FAILED)
	{
		AI_Output(other, self, "DIA_Canthar_Again_15_01"); //为 什 么 你 没 在 监 狱 里 ？
		AI_Output(self, other, "DIA_Canthar_Again_09_02"); //我 已 经 被 释 放 了 。 就 像 我 已 经 告 诉 过 你 的 - 我 在 城 里 是 个 很 有 势 力 的 人 。
	}
	else if (MIS_Canthars_KomproBrief == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Canthar_Again_09_03"); //同 时 ， 我 已 经 自 己 解 决 了 莎 拉 。 你 可 以 忘 了 那 封 信 的 事 。
	}
	else if (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Canthar_Again_09_04"); //我 没 有 警 告 过 你 吗 ？ 如 果 你 那 时 按 我 说 的 去 做 了 ， 那 会 要 好 得 多 。
	};

	AI_Output(self, other, "DIA_Canthar_Again_09_05"); //现 在 商 人 中 间 已 经 传 遍 了 你 是 个 罪 犯 。
	AI_Output(self, other, "DIA_Canthar_Again_09_06"); //多 么 遗 憾 的 事 情 啊 - 现 在 你 就 连 一 小 块 面 包 也 别 想 在 市 场 这 里 拿 到 。
	AI_Output(self, other, "DIA_Canthar_Again_09_07"); //当 然 ， 我 可 以 替 你 澄 清 事 情 ， 我 们 可 以 说 … …
	B_Say_Gold(self, other, Canthar_Gold);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar bezahlen
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_Pay(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 2;
	condition		= DIA_Canthar_Pay_Condition;
	information		= DIA_Canthar_Pay_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Canthar_Pay_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Canthar_Again)
	&& (Canthar_Sperre == TRUE)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_Pay_Info()
{
	AI_Output(self, other, "DIA_Canthar_Pay_09_00"); //你 是 来 付 你 的 罚 金 吗 ？

	Info_ClearChoices(DIA_Canthar_Pay);

	if (Npc_HasItems(other, ItmI_Gold) >= Canthar_Gold)
	{
		Info_AddChoice(DIA_Canthar_Pay, "好 吧 ， 我 愿 意 清 账 … …", DIA_Canthar_Pay_Ja);
	};

	Info_AddChoice(DIA_Canthar_Pay, "我 还 没 有 足 够 的 钱 … …", DIA_Canthar_Pay_Nein);
	Info_AddChoice(DIA_Canthar_Pay, "再 说 一 次 那 需 要 多 少 钱 ？", DIA_Canthar_Pay_Wieviel);
};

func void DIA_Canthar_Pay_Ja()
{
	AI_Output(other, self, "DIA_Canthar_Pay_Ja_15_00"); //是 的 ， 我 会 付 清 的 ， 你 没 有 给 我 选 择 的 余 地 。
	B_GiveInvItems(other, self, Itmi_Gold, Canthar_Gold);
	AI_Output(self, other, "DIA_Canthar_Pay_Ja_09_01"); //（ 咧 着 嘴 笑 ） 很 好 。 那 么 我 保 证 你 在 商 人 们 中 间 的 声 誉 再 次 提 高 。

	Canthar_Sperre = FALSE;
	Canthar_Pay = TRUE;
	Info_ClearChoices(DIA_Canthar_Pay);
};

func void DIA_Canthar_Pay_Nein()
{
	AI_Output(other, self, "DIA_Canthar_Pay_Nein_15_00"); //我 还 没 有 足 够 的 钱 … …
	AI_Output(self, other, "DIA_Canthar_Pay_Nein_09_01"); //那 就 行 了 。
	Info_ClearChoices(DIA_Canthar_Pay);
	AI_StopProcessInfos(self);
};

func void DIA_Canthar_Pay_Wieviel()
{
	AI_Output(other, self, "DIA_Canthar_Pay_Wieviel_15_00"); //再 说 一 次 那 需 要 多 少 钱 ？
	B_Say_Gold(self, other, Canthar_Gold);
};

///////////////////////////////////////////////////////////////////////
//	Info Canthar im Knast
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_CANTHARANGEPISST(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 2;
	condition		= DIA_Canthar_CANTHARANGEPISST_Condition;
	information		= DIA_Canthar_CANTHARANGEPISST_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Canthar_CANTHARANGEPISST_Condition()
{
	if ((Canthar_Ausgeliefert == TRUE) // SC hat Canthar bei Andre verpfiffen!
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_KASERN_RENGARU") <= 1000)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Canthar_CANTHARANGEPISST_Info()
{
	AI_Output(self, other, "DIA_Canthar_CANTHARANGEPISST_09_00"); //我 警 告 过 你 ， 但 是 ， 你 不 愿 意 听 。 我 们 以 后 再 商 量 这 件 事 。
	AI_Output(self, other, "DIA_Canthar_CANTHARANGEPISST_09_01"); //现 在 走 吧 ， 我 想 要 休 息 了 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info MinenAnteil
///////////////////////////////////////////////////////////////////////
instance DIA_Canthar_MinenAnteil(C_INFO)
{
	npc				= Vlk_468_Canthar;
	nr				= 3;
	condition		= DIA_Canthar_MinenAnteil_Condition;
	information		= DIA_Canthar_MinenAnteil_Info;
	description		= "你 在 出 售 非 法 的 矿 井 股 票 ！";
};

func int DIA_Canthar_MinenAnteil_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Serpentes_MinenAnteil_KDF == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Canthar_WhatOffer)))
	{
		return TRUE;
	};
};

func void DIA_Canthar_MinenAnteil_Info()
{
	AI_Output(other, self, "DIA_Canthar_Minenanteil_15_00"); //你 在 出 售 非 法 的 矿 井 股 票 ！
	AI_Output(self, other, "DIA_Canthar_Minenanteil_09_01"); //是 的 ， 还 有 吗 ？ 那 又 怎 么 样 ！ 如 果 我 不 去 做 ， 别 人 也 会 去 的 。
	B_GivePlayerXP(XP_Ambient);
};
