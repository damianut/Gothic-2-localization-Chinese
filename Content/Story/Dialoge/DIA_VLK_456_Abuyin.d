// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Abuyin_EXIT(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 999;
	condition		= DIA_Abuyin_EXIT_Condition;
	information		= DIA_Abuyin_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Abuyin_PICKPOCKET(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 900;
	condition		= DIA_Abuyin_PICKPOCKET_Condition;
	information		= DIA_Abuyin_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Abuyin_PICKPOCKET_Condition()
{
	C_Beklauen(75, 200);
};

func void DIA_Abuyin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET, DIALOG_BACK, DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

// ************************************************************
// 			  		Hallo
// ************************************************************
instance DIA_Abuyin_Hallo(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Hallo_Condition;
	information		= DIA_Abuyin_Hallo_Info;
	important		= TRUE;
};

func int DIA_Abuyin_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self, other, "DIA_Addon_Abuyin_Hallo_13_00"); //（ 思 考 ） … … 多 么 奇 怪 啊 。 我 好 像 以 前 遇 到 过 你 ， 过 路 人 … …
	AI_Output(self, other, "DIA_Addon_Abuyin_Hallo_13_01"); //嗯 … … 时 间 和 空 间 的 奥 秘 多 么 伟 大 啊 … … 哦 ， 请 原 谅 我 的 无 礼 ， 耐 心 之 子 。 我 甚 至 还 没 有 跟 你 打 过 招 呼 。
	AI_Output(self, other, "DIA_Addon_Abuyin_Hallo_13_02"); //欢 迎 你 ， 朋 友 ， 请 在 我 那 粗 陋 的 垫 子 上 坐 下 安 静 地 享 受 一 支 烟 吧 。
};

// ************************************************************
// 			  		Wer bist du?
// ************************************************************
instance DIA_Abuyin_du(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_du_Condition;
	information		= DIA_Abuyin_du_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other, self, "DIA_Abuyin_du_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Abuyin_du_13_01"); //我 叫 亚 布 因 · 伊 本 · 雅 迪 尔 · 伊 本 · 奥 马 尔 · 卡 里 德 · 本 · 海 吉 · 阿 尔 · 沙 里 迪 。 我 是 一 个 预 言 家 和 先 知 、 一 个 占 星 家 、 一 个 烟 草 传 播 者 。
};

// ************************************************************
// 			  		Kraut
// ************************************************************
instance DIA_Abuyin_Kraut(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Kraut_Condition;
	information		= DIA_Abuyin_Kraut_Info;
	description		= "你 卖 什 么 样 的 烟 草 ？";
};

func int DIA_Abuyin_Kraut_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Kraut_15_00"); //你 卖 什 么 样 的 烟 草 ？
	AI_Output(self, other, "DIA_Abuyin_Kraut_13_01"); //我 的 烟 袋 里 装 的 是 芳 香 、 新 鲜 宜 人 的 苹 果 烟 草 。
	AI_Output(self, other, "DIA_Abuyin_Kraut_13_02"); //你 想 要 的 时 候 自 己 拿 ， 冒 险 之 子 。
};

// ************************************************************
// 			  	anderen Tabak?
// ************************************************************
instance DIA_Abuyin_anderen(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_anderen_Condition;
	information		= DIA_Abuyin_anderen_Info;
	description		= "你 还 有 其 它 烟 草 吗 ？ ";
};

func int DIA_Abuyin_anderen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	AI_Output(other, self, "DIA_Abuyin_anderen_15_00"); //你 还 有 其 它 烟 草 吗 ？
	AI_Output(self, other, "DIA_Abuyin_anderen_13_01"); //我 只 提 供 最 好 的 烟 草 。 这 种 苹 果 配 料 是 来 自 我 家 乡 的 混 合 物 ， 那 是 在 南 部 的 岛 屿 上 。
	AI_Output(self, other, "DIA_Abuyin_anderen_13_02"); //不 过 ， 当 然 ， 我 总 是 很 乐 意 尝 试 一 种 不 同 的 烟 草 - 如 果 有 人 在 制 造 一 种 真 正 优 质 的 烟 草 方 面 取 得 了 成 功 的 话 。
	AI_Output(other, self, "DIA_Abuyin_anderen_15_03"); //那 是 怎 样 做 成 的 ？
	AI_Output(self, other, "DIA_Abuyin_anderen_13_04"); //开 始 用 我 的 苹 果 烟 草 作 为 主 要 成 分 。 然 后 试 着 把 它 跟 其 它 的 配 料 一 起 混 合 。
	AI_Output(self, other, "DIA_Abuyin_anderen_13_05"); //这 是 在 一 个 炼 金 术 士 工 作 台 上 面 完 成 的 ， 倘 若 你 了 解 炼 金 术 的 精 华 的 话 。
};

// ************************************************************
// 			  	Woher
// ************************************************************
instance DIA_Abuyin_Woher(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Woher_Condition;
	information		= DIA_Abuyin_Woher_Info;
	description		= "我 到 哪 里 能 找 到 苹 果 烟 草 ？";
};

func int DIA_Abuyin_Woher_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Woher_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Woher_15_00"); //我 到 哪 里 能 找 到 苹 果 烟 草 ？
	AI_Output(self, other, "DIA_Abuyin_Woher_13_01"); //我 会 给 你 2 份 。 你 可 以 靠 自 己 的 智 慧 ， 按 照 自 己 的 想 法 去 处 理 它 们 。
	AI_Output(self, other, "DIA_Abuyin_Woher_13_02"); //如 果 你 想 要 更 多 的 话 ， 那 么 直 接 去 药 剂 大 师 祖 里 斯 那 里 。 他 生 产 这 种 烟 草 ， 同 时 也 出 售 它 。

	B_GiveInvItems(self, other, ItMi_ApfelTabak, 2);
};

// ************************************************************
func void B_TabakProbieren()
{
	AI_Output(self, other, "DIA_Abuyin_Mischung_Nichts_13_00"); //让 我 尝 尝 你 的 烟 草 。
	CreateInvItems(self, ItMi_Joint, 1);
	B_UseItem(self, ItMi_Joint);
	AI_Output(self, other, "DIA_Abuyin_Mischung_Nichts_13_01"); //不 ， 恐 怕 这 种 混 合 物 不 合 我 的 胃 口 。 不 过 ， 也 许 你 会 发 现 有 其 它 人 真 正 欣 赏 这 种 … … 嗯 … … 美 味 。
};

// ************************************************************
// 			  	Mischung
// ************************************************************
instance DIA_Abuyin_Mischung(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 10;
	condition		= DIA_Abuyin_Mischung_Condition;
	information		= DIA_Abuyin_Mischung_Info;
	permanent		= TRUE;
	description		= "我 有 一 种 新 的 烟 草 混 合 物 … …";
};

func int DIA_Abuyin_Mischung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_anderen)
	&& (Abuyin_Honigtabak == FALSE)
	&& ((Npc_HasItems(other, ItMi_SumpfTabak) >= 1)
	|| (Npc_HasItems(other, ItMi_PilzTabak) >= 1)
	|| (Npc_HasItems(other, ItMi_DoppelTabak) >= 1)
	|| (Npc_HasItems(other, ItMi_Honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Mischung_15_00"); //我 有 一 种 新 的 烟 草 混 合 物 … …

	Info_ClearChoices(DIA_Abuyin_Mischung);
	Info_AddChoice(DIA_Abuyin_Mischung, DIALOG_BACK, DIA_Abuyin_Mischung_BACK);

	if (Npc_HasItems(other, ItMi_SumpfTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung, PRINT_KRAUT, DIA_Abuyin_Mischung_Sumpf);
	};

	if (Npc_HasItems(other, ItMi_PilzTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung, PRINT_PILZ, DIA_Abuyin_Mischung_Pilz);
	};

	if (Npc_HasItems(other, ItMi_DoppelTabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung, PRINT_DOPPEL, DIA_Abuyin_Mischung_Doppel);
	};

	if (Npc_HasItems(other, ItMi_Honigtabak) >= 1)
	{
		Info_AddChoice(DIA_Abuyin_Mischung, PRINT_HONIG, DIA_Abuyin_Mischung_Super);
	};
};

func void DIA_Abuyin_Mischung_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Sumpf()
{
	B_GiveInvItems(other, self, ItMi_SumpfTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Pilz()
{
	B_GiveInvItems(other, self, ItMi_PilzTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Doppel()
{
	B_GiveInvItems(other, self, ItMi_DoppelTabak, 1);
	B_TabakProbieren();
	Info_ClearChoices(DIA_Abuyin_Mischung);
};

func void DIA_Abuyin_Mischung_Super()
{
	B_GiveInvItems(other, self, ItMi_Honigtabak, 1);

	AI_Output(self, other, "DIA_Abuyin_Mischung_Super_13_00"); //让 我 尝 尝 你 的 烟 草 。
	CreateInvItems(self, ItMi_Joint, 1);
	B_UseItem(self, ItMi_Joint);
	AI_Output(self, other, "DIA_Abuyin_Mischung_Super_13_01"); //它 的 味 道 真 是 不 可 思 议 ！ 我 这 一 生 中 还 从 来 没 有 抽 过 比 这 更 好 的 一 根 烟 ！
	AI_Output(self, other, "DIA_Abuyin_Mischung_Super_13_02"); //你 是 怎 么 配 制 这 种 混 合 物 的 ？
	AI_Output(other, self, "DIA_Abuyin_Mischung_Super_15_03"); //我 把 蜂 蜜 混 合 在 这 种 烟 草 里 面 了 。
	AI_Output(self, other, "DIA_Abuyin_Mischung_Super_13_04"); //你 干 得 不 错 ， 混 合 艺 术 之 父 。 我 很 乐 意 用 它 来 填 满 我 那 可 怜 的 烟 袋 。
	AI_Output(other, self, "DIA_Abuyin_Mischung_Super_15_05"); //那 就 装 满 它 吧 。
	AI_Output(self, other, "DIA_Abuyin_Mischung_Super_13_06"); //谢 谢 你 ， 慷 慨 之 子 。 没 有 任 何 其 它 的 混 合 物 能 比 这 种 更 好 了 。 我 将 买 下 全 部 你 能 给 我 带 来 的 这 种 烟 草 。

	Abuyin_Honigtabak = TRUE;
	B_GivePlayerXP((XP_Ambient) * 2);

	Info_ClearChoices(DIA_Abuyin_Mischung);
};

// ************************************************************
// 			  Honigtabak verkaufen
// ************************************************************
instance DIA_Abuyin_Trade(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Trade_Condition;
	information		= DIA_Abuyin_Trade_Info;
	permanent		= TRUE;
	description		= "我 有 一 些 蜜 烟 草 给 你 。";
};

func int DIA_Abuyin_Trade_Condition()
{
	if ((Abuyin_Honigtabak == TRUE)
	&& (Npc_HasItems(other, ItMi_HonigTabak) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	Abuyin_Score = 0;

	Abuyin_Score = (Npc_HasItems(other, Itmi_Honigtabak) * Value_Itmi_Honigtabak);

	AI_Output(other, self, "DIA_Abuyin_Trade_15_00"); //我 有 一 些 蜜 烟 草 给 你 。

	B_GiveInvItems(other, self, ItmI_HonigTabak, Npc_HasItems(other, Itmi_Honigtabak));
	B_GiveInvItems(self, other, ItmI_Gold, Abuyin_Score);

	AI_Output(self, other, "DIA_Abuyin_Trade_13_01"); //跟 你 做 生 意 真 是 一 种 莫 大 的 喜 悦 。
};

// ************************************************************
// 			  		Herb - KrautPaket
// ************************************************************
instance DIA_Abuyin_Herb(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Herb_Condition;
	information		= DIA_Abuyin_Herb_Info;
	description		= "你 对 这 包 烟 草 有 兴 趣 吗 ？";
};

func int DIA_Abuyin_Herb_Condition()
{
	if (Npc_HasItems(other, Itmi_Herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Herb_15_00"); //你 对 这 包 烟 草 有 兴 趣 吗 ？
	AI_Output(self, other, "DIA_Abuyin_Herb_13_01"); //一 包 药 草 - 那 不 是 沼 生 草 ， 是 吗 ？ 哦 ， 把 它 拿 走 ， 目 光 短 浅 之 子 ！
	AI_Output(self, other, "DIA_Abuyin_Herb_13_02"); //一 包 药 草 - 那 不 是 沼 生 草 ， 是 吗 ？ 哦 ， 把 它 拿 走 ， 目 光 短 浅 之 子 ！
	AI_Output(self, other, "DIA_Abuyin_Herb_13_03"); //如 果 你 打 算 要 出 售 这 些 东 西 ， 我 劝 你 - 离 开 这 座 城 。
	AI_Output(self, other, "DIA_Abuyin_Herb_13_04"); //试 着 去 城 外 把 它 处 理 掉 。 在 这 里 ， 你 只 能 用 它 换 回 一 大 堆 麻 烦 。
};

// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Weissagung(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Weissagung_Condition;
	information		= DIA_Abuyin_Weissagung_Info;
	description		= "你 能 帮 我 预 言 一 下 吗 ？";
};

func int DIA_Abuyin_Weissagung_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du)
	&& (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Weissagung_15_00"); //你 能 帮 我 预 言 一 下 吗 ？
	AI_Output(self, other, "DIA_Abuyin_Weissagung_13_01"); //我 对 你 的 服 务 只 收 取 适 中 的 费 用 ， 哦 ， 慷 慨 之 父 。
	AI_Output(other, self, "DIA_Abuyin_Weissagung_15_02"); //你 想 要 多 少 ？
	AI_Output(self, other, "DIA_Abuyin_Weissagung_13_03"); //为 了 微 不 足 道 的 2 5 个 硬 币 ， 我 会 为 你 穿 越 时 间 冒 险 看 一 看 。
	AI_Output(self, other, "DIA_Abuyin_Weissagung_13_04"); //不 过 要 记 住 - 未 来 总 是 无 常 的 。 我 能 做 的 只 有 看 一 眼 时 间 的 碎 片 。
};

// ************************************************************
// 			Weisagen lassen Kapitel 1
// ************************************************************
instance DIA_Abuyin_Zukunft(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Zukunft_Condition;
	information		= DIA_Abuyin_Zukunft_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 我 的 未 来 （ 付 ２ ５ 金 币 ）";
};

// ---------------------------------------
var int DIA_Abuyin_Zukunft_permanent;
// ---------------------------------------
func int DIA_Abuyin_Zukunft_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Weissagung)
	&& (DIA_Abuyin_Zukunft_permanent == FALSE)
	&& (Kapitel == 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Zukunft_15_00"); //告 诉 我 关 于 未 来 的 事 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 25))
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft_13_01"); //好 的 ， 知 识 的 探 索 者 。 我 现 在 将 会 进 入 一 种 恍 惚 的 状 态 。 你 准 备 好 了 吗 ？
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft, "我 准 备 好 了", DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft_13_02"); //哦 ， 金 币 之 父 ， 我 向 你 要 求 2 5 个 金 币 作 为 一 次 查 看 未 来 的 回 报 。
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);

	AI_Output(self, other, "DIA_Abuyin_Zukunft_Trance_13_00"); //（ 恍 惚 的 ） … … 兽 人 … … 他 们 在 守 卫 一 个 入 口 … … 一 个 陈 旧 的 隧 道 … … 矿 藏 山 谷 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft_Trance_13_01"); //（ 恍 惚 的 ） … … 穿 着 闪 亮 盔 甲 的 人 … … 一 个 魔 法 师 … … 你 的 朋 友 跟 他 们 在 一 起 … … 他 在 等 你 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft_Trance_13_02"); //（ 恍 惚 的 ） … … 火 ！ 一 次 进 攻 … … 一 个 庞 然 大 物 … … 火 焰 … … 好 多 … … 将 会 死 去 … …

	AI_Output(self, other, "DIA_Addon_Abuyin_Zukunft_Trance_13_00"); //（ 恍 惚 的 ） … … 那 是 什 么 … … ？ 一 个 城 市 … … 废 墟 … … 夸 霍 德 隆 在 加 肯 达 … …
	AI_Output(self, other, "DIA_Addon_Abuyin_Zukunft_Trance_13_01"); //（ 恍 惚 的 ） … … 他 被 召 唤 了 … … 夸 霍 德 隆 在 加 肯 达 ！

	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Abuyin_Zukunft_Trance_13_03"); //… … 对 不 起 - 那 个 影 像 没 了 。 我 再 也 看 不 到 别 的 了 。

	DIA_Abuyin_Zukunft_permanent = TRUE;
	Abuyin_Zukunft = 1;
	Info_ClearChoices(DIA_Abuyin_Zukunft);

	B_GivePlayerXP((XP_Ambient * 4));
};

// ************************************************************
// 		Kannst du mir noch eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Nochmal(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Nochmal_Condition;
	information		= DIA_Abuyin_Nochmal_Info;
	permanent		= TRUE;
	description		= "你 能 帮 我 做 另 外 的 预 言 吗 ？";
};

func int DIA_Abuyin_Nochmal_Condition()
{
	if (Kapitel == Abuyin_Zukunft)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Nochmal_15_00"); //你 能 再 给 我 做 一 次 预 言 吗 ？
	AI_Output(self, other, "DIA_Abuyin_Nochmal_13_01"); //哦 ， 神 秘 未 来 之 子 ， 要 揭 开 时 间 的 面 纱 不 是 我 能 力 范 围 内 能 办 到 的 。
	AI_Output(self, other, "DIA_Abuyin_Nochmal_13_02"); //只 有 当 时 间 送 给 我 另 一 个 预 兆 时 我 才 有 能 力 再 次 为 你 看 一 看 。

	if (Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other, self, "DIA_Abuyin_Nochmal_15_03"); //那 要 到 什 么 时 候 ？
		AI_Output(self, other, "DIA_Abuyin_Nochmal_13_04"); //当 未 来 变 成 了 现 实 ， 而 你 已 经 继 续 了 你 的 旅 程 。
		Abuyin_Erzaehlt = TRUE;
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 2
// ##
// ##
// #####################################################################

func void B_Abuyin_Weissagung()
{
	AI_Output(other, self, "B_Abuyin_Weissagung_15_00"); //你 能 帮 我 预 言 一 下 吗 ？
	AI_Output(self, other, "B_Abuyin_Weissagung_13_01"); //是 的 ， 时 间 已 经 前 进 了 ， 而 我 会 给 你 一 个 预 言 来 换 取 几 个 硬 币 。
	AI_Output(other, self, "B_Abuyin_Weissagung_15_02"); //多 少 钱 ？
};

// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Weissagung2(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Weissagung2_Condition;
	information		= DIA_Abuyin_Weissagung2_Info;
	description		= "你 能 帮 我 预 言 一 下 吗 ？";
};

func int DIA_Abuyin_Weissagung2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self, other, "DIA_Abuyin_Weissagung2_13_00"); //为 了 微 不 足 道 的 1 0 0 个 硬 币 ， 我 会 为 你 穿 越 时 间 冒 险 看 一 看 。
};

// ************************************************************
// 			Weisagen lassen Kapitel 2
// ************************************************************
instance DIA_Abuyin_Zukunft2(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Zukunft2_Condition;
	information		= DIA_Abuyin_Zukunft2_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 我 的 未 来 （ 付 １ ０ ０ 金 币 ）";
};

// ---------------------------------------
var int DIA_Abuyin_Zukunft2_permanent;
// ---------------------------------------
func int DIA_Abuyin_Zukunft2_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Weissagung2)
	&& (DIA_Abuyin_Zukunft2_permanent == FALSE)
	&& (Kapitel == 2))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Zukunft2_15_00"); //告 诉 我 关 于 未 来 的 事 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 100))
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft2_13_01"); //好 的 ， 勇 敢 之 子 。 我 现 在 将 会 进 入 一 种 恍 惚 的 状 态 。 你 准 备 好 了 吗 ？

		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2, "我 准 备 好 了。", DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft2_13_02"); //哦 ， 金 币 之 父 ， 我 向 你 要 求 1 0 0 个 金 币 作 为 一 次 查 看 未 来 的 回 报 。
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);

	AI_Output(self, other, "DIA_Abuyin_Zukunft2_Trance_13_00"); //（ 恍 惚 的 ） … … 一 个 雇 佣 兵 … … 他 将 需 要 你 … … 一 次 可 怕 的 谋 杀 … … 那 只 ‘ 眼 睛 ’ … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft2_Trance_13_01"); //（ 恍 惚 的 ） … … 那 个 险 恶 的 仆 从 … … 他 们 来 了 … … 寻 找 你 … … 一 个 守 卫 者 将 会 倒 下 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft2_Trance_13_02"); //（ 恍 惚 的 ） … … 但 那 三 个 人 将 会 联 合 … … 只 有 那 样 你 才 能 得 到 你 的 东 西 … …

	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Abuyin_Zukunft2_Trance_13_03"); //就 是 这 些 。 我 再 也 看 不 到 别 的 了 。

	DIA_Abuyin_Zukunft2_permanent = TRUE;
	Abuyin_Zukunft = 2;
	Info_ClearChoices(DIA_Abuyin_Zukunft2);

	B_GivePlayerXP((XP_Ambient * 4));
};

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Weissagung3(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Weissagung3_Condition;
	information		= DIA_Abuyin_Weissagung3_Info;
	description		= "你 能 帮 我 预 言 一 下 吗 ？";
};

func int DIA_Abuyin_Weissagung3_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self, other, "DIA_Abuyin_Weissagung3_13_00"); //为 了 微 不 足 道 的 2 5 0 个 硬 币 ， 我 会 为 你 穿 越 时 间 冒 险 看 一 看 。
};

// ************************************************************
// 			Weisagen lassen Kapitel 3
// ************************************************************
instance DIA_Abuyin_Zukunft3(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Zukunft3_Condition;
	information		= DIA_Abuyin_Zukunft3_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 我 的 未 来 （ 付 ２ ５ ０ 金 币 ）";
};

// ---------------------------------------
var int DIA_Abuyin_Zukunft3_permanent;
// ---------------------------------------
func int DIA_Abuyin_Zukunft3_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Weissagung3)
	&& (DIA_Abuyin_Zukunft3_permanent == FALSE)
	&& (Kapitel == 3))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Zukunft3_15_00"); //告 诉 我 关 于 未 来 的 事 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 250))
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft3_13_01"); //好 的 ， 知 识 之 子 。 我 现 在 将 会 进 入 一 种 恍 惚 的 状 态 。 你 准 备 好 了 吗 ？

		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3, "我 准 备 好 了。", DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft3_13_02"); //哦 ， 金 币 之 父 ， 我 向 你 要 求 2 5 0 个 金 币 作 为 一 次 查 看 未 来 的 回 报 。
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);

	AI_Output(self, other, "DIA_Abuyin_Zukunft3_Trance_13_00"); //（ 恍 惚 的 ） … … 你 将 会 夺 取 … … 不 是 任 何 人 的 命 运 ， 而 是 ， 你 的 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft3_Trance_13_01"); //（ 恍 惚 的 ） … … 穿 过 烈 火 和 白 雪 … … 穿 过 寒 冰 和 火 焰 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft3_Trance_13_02"); //（ 恍 惚 的 ） … … 穿 着 奇 异 盔 甲 的 人 … … 一 片 沼 泽 … … 蜥 蜴 … … 它 们 等 着 你 。

	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Abuyin_Zukunft3_Trance_13_03"); //就 是 这 些 。 我 再 也 看 不 到 别 的 了 。

	DIA_Abuyin_Zukunft3_permanent = TRUE;
	Abuyin_Zukunft = 3;
	Info_ClearChoices(DIA_Abuyin_Zukunft3);

	B_GivePlayerXP((XP_Ambient * 4));
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Weissagung4(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Weissagung4_Condition;
	information		= DIA_Abuyin_Weissagung4_Info;
	description		= "你 能 帮 我 预 言 一 下 吗 ？";
};

func int DIA_Abuyin_Weissagung4_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du)
	&& (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self, other, "DIA_Abuyin_Weissagung4_13_00"); //为 了 微 不 足 道 的 5 0 0 个 硬 币 ， 我 会 为 你 穿 越 时 间 冒 险 看 一 看 。
};

// ************************************************************
// 			Weisagen lassen Kapitel 4
// ************************************************************
instance DIA_Abuyin_Zukunft4(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Zukunft4_Condition;
	information		= DIA_Abuyin_Zukunft4_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 我 的 未 来 （ 付 ５ ０ ０ 金 币 ）";
};

// ---------------------------------------
var int DIA_Abuyin_Zukunft4_permanent;
// ---------------------------------------
func int DIA_Abuyin_Zukunft4_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Weissagung4)
	&& (DIA_Abuyin_Zukunft4_permanent == FALSE)
	&& (Kapitel == 4))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Zukunft4_15_00"); //告 诉 我 关 于 未 来 的 事 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 500))
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft4_13_01"); //好 的 ， 知 识 之 子 。 我 现 在 将 会 进 入 一 种 恍 惚 的 状 态 。 你 准 备 好 了 吗 ？

		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4, "我 准 备 好 了 。", DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft4_13_02"); //哦 ， 金 币 之 父 ， 我 向 你 要 求 5 0 0 个 金 币 作 为 一 次 查 看 未 来 的 回 报 。
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);

	AI_Output(self, other, "DIA_Abuyin_Zukunft4_Trance_13_00"); //（ 恍 惚 的 ） … … 知 识 的 地 点 … … 另 一 个 国 家 … … 远 处 一 个 黑 暗 的 地 方 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft4_Trance_13_01"); //（ 恍 惚 的 ） … … 勇 敢 的 伙 伴 … … 你 将 要 作 出 选 择 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft4_Trance_13_02"); //（ 恍 惚 的 ） … … 一 座 神 殿 … … 孤 独 地 竖 立 在 亚 达 诺 斯 的 王 国 … … 隐 藏 在 雾 霭 中 … …

	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Abuyin_Zukunft4_Trance_13_03"); //就 是 这 些 。 我 再 也 看 不 到 别 的 了 。

	DIA_Abuyin_Zukunft4_permanent = TRUE;
	Abuyin_Zukunft = 4;
	Info_ClearChoices(DIA_Abuyin_Zukunft4);

	B_GivePlayerXP((XP_Ambient * 4));
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 			  Kannst du mir eine Weissagung geben?
// ************************************************************
instance DIA_Abuyin_Weissagung5(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Weissagung5_Condition;
	information		= DIA_Abuyin_Weissagung5_Info;
	description		= "你 能 帮 我 预 言 一 下 吗 ？";
};

func int DIA_Abuyin_Weissagung5_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_du)
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self, other, "DIA_Abuyin_Weissagung5_13_00"); //为 了 微 不 足 道 的 1 0 0 0 个 金 币 ， 我 会 为 你 穿 越 时 间 冒 险 看 一 看 。
};

// ************************************************************
// 			Weisagen lassen Kapitel 5
// ************************************************************
instance DIA_Abuyin_Zukunft5(C_INFO)
{
	npc				= VLK_456_Abuyin;
	nr				= 2;
	condition		= DIA_Abuyin_Zukunft5_Condition;
	information		= DIA_Abuyin_Zukunft5_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 我 的 未 来 （ 付 １ ０ ０ ０ 金 币 ）";
};

// ---------------------------------------
var int DIA_Abuyin_Zukunft5_permanent;
// ---------------------------------------
func int DIA_Abuyin_Zukunft5_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Abuyin_Weissagung5)
	&& (DIA_Abuyin_Zukunft5_permanent == FALSE)
	&& (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other, self, "DIA_Abuyin_Zukunft5_15_00"); //告 诉 我 关 于 未 来 的 事 。

	if (B_GiveInvItems(other, self, ItMI_Gold, 1000))
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft5_13_01"); //好 的 ， 知 识 之 子 。 我 现 在 将 会 进 入 一 种 恍 惚 的 状 态 。 你 准 备 好 了 吗 ？

		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5, "我 准 备 好 了。", DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self, other, "DIA_Abuyin_Zukunft5_13_02"); //哦 ， 金 币 之 父 ， 我 向 你 要 求 1 0 0 0 个 金 币 作 为 一 次 查 看 未 来 的 回 报 。
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT", self, self, 0, 0, 0, FALSE);

	AI_Output(self, other, "DIA_Abuyin_Zukunft5_Trance_13_00"); //（ 恍 惚 的 ） … … 黑 暗 遍 及 大 地 … … 邪 恶 将 要 胜 利 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft5_Trance_13_01"); //（ 恍 惚 的 ） … … 国 王 将 在 兽 人 抵 抗 战 争 中 失 败 … …
	AI_Output(self, other, "DIA_Abuyin_Zukunft5_Trance_13_02"); //（ 恍 惚 的 ） … … 你 将 会 回 来 ， 但 是 ， 你 将 不 会 找 到 宁 静 … …

	AI_PlayAni(self, "T_HEASHOOT_2_STAND");
	AI_Output(self, other, "DIA_Abuyin_Zukunft5_Trance_13_03"); //就 是 这 些 。 我 再 也 看 不 到 别 的 了 。

	DIA_Abuyin_Zukunft5_permanent = TRUE;
	Abuyin_Zukunft = 5;

	Info_ClearChoices(DIA_Abuyin_Zukunft5);

	B_GivePlayerXP((XP_Ambient * 4));
};
