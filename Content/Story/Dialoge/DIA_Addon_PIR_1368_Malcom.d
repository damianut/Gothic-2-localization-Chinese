// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Malcom_EXIT(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 999;
	condition		= DIA_Addon_Malcom_EXIT_Condition;
	information		= DIA_Addon_Malcom_EXIT_Info;
	permanent		= TRUE;
	description		= "我 需 要 继 续 前 进 。( 结 束 )";
};

func int DIA_Addon_Malcom_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_EXIT_Info()
{
	AI_Output(other, self, "DIA_Addon_Malcom_perm_15_00"); //我 需 要 继 续 前 进 。

	if (MalcomBotschaft == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Malcom_perm_04_01"); //别 让 那 些 野 兽 把 你 吃 掉 了 。 这 是 个 非 常 危 险 的 地 方 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Malcom_Add_04_03"); //嘿 ！ 当 你 到 我 们 的 营 地 的 时 候 ， 给 亨 利 传 达 一 个 我 们 的 消 息 。
		AI_Output(self, other, "DIA_Addon_Malcom_Lager_04_04"); //这 附 近 的 树 木 太 难 处 理 了 。
		AI_Output(self, other, "DIA_Addon_Malcom_Lager_04_05"); //他 想 要 的 木 头 只 能 让 他 多 等 一 会 了 。 就 那 么 告 诉 他 。
		MalcomBotschaft = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Malcom_PICKPOCKET(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 900;
	condition		= DIA_Addon_Malcom_PICKPOCKET_Condition;
	information		= DIA_Addon_Malcom_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Malcom_PICKPOCKET_Condition()
{
	C_Beklauen(20, 30);
};

func void DIA_Addon_Malcom_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET, DIALOG_BACK, DIA_Addon_Malcom_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Malcom_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Malcom_PICKPOCKET_DoIt);
};

func void DIA_Addon_Malcom_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

func void DIA_Addon_Malcom_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Malcom_PICKPOCKET);
};

// ************************************************************
//								Hello
// ************************************************************
instance DIA_Addon_Malcom_Hello(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 1;
	condition		= DIA_Addon_Malcom_Hello_Condition;
	information		= DIA_Addon_Malcom_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Malcom_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Malcom_Hello_04_01"); //你 不 是 从 附 近 来 的 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Malcom_Hello_04_02"); //你 看 起 来 走 了 很 远 的 路 。
};

// ************************************************************
//					Hallo 2 (Was machst du?)
// ************************************************************
instance DIA_Addon_Malcom_WasMachen(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 2;
	condition		= DIA_Addon_Malcom_WasMachen_Condition;
	information		= DIA_Addon_Malcom_WasMachen_Info;
	description		= "忙 吗 ？";
};

func int DIA_Addon_Malcom_WasMachen_Condition()
{
	return TRUE;
};

func void DIA_Addon_Malcom_WasMachen_Info()
{
	AI_Output(other, self, "DIA_Addon_Malcom_WasMachen_15_00"); //忙 吗 ？
	AI_Output(self, other, "DIA_Addon_Malcom_WasMachen_04_01"); //不 用 问 。 亨 利 让 我 把 这 里 的 这 些 树 木 都 砍 倒 。
	if (Henry.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Malcom_WasMachen_15_02"); //亨 利 ？
		AI_Output(self, other, "DIA_Addon_Malcom_Add_04_00"); //他 是 我 们 部 队 的 首 领 。
	};

	AI_Output(self, other, "DIA_Addon_Malcom_WasMachen_04_04"); //他 总 是 站 在 营 地 的 入 口 那 里 说 大 话 。
	AI_Output(self, other, "DIA_Addon_Malcom_WasMachen_04_05"); //越 为 社 团 服 务 ， 就 越 是 做 些 没 用 的 事 。
	AI_Output(self, other, "DIA_Addon_Malcom_WasMachen_04_06"); //但 是 他 不 会 自 己 动 动 一 根 手 指 。
};

// ************************************************************
// 					Holz - Nachricht für Henry
// ************************************************************
instance DIA_Addon_Malcom_Entertrupp(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 5;
	condition		= DIA_Addon_Malcom_Entertrupp_Condition;
	information		= DIA_Addon_Malcom_Entertrupp_Info;
	description		= "亨 利 是 你 的 领 导 者 ？";
};

func int DIA_Addon_Malcom_Entertrupp_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Entertrupp_Info()
{
	AI_Output(other, self, "DIA_Addon_Malcom_Entertrupp_15_00"); //亨 利 是 你 的 领 导 者 ？
	AI_Output(self, other, "DIA_Addon_Malcom_WasMachen_04_03"); //是 的 ， 我 们 的 袭 击 部 队 的 首 领 。
	AI_Output(self, other, "DIA_Addon_Malcom_Add_04_01"); //我 们 的 船 长 是 格 雷 格 。
	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Malcom_Add_04_02"); //但 是 现 在 他 不 在 这 里 。
	};
};

// ************************************************************
// 						Wo ist Lager
// ************************************************************
instance DIA_Addon_Malcom_Lager(C_INFO)
{
	npc				= PIR_1368_Addon_Malcom;
	nr				= 3;
	condition		= DIA_Addon_Malcom_Lager_Condition;
	information		= DIA_Addon_Malcom_Lager_Info;
	description		= "你 的 营 地 在 哪 里 ？";
};

func int DIA_Addon_Malcom_Lager_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Malcom_WasMachen))
	{
		return TRUE;
	};
};

func void DIA_Addon_Malcom_Lager_Info()
{
	AI_Output(other, self, "DIA_Addon_Malcom_Lager_15_00"); //你 的 营 地 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Malcom_Lager_04_01"); //继 续 沿 着 这 条 路 向 西 走 。
	AI_Output(self, other, "DIA_Addon_Malcom_Lager_04_02"); //你 很 快 就 能 看 到 亨 利 站 在 那 里 。
};
