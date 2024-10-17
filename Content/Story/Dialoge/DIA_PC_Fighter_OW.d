// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_GornOW_EXIT(C_INFO)
{
	npc				= PC_Fighter_OW;
	nr				= 999;
	condition		= DIA_GornOW_EXIT_Condition;
	information		= DIA_GornOW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_GornOW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornOW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  Hallo
// ************************************************************
instance DIA_GornOW_Hello(C_INFO)
{
	npc				= PC_Fighter_OW;
	nr				= 2;
	condition		= DIA_GornOW_Hello_Condition;
	information		= DIA_GornOW_Hello_Info;
	important		= TRUE;
};

func int DIA_GornOW_Hello_Condition()
{
	return TRUE;
};

func void DIA_GornOW_Hello_Info()
{
	var C_Npc Milten;
	Milten = Hlp_GetNpc(PC_Mage_OW);

	AI_Output(other, self, "DIA_GornOW_Hello_15_00"); //受 够 了 这 样 虚 度 光 阴 的 日 子 - 你 自 由 了 ！
	AI_Output(self, other, "DIA_GornOW_Hello_12_01"); //现 在 该 有 人 把 我 弄 出 去 。
	AI_Output(self, other, "DIA_GornOW_Hello_12_02"); //可 是 ， 我 确 实 没 想 过 那 个 人 会 是 你 。 见 到 你 真 是 好 极 了 。
	AI_Output(other, self, "DIA_GornOW_Hello_15_03"); //（ 咧 着 嘴 笑 ） 加 隆 德 说 你 吃 得 太 多 ， 他 养 不 起 你 了 。
	AI_Output(self, other, "DIA_GornOW_Hello_12_04"); //既 然 你 提 起 了 这 事 ， 我 可 以 请 你 喝 两 杯 啤 酒 。 我 们 从 这 里 出 去 吧 ， 我 看 够 了 这 个 房 间 了 。

	if (other.guild == GIL_SLD)
	{
		AI_Output(self, other, "DIA_GornOW_Add_12_00"); //等 一 下 ， 我 这 里 还 有 些 对 你 十 分 有 用 的 东 西 。
		AI_Output(self, other, "DIA_GornOW_Add_12_01"); //我 在 囚 室 里 发 现 了 这 件 盔 甲 。 可 能 是 哪 个 囚 犯 把 它 藏 在 这 里 的 。
		B_GiveInvItems(self, other, itar_sld_M, 1);
		AI_Output(self, other, "DIA_GornOW_Add_12_02"); //我 穿 着 它 太 小 了 ， 但 它 也 许 适 合 你 … …
		AI_Output(other, self, "DIA_GornOW_Add_15_03"); //谢 谢 ！ 我 会 在 米 尔 腾 那 里 跟 你 碰 面 … …
	}
	else
	{
		AI_Output(other, self, "DIA_GornOW_Hello_15_05"); //好 的 ， 到 米 尔 腾 那 里 见 。
	};

	AI_Output(self, other, "DIA_GornOW_Hello_12_06"); //当 然 了 。

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "FREE");
	B_StartOtherRoutine(Milten, "GORNFREE");
	MIS_RescueGorn = LOG_SUCCESS;
	B_GivePlayerXP(XP_RescueGorn);
};

// ************************************************************
// 			Bei Milten
// ************************************************************
instance DIA_GornOW_MetMilten(C_INFO)
{
	npc				= PC_Fighter_OW;
	nr				= 2;
	condition		= DIA_GornOW_MetMilten_Condition;
	information		= DIA_GornOW_MetMilten_Info;
	important		= TRUE;
};

func int DIA_GornOW_MetMilten_Condition()
{
	if ((Mis_RescueGorn == LOG_SUCCESS)
	&& (Npc_GetDistToWP(self, "OC_MAGE_LIBRARY_IN") <= 500)
	&& Npc_IsInState(self, ZS_Talk)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_MetMilten_Info()
{
	AI_Output(self, other, "DIA_GornOW_MetMilten_12_00"); //听 着 - 我 在 这 里 闲 逛 太 久 了 。 现 在 应 该 去 看 看 这 个 山 谷 外 面 的 东 西 了 。
	AI_Output(self, other, "DIA_GornOW_MetMilten_12_01"); //你 怎 么 通 过 关 卡 的 ？
	AI_Output(other, self, "DIA_GornOW_MetMilten_15_02"); //有 一 条 小 路 穿 过 废 弃 的 矿 井 。
	AI_Output(self, other, "DIA_GornOW_MetMilten_12_03"); //很 好 。 我 会 等 待 一 个 好 时 机 离 开 这 里 。

	if (other.guild != GIL_SLD)
	{
		AI_Output(other, self, "DIA_GornOW_MetMilten_15_04"); //那 时 你 要 去 哪 里 ？
		AI_Output(self, other, "DIA_GornOW_MetMilten_12_05"); //我 听 说 李 还 活 着 。 我 想 再 去 投 奔 他 。
	}
	else
	{
		AI_Output(other, self, "DIA_GornOW_MetMilten_15_06"); //那 就 去 欧 纳 尔 的 农 场 吧 。 李 和 他 的 人 都 在 那 里 。 他 需 要 向 你 这 样 优 秀 的 人 。
		AI_Output(self, other, "DIA_GornOW_MetMilten_12_07"); //我 会 的 。 我 要 去 看 看 他 们 在 那 里 干 什 么 。
	};
};

// ************************************************************
// 	Perm Kap.2
// ************************************************************
instance DIA_GornOW_SeeYou(C_INFO)
{
	npc				= PC_Fighter_OW;
	nr				= 900;
	condition		= DIA_GornOW_SeeYou_Condition;
	information		= DIA_GornOW_Seeyou_Info;
	permanent		= TRUE;
	description		= "我 们 会 再 见 面 的 。";
};

func int DIA_GornOW_SeeYou_Condition()
{
	if (Npc_KnowsInfo(other, DIA_GornOW_MetMilten)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_GornOW_SeeYou_Info()
{
	AI_Output(other, self, "DIA_GornOW_SeeYou_15_00"); //我 们 会 再 见 面 的 。
	AI_Output(self, other, "DIA_GornOW_SeeYou_12_01"); //你 要 对 它 有 信 心 。

	/*
	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_GornOW_SeeYou_12_01"); //
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output(self, other, "DIA_GornOW_SeeYou_12_01"); //
	}
	else // SLD
	{
		AI_Output(self, other, "DIA_GornOW_SeeYou_12_01"); //
	};

	*/
	AI_StopProcessInfos(self);
};
