// ************************************************************
// 			  					EXIT
// ************************************************************
instance DIA_Bartok_EXIT(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 999;
	condition		= DIA_Bartok_EXIT_Condition;
	information		= DIA_Bartok_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bartok_PICKPOCKET(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 900;
	condition		= DIA_Bartok_PICKPOCKET_Condition;
	information		= DIA_Bartok_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "（ 偷 走 他 的 箭 袋 应 该 很 容 易 ）";
};

func int DIA_Bartok_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItRw_Arrow) >= 40)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Bartok_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	Info_AddChoice(DIA_Bartok_PICKPOCKET, DIALOG_BACK, DIA_Bartok_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bartok_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bartok_PICKPOCKET_DoIt);
};

func void DIA_Bartok_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItRw_Arrow, 40);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Bartok_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Bartok_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bartok_PICKPOCKET);
};

// *****************************************************
//						Hallo
// *****************************************************
instance DIA_Bartok_Hallo(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 1;
	condition		= DIA_Bartok_Hallo_Condition;
	information		= DIA_Bartok_Hallo_Info;
	description		= "有 什 么 新 鲜 事 吗 ？";
};

func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other, self, "DIA_Bartok_Hello_15_00"); //情 况 怎 么 样 了 ？
	AI_Output(self, other, "DIA_Bartok_Hello_04_01"); //你 不 是 这 周 围 的 人 ， 是 吗 ？ 没 关 系 - 我 也 不 是 。
	AI_Output(other, self, "DIA_Bartok_Hello_15_02"); //你 以 前 在 哪 里 游 荡 ？
	AI_Output(self, other, "DIA_Bartok_Hello_04_03"); //在 森 林 里 ， 跟 一 些 猎 人 一 起 捕 猎 尖 嘴 鸟 和 狼 。
	AI_Output(self, other, "DIA_Bartok_Hello_04_04"); //但 是 ， 我 放 弃 了 。 现 在 是 很 危 险 的 时 期 。 很 多 流 氓 在 那 外 面 为 非 作 歹 … …
};

// *****************************************************
//						Jaeger
// *****************************************************
instance DIA_Bartok_Jaeger(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 2;
	condition		= DIA_Bartok_Jaeger_Condition;
	information		= DIA_Bartok_Jaeger_Info;
	description		= "我 在 哪 里 能 找 到 其 它 猎 人 ？";
};

func int DIA_Bartok_Jaeger_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other, self, "DIA_Bartok_Jager_15_00"); //我 在 哪 里 能 找 到 其 它 猎 人 ？
	AI_Output(self, other, "DIA_Bartok_Jager_04_01"); //我 们 在 外 面 有 个 营 地 ， 靠 近 旅 馆 ， 离 到 欧 纳 尔 的 农 场 只 有 一 半 路 程 。
	AI_Output(self, other, "DIA_Bartok_Jager_04_02"); //但 是 ， 我 不 知 道 现 在 那 个 营 地 里 还 有 没 有 人 在 。

	AI_Output(self, other, "DIA_Addon_Bartok_Jager_04_00"); //直 到 几 天 前 ， 我 们 还 有 两 个 人 在 城 里 。
	AI_Output(self, other, "DIA_Addon_Bartok_Jager_04_01"); //我 的 朋 友 卓 卡 是 个 杰 出 的 猎 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Bartok_MissingPeople(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 5;
	condition		= DIA_Addon_Bartok_MissingPeople_Condition;
	information		= DIA_Addon_Bartok_MissingPeople_Info;
	description		= "那 么 你 的 朋 友 卓 卡 现 在 在 哪 里 ？";
};

func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bartok_Jaeger))
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other, self, "DIA_Addon_Bartok_MissingPeople_15_00"); //那 么 你 的 朋 友 卓 卡 现 在 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_04_01"); //好 吧 。 这 是 个 奇 特 的 故 事 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_04_02"); //两 天 前 ， 在 科 拉 贡 的 酒 馆 里 ， 我 们 俩 个 一 起 站 在 吧 台 前 面 讨 论 捕 猎 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_04_03"); //别 问 我 后 来 发 生 了 一 些 什 么 事 。 那 时 我 只 记 得 一 点 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_04_04"); //我 模 糊 地 记 得 卓 卡 说 他 去 外 面 弄 几 根 沼 生 草 卷 烟 。 从 此 他 就 没 回 来 。

	MIS_Bartok_MissingTrokar = LOG_RUNNING;

	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople, "你 没 有 去 找 他 ？", DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople, "那 么 我 在 哪 里 能 弄 到 一 些 沼 生 草 烟 ？", DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other, self, "DIA_Addon_Bartok_MissingPeople_wo_15_00"); //人 们 都 去 哪 里 弄 沼 生 草 卷 烟 ？
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_wo_04_01"); //据 我 所 知 ， 在 港 口 的 某 个 地 方 。
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other, self, "DIA_Addon_Bartok_MissingPeople_such_15_00"); //你 没 有 去 找 他 ？
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_01"); //没 有 。 但 是 ， 我 把 这 件 事 报 告 了 民 兵 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_02"); //不 过 ， 他 们 还 没 找 到 他 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_03"); //我 希 望 他 没 有 遭 到 狼 或 者 更 厉 害 的 家 伙 的 袭 击 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_04"); //我 很 害 怕 哪 天 出 去 打 猎 时 会 绊 倒 在 他 的 尸 体 上 面 。
	AI_Output(self, other, "DIA_Addon_Bartok_MissingPeople_such_04_05"); //我 想 我 承 受 不 了 。
};

// *****************************************************
//						Bosper
// *****************************************************
instance DIA_Bartok_Bosper(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 3;
	condition		= DIA_Bartok_Bosper_Condition;
	information		= DIA_Bartok_Bosper_Info;
	description		= "伯 斯 波 说 你 以 前 为 他 工 作 … …";
};

func int DIA_Bartok_Bosper_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Bosper_Bartok))
	&& (Npc_KnowsInfo(other, DIA_Bartok_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other, self, "DIA_Bartok_Bosper_15_00"); //伯 斯 波 说 你 以 前 为 他 工 作 … …
	AI_Output(self, other, "DIA_Bartok_Bosper_04_01"); //是 的 ， 我 是 的 。 但 他 只 对 他 的 兽 皮 感 兴 趣 。
	AI_Output(self, other, "DIA_Bartok_Bosper_04_02"); //我 告 诉 了 他 外 面 变 得 多 么 危 险 。 他 没 有 真 正 听 进 去 。
	AI_Output(self, other, "DIA_Bartok_Bosper_04_03"); //嗯 ， 总 之 他 付 钱 很 多 - 我 不 能 抱 怨 这 个 。
	AI_Output(other, self, "DIA_Bartok_Bosper_15_04"); //你 能 不 能 告 诉 我 他 的 其 它 事 情 ？
	AI_Output(self, other, "DIA_Bartok_Bosper_04_05"); //（ 大 笑 ） 伯 斯 波 的 一 张 弓 最 近 被 偷 走 了 。 在 光 天 化 日 之 下 。
	AI_Output(self, other, "DIA_Bartok_Bosper_04_06"); //有 个 家 伙 从 容 地 走 进 入 了 他 的 店 铺 ， 拿 了 一 张 弓 ， 然 后 离 开 了 。
	AI_Output(self, other, "DIA_Bartok_Bosper_04_07"); //那 些 贼 变 得 越 来 越 无 耻 ！

	if (MIS_Bosper_Bogen != LOG_SUCCESS)
	{
		MIS_Bosper_Bogen = LOG_RUNNING;
	};
};

// *****************************************************
//						WannaLearn
// *****************************************************
instance DIA_Bartok_WannaLearn(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 4;
	condition		= DIA_Bartok_WannaLearn_Condition;
	information		= DIA_Bartok_WannaLearn_Info;
	description		= "你 能 教 我 有 关 狩 猎 的 技 能 吗 ？";
};

func int DIA_Bartok_WannaLearn_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other, self, "DIA_Bartok_WannaLearn_15_00"); //你 能 教 我 有 关 狩 猎 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Bartok_WannaLearn_04_01"); //我 可 以 教 你 怎 样 正 确 地 潜 行 以 及 操 作 一 张 弓 。
	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE)
	{
		AI_Output(self, other, "DIA_Bartok_WannaLearn_04_02"); //如 果 你 想 学 会 怎 样 剥 动 物 的 皮 ， 去 找 伯 斯 波 。 是 他 教 我 的 。
	};

	Bartok_TeachPlayer = TRUE;

	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_18);
};

// *****************************************************
//						TeachSneak
// *****************************************************
instance DIA_Bartok_TeachSneak(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 4;
	condition		= DIA_Bartok_TeachSneak_Condition;
	information		= DIA_Bartok_TeachSneak_Info;
	permanent		= TRUE;
	description		= B_BuildLearnString(NAME_LEARN_SNEAK, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1));
};

func int DIA_Bartok_TeachSneak_Condition()
{
	if ((Bartok_TeachPlayer == TRUE)
	&& (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other, self, "DIA_Bartok_TeachSneak_15_00"); //教 我 怎 样 潜 行 ！

	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Bartok_TeachSneak_04_01"); //好 吧 - 那 么 ， 首 先 你 必 须 确 保 正 确 地 转 移 你 的 重 心 。
		AI_Output(self, other, "DIA_Bartok_TeachSneak_04_02"); //要 想 实 现 的 话 ， 就 要 弯 着 膝 盖 并 总 是 让 脚 后 跟 先 着 地 。
		AI_Output(self, other, "DIA_Bartok_TeachSneak_04_03"); //要 确 保 总 是 让 重 心 在 站 着 的 脚 上 ， 直 到 另 一 只 脚 稳 稳 地 站 住 。
		AI_Output(self, other, "DIA_Bartok_TeachSneak_04_04"); //大 部 分 生 物 你 都 无 法 偷 偷 地 接 近 ， 除 非 他 们 睡 着 了 。 兽 类 会 闻 到 你 。
		AI_Output(self, other, "DIA_Bartok_TeachSneak_04_05"); //所 以 你 在 外 面 要 加 倍 的 小 心 。
	};
};

// *****************************************************
//						TEACH
// *****************************************************
var int Bosper_MerkeBow;
// ---------------------
instance DIA_Bartok_Teach(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 4;
	condition		= DIA_Bartok_Teach_Condition;
	information		= DIA_Bartok_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 更 好 地 使 用 弓 ！";
};

func int DIA_Bartok_Teach_Condition()
{
	if (Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other, self, "DIA_Bartok_TeachBow_15_00"); //我 想 要 更 好 地 使 用 弓 ！
	AI_Output(self, other, "DIA_Bartok_TeachBow_04_01"); //好 ， 那 么 ， 我 们 来 看 看 我 是 否 可 以 教 你 些 东 西 … …

	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];

	Info_ClearChoices(DIA_Bartok_Teach);

	Info_AddChoice(DIA_Bartok_Teach, DIALOG_BACK, DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BACK()
{
	if (other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self, other, "DIA_Bartok_TeachBow_BACK_04_00"); //你 现 在 得 找 一 个 比 我 懂 得 更 多 的 人 。
	}
	else if (Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self, other, "DIA_Bartok_TeachBow_BACK_04_01"); //好 的 ， 你 的 瞄 准 更 加 精 确 了 。
	};

	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 1, 60);

	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach, DIALOG_BACK, DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Bartok_Teach_Bow_1);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_BOW, 5, 60);

	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach, DIALOG_BACK, DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow1, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 1)), DIA_Bartok_Teach_Bow_1);
	Info_AddChoice(DIA_Bartok_Teach, B_BuildLearnString(PRINT_LearnBow5, B_GetLearnCostTalent(other, NPC_TALENT_BOW, 5)), DIA_Bartok_Teach_BOW_5);
};

// *****************************************************
//						Zusammen
// *****************************************************
var int Bartok_Bereit;
var int Bartok_Later;
// ---------------------------
instance DIA_Bartok_Zusammen(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 5;
	condition		= DIA_Bartok_Zusammen_Condition;
	information		= DIA_Bartok_Zusammen_Info;
	permanent		= TRUE;
	description		= "我 们 为 什 么 不 一 起 狩 猎 ？";
};

func int DIA_Bartok_Zusammen_Condition()
{
	if ((Bartok_Bereit == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Bartok_Hallo)))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Zusammen_Info()
{
	if (Bartok_Later == FALSE)
	{
		AI_Output(other, self, "DIA_Bartok_Zusammen_15_00"); //我 们 为 什 么 不 一 起 狩 猎 ？
		AI_Output(self, other, "DIA_Bartok_Zusammen_04_01"); //嗯 。 有 两 个 人 就 没 有 那 么 危 险 了 ， 是 真 的 … …
		AI_Output(self, other, "DIA_Bartok_Zusammen_04_02"); //你 了 解 一 些 捕 猎 的 事 ， 是 吗 ？
		AI_Output(self, other, "DIA_Bartok_Zusammen_04_03"); //我 的 意 思 是 ， 你 知 道 怎 样 剥 动 物 的 皮 吗 ？
	};

	if (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if (Bartok_Later == TRUE)
		{
			AI_Output(self, other, "DIA_Bartok_HuntNOW_04_01"); //你 有 5 0 个 金 币 吗 ？
		}
		else
		{
			AI_Output(other, self, "DIA_Bartok_Zusammen_15_04"); //是 的 。
			AI_Output(self, other, "DIA_Bartok_Zusammen_04_05"); //好 的 ， 但 是 ， 我 想 看 到 5 0 个 金 币 。 那 样 你 就 能 留 着 兽 皮 把 它 们 卖 给 伯 斯 波 了 。
			AI_Output(self, other, "DIA_Bartok_Zusammen_04_06"); //这 是 桩 公 平 交 易 ， 不 是 吗 ？
		};

		Info_ClearChoices(DIA_Bartok_Zusammen);
		Info_AddChoice(DIA_Bartok_Zusammen, "以 后 吧 … …", DIA_Bartok_Zusammen_Later);
		Info_AddChoice(DIA_Bartok_Zusammen, "给 你 … …", DIA_Bartok_Zusammen_Pay);
	}
	else
	{
		AI_Output(other, self, "DIA_Bartok_Zusammen_15_07"); //不 。
		AI_Output(self, other, "DIA_Bartok_Zusammen_04_08"); //那 么 ， 这 不 值 。
		AI_Output(self, other, "DIA_Bartok_Zusammen_04_09"); //等 你 学 会 些 东 西 后 再 来 。
	};
};

func void DIA_Bartok_Zusammen_Later()
{
	AI_Output(other, self, "DIA_Bartok_HuntNOW_Later_15_00"); //以 后 吧 … …
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Zusammen);
};

func void DIA_Bartok_Zusammen_Pay()
{
	Info_ClearChoices(DIA_Bartok_Zusammen);

	if (B_GiveInvItems(other, self, itmi_gold, 50))
	{
		AI_Output(other, self, "DIA_Bartok_HuntNOW_GO_15_00"); //给 你 … …
		Bartok_Bereit = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Bartok_HuntNOW_GO_04_03"); //是 吗 ， 哪 里 ？ 你 没 有 金 币 。
	};
};

// *****************************************************
//						HuntNOW
// *****************************************************
var int Bartok_Los;
// ----------------------
instance DIA_Bartok_HuntNOW(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 5;
	condition		= DIA_Bartok_HuntNOW_Condition;
	information		= DIA_Bartok_HuntNOW_Info;
	description		= "我 们 去 打 猎 吧 ！";
};

func int DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Bereit == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other, self, "DIA_Bartok_HuntNOW_15_00"); //我 们 去 打 猎 吧 ！
	AI_Output(self, other, "DIA_Bartok_HuntNOW_GO_04_01"); //好 的 ， 跟 着 我 。 南 门 外 面 有 片 树 林 ， 我 们 可 以 到 那 里 找 到 足 够 的 畜 牲 。
	AI_Output(self, other, "DIA_Bartok_HuntNOW_GO_04_02"); //（ 自 言 自 语 ） 也 许 会 比 我 们 想 要 的 更 多 … …
	Bartok_Los = TRUE;

	AI_StopProcessInfos(self);

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self, "GUIDEMITTE");

	Wld_InsertNpc(Wolf, "NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf, "NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf, "NW_FARM1_CITYWALL_FOREST_02");
};

// *****************************************************
//						Im Wald
// *****************************************************
var int Bartok_OrkStillThere;
// ---------------------
instance DIA_Bartok_ImWald(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 1;
	condition		= DIA_Bartok_ImWald_Condition;
	information		= DIA_Bartok_ImWald_Info;
	important		= TRUE;
};

func int DIA_Bartok_ImWald_Condition()
{
	if ((Bartok_Los == TRUE)
	&& (Npc_GetDistToWP(self, "NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self, other, "DIA_Bartok_ImWald_04_00"); //那 么 ， 你 是 怎 么 想 的 ， 我 们 要 不 要 进 到 更 深 的 树 林 里 去 ？

	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald, "我 们 回 去 ！", DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald, "我 们 继 续 。", DIA_Bartok_ImWald_Weiter);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other, self, "DIA_Bartok_ImWald_NachHause_15_00"); //我 们 回 去 ！
	AI_Output(self, other, "DIA_Bartok_ImWald_NachHause_04_01"); //我 更 喜 欢 这 样 。 我 们 也 许 会 直 接 跑 到 一 个 兽 人 的 怀 里 被 它 干 掉 。

	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

func void DIA_Bartok_ImWald_Weiter()
{
	AI_Output(other, self, "DIA_Bartok_ImWald_Weiter_15_00"); //我 们 继 续 。
	AI_Output(self, other, "DIA_Bartok_ImWald_Weiter_04_01"); //好 吧 。 （ 自 言 自 语 ） 希 望 这 个 能 行 … …

	if (!Npc_IsDead(CityOrc))
	{
		Bartok_OrkStillThere = TRUE;
	};

	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "GUIDEENDE");
};

// *****************************************************
//						Angekommen
// *****************************************************
var int Bartok_Ende;
// -------------------
instance DIA_Bartok_Angekommen(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 1;
	condition		= DIA_Bartok_Angekommen_Condition;
	information		= DIA_Bartok_Angekommen_Info;
	important		= TRUE;
};

func int DIA_Bartok_Angekommen_Condition()
{
	if ((Bartok_Los == TRUE)
	&& (Npc_GetDistToWP(self, "NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Angekommen_Info()
{
	AI_Output(self, other, "DIA_Bartok_Angekommen_04_00"); //是 这 样 ！ 我 想 我 准 备 回 城 去 。
	AI_Output(self, other, "DIA_Bartok_Angekommen_04_01"); //对 我 来 说 ， 这 外 面 太 危 险 了 - 即 使 有 我 们 俩 一 起 。

	if (Bartok_OrkStillThere == TRUE)
	// && (Npc_IsDead(CityOrc))
	{
		B_Bartok_ShitAnOrc();

		Bartok_OrkGesagt = TRUE;
	};

	AI_Output(self, other, "DIA_Bartok_Angekommen_04_03"); //所 以 ， 再 见 了 ！
	AI_Output(self, other, "DIA_Bartok_Angekommen_04_04"); //你 可 以 把 这 些 兽 皮 卖 给 伯 斯 波 。

	Bartok_Ende = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// *****************************************************
//							PERM
// *****************************************************
instance DIA_Bartok_PERM(C_INFO)
{
	npc				= VLK_440_Bartok;
	nr				= 1;
	condition		= DIA_Bartok_PERM_Condition;
	information		= DIA_Bartok_PERM_Info;
	permanent		= TRUE;
	description		= "一 切 都 好 吗 ？";
};

func int DIA_Bartok_PERM_Condition()
{
	if (Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other, self, "DIA_Bartok_PERM_15_00"); //行 吗 ？

	if (Bartok_Ende == TRUE)
	{
		AI_Output(self, other, "DIA_Bartok_PERM_04_01"); //是 的 。 不 过 我 不 会 再 出 城 了 - 至 少 最 近 不 会 。
		if (Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self, other, "DIA_Bartok_PERM_04_02"); //我 的 膝 盖 还 在 因 为 兽 人 而 发 抖 。
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Bartok_PERM_04_03"); //当 然 。 让 我 们 干 掉 几 个 野 兽 ！
	};
};
