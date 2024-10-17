// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_MiltenNW_EXIT(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 999;
	condition		= DIA_MiltenNW_EXIT_Condition;
	information		= DIA_MiltenNW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MiltenNW_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_MiltenNW_KAP3_EXIT(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 999;
	condition		= DIA_MiltenNW_KAP3_EXIT_Condition;
	information		= DIA_MiltenNW_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MiltenNW_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*************************************************************
// Hallo!
//*************************************************************
instance DIA_MiltenNW_KAP3_Hello(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 31;
	condition		= DIA_MiltenNW_KAP3_Hello_Condition;
	information		= DIA_MiltenNW_KAP3_Hello_Info;
	important		= TRUE;
};

func int DIA_MiltenNW_KAP3_Hello_Condition()
{
	if (hero.guild == GIL_PAL
	|| hero.guild == GIL_DJG)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Hello_Info()
{
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_00"); //（ 怀 疑 的 ） 我 很 难 相 信 。 你 现 在 真 的 是 个 圣 骑 士 了 吗 ？
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_01"); //显 然 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_02"); //（ 兴 高 采 烈 的 ） 如 果 象 你 这 样 的 人 成 为 了 圣 骑 士 ， 那 么 贝 利 尔 的 歹 徒 们 就 得 加 倍 小 心 了 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_03"); //如 果 你 干 掉 了 沉 睡 者 ， 那 么 一 小 帮 兽 人 就 不 会 是 个 问 题 了 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_04"); //这 不 仅 仅 是 兽 人 的 问 题 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_05"); //我 知 道 ， 但 有 你 在 我 们 一 边 还 是 很 好 的 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_06"); //嗯 好 吧 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_07"); //你 在 这 个 修 道 院 里 干 什 么 ？ 让 我 猜 猜 。 你 想 有 人 传 授 你 魔 法 技 巧 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_08"); //也 许 吧 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_09"); //我 就 知 道 - 最 好 跟 马 杜 克 谈 谈 ， 他 负 责 你 们 圣 骑 士 。 你 可 以 去 礼 拜 堂 前 面 找 他 。
	};

	if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_10"); //我 能 看 出 传 言 是 真 的 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_11"); //什 么 传 言 ？
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_12"); //就 是 你 加 入 了 龙 猎 手 这 件 事 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_13"); //好 吧 ， 你 不 是 教 堂 的 人 。 不 过 ， 你 在 为 我 们 的 事 业 而 奋 斗 ， 那 才 是 最 有 意 义 的 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_14"); //就 是 这 些 吗 ？
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_15"); //当 然 ， 我 很 高 兴 ， 你 的 样 子 能 让 每 一 个 兽 人 感 到 畏 惧 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_16"); //这 不 仅 仅 是 兽 人 的 问 题 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_17"); //我 知 道 ， 但 是 虽 然 如 此 ， 他 们 仍 然 是 问 题 。 你 很 重 要 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Hello_03_18"); //你 打 败 了 沉 睡 者 。 我 们 以 后 总 会 需 要 你 的 帮 助 。
		AI_Output(other, self, "DIA_MiltenNW_KAP3_Hello_15_19"); //哦 好 吧。
	};
};

// ************************************************************
// 	  				   Was machst du hier am Kloster
// ************************************************************
instance DIA_MiltenNW_Monastery(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 35;
	condition		= DIA_MiltenNW_Monastery_Condition;
	information		= DIA_MiltenNW_Monastery_Info;
	description		= "你 怎 么 这 么 快 就 到 了 修 道 院 ？";
};

func int DIA_MiltenNW_Monastery_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Monastery_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_Monastery_15_00"); //你 怎 么 这 么 快 就 到 了 修 道 院 ？
	AI_Output(self, other, "DIA_MiltenNW_Monastery_03_01"); //那 是 什 么 样 的 问 题 ？ 我 从 关 卡 那 里 溜 了 过 去 ， 然 后 直 接 去 了 修 道 院 。
	AI_Output(self, other, "DIA_MiltenNW_Monastery_03_02"); //不 可 否 认 ， 那 些 怪 物 把 山 谷 这 边 当 成 了 自 己 的 家 ， 要 想 避 开 它 们 真 是 不 容 易 ， 但 最 终 我 还 是 碰 到 了 一 些 意 料 之 外 的 问 题 。
};

// ************************************************************
// 	  				   Weisst du wo die Anderen sind?
// ************************************************************
instance DIA_MiltenNW_FourFriends(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 35;
	condition		= DIA_MiltenNW_FourFriends_Condition;
	information		= DIA_MiltenNW_FourFriends_Info;
	description		= "你 知 道 其 它 人 在 哪 里 吗 ？";
};

func int DIA_MiltenNW_FourFriends_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_FourFriends_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_FourFriends_15_00"); //你 知 道 其 它 人 在 哪 里 吗 ？
	if (Npc_IsDead(PC_FIGHTER_NW_vor_DJG) == FALSE)
	{
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_01"); //戈 恩 看 起 来 在 加 隆 德 的 地 牢 里 还 是 应 付 自 如 的 。

		if (MIS_RescueGorn != LOG_SUCCESS)
		{
			AI_Output(other, self, "DIA_MiltenNW_FourFriends_15_02"); //他 是 怎 么 出 来 的 ？
			AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_03"); //我 不 得 不 对 加 隆 德 撒 了 谎 ， 所 以 他 才 能 卸 下 所 有 的 负 担 。
			AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_04"); //但 这 是 我 们 两 个 人 之 间 的 事 ， 明 白 吗 ？
		};

		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_05"); //不 管 怎 样 ， 他 想 去 投 奔 李 ， 并 看 看 那 个 农 场 里 情 况 怎 么 样 。
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_06"); //在 吃 过 了 地 牢 里 的 食 物 之 后 ， 他 现 在 很 有 可 能 正 在 大 吃 大 喝 ， 让 雇 佣 兵 们 的 粮 食 经 受 一 个 真 正 的 考 验 。
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_07"); //戈 恩 没 能 成 功 。
	};

	if (Npc_IsDead(PC_THIEF_NW) == FALSE)
	{
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_08"); //迪 雅 戈 曾 叨 咕 过 账 目 的 事 。 不 知 道 他 说 那 个 是 什 么 意 思 。
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_09"); //但 我 怀 疑 他 可 能 在 城 里 。 你 了 解 他 的 - 总 是 出 现 在 能 捞 点 什 么 东 西 的 地 方 。
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenNW_FourFriends_03_10"); //迪 雅 戈 死 了 - 看 起 屏 障 最 终 还 是 毁 灭 了 他 。
	};
};

//*************************************************************
// Ich muss ins Kloster // HauptStory!!!
//*************************************************************
instance DIA_MiltenNW_KAP3_Entry(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 32;
	condition		= DIA_MiltenNW_KAP3_Entry_Condition;
	information		= DIA_MiltenNW_KAP3_Entry_Info;
	permanent		= TRUE;
	description		= "我 需 要 进 入 修 道 院 。 非 常 紧 急 ！";
};

func int DIA_MiltenNW_KAP3_Entry_Condition()
{
	if ((Kapitel == 3)
	&& (hero.guild != GIL_KDF)
	&& (MiltenNW_GivesMonasteryKey == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Entry_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP3_Entry_15_00"); //我 需 要 进 入 修 道 院 。 非 常 紧 急 ！
	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_03_01"); //是 的 ， 当 然 。 这 是 钥 匙 。

		CreateInvItems(self, ItKe_Innos_Mis, 1);
		B_GiveInvItems(self, other, ItKe_Innos_Mis, 1);

		MiltenNW_GivesMonasteryKey = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_03_02"); //我 不 能 让 你 进 入 修 道 院 。 高 级 议 会 会 找 我 麻 烦 的 。
		AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_03_03"); //没 有 我 的 上 司 的 许 可 ， 我 不 能 让 任 何 人 进 入 这 座 修 道 院 。

		Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry, DIALOG_Back, DIA_MiltenNW_KAP3_Entry_BACK);
		Info_AddChoice(DIA_MiltenNW_KAP3_Entry, "这 十 分 重 要 ！", DIA_MiltenNW_KAP3_Entry_Important);

		if (Npc_HasItems(other, ItWr_PermissionToWearInnosEye_MIS) >= 1)
		{
			Info_AddChoice(DIA_MiltenNW_KAP3_Entry, "我 有 一 封 信 来 自 哈 根 勋 爵 的 信 。", DIA_MiltenNW_KAP3_Entry_Permit);
		};
	};
};

func void DIA_MiltenNW_KAP3_Entry_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Important()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP3_Entry_Important_15_00"); //这 十 分 重 要 ！
	AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_Important_03_01"); //那 没 有 用 的 。 皮 罗 卡 会 砍 了 我 的 脑 袋 。

	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

func void DIA_MiltenNW_KAP3_Entry_Permit()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP3_Entry_Permit_15_00"); //我 有 一 封 信 来 自 哈 根 勋 爵 的 信 。
	AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_Permit_03_01"); //给 我 看 看 。

	B_GiveInvItems(other, self, ItWr_PermissionToWearInnosEye_MIS, 1);
	B_UseFakeScroll();

	AI_Output(self, other, "DIA_MiltenNW_KAP3_Entry_Permit_03_02"); //（ 犹 豫 不 决 的 ） 好 吧 。 这 是 进 入 修 道 院 的 钥 匙 。 皮 罗 卡 在 教 堂 里 。

	CreateInvItems(self, ItKe_Innos_Mis, 1);
	B_GiveInvItems(self, other, ItKe_Innos_Mis, 1);
	B_GiveInvItems(self, other, ItWr_PermissionToWearInnosEye_MIS, 1);

	MiltenNW_GivesMonasteryKey = TRUE;

	Info_ClearChoices(DIA_MiltenNW_KAP3_Entry);
};

//***************************************************************
//	Hast du hier jemanden herauskommen gesehen?
//***************************************************************
instance DIA_MiltenNW_KAP3_NovizenChase(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 31;
	condition		= DIA_MiltenNW_KAP3_NovizenChase_Condition;
	information		= DIA_MiltenNW_KAP3_NovizenChase_Info;
	description		= "你 知 道 比 德 罗 在 哪 里 吗？";
};

func int DIA_MiltenNW_KAP3_NovizenChase_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (MIS_SCKnowsInnosEyeIsBroken == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_NovizenChase_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP3_NovizenChase_15_00"); //你 知 道 比 德 罗 在 哪 里 吗 ？
	AI_Output(self, other, "DIA_MiltenNW_KAP3_NovizenChase_03_01"); //你 想 ， 如 果 我 知 道 叛 徒 藏 在 哪 里 的 话 ， 还 会 在 这 周 围 打 转 吗 ？
	AI_Output(self, other, "DIA_MiltenNW_KAP3_NovizenChase_03_02"); //他 必 须 为 他 的 行 为 付 出 代 价 。 我 希 望 我 们 能 想 办 法 找 回 这 只 ‘ 眼 睛 ’ 。
	AI_Output(self, other, "DIA_MiltenNW_KAP3_NovizenChase_03_03"); //你 必 须 帮 助 我 们 。 找 到 他 并 带 回 英 诺 斯 之 眼 。
	// Joly: AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04"); // Ich werde sehen, was ich tun kann.
};

//***************************************************************
//	Weißt du etwas über die vermummten Gestalten?
//***************************************************************
instance DIA_MiltenNW_KAP3_Perm(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 39;
	condition		= DIA_MiltenNW_KAP3_Perm_Condition;
	information		= DIA_MiltenNW_KAP3_Perm_Info;
	description		= "你 知 道 任 何 关 于 那 些 戴 着 头 罩 的 人 的 事 情 吗 ？";
};

func int DIA_MiltenNW_KAP3_Perm_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP3_Perm_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP3_Perm_15_00"); //你 知 道 任 何 关 于 那 些 戴 着 头 罩 的 人 的 事 情 吗 ？
	AI_Output(self, other, "DIA_MiltenNW_KAP3_Perm_03_01"); //不 ， 但 我 对 那 些 家 伙 的 印 象 很 差 。
	AI_Output(self, other, "DIA_MiltenNW_KAP3_Perm_03_02"); //如 果 你 碰 到 他 们 一 定 要 小 心 。
};

// ########################
// ## ##
// ## Kapitel 4 ##
// ## ##
// ########################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_MiltenNW_KAP4_EXIT(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 999;
	condition		= DIA_MiltenNW_KAP4_EXIT_Condition;
	information		= DIA_MiltenNW_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MiltenNW_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  				   Perm KAP4
// ************************************************************
instance DIA_MiltenNW_KAP4_PERM(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 49;
	condition		= DIA_MiltenNW_KAP4_PERM_Condition;
	information		= DIA_MiltenNW_KAP4_PERM_Info;
	permanent		= TRUE;
	description		= "有 新 闻 吗 ？";
};

func int DIA_MiltenNW_KAP4_PERM_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP4_PERM_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_KAP4_PERM_15_00"); //有 新 闻 吗 ？
	AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_01"); //我 应 该 问 问 你 的 。 我 们 在 这 里 还 是 很 担 心 。
	AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_02"); //高 级 议 会 正 在 设 法 弄 清 敌 人 的 下 一 步 行 动 。
	AI_Output(other, self, "DIA_MiltenNW_KAP4_PERM_15_03"); //还 有 吗 ？

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_04"); //近 来 ， 你 能 听 到 更 多 关 于 兽 人 袭 击 的 消 息 ， 甚 至 在 矿 藏 山 谷 外 面 。
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_05"); //我 不 喜 欢 这 一 切 - 我 认 为 我 们 没 有 多 少 时 间 了 。
	}
	else if (hero.guild == GIL_DJG)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_06"); //一 个 农 场 主 报 告 说 他 的 农 场 附 近 有 一 些 长 着 鳞 片 的 生 物 。
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_07"); //我 不 知 道 那 是 什 么 ， 但 我 认 为 敌 人 正 在 设 计 什 么 阴 谋 。
	}
	else if (MIS_FindTheObesessed == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_08"); //我 们 得 到 越 来 越 多 的 关 于 有 人 被 附 体 的 报 告 。 敌 人 越 来 越 强 大 ， 比 我 预 料 的 要 强 大 得 多 。
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenNW_KAP4_PERM_03_09"); //不 ， 形 式 仍 然 很 严 峻 。 现 在 我 们 能 做 的 只 有 相 信 英 诺 斯 。
	};
};

// ########################
// ## ##
// ## Kapitel 5 ##
// ## ##
// ########################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_MiltenNW_KAP5_EXIT(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 999;
	condition		= DIA_MiltenNW_KAP5_EXIT_Condition;
	information		= DIA_MiltenNW_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_MiltenNW_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 	  				   Ich habe alle Drachen getötet. (Perm Kap 5)
// ************************************************************
instance DIA_MiltenNW_AllDragonsDead(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 900;
	condition		= DIA_MiltenNW_AllDragonsDead_Condition;
	information		= DIA_MiltenNW_AllDragonsDead_Info;
	description		= "我 杀 死 了 所 有 的 龙 。";
};

func int DIA_MiltenNW_AllDragonsDead_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_AllDragonsDead_15_00"); //我 杀 死 了 所 有 的 龙 。
	AI_Output(self, other, "DIA_MiltenNW_AllDragonsDead_03_01"); //真 的 吗 ？ 那 么 在 前 方 还 有 更 多 希 望 的 曙 光 。 现 在 我 们 所 要 做 的 就 是 去 斩 断 邪 恶 的 头 。
	AI_Output(self, other, "DIA_MiltenNW_AllDragonsDead_03_02"); //如 果 你 真 能 做 到 的 话 ， 那 么 我 们 将 赢 得 这 场 战 争 。
	AI_Output(other, self, "DIA_MiltenNW_AllDragonsDead_15_03"); //谁 ， 我 ？
	AI_Output(self, other, "DIA_MiltenNW_AllDragonsDead_03_04"); //当 然 是 你 。 还 能 有 谁 ？

	if (MiltenNW_IsOnBoard == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_MiltenNW_AllDragonsDead_03_05"); //我 们 必 须 马 上 出 发 ， 否 则 就 太 晚 了 。
	};
};

///////////////////////////////////////////////////////////////////////
//	In Bibliothek gewesen
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_SCWasInLib(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 3;
	condition		= DIA_MiltenNW_SCWasInLib_Condition;
	information		= DIA_MiltenNW_SCWasInLib_Info;
	important		= TRUE;
};

func int DIA_MiltenNW_SCWasInLib_Condition()
{
	if (MIS_SCKnowsWayToIrdorath == TRUE)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_SCWasInLib_Info()
{
	AI_Output(self, other, "DIA_MiltenNW_SCWasInLib_03_00"); //嘿 ， 我 听 说 你 在 修 道 院 的 地 下 室 里 呆 了 很 长 一 段 时 间 。 你 发 现 了 什 么 ？
};

///////////////////////////////////////////////////////////////////////
//	Ich weiss wo der Feind ist.
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_KnowWhereEnemy(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 55;
	condition		= DIA_MiltenNW_KnowWhereEnemy_Condition;
	information		= DIA_MiltenNW_KnowWhereEnemy_Info;
	permanent		= TRUE;
	description		= "我 现 在 知 道 敌 人 藏 在 哪 里 了 。";
};

func int DIA_MiltenNW_KnowWhereEnemy_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (MiltenNW_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

var int SCToldMiltenHeKnowWhereEnemy;
func void DIA_MiltenNW_KnowWhereEnemy_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_00"); //现 在 ， 我 知 道 敌 人 藏 在 什 么 地 方 了 。 在 一 个 小 岛 上 ， 离 这 里 不 远 。
	AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_01"); //这 是 我 们 的 好 机 会 。 我 们 必 须 马 上 出 发 去 彻 底 地 消 灭 邪 恶 。
	SCToldMiltenHeKnowWhereEnemy = TRUE;

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	if ((Npc_IsDead(DiegoNW)) == FALSE)
	{
		AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_02"); //你 已 经 跟 迪 雅 戈 说 过 这 件 事 了 吗 ？ 我 想 他 可 能 愿 意 跟 你 一 起 去 。
		B_LogEntry(TOPIC_Crew, TOPIC_Crew_9);
	};

	if ((Npc_IsDead(GornNW_nach_DJG)) == FALSE)
	{
		AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_03"); //那 么 戈 恩 呢 ？ 跟 他 谈 谈 。 我 听 说 他 已 经 从 矿 藏 山 谷 那 里 回 来 了 。
		B_LogEntry(TOPIC_Crew, TOPIC_Crew_10);
	};

	if ((Npc_IsDead(Lester)) == FALSE)
	{
		AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_04"); //还 有 ， 别 忘 了 莱 斯 特 。 如 果 你 不 把 他 从 那 个 山 谷 里 带 出 来 ， 他 就 会 死 在 那 里 。
		B_LogEntry(TOPIC_Crew, TOPIC_Crew_11);
	};

	AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_05"); //我 也 知 道 自 己 在 这 些 事 中 所 担 任 的 职 责 。 在 我 们 面 对 敌 人 时 ， 我 能 增 加 你 的 魔 法 值 ， 而 且 能 帮 助 你 制 造 魔 法 。 我 们 什 么 时 候 出 发 ？

	B_LogEntry(TOPIC_Crew, TOPIC_Crew_12);

	if (crewmember_count >= Max_Crew)
	{
		AI_Output(other, self, "DIA_MiltenNW_KnowWhereEnemy_15_06"); //现 在 还 不 行 ， 我 已 经 找 到 足 够 的 人 了 。
		AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_07"); //你 知 道 我 愿 意 跟 着 你 。 如 果 你 改 变 主 意 了 ， 我 会 在 这 里 等 你 。
		AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_03_08"); //祝 你 好 运 ， 愿 英 诺 斯 的 保 护 之 手 永 远 庇 护 你 。
	}
	else
	{
		Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy, "我 此 时 此 刻 还 用 不 上 你 。", DIA_MiltenNW_KnowWhereEnemy_No);
		Info_AddChoice(DIA_MiltenNW_KnowWhereEnemy, "欢 迎 上 船 ！", DIA_MiltenNW_KnowWhereEnemy_Yes);
	};
};

func void DIA_MiltenNW_KnowWhereEnemy_Yes()
{
	AI_Output(other, self, "DIA_MiltenNW_KnowWhereEnemy_Yes_15_00"); //欢 迎 上 船 ！
	AI_Output(other, self, "DIA_MiltenNW_KnowWhereEnemy_Yes_15_01"); //我 们 将 在 港 口 碰 头 。 在 那 里 等 我 。
	AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_Yes_03_02"); //好 的 。 你 准 备 好 的 时 候 我 就 会 在 那 里 了 。

	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;

	B_GivePlayerXP(XP_Crewmember_Success);

	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

func void DIA_MiltenNW_KnowWhereEnemy_No()
{
	AI_Output(other, self, "DIA_MiltenNW_KnowWhereEnemy_No_15_00"); //我 此 时 此 刻 还 用 不 上 你 。
	AI_Output(self, other, "DIA_MiltenNW_KnowWhereEnemy_No_03_01"); //你 知 道 ， 我 愿 意 自 始 至 终 跟 随 你 。 如 果 你 改 变 了 主 意 ， 我 会 在 这 里 等 你 。

	MiltenNW_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_MiltenNW_KnowWhereEnemy);
};

///////////////////////////////////////////////////////////////////////
//	WhereCaptain
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_WhereCaptain(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 3;
	condition		= DIA_MiltenNW_WhereCaptain_Condition;
	information		= DIA_MiltenNW_WhereCaptain_Info;
	description		= "我 应 该 去 哪 里 找 船 长 ？";
};

func int DIA_MiltenNW_WhereCaptain_Condition()
{
	if ((MIS_SCKnowsWayToIrdorath == TRUE)
	&& (SCToldMiltenHeKnowWhereEnemy == TRUE)
	&& (SCGotCaptain == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_WhereCaptain_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_WhereCaptain_15_00"); //我 应 该 去 哪 里 找 船 长 ？
	AI_Output(self, other, "DIA_MiltenNW_WhereCaptain_03_01"); //问 问 卓 根 。 毕 竟 他 是 个 水 手 。 他 应 该 还 在 修 道 院 里 。
	AI_Output(self, other, "DIA_MiltenNW_WhereCaptain_03_02"); //但 是 ， 如 果 他 不 能 帮 你 ， 你 就 只 能 去 农 场 或 是 城 里 找 其 它 会 开 船 的 人 了 。
	AI_Output(self, other, "DIA_MiltenNW_WhereCaptain_03_03"); //最 好 是 去 跟 李 谈 谈 ， 或 者 去 克 霍 里 尼 斯 的 港 口 。 现 在 我 想 不 到 更 好 的 办 法 了 。

	Log_CreateTopic(TOPIC_Captain, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Captain, LOG_RUNNING);
	B_LogEntry(TOPIC_Captain, TOPIC_Captain_4);
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_LeaveMyShip(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 55;
	condition		= DIA_MiltenNW_LeaveMyShip_Condition;
	information		= DIA_MiltenNW_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "我 不 能 带 上 你 。";
};

func int DIA_MiltenNW_LeaveMyShip_Condition()
{
	if ((MiltenNW_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_LeaveMyShip_15_00"); //我 不 能 带 上 你 。
	AI_Output(self, other, "DIA_MiltenNW_LeaveMyShip_03_01"); //你 最 清 楚 谁 对 你 有 用 。 如 果 你 改 变 主 意 了 ， 我 会 在 修 道 院 这 里 等 你 。

	MiltenNW_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);

	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir überlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_StillNeedYou(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 55;
	condition		= DIA_MiltenNW_StillNeedYou_Condition;
	information		= DIA_MiltenNW_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "我 需 要 你 。";
};

func int DIA_MiltenNW_StillNeedYou_Condition()
{
	if (((MiltenNW_IsOnBOard == LOG_OBSOLETE) // Hier brauch man natürlich nur eine variable abfragen
	|| (MiltenNW_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_StillNeedYou_15_00"); //我 需 要 你 。

	AI_Output(self, other, "DIA_MiltenNW_StillNeedYou_03_01"); //你 的 决 定 是 我 的 荣 耀 。 走 吧 ， 我 们 一 点 时 间 都 不 能 浪 费 。
	AI_Output(self, other, "DIA_MiltenNW_StillNeedYou_03_02"); //我 会 去 港 口 。 我 们 在 那 里 碰 头 。

	self.flags = NPC_FLAG_IMMORTAL;
	MiltenNW_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);

	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 		Teach
// ************************************************************
instance DIA_MiltenNW_Teach(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 90;
	condition		= DIA_MiltenNW_Teach_Condition;
	information		= DIA_MiltenNW_Teach_Info;
	permanent		= TRUE;
	description		= "我 想 要 学 习 一 些 新 的 魔 法 。";
};

func int DIA_MiltenNW_Teach_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Teach_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_Teach_15_00"); //我 想 要 学 习 一 些 新 的 魔 法 。

	if (Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(DIA_MiltenNW_Teach);
		Info_AddChoice(DIA_MiltenNW_Teach, DIALOG_BACK, DIA_MiltenNW_Teach_BACK);

		if (PLAYER_TALENT_RUNES [SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach, B_BuildLearnString(NAME_SPL_WINDFIST, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_WINDFIST)), DIA_MiltenNW_Teach_Windfist);
		};

		if (PLAYER_TALENT_RUNES [SPL_InstantFireball] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach, B_BuildLearnString(NAME_SPL_InstantFireball, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_InstantFireball)), DIA_MiltenNW_Teach_Feuerball);
		};

		if (PLAYER_TALENT_RUNES [SPL_Icebolt] == FALSE)
		{
			Info_AddChoice(DIA_MiltenNW_Teach, B_BuildLearnString(NAME_SPL_Icebolt, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_Icebolt)), DIA_MiltenNW_Teach_Eispfeil);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_MiltenNW_Teach_03_01"); //你 还 没 有 到 达 第 二 个 魔 法 环 。 我 什 么 也 教 不 了 你 。
	};
};

func void DIA_MiltenNW_Teach_BACK()
{
	Info_ClearChoices(DIA_MiltenNW_Teach);
};

func void DIA_MiltenNW_Teach_WINDFIST()
{
	B_TeachPlayerTalentRunes(self, other, SPL_WINDFIST);
};

func void DIA_MiltenNW_Teach_Feuerball()
{
	B_TeachPlayerTalentRunes(self, other, SPL_InstantFireball);
};

func void DIA_MiltenNW_Teach_Eispfeil()
{
	B_TeachPlayerTalentRunes(self, other, SPL_Icebolt);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_MiltenNW_Mana(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 100;
	condition		= DIA_MiltenNW_Mana_Condition;
	information		= DIA_MiltenNW_Mana_Info;
	permanent		= TRUE;
	description		= "我 想 要 增 强 我 的 魔 法 能 力 。";
};

func int DIA_MiltenNW_Mana_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_MiltenNW_Mana_Info()
{
	AI_Output(other, self, "DIA_MiltenNW_Mana_15_00"); //我 想 要 增 强 我 的 魔 法 能 力 。

	Info_ClearChoices(DIA_MiltenNW_Mana);
	Info_AddChoice(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_BACK()
{
	if (other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self, other, "DIA_MiltenNW_Mana_03_00"); //你 的 魔 法 能 力 很 强 大 。 强 大 得 让 我 无 法 再 帮 你 增 强 它 。
	};

	Info_ClearChoices(DIA_MiltenNW_Mana);
};

func void DIA_MiltenNW_Mana_1()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 1, T_MED);

	Info_ClearChoices(DIA_MiltenNW_Mana);

	Info_AddChoice(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenNW_Mana_5);
};

func void DIA_MiltenNW_Mana_5()
{
	B_TeachAttributePoints(self, other, ATR_MANA_MAX, 5, T_MED);

	Info_ClearChoices(DIA_MiltenNW_Mana);

	Info_AddChoice(DIA_MiltenNW_Mana, DIALOG_BACK, DIA_MiltenNW_Mana_BACK);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA1, B_GetLearnCostAttribute(other, ATR_MANA_MAX)), DIA_MiltenNW_Mana_1);
	Info_AddChoice(DIA_MiltenNW_Mana, B_BuildLearnString(PRINT_LearnMANA5, B_GetLearnCostAttribute(other, ATR_MANA_MAX) * 5), DIA_MiltenNW_Mana_5);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Mage_NW_PICKPOCKET(C_INFO)
{
	npc				= PC_Mage_NW;
	nr				= 900;
	condition		= DIA_Mage_NW_PICKPOCKET_Condition;
	information		= DIA_Mage_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Mage_NW_PICKPOCKET_Condition()
{
	C_Beklauen(56, 75);
};

func void DIA_Mage_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET, DIALOG_BACK, DIA_Mage_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mage_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Mage_NW_PICKPOCKET_DoIt);
};

func void DIA_Mage_NW_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};

func void DIA_Mage_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mage_NW_PICKPOCKET);
};
