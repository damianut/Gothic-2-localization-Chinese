///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_EXIT(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 999;
	condition		= DIA_Addon_Myxir_ADW_EXIT_Condition;
	information		= DIA_Addon_Myxir_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Myxir_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Myxir_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 900;
	condition		= DIA_Addon_Myxir_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Myxir_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wäre einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Myxir_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Myxir_NW.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Myxir_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Myxir_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_MediumHeal, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Myxir_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Myxir_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADWHello(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_ADWHello_Condition;
	information		= DIA_Addon_Myxir_ADWHello_Info;
	description		= "有 什 么 新 发 现 吗 ？";
};

func int DIA_Addon_Myxir_ADWHello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_ADWHello_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_ADWHello_15_00"); //有 什 么 新 发 现 吗 ？
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_01"); //这 些 废 墟 的 建 造 者 们 让 我 着 迷 ！
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_02"); //他 们 的 语 言 与 他 们 一 起 消 失 ， 真 是 太 不 幸 了 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_03"); //（ 考 虑 ） 即 使 他 们 那 样 强 大 的 仪 式 和 召 唤 也 没 能 拯 救 他 们 。
	AI_Output(other, self, "DIA_Addon_Myxir_ADWHello_15_04"); //召 唤 ？
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_05"); //建 造 者 与 精 神 世 界 之 间 有 极 强 的 联 系 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_06"); //如 果 我 理 解 正 确 的 话 ， 可 以 确 信 他 们 一 直 在 接 触 他 们 的 祖 先 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_12_07"); //他 们 通 常 举 行 召 唤 和 仪 式 来 向 灵 魂 征 求 意 见 以 及 获 得 启 迪 。

	Info_ClearChoices(DIA_Addon_Myxir_ADWHello);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello, "这 个 灵 魂 召 唤 怎 么 用 ？", DIA_Addon_Myxir_ADWHello_wie);
	Info_AddChoice(DIA_Addon_Myxir_ADWHello, "我 所 知 道 的 亡 灵 从 来 没 有 很 多 话 要 说 。", DIA_Addon_Myxir_ADWHello_Watt);
};

func void DIA_Addon_Myxir_ADWHello_wie()
{
	AI_Output(other, self, "DIA_Addon_Myxir_ADWHello_wie_15_00"); //这 个 灵 魂 召 唤 怎 么 用 ？
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_01"); //死 亡 守 护 者 有 他 们 特 殊 的 方 法 用 来 安 抚 灵 魂 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_wie_12_02"); //我 可 以 在 这 里 找 到 描 述 ， 不 过 ， 有 些 部 分 非 常 模 糊 。 我 的 问 题 中 只 有 极 少 的 部 分 可 以 得 到 明 确 的 答 案 。
};

func void DIA_Addon_Myxir_ADWHello_Watt()
{
	AI_Output(other, self, "DIA_Addon_Myxir_ADWHello_Watt_15_00"); //我 所 知 道 的 亡 灵 从 来 没 有 很 多 话 要 说 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_01"); //建 造 者 没 有 制 造 那 些 无 灵 魂 的 亡 灵 ， 例 如 僵 尸 以 及 其 它 邪 恶 的 怪 物 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_02"); //这 些 灵 魂 是 伟 大 的 战 士 、 牧 师 和 统 治 者 的 灵 魂 。
	AI_Output(self, other, "DIA_Addon_Myxir_ADWHello_Watt_12_03"); //迄 今 为 止 ， 我 毫 不 怀 疑 他 们 真 的 存 在 。
};

///////////////////////////////////////////////////////////////////////
//	Info PermADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_PermADW(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 10;
	condition		= DIA_Addon_Myxir_PermADW_Condition;
	information		= DIA_Addon_Myxir_PermADW_Info;
	permanent		= TRUE;
	description		= "如 果 我 看 到 一 个 灵 魂 ， 我 会 告 诉 你 的 。";
};

func int DIA_Addon_Myxir_PermADW_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Myxir_ADWHello))
	&& (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_PermADW_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_PermADW_15_00"); //如 果 我 看 到 一 个 灵 魂 ， 我 会 告 诉 你 的 。
	AI_Output(self, other, "DIA_Addon_Myxir_PermADW_12_01"); //（ 大 笑 ） 是 ， 我 坚 信 。
};

///////////////////////////////////////////////////////////////////////
//	Info GeistTafel
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistTafel(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_GeistTafel_Condition;
	information		= DIA_Addon_Myxir_GeistTafel_Info;
	description		= "萨 图 拉 斯 派 我 来 的 。";
};

func int DIA_Addon_Myxir_GeistTafel_Condition()
{
	if ((Saturas_RiesenPlan == TRUE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Myxir_ADWHello)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistTafel_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_15_00"); //萨 图 拉 斯 派 我 来 的 。
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_15_01"); //瑞 雯 已 经 设 法 进 入 神 殿 ， 并 从 里 面 堵 住 了 传 送 门 。
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_15_02"); //萨 图 拉 斯 认 为 他 那 些 关 于 神 殿 的 知 识 来 自 一 个 鬼 魂 ！
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_03"); //（ 目 瞪 口 呆 ） 亚 达 诺 斯 啊 ！
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_04"); //他 一 定 召 唤 了 高 级 牧 师 克 哈 迪 蒙 ， 并 向 他 询 问 了 进 入 神 殿 的 方 法 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_05"); //根 据 记 录 ， 他 的 坟 墓 在 森 林 的 下 面 。！
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_06"); //你 必 须 去 做 同 样 的 事 情 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_07"); //但 是 你 不 能 再 问 克 哈 迪 蒙 了 … …
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_08"); //战 士 王 子 夸 霍 德 隆 的 坟 墓 应 该 坐 落 在 山 谷 的 西 边 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_09"); //你 必 须 找 到 他 … … 并 唤 醒 夸 霍 德 隆 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_10"); //这 些 铭 文 记 载 了 如 何 成 为 亚 达 诺 斯 的 信 徒 ， 才 能 召 唤 灵 魂 。
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_15_11"); //你 认 为 那 样 真 的 有 用 ？
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_12"); //我 已 经 阅 读 了 大 量 极 不 连 贯 的 文 字 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_13"); //例 如 ， 关 于 埃 布 尔 利 昂 - 沉 睡 者 兄 弟 会 的 首 领 的 记 载 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_12_14"); //但 是 我 相 信 这 些 文 字 作 者 的 每 一 句 话 。！

	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_RUNNING;

	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, "你 真 是 认 真 的 吗 ？", DIA_Addon_Myxir_GeistTafel_geist);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, "为 什 么 是 夸 霍 德 隆 ？ 为 什 么 不 是 高 级 牧 师 克 哈 迪 蒙 ？", DIA_Addon_Myxir_GeistTafel_Khardimon);
	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, "沉 睡 者 兄 弟 会 不 是 仅 仅 散 布 谎 言 。", DIA_Addon_Myxir_GeistTafel_psi);
};

func void DIA_Addon_Myxir_GeistTafel_Khardimon()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_Khardimon_15_00"); //为 什 么 是 夸 霍 德 隆 ？ 为 什 么 不 是 高 级 牧 师 克 哈 迪 蒙 ？
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_01"); //瑞 雯 已 经 用 他 的 召 唤 亵 渎 了 克 哈 迪 蒙 的 坟 墓 。 我 们 可 以 那 样 假 定 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_Khardimon_12_02"); //我 们 必 须 要 寻 找 另 一 个 灵 魂 。
};

func void DIA_Addon_Myxir_GeistTafel_psi()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_psi_15_00"); //沉 睡 者 兄 弟 会 不 会 仅 仅 散 布 谎 言 。 沉 睡 者 真 的 存 在 过 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_01"); //但 并 不 是 他 们 的 谎 言 让 他 们 难 以 置 信 ， 而 是 他 们 的 文 字 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_02"); //他 们 比 我 们 所 知 的 更 加 混 乱 。 他 们 大 量 地 吸 沼 生 草 做 成 的 烟 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_psi_12_03"); //是 这 个 石 片 上 那 些 严 肃 和 神 圣 的 话 使 我 相 信 这 个 人 写 的 是 事 实 。
};

func void DIA_Addon_Myxir_GeistTafel_geist()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_geist_15_00"); //你 真 是 认 真 的 吗 ？
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_01"); //我 想 研 究 出 每 一 种 可 能 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_02"); //对 我 们 来 说 ， 即 使 只 有 鬼 魂 可 以 让 我 们 与 某 个 建 造 者 见 面 ， 我 们 也 必 须 去 做 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_geist_12_03"); //毕 竟 瑞 雯 已 经 那 么 做 了 。

	Info_AddChoice(DIA_Addon_Myxir_GeistTafel, "如 果 我 要 召 唤 这 个 鬼 魂 的 话 … …", DIA_Addon_Myxir_GeistTafel_wie);
};

func void DIA_Addon_Myxir_GeistTafel_wie()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistTafel_wie_15_00"); //假 设 我 要 召 唤 这 个 灵 魂 的 话 ， 我 必 须 要 怎 么 做 ？
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_01"); //在 山 谷 的 西 边 找 到 夸 霍 德 隆 的 坟 墓 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_02"); //你 可 以 用 我 写 在 这 里 的 、 死 亡 守 护 者 的 言 辞 来 召 唤 他 的 灵 魂 。
	CreateInvItems(self, ItWr_Addon_SUMMONANCIENTGHOST, 1);
	B_GiveInvItems(self, other, ItWr_Addon_SUMMONANCIENTGHOST, 1);
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_03"); //就 是 那 样 。 现 在 你 只 要 去 找 到 坟 墓 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistTafel_wie_12_04"); //祝 你 好 运 ， 我 的 孩 子 ！

	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_1);

	Info_ClearChoices(DIA_Addon_Myxir_GeistTafel);
};

///////////////////////////////////////////////////////////////////////
//	Info GeistPerm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_GeistPerm(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_GeistPerm_Condition;
	information		= DIA_Addon_Myxir_GeistPerm_Info;
	description		= "再 谈 谈 关 于 战 士 王 子 夸 霍 德 隆 的 事 ？";
};

func int DIA_Addon_Myxir_GeistPerm_Condition()
{
	if (MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_GeistPerm_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_GeistPerm_15_00"); //再 谈 谈 关 于 战 士 王 子 夸 霍 德 隆 的 事 ？
	AI_Output(self, other, "DIA_Addon_Myxir_GeistPerm_12_01"); //你 必 须 找 到 他 的 坟 墓 ， 并 使 用 死 亡 守 护 者 的 话 语 来 召 唤 他 的 灵 魂 。
	AI_Output(self, other, "DIA_Addon_Myxir_GeistPerm_12_02"); //我 已 经 把 这 些 话 写 下 来 了 ， 你 所 要 做 的 就 是 大 声 阅 读 它 们 。
};

///////////////////////////////////////////////////////////////////////
//	Info TalkedToGhost
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_TalkedToGhost(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_TalkedToGhost_Condition;
	information		= DIA_Addon_Myxir_TalkedToGhost_Info;
	description		= "我 已 经 和 夸 霍 德 隆 谈 过 了 。";
};

func int DIA_Addon_Myxir_TalkedToGhost_Condition()
{
	if ((MIS_ADDON_Myxir_GeistBeschwoeren == LOG_RUNNING)
	&& (SC_TalkedToGhost == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_TalkedToGhost_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_00"); //我 已 经 和 夸 霍 德 隆 谈 过 了 。
	AI_Output(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_01"); //（ 兴 奋 的 ） 那 你 真 的 能 把 他 从 死 亡 国 度 唤 醒 了 ？
	AI_Output(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_02"); //那 简 直 难 以 置 信 。 我 对 建 造 者 越 来 越 感 到 吃 惊 。
	AI_Output(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_03"); //如 果 他 们 现 在 还 存 在 的 话 ， 谁 知 道 他 们 能 实 现 些 什 么 … …
	MIS_ADDON_Myxir_GeistBeschwoeren = LOG_SUCCESS;

	B_GivePlayerXP(XP_Addon_Myxir_GeistBeschwoeren);

	if ((Saturas_KnowsHow2GetInTempel == FALSE)
	&& (Ghost_SCKnowsHow2GetInAdanosTempel == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_04"); //鬼 魂 说 了 什 么 ？
		AI_Output(other, self, "DIA_Addon_Myxir_TalkedToGhost_15_05"); //他 给 了 我 一 些 东 西 ， 可 以 让 我 进 入 亚 达 诺 斯 神 殿 。
		AI_Output(self, other, "DIA_Addon_Myxir_TalkedToGhost_12_06"); //那 直 接 去 找 萨 图 拉 斯 。 他 一 定 对 你 要 说 的 话 感 兴 趣 。

		B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_2);
	};
};

///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_ADW_Teach(C_INFO)
{
	npc				= KDW_14030_Addon_Myxir_ADW;
	nr				= 90;
	condition		= DIA_Addon_Myxir_ADW_Teach_Condition;
	information		= DIA_Addon_Myxir_ADW_Teach_Info;
	permanent		= TRUE;
	description		= "教 我 那 种 语 言 。";
};

var int DIA_Addon_Myxir_ADW_Teach_NoPerm;
var int DIA_Addon_Myxir_ADW_Teach_OneTime;

func int DIA_Addon_Myxir_ADW_Teach_Condition()
{
	if ((DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Myxir_ADW_Teach_NoPerm == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Myxir_ADWHello)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();

	if (DIA_Addon_Myxir_ADW_Teach_OneTime == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach);
		DIA_Addon_Myxir_ADW_Teach_OneTime = TRUE;
	};

	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach, DIALOG_BACK, DIA_Addon_Myxir_ADW_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)), DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)), DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_ADW_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)), DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_1()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_2()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};

func void DIA_Addon_Myxir_ADW_Teach_LANGUAGE_3()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_ADW_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_ADW_Teach);
};
