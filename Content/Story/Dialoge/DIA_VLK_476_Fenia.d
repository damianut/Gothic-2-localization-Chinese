///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_EXIT(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 999;
	condition		= DIA_Fenia_EXIT_Condition;
	information		= DIA_Fenia_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fenia_EXIT_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Fenia_EXIT_17_00"); //祝 你 愉 快 ， 圣 骑 士 先 生 。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Fenia_EXIT_17_01"); //祝 你 旅 途 平 安 ， 尊 敬 的 魔 法 师 。
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Fenia_PICKPOCKET(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 900;
	condition		= DIA_Fenia_PICKPOCKET_Condition;
	information		= DIA_Fenia_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60_Female;
};

func int DIA_Fenia_PICKPOCKET_Condition()
{
	C_Beklauen(50, 75);
};

func void DIA_Fenia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
	Info_AddChoice(DIA_Fenia_PICKPOCKET, DIALOG_BACK, DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fenia_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};

func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Hallo(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 3;
	condition		= DIA_Fenia_Hallo_Condition;
	information		= DIA_Fenia_Hallo_Info;
	important		= TRUE;
};

func int DIA_Fenia_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Hallo_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Fenia_Hallo_17_00"); //你 的 脸 色 更 难 看 了 。 很 久 没 有 睡 过 觉 了 ， 是 吗 ？
		AI_Output(other, self, "DIA_Fenia_Hallo_15_01"); //太 久 了 。
	};

	AI_Output(self, other, "DIA_Fenia_Hallo_17_02"); //来 吧 ， 走 近 点 。 跟 着 我 ， 你 会 发 现 你 正 在 找 的 东 西 ！

	Log_CreateTopic(Topic_CityTrader, LOG_NOTE);
	B_LogEntry(Topic_CityTrader, Topic_CityTrader_1);
};

///////////////////////////////////////////////////////////////////////
//	Info Handeln
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_HANDELN(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 10;
	condition		= DIA_Fenia_HANDELN_Condition;
	information		= DIA_Fenia_HANDELN_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物";
};

func int DIA_Fenia_HANDELN_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Fenia_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Fenia_HANDELN_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Fenia_HANDELN_15_00"); //让 我 看 看 你 的 货 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info Infos
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Infos(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 10;
	condition		= DIA_Fenia_Infos_Condition;
	information		= DIA_Fenia_Infos_Info;
	description		= "你 说 有 我 需 要 的 东 西 。 那 包 括 信 息 吗 ？";
};

func int DIA_Fenia_Infos_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Fenia_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Infos_Info()
{
	AI_Output(other, self, "DIA_Fenia_Infos_15_00"); //你 说 有 我 需 要 的 东 西 。 那 包 括 信 息 吗 ？
	AI_Output(self, other, "DIA_Fenia_Infos_17_01"); //不 过 ， 当 然 。 你 想 要 知 道 些 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	MoreTraders
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_MoreTraders(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 11;
	condition		= DIA_Fenia_MoreTraders_Condition;
	information		= DIA_Fenia_MoreTraders_Info;
	description		= "在 港 口 这 里 还 有 其 它 的 商 人 吗 ？";
};

func int DIA_Fenia_MoreTraders_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_MoreTraders_Info()
{
	AI_Output(other, self, "DIA_Fenia_Infos_haendler_15_00"); //在 港 口 这 里 还 有 其 它 的 商 人 吗 ？
	AI_Output(self, other, "DIA_Fenia_Infos_haendler_17_01"); //如 果 你 在 码 头 上 一 直 向 左 ， 你 会 发 现 哈 尔 沃 ， 我 的 丈 夫 。 他 卖 鱼 。
	AI_Output(self, other, "DIA_Fenia_Infos_haendler_17_02"); //在 另 外 一 边 ， 你 会 看 到 制 图 师 布 拉 希 姆 。
};

///////////////////////////////////////////////////////////////////////
//	OV
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_OV(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 13;
	condition		= DIA_Fenia_OV_Condition;
	information		= DIA_Fenia_OV_Info;
	description		= "你 知 道 有 谁 来 自 富 人 区 吗 ？";
};

func int DIA_Fenia_OV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Fenia_Infos))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Fenia_OV_Info()
{
	AI_Output(other, self, "DIA_Fenia_Infos_oberesViertel_15_00"); //你 知 道 有 谁 来 自 富 人 区 吗 ？
	AI_Output(self, other, "DIA_Fenia_Infos_oberesViertel_17_01"); //（ 大 笑 ） 如 果 我 认 识 那 里 的 任 何 人 我 就 不 会 站 在 这 里 了 ， 我 的 小 伙 子 。
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Interesting(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 14;
	condition		= DIA_Fenia_Interesting_Condition;
	information		= DIA_Fenia_Interesting_Info;
	description		= "在 港 口 附 近 有 什 么 有 意 思 的 事 吗 ？";
};

func int DIA_Fenia_Interesting_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Interesting_Info()
{
	AI_Output(other, self, "DIA_Fenia_Infos_interessantes_15_00"); //港 口 那 里 有 什 么 有 趣 的 东 西 可 以 看 ？
	AI_Output(self, other, "DIA_Fenia_Infos_interessantes_17_01"); //好 吧 。 如 果 你 正 在 找 什 么 赌 博 的 话 ， 去 下 面 码 头 上 卡 迪 夫 的 酒 馆 吧 。 那 里 总 是 在 策 划 一 些 东 西 。
	AI_Output(self, other, "DIA_Fenia_Infos_interessantes_17_02"); //你 不 会 错 过 它 的 。 门 口 那 里 站 着 的 那 个 人 肯 定 会 引 起 你 的 注 意 。
	AI_Output(self, other, "DIA_Fenia_Infos_interessantes_17_03"); //除 了 那 个 ， 那 里 还 有 圣 骑 士 们 的 一 艘 大 船 。 国 王 的 庄 严 的 战 舰 。 那 个 东 西 确 实 值 得 一 见 。
	AI_Output(self, other, "DIA_Fenia_Infos_interessantes_17_04"); //如 果 你 在 码 头 上 一 直 往 左 走 ， 然 后 从 那 块 高 耸 的 岩 石 下 面 穿 过 去 就 会 发 现 它 。
};

///////////////////////////////////////////////////////////////////////
//	Hafen
///////////////////////////////////////////////////////////////////////
instance DIA_Fenia_Aufregend(C_INFO)
{
	npc				= VLK_476_Fenia;
	nr				= 15;
	condition		= DIA_Fenia_Aufregend_Condition;
	information		= DIA_Fenia_Aufregend_Info;
	description		= "这 里 最 近 发 生 过 什 么 刺 激 的 事 情 吗 ？";
};

func int DIA_Fenia_Aufregend_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Aufregend_Info()
{
	AI_Output(other, self, "DIA_Fenia_Add_15_00"); //最 近 发 生 什 么 刺 激 的 事 情 没 有 ？
	AI_Output(self, other, "DIA_Fenia_Add_17_01"); //你 可 以 这 么 说 。 那 并 非 在 那 么 久 以 前
	AI_Output(self, other, "DIA_Fenia_Add_17_02"); //一 个 贼 跑 到 了 这 里 。 他 一 定 是 在 城 里 的 贫 民 区 偷 了 一 张 弓 。
	AI_Output(self, other, "DIA_Fenia_Add_17_03"); //当 然 ， 那 些 民 兵 来 得 太 晚 了 ， 就 像 平 时 一 样 。
	AI_Output(self, other, "DIA_Fenia_Add_17_04"); //他 摆 脱 了 他 们 - 就 那 样 跳 进 了 海 港 ， 然 后 消 失 了 。
};
