// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_EXIT(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 999;
	condition		= DIA_Addon_Paul_EXIT_Condition;
	information		= DIA_Addon_Paul_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Paul_PICKPOCKET(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 900;
	condition		= DIA_Addon_Paul_PICKPOCKET_Condition;
	information		= DIA_Addon_Paul_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Paul_PICKPOCKET_Condition()
{
	C_Beklauen(22, 19);
};

func void DIA_Addon_Paul_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET, DIALOG_BACK, DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Paul_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Paul_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_Hi(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 1;
	condition		= DIA_Addon_Paul_Hi_Condition;
	information		= DIA_Addon_Paul_Hi_Info;
	description		= "你 经 营 铁 匠 装 备 ？";
};

func int DIA_Addon_Paul_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Paul_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_Hi_15_00"); //你 经 营 铁 匠 装 备 ？
	AI_Output(self, other, "DIA_Addon_Paul_Hi_03_01"); //胡 诺 有 剑 ， 而 我 只 有 一 些 矿 石 块 。
	AI_Output(self, other, "DIA_Addon_Paul_Hi_03_02"); //但 是 我 不 会 放 弃 的 。 它 是 我 唯 一 值 钱 的 东 西 。
};

// ---------------------------------------------------------------------
//	Info Huno
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_Huno(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 2;
	condition		= DIA_Addon_Paul_Huno_Condition;
	information		= DIA_Addon_Paul_Huno_Info;
	description		= "你 为 胡 诺 工 作 ？";
};

func int DIA_Addon_Paul_Huno_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Paul_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Huno_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_Huno_15_00"); //你 为 胡 诺 工 作 ？
	AI_Output(self, other, "DIA_Addon_Paul_Huno_03_01"); //我 想 要 赚 点 钱 ， 所 以 就 和 胡 诺 交 往 过 密 。 不 过 从 那 时 起 ， 伊 斯 特 班 就 什 么 都 不 给 我 。
	AI_Output(self, other, "DIA_Addon_Paul_Huno_03_02"); //他 说 他 不 再 需 要 我 了 。
	AI_Output(self, other, "DIA_Addon_Paul_Huno_03_03"); //我 除 了 继 续 给 胡 诺 卖 命 以 外 ， 还 能 做 什 么 ？
};

// ---------------------------------------------------------------------
//	Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_Attentat(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 3;
	condition		= DIA_Addon_Paul_Attentat_Condition;
	information		= DIA_Addon_Paul_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Paul_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Paul_Attentat_03_00"); //没 有 ， 老 兄 ！ 我 什 么 都 没 有 做 过 ！ 你 想 从 我 这 里 得 到 什 么 ？
};

// ---------------------------------------------------------------------
//	HunoVerdacht
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_HunoVerdacht(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 4;
	condition		= DIA_Addon_Paul_HunoVerdacht_Condition;
	information		= DIA_Addon_Paul_HunoVerdacht_Info;
	description		= "胡 诺 被 怀 疑 和 这 次 袭 击 有 关 … …";
};

func int DIA_Addon_Paul_HunoVerdacht_Condition()
{
	if (((Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE))
	&& (MIS_Judas == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_HunoVerdacht_15_00"); //胡 诺 被 怀 疑 和 这 次 袭 击 有 关 … …
	AI_Output(self, other, "DIA_Addon_Paul_HunoVerdacht_03_01"); //我 什 么 都 不 知 道 ！
};

// ---------------------------------------------------------------------
//	Arbeitest für Huno
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_HunoArbeit(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 5;
	condition		= DIA_Addon_Paul_HunoArbeit_Condition;
	information		= DIA_Addon_Paul_HunoArbeit_Info;
	description		= "但 是 你 为 胡 诺 工 作 ！ 那 么 你 一 定 知 道 什 么 ！";
};

func int DIA_Addon_Paul_HunoArbeit_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Paul_Huno))
	&& (Npc_KnowsInfo(other, DIA_Addon_Paul_HunoVerdacht))
	&& (MIS_Judas == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_HunoArbeit_15_00"); //但 是 你 为 胡 诺 工 作 ！ 那 么 你 一 定 知 道 什 么 ！
	AI_Output(self, other, "DIA_Addon_Paul_HunoArbeit_03_01"); //（ 绝 望 的 ） 我 完 全 不 知 道 - 真 的 ！ 我 现 在 必 须 走 了 ！
	Npc_ExchangeRoutine(self, "AWAY");
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	Angst vor Esteban
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_FearEsteban(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 5;
	condition		= DIA_Addon_Paul_FearEsteban_Condition;
	information		= DIA_Addon_Paul_FearEsteban_Info;
	description		= "你 知 道 一 旦 伊 斯 特 班 得 知 你 在 为 胡 诺 掩 饰 的 话 ， 他 会 对 你 做 什 么 吗 ？";
};

func int DIA_Addon_Paul_FearEsteban_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Paul_HunoArbeit))
	&& (MIS_Judas == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_FearEsteban_15_00"); //你 知 道 一 旦 伊 斯 特 班 得 知 你 在 为 胡 诺 掩 饰 的 话 ， 他 会 对 你 做 什 么 吗 ？
	AI_Output(self, other, "DIA_Addon_Paul_FearEsteban_03_01"); //老 兄 ！ 走 开 。 我 帮 不 上 什 么 忙 。
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos(self);
};

// ---------------------------------------------------------------------
//	MaulPaul
// ---------------------------------------------------------------------
instance DIA_Addon_Paul_MaulPaul(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 5;
	condition		= DIA_Addon_Paul_MaulPaul_Condition;
	information		= DIA_Addon_Paul_MaulPaul_Info;
	description		= "告 诉 我 你 都 知 道 什 么 ， 马 上 ！";
};

func int DIA_Addon_Paul_MaulPaul_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Paul_FearEsteban))
	&& (MIS_Judas == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_MaulPaul_15_00"); //（ 友 好 的 ） 现 在 把 你 知 道 的 告 诉 我 ， 否 则 我 就 把 你 钉 进 墙 里 ， 保 罗 ！
	AI_Output(self, other, "DIA_Addon_Paul_MaulPaul_03_01"); //你 不 能 粗 暴 地 对 待 我 ， 因 为 你 为 老 板 工 作 。
	AI_Output(other, self, "DIA_Addon_Paul_MaulPaul_15_02"); //（ 愉 快 的 ） 我 能 ！
	AI_Output(self, other, "DIA_Addon_Paul_MaulPaul_03_03"); //闭 嘴 ！
	AI_Output(other, self, "DIA_Addon_Paul_MaulPaul_15_04"); //（ 着 急 的 ） 保 罗 … …
	AI_Output(self, other, "DIA_Addon_Paul_MaulPaul_03_05"); //（ 兴 奋 的 ） 我 所 知 道 的 就 是 胡 诺 要 和 伊 斯 特 班 算 账 。
	AI_Output(self, other, "DIA_Addon_Paul_MaulPaul_03_06"); //（ 兴 奋 的 ） 他 不 断 地 来 找 我 询 问 那 个 伊 斯 特 班 的 情 况 。 他 要 毁 掉 他 的 事 业 … … …
	AI_Output(self, other, "DIA_Addon_Paul_MaulPaul_03_07"); //我 会 保 密 的 。
	AI_Output(other, self, "DIA_Addon_Paul_MaulPaul_15_08"); //正 好 ！ 你 看 。 那 还 不 错 。

	Npc_ExchangeRoutine(self, "START");

	Paul_TellAll = TRUE;
	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_8);
};

// ----------------------------------------------------------------------
//	Info Mine
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1070_Paul_Mine(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 2;
	condition		= DIA_Addon_Paul_Mine_Condition;
	information		= DIA_Addon_Paul_Mine_Info;
	description		= DIALOG_ADDON_MINE_DESCRIPTION;
};

func int DIA_Addon_Paul_Mine_Condition()
{
	if ((MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems(other, ItmI_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_Mine_Info()
{
	B_Say(other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other, self, ItmI_Addon_Stone_01, 1);
	AI_Output(self, other, "DIA_Addon_BDT_1070_Paul_Mine_03_00"); //终 于 成 了 ！ 给 ， 我 用 矿 石 换 你 的 那 些 东 西 。
	B_GiveInvItems(self, other, ItMi_Nugget, 2);

	Player_SentBuddler = (Player_SentBuddler + 1);
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "MINE");
};

// ----------------------------------------------------------------------
//	PERM
// ----------------------------------------------------------------------
instance DIA_Addon_Paul_PERM(C_INFO)
{
	npc				= BDT_1070_Addon_Paul;
	nr				= 99;
	condition		= DIA_Addon_Paul_PERM_Condition;
	information		= DIA_Addon_Paul_PERM_Info;
	permanent		= TRUE;
	description		= "你 其 它 一 切 都 好 吗 ？";
};

func int DIA_Addon_Paul_PERM_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};

func void DIA_Addon_Paul_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Paul_PERM_15_00"); //你 其 它 一 切 都 好 吗 ？

	if (Npc_GetDistToWP(self, "ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self, other, "DIA_Addon_Paul_PERM_03_01"); //是 的 ， 我 会 从 这 块 岩 石 里 挖 出 很 多 金 子 ！
	}
	else
	{
		if ((Paul_TellAll == TRUE)
		&& (Huno_zuSnaf == FALSE))
		{
			AI_Output(self, other, "DIA_Addon_Paul_PERM_03_02"); //我 把 我 知 道 的 一 切 都 告 诉 了 你 ！
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Paul_PERM_03_03"); //我 只 是 要 做 我 的 工 作 ， 老 兄 ！
		};
	};
};
