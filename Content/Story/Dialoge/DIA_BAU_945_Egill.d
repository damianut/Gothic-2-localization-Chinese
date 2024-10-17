///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_EXIT(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 999;
	condition		= DIA_Egill_EXIT_Condition;
	information		= DIA_Egill_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Egill_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Egill_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_HALLO(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 3;
	condition		= DIA_Egill_HALLO_Condition;
	information		= DIA_Egill_HALLO_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Egill_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Egill_HALLO_Info()
{
	AI_Output(other, self, "DIA_Egill_HALLO_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Egill_HALLO_08_01"); //距 离 上 一 个 出 现 在 我 们 的 土 地 上 、 而 且 不 想 骗 我 们 的 陌 生 人 ， 已 经 过 了 很 长 时 间 了 。
	AI_Output(self, other, "DIA_Egill_HALLO_08_02"); //我 希 望 我 没 有 看 错 你 。
	AI_Output(self, other, "DIA_Egill_HALLO_08_03"); //我 是 艾 吉 尔。

	if ((Hlp_IsValidNpc(Ehnim))
	&& (!C_NpcIsDown(Ehnim)))
	{
		AI_Output(self, other, "DIA_Egill_HALLO_08_04"); //那 边 那 个 怪 人 是 我 的 兄 弟 艾 尼 姆 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info feldarbeit
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDARBEIT(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 4;
	condition		= DIA_Egill_FELDARBEIT_Condition;
	information		= DIA_Egill_FELDARBEIT_Info;
	description		= "农 场 的 动 作 怎 么 样 ？";
};

func int DIA_Egill_FELDARBEIT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Egill_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDARBEIT_Info()
{
	AI_Output(other, self, "DIA_Egill_FELDARBEIT_15_00"); //农 场 的 动 作 怎 么 样 ？
	AI_Output(self, other, "DIA_Egill_FELDARBEIT_08_01"); //好 极 了 。 如 果 那 些 可 恶 的 旷 野 袭 击 者 不 是 一 直 在 破 坏 我 们 的 庄 稼 的 话 … …
};

///////////////////////////////////////////////////////////////////////
//	Info Feldraeuber
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_FELDRAEUBER(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 5;
	condition		= DIA_Egill_FELDRAEUBER_Condition;
	information		= DIA_Egill_FELDRAEUBER_Info;
	description		= "对 于 那 些 旷 野 袭 击 者 ， 你 为 什 么 不 做 任 何 事 ？";
};

func int DIA_Egill_FELDRAEUBER_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Egill_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Egill_FELDRAEUBER_Info()
{
	AI_Output(other, self, "DIA_Egill_FELDRAEUBER_15_00"); //对 于 那 些 旷 野 袭 击 者 ， 你 为 什 么 不 做 任 何 事 ？
	AI_Output(self, other, "DIA_Egill_FELDRAEUBER_08_01"); //你 在 开 玩 笑 。 自 从 我 呆 在 这 个 农 场 ， 我 已 经 杀 了 不 计 其 数 的 野 兽 。
	AI_Output(self, other, "DIA_Egill_FELDRAEUBER_08_02"); //不 过 ， 唉 ， 新 的 野 兽 还 是 不 断 出 现 。
};

///////////////////////////////////////////////////////////////////////
//	Info Streit2
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT2(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 6;
	condition		= DIA_Egill_STREIT2_Condition;
	information		= DIA_Egill_STREIT2_Info;
	description		= "你 的 兄 弟 说 了 一 个 类 似 的 故 事 。";
};

func int DIA_Egill_STREIT2_Condition()
{
	if ((
	(Npc_KnowsInfo(other, DIA_Egill_FELDRAEUBER))
	&& (Npc_KnowsInfo(other, DIA_Ehnim_FELDRAEUBER))
	)
	&&
	(
	(Hlp_IsValidNpc(Ehnim))
	&& (!C_NpcIsDown(Ehnim))
	))
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT2_Info()
{
	AI_Output(other, self, "DIA_Egill_STREIT2_15_00"); //你 的 兄 弟 说 了 一 个 类 似 的 故 事 。
	AI_Output(self, other, "DIA_Egill_STREIT2_08_01"); //（ 狡 诈 的 ） 啊 哈 。 他 到 底 怎 么 说 的 ？
	AI_Output(other, self, "DIA_Egill_STREIT2_15_02"); //他 说 他 已 经 杀 了 大 量 的 旷 野 袭 击 者 。
	AI_Output(self, other, "DIA_Egill_STREIT2_08_03"); //什 么 ？ 如 果 那 个 废 物 是 自 己 一 个 人 的 话 ， 他 甚 至 连 家 都 找 不 到 。
	AI_Output(self, other, "DIA_Egill_STREIT2_08_04"); //告 诉 他 ， 他 不 应 该 那 么 吹 牛 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Streit4
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_STREIT4(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 7;
	condition		= DIA_Egill_STREIT4_Condition;
	information		= DIA_Egill_STREIT4_Info;
	description		= "艾 尼 姆 有 点 被 这 件 事 激 怒 了 。";
};

func int DIA_Egill_STREIT4_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Ehnim_STREIT3))
	&&
	(
	(Hlp_IsValidNpc(Ehnim))
	&& (!C_NpcIsDown(Ehnim))
	)
	)
	{
		return TRUE;
	};
};

func void DIA_Egill_STREIT4_Info()
{
	AI_Output(other, self, "DIA_Egill_STREIT4_15_00"); //艾 尼 姆 有 点 被 这 件 事 激 怒 了 。
	AI_Output(self, other, "DIA_Egill_STREIT4_08_01"); //他 不 应 该 那 么 吹 嘘 自 己 ， 否 则 我 就 把 他 的 脑 袋 拧 下 来 。 就 那 么 告 诉 他。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info permKap1
///////////////////////////////////////////////////////////////////////
instance DIA_Egill_PERMKAP1(C_INFO)
{
	npc				= BAU_945_Egill;
	condition		= DIA_Egill_PERMKAP1_Condition;
	information		= DIA_Egill_PERMKAP1_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Egill_PERMKAP1_Condition()
{
	if (
	(DIA_Ehnim_STREIT5_noPerm == TRUE)
	&& (Npc_IsInState(self, ZS_Talk))
	)
	{
		return TRUE;
	};
};

func void DIA_Egill_PERMKAP1_Info()
{
	AI_Output(self, other, "DIA_Egill_PERMKAP1_08_00"); //你 造 成 的 破 坏 已 经 够 了 吗 ？ 我 觉 得 你 现 在 应 该 走 了 。

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Egill_PICKPOCKET(C_INFO)
{
	npc				= BAU_945_Egill;
	nr				= 900;
	condition		= DIA_Egill_PICKPOCKET_Condition;
	information		= DIA_Egill_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Egill_PICKPOCKET_Condition()
{
	C_Beklauen(45, 24);
};

func void DIA_Egill_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
	Info_AddChoice(DIA_Egill_PICKPOCKET, DIALOG_BACK, DIA_Egill_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Egill_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Egill_PICKPOCKET_DoIt);
};

func void DIA_Egill_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};

func void DIA_Egill_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Egill_PICKPOCKET);
};
