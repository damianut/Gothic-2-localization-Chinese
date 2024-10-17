///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_ADW_EXIT(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 999;
	condition		= DIA_Addon_Riordian_ADW_EXIT_Condition;
	information		= DIA_Addon_Riordian_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Riordian_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HelloADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HelloADW(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_HelloADW_Condition;
	information		= DIA_Addon_Riordian_HelloADW_Info;
	description		= "你 想 到 过 会 在 这 里 见 到 这 些 建 筑 吗 ？";
};

func int DIA_Addon_Riordian_HelloADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_HelloADW_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_HelloADW_15_00"); //你 想 到 过 会 在 这 里 见 到 这 些 建 筑 吗 ？
	AI_Output(self, other, "DIA_Addon_Riordian_HelloADW_10_01"); //一 点 也 不 。 我 非 常 敬 畏 的 是 这 座 城 市 曾 经 有 多 大 。
	AI_Output(self, other, "DIA_Addon_Riordian_HelloADW_10_02"); //大 多 数 建 筑 是 由 石 块 和 泥 土 建 成 的 ， 但 是 废 墟 分 布 在 整 个 大 陆 ， 留 存 了 许 多 年 。
	AI_Output(self, other, "DIA_Addon_Riordian_HelloADW_10_03"); //这 里 一 定 曾 经 居 住 过 成 千 上 万 的 人 。
};

///////////////////////////////////////////////////////////////////////
//	Info WhatToFind
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhatToFind(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_WhatToFind_Condition;
	information		= DIA_Addon_Riordian_WhatToFind_Info;
	description		= "我 在 那 里 能 找 到 什 么 ？";
};

func int DIA_Addon_Riordian_WhatToFind_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Riordian_HelloADW))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_WhatToFind_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_WhatToFind_15_00"); //我 在 那 里 能 找 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_01"); //在 东 边 一 个 巨 大 的 沼 泽 里 ， 有 一 座 巨 大 的 城 堡 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_02"); //我 们 从 这 里 就 能 知 道 ， 强 盗 们 已 经 把 那 里 作 为 他 们 的 庇 护 所 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_03"); //如 果 我 是 你 的 话 ， 我 不 会 去 那 里 。 他 们 已 经 建 立 了 很 多 前 哨 和 护 卫 队 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_04"); //在 你 取 得 更 多 经 验 之 前 ， 你 最 好 避 开 沼 泽 ， 或 者 找 到 绕 过 强 盗 们 的 路 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_05"); //在 西 边 ， 我 们 已 经 发 现 了 一 些 海 盗 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_06"); //我 不 太 确 定 ， 但 是 我 相 信 他 们 也 发 现 我 们 了 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhatToFind_10_07"); //不 过 我 们 的 出 现 并 没 有 让 他 们 感 到 不 安 。
};

///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_Gegend(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_Gegend_Condition;
	information		= DIA_Addon_Riordian_Gegend_Info;
	permanent		= TRUE;
	description		= "再 告 诉 我 一 些 关 于 这 个 地 区 的 事 。";
};

func int DIA_Addon_Riordian_Gegend_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Riordian_WhatToFind))
	&& (Saturas_RiesenPlan == FALSE))
	{
		return TRUE;
	};
};

var int DIA_Addon_Riordian_Gegend_Info_OneTime;
func void DIA_Addon_Riordian_Gegend_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_15_00"); //再 告 诉 我 一 些 关 于 这 个 地 区 的 事 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_10_01"); //你 想 要 知 道 什 么 ？

	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, DIALOG_BACK, DIA_Addon_Riordian_Gegend_Back);

	if ((DIA_Addon_Riordian_Gegend_Info_OneTime == FALSE)
	&& (Npc_HasItems(other, ItWr_Map_AddonWorld) == FALSE))
	{
		Info_AddChoice(DIA_Addon_Riordian_Gegend, "这 个 地 区 有 地 图 吗 ？", DIA_Addon_Riordian_Gegend_map);
		DIA_Addon_Riordian_Gegend_Info_OneTime = TRUE;
	};

	Info_AddChoice(DIA_Addon_Riordian_Gegend, "你 在 哪 里 看 到 了 海 盗 ？", DIA_Addon_Riordian_Gegend_Piraten);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, "再 说 一 下 强 盗 在 哪 里 ？", DIA_Addon_Riordian_Gegend_bandits);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, "你 去 过 西 边 ？", DIA_Addon_Riordian_Gegend_west);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, "再 说 一 下 东 边 有 什 么 ？", DIA_Addon_Riordian_Gegend_ost);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, "如 果 我 向 南 走 能 找 到 什 么 ？", DIA_Addon_Riordian_Gegend_sued);
	Info_AddChoice(DIA_Addon_Riordian_Gegend, "北 边 有 什 么 ？", DIA_Addon_Riordian_Gegend_nord);
};

func void DIA_Addon_Riordian_Gegend_Back()
{
	Info_ClearChoices(DIA_Addon_Riordian_Gegend);
};

func void DIA_Addon_Riordian_Gegend_map()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_map_15_00"); //这 个 地 区 有 地 图 吗 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_map_10_01"); //克 鲁 诺 斯 已 经 做 了 一 个 。 他 肯 定 会 让 你 拥 有 它 的 。
};

func void DIA_Addon_Riordian_Gegend_bandits()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_bandits_15_00"); //再 说 一 下 强 盗 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_01"); //在 东 边 ， 他 们 有 一 座 带 有 很 多 哨 所 的 城 堡 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_bandits_10_02"); //要 想 到 他 们 那 里 ， 你 必 须 要 穿 过 巨 大 的 沼 泽 。
};

func void DIA_Addon_Riordian_Gegend_Piraten()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_Piraten_15_00"); //你 在 哪 里 看 到 了 海 盗 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_01"); //他 们 在 西 边 离 这 里 不 远 的 地 方 转 悠 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_Piraten_10_02"); //我 认 为 他 们 在 打 猎 。
};

func void DIA_Addon_Riordian_Gegend_nord()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_nord_15_00"); //北 边 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_nord_10_01"); //如 果 建 造 者 的 记 录 可 信 的 话 ， 那 么 你 找 到 一 个 被 悬 崖 环 绕 的 巨 大 山 谷 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_nord_10_02"); //干 旱 的 土 地 和 沙 漠 是 那 里 主 要 的 地 形 。
};

func void DIA_Addon_Riordian_Gegend_sued()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_sued_15_00"); //如 果 我 向 南 走 能 找 到 什 么 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_sued_10_01"); //南 边 的 地 面 非 常 崎 岖 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_sued_10_02"); //你 能 在 那 里 找 到 蛇 形 道 路 、 瀑 布 和 岩 石 切 成 的 废 墟 。
};

func void DIA_Addon_Riordian_Gegend_ost()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_ost_15_00"); //再 说 一 下 东 边 有 什 么 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_ost_10_01"); //大 沼 泽 。 那 个 地 区 非 常 危 险 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_ost_10_02"); //那 里 不 仅 有 强 盗 横 行 ， 而 且 还 有 极 其 凶 恶 的 野 兽 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_ost_10_03"); //你 要 小 心 一 些 。
};

var int DIA_Addon_Riordian_Gegend_west_OneTime;
func void DIA_Addon_Riordian_Gegend_west()
{
	AI_Output(other, self, "DIA_Addon_Riordian_Gegend_west_15_00"); //你 去 过 西 边 ？
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_west_10_01"); //不 。 但 是 海 岸 一 定 在 那 里 的 某 个 地 方 。
	AI_Output(self, other, "DIA_Addon_Riordian_Gegend_west_10_02"); //那 可 能 是 海 盗 安 营 的 地 方 。

	if ((DIA_Addon_Riordian_Gegend_west_OneTime == FALSE)
	&& (Npc_HasItems(VLK_4304_Addon_William, ITWr_Addon_William_01)))
	{
		AI_Output(self, other, "DIA_Addon_Riordian_Gegend_west_10_03"); //在 东 边 ， 离 这 里 不 远 的 地 方 ， 我 们 找 到 了 一 个 渔 夫 的 尸 体 。
		AI_Output(self, other, "DIA_Addon_Riordian_Gegend_west_10_04"); //你 应 该 去 看 一 下 。
		B_LogEntry(TOPIC_Addon_MissingPeople, LogText_Addon_WilliamLeiche);
		DIA_Addon_Riordian_Gegend_west_OneTime = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HousesOfRulers
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_HousesOfRulers(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_HousesOfRulers_Condition;
	information		= DIA_Addon_Riordian_HousesOfRulers_Info;
	description		= "萨 图 拉 斯 派 我 来 的 。";
};

func int DIA_Addon_Riordian_HousesOfRulers_Condition()
{
	if (MIS_Saturas_LookingForHousesOfRulers == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_HousesOfRulers_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_HousesOfRulers_15_00"); //萨 图 拉 斯 让 我 过 来 。 我 需 要 搜 索 加 肯 达 的 五 座 大 房 子 。
	AI_Output(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_01"); //我 花 了 很 长 时 间 寻 找 建 造 者 笔 记 中 提 到 的 大 房 子 的 位 置 。
	AI_Output(self, other, "DIA_Addon_Riordian_HousesOfRulers_10_02"); //不 过 现 在 我 可 以 准 确 地 告 诉 你 。
	MIS_Riordian_HousesOfRulers = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info WhereAreHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_WhereAreHouses(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_WhereAreHouses_Condition;
	information		= DIA_Addon_Riordian_WhereAreHouses_Info;
	description		= "我 在 哪 里 去 找 那 五 座 房 子 ？";
};

func int DIA_Addon_Riordian_WhereAreHouses_Condition()
{
	if ((MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Saturas_SCBroughtAllToken == FALSE))
	{
		return TRUE;
	};
};

var int B_WhreAreHousesOfRulersOneTime;
func void B_WhreAreHousesOfRulers()
{
	AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_00"); //学 者 的 房 子 是 一 座 巨 大 的 图 书 馆 。 它 一 定 在 北 边 很 远 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_01"); //战 士 的 房 子 在 东 边 ， 是 一 座 被 岩 石 环 绕 着 的 城 堡 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_02"); //牧 师 和 死 亡 守 护 者 的 住 所 毗 邻 。 你 应 该 能 在 西 南 方 找 到 它 们 。
	AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_03"); //治 疗 者 们 的 康 复 屋 在 东 南 方 。

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_04"); //如 果 这 些 房 子 还 没 倒 的 话 ， 那 么 你 可 以 从 它 们 的 建 筑 方 式 上 进 行 分 辨 。
		B_WhreAreHousesOfRulersOneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_05"); //它 们 是 上 升 式 的 。 陡 峭 的 阶 梯 通 向 高 大 的 圆 柱 掩 映 的 入 口 。

	if (B_WhreAreHousesOfRulersOneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Riordian_WhereAreHouses_10_06"); //我 希 望 那 能 帮 助 你。
	};

	Log_CreateTopic(TOPIC_Addon_HousesOfRulers, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_HousesOfRulers, TOPIC_Addon_HousesOfRulers_1);
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, TOPIC_Addon_HousesOfRulers_2);
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, TOPIC_Addon_HousesOfRulers_3);
	Log_AddEntry(TOPIC_Addon_HousesOfRulers, TOPIC_Addon_HousesOfRulers_4);
};

func void DIA_Addon_Riordian_WhereAreHouses_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_WhereAreHouses_15_00"); //我 在 哪 里 去 找 那 五 座 房 子 ？
	B_WhreAreHousesOfRulers();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundHouse
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundHouse(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_FoundHouse_Condition;
	information		= DIA_Addon_Riordian_FoundHouse_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 大 房 子 … …";
};

func int DIA_Addon_Riordian_FoundHouse_Condition()
{
	if ((MIS_Riordian_HousesOfRulers == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Riordian_WhereAreHouses))
	&& (RiordianHousesFoundCount < 5))
	{
		return TRUE;
	};
};

var int FOUNDHOUSEINFO[6];
const int Library = 1;
const int Heiler = 2;
const int Warrior = 3;
const int Priest = 4;
const int Totenw = 5;
var int RiordianHouseNeuigkeit;
var int RiordianHousesFoundCount;
func void DIA_Addon_Riordian_FoundHouse_Info()
{
	RiordianHouseNeuigkeit = 0;

	AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_00"); //呃 ， 关 于 那 些 大 房 子 … …
	AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_01"); //是 的 ？

	if ((SC_COMESINTO_CANYONLIBRARY_FUNC_OneTime == TRUE)
	&& (FOUNDHOUSEINFO [Library] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_02"); //兽 人 似 乎 对 学 者 的 图 书 馆 很 感 兴 趣 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_03"); //你 觉 得 他 们 能 读 懂 古 代 的 语 言 吗 ？
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_04"); //我 不 这 么 认 为 ， 但 是 谁 又 知 道 呢 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_05"); //虽 然 如 此 ， 也 许 你 还 是 应 该 确 保 让 他 们 离 开 。
		FOUNDHOUSEINFO[Library] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);

		Log_CreateTopic(TOPIC_Addon_CanyonOrcs, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_CanyonOrcs, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_CanyonOrcs, TOPIC_Addon_CanyonOrcs_1);
	};

	if (((Npc_IsDead(StoneGuardian_Heiler)) || (Npc_HasItems(other, ItMi_Addon_Stone_04)) || (Saturas_SCFound_ItMi_Addon_Stone_04 == TRUE))
	&& (FOUNDHOUSEINFO [Heiler] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_06"); //治 疗 者 的 房 子 在 沼 泽 区 域 的 中 部 ， 由 很 多 石 头 哨 兵 把 守 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_07"); //那 么 它 还 矗 立 着 ？
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_08"); //是 的 ， 但 我 担 心 还 能 有 多 久 … …
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_09"); //看 到 这 些 往 昔 的 证 明 处 于 如 此 摇 摇 欲 坠 的 状 态 ， 让 我 的 心 灵 感 到 痛 苦 。
		FOUNDHOUSEINFO[Heiler] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};

	if ((RavenIsInTempel == TRUE)
	&& (FOUNDHOUSEINFO [Warrior] == FALSE))
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_10"); //战 士 的 住 所 被 瑞 雯 用 作 一 个 隐 蔽 所 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_11"); //（ 玩 世 不 恭 的 ） 他 做 了 一 个 不 错 的 选 择 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_12"); //它 可 能 是 在 这 个 地 区 还 能 找 到 的 、 最 安 全 的 城 堡 。
		FOUNDHOUSEINFO[Warrior] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};

	if (((Npc_IsDead(Minecrawler_Priest)) || (Npc_HasItems(other, ItMi_Addon_Stone_03)) || (Saturas_SCFound_ItMi_Addon_Stone_03 == TRUE))
	&& (FOUNDHOUSEINFO [Priest] == FALSE)) // crawler
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_13"); //在 牧 师 的 房 子 里 有 大 量 的 矿 井 爬 行 者 … …
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_14"); //这 些 动 物 对 这 个 地 区 来 说 不 是 非 常 普 通 吗 ？
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_15"); //它 们 当 然 是 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_16"); //以 亚 达 诺 斯 的 名 义 。 在 这 个 地 区 发 生 了 古 怪 的 事 情 。

		FOUNDHOUSEINFO[Priest] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};

	if (((Npc_IsDead(MayaZombie04_Totenw)) || (Npc_HasItems(other, ItMi_Addon_Stone_02)) || (Saturas_SCFound_ItMi_Addon_Stone_02 == TRUE))
	&& (FOUNDHOUSEINFO [Totenw] == FALSE)) // Zombies
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_17"); //死 亡 守 护 者 的 房 子 被 邪 恶 的 力 量 所 支 配 。
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_18"); //我 很 难 想 象 会 在 同 一 个 地 方 看 到 这 么 多 的 僵 尸 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_19"); //那 非 常 不 幸 。 死 亡 守 护 者 显 然 成 为 了 他 们 那 种 特 殊 技 能 的 牺 牲 品 。
		AI_Output(self, other, "DIA_Addon_Riordian_FoundHouse_10_20"); //他 们 与 死 亡 世 界 的 联 系 极 大 地 伤 害 了 他 们 。 我 希 望 你 能 把 他 们 从 痛 苦 中 解 放 出 来 。
		FOUNDHOUSEINFO[Totenw] = TRUE;
		RiordianHouseNeuigkeit = (RiordianHouseNeuigkeit + 1);
	};

	if (RiordianHouseNeuigkeit > 0)
	{
		var int RiordianHouseXPs;
		RiordianHouseXPs = (XP_Addon_Riordian_FoundHouse * RiordianHouseNeuigkeit);
		B_GivePlayerXP(RiordianHouseXPs);

		RiordianHousesFoundCount = (RiordianHousesFoundCount + RiordianHouseNeuigkeit);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Riordian_FoundHouse_15_21"); //再 告 诉 我 一 次 每 个 地 点 的 位 置 。
		B_WhreAreHousesOfRulers();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info OrksWeg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_OrksWeg(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_OrksWeg_Condition;
	information		= DIA_Addon_Riordian_OrksWeg_Info;
	description		= "兽 人 很 快 就 会 对 这 个 地 区 失 去 兴 趣 。";
};

func int DIA_Addon_Riordian_OrksWeg_Condition()
{
	if ((Npc_IsDead(OrcShaman_Sit_CanyonLibraryKey))
	&& (FOUNDHOUSEINFO [Library] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_OrksWeg_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_OrksWeg_15_00"); //兽 人 很 快 就 会 对 这 个 地 区 失 去 兴 趣 。
	AI_Output(self, other, "DIA_Addon_Riordian_OrksWeg_10_01"); //你 为 什 么 要 那 么 说 ？

	if (OrcShaman_Sit_CanyonLibraryKey.aivar [AIV_KilledByPlayer] == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Riordian_OrksWeg_15_02"); //我 杀 死 了 他 们 的 首 领 。
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Riordian_OrksWeg_15_03"); //他 们 的 首 领 已 经 死 了 。
	};

	AI_Output(self, other, "DIA_Addon_Riordian_OrksWeg_10_04"); //我 们 只 能 希 望 你 是 正 确 的 。
	AI_Output(self, other, "DIA_Addon_Riordian_OrksWeg_10_05"); //我 们 现 在 真 的 不 需 要 那 样 的 干 扰 。

	TOPIC_END_CanyonOrcs = TRUE;
	B_GivePlayerXP(XP_Addon_Riordian_OrksWeg);
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAllHouses
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_FoundAllHouses(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_FoundAllHouses_Condition;
	information		= DIA_Addon_Riordian_FoundAllHouses_Info;
	description		= "我 找 到 了 所 有 的 房 子 。";
};

func int DIA_Addon_Riordian_FoundAllHouses_Condition()
{
	if ((RiordianHousesFoundCount >= 5)
	&& (MIS_Riordian_HousesOfRulers == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_FoundAllHouses_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_00"); //我 找 到 了 所 有 的 房 子 。
	AI_Output(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_01"); //它 们 是 否 都 在 我 说 的 位 置 ？
	AI_Output(other, self, "DIA_Addon_Riordian_FoundAllHouses_15_02"); //差 不 多 吧 。
	AI_Output(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_03"); //非 常 好 。 那 么 我 的 工 作 就 有 价 值 了 。
	AI_Output(self, other, "DIA_Addon_Riordian_FoundAllHouses_10_04"); //谢 谢 你 。
	MIS_Riordian_HousesOfRulers = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_FoundAllHouses);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Riordian_ADW_PreTeach(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 5;
	condition		= DIA_Addon_Riordian_ADW_PreTeach_Condition;
	information		= DIA_Addon_Riordian_ADW_PreTeach_Info;
	description		= "你 能 教 给 我 你 的 技 能 吗 ？";
};

func int DIA_Addon_Riordian_ADW_PreTeach_Condition()
{
	return TRUE;
};

func void DIA_Addon_Riordian_ADW_PreTeach_Info()
{
	AI_Output(other, self, "DIA_Addon_Riordian_ADW_PreTeach_15_00"); //你 能 教 给 我 你 的 技 能 吗 ？
	AI_Output(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_01"); //我 可 以 教 你 炼 金 的 技 艺 。

	if ((Npc_HasItems(other, ItAm_Addon_WispDetector))
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE))
	{
		AI_Output(self, other, "DIA_Addon_Riordian_ADW_PreTeach_10_02"); //我 能 教 你 如 何 训 练 你 的 磷 火 搜 索 物 品 。

		Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
		B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeach);
	};

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_RiordianTeachAlchemy);

	Riordian_ADW_ADDON_TeachWisp = TRUE;
	Riordian_ADW_ADDON_TeachAlchemy = TRUE;
};
instance DIA_Addon_Riordian_ADW_Teach(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 90;
	condition		= DIA_Addon_Riordian_ADW_Teach_Condition;
	information		= DIA_Addon_Riordian_ADW_Teach_Info;
	permanent		= TRUE;
	description		= "告 诉 我 怎 么 训 练 我 的 磷 火 。";
};

var int DIA_Addon_Riordian_ADW_Teach_NoPerm;

func int DIA_Addon_Riordian_ADW_Teach_Condition()
{
	if ((DIA_Addon_Riordian_ADW_Teach_NoPerm == FALSE)
	&& (DIA_Addon_Riordian_Teach_NoPerm == FALSE)
	&& (Riordian_ADW_ADDON_TeachWisp == TRUE)
	&& (Npc_HasItems(other, ItAm_Addon_WispDetector)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_Info()
{
	B_DIA_Addon_Riordian_Teach_15_00();

	if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
	|| (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
		Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, DIALOG_BACK, DIA_Addon_Riordian_ADW_Teach_BACK);
		B_DIA_Addon_Riordian_Teach_10_01();

		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_FF, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FF)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF);
		};

		if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_NONE, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_NONE)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE)
		&& (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_RUNE, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_RUNE)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE)
		&& (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_MAGIC, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_MAGIC)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE)
		&& (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_FOOD, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_FOOD)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD);
		};

		if ((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE)
		&& (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(DIA_Addon_Riordian_ADW_Teach, B_BuildLearnString(NAME_ADDON_WISPSKILL_POTIONS, B_GetLearnCostTalent(other, NPC_TALENT_WISPDETECTOR, WISPSKILL_POTIONS)), DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS);
		};
	}
	else
	{
		B_DIA_Addon_Riordian_Teach_10_08();
		DIA_Addon_Riordian_ADW_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X()
{
	B_DIA_Addon_Riordian_Teach_WISPSKILL_X_10_00();
};

func void DIA_Addon_Riordian_ADW_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FF()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_FF))
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};

		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_NONE()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_NONE))
	{
		if (WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};

		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_RUNE()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_RUNE))
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};

		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_MAGIC()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_MAGIC))
	{
		if (WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};

		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_FOOD()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_FOOD))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

func void DIA_Addon_Riordian_ADW_Teach_WISPSKILL_POTIONS()
{
	if (B_TeachPlayerTalentWispDetector(self, other, WISPSKILL_POTIONS))
	{
		DIA_Addon_Riordian_ADW_Teach_WISPSKILL_X();
	};

	Info_ClearChoices(DIA_Addon_Riordian_ADW_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info TeachAlchemy
///////////////////////////////////////////////////////////////////////
instance DIA_Riordian_ADW_TeachAlchemy(C_INFO)
{
	npc				= KDW_14040_Addon_Riordian_ADW;
	nr				= 2;
	condition		= DIA_Riordian_ADW_TeachAlchemy_Condition;
	information		= DIA_Riordian_ADW_TeachAlchemy_Info;
	permanent		= TRUE;
	description		= "教 我 酿 造 药 剂 的 技 巧 。";
};

// ----------------------------------------
var int DIA_Riordian_ADW_TeachAlchemy_permanent;
// ----------------------------------------

func int DIA_Riordian_ADW_TeachAlchemy_Condition()
{
	if ((DIA_Riordian_ADW_TeachAlchemy_permanent == FALSE)
	&& (Riordian_ADW_ADDON_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other, self, "DIA_Addon_Riordian_ADW_TeachAlchemy_15_00"); //教 我 酿 造 药 剂 的 技 巧 。

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE))
	{
		Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, DIALOG_BACK, DIA_Riordian_ADW_TeachAlchemy_BACK);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Riordian_ADW_TeachAlchemy_Health_01);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_HealthPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Riordian_ADW_TeachAlchemy_Health_02);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Riordian_ADW_TeachAlchemy_Mana_01);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_ManaPotion2, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Riordian_ADW_TeachAlchemy_Mana_02);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_ManaPotion3, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_03)), DIA_Riordian_ADW_TeachAlchemy_Mana_03);
		talente = (talente + 1);
	};

	if ((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_ManaPermanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_Mana)), DIA_Riordian_ADW_TeachAlchemy_Perm_Mana);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_DEX] == FALSE)
	{
		Info_AddChoice(DIA_Riordian_ADW_TeachAlchemy, B_BuildLearnString(NAME_Dex_Permanent, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Perm_DEX)), DIA_Riordian_ADW_TeachAlchemy_Perm_DEX);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output(self, other, "DIA_Addon_Riordian_ADW_TeachAlchemy_10_01"); //魔 法 药 剂 是 在 炼 金 术 士 工 作 台 上 酿 造 的 。 我 们 的 住 所 里 有 一 个 。
			AI_Output(self, other, "DIA_Addon_Riordian_ADW_TeachAlchemy_10_02"); //你 需 要 一 个 空 的 实 验 烧 瓶 ， 必 要 的 原 料 ， 以 及 如 何 制 造 药 剂 的 知 识 。
			AI_Output(self, other, "DIA_Addon_Riordian_ADW_TeachAlchemy_10_03"); //你 可 以 从 我 这 里 学 会 那 些 知 识 。 其 它 的 东 西 你 必 须 要 自 己 去 找 。
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Addon_Riordian_ADW_TeachAlchemy_10_04"); //你 想 要 酿 造 什 么 ？
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Riordian_ADW_TeachAlchemy_10_05"); //我 无 法 再 教 你 任 何 你 还 不 知 道 的 东 西 了 。
		DIA_Riordian_ADW_TeachAlchemy_permanent = TRUE;
	};
};

func void DIA_Riordian_ADW_TeachAlchemy_BACK()
{
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Health_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_02);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_03);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_Mana);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};

func void DIA_Riordian_ADW_TeachAlchemy_Perm_Dex()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Perm_DEX);
	Info_ClearChoices(DIA_Riordian_ADW_TeachAlchemy);
};
