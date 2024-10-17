// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

var int DJG_Cipher_DragonKilledNotYet;

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_EXIT(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 999;
	condition		= DIA_CipherDJG_EXIT_Condition;
	information		= DIA_CipherDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_CipherDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_CipherDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Cipher_HALLO(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 0;
	condition		= DIA_Cipher_HALLO_Condition;
	information		= DIA_Cipher_HALLO_Info;
	description		= "不 错 的 营 地 。";
};

func int DIA_Cipher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Cipher_HALLO_Info()
{
	AI_Output(other, self, "DIA_Cipher_HALLO_15_00"); //不 错 的 营 地 。
	AI_Output(self, other, "DIA_Cipher_HALLO_07_01"); //你 说 对 了 。 这 里 好 像 屠 宰 厂 一 样 臭 。 动 物 死 尸 和 腐 烂 的 树 木 到 处 都 是 。！
};

///////////////////////////////////////////////////////////////////////
//	Info HelloAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_HELLOAGAIN(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 0;
	condition		= DIA_CipherDJG_HELLOAGAIN_Condition;
	information		= DIA_CipherDJG_HELLOAGAIN_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_CipherDJG_HELLOAGAIN_Condition()
{
	if (
	((Npc_IsDead(SwampDragon)) == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Cipher_HALLO))
	)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_HELLOAGAIN_Info()
{
	AI_Output(other, self, "DIA_CipherDJG_HELLOAGAIN_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_01"); //我 已 经 在 这 里 等 了 一 段 时 间 了 ， 就 差 一 个 正 确 的 时 机 。
	AI_Output(other, self, "DIA_CipherDJG_HELLOAGAIN_15_02"); //正 确 的 时 机 ？ 做 什 么 ？
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_03"); //应 该 有 一 条 龙 在 那 里 筑 了 巢 。 自 从 他 到 来 之 后 ， 那 里 出 现 了 一 个 非 常 肮 脏 的 沼 泽 。
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_04"); //我 还 清 楚 地 记 得 ， 以 前 在 这 里 行 走 绝 对 不 会 把 脚 弄 湿 。
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_05"); //但 是 现 在 ， 我 绝 对 不 会 独 自 去 那 里 。

	if ((Npc_IsDead(DJG_Rod)) == FALSE)
	{
		AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_06"); //嗯 。 罗 德 还 在 这 里 。 但 是 他 见 到 肉 虫 就 会 逃 走 。
	};

	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_07_07"); //那 么 你 呢 ？ 你 不 会 就 是 到 这 里 来 享 受 的 ， 对 吧 ？ 我 们 一 起 去 那 里 。

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_2);

	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN, "我 宁 愿 独 自 呆 着 。", DIA_CipherDJG_HELLOAGAIN_GoAlone);
	Info_AddChoice(DIA_CipherDJG_HELLOAGAIN, "为 什 么 不 呢 - 我 需 要 帮 助 。", DIA_CipherDJG_HELLOAGAIN_GoTogether);
};

func void DIA_CipherDJG_HELLOAGAIN_GoAlone()
{
	AI_Output(other, self, "DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00"); //我 宁 愿 独 自 呆 着 。
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01"); //你 随 便 吧 。 那 我 是 看 错 你 了 ！
	AI_StopProcessInfos(self);
};

func void DIA_CipherDJG_HELLOAGAIN_GoTogether()
{
	AI_Output(other, self, "DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00"); //为 什 么 不 呢 - 我 需 要 帮 助 。
	AI_Output(self, other, "DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01"); //那 很 好 。 我 终 于 可 以 离 开 这 里 。 这 种 臭 气 令 人 无 法 忍 受 。 马 上 下 命 令 吧 ！

	DJG_SwampParty = TRUE;
	Info_ClearChoices(DIA_CipherDJG_HELLOAGAIN);
};

///////////////////////////////////////////////////////////////////////
//	Info GoTogetherAgain
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GOTOGETHERAGAIN(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 0;
	condition		= DIA_CipherDJG_GOTOGETHERAGAIN_Condition;
	information		= DIA_CipherDJG_GOTOGETHERAGAIN_Info;
	description		= "我 改 变 主 意 了 ！ 我 们 一 起 走 吧 ！";
};

func int DIA_CipherDJG_GOTOGETHERAGAIN_Condition()
{
	if
	(
	(Npc_KnowsInfo(other, DIA_CipherDJG_HELLOAGAIN))
	&& (DJG_SwampParty == FALSE)
	&& ((Npc_IsDead(Swampdragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GOTOGETHERAGAIN_Info()
{
	AI_Output(other, self, "DIA_CipherDJG_GOTOGETHERAGAIN_15_00"); //我 改 变 主 意 了 ！ 我 们 一 起 走 吧 ！
	AI_Output(self, other, "DIA_CipherDJG_GOTOGETHERAGAIN_07_01"); //马 上 下 命 令 吧 ！
	DJG_SwampParty = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Go
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_GO(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 0;
	condition		= DIA_CipherDJG_GO_Condition;
	information		= DIA_CipherDJG_GO_Info;
	description		= "现 在 应 该 是 继 续 前 进 的 好 时 机 ！";
};

func int DIA_CipherDJG_GO_Condition()
{
	if
	(
	(DJG_SwampParty == TRUE)
	&& ((Npc_IsDead(SwampDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

var int DJG_SwampParty_GoGoGo;
func void DIA_CipherDJG_GO_Info()
{
	AI_Output(other, self, "DIA_CipherDJG_GO_15_00"); //现 在 应 该 是 继 续 前 进 的 好 时 机 ！
	AI_Output(self, other, "DIA_CipherDJG_GO_07_01"); //那 我 们 走 ！

	AI_StopProcessInfos(self);
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "SwampWait1");
	B_StartOtherRoutine(DJG_Rod, "SwampWait1");
};

//***************************************************************************
//	Info SwampWait2
//***************************************************************************
instance DIA_CipherDJG_SwampWait2(C_INFO)
{
	npc				= DJG_703_Cipher;
	condition		= DIA_CipherDJG_SwampWait2_Condition;
	information		= DIA_CipherDJG_SwampWait2_Info;
	important		= TRUE;
};

func int DIA_CipherDJG_SwampWait2_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_DJG_SWAMP_WAIT1_01") < 700)
	&& ((Npc_IsDead(SwampDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SwampWait2_Info()
{
	AI_Output(self, other, "DIA_CipherDJG_SwampWait2_07_00"); //从 这 里 开 始 ， 下 个 拐 弯 的 后 面 就 是 沼 泽 的 起 点 。 我 建 议 我 们 直 接 穿 过 这 里 。
	AI_Output(self, other, "DIA_CipherDJG_SwampWait2_07_01"); //或 者 你 可 以 去 检 查 那 边 的 通 道 ， 那 样 就 不 会 有 野 兽 会 从 后 面 袭 击 我 们 。 你 选 哪 个 ？
	AI_Output(other, self, "DIA_CipherDJG_SwampWait2_15_02"); //我 们 不 要 浪 费 任 何 时 间 ！

	Info_AddChoice(DIA_CipherDJG_SwampWait2, DIALOG_ENDE, DIA_CipherDJG_SwampWait2_weiter);
};

func void DIA_CipherDJG_SwampWait2_weiter()
{
	AI_StopProcessInfos(self);

	DJG_SwampParty = TRUE;
	DJG_SwampParty_GoGoGo = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "SwampWait2");
	B_StartOtherRoutine(DJG_Rod, "SwampWait2");
};

//***************************************************************************
//	Info GoForSwampDragon
//***************************************************************************
instance DIA_CipherDJG_GoForSwampDragon(C_INFO)
{
	npc				= DJG_703_Cipher;
	condition		= DIA_CipherDJG_GoForSwampDragon_Condition;
	information		= DIA_CipherDJG_GoForSwampDragon_Info;
	important		= TRUE;
};

func int DIA_CipherDJG_GoForSwampDragon_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_DJG_SWAMP_WAIT2_01") < 1000)
	&& ((Npc_IsDead(SwampDragon)) == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_GoForSwampDragon_Info()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Exit)) // Joly: schon zum Drachen gesprochen!
	{
		AI_Output(self, other, "DIA_CipherDJG_GoForSwampDragon_07_00"); //（ 呼 气 ） 进 攻 ！
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "SwampDragon");
		B_StartOtherRoutine(DJG_Rod, "SwampDragon");
	}
	else // Joly: noch nicht zum Drachen gesprochen! griefen an, wenn der Dialog mit "Swampi" zu ende ist
	{
		AI_Output(self, other, "DIA_CipherDJG_GoForSwampDragon_07_01"); //我 几 乎 能 听 到 那 个 家 伙 的 声 音 了 。 我 们 必 须 要 小 心 ！
		AI_Output(self, other, "DIA_CipherDJG_GoForSwampDragon_07_02"); //往 前 去 ， 看 看 我 们 是 否 可 以 进 攻 。
		AI_StopProcessInfos(self);
	};

	self.flags = 0; // Joly: Wer weiß!!?!
	DJG_Rod.flags = 0;
};

///////////////////////////////////////////////////////////////////////
//	Info SwampDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_SWAMPDRAGONDEAD(C_INFO)
{
	npc				= DJG_703_Cipher;
	condition		= DIA_CipherDJG_SWAMPDRAGONDEAD_Condition;
	information		= DIA_CipherDJG_SWAMPDRAGONDEAD_Info;
	important		= TRUE;
};

func int DIA_CipherDJG_SWAMPDRAGONDEAD_Condition()
{
	if (
	((Npc_IsDead(SwampDragon)) == TRUE)
	&& (DJG_SwampParty == TRUE)
	&& (DJG_SwampParty_GoGoGo == TRUE)
	)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_SWAMPDRAGONDEAD_Info()
{
	AI_Output(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_00"); //该 死 。 它 死 了 吗 ？
	AI_Output(other, self, "DIA_CipherDJG_SWAMPDRAGONDEAD_15_01"); //冷 静 。 结 束 了 ！
	AI_Output(self, other, "DIA_CipherDJG_SWAMPDRAGONDEAD_07_02"); //小 伙 子 ， 多 么 出 色 的 一 个 人 。

	AI_StopProcessInfos(self);
	B_GivePlayerXP(XP_CipherDJGDeadDragon);

	DJG_SwampParty = FALSE;
	DJG_SwampParty_GoGoGo = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "Start");
	B_StartOtherRoutine(DJG_Rod, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info WhatNext
///////////////////////////////////////////////////////////////////////
instance DIA_CipherDJG_WHATNEXT(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 0;
	condition		= DIA_CipherDJG_WHATNEXT_Condition;
	information		= DIA_CipherDJG_WHATNEXT_Info;
	permanent		= TRUE;
	description		= "沼 泽 龙 死 了 ！ 你 现 在 准 备 做 什 么 ？!";
};

func int DIA_CipherDJG_WHATNEXT_Condition()
{
	if ((Npc_IsDead(SwampDragon)) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_CipherDJG_WHATNEXT_Info()
{
	AI_Output(other, self, "DIA_CipherDJG_WHATNEXT_15_00"); //沼 泽 龙 死 了 ！ 你 现 在 准 备 做 什 么 ？
	AI_Output(self, other, "DIA_CipherDJG_WHATNEXT_07_01"); //不 知 道 。 我 真 的 从 来 没 有 考 虑 过 。 至 少 你 现 在 可 以 作 为 英 雄 返 回 克 霍 里 尼 斯 。
	AI_Output(self, other, "DIA_CipherDJG_WHATNEXT_07_02"); //我 打 赌 用 这 个 可 以 造 出 很 多 东 西 。 考 虑 一 下 。！

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_3);

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Cipher_PICKPOCKET(C_INFO)
{
	npc				= DJG_703_Cipher;
	nr				= 900;
	condition		= DIA_Cipher_PICKPOCKET_Condition;
	information		= DIA_Cipher_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Cipher_PICKPOCKET_Condition()
{
	C_Beklauen(79, 220);
};

func void DIA_Cipher_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
	Info_AddChoice(DIA_Cipher_PICKPOCKET, DIALOG_BACK, DIA_Cipher_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cipher_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Cipher_PICKPOCKET_DoIt);
};

func void DIA_Cipher_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};

func void DIA_Cipher_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};
