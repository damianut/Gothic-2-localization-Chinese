// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Bloodwyn_EXIT(C_INFO)
{
	npc				= BDT_1085_Addon_Bloodwyn;
	nr				= 999;
	condition		= DIA_Addon_Bloodwyn_EXIT_Condition;
	information		= DIA_Addon_Bloodwyn_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Bloodwyn_PICKPOCKET(C_INFO)
{
	npc				= BDT_1085_Addon_Bloodwyn;
	nr				= 900;
	condition		= DIA_Addon_Bloodwyn_PICKPOCKET_Condition;
	information		= DIA_Addon_Bloodwyn_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Addon_Bloodwyn_PICKPOCKET_Condition()
{
	C_Beklauen(90, 250);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_BACK, DIA_Addon_Bloodwyn_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bloodwyn_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Bloodwyn_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

func void DIA_Addon_Bloodwyn_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Dead
// ---------------------------------------------------------------------
instance DIA_Addon_Bloodwyn_Dead(C_INFO)
{
	npc				= BDT_1085_Addon_Bloodwyn;
	nr				= 2;
	condition		= DIA_Addon_Bloodwyn_Dead_Condition;
	information		= DIA_Addon_Bloodwyn_Dead_Info;
	important		= TRUE;
};

func int DIA_Addon_Bloodwyn_Dead_Condition()
{
	if (Npc_GetDistToWP(self, "BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Dead_Info()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Dead_04_00"); //嘿 ， 你 怎 么 进 到 这 里 的 ？
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Dead_15_01"); //通 过 入 口 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Dead_04_02"); //有 趣 … … 我 讨 厌 玩 笑 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ------------------------------------------------------------------------------
func void Bloodwyn_Choices_1()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "我 想 我 害 了 你 。", DIA_Addon_Bloodwyn_Wait_GOOD1);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "一 切 都 有 了 终 结 。", DIA_Addon_Bloodwyn_Wait_BAD1);
};

func void Bloodwyn_Choices_2()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "你 认 为 谁 能 攻 破 屏 障 ？", DIA_Addon_Bloodwyn_Wait_GOOD2);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "你 和 其 它 所 有 家 伙 都 一 样 … …", DIA_Addon_Bloodwyn_Wait_BAD2);
};

func void Bloodwyn_Choices_3()
{
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "显 然 他 没 有 时 间 来 吹 毛 求 疵 … …", DIA_Addon_Bloodwyn_Wait_GOOD3);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "是 的 ， 那 是 他 犯 的 最 大 的 错 误 … …", DIA_Addon_Bloodwyn_Wait_BAD3);
};

// ---------------------------------------------------------------------
//	Info Wait
// ---------------------------------------------------------------------
instance DIA_Addon_Bloodwyn_Wait(C_INFO)
{
	npc				= BDT_1085_Addon_Bloodwyn;
	nr				= 2;
	condition		= DIA_Addon_Bloodwyn_Wait_Condition;
	information		= DIA_Addon_Bloodwyn_Wait_Info;
	important		= TRUE;
};

func int DIA_Addon_Bloodwyn_Wait_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MineCrawler_Killed >= 9))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bloodwyn_Wait_Info()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_04_00"); //你 杀 死 了 矿 井 爬 行 者 ？ 好 。 我 现 在 接 管 这 里 。 继 续 ， 走 开 。
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_15_01"); //等 一 下 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_04_02"); //你 还 没 有 走 ？

	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_15_03"); //我 们 还 必 须 把 事 情 理 顺 。

	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, "我 在 找 瑞 雯 。", DIA_Addon_Bloodwyn_Wait_Raven);
};

func void DIA_Addon_Bloodwyn_Wait_Raven()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_00"); //我 在 找 瑞 雯 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_01"); //是 的 - 你 为 什 么 认 为 瑞 雯 会 向 你 说 出 全 部 … … 等 等 ， 是 你 … … 是 你 吗 ？
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_02"); //你 是 那 个 我 们 一 直 在 找 的 家 伙 。 你 在 这 里 做 什 么 ？ 你 应 该 早 就 死 了 ！
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_03"); //大 家 一 直 对 我 那 么 说 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_04"); //那 些 白 痴 全 都 失 败 了 - 但 是 你 别 想 我 从 这 里 逃 走 。 这 次 我 要 结 果 你 ！
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_15_05"); //正 如 我 所 说 - 我 要 找 的 是 瑞 雯 - 你 对 我 来 说 并 不 重 要 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_Raven_04_06"); //我 要 杀 了 你 - 迄 今 为 止 ， 我 所 有 的 战 斗 都 胜 利 了 ！

	Bloodwyn_Choices_1();
};

func void DIA_Addon_Bloodwyn_Wait_FIGHT()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00"); //说 得 够 多 了 。 我 们 战 斗 吧 。
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01"); //（ 得 意 洋 洋 ） 对 你 来 说 太 晚 了 ！ 瑞 雯 马 上 就 要 打 开 神 殿 了 ！ 哈 哈 哈 哈 - 去 死 吧 ， 混 蛋 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void Bloodwyn_Lach()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Lach_04_00"); //哈 哈 哈 - 我 还 是 要 打 败 你 ！
};

func void Bloodwyn_Wut()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_Wut_04_00"); //啊 ！ 你 这 卑 鄙 的 狗 ！

	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void Bloodwyn_Next_1()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_SayChoice_2_04_00"); //即 使 是 屏 障 的 爆 炸 ， 我 也 能 毫 发 无 损 地 逃 生 ！
};

func void Bloodwyn_Next_2()
{
	AI_Output(self, other, "DIA_Addon_Bloodwyn_SayChoice_3_04_00"); //你 无 法 打 败 我 ， 我 是 瑞 雯 最 好 的 朋 友 ！ 他 的 得 力 助 手 ！
};

// ------------------------------------------------------------------------------
func void DIA_Addon_Bloodwyn_Wait_GOOD1()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00"); //我 想 我 害 了 你 。
	Bloodwyn_Wut();
	Bloodwyn_Next_1();

	Bloodwyn_Choices_2();
};

func void DIA_Addon_Bloodwyn_Wait_BAD1()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00"); //一 切 都 有 了 终 结 。
	Bloodwyn_Lach();
	Bloodwyn_Next_1();

	Bloodwyn_Choices_2();
};

// ------------------------------------------------------------------------------
func void DIA_Addon_Bloodwyn_Wait_GOOD2()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00"); //你 认 为 谁 能 攻 破 屏 障 ？
	Bloodwyn_Wut();
	Bloodwyn_Next_2();

	Bloodwyn_Choices_3();
};

func void DIA_Addon_Bloodwyn_Wait_BAD2()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00"); //你 和 其 它 所 有 家 伙 都 一 样 … …
	Bloodwyn_Lach();
	Bloodwyn_Next_2();

	Bloodwyn_Choices_3();
};

// ------------------------------------------------------------------------------
func void DIA_Addon_Bloodwyn_Wait_GOOD3()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00"); //显 然 他 没 有 时 间 来 吹 毛 求 疵 … …
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
};

func void DIA_Addon_Bloodwyn_Wait_BAD3()
{
	AI_Output(other, self, "DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00"); //是 的 ， 那 是 他 犯 的 最 大 的 错 误 … …
	Bloodwyn_Wut();
	Info_ClearChoices(DIA_Addon_Bloodwyn_Wait);
	Info_AddChoice(DIA_Addon_Bloodwyn_Wait, PRINT_ADDON_ENOUGHTALK, DIA_Addon_Bloodwyn_Wait_FIGHT);
};
