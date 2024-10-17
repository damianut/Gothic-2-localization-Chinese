///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_EXIT(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 999;
	condition		= DIA_Parlaf_EXIT_Condition;
	information		= DIA_Parlaf_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Parlaf_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HALLO(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 1;
	condition		= DIA_Parlaf_HALLO_Condition;
	information		= DIA_Parlaf_HALLO_Info;
	description		= "嘿 ， 你 好 吗 ？";
};

func int DIA_Parlaf_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Parlaf_HALLO_Info()
{
	AI_Output(other, self, "DIA_Parlaf_HALLO_15_00"); //嘿 ， 你 好 吗 ？
	AI_Output(self, other, "DIA_Parlaf_HALLO_03_01"); //你 认 为 我 是 怎 么 干 活 的 ？ 我 整 天 都 在 磨 刀 石 旁 边 磨 这 些 刀 片 。
	if ((Npc_IsDead(Engor)) == FALSE)
	{
		AI_Output(self, other, "DIA_Parlaf_HALLO_03_02"); //而 且 昨 天 恩 高 尔 又 减 少 了 我 们 的 供 给 。 如 果 还 是 这 样 下 去 ， 我 们 都 会 饿 死 。
		AI_Output(self, other, "DIA_Parlaf_HALLO_03_03"); //或 者 我 们 都 会 被 兽 人 杀 掉 。 前 景 一 点 都 不 乐 观 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info ENGOR
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_ENGOR(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 2;
	condition		= DIA_Parlaf_ENGOR_Condition;
	information		= DIA_Parlaf_ENGOR_Info;
	description		= "谁 是 恩 高 尔 ？";
};

func int DIA_Parlaf_ENGOR_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_ENGOR_Info()
{
	AI_Output(other, self, "DIA_Parlaf_ENGOR_15_00"); //谁 是 恩 高 尔 ？
	AI_Output(self, other, "DIA_Parlaf_ENGOR_03_01"); //恩 高 尔 管 理 供 应 物 资 ， 并 负 责 分 配 供 给 。 而 且 ， 每 个 星 期 它 们 都 会 更 少 一 些 。
	AI_Output(self, other, "DIA_Parlaf_ENGOR_03_02"); //当 然 ， 你 可 以 跟 他 交 易 ， 但 只 能 用 现 金 。
	AI_Output(other, self, "DIA_Parlaf_ENGOR_15_03"); //那 么 说 你 付 不 起 钱 ？
	AI_Output(self, other, "DIA_Parlaf_ENGOR_03_04"); //我 们 那 可 怜 的 薪 水 最 多 只 能 买 两 根 萝 卜 ！

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_4);
};

///////////////////////////////////////////////////////////////////////
//	Info Wo Engor
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_Wo(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 3;
	condition		= DIA_Parlaf_Wo_Condition;
	information		= DIA_Parlaf_Wo_Info;
	description		= "我 在 哪 里 能 找 到 这 个 恩 高 尔 ？";
};

func int DIA_Parlaf_Wo_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Parlaf_ENGOR)
	&& ((Npc_IsDead(Engor)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_Wo_Info()
{
	AI_Output(other, self, "DIA_Parlaf_Wo_15_00"); //我 在 哪 里 能 找 到 这 个 恩 高 尔 ？
	AI_Output(self, other, "DIA_Parlaf_Wo_03_01"); //在 那 些 骑 士 的 房 子 里 。 只 要 穿 过 铁 匠 铺 旁 边 那 条 敞 开 的 通 道 就 行 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info HUNGRIG
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_HUNGRIG(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 2;
	condition		= DIA_Parlaf_HUNGRIG_Condition;
	information		= DIA_Parlaf_HUNGRIG_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_Parlaf_HUNGRIG_Condition()
{
	if ((MIS_Engor_BringMeat != LOG_SUCCESS)
	&& Npc_KnowsInfo(hero, DIA_Parlaf_HALLO)
	&& ((Npc_IsDead(Engor)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Parlaf_HUNGRIG_Info()
{
	AI_Output(other, self, "DIA_Parlaf_HUNGRIG_15_00"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(self, other, "DIA_Parlaf_HUNGRIG_03_01"); //那 个 该 死 的 恩 高 尔 必 须 分 配 更 多 的 食 物 配 给 ！
};

///////////////////////////////////////////////////////////////////////
//	Info SATT
///////////////////////////////////////////////////////////////////////
instance DIA_Parlaf_SATT(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 3;
	condition		= DIA_Parlaf_SATT_Condition;
	information		= DIA_Parlaf_SATT_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 消 息 ？";
};

func int DIA_Parlaf_SATT_Condition()
{
	if (((MIS_Engor_BringMeat == LOG_SUCCESS) || (Npc_IsDead(Engor)))
	&& (Npc_KnowsInfo(hero, DIA_Parlaf_HALLO)))
	{
		return TRUE;
	};
};

var int DIA_Parlaf_SATT_OneTime;
func void DIA_Parlaf_SATT_Info()
{
	AI_Output(other, self, "DIA_Parlaf_SATT_15_00"); //有 什 么 新 鲜 事 吗 ？

	if ((DIA_Parlaf_SATT_OneTime == FALSE)
	&& ((Npc_IsDead(Engor)) == FALSE))
	{
		AI_Output(self, other, "DIA_Parlaf_SATT_03_01"); //恩 高 尔 在 分 发 新 的 肉 类 配 额 。 伙 计 ， 那 真 是 太 有 必 要 了 。
		DIA_Parlaf_SATT_OneTime = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Parlaf_SATT_03_02"); //你 的 到 来 是 唯 一 的 新 闻 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Parlaf_PICKPOCKET(C_INFO)
{
	npc				= VLK_4107_Parlaf;
	nr				= 900;
	condition		= DIA_Parlaf_PICKPOCKET_Condition;
	information		= DIA_Parlaf_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Parlaf_PICKPOCKET_Condition()
{
	C_Beklauen(34, 12);
};

func void DIA_Parlaf_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET, DIALOG_BACK, DIA_Parlaf_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Parlaf_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Parlaf_PICKPOCKET_DoIt);
};

func void DIA_Parlaf_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};

func void DIA_Parlaf_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Parlaf_PICKPOCKET);
};
