// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Rupert_EXIT(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 999;
	condition		= DIA_Rupert_EXIT_Condition;
	information		= DIA_Rupert_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rupert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rupert_PICKPOCKET(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 900;
	condition		= DIA_Rupert_PICKPOCKET_Condition;
	information		= DIA_Rupert_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen(18, 10);
};

func void DIA_Rupert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
	Info_AddChoice(DIA_Rupert_PICKPOCKET, DIALOG_BACK, DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Rupert_Hello(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_Hello_Condition;
	information		= DIA_Rupert_Hello_Info;
	important		= TRUE;
};

func int DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Hello_Info()
{
	AI_Output(self, other, "DIA_Rupert_Hello_03_00"); //你 好 ， 陌 生 人 ！
	AI_Output(self, other, "DIA_Rupert_Hello_03_01"); //你 一 定 已 经 饿 了 也 渴 了 - 也 许 我 的 东 西 会 让 你 感 兴 趣 ？
};

// ************************************************************
// 			  				 Zu Pal
// ************************************************************
instance DIA_Rupert_ZuPal(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_ZuPal_Condition;
	information		= DIA_Rupert_ZuPal_Info;
	description		= "我 实 际 上 正 要 去 找 圣 骑 士 … …";
};

func int DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

func void DIA_Rupert_ZuPal_Info()
{
	AI_Output(other, self, "DIA_Rupert_ZuPal_15_00"); //我 实 际 上 正 要 去 找 圣 骑 士 … …
	AI_Output(self, other, "DIA_Rupert_ZuPal_03_01"); //那 样 的 可 能 性 很 小 。 因 为 那 些 圣 骑 士 把 城 里 富 人 区 那 头 当 作 了 自 己 的 家 ， 几 乎 没 有 人 能 再 进 那 里 了 。
};

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
instance DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_HelpMeIntoOV_Condition;
	information		= DIA_Rupert_HelpMeIntoOV_Info;
	description		= "你 能 帮 我 进 入 富 人 区 吗 ？";
};

func int DIA_Rupert_HelpMeIntoOV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_HelpMeIntoOV_Info()
{
	AI_Output(other, self, "DIA_Rupert_HelpMeIntoOV_15_00"); //你 能 帮 我 进 入 富 人 区 吗 ？
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_01"); //我 ？ 不 ， 我 自 己 在 这 里 也 没 有 什 么 发 言 权 ！
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_02"); //在 城 市 贫 民 区 这 里 ， 只 有 几 个 人 有 足 够 的 影 响 力 能 让 你 通 过 守 卫 。
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_03"); //麦 迪 欧 ， 我 的 老 板 ， 是 他 们 中 的 一 个 。 也 许 你 应 该 跟 他 谈 谈 。

	Log_CreateTopic(TOPIC_OV, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV, LOG_RUNNING);
	B_LogEntry(TOPIC_OV, TOPIC_OV_1);
	Log_AddEntry(TOPIC_OV, TOPIC_OV_2);
};

// ***************************************************************
//							WoMatteo
// ***************************************************************
instance DIA_Rupert_WoMatteo(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_WoMatteo_Condition;
	information		= DIA_Rupert_WoMatteo_Info;
	description		= "我 在 哪 里 能 找 到 麦 迪 欧 ？";
};

func int DIA_Rupert_WoMatteo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WoMatteo_Info()
{
	AI_Output(other, self, "DIA_Rupert_WoMatteo_15_00"); //我 在 哪 里 能 找 到 麦 迪 欧 ？
	AI_Output(self, other, "DIA_Rupert_WoMatteo_03_01"); //你 正 站 在 他 的 商 店 外 面 。 进 去 吧 。 他 几 乎 总 是 在 那 里 。

	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_8);
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einfluß
// ***************************************************************
instance DIA_Rupert_WerEinfluss(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 2;
	condition		= DIA_Rupert_WerEinfluss_Condition;
	information		= DIA_Rupert_WerEinfluss_Info;
	description		= "那 么 其 它 那 些 有 势 力 的 市 民 呢 ？";
};

func int DIA_Rupert_WerEinfluss_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WerEinfluss_Info()
{
	AI_Output(other, self, "DIA_Rupert_WerEinfluss_15_00"); //那 么 其 它 那 些 有 势 力 的 市 民 呢 ？
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_01"); //在 主 街 道 上 的 这 些 商 人 和 工 匠 大 师 是 这 个 城 里 最 重 要 的 人 物 。
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_02"); //你 应 该 试 试 让 他 们 其 中 一 个 人 接 纳 你 成 为 学 徒 - 就 像 我 这 样 。
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_03"); //自 从 我 开 始 为 麦 迪 欧 工 作 ， 城 里 的 人 对 待 我 很 尊 敬 ！

	B_LogEntry(TOPIC_OV, TOPIC_OV_3);
};

// ***************************************************************
//							Work
// ***************************************************************
instance DIA_Rupert_Work(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 3;
	condition		= DIA_Rupert_Work_Condition;
	information		= DIA_Rupert_Work_Info;
	description		= "我 需 要 一 些 钱 ， 我 还 在 找 工 作 。";
};

func int DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rupert_Work_Info()
{
	AI_Output(other, self, "DIA_Rupert_Work_15_00"); //我 需 要 一 些 钱 ， 我 还 在 找 工 作 。
	AI_Output(self, other, "DIA_Rupert_Work_03_01"); //我 听 说 伯 斯 波 和 他 的 供 货 商 之 间 有 问 题 了 。 他 的 商 店 就 在 那 边 。
	AI_Output(self, other, "DIA_Rupert_Work_03_02"); //他 们 说 他 付 的 薪 水 很 高 。
};

// ***************************************************************
//							YourOffer
// ***************************************************************
instance DIA_Rupert_YourOffer(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_YourOffer_Condition;
	information		= DIA_Rupert_YourOffer_Info;
	description		= "你 可 以 给 我 提 供 一 些 什 么 ？";
};

func int DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};

func void DIA_Rupert_YourOffer_Info()
{
	AI_Output(other, self, "DIA_Rupert_YourOffer_15_00"); //你 供 应 什 么 ？
	AI_Output(self, other, "DIA_Rupert_YourOffer_03_01"); //现 在 ， 我 没 有 多 少 选 择 。
	if ((hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		AI_Output(self, other, "DIA_Rupert_YourOffer_03_02"); //那 个 该 死 的 地 主 再 也 不 送 货 了 ， 而 我 们 从 这 些 小 农 场 里 得 到 的 供 应 不 能 满 足 城 里 的 需 求 。
	};
};

// ************************************************************
//								Trade
// ************************************************************
instance DIA_Rupert_Trade(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 900;
	condition		= DIA_Rupert_Trade_Condition;
	information		= DIA_Rupert_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_YourOffer))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Trade_Info()
{
	if (Npc_HasItems(self, itfo_cheese) < 5)
	{
		CreateInvItems(self, ItFo_cheese, 5);
	};

	AI_Output(other, self, "DIA_Rupert_Trade_15_00"); //让 我 看 看 你 的 货 物 。
	if ((hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Rupert_Trade_03_01"); //我 必 须 请 你 原 谅 我 那 可 怜 的 选 择 。 像 你 这 样 地 位 的 人 当 然 要 用 更 好 的 。
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
instance DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_Bauernaufstand_Condition;
	information		= DIA_Rupert_Bauernaufstand_Info;
	description		= "再 告 诉 我 一 些 和 农 民 叛 乱 有 关 的 事 。";
};

func int DIA_Rupert_Bauernaufstand_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Bauernaufstand_Info()
{
	AI_Output(other, self, "DIA_Rupert_Bauernaufstand_15_00"); //再 告 诉 我 一 些 和 农 民 叛 乱 有 关 的 事 。
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_01"); //这 非 常 简 单 ： 地 主 欧 纳 尔 不 会 再 给 这 个 城 市 交 纳 税 金 了 。
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_02"); //想 想 看 ！ 我 们 在 跟 兽 人 打 仗 ， 而 那 个 肥 胖 的 懒 汉 想 把 所 有 的 东 西 都 留 给 自 己 ！
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_03"); //通 常 ， 城 市 卫 兵 会 在 这 种 情 况 下 会 采 用 更 加 严 格 的 措 施 。
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_04"); //但 现 在 最 精 彩 的 部 分 出 现 了 ： 他 们 说 欧 纳 尔 聘 请 了 雇 佣 兵 让 城 里 的 军 队 无 法 靠 近 他 ！
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_05"); //雇 佣 兵 ！ 一 切 都 会 在 一 场 该 死 的 战 争 中 结 束 ！ 好 像 一 场 战 争 还 不 够...
};

// ***************************************************************
//							Söldner
// ***************************************************************
instance DIA_Rupert_Mercs(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_Mercs_Condition;
	information		= DIA_Rupert_Mercs_Info;
	description		= "关 于 欧 纳 尔 的 雇 佣 兵 你 知 道 些 什 么 ？";
};

func int DIA_Rupert_Mercs_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Mercs_Info()
{
	AI_Output(other, self, "DIA_Rupert_Mercs_15_00"); //关 于 欧 纳 尔 的 雇 佣 兵 你 知 道 些 什 么 ？
	AI_Output(self, other, "DIA_Rupert_Mercs_03_01"); //我 听 说 他 们 大 部 分 都 是 以 前 在 矿 坑 流 放 地 的 罪 犯 。
	AI_Output(self, other, "DIA_Rupert_Mercs_03_02"); //而 他 们 的 首 领 被 认 为 曾 经 是 国 王 身 边 的 一 个 大 人 物 - 一 个 将 军 或 者 什 么 - 他 们 把 他 作 为 叛 国 者 关 了 起 来 ？！
	AI_Output(self, other, "DIA_Rupert_Mercs_03_03"); //这 个 世 道 太 可 怕 了 ！
};
