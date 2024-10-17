///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_EXIT(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 999;
	condition		= DIA_AngarDJG_EXIT_Condition;
	information		= DIA_AngarDJG_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_HALLO(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 5;
	condition		= DIA_AngarDJG_HALLO_Condition;
	information		= DIA_AngarDJG_HALLO_Info;
	description		= "我 认 识 你 吗 ？";
};

func int DIA_AngarDJG_HALLO_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info()
{
	AI_Output(other, self, "DIA_AngarDJG_HALLO_15_00"); //我 怎 么 会 不 认 识 你 ？ 你 是 科 尔 · 安 加 。 你 以 前 是 沼 泽 营 地 的 圣 殿 骑 士 。
	AI_Output(self, other, "DIA_AngarDJG_HALLO_04_01"); //（ 服 从 的 ） 叫 我 安 加 。 我 已 经 取 消 了 我 的 头 衔 。 沉 睡 者 兄 弟 会 已 经 解 散 了 。
	AI_Output(self, other, "DIA_AngarDJG_HALLO_04_02"); //奇 怪 ， 你 看 起 来 非 常 面 熟 。 但 是 ， 我 真 的 想 不 起 来 你 。
	AI_Output(other, self, "DIA_AngarDJG_HALLO_15_03"); //你 出 什 么 事 了 ？
	AI_Output(self, other, "DIA_AngarDJG_HALLO_04_04"); //（ 轻 蔑 的 ） 哦 。 我 已 经 有 一 段 时 间 睡 不 踏 实 了 。 都 怪 那 些 不 断 出 现 的 噩 梦 。
	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_13);
};

///////////////////////////////////////////////////////////////////////
//	B_SCTellsAngarAboutMadPsi
///////////////////////////////////////////////////////////////////////
func void B_SCTellsAngarAboutMadPsi()
{
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00"); //沉 睡 者 兄 弟 曾 经 受 到 邪 恶 的 奴 役 。
		AI_Output(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01"); //你 以 前 在 沼 泽 营 地 的 朋 友 现 在 正 穿 着 黑 袍 子 到 处 游 荡 ， 而 且 对 所 有 事 态 的 发 展 都 非 常 气 愤 。
		AI_Output(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02"); //你 在 说 什 么 ？
	};
};

func void B_SCTellsAngarAboutMadPsi2()
{
	if (Angar_KnowsMadPsi == FALSE)
	{
		AI_Output(other, self, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00"); //他 们 现 在 为 敌 人 服 务 ， 他 们 只 是 邪 恶 的 没 有 灵 魂 的 战 士 。
		AI_Output(self, other, "DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01"); //以 众 神 的 名 义 。 我 并 不 愿 意 被 那 样 轻 率 。 那 将 不 会 再 次 出 现 在 我 身 上 ， 我 发 誓 。
		B_GivePlayerXP(XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Wiekommstduhierher
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WIEKOMMSTDUHIERHER(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 6;
	condition		= DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information		= DIA_Angar_WIEKOMMSTDUHIERHER_Info;
	description		= "你 是 怎 么 到 这 里 来 的 ？";
};

func int DIA_Angar_WIEKOMMSTDUHIERHER_Condition()
{
	if (Npc_KnowsInfo(other, DIA_AngarDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_Info()
{
	AI_Output(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_15_00"); //你 是 怎 么 到 这 里 来 的 ？
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_01"); //在 魔 法 屏 障 崩 溃 之 后 ， 我 在 山 中 藏 身 。 我 要 做 些 事 情 ， 只 是 时 间 问 题 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_02"); //我 游 荡 了 几 天 ， 直 到 我 突 然 在 城 堡 中 醒 来 。 不 要 问 我 发 生 了 什 么 事 ， 我 不 知 道 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_04_03"); //更 糟 的 是 ， 我 戴 了 几 年 的 护 身 符 也 丢 了 。 如 果 我 不 能 把 它 找 回 来 的 话 ， 我 一 定 会 发 疯 的 。

	Log_CreateTopic(TOPIC_AngarsAmulett, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett, LOG_RUNNING);
	B_LogEntry(TOPIC_AngarsAmulett, TOPIC_AngarsAmulett_1);

	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, DIALOG_BACK, DIA_Angar_WIEKOMMSTDUHIERHER_gehen);
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, "你 是 在 什 么 地 方 丢 掉 你 的 护 身 符 的 ？", DIA_Angar_WIEKOMMSTDUHIERHER_amulett);

	if (SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, "沉 睡 者 兄 弟 曾 经 受 到 邪 恶 的 奴 役", DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	}
	else
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, "沉 睡 者 兄 弟 曾 经 受 到 邪 恶 的 奴 役", DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	};

	if (DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, "你 下 一 步 要 做 什 么 ？", DIA_Angar_WIEKOMMSTDUHIERHER_nun);
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_amulett()
{
	AI_Output(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00"); //你 是 在 什 么 地 方 丢 掉 你 的 护 身 符 的 ？

	if (DJG_Angar_SentToStones == FALSE)
	{
		AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01"); //在 南 边 的 什 么 地 方 ， 距 我 在 城 堡 中 清 醒 过 来 的 时 间 相 距 不 久 。
		B_LogEntry(TOPIC_AngarsAmulett, TOPIC_AngarsAmulett_2);
	}
	else
	{
		AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02"); //它 一 定 在 这 里 的 某 个 地 方 。
		B_LogEntry(TOPIC_AngarsAmulett, TOPIC_AngarsAmulett_3);
	};

	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03"); //我 怀 疑 它 被 偷 走 了 。 我 绝 对 要 把 它 找 回 来 。
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_andere()
{
	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi();
	}
	else
	{
		AI_Output(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00"); //沼 泽 营 地 的 其 它 人 出 了 什 么 事 ？
	};

	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01"); //我 记 得 的 最 后 一 件 事 就 是 屏 障 的 崩 溃 ， 伴 随 着 撕 心 裂 肺 的 尖 叫 声 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02"); //我 们 被 毫 无 来 由 的 恐 惧 击 中 ， 摔 倒 到 地 面 上 ， 痛 苦 地 翻 腾 着 。 那 个 声 音 ， 它 一 直 在 变 大 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03"); //当 它 结 束 之 后 ， 他 们 都 发 疯 了 ， 并 消 失 在 寒 冷 的 黑 暗 之 中 ， 大 声 地 尖 叫 着 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04"); //我 再 也 没 有 见 过 他 们。

	if (SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2();
	};
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_nun()
{
	AI_Output(other, self, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00"); //你 下 一 步 要 做 什 么 ？
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01"); //我 先 要 休 息 一 会 ， 然 后 我 才 能 开 始 去 寻 找 我 丢 失 的 护 身 符 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02"); //我 听 说 了 一 些 关 于 龙 的 事 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03"); //同 样 也 听 说 有 许 多 战 士 已 经 来 到 矿 藏 山 谷 猎 杀 他 们 。
	AI_Output(self, other, "DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04"); //我 打 算 加 入 他 们 。

	Angar_willDJGwerden = TRUE;
};

func void DIA_Angar_WIEKOMMSTDUHIERHER_gehen()
{
	Info_ClearChoices(DIA_Angar_WIEKOMMSTDUHIERHER);
};

///////////////////////////////////////////////////////////////////////
//	Info SCTellsAngarAboutMadPsi2
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_SCTellsAngarAboutMadPsi2(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 7;
	condition		= DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information		= DIA_Angar_SCTellsAngarAboutMadPsi2_Info;
	description		= "沉 睡 者 兄 弟 曾 经 受 到 邪 恶 的 奴 役"; // Joly: falls erst nach DIA_Angar_WIEKOMMSTDUHIERHER (SC_KnowsMadPsi == TRUE)
};

func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition()
{
	if ((SC_KnowsMadPsi == TRUE)
	&& (Angar_KnowsMadPsi == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER)))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};

///////////////////////////////////////////////////////////////////////
//	Info FoundAmulett
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_FOUNDAMULETT(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 7;
	condition		= DIA_Angar_FOUNDAMULETT_Condition;
	information		= DIA_Angar_FOUNDAMULETT_Info;
	description		= "我 找 到 了 你 的 护 身 符 。";
};

func int DIA_Angar_FOUNDAMULETT_Condition()
{
	if ((Npc_HasItems(other, ItAm_Mana_Angar_MIS))
	&& (Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER)))
	{
		return TRUE;
	};
};

func void B_AngarsAmulettAbgeben()
{
	AI_Output(other, self, "DIA_Angar_FOUNDAMULETT_15_00"); //我 找 到 了 你 的 护 身 符 。
	AI_Output(self, other, "DIA_Angar_FOUNDAMULETT_04_01"); //谢 谢 你 。 我 以 为 永 远 也 不 会 再 见 到 它 了 。

	B_GiveInvItems(other, self, ItAm_Mana_Angar_MIS, 1);

	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP(XP_AngarDJGUndeadMage);
};

func void DIA_Angar_FOUNDAMULETT_Info()
{
	B_AngarsAmulettAbgeben();

	Info_AddChoice(DIA_Angar_FOUNDAMULETT, "它 为 什 么 对 你 这 么 特 殊 呢 ？", DIA_Angar_FOUNDAMULETT_besonders);
	Info_AddChoice(DIA_Angar_FOUNDAMULETT, "你 现 在 打 算 做 什 么 ？", DIA_Angar_FOUNDAMULETT_nun);
};

func void DIA_Angar_FOUNDAMULETT_besonders()
{
	AI_Output(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_00"); //它 为 什 么 对 你 这 么 特 殊 呢 ？
	AI_Output(self, other, "DIA_Angar_FOUNDAMULETT_besonders_04_01"); //这 是 一 个 礼 物 。
	AI_Output(other, self, "DIA_Angar_FOUNDAMULETT_besonders_15_02"); //我 明 白 了 。
};

func void DIA_Angar_FOUNDAMULETT_nun()
{
	AI_Output(other, self, "DIA_Angar_FOUNDAMULETT_nun_15_00"); //你 现 在 打 算 做 什 么 ？
	AI_Output(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_01"); //离 开 这 被 诅 咒 的 山 谷 。
	AI_Output(self, other, "DIA_Angar_FOUNDAMULETT_nun_04_02"); //也 许 我 们 还 能 见 面 。 再 会 。

	AI_StopProcessInfos(self);
	if ((Npc_GetDistToWP(self, "OC_TO_MAGE") < 1000) == FALSE) // Joly: Damit Angar nicht am OC Tor rumkronkelt, wenn er noch im OC ist.
	{
		Npc_ExchangeRoutine(self, "LeavingOW");
	};
};

///////////////////////////////////////////////////////////////////////
//	Info DJG_Anwerben
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_DJG_ANWERBEN(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 8;
	condition		= DIA_Angar_DJG_ANWERBEN_Condition;
	information		= DIA_Angar_DJG_ANWERBEN_Info;
	description		= "也 许 我 能 帮 你 找 到 你 的 护 身 符 。";
};

func int DIA_Angar_DJG_ANWERBEN_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Angar_WIEKOMMSTDUHIERHER))
	&& (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Angar_DJG_ANWERBEN_Info()
{
	AI_Output(other, self, "DIA_Angar_DJG_ANWERBEN_15_00"); //也 许 我 能 帮 你 找 到 你 的 护 身 符 。
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_04_01"); //为 什 么 不 ， 有 人 帮 忙 总 没 有 害 处 。

	if (DJG_Angar_SentToStones == FALSE)
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, "我 必 须 走 了 。", DIA_Angar_DJG_ANWERBEN_gehen);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, "你 要 去 哪 里 看 看 ？", DIA_Angar_DJG_ANWERBEN_wo);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, "你 什 么 时 候 走 ？", DIA_Angar_DJG_ANWERBEN_wann);
	};

	if (Angar_willDJGwerden == TRUE)
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, "关 于 那 些 龙 猎 手 呢 ？", DIA_Angar_DJG_ANWERBEN_DJG);
	};
};

func void DIA_Angar_DJG_ANWERBEN_DJG()
{
	AI_Output(other, self, "DIA_Angar_DJG_ANWERBEN_DJG_15_00"); //关 于 那 些 龙 猎 手 呢 ？
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_DJG_04_01"); //我 稍 后 在 和 他 们 商 量 。 也 许 他 们 需 要 一 个 有 力 的 帮 手 。
};

func void DIA_Angar_DJG_ANWERBEN_wann()
{
	AI_Output(other, self, "DIA_Angar_DJG_ANWERBEN_wann_15_00"); //你 什 么 时 候 走 ？
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_wann_04_01"); //只 要 等 我 感 觉 好 一 些 。
};

func void DIA_Angar_DJG_ANWERBEN_wo()
{
	AI_Output(other, self, "DIA_Angar_DJG_ANWERBEN_wo_15_00"); //你 要 去 哪 里 看 看 ？
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_01"); //我 要 去 南 边 ， 我 最 后 呆 的 地 方。
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_wo_04_02"); //那 里 有 一 个 山 洞 墓 地 ， 被 很 多 大 圆 石 包 围 着 。
};

func void DIA_Angar_DJG_ANWERBEN_gehen()
{
	AI_Output(other, self, "DIA_Angar_DJG_ANWERBEN_gehen_15_00"); //我 必 须 走 了 。
	AI_Output(self, other, "DIA_Angar_DJG_ANWERBEN_gehen_04_01"); //提 高 警 惕 。

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WASMACHSTDU(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 9;
	condition		= DIA_AngarDJG_WASMACHSTDU_Condition;
	information		= DIA_AngarDJG_WASMACHSTDU_Info;
	description		= "有 什 么 不 对 的 吗 ？";
};

func int DIA_AngarDJG_WASMACHSTDU_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_DJG_WATCH_STONEHENGE_01") < 8000)
	&& (Npc_KnowsInfo(other, DIA_Angar_DJG_ANWERBEN))
	&& (DJG_AngarGotAmulett == FALSE)
	)
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WASMACHSTDU_Info()
{
	AI_Output(other, self, "DIA_AngarDJG_WASMACHSTDU_15_00"); //有 什 么 不 对 的 吗 ？
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_04_01"); //你 听 到 了 吗 ？ 我 的 一 生 中 从 没 听 过 那 么 可 怕 的 声 音 ！
	AI_Output(other, self, "DIA_AngarDJG_WASMACHSTDU_15_02"); //你 说 的 是 什 么 意 思 ？ 我 什 么 都 没 听 到 ！
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_04_03"); //这 里 的 整 个 地 区 都 散 发 着 死 亡 和 毁 灭 的 恶 臭 。 腐 败 的 生 物 把 守 着 我 们 前 面 通 向 地 穴 的 岩 石 入 口 。
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_04_04"); //有 某 些 可 怕 的 东 西 隐 藏 在 那 里 ， 并 把 他 的 仆 从 派 到 这 个 世 界 的 地 面 上 。
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_04_05"); //我 几 乎 可 以 肯 定 我 的 护 身 符 是 在 这 附 近 的 某 个 地 方 丢 的 。

	if (Angar_willDJGwerden == TRUE)
	{
		Info_AddChoice(DIA_AngarDJG_WASMACHSTDU, "你 已 经 同 龙 猎 手 谈 过 了 ？", DIA_AngarDJG_WASMACHSTDU_DJG);
	};
};

func void DIA_AngarDJG_WASMACHSTDU_DJG()
{
	AI_Output(other, self, "DIA_AngarDJG_WASMACHSTDU_DJG_15_00"); //你 已 经 同 龙 猎 手 谈 过 了 ？
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_01"); //是 的 。 但 是 我 猜 ， 我 们 还 会 遇 到 一 个 曾 经 在 沼 泽 营 地 见 过 的 家 伙 。
	AI_Output(self, other, "DIA_AngarDJG_WASMACHSTDU_DJG_04_02"); //那 只 是 一 些 野 蛮 的 、 愚 蠢 的 白 痴 。 对 我 来 说 不 算 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info WhatsInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WHATSINTHERE(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 10;
	condition		= DIA_AngarDJG_WHATSINTHERE_Condition;
	information		= DIA_AngarDJG_WHATSINTHERE_Info;
	description		= "石 洞 里 面 藏 着 什 么 ？";
};

func int DIA_AngarDJG_WHATSINTHERE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_AngarDJG_WASMACHSTDU))
	&& (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WHATSINTHERE_Info()
{
	AI_Output(other, self, "DIA_AngarDJG_WHATSINTHERE_15_00"); //石 洞 里 面 藏 着 什 么 ？
	AI_Output(self, other, "DIA_AngarDJG_WHATSINTHERE_04_01"); //有 些 东 西 不 让 我 接 近 入 口 ！
	AI_Output(self, other, "DIA_AngarDJG_WHATSINTHERE_04_02"); //它 被 一 种 魔 法 生 物 保 护 着 。 我 在 夜 里 搜 索 那 里 的 时 候 见 过 它 。 一 种 讨 厌 的 东 西 。
	AI_Output(self, other, "DIA_AngarDJG_WHATSINTHERE_04_03"); //它 在 树 木 之 间 前 后 滑 动 ， 然 后 你 会 有 一 种 感 觉 ， 它 就 象 海 绵 一 样 吸 收 着 附 近 所 有 的 生 命 。

	// B_LogEntry (TOPIC_Dragonhunter,"Ich habe Angar im Minental gefunden. Er vermutet, daß sich in der Felsengruft, wo er sich aufhält, ein Drache befindet, der hier seine untoten Helfer an die Oberfläche entsendet.");
	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_13);
};

///////////////////////////////////////////////////////////////////////
//	Info WantToGoInThere
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_WANTTOGOINTHERE(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 11;
	condition		= DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information		= DIA_AngarDJG_WANTTOGOINTHERE_Info;
	description		= "我 们 一 起 走 。";
};

func int DIA_AngarDJG_WANTTOGOINTHERE_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_AngarDJG_WHATSINTHERE))
	&& (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info()
{
	AI_Output(other, self, "DIA_AngarDJG_WANTTOGOINTHERE_15_00"); //我 们 一 起 走 。
	AI_Output(self, other, "DIA_AngarDJG_WANTTOGOINTHERE_04_01"); //我 应 该 试 一 下 。 但 是 要 小 心 。

	AI_StopProcessInfos(self);

	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine(self, "Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self, "Angriff");
		DJG_AngarAngriff = TRUE;
	};

	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageDead
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UndeadMageDead(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 13;
	condition		= DIA_AngarDJG_UndeadMageDead_Condition;
	information		= DIA_AngarDJG_UndeadMageDead_Info;
	important		= TRUE;
};

func int DIA_AngarDJG_UndeadMageDead_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_UNDEAD_DUNGEON_02") < 1000)
	&& (DJG_AngarAngriff == TRUE)
	&& (DJG_AngarGotAmulett == FALSE)
	&& (Npc_IsDead(SkeletonMage_Angar))
	)
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UndeadMageDead_Info()
{
	AI_Output(self, other, "DIA_AngarDJG_UndeadMageDead_04_00"); //（ 呼 气 ） 只 有 死 亡 和 毁 灭 。 我 必 须 离 开 这 里 。
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "RunToEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadMageComes
///////////////////////////////////////////////////////////////////////
instance DIA_AngarDJG_UNDEADMAGECOMES(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 13;
	condition		= DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information		= DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important		= TRUE;
};

func int DIA_AngarDJG_UNDEADMAGECOMES_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_PATH_3_13") < 500)
	&& (Npc_KnowsInfo(other, DIA_AngarDJG_WANTTOGOINTHERE))
	&& ((Npc_KnowsInfo(other, DIA_AngarDJG_UndeadMageDead)) == FALSE)
	&& (DJG_AngarGotAmulett == FALSE)
	&& (Npc_IsDead(SkeletonMage_Angar))
	)
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info()
{
	AI_Output(self, other, "DIA_AngarDJG_UNDEADMAGECOMES_04_00"); //（ 耳 语 ） 它 在 那 边 ！ 你 听 到 了 吗 ？

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "GotoStonehendgeEntrance");
};

///////////////////////////////////////////////////////////////////////
//	Info Wasistlos
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WASISTLOS(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 14;
	condition		= DIA_Angar_WASISTLOS_Condition;
	information		= DIA_Angar_WASISTLOS_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Angar_WASISTLOS_Condition()
{
	if (
	(Npc_GetDistToWP(self, "OW_PATH_3_STONES") < 1000)
	&& (DJG_AngarGotAmulett == FALSE)
	&& (Npc_IsDead(SkeletonMage_Angar))
	)
	{
		return TRUE;
	};
};

func void DIA_Angar_WASISTLOS_Info()
{
	AI_Output(other, self, "DIA_Angar_WASISTLOS_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Angar_WASISTLOS_04_01"); //和 你 一 起 我 不 能 继 续 前 进 。
	AI_Output(self, other, "DIA_Angar_WASISTLOS_04_02"); //我 猜 ， 我 将 永 远 无 法 活 着 离 开 这 里 。
	AI_Output(self, other, "DIA_Angar_WASISTLOS_04_03"); //我 无 法 解 释 ， 但 是 … …

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self, other, "DIA_Angar_WASISTLOS_04_04"); //我 必 须 尽 快 离 开 这 片 被 诅 咒 的 土 地 ， 否 则 我 会 遭 遇 和 我 的 兄 弟 们 一 样 的 命 运 。
	}
	else
	{
		AI_Output(self, other, "DIA_Angar_WASISTLOS_04_05"); //每 次 我 看 到 这 些 … … 地 狱 的 产 物 ， 我 都 感 觉 好 像 是 在 和 自 己 的 人 民 作 战 。
	};

	AI_StopProcessInfos(self);

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_15);

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "LeavingOW");
};

///////////////////////////////////////////////////////////////////////
//	Info Whyareyouhere
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_WHYAREYOUHERE(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 15;
	condition		= DIA_Angar_WHYAREYOUHERE_Condition;
	information		= DIA_Angar_WHYAREYOUHERE_Info;
	description		= "安 加 ？ 你 在 这 里 做 什 么 ？";
};

func int DIA_Angar_WHYAREYOUHERE_Condition()
{
	if (Npc_GetDistToWP(self, "OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Angar_WHYAREYOUHERE_Info()
{
	AI_Output(other, self, "DIA_Angar_WHYAREYOUHERE_15_00"); //安 加 ？ 你 在 这 里 做 什 么 ？
	AI_Output(self, other, "DIA_Angar_WHYAREYOUHERE_04_01"); //当 我 撞 见 兽 人 的 时 候 ， 我 正 在 去 关 卡 的 路 上 。 我 无 法 摆 脱 这 些 被 上 帝 抛 弃 的 残 忍 的 家 伙 。
	AI_Output(self, other, "DIA_Angar_WHYAREYOUHERE_04_02"); //我 要 等 一 会 ， 然 后 穿 过 关 卡 。 我 将 在 另 一 边 再 和 你 再 见 ！

	B_LogEntry(TOPIC_Dragonhunter, TOPIC_Dragonhunter_14);
	B_GivePlayerXP(XP_AngarDJGAgain);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info PermKap4
///////////////////////////////////////////////////////////////////////
instance DIA_Angar_PERMKAP4(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 0;
	condition		= DIA_Angar_PERMKAP4_Condition;
	information		= DIA_Angar_PERMKAP4_Info;
	permanent		= TRUE;
	description		= "我 不 想 把 你 独 自 留 下 !?";
};

func int DIA_Angar_PERMKAP4_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Angar_WHYAREYOUHERE))
	{
		return TRUE;
	};
};

func void DIA_Angar_PERMKAP4_Info()
{
	AI_Output(other, self, "DIA_Angar_PERMKAP4_15_00"); //我 不 想 把 你 独 自 留 下 ！?
	AI_Output(self, other, "DIA_Angar_PERMKAP4_04_01"); //当 然 。 离 开 。 再 见 。

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Angar_PICKPOCKET(C_INFO)
{
	npc				= DJG_705_Angar;
	nr				= 900;
	condition		= DIA_Angar_PICKPOCKET_Condition;
	information		= DIA_Angar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Angar_PICKPOCKET_Condition()
{
	C_Beklauen(47, 55);
};

func void DIA_Angar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
	Info_AddChoice(DIA_Angar_PICKPOCKET, DIALOG_BACK, DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};
