// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_EXIT(C_INFO)
{
	npc				= DJG_702_Rod;
	nr				= 999;
	condition		= DIA_RodDJG_EXIT_Condition;
	information		= DIA_RodDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_RodDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_RodDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_HALLO(C_INFO)
{
	npc				= DJG_702_Rod;
	nr				= 0;
	condition		= DIA_RodDJG_HALLO_Condition;
	information		= DIA_RodDJG_HALLO_Info;
	description		= "你 一 切 都 好 吗 ？";
};

func int DIA_RodDJG_HALLO_Condition()
{
	if (DJG_SwampParty == FALSE)
	{
		return TRUE;
	};
};

func void DIA_RodDJG_HALLO_Info()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_15_00"); //你 一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_RodDJG_HALLO_06_01"); //这 靴 子 快 把 我 害 死 了 ！ 新 的 盔 甲 真 的 很 棒 ， 但 是 为 什 么 这 靴 子 上 的 带 子 会 这 么 紧 ？。
	AI_Output(self, other, "DIA_RodDJG_HALLO_06_02"); //如 果 我 把 它 们 松 开 ， 靴 子 几 乎 要 从 我 的 脚 上 掉 下 去 了 。

	if (
	((Npc_IsDead(Swampdragon)) == FALSE)
	&& (DJG_SwampParty == FALSE)
	)
	{
		Info_AddChoice(DIA_RodDJG_HALLO, "你 在 等 什 么 ？", DIA_RodDJG_HALLO_warten);
	};

	Info_AddChoice(DIA_RodDJG_HALLO, "你 从 哪 里 得 到 那 些 靴 子 ？", DIA_RodDJG_HALLO_Woher);
};

func void DIA_RodDJG_HALLO_Woher()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_Woher_15_00"); //你 从 哪 里 得 到 那 些 靴 子 ？
	AI_Output(self, other, "DIA_RodDJG_HALLO_Woher_06_01"); //它 们 是 那 个 老 兵 贝 尼 特 为 我 们 龙 猎 手 打 造 的 ， 而 且 要 我 们 为 那 双 破 靴 子 付 了 一 大 笔 钱 。
	AI_Output(self, other, "DIA_RodDJG_HALLO_Woher_06_02"); //如 果 我 能 抓 住 他 的 话 ， 我 一 定 要 先 让 他 把 这 东 西 吃 掉 ， 然 后 再 把 我 的 钱 还 回 来 。
};

func void DIA_RodDJG_HALLO_warten()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_warten_15_00"); //那 你 还 在 等 什 么 ？

	Info_ClearChoices(DIA_RodDJG_HALLO);

	if ((Npc_IsDead(DJG_Cipher)) == FALSE)
	{
		AI_Output(self, other, "DIA_RodDJG_HALLO_warten_06_01"); //因 为 希 弗 终 于 动 身 了 ， 我 们 也 该 离 开 了 。
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_RodDJG_HALLO_warten_06_02"); //我 曾 经 想 过 靠 近 那 边 的 沼 泽 地 区 仔 细 看 看 。
		AI_Output(self, other, "DIA_RodDJG_HALLO_warten_06_03"); //你 怎 么 想 ？ 我 们 应 该 一 起 去 那 里 ， 然 后 看 看 能 找 到 什 么 吗 ？

		Info_AddChoice(DIA_RodDJG_HALLO, "我 自 己 去 。", DIA_RodDJG_HALLO_warten_allein);
		Info_AddChoice(DIA_RodDJG_HALLO, "关 于 沼 泽 地 区 你 知 道 些 什 么 ？", DIA_RodDJG_HALLO_warten_wasweisstdu);
		Info_AddChoice(DIA_RodDJG_HALLO, "我 们 一 起 走 。", DIA_RodDJG_HALLO_warten_zusammen);
	};
};

func void DIA_RodDJG_HALLO_warten_zusammen()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_warten_zusammen_15_00"); //我 们 一 起 走 。
	AI_Output(self, other, "DIA_RodDJG_HALLO_warten_zusammen_06_01"); //好 吧 。 那 跟 我 来 。

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;

	Npc_ExchangeRoutine(self, "SwampWait2");
};

func void DIA_RodDJG_HALLO_warten_wasweisstdu()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_warten_wasweisstdu_15_00"); //关 于 沼 泽 地 区 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_RodDJG_HALLO_warten_wasweisstdu_06_01"); //那 里 除 了 臭 气 熏 天 以 外 ， 可 能 还 有 大 量 的 金 子 。 那 够 了 吗 ？
};

func void DIA_RodDJG_HALLO_warten_allein()
{
	AI_Output(other, self, "DIA_RodDJG_HALLO_warten_allein_15_00"); //我 自 己 去 。
	AI_Output(self, other, "DIA_RodDJG_HALLO_warten_allein_06_01"); //那 好 吧 ， 我 祝 你 好 运 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WarteMal
///////////////////////////////////////////////////////////////////////
instance DIA_RodDJG_WARTEMAL(C_INFO)
{
	npc				= DJG_702_Rod;
	nr				= 0;
	condition		= DIA_RodDJG_WARTEMAL_Condition;
	information		= DIA_RodDJG_WARTEMAL_Info;
	permanent		= TRUE;
	description		= "你 出 什 么 事 了 ？";
};

func int DIA_RodDJG_WARTEMAL_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_RodDJG_HALLO))
	|| (DJG_SwampParty == TRUE))
	{
		return TRUE;
	};
};

func void DIA_RodDJG_WARTEMAL_Info()
{
	AI_Output(other, self, "DIA_RodDJG_WARTEMAL_15_00"); //你 出 什 么 事 了 ？

	if (
	((DJG_SwampParty == TRUE) || (Npc_GetDistToWP(self, "OW_DJG_SWAMP_WAIT2_02") < 1000))
	&& (Npc_IsDead(DJG_Cipher))
	)
	{
		AI_Output(self, other, "DIA_RodDJG_WARTEMAL_06_01"); //听 着 ， 老 兄 。 我 觉 得 这 事 有 点 控 制 不 住 了 。 我 要 悄 悄 地 溜 走 。
		DJG_SwampParty = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
	}
	else
	{
		AI_Output(self, other, "DIA_RodDJG_WARTEMAL_06_02"); //（ 咒 骂 ） 这 靴 子 ！ 该 死 的 靴 子 ！
	};

	if (Npc_IsDead(SwampDragon))
	{
		AI_Output(other, self, "DIA_RodDJG_WARTEMAL_15_03"); //现 在 你 打 算 怎 么 做 ？
		AI_Output(self, other, "DIA_RodDJG_WARTEMAL_06_04"); //关 于 你 的 问 题 ！ 首 先 ， 我 要 买 一 双 新 靴 子 ， 老 兄 ！
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "Start");
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rod_PICKPOCKET(C_INFO)
{
	npc				= DJG_702_Rod;
	nr				= 900;
	condition		= DIA_Rod_PICKPOCKET_Condition;
	information		= DIA_Rod_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Rod_PICKPOCKET_Condition()
{
	C_Beklauen(16, 320);
};

func void DIA_Rod_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
	Info_AddChoice(DIA_Rod_PICKPOCKET, DIALOG_BACK, DIA_Rod_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rod_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rod_PICKPOCKET_DoIt);
};

func void DIA_Rod_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};

func void DIA_Rod_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rod_PICKPOCKET);
};
