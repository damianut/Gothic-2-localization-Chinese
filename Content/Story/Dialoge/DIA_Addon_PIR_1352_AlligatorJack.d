// ************************************************************
// 			  				 Exit
// ************************************************************
instance DIA_Addon_AlligatorJack_Exit(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 999;
	condition		= DIA_Addon_AlligatorJack_Exit_Condition;
	information		= DIA_Addon_AlligatorJack_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};

var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;
func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if ((MIS_KrokoJagd == LOG_SUCCESS)
	&& (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Exit_12_00"); //如 果 你 想 找 我 的 话 ， 你 通 常 可 以 在 栅 栏 前 面 我 的 营 地 那 里 找 到 我 。

		if (PIR_1354_Addon_Henry.aivar [AIV_TalkedToPlayer] == FALSE)
		{
			AI_Output(other, self, "DIA_Addon_AlligatorJack_Exit_15_01"); //栅 栏 ？
			AI_Output(self, other, "DIA_Addon_AlligatorJack_Exit_12_02"); //从 这 里 向 西 走 ， 你 就 会 知 道 我 在 说 什 么 。
		};

		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "START");

		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_AlligatorJack_PICKPOCKET(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 900;
	condition		= DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information		= DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	C_Beklauen(100, 333);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_BACK, DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

// ************************************************************
// 			  		Hello
// ************************************************************
instance DIA_Addon_AlligatorJack_Hello(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Hello_Condition;
	information		= DIA_Addon_AlligatorJack_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Hello_12_00"); //你 究 竟 是 谁 ？ 你 看 起 来 和 其 它 人 不 一 样 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Hello_15_01"); //什 么 其 它 人 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Hello_12_02"); //嗯 ， 在 那 边 的 废 墟 里 游 荡 的 法 师 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Hello_12_03"); //那 你 是 和 他 们 一 伙 的 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Hello_12_04"); //独 自 一 人 在 附 近 走 动 ， 你 真 是 勇 敢 。
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WerBistDu(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information		= DIA_Addon_AlligatorJack_WerBistDu_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_WerBistDu_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_01"); //我 肯 定 你 以 前 就 听 说 过 我 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_02"); //（ 自 豪 的 ） 我 是 鳄 鱼 杰 克 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_03"); //整 个 地 区 最 令 人 敬 畏 ， 我 是 这 里 最 危 险 的 海 盗 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_04"); //我 同 船 长 格 雷 格 一 起 ， 登 上 的 商 船 不 计 其 数 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WerBistDu_12_05"); //你 现 在 正 看 着 一 个 活 生 生 的 传 奇 人 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info Vorschlag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Vorschlag(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Vorschlag_Condition;
	information		= DIA_Addon_AlligatorJack_Vorschlag_Info;
	description		= "你 知 道 一 个 叫 瑞 雯 的 家 伙 吗 ？";
};

func int DIA_Addon_AlligatorJack_Vorschlag_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Vorschlag_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Vorschlag_15_00"); //你 知 道 一 个 叫 瑞 雯 的 家 伙 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_01"); //当 然 。 至 少 他 是 强 盗 的 首 领 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_12_02"); //你 和 他 之 间 有 什 么 事 ？

	B_LogEntry(TOPIC_Addon_RavenKDW, TOPIC_Addon_RavenKDW_2);

	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag, "我 要 加 入 他 。", DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag, "我 准 备 要 杀 死 他 。", DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Besser_12_00"); //我 有 一 个 更 好 的 主 意 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Besser_12_01"); //来 加 入 我 们 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Besser_12_02"); //那 样 你 就 会 有 时 间 考 虑 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Besser_12_03"); //一 旦 你 试 过 了 我 们 出 色 的 家 酿 朗 姆 酒 ， 一 切 都 会 变 得 不 同 。
	Info_ClearChoices(DIA_Addon_AlligatorJack_Vorschlag);
};

func void DIA_Addon_AlligatorJack_Vorschlag_tot()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Vorschlag_tot_15_00"); //我 准 备 要 杀 死 他 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_01"); //（ 大 笑 ） 什 么 ？ 你 ？ 你 打 算 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_02"); //那 个 家 伙 不 是 离 开 你 们 的 组 织 了 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_03"); //你 甚 至 无 法 靠 近 他 。 他 周 围 的 强 盗 会 先 活 剥 了 你 的 皮 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_04"); //你 甚 至 无 法 通 过 他 们 的 第 一 个 岗 哨 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_tot_12_05"); //你 看 看 那 条 路 ， 那 些 强 盗 会 从 几 英 里 以 外 看 到 你 ， 并 向 你 伸 出 饥 渴 的 手 指 。

	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Vorschlag_join()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Vorschlag_join_15_00"); //我 要 加 入 他 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_01"); //（ 狡 诈 的 ） 是 那 样 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Vorschlag_join_12_02"); //不 过 你 看 起 来 不 像 是 想 要 加 入 那 些 疯 子 的 人 。

	B_AlligatorJack_Besser();
};

///////////////////////////////////////////////////////////////////////
//	Info BDTRuestung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_BDTRuestung(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information		= DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description		= "我 需 要 一 套 强 盗 盔 甲 。";
};

func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_Vorschlag))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_15_00"); //我 需 要 一 套 强 盗 盔 甲 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_01"); //你 要 怎 么 使 用 那 个 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_02"); //如 果 有 人 看 到 你 带 着 它 的 话 ， 只 会 让 你 惹 上 一 身 麻 烦 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_03"); //每 个 人 都 会 认 为 你 是 个 强 盗 ， 并 试 着 杀 掉 你 。
	// AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_04"); // Außer den Banditen SELBST vielleicht.
	// AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_12_05"); // Die werden dich höchstens noch für einen von ihnen halten.

	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung, "你 知 道 我 可 以 到 哪 里 弄 到 一 套 那 样 的 盔 甲 吗 ？", DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung, "听 起 来 不 错 。", DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00"); //听 起 来 不 错 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01"); //是 的 ， 但 是 只 有 那 些 想 要 自 杀 的 人 。
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00"); //你 知 道 我 可 以 到 哪 里 弄 到 一 套 那 样 的 盔 甲 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01"); //我 们 的 海 盗 营 地 里 曾 经 有 一 个 。
	// AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_02"); // Mmh ... Ich denke, die hatte genau deine Größe.
	AI_Output(self, other, "DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03"); //但 是 我 不 知 道 它 是 否 还 在 那 里 。

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_5);

	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};

///////////////////////////////////////////////////////////////////////
//	Info Greg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Greg(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Greg_Condition;
	information		= DIA_Addon_AlligatorJack_Greg_Info;
	description		= "你 的 船 长 名 字 叫 格 雷 格 ？";
};

func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Greg_15_00"); //你 的 船 长 名 字 叫 格 雷 格 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_01"); //正 确 。 他 是 自 从 出 现 大 海 以 来 最 伟 大 的 海 盗 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Greg_15_02"); //我 想 我 认 识 你 的 船 长 。 我 在 克 霍 里 尼 斯 见 过 他 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_03"); //（ 大 笑 ） 格 雷 格 ？ 在 克 霍 里 尼 斯 ？ 胡 扯 ！
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_04"); //格 雷 格 带 着 一 些 人 出 海 了 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_05"); //唯 一 可 以 把 格 雷 格 送 到 克 霍 里 尼 斯 应 该 是 国 王 关 囚 犯 的 战 舰 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_06"); //他 是 陆 地 上 的 人 最 想 通 缉 的 家 伙 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Greg_12_07"); //他 永 远 不 会 自 愿 地 走 进 城 镇 ， 并 让 那 些 皇 家 卫 兵 把 他 关 进 监 狱 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Greg_15_08"); //随 便 你 怎 么 说 。
};

///////////////////////////////////////////////////////////////////////
//	Info PIRLager
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_PIRLager(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_PIRLager_Condition;
	information		= DIA_Addon_AlligatorJack_PIRLager_Info;
	description		= "你 们 的 海 盗 营 地 在 哪 里 ？";
};

func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_WerBistDu))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_00"); //你 们 的 海 盗 营 地 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_01"); //看 到 那 里 的 山 洞 通 道 了 吗 ？ 穿 过 它 ， 然 后 继 续 向 西 ， 然 后 或 早 或 晚 你 就 能 到 我 们 的 海 滩 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_02"); //我 们 的 伐 木 屋 在 那 里 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_03"); //如 果 你 需 要 的 话 ， 我 可 以 带 你 去 那 里 ， 不 过 你 要 先 帮 我 一 个 忙 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_PIRLager_15_04"); //是 什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_05"); //我 要 在 可 以 回 营 地 之 前 ， 先 给 那 些 小 伙 子 送 一 些 肉 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_06"); //你 是 个 强 壮 的 家 伙 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PIRLager_12_07"); //我 需 要 你 帮 忙 打 猎 。 有 兴 趣 吗 ？

	Log_CreateTopic(TOPIC_Addon_RatHunt, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_RatHunt, TOPIC_Addon_RatHunt_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WasJagen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_WasJagen(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_WasJagen_Condition;
	information		= DIA_Addon_AlligatorJack_WasJagen_Info;
	description		= "你 狩 猎 的 是 什 么 ？";
};

func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_00"); //你 狩 猎 的 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_01"); //通 常 只 有 鳄 鱼 。 但 是 他 们 吃 起 来 不 怎 么 样 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_02"); //无 论 如 何 ， 这 附 近 没 剩 下 多 少 了 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_03"); //所 以 我 用 我 能 找 到 的 东 西 ： 沼 泽 鼠 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_WasJagen_15_04"); //什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_05"); //这 附 近 大 多 数 野 兽 的 味 道 就 像 臭 袜 子 一 样 ， 或 者 就 像 鳄 鱼 肉 一 样 硬 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_WasJagen_12_06"); //那 些 肥 硕 的 沼 泽 鼠 是 唯 一 可 以 下 咽 的 东 西 。

	B_LogEntry(TOPIC_Addon_RatHunt, TOPIC_Addon_RatHunt_2);
};

// ************************************************************
//				Pirates
// ************************************************************
instance DIA_Addon_AlligatorJack_Pirates(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Pirates_Condition;
	information		= DIA_Addon_AlligatorJack_Pirates_Info;
	description		= "多 和 我 说 说 关 于 你 的 海 盗 的 事 情 。";
};

func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Pirates_15_00"); //多 和 我 说 说 关 于 你 的 海 盗 的 事 情 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_01"); //我 们 已 经 在 这 里 生 活 多 年 。 在 战 争 之 前 ， 从 这 里 到 大 陆 ， 所 有 人 都 知 道 我 们 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_02"); //我 们 的 旗 帜 所 到 之 处 ， 会 把 恐 惧 传 播 到 商 船 上 的 水 手 之 间 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_03"); //但 是 现 在 ， 那 种 日 子 已 经 过 去 了 。 自 从 上 次 我 们 遇 到 商 船 ， 已 经 过 去 几 周 了 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_04"); //我 们 的 船 长 格 雷 格 出 去 试 着 去 找 另 外 一 艘 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_05"); //我 们 其 余 的 人 就 坐 在 营 地 这 里 ， 扳 着 手 指 等 他 回 来 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Pirates_12_06"); //我 希 望 他 能 带 回 很 多 的 战 利 品 。
};

// ************************************************************
// 			  			Lass uns jagen gehen
// ************************************************************
instance DIA_Addon_AlligatorJack_LetsGoHunting(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information		= DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent		= TRUE;
	description		= "让 我 们 开 始 狩 猎 。";
};

func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if ((MIS_KrokoJagd == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_WasJagen))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_LetsGoHunting_15_00"); //让 我 们 开 始 狩 猎 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_LetsGoHunting_12_01"); //好 吧 。 带 上 两 个 人 ， 那 就 如 同 儿 戏 一 样 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_LetsGoHunting_12_02"); //你 准 备 好 了 吗 ？

	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting, "不 ， 还 不 行 。", DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting, "是 的 。", DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};

const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;
func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00"); //是 的 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01"); //好 极 了 。 呆 在 我 身 后 。

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "HUNT1");

	Wld_InsertNpc(Swamprat, "ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat, "ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat, "ADW_PIRATECAMP_WATERHOLE_07");

	Wld_InsertNpc(Swamprat, "ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat, "ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat, "ADW_CANYON_TELEPORT_PATH_06");

	AlligatorJack_JagdStart = AlligatorJack_Inter1;

	MIS_KrokoJagd = LOG_RUNNING;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00"); //不 ， 还 不 行 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01"); //那 么 赶 快 。

	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter1
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information		= DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if ((AlligatorJack_JagdStart == AlligatorJack_Inter1)
	&& Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_16") <= 500)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00"); //洞 窟 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01"); //这 附 近 应 该 有 那 些 野 兽 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02"); //跟 我 来 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};

///////////////////////////////////////////////////////////////////////
//	Info Das habe ich befürchtet
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_TheHunt(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_TheHunt_Condition;
	information		= DIA_Addon_AlligatorJack_TheHunt_Info;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if ((AlligatorJack_JagdStart == AlligatorJack_Kessel)
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WATERHOLE_07") <= 500)
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_12_00"); //我 很 担 心 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_TheHunt_15_01"); //什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_12_02"); //这 里 的 野 兽 数 量 太 少 ， 只 有 我 需 要 的 一 半 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_12_03"); //现 在 我 们 必 须 进 入 峡 谷 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_12_04"); //留 神 ， 峡 谷 深 处 非 常 危 险 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_12_05"); //如 果 你 珍 惜 生 命 的 话 ， 尽 量 靠 近 我 。

	Wld_InsertNpc(Waran, "ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran, "ADW_ENTRANCE_2_VALLEY_10");

	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt, "那 边 的 峡 谷 里 是 什 么 ？", DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt, "好 ， 我 们 出 发 。", DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_TheHunt_Enough_15_00"); //那 边 的 峡 谷 里 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_Enough_12_01"); //我 们 要 尽 可 能 避 开 那 个 地 区 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_Enough_12_02"); //你 在 那 里 能 找 到 剃 刀 龙 。 那 些 残 暴 的 野 兽 。 如 果 你 还 想 活 一 天 的 话 ， 离 它 们 远 点 。
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_TheHunt_Running_15_00"); //好 ， 我 们 出 发 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_TheHunt_Running_12_01"); //好 吧 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};

///////////////////////////////////////////////////////////////////////
//	Info AlligatorJackInter2
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information		= DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if ((AlligatorJack_JagdStart == AlligatorJack_Inter2)
	&& (Npc_GetDistToWP(self, "ADW_PIRATECAMP_WAY_16") <= 500)
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00"); //来 吧 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};

///////////////////////////////////////////////////////////////////////
//	Info Das ist jetzt aber genug
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_HuntEnd(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information		= DIA_Addon_AlligatorJack_HuntEnd_Info;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if ((AlligatorJack_JagdStart == AlligatorJack_Canyon)
	&& (Npc_GetDistToWP(self, "ADW_CANYON_TELEPORT_PATH_06") <= 500)
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if (AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_00"); //嗯 ， 你 能 告 诉 我 要 我 带 你 去 做 什 么 吗 ？
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_01"); //你 连 一 只 沼 泽 鼠 都 没 有 杀 死 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_02"); //哦, 好 吧 。 也 许 你 能 在 其 它 方 面 帮 上 忙 。
	}
	else if (AlligatorJack_KrokosKilled == 1)
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_03"); //干 得 好 ， 我 们 需 要 像 你 这 样 的 人 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_04"); //你 的 第 一 次 狩 猎 就 干 掉 了 一 头 那 样 的 野 兽 。 不 坏 。
	}
	else // mehr als 1!!
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_05"); //你 是 一 个 天 生 的 猎 人 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_HuntEnd_12_06"); //我 的 神 啊 ！ 如 果 你 还 继 续 保 持 那 样 水 平 ， 下 次 我 就 只 能 呆 在 营 地 里 了 。
	};

	AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_07"); //给 ， 把 这 块 沼 泽 鼠 的 肉 送 给 懒 惰 的 老 摩 根 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_08"); //你 能 在 我 们 的 营 地 里 找 到 他 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_09"); //他 可 能 在 海 滩 的 什 么 地 方 虚 度 光 阴 。 他 应 该 正 在 等 这 个 。

	if (PIR_1354_Addon_Henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_10"); //亨 利 通 常 看 守 营 地 的 入 口 ， 并 监 视 强 盗 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_11"); //如 果 他 拒 绝 让 你 进 入 的 话 ， 就 告 诉 他 是 我 派 你 去 的 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_12"); //也 许 那 样 会 让 他 稍 微 和 蔼 一 点 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_PassHenry_12_13"); //亨 利 也 有 些 刻 薄 和 专 横 。
	};

	MIS_AlligatorJack_BringMeat = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_BringMeat, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BringMeat, TOPIC_Addon_BringMeat_1);

	B_LogEntry(TOPIC_Addon_RatHunt, TOPIC_Addon_RatHunt_3);

	B_GiveInvItems(self, other, ItFoMuttonRaw, 10);
	MIS_KrokoJagd = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Angus(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Angus_Condition;
	information		= DIA_Addon_AlligatorJack_Angus_Info;
	description		= "你 认 识 安 格 斯 和 他 的 朋 友 汉 克 吗 ？";
};

func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Bill_AngusnHank) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Angus_15_00"); //你 认 识 安 格 斯 和 他 的 朋 友 汉 克 吗 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Angus_12_03"); //我 已 经 有 段 时 间 没 见 过 他 们 了 。
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Angus_12_04"); //如 果 他 们 有 人 永 远 也 回 不 来 的 话 ， 我 也 不 会 介 意 。
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Angus_15_05"); //为 什 么 ？
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Angus_12_06"); //哦 ， 那 些 家 伙 总 是 在 湖 边 游 荡 ， 胆 小 如 鼠 。
};

///////////////////////////////////////////////////////////////////////
//		Angus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Lake(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Lake_Condition;
	information		= DIA_Addon_AlligatorJack_Lake_Info;
	description		= "那 是 什 么 样 的 湖 ？";
};

func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_Angus) == TRUE)
	&& (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Lake_15_00"); //那 是 什 么 样 的 湖 ？

	if (MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_01"); //记 得 我 们 的 打 猎 吗 ？
		AI_Output(other, self, "DIA_Addon_AlligatorJack_Lake_15_02"); //是 的 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_03"); //洞 窟 里 的 湖 ， 我 通 常 在 那 里 见 到 他 们 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_04"); //那 个 湖 在 一 个 巨 大 的 洞 窟 里 面 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_05"); //从 我 们 的 营 地 向 东 。 你 一 定 不 会 走 错 的 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_06"); //那 里 有 很 多 小 瀑 布 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_Lake_12_07"); //不 过 要 小 心 - 如 果 你 的 脚 下 除 了 沙 子 什 么 都 没 有 的 话 ， 你 就 是 走 错 路 进 入 峡 谷 了 。
	};

	B_LogEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_5);
};

///////////////////////////////////////////////////////////////////////
//	Info kannst du mir was beibringen?
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_CanLearn(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_CanLearn_Condition;
	information		= DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 一 些 东 西 吗 ？";
};

func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if (AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if ((Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_HuntEnd) == TRUE)
		|| (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_CanLearn_15_00"); //你 能 教 我 一 些 东 西 吗 ？

	if (MIS_KrokoJagd > LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_CanLearn_12_01"); //当 然 ， 我 是 一 个 出 色 的 猎 人 ， 而 且 我 能 教 你 如 何 剥 下 动 物 的 皮 和 拔 下 它 们 的 牙 齿 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_CanLearn_12_02"); //如 果 你 需 要 的 话 ， 我 可 以 教 你 。

		Log_CreateTopic(Topic_Addon_PIR_Teacher, LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher, Topic_Addon_PIR_Teacher_1);

		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_AlligatorJack_CanLearn_12_03"); //但 是 首 先 让 我 知 道 你 已 经 学 会 了 打 猎 。
		AI_Output(self, other, "DIA_Addon_AlligatorJack_CanLearn_12_04"); //等 我 们 一 起 出 去 打 猎 的 时 候 ， 我 会 那 么 做 。
	};
};

///////////////////////////////////////////////////////////////////////
func void B_AJ_Teach()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);

	Info_AddChoice(DIA_Addon_AlligatorJack_Teach, DIALOG_BACK, DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1) * 5), DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(NAME_LEARN_SKIN, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_ReptileSkin)), DIA_Addon_AlligatorJack_Teach_FUR);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach, B_BuildLearnString(NAME_LEARN_TEETH1, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Addon_AlligatorJack_Teach_Teeth);
};

///////////////////////////////////////////////////////////////////////
//	Info Unterrichte mich!
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_AlligatorJack_Teach(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 5;
	condition		= DIA_Addon_AlligatorJack_Teach_Condition;
	information		= DIA_Addon_AlligatorJack_Teach_Info;
	permanent		= TRUE;
	description		= "教 给 我 ！";
};

func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if (AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Teach_15_00"); //教 给 我 ！
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Teach_12_01"); //你 想 要 学 什 么 ？

	B_AJ_Teach();

	// Wird nicht mehr gebraucht M.F.
	// AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_02"); // Ich kann dir nichts mehr beibringen.
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_ReptileSkin] == FALSE)
	{
		if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_ReptileSkin))
		{
			AI_Output(self, other, "DIA_Addon_AlligatorJack_Teach_Fur_12_00"); //永 远 要 从 腹 部 开 始 剥 ， 不 然 质 量 会 下 降 。
		};
	}
	else
	{
		B_Say(self, other, "$NOLEARNYOUREBETTER");
	};

	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth);
	}
	else
	{
		B_Say(self, other, "$NOLEARNYOUREBETTER");
	};

	B_AJ_Teach();
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
func void B_AlliJack_AlliKlar()
{
	AI_Output(self, other, "DIA_Addon_AlligatorJack_Anheuern_12_01"); //那 么 好 吧 。
};

// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_Anheuern(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 11;
	condition		= DIA_Addon_AlligatorJack_Anheuern_Condition;
	information		= DIA_Addon_AlligatorJack_Anheuern_Info;
	description		= "让 我 们 开 始 狩 猎 。";
};

func int DIA_Addon_AlligatorJack_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_Anheuern_15_00"); //让 我 们 开 始 狩 猎 。
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_ComeOn(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 12;
	condition		= DIA_Addon_AlligatorJack_ComeOn_Condition;
	information		= DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent		= TRUE;
	description		= "快 点 。";
};

func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_KommMit_15_00"); //快 点 。
	if (C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self, other, "$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_GoHome(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 13;
	condition		= DIA_Addon_AlligatorJack_GoHome_Condition;
	information		= DIA_Addon_AlligatorJack_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_AlligatorJack_DontNeedYou_15_00"); //我 不 再 需 要 你 了 。
	B_AlliJack_AlliKlar();

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START"); // START! HOGE
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_AlligatorJack_TooFar(C_INFO)
{
	npc				= PIR_1352_Addon_AlligatorJack;
	nr				= 14;
	condition		= DIA_Addon_AlligatorJack_TooFar_Condition;
	information		= DIA_Addon_AlligatorJack_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self, other, "$RUNAWAY");

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};
