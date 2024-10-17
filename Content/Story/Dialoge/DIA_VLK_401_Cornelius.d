//*********************************************************************
//	Info EXIT
//********************************************************************
instance DIA_Cornelius_Exit(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 999;
	condition		= DIA_Cornelius_Exit_Condition;
	information		= DIA_Cornelius_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Cornelius_Exit_Condition()
{
	return TRUE;
};

func void DIA_Cornelius_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// ############################
// ## ##
// ## Kapitel 3 ##
// ## ##
// ############################

//*********************************************************************
//	SeeMurder
//********************************************************************
instance DIA_Cornelius_SeeMurder(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 4;
	condition		= DIA_Cornelius_SeeMurder_Condition;
	information		= DIA_Cornelius_SeeMurder_Info;
	description		= "你 看 到 了 对 洛 萨 行 凶 的 那 个 人 ， 是 吗 ？";
};

func int DIA_Cornelius_SeeMurder_Condition()
{
	if (RecueBennet_KnowsCornelius == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_SeeMurder_Info()
{
	AI_Output(other, self, "DIA_Cornelius_SeeMurder_15_00"); //你 看 到 了 对 洛 萨 行 凶 的 那 个 人 ， 是 吗 ？
	AI_Output(self, other, "DIA_Cornelius_SeeMurder_13_01"); //（ 不 安 的 ） 关 于 正 在 进 行 的 调 查 的 任 何 问 题 ， 我 不 能 作 出 回 答 。
	AI_Output(self, other, "DIA_Cornelius_SeeMurder_13_02"); //哈 根 勋 爵 把 我 知 道 的 所 有 事 情 都 记 录 在 案 了 。
};

//*********************************************************************
//	Was hast du gesehen?
//********************************************************************
instance DIA_Cornelius_WhatYouSee(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 5;
	condition		= DIA_Cornelius_WhatYouSee_Condition;
	information		= DIA_Cornelius_WhatYouSee_Info;
	description		= "你 看 到 了 什 么 ？";
};

func int DIA_Cornelius_WhatYouSee_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cornelius_SeeMurder))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_WhatYouSee_Info()
{
	AI_Output(other, self, "DIA_Cornelius_WhatYouSee_15_00"); //你 看 到 了 什 么 ？
	AI_Output(self, other, "DIA_Cornelius_WhatYouSee_13_01"); //（ 忙 乱 的 ） 真 的 ， 我 现 在 一 点 时 间 都 没 有 。
	AI_Output(self, other, "DIA_Cornelius_WhatYouSee_13_02"); //（ 忙 乱 的 ） 你 现 在 必 须 走 ， 办 公 室 关 闭 了 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_6);

	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Jetzt reicht es! Was hast du gesehen?
//********************************************************************
instance DIA_Cornelius_Enough(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 6;
	condition		= DIA_Cornelius_Enough_Condition;
	information		= DIA_Cornelius_Enough_Info;
	description		= "已 经 够 了 ！ 你 看 到 了 什 么 ？";
};

func int DIA_Cornelius_Enough_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cornelius_WhatYouSee))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Enough_Info()
{
	AI_Output(other, self, "DIA_Cornelius_Enough_15_00"); //已 经 够 了 ！ 你 看 到 了 什 么 ？
	AI_Output(self, other, "DIA_Cornelius_Enough_13_01"); //（ 不 安 的 ） 我 … … 我 看 见 那 个 雇 佣 兵 是 怎 么 从 后 面 打 倒 了 那 个 圣 骑 士 。
	AI_Output(self, other, "DIA_Cornelius_Enough_13_02"); //（ 不 安 的 ） 然 后 ， 他 拿 了 他 的 剑 ， 并 刺 穿 了 他 的 胸 口 。
	AI_Output(other, self, "DIA_Cornelius_Enough_15_03"); //你 完 全 肯 定 吗 ？
	AI_Output(self, other, "DIA_Cornelius_Enough_13_04"); //（ 恐 惧 的 ） 是 的 ， 当 然 。 我 亲 眼 见 到 的 。
	AI_Output(self, other, "DIA_Cornelius_Enough_13_05"); //（ 恐 惧 的 ） 但 是 ， 我 现 在 真 的 一 点 时 间 都 没 有 ， 我 还 有 一 大 堆 的 文 档 要 处 理 。

	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Ich glaube dir nicht.
//********************************************************************
instance DIA_Cornelius_DontBelieveYou(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 4;
	condition		= DIA_Cornelius_DontBelieveYou_Condition;
	information		= DIA_Cornelius_DontBelieveYou_Info;
	permanent		= TRUE;
	description		= "我 不 相 信 你 。";
};

func int DIA_Cornelius_DontBelieveYou_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Cornelius_Enough)
	&& Cornelius_TellTruth != TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_DontBelieveYou_Info()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_15_00"); //我 不 相 信 你 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_13_01"); //（ 假 装 自 信 ） 那 怎 么 样 ， 你 们 打 算 怎 么 处 理 这 件 事 ？

	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
	// hier fehlt noch Taschendiebstahl
	Info_AddChoice(DIA_Cornelius_DontBelieveYou, "你 要 问 什 么 ？", DIA_Cornelius_DontBelieveYou_WhatYouWant);
	Info_AddChoice(DIA_Cornelius_DontBelieveYou, "你 很 在 意 你 的 性 命 ， 是 吗 ？", DIA_Cornelius_DontBelieveYou_WantSurvive);

	if (hero.guild == GIL_KDF)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, "他 们 可 以 在 修 道 院 里 让 你 开 口 。", DIA_Cornelius_DontBelieveYou_Monastery);
	};

	if (hero.guild == GIL_SLD)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, "我 可 以 告 诉 雇 佣 兵 你 藏 在 哪 里 。 ", DIA_Cornelius_DontBelieveYou_KnowYourHome);
	};

	if (hero.guild == GIL_MIL)
	{
		Info_AddChoice(DIA_Cornelius_DontBelieveYou, "作 伪 证 会 让 你 进 监 狱 - 很 长 时 间 ！", DIA_Cornelius_DontBelieveYou_Perjury);
	};
};

func void DIA_Cornelius_DontBelieveYou_WhatYouWant()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00"); //你 想 要 什 么 ？
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01"); //（ 傲 慢 无 礼 的 ） 你 连 足 够 付 给 我 的 钱 都 没 有 。
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02"); //多 少 钱 ？
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03"); //2000个 金 币 。 嗯 ， 那 会 让 我 重 新 考 虑 这 件 事 。

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_7);

	Cornelius_PayForProof = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_WantSurvive()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_WantSurvive_15_00"); //你 很 在 意 你 的 性 命 ， 是 吗 ？
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_WantSurvive_13_01"); //（ 恐 惧 的 ） 如 果 你 攻 击 我 ， 他 们 会 把 你 绞 死 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_WantSurvive_13_02"); //我 有 很 多 有 权 有 势 的 朋 友 。 所 以 ， 你 别 想 碰 我 一 根 手 指 头 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_WantSurvive_13_03"); //马 上 滚 出 去 ！ 否 则 我 就 叫 守 卫 来 了 ！

	AI_StopProcessInfos(self);
};

func void DIA_Cornelius_DontBelieveYou_Monastery()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_Monastery_15_00"); //他 们 可 以 在 修 道 院 里 让 你 开 口 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_Monastery_13_01"); //（ 面 如 死 灰 ） 你 这 是 什 么 意 思 ？
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_Monastery_15_02"); //嗯 ， 我 们 有 办 法 揭 露 真 相 。 痛 苦 的 办 法 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_Monastery_13_03"); //不 ， 请 别 这 样 。 我 会 告 诉 你 所 有 你 想 知 道 的 事 情 。

	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_KnowYourHome()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00"); //我 可 以 告 诉 雇 佣 兵 你 藏 在 哪 里 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01"); //（ 面 如 死 灰 ） 那 是 什 么 意 思 ？
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02"); //我 敢 打 赌 他 们 非 常 想 认 识 你 。 他 们 一 点 也 不 开 心 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03"); //你 不 能 那 么 做 ， 他 们 会 杀 了 我 。
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04"); //那 非 常 有 可 能 。
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05"); //我 会 说 任 何 你 要 我 说 的 ， 但 是 ， 你 一 定 不 要 那 样 做 。

	Cornelius_TellTruth = TRUE;
	Info_ClearChoices(DIA_Cornelius_DontBelieveYou);
};

func void DIA_Cornelius_DontBelieveYou_Perjury()
{
	AI_Output(other, self, "DIA_Cornelius_DontBelieveYou_Perjury_15_00"); //作 伪 证 会 让 你 进 监 狱 - 很 长 时 间 ！
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_Perjury_13_01"); //你 想 威 胁 我 ？ 一 个 小 小 的 守 卫 也 来 威 胁 我 - 总 督 的 秘 书 ？
	AI_Output(self, other, "DIA_Cornelius_DontBelieveYou_Perjury_13_02"); //如 果 你 不 马 上 消 失 ， 我 保 证 会 降 你 的 级 。

	Cornelius_ThreatenByMilSC = TRUE;

	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Hier ist das Geld
//********************************************************************
instance DIA_Cornelius_PayCornelius(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 4;
	condition		= DIA_Cornelius_PayCornelius_Condition;
	information		= DIA_Cornelius_PayCornelius_Info;
	permanent		= TRUE;
	description		= "这 是 金 币 。";
};

func int DIA_Cornelius_PayCornelius_Condition()
{
	if (Cornelius_PayForProof == TRUE
	&& (Npc_HasItems(other, ItMi_Gold) >= 2000))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PayCornelius_Info()
{
	AI_Output(other, self, "DIA_Cornelius_PayCornelius_15_00"); //这 是 金 币 。

	B_GiveInvItems(other, self, ItMi_Gold, 2000);

	AI_Output(self, other, "DIA_Cornelius_PayCornelius_13_01"); //如 果 我 不 问 你 是 从 哪 里 弄 到 它 的 会 更 好 。
	AI_Output(self, other, "DIA_Cornelius_PayCornelius_13_02"); //老 实 说 ， 我 并 不 真 的 在 乎 。
	AI_Output(self, other, "DIA_Cornelius_PayCornelius_13_03"); //但 是 ， 我 们 在 做 交 易 。

	Cornelius_TellTruth = TRUE;
};

//*********************************************************************
//	Was ist wirklich passiert?
//********************************************************************
instance DIA_Cornelius_RealStory(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 4;
	condition		= DIA_Cornelius_RealStory_Condition;
	information		= DIA_Cornelius_RealStory_Info;
	permanent		= TRUE;
	description		= "那 么 究 竟 发 生 了 什 么 事 ？";
};

func int DIA_Cornelius_RealStory_Condition()
{
	if (Cornelius_TellTruth == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cornelius_RealStory_Info()
{
	AI_Output(other, self, "DIA_Cornelius_RealStory_15_00"); //那 么 究 竟 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Cornelius_RealStory_13_01"); //我 没 有 看 见 发 生 了 什 么 事 。 我 收 了 别 人 的 钱 ， 替 人 栽 赃 那 个 雇 佣 兵 。
	AI_Output(self, other, "DIA_Cornelius_RealStory_13_02"); //在 这 样 的 时 候 ， 人 人 都 为 自 己 着 想 。 我 需 要 那 些 钱 。
	AI_Output(other, self, "DIA_Cornelius_RealStory_15_03"); //谁 给 你 的 钱 ？
	AI_Output(self, other, "DIA_Cornelius_RealStory_13_04"); //那 就 算 了 。 如 果 我 供 出 他 ， 他 会 杀 了 我 。
	AI_Output(other, self, "DIA_Cornelius_RealStory_15_05"); //你 准 备 把 这 些 事 也 告 诉 哈 根 勋 爵 吗 ？
	AI_Output(self, other, "DIA_Cornelius_RealStory_13_06"); //我 不 是 个 疯 子 。 我 现 在 不 能 再 在 城 里 呆 着 了 。

	if (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	{
		AI_Output(self, other, "DIA_Cornelius_RealStory_13_07"); //我 会 给 你 我 的 日 记 ， 那 就 足 以 证 明 了 。
		B_GiveInvItems(self, other, ItWr_CorneliusTagebuch_Mis, 1);
	};

	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_8);

	CorneliusFlee = TRUE;

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FLEE");
};

//*********************************************************************
//	Auf der Flucht
//********************************************************************
instance DIA_Cornelius_Fleeing(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 1;
	condition		= DIA_Cornelius_Fleeing_Condition;
	information		= DIA_Cornelius_Fleeing_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Cornelius_Fleeing_Condition()
{
	if ((CorneliusFlee == TRUE)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_Fleeing_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Cornelius_PICKPOCKET(C_INFO)
{
	npc				= VLK_401_Cornelius;
	nr				= 900;
	condition		= DIA_Cornelius_PICKPOCKET_Condition;
	information		= DIA_Cornelius_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 书 很 危 险 ）";
};

func int DIA_Cornelius_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItWr_CorneliusTagebuch_Mis) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (60 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Cornelius_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET, DIALOG_BACK, DIA_Cornelius_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Cornelius_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Cornelius_PICKPOCKET_DoIt);
};

func void DIA_Cornelius_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 60)
	{
		B_GiveInvItems(self, other, ItWr_CorneliusTagebuch_Mis, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Cornelius_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Cornelius_PICKPOCKET);
};
