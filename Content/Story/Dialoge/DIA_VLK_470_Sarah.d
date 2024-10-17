///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_EXIT(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 999;
	condition		= DIA_Sarah_EXIT_Condition;
	information		= DIA_Sarah_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sarah_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sarah_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sarah_PICKPOCKET(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 900;
	condition		= DIA_Sarah_PICKPOCKET_Condition;
	information		= DIA_Sarah_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Sarah_PICKPOCKET_Condition()
{
	C_Beklauen(57, 60);
};

func void DIA_Sarah_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
	Info_AddChoice(DIA_Sarah_PICKPOCKET, DIALOG_BACK, DIA_Sarah_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sarah_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sarah_PICKPOCKET_DoIt);
};

func void DIA_Sarah_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

func void DIA_Sarah_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sarah_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Greet
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Greet(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 1;
	condition		= DIA_Sarah_Greet_Condition;
	information		= DIA_Sarah_Greet_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Sarah_Greet_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Greet_Info()
{
	AI_Output(self, other, "DIA_Sarah_Add_16_07"); //啊 ！ 你 又 来 了 ！
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_HALLO(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 0;
	condition		= DIA_Sarah_HALLO_Condition;
	information		= DIA_Sarah_HALLO_Info;
	description		= "最 近 生 意 好 吗 ？ ";
};

func int DIA_Sarah_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Sarah_HALLO_Info()
{
	AI_Output(other, self, "DIA_Sarah_HALLO_15_00"); //最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_Sarah_HALLO_16_01"); //当 那 些 圣 骑 士 来 的 时 候 ， 我 开 始 还 以 为 那 是 个 很 好 的 商 业 机 会 呢 。
	AI_Output(self, other, "DIA_Sarah_HALLO_16_02"); //但 是 ， 他 们 要 哈 莱 德 给 他 们 造 武 器 ， 而 哈 肯 和 我 连 一 分 钱 都 没 挣 到 他 们 的 。
	AI_Output(self, other, "DIA_Sarah_HALLO_16_03"); //此 外 ， 那 些 农 场 主 不 再 给 我 们 供 应 食 物 ， 然 后 所 有 的 价 格 都 上 涨 了 。
	AI_Output(self, other, "DIA_Sarah_Add_16_00"); //唯 一 的 安 慰 是 ， 那 些 圣 骑 士 还 在 支 付 我 的 旅 馆 账 单 。

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_2);
};

///////////////////////////////////////////////////////////////////////
//	Info Bauern
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Bauern(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 2;
	condition		= DIA_Sarah_Bauern_Condition;
	information		= DIA_Sarah_Bauern_Info;
	description		= "农 民 出 了 什 么 问 题 ？ ";
};

func int DIA_Sarah_Bauern_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Bauern_Info()
{
	AI_Output(other, self, "DIA_Sarah_Bauern_15_00"); //农 民 出 了 什 么 问 题 ？
	AI_Output(self, other, "DIA_Sarah_Bauern_16_01"); //他 们 拒 绝 发 送 他 们 的 货 物 。
	AI_Output(self, other, "DIA_Sarah_Bauern_16_02"); //现 在 那 些 船 只 都 不 来 了 ， 当 然 ， 整 个 城 市 都 要 靠 那 些 农 民 来 维 持 供 给 。
	AI_Output(self, other, "DIA_Sarah_Bauern_16_03"); //而 欧 纳 尔 ， 最 大 的 农 场 主 ， 他 聘 请 了 雇 佣 兵 保 卫 他 的 农 场 不 被 城 市 守 卫 进 攻 。 否 则 ， 他 们 将 会 夺 取 那 些 货 物 占 为 己 有 。
	AI_Output(self, other, "DIA_Sarah_Add_16_01"); //不 过 ， 雇 佣 兵 不 光 是 守 卫 欧 纳 尔 的 农 场 。
	AI_Output(self, other, "DIA_Sarah_Add_16_02"); //他 们 总 是 跑 到 城 外 的 一 些 小 农 场 那 里 ， 并 威 胁 那 些 农 场 主 。
	AI_Output(self, other, "DIA_Sarah_Add_16_03"); //我 经 过 阿 基 尔 的 农 场 时 看 见 了 他 们 。 我 现 在 可 不 喜 欢 处 于 他 们 那 种 境 地 。
};

///////////////////////////////////////////////////////////////////////
//	Info AkilsHof
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_AkilsHof(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 3;
	condition		= DIA_Sarah_AkilsHof_Condition;
	information		= DIA_Sarah_AkilsHof_Info;
	description		= "我 到 哪 里 去 找 阿 基 尔 的 农 场 ？";
};

func int DIA_Sarah_AkilsHof_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sarah_Bauern))
	{
		return TRUE;
	};
};

func void DIA_Sarah_AkilsHof_Info()
{
	AI_Output(other, self, "DIA_Sarah_AkilsHof_15_00"); //我 到 哪 里 去 找 阿 基 尔 的 农 场 ？
	AI_Output(self, other, "DIA_Sarah_Add_16_04"); //如 果 你 从 这 里 出 东 门 ， 沿 着 路 往 右 边 走 ， 你 会 到 达 一 个 阶 梯 路 。
	AI_Output(self, other, "DIA_Sarah_Add_16_05"); //它 就 是 通 往 阿 基 尔 的 农 场 的 。
	AI_Output(self, other, "DIA_Sarah_Add_16_06"); //但 是 ， 我 现 在 不 会 去 那 里 - 那 些 雇 佣 兵 肯 定 还 在 那 里 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Trade(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 99;
	condition		= DIA_Sarah_Trade_Condition;
	information		= DIA_Sarah_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Sarah_Trade_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Sarah_HALLO))
	&& (MIS_Canthars_KomproBrief != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Sarah_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Sarah_Trade_15_00"); //让 我 看 看 你 的 货 物 。

	Sarah_WaffenGesehen = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info ImKnast
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_IMKNAST(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 99;
	condition		= DIA_Sarah_IMKNAST_Condition;
	information		= DIA_Sarah_IMKNAST_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Sarah_IMKNAST_Condition()
{
	if ((MIS_Canthars_KomproBrief == LOG_SUCCESS)
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Sarah_IMKNAST_Info()
{
	AI_Output(self, other, "DIA_Sarah_IMKNAST_16_00"); //你 ！ 你 胆 敢 在 这 里 露 面 ！ 我 没 有 证 据 ， 但 是 ， 我 打 赌 你 在 这 个 肮 脏 的 游 戏 中 扮 演 了 某 个 角 色 。
	AI_Output(self, other, "DIA_Sarah_IMKNAST_16_01"); //我 之 所 以 在 这 里 都 是 你 的 错 。 你 的 ， 还 有 那 个 该 死 的 坎 萨 的 - 愿 英 诺 斯 惩 罚 你 们 ！

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Sarah_Success(C_INFO)
{
	npc				= VLK_470_Sarah;
	nr				= 4;
	condition		= DIA_Sarah_Success_Condition;
	information		= DIA_Sarah_Success_Info;
	description		= "坎 萨 想 要 欺 骗 你 … …";
};

func int DIA_Sarah_Success_Condition()
{
	if (Canthar_Ausgeliefert == TRUE)
	// || (MIS_Canthars_KomproBrief == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void DIA_Sarah_Success_Info()
{
	AI_Output(other, self, "DIA_Sarah_Success_15_00"); //坎 萨 想 要 对 你 耍 花 招 ， 他 想 把 你 的 货 摊 占 为 己 有 。 不 过 。 我 把 他 送 到 城 市 守 卫 那 里 去 了 。
	AI_Output(self, other, "DIA_Sarah_Success_16_01"); //那 么 ， 你 让 一 个 危 险 的 家 伙 变 成 了 你 的 敌 人 。 我 认 识 这 个 混 蛋 很 久 了 ， 而 他 总 是 想 把 我 的 地 盘 据 为 己 有 。
	AI_Output(self, other, "DIA_Sarah_Success_16_02"); //拿 着 这 把 武 器 表 示 我 的 一 点 感 激 之 情 。

	B_GivePlayerXP(XP_CantharImKnast);
	B_GiveInvItems(self, other, ItMw_Piratensaebel, 1);
};
