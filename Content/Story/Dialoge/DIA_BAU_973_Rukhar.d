///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_EXIT(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 999;
	condition		= DIA_Rukhar_EXIT_Condition;
	information		= DIA_Rukhar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rukhar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HALLO(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 4;
	condition		= DIA_Rukhar_HALLO_Condition;
	information		= DIA_Rukhar_HALLO_Info;
	description		= "这 里 的 啤 酒 好 一 点 了 吗 ？ ";
};

func int DIA_Rukhar_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rukhar_HALLO_Info()
{
	AI_Output(other, self, "DIA_Rukhar_HALLO_15_00"); //这 里 的 啤 酒 好 一 点 了 吗 ？
	AI_Output(self, other, "DIA_Rukhar_HALLO_12_01"); //它 不 一 定 是 最 好 的 ， 但 是 在 这 个 萧 条 时 期 ， 你 不 应 该 那 么 挑 剔 。
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WASMACHSTDU(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 5;
	condition		= DIA_Rukhar_WASMACHSTDU_Condition;
	information		= DIA_Rukhar_WASMACHSTDU_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Rukhar_WASMACHSTDU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Rukhar_WASMACHSTDU_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Rukhar_WASMACHSTDU_12_01"); //直 到 几 周 前 ， 我 还 在 地 主 的 地 里 卖 命 工 作 。
	AI_Output(self, other, "DIA_Rukhar_WASMACHSTDU_12_02"); //某 一 天 我 的 工 作 更 多 了 ， 然 后 我 马 上 离 开 了 那 里 。
	AI_Output(self, other, "DIA_Rukhar_WASMACHSTDU_12_03"); //现 在 我 是 自 己 的 老 板 。 我 所 拥 有 的 一 切 就 是 这 个 箱 子 。 那 也 是 我 需 要 的 全 部 。
	AI_Output(self, other, "DIA_Rukhar_WASMACHSTDU_12_04"); //想 来 个 小 比 赛 吗 ？
	Log_CreateTopic(TOPIC_Wettsaufen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Wettsaufen, LOG_RUNNING);
	B_LogEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_5);
};

///////////////////////////////////////////////////////////////////////
//	Info Wettkampf
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_WETTKAMPF(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_WETTKAMPF_Condition;
	information		= DIA_Rukhar_WETTKAMPF_Info;
	description		= "那 是 什 么 类 型 的 比 赛 ？";
};

func int DIA_Rukhar_WETTKAMPF_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_WETTKAMPF_Info()
{
	AI_Output(other, self, "DIA_Rukhar_WETTKAMPF_15_00"); //那 是 什 么 类 型 的 比 赛 ？
	AI_Output(self, other, "DIA_Rukhar_WETTKAMPF_12_01"); //我 管 它 叫 ‘ 干 杯 ’。
	AI_Output(self, other, "DIA_Rukhar_WETTKAMPF_12_02"); //规 则 非 常 简 单 。
	AI_Output(self, other, "DIA_Rukhar_WETTKAMPF_12_03"); //我 们 轮 流 喝 掉 那 个 老 家 伙 提 供 的 最 好 的 啤 酒 。
	AI_Output(self, other, "DIA_Rukhar_WETTKAMPF_12_04"); //每 一 杯 都 必 须 要 喝 干 ， 就 算 你 把 杯 子 扣 在 桌 子 上 也 不 能 留 下 一 圈 痕 迹 。
	AI_Output(self, other, "DIA_Rukhar_WETTKAMPF_12_05"); //最 后 没 醉 倒 的 人 获 胜 。 输 的 人 付 酒 帐 和 赌 注 。 好 吧 ？ 怎 么 样 ？
	AI_Output(other, self, "DIA_Rukhar_WETTKAMPF_15_06"); //以 后 再 说 吧 ， 等 我 不 饿 的 时 候 。
};

///////////////////////////////////////////////////////////////////////
//	Info HoleRandolph
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HOLERANDOLPH(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_HOLERANDOLPH_Condition;
	information		= DIA_Rukhar_HOLERANDOLPH_Info;
	description		= "不 过 ， 我 可 以 让 别 人 来 打 赌 吗 ？";
};

func int DIA_Rukhar_HOLERANDOLPH_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WETTKAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_HOLERANDOLPH_Info()
{
	AI_Output(other, self, "DIA_Rukhar_HOLERANDOLPH_15_00"); //不 过 ， 我 可 以 让 别 人 来 打 赌 吗 ？
	AI_Output(self, other, "DIA_Rukhar_HOLERANDOLPH_12_01"); //当 然 。 如 果 你 最 后 能 找 到 某 个 有 胆 量 的 人 和 我 一 较 高 下 的 话 ， 我 愿 意 和 你 一 起 下 注 。
	AI_Output(self, other, "DIA_Rukhar_HOLERANDOLPH_12_02"); //每 个 人 都 往 罐 子 里 放 同 样 数 量 的 钱 ， 胜 者 拿 走 全 部 。 赌 注 的 大 小 取 决 于 你 的 钱 包 。
	AI_Output(self, other, "DIA_Rukhar_HOLERANDOLPH_12_03"); //找 一 个 敢 和 我 比 赛 的 人 ， 而 你 已 经 下 注 了 。
	B_LogEntry(TOPIC_Wettsaufen, TOPIC_Wettsaufen_6);
};

///////////////////////////////////////////////////////////////////////
//	Info RandolphWill
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_RANDOLPHWILL(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_RANDOLPHWILL_Condition;
	information		= DIA_Rukhar_RANDOLPHWILL_Info;
	permanent		= TRUE;
	description		= "我 找 到 了 某 个 愿 意 和 你 比 赛 的 人 。";
};

var int DIA_Rukhar_RANDOLPHWILL_noPerm;

func int DIA_Rukhar_RANDOLPHWILL_Condition()
{
	if (
	(Npc_KnowsInfo(other, DIA_Randolph_GEGENWEN))
	&& (Npc_KnowsInfo(other, DIA_Rukhar_HOLERANDOLPH))
	&& (DIA_Rukhar_RANDOLPHWILL_noPerm == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_Rukhar_RANDOLPHWILL_Info()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_15_00"); //我 找 到 了 某 个 愿 意 和 你 比 赛 的 人 。
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_12_01"); //那 个 人 是 谁 ？
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_15_02"); //伦 道 夫 。
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_12_03"); //呵 呵 。 那 个 牛 皮 大 王 伦 道 夫 ？ 好 吧 。 为 什 么 不 呢 。
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_12_04"); //让 那 个 没 用 的 家 伙 来 我 这 里 ， 然 后 协 议 生 效 。
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_12_05"); //你 可 以 两 天 以 后 再 把 他 叫 起 来 。 谁 知 道 呢 ？ 也 许 幸 运 的 话 ， 他 那 时 应 该 能 站 起 来 。
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_12_06"); //你 的 赌 注 有 多 大 ？

	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "没 有", DIA_Rukhar_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "１ ０ 枚 金 币", DIA_Rukhar_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_annehmen()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_annehmen_12_00"); //我 要 拿 走 你 的 赌 注 ， 直 到 比 赛 结 束 ， 可 以 吗 ？
	DIA_Rukhar_RANDOLPHWILL_noPerm = TRUE;
};

func void DIA_Rukhar_RANDOLPHWILL_mehr()
{
	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);

	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "没 有", DIA_Rukhar_RANDOLPHWILL_nix);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "100", DIA_Rukhar_RANDOLPHWILL_100);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "50", DIA_Rukhar_RANDOLPHWILL_50);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "20", DIA_Rukhar_RANDOLPHWILL_20);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "１ ０ 枚 金 币", DIA_Rukhar_RANDOLPHWILL_10);
};

func void DIA_Rukhar_RANDOLPHWILL_nix()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_nix_15_00"); //没 有
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_nix_12_01"); //那 我 们 也 许 应 该 忘 掉 整 件 事 情 。

	AI_StopProcessInfos(self);
};

func void DIA_Rukhar_RANDOLPHWILL_10()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_10_15_00"); //１ ０ 枚 金 币
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_10_12_01"); //来 吧 ， 你 不 是 认 真 的 吧 。 再 多 一 点 钱 又 不 会 要 了 你 的 命 。

	Rukhar_Einsatz = 10;
	Rukhar_Gewinn = 20;

	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 选 择 另 一 个 赌 注 ）", DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 接 受 打 赌 ）", DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_20()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_20_15_00"); //20
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_20_12_01"); //如 果 你 想 要 下 注 ， 那 么 请 做 得 像 点 样 子 。

	Rukhar_Einsatz = 20;
	Rukhar_Gewinn = 40;

	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 选 择 另 一 个 赌 注 ）", DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 接 受 打 赌 ）", DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_50()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_50_15_00"); //50
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_50_12_01"); //别 这 么 胆 小 。 勇 敢 点 。

	Rukhar_Einsatz = 50;
	Rukhar_Gewinn = 100;

	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 选 择 另 一 个 赌 注 ）", DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 接 受 打 赌 ）", DIA_Rukhar_RANDOLPHWILL_annehmen);
};

func void DIA_Rukhar_RANDOLPHWILL_100()
{
	AI_Output(other, self, "DIA_Rukhar_RANDOLPHWILL_100_15_00"); //100
	AI_Output(self, other, "DIA_Rukhar_RANDOLPHWILL_100_12_01"); //我 就 希 望 听 到 这 些 。

	Rukhar_Einsatz = 100;
	Rukhar_Gewinn = 200;

	Info_ClearChoices(DIA_Rukhar_RANDOLPHWILL);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 选 择 另 一 个 赌 注 ）", DIA_Rukhar_RANDOLPHWILL_mehr);
	Info_AddChoice(DIA_Rukhar_RANDOLPHWILL, "（ 接 受 打 赌 ）", DIA_Rukhar_RANDOLPHWILL_annehmen);
};

///////////////////////////////////////////////////////////////////////
//	Info IchSeheDich
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_ICHSEHEDICH(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_ICHSEHEDICH_Condition;
	information		= DIA_Rukhar_ICHSEHEDICH_Info;
	permanent		= TRUE;
	description		= "这 是 我 的 赌 注 。";
};

var int DIA_Rukhar_ICHSEHEDICH_noPerm;

func int DIA_Rukhar_ICHSEHEDICH_Condition()
{
	if (
	(DIA_Rukhar_ICHSEHEDICH_noPerm == FALSE)
	&& (DIA_Rukhar_RANDOLPHWILL_noPerm == TRUE)
	&& (Rukhar_Einsatz != 0)
	)
	{
		return TRUE;
	};
};

func void DIA_Rukhar_ICHSEHEDICH_Info()
{
	AI_Output(other, self, "DIA_Rukhar_ICHSEHEDICH_15_00"); //这 是 我 的 赌 注 。

	if (B_GiveInvItems(other, self, ItMi_Gold, Rukhar_Einsatz))
	{
		AI_Output(self, other, "DIA_Rukhar_ICHSEHEDICH_12_01"); //好 吧 。 把 伦 道 夫 带 到 这 里 来 ， 不 要 太 久 ， 你 听 到 了 吗？
		DIA_Rukhar_ICHSEHEDICH_noPerm = TRUE;
		MIS_Rukhar_Wettkampf = LOG_RUNNING;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_Rukhar_ICHSEHEDICH_12_02"); //非 常 有 趣 。 等 你 有 足 够 的 钱 的 时 候 再 回 来 吧 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info geldzurueck
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_GELDZURUECK(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_GELDZURUECK_Condition;
	information		= DIA_Rukhar_GELDZURUECK_Info;
	permanent		= TRUE;
	description		= "我 想 把 我 的 钱 拿 回 来 。";
};

func int DIA_Rukhar_GELDZURUECK_Condition()
{
	if (
	(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
	&& (Rukhar_Won_Wettkampf == TRUE)
	)
	{
		return TRUE;
	};
};

func void DIA_Rukhar_GELDZURUECK_Info()
{
	AI_Output(other, self, "DIA_Rukhar_GELDZURUECK_15_00"); //我 想 把 我 的 钱 拿 回 来 。
	AI_Output(self, other, "DIA_Rukhar_GELDZURUECK_12_01"); //赌 债 是 信 誉 债 ， 朋 友 。 你 之 前 就 应 该 仔 细 考 虑 清 楚 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Haenseln
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_HAENSELN(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 3;
	condition		= DIA_Rukhar_HAENSELN_Condition;
	information		= DIA_Rukhar_HAENSELN_Info;
	permanent		= TRUE;
	description		= "看 起 来 太 贪 心 了 。";
};

func int DIA_Rukhar_HAENSELN_Condition()
{
	if (
	(MIS_Rukhar_Wettkampf == LOG_SUCCESS)
	&& (Rukhar_Won_Wettkampf == FALSE)
	)
	{
		return TRUE;
	};
};

var int DIA_Rukhar_HAENSELN_nureimalgeld;

func void DIA_Rukhar_HAENSELN_Info()
{
	AI_Output(other, self, "DIA_Rukhar_HAENSELN_15_00"); //看 起 来 太 贪 心 了 。

	if (DIA_Rukhar_HAENSELN_nureimalgeld == FALSE)
	{
		AI_Output(self, other, "DIA_Rukhar_HAENSELN_12_01"); //这 是 你 的 钱 ， 不 要 再 多 说 一 句 话 。
		B_GivePlayerXP(XP_Rukhar_Lost);

		IntToFloat(Rukhar_Gewinn);

		CreateInvItems(self, ItMi_Gold, Rukhar_Gewinn);
		B_GiveInvItems(self, other, ItMi_Gold, Rukhar_Gewinn);

		DIA_Rukhar_HAENSELN_nureimalgeld = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Rukhar_HAENSELN_12_02"); //我 会 和 你 算 账 的 ， 你 等 着 瞧 。
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Rukhar_Perm(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 7;
	condition		= DIA_Rukhar_Perm_Condition;
	information		= DIA_Rukhar_Perm_Info;
	permanent		= TRUE;
	description		= "有 其 它 有 趣 的 事 发 生 了 吗 ？";
};

func int DIA_Rukhar_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rukhar_WASMACHSTDU))
	{
		return TRUE;
	};
};

func void DIA_Rukhar_Perm_Info()
{
	AI_Output(other, self, "DIA_Rukhar_Perm_15_00"); //有 其 它 有 趣 的 事 发 生 了 吗 ？
	AI_Output(self, other, "DIA_Rukhar_Perm_12_01"); //据 我 所 知 不 是 那 样 的 。 没 人 告 诉 我 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rukhar_PICKPOCKET(C_INFO)
{
	npc				= BAU_973_Rukhar;
	nr				= 900;
	condition		= DIA_Rukhar_PICKPOCKET_Condition;
	information		= DIA_Rukhar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Rukhar_PICKPOCKET_Condition()
{
	C_Beklauen(26, 30);
};

func void DIA_Rukhar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET, DIALOG_BACK, DIA_Rukhar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rukhar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rukhar_PICKPOCKET_DoIt);
};

func void DIA_Rukhar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};

func void DIA_Rukhar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rukhar_PICKPOCKET);
};
