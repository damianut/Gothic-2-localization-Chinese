// ***********************************************************
// 						 	EXIT
// ***********************************************************
instance DIA_Meldor_EXIT(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 999;
	condition		= DIA_Meldor_EXIT_Condition;
	information		= DIA_Meldor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Meldor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Meldor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ***********************************************************
// 						 	Hallo
// ***********************************************************
instance DIA_Meldor_Hallo(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 2;
	condition		= DIA_Meldor_Hallo_Condition;
	information		= DIA_Meldor_Hallo_Info;
	important		= TRUE;
};

func int DIA_Meldor_Hallo_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Hallo_Info()
{
	AI_Output(self, other, "DIA_Meldor_Hallo_07_00"); //你 想 要 什 么 ？
	AI_Output(other, self, "DIA_Meldor_Hallo_15_01"); //我 本 来 想 在 这 周 围 看 看 … …
	AI_Output(self, other, "DIA_Meldor_Hallo_07_02"); //那 你 到 底 想 往 哪 里 去 ？
};

// ***********************************************************
// 						 	Interessantes
// ***********************************************************
instance DIA_Meldor_Interessantes(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 2;
	condition		= DIA_Meldor_Interessantes_Condition;
	information		= DIA_Meldor_Interessantes_Info;
	description		= "这 里 能 看 到 什 么 有 趣 的 事 ？";
};

func int DIA_Meldor_Interessantes_Condition()
{
	return TRUE;
};

func void DIA_Meldor_Interessantes_Info()
{
	AI_Output(other, self, "DIA_Meldor_Interessantes_15_00"); //这 里 能 看 到 什 么 有 趣 的 事 ？
	AI_Output(self, other, "DIA_Meldor_Interessantes_07_01"); //这 里 有 一 所 妓 院 ， 还 有 一 个 酒 吧 。 店 主 的 名 字 叫 卡 迪 夫 。 如 果 你 需 要 一 些 信 息 ， 找 他 谈 谈 准 没 错 。
	AI_Output(self, other, "DIA_Meldor_Interessantes_07_02"); //顺 便 问 问 ， 你 需 要 钱 吗 ？

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_5);
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_Lehmar(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 3;
	condition		= DIA_Meldor_Lehmar_Condition;
	information		= DIA_Meldor_Lehmar_Info;
	description		= "你 要 放 弃 它 ？";
};

func int DIA_Meldor_Lehmar_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Meldor_Interessantes))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Lehmar_Info()
{
	AI_Output(other, self, "DIA_Meldor_Lehmar_15_00"); //你 要 放 弃 它 ？
	AI_Output(self, other, "DIA_Meldor_Lehmar_07_01"); //（ 厌 烦 的 ） 不 。 不 过 ， 雷 玛 尔 的 房 子 就 在 马 路 对 面 ， 他 是 放 高 利 贷 的 。
	AI_Output(self, other, "DIA_Meldor_Lehmar_07_02"); //我 敢 肯 定 他 会 给 你 几 个 金 币 ， 只 管 去 吧 。
	Npc_ExchangeRoutine(self, "START");
};

// ***********************************************************
// 						 	Arbeitest
// ***********************************************************
instance DIA_Meldor_Arbeitest(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 4;
	condition		= DIA_Meldor_Arbeitest_Condition;
	information		= DIA_Meldor_Arbeitest_Info;
	description		= "你 为 雷 玛 尔 工 作 ？";
};

func int DIA_Meldor_Arbeitest_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Meldor_Lehmar))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Arbeitest_Info()
{
	AI_Output(other, self, "DIA_Meldor_Arbeitest_15_00"); //你 为 雷 玛 尔 工 作 ？
	AI_Output(self, other, "DIA_Meldor_Arbeitest_07_01"); //聪 明 的 孩 子 。
};

// ***********************************************************
// 						 	InsOV
// ***********************************************************
instance DIA_Meldor_InsOV(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 5;
	condition		= DIA_Meldor_InsOV_Condition;
	information		= DIA_Meldor_InsOV_Info;
	description		= "实 际 上 ， 我 正 要 去 富 人 区 … …";
};

func int DIA_Meldor_InsOV_Condition()
{
	return TRUE;
};

func void DIA_Meldor_InsOV_Info()
{
	AI_Output(other, self, "DIA_Meldor_InsOV_15_00"); //实 际 上 ， 我 正 要 去 富 人 区 … …
	AI_Output(self, other, "DIA_Meldor_InsOV_07_01"); //（ 讽 刺 地 ） 是 的 ， 对 。 我 就 要 坐 上 一 艘 船 ， 让 它 带 我 去 拜 见 国 王 了 。
	AI_Output(self, other, "DIA_Meldor_InsOV_07_02"); //自 从 那 些 圣 骑 士 来 了 后 ， 像 你 我 这 样 的 人 已 经 不 能 进 入 富 人 区 了 。
};

// ***********************************************************
// 						 	Citizen
// ***********************************************************
instance DIA_Meldor_Citizen(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 6;
	condition		= DIA_Meldor_Citizen_Condition;
	information		= DIA_Meldor_Citizen_Info;
	description		= "你 是 这 个 城 镇 的 市 民 吗 ？";
};

func int DIA_Meldor_Citizen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Meldor_InsOV))
	{
		return TRUE;
	};
};

func void DIA_Meldor_Citizen_Info()
{
	AI_Output(other, self, "DIA_Meldor_Citizen_15_00"); //你 是 这 个 城 镇 的 市 民 吗 ？
	AI_Output(self, other, "DIA_Meldor_Citizen_07_01"); //如 果 你 是 问 ， 我 是 不 是 住 在 这 里 - 是 的 。 不 过 ， 就 算 是 ， 他 们 也 不 会 让 我 进 入 富 人 区 。
	AI_Output(self, other, "DIA_Meldor_Citizen_07_02"); //只 有 有 钱 人 才 能 进 入 那 里 ， 或 者 是 贫 民 区 的 商 人 和 工 匠 。
	AI_Output(self, other, "DIA_Meldor_Citizen_07_03"); //港 口 区 的 人 没 有 承 担 多 少 克 霍 里 尼 斯 的 责 任 。 这 里 甚 至 都 没 有 一 个 民 兵 来 巡 逻 。
};

// ***********************************************************
// 						 Smoke
// ***********************************************************
instance DIA_Meldor_Smoke(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 5;
	condition		= DIA_Meldor_Smoke_Condition;
	information		= DIA_Meldor_Smoke_Info;
	description		= "我 知 道 我 在 哪 里 能 买 到 烟 草 吗 ？";
};

func int DIA_Meldor_Smoke_Condition()
{
	if (MIS_Andre_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Meldor_Smoke_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	AI_Output(other, self, "DIA_Meldor_Smoke_15_00"); //我 知 道 我 在 哪 里 能 买 到 烟 草 吗 ？

	if (Hlp_IsItem(heroArmor, ItAR_MIl_L) == TRUE)
	{
		AI_Output(self, other, "DIA_Meldor_Smoke_07_01"); //（ 上 下 打 量 ） 不 ， 不 知 道 。
	}
	else
	{
		AI_Output(self, other, "DIA_Meldor_Smoke_07_02"); //如 果 我 是 你 ， 我 会 去 ‘ 红 灯 笼 ’ 碰 碰 运 气 。
	};
};

// ***********************************************************
// 						 	PERM
// ***********************************************************
var int Meldor_DGNews;
// --------------------
instance DIA_Meldor_PERM(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 7;
	condition		= DIA_Meldor_PERM_Condition;
	information		= DIA_Meldor_PERM_Info;
	permanent		= TRUE;
	description		= "这 里 最 近 发 生 过 什 么 刺 激 的 事 情 吗 ？";
};

func int DIA_Meldor_PERM_Condition()
{
	return TRUE;
};

func void DIA_Meldor_PERM_Info()
{
	AI_Output(other, self, "DIA_Meldor_PERM_15_00"); //最 近 发 生 什 么 刺 激 的 事 情 没 有 ？

	if (Kapitel <= 1)
	{
		AI_Output(self, other, "DIA_Meldor_PERM_07_01"); //不 久 前 ， 城 市 守 卫 们 把 整 个 港 口 区 翻 了 个 底 朝 天 。
		AI_Output(self, other, "DIA_Meldor_PERM_07_02"); //他 们 是 在 搜 查 被 盗 的 财 物 。 最 近 这 里 来 了 很 多 贼 。 尤 其 是 在 较 好 一 些 的 住 所 。
		AI_Output(self, other, "DIA_Meldor_PERM_07_03"); //他 们 显 然 是 想 把 一 切 的 过 失 归 咎 于 港 口 区 的 这 些 穷 光 蛋 。
	}
	else if ((Andre_Diebesgilde_aufgeraeumt == TRUE)
	&& (Meldor_DGNews == FALSE))
	{
		AI_Output(self, other, "DIA_Meldor_PERM_07_04"); //我 听 说 他 们 在 下 水 道 消 灭 一 帮 盗 贼 。 所 有 的 贼 都 被 杀 掉 了 。
		Meldor_DGNews = TRUE;
	}
	else if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_Meldor_PERM_07_05"); //他 们 说 矿 藏 山 谷 里 面 有 龙 。 我 非 常 好 奇 ， 想 看 看 那 些 圣 骑 士 什 么 时 候 会 从 这 里 出 发 去 对 付 它 们 。
	}
	else if (Kapitel == 5)
	{
		AI_Output(self, other, "DIA_Meldor_PERM_07_06"); //据 传 闻 说 ， 那 些 龙 都 已 经 死 了 。 一 定 是 有 人 用 一 把 铁 扫 帚 把 那 里 清 扫 了 一 遍 。
	}
	else
	{
		AI_Output(self, other, "DIA_Meldor_PERM_07_07"); //不 。
	};
};

// ***********************************************************
// 						 	Lehmar
// ***********************************************************
instance DIA_Meldor_VonLehmar(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 1;
	condition		= DIA_Meldor_VonLehmar_Condition;
	information		= DIA_Meldor_VonLehmar_Info;
	important		= TRUE;
};

func int DIA_Meldor_VonLehmar_Condition()
{
	if (((Lehmar_GeldGeliehen_Day <= (Wld_GetDay() - 2))
	&& (Lehmar_GeldGeliehen != 0))
	&& (RangerHelp_LehmarKohle == FALSE)
	&& (Lehmar.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Meldor_VonLehmar_Info()
{
	AI_Output(self, other, "DIA_Meldor_VonLehmar_07_00"); //嘿 ， 等 一 下 … …
	AI_Output(self, other, "DIA_Meldor_VonLehmar_07_01"); //我 从 雷 玛 尔 那 里 给 你 带 来 了 一 个 信 息 … …

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Meldor_PICKPOCKET(C_INFO)
{
	npc				= VLK_415_Meldor;
	nr				= 900;
	condition		= DIA_Meldor_PICKPOCKET_Condition;
	information		= DIA_Meldor_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Meldor_PICKPOCKET_Condition()
{
	C_Beklauen(34, 55);
};

func void DIA_Meldor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
	Info_AddChoice(DIA_Meldor_PICKPOCKET, DIALOG_BACK, DIA_Meldor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Meldor_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Meldor_PICKPOCKET_DoIt);
};

func void DIA_Meldor_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};

func void DIA_Meldor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Meldor_PICKPOCKET);
};
