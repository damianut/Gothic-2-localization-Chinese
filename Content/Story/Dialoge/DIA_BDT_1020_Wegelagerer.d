// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_BDT_1020_Wegelagerer_EXIT(C_INFO)
{
	npc				= BDT_1020_Bandit_L;
	nr				= 999;
	condition		= DIA_Wegelagerer_EXIT_Condition;
	information		= DIA_Wegelagerer_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wegelagerer_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wegelagerer_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
const string BDT_1020_Wegelagerer_Checkpoint = "NW_TROLLAREA_PATH_46"; // Die Brücke
// ------------------------------------------------------------
instance DIA_BDT_1020_Wegelagerer_FirstWarn(C_INFO)
{
	npc				= BDT_1020_Bandit_L;
	nr				= 1;
	condition		= DIA_BDT_1020_Wegelagerer_FirstWarn_Condition;
	information		= DIA_BDT_1020_Wegelagerer_FirstWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1020_Wegelagerer_FirstWarn_Condition()
{
	if ((other.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Info()
{
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_06_00"); //嘿 ， 你 ， 停 下 ！
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_15_01"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_06_02"); //如 果 你 不 想 让 我 打 烂 你 的 脸 ， 那 你 最 好 把 口 袋 里 的 金 币 送 些 给 我 - 马 上 ！

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;

	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "你 想 要 多 少 ？", DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "你 在 开 玩 笑 。", DIA_BDT_1020_Wegelagerer_FirstWarn_Joke);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "别 挡 我 的 路 ！", DIA_BDT_1020_Wegelagerer_PissOff);

	if (MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "据 说 ， 你 看 到 一 个 学 徒 ？", DIA_BDT_1020_Wegelagerer_AGON);
	};
};

func void DIA_BDT_1020_Wegelagerer_AGON()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_AGON_15_00"); //据 说 ， 你 看 到 一 个 学 徒 ？
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_AGON_06_01"); //（ 困 惑 的 ） 呃 - 什 么 ？ 嗯 … … （ 沉 思 ） 那 有 可 能 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_AGON_06_02"); //给 我20枚 金 币 ， 我 就 告 诉 你 ！

	Wegelagerer_Surprise = TRUE;

	if (Npc_HasItems(other, ItMi_gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "好 吧 ， 这 是 你 的 钱 。", DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};

	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "对 不 起 ， 我 一 分 钱 都 没 有 。", DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "别 挡 我 的 路 。", DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00"); //你 想 要 多 少 ？
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01"); //（ 露 齿 而 笑 ）20枚 金 币 ， 然 后 我 们 就 能 成 为 朋 友 。

	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);

	if (Npc_HasItems(other, ItMi_gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "好 吧 ， 这 是 你 的 钱 。", DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};

	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "对 不 起 ， 我 一 分 钱 都 没 有 。", DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "别 挡 我 的 路 。", DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Joke()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00"); //你 在 开 玩 笑 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01"); //我 看 上 去 很 像 ？
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02"); //如 果 你 再 往 前 走 一 步 ， 而 我 还 没 见 到 那20枚 金 币 的 话 … …
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03"); //那 我 就 放 倒 你 。 所 以 ， 马 上 把 钱 交 出 来 。

	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);

	if (Npc_HasItems(other, ItMi_gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "好 吧 ， 这 是 你 的 钱 。", DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney);
	};

	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "对 不 起 ， 我 一 分 钱 都 没 有 。", DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney);
	Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "别 挡 我 的 路 。", DIA_BDT_1020_Wegelagerer_FirstWarn_Never);
};

func void DIA_BDT_1020_Wegelagerer_PissOff()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_PissOff_15_00"); //别 挡 我 的 路 ！
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_PissOff_06_01"); //天 啊 ， 对 你 这 样 骨 瘦 如 柴 的 家 伙 来 说 ， 你 还 真 能 说 大 话 啊 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_PissOff_06_02"); //现 在 我 要 帮 你 闭 上 嘴 巴 。

	AI_StopProcessInfos(self);

	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00"); //好 吧 ， 这 是 你 的 钱 。

	if (Wegelagerer_Surprise == FALSE)
	{
		AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01"); //（ 轻 蔑 的 ） 我 应 该 说20枚 金 币 换 你 的 命 并 不 贵 。 你 可 以 过 去 了 。
	};

	if (Wegelagerer_Surprise == TRUE)
	{
		AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02"); //好 吧 ， 现 在 ， 那 个 新 信 徒 已 经 从 这 里 经 过 一 个 小 时 了 。
		AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03"); //他 有 点 惊 慌 ， 一 直 在 观 察 他 的 身 后 ， 就 是 他 。 现 在 走 开 。
	};

	B_GiveInvItems(other, self, itmi_gold, 20);
	self.aivar[AIV_PASSGATE] = TRUE;

	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00"); //对 不 起 ， 我 一 分 钱 都 没 有 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01"); //对 ， 现 在 的 确 是 恐 怖 时 期 。

	if (Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02"); //但 是 我 要 告 诉 你 - 马 上 交 出 你 的 武 器 。 然 后 我 就 让 你 通 过 。

		Info_ClearChoices(DIA_BDT_1020_Wegelagerer_FirstWarn);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "算 了 吧 。", DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon);
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_FirstWarn, "给 ， 拿 走 我 的 武 器 。", DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon);
	}
	else
	{
		AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03"); //我 必 须 告 诉 你 ： 等 你 有 钱 了 再 回 来 。 没 有 钱 ， 不 准 过 桥 。

		self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;
		AI_StopProcessInfos(self);
	};
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_Never()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00"); //别 挡 我 的 路 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01"); //那 么 你 要 选 择 痛 苦 的 方 式 ？

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00"); //算 了 吧 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01"); //好 吧 ， 这 就 是 痛 苦 的 方 式 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00"); //给 ， 拿 走 我 的 武 器 。

	AI_DrawWeapon(other);

	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01"); // 别 碰 我 的 武 器 。 你 等 着 瞧 ！
	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 1);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_BDT_1020_Wegelagerer_SecondWarn(C_INFO)
{
	npc				= BDT_1020_Bandit_L;
	nr				= 2;
	condition		= DIA_BDT_1020_Wegelagerer_SecondWarn_Condition;
	information		= DIA_BDT_1020_Wegelagerer_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1020_Wegelagerer_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_1020_Wegelagerer_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_SecondWarn_06_00"); //你 真 的 想 碰 碰 运 气 ？ 是 你 自 找 的 。

	Info_ClearChoices(DIA_BDT_1020_Wegelagerer_SecondWarn);
	if (Npc_HasItems(other, ItMi_gold) >= 20)
	{
		Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn, "这 是 你 的 钱 。", DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney);
	};

	Info_AddChoice(DIA_BDT_1020_Wegelagerer_SecondWarn, "我 不 会 给 你 一 分 钱 。", DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney);

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, BDT_1020_Wegelagerer_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00"); //这 是 你 的 钱 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01"); //啊 ， 现 在 你 说 话 了 。

	B_GiveInvItems(other, self, itmi_gold, 20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney()
{
	AI_Output(other, self, "DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00"); //我 不 会 给 你 一 分 钱 。
	AI_Output(self, other, "DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01"); //那 么 我 自 己 来 拿 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_BDT_1020_Wegelagerer_Attack(C_INFO)
{
	npc				= BDT_1020_Bandit_L;
	nr				= 3;
	condition		= DIA_BDT_1020_Wegelagerer_Attack_Condition;
	information		= DIA_BDT_1020_Wegelagerer_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_BDT_1020_Wegelagerer_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, BDT_1020_Wegelagerer_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_BDT_1020_Wegelagerer_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_StopProcessInfos(self); // dem Spieler sofort wieder die Kontrolle zurückgeben

	B_Attack(self, other, AR_NONE, 1);
};
