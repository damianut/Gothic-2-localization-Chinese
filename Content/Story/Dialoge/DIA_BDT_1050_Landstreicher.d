///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_EXIT(C_INFO)
{
	npc				= BDT_1050_Landstreicher;
	nr				= 999;
	condition		= DIA_Landstreicher_EXIT_Condition;
	information		= DIA_Landstreicher_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Landstreicher_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_HALLO(C_INFO)
{
	npc				= BDT_1050_Landstreicher;
	nr				= 5;
	condition		= DIA_Landstreicher_HALLO_Condition;
	information		= DIA_Landstreicher_HALLO_Info;
	important		= TRUE;
};

func int DIA_Landstreicher_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_HALLO_Info()
{
	AI_Output(self, other, "DIA_Landstreicher_HALLO_09_00"); //这 里 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Landstreicher_HALLO_15_01"); //你 是 什 么 意 思 ？
	AI_Output(self, other, "DIA_Landstreicher_HALLO_09_02"); //你 是 第 二 个 从 这 里 跑 过 、 好 像 被 血 蝇 叮 了 一 口 的 家 伙 。

	Info_ClearChoices(DIA_Landstreicher_HALLO);

	Info_AddChoice(DIA_Landstreicher_HALLO, "我 要 走 了 。", DIA_Landstreicher_HALLO_weg);
	Info_AddChoice(DIA_Landstreicher_HALLO, "另 一 个 人 去 哪 里 了 ？", DIA_Landstreicher_HALLO_wo);
	Info_AddChoice(DIA_Landstreicher_HALLO, "另 一 个 人 是 谁 ？", DIA_Landstreicher_HALLO_wer);
};

func void DIA_Landstreicher_HALLO_wo()
{
	AI_Output(other, self, "DIA_Landstreicher_HALLO_wo_15_00"); //另 一 个 人 去 哪 里 了 ？
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wo_09_01"); //他 象 闪 电 一 样 往 那 条 路 跑 去 了 。
};

func void DIA_Landstreicher_HALLO_wer()
{
	AI_Output(other, self, "DIA_Landstreicher_HALLO_wer_15_00"); //另 一 个 人 是 谁 ？
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_09_01"); //他 看 起 来 好 像 是 那 边 的 修 道 院 里 的 某 个 聪 明 绝 顶 的 新 信 徒 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_09_02"); //随 便 你 怎 么 说 ， 不 过 有 些 时 候 那 些 家 伙 的 脑 子 真 的 有 点 不 对 头 。

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_09_03"); //就 看 看 他 们 那 愚 蠢 的 衣 服 。 我 可 不 希 望 在 夜 里 的 大 街 上 穿 着 那 衣 服 被 抓 起 来 。 （ 大 笑 ）
		Info_AddChoice(DIA_Landstreicher_HALLO, "注 意 你 说 的 话 。 我 自 己 也 曾 经 是 修 道 院 里 的 新 信 徒 。", DIA_Landstreicher_HALLO_wer_vorsicht);
	};
};

func void DIA_Landstreicher_HALLO_wer_vorsicht()
{
	AI_Output(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_15_00"); //注 意 你 说 的 话 。 我 自 己 也 曾 经 是 修 道 院 里 的 新 信 徒 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_01"); //（ 大 笑 ） 你 这 可 怜 的 猪 。 那 真 的 说 明 了 一 些 事 情 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_09_02"); //不 想 冒 犯 。 走 你 的 路 吧 。 你 是 一 个 忙 人 ， 不 要 为 我 耽 误 时 间 。

	Info_AddChoice(DIA_Landstreicher_HALLO, "应 该 有 人 教 你 一 点 礼 节 。", DIA_Landstreicher_HALLO_wer_vorsicht_Manieren);
};

func void DIA_Landstreicher_HALLO_wer_vorsicht_Manieren()
{
	AI_Output(other, self, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00"); //应 该 有 人 教 你 一 点 礼 节 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01"); //现 在 不 要 生 气 。 好 吧 ， 如 果 你 确 实 想 要 打 架 ， 那 就 来 吧 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02"); //现 在 让 我 看 看 你 会 什 么 ， 新 信 徒 。

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Landstreicher_HALLO_weg()
{
	AI_Output(other, self, "DIA_Landstreicher_HALLO_weg_15_00"); //我 要 走 了 。
	AI_Output(self, other, "DIA_Landstreicher_HALLO_weg_09_01"); //嘿 。 没 问 题 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WASMACHSTDU
///////////////////////////////////////////////////////////////////////
instance DIA_Landstreicher_WASMACHSTDU(C_INFO)
{
	npc				= BDT_1050_Landstreicher;
	nr				= 6;
	condition		= DIA_Landstreicher_WASMACHSTDU_Condition;
	information		= DIA_Landstreicher_WASMACHSTDU_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 有 什 么 事 ？";
};

func int DIA_Landstreicher_WASMACHSTDU_Condition()
{
	return TRUE;
};

func void DIA_Landstreicher_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_Landstreicher_WASMACHSTDU_15_00"); //你 在 这 里 有 什 么 事 ？

	if (Npc_KnowsInfo(other, DIA_Landstreicher_HALLO))
	{
		AI_Output(self, other, "DIA_Landstreicher_WASMACHSTDU_09_01"); //对 你 这 样 傲 慢 自 大 的 家 伙 来 说 ， 你 的 问 题 还 挺 多 。
	};

	AI_Output(self, other, "DIA_Landstreicher_WASMACHSTDU_09_02"); //一 起 给 我 们 通 过 的 那 个 哥 布 林 山 洞 命 名 ， 然 后 我 就 会 告 诉 你 一 个 小 秘 密 。
	AI_Output(self, other, "DIA_Landstreicher_WASMACHSTDU_09_03"); //否 则 的 话 ， 就 管 好 你 自 己 的 事 吧 。

	AI_StopProcessInfos(self);
};
