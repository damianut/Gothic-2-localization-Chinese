// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Cipher_EXIT(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 999;
	condition		= DIA_Cipher_EXIT_Condition;
	information		= DIA_Cipher_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Cipher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cipher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  					Hello
// ************************************************************
instance DIA_Cipher_Hello(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 1;
	condition		= DIA_Cipher_Hello_Condition;
	information		= DIA_Cipher_Hello_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Cipher_Hello_Condition()
{
	return TRUE;
};

func void DIA_Cipher_Hello_Info()
{
	AI_Output(other, self, "DIA_Cipher_Hello_15_00"); //最 近 怎 么 样 ？
	AI_Output(self, other, "DIA_Cipher_Hello_07_01"); //嘿 ， 我 是 不 是 在 哪 里 见 过 你 ？
	AI_Output(other, self, "DIA_Cipher_Hello_15_02"); //这 很 有 可 能 … …
	AI_Output(self, other, "DIA_Cipher_Hello_07_03"); //在 流 放 地 的 时 候 ， 我 曾 经 做 过 沼 生 草 的 买 卖 ， 记 得 吗 ？
};

// ************************************************************
// 			  					TradeWhat
// ************************************************************
instance DIA_Cipher_TradeWhat(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_TradeWhat_Condition;
	information		= DIA_Cipher_TradeWhat_Info;
	description		= "你 现 在 经 营 什 么 ？";
};

func int DIA_Cipher_TradeWhat_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cipher_Hello))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TradeWhat_Info()
{
	AI_Output(other, self, "DIA_Cipher_TradeWhat_15_00"); //你 现 在 经 营 什 么 ？
	AI_Output(self, other, "DIA_Cipher_TradeWhat_07_01"); //啊 ， 不 要 问 。
	AI_Output(self, other, "DIA_Cipher_TradeWhat_07_02"); //我 从 矿 区 流 放 地 那 里 带 来 了 一 整 包 的 沼 生 草 。
	AI_Output(self, other, "DIA_Cipher_TradeWhat_07_03"); //很 多 雇 佣 兵 有 时 喜 欢 抽 点 烟 。 我 在 这 方 面 发 了 一 小 笔 财 。
	AI_Output(self, other, "DIA_Cipher_TradeWhat_07_04"); //但 是 ， 有 一 个 混 蛋 从 我 的 箱 子 里 偷 走 了 全 部 的 沼 生 草 ！

	Log_CreateTopic(Topic_CipherPaket, LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherPaket, LOG_RUNNING);
	B_LogEntry(Topic_CipherPaket, Topic_CipherPaket_2);

	if (!Npc_IsDead(Bodo))
	{
		AI_Output(self, other, "DIA_Cipher_TradeWhat_07_05"); //我 十 分 肯 定 就 是 波 多 。 他 跟 我 睡 在 一 个 房 间 里 ， 还 经 常 象 个 白 痴 一 样 对 我 傻 笑 … …
		B_LogEntry(Topic_CipherPaket, Topic_CipherPaket_3);
	};

	MIS_Cipher_Paket = LOG_RUNNING;
};

// ************************************************************
// 			  					DoWithThief
// ************************************************************
instance DIA_Cipher_DoWithThief(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_DoWithThief_Condition;
	information		= DIA_Cipher_DoWithThief_Info;
	description		= "那 你 打 算 怎 么 对 付 那 个 小 偷 呢 ？";
};

func int DIA_Cipher_DoWithThief_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DoWithThief_Info()
{
	AI_Output(other, self, "DIA_Cipher_DoWithThief_15_00"); //那 你 打 算 怎 么 对 付 那 个 小 偷 呢 ？
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_01"); //就 这 些 天 ， 我 会 在 他 吸 我 的 沼 生 草 时 抓 住 他 。
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_02"); //然 后 我 会 找 一 个 僻 静 地 方 给 他 上 一 堂 课 ， 叫 他 永 远 也 忘 不 了 。
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_03"); //如 果 我 在 院 子 中 间 把 他 打 倒 ， 会 被 其 它 的 农 民 会 看 到 ， 那 我 就 得 不 偿 失 了 。
	AI_Output(other, self, "DIA_Cipher_DoWithThief_15_04"); //为 什 么 ？
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_05"); //非 常 简 单 。 我 们 不 能 殴 打 这 些 农 民 ， 否 则 李 会 重 罚 我 们 。 欧 纳 尔 想 要 这 么 办 。
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_06"); //而 且 ， 证 人 越 多 ， 反 对 就 越 多 。 那 会 使 事 情 付 出 更 大 的 代 价 。
	AI_Output(self, other, "DIA_Cipher_DoWithThief_07_07"); //那 么 ， 我 会 把 事 情 干 得 漂 漂 亮 亮 、 不 露 痕 迹 … …
};

// ************************************************************
// 			  					WannaJoin
// ************************************************************
instance DIA_Cipher_WannaJoin(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_WannaJoin_Condition;
	information		= DIA_Cipher_WannaJoin_Info;
	description		= "我 要 加 入 李 的 一 边 ！";
};

func int DIA_Cipher_WannaJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Cipher_Hello))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_WannaJoin_Info()
{
	AI_Output(other, self, "DIA_Cipher_WannaJoin_15_00"); //我 要 加 入 李 的 一 边 ！
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_01"); //李 的 人 ？ ！ 如 果 李 再 这 么 下 去 ， 他 们 很 快 就 不 再 是 他 的 人 了 ！
	AI_Output(other, self, "DIA_Cipher_WannaJoin_15_02"); //怎 么 ？
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_03"); //李 总 是 沉 得 住 气 。 在 流 放 地 的 时 候 也 是 这 样 。
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_04"); //但 是 最 近 ， 他 做 得 有 点 过 了 。 他 只 想 坐 在 那 里 等 着 那 些 圣 骑 士 饿 死 。
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_05"); //席 尔 维 欧 认 为 我 们 应 该 去 小 农 场 和 城 镇 外 赚 点 钱 。
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_06"); //我 想 那 可 以 赚 相 当 一 笔 小 钱 。
	AI_Output(self, other, "DIA_Cipher_WannaJoin_07_07"); //现 在 ， 我 们 大 多 数 人 都 呆 在 这 里 玩 弄 自 己 的 大 拇 指 - 总 之 ， 你 想 要 加 入 吗 ？
};

// ************************************************************
// 			  					YesJoin
// ************************************************************
instance DIA_Cipher_YesJoin(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_YesJoin_Condition;
	information		= DIA_Cipher_YesJoin_Info;
	description		= "我 无 论 如 何 也 要 加 入 你 一 边 ！";
};

func int DIA_Cipher_YesJoin_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Cipher_WannaJoin))
	&& (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Cipher_YesJoin_Info()
{
	AI_Output(other, self, "DIA_Cipher_YesJoin_15_00"); //我 无 论 如 何 也 要 加 入 你 一 边 ！
	AI_Output(self, other, "DIA_Cipher_YesJoin_07_01"); //你 已 经 知 道 我 们 对 所 有 的 新 兵 都 要 投 票 ？
	AI_Output(other, self, "DIA_Cipher_YesJoin_15_02"); //你 在 暗 示 些 什 么 ？
	AI_Output(self, other, "DIA_Cipher_YesJoin_07_03"); //唉 ， 我 已 经 有 好 久 没 有 东 西 抽 了 。 送 我 一 两 根 沼 生 草 卷 烟 我 就 投 你 的 票 。
	AI_Output(self, other, "DIA_Cipher_YesJoin_07_04"); //你 肯 定 可 以 在 某 处 凑 到 一 些 。

	MIS_Cipher_BringWeed = LOG_RUNNING;

	Log_CreateTopic(Topic_CipherHerb, LOG_MISSION);
	Log_SetTopicStatus(Topic_CipherHerb, LOG_RUNNING);
	B_LogEntry(Topic_CipherHerb, Topic_CipherHerb_1);
};

// ************************************************************
// 			  					Joints
// ************************************************************
instance DIA_Cipher_Joints(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_Joints_Condition;
	information		= DIA_Cipher_Joints_Info;
	permanent		= TRUE;
	description		= "关 于 沼 生 草 … …";
};

func int DIA_Cipher_Joints_Condition()
{
	if (MIS_Cipher_BringWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Cipher_Joints_Info()
{
	AI_Output(other, self, "DIA_Cipher_Joints_15_00"); //关 于 沼 生 草 … …

	if (MIS_Cipher_Paket == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Cipher_Joints_07_01"); //你 给 我 带 了 一 小 包 来 了 ！ 现 在 ， 什 么 都 好 办 。
		if (other.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Cipher_Joints_07_02"); //我 当 然 会 给 你 投 票 … …

			B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_4);
		};

		MIS_Cipher_BringWeed = LOG_OBSOLETE; // Cipher ist glücklich
	}
	else // normal Running
	{
		Info_ClearChoices(DIA_Cipher_Joints);
		Info_AddChoice(DIA_Cipher_Joints, "我 会 看 看 我 能 做 些 什 么 … …", DIA_Cipher_Joints_Running);
		if (Npc_HasItems(other, itmi_joint) > 0)
		{
			Info_AddChoice(DIA_Cipher_Joints, "这 是 给 你 的 几 根 … …", DIA_Cipher_Joints_Success);
		};
	};
};

func void DIA_Cipher_Joints_Running()
{
	AI_Output(other, self, "DIA_Cipher_Joints_Running_15_00"); //我 会 看 看 我 能 做 些 什 么 … …
	Info_ClearChoices(DIA_Cipher_Joints);
};

func void DIA_Cipher_Joints_Success()
{
	AI_Output(other, self, "DIA_Cipher_Joints_Success_15_00"); //这 是 给 你 的 几 根 … …

	if (B_GiveInvItems(other, self, itmi_joint, 10))
	{
		AI_Output(self, other, "DIA_Cipher_Joints_Success_07_01"); //啊 ！ 你 是 我 的 人 ！
		if (other.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Cipher_Joints_Success_07_02"); //你 得 到 了 我 的 一 票 。
		};

		MIS_Cipher_BringWeed = LOG_SUCCESS;
		B_LogEntry(TOPIC_SLDRespekt, TOPIC_SLDRespekt_4);
		B_GivePlayerXP(XP_CipherWeed);
	}
	else
	{
		AI_Output(self, other, "DIA_Cipher_Joints_Success_07_03"); //就 是 这 些 吗 ？ 我 坐 一 会 儿 就 能 抽 那 么 多 ！
		AI_Output(self, other, "DIA_Cipher_Joints_Success_07_04"); //那 至 少 需 要 1 0 根 烟 。
		if (other.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Cipher_Joints_Success_07_05"); //无 论 怎 样 ， 你 已 经 得 到 我 的 投 票 加 入 我 们 。
		};
	};

	Info_ClearChoices(DIA_Cipher_Joints);
};

// ************************************************************
// 			  					TRADE
// ************************************************************
instance DIA_Cipher_TRADE(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_TRADE_Condition;
	information		= DIA_Cipher_TRADE_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。 ";
};

func int DIA_Cipher_TRADE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cipher_TradeWhat))
	{
		return TRUE;
	};
};

func void DIA_Cipher_TRADE_Info()
{
	AI_Output(other, self, "DIA_Cipher_TRADE_15_00"); //让 我 看 看 你 的 货 物 。
	if (Npc_HasItems(self, itmi_joint) > 0)
	{
		AI_Output(self, other, "DIA_Cipher_TRADE_07_01"); //当 然 。 请 随 便 。
	}
	else
	{
		AI_Output(self, other, "DIA_Cipher_TRADE_07_02"); //我 现 在 一 根 沼 生 草 都 没 有 。 你 想 要 别 的 东 西 吗 ？
	};
};

// ************************************************************
// 			  					Dar Dieb
// ************************************************************
instance DIA_Cipher_DarDieb(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_DarDieb_Condition;
	information		= DIA_Cipher_DarDieb_Info;
	description		= "我 知 道 谁 拿 走 了 你 的 烟 草 。";
};

func int DIA_Cipher_DarDieb_Condition()
{
	if (((Dar_Dieb == TRUE) || (Dar_Verdacht == TRUE))
	&& (!Npc_IsDead(Dar)))
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarDieb_Info()
{
	AI_Output(other, self, "DIA_Cipher_DarDieb_15_00"); //我 知 道 谁 拿 走 了 你 的 烟 草 。
	AI_Output(self, other, "DIA_Cipher_DarDieb_07_01"); //谁 ？ 是 不 是 波 多 ？
	AI_Output(other, self, "DIA_Cipher_DarDieb_15_02"); //不 - 是 一 个 雇 佣 兵 干 的 - 达 尔 。
	AI_Output(self, other, "DIA_Cipher_DarDieb_07_03"); //那 个 混 蛋 - 他 在 哪 里 ？
	AI_Output(other, self, "DIA_Cipher_DarDieb_15_04"); //找 到 他 也 没 用 ， 包 裹 已 经 不 在 他 身 上 了 。 他 在 克 霍 里 尼 斯 把 它 卖 掉 了 。
	AI_Output(self, other, "DIA_Cipher_DarDieb_07_05"); //他 在 哪 里 ！ ？ ！
	AI_Output(other, self, "DIA_Cipher_DarDieb_15_06"); //在 厨 房 后 面 ， 角 落 那 儿 … …
	AI_Output(self, other, "DIA_Cipher_DarDieb_07_07"); //我 会 把 他 揍 瘪 ！

	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self, Dar, AR_NONE, 0);
};

// ************************************************************
// 			  					Dar LOST
// ************************************************************
instance DIA_Cipher_DarLOST(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_DarLOST_Condition;
	information		= DIA_Cipher_DarLOST_Info;
	description		= "你 让 达 尔 自 作 自 受 … … 你 现 在 感 觉 好 些 吗 ？";
};

func int DIA_Cipher_DarLOST_Condition()
{
	if (Dar_LostAgainstCipher == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cipher_DarLOST_Info()
{
	AI_Output(other, self, "DIA_Cipher_DarLOST_15_00"); //你 让 达 尔 自 作 自 受 … … 你 现 在 感 觉 好 些 吗 ？
	AI_Output(self, other, "DIA_Cipher_DarLOST_07_01"); //（ 叹 息 ） 是 的 ， 那 感 觉 很 好 。
	AI_Output(other, self, "DIA_Cipher_DarLOST_15_02"); //不 是 对 他 ， 我 认 为 … …
	AI_Output(self, other, "DIA_Cipher_DarLOST_07_03"); //那 个 小 家 伙 没 事 翻 我 的 箱 子 ！

	B_GivePlayerXP((XP_Ambient) * 2);
};

// ************************************************************
// 			  				Kraut PAKET
// ************************************************************
instance DIA_Cipher_KrautPaket(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 2;
	condition		= DIA_Cipher_KrautPaket_Condition;
	information		= DIA_Cipher_KrautPaket_Info;
	description		= "这 包 沼 生 草 会 不 会 就 是 你 的 ？";
};

func int DIA_Cipher_KrautPaket_Condition()
{
	if ((Npc_HasItems(other, ItMi_HerbPaket) > 0)
	&& (MIS_Cipher_Paket == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Cipher_KrautPaket_Info()
{
	AI_Output(other, self, "DIA_Cipher_KrautPaket_15_00"); //这 包 沼 生 草 会 不 会 就 是 你 的 ？
	B_GiveInvItems(other, self, ItMi_HerbPaket, 1);
	AI_Output(self, other, "DIA_Cipher_KrautPaket_07_01"); //好 吧 ， 我 会 的 ！ 你 在 哪 里 弄 到 这 些 的 ？
	AI_Output(other, self, "DIA_Cipher_KrautPaket_15_02"); //说 来 话 长 … …

	AI_Output(self, other, "DIA_Cipher_KrautPaket_07_03"); //没 关 系 ， 真 的 ， 你 是 个 不 错 的 家 伙 。
	AI_Output(self, other, "DIA_Cipher_KrautPaket_07_04"); //给 ， 拿 上 这 个 作 为 报 酬 。 好 好 享 受 吧 ！
	B_GiveInvItems(self, other, itmi_gold, 200);
	B_GiveInvItems(self, other, itmi_joint, 10);
	B_GivePlayerXP(XP_Cipher_KrautPaket);

	AI_Output(self, other, "DIA_Cipher_KrautPaket_07_05"); //先 让 我 卷 两 … …
	CreateInvItems(self, itmi_joint, 40);
	Npc_RemoveInvItems(self, ItMi_HerbPaket, 1);

	MIS_Cipher_Paket = LOG_SUCCESS;
	B_GivePlayerXP(XP_CipherPaket);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_CipherSLD_PICKPOCKET(C_INFO)
{
	npc				= Sld_803_Cipher;
	nr				= 900;
	condition		= DIA_CipherSLD_PICKPOCKET_Condition;
	information		= DIA_CipherSLD_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_CipherSLD_PICKPOCKET_Condition()
{
	C_Beklauen(65, 65);
};

func void DIA_CipherSLD_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_CipherSLD_PICKPOCKET);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET, DIALOG_BACK, DIA_CipherSLD_PICKPOCKET_BACK);
	Info_AddChoice(DIA_CipherSLD_PICKPOCKET, DIALOG_PICKPOCKET, DIA_CipherSLD_PICKPOCKET_DoIt);
};

func void DIA_CipherSLD_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};

func void DIA_CipherSLD_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cipher_PICKPOCKET);
};

// #####################################################################
// ##
// ##
// ## Bis - KAPITEL 3 - (danach in OW!)
// ##
// ##
// #####################################################################

/**/
