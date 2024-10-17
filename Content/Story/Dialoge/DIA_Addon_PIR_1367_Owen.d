// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Owen_EXIT(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 999;
	condition		= DIA_Addon_Owen_EXIT_Condition;
	information		= DIA_Addon_Owen_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Owen_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Owen_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Owen_PICKPOCKET(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 900;
	condition		= DIA_Addon_Owen_PICKPOCKET_Condition;
	information		= DIA_Addon_Owen_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Owen_PICKPOCKET_Condition()
{
	C_Beklauen(20, 30);
};

func void DIA_Addon_Owen_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET, DIALOG_BACK, DIA_Addon_Owen_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Owen_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Owen_PICKPOCKET_DoIt);
};

func void DIA_Addon_Owen_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

func void DIA_Addon_Owen_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Owen_PICKPOCKET);
};

// ************************************************************
// 			  				 Hallo
// ************************************************************
instance DIA_Addon_Owen_Hello(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 1;
	condition		= DIA_Addon_Owen_Hello_Condition;
	information		= DIA_Addon_Owen_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Owen_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_Hello_15_00"); //你 看 起 来 很 不 安 ？
	AI_Output(self, other, "DIA_Addon_Owen_Hello_13_01"); //你 是 谁 ？ 你 是 强 盗 吗 ？
	AI_Output(other, self, "DIA_Addon_Owen_Hello_15_02"); //我 看 起 来 像 吗 ？

	var C_Item itm; itm = Npc_GetEquippedArmor(other);

	if ((Hlp_IsItem(itm, ItAr_Pir_M_Addon) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_Pir_L_Addon) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_Pir_H_Addon) == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Owen_Hello_13_03"); //你 穿 着 我 们 的 衣 服 ， 但 是 我 不 认 识 你 。
	}
	else if ((Hlp_IsItem(itm, ItAr_BDT_M) == TRUE)
	|| (Hlp_IsItem(itm, ItAr_BDT_H) == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Owen_Hello_13_04"); //老 实 讲 ， 的 确 是 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Owen_Hello_13_05"); //不 。 从 你 的 衣 服 判 断 ， 你 走 了 很 远 的 路 。
	};
};

// ************************************************************
// 			  		 Hallo 2 (Was machst du?)
// ************************************************************
instance DIA_Addon_Owen_WasMachen(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 2;
	condition		= DIA_Addon_Owen_WasMachen_Condition;
	information		= DIA_Addon_Owen_WasMachen_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Owen_WasMachen_Condition()
{
	if (Malcom_Accident == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_WasMachen_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_WasMachen_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Owen_WasMachen_13_01"); //我 在 为 我 们 的 营 地 砍 木 头 。
	AI_Output(self, other, "DIA_Addon_Owen_WasMachen_13_02"); //我 在 那 里 拼 命 工 作 ， 几 乎 腰 都 快 断 了 ， 而 回 到 营 地 时 ， 他 们 却 都 在 晒 太 阳 。
};

// ************************************************************
//								PERM
// ************************************************************
instance DIA_Addon_Owen_Perm(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 99;
	condition		= DIA_Addon_Owen_Perm_Condition;
	information		= DIA_Addon_Owen_Perm_Info;
	permanent		= TRUE;
	description		= "然 后 ？";
};

func int DIA_Addon_Owen_Perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Owen_WasMachen))
	|| (Npc_KnowsInfo(other, DIA_Addon_Owen_MalcomStunt)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Perm_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_Perm_15_00"); //然 后 ？
	AI_Output(self, other, "DIA_Addon_Owen_Perm_13_01"); //如 果 我 能 早 些 知 道 会 是 这 样 的 情 况 ， 我 决 不 会 当 一 名 海 盗 。
};

// ************************************************************
// 						Henrys Holzlieferung
// ************************************************************
instance DIA_Addon_Owen_Henry(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 3;
	condition		= DIA_Addon_Owen_Henry_Condition;
	information		= DIA_Addon_Owen_Henry_Info;
	permanent		= TRUE;
	description		= "亨 利 还 在 等 那 些 修 建 栅 栏 所 需 的 木 材 。";
};

func int DIA_Addon_Owen_Henry_Condition()
{
	if ((MIS_Henry_HolOwen == LOG_RUNNING)
	&& (Owen_ComesToHenry == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_Henry_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_Henry_15_00"); //亨 利 还 在 等 那 些 修 建 栅 栏 所 需 的 木 材 。

	if (MIS_Owen_FindMalcom != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Owen_Henry_13_01"); //首 先 我 想 要 查 明 我 的 好 朋 友 玛 尔 寇 发 生 了 什 么 事 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Owen_Henry_13_02"); //嗯 ， 放 松 。 我 迟 早 会 把 那 该 死 的 木 头 给 他 送 去 。
		AI_Output(self, other, "DIA_Addon_Owen_Henry_13_03"); //去 告 诉 他 吧 。

		B_LogEntry(TOPIC_Addon_HolOwen, TOPIC_Addon_HolOwen_4);

		AI_StopProcessInfos(self);
		Owen_ComesToHenry = TRUE;
	};
};

// ************************************************************
// *** ***
// 							Malcom Accident
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 						Malcom im Loch
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomStunt(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 1;
	condition		= DIA_Addon_Owen_MalcomStunt_Condition;
	information		= DIA_Addon_Owen_MalcomStunt_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Addon_Owen_MalcomStunt_Condition()
{
	if (Malcom_Accident == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomStunt_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_MalcomStunt_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_01"); //我 的 好 朋 友 玛 尔 寇 已 经 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_02"); //一 只 丑 陋 的 潜 伏 者 攻 击 了 我 们 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_03"); //所 以 我 们 逃 到 了 这 个 山 洞 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_04"); //但 是 那 个 潜 伏 者 一 直 跟 着 我 们 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_05"); //玛 尔 寇 和 它 搏 斗 ， 然 后 它 们 一 起 掉 进 了 那 边 的 一 个 洞 里 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_06"); //似 乎 里 面 都 是 水 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_07"); //潜 伏 者 和 玛 尔 寇 在 下 面 又 打 了 一 会 ， 然 后 就 安 静 了 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomStunt_13_08"); //我 不 知 道 他 是 活 着 还 是 死 了 。

	Log_CreateTopic(TOPIC_Addon_MalcomsStunt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MalcomsStunt, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MalcomsStunt, TOPIC_Addon_MalcomsStunt_1);
	Log_AddEntry(TOPIC_Addon_MalcomsStunt, TOPIC_Addon_MalcomsStunt_2);

	MIS_Owen_FindMalcom = LOG_RUNNING;
};

// ------------------------------------------------------------
// 					Wie komme ich da runter?
// ------------------------------------------------------------
instance DIA_Addon_Owen_runter(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 2;
	condition		= DIA_Addon_Owen_runter_Condition;
	information		= DIA_Addon_Owen_runter_Info;
	description		= "我 怎 么 才 能 下 到 那 个 裂 缝 里 面 去 ？";
};

func int DIA_Addon_Owen_runter_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems(Malcom, ItWr_TwoHStonePlate3_Addon) > 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_runter_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_runter_15_00"); //我 怎 么 才 能 下 到 那 个 裂 缝 里 面 去 ？
	AI_Output(self, other, "DIA_Addon_Owen_runter_13_01"); //我 不 知 道 。 我 想 ， 你 可 以 爬 下 去 ， 或 者 跳 下 去 。
};

// ------------------------------------------------------------
// 						Malcom gefunden
// ------------------------------------------------------------
instance DIA_Addon_Owen_MalcomDead(C_INFO)
{
	npc				= PIR_1367_Addon_Owen;
	nr				= 3;
	condition		= DIA_Addon_Owen_MalcomDead_Condition;
	information		= DIA_Addon_Owen_MalcomDead_Info;
	description		= "你 的 朋 友 玛 尔 寇 已 经 死 了 。";
};

func int DIA_Addon_Owen_MalcomDead_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Owen_MalcomStunt))
	&& (MIS_Owen_FindMalcom == LOG_RUNNING)
	&& (Npc_HasItems(Malcom, ItWr_TwoHStonePlate3_Addon) == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Owen_MalcomDead_Info()
{
	AI_Output(other, self, "DIA_Addon_Owen_MalcomDead_15_00"); //你 的 朋 友 玛 尔 寇 已 经 死 了 。
	AI_Output(self, other, "DIA_Addon_Owen_MalcomDead_13_01"); //我 就 料 到 了 。 卑 鄙 的 野 兽 。 我 真 应 该 不 顾 一 切 去 帮 他 。
	if (SC_MadeStunt == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Owen_MalcomDead_13_02"); //你 真 的 很 勇 敢 ， 你 知 道 吗 ？
		AI_Output(self, other, "DIA_Addon_Owen_MalcomDead_13_03"); //我 不 敢 进 那 道 裂 缝 。
	};

	B_LogEntry(TOPIC_Addon_MalcomsStunt, TOPIC_Addon_MalcomsStunt_3);

	MIS_Owen_FindMalcom = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_Owen_MalcomDead);
};
