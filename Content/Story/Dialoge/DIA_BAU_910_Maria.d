// ************************************************************
// 								EXIT
// ************************************************************
instance DIA_Maria_EXIT(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 999;
	condition		= DIA_Maria_EXIT_Condition;
	information		= DIA_Maria_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Maria_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Maria_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 								Hallo
// ************************************************************
instance DIA_Maria_Hallo(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 1;
	condition		= DIA_Maria_Hallo_Condition;
	information		= DIA_Maria_Hallo_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Maria_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Maria_Hallo_Info()
{
	AI_Output(other, self, "DIA_Maria_Hallo_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Maria_Hallo_17_01"); //我 是 欧 纳 尔 的 妻 子 ， 玛 丽 亚 。
	AI_Output(self, other, "DIA_Maria_Hallo_17_02"); //你 想 在 这 里 干 什 么 ？
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Umsehen(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 2;
	condition		= DIA_Maria_Umsehen_Condition;
	information		= DIA_Maria_Umsehen_Info;
	description		= "我 只 是 想 在 这 附 近 转 转 … …";
};

func int DIA_Maria_Umsehen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_Umsehen_Info()
{
	AI_Output(other, self, "DIA_Maria_Umsehen_15_00"); //我 只 是 想 在 这 附 近 转 转 … …
	AI_Output(self, other, "DIA_Maria_Umsehen_17_01"); //现 在 农 场 里 有 这 些 人 在 ， 即 使 在 屋 里 也 不 得 安 宁 。
	AI_Output(self, other, "DIA_Maria_Umsehen_17_02"); //他 们 一 直 在 这 里 乱 闯 。
};

// ************************************************************
// 								Umsehen
// ************************************************************
instance DIA_Maria_Soeldner(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 3;
	condition		= DIA_Maria_Soeldner_Condition;
	information		= DIA_Maria_Soeldner_Info;
	description		= "那 些 雇 佣 兵 打 扰 你 的 吗 ？";
};

func int DIA_Maria_Soeldner_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Maria_Umsehen))
	{
		return TRUE;
	};
};

func void DIA_Maria_Soeldner_Info()
{
	AI_Output(other, self, "DIA_Maria_Soeldner_15_00"); //那 些 雇 佣 兵 打 扰 你 的 吗 ？

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Maria_Soeldner_17_01"); //哦 好 吧 ， 别 在 意 我 刚 才 说 的 话 - 自 从 你 们 这 些 家 伙 出 现 之 后 ， 这 里 已 经 安 全 多 了。
	}
	else
	{
		AI_Output(self, other, "DIA_Maria_Soeldner_17_02"); //哦 ， 不 错 ， 自 从 雇 佣 兵 来 这 里 之 后 ， 至 少 农 场 安 全 多 了 。
	};

	AI_Output(self, other, "DIA_Maria_Soeldner_17_03"); //以 前 只 有 我 们 自 己 的 时 候 ， 民 兵 不 断 地 从 镇 上 来 抢 夺 我 们 的 存 粮 。
	AI_Output(self, other, "DIA_Maria_Soeldner_17_04"); //他 们 拿 走 庄 稼 最 好 的 部 分 ， 还 要 牵 走 一 些 羊 ， 而 且 没 有 帮 我 们 做 任 何 事 情 当 作 回 报 。
	AI_Output(self, other, "DIA_Maria_Soeldner_17_05"); //在 那 些 恶 棍 里 面 ， 甚 至 还 有 人 偷 我 们 的 东 西 。
	if (hero.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_Maria_Soeldner_17_06"); //不 要 误 解 我 现 在 说 的 话 ， 士 兵 。 我 知 道 并 不 是 你 们 所 有 人 都 那 样 。
	};
};

// ************************************************************
// 							Mission
// ************************************************************
instance DIA_Maria_Mission(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 4;
	condition		= DIA_Maria_Mission_Condition;
	information		= DIA_Maria_Mission_Info;
	description		= "那 么 他 们 从 你 这 里 偷 走 了 什 么 ？";
};

func int DIA_Maria_Mission_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Maria_Soeldner))
	&& (MIS_Maria_BringPlate != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Maria_Mission_Info()
{
	AI_Output(other, self, "DIA_Maria_Mission_15_00"); //那 么 他 们 从 你 这 里 偷 走 了 什 么 ？
	AI_Output(self, other, "DIA_Maria_Mission_17_01"); //大 部 分 是 金 子 和 银 子 。 他 们 甚 至 拿 走 了 我 的 结 婚 礼 物 ， 一 个 金 盘 子 。
	if (other.guild != GIL_MIL)
	{
		AI_Output(self, other, "DIA_Maria_Mission_17_02"); //我 打 赌 现 在 还 有 一 些 城 市 卫 兵 正 在 箱 子 里 收 集 灰 尘 。
	};

	MIS_Maria_BringPlate = LOG_RUNNING;
};

// ************************************************************
// 							BringPlate
// ************************************************************
instance DIA_Maria_BringPlate(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 5;
	condition		= DIA_Maria_BringPlate_Condition;
	information		= DIA_Maria_BringPlate_Info;
	description		= "我 这 有 个 金 盘 子 。 这 个 也 许 是 你 的 吧 ？";
};

func int DIA_Maria_BringPlate_Condition()
{
	if (Npc_HasItems(other, ItMi_MariasGoldPlate) > 0)
	{
		return TRUE;
	};
};

func void DIA_Maria_BringPlate_Info()
{
	B_GiveInvItems(other, self, ItMi_MariasGoldPlate, 1);
	AI_Output(other, self, "DIA_Maria_BringPlate_15_00"); //我 这 有 个 金 盘 子 。 这 个 也 许 是 你 的 吧 ？
	AI_Output(self, other, "DIA_Maria_BringPlate_17_01"); //对 ！ 就 是 它 ！ 万 分 感 谢 ！

	MIS_Maria_BringPlate = LOG_SUCCESS;
	B_GivePlayerXP(XP_Maria_Teller);
};

// ************************************************************
// 							BringPlate
// ************************************************************
var int Maria_Belohnung;
// ---------------------
instance DIA_Maria_Belohnung(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 6;
	condition		= DIA_Maria_Belohnung_Condition;
	information		= DIA_Maria_Belohnung_Info;
	permanent		= TRUE;
	description		= "那 么 我 的 报 酬 呢 ？";
};

func int DIA_Maria_Belohnung_Condition()
{
	if ((MIS_Maria_BringPlate == LOG_SUCCESS)
	&& (Maria_Belohnung == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Maria_Belohnung_Info()
{
	AI_Output(other, self, "DIA_Maria_Belohnung_15_00"); //那 么 我 的 报 酬 呢 ？

	if ((other.guild == GIL_SLD)
	|| (Npc_KnowsInfo(other, DIA_Onar_HowMuch)))
	{
		AI_Output(self, other, "DIA_Maria_Belohnung_17_01"); //你 是 给 我 的 丈 夫 工 作 的 雇 佣 兵 ， 是 吗 ？
		AI_Output(other, self, "DIA_Maria_Belohnung_15_02"); //是 的 。
		AI_Output(self, other, "DIA_Maria_Belohnung_17_03"); //我 的 丈 夫 付 你 多 少 钱 ？
		B_Say_Gold(other, self, SOLD);
		AI_Output(self, other, "DIA_Maria_Belohnung_17_04"); //那 不 够 。 去 找 他 ， 并 告 诉 他 多 给 你 一 点 。
		AI_Output(other, self, "DIA_Maria_Belohnung_15_05"); //你 觉 得 他 会 那 么 做 吗 ？
		AI_Output(self, other, "DIA_Maria_Belohnung_17_06"); //如 果 他 不 愿 意 的 话 ， 他 知 道 会 发 生 什 么 事 。 相 信 我 。
		Maria_MehrGold = TRUE;
		Maria_Belohnung = TRUE;
	}
	else if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Maria_Belohnung_17_07"); //你 想 在 农 场 这 里 做 雇 佣 兵 吗 ？
		Info_ClearChoices(DIA_Maria_Belohnung);
		Info_AddChoice(DIA_Maria_Belohnung, "不 - 不 太 正 确 。", DIA_Maria_Belohnung_Gold);
		Info_AddChoice(DIA_Maria_Belohnung, "是 的 。", DIA_Maria_Belohnung_SOLD);
	}
	else
	{
		B_GiveInvItems(self, other, itmi_gold, 50);
		Maria_Belohnung = TRUE;
		AI_Output(self, other, "DIA_Maria_Belohnung_17_08"); //给 你 这 个 。 这 是 你 应 得 的。
	};
};

func void DIA_Maria_Belohnung_Gold()
{
	AI_Output(other, self, "DIA_Maria_Belohnung_Gold_15_00"); //不 - 不 太 正 确 。
	B_GiveInvItems(self, other, itmi_gold, 50);
	Maria_Belohnung = TRUE;
	AI_Output(self, other, "DIA_Maria_Belohnung_Gold_17_01"); //那 拿 上 这 些 金 币 作 为 酬 谢 。 这 是 你 应 得 的 。
	Info_ClearChoices(DIA_Maria_Belohnung);
};

func void DIA_Maria_Belohnung_SOLD()
{
	AI_Output(other, self, "DIA_Maria_Belohnung_SOLD_15_00"); //好 的 。
	AI_Output(self, other, "DIA_Maria_Belohnung_SOLD_17_01"); //好 吧 ， 如 果 你 在 这 里 工 作 ， 那 我 会 保 证 你 得 到 足 够 的 薪 水 。
	AI_Output(self, other, "DIA_Maria_Belohnung_SOLD_17_02"); //等 你 和 我 丈 夫 讨 论 过 薪 水 之 后 再 回 来 吧 。
	Info_ClearChoices(DIA_Maria_Belohnung);
};

// ************************************************************
// 							AboutOnar
// ************************************************************
instance DIA_Maria_AboutOnar(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 7;
	condition		= DIA_Maria_AboutOnar_Condition;
	information		= DIA_Maria_AboutOnar_Info;
	description		= "告 诉 我 关 于 欧 纳 尔 的 事 。";
};

func int DIA_Maria_AboutOnar_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_AboutOnar_Info()
{
	AI_Output(other, self, "DIA_Maria_AboutOnar_15_00"); //告 诉 我 关 于 欧 纳 尔 的 事 。
	AI_Output(self, other, "DIA_Maria_AboutOnar_17_01"); //他 是 一 个 好 人 。 就 是 脾 气 有 点 暴 躁 ， 而 且 没 有 耐 心 ， 但 是 我 们 所 有 人 都 有 自 己 的 缺 点 。
	AI_Output(self, other, "DIA_Maria_AboutOnar_17_02"); //我 对 我 的 丈 夫 说 ， 为 什 么 你 要 让 城 里 的 那 些 士 兵 们 那 样 对 你 ？
	AI_Output(self, other, "DIA_Maria_AboutOnar_17_03"); //我 说 做 点 什 么 。
	AI_Output(self, other, "DIA_Maria_AboutOnar_17_04"); //所 以 他 雇 了 雇 佣 兵 。 现 在 我 感 觉 好 像 置 身 于 一 场 战 争 之 中 。
	AI_Output(self, other, "DIA_Maria_AboutOnar_17_05"); //不 过 在 那 个 时 候 ， 我 们 已 经 开 战 了 ， 不 是 吗 ？
};

// ************************************************************
// 							PERM
// ************************************************************
instance DIA_Maria_PERM(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 8;
	condition		= DIA_Maria_PERM_Condition;
	information		= DIA_Maria_PERM_Info;
	description		= "这 里 最 近 发 生 过 什 么 刺 激 的 事 情 吗 ？";
};

func int DIA_Maria_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Maria_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Maria_PERM_Info()
{
	AI_Output(other, self, "DIA_Maria_PERM_15_00"); //这 里 最 近 发 生 过 什 么 刺 激 的 事 情 吗 ？
	if (Kapitel <= 2)
	{
		AI_Output(self, other, "DIA_Maria_PERM_17_01"); //圣 骑 士 们 经 过 了 这 里。
		AI_Output(self, other, "DIA_Maria_PERM_17_02"); //最 初 我 们 以 为 他 们 要 进 攻 农 场 ， 但 是 他 们 向 矿 藏 山 谷 去 了 。
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_Maria_PERM_17_03"); //前 几 天 的 夜 里 ， 瓦 斯 里 把 一 个 小 偷 赶 走 了 。 除 了 那 事 以 外 ， 一 切 都 很 平 静 。
	};

	if (Kapitel >= 4)
	{
		AI_Output(self, other, "DIA_Maria_PERM_17_04"); //自 从 一 些 雇 佣 兵 离 开 之 后 ， 这 里 更 加 安 静 了 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Maria_PICKPOCKET(C_INFO)
{
	npc				= BAU_910_Maria;
	nr				= 900;
	condition		= DIA_Maria_PICKPOCKET_Condition;
	information		= DIA_Maria_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Maria_PICKPOCKET_Condition()
{
	C_Beklauen(60, 110);
};

func void DIA_Maria_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
	Info_AddChoice(DIA_Maria_PICKPOCKET, DIALOG_BACK, DIA_Maria_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maria_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Maria_PICKPOCKET_DoIt);
};

func void DIA_Maria_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};

func void DIA_Maria_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maria_PICKPOCKET);
};
