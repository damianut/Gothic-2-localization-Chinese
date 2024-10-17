//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Kjorn_EXIT(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 999;
	condition		= DIA_Kjorn_EXIT_Condition;
	information		= DIA_Kjorn_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Kjorn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_Kjorn_Hello(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 4;
	condition		= DIA_Kjorn_Hello_Condition;
	information		= DIA_Kjorn_Hello_Info;
	important		= TRUE;
};

func int DIA_Kjorn_Hello_Condition()
{
	if (Npc_GetDistToNpc(self, hero) < 300)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_Hello_Info()
{
	AI_Output(self, other, "DIA_Kjorn_Hello_06_00"); //嘿 ， 来 这 里 ！
	AI_Output(other, self, "DIA_Kjorn_Hello_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Kjorn_Hello_06_02"); //这 座 山 谷 是 一 个 很 危 险 的 地 方 ， 没 有 象 样 的 武 器 ， 你 会 立 刻 死 掉 。
	AI_Output(other, self, "DIA_Kjorn_Hello_15_03"); //我 猜 你 已 经 有 了 合 适 的 装 备 。
	AI_Output(self, other, "DIA_Kjorn_Hello_06_04"); //你 猜 到 了 。 我 也 许 可 以 把 它 卖 给 你 。
};

//*********************************************************************
//	Info TRADE
//*********************************************************************
instance DIA_Kjorn_TRADE(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 4;
	condition		= DIA_Kjorn_TRADE_Condition;
	information		= DIA_Kjorn_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 可 以 给 我 提 供 一 些 什 么 ？";
};

func int DIA_Kjorn_TRADE_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_TRADE_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Kjorn_TRADE_15_00"); //你 可 以 给 我 提 供 一 些 什 么 ？
};

//*********************************************************************
//	Verkaufst du auch Informationen?
//*********************************************************************
instance DIA_Kjorn_SellInfos(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 5;
	condition		= DIA_Kjorn_SellInfos_Condition;
	information		= DIA_Kjorn_SellInfos_Info;
	description		= "你 也 出 售 信 息 吗 ？";
};

func int DIA_Kjorn_SellInfos_Condition()
{
	return TRUE;
};

func void DIA_Kjorn_SellInfos_Info()
{
	AI_Output(other, self, "DIA_Kjorn_SellInfos_15_00"); //你 也 出 售 信 息 吗 ？
	AI_Output(self, other, "DIA_Kjorn_SellInfos_06_01"); //那 要 看 价 钱 是 否 合 适 ， 我 会 告 诉 你 我 知 道 的 所 有 事 。
	AI_Output(other, self, "DIA_Kjorn_SellInfos_15_02"); //你 需 要 多 少 ？
	AI_Output(self, other, "DIA_Kjorn_SellInfos_06_03"); //嗯 … … 很 难 讲 。 但 是 我 想50枚 金 币 换 我 告 诉 你 的 每 条 信 息 应 该 还 行 。
};

//*********************************************************************
//	Ich brauche Infos über..
//*********************************************************************
instance DIA_Kjorn_BuyInfos(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 5;
	condition		= DIA_Kjorn_BuyInfos_Condition;
	information		= DIA_Kjorn_BuyInfos_Info;
	permanent		= TRUE;
	description		= "我 需 要 一 些 信 息 。";
};

func int DIA_Kjorn_BuyInfos_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Kjorn_SellInfos))
	{
		return TRUE;
	};
};

func void DIA_Kjorn_BuyInfos_Info()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_15_00"); //我 需 要 一 些 信 息 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_06_01"); //5 0个 金 币 ！

	Info_ClearChoices(DIA_Kjorn_BuyInfos);
	Info_AddChoice(DIA_Kjorn_BuyInfos, "那 对 我 来 说 太 贵 了 。", DIA_Kjorn_BuyInfos_HoldMoney);

	if (Npc_HasItems(other, ItMi_Gold) >= 50)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "是 的 ， 给 。", DIA_Kjorn_BuyInfos_GiveMoney);
	};
};

func void DIA_Kjorn_BuyInfos_HoldMoney()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_HoldMoney_15_00"); //那 对 我 来 说 太 贵 了 。
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_GiveMoney()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_GiveMoney_15_00"); //是 的 ， 给 。

	B_GiveInvItems(other, self, ItMi_Gold, 50);

	AI_Output(other, self, "DIA_Kjorn_BuyInfos_GiveMoney_15_01"); //现 在 告 诉 我 … …

	Info_ClearChoices(DIA_Kjorn_BuyInfos);

	// ----- Zurück -----

	Info_AddChoice(DIA_Kjorn_BuyInfos, DIALOG_BACK, DIA_Kjorn_BuyInfos_Back);

	// ----- Die Drachen -----

	if (KjornToldDragon == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 龙 的 事 。", DIA_Kjorn_BuyInfos_Dragon1);
	}
	else if (KjornToldDragon == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 龙 的 事。", DIA_Kjorn_BuyInfos_Dragon2);
	};

	// ----- Das Minental -----

	if (KjornToldColony == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 矿 藏 山 谷.", DIA_Kjorn_BuyInfos_Colony1);
	}
	else if (KjornToldColony == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 更 多 关 于 矿 藏 山 谷 的 事 。", DIA_Kjorn_BuyInfos_Colony2);
	};

	// ----- die Burg -----

	if (KJornToldOldCamp == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 城 堡 。", DIA_Kjorn_BuyInfos_OldCamp1);
	};

	// ----- Die Orks -----

	if (KjornToldOrks == 0)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 兽 人 。", DIA_Kjorn_BuyInfos_Orks1);
	}
	else if (KjornToldOrks == 1)
	{
		Info_AddChoice(DIA_Kjorn_BuyInfos, "… … 关 于 兽 人 。", DIA_Kjorn_BuyInfos_Orks2);
	};
};

// ------ Zurück -----

func void DIA_Kjorn_BuyInfos_Back()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Back_15_00"); //你 知 道 ， 马 上 把 我 的 钱 还 我 ， 我 改 变 主 意 了 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Back_06_01"); //你 自 便 吧 。

	B_GiveInvItems(self, other, ItMi_Gold, 50);
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

// ----- Die Drachen -----

func void DIA_Kjorn_BuyInfos_Dragon1()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Dragon1_15_00"); //告 诉 我 关 于 龙 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon1_06_01"); //龙 是 古 老 、 异 常 强 大 的 生 物 。 他 们 曾 经 有 数 千 只 生 活 在 世 界 各 地 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon1_06_02"); //过 去 的 几 百 年 里 ， 没 有 人 再 见 过 他 们 中 的 任 何 一 只 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon1_06_03"); //他 们 的 血 像 沸 腾 的 油 一 样 热 。 如 果 他 们 望 向 你 的 眼 睛 ， 你 的 心 脏 就 会 变 成 石 头,这 个 是 我 听 说 的 … …

	KjornToldDragon = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Dragon2()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Dragon2_15_00"); //再 和 我 多 说 一 点 关 于 龙 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon2_06_01"); //但 是 所 有 的 龙 都 是 不 同 的 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon2_06_02"); //他 们 之 中 有 一 些 甚 至 可 以 用 几 英 尺 厚 的 冰 层 覆 盖 整 片 大 地 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Dragon2_06_03"); //还 有 一 些 喜 欢 居 住 在 沼 泽 中 ， 或 者 火 山 里 。

	B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_9);

	KjornToldDragon = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

// ----- Das Minental -----

func void DIA_Kjorn_BuyInfos_Colony1()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Colony1_15_00"); //告 诉 我 关 于 矿 藏 山 谷 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony1_06_01"); //克 霍 里 尼 斯 的 矿 藏 山 谷 因 为 它 的 魔 法 矿 石 而 闻 名 于 世 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony1_06_02"); //这 些 山 脉 是 唯 一 可 以 找 到 魔 法 矿 石 的 地 方 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony1_06_03"); //使 用 这 种 矿 石 铸 造 的 武 器 实 际 上 无 坚 不 摧 ， 并 可 以 切 开 最 坚 硬 的 盔 甲 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony1_06_04"); //直 到 几 周 前 ， 整 个 山 谷 还 被 一 个 魔 法 屏 障 环 绕 着 。 它 是 无 法 逾 越 的 ， 任 何 人 都 无 法 出 去 。

	KjornToldColony = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Colony2()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Colony2_15_00"); //多 告 诉 我 一 些 关 于 矿 藏 山 谷 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony2_06_01"); //这 些 天 来 ， 山 谷 的 变 化 很 大 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony2_06_02"); //当 兽 人 到 来 的 时 候 ， 其 它 可 怕 的 生 物 也 同 时 出 现 ， 都 是 一 些 以 前 从 来 没 有 在 这 里 发 现 过 的 东 西 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony2_06_03"); //他 们 说 附 近 还 有 一 些 孤 单 的 猎 手 ， 但 是 我 不 能 确 定 他 们 是 否 还 活 着 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Colony2_06_04"); //似 乎 贝 利 尔 的 所 有 生 物 都 在 这 座 山 谷 里 聚 集 起 来 。

	KjornToldColony = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

// ----- Die Burg -----

func void DIA_Kjorn_BuyInfos_OldCamp1()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_OldCamp1_15_00"); //告 诉 我 关 于 城 堡 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_OldCamp1_06_01"); //它 的 位 置 非 常 靠 近 矿 藏 山 谷 的 中 心 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_OldCamp1_06_02"); //在 山 谷 还 是 一 座 监 狱 时 ， 矿 石 大 亨 从 那 里 控 制 全 部 的 矿 石 交 易 。

	KjornToldOldCamp = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

// ----- Die Orks -----

func void DIA_Kjorn_BuyInfos_Orks1()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Orks1_15_00"); //告 诉 我 关 于 兽 人 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Orks1_06_01"); //兽 人 才 到 这 里 不 久 。 至 少 是 指 城 堡 前 面 那 些 兽 人 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Orks1_06_02"); //但 是 我 很 奇 怪 ， 他 们 怎 么 能 组 织 的 那 么 好 。 兽 人 通 常 会 盲 目 地 攻 击 ， 什 么 都 不 管 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Orks1_06_03"); //这 些 兽 人 正 在 等 时 间 。 他 们 一 直 在 等 ， 不 过 我 们 不 知 道 为 什 么 。

	KjornToldOrks = 1;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

func void DIA_Kjorn_BuyInfos_Orks2()
{
	AI_Output(other, self, "DIA_Kjorn_BuyInfos_Orks2_15_00"); //多 告 诉 我 一 些 关 于 兽 人 的 事 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Orks2_06_01"); //兽 人 是 由 精 英 战 士 率 领 的 。 那 些 战 士 非 常 强 壮 ， 并 且 全 副 武 装 。 要 想 击 败 他 们 ， 简 直 不 可 能 。
	AI_Output(self, other, "DIA_Kjorn_BuyInfos_Orks2_06_02"); //我 曾 经 见 过 他 们 中 的 一 个 一 斧 子 就 把 一 棵 大 橡 树 砍 倒 。

	KjornToldOrks = 2;
	Info_ClearChoices(DIA_Kjorn_BuyInfos);
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Kjorn_AllDragonsDead(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 5;
	condition		= DIA_Kjorn_AllDragonsDead_Condition;
	information		= DIA_Kjorn_AllDragonsDead_Info;
	description		= "我 把 所 有 的 龙 都 杀 了 ！";
};

func int DIA_Kjorn_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Kjorn_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Kjorn_AllDragonsDead_15_00"); //我 把 所 有 的 龙 都 杀 了 ！
	AI_Output(self, other, "DIA_Kjorn_AllDragonsDead_06_01"); //（ 大 笑 ） 当 然 ， 我 是 一 个 圣 骑 士 。
	AI_Output(self, other, "DIA_Kjorn_AllDragonsDead_06_02"); //你 也 许 杀 了 他 们 一 个 ， 但 是 他 们 所 有 人 ？ 去 找 别 的 人 相 信 你 吧 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Kjorn_PICKPOCKET(C_INFO)
{
	npc				= DJG_710_Kjorn;
	nr				= 900;
	condition		= DIA_Kjorn_PICKPOCKET_Condition;
	information		= DIA_Kjorn_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Kjorn_PICKPOCKET_Condition()
{
	C_Beklauen(47, 75);
};

func void DIA_Kjorn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET, DIALOG_BACK, DIA_Kjorn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kjorn_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Kjorn_PICKPOCKET_DoIt);
};

func void DIA_Kjorn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};

func void DIA_Kjorn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kjorn_PICKPOCKET);
};
