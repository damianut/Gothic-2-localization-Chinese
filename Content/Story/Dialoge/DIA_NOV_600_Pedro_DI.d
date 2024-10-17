///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_EXIT(C_INFO)
{
	npc				= NOV_600_Pedro_DI;
	nr				= 999;
	condition		= DIA_Pedro_DI_EXIT_Condition;
	information		= DIA_Pedro_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Verräter
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_YOU(C_INFO)
{
	npc				= NOV_600_Pedro_DI;
	nr				= 2;
	condition		= DIA_Pedro_DI_YOU_Condition;
	information		= DIA_Pedro_DI_YOU_Info;
	description		= "叛 徒 ！";
};

func int DIA_Pedro_DI_YOU_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_15_00"); //叛 徒 ！ 我 终 于 找 到 你 了 。

	if ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other, self, "DIA_Pedro_DI_YOU_15_01"); //你 不 要 因 为 我 是 圣 骑 士 就 以 为 我 会 怜 悯 你 。
	};

	if ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other, self, "DIA_Pedro_DI_YOU_15_02"); //我 们 雇 佣 兵 中 很 多 人 都 把 他 们 的 灵 魂 卖 给 了 贝 利 尔 ， 不 过 我 在 杀 死 他 们 的 时 候 ， 常 常 还 会 感 到 后 悔 。 对 于 你 ， 下 流 的 畜 牲 ， 我 会 破 一 次 例 ！。
	};

	if (hero.guild == GIL_KDF)
	{
		AI_Output(other, self, "DIA_Pedro_DI_YOU_15_03"); //在 我 一 生 中 遇 到 的 所 有 的 没 有 灵 魂 的 混 蛋 里 ， 你 是 迄 今 为 止 最 差 的 。 你 让 我 们 的 修 道 会 蒙 羞 。
	};

	AI_Output(other, self, "DIA_Pedro_DI_YOU_15_04"); //我 应 该 当 场 杀 死 你 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_09_05"); //住 手 ， 我 求 求 你 。 他 们 在 我 身 上 施 加 了 一 个 魔 法 。 我 自 己 是 永 远 不 会 背 叛 修 道 院 的 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_09_06"); //你 不 知 道 在 前 些 日 子 里 我 处 于 什 么 样 的 状 态 。 他 们 把 这 个 声 音 放 在 我 的 脑 袋 里 。 我 没 法 抵 抗 它 ， 没 法 保 护 自 己 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_09_07"); //兽 人 上 校 审 问 了 我 几 天 ， 他 不 停 地 打 我 。 原 谅 我 ， 我 没 有 犯 罪 ， 你 必 须 相 信 我 。

	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU, "那 么 告 诉 我 你 知 道 的 事 情 。", DIA_Pedro_DI_YOU_verschon);
	Info_AddChoice(DIA_Pedro_DI_YOU, "我 不 必 做 任 何 事 情 。 我 现 在 要 杀 了 你 。", DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU, "给 我 一 个 理 由 ， 我 为 什 么 要 相 信 你 。？", DIA_Pedro_DI_YOU_grund);
	if (MIS_Gorax_KillPedro == LOG_RUNNING)
	{
		Info_AddChoice(DIA_Pedro_DI_YOU, "瑟 朋 帝 兹 给 我 下 达 了 命 令 要 杀 掉 你", DIA_Pedro_DI_YOU_Serpentes);
	};
};

func void DIA_Pedro_DI_YOU_grund()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_grund_15_00"); //给 我 一 个 理 由 ， 我 为 什 么 要 相 信 你 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_grund_09_01"); //（ 恳 求 ） 让 我 活 着 。 我 还 能 告 诉 你 一 些 消 息 ， 帮 助 你 再 次 离 开 这 里 。 你 一 定 要 听 我 说 。
};

var int PedroDI_Flee;
func void DIA_Pedro_DI_YOU_tot()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_tot_15_00"); //我 不 必 做 任 何 事 情 。 我 现 在 要 杀 了 你 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_tot_09_01"); //以 众 神 的 名 义 … …

	AI_StopProcessInfos(self);

	Npc_ExchangeRoutine(self, "Ship");
	B_Attack(self, other, AR_NONE, 1);
	PedroDI_Flee = LOG_RUNNING;
};

func void DIA_Pedro_DI_YOU_Serpentes()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_Serpentes_15_00"); //瑟 朋 帝 兹 给 我 下 达 命 令 杀 死 你 ， 因 为 原 则 关 系 ， 我 要 按 我 的 命 令 去 做 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_Serpentes_09_01"); //（ 恳 求 ） 求 求 你 ， 不 要 。 你 不 能 那 么 做 ， 我 对 你 还 有 很 大 用 处 ， 你 一 定 知 道 的 。

	B_GivePlayerXP(XP_Pedro_SerpentesMission);
	MIS_Gorax_KillPedro = LOG_SUCCESS; // Joly: bei erfolgreicher Mission in folgenden Dialogen muss heißen; if((Npc_IsDead(PedroDI)) && (MIS_Gorax_KillPedro == LOG_SUCCESS))
};

func void DIA_Pedro_DI_YOU_verschon()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_verschon_15_00"); //那 么 告 诉 我 你 知 道 的 事 情。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_verschon_09_01"); //（ 放 心 的 ） 是 的 ， 当 然 。 我 会 告 诉 你 所 有 你 想 知 道 的 事 。 只 有 一 个 条 件 ， 你 必 须 把 我 从 这 个 被 诅 咒 的 岛 上 带 出 去 ， 你 听 到 了 吗 ？

	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU, "我 不 必 做 任 何 事 情 。 我 现 在 要 杀 了 你 。", DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU, "好 吧 。 跟 我 来 ， 我 带 上 你 上 我 的 船 。", DIA_Pedro_DI_YOU_FollowShip);
};

var int MIS_Pedro_DI_FollowShip;
func void DIA_Pedro_DI_YOU_FollowShip()
{
	AI_Output(other, self, "DIA_Pedro_DI_YOU_FollowShip_15_00"); //好 吧 。 跟 我 来 ， 我 带 上 你 上 我 的 船 。
	AI_Output(self, other, "DIA_Pedro_DI_YOU_FollowShip_09_01"); //谢 谢 你 。 你 绝 不 会 后 悔 的 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_Pedro_DI_FollowShip = LOG_RUNNING;
};

///////////////////////////////////////////////////////////////////////
//	Info ArrivedAtShip
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_ArrivedAtShip(C_INFO)
{
	npc				= NOV_600_Pedro_DI;
	nr				= 4;
	condition		= DIA_Pedro_DI_ArrivedAtShip_Condition;
	information		= DIA_Pedro_DI_ArrivedAtShip_Info;
	description		= "我 们 到 了 ！";
};

func int DIA_Pedro_DI_ArrivedAtShip_Condition()
{
	if ((Npc_GetDistToWP(self, "SHIP") < 6000)
	&& (MIS_Pedro_DI_FollowShip == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_00"); //我 们 到 了 ！
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_01"); //你 那 条 船 真 威 严 。 你 的 确 是 一 个 伟 大 的 将 军 。
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_15_02"); //别 在 胡 说 八 道 了 。 马 上 告 诉 我 想 知 道 的 事 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_09_03"); //呃 ， 当 然 。 我 应 该 从 哪 里 开 始 ？

	Info_ClearChoices(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, "我 已 经 听 够 了 。", DIA_Pedro_DI_ArrivedAtShip_Back);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, "我 怎 么 才 进 入 岛 屿 的 内 部 ？", DIA_Pedro_DI_ArrivedAtShip_Innere);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, "还 有 什 么 怪 物 在 这 个 岛 上 游 荡 ？", DIA_Pedro_DI_ArrivedAtShip_Monster);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, "那 个 兽 人 上 校 怎 么 办 ？", DIA_Pedro_DI_ArrivedAtShip_OrkOberst);
};

func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00"); //那 个 兽 人 上 校 怎 么 办 ？
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01"); //他 带 走 了 我 再 次 看 到 家 乡 的 最 后 一 线 希 望 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02"); //在 我 到 这 里 之 后 ， 他 开 始 问 我 圣 骑 士 在 克 霍 里 尼 斯 的 战 略 部 署 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03"); //当 然 ， 我 不 能 告 诉 他 多 少 。 我 怎 么 会 ？ 该 死 ， 我 是 一 个 火 焰 新 信 徒 。

	if ((Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI)))
	{
		Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, "兽 人 上 校 死 了 。", DIA_Pedro_DI_ArrivedAtShip_OberstTot);
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_Monster_15_00"); //还 有 什 么 怪 物 在 这 个 岛 上 游 荡 ？
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_01"); //在 那 些 日 子 里 ， 常 常 能 看 到 蜥 蜴 人 走 向 海 岸 ， 他 们 通 常 都 带 着 一 些 巨 大 的 蛋 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Monster_09_02"); //我 在 牢 房 里 也 无 法 了 解 很 多 ， 但 是 我 想 他 们 准 备 离 开 小 岛 。
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_Innere_15_00"); //我 怎 么 才 进 入 岛 屿 的 内 部 ？
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_01"); //在 兽 人 上 校 的 王 座 室 里 有 一 条 秘 密 通 道 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_02"); //他 每 次 要 审 问 我 的 时 候 ， 他 们 都 会 把 我 拉 到 那 里 。 我 在 那 儿 看 到 了 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_03"); //有 一 个 萨 满 拉 动 挂 在 大 厅 墙 上 的 火 炬 后 ， 就 启 动 了 机 关 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_04"); //嗯 。 我 想 他 先 拉 了 左 边 的 火 炬 ， 然 后 是 右 边 ， 但 是 我 记 不 真 切 了 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_05"); //在 后 面 的 空 地 上 ， 一 条 秘 密 通 道 突 然 出 现 ， 通 向 山 脉 深 处 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Innere_09_06"); //通 道 的 尽 头 在 哪 里 ， 我 不 知 道 。
};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00"); //兽 人 上 校 死 了 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01"); //死 了 ？ 赞 美 英 诺 斯 。 我 永 远 忘 不 了 他 那 丑 恶 的 脸 。
};

func void DIA_Pedro_DI_ArrivedAtShip_Back()
{
	AI_Output(other, self, "DIA_Pedro_DI_ArrivedAtShip_Back_15_00"); //我 已 经 听 够 了 ， 去 我 的 船 上 找 个 地 方 。 我 还 有 工 作 要 做 。
	AI_Output(self, other, "DIA_Pedro_DI_ArrivedAtShip_Back_09_01"); //愿 英 诺 斯 的 力 量 伴 随 你 。 我 将 为 你 祈 祷 。

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Pedro_DI_PERM(C_INFO)
{
	npc				= NOV_600_Pedro_DI;
	nr				= 5;
	condition		= DIA_Pedro_DI_PERM_Condition;
	information		= DIA_Pedro_DI_PERM_Info;
	permanent		= TRUE;
	description		= "累 了 ？";
};

var int PedroDI_TalkNomore;
func int DIA_Pedro_DI_PERM_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Pedro_DI_YOU))
	&& (PedroDI_TalkNomore == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_PERM_Info()
{
	AI_Output(other, self, "DIA_Pedro_DI_PERM_15_00"); //累 了 ？

	if (Npc_GetDistToWP(self, "SHIP_DECK_05") < 1000)
	{
		if (PedroDI_Flee == LOG_RUNNING)
		{
			AI_Output(other, self, "DIA_Pedro_DI_PERM_15_01"); //那 你 需 要 我 帮 你 拿 一 个 枕 头 吗 ？
			AI_Output(self, other, "DIA_Pedro_DI_PERM_09_02"); //请 原 谅 我 。 我 会 安 静 地 坐 在 这 里 ， 决 不 发 出 一 点 声 音 。
			AI_Output(other, self, "DIA_Pedro_DI_PERM_15_03"); //额。
			B_GivePlayerXP(XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if (Npc_IsDead(Dragon_Undead))
		{
			AI_Output(self, other, "DIA_Pedro_DI_PERM_09_04"); //我 已 经 完 全 累 坏 了 。
			AI_Output(other, self, "DIA_Pedro_DI_PERM_15_05"); //去 麻 袋 上 躺 下 吧 。 我 们 很 快 就 会 回 到 海 上 。
			AI_Output(self, other, "DIA_Pedro_DI_PERM_09_06"); //谢 谢 ， 老 兄 。 我 已 经 打 算 在 这 张 长 凳 上 睡 觉 了 。 晚 安 。
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self, "SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Pedro_DI_PERM_09_07"); //好 吧 。 谢 谢 。
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Pedro_DI_PERM_09_08"); //请 让 我 活 着 ！
		AI_StopProcessInfos(self);
	};
};
