// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Fire_Exit(C_INFO)
{
	nr				= 999;
	condition		= DIA_Dragon_Fire_Exit_Condition;
	information		= DIA_Dragon_Fire_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Fire_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Exit_Info()
{
	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);

	AI_Output(self, other, "DIA_Dragon_Fire_Exit_20_00"); //‘ 眼 睛 ’ 已 经 失 去 了 它 的 力 量 ， 而 你 将 活 不 过 明 天 。

	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff, "Follow");
		DJG_Biff_Stay = FALSE;
	};
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Fire_Hello(C_INFO)
{
	nr				= 1;
	condition		= DIA_Dragon_Fire_Hello_Condition;
	information		= DIA_Dragon_Fire_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Fire_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Fire_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Fire_Hello_20_00"); //我 只 是 无 法 相 信 真 的 还 有 人 类 愿 意 放 弃 他 们 的 生 命 亲 自 来 看 望 一 条 龙 。
	if (Mis_KilledDragons == 0)
	{
		AI_Output(other, self, "DIA_Dragon_Fire_Hello_15_01"); //对 这 样 大 块 头 的 怪 物 来 说 ， 你 的 口 才 相 当 好 。
	};

	AI_Output(other, self, "DIA_Dragon_Fire_Hello_15_02"); //我 不 只 是 来 看 你 。我 很 害 怕， 在 我 的 脑 中 还 有 一 些 更 重 要 的 事 。
	AI_Output(self, other, "DIA_Dragon_Fire_Hello_20_03"); //你 不 是 想 要 来 挑 战 我 ？
	AI_Output(self, other, "DIA_Dragon_Fire_Hello_20_04"); //哈 哈 哈 。 我 将 会 拧 断 你 那 骨 瘦 如 柴 的 脖 子 。
	AI_Output(other, self, "DIA_Dragon_Fire_Hello_15_05"); //别 那 么 急 ， 我 的 朋 友 。 我 身 上 带 着 英 诺 斯 之 眼 。 你 无 法 抵 抗 我 的 意 志 。 回 答 我 的 问 题 ， 否 则 你 将 无 法 承 受 那 种 痛 苦 。
	AI_Output(self, other, "DIA_Dragon_Fire_Hello_20_06"); //（ 呼 气 ） 啊 。 那 趁 着 你 还 可 以 的 时 候 说 出 你 荒 谬 的 问 题 吧 。 你 的 力 量 持 续 不 了 多 久.
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_WerBistDu(C_INFO)
{
	nr				= 5;
	condition		= DIA_Dragon_Fire_WerBistDu_Condition;
	information		= DIA_Dragon_Fire_WerBistDu_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Dragon_Fire_WerBistDu_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_WerBistDu_Info()
{
	AI_Output(other, self, "DIA_Dragon_Fire_WerBistDu_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Dragon_Fire_WerBistDu_20_01"); //我 叫 费 欧 玛 萨 ， 那 时 你 能 从 我 这 里 得 知 的 一 切 。
	AI_Output(self, other, "DIA_Dragon_Fire_WerBistDu_20_02"); //一 旦 我 脱 离 了 ‘ 眼 睛 ’ 的 魔 法 ， 你 将 被 火 焰 烧 死 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hort
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Fire_HORT(C_INFO)
{
	nr				= 5;
	condition		= DIA_Dragon_Fire_HORT_Condition;
	information		= DIA_Dragon_Fire_HORT_Info;
	description		= "那 么 你 的 宝 藏 在 哪 里 ？";
};

func int DIA_Dragon_Fire_HORT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_HORT_Info()
{
	AI_Output(other, self, "DIA_Dragon_Fire_HORT_15_00"); //每 条 龙 都 有 一 个 宝 库 来 保 存 他 收 集 的 财 宝 。 你 的 宝 库 在 哪 里 ？
	AI_Output(self, other, "DIA_Dragon_Fire_HORT_20_01"); //在 一 个 你 将 无 法 接 近 的 地 方 ， 一 旦 我 最 终 脱 离 ‘ 眼 睛 ’ 的 束 缚 。
	AI_Output(self, other, "DIA_Dragon_Fire_HORT_20_02"); //我 把 财 宝 藏 在 高 处 炽 热 的 悬 崖 上 ， 象 你 这 样 没 有 翅 膀 的 人 类 根 本 别 想 靠 近 。
};

//**********************************************************************************
//		B_AssignDragonTalk_Fire
//**********************************************************************************

func void B_AssignDragonTalk_Fire(var C_Npc slf)
{
	DIA_Dragon_Fire_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc = Hlp_GetInstanceID(slf);

	// Die Drachenfragen
	B_AssignDragonTalk_Main(slf);
};
