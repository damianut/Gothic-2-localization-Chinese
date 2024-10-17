///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADW_EXIT(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 999;
	condition		= DIA_Addon_Cronos_ADW_EXIT_Condition;
	information		= DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Cronos_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 900;
	condition		= DIA_Addon_Cronos_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Cronos_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Karte zu stehlen)";
};

func int DIA_Addon_Cronos_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Cronos_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItWr_Map_AddonWorld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADWHello(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 1;
	condition		= DIA_Addon_Cronos_ADWHello_Condition;
	information		= DIA_Addon_Cronos_ADWHello_Info;
	important		= TRUE;
};

func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_00"); //很 高 兴 见 到 你 ， 我 们 担 心 最 糟 的 情 况 。
	AI_Output(other, self, "DIA_Addon_Cronos_ADWHello_15_01"); //还 没 有 那 么 糟 糕 。 进 行 的 怎 么 样 ？
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_02"); //这 是 一 个 非 常 危 险 的 区 域 。
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_03"); //这 里 有 些 动 物 是 我 们 任 何 人 以 前 都 没 见 过 的 。
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_04"); //附 近 有 一 个 巨 大 的 沼 泽 ， 几 百 年 来 一 直 没 有 人 注 意 到 过 。
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_05"); //一 天 过 去 了 ， 我 们 还 没 遭 到 沼 泽 野 兽 的 袭 击 。
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_06"); //我 建 议 你 在 这 里 散 步 的 时 候 要 小 心 一 点 。
};

///////////////////////////////////////////////////////////////////////
//	Info WaechterADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WaechterADW(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_WaechterADW_Condition;
	information		= DIA_Addon_Cronos_WaechterADW_Info;
	description		= "关 于 那 些 石 头 哨 兵 有 什 么 新 的 消 息 吗 ？";
};

func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other, self, "DIA_Addon_Cronos_WaechterADW_15_00"); //关 于 那 些 石 头 哨 兵 有 什 么 新 的 消 息 吗 ？
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_01"); //我 们 已 经 准 备 消 灭 它 们 中 的 一 部 分 。
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_02"); //它 们 站 在 那 里 ， 像 个 盐 柱 一 样 ， 一 动 不 动 。
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_03"); //不 过 那 只 是 表 面 的 假 像 。 如 果 你 靠 得 太 近 的 话 ， 它 们 就 会 攻 击 你 ！
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_04"); //毫 无 疑 问 ， 他 们 的 能 量 来 源 就 在 这 里 的 某 个 地 方 。
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADW_Trade(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 99;
	condition		= DIA_Addon_Cronos_ADW_Trade_Condition;
	information		= DIA_Addon_Cronos_ADW_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 们 开 始 交 易 吧 。";
};

func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};

var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other, self, "$TRADE_1");
};
