// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Richter_EXIT(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 999;
	condition		= DIA_Richter_EXIT_Condition;
	information		= DIA_Richter_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Richter_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Richter_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Richter_Hello(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 4;
	condition		= DIA_Richter_Hello_Condition;
	information		= DIA_Richter_Hello_Info;
	description		= "你 在 这 里 做 什 么?";
};

func int DIA_Richter_Hello_Condition()
{
	if (MIS_Lee_JudgeRichter == 0)
	{
		return TRUE;
	};
};

func void DIA_Richter_Hello_Info()
{
	AI_Output(other, self, "DIA_Richter_Hello_15_00"); //你 在 这 里 做 什 么?
	AI_Output(self, other, "DIA_Richter_Hello_10_01"); //你 找 我 干 什 么 ？ 你 究 竟 是 谁 ？。
	AI_Output(other, self, "DIA_Richter_Hello_15_02"); //我 ， 嗯 … …
	AI_Output(self, other, "DIA_Richter_Hello_10_03"); //说 ， 我 是 不 是 在 哪 里 见 过 你 ？

	Info_ClearChoices(DIA_Richter_Hello);
	Info_AddChoice(DIA_Richter_Hello, "我 记 得 不 是 那 样 。", DIA_Richter_Hello_DontThinkSo);
	Info_AddChoice(DIA_Richter_Hello, "也 许 吧 。", DIA_Richter_Hello_MayBe);
};

func void DIA_Richter_Hello_DontThinkSo()
{
	AI_Output(other, self, "DIA_Richter_Hello_DontThinkSo_15_00"); //我 记 得 不 是 那 样 。
	AI_Output(self, other, "DIA_Richter_Hello_DontThinkSo_10_01"); //这 很 可 笑 。 我 可 以 发 誓 ， 我 以 前 见 过 你 。
	AI_Output(self, other, "DIA_Richter_Hello_DontThinkSo_10_02"); //没 关 系 ， 你 显 然 是 下 等 的 人 渣 。 你 们 怎 么 看 起 来 都 一 样 。
};

func void DIA_Richter_Hello_MayBe()
{
	AI_Output(other, self, "DIA_Richter_Hello_MayBe_15_00"); //也 许 吧 。
	AI_Output(self, other, "DIA_Richter_Hello_MayBe_10_01"); //不 得 无 礼 ！ 你 究 竟 以 为 你 在 跟 谁 说 话 ？
	AI_Output(self, other, "DIA_Richter_Hello_MayBe_10_02"); //你 至 少 可 以 用 更 恰 当 的 语 气 跟 我 说 话 。
	AI_Output(self, other, "DIA_Richter_Hello_MayBe_10_03"); //现 在 马 上 从 我 的 视 线 里 消 失 ！

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   Perm
// ************************************************************
instance DIA_Richter_Perm(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 800;
	condition		= DIA_Richter_Perm_Condition;
	information		= DIA_Richter_Perm_Info;
	permanent		= TRUE;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Richter_Perm_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter == LOG_RUNNING))
	&& (SCIstRichtersLakai == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Richter_Perm_Info()
{
	AI_Output(other, self, "DIA_Richter_Perm_15_00"); //怎 么 样 了 ？

	if ((MIS_Lee_JudgeRichter == LOG_RUNNING)
	&& ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self, other, "DIA_Richter_Perm_10_01"); //你 最 好 滚 开 ， 你 这 个 肮 脏 的 雇 佣 兵 ， 在 我 叫 卫 兵 之 前 。
		AI_Output(other, self, "DIA_Richter_Perm_15_02"); //放 松 点 。 我 不 是 到 这 里 来 偷 你 的 东 西 的 。 我 是 来 找 工 作 的 。
		AI_Output(self, other, "DIA_Richter_Perm_10_03"); //啊 。 那 么 你 想 为 我 工 作 。 嗯 ， 当 然 ， 这 是 另 一 回 事 了 。
		AI_Output(self, other, "DIA_Richter_Perm_10_04"); //唉 ， 有 一 个 小 问 题 。 我 不 知 道 是 否 可 以 信 任 你 。 你 必 须 先 证 明 你 的 忠 诚 。
		SCIstRichtersLakai = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Richter_Perm_10_05"); //我 没 有 对 你 说 清 楚 我 不 想 跟 你 有 任 何 联 系 吗 ？
		AI_Output(other, self, "DIA_Richter_Perm_15_06"); //不 ， 不 清 楚 。
		AI_Output(self, other, "DIA_Richter_Perm_10_07"); //那 么 ， 我 非 常 希 望 你 已 经 弄 清 楚 了 。
	};
};

// ************************************************************
// 			  				   RichtersLakai
// ************************************************************
instance DIA_Richter_RichtersLakai(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_RichtersLakai_Condition;
	information		= DIA_Richter_RichtersLakai_Info;
	description		= "给 我 安 排 测 试 。";
};

func int DIA_Richter_RichtersLakai_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Richter_Hello)) || (MIS_Lee_JudgeRichter != 0))
	&& (SCIstRichtersLakai == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Richter_RichtersLakai_Info()
{
	AI_Output(other, self, "DIA_Richter_RichtersLakai_15_00"); //给 我 安 排 测 试 。
	AI_Output(self, other, "DIA_Richter_RichtersLakai_10_01"); //嗯 。 好 吧 。 听 着 。 把 火 魔 法 师 的 圣 锤 带 给 我 。 他 们 把 它 保 存 在 修 道 院 的 地 下 室 里 面 了 。
	AI_Output(self, other, "DIA_Richter_RichtersLakai_10_02"); //如 果 你 完 成 了 这 件 事 ， 我 也 许 会 考 虑 雇 佣 你 当 我 的 保 镖 。

	Info_ClearChoices(DIA_Richter_RichtersLakai);
	Info_AddChoice(DIA_Richter_RichtersLakai, "要 我 从 魔 法 师 那 里 偷 东 西 ？ 你 疯 了 吗。", DIA_Richter_RichtersLakai_nein);
	Info_AddChoice(DIA_Richter_RichtersLakai, "好 吧 。", DIA_Richter_RichtersLakai_ja);

	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_4);

	MIS_Richter_BringHolyHammer = LOG_RUNNING;
};

func void DIA_Richter_RichtersLakai_nein()
{
	AI_Output(other, self, "DIA_Richter_RichtersLakai_nein_15_00"); //要 我 从 魔 法 师 那 里 偷 东 西 ？ 你 疯 了 吗 ？。
	AI_Output(self, other, "DIA_Richter_RichtersLakai_nein_10_01"); //那 就 滚 蛋 ， 别 浪 费 我 的 时 间 。
	AI_StopProcessInfos(self);
};

func void DIA_Richter_RichtersLakai_ja()
{
	AI_Output(other, self, "DIA_Richter_RichtersLakai_ja_15_00"); //好 吧 。
	AI_Output(self, other, "DIA_Richter_RichtersLakai_ja_10_01"); //好 的 。 但 是 记 住 - 如 果 他 们 抓 到 你 ， 我 可 从 来 没 听 说 过 你 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				   KillMorgahard
// ************************************************************
instance DIA_Richter_KillMorgahard(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_KillMorgahard_Condition;
	information		= DIA_Richter_KillMorgahard_Info;
	description		= "这 是 魔 法 师 的 神 圣 之 锤 。";
};

func int DIA_Richter_KillMorgahard_Condition()
{
	if ((Npc_HasItems(other, Holy_Hammer_MIS))
	&& (MIS_Richter_BringHolyHammer == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Richter_KillMorgahard_Info()
{
	AI_Output(other, self, "DIA_Richter_KillMorgahard_15_00"); //这 是 魔 法 师 的 神 圣 之 锤 。
	B_GiveInvItems(other, self, Holy_Hammer_MIS, 1);
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_01"); //我 真 很 激 动 。 你 确 实 是 认 真 的 ， 是 吗 ？ 这 是 你 的 报 酬 。
	CreateInvItems(self, ItMi_Gold, 300);
	B_GiveInvItems(self, other, ItMi_Gold, 300);
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_02"); //好 的 。 如 果 事 情 是 这 样 ， 我 已 经 有 另 一 个 任 务 交 给 你 了 。
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_03"); //前 些 天 ， 几 个 囚 犯 从 本 地 的 监 狱 里 逃 走 了 。
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_04"); //那 些 狗 混 蛋 已 经 往 山 里 去 了 。 往 艾 克 萨 达 斯 的 新 塔 那 个 方 向 。
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_05"); //他 们 的 头 儿 叫 默 加 哈 德 。 我 想 要 你 杀 了 他 。
	AI_Output(self, other, "DIA_Richter_KillMorgahard_10_06"); //快 点 出 发 ， 趁 他 们 远 走 高 飞 之 前 。

	Wld_InsertNpc(BDT_1030_Morgahard, "REICH");
	Wld_InsertNpc(BDT_1031_Fluechtling, "REICH");
	Wld_InsertNpc(BDT_1032_Fluechtling, "REICH");
	Wld_InsertNpc(BDT_1033_Fluechtling, "REICH");
	Wld_InsertNpc(BDT_1034_Fluechtling, "REICH");
	Wld_InsertNpc(BDT_1035_Fluechtling, "REICH");

	B_InitNpcGlobals();

	B_GivePlayerXP(XP_BringHolyHammer);
	MIS_Richter_BringHolyHammer = LOG_SUCCESS;
	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_5);
	MIS_Richter_KillMorgahard = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  KilledMorgahard
// ************************************************************
instance DIA_Richter_KilledMorgahard(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_KilledMorgahard_Condition;
	information		= DIA_Richter_KilledMorgahard_Info;
	description		= "默 加 哈 德 已 经 死 了 。";
};

func int DIA_Richter_KilledMorgahard_Condition()
{
	if ((Npc_IsDead(Morgahard))
	&& (MIS_Richter_KillMorgahard == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahard_Info()
{
	AI_Output(other, self, "DIA_Richter_KilledMorgahard_15_00"); //默 加 哈 德 已 经 死 了 。
	AI_Output(self, other, "DIA_Richter_KilledMorgahard_10_01"); //啊 。 你 是 一 个 不 错 的 小 伙 子 。 这 是 你 的 报 酬 。
	CreateInvItems(self, ItMi_Gold, 400);
	B_GiveInvItems(self, other, ItMi_Gold, 400);
	B_GivePlayerXP(XP_KillMorgahard);
	B_LogEntry(TOPIC_RichterLakai, TOPIC_RichterLakai_6);
	MIS_Richter_KillMorgahard = LOG_SUCCESS;
};

// ************************************************************
// 	  KilledMorgahardPERM
// ************************************************************
instance DIA_Richter_KilledMorgahardPERM(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_KilledMorgahardPERM_Condition;
	information		= DIA_Richter_KilledMorgahardPERM_Info;
	permanent		= TRUE;
	description		= "我 能 帮 你 做 什 么 事 情 吗 ？";
};

func int DIA_Richter_KilledMorgahardPERM_Condition()
{
	if ((MIS_Richter_KillMorgahard == LOG_SUCCESS)
	&& (MIS_RichtersPermissionForShip == 0))
	{
		return TRUE;
	};
};

func void DIA_Richter_KilledMorgahardPERM_Info()
{
	AI_Output(other, self, "DIA_Richter_KilledMorgahardPERM_15_00"); //我 能 帮 你 做 什 么 事 情 吗 ？
	AI_Output(self, other, "DIA_Richter_KilledMorgahardPERM_10_01"); //现 在 不 行 。 以 后 吧 。
};

// ************************************************************
// 		 PermissionForShip
// ************************************************************
instance DIA_Richter_PermissionForShip(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_PermissionForShip_Condition;
	information		= DIA_Richter_PermissionForShip_Info;
	description		= "给 我 登 上 圣 骑 士 船 只 的 书 面 许 可 。";
};

func int DIA_Richter_PermissionForShip_Condition()
{
	if (MIS_RichtersPermissionForShip == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Richter_PermissionForShip_Info()
{
	AI_Output(other, self, "DIA_Richter_PermissionForShip_15_00"); //给 我 登 上 圣 骑 士 船 只 的 书 面 许 可 。
	AI_Output(self, other, "DIA_Richter_PermissionForShip_10_01"); //（ 大 笑 ） 你 一 定 疯 了 。 你 想 要 我 做 些 什 么 ？
	AI_Output(other, self, "DIA_Richter_PermissionForShip_15_02"); //你 听 说 过 我 是 吧 。 给 我 授 权 ， 否 则 我 会 把 你 交 给 那 些 民 兵 。
	AI_Output(self, other, "DIA_Richter_PermissionForShip_10_03"); //（ 怒 吼 ） 我 不 会 接 受 勒 索 的 。 尤 其 是 你 ！ 我 会 把 你 喂 狼 ， 你 这 个 可 怜 的 垃 圾 。
	AI_Output(other, self, "DIA_Richter_PermissionForShip_15_04"); //默 加 哈 德 是 听 了 你 的 命 令 去 攻 击 总 督 的 。 我 有 一 份 文 档 可 以 证 明 它 。
	AI_Output(self, other, "DIA_Richter_PermissionForShip_10_05"); //（ 怒 吼 ） 啊 。
	AI_Output(self, other, "DIA_Richter_PermissionForShip_10_06"); //你 会 为 此 而 难 过 的 。 没 有 人 能 勒 索 我 并 逃 脱 处 罚 的 。
	AI_Output(self, other, "DIA_Richter_PermissionForShip_10_07"); //这 是 你 的 授 权 。 马 上 离 开 。 我 以 后 再 收 拾 你 。
	CreateInvItems(self, ItWr_ForgedShipLetter_Mis, 1);
	B_GiveInvItems(self, other, ItWr_ForgedShipLetter_Mis, 1);
	B_LogEntry(TOPIC_Ship, TOPIC_Ship_4);
	MIS_RichtersPermissionForShip = LOG_SUCCESS;
	B_GivePlayerXP(XP_RichtersPermissionForShip);
};

// ************************************************************
// 		 perm2
// ************************************************************
instance DIA_Richter_perm2(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 2;
	condition		= DIA_Richter_perm2_Condition;
	information		= DIA_Richter_perm2_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Richter_perm2_Condition()
{
	if ((MIS_RichtersPermissionForShip == LOG_SUCCESS)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Richter_perm2_Info()
{
	AI_Output(self, other, "DIA_Richter_perm2_10_00"); //从 我 的 视 线 里 消 失 。
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Richter_PICKPOCKET(C_INFO)
{
	npc				= Vlk_402_Richter;
	nr				= 900;
	condition		= DIA_Richter_PICKPOCKET_Condition;
	information		= DIA_Richter_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钥 匙 应 该 很 容 易 ）";
};

func int DIA_Richter_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Richter) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Richter_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
	Info_AddChoice(DIA_Richter_PICKPOCKET, DIALOG_BACK, DIA_Richter_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Richter_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Richter_PICKPOCKET_DoIt);
};

func void DIA_Richter_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItKe_Richter, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Richter_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1);
	};
};

func void DIA_Richter_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Richter_PICKPOCKET);
};
