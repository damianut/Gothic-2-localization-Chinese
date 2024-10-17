// ---------------------------------------------------------------------
var int Scatty_Start;
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_EXIT(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 999;
	condition		= DIA_Addon_Scatty_EXIT_Condition;
	information		= DIA_Addon_Scatty_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if (Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self, "START");
		Scatty_Start = TRUE;
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Scatty_PICKPOCKET(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 900;
	condition		= DIA_Addon_Scatty_PICKPOCKET_Condition;
	information		= DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	C_Beklauen(60, 90);
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET, DIALOG_BACK, DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_Hi(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_Hi_Condition;
	information		= DIA_Addon_Scatty_Hi_Info;
	description		= "最 近 生 意 好 吗 ？";
};

func int DIA_Addon_Scatty_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_Hi_15_00"); //最 近 生 意 好 吗 ？
	AI_Output(self, other, "DIA_Addon_Scatty_Hi_01_01"); //既 然 坟 墓 已 被 打 开 ， 什 么 都 不 需 要 。
	AI_Output(self, other, "DIA_Addon_Scatty_Hi_01_02"); //瑞 雯 不 再 需 要 奴 隶 了 ， 所 以 他 们 现 在 挖 掘 金 矿 - 在 布 拉 德 维 恩 的 命 令 下 。
	AI_Output(self, other, "DIA_Addon_Scatty_Hi_01_03"); //矿 工 们 工 作 很 轻 松 。 （ 喃 喃 自 语 ） 轻 松 的 矿 工 不 适 合 此 事 。

	Log_CreateTopic(Topic_Addon_BDT_Trader, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, Topic_Addon_BDT_Trader_5);
};

/*
Ich bin hier auch sowas wie der Proviantmeister. Wenn du was brauchst, kannst du mit mir handeln.
(lacht) Vom Arenameister zum Proviantmeister. Ist das ein Auf - oder ein Abstieg?
*/
// ---------------------------------------------------------------------
//	Info last
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_last(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_last_Condition;
	information		= DIA_Addon_Scatty_last_Info;
	description		= "布 拉 德 维 恩 ？ 他 负 责 这 里 ？ ";
};

func int DIA_Addon_Scatty_last_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_Hi)
	&& !Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_last_15_00"); //布 拉 德 维 恩 ？ 他 负 责 这 里 ？
	AI_Output(self, other, "DIA_Addon_Scatty_last_01_01"); //他 监 督 矿 井 。 但 是 他 几 乎 从 来 没 下 来 过 。 他 大 部 分 时 间 都 和 瑞 雯 一 起 在 神 殿 里 。
	AI_Output(other, self, "DIA_Addon_Scatty_last_15_02"); //‘ 几 乎 从 来 ’ 指 的 的 是 什 么 ？
	AI_Output(self, other, "DIA_Addon_Scatty_last_01_03"); //上 次 我 见 到 他 是 当 他 从 墓 地 里 出 来 的 时 候 … …
	AI_Output(self, other, "DIA_Addon_Scatty_last_01_04"); //（ 匆 忙 的 ） … … 不 ， 等 等 ！ 上 次 他 来 这 里 是 他 把 奴 隶 们 送 来 挖 金 子 的 时 候 。
	AI_Output(self, other, "DIA_Addon_Scatty_last_01_05"); //与 瑞 雯 不 同 ， 他 非 常 喜 欢 金 子 。
};

// ---------------------------------------------------------------------
//	Info Gruft
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_Gruft(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_Gruft_Condition;
	information		= DIA_Addon_Scatty_Gruft_Info;
	description		= "什 么 样 的 坟 墓 ？";
};

func int DIA_Addon_Scatty_Gruft_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_HI))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gruft_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_Gruft_15_00"); //什 么 样 的 坟 墓 ？
	AI_Output(self, other, "DIA_Addon_Scatty_Gruft_01_01"); //一 个 被 诅 咒 的 、 不 祥 的 坟 墓 ！ 坟 墓 的 守 护 者 已 经 杀 了 很 多 人 ！
	AI_Output(other, self, "DIA_Addon_Scatty_Gruft_15_02"); //守 护 者 ？ 你 是 在 说 一 种 石 头 生 物 吗 ？ 非 常 平 坦 ， 有 一 个 圆 脑 袋 ？
	AI_Output(self, other, "DIA_Addon_Scatty_Gruft_01_03"); //那 就 是 我 要 说 的 东 西 ！ 他 们 从 一 堆 石 头 里 面 跳 出 来 。
	AI_Output(self, other, "DIA_Addon_Scatty_Gruft_01_04"); //从 一 开 始 ， 我 就 知 道 挖 掘 坟 墓 不 是 什 么 好 事 。
	AI_Output(self, other, "DIA_Addon_Scatty_Gruft_01_05"); //但 是 瑞 雯 好 像 中 了 魔 一 样 要 挖 掘 那 里 。 当 坟 墓 被 打 开 以 后 ， 他 就 和 他 的 卫 兵 一 起 走 了 进 去 。
};

// ---------------------------------------------------------------------
//	Info GruftAgain
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_GruftAgain(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_GruftAgain_Condition;
	information		= DIA_Addon_Scatty_GruftAgain_Info;
	description		= "瑞 雯 想 要 从 坟 墓 里 面 找 什 么 ？";
};

func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_Gruft))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_GruftAgain_15_00"); //瑞 雯 想 要 从 坟 墓 里 面 找 什 么 ？
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_01"); //（ 短 暂 的 中 断 ） 嗯 … … 你 非 常 好 奇 。 你 让 我 想 起 一 个 我 曾 经 认 识 的 家 伙 。
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_02"); //他 也 非 常 好 奇 。 最 后 那 导 致 了 他 的 死 亡 。
	AI_Output(other, self, "DIA_Addon_Scatty_GruftAgain_15_03"); //言 归 正 传 吧 。 坟 墓 里 发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_04"); //好 吧 … … 嗯 … … 我 的 喉 咙 非 常 干 … …
	AI_Output(other, self, "DIA_Addon_Scatty_GruftAgain_15_05"); //嘿 ， 斯 凯 蒂 ， 现 在 不 行 。 这 很 重 要 ， 后 来 怎 么 了 ？ 瑞 雯 在 那 里 做 了 什 么 ？
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_06"); //好 吧 。 （ 深 深 吸 了 一 口 气 ） 他 … … 喊 叫 … … 召 唤 了 什 么 东 西 。 他 不 断 用 一 种 奇 怪 的 语 言 大 喊 什 么 话 。
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_07"); //明 亮 的 光 线 从 坟 墓 里 倾 射 而 出 ， 然 后 我 听 到 一 声 尖 叫 差 点 把 我 的 耳 膜 刺 穿 - 一 种 魔 鬼 般 的 尖 叫 。
	AI_Output(other, self, "DIA_Addon_Scatty_GruftAgain_15_08"); //然 后 呢 ？
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_09"); //我 就 知 道 那 么 多 。 那 个 时 候 ， 布 拉 德 维 恩 从 坟 墓 里 走 出 来 ， 叫 我 走 开 。 然 后 我 就 走 开 了 。
	AI_Output(self, other, "DIA_Addon_Scatty_GruftAgain_01_10"); //没 多 久 瑞 雯 就 和 他 的 人 一 起 消 失 在 神 殿 中 。 从 那 时 起 ， 就 没 有 再 见 过 瑞 雯 。
};

// ---------------------------------------------------------------------
//	Info Trinken
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_Trinken(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 99;
	condition		= DIA_Addon_Scatty_Trinken_Condition;
	information		= DIA_Addon_Scatty_Trinken_Info;
	description		= "你 想 喝 一 杯 吗 ？";
};

func int DIA_Addon_Scatty_Trinken_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_GruftAgain))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_Trinken_15_00"); //你 想 喝 一 杯 吗 ？
	AI_Output(self, other, "DIA_Addon_Scatty_Trinken_01_01"); //一 杯 啤 酒 应 该 刚 好 。 在 营 地 里 几 乎 没 有 啤 酒 。
	AI_Output(self, other, "DIA_Addon_Scatty_Trinken_01_02"); //不 过 也 许 露 西 亚 还 有 一 瓶 … …
};

// ---------------------------------------------------------------------
//	Info Bier geben
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_Bier(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 99;
	condition		= DIA_Addon_Scatty_Bier_Condition;
	information		= DIA_Addon_Scatty_Bier_Info;
	description		= "祝 你 健 康 。 （ 给 啤 酒 ）";
};

func int DIA_Addon_Scatty_Bier_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_Trinken)
	&& Npc_HasItems(other, ItFo_beer))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_Bier_15_00"); //给 你 。

	if (B_GiveInvItems(other, self, ItFo_Beer, 1))
	{
		AI_UseItem(self, ItFo_Beer);
	};

	AI_Output(self, other, "DIA_Addon_Scatty_Bier_01_01"); //哦 ， 味 道 好 极 了 。 谢 谢 老 兄 。 你 是 我 的 英 雄 。

	B_GivePlayerXP(XP_Ambient * 5);
};

// ---------------------------------------------------------------------
//	Info Gold
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_Gold(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_Gold_Condition;
	information		= DIA_Addon_Scatty_Gold_Info;
	description		= DIALOG_ADDON_GOLD_DESCRIPTION;
};

func int DIA_Addon_Scatty_Gold_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other, self, "$ADDON_GOLD_DESCRIPTION");
	AI_Output(self, other, "DIA_Addon_Scatty_Gold_01_00"); //把 十 字 镐 拿 在 手 里 ， 然 后 用 力 敲 击 金 矿 石 - 那 谁 都 会 做 。
	AI_Output(self, other, "DIA_Addon_Scatty_Gold_01_01"); //不 过 那 样 的 话 ， 大 量 的 金 块 会 粉 碎 。 只 有 了 解 采 矿 的 人 才 明 白 应 该 如 何 去 做 。
	AI_Output(self, other, "DIA_Addon_Scatty_Gold_01_02"); //当 你 再 积 累 一 些 经 验 之 后 ， 我 会 告 诉 你 更 多 的 事 。

	B_Upgrade_Hero_HackChance(5);
};

// ---------------------------------------------------------------------
//	Info teach
// ---------------------------------------------------------------------
var int Scatty_teach_perm;
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_teach(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_teach_Condition;
	information		= DIA_Addon_Scatty_teach_Info;
	permanent		= TRUE;
	description		= "学 习 挖 金 子 （ 花 费 ： ２ Ｌ Ｐ ／ １ ０ ％ ）";
};

func int DIA_Addon_Scatty_teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_Gold)
	&& (Scatty_teach_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_teach_15_00"); //再 跟 我 说 说 金 矿 的 采 集 。

	if (other.lp >= 1)
	{
		AI_Output(self, other, "DIA_Addon_Scatty_teach_01_01"); //首 先 ， 你 应 该 了 解 ， 黄 金 不 是 矿 石 ， 它 象 奶 油 一 样 柔 软 。 如 果 你 击 打 太 用 力 的 话 ， 一 切 都 会 粉 碎 。
		AI_Output(self, other, "DIA_Addon_Scatty_teach_01_02"); //每 个 矿 工 都 有 自 己 的 窍 门 把 金 块 从 岩 石 上 敲 下 来 。
		AI_Output(self, other, "DIA_Addon_Scatty_teach_01_03"); //总 之 ， 这 些 窍 门 正 是 普 通 的 矿 工 和 优 秀 的 矿 工 之 间 不 同 的 地 方 。
		AI_Output(self, other, "DIA_Addon_Scatty_teach_01_04"); //除 了 那 些 ， 勤 练 才 能 完 美 。 只 有 当 你 坚 持 挖 掘 一 端 时 间 之 后 ， 你 才 会 进 步 。

		other.lp = (other.lp - 1);
		B_Upgrade_Hero_HackChance(10);
		Scatty_teach_perm = TRUE;
	}
	else
	{
		B_Say(self, other, "$NOLEARNNOPOINTS");
	};
};

// ---------------------------------------------------------------------
//	Info tot
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_tot(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 2;
	condition		= DIA_Addon_Scatty_tot_Condition;
	information		= DIA_Addon_Scatty_tot_Info;
	description		= "布 拉 德 维 恩 死 了 。";
};

func int DIA_Addon_Scatty_tot_Condition()
{
	if (Npc_IsDead(Bloodwyn))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other, self, "DIA_Addon_Scatty_tot_15_00"); //布 拉 德 维 恩 死 了 。
	AI_Output(self, other, "DIA_Addon_Scatty_tot_01_01"); //嗯 ， 我 并 非 愿 意 对 很 多 人 那 么 说 - 不 过 布 拉 德 维 恩 赚 翻 了 。
};

// ---------------------------------------------------------------------
//	Info trade
// ---------------------------------------------------------------------
instance DIA_Addon_Scatty_trade(C_INFO)
{
	npc				= BDT_1086_Addon_Scatty;
	nr				= 99;
	condition		= DIA_Addon_Scatty_trade_Condition;
	information		= DIA_Addon_Scatty_trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= DIALOG_TRADE;
};

func int DIA_Addon_Scatty_trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Scatty_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other, self, "$TRADE_1");
};
