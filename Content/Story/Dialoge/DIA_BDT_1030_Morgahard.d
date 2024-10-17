///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_EXIT(C_INFO)
{
	npc				= BDT_1030_Morgahard;
	nr				= 999;
	condition		= DIA_Morgahard_EXIT_Condition;
	information		= DIA_Morgahard_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Morgahard_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_HALLO(C_INFO)
{
	npc				= BDT_1030_Morgahard;
	nr				= 3;
	condition		= DIA_Morgahard_HALLO_Condition;
	information		= DIA_Morgahard_HALLO_Info;
	description		= "你 是 默 加 哈 德 。";
};

func int DIA_Morgahard_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Morgahard_HALLO_Info()
{
	AI_Output(other, self, "DIA_Morgahard_HALLO_15_00"); //你 是 默 加 哈 德 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_07_01"); //你 怎 么 会 知 道 我 的 名 字 ？
	AI_Output(other, self, "DIA_Morgahard_HALLO_15_02"); //法 官 在 找 你 。 你 从 他 的 监 狱 里 逃 走 了 。
	AI_Output(other, self, "DIA_Morgahard_HALLO_15_03"); //那 你 做 了 什 么 ？ 偷 了 他 的 钱 包 ？
	AI_Output(self, other, "DIA_Morgahard_HALLO_07_04"); //不 是 他 的 。 是 总 督 的 ， 也 为 了 他 的 利 益 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_07_05"); //在 我 们 攻 击 了 总 督 之 后 ， 他 不 想 和 我 们 分 享 战 利 品 ， 就 把 我 们 关 了 起 来 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_07_06"); //我 们 不 想 在 绞 架 上 完 蛋 ， 所 以 我 们 逃 跑 了 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_07_07"); //我 们 以 为 他 们 永 远 抓 不 到 我 们 。 看 来 是 错 了 。

	Info_ClearChoices(DIA_Morgahard_HALLO);
	Info_AddChoice(DIA_Morgahard_HALLO, "别 发 牢 骚 了 ， 把 你 的 武 器 拔 出 来 。", DIA_Morgahard_HALLO_attack);
	Info_AddChoice(DIA_Morgahard_HALLO, "我 们 要 怎 么 做 来 对 抗 法 官 ？", DIA_Morgahard_HALLO_richter);
	Info_AddChoice(DIA_Morgahard_HALLO, "法 官 命 令 我 杀 了 你 。", DIA_Morgahard_HALLO_tot);
	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_2);
	SCFoundMorgahard = TRUE;
	B_GivePlayerXP(XP_FoundMorgahard);
};

func void DIA_Morgahard_HALLO_tot()
{
	AI_Output(other, self, "DIA_Morgahard_HALLO_tot_15_00"); //法 官 命 令 我 杀 了 你 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_tot_07_01"); //对 ， 当 然 。 所 以 你 才 会 在 这 里 ， 对 吗 ？
};

func void DIA_Morgahard_HALLO_richter()
{
	AI_Output(other, self, "DIA_Morgahard_HALLO_richter_15_00"); //我 们 要 怎 么 做 来 对 抗 法 官 ？
	AI_Output(self, other, "DIA_Morgahard_HALLO_richter_07_01"); //没 什 么 。 他 在 镇 子 的 最 里 面 ， 就 像 一 只 蜘 蛛 坐 在 它 的 网 上 ， 无 形 的 网 。
	AI_Output(other, self, "DIA_Morgahard_HALLO_richter_15_02"); //我 不 应 该 那 么 说 。 我 们 只 需 要 一 些 证 据 来 证 明 他 在 总 督 事 件 中 的 罪 证 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_richter_07_03"); //你 说 罪 证 ？ 我 有 。 但 是 谁 会 听 一 个 罪 犯 所 说 的 话 ？
	AI_Output(other, self, "DIA_Morgahard_HALLO_richter_15_04"); //把 你 的 证 据 给 我 ， 我 来 确 保 不 会 有 人 再 追 捕 你 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_richter_07_05"); //你 肯 定 吗 ？ 好 吧 。 给 ， 拿 上 这 封 信 。 上 面 有 法 官 的 签 名 。
	B_GiveInvItems(self, other, ItWr_RichterKomproBrief_MIS, 1);
	AI_Output(self, other, "DIA_Morgahard_HALLO_richter_07_06"); //即 使 它 无 法 澄 清 我 的 罪 行 ， 也 足 够 指 证 他 也 是 此 事 的 同 谋 。
	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_3);
	AI_StopProcessInfos(self);
};

var int MorgahardSucked;
func void DIA_Morgahard_HALLO_attack()
{
	AI_Output(other, self, "DIA_Morgahard_HALLO_attack_15_00"); //别 发 牢 骚 了 ， 拔 出 你 的 武 器 。 我 们 现 在 做 个 了 断 。
	AI_Output(self, other, "DIA_Morgahard_HALLO_attack_07_01"); //我 同 意 。 至 少 我 不 怕 再 失 去 任 何 东 西 。
	AI_StopProcessInfos(self);
	MorgahardSucked = TRUE;
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm(C_INFO)
{
	npc				= BDT_1030_Morgahard;
	nr				= 3;
	condition		= DIA_Morgahard_Perm_Condition;
	information		= DIA_Morgahard_Perm_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Morgahard_Perm_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Morgahard_HALLO))
	&& (MorgahardSucked == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm_Info()
{
	AI_Output(self, other, "DIA_Morgahard_Perm_07_00"); //那 个 法 官 畜 牲 - 我 希 望 有 一 天 能 看 见 他 挂 在 绞 架 上 。
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm2
///////////////////////////////////////////////////////////////////////
instance DIA_Morgahard_Perm2(C_INFO)
{
	npc				= BDT_1030_Morgahard;
	nr				= 3;
	condition		= DIA_Morgahard_Perm2_Condition;
	information		= DIA_Morgahard_Perm2_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Morgahard_Perm2_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (MorgahardSucked == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Morgahard_Perm2_Info()
{
	AI_Output(self, other, "DIA_Morgahard_Perm2_07_00"); //你 为 什 么 不 消 失 ？
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Morgahard_PICKPOCKET(C_INFO)
{
	npc				= BDT_1030_Morgahard;
	nr				= 900;
	condition		= DIA_Morgahard_PICKPOCKET_Condition;
	information		= DIA_Morgahard_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Morgahard_PICKPOCKET_Condition()
{
	C_Beklauen(73, 45);
};

func void DIA_Morgahard_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET, DIALOG_BACK, DIA_Morgahard_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Morgahard_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Morgahard_PICKPOCKET_DoIt);
};

func void DIA_Morgahard_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};

func void DIA_Morgahard_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Morgahard_PICKPOCKET);
};
