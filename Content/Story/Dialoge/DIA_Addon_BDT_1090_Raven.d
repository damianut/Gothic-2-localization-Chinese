// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Raven_EXIT(C_INFO)
{
	npc				= BDT_1090_Addon_Raven;
	nr				= 999;
	condition		= DIA_Addon_Raven_EXIT_Condition;
	information		= DIA_Addon_Raven_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 
// ************************************************************
// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Raven_Hi(C_INFO)
{
	npc				= BDT_1090_Addon_Raven;
	nr				= 1;
	condition		= DIA_Addon_Raven_Hi_Condition;
	information		= DIA_Addon_Raven_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Raven_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Raven_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_00"); //看 看 是 谁 来 了 。
	if (C_BodyStateContains(self, BS_SIT))
	{
		Npc_StopAni(self, "T_PRAY_RANDOM");
		AI_PlayAniBS(self, "T_PRAY_2_STAND", BS_STAND);
		AI_TurnToNpc(self, other);
	};

	AI_Output(self, other, "DIA_Addon_Raven_Add_10_01"); //我 的 主 人 警 告 我 ， 英 诺 斯 会 派 来 他 的 亲 信 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_02"); //但 是 我 想 不 到 你 会 来 的 这 么 快 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_03"); //嗯 ， 既 然 你 这 么 快 （ 大 笑 ） ， 我 就 让 你 快 点 去 死 。

	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, "你 才 马 上 就 要 死 了 。", DIA_Addon_Raven_Hi_DU);
	Info_AddChoice(DIA_Addon_Raven_Hi, "你 已 经 把 你 的 灵 魂 出 卖 给 了 贝 利 尔 ！", DIA_Addon_Raven_Hi_Soul);
};

func void DIA_Addon_Raven_Hi_DU()
{
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_00"); //你 才 马 上 就 要 死 了 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_04"); //（ 大 笑 ） 你 吓 不 了 我 。 我 带 着 贝 利 尔 的 剑 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_05"); //我 将 率 领 龙 到 大 陆 上 去 。 我 们 将 一 起 在 让 人 类 的 世 界 里 布 满 深 深 的 黑 暗 。
};

func void DIA_Addon_Raven_Hi_Soul()
{
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_01"); //你 已 经 把 你 的 灵 魂 出 卖 给 了 贝 利 尔 ！
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_06"); //只 要 有 个 好 价 钱 ， 我 就 愿 意 作 为 将 军 统 帅 他 的 军 队 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_07"); //而 你 呢 ？ 你 知 道 你 的 灵 魂 值 多 少 吗 ？

	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, "我 受 够 了 。 我 们 开 始 吧 … …", DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi, "我 只 是 在 做 应 该 做 的 。", DIA_Addon_Raven_Hi_only);
};

func void DIA_Addon_Raven_Hi_only()
{
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_02"); //我 只 是 在 做 应 该 做 的 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_08"); //（ 大 笑 ） 听 听 他 说 的 。 你 给 我 派 来 了 一 个 谦 逊 的 仆 人 ， 英 诺 斯 ！ （ 放 声 大 笑 ）

	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, "我 受 够 了 。 我 们 开 始 吧 … …", DIA_Addon_Raven_Hi_Attack);
	Info_AddChoice(DIA_Addon_Raven_Hi, "你 肯 定 我 是 英 诺 斯 的 仆 人 ？", DIA_Addon_Raven_Hi_Sure);
};

func void DIA_Addon_Raven_Hi_Sure()
{
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_03"); //你 肯 定 我 是 英 诺 斯 的 仆 人 ？
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_09"); //什 么 ？ 你 说 什 么 ？
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_04"); //难 道 你 没 想 过 我 可 能 是 亚 达 诺 斯 的 仆 从 吗 ？
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_10"); //（ 大 笑 ） 荒 谬 ！
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_05"); //可 能 我 也 为 贝 利 尔 服 务 - 或 者 只 是 为 我 自 己 。
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_11"); //（ 轻 蔑 的 ） 嗯 ， 如 果 是 那 样 的 话 ， 你 根 本 不 配 做 我 的 对 手 ！

	Info_ClearChoices(DIA_Addon_Raven_Hi);
	Info_AddChoice(DIA_Addon_Raven_Hi, "我 受 够 了 。 我 们 开 始 吧 … …", DIA_Addon_Raven_Hi_Attack);
};

func void DIA_Addon_Raven_Hi_Attack()
{
	AI_Output(other, self, "DIA_Addon_Raven_Add_15_06"); //我 受 够 了 。 我 们 开 始 吧 … …
	AI_Output(self, other, "DIA_Addon_Raven_Add_10_12"); //（ 轻 蔑 的 ） 你 这 么 急 着 要 死 吗 ？ 嗯 ， 既 然 你 坚 持 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
};

/*
--------------
10 * NEU * DIA_Addon_Raven_Add_10_00 // Seht wer gekommen ist.
10 * NEU * DIA_Addon_Raven_Add_10_01 // Mein Meister hat mich davor gewarnt, daß Innos seine Schergen schicken würde.
10 * NEU * DIA_Addon_Raven_Add_10_02 // Aber das du so früh auftauchst, hätte ich nicht erwartet.
10 * NEU * DIA_Addon_Raven_Add_10_03 // Nun, da du so schnell warst (lacht) werde ich dir auch einen schnellen Tod schenken.
--------------
15 * NEU * DIA_Addon_Raven_Add_15_00 // DU bist derjenige der sterben wird.
10 * NEU * DIA_Addon_Raven_Add_10_04 // (lacht) Du bist keine Bedrohung für mich. Ich trage Beliars Schwert.
10 * NEU * DIA_Addon_Raven_Add_10_05 // Ich werde die Drachen auf's Festland führen. Zusammen werden wir die Welt der Menschen in tiefste Dunkelheit tauchen.
--------------
15 * NEU * DIA_Addon_Raven_Add_15_01 // Du hast deine Seele an Beliar verkauft!
10 * NEU * DIA_Addon_Raven_Add_10_06 // Zu einem guten Preis. Als General werde ich seine Armeen befehligen.
10 * NEU * DIA_Addon_Raven_Add_10_07 // Und was ist mit dir? Weißt du wieviel DEINE Seele wert ist?
--------------
15 * NEU * DIA_Addon_Raven_Add_15_02 // Ich mache nur das, was getan werden muss.
10 * NEU * DIA_Addon_Raven_Add_10_08 // (lacht) Hört ihn euch an. Einen bescheidenen Diener schickst du mir Innos! (Lacht laut)
--------------
15 * NEU * DIA_Addon_Raven_Add_15_03 // Bist du sicher, dass ich ein Diener Innos bin?
10 * NEU * DIA_Addon_Raven_Add_10_09 // Was? Was redest du da?
15 * NEU * DIA_Addon_Raven_Add_15_04 // Hältst du es nicht für möglich das ich ein Diener Adanos bin?
10 * NEU * DIA_Addon_Raven_Add_10_10 // (lacht) Unsinn!
15 * NEU * DIA_Addon_Raven_Add_15_05 // Vielleicht diene auch ICH Beliar - oder nur mir selbst.
10 * NEU * DIA_Addon_Raven_Add_10_11 // (höhnt) Nun, in diesem Fall wirst du nicht einmal ein würdiger Gegner für mich sein!
--------------
15 * NEU * DIA_Addon_Raven_Add_15_06 // Mir reichts jetzt. Lass uns anfangen...
10 * NEU * DIA_Addon_Raven_Add_10_12 // (höhnt) Hast du es so eilig zu sterben? Ganz, wie du willst...
--------------

*/
