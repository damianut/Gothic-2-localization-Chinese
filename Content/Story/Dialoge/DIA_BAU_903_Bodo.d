// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Bodo_EXIT(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 999;
	condition		= DIA_Bodo_EXIT_Condition;
	information		= DIA_Bodo_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Bodo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bodo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				  Hallo (PERM)
// ************************************************************
instance DIA_Bodo_Hallo(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 1;
	condition		= DIA_Bodo_Hallo_Condition;
	information		= DIA_Bodo_Hallo_Info;
	permanent		= TRUE;
	description		= "怎 么 样 了 ？";
};

func int DIA_Bodo_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Hallo_Info()
{
	AI_Output(other, self, "DIA_Bodo_Hallo_15_00"); //怎 么 样 了 ？
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Bodo_Hallo_12_01"); //民 兵 已 经 欺 压 我 们 很 久 了 。 既 然 雇 佣 兵 站 在 我 们 一 边 ， 他 们 再 也 不 敢 露 面 了 。
		AI_Output(self, other, "DIA_Bodo_Hallo_12_02"); //国 王 以 为 他 可 以 做 任 何 事 而 不 用 承 担 后 果 ， 但 是 现 在 我 们 不 会 再 忍 受 下 去 了 。
	};

	if ((other.guild == GIL_SLD)
	|| (other.guild == GIL_DJG))
	{
		AI_Output(self, other, "DIA_Bodo_Hallo_12_03"); //好 。 如 果 你 看 到 民 兵 的 话 ， 帮 我 揍 他 们 ， 行 吗 ？
	};

	if ((other.guild == GIL_NOV)
	|| (other.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Bodo_Hallo_12_04"); //好 。 英 诺 斯 与 你 同 在 。
	};

	if ((other.guild == GIL_MIL)
	|| (other.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Bodo_Hallo_12_05"); //国 王 的 军 队 在 农 场 不 受 欢 迎 。
		AI_Output(self, other, "DIA_Bodo_Hallo_12_06"); //这 里 有 很 多 人 都 会 和 你 交 谈 ， 但 是 你 别 以 为 自 己 很 受 欢 迎 。
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
instance DIA_Bodo_Bauernaufstand(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 2;
	condition		= DIA_Bodo_Bauernaufstand_Condition;
	information		= DIA_Bodo_Bauernaufstand_Info;
	description		= "在 镇 上 ， 他 们 都 在 谈 论 农 民 的 反 叛 ！";
};

func int DIA_Bodo_Bauernaufstand_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bauernaufstand_Info()
{
	AI_Output(other, self, "DIA_Bodo_Bauernaufstand_15_00"); //在 镇 上 ， 他 们 都 在 谈 论 农 民 的 反 叛 ！
	AI_Output(self, other, "DIA_Bodo_Bauernaufstand_12_01"); //胡 扯 。 我 们 除 了 尽 力 完 成 我 们 的 保 护 工 作 外 ， 不 做 任 何 其 它 事 情 。
	AI_Output(self, other, "DIA_Bodo_Bauernaufstand_12_02"); //农 民 们 背 地 里 的 争 论 当 然 是 真 的 。 但 是 欧 纳 尔 不 会 在 国 王 要 把 我 们 吸 干 的 时 候 袖 手 旁 观 。
};

// ************************************************************
// 			  				   Bett
// ************************************************************
instance DIA_Bodo_Bett(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 3;
	condition		= DIA_Bodo_Bett_Condition;
	information		= DIA_Bodo_Bett_Info;
	description		= "我 能 在 这 附 近 休 息 吗 ？";
};

func int DIA_Bodo_Bett_Condition()
{
	return TRUE;
};

func void DIA_Bodo_Bett_Info()
{
	AI_Output(other, self, "DIA_Bodo_Bett_15_00"); //我 能 在 这 附 近 休 息 吗 ？
	AI_Output(self, other, "DIA_Bodo_Bett_12_01"); //如 过 你 想 找 个 睡 觉 的 地 方 ， 那 就 去 谷 仓 。 但 是 不 要 误 躺 在 雇 佣 兵 的 床 上 。
	AI_Output(self, other, "DIA_Bodo_Bett_12_02"); //欧 纳 尔 让 他 们 保 证 不 干 扰 我 们 这 些 农 民 ， 但 是 对 于 不 属 于 农 场 的 陌 生 人 ， 雇 佣 兵 们 可 以 为 所 欲 为 。
};

// ************************************************************
// 			  				   Cipher
// ************************************************************
instance DIA_Bodo_Cipher(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 4;
	condition		= DIA_Bodo_Cipher_Condition;
	information		= DIA_Bodo_Cipher_Info;
	description		= "希 弗 告 诉 我 有 人 从 他 那 里 偷 走 了 一 包 沼 生 草 … …";
};

func int DIA_Bodo_Cipher_Condition()
{
	if ((MIS_Cipher_BringWeed == LOG_RUNNING)
	|| (MIS_Cipher_Paket == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Bodo_Cipher_Info()
{
	AI_Output(other, self, "DIA_Bodo_Cipher_15_00"); //希 弗 告 诉 我 有 人 从 他 那 里 偷 走 了 一 包 沼 生 草 … …
	AI_Output(self, other, "DIA_Bodo_Cipher_12_01"); //还 好 吗 ？
	AI_Output(other, self, "DIA_Bodo_Cipher_15_02"); //他 以 为 你 就 是 那 个 人 。
	AI_Output(self, other, "DIA_Bodo_Cipher_12_03"); //哦 ， 所 以 那 家 伙 才 一 直 傻 傻 地 盯 着 我 看 。
	AI_Output(self, other, "DIA_Bodo_Cipher_12_04"); //我 近 来 对 他 格 外 友 好 ， 因 为 他 看 起 来 很 合 乎 要 求 。
	AI_Output(self, other, "DIA_Bodo_Cipher_12_05"); //但 是 我 什 么 也 做 不 了 。 我 友 善 地 看 着 他 ， 而 他 盯 着 我 好 像 要 把 我 杀 掉 。
};

// ************************************************************
// 			  				  WeedOrElse
// ************************************************************
instance DIA_Bodo_WeedOrElse(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 5;
	condition		= DIA_Bodo_WeedOrElse_Condition;
	information		= DIA_Bodo_WeedOrElse_Info;
	description		= "把 那 些 沼生草 给 我 ， 不 然 的 话 ！";
};

func int DIA_Bodo_WeedOrElse_Condition()
{
	if ((MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bodo_Cipher)))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedOrElse_Info()
{
	AI_Output(other, self, "DIA_Bodo_WeedOrElse_15_00"); //把 那 些 沼生草 给 我 ， 不 然 的 话 ！
	AI_Output(self, other, "DIA_Bodo_WeedOrElse_12_01"); //听 着 ， 我 只 有 这 个 烟 卷 。 拿 上 它 走 开 。
	B_GiveInvItems(self, other, itmi_joint, 1);
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Bodo_WeedOrElse_12_02"); //你 知 道 那 个 欧 纳 尔 的 雇 佣 兵 在 提 防 我 们 ， 对 吗 ？
		AI_Output(self, other, "DIA_Bodo_WeedOrElse_12_03"); //所 以 不 要 做 任 何 傻 事 ！
	};
};

// ************************************************************
// 			  				  WeedPERM
// ************************************************************
instance DIA_Bodo_WeedPERM(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 6;
	condition		= DIA_Bodo_WeedPERM_Condition;
	information		= DIA_Bodo_WeedPERM_Info;
	permanent		= TRUE;
	description		= "我 不 相 信 你 说 的 任 何 话 。 把 沼 生 草 给 我 ！";
};

func int DIA_Bodo_WeedPERM_Condition()
{
	if ((MIS_Cipher_BringWeed == LOG_RUNNING)
	&& (Npc_KnowsInfo(other, DIA_Bodo_WeedOrElse)))
	{
		return TRUE;
	};
};

func void DIA_Bodo_WeedPERM_Info()
{
	AI_Output(other, self, "DIA_Bodo_WeedPERM_15_00"); //我 不 相 信 你 说 的 任 何 话 。 把 沼 生 草 给 我 ！
	AI_Output(self, other, "DIA_Bodo_WeedPERM_12_01"); //诚 实 的 讲 ， 我 没 有 。
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Bodo_PICKPOCKET(C_INFO)
{
	npc				= BAU_903_Bodo;
	nr				= 900;
	condition		= DIA_Bodo_PICKPOCKET_Condition;
	information		= DIA_Bodo_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Bodo_PICKPOCKET_Condition()
{
	C_Beklauen(30, 60);
};

func void DIA_Bodo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
	Info_AddChoice(DIA_Bodo_PICKPOCKET, DIALOG_BACK, DIA_Bodo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Bodo_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Bodo_PICKPOCKET_DoIt);
};

func void DIA_Bodo_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};

func void DIA_Bodo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Bodo_PICKPOCKET);
};
