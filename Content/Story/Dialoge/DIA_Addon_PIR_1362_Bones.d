// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Bones_EXIT(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 999;
	condition		= DIA_Addon_Bones_EXIT_Condition;
	information		= DIA_Addon_Bones_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Bones_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Bones_PICKPOCKET(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 900;
	condition		= DIA_Addon_Bones_PICKPOCKET_Condition;
	information		= DIA_Addon_Bones_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Addon_Bones_PICKPOCKET_Condition()
{
	C_Beklauen(75, 104);
};

func void DIA_Addon_Bones_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET, DIALOG_BACK, DIA_Addon_Bones_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Bones_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Bones_PICKPOCKET_DoIt);
};

func void DIA_Addon_Bones_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

func void DIA_Addon_Bones_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Bones_PICKPOCKET);
};

// ************************************************************
// 	 				  	NICHT Anheuern
// ************************************************************
func void B_Addon_Bones_KeineZeit()
{
	AI_Output(self, other, "DIA_Addon_Bones_Train_01_01"); //我 很 抱 歉 。 我 现 在 没 时 间 。
	AI_Output(self, other, "DIA_Addon_Bones_Train_01_02"); //我 还 要 继 续 训 练 。
};

// -------------------------------------------------------------
instance DIA_Addon_Bones_Anheuern(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 1;
	condition		= DIA_Addon_Bones_Anheuern_Condition;
	information		= DIA_Addon_Bones_Anheuern_Info;
	description		= "峡 谷 在 前 面 。";
};

func int DIA_Addon_Bones_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_Anheuern_15_01"); //峡 谷 在 前 面 。
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Addon_Bones_Hello(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 5;
	condition		= DIA_Addon_Bones_Hello_Condition;
	information		= DIA_Addon_Bones_Hello_Info;
	description		= "情 况 怎 么 样 了 ？";
};

func int DIA_Addon_Bones_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Bones_Hello_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_Hello_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Addon_Bones_Hello_01_01"); //我 不 会 抱 怨 。 这 样 是 有 点 无 聊 ， 不 过 至 少 我 不 用 工 作 。
	AI_Output(self, other, "DIA_Addon_Bones_Work_01_01"); //我 正 准 备 做 格 雷 格 给 我 的 下 一 个 任 务 。
	AI_Output(other, self, "DIA_Addon_Bones_Work_15_02"); //什 么 任 务 ？
	AI_Output(self, other, "DIA_Addon_Bones_Work_01_03"); //我 不 能 说 。
	AI_Output(self, other, "DIA_Addon_Bones_Work_01_04"); //无 意 冒 犯 ， 小 子 。 不 过 我 为 这 种 特 权 付 出 了 很 大 的 努 力 ， 而 我 不 想 再 失 去 它 。

	Npc_ExchangeRoutine(self, "START");
};

// ************************************************************
// 			  			Kannst du mir was beibringen?
// ************************************************************
instance DIA_Addon_Bones_Train(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 5;
	condition		= DIA_Addon_Bones_Train_Condition;
	information		= DIA_Addon_Bones_Train_Info;
	description		= "你 能 教 我 什 么 吗 ？";
};

func int DIA_Addon_Bones_Train_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bones_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Train_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_Train_15_00"); //你 能 教 我 什 么 吗 ？
	B_Addon_Bones_KeineZeit();
};

// ************************************************************
// 			  			Wo finde ich Lehrer
// ************************************************************
instance DIA_Addon_Bones_Teacher(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 5;
	condition		= DIA_Addon_Bones_Teacher_Condition;
	information		= DIA_Addon_Bones_Teacher_Info;
	description		= "这 附 近 的 人 能 教 我 什 么 东 西 吗 ？";
};

func int DIA_Addon_Bones_Teacher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bones_Train) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_Teacher_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_Teacher_15_00"); //这 附 近 的 人 能 教 我 什 么 东 西 吗 ？
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_04"); //亨 利 和 摩 根 率 领 我 们 的 袭 击 部 队 。
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_05"); //他 们 可 以 教 你 如 何 成 为 更 好 的 战 士 。
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_07"); //亨 利 的 人 都 使 用 双 手 武 器 。
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_08"); //摩 根 喜 欢 更 加 快 速 的 单 手 武 器 。
	AI_Output(other, self, "DIA_Addon_Bones_Teacher_15_09"); //还 有 谁 ？
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_10"); //我 不 知 道 ， 我 从 来 没 对 其 它 任 何 事 情 有 过 兴 趣 。
	AI_Output(self, other, "DIA_Addon_Bones_Teacher_01_11"); //但 是 我 肯 定 鳄 鱼 杰 克 或 者 塞 缪 尔 还 能 教 你 几 招 。
	Knows_HenrysEntertrupp = TRUE;

	Log_CreateTopic(Topic_Addon_PIR_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Teacher, Log_Text_Addon_HenryTeach);
	Log_AddEntry(Topic_Addon_PIR_Teacher, Log_Text_Addon_MorganTeach);
};

// ************************************************************
// 			  			Was weißt du über Francis?
// ************************************************************
instance DIA_Addon_Bones_Francis(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 3;
	condition		= DIA_Addon_Bones_Francis_Condition;
	information		= DIA_Addon_Bones_Francis_Info;
	description		= "你 能 告 诉 我 一 些 关 于 弗 朗 西 斯 的 事 吗 ？";
};

func int DIA_Addon_Bones_Francis_Condition()
{
	if (Francis_ausgeschissen == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
		|| (Francis.aivar[AIV_TalkedToPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_Bones_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_Francis_15_00"); //你 能 告 诉 我 一 些 关 于 弗 朗 西 斯 的 事 吗 ？
	AI_Output(self, other, "DIA_Addon_Bones_Francis_01_03"); //看 看 你 周 围 。 唯 一 在 工 作 的 人 就 是 亨 利 和 他 的 伙 计 们 。
	AI_Output(self, other, "DIA_Addon_Bones_Francis_01_04"); //摩 根 整 天 都 躺 在 床 上 ， 或 者 狂 饮 烈 性 酒 。
	AI_Output(self, other, "DIA_Addon_Bones_Francis_01_05"); //不 要 对 格 雷 格 说 这 样 的 话 。 如 果 你 不 听 从 命 令 ， 他 就 教 训 你 ， 就 是 那 样 ！
};

//*********************************************************
//	BDT Armor
//*********************************************************
instance DIA_Addon_Bones_WantArmor(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 2;
	condition		= DIA_Addon_Bones_WantArmor_Condition;
	information		= DIA_Addon_Bones_WantArmor_Info;
	permanent		= TRUE;
	description		= "把 那 套 强 盗 盔 甲 给 我 。";
};

func int DIA_Addon_Bones_WantArmor_Condition()
{
	if ((Greg_GaveArmorToBones == TRUE)
	&& (MIS_Greg_ScoutBandits == 0))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_WantArmor_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_WantArmor_15_00"); //把 那 套 强 盗 盔 甲 给 我 。
	AI_Output(self, other, "DIA_Addon_Bones_WantArmor_01_01"); //我 不 会 那 么 疯 狂 。 格 雷 格 会 砍 掉 我 的 头 。
	AI_Output(self, other, "DIA_Addon_Bones_WantArmor_01_02"); //他 明 白 地 说 过 ， 除 了 他 下 命 令 ， 否 则 不 许 任 何 人 动 那 套 盔 甲 。
	if (GregIsBack == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Bones_WantArmor_01_03"); //我 不 能 把 它 给 你 。 尤 其 在 他 已 经 回 来 的 时 候 。
	};

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_6);
};

//*********************************************************
//	Du sollst mir die Rüstung geben.
//*********************************************************
instance DIA_Addon_Bones_GiveArmor(C_INFO)
{
	npc				= PIR_1362_Addon_Bones;
	nr				= 2;
	condition		= DIA_Addon_Bones_GiveArmor_Condition;
	information		= DIA_Addon_Bones_GiveArmor_Info;
	description		= "你 应 该 把 强 盗 盔 甲 给 我 。 这 是 格 雷 格 的 命 令 。";
};

func int DIA_Addon_Bones_GiveArmor_Condition()
{
	if (MIS_Greg_ScoutBandits == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bones_GiveArmor_Info()
{
	AI_Output(other, self, "DIA_Addon_Bones_GiveArmor_15_00"); //你 应 该 把 强 盗 盔 甲 给 我 。 这 是 格 雷 格 的 命 令 。
	AI_Output(self, other, "DIA_Addon_Bones_GiveArmor_01_01"); //从 格 雷 格 那 里 ？ 哟 ，我 还 觉 得 我 必 须 得 去 。
	AI_Output(self, other, "DIA_Addon_Bones_GiveArmor_01_02"); //这 个 侦 察 强 盗 营 地 的 工 作 完 全 是 个 自 杀 任 务 。
	AI_Output(self, other, "DIA_Addon_Bones_GiveArmor_01_03"); //我 宁 愿 格 雷 格 把 他 的 日 常 工 作 都 堆 在 我 身 上 ， 我 也 不 愿 意 让 自 己 被 那 些 强 盗 杀 死 。
	AI_Output(other, self, "DIA_Addon_Bones_GiveArmor_15_04"); //（ 恼 怒 的 ） 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Bones_GiveArmor_01_05"); //哦 对 ， 是 的 ， 给 。
	B_GiveInvItems(self, other, ItAr_BDT_M, 1);
	AI_Output(self, other, "DIA_Addon_Bones_GiveArmor_01_06"); //要 小 心 。 那 些 强 盗 们 坏 透 了 。
	self.flags = 0;
	PIR_1320_Addon_Greg.flags = 0;

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_7);

	B_GivePlayerXP(XP_Bones_GetBDTArmor);
};
