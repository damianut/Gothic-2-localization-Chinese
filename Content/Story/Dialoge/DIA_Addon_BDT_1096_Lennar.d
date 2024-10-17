// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Lennar_EXIT(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 999;
	condition		= DIA_Addon_Lennar_EXIT_Condition;
	information		= DIA_Addon_Lennar_EXIT_Info;
	permanent		= TRUE;
	description		= "我 必 须 走 了 … … ( 结 束 )";
};

func int DIA_Addon_Lennar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Lennar_PICKPOCKET(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 900;
	condition		= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information		= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen(65, 100);
};

func void DIA_Addon_Lennar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK, DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Lennar_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Lennar_Hi(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 1;
	condition		= DIA_Addon_Lennar_Hi_Condition;
	information		= DIA_Addon_Lennar_Hi_Info;
	description		= "嗨 。";
};

func int DIA_Addon_Lennar_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Lennar_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Lennar_Hi_15_00"); //嗨 。
	AI_Output(self, other, "DIA_Addon_Lennar_Hi_01_01"); //嗨 ， 我 是 雷 纳 尔 ？ 欢 迎 来 到 矿 工 营 地 。
	AI_Output(other, self, "DIA_Addon_Lennar_Hi_15_02"); //矿 工 ？ 我 以 为 这 是 强 盗 的 营 地 … …
	AI_Output(self, other, "DIA_Addon_Lennar_Hi_01_03"); //正 确 ， 但 是 强 盗 们 在 这 里 只 是 挖 矿 。 （ 耸 肩 ） 所 以 … …
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Lennar_Attentat(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 2;
	condition		= DIA_Addon_Lennar_Attentat_Condition;
	information		= DIA_Addon_Lennar_Attentat_Info;
	description		= "关 于 伊 斯 特 班 的 谋 杀 未 遂 者 … …";
};

func int DIA_Addon_Lennar_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); // Wegen des Attentast auf Esteban
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //（ 天 真 的 ） 是 吗 ？
	AI_Output(other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //你 知 道 谁 在 幕 后 吗 ？
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //（ 热 心 的 ） 当 然 ！
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //（ 兴 奋 的 ） 让 我 告 诉 你 ： 我 打 赌 那 个 艾 米 里 欧 一 定 是 这 件 事 的 后 台 ！
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //（ 兴 奋 的 ） 他 总 是 象 疯 子 一 样 跑 进 矿 井 。 他 能 挖 多 少 就 挖 多 少 。
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //（ 狡 诈 的 ） 但 是 在 袭 击 之 后 ， 他 一 直 坐 在 他 的 凳 子 上 ， 没 有 挪 动 过 一 寸 。
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //（ 明 确 的 ） 显 而 易 见 ！ 要 进 入 矿 井 ， 他 一 定 有 一 块 伊 斯 特 班 发 的 红 石 头 。
	AI_Output(self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //（ 阴 险 的 ） 我 打 赌 ， 他 不 敢 看 他 的 ‘ 眼 睛 ’ 。

	B_LogEntry(Topic_Addon_Esteban, Topic_Addon_Esteban_3);
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Lennar_Inspektor(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 3;
	condition		= DIA_Addon_Lennar_Inspektor_Condition;
	information		= DIA_Addon_Lennar_Inspektor_Info;
	description		= "艾 米 里 欧 能 从 伊 斯 特 班 的 死 亡 中 获 得 什 么 ？";
};

func int DIA_Addon_Lennar_Inspektor_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output(other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //艾 米 里 欧 能 从 伊 斯 特 班 的 死 亡 中 获 得 什 么 ？
	AI_Output(self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //我 知 道 什 么 ？ 也 许 他 有 个 朋 友 在 矿 井 里 ， 可 能 会 取 代 伊 斯 特 班 的 位 置 。
	AI_Output(self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //（ 自 言 自 语 ） 是 的 ， 那 样 很 合 理 … …
};

// ----------------------------------------------------------------------
//	Info Mine
// ----------------------------------------------------------------------
instance DIA_Addon_Lennar_Mine(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 4;
	condition		= DIA_Addon_Lennar_Mine_Condition;
	information		= DIA_Addon_Lennar_Mine_Info;
	description		= DIALOG_ADDON_MINE_DESCRIPTION;
};

func int DIA_Addon_Lennar_Mine_Condition()
{
	if ((MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems(other, ItmI_Addon_Stone_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Mine_Info()
{
	B_Say(other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems(other, self, ItmI_Addon_Stone_01, 1);
	AI_Output(self, other, "DIA_Addon_Lennar_Mine_01_00"); //你 真 的 有 一 块 红 石 头 给 我 。
	AI_Output(self, other, "DIA_Addon_Lennar_Mine_01_01"); //好 极 了 。 现 在 我 要 把 那 块 该 死 的 石 头 弄 的 粉 碎 - 我 已 经 知 道 我 要 从 哪 下 手 里 了 ！
	AI_Output(self, other, "DIA_Addon_Lennar_Mine_01_02"); //还 有 一 件 事 - 如 果 你 去 挖 矿 ， 注 意 不 要 挖 得 太 猛 。 否 则 你 的 十 字 镐 会 楔 到 黄 金 里 面 去 ！

	B_Upgrade_Hero_HackChance(10);

	Player_SentBuddler = (Player_SentBuddler + 1);
	B_GivePlayerXP(XP_Addon_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "MINE");
};

// ---------------------------------------------------------------------
//	Info Gold
// ---------------------------------------------------------------------
instance DIA_Addon_Lennar_Gold(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 5;
	condition		= DIA_Addon_Lennar_Gold_Condition;
	information		= DIA_Addon_Lennar_Gold_Info;
	description		= "你 能 教 我 任 何 关 于 采 金 的 技 能 吗 ？";
};

func int DIA_Addon_Lennar_Gold_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Gold_Info()
{
	AI_Output(other, self, "DIA_Addon_Lennar_Gold_15_00"); //你 能 教 我 任 何 关 于 采 金 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Addon_Lennar_Gold_01_01"); //当 然 ， 但 是 如 果 我 教 你 一 些 技 能 的 话 ， 你 就 能 挖 到 更 多 的 金 子 。
	AI_Output(other, self, "DIA_Addon_Lennar_Gold_15_02"); //所 以 我 才 要 问 。
	AI_Output(self, other, "DIA_Addon_Lennar_Gold_01_03"); //当 然 。 不 过 如 果 你 能 多 挖 一 些 ， 我 分 到 一 些 彩 头 当 然 很 合 理 。
	AI_Output(other, self, "DIA_Addon_Lennar_Gold_15_04"); //嗯 … …
	AI_Output(self, other, "DIA_Addon_Lennar_Gold_01_05"); //你 可 能 也 会 事 先 把 我 的 那 一 份 给 我 。 怎 么 样 … …
	AI_Output(self, other, "DIA_Addon_Lennar_Gold_01_06"); //五 十 枚 金 币 。
};

// ---------------------------------------------------------------------
//	Train
// ---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
instance DIA_Addon_Lennar_Train(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 6;
	condition		= DIA_Addon_Lennar_Train_Condition;
	information		= DIA_Addon_Lennar_Train_Info;
	permanent		= TRUE;
	description		= "教 我 挖 掘 黄 金 的 技 能 ！ （ ５ ０ 金 币 ）";
};

func int DIA_Addon_Lennar_Train_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Train_Info()
{
	AI_Output(other, self, "DIA_Addon_Lennar_Train_15_00"); //教 我 挖 掘 金 矿 的 技 能 ！

	if (B_GiveInvItems(other, self, itmi_gold, 50))
	{
		AI_Output(self, other, "DIA_Addon_Lennar_Train_01_01"); //好 。 通 常 挥 十 字 镐 会 把 你 向 前 带 。 动 作 不 要 太 过 火 - 但 是 也 不 要 在 挥 十 字 镐 时 睡 着 。
		AI_Output(self, other, "DIA_Addon_Lennar_Train_01_02"); //而 且 不 要 总 是 挖 一 个 点 - 试 试 旁 边 更 大 的 金 块 。
		AI_Output(self, other, "DIA_Addon_Lennar_Train_01_03"); //那 样 的 话 ， 你 就 已 经 踏 上 成 为 挖 掘 大 师 的 路 的 。

		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Lennar_Train_01_04"); //首 先 我 要 看 到 我 的 那 一 份 ！
	};
};

// ----------------------------------------------------------------------
//	Info Hacker
// ----------------------------------------------------------------------
instance DIA_Addon_Lennar_Hacker(C_INFO)
{
	npc				= BDT_1096_Addon_Lennar;
	nr				= 9;
	condition		= DIA_Addon_Lennar_Hacker_Condition;
	information		= DIA_Addon_Lennar_Hacker_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Addon_Lennar_Hacker_Condition()
{
	if (Npc_GetDistToWP(self, "ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lennar_Hacker_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //一 切 都 好 吗 ？
	AI_Output(self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //谨 慎 和 条 理 - 那 样 就 能 得 到 最 大 的 金 块 ！
};
