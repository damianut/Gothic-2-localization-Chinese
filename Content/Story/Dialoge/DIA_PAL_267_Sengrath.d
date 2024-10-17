// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Sengrath_EXIT(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 999;
	condition		= DIA_Sengrath_EXIT_Condition;
	information		= DIA_Sengrath_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Sengrath_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  			Hallo
// ************************************************************
instance DIA_Sengrath_Hello(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 2;
	condition		= DIA_Sengrath_Hello_Condition;
	information		= DIA_Sengrath_Hello_Info;
	important		= TRUE;
};

func int DIA_Sengrath_Hello_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Hello_Info()
{
	AI_Output(self, other, "DIA_Sengrath_Hello_03_00"); //我 就 知 道 ！ 我 就 知 道 有 人 会 成 功 ！
	AI_Output(self, other, "DIA_Sengrath_Hello_03_01"); //你 是 从 关 卡 过 来 的 ？ 那 么 ， 我 们 的 信 使 已 经 想 法 子 通 过 了 ？
	AI_Output(other, self, "DIA_Sengrath_Hello_15_02"); //不 ， 你 的 信 使 没 有 成 功 通 过 关 卡 。 我 是 奉 哈 根 勋 爵 的 命 令 而 来 。
	AI_Output(self, other, "DIA_Sengrath_Hello_03_03"); //（ 咆 哮 ） 可 恶 的 兽 人 … …
	AI_Output(self, other, "DIA_Sengrath_Hello_03_04"); //好 吧 ， 加 隆 德 指 挥 官 一 定 想 跟 你 谈 谈 。 你 可 以 在 那 两 个 骑 士 守 卫 的 那 座 大 楼 找 到 他 。
};

// ************************************************************
// 			  	Equipment
// ************************************************************
instance DIA_Sengrath_Equipment(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 2;
	condition		= DIA_Sengrath_Equipment_Condition;
	information		= DIA_Sengrath_Equipment_Info;
	description		= "我 在 这 里 能 从 哪 里 获 得 工 具 ？";
};

func int DIA_Sengrath_Equipment_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Equipment_Info()
{
	AI_Output(other, self, "DIA_Sengrath_Equipment_15_00"); //我 在 这 里 能 从 哪 里 获 得 工 具 ？
	AI_Output(self, other, "DIA_Sengrath_Equipment_03_01"); //坦 多 分 发 武 器 。 总 管 恩 高 尔 负 责 其 它 的 一 切 。
	AI_Output(other, self, "DIA_Sengrath_Equipment_15_02"); //那 魔 法 供 应 怎 么 办 ？
	AI_Output(self, other, "DIA_Sengrath_Equipment_03_03"); //我 们 都 配 备 了 魔 法 卷 轴 。 如 果 你 想 要 一 些 ， 跟 我 说 。

	Log_CreateTopic(TOPIC_Trader_OC, LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, TOPIC_Trader_OC_6);
};

// ************************************************************
// 			  	Lehrer
// ************************************************************
instance DIA_Sengrath_Perm(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 2;
	condition		= DIA_Sengrath_Perm_Condition;
	information		= DIA_Sengrath_Perm_Info;
	description		= "这 里 有 人 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Sengrath_Perm_Condition()
{
	return TRUE;
};

func void DIA_Sengrath_Perm_Info()
{
	AI_Output(other, self, "DIA_Sengrath_Perm_15_00"); //这 里 有 人 能 教 我 一 些 东 西 吗 ？

	if ((other.guild == GIL_KDF)
	&& (Kapitel == 2))
	{
		AI_Output(self, other, "DIA_Sengrath_Perm_03_01"); //去 跟 米 尔 腾 谈 谈 - 他 是 这 里 唯 一 的 魔 法 师 。
	}
	else
	{
		AI_Output(self, other, "DIA_Sengrath_Perm_03_02"); //问 问 凯 柔 洛 斯 。 他 训 练 小 伙 子 们 剑 术 搏 击 。 也 许 他 也 能 教 你 些 东 西 。

		Log_CreateTopic(TOPIC_Teacher_OC, LOG_NOTE);
		B_LogEntry(TOPIC_Teacher_OC, TOPIC_Teacher_OC_6);
	};
};

// ************************************************************
// 			Scrolls
// ************************************************************
instance DIA_Sengrath_Scrolls(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 9;
	condition		= DIA_Sengrath_Scrolls_Condition;
	information		= DIA_Sengrath_Scrolls_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 魔 法 卷 轴 。";
};

func int DIA_Sengrath_Scrolls_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Sengrath_Equipment))
	{
		return TRUE;
	};
};

func void DIA_Sengrath_Scrolls_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Sengrath_Scrolls_15_00"); //让 我 看 看 你 的 魔 法 卷 轴 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Sengrath_PICKPOCKET(C_INFO)
{
	npc				= PAL_267_Sengrath;
	nr				= 900;
	condition		= DIA_Sengrath_PICKPOCKET_Condition;
	information		= DIA_Sengrath_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Sengrath_PICKPOCKET_Condition()
{
	C_Beklauen(32, 35);
};

func void DIA_Sengrath_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET, DIALOG_BACK, DIA_Sengrath_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sengrath_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Sengrath_PICKPOCKET_DoIt);
};

func void DIA_Sengrath_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};

func void DIA_Sengrath_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sengrath_PICKPOCKET);
};
