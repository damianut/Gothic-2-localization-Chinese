///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_EXIT(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 999;
	condition		= DIA_Rethon_EXIT_Condition;
	information		= DIA_Rethon_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_HALLO(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 5;
	condition		= DIA_Rethon_HALLO_Condition;
	information		= DIA_Rethon_HALLO_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Rethon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info()
{
	AI_Output(other, self, "DIA_Rethon_HALLO_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Rethon_HALLO_12_01"); //我 已 经 准 备 好 作 战 ， 还 有 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Kampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_KAMPF(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 6;
	condition		= DIA_Rethon_KAMPF_Condition;
	information		= DIA_Rethon_KAMPF_Info;
	description		= "你 要 和 谁 作 战 ？";
};

func int DIA_Rethon_KAMPF_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_KAMPF_Info()
{
	AI_Output(other, self, "DIA_Rethon_KAMPF_15_00"); //你 要 和 谁 作 战 ？
	AI_Output(self, other, "DIA_Rethon_KAMPF_12_01"); //我 想 我 最 好 拜 访 一 下 圣 骑 士 ， 然 后 踢 他 们 的 肥 屁 股 。
	AI_Output(self, other, "DIA_Rethon_KAMPF_12_02"); //白 痴 。 当 然 是 对 抗 龙 。 你 怎 么 想 的 ？
};

///////////////////////////////////////////////////////////////////////
//	Info paladine
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_PALADINE(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 6;
	condition		= DIA_Rethon_PALADINE_Condition;
	information		= DIA_Rethon_PALADINE_Info;
	description		= "圣 骑 士 不 在 乎 你 在 这 里 ？";
};

func int DIA_Rethon_PALADINE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_PALADINE_Info()
{
	AI_Output(other, self, "DIA_Rethon_PALADINE_15_00"); //圣 骑 士 不 在 乎 你 在 这 里 ？
	AI_Output(self, other, "DIA_Rethon_PALADINE_12_01"); //胡 扯 。 他 们 遇 到 的 难 题 截 然 不 同 。 他 们 大 多 数 人 都 在 庆 幸 自 己 还 活 着 。
	AI_Output(self, other, "DIA_Rethon_PALADINE_12_02"); //小 伙 子 们 的 士 气 没 有 达 到 最 佳 。 那 将 是 他 们 的 毁 灭 。
	AI_Output(self, other, "DIA_Rethon_PALADINE_12_03"); //我 是 说 ， 只 要 看 看 他 们 正 在 修 理 的 、 准 备 以 之 战 斗 的 破 刀 。
	AI_Output(self, other, "DIA_Rethon_PALADINE_12_04"); //任 何 一 个 有 理 性 的 战 士 都 会 立 即 逃 走 。
};

///////////////////////////////////////////////////////////////////////
//	Info WoGruppe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_WOGRUPPE(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 7;
	condition		= DIA_Rethon_WOGRUPPE_Condition;
	information		= DIA_Rethon_WOGRUPPE_Info;
	description		= "你 同 你 的 队 伍 分 开 了 ？";
};

func int DIA_Rethon_WOGRUPPE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_WOGRUPPE_Info()
{
	AI_Output(other, self, "DIA_Rethon_WOGRUPPE_15_00"); //你 同 你 的 队 伍 分 开 了 ？
	AI_Output(self, other, "DIA_Rethon_WOGRUPPE_12_01"); //我 的 小 组 ？ 我 没 有 小 组 。 我 是 一 个 战 利 品 收 集 家 。
	AI_Output(self, other, "DIA_Rethon_WOGRUPPE_12_02"); //如 果 我 没 有 带 着 战 利 品 回 家 的 话 ， 那 我 都 不 知 道 我 是 为 了 什 么 来 的 。 所 以 ， 我 不 需 要 任 何 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info drachengesehen
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_DRACHENGESEHEN(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 8;
	condition		= DIA_Rethon_DRACHENGESEHEN_Condition;
	information		= DIA_Rethon_DRACHENGESEHEN_Info;
	description		= "你 亲 眼 见 到 龙 了 ？";
};

func int DIA_Rethon_DRACHENGESEHEN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_KAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rethon_DRACHENGESEHEN_Info()
{
	AI_Output(other, self, "DIA_Rethon_DRACHENGESEHEN_15_00"); //你 亲 眼 见 到 龙 了 ？
	AI_Output(self, other, "DIA_Rethon_DRACHENGESEHEN_12_01"); //不 。 在 我 出 发 之 前 ， 我 要 确 保 我 的 武 器 处 于 最 佳 状 态 。
};

///////////////////////////////////////////////////////////////////////
//	Info Angst
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_ANGST(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 9;
	condition		= DIA_Rethon_ANGST_Condition;
	information		= DIA_Rethon_ANGST_Info;
	description		= "你 不 怕 有 人 捷 足 先 登 吗 ？";
};

func int DIA_Rethon_ANGST_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_WOGRUPPE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_ANGST_Info()
{
	AI_Output(other, self, "DIA_Rethon_ANGST_15_00"); //你 不 怕 有 人 捷 足 先 登 吗 ？

	AI_Output(self, other, "DIA_Rethon_ANGST_12_01"); //什 么 ？ 谁 ？ 席 尔 维 欧 ？

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Rethon_ANGST_12_02"); //你 的 老 板 真 的 以 为 他 能 在 这 里 杀 人 ， 嗯 ？
		AI_Output(other, self, "DIA_Rethon_ANGST_15_03"); //我 不 是 席 尔 维 欧 的 人 。 我 给 自 己 干 。
		AI_Output(self, other, "DIA_Rethon_ANGST_12_04"); //哦 。 那 好 。 忘 了 我 说 的 那 些 话 吧 。
	};

	AI_Output(self, other, "DIA_Rethon_ANGST_12_05"); //你 看 到 他 带 着 的 那 个 可 怜 的 人 了 吗 ？
	AI_Output(self, other, "DIA_Rethon_ANGST_12_06"); //席 尔 维 欧 如 果 能 活 着 离 开 这 里 的 话 ， 一 定 会 很 高 兴 。

	if (Npc_IsDead(DJG_Sylvio))
	{
		AI_Output(other, self, "DIA_Rethon_ANGST_15_07"); //不 ， 他 不 会 。 他 死 了 。
		AI_Output(self, other, "DIA_Rethon_ANGST_12_08"); //我 无 所 谓 。
	}
	else
	{
		Info_AddChoice(DIA_Rethon_ANGST, DIALOG_BACK, DIA_Rethon_ANGST_weiter);
		Info_AddChoice(DIA_Rethon_ANGST, "你 看 起 来 不 喜 欢 他 。", DIA_Rethon_ANGST_sylviomoegen);
		Info_AddChoice(DIA_Rethon_ANGST, "那 席 尔 维 欧 现 在 在 哪 里 ？", DIA_Rethon_ANGST_woSylvio);
		Info_AddChoice(DIA_Rethon_ANGST, "席 尔 维 欧 在 这 里 ？", DIA_Rethon_ANGST_sylviohier);
	};
};

func void DIA_Rethon_ANGST_weiter()
{
	Info_ClearChoices(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier()
{
	AI_Output(other, self, "DIA_Rethon_ANGST_sylviohier_15_00"); //席 尔 维 欧 在 这 里 ？
	AI_Output(self, other, "DIA_Rethon_ANGST_sylviohier_12_01"); //你 是 说 在 城 堡 这 里 ？ 对 ， 他 来 过 。 不 过 只 是 很 短 一 段 时 间 。
	AI_Output(self, other, "DIA_Rethon_ANGST_sylviohier_12_02"); //他 和 这 里 的 一 些 人 聊 了 一 下 ， 然 后 又 出 发 了 。
};

func void DIA_Rethon_ANGST_sylviomoegen()
{
	AI_Output(other, self, "DIA_Rethon_ANGST_sylviomoegen_15_00"); //你 看 起 来 不 喜 欢 他 。
	AI_Output(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_01"); //你 说 的 是 什 么 意 思 ， 希 望 ？ 认 识 他 并 不 会 让 我 感 到 特 别 自 豪 。
	AI_Output(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_02"); //席 尔 维 欧 没 有 任 何 朋 友 。 他 需 要 那 些 无 条 件 地 跟 着 他 走 的 人 。
	AI_Output(self, other, "DIA_Rethon_ANGST_sylviomoegen_12_03"); //那 不 是 我 。 我 一 个 人 单 干 。
};

func void DIA_Rethon_ANGST_woSylvio()
{
	AI_Output(other, self, "DIA_Rethon_ANGST_woSylvio_15_00"); //那 席 尔 维 欧 现 在 在 哪 里 ？
	AI_Output(self, other, "DIA_Rethon_ANGST_woSylvio_12_01"); //圣 骑 士 提 到 在 西 边 有 一 条 冰 龙 。 它 应 该 是 它 们 之 中 最 危 险 和 强 大 的 。
	AI_Output(self, other, "DIA_Rethon_ANGST_woSylvio_12_02"); //你 真 应 该 看 看 当 席 尔 维 欧 听 说 那 事 之 后 眼 里 发 出 的 光 。 不 难 想 象 他 去 了 哪 里 。

	B_LogEntry(TOPIC_DRACHENJAGD, TOPIC_DRACHENJAGD_2);
	Log_AddEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_1);
};

///////////////////////////////////////////////////////////////////////
//	Info meineWaffe
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_MEINEWAFFE(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 10;
	condition		= DIA_Rethon_MEINEWAFFE_Condition;
	information		= DIA_Rethon_MEINEWAFFE_Info;
	description		= "你 能 帮 我 强 化 我 的 武 器 ？";
};

func int DIA_Rethon_MEINEWAFFE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_MEINEWAFFE_Info()
{
	AI_Output(other, self, "DIA_Rethon_MEINEWAFFE_15_00"); //你 能 帮 我 强 化 我 的 武 器 ？
	AI_Output(self, other, "DIA_Rethon_MEINEWAFFE_12_01"); //改 造 ？ 最 好 买 新 的 ， 把 你 拿 的 那 些 垃 圾 扔 掉 。
	AI_Output(self, other, "DIA_Rethon_MEINEWAFFE_12_02"); //也 许 我 有 些 东 西 给 你 。 感 兴 趣 吗 ？
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Rethon_TRADE(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 11;
	condition		= DIA_Rethon_TRADE_Condition;
	information		= DIA_Rethon_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "你 能 卖 我 什 么 东 西 ？";
};

func int DIA_Rethon_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rethon_MEINEWAFFE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_TRADE_Info()
{
	AI_Output(other, self, "DIA_Rethon_TRADE_15_00"); //你 能 卖 我 什 么 东 西 ？
	B_GiveTradeInv(self);

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Rethon_TRADE_12_01"); //老 兄 ， 看 看 我 已 经 陷 了 多 深 。 现 在 我 甚 至 把 武 器 卖 给 圣 骑 士 。
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Rethon_TRADE_12_02"); //我 真 的 没 有 什 么 给 魔 法 师 ， 不 过 你 还 是 可 以 随 便 看 看 。
	}
	else
	{
		AI_Output(self, other, "DIA_Rethon_TRADE_12_03"); //我 想 我 有 你 想 要 的 东 西 ， 朋 友 。
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rethon_PICKPOCKET(C_INFO)
{
	npc				= DJG_709_Rethon;
	nr				= 900;
	condition		= DIA_Rethon_PICKPOCKET_Condition;
	information		= DIA_Rethon_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Rethon_PICKPOCKET_Condition()
{
	C_Beklauen(78, 230);
};

func void DIA_Rethon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
	Info_AddChoice(DIA_Rethon_PICKPOCKET, DIALOG_BACK, DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rethon_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
};

func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
};
