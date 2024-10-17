// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Gritta_EXIT(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 999;
	condition		= DIA_Gritta_EXIT_Condition;
	information		= DIA_Gritta_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gritta_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Gritta_PICKPOCKET(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 900;
	condition		= DIA_Gritta_PICKPOCKET_Condition;
	information		= DIA_Gritta_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20_Female;
};

func int DIA_Gritta_PICKPOCKET_Condition()
{
	C_Beklauen(20, 20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET, DIALOG_BACK, DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Gritta_Hello(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 10;
	condition		= DIA_Gritta_Hello_Condition;
	information		= DIA_Gritta_Hello_Info;
	important		= TRUE;
};

func int DIA_Gritta_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self, other, "DIA_Gritta_Hello_16_00"); //你 想 干 什 么 ， 陌 生 人 ？ 如 果 你 是 来 乞 讨 的 ， 我 会 让 你 失 望 的 。 我 是 一 个 穷 寡 妇 。
	AI_Output(self, other, "DIA_Gritta_Hello_16_01"); //我 叫 格 里 塔 。 自 从 我 的 丈 夫 去 世 后 ， 我 就 一 直 给 我 的 叔 父 - 托 尔 本 干 家 务 活 。
};

//*************************************************************
//			Matteo will sein Geld
//*************************************************************
instance DIA_Gritta_WantsMoney(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 2;
	condition		= DIA_Gritta_WantsMoney_Condition;
	information		= DIA_Gritta_WantsMoney_Info;
	description		= "麦 迪 欧 派 我 来 的 。 你 还 欠 他 一 些 钱 。 ";
};

func int DIA_Gritta_WantsMoney_Condition()
{
	if (MIS_Matteo_Gold == LOG_RUNNING)
	{
		return TRUE;
	};
};

// ------------------------------------
var int Gritta_WantPay;
var int Gritta_Threatened;
// ------------------------------------
func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other, self, "DIA_Gritta_WantsMoney_15_00"); //麦 迪 欧 派 我 来 的 。 你 还 欠 他 一 些 钱 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_16_01"); //他 想 要 他 的 钱 ？ 为 什 么 ？ 他 给 我 的 货 物 有 毛 病 ， 布 料 很 差 ， 做 工 也 不 好 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_16_02"); //而 且 ， 你 看 见 那 些 颜 色 了 吗 ？ 那 不 是 我 定 制 的 颜 色 。 那 是 件 假 货 ， 是 的 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_16_03"); //我 告 诉 你 ， 当 我 丈 夫 还 在 世 时 ， 他 可 不 敢 这 么 做 。 哦 ， 我 可 怜 的 丈 夫 … …

	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "停 下 。 钱 在 哪 里 ？", DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "继 续 … …", DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self, other, "DIA_Gritta_WantsMoney_continue01_16_00"); //… … 他 是 个 多 么 好 的 人 啊 。 英 俊 、 勤 勉 、 老 一 派 的 绅 士 。 我 们 什 么 都 有 ， 财 富 、 快 乐 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue01_16_01"); //… … 有 时 我 们 甚 至 被 邀 请 参 加 上 流 社 会 的 活 动 。 庆 典 活 动 、 所 有 漂 亮 的 衣 服 和 发 型 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue01_16_02"); //… … 美 味 的 晚 餐 和 文 明 的 交 谈 。 那 时 的 一 切 都 比 现 在 好 。 没 有 人 敢 羞 辱 一 个 可 怜 的 寡 妇 的 心 ， 还 提 出 如 此 … …

	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "停 下 。 钱 在 哪 里 ？", DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "继 续 … …", DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self, other, "DIA_Gritta_WantsMoney_continue02_16_00"); //… … 荒 谬 的 要 求 。 我 该 做 些 什 么 ？ 我 的 养 老 金 刚 好 够 我 维 持 生 活 ， 而 且 日 子 越 来 越 不 好 过 。 每 个 人 都 看 得 到 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue02_16_01"); //… … 人 们 必 须 精 打 细 算 和 节 约 。 这 座 城 已 经 有 好 几 个 星 期 没 有 船 来 过 了 。 我 的 丈 夫 是 一 艘 商 船 的 船 长 - 实 际 上 ， 他 曾 经 拥 有 这 艘 船 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue02_16_02"); //… … 每 次 他 远 航 回 来 ， 都 总 是 给 我 带 回 礼 物 - 从 大 陆 来 的 精 致 的 布 料 、 来 自 南 方 国 度 的 珍 贵 的 香 料 … …

	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "停 下 。 钱 在 哪 里 ？", DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "继 续 … …", DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self, other, "DIA_Gritta_WantsMoney_continue03_16_00"); //… … 大 部 分 的 人 连 听 都 没 听 说 过 这 些 东 西 。 可 是 ， 有 一 天 得 到 消 息 说 格 里 塔 沉 没 了 - 那 是 那 艘 船 的 名 字 ， 我 丈 夫 给 它 取 这 个 名 字 是 因 为 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue03_16_01"); //… … 对 我 的 爱 。 我 以 泪 洗 面 祈 求 我 的 丈 夫 在 灾 难 中 幸 存 下 来 了 ， 每 天 我 都 希 望 听 到 他 的 消 息 ， 但 是 我 所 有 的 渴 望 都 是 徒 劳 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue04_16_02"); //… … 愿 英 诺 斯 怜 悯 他 的 灵 魂 。 愿 他 安 息 。 从 那 时 起 我 就 一 直 在 这 种 俭 朴 的 环 境 中 度 日 ， 而 现 在 这 个 卑 鄙 无 情 的 麦 迪 欧 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_Continue04_16_03"); //… … 企 图 霸 占 我 最 后 的 一 点 毕 生 积 蓄 。 请 你 怜 悯 一 个 可 怜 的 女 人 。 那 时 我 丈 夫 还 在 的 时 候 ， 他 是 不 敢 这 么 做 的 。 哦 ， 我 可 怜 的 丈 夫 … …

	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "停 下 。 钱 在 哪 里 ？", DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "继 续 … …", DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other, self, "DIA_Gritta_WantsMoney_WhereMoney_15_00"); //停 下 。 钱 在 哪 里 ？
	AI_Output(self, other, "DIA_Gritta_WantsMoney_WhereMoney_16_01"); //（ 不 服 从 ） 我 没 有 钱 ， 我 只 是 个 穷 寡 妇 ！

	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, "交 出 你 的 钱 ， 否 则 就 打 死 你 。 ", DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney, "我 想 我 们 必 须 卖 你 东 西 … …", DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney, "我 会 帮 你 付 账 。", DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other, self, "DIA_Gritta_WantsMoney_EnoughStuff_15_00"); //那 我 们 就 卖 掉 你 的 几 件 衣 服 。 我 敢 肯 定 你 还 有 很 多 东 西 放 在 你 的 柜 子 里 … …
	AI_Output(self, other, "DIA_Gritta_WantsMoney_EnoughStuff_16_01"); //你 怎 么 敢 ， 你 这 个 粗 野 的 笨 蛋 ！ 好 吧 ， 给 ， 拿 着 钱 。
	B_GiveInvItems(self, other, ItMi_Gold, 100);
	AI_Output(other, self, "DIA_Gritta_WantsMoney_EnoughStuff_15_02"); //（ 咧 着 嘴 笑 ） 看 看 ， 这 并 不 很 难 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_EnoughStuff_16_03"); //（ 尖 刻 的 ） 那 么 请 你 马 上 离 开 我 的 房 子 。

	Gritta_GoldGiven = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other, self, "DIA_Gritta_WantsMoney_IWillPay_15_00"); //我 会 帮 你 付 账 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_IWillPay_16_01"); //你 会 帮 我 ？ 哦 ， 我 知 道 你 不 像 那 个 麦 迪 欧 那 样 贪 得 无 厌 ！
	AI_Output(other, self, "DIA_Gritta_WantsMoney_IWillPay_15_02"); //是 的 ， 是 的 ， 没 关 系 。
	AI_Output(self, other, "DIA_Gritta_WantsMoney_IWillPay_16_03"); //你 办 好 那 件 事 了 就 回 来 - 我 想 向 你 表 达 感 激 之 情 。
	Info_ClearChoices(DIA_Gritta_WantsMoney);

	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other, self, "DIA_Gritta_WantsMoney_BeatUp_15_00"); //（ 恐 吓 ） 交 出 你 的 钱 ， 否 则 就 打 死 你 ！
	AI_Output(self, other, "DIA_Gritta_WantsMoney_BeatUp_16_01"); //（ 不 服 从 ） 你 只 是 一 个 小 流 氓 。 动 手 吧 ， 拿 起 你 的 武 器 ， 我 会 把 守 卫 叫 来 ！

	Gritta_Threatened = TRUE;

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WINE
///////////////////////////////////////////////////////////////////////
instance DIA_Gritta_WINE(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 2;
	condition		= DIA_Gritta_WINE_Condition;
	information		= DIA_Gritta_WINE_Info;
	important		= TRUE;
};

func int DIA_Gritta_WINE_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Gritta_WantPay == TRUE)
	&& (MIS_Matteo_Gold == LOG_SUCCESS)
	&& (Npc_HasItems(self, itmi_gold) >= 100))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self, other, "DIA_Gritta_WINE_16_00"); //你 能 为 我 付 钱 真 是 太 高 尚 了 。 我 想 向 你 表 达 感 激 之 情 。
	AI_Output(self, other, "DIA_Gritta_WINE_16_01"); //这 儿 有 一 瓶 酒 是 我 丈 夫 — — 愿 英 诺 斯 让 他 安 息 — — 从 南 部 的 岛 屿 带 回 来 的 。
	AI_Output(self, other, "DIA_Gritta_WINE_16_02"); //还 有 ， 我 打 算 把 消 息 散 播 出 去 。 在 城 里 终 于 有 一 个 人 ， 他 的 美 德 … …
	AI_Output(other, self, "DIA_Gritta_WINE_15_03"); //是 的 ， 是 的 ， 没 关 系 。

	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self, other, Itfo_Wine, 1);

	AI_StopProcessInfos(self);
};

// *************************************************************
//							PERM (1u2)
// *************************************************************
instance DIA_Gritta_PERM(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 3;
	condition		= DIA_Gritta_PERM_Condition;
	information		= DIA_Gritta_PERM_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Gritta_PERM_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Gritta_WantsMoney))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if ((Npc_KnowsInfo(other, DIA_Gritta_WINE))
	&& (Npc_HasItems(self, itmi_gold) >= 100))
	{
		AI_Output(self, other, "DIA_Gritta_PERM_16_00"); //只 要 城 里 还 有 你 这 样 的 人 ， 我 就 还 有 希 望 ， 盼 望 一 切 都 会 变 得 好 起 来 。
	}
	else if ((Gritta_WantPay == TRUE)
	&& (Npc_HasItems(self, itmi_gold) >= 100))
	{
		AI_Output(self, other, "DIA_Gritta_PERM_16_01"); //等 你 解 决 好 了 麦 迪 欧 那 件 事 就 回 来 。
	}
	else if ((Gritta_Threatened == TRUE)
	&& (Npc_HasItems(self, itmi_gold) >= 100))
	{
		AI_Output(self, other, "DIA_Gritta_PERM_16_02"); //为 什 么 你 像 个 白 痴 一 样 的 盯 着 看 ？ 至 少 ， 你 不 敢 攻 击 我 ！
	}
	else // Gritta_GoldGiven oder niedergeschlagen
	{
		AI_Output(self, other, "DIA_Gritta_PERM_16_03"); //你 还 想 要 什 么 ？ 你 已 经 拿 到 我 的 钱 了 ！ 走 开 ！
	};

	AI_StopProcessInfos(self);
};

// ###########################################
// ##
// ## Kapitel 3
// ##
// ###########################################

// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Gritta_Kap3_EXIT(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 999;
	condition		= DIA_Gritta_Kap3_EXIT_Condition;
	information		= DIA_Gritta_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
//		Perm3U4U5
// ************************************************************

// ------------------------------------
var int GrittaXP_Once;
// -----------------------------
instance DIA_Gritta_Perm3U4U5(C_INFO)
{
	npc				= VLK_418_Gritta;
	nr				= 31;
	condition		= DIA_Gritta_Perm3U4U5_Condition;
	information		= DIA_Gritta_Perm3U4U5_Info;
	permanent		= TRUE;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Gritta_Perm3U4U5_Condition()
{
	return TRUE;
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other, self, "DIA_Gritta_Perm3U4U5_15_00"); //情 况 怎 么 样 了 ？

	if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_01"); //一 切 都 完 蛋 了 。 无 论 你 看 哪 里 ， 到 处 都 是 犯 罪 和 暴 行 。 只 要 想 像 一 下 ， 他 们 甚 至 连 圣 骑 士 都 谋 杀 了 。

			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, DIALOG_BACK, DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, "发 生 的 这 些 事 ， 都 是 你 自 己 的 事 。", DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, "一 切 都 会 顺 利 。", DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, "你 听 到 了 什 么 ？", DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_02"); //哦 ， 我 很 激 动 ， 哈 根 勋 爵 让 那 个 雇 佣 兵 自 由 了 。
			AI_Output(other, self, "DIA_Gritta_Perm3U4U5_15_03"); //那 会 对 你 有 什 么 影 响 吗 ？
			AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_04"); //想 一 想 吧 。 你 会 相 信 其 它 的 雇 佣 兵 会 袖 手 旁 观 看 着 自 己 的 伙 伴 被 绞 死 吗 ？
			AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_05"); //他 们 一 定 会 去 营 救 他 ， 那 就 会 造 成 很 多 流 血 事 件 。 我 只 能 感 谢 英 诺 斯 。
		};
	}
	else if (Kapitel == 5)
	{
		AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_06"); //那 些 圣 骑 士 就 要 准 备 好 了 ， 看 来 他 们 马 上 就 要 行 动 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Gritta_Perm3U4U5_16_07"); //跟 往 常 一 样 ， 但 是 ， 我 不 想 抱 怨 。
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other, self, "DIA_Gritta_Perm3U4U5_War_15_00"); //发 生 的 这 些 事 ， 都 是 你 自 己 的 事 。
	AI_Output(self, other, "DIA_Gritta_Perm3U4U5_War_16_01"); //是 的 ， 罪 魁 祸 首 就 是 这 场 可 怕 的 战 争 。 每 一 个 人 都 在 痛 苦 中 等 待 着 看 他 们 会 怎 样 应 付 。
	AI_Output(self, other, "DIA_Gritta_Perm3U4U5_War_16_02"); //有 时 我 问 自 己 我 们 究 竟 做 了 些 什 么 而 要 接 受 英 诺 斯 如 此 的 惩 罚 。
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other, self, "DIA_Gritta_Perm3U4U5_TurnsGood_15_00"); //一 切 都 会 顺 利 。
	AI_Output(self, other, "DIA_Gritta_Perm3U4U5_TurnsGood_16_01"); //你 在 鼓 励 我 - 那 很 好 。

	if (GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_AMBIENT);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other, self, "DIA_Gritta_Perm3U4U5_Rumors_15_00"); //你 听 到 了 什 么 ？
	AI_Output(self, other, "DIA_Gritta_Perm3U4U5_Rumors_16_01"); //就 是 他 们 在 街 道 上 谈 论 的 事 情 。
	AI_Output(self, other, "DIA_Gritta_Perm3U4U5_Rumors_16_02"); //我 听 说 他 们 已 经 抓 住 了 谋 杀 者 ， 但 是 ， 我 不 知 道 那 是 不 是 真 的 。
};
