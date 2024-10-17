// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Rumbold_EXIT(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 999;
	condition		= DIA_Rumbold_EXIT_Condition;
	information		= DIA_Rumbold_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rumbold_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rumbold_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PERM VOR Bengar
// ************************************************************
instance DIA_Rumbold_PrePerm(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 1;
	condition		= DIA_Rumbold_PrePerm_Condition;
	information		= DIA_Rumbold_PrePerm_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Rumbold_PrePerm_Condition()
{
	if (!Npc_KnowsInfo(other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_PrePerm_Info()
{
	AI_Output(other, self, "DIA_Rumbold_PrePerm_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Rumbold_PrePerm_10_01"); //走 开 ！ ， 明 白 了 吗 ？

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				Hallo
// ************************************************************
instance DIA_Rumbold_Hallo(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 1;
	condition		= DIA_Rumbold_Hallo_Condition;
	information		= DIA_Rumbold_Hallo_Info;
	important		= TRUE;
};

func int DIA_Rumbold_Hallo_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bengar_MILIZKLATSCHEN))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_Hallo_Info()
{
	AI_Output(self, other, "DIA_Rumbold_Hallo_10_00"); //看 看 这 个 人 。 又 一 个 小 丑 。 你 在 这 里 做 什 么 ， 嗯 ？
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Rumbold_Hallo_10_01"); //你 究 竟 是 谁 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Rumbold_Hallo_10_02"); //你 是 那 些 卑 鄙 的 雇 佣 兵 的 人 ！
	};

	Info_ClearChoices(DIA_Rumbold_HALLO);

	Info_AddChoice(DIA_Rumbold_HALLO, "我 是 无 名 氏 。", DIA_Rumbold_HALLO_schwanzeinziehen);
	Info_AddChoice(DIA_Rumbold_HALLO, "我 要 你 从 这 里 消 失 。", DIA_Rumbold_HALLO_verschwindet);
	Info_AddChoice(DIA_Rumbold_HALLO, "我 是 你 最 恐 怖 的 恶 梦！", DIA_Rumbold_HALLO_Attack);
};

func void DIA_Rumbold_HALLO_Attack()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_Attack_15_00"); //我 是 你 最 恐 怖 的 恶 梦 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_Attack_10_01"); //你 是 个 死 人 了 ！

	Info_ClearChoices(DIA_Rumbold_HALLO);
	Info_AddChoice(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_verschwindet()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_verschwindet_15_00"); //我 要 你 从 这 里 消 失 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_verschwindet_10_01"); //嗯 ， 嗯 。 那 么 你 想 要 我 们 消 失 了 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_verschwindet_10_02"); //（ 威 胁 ） 如 果 我 们 不 走 的 话 ， 又 会 怎 么 样 ， 嘿 ？

	Info_ClearChoices(DIA_Rumbold_HALLO);

	Info_AddChoice(DIA_Rumbold_HALLO, "让 你 消 失 需 要 多 少 钱 ？", DIA_Rumbold_HALLO_geld);
	Info_AddChoice(DIA_Rumbold_HALLO, "那 样 的 话 ， 这 是 你 最 后 一 次 骚 扰 农 民 。", DIA_Rumbold_HALLO_AufsMaul);
};

func void DIA_Rumbold_HALLO_AufsMaul()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_AufsMaul_15_00"); //那 样 的 话 ， 这 是 你 最 后 一 次 骚 扰 农 民 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_AufsMaul_10_01"); //你 太 自 不 量 力 了 ， 白 痴 ！

	Info_ClearChoices(DIA_Rumbold_HALLO);
	Info_AddChoice(DIA_Rumbold_HALLO, DIALOG_ENDE, DIA_Rumbold_HALLO_ENDAttack);
};

func void DIA_Rumbold_HALLO_geld()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_geld_15_00"); //让 你 消 失 需 要 多 少 钱 ？
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_10_01"); //你 要 为 本 加 付 钱 ？ 那 就 不 一 样 了 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_10_02"); //让 我 想 想 。 算 上 他 所 有 未 支 付 的 费 用 ， 本 加 还 欠 我 们65枚 金 币 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_10_03"); //要 么 付 钱 ， 要 么 安 静 地 站 到 角 落 里 去 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_10_04"); //这 么 说 的 话 ， 你 是 本 加 的 会 计 ， 还 是 其 它 什 么 人 ？

	Info_ClearChoices(DIA_Rumbold_HALLO);
	Info_AddChoice(DIA_Rumbold_HALLO, "你 疯 了 吗 ？ 那 太 多 了！", DIA_Rumbold_HALLO_Geld_TooMuch);
	if (Npc_HasItems(other, itmi_gold) >= 65)
	{
		Info_AddChoice(DIA_Rumbold_HALLO, "这 是 你 要 的 钱 ， 现 在 马 上 离 开 。", DIA_Rumbold_HALLO_geld_ok);
	};
};

func void DIA_Rumbold_HALLO_geld_ok()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_geld_ok_15_00"); //这 是 你 的 钱 ， 现 在 快 走 开 。
	B_GiveInvItems(other, self, ItMi_Gold, 65);
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_ok_10_01"); //我 才 不 管 是 谁 为 本 加 付 钱 。 过 得 愉 快 。 （ 自 言 自 语 ） 白 痴 ！

	AI_StopProcessInfos(self);

	Rumbold_Bezahlt = TRUE;

	Npc_ExchangeRoutine(self, "Start");

	if ((Hlp_IsValidNpc(Rick))
	&& (!Npc_IsDead(Rick)))
	{
		Npc_ExchangeRoutine(Rick, "Start");
		AI_ContinueRoutine(Rick);
	};

	if ((Hlp_IsValidNpc(Bengar))
	&& (!Npc_IsDead(Bengar)))
	{
		Npc_ExchangeRoutine(Bengar, "Start");
		AI_ContinueRoutine(Bengar);
	};
};

func void DIA_Rumbold_HALLO_Geld_TooMuch()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_geld_TooMuch_15_00"); //你 疯 了 吗 ？ 那 太 多 了！
	AI_Output(self, other, "DIA_Rumbold_HALLO_geld_TooMuch_10_01"); //那 么 躲 进 你 的 角 落 去 ！
	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_schwanzeinziehen()
{
	AI_Output(other, self, "DIA_Rumbold_HALLO_schwanzeinziehen_15_00"); //我 是 无 名 氏 。
	AI_Output(self, other, "DIA_Rumbold_HALLO_schwanzeinziehen_10_01"); //那 么 别 挡 我 的 路 ！

	AI_StopProcessInfos(self);
};

func void DIA_Rumbold_HALLO_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 1);

	if ((Hlp_IsValidNpc(Rick))
	&& (!C_NpcIsDown(Rick)))
	{
		B_Attack(Rick, other, AR_KILL, 1);
	};
};

// ************************************************************
// 			  			Fight Now
// ************************************************************
instance DIA_Rumbold_FightNow(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 1;
	condition		= DIA_Rumbold_FightNow_Condition;
	information		= DIA_Rumbold_FightNow_Info;
	permanent		= TRUE;
	description		= "不 要 打 扰 农 民 ！";
};

func int DIA_Rumbold_FightNow_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_FightNow_Info()
{
	AI_Output(other, self, "DIA_Rumbold_FightNow_15_00"); //不 要 打 扰 农 民 ！
	AI_Output(self, other, "DIA_Rumbold_FightNow_10_01"); //你 的 耳 朵 有 问 题 吗 ， 小 子！

	Info_ClearChoices(DIA_Rumbold_FightNow);
	Info_AddChoice(DIA_Rumbold_FightNow, DIALOG_ENDE, DIA_Rumbold_FightNow_ENDAttack);
};

func void DIA_Rumbold_FightNow_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 1);

	if ((Hlp_IsValidNpc(Rick))
	&& (!C_NpcIsDown(Rick)))
	{
		B_Attack(Rick, other, AR_KILL, 1);
	};
};

// ************************************************************
// 			  			Immer noch da
// ************************************************************
instance DIA_Rumbold_StillThere(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 1;
	condition		= DIA_Rumbold_StillThere_Condition;
	information		= DIA_Rumbold_StillThere_Info;
	permanent		= TRUE;
	description		= "嘿 ， 你 还 在 这 里 ！";
};

func int DIA_Rumbold_StillThere_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rumbold_Hallo))
	&& (Rumbold_Bezahlt == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Rumbold_StillThere_Info()
{
	AI_Output(other, self, "DIA_Rumbold_StillThere_15_00"); //嘿 ， 你 还 在 这 里 ！
	AI_Output(self, other, "DIA_Rumbold_StillThere_10_01"); //我 已 经 受 不 了 你 了 ！

	Info_ClearChoices(DIA_Rumbold_StillThere);
	Info_AddChoice(DIA_Rumbold_StillThere, DIALOG_ENDE, DIA_Rumbold_StillThere_ENDAttack);
};

func void DIA_Rumbold_StillThere_ENDAttack()
{
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_KILL, 1);

	if ((Hlp_IsValidNpc(Rick))
	&& (!C_NpcIsDown(Rick)))
	{
		B_Attack(Rick, other, AR_KILL, 1);
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rumbold_PICKPOCKET(C_INFO)
{
	npc				= Mil_335_Rumbold;
	nr				= 900;
	condition		= DIA_Rumbold_PICKPOCKET_Condition;
	information		= DIA_Rumbold_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Rumbold_PICKPOCKET_Condition()
{
	C_Beklauen(24, 45);
};

func void DIA_Rumbold_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET, DIALOG_BACK, DIA_Rumbold_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rumbold_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rumbold_PICKPOCKET_DoIt);
};

func void DIA_Rumbold_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};

func void DIA_Rumbold_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rumbold_PICKPOCKET);
};
