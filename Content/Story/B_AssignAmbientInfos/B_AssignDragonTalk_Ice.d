// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Ice_Exit(C_INFO)
{
	nr				= 999;
	condition		= DIA_Dragon_Ice_Exit_Condition;
	information		= DIA_Dragon_Ice_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Ice_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_Exit_Info()
{
	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);

	AI_Output(self, other, "DIA_Dragon_Ice_Exit_20_00"); //‘ 眼 睛 ’ 的 力 量 已 经 耗 尽 了 ， 你 的 生 命 也 走 到 尽 头 了 。

	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff, "Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_InsertNpc(Draconian, "FP_ROAM_OW_ICEREGION_29_02");

	Wld_InsertNpc(Draconian, "FP_ROAM_OW_ICEREGION_30_01");

	Wld_InsertNpc(Draconian, "FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(Draconian, "FP_ROAM_OW_BLOODFLY_05_01");
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Ice_Hello(C_INFO)
{
	nr				= 1;
	condition		= DIA_Dragon_Ice_Hello_Condition;
	information		= DIA_Dragon_Ice_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Ice_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Ice_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Ice_Hello_20_00"); //你 为 什 么 打 扰 我 的 睡 眠 ？ 我 还 要 隐 藏 很 久 ， 你 这 恼 人 的 小 东 西 能 走 开 吗 ？
	if (Mis_KilledDragons == 0)
	{
		AI_Output(other, self, "DIA_Dragon_Ice_Hello_15_01"); //一 条 会 说 话 的 龙 。 多 亏 有 英 诺 斯 之 眼 。
	};

	AI_Output(self, other, "DIA_Dragon_Ice_Hello_20_02"); //你 们 人 类 是 一 种 好 奇 的 生 物 。 在 被 死 亡 的 寒 风 扫 荡 之 后 ， 总 会 有 一 个 人 从 尸 骨 中 站 起 ， 认 为 他 命 中 注 定 是 一 个 英 雄 。
	AI_Output(self, other, "DIA_Dragon_Ice_Hello_20_03"); //不 过 那 很 快 就 会 结 束 。 我 会 亲 自 来 确 保 你 们 很 快 就 不 会 再 有 任 何 人 出 现 了 。
	AI_Output(other, self, "DIA_Dragon_Ice_Hello_15_04"); //安 静 。 既 然 眼 睛 的 力 量 充 斥 在 我 的 身 上 ， 我 命 令 你 回 答 我 的 问 题 。
	AI_Output(self, other, "DIA_Dragon_Ice_Hello_20_05"); //哈 哈 哈 。 那 就 问 吧 。 你 的 知 识 帮 不 了 你 。
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_WERBISTDU(C_INFO)
{
	nr				= 5;
	condition		= DIA_Dragon_Ice_WERBISTDU_Condition;
	information		= DIA_Dragon_Ice_WERBISTDU_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Dragon_Ice_WERBISTDU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_WERBISTDU_Info()
{
	AI_Output(other, self, "DIA_Dragon_Ice_WERBISTDU_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Dragon_Ice_WERBISTDU_20_01"); //我 是 芬 克 莱 夫 。 冰 雪 之 王 ， 集 会 的 监 视 人 ， 最 后 ， 也 是 你 的 死 亡 监 视 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info Beliar
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Ice_BELIAR(C_INFO)
{
	nr				= 6;
	condition		= DIA_Dragon_Ice_BELIAR_Condition;
	information		= DIA_Dragon_Ice_BELIAR_Info;
	description		= "你 为 哪 个 神 服 务 ？";
};

func int DIA_Dragon_Ice_BELIAR_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Ice_BELIAR_Info()
{
	AI_Output(other, self, "DIA_Dragon_Ice_BELIAR_15_00"); //你 为 哪 个 神 服 务 ？
	AI_Output(other, self, "DIA_Dragon_Ice_BELIAR_15_01"); //是 哪 个 可 恶 的 神 允 许 你 这 样 卑 劣 的 生 物 在 这 片 土 地 上 行 走 ？。
	AI_Output(self, other, "DIA_Dragon_Ice_BELIAR_20_02"); //不 用 费 心 去 想 我 们 集 会 的 意 义 了 ， 小 英 雄 。
	AI_Output(self, other, "DIA_Dragon_Ice_BELIAR_20_03"); //贝 利 尔 不 是 允 许 我 们 来 这 里 - 而 是 命 令 。
	AI_Output(self, other, "DIA_Dragon_Ice_BELIAR_20_04"); //在 他 神 圣 命 令 下 ， 我 们 绝 不 能 在 实 现 他 的 意 愿 之 前 休 息 。
};

//**********************************************************************************
//		B_AssignDragonTalk_Ice
//**********************************************************************************

func void B_AssignDragonTalk_Ice(var C_Npc slf)
{
	DIA_Dragon_Ice_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_BELIAR.npc = Hlp_GetInstanceID(slf);

	// Die Drachenfragen
	B_AssignDragonTalk_Main(slf);
};
