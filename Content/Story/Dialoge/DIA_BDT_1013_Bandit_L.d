///////////////////////////////////////////////////////////////////////
//	Info FIRST EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 999;
	condition		= DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition;
	information		= DIA_BDT_1013_BANDIT_FIRSTEXIT_Info;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1013_BANDIT_FIRSTEXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_FIRSTEXIT_Info()
{
	if ((Bdt13_Friend == TRUE)
	&& (!Npc_IsDead(Ambusher_1014))
	&& (!Npc_IsDead(Ambusher_1015)))
	{
		AI_Output(self, other, "DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00"); //如 果 我 是 你 的 话 ， 我 就 不 会 进 这 里 的 山 洞 - 我 在 那 里 的 朋 友 会 剥 了 你 的 皮 ， 而 且 他 们 知 道 如 何 战 斗 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_EXIT(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 999;
	condition		= DIA_BDT_1013_BANDIT_EXIT_Condition;
	information		= DIA_BDT_1013_BANDIT_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BDT_1013_BANDIT_EXIT_Condition()
{
	if (Npc_KnowsInfo(other, DIA_BDT_1013_BANDIT_FIRSTEXIT))
	{
		return TRUE;
	};
};

func void DIA_BDT_1013_BANDIT_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WHERE
///////////////////////////////////////////////////////////////////////
instance DIA_BDT_1013_BANDIT_WHERE(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 3;
	condition		= DIA_BDT_1013_BANDIT_WHERE_Condition;
	information		= DIA_BDT_1013_BANDIT_WHERE_Info;
	important		= TRUE;
};

func int DIA_BDT_1013_BANDIT_WHERE_Condition()
{
	return TRUE;
};

func void DIA_BDT_1013_BANDIT_WHERE_Info()
{
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_01_00"); //嘿 - 你 从 哪 里 来 ， 嗯 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);

	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "我 从 山 上 来 。", DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "我 从 艾 克 萨 达 斯 那 里 来 … …", DIA_BDT_1013_BANDIT_WHERE_XARDAS);
};

// -------------------------------------------------------------------------------------------
func void DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00"); //我 从 山 上 来 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01"); //确 实 如 此 。 你 从 山 里 来 。 那 对 你 来 说 太 糟 糕 了 。
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02"); //非 常 糟 糕 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03"); //他 们 在 找 你 - 一 大 群 邪 恶 的 家 伙 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04"); //这 里 有 个 你 绝 对 要 和 他 说 话 的 人 。 跟 我 来 ！

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "以 后 再 说 吧 … …", DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "谁 在 找 我 ？", DIA_BDT_1013_BANDIT_WHERE_WHO);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "好 ！ 你 先 走 ！", DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_XARDAS()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00"); //我 从 艾 克 萨 达 斯 那 里 来 … …
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01"); //是 那 个 老 巫 师 ？ 他 叫 艾 克 萨 达 斯 … … 布 莱 果 会 感 兴 趣 的 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

func void DIA_BDT_1013_BANDIT_WHERE_YES()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_YES_15_00"); //好 ！ 你 先 走 ！
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_YES_01_01"); //那 就 跟 我 来 ， 那 个 山 洞 就 在 这 里 。

	Npc_ExchangeRoutine(self, "AMBUSH");

	AI_StopProcessInfos(self);
};

func void DIA_BDT_1013_BANDIT_WHERE_WHO()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_WHO_15_00"); //谁 在 找 我 ？
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_01"); //克 霍 里 尼 斯 有 一 半 的 人 都 在 找 你 ， 而 你 想 要 告 诉 我 你 什 么 都 不 知 道 ？
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_02"); //啊 ！ 我 明 白 了 ！ 你 只 是 不 想 告 诉 我 ， 嗯 ？ 好 吧 - 那 是 你 自 己 的 事 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_WHO_01_03"); //那 ， 你 来 还 是 不 来 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "以 后 再 说 吧 … …", DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "我 要 和 谁 交 谈 ？", DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "好 ！ 你 先 走 ！", DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00"); //我 要 和 谁 交 谈 ？
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01"); //去 我 的 首 领 那 里 。 他 叫 布 拉 戈 。 他 比 我 解 释 得 更 明 白 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02"); //那 么 ， 它 进 行 的 - 怎 么 样 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "以 后 再 说 吧 … …", DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "我 怎 么 知 道 这 不 是 一 个 陷 阱 ？", DIA_BDT_1013_BANDIT_WHERE_NOTRAP);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "好 ！ 你 先 走 ！", DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTRAP()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00"); //我 怎 么 知 道 这 不 是 一 个 陷 阱 ？
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01"); //你 知 道 吗 ， 我 开 始 讨 厌 你 了 。 如 果 你 不 要 我 帮 忙 ， 那 就 直 接 走 进 城 市 ， 让 他 们 把 你 扔 进 监 狱 吧 ！
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02"); //你 马 上 就 跟 我 来 ， 要 不 就 别 想 它 了 ， 明 白 吗 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "以 后 再 说 吧 … …", DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "已 经 有 其 他 人 试 图 欺 骗 我 了 … …", DIA_BDT_1013_BANDIT_WHERE_DAMALS);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "好 ！ 你 先 走 ！", DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_DAMALS()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00"); //放 松 ， 我 的 朋 友 ！ 已 经 有 人 试 图 欺 骗 我 … …
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01"); //哦 ？
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02"); //这 个 家 伙 提 议 我 们 一 起 去 弄 一 个 护 身 符 ， 然 后 平 分 得 到 的 钱 。
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03"); //在 我 们 实 现 了 目 标 之 后 ， 他 和 他 的 朋 友 一 起 攻 击 了 我 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04"); //听 起 来 好 像 你 被 一 些 坏 人 缠 住 了 - 在 哪 里 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "那 不 重 要 。", DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "我 是 矿 区 的 一 名 罪 犯 。", DIA_BDT_1013_BANDIT_WHERE_PRISONER);
};

func void DIA_BDT_1013_BANDIT_WHERE_PRISONER()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00"); //我 是 矿 区 的 一 名 罪 犯 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01"); //（ 吃 惊 的 ） 你 从 屏 障 后 面 来 ？ 老 兄 ， 那 时 我 们 一 起 去 的 那 里 。
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02"); //我 不 认 识 你 … …
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03"); //我 是 旧 营 地 的 一 个 矿 工 。 我 对 整 件 事 情 牵 涉 得 不 多 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04"); //（ 阴 险 的 ） 但 是 现 在 最 重 要 的 是 什 么 - 你 卷 进 大 麻 烦 了 ！
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05"); //有 人 发 布 了 一 大 笔 赏 金 要 你 的 头 。 而 且 他 还 分 发 了 一 些 海 报 - 上 面 有 你 的 画 像 ！
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06"); //如 果 我 是 你 的 话 ， 我 一 定 会 非 常 - 非 常 - 小 心 。 和 我 们 在 一 起 的 某 些 人 ， 为 了 金 子 他 们 会 杀 死 任 何 人 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07"); //但 是 我 认 为 我 们 这 些 从 罪 犯 流 放 地 出 来 的 人 应 该 团 结 在 一 起 ！
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08"); //那 么 我 想 我 现 在 最 好 谢 谢 你 … …
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09"); //没 什 么 。 只 要 能 确 保 自 己 活 着 。

	Bdt13_Friend = TRUE;
	B_SetAttitude(self, ATT_FRIENDLY);
	self.npctype = NpcType_Friend;
	self.aivar[AIV_EnemyOverride] = FALSE;

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
};

func void DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00"); //那 不 重 要 。
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01"); //随 便 你 了 。 那 么 我 们 现 在 就 出 发 吗 ， 还 是 再 等 会 儿 ？

	Info_ClearChoices(DIA_BDT_1013_BANDIT_WHERE);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "以 后 再 说 吧 … …", DIA_BDT_1013_BANDIT_WHERE_LATER);
	Info_AddChoice(DIA_BDT_1013_BANDIT_WHERE, "好 ！ 你 先 走 ！", DIA_BDT_1013_BANDIT_WHERE_YES);
};

func void DIA_BDT_1013_BANDIT_WHERE_LATER()
{
	AI_Output(other, self, "DIA_BDT_1013_BANDIT_WHERE_LATER_15_00"); //以 后 再 说 吧 … …
	AI_Output(self, other, "DIA_BDT_1013_BANDIT_WHERE_LATER_01_01"); //你 绝 对 不 能 晚 ， 朋 友 ！

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info AMBUSH
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_AMBUSH(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 1;
	condition		= DIA_1013_BANDIT_AMBUSH_Condition;
	information		= DIA_1013_BANDIT_AMBUSH_Info;
	important		= TRUE;
};

func int DIA_1013_BANDIT_AMBUSH_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_XARDAS_BANDITS_RIGHT") <= 300)
	&& (Bdt13_Friend == FALSE))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_AMBUSH_Info()
{
	if ((Npc_IsDead(Ambusher_1014))
	&& (Npc_IsDead(Ambusher_1015)))
	{
		AI_Output(self, other, "DIA_1013_BANDIT_AMBUSH_01_00"); //你 跟 踪 我 真 是 非 常 愚 蠢 的 事 … …
		B_Attack(self, other, AR_SuddenEnemyInferno, 1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_1013_BANDIT_AMBUSH_01_01"); //嘿 ， 各 位 ， 看 我 带 谁 来 了 … …
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_NAME(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 1;
	condition		= DIA_1013_BANDIT_NAME_Condition;
	information		= DIA_1013_BANDIT_NAME_Info;
	description		= "负 责 发 赏 金 的 是 谁 ？";
};

func int DIA_1013_BANDIT_NAME_Condition()
{
	if (Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_NAME_Info()
{
	AI_Output(other, self, "DIA_1013_BANDIT_NAME_15_00"); //负 责 发 赏 金 的 是 谁 ？
	AI_Output(self, other, "DIA_1013_BANDIT_NAME_01_01"); //那 我 不 知 道 ， 我 们 之 间 只 有 一 个 人 认 识 他 。
	AI_Output(other, self, "DIA_1013_BANDIT_NAME_15_02"); //那 人 是 谁 ？
	AI_Output(self, other, "DIA_1013_BANDIT_NAME_01_03"); //嘿 ， 老 兄 - 我 真 的 不 能 告 诉 你 。 你 知 道 会 怎 么 样 … …

	Log_CreateTopic(Topic_Bandits, LOG_MISSION);
	Log_SetTopicStatus(Topic_Bandits, LOG_RUNNING);
	B_LogEntry(Topic_Bandits, Topic_Bandits_1);
	MIS_Steckbriefe = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info DEXTER verpetzen
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_DEXTER(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 1;
	condition		= DIA_1013_BANDIT_DEXTER_Condition;
	information		= DIA_1013_BANDIT_DEXTER_Info;
	permanent		= TRUE;
	description		= "１ ０ 金 币 换 那 个 提 供 赏 金 的 人 的 名 字 。";
};

func int DIA_1013_BANDIT_DEXTER_Condition()
{
	if ((Bdt13_Friend == TRUE)
	&& (Bdt13_Dexter_verraten == FALSE)
	&& (Npc_KnowsInfo(other, DIA_1013_BANDIT_NAME)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_DEXTER_Info()
{
	AI_Output(other, self, "DIA_1013_BANDIT_DEXTER_15_00"); //１ ０ 金 币 换 那 个 提 供 赏 金 的 人 的 名 字 。
	AI_Output(self, other, "DIA_1013_BANDIT_DEXTER_01_01"); //哦 ， 老 兄 ， 我 真 的 不 能 那 么 做 … …
	AI_Output(other, self, "DIA_1013_BANDIT_DEXTER_15_02"); //马 上 说 出 来 ！
	AI_Output(self, other, "DIA_1013_BANDIT_DEXTER_01_03"); //（ 深 深 吸 了 一 口 气 ） 哦 老 兄 ！ 好 吧 。 他 的 名 字 是 德 克 斯 特 。 在 那 个 大 农 场 附 近 ， 有 一 个 陡 峭 的 石 壁 。
	AI_Output(self, other, "DIA_1013_BANDIT_DEXTER_01_04"); //那 里 有 座 了 望 塔 ， 还 有 一 些 矿 井 。 他 的 隐 蔽 所 就 在 附 近 。

	B_LogEntry(Topic_Bandits, Topic_Bandits_2);

	if (B_GiveInvItems(other, self, itmi_gold, 10))
	{
		AI_Output(other, self, "DIA_1013_BANDIT_DEXTER_15_05"); //看 ， 那 没 有 多 难 。 这 是 给 你 的 金 币 。
	}
	else
	{
		AI_Output(other, self, "DIA_1013_BANDIT_DEXTER_15_06"); //呃 - 我 刚 刚 才 注 意 到 ， 你 连 十 枚 金 币 都 没 有 。
		AI_Output(self, other, "DIA_1013_BANDIT_DEXTER_01_07"); //什 么 ？ ！ 我 … … 哦 - 算 了 吧 - 是 我 自 己 的 错 。 我 不 应 该 在 看 到 金 币 之 前 就 告 诉 你 那 个 名 字 … …
	};

	AI_Output(self, other, "DIA_1013_BANDIT_DEXTER_01_08"); //只 是 不 要 告 诉 他 们 是 谁 对 你 说 的 。

	Bdt13_Dexter_verraten = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info PIC
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_PIC(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 2;
	condition		= DIA_1013_BANDIT_PIC_Condition;
	information		= DIA_1013_BANDIT_PIC_Info;
	description		= "我 能 拿 走 画 像 吗 ？";
};

func int DIA_1013_BANDIT_PIC_Condition()
{
	if (Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PIC_Info()
{
	AI_Output(other, self, "DIA_1013_BANDIT_PIC_15_00"); //我 能 拿 走 画 像 吗 ？
	AI_Output(self, other, "DIA_1013_BANDIT_PIC_01_01"); //当 然 （ 露 齿 而 笑 ） - 毕 竟 那 上 面 是 ‘ 你 ’ 的 画 像 。
	B_GiveInvItems(self, other, ItWr_Poster_MIS, 1);
};

///////////////////////////////////////////////////////////////////////
//						MALETHs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromMaleth(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 3;
	condition		= DIA_1013_BANDIT_FromMaleth_Condition;
	information		= DIA_1013_BANDIT_FromMaleth_Info;
	description		= "镇 外 面 的 一 个 农 民 让 我 过 来 … …";
};

func int DIA_1013_BANDIT_FromMaleth_Condition()
{
	if ((Bdt13_Friend == TRUE)
	&& ((MIS_Maleth_Bandits == LOG_RUNNING) || (MIS_Maleth_Bandits == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromMaleth_Info()
{
	AI_Output(other, self, "DIA_1013_BANDIT_FromMaleth_15_00"); //镇 外 面 的 一 个 农 民 让 我 过 来 … …
	AI_Output(self, other, "DIA_1013_BANDIT_FromMaleth_01_01"); //什 么 ？ 农 场 主 知 道 那 个 隐 蔽 所 ？
	AI_Output(other, self, "DIA_1013_BANDIT_FromMaleth_15_02"); //他 们 已 经 注 意 到 了 丢 失 的 绵 羊 。

	var C_Npc b14; b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	var C_Npc b15; b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if ((Npc_IsDead(b14))
	&& (Npc_IsDead(b15)))
	{
		AI_Output(self, other, "DIA_1013_BANDIT_FromMaleth_01_03"); //该 死 ！ 嗯 ， 那 我 必 须 离 开 了 。 如 果 他 们 看 到 隐 蔽 所 是 空 的 ， 也 许 就 不 会 继 续 找 我 了 。
	}
	else // mindestens einer lebt noch
	{
		AI_Output(other, self, "DIA_1013_BANDIT_FromMaleth_15_04"); //他 想 看 到 你 们 全 都 死 掉 … …
		AI_Output(self, other, "DIA_1013_BANDIT_FromMaleth_01_05"); //等 等 - 你 不 会 杀 我 的 ， 是 吗 - 在 我 帮 了 你 以 后 ？
		AI_Output(self, other, "DIA_1013_BANDIT_FromMaleth_01_06"); //如 果 你 渴 望 见 血 的 话 ， 去 杀 别 的 人 - 我 不 会 插 手 ！
	};

	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);

	Npc_ExchangeRoutine(self, "AWAY");

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//						CAVALORNs Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_1013_BANDIT_FromCavalorn(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 3;
	condition		= DIA_1013_BANDIT_FromCavalorn_Condition;
	information		= DIA_1013_BANDIT_FromCavalorn_Info;
	description		= "这 里 很 快 就 会 出 现 更 多 的 麻 烦 。";
};

func int DIA_1013_BANDIT_FromCavalorn_Condition()
{
	if ((Bdt13_Friend == TRUE)
	&& (MIS_Addon_Cavalorn_KillBrago == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_FromCavalorn_Info()
{
	AI_Output(other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_00"); //这 里 很 快 就 会 出 现 更 多 的 麻 烦 。
	AI_Output(self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_01"); //有 什 么 新 鲜 事 吗 ？
	AI_Output(other, self, "DIA_ADDON_1013_BANDIT_FromCavalorn_15_02"); //一 个 叫 卡 瓦 隆 的 家 伙 来 找 你 了 ！
	AI_Output(self, other, "DIA_ADDON_1013_BANDIT_FromCavalorn_01_03"); //胡 说 ！ 他 还 活 着 ？ 我 要 离 开 这 里 。

	Bdt_1013_Away = TRUE;
	B_GivePlayerXP(XP_BanditWeg);

	Npc_ExchangeRoutine(self, "AWAY2");

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//							PERM
///////////////////////////////////////////////////////////////////////

// ------------------------------
var int bdt13_Gossip_Wildnis;
// ------------------------------
instance DIA_1013_BANDIT_PERM(C_INFO)
{
	npc				= BDT_1013_Bandit_L;
	nr				= 4;
	condition		= DIA_1013_BANDIT_PERM_Condition;
	information		= DIA_1013_BANDIT_PERM_Info;
	permanent		= TRUE;
	description		= "有 其 它 让 我 感 兴 趣 的 事 情 吗 ？";
};

func int DIA_1013_BANDIT_PERM_Condition()
{
	if (Bdt13_Friend == TRUE)
	{
		return TRUE;
	};
};

func void DIA_1013_BANDIT_PERM_Info()
{
	AI_Output(other, self, "DIA_1013_BANDIT_PERM_15_00"); //有 其 它 让 我 感 兴 趣 的 事 情 吗 ？

	if (bdt13_Gossip_Wildnis == FALSE)
	{
		AI_Output(self, other, "DIA_1013_BANDIT_PERM_01_01"); //你 是 说 这 里 的 地 区 ？ 如 果 你 想 活 着 的 话 ， 就 留 在 大 路 上 。
		AI_Output(self, other, "DIA_1013_BANDIT_PERM_01_02"); //你 在 野 地 里 走 的 越 远 ， 就 越 危 险 。
		bdt13_Gossip_Wildnis = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_1013_BANDIT_PERM_01_03"); //我 已 经 把 所 有 能 告 诉 你 的 都 说 了 。
	};
};
