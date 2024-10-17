///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_EXIT(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 999;
	condition		= DIA_Addon_Erol_EXIT_Condition;
	information		= DIA_Addon_Erol_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Erol_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Erol_PICKPOCKET(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 900;
	condition		= DIA_Addon_Erol_PICKPOCKET_Condition;
	information		= DIA_Addon_Erol_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Erol_PICKPOCKET_Condition()
{
	C_Beklauen(43, 42);
};

func void DIA_Addon_Erol_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET, DIALOG_BACK, DIA_Addon_Erol_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Erol_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Erol_PICKPOCKET_DoIt);
};

func void DIA_Addon_Erol_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

func void DIA_Addon_Erol_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Erol_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Hallo(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_Hallo_Condition;
	information		= DIA_Addon_Erol_Hallo_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Addon_Erol_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Erol_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_Hallo_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Erol_Hallo_10_01"); //（ 愤 怒 的 ） 发 生 了 什 么 事 ？ 去 看 看 那 边 桥 下 乱 七 八 糟 的 情 形 好 了 。
	AI_Output(self, other, "DIA_Addon_Erol_Hallo_10_02"); //（ 愤 怒 的 ） 我 的 一 身 之 中 从 没 见 过 这 样 的 事 情 。 我 告 诉 你 ， 那 些 畜 牲 应 该 被 彻 底 灭 绝 。
};

///////////////////////////////////////////////////////////////////////
//	Info what
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_what(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_what_Condition;
	information		= DIA_Addon_Erol_what_Info;
	description		= "发 生 了 什 么 事 ？";
};

func int DIA_Addon_Erol_what_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_what_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_15_00"); //发 生 了 什 么 事 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_10_01"); //我 正 在 和 我 的 助 手 一 起 旅 行 ， 然 后 那 些 可 恶 的 混 蛋 突 然 跳 到 我 的 马 车 上 ， 并 杀 掉 了 所 有 的 人 。
	AI_Output(self, other, "DIA_Addon_Erol_what_10_02"); //幸 好 我 还 知 道 如 何 打 出 漂 亮 地 右 勾 拳 ， 不 然 他 们 也 会 把 我 杀 掉 。

	Log_CreateTopic(TOPIC_Addon_Erol, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Erol, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Erol, TOPIC_Addon_Erol_1);

	MIS_Addon_Erol_BanditStuff = LOG_RUNNING;

	Info_ClearChoices(DIA_Addon_Erol_what);
	Info_AddChoice(DIA_Addon_Erol_what, "在 桥 下 面 的 那 些 东 西 是 你 的 ？", DIA_Addon_Erol_what_dein);
	Info_AddChoice(DIA_Addon_Erol_what, "那 些 人 是 谁 ？", DIA_Addon_Erol_what_wer);
};

func void DIA_Addon_Erol_what_back()
{
	Info_ClearChoices(DIA_Addon_Erol_what);
};

func void DIA_Addon_Erol_what_dein()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_dein_15_00"); //在 桥 下 面 的 那 些 东 西 是 你 的 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_dein_10_01"); //马 车 、 货 物 、 所 有 的 东 西 。
	if (Npc_HasItems(other, itmi_erolskelch) > 0)
	{
		AI_Output(other, self, "DIA_Addon_Erol_what_dein_Add_15_00"); //看 ， 我 找 到 了 一 些 你 的 东 西。
		AI_Output(self, other, "DIA_Addon_Erol_what_dein_Add_10_01"); //你 可 以 留 着 它 。 它 们 对 我 来 说 实 际 上 没 有 任 何 价 值 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Erol_what_dein_Add_10_02"); //但 是 它 们 之 中 没 有 任 何 真 正 有 价 值 的 东 西 。
	};

	AI_Output(self, other, "DIA_Addon_Erol_what_dein_10_02"); //因 为 无 法 弥 补 的 就 是 他 们 从 我 这 里 偷 走 的 三 块 石 片 。

	Info_AddChoice(DIA_Addon_Erol_what, DIALOG_BACK, DIA_Addon_Erol_what_back);
	Info_AddChoice(DIA_Addon_Erol_what, "石 片 ？", DIA_Addon_Erol_what_Was);
};

func void DIA_Addon_Erol_what_Was()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_Was_15_00"); //石 片 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_Was_10_01"); //镇 上 有 个 水 法 师 想 要 向 我 购 买 它 们 ， 而 我 已 经 同 意 把 它 们 给 他 。
	AI_Output(self, other, "DIA_Addon_Erol_what_Was_10_02"); //我 必 须 不 惜 一 切 代 价 把 它 们 找 回 来 ， 否 则 我 的 声 誉 就 彻 底 毁 了 。

	Info_AddChoice(DIA_Addon_Erol_what, "你 从 哪 里 得 到 那 些 石 片 的 ？", DIA_Addon_Erol_what_woher);
	Info_AddChoice(DIA_Addon_Erol_what, "为 什 么 水 法 师 想 要 它 们 ？", DIA_Addon_Erol_what_KDW);
};

func void DIA_Addon_Erol_what_KDW()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_KDW_15_00"); //为 什 么 水 法 师 想 要 它 们 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_KDW_10_01"); //他 说 他 正 在 研 究 它 们 ， 并 要 我 再 给 他 多 找 一 些 。
};

func void DIA_Addon_Erol_what_woher()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_woher_15_00"); //你 从 哪 里 得 到 那 些 石 片 的 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_woher_10_01"); //它 们 是 我 在 一 些 古 老 的 建 筑 附 近 找 到 的 ， 例 如 陵 墓 、 山 洞 。
	AI_Output(self, other, "DIA_Addon_Erol_what_woher_10_02"); //我 已 经 向 镇 上 的 水 法 师 出 售 了 一 大 批 。
	AI_Output(self, other, "DIA_Addon_Erol_what_woher_10_03"); //不 过 它 们 在 这 边 非 常 稀 有 。 我 通 常 是 在 克 霍 里 尼 斯 的 东 北 部 找 到 它 们 的 。

	Info_AddChoice(DIA_Addon_Erol_what, "你 为 什 么 不 简 单 点 去 找 一 些 新 的 呢 ？", DIA_Addon_Erol_what_neue);
};

func void DIA_Addon_Erol_what_neue()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_neue_15_00"); //你 为 什 么 不 简 单 点 去 找 一 些 新 的 呢 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_neue_10_01"); //在 和 强 盗 搏 斗 的 时 候 ， 我 扭 伤 了 我 的 脚 。
	AI_Output(self, other, "DIA_Addon_Erol_what_neue_10_02"); //我 还 能 蹒 跚 而 行 ， 但 是 我 不 想 拖 着 这 条 腿 走 得 太 远 。
};

func void DIA_Addon_Erol_what_wer()
{
	AI_Output(other, self, "DIA_Addon_Erol_what_wer_15_00"); //那 些 人 是 谁 ？
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_01"); //强 盗 ！ 还 有 谁 ？ 他 们 占 领 了 上 面 的 桥 。
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_02"); //他 们 抢 劫 所 有 从 桥 上 路 过 的 人 。
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_03"); //我 知 道 他 们 在 上 面 横 行 ， 所 以 我 选 择 从 桥 下 走 。
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_04"); //但 是 我 的 马 车 和 货 物 对 他 们 的 吸 引 力 太 大 了 。
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_05"); //那 些 畜 牲 就 那 么 从 桥 上 跳 下 来 - 直 接 落 在 我 的 马 车 上 。
	AI_Output(self, other, "DIA_Addon_Erol_what_wer_10_06"); //我 真 应 该 等 到 晚 上 偷 偷 地 过 去 … …
};

///////////////////////////////////////////////////////////////////////
//	Info FernandosWeapons
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_FernandosWeapons(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_FernandosWeapons_Condition;
	information		= DIA_Addon_Erol_FernandosWeapons_Info;
	description		= "我 需 要 交 给 强 盗 的 武 器 货 物 的 信 息 。";
};

func int DIA_Addon_Erol_FernandosWeapons_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Erol_what))
	&& (MIS_Vatras_FindTheBanditTrader == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_FernandosWeapons_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_FernandosWeapons_15_00"); //我 需 要 交 给 强 盗 的 武 器 货 物 的 信 息 。
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_10_01"); //武 器 运 输 ？ 是 的 ， 我 知 道 那 事 。 城 里 有 些 混 蛋 卖 给 他 们 那 么 多 的 武 器 ， 他 们 差 点 都 不 能 把 它 们 全 运 走 。
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_10_02"); //有 一 些 存 放 在 桥 上 那 些 混 蛋 袭 击 我 的 地 方 。
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_10_03"); //其 余 的 可 能 拉 到 高 原 牧 场 上 本 加 的 农 场 的 那 个 方 向 去 了 。
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_10_04"); //也 许 强 盗 们 想 把 它 们 运 送 过 关 卡 。

	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons, DIALOG_BACK, DIA_Addon_Erol_FernandosWeapons_back);
	Info_AddChoice(DIA_Addon_Erol_FernandosWeapons, "那 些 高 原 牧 场 在 哪 里 ？", DIA_Addon_Erol_FernandosWeapons_bengar);
};

func void DIA_Addon_Erol_FernandosWeapons_bengar()
{
	AI_Output(other, self, "DIA_Addon_Erol_FernandosWeapons_bengar_15_00"); //那 些 高 原 牧 场 在 哪 里 ？
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_01"); //奥 兰 的 酒 馆 坐 落 在 克 霍 里 尼 斯 岛 的 中 央 。 它 叫 作 ‘ 死 亡 女 妖 ’ 。
	AI_Output(self, other, "DIA_Addon_Erol_FernandosWeapons_bengar_10_02"); //从 那 里 有 一 条 向 南 的 路 。 它 通 向 高 原 牧 场 和 矿 藏 山 谷 的 关 卡 入 口 。
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

func void DIA_Addon_Erol_FernandosWeapons_back()
{
	Info_ClearChoices(DIA_Addon_Erol_FernandosWeapons);
};

///////////////////////////////////////////////////////////////////////
//	Info Stoneplates
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Stoneplates(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_Stoneplates_Condition;
	information		= DIA_Addon_Erol_Stoneplates_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 石 片 … …";
};

func int DIA_Addon_Erol_Stoneplates_Condition()
{
	if (MIS_Addon_Erol_BanditStuff == LOG_RUNNING)
	{
		return TRUE;
	};
};

var int StoneplatesCounter;
const int Addon_ErolsStoneplatesOffer = (Value_StonePlateCommon + 5); // Joly:Kohle für eine StonePlateCommon

func void DIA_Addon_Erol_Stoneplates_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_Stoneplates_15_00"); //关 于 那 些 石 片 … …

	if (Npc_HasItems(other, ItWr_StonePlateCommon_Addon) >= 1)
	{
		var int StoneplatesCount;
		var int XP_Addon_BringStoneplates;
		var int StoneplatesGeld;

		StoneplatesCount = Npc_HasItems(other, ItWr_StonePlateCommon_Addon);

		if (StoneplatesCount == 1)
		{
			AI_Output(other, self, "DIA_Addon_Erol_Stoneplates_15_01"); //我 这 里 有 一 个 。
			B_GivePlayerXP(XP_Addon_BringStoneplate);
			B_GiveInvItems(other, self, ItWr_StonePlateCommon_Addon, 1);

			StoneplatesCounter = StoneplatesCounter + 1;
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Erol_Stoneplates_15_02"); //我 这 里 有 一 些 。

			if ((StoneplatesCount + StoneplatesCounter) >= 3)
			{
				B_GiveInvItems(other, self, ItWr_StonePlateCommon_Addon, 3 - StoneplatesCounter);
				XP_Addon_BringStoneplates = ((3 - StoneplatesCounter) * XP_Addon_BringStoneplate);
				StoneplatesCounter = 3;
			}
			else
			{
				B_GiveInvItems(other, self, ItWr_StonePlateCommon_Addon, StoneplatesCount);
				XP_Addon_BringStoneplates = (StoneplatesCount * XP_Addon_BringStoneplate);
				StoneplatesCounter = (StoneplatesCounter + StoneplatesCount);
			};

			B_GivePlayerXP(XP_Addon_BringStoneplates);
		};

		AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_03"); //谢 谢 。

		if (StoneplatesCounter == 1)
		{
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_04"); //现 在 我 还 差 两 个 。
		}
		else if (StoneplatesCounter == 2)
		{
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_05"); //现 在 我 只 差 一 个 了 。
		}
		else // mindestens 3 Steintafeln hat er schon.
		{
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_06"); //已 经 够 了 。 现 在 我 可 以 兑 现 我 向 镇 上 的 水 法 师 许 下 的 诺 言 了 ， 终 于 可 以 回 家 了 。

			MIS_Addon_Erol_BanditStuff = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01", GIL_PUBLIC);
		};

		AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_07"); //当 然 ， 我 会 付 给 你 报 酬 。

		StoneplatesGeld = (Addon_ErolsStoneplatesOffer * Npc_HasItems(self, ItWr_StonePlateCommon_Addon));

		CreateInvItems(self, ItMi_Gold, StoneplatesGeld);
		B_GiveInvItems(self, other, ItMi_Gold, StoneplatesGeld);

		Npc_RemoveInvItems(self, ItWr_StonePlateCommon_Addon, Npc_HasItems(self, ItWr_StonePlateCommon_Addon)); // Joly: weil er zum Händler wird.

		if (MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_08"); //我 现 在 要 回 家 了 。 如 果 你 愿 意 ， 可 以 和 我 一 起 走 。
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_09"); //也 许 等 我 们 到 了 那 里 的 时 候 ， 我 可 以 卖 你 一 些 可 能 让 你 感 兴 趣 的 东 西 。

			AI_StopProcessInfos(self);
			AI_UseMob(self, "BENCH", -1);
			AI_GotoWP(self, "NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self, "Start");
			Wld_AssignRoomToGuild("grpwaldhuette01", GIL_PUBLIC);
		};
	}
	else
	{
		if (C_ScHasMagicStonePlate() == TRUE)
		{
			AI_Output(other, self, "DIA_Addon_Erol_Stoneplates_15_10"); //那 么 这 个 怎 么 样 ？
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_11"); //不 。 这 种 石 片 是 有 魔 力 的 。
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_12"); //唉 ， 水 法 师 不 会 买 这 种 石 片 的 。
		}
		else
		{
			AI_Output(other, self, "DIA_Addon_Erol_Stoneplates_15_13"); //那 里 有 多 少 ？
			AI_Output(self, other, "DIA_Addon_Erol_Stoneplates_10_14"); //要 维 持 我 与 镇 上 水 法 师 之 间 的 关 系 ， 我 需 要 三 块 石 片 。
		};
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Buerger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Buerger(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_Buerger_Condition;
	information		= DIA_Addon_Erol_Buerger_Info;
	description		= "你 是 镇 上 的 市 民 ？";
};

func int DIA_Addon_Erol_Buerger_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Erol_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Buerger_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_Buerger_15_00"); //你 是 镇 上 的 市 民 ？
	AI_Output(self, other, "DIA_Addon_Erol_Buerger_10_01"); //不 久 之 前 ， 小 子 。 我 和 克 霍 里 尼 斯 富 人 区 那 些 腐 败 的 家 伙 之 间 保 持 友 好 关 系 。
	AI_Output(self, other, "DIA_Addon_Erol_Buerger_10_02"); //你 知 道 ， 我 曾 经 在 是 那 里 相 当 有 势 力 的 人 。 不 过 那 是 几 个 月 前 的 事 。
};

///////////////////////////////////////////////////////////////////////
//	Info PreTeach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTeach(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_PreTeach_Condition;
	information		= DIA_Addon_Erol_PreTeach_Info;
	description		= "你 打 算 赶 走 那 些 强 盗 ？";
};

func int DIA_Addon_Erol_PreTeach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Erol_what))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTeach_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_PreTeach_15_00"); //你 打 算 赶 走 那 些 强 盗 ？
	AI_Output(self, other, "DIA_Addon_Erol_PreTeach_10_01"); //是 的 ， 但 是 我 肯 定 他 们 还 在 桥 上 面 。
	AI_Output(other, self, "DIA_Addon_Erol_PreTeach_15_02"); //你 能 教 我 如 何 攻 击 更 凶 猛 吗 ？
	AI_Output(self, other, "DIA_Addon_Erol_PreTeach_10_03"); //我 当 然 能 。
	Erol_Addon_TeachPlayer = TRUE;
	Log_CreateTopic(Topic_OutTeacher, LOG_NOTE);
	B_LogEntry(Topic_OutTeacher, LogText_Addon_Erol_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info PreTrade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_PreTrade(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 100;
	condition		= DIA_Addon_Erol_PreTrade_Condition;
	information		= DIA_Addon_Erol_PreTrade_Info;
	permanent		= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Addon_Erol_PreTrade_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Erol_what))
	&& (Npc_GetDistToWP(self, "NW_BIGFARM_HUT_IN_01") > 2000))
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_PreTrade_Info()
{
	B_Say(other, self, "$TRADE_2");
	AI_Output(self, other, "DIA_Addon_Erol_PreTrade_10_00"); //我 没 法 卖 给 你 任 何 东 西 。 我 所 有 的 东 西 都 在 那 里 ， 在 桥 下 面 ， 小 伙 子 。
	AI_Output(self, other, "DIA_Addon_Erol_PreTrade_10_01"); //只 有 当 我 到 家 的 时 候 ， 我 才 能 卖 给 你 一 些 东 西 。

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Erol_PreTrade_10_02"); //但 是 在 我 找 回 我 的 石 片 之 前 ， 我 不 会 离 开 这 里 。
	};
};

///////////////////////////////////////////////////////////////////////
//	Info SLD
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_SLD(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 5;
	condition		= DIA_Addon_Erol_SLD_Condition;
	information		= DIA_Addon_Erol_SLD_Info;
	description		= "这 是 你 的 小 屋 ？";
};

func int DIA_Addon_Erol_SLD_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_BIGFARM_HUT_IN_01") < 2000))
	{
		return TRUE;
	};
};

var int Erol_IsAtHome;
func void DIA_Addon_Erol_SLD_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_SLD_15_00"); //（ 感 到 惊 讶 ） 这 是 你 的 小 屋 ？
	AI_Output(self, other, "DIA_Addon_Erol_SLD_10_01"); //是 的 。 怎 么 了 ？ 有 什 么 问 题 吗 ？
	AI_Output(other, self, "DIA_Addon_Erol_SLD_15_02"); //你 和 那 些 雇 佣 兵 之 间 不 会 有 什 么 问 题 吗 ？
	AI_Output(self, other, "DIA_Addon_Erol_SLD_10_03"); //只 要 我 不 妨 碍 他 们 的 事 ， 他 们 也 不 管 我 。
	AI_Output(self, other, "DIA_Addon_Erol_SLD_10_04"); //此 外 ， 他 们 还 是 优 秀 的 顾 客 ， 当 我 不 在 家 的 时 候 ， 我 雇 他 们 帮 我 看 房 子 。
	B_GivePlayerXP(XP_Ambient);
	if (Erol_IsAtHome == FALSE)
	{
		Npc_ExchangeRoutine(self, "HOME");
		Erol_IsAtHome = TRUE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Erol_Trade(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 100;
	condition		= DIA_Addon_Erol_Trade_Condition;
	information		= DIA_Addon_Erol_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "让 我 看 看 你 的 货 物 。";
};

func int DIA_Addon_Erol_Trade_Condition()
{
	if ((MIS_Addon_Erol_BanditStuff == LOG_SUCCESS)
	&& ((Npc_GetDistToWP(self, "NW_BIGFARM_HUT_IN_01") < 3000)))
	{
		return TRUE;
	};
};

var int DIA_Addon_Erol_Trade_OneTime;
func void DIA_Addon_Erol_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other, self, "$TRADE_2");
	AI_Output(self, other, "DIA_Addon_Erol_Trade_10_00"); //恐 怕 没 有 太 多 的 选 择 。

	if (Erol_IsAtHome == FALSE)
	{
		Log_CreateTopic(Topic_OutTrader, LOG_NOTE);
		B_LogEntry(Topic_OutTrader, LogText_Addon_ErolTrade);

		Npc_ExchangeRoutine(self, "Home");
		Erol_IsAtHome = TRUE;
	};
};

//*******************************************
//	TeachPlayer
//*******************************************
instance DIA_Addon_Erol_Teach(C_INFO)
{
	npc				= VLK_4303_Addon_Erol;
	nr				= 99;
	condition		= DIA_Addon_Erol_Teach_Condition;
	information		= DIA_Addon_Erol_Teach_Info;
	permanent		= TRUE;
	description		= "告 诉 我 怎 么 才 能 打 的 更 狠 。";
};

func int DIA_Addon_Erol_Teach_Condition()
{
	if (Erol_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Erol_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Erol_Teach_15_00"); //告 诉 我 怎 么 才 能 打 的 更 狠 。

	if (MIS_Addon_Erol_BanditStuff != LOG_SUCCESS)
	{
		AI_Output(self, other, "DIA_Addon_Erol_Teach_10_01"); //好 吧 ， 但 是 你 还 欠 我 一 个 情 。
		AI_Output(self, other, "DIA_Addon_Erol_Teach_10_02"); //帮 我 挽 回 我 的 声 誉 ， 把 我 的 石 片 找 回 来 。
		AI_Output(self, other, "DIA_Addon_Erol_Teach_10_03"); //然 后 我 可 以 教 你 如 何 在 战 斗 中 更 有 效 地 使 用 你 的 力 量 。
	}
	else if (Erol_Bonus == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Erol_Teach_Add_10_00"); //正 确 。 要 注 意 ， 有 一 个 简 单 的 窍 门 。
		AI_Output(self, other, "DIA_Addon_Erol_Teach_Add_10_01"); //当 你 攻 击 的 时 候 ， 不 要 用 你 的 手 臂 发 力 ， 而 是 要 用 全 身 。
		AI_Output(self, other, "DIA_Addon_Erol_Teach_Add_10_02"); //转 臀 ， 把 你 的 肩 膀 转 向 前 方 ， 然 后 同 时 伸 展 你 的 胳 膊 。
		AI_Output(self, other, "DIA_Addon_Erol_Teach_Add_10_03"); //（ 大 笑 ） 如 果 你 的 动 作 正 确 ， 你 就 会 体 会 到 不 同 之 处 ！
		B_RaiseAttribute(other, ATR_STRENGTH, 1);
		Erol_Bonus = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Erol_Teach_Add_10_04"); //如 果 你 想 要 学 习 更 多 的 知 识 ， 就 要 努 力 训 练 … …
		Info_ClearChoices(DIA_Addon_Erol_Teach);
		Info_AddChoice(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
		Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Erol_Teach_STR_1);
		Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Erol_Teach_STR_5);
	};
};

func void DIA_Addon_Erol_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_Erol_Teach);
};

func void DIA_Addon_Erol_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MAX);

	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Erol_Teach_STR_5);
};

func void DIA_Addon_Erol_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MAX);

	Info_ClearChoices(DIA_Addon_Erol_Teach);
	Info_AddChoice(DIA_Addon_Erol_Teach, DIALOG_BACK, DIA_Addon_Erol_Teach_Back);
	Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_Erol_Teach_STR_1);
	Info_AddChoice(DIA_Addon_Erol_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_Erol_Teach_STR_5);
};
