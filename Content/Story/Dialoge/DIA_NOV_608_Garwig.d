//**************************************************************************
//	Info EXIT
//**************************************************************************
instance DIA_Garwig_EXIT(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 999;
	condition		= DIA_Garwig_EXIT_Condition;
	information		= DIA_Garwig_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
instance DIA_Garwig_Wurst(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 3;
	condition		= DIA_Garwig_Wurst_Condition;
	information		= DIA_Garwig_Wurst_Info;
	description		= "你 要 香 肠 吗 ？";
};

func int DIA_Garwig_Wurst_Condition()
{
	if ((Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems(self, ItFo_SchafsWurst) == 0)
	&& (Npc_HasItems(other, ItFo_SchafsWurst) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Wurst_Info()
{
	AI_Output(other, self, "DIA_Garwig_Wurst_15_00"); //你 要 香 肠 吗 ？
	AI_Output(self, other, "DIA_Garwig_Wurst_06_01"); //啊 - 那 真 是 美 味 。 非 常 感 谢 你 ， 兄 弟 。

	B_GiveInvItems(other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben + 1);

	CreateInvItems(self, ITFO_Sausage, 1);
	B_UseItem(self, ITFO_Sausage);

	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString(13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};

//**************************************************************************
//	Info Hello
//**************************************************************************
instance DIA_Garwig_Hello(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 3;
	condition		= DIA_Garwig_Hello_Condition;
	information		= DIA_Garwig_Hello_Info;
	important		= TRUE;
};

func int DIA_Garwig_Hello_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hello_Info()
{
	AI_Output(self, other, "DIA_Garwig_Hello_06_00"); //英 诺 斯 与 你 同 在 - 我 以 前 从 没 见 过 你 ， 你 是 新 来 这 里 的 ？
	AI_Output(other, self, "DIA_Garwig_Hello_15_01"); //是 的 ， 我 刚 刚 加 入 。
	AI_Output(self, other, "DIA_Garwig_Hello_06_02"); //那 样 的 话 ， 我 希 望 你 能 尽 快 在 这 里 安 定 下 来 。 如 果 我 能 在 任 何 方 面 帮 助 你 的 话 ， 请 告 诉 我 。
};

//**************************************************************************
//	Info Hello
//**************************************************************************
instance DIA_Garwig_Room(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 5;
	condition		= DIA_Garwig_Room_Condition;
	information		= DIA_Garwig_Room_Info;
	description		= "这 是 谁 的 房 间 ？ ";
};

func int DIA_Garwig_Room_Condition()
{
	return TRUE;
};

func void DIA_Garwig_Room_Info()
{
	AI_Output(other, self, "DIA_Garwig_Room_15_00"); //这 是 谁 的 房 间 ？
	AI_Output(self, other, "DIA_Garwig_Room_06_01"); //他 们 把 修 道 院 的 圣 物 保 存 在 这 里 。
	AI_Output(other, self, "DIA_Garwig_Room_15_02"); //什 么 圣 物 ？
	AI_Output(self, other, "DIA_Garwig_Room_06_03"); //这 里 放 着 英 诺 斯 之 锤 ， 还 有 火 焰 之 盾 。 这 些 东 西 是 除 去 王 国 首 都 之 外 的 英 诺 斯 的 教 堂 中 最 重 要 的 圣 物 。
};

//**************************************************************************
//	Info Hammer
//**************************************************************************
instance DIA_Garwig_Hammer(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 99;
	condition		= DIA_Garwig_Hammer_Condition;
	information		= DIA_Garwig_Hammer_Info;
	permanent		= TRUE;
	description		= "告 诉 我 关 于 锤 子 的 事";
};

func int DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Hammer_Info()
{
	AI_Output(other, self, "DIA_Garwig_Hammer_15_00"); //告 诉 我 关 于 锤 子 的 事。
	AI_Output(self, other, "DIA_Garwig_Hammer_06_01"); //这 是 神 圣 的 英 诺 斯 之 锤 。 使 用 这 把 铁 锤 ， 圣 徒 罗 巴 尔 消 灭 了 石 头 哨 兵 。
	AI_Output(self, other, "DIA_Garwig_Hammer_06_02"); //神 圣 铭 文 记 载 ， 那 个 石 头 哨 兵 刀 枪 不 入 。 他 在 战 斗 中 象 塔 一 样 矗 立 ， 敌 人 的 武 器 在 他 的 石 头 皮 肤 上 滑 过 。
	AI_Output(self, other, "DIA_Garwig_Hammer_06_03"); //罗 巴 尔 口 中 诵 念 英 诺 斯 之 名 ， 箭 一 般 投 向 怪 物 ， 并 使 用 他 的 铁 锤 发 出 致 命 一 击 ， 将 敌 人 打 得 粉 碎 。
};

//**************************************************************************
//	Info Schild
//**************************************************************************
instance DIA_Garwig_Shield(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 98;
	condition		= DIA_Garwig_Shield_Condition;
	information		= DIA_Garwig_Shield_Info;
	description		= "告 诉 我 关 于 盾 的 事 。";
};

func int DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garwig_Room))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Shield_Info()
{
	AI_Output(other, self, "DIA_Garwig_Shield_15_00"); //告 诉 我 关 于 盾 的 事 。
	AI_Output(self, other, "DIA_Garwig_Shield_06_01"); //火 焰 之 盾 是 多 米 尼 克 在 南 部 岛 屿 战 斗 时 装 备 的 。
	AI_Output(self, other, "DIA_Garwig_Shield_06_02"); //但 是 这 面 盾 牌 的 力 量 再 也 没 有 被 使 用 过 - 所 以 我 们 把 它 钉 在 墙 上 。
};

//**************************************************************************
//	Info Auge Innos
//**************************************************************************
instance DIA_Garwig_Auge(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 4;
	condition		= DIA_Garwig_Auge_Condition;
	information		= DIA_Garwig_Auge_Info;
	description		= "英 诺 斯 之 眼 也 保 管 在 这 里 吗 ？";
};

func int DIA_Garwig_Auge_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Garwig_Room)
	&& (Kapitel <= 2))
	{
		return TRUE;
	};
};

func void DIA_Garwig_Auge_Info()
{
	AI_Output(other, self, "DIA_Garwig_Auge_15_00"); //英 诺 斯 之 眼 也 保 管 在 这 里 吗 ？
	AI_Output(self, other, "DIA_Garwig_Auge_06_01"); //当 然 不 。 多 奇 怪 的 想 法 。 没 人 知 道 能 在 哪 里 找 到 那 个 神 圣 的 宝 物 。
};

///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 23;
	condition		= DIA_Garwig_SLEEP_Condition;
	information		= DIA_Garwig_SLEEP_Info;
	permanent		= TRUE;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Garwig_SLEEP_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Garwig_SLEEP_Info()
{
	AI_Output(other, self, "DIA_Garwig_SLEEP_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Garwig_SLEEP_06_01"); //我 是 圣 物 的 守 护 者 。

	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP, DIALOG_BACK, DIA_Garwig_SLEEP_BACK);
	Info_AddChoice(DIA_Garwig_SLEEP, "我 可 以 接 替 你 一 会 吗?", DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice(DIA_Garwig_SLEEP, "为 什 么 宝 物 需 要 守 卫 ？", DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice(DIA_Garwig_SLEEP, "你 永 远 不 睡 觉 ？ ", DIA_Garwig_SLEEP_NEVER);
};

func void DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices(DIA_Garwig_SLEEP);
};

func void DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //我 可 以 接 替 你 一 会 吗?
	AI_Output(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //这 是 一 个 测 试 吗 ？ 法 师 让 你 来 测 试 我 ， 对 吗 ？ 哦 - 我 就 知 道 ！
	AI_Output(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //但 是 我 能 通 过 这 个 测 试 。 告 诉 你 的 法 师 ， 我 站 得 象 岩 石 一 样 稳 ， 而 且 我 能 抗 拒 所 有 的 诱 惑 ， 因 为 我 是 称 职 的 守 护 者 。
};

func void DIA_Garwig_SLEEP_THIEF()
{
	AI_Output(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //为 什 么 要 守 护 这 些 宝 物 ？ 有 理 由 担 心 它 们 会 被 盗 吗 ？
	AI_Output(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //多 么 特 别 的 想 法 。 你 怎 么 会 那 么 想 ？
	AI_Output(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //只 有 那 些 为 英 诺 斯 服 务 的 人 才 有 权 涉 足 修 道 院 。 没 有 一 个 真 正 的 信 徒 会 心 存 这 种 念 头 。
};

func void DIA_Garwig_SLEEP_NEVER()
{
	AI_Output(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //你 永 远 不 睡 觉 ？
	AI_Output(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //多 么 奇 怪 的 想 法 。 当 然 我 从 不 睡 觉 。 英 诺 斯 亲 自 赐 予 我 他 的 力 量 ， 可 以 让 我 完 全 不 用 睡 觉 。
	AI_Output(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //否 则 我 怎 么 能 履 行 守 护 者 神 圣 的 职 责 ？。

	Info_ClearChoices(DIA_Garwig_SLEEP);
	Info_AddChoice(DIA_Garwig_SLEEP, "你 真 的 永 远 不 睡 觉 ？  ", DIA_Garwig_SLEEP_AGAIN);
};

func void DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //你 真 的 永 远 不 睡 觉 ？
	AI_Output(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //不 。 如 果 一 个 守 护 者 睡 着 了 ， 他 就 失 败 了 。
	AI_Output(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //但 是 我 不 会 失 败 ， 因 为 英 诺 斯 赐 给 我 力 量 和 耐 性 ， 因 此 我 永 远 不 会 疲 倦 。
};

///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 2;
	condition		= DIA_Garwig_THIEF_Condition;
	information		= DIA_Garwig_THIEF_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Garwig_THIEF_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_HasItems(hero, Holy_Hammer_MIS) == 1))
	{
		return TRUE;
	};
};

func void DIA_Garwig_THIEF_Info()
{
	if (Hammer_Taken == TRUE)
	{
		AI_Output(self, other, "DIA_Garwig_THIEF_06_00"); //（ 心 烦 意 乱 ） 小 偷 ！ 你 不 仅 仅 是 让 你 自 己 和 我 感 到 耻 辱 ， 而 是 整 个 修 道 院 ！
		AI_Output(self, other, "DIA_Garwig_THIEF_06_01"); //你 要 为 这 种 亵 渎 赎 罪 。 现 在 ， 最 重 要 的 是 - 把 铁 锤 还 给 我 ！ ！
	}
	else
	{
		AI_Output(self, other, "DIA_Garwig_THIEF_06_02"); //（ 绝 望 的 ） 铁 锤 失 踪 了 - 那 怎 么 会 发 生 的 ？
		AI_Output(self, other, "DIA_Garwig_THIEF_06_03"); //我 已 经 失 败 了 。 英 诺 斯 将 会 惩 罚 我 ！
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 2;
	condition		= DIA_Garwig_Abgeben_Condition;
	information		= DIA_Garwig_Abgeben_Info;
	permanent		= TRUE;
	description		= "我 把 锤 子 拿 回 来 了 。";
};

func int DIA_Garwig_Abgeben_Condition()
{
	if (Npc_HasItems(other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Garwig_Abgeben_Info()
{
	AI_Output(other, self, "DIA_Garwig_Abgeben_15_00"); //我 把 锤 子 拿 回 来 了 。

	if (Hammer_Taken == TRUE)
	{
		AI_Output(self, other, "DIA_Garwig_Abgeben_06_01"); //你 是 个 罪 恶 的 贼 ！
	}
	else
	{
		AI_Output(self, other, "DIA_Garwig_Abgeben_06_02"); //那 么 是 你 拿 了 … …
	};

	AI_Output(self, other, "DIA_Garwig_Abgeben_06_03"); //但 是 审 判 你 不 是 我 的 职 责 。 英 诺 斯 将 会 给 你 他 的 判 决 ， 而 你 将 受 到 他 的 惩 罚 ！

	B_GiveInvItems(other, self, Holy_Hammer_MIS, 1);
	Hammer_Taken = FALSE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Garwig_PICKPOCKET(C_INFO)
{
	npc				= Nov_608_Garwig;
	nr				= 900;
	condition		= DIA_Garwig_PICKPOCKET_Condition;
	information		= DIA_Garwig_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen(52, 80);
};

func void DIA_Garwig_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
	Info_AddChoice(DIA_Garwig_PICKPOCKET, DIALOG_BACK, DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};

func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Garwig_PICKPOCKET);
};
