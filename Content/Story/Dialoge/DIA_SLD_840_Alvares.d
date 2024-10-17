///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_EXIT(C_INFO)
{
	npc				= SLD_840_Alvares;
	nr				= 999;
	condition		= DIA_Alvares_EXIT_Condition;
	information		= DIA_Alvares_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HauAb
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_HAUAB(C_INFO)
{
	npc				= SLD_840_Alvares;
	nr				= 4;
	condition		= DIA_Alvares_HAUAB_Condition;
	information		= DIA_Alvares_HAUAB_Info;
	important		= TRUE;
};

func int DIA_Alvares_HAUAB_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_HAUAB_Info()
{
	Akils_SLDStillthere = TRUE;
	AI_Output(self, other, "DIA_Alvares_HAUAB_11_00"); //不 管 你 是 因 为 什 么 到 这 里 来 的 - 你 最 好 就 此 打 住 ， 离 开 这 里 。
	Log_CreateTopic(TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_1);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Attack
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_ATTACK(C_INFO)
{
	npc				= SLD_840_Alvares;
	nr				= 6;
	condition		= DIA_Alvares_ATTACK_Condition;
	information		= DIA_Alvares_ATTACK_Info;
	important		= TRUE;
};

func int DIA_Alvares_ATTACK_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Alvares_HAUAB))
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Alvares_ATTACK_Info()
{
	AI_Output(self, other, "DIA_Alvares_ATTACK_11_00"); //嘿 ， 你 还 在 这 里 啊 。 我 会 给 你 一 个 选 择 ， 陌 生 人 ： 滚 蛋 ， 或 者 死 。

	Info_ClearChoices(DIA_Alvares_ATTACK);
	Info_AddChoice(DIA_Alvares_ATTACK, "你 们 是 什 么 家 伙 - 一 对 王 牌 吗 ？ ", DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice(DIA_Alvares_ATTACK, "我 想 要 加 入 你 们 的 雇 佣 兵 。", DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice(DIA_Alvares_ATTACK, "你 们 这 些 家 伙 马 上 离 开 这 里 … … ", DIA_Alvares_ATTACK_Witz);
	Info_AddChoice(DIA_Alvares_ATTACK, "我 不 想 惹 任 何 麻 烦 。", DIA_Alvares_ATTACK_Aerger);

	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Alvares_ATTACK, "我 只 是 来 拿 一 些 东 西 。", DIA_Alvares_ATTACK_Lieferung);
	};
};

func void DIA_Alvares_ATTACK_Witz()
{
	AI_Output(other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //你 们 这 些 家 伙 快 离 开 这 里 ， 明 白 吗 ？
	AI_Output(self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //看 这 里 ， 我 们 抓 住 了 一 个 英 雄 - 一 个 真 正 的 傻 子 英 雄 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //你 知 道 我 在 想 什 么 吗 ？
	AI_Output(other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //谁 在 乎 你 在 想 什 么 ？
	AI_Output(self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //我 想 一 个 真 正 的 英 雄 只 会 是 一 个 死 了 的 英 雄 。 所 以 ， 帮 帮 我 - 快 点 死 吧 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

func void DIA_Alvares_ATTACK_Kerle()
{
	AI_Output(other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //你 们 是 什 么 家 伙 - 一 对 王 牌 吗 ？
	AI_Output(self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //你 明 白 了 。 当 你 趴 在 烂 泥 里 的 时 候 ， 我 仍 然 会 哈 哈 大 笑 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //（ 叫 喊 ） 恩 加 罗 ， 我 们 开 始 吧 ！ 你 抢 农 民 - 我 来 解 决 这 个 乡 巴 佬 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

func void DIA_Alvares_ATTACK_Aerger()
{
	AI_Output(other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //我 不 想 惹 任 何 麻 烦 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //但 是 我 们 找 的 就 是 麻 烦 。 我 们 走 了 很 长 的 路 就 是 为 了 惹 一 些 小 麻 烦 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //是 的 ， 我 们 要 惹 出 一 大 堆 的 麻 烦 。 如 果 你 现 在 不 滚 开 的 话 ， 我 就 从 你 开 始 。

	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output(other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //我 只 是 来 拿 一 些 东 西 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //我 们 也 一 样 。 而 且 ， 是 我 们 先 到 这 里 的 。 所 以 ， 滚 蛋 ， 否 则 我 可 能 不 得 不 伤 害 你 了 。

	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output(other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //我 想 要 加 入 你 们 的 雇 佣 兵 。
	AI_Output(self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //哦 ， 真 的 吗 ？ 那 滚 开 - 否 则 你 就 再 也 别 想 加 入 任 何 人 了 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Schluss
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_Schluss(C_INFO)
{
	npc				= SLD_840_Alvares;
	nr				= 4;
	condition		= DIA_Alvares_Schluss_Condition;
	information		= DIA_Alvares_Schluss_Info;
	important		= TRUE;
};

func int DIA_Alvares_Schluss_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Alvares_ATTACK)))
	{
		return TRUE;
	};
};

func void DIA_Alvares_Schluss_Info()
{
	AI_Output(self, other, "DIA_Alvares_Schluss_11_00"); //你 有 过 机 会 。 但 是 ， 看 来 你 不 想 听 忠 告 。
	AI_Output(self, other, "DIA_Alvares_Schluss_11_01"); //好 吧 - 那 么 ， 我 现 在 就 要 杀 了 你 。 （ 叫 喊 ） 恩 加 罗 ， 我 们 来 干 掉 他 们 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Alvares_PICKPOCKET(C_INFO)
{
	npc				= SLD_840_Alvares;
	nr				= 900;
	condition		= DIA_Alvares_PICKPOCKET_Condition;
	information		= DIA_Alvares_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Alvares_PICKPOCKET_Condition()
{
	C_Beklauen(20, 15);
};

func void DIA_Alvares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
	Info_AddChoice(DIA_Alvares_PICKPOCKET, DIALOG_BACK, DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alvares_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};
