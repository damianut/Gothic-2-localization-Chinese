///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_EXIT(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 999;
	condition		= DIA_Garvell_EXIT_Condition;
	information		= DIA_Garvell_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garvell_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garvell_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Garvell_PICKPOCKET(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 900;
	condition		= DIA_Garvell_PICKPOCKET_Condition;
	information		= DIA_Garvell_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 他 的 钱 包 就 像 小 孩 做 游 戏 一 样 。 ）";
};

func int DIA_Garvell_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItSe_GoldPocket25) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (10 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Garvell_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	Info_AddChoice(DIA_Garvell_PICKPOCKET, DIALOG_BACK, DIA_Garvell_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garvell_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Garvell_PICKPOCKET_DoIt);
};

func void DIA_Garvell_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 10)
	{
		B_GiveInvItems(self, other, ItSe_GoldPocket25, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Garvell_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Garvell_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garvell_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_GREET(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 2;
	condition		= DIA_Garvell_GREET_Condition;
	information		= DIA_Garvell_GREET_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Garvell_GREET_Condition()
{
	if (Wld_IsTime(05, 00, 19, 00))
	{
		return TRUE;
	};
};

func void DIA_Garvell_GREET_Info()
{
	AI_Output(other, self, "DIA_Garvell_GREET_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Garvell_GREET_04_01"); //我 在 造 一 艘 船 ， 因 为 我 想 离 开 这 里 - 以 我 最 快 的 速 度 。
	AI_Output(self, other, "DIA_Garvell_GREET_04_02"); //不 过 现 在 看 来 ， 这 艘 船 永 远 都 做 不 好 。
};

///////////////////////////////////////////////////////////////////////
//	Info eilig
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_eilig(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 2;
	condition		= DIA_Garvell_eilig_Condition;
	information		= DIA_Garvell_eilig_Info;
	description		= "你 怎 么 这 么 忙 ？";
};

func int DIA_Garvell_eilig_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_eilig_Info()
{
	AI_Output(other, self, "DIA_Garvell_eilig_15_00"); //你 怎 么 这 么 忙 ？
	AI_Output(self, other, "DIA_Garvell_eilig_04_01"); //很 快 兽 人 就 会 来 烧 毁 整 座 城 市 了 。
	AI_Output(other, self, "DIA_Garvell_eilig_15_02"); //你 为 什 么 会 那 么 想 ？
	AI_Output(self, other, "DIA_Garvell_eilig_04_03"); //小 子 ， 你 注 意 到 那 些 圣 骑 士 无 处 不 在 吗 ？ 你 认 为 他 们 为 什 么 会 在 这 里 ？
	AI_Output(self, other, "DIA_Garvell_eilig_04_04"); //我 告 诉 你 ， 因 为 兽 人 马 上 就 要 进 攻 了 ， 他 们 才 会 在 这 里 。 而 那 绝 不 会 是 好 事 。
};

///////////////////////////////////////////////////////////////////////
//	Info Schiff
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Schiff(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 99;
	condition		= DIA_Garvell_Schiff_Condition;
	information		= DIA_Garvell_Schiff_Info;
	description		= "为 什 么 你 不 能 造 好 你 的 船 ？";
};

func int DIA_Garvell_Schiff_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garvell_GREET))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Schiff_Info()
{
	AI_Output(other, self, "DIA_Garvell_Schiff_15_00"); //为 什 么 你 不 能 造 好 你 的 船 ？
	AI_Output(self, other, "DIA_Garvell_Schiff_04_01"); //（ 蔑 视 的 ） 哦 ， 我 们 有 无 数 的 问 题 。 船 体 还 不 稳 定 ， 而 且 还 缺 很 多 甲 板 。
	AI_Output(self, other, "DIA_Garvell_Schiff_04_02"); //但 是 ， 我 没 有 钱 买 新 材 料 了 ， 而 且 上 一 批 货 里 面 还 有 问 题 。
	AI_Output(self, other, "DIA_Garvell_Schiff_04_03"); //我 的 人 没 有 什 么 工 作 效 率 。 有 人 只 想 造 出 一 艘 快 船 ， 别 的 都 不 管 ； 而 另 一 些 则 在 担 心 船 首 像 ！
	AI_Output(self, other, "DIA_Garvell_Schiff_04_04"); //好 像 我 们 没 有 更 重 要 的 事 情 要 做 ！
	AI_Output(self, other, "DIA_Addon_Garvell_Schiff_04_00"); //还 有 ， 我 的 一 个 工 人 没 有 来 做 事 了 。 我 现 在 正 在 担 心 这 会 更 加 延 迟 建 造 进 度 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Garvell_MissingPeople(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 5;
	condition		= DIA_Addon_Garvell_MissingPeople_Condition;
	information		= DIA_Addon_Garvell_MissingPeople_Info;
	description		= "你 少了 一 个 工 人 ？";
};

func int DIA_Addon_Garvell_MissingPeople_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garvell_Schiff)
	&& (SC_HearedAboutMissingPeople == TRUE)
	&& (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Garvell_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Garvell_MissingPeople_15_00"); //你 少 了 一 个 工 人 ？
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_04_01"); //是 的 。 他 叫 蒙 蒂 。 他 凭 空 消 失 了 。
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_04_02"); //那 头 懒 猪 可 能 在 哪 个 农 场 里 享 受 他 的 上 流 生 活 。 我 真 不 该 提 前 付 给 他 钱 。

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, TOPIC_Addon_MissingPeople_1);

	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
	Info_AddChoice(DIA_Addon_Garvell_MissingPeople, "我 听 说 其 它 人 也 失 踪 了 。", DIA_Addon_Garvell_MissingPeople_more);
	if (SCKnowsFarimAsWilliamsFriend == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople, "你 上 次 见 到 蒙 蒂 是 什 么 时 候 ？", DIA_Addon_Garvell_MissingPeople_wo);
	};
};

func void DIA_Addon_Garvell_MissingPeople_more()
{
	AI_Output(other, self, "DIA_Addon_Garvell_MissingPeople_more_15_00"); //我 听 说 其 它 人 也 失 踪 了 。
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_01"); //这 就 是 我 要 说 的 。 这 就 是 我 怕 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_02"); //渔 夫 法 瑞 姆 告 诉 过 我 一 些 类 似 的 事 情 。 他 的 朋 友 威 廉 不 见 了 。
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_more_04_03"); //我 打 赌 这 一 切 都 是 那 些 兽 人 在 捣 鬼。
	SCKnowsFarimAsWilliamsFriend = TRUE;

	Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_1);

	Log_CreateTopic(TOPIC_Addon_MissingPeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_MissingPeople, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_MissingPeople, LogText_Addon_WilliamMissing);

	Info_AddChoice(DIA_Addon_Garvell_MissingPeople, DIALOG_BACK, DIA_Addon_Garvell_MissingPeople_BACK);

	if (Farim.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Garvell_MissingPeople, "我 在 哪 里 能 找 到 这 个 法 瑞 姆 ？", DIA_Addon_Garvell_MissingPeople_Farim);
	};
};

func void DIA_Addon_Garvell_MissingPeople_BACK()
{
	Info_ClearChoices(DIA_Addon_Garvell_MissingPeople);
};

func void DIA_Addon_Garvell_MissingPeople_Farim()
{
	AI_Output(other, self, "DIA_Addon_Garvell_MissingPeople_Farim_15_00"); //我 在 哪 里 能 找 到 这 个 法 瑞 姆 ？
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_Farim_04_01"); //他 是 个 渔 夫 。 我 想 他 的 小 屋 应 该 在 圣 骑 士 的 供 应 品 仓 库 附 近 。 但 是 我 不 敢 肯 定 。

	B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_2);
};

func void DIA_Addon_Garvell_MissingPeople_wo()
{
	AI_Output(other, self, "DIA_Addon_Garvell_MissingPeople_wo_15_00"); //你 上 次 见 到 蒙 蒂 是 什 么 时 候 ？
	AI_Output(self, other, "DIA_Addon_Garvell_MissingPeople_wo_04_01"); //（ 生 气 的 ） 他 已 经 至 少 两 天 没 有 出 来 工 作 了 。
};

///////////////////////////////////////////////////////////////////////
//	Info ReturnMonty
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_ReturnMonty(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 99;
	condition		= DIA_Garvell_ReturnMonty_Condition;
	information		= DIA_Garvell_ReturnMonty_Info;
	description		= "那 么 现 在 情 况 如 何 ？";
};

func int DIA_Garvell_ReturnMonty_Condition()
{
	if ((Npc_GetDistToWP(Monty_NW, "NW_CITY_HABOUR_WERFT_IN_01") <= 1000)
	&& (MissingPeopleReturnedHome == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_ReturnMonty_Info()
{
	AI_Output(other, self, "DIA_Addon_Garvell_ReturnMonty_15_00"); //那 么 现 在 情 况 如 何 ？
	AI_Output(self, other, "DIA_Addon_Garvell_ReturnMonty_04_01"); //蒙 蒂 回 来 了 ！ 他 正 忙 于 研 究 这 些 设 计 图 。
	AI_Output(self, other, "DIA_Addon_Garvell_ReturnMonty_04_02"); //也 许 我 们 现 在 就 能 造 好 这 艘 船 了 … …
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MISSION
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_MISSION(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 2;
	condition		= DIA_Garvell_MISSION_Condition;
	information		= DIA_Garvell_MISSION_Info;
	description		= "我 有 什 么 办 法 帮 助 你 ？";
};

func int DIA_Garvell_MISSION_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garvell_eilig)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Garvell_MISSION_Info()
{
	AI_Output(other, self, "DIA_Garvell_MISSION_15_00"); //我 能 帮 你 什 么 吗 ？
	AI_Output(self, other, "DIA_Garvell_MISSION_04_01"); //是 的 ， 你 可 以 。 去 察 探 那 些 圣 骑 士 正 在 计 划 干 什 么 。 我 想 知 道 他 们 为 什 么 会 到 这 里 来 。
	AI_Output(self, other, "DIA_Garvell_MISSION_04_02"); //而 且 我 必 须 知 道 那 些 兽 人 会 不 会 进 攻 - 以 及 它 们 离 城 还 有 多 远 。
	AI_Output(self, other, "DIA_Garvell_MISSION_04_03"); //有 人 看 见 这 些 畜 生 中 的 一 个 就 在 城 外 。
	AI_Output(self, other, "DIA_Garvell_MISSION_04_04"); //把 所 有 你 能 找 到 的 信 息 都 回 来 告 诉 我 。
	AI_Output(self, other, "DIA_Garvell_Add_04_00"); //我 需 要 知 道 还 有 多 少 时 间 让 我 来 完 成 这 艘 船 。

	MIS_Garvell_Infos = LOG_RUNNING;
	Knows_Ork = TRUE;

	Log_CreateTopic(TOPIC_Garvell, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Garvell, LOG_RUNNING);
	B_LogEntry(TOPIC_Garvell, TOPIC_Garvell_1);
};

func void B_GarvellWeiter()
{
	AI_Output(self, other, "DIA_Garvell_Weiter_04_00"); //很 好 。 如 果 你 知 道 了 更 多 情 况 ， 告 诉 我 一 声 。
};

func void B_GarvellSuccess()
{
	AI_Output(self, other, "DIA_Garvell_Success_04_00"); //谢 谢 你 的 信 息 。 看 来 ， 我 们 有 充 分 的 时 间 来 建 造 我 们 的 船 只 。
	MIS_Garvell_Infos = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Orks(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 3;
	condition		= DIA_Garvell_Orks_Condition;
	information		= DIA_Garvell_Orks_Info;
	description		= "我 有 一 些 关 于 兽 人 的 信 息 。";
};

func int DIA_Garvell_Orks_Condition()
{
	if ((MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Orks_Info()
{
	AI_Output(other, self, "DIA_Garvell_Orks_15_00"); //我 有 一 些 关 于 兽 人 的 信 息 。
	AI_Output(self, other, "DIA_Garvell_Orks_04_01"); //让 我 们 听 听 。
	AI_Output(other, self, "DIA_Garvell_Orks_15_02"); //他 们 被 困 在 矿 藏 山 谷 里 面 了 ， 而 且 看 来 他 们 还 要 继 续 呆 在 那 里 。
	AI_Output(other, self, "DIA_Garvell_Orks_15_03"); //出 于 安 全 考 虑 ， 那 些 圣 骑 士 在 守 卫 那 个 关 卡 。

	Tell_Garvell = (Tell_Garvell + 1);
	B_GivePlayerXP(XP_Ambient);

	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Orks
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Paladine(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 2;
	condition		= DIA_Garvell_Paladine_Condition;
	information		= DIA_Garvell_Paladine_Info;
	description		= "我 知 道 为 什 么 圣 骑 士 会 在 这 里 。 ";
};

func int DIA_Garvell_Paladine_Condition()
{
	if ((MIS_Garvell_Infos == LOG_RUNNING)
	&& (KnowsPaladins_Ore == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Paladine_Info()
{
	AI_Output(other, self, "DIA_Garvell_Paladine_15_00"); //我 知 道 为 什 么 圣 骑 士 会 在 这 里 。
	AI_Output(self, other, "DIA_Garvell_Paladine_04_01"); //真 的 吗 ？ 告 诉 我 ！
	AI_Output(other, self, "DIA_Garvell_Paladine_15_02"); //那 些 圣 骑 士 是 来 这 里 的 矿 藏 山 谷 拿 魔 法 矿 石 的 ， 不 是 因 为 他 们 担 心 兽 人 来 袭 击 这 座 城 。
	AI_Output(other, self, "DIA_Garvell_Paladine_15_03"); //一 旦 他 们 找 到 了 矿 石 ， 他 们 就 会 返 回 大 陆 去 。

	Tell_Garvell = (Tell_Garvell + 1);
	B_GivePlayerXP(XP_Ambient);

	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Ork vor der Stadt
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_City(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 4;
	condition		= DIA_Garvell_City_Condition;
	information		= DIA_Garvell_City_Info;
	description		= "至 于 城 外 的 那 些 兽 人 … …";
};

func int DIA_Garvell_City_Condition()
{
	if ((MIS_Garvell_Infos == LOG_RUNNING)
	&& (Knows_Paladins >= 2))
	{
		return TRUE;
	};
};

func void DIA_Garvell_City_Info()
{
	AI_Output(other, self, "DIA_Garvell_City_15_00"); //至 于 城 外 的 那 些 兽 人 … …
	AI_Output(self, other, "DIA_Garvell_City_04_01"); //是 吗 … … ？
	AI_Output(other, self, "DIA_Garvell_City_15_02"); //别 担 心 他 。 城 市 守 卫 将 会 收 拾 他 。

	Tell_Garvell = (Tell_Garvell + 1);
	B_GivePlayerXP(XP_Ambient);

	if (Tell_Garvell >= 3)
	{
		B_GarvellSuccess();
	}
	else
	{
		B_GarvellWeiter();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Garvell_Perm(C_INFO)
{
	npc				= VLK_441_Garvell;
	nr				= 13;
	condition		= DIA_Garvell_Perm_Condition;
	information		= DIA_Garvell_Perm_Info;
	permanent		= TRUE;
	description		= "海 港 怎 么 样 了 ？";
};

func int DIA_Garvell_Perm_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garvell_MISSION))
	{
		return TRUE;
	};
};

func void DIA_Garvell_Perm_Info()
{
	AI_Output(other, self, "DIA_Garvell_Perm_15_00"); //海 港 怎 么 样 了 ？

	if (MIS_Garvell_Infos != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Garvell_Perm_04_01"); //兽 人 近 在 咫 尺 ， 你 还 在 问 港 口 的 事 情 ？
		AI_Output(other, self, "DIA_Garvell_Perm_15_02"); //我 只 是 想 要 … …
		AI_Output(self, other, "DIA_Garvell_Perm_04_03"); //我 们 最 大 的 问 题 是 港 口 那 里 没 有 足 够 的 船 只 供 我 们 离 开 这 里 。
		AI_Output(self, other, "DIA_Garvell_Perm_04_04"); //老 实 说 ， 那 里 只 有 一 艘 船 ， 但 是 它 是 属 于 圣 骑 士 的 。 他 们 肯 定 不 会 让 我 们 利 用 它 来 离 开 这 里 。
	}
	else
	{
		AI_Output(self, other, "DIA_Garvell_Perm_04_05"); //你 自 己 四 处 看 看 ， 这 里 没 有 发 生 任 何 事 情 。
	};
};
