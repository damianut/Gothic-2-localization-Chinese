// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Addon_Skip_EXIT(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 999;
	condition		= DIA_Addon_Skip_EXIT_Condition;
	information		= DIA_Addon_Skip_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Skip_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Skip_PICKPOCKET(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 900;
	condition		= DIA_Addon_Skip_PICKPOCKET_Condition;
	information		= DIA_Addon_Skip_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Addon_Skip_PICKPOCKET_Condition()
{
	C_Beklauen(20, 43);
};

func void DIA_Addon_Skip_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET, DIALOG_BACK, DIA_Addon_Skip_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Skip_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Skip_PICKPOCKET_DoIt);
};

func void DIA_Addon_Skip_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

func void DIA_Addon_Skip_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Skip_PICKPOCKET);
};

// ************************************************************
// 			  				Hello
// ************************************************************
instance DIA_Addon_Skip_Hello(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 1;
	condition		= DIA_Addon_Skip_Hello_Condition;
	information		= DIA_Addon_Skip_Hello_Info;
	important		= TRUE;
};

func int DIA_Addon_Skip_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& PlayerTalkedToSkipNW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_00"); //我 们 在 这 里 ， 又 碰 到 了 老 斯 奇 普 。
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_01"); //（ 夸 张 的 ） 我 认 识 你 ！
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_02"); //城 市 附 近 的 海 湾 ， 记 得 吗 ？
	AI_Output(other, self, "DIA_Addon_Skip_Hello_15_03"); //斯 奇 普 ！ 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_04"); //（ 自 豪 的 ） 我 知 道 我 上 一 次 给 你 留 下 的 印 象 很 深 刻 。
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_05"); //但 是 我 同 时 在 别 的 地 方 见 过 你 的 画 像 … …
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_06"); //不 过 当 然 ！
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_07"); //哦 好 。 不 是 很 像 ， 但 肯 定 就 是 你 。
	AI_Output(self, other, "DIA_Addon_Skip_Hello_08_08"); //不 要 让 它 影 响 你 。 我 自 己 的 通 缉 海 报 看 起 来 就 是 傻 里 傻 气 的 。
	Npc_ExchangeRoutine(self, "Start");
};

// ************************************************************
// 			  			 Baltrams Paket
// ************************************************************
instance DIA_Addon_SkipADW_BaltramPaket(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 2;
	condition		= DIA_Addon_SkipADW_BaltramPaket_Condition;
	information		= DIA_Addon_SkipADW_BaltramPaket_Info;
	description		= "我 有 一 个 包 裹 给 你 ， 从 贝 尔 卓 姆 那 里 来 的 。";
};

func int DIA_Addon_SkipADW_BaltramPaket_Condition()
{
	if (Npc_HasItems(other, ItMi_Packet_Baltram4Skip_Addon))
	{
		return TRUE;
	};
};

func void DIA_Addon_SkipADW_BaltramPaket_Info()
{
	AI_Output(other, self, "DIA_Addon_SkipADW_BaltramPaket_15_00"); //我 有 一 个 包 裹 给 你 ， 从 贝 尔 卓 姆 那 里 来 的 。
	AI_Output(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_01"); //（ 露 齿 而 笑 ） 如 果 那 个 家 伙 跟 在 我 们 后 面 ， 一 路 上 把 他 的 东 西 发 到 这 里 的 话 ， 他 一 定 会 非 常 喜 欢 我 们 的 朗 姆 酒 。
	B_GiveInvItems(other, self, ItMi_Packet_Baltram4Skip_Addon, 1);
	AI_Output(self, other, "DIA_Addon_SkipADW_BaltramPaket_08_02"); //给 ， 这 两 瓶 朗 姆 酒 给 他 。 我 会 在 等 他 来 的 时 候 ， 喝 掉 第 三 瓶 。
	B_GiveInvItems(self, other, ItFo_Addon_Rum, 2);
	B_GivePlayerXP(XP_Addon_Skip_BaltramPaket);
	B_LogEntry(TOPIC_Addon_BaltramSkipTrade, LogText_Addon_SkipsRumToBaltram);
	Skip_Rum4Baltram = TRUE;
};

// ************************************************************
// 			  			Was machst du hier?
// ************************************************************
instance DIA_Addon_Skip_Job(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 3;
	condition		= DIA_Addon_Skip_Job_Condition;
	information		= DIA_Addon_Skip_Job_Info;
	description		= "你 在 这 里 做 什 么 ？";
};

func int DIA_Addon_Skip_Job_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Job_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Job_15_00"); //你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Addon_Skip_Job_08_01"); //我 刚 刚 从 克 霍 里 尼 斯 回 来 ， 现 在 我 正 等 着 格 雷 格 返 回 。
};

// ************************************************************
// 			  			Greg getroffen!
// ************************************************************
instance DIA_Addon_Skip_ADW_GregGetroffen(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 4;
	condition		= DIA_Addon_Skip_ADW_GregGetroffen_Condition;
	information		= DIA_Addon_Skip_ADW_GregGetroffen_Info;
	description		= "我 在 克 霍 里 尼 斯 看 到 了 格 雷 格 。";
};

func int DIA_Addon_Skip_ADW_GregGetroffen_Condition()
{
	if ((PlayerTalkedToGregNW == TRUE)
	&& (GregIsBack == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Skip_Job)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ADW_GregGetroffen_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_ADW_GregGetroffen_15_00"); //我 在 克 霍 里 尼 斯 看 到 了 格 雷 格 。
	AI_Output(self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_01"); //真 的 吗 ？ 该 死 ！ 那 么 一 定 有 什 么 事 情 出 差 错 了 。
	AI_Output(self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_02"); //他 应 该 一 段 时 间 之 前 就 和 我 们 的 船 一 起 到 了 这 里 。
	AI_Output(self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_03"); //（ 焦 虑 的 ） 我 想 我 应 该 返 回 克 霍 里 尼 斯 ， 并 在 那 里 等 他 … …
	AI_Output(self, other, "DIA_Addon_Skip_ADW_GregGetroffen_08_04"); //（ 叹 息 ） 但 是 今 天 当 然 不 行 。 我 才 刚 刚 到 这 里 。
	B_GivePlayerXP(XP_Ambient);
};

// ************************************************************
// 			  			Überfahrt - PERM
// ************************************************************
var int Skip_Transport_Variation;
// ------------------------------------------------------------
instance DIA_Addon_Skip_Transport(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 99;
	condition		= DIA_Addon_Skip_Transport_Condition;
	information		= DIA_Addon_Skip_Transport_Info;
	permanent		= TRUE;
	description		= "你 能 带 我 去 克 霍 里 尼 斯 吗 ？";
};

func int DIA_Addon_Skip_Transport_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_Job))
	&& (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Transport_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Transport_15_00"); //你 能 带 我 去 克 霍 里 尼 斯 吗 ？
	if (GregIsBack == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Skip_Transport_08_01"); //没 门 。 我 现 在 不 会 离 开 的 。 我 要 先 找 一 些 像 样 的 烈 酒 大 喝 一 顿 。
	}
	else if (Skip_Transport_Variation == 0)
	{
		AI_Output(self, other, "DIA_Addon_Skip_Transport_08_02"); //你 疯 了 吗 ？ 我 们 的 船 已 经 丢 了 ， 老 兄 ！
		AI_Output(self, other, "DIA_Addon_Skip_Transport_08_03"); //我 绝 对 不 会 因 为 你 这 个 懒 鬼 不 愿 意 亲 自 去 克 霍 里 尼 斯 ， 就 让 我 们 最 后 的 一 艘 船 出 去 兜 风 ！
		Skip_Transport_Variation = 1;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_Transport_08_04"); //最 后 一 次 ： 不 ！
	};
};

// ************************************************************
// 			 			Banditen + Rüstung
// ************************************************************
// ------------------------------------------------------------
// 							About Bandits
// ------------------------------------------------------------
instance DIA_Addon_Skip_Bandits(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 6;
	condition		= DIA_Addon_Skip_Bandits_Condition;
	information		= DIA_Addon_Skip_Bandits_Info;
	description		= "关 于 强 盗 你 能 告 诉 我 一 些 什 么 ？";
};

func int DIA_Addon_Skip_Bandits_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_Bandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Bandits_15_00"); //关 于 强 盗 你 能 告 诉 我 一 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_01"); //强 盗 ？ ！ 他 们 在 攻 击 我 们 ！
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_02"); //对 于 我 们 修 建 的 这 个 栅 栏 ， 你 有 什 么 想 法 ？
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_03"); //那 些 卑 鄙 的 家 伙 是 我 们 亲 自 带 到 这 里 来 的 。
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_04"); //我 们 最 初 和 他 们 交 易 。 小 伙 子 ， 让 我 告 诉 你 ， 他 们 已 经 比 原 先 连 做 什 么 都 不 知 道 的 时 候 赚 的 钱 更 多 了 ！
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_05"); //他 们 为 了 一 瓶 朗 姆 酒 愿 意 付 出 任 何 代 价 。
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_06"); //但 是 那 些 日 子 过 去 了 。 现 在 是 战 争 ！
	AI_Output(other, self, "DIA_Addon_Erol_Bandits_15_06"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_07"); //那 些 混 蛋 还 没 付 上 次 的 船 费 。
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_08"); //所 以 我 就 去 那 里 看 看 我 们 的 金 子 怎 么 了 。
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_09"); //但 是 当 我 到 了 沼 泽 的 时 候 ， 那 些 畜 牲 攻 击 我 ！
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_10"); //而 且 那 还 没 完 。 他 们 杀 了 安 格 斯 和 汉 克 ！ 我 们 最 好 的 两 个 人 ！
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_11"); //最 好 离 那 沼 泽 远 点 ， 我 警 告 你 ！
	AI_Output(self, other, "DIA_Addon_Skip_Bandits_08_12"); //他 们 会 追 击 任 何 看 起 来 和 他 们 那 卑 鄙 的 样 子 不 同 的 人 。
};

// ------------------------------------------------------------
// 						Banditenrüstung
// ------------------------------------------------------------
instance DIA_Addon_Skip_ArmorPrice(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 6;
	condition		= DIA_Addon_Skip_ArmorPrice_Condition;
	information		= DIA_Addon_Skip_ArmorPrice_Info;
	description		= "我 需 要 强 盗 盔 甲 ！";
};

func int DIA_Addon_Skip_ArmorPrice_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_Bandits))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ArmorPrice_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_ArmorPrice_15_00"); //我 需 要 强 盗 盔 甲 。
	AI_Output(self, other, "DIA_Addon_Skip_ArmorPrice_08_01"); //你 想 要 去 那 里 ？ 你 疯 了 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_ArmorPrice_08_02"); //一 旦 那 些 家 伙 发 现 你 不 是 他 们 中 的 一 员 ， 你 就 要 变 成 香 肠 的 肉 馅 了 ！
	AI_Output(other, self, "DIA_Addon_Skip_ArmorPrice_15_02"); //你 知 道 我 可 以 到 哪 里 弄 到 一 套 那 样 的 盔 甲 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_ArmorPrice_08_03"); //（ 叹 息 ） 你 不 会 轻 易 放 弃 ， 对 吗 ？ 好 吧 。 我 们 以 前 有 一 套 服 装 。
	AI_Output(self, other, "DIA_Addon_Skip_ArmorPrice_08_04"); //格 雷 格 可 能 还 把 它 放 在 他 的 小 屋 里 。
	AI_Output(self, other, "DIA_Addon_Skip_ArmorPrice_08_05"); //也 许 你 可 以 等 他 回 来 的 时 候 向 他 买 … …

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_1);
};

// ------------------------------------------------------------
// 						In Gregs Hütte
// ------------------------------------------------------------
instance DIA_Addon_Skip_GregsHut(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 6;
	condition		= DIA_Addon_Skip_GregsHut_Condition;
	information		= DIA_Addon_Skip_GregsHut_Info;
	description		= "你 能 告 诉 我 怎 么 进 入 格 雷 格 小 屋 吗 ？";
};

func int DIA_Addon_Skip_GregsHut_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_ArmorPrice))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GregsHut_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_GregsHut_15_00"); //你 能 告 诉 我 怎 么 进 入 格 雷 格 小 屋 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_GregsHut_08_01"); //哇 留 神 ！ 不 要 那 么 急 ！
	AI_Output(self, other, "DIA_Addon_Skip_GregsHut_08_02"); //你 不 会 打 算 想 要 洗 劫 格 雷 格 的 东 西 吧 ， 是 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_GregsHut_08_03"); //当 他 离 开 的 时 候 ， 他 把 钥 匙 交 给 了 弗 朗 西 斯 ， 并 告 诉 他 ， 不 要 让 ‘ 任 何 人 ’ 进 入 他 的 小 屋 。

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_2);

	Knows_GregsHut = TRUE;
};

// ------------------------------------------------------------
//					Über Francis --> Samuel
// ------------------------------------------------------------
instance DIA_Addon_Skip_Francis(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 6;
	condition		= DIA_Addon_Skip_Francis_Condition;
	information		= DIA_Addon_Skip_Francis_Info;
	description		= "关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？";
};

func int DIA_Addon_Skip_Francis_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_GregsHut))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Francis_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Francis_15_00"); //关 于 弗 朗 西 斯 你 能 告 诉 我 些 什 么 ？
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_01"); //弗 朗 西 斯 是 我 们 的 会 计 。
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_02"); //船 长 信 任 他 。 可 能 就 是 因 此 才 会 让 他 指 挥 。
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_03"); //不 过 这 里 没 人 真 的 把 他 当 作 头 儿 来 看 。
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_04"); //如 果 你 还 想 知 道 更 多 ， 去 和 塞 缪 尔 谈 谈 。
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_05"); //他 去 了 北 边 一 个 小 山 洞 里 的 蒸 馏 器 那 里 。
	AI_Output(self, other, "DIA_Addon_Skip_Francis_08_06"); //这 个 营 地 里 所 有 人 的 所 有 事 ， 没 有 塞 缪 尔 不 知 道 的 … …

	B_LogEntry(TOPIC_Addon_BDTRuestung, TOPIC_Addon_BDTRuestung_3);
};

// ************************************************************
// 						Die Turmbanditen
// ************************************************************
// ------------------------------------------------------------
// 			 				Raven
// ------------------------------------------------------------
instance DIA_Addon_Skip_Raven(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 5;
	condition		= DIA_Addon_Skip_Raven_Condition;
	information		= DIA_Addon_Skip_Raven_Info;
	description		= "你 曾 经 遇 到 过 瑞 雯 ？";
};

func int DIA_Addon_Skip_Raven_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_Bandits) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Raven_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Raven_15_00"); //你 曾 经 遇 到 过 瑞 雯 ？
	AI_Output(self, other, "DIA_Addon_Skip_Raven_08_01"); //当 然 。 当 我 跟 亨 利 在 一 起 的 时 候 ， 从 大 门 的 上 面 ， 我 看 到 瑞 雯 安 排 了 一 些 人 进 入 了 南 边 的 塔 里 。
	AI_Output(self, other, "DIA_Addon_Skip_Raven_08_02"); //我 们 的 营 地 里 只 扔 了 一 些 石 头 出 去 。 （ 大 笑 ） 我 想 他 们 是 要 监 视 我 们 。
	AI_Output(self, other, "DIA_Addon_Skip_Raven_08_03"); //我 也 看 到 了 当 他 的 人 没 有 按 照 他 的 吩 咐 去 做 时 ， 他 是 怎 么 对 待 他 们 的 。
	AI_Output(self, other, "DIA_Addon_Skip_Raven_08_04"); //他 会 迅 速 解 决 掉 那 些 没 有 完 全 按 照 他 的 命 令 去 做 的 人 。
	AI_Output(self, other, "DIA_Addon_Skip_Raven_08_05"); //牢 记 我 的 话 ： 离 瑞 雯 远 点 。
};

// ************************************************************
// *** ***
// 						Die Angus und Hank Show
// *** ***
// ************************************************************

// ------------------------------------------------------------
// 			 			Angus und Hank.
// ------------------------------------------------------------
instance DIA_Addon_Skip_AngusHank(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 5;
	condition		= DIA_Addon_Skip_AngusHank_Condition;
	information		= DIA_Addon_Skip_AngusHank_Info;
	description		= "在 告 诉 我 一 些 关 于 安 格 斯 与 汉 克 的 事 。";
};

func int DIA_Addon_Skip_AngusHank_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Skip_Bandits))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHank_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_AngusnHank_15_00"); //在 告 诉 我 一 些 关 于 安 格 斯 与 汉 克 的 事 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_01"); //安 格 斯 和 汉 克 应 该 是 在 营 地 前 面 和 一 些 强 盗 碰 上 了 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_02"); //他 们 带 着 各 种 各 样 的 补 给 品 - 那 些 混 蛋 向 我 们 订 购 的 所 有 东 西 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_03"); //锻 钢 、 开 锁 工 具 还 有 古 董 架 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_04"); //但 是 他 们 再 也 没 回 来 。 那 些 强 盗 畜 牲 一 定 已 经 把 他 们 干 掉 了 ！
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_05"); //摩 根 和 比 尔 出 去 找 他 们 - 但 是 没 有 成 功 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_06"); //比 尔 深 受 打 击 ， 。 他 们 都 是 他 的 朋 友 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_07"); //他 还 年 青 ， 这 些 事 情 对 他 影 响 很 大 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_08"); //我 们 剩 下 的 人 只 能 坦 然 接 受 。 货 物 的 损 失 我 们 能 承 受 。 （ 叹 息 ） 但 是 他 们 携 带 的 那 些 烈 酒 … …
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHank_08_09"); //（ 生 气 ） 我 们 正 在 谈 论 的 至 少 有 2 0 瓶 ！
	MIS_ADDON_SkipsGrog = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_SkipsGrog, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_SkipsGrog, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_1);
	Log_AddEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_2);
	Log_AddEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_3);
};

// ------------------------------------------------------------
// 			 		Angus und Hank sind TOT
// ------------------------------------------------------------
instance DIA_Addon_Skip_AngusHankDead(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 5;
	condition		= DIA_Addon_Skip_AngusHankDead_Condition;
	information		= DIA_Addon_Skip_AngusHankDead_Info;
	description		= "关 于 安 格 斯 与 汉 克 ...";
};

func int DIA_Addon_Skip_AngusHankDead_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_Bandits))
	&& (!Npc_HasItems(Angus, ItRi_Addon_MorgansRing_Mission)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankDead_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_AngusnHankDead_15_00"); //关 于 安 格 斯 与 汉 克 … …
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHankDead_08_01"); //为 什 么 ？
	AI_Output(other, self, "DIA_Addon_Skip_AngusnHankDead_15_01"); //我 找 到 了 他 们 。
	// AI_Output(self,other, "DIA_Addon_Skip_AngusnHankDead_08_02"); // Sie sind tot, richtig?
	AI_Output(other, self, "DIA_Addon_Skip_AngusnHankDead_15_03"); //他 们 死 了 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHankDead_08_03"); //（ 自 言 自 语 ） 确 实 已 经 死 了 - 可 怜 的 家 伙 ！
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHankDead_08_04"); //嗯 ， 那 是 唯 一 值 得 期 待 的 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHankDead_08_05"); //如 果 你 还 没 有 做 完 的 话 ， 你 应 该 告 诉 比 尔 。
	AI_Output(self, other, "DIA_Addon_Skip_AngusnHankDead_08_06"); //说 得 委 婉 一 点 - 他 还 年 青 。
};

// ------------------------------------------------------------
// 			 			Kenne den Mörder
// ------------------------------------------------------------
instance DIA_Addon_Skip_AngusHankMurder(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 5;
	condition		= DIA_Addon_Skip_AngusHankMurder_Condition;
	information		= DIA_Addon_Skip_AngusHankMurder_Info;
	description		= "我 知 道 是 谁 谋 杀 了 安 格 斯 与 汉 克 。";
};

func int DIA_Addon_Skip_AngusHankMurder_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Skip_AngusHankDead))
	&& (SC_Knows_JuanMurderedAngus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AngusHankMurder_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_JuanMurder_15_00"); //我 知 道 是 谁 谋 杀 了 安 格 斯 与 汉 克 。
	if (MIS_ADDON_SkipsGrog == LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Skip_AngusHankMurder_08_01"); //很 好 。 他 们 都 死 了 。 那 么 现 在 谁 在 乎 呢 ？
		AI_Output(self, other, "DIA_Addon_Skip_AngusHankMurder_08_02"); //没 有 海 盗 能 通 过 复 仇 发 财 。
		AI_Output(self, other, "DIA_Addon_Skip_AngusHankMurder_08_03"); //只 要 我 能 把 我 的 烈 酒 找 回 来 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_AngusHankMurder_08_04"); //我 不 在 乎 是 谁 谋 杀 了 他 们 。 我 的 烈 酒 怎 么 样 了 ？!
	};
};

// ------------------------------------------------------------
// 							Grog zurück
// ------------------------------------------------------------
instance DIA_Addon_Skip_Grog(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 9;
	condition		= DIA_Addon_Skip_Grog_Condition;
	information		= DIA_Addon_Skip_Grog_Info;
	permanent		= TRUE;
	description		= "关 于 烈 酒...";
};

func int DIA_Addon_Skip_Grog_Condition()
{
	if (MIS_ADDON_SkipsGrog == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Grog_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Grog_15_00"); //关 于 烈 酒 … …

	if (Npc_HasItems(other, Itfo_Addon_Grog) >= 20)
	{
		Info_ClearChoices(DIA_Addon_Skip_Grog);
		Info_AddChoice(DIA_Addon_Skip_Grog, DIALOG_BACK, DIA_Addon_Skip_Grog_back);
		Info_AddChoice(DIA_Addon_Skip_Grog, "这 是 你 的 ２ ０ 瓶 酒", DIA_Addon_Skip_Grog_geben);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Skip_Grog_15_01"); //你 丢 了 2 0 瓶 ， 对 吗 ？
		AI_Output(self, other, "DIA_Addon_Skip_Grog_08_02"); //是 的 ， 该 死 。 我 全 部 的 库 存 。
	};
};

func void DIA_Addon_Skip_Grog_back()
{
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_geben()
{
	AI_Output(other, self, "DIA_Addon_Skip_Grog_geben_15_00"); //这 是 你 的 ２ ０ 瓶 酒 。
	B_GiveInvItems(other, self, Itfo_Addon_Grog, 20);

	B_LogEntry(TOPIC_Addon_SkipsGrog, TOPIC_Addon_SkipsGrog_4);

	MIS_ADDON_SkipsGrog = LOG_SUCCESS;
	B_GivePlayerXP(XP_Addon_SkipsGrog);

	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_01"); //什 么 ？ 真 的 ？ 就 像 那 样 ？
	AI_Output(other, self, "DIA_Addon_Skip_Grog_geben_15_02"); //好 … …
	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_03"); //好 吧 。 我 为 它 们 付 钱 。
	AI_Output(other, self, "DIA_Addon_Skip_Grog_geben_15_04"); //你 还 会 对 钱 之 外 的 什 么 东 西 敢 兴 趣 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_05"); //嗯 。 我 们 看 一 下 。 我 这 里 有 这 个 戒 指 。
	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_06"); //我 几 年 前 在 一 个 肮 脏 的 码 头 酒 吧 里 赢 了 它 。
	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_07"); //那 个 时 候 ， 那 个 家 伙 告 诉 我 它 有 魔 法 。 不 知 道 是 不 是 真 的 。
	AI_Output(self, other, "DIA_Addon_Skip_Grog_geben_08_08"); //也 许 对 你 来 说 ， 可 以 用 那 个 代 替 金 币 ？

	Info_ClearChoices(DIA_Addon_Skip_Grog);
	Info_AddChoice(DIA_Addon_Skip_Grog, "给 我 钱 。", DIA_Addon_Skip_Grog_gold);
	Info_AddChoice(DIA_Addon_Skip_Grog, "把 戒 指 给 我 。", DIA_Addon_Skip_Grog_ring);
};

func void DIA_Addon_Skip_Grog_ring()
{
	AI_Output(other, self, "DIA_Addon_Skip_Grog_ring_15_00"); //把 戒 指 给 我 。
	AI_Output(self, other, "DIA_Addon_Skip_Grog_ring_08_01"); //给 你 。
	B_GiveInvItems(self, other, ItRi_Prot_Edge_02, 1);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

func void DIA_Addon_Skip_Grog_gold()
{
	AI_Output(other, self, "DIA_Addon_Skip_Grog_gold_15_00"); //给 我 钱 。
	AI_Output(self, other, "DIA_Addon_Skip_Grog_gold_08_01"); //好 吧 。
	var int GrogKohle;
	GrogKohle = (Value_Grog * 20);
	B_GiveInvItems(self, other, ItMi_Gold, GrogKohle);
	Info_ClearChoices(DIA_Addon_Skip_Grog);
};

// ************************************************************
// 			  				TRADE
// ************************************************************
instance DIA_Addon_Skip_News(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 888;
	condition		= DIA_Addon_Skip_News_Condition;
	information		= DIA_Addon_Skip_News_Info;
	description		= "你 有 什 么 东 西 要 卖 吗 ？";
};

func int DIA_Addon_Skip_News_Condition()
{
	return TRUE;
};

func void DIA_Addon_Skip_News_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_News_15_00"); //你 有 什 么 东 西 要 卖 吗 ？
	AI_Output(self, other, "DIA_Addon_Skip_News_08_01"); //如 果 你 想 要 交 易 的 话 ， 去 找 加 略 特 。 他 负 责 我 们 的 补 给 。

	Log_CreateTopic(Topic_Addon_PIR_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_PIR_Trader, Log_Text_Addon_GarettTrade);
};

// ************************************************************
// *** ***
// 						Mitkommen (Greg)
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 			 				Anheuern
// ------------------------------------------------------------
instance DIA_Addon_Skip_Anheuern(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 11;
	condition		= DIA_Addon_Skip_Anheuern_Condition;
	information		= DIA_Addon_Skip_Anheuern_Info;
	description		= "你 应 该 帮 助 我 。";
};

func int DIA_Addon_Skip_Anheuern_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Anheuern_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_Anheuern_15_00"); //你 应 该 帮 助 我 。
	AI_Output(self, other, "DIA_Addon_Skip_Anheuern_08_01"); //用 什 么 ？
	AI_Output(other, self, "DIA_Addon_Skip_Anheuern_15_01"); //峡 谷 在 前 面 。
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self, other, "DIA_Addon_Skip_Anheuern_08_02"); //我 看 到 你 带 了 几 个 人 一 起 。 好 事 情 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_Anheuern_08_03"); //你 最 好 带 上 几 个 小 伙 子 ！
	};

	AI_Output(self, other, "DIA_Addon_Skip_Anheuern_08_04"); //那 个 峡 谷 像 地 狱 一 样 险 恶 ！
};

// ------------------------------------------------------------
// 						Komm (wieder) mit!
// ------------------------------------------------------------
instance DIA_Addon_Skip_ComeOn(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 12;
	condition		= DIA_Addon_Skip_ComeOn_Condition;
	information		= DIA_Addon_Skip_ComeOn_Info;
	permanent		= TRUE;
	description		= "跟 我 走 。";
};

func int DIA_Addon_Skip_ComeOn_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == FALSE)
	&& (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Addon_Skip_Anheuern)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_ComeOn_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_ComeOn_15_00"); //跟 我 走 。
	if (C_GregsPiratesTooFar() == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Skip_ComeOn_08_02"); //等 等 。 让 我 们 先 返 回 峡 谷 … …
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_ComeOn_08_01"); //我 们 走 ！
		if (C_BodyStateContains(self, BS_SIT))
		{
			AI_StandUp(self);
			B_TurnToNpc(self, other);
		};

		AI_StopProcessInfos(self);

		B_Addon_PiratesFollowAgain();

		Npc_ExchangeRoutine(self, "FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};

// ------------------------------------------------------------
// 							Go Home!
// ------------------------------------------------------------
instance DIA_Addon_Skip_GoHome(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 13;
	condition		= DIA_Addon_Skip_GoHome_Condition;
	information		= DIA_Addon_Skip_GoHome_Info;
	permanent		= TRUE;
	description		= "我 不 再 需 要 你 了 。";
};

func int DIA_Addon_Skip_GoHome_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_GoHome_Info()
{
	AI_Output(other, self, "DIA_Addon_Skip_GoHome_15_00"); //我 不 再 需 要 你 了 。
	AI_Output(self, other, "DIA_Addon_Skip_GoHome_08_01"); //嗯 ， 那 就 那 样 吧 。 你 可 以 在 营 地 找 到 我 。

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "START");
};

// ------------------------------------------------------------
// 			 			Zu weit weg
// ------------------------------------------------------------
instance DIA_Addon_Skip_TooFar(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 14;
	condition		= DIA_Addon_Skip_TooFar_Condition;
	information		= DIA_Addon_Skip_TooFar_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Skip_TooFar_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_GregsPiratesTooFar() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_TooFar_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_TooFar_08_01"); //这 足 够 了 ！
	if (C_HowManyPiratesInParty() >= 2)
	{
		AI_Output(self, other, "DIA_Addon_Skip_TooFar_08_02"); //如 果 你 坚 持 要 继 续 前 进 ， 不 要 算 上 我 们 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Skip_TooFar_08_03"); //如 果 你 坚 持 要 继 续 前 进 ， 不 要 算 上 我 们 。
	};

	B_Addon_PiratesGoHome();

	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 			 			Oase = Treffpunkt
// ------------------------------------------------------------
instance DIA_Addon_Skip_Treffpunkt(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 1;
	condition		= DIA_Addon_Skip_Treffpunkt_Condition;
	information		= DIA_Addon_Skip_Treffpunkt_Info;
	important		= TRUE;
};

func int DIA_Addon_Skip_Treffpunkt_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "ADW_CANYON_TELEPORT_PATH_06") <= 800)
	&& (C_AllCanyonRazorDead() == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Treffpunkt_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_00"); //如 果 我 们 走 散 了 的 话 ， 就 在 水 洞 这 里 会 合 。
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_02"); //我 们 继 续 前 进 ！

	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 			 				Orks!
// ------------------------------------------------------------
instance DIA_Addon_Skip_Orks(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 1;
	condition		= DIA_Addon_Skip_Orks_Condition;
	information		= DIA_Addon_Skip_Orks_Info;
	important		= TRUE;
};

func int DIA_Addon_Skip_Orks_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (Npc_GetDistToWP(self, "ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_Orks_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_01"); //兽 人 ！ 我 讨 厌 那 些 东 西 ！

	AI_StopProcessInfos(self);
};

// ------------------------------------------------------------
// 			 			Alle Razor tot
// ------------------------------------------------------------
instance DIA_Addon_Skip_AllRazorsDead(C_INFO)
{
	npc				= PIR_1355_Addon_Skip;
	nr				= 1;
	condition		= DIA_Addon_Skip_AllRazorsDead_Condition;
	information		= DIA_Addon_Skip_AllRazorsDead_Info;
	important		= TRUE;
};

func int DIA_Addon_Skip_AllRazorsDead_Condition()
{
	if ((self.aivar[AIV_PARTYMEMBER] == TRUE)
	&& (C_AllCanyonRazorDead() == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_AllRazorsDead_Info()
{
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_03"); //看 来 我 们 一 定 遇 到 了 所 有 的 剃 刀 龙 。
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_04"); //如 果 你 愿 意 的 话 ， 我 们 可 以 再 转 得 久 一 点 。
	AI_Output(self, other, "DIA_Addon_Skip_Add_08_05"); //只 要 我 们 还 留 在 峡 谷 里 。

	AI_StopProcessInfos(self);
};
