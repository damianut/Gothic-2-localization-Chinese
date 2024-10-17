// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Rock_Exit(C_INFO)
{
	nr				= 999;
	condition		= DIA_Dragon_Rock_Exit_Condition;
	information		= DIA_Dragon_Rock_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Rock_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_Exit_Info()
{
	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);

	AI_Output(self, other, "DIA_Dragon_Rock_Exit_20_00"); //已 经 说 够 了 。 你 短 暂 的 力 量 已 经 耗 尽 。 ‘ 眼 睛 ’ 已 经 失 去 了 它 的 能 量 。 准 备 死 吧 。

	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Rock_Hello(C_INFO)
{
	nr				= 1;
	condition		= DIA_Dragon_Rock_Hello_Condition;
	information		= DIA_Dragon_Rock_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Rock_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Rock_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Rock_Hello_20_00"); //又 有 一 个 放 肆 的 人 类 胆 敢 爬 上 我 的 岩 石 。 你 这 渺 小 的 人 类 。 非 常 勇 敢 ， 也 非 常 脆 弱 。
	if (Mis_KilledDragons == 0)
	{
		AI_Output(other, self, "DIA_Dragon_Rock_Hello_15_01"); //嘿 ， 你 真 的 会 说 话 。
	};

	AI_Output(self, other, "DIA_Dragon_Rock_Hello_20_02"); //我 要 把 你 的 内 脏 挖 出 来 喂 老 鼠 。
	AI_Output(other, self, "DIA_Dragon_Rock_Add_15_00"); //别 那 么 急 。 我 带 着 英 诺 斯 之 眼 。 你 要 服 从 我 ， 并 回 答 我 的 问 题 。
	AI_Output(self, other, "DIA_Dragon_Rock_Hello_20_04"); //（ 呼 气 ） 啊 。 问 你 的 问 题 吧 。
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_WERBISTDU(C_INFO)
{
	nr				= 6;
	condition		= DIA_Dragon_Rock_WERBISTDU_Condition;
	information		= DIA_Dragon_Rock_WERBISTDU_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Dragon_Rock_WERBISTDU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_WERBISTDU_Info()
{
	AI_Output(other, self, "DIA_Dragon_Rock_WERBISTDU_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Dragon_Rock_WERBISTDU_20_01"); //我 叫 派 德 拉 罕 ， 我 会 在 抓 住 你 以 后 慢 慢 地 活 剥 掉 你 的 皮 。
};

///////////////////////////////////////////////////////////////////////
//	Info Hierarchie
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Rock_HIERARCHIE(C_INFO)
{
	nr				= 7;
	condition		= DIA_Dragon_Rock_HIERARCHIE_Condition;
	information		= DIA_Dragon_Rock_HIERARCHIE_Info;
	description		= "你 们 这 些 龙 中 最 强 壮 的 是 哪 个 ？";
};

func int DIA_Dragon_Rock_HIERARCHIE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_HIERARCHIE_Info()
{
	AI_Output(other, self, "DIA_Dragon_Rock_HIERARCHIE_15_00"); //你 们 这 些 龙 中 最 强 壮 的 是 哪 个 ？
	AI_Output(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_01"); //我 们 从 这 个 世 界 的 元 素 之 中 抽 取 我 们 的 力 量 。 它 们 的 等 级 体 系 分 明 而 简 单 。
	AI_Output(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_02"); //大 地 由 柔 软 的 泥 土 构 成 ， 并 在 阳 光 下 孕 育 了 所 有 生 物 的 生 命 。 然 而 当 你 靠 它 太 近 的 时 候 ， 它 会 开 放 并 把 你 整 个 吞 噬 掉 。
	AI_Output(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_03"); //岩 石 ， 宁 愿 粉 碎 也 不 投 降 ， 骄 傲 地 耸 立 ， 并 把 粗 心 者 埋 葬 在 它 下 面 。 然 而 它 又 提 供 最 好 的 防 护 抵 抗 潮 汐 。
	AI_Output(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_04"); //生 命 的 闪 光 生 活 在 这 个 世 界 深 深 的 火 焰 之 中 。 而 这 火 焰 呼 吸 之 间 就 会 将 一 切 焚 化 ， 除 了 灰 烬 什 么 都 不 留 。
	AI_Output(self, other, "DIA_Dragon_Rock_HIERARCHIE_20_05"); //我 们 所 有 的 环 境 都 是 在 保 护 和 毁 灭 。 但 是 在 水 中 ， 即 使 坚 硬 如 岩 石 的 一 切 也 会 被 转 变 成 没 有 生 命 可 以 存 在 的 永 恒 的 盐 柱 。
};

//**********************************************************************************
//		B_AssignDragonTalk_Rock
//**********************************************************************************

func void B_AssignDragonTalk_Rock(var C_Npc slf)
{
	DIA_Dragon_Rock_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc = Hlp_GetInstanceID(slf);

	// Die Drachenfragen
	B_AssignDragonTalk_Main(slf);
};
