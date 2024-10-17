//************************************************************
//		  					EXIT
//************************************************************
instance DIA_Addon_Henry_EXIT(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 999;
	condition		= DIA_Addon_Henry_EXIT_Condition;
	information		= DIA_Addon_Henry_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Henry_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Henry_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// -----------------------------------------------------------
func void B_Henry_Gold(var int gold)
{
	if (gold == 500)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Gold500_04_00"); //5 0 0 枚 金 币 。
	}
	else if (gold == 400)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Gold400_04_00"); //4 0 0 枚 金 币 。
	}
	else if (gold == 300)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Gold300_04_00"); //3 0 0 枚 金 币 。
	}
	else if (gold == 200)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Gold200_04_00"); //2 0 0 枚 金 币 。
	}
	else if (gold == 100)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Gold100_04_00"); //1 0 0 枚 金 币 。
	}
	else
	{
		B_Say_Gold(self, other, gold);
	};
};

// -----------------------------------------------------------

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Henry_PICKPOCKET(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 900;
	condition		= DIA_Addon_Henry_PICKPOCKET_Condition;
	information		= DIA_Addon_Henry_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Henry_PICKPOCKET_Condition()
{
	C_Beklauen(40, 60);
};

func void DIA_Addon_Henry_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET, DIALOG_BACK, DIA_Addon_Henry_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Henry_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Henry_PICKPOCKET_DoIt);
};

func void DIA_Addon_Henry_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

func void DIA_Addon_Henry_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Henry_PICKPOCKET);
};

// ************************************************************
// 				  	Guard_Passage - First Warn
// ************************************************************
// ------------------------------------------------------------
const string PIR_1354_Checkpoint = "ADW_PIRATECAMP_WAY_02";
// ------------------------------------------------------------
instance DIA_Addon_Henry_Hello(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 5;
	condition		= DIA_Addon_Henry_Hello_Condition;
	information		= DIA_Addon_Henry_Hello_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Henry_Hello_Condition()
{
	if (Npc_GetDistToWP(other, PIR_1354_Checkpoint) <= 700) // NICHT von hinten!
	{
		Npc_SetRefuseTalk(self, 5);
		return FALSE;
	};

	if ((self.aivar[AIV_Guardpassage_Status] == GP_NONE)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Hello_Info()
{
	AI_Output(self, other, "DIA_Addon_Henry_Hello_04_00"); //停 下 ！
	AI_Output(self, other, "DIA_Addon_Henry_Hello_04_01"); //朋 友 还 是 敌 人 ？

	Info_ClearChoices(DIA_Addon_Henry_Hello);
	Info_AddChoice(DIA_Addon_Henry_Hello, "敌 人 ！", DIA_Addon_Henry_Hello_Feind);
	Info_AddChoice(DIA_Addon_Henry_Hello, "朋 友 ！", DIA_Addon_Henry_Hello_Freund);
};

var int Henry_SC_Frech;
func void DIA_Addon_Henry_Hello_Feind()
{
	AI_Output(other, self, "DIA_Addon_Henry_Hello_Feind_15_00"); //敌 人 ！
	AI_Output(self, other, "DIA_Addon_Henry_Hello_Feind_04_01"); //想 要 挨 一 顿 打 吗 ， 你 这 个 小 丑 ？
	AI_Output(self, other, "DIA_Addon_Henry_Hello_Feind_04_02"); //告 诉 我 你 在 这 里 想 要 什 么 ， 或 者 赶 快 走 开 。

	Henry_SC_Frech = TRUE;

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;

	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

func void DIA_Addon_Henry_Hello_Freund()
{
	AI_Output(other, self, "DIA_Addon_Henry_Hello_Freund_15_00"); //朋 友 ！
	AI_Output(self, other, "DIA_Addon_Henry_Hello_Freund_04_01"); //谁 都 能 那 么 说 ！ 我 不 认 识 你 ， 你 在 这 里 想 要 做 什 么 ？

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_FirstWarnGiven;

	Info_ClearChoices(DIA_Addon_Henry_Hello);
};

// ************************************************************
// 				  	Guard_Passage - Second Warn
// ************************************************************
instance DIA_Addon_Henry_SecondWarn(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 2;
	condition		= DIA_Addon_Henry_SecondWarn_Condition;
	information		= DIA_Addon_Henry_SecondWarn_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Henry_SecondWarn_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_FirstWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, pir_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_henry_SecondWarn_Info()
{
	AI_Output(self, other, "DIA_Addon_Henry_SecondWarn_04_00"); //再 靠 近 营 地 一 步 ， 我 就 拿 你 去 喂 鲨 鱼 。

	other.aivar[AIV_LastDistToWP] = Npc_GetDistToWP(other, Pir_1354_Checkpoint);
	self.aivar[AIV_Guardpassage_Status] = GP_SecondWarnGiven;

	AI_StopProcessInfos(self);
};

// ************************************************************
// 				  	Guard_Passage - Attack
// ************************************************************
instance DIA_Addon_Henry_Attack(C_INFO)
{
	npc				= Pir_1354_Addon_Henry;
	nr				= 3;
	condition		= DIA_Addon_Henry_Attack_Condition;
	information		= DIA_Addon_Henry_Attack_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Addon_Henry_Attack_Condition()
{
	if ((self.aivar[AIV_Guardpassage_Status] == GP_SecondWarnGiven)
	&& (self.aivar[AIV_PASSGATE] == FALSE)
	&& (Hlp_StrCmp(Npc_GetNearestWP(self), self.wp) == TRUE)
	&& (Npc_GetDistToWP(other, Pir_1354_Checkpoint) < (other.aivar[AIV_LastDistToWP] - 50)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Attack_Info()
{
	other.aivar[AIV_LastDistToWP] = 0;
	self.aivar[AIV_Guardpassage_Status] = GP_NONE; // wird auch in ZS_Attack resettet

	AI_Output(self, other, "DIA_Addon_Henry_Attack_04_00"); //你 自 讨 苦 吃 … …

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_GuardStopsIntruder, 0);
};

// ************************************************************
// *** ***
// 						Ich will ins Lager
// *** ***
// ************************************************************
// ------------------------------------------------------------
var int Henry_Zoll_WhatFor;
// ------------------------------------------------------------
// 		  				Ich will da rein
// ------------------------------------------------------------
instance DIA_Addon_Henry_WantEnter(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 1;
	condition		= DIA_Addon_Henry_WantEnter_Condition;
	information		= DIA_Addon_Henry_WantEnter_Info;
	description		= "我 想 在 那 里 。";
};

func int DIA_Addon_Henry_WantEnter_Condition()
{
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WantEnter_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_WantEnter_15_00"); //我 想 在 那 里 ！
	AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_01"); //真 的 吗 ？ 不 过 那 样 你 要 破 费 了 。

	B_Henry_Gold(500);

	if (Henry_Zoll_WhatFor == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_Henry_WantEnter_15_02"); //呃 ？ 为 了 什 么 ？
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_03"); //不 要 那 么 小 题 大 做 。
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_04"); //在 营 地 这 里 有 很 多 东 西 会 让 你 感 兴 趣 … …
		Henry_Zoll_WhatFor = TRUE;
	};

	var C_Item itm; itm = Npc_GetEquippedArmor(other);

	if ((Hlp_IsItem(itm, ITAR_KDF_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_KDF_H) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_MIL_L) == TRUE)
	|| (Hlp_IsItem(itm, ITAR_MIL_M) == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_07"); //而 你 看 起 来 像 是 一 个 有 钱 人 。
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_08"); //如 此 说 来 ， 一 次 小 捐 助 也 不 会 让 你 死 掉 。
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_09"); //难 道 你 那 漂 亮 的 衣 服 是 偷 的 吗 ？
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_WantEnter_04_10"); //你 已 经 弄 到 钱 了 ， 不 是 吗 ？
	};
};

// ------------------------------------------------------------
// 							500 zahlen!
// ------------------------------------------------------------
func void B_Henry_NoJoin()
{
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_00"); //如 果 你 打 算 加 入 我 们 的 话 ， 那 算 你 运 气 不 好 ！
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_01"); //只 有 船 长 才 能 决 定 谁 可 以 加 入 ， 而 现 在 他 带 着 一 半 人 出 海 寻 找 战 利 品 了 。
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_02"); //但 是 你 可 以 留 下 ， 直 到 他 回 来 。
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_03"); //前 提 是 你 不 要 在 这 里 惹 什 么 麻 烦 ！
};

// ------------------------------------------------------------
instance DIA_Addon_Henry_Einigen2(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 2;
	condition		= DIA_Addon_Henry_Einigen2_Condition;
	information		= DIA_Addon_Henry_Einigen2_Info;
	description		= "这 是 给 你 的 ５ ０ ０ 金 币 。";
};

func int DIA_Addon_Henry_Einigen2_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Henry_WantEnter))
	&& (!Npc_KnowsInfo(other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems(other, ItMi_Gold) >= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen2_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Einigen2_15_00"); //这 是 给 你 的 ５ ０ ０ 金 币 。
	B_GiveInvItems(other, self, ItMi_Gold, 500);
	AI_Output(self, other, "DIA_Addon_Henry_Einigen2_04_01"); //好 吧 。 欢 迎 进 入 我 们 的 营 地 。
	B_Henry_NoJoin();

	self.aivar[AIV_PASSGATE] = TRUE;
};

// ------------------------------------------------------------
// 								Einigen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Einigen(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 3;
	condition		= DIA_Addon_Henry_Einigen_Condition;
	information		= DIA_Addon_Henry_Einigen_Info;
	description		= "我 们 难 道 不 能 设 法 达 成 一 个 协 议 吗 ？";
};

func int DIA_Addon_Henry_Einigen_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Henry_WantEnter)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Einigen_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Einigen_15_00"); //我 们 难 道 不 能 设 法 达 成 一 个 协 议 吗 ？
	AI_Output(self, other, "DIA_Addon_Henry_Einigen_04_01"); //嗯 。 给 我 一 个 合 适 的 理 由 ， 我 可 能 会 给 你 再 便 宜 一 些 。
};

// ------------------------------------------------------------
// 		  			Grund 1 - Fleisch für Morgan
// ------------------------------------------------------------
instance DIA_Addon_Henry_MeatForMorgan(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 4;
	condition		= DIA_Addon_Henry_MeatForMorgan_Condition;
	information		= DIA_Addon_Henry_MeatForMorgan_Info;
	description		= "我 应 该 把 这 块 肉 带 给 摩 根 。";
};

func int DIA_Addon_Henry_MeatForMorgan_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Henry_Einigen))
	&& (MIS_AlligatorJack_BringMeat == LOG_RUNNING)
	&& (Npc_HasItems(other, ItFoMuttonRaw) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_MeatForMorgan_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_MeatForMorgan_15_00"); //我 应 该 把 这 块 肉 带 给 摩 根 。
	AI_Output(self, other, "DIA_Addon_Henry_MeatForMorgan_04_01"); //（ 敷 衍 了 事 ） 啊 。 那 是 谁 派 你 来 的 ？
	AI_Output(other, self, "DIA_Addon_Henry_MeatForMorgan_15_02"); //鳄 鱼 杰 克 。 他 说 摩 根 一 直 在 等 着 它 。
	AI_Output(self, other, "DIA_Addon_Henry_MeatForMorgan_04_03"); //我 明 白 了 。 他 心 情 不 好 ， 是 吗 ？
};

// ------------------------------------------------------------
// 		  			Grund 2 - Holz von Malcom
// ------------------------------------------------------------
instance DIA_Addon_Henry_Malcom(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 5;
	condition		= DIA_Addon_Henry_Malcom_Condition;
	information		= DIA_Addon_Henry_Malcom_Info;
	description		= "玛 尔 寇 派 我 来 的 。";
};

func int DIA_Addon_Henry_Malcom_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Henry_Einigen))
	&& (MalcomBotschaft == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Malcom_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Malcom_15_00"); //玛 尔 寇 派 我 来 的 。 他 说 木 头 还 需 要 等 一 会 。
	AI_Output(self, other, "DIA_Addon_Henry_Malcom_04_01"); //（ 理 解 ） 哦 ， 棒 极 了 。 我 早 就 知 道 了 。 永 远 都 是 那 样 。

	B_MalcomExident();
};

// ------------------------------------------------------------
// 		  			Grund 3 - Paket für Skip
// ------------------------------------------------------------
instance DIA_Addon_Henry_BaltramPack(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 6;
	condition		= DIA_Addon_Henry_BaltramPack_Condition;
	information		= DIA_Addon_Henry_BaltramPack_Info;
	description		= "我 这 里 有 给 斯 奇 普 的 货 物 。 他 在 这 里 吗。";
};

func int DIA_Addon_Henry_BaltramPack_Condition()
{
	if ((self.aivar[AIV_PASSGATE] == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Addon_Henry_Einigen))
	&& (Npc_HasItems(other, ItMi_Packet_Baltram4Skip_Addon)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_BaltramPack_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_BaltramPack_15_00"); //我 这 里 有 给 斯 奇 普 的 货 物 。 他 在 这 里 吗?
	AI_Output(self, other, "DIA_Addon_Henry_BaltramPack_04_01"); //是 的 。 斯 奇 普 在 这 里 。 现 在 呢 ？
};

// ------------------------------------------------------------
// 						ICH WILL JETZT REIN
// ------------------------------------------------------------
var int Henry_Amount;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Tribut(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 7;
	condition		= DIA_Addon_Henry_Tribut_Condition;
	information		= DIA_Addon_Henry_Tribut_Info;
	permanent		= TRUE;
	description		= "让 我 进 去 。";
};

func int DIA_Addon_Henry_Tribut_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Henry_Einigen))
	&& (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Tribut_Info()
{
	Henry_Amount = 500;

	AI_Output(other, self, "DIA_Addon_Henry_Tribut_15_00"); //让 我 进 去 。

	AI_Output(self, other, "DIA_Addon_Henry_Tribut_04_01"); //嗯 … …

	if (Npc_KnowsInfo(other, DIA_Addon_Henry_Malcom))
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_04_02"); //你 给 我 带 来 了 我 们 的 伐 木 工 的 消 息 。
		Henry_Amount = (Henry_Amount - 100);
	};

	if (Npc_KnowsInfo(other, DIA_Addon_Henry_MeatForMorgan))
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_04_03"); //你 要 给 鳄 鱼 杰 克 跑 腿 ， 把 沼 泽 鼠 的 肉 送 给 摩 根 。
		Henry_Amount = (Henry_Amount - 100);
	};

	if (Npc_KnowsInfo(other, DIA_Addon_Henry_BaltramPack))
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_04_04"); //你 有 一 个 要 交 给 斯 奇 普 的 包 裹 。
		Henry_Amount = (Henry_Amount - 100);
	};

	if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	{
		if (Henry_Amount < 500) // schon was anderes gesagt
		{
			AI_Output(self, other, "DIA_Addon_Henry_Tribut_Add_04_00"); //还 有 ， 最 重 要 的 ：
		};

		AI_Output(self, other, "DIA_Addon_Henry_Tribut_Add_04_01"); //你 解 决 了 我 们 后 方 那 座 塔 里 面 的 害 虫 。
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_Add_04_02"); //我 无 法 相 信 你 是 独 自 完 成 所 有 那 些 事 的 ！
		Henry_Amount = (Henry_Amount - 200);
	};

	if (Henry_Amount <= 0)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_Add_04_03"); //告 诉 你 吧 。 你 可 以 免 费 进 入 。

		// patch M.F.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(DIA_Addon_Henry_Tribut);
	}
	else
	{
		B_Henry_Gold(Henry_Amount);

		AI_Output(self, other, "DIA_Addon_Henry_Tribut_04_05"); //… … 或 者 你 消 失 。 就 那 么 简 单 。

		Info_ClearChoices(DIA_Addon_Henry_Tribut);
		Info_AddChoice(DIA_Addon_Henry_Tribut, "我 想 那 太 多 了 。", DIA_Addon_Henry_Tribut_nein);

		if (Npc_HasItems(other, ItMi_Gold) >= Henry_Amount)
		{
			Info_AddChoice(DIA_Addon_Henry_Tribut, "好 。 这 是 你 的 钱 。", DIA_Addon_Henry_Tribut_ja);
		};
	};
};

func void DIA_Addon_Henry_Tribut_ja()
{
	AI_Output(other, self, "DIA_Addon_Henry_Tribut_ja_15_00"); //好 。 这 是 你 的 钱 。
	B_GiveInvItems(other, self, ItMi_Gold, Henry_Amount);
	AI_Output(self, other, "DIA_Addon_Henry_Tribut_ja_04_01"); //谢 谢 。 欢 迎 来 到 我 们 的 营 地 。
	B_Henry_NoJoin();

	Info_ClearChoices(DIA_Addon_Henry_Tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void DIA_Addon_Henry_Tribut_nein()
{
	AI_Output(other, self, "DIA_Addon_Henry_Tribut_nein_15_00"); //我 想 那 太 多 了 。
	if (Henry_Amount < 500)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_nein_04_03"); //来 吧 ， 我 已 经 给 你 打 折 了 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_Tribut_nein_04_04"); //那 么 走 开 。
	};

	Info_ClearChoices(DIA_Addon_Henry_Tribut);
};

// ************************************************************
// *** ***
// 				Palisade - Banditen - Turmbanditen
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 		  				Hallo 2 (Was machst du)
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 11;
	condition		= DIA_Addon_Henry_Palisade_Condition;
	information		= DIA_Addon_Henry_Palisade_Info;
	description		= "你 在 这 里 干 什 么 ？";
};

func int DIA_Addon_Henry_Palisade_Condition()
{
	if (GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Palisade_15_00"); //你 在 这 里 干 什 么 ？
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_04_01"); //它 看 起 来 怎 么 样 ？ 我 必 须 要 确 保 那 些 糟 糕 的 家 伙 及 时 把 栅 栏 修 好 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_04_02"); //如 果 他 们 没 有 的 话 ， 船 长 格 雷 格 一 定 会 把 我 拆 的 七 零 八 落 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_04_03"); //同 时 ， 我 要 确 保 陌 生 人 不 会 象 那 样 在 这 里 游 荡 ！
};

// ------------------------------------------------------------
// 		  				Palisade + Turmbanditen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_WhatFor(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 12;
	condition		= DIA_Addon_Henry_Palisade_WhatFor_Condition;
	information		= DIA_Addon_Henry_Palisade_WhatFor_Info;
	description		= "你 们 为 什 么 要 在 这 里 修 建 栅 栏 ？";
};

func int DIA_Addon_Henry_Palisade_WhatFor_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Henry_Palisade))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_WhatFor_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Palisade_WhatFor_15_00"); //你 们 为 什 么 要 在 这 里 修 建 栅 栏 ？
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_WhatFor_04_10"); //嗯 ， 我 们 不 会 让 强 盗 感 到 轻 松 的 ！
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_WhatFor_04_02"); //那 些 混 蛋 始 终 都 是 厚 颜 无 耻 。 他 们 最 近 一 直 在 我 们 的 营 地 附 近 偷 偷 摸 摸 。 就 像 等 着 船 只 失 事 的 鲨 鱼 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_WhatFor_04_11"); //那 些 废 物 有 一 些 藏 在 南 边 不 远 的 塔 里 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_WhatFor_04_12"); //不 过 那 只 是 先 头 部 队 ， 我 肯 定 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_WhatFor_04_03"); //如 果 他 们 真 的 愚 蠢 到 想 要 发 起 攻 击 ， 我 们 就 会 给 他 们 一 次 永 远 忘 不 了 的 欢 迎 盛 会 。

	Log_CreateTopic(TOPIC_Addon_BanditsTower, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BanditsTower, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_1);
};

// ------------------------------------------------------------
// 		  				Turmbanditen Report
// ------------------------------------------------------------
func void B_Henry_WhereIsTower()
{
	AI_Output(other, self, "DIA_Addon_Francis_BanditsDead_15_08"); //那 座 塔 准 确 的 位 置 在 哪 里 。
	AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_07"); //从 这 里 出 发 ， 一 直 向 右 走 。
	AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_08"); //你 可 以 在 那 里 的 一 个 小 悬 崖 上 发 现 那 座 塔 。
};

// ------------------------------------------------------------
instance DIA_Addon_Henry_Turmbanditen(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 13;
	condition		= DIA_Addon_Henry_Turmbanditen_WhatFor_Condition;
	information		= DIA_Addon_Henry_Turmbanditen_WhatFor_Info;
	permanent		= TRUE;
	description		= "关 于 那 些 塔 里 的 强 盗 … …";
};

func int DIA_Addon_Henry_Turmbanditen_WhatFor_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Henry_Palisade_WhatFor))
	&& (MIS_Henry_FreeBDTTower != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Turmbanditen_WhatFor_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Turmbanditen_15_00"); //关 于 那 些 塔 里 的 强 盗 … …

	if (C_TowerBanditsDead() == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_01"); //嗯 ？
		AI_Output(other, self, "DIA_Addon_Francis_BanditsDead_15_01"); //他 们 已 经 是 历 史 了 。
		if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
		{
			AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_02"); //好 极 了 ！ 那 么 又 少 了 一 个 难 题 。
		}
		else // auf eigene Faust
		{
			AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_03"); //你 是 一 个 人 做 到 的 吗 ？ 值 得 尊 敬 ！
			AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_04"); //也 许 某 一 天 你 能 成 为 一 个 真 正 的 海 盗 ！
		};

		// -----------------------------------------
		SawPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(SawPirate, "START");
		HammerPirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(HammerPirate, "START");
		// -----------------------------------------
		MIS_Henry_FreeBDTTower = LOG_SUCCESS;

		B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_2);

		B_GivePlayerXP(XP_Addon_Henry_FreeBDTTower);
	}
	else if (MIS_Henry_FreeBDTTower == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_07"); //你 还 想 要 什 么 ？
		B_Henry_WhereIsTower();
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_05"); //如 果 你 打 算 一 个 人 解 决 他 们 ， 算 了 吧 ！
		AI_Output(self, other, "DIA_Addon_Henry_Turmbanditen_04_06"); //我 将 很 快 从 我 的 袭 击 部 队 中 派 两 个 人 来 。 让 他 们 处 理 强 盗 问 题 。
		Knows_HenrysEntertrupp = TRUE;
	};
};

// ------------------------------------------------------------
// 		  			Warum Krieg mit Banditen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_Bandits(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 14;
	condition		= DIA_Addon_Henry_Palisade_Bandits_Condition;
	information		= DIA_Addon_Henry_Palisade_Bandits_Info;
	description		= "为 什 么 强 盗 们 不 攻 击 你 ？";
};

func int DIA_Addon_Henry_Palisade_Bandits_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Henry_Palisade_WhatFor))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Bandits_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Palisade_Bandits_15_00"); //为 什 么 强 盗 们 不 攻 击 你 ？
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_04"); //因 为 他 们 和 我 们 正 在 打 仗 ！ 你 怎 么 想 ？
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_05"); //最 初 一 切 事 情 都 很 好 。 我 们 带 他 们 来 这 里 ， 他 们 立 刻 进 入 沼 泽 并 把 我 们 留 在 这 里 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_06"); //但 是 现 在 ， 那 些 混 蛋 攻 击 任 何 不 是 他 们 一 伙 的 人 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_07"); //天 知 道 他 们 出 了 什 么 事 !
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_08"); //我 估 计 他 们 可 能 会 跟 着 我 们 的 船 。 毕 竟 没 有 其 它 的 路 离 开 这 里 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_09"); //你 应 该 去 问 问 斯 奇 普 这 方 面 的 事 。 他 曾 经 与 他 们 一 起 - 而 且 差 点 没 能 保 住 性 命。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_10"); //他 能 告 诉 你 一 些 相 当 有 趣 的 故 事 。
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Palisade_Bandits_04_11"); //（ 有 点 恶 意 的 ） 不 过 你 没 法 听 到 真 是 太 糟 糕 了 。 毕 竟 你 还 没 有 支 付 你 的 通 行 费 。
		Henry_Zoll_WhatFor = TRUE;
	};
};

// ************************************************************
// *** ***
// 							Entertrupp
// *** ***
// ************************************************************
// ------------------------------------------------------------
// 		  		Ich will in deinen Entertrupp
// ------------------------------------------------------------
var int Henry_EnterCrewMember;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Entercrew(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 31;
	condition		= DIA_Addon_Henry_Entercrew_Condition;
	information		= DIA_Addon_Henry_Entercrew_Info;
	permanent		= TRUE;
	description		= "我 要 加 入 你 的 袭 击 部 队 。";
};

func int DIA_Addon_Henry_Entercrew_Condition()
{
	if ((Knows_HenrysEntertrupp == TRUE)
	&& (Henry_EnterCrewMember == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Entercrew_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Entercrew_15_00"); //我 要 加 入 你 的 袭 击 部 队 。

	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_00"); //（ 大 笑 ） 你 不 可 能 那 么 简 单 从 我 这 里 过 去 的 ， 小 子 ！
		AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_01"); //首 先 我 们 谈 谈 是 你 否 能 进 入 营 地 ！
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_Entercrew_04_06"); //嗯 ， 那 么 欢 迎 加 入 我 的 袭 击 部 队 ！
		AI_Output(self, other, "DIA_Addon_Henry_Entercrew_04_07"); //又 多 了 一 个 保 护 我 们 的 后 方 不 受 强 盗 困 扰 的 战 士 。
		if (MIS_Henry_FreeBDTTower == LOG_SUCCESS)
		{
			AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_02"); //嗯 ， 我 本 来 应 该 说 的 是 ， 从 那 些 小 伙 子 里 挑 一 个 人 ， 然 后 把 塔 里 的 那 些 混 蛋 干 掉 。
			AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_03"); //但 是 你 已 经 完 成 了 。
		}
		else
		{
			if ((Npc_IsDead(SawPirate))
			&& (Npc_IsDead(HammerPirate)))
			{
				AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_04"); //嗯 ， 我 的 人 都 死 了 。 所 以 最 后 ， 你 必 须 一 个 人 去 做 。
				AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_05"); //帮 我 们 干 掉 塔 里 的 那 些 强 盗 ！

				B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_3);
			}
			else
			{
				AI_Output(self, other, "DIA_Addon_Henry_Entercrew_Add_04_06"); //从 那 些 小 伙 子 里 面 挑 出 一 个 ， 然 后 快 点 把 塔 里 的 那 些 强 盗 解 决 掉 。
				Henry_GetPartyMember = TRUE;

				B_LogEntry(TOPIC_Addon_BanditsTower, TOPIC_Addon_BanditsTower_4);
			};

			B_Henry_WhereIsTower();

			AI_Output(other, self, "DIA_Addon_Henry_Entercrew_15_09"); //是 的 ， 长 官 ！

			MIS_Henry_FreeBDTTower = LOG_RUNNING;
		};

		Henry_EnterCrewMember = TRUE;
	};
};

// ------------------------------------------------------------
// 						Dann geh zu Owen
// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 32;
	condition		= DIA_Addon_Henry_Owen_Condition;
	information		= DIA_Addon_Henry_Owen_Info;
	description		= "还 有 什 么 事 要 我 做 吗 ？";
};

func int DIA_Addon_Henry_Owen_Condition()
{
	if ((MIS_Henry_FreeBDTTower == LOG_SUCCESS)
	&& (Henry_EnterCrewMember == TRUE)
	&& (!Npc_IsDead(Malcom)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Owen_15_01"); //还 有 什 么 事 要 我 做 吗 ？
	AI_Output(self, other, "DIA_Addon_Henry_Owen_04_01"); //我 们 为 了 修 栅 栏 ， 已 经 等 了 好 几 天 木 头 了 。
	AI_Output(self, other, "DIA_Addon_Henry_Owen_04_05"); //玛 尔 寇 和 欧 文 早 就 应 该 回 来 了 。
	if (!Npc_KnowsInfo(other, DIA_Addon_Henry_Malcom))
	{
		AI_Output(self, other, "DIA_Addon_Henry_Owen_04_06"); //他 们 的 伐 木 营 地 离 这 里 不 远 ， 在 东 南 的 洞 窟 附 近 。
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_Owen_04_07"); //玛 尔 寇 说 需 要 一 段 时 间 - 而 不 是 半 辈 子 ！
	};

	AI_Output(self, other, "DIA_Addon_Henry_Owen_04_08"); //告 诉 他 们 ， 我 们 正 在 等 木 头 ！
	AI_Output(self, other, "DIA_Addon_Henry_Owen_04_09"); //不 ， 等 等 ！ 告 诉 欧 文 。 玛 尔 寇 靠 不 住 ！

	B_MalcomExident();

	MIS_Henry_HolOwen = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Addon_HolOwen, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HolOwen, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_HolOwen, TOPIC_Addon_HolOwen_1);
};

// ------------------------------------------------------------
// 						Owen2 Report
// ------------------------------------------------------------
func void B_Addon_Henry_MalcomsDead()
{
	AI_Output(self, other, "DIA_Addon_Henry_Owen2_Add_04_00"); //玛 尔 寇 怎 么 样 了 ？
	AI_Output(other, self, "DIA_Addon_Henry_Owen2_Add_15_01"); //他 已 经 死 了 。
	AI_Output(self, other, "DIA_Addon_Henry_Owen2_Add_04_02"); //嗯 ， 那 么 看 来 他 的 运 气 到 头 了 。？
};

// ------------------------------------------------------------
instance DIA_Addon_Henry_Owen2(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 33;
	condition		= DIA_Addon_Henry_Owen2_Condition;
	information		= DIA_Addon_Henry_Owen2_Info;
	permanent		= TRUE;
	description		= "关 于 那 个 伐 木 者 ， 欧 文 … …";
};

func int DIA_Addon_Henry_Owen2_Condition()
{
	if (MIS_Henry_HolOwen == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Owen2_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Owen2_15_00"); //关 于 那 个 伐 木 者 ， 欧 文 … …

	if ((Npc_IsDead(PIR_1367_Addon_Owen)) == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Henry_Owen2_15_01"); //他 已 经 死 了 。
		AI_Output(self, other, "DIA_Addon_Henry_Owen2_04_02"); //该 死 ！ 那 么 我 想 我 必 须 要 派 个 新 人 了 。
		AI_Output(self, other, "DIA_Addon_Henry_Owen2_04_03"); //（ 抱 怨 ） 摩 根 早 就 该 把 附 近 的 那 些 野 兽 除 掉 。
		B_Addon_Henry_MalcomsDead();
		// AI_Output(self, other, "DIA_Addon_Henry_Owen2_Add_04_01"); // Was? Er auch? Verdammte Mistviecher!
		MIS_Henry_HolOwen = LOG_OBSOLETE;

		B_LogEntry(TOPIC_Addon_HolOwen, TOPIC_Addon_HolOwen_2);
		Log_SetTopicStatus(TOPIC_Addon_HolOwen, LOG_OBSOLETE);
	}
	else if (Owen_ComesToHenry == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Henry_Owen2_15_03"); //欧 文 将 会 给 你 送 来 木 头 。
		AI_Output(self, other, "DIA_Addon_Henry_Owen2_04_04"); //非 常 好 ， 正 是 时 候 。
		B_Addon_Henry_MalcomsDead();
		AI_Output(self, other, "DIA_Addon_Henry_Owen2_04_05"); //这 是 你 的 报 酬 。
		B_GiveInvItems(self, other, ItMi_Gold, 200);
		B_StartOtherRoutine(PIR_1367_Addon_Owen, "PostStart");

		B_LogEntry(TOPIC_Addon_HolOwen, TOPIC_Addon_HolOwen_3);

		MIS_Henry_HolOwen = LOG_SUCCESS;

		B_GivePlayerXP(XP_Addon_Owen_ComesToHenry);
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_Henry_Owen2_15_06"); //再 说 一 下 他 的 营 地 在 哪 里 ？
		AI_Output(self, other, "DIA_Addon_Henry_Owen2_04_07"); //离 这 里 不 远 ， 向 东 南 方 走 ， 在 洞 窟 旁 。
	};
};

// ************************************************************
// 		  						PERM
// ************************************************************
var int Henry_PERM_Once;
// ------------------------------------------------------------
instance DIA_Addon_Henry_Palisade_CanHelp(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 34;
	condition		= DIA_Addon_Henry_Palisade_CanHelp_Condition;
	information		= DIA_Addon_Henry_Palisade_CanHelp_Info;
	permanent		= TRUE;
	description		= "你 需 要 帮 助 吗 ？";
};

func int DIA_Addon_Henry_Palisade_CanHelp_Condition()
{
	if ((MIS_Henry_HolOwen == LOG_SUCCESS)
	|| (MIS_Henry_HolOwen == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_CanHelp_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Palisade_CanHelp_15_00"); //你 需 要 帮 助 吗 ？
	if (Henry_PERM_Once == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Palisade_CanHelp_04_01"); //你 知 道 关 于 修 建 栅 栏 的 事 情 吗 ？
		AI_Output(other, self, "DIA_Addon_Henry_Palisade_CanHelp_15_02"); //不 ， 不 太 会 。
		AI_Output(self, other, "DIA_Addon_Henry_Palisade_CanHelp_04_03"); //那 么 我 这 里 不 需 要 你 。 去 帮 助 其 它 人 吧 。
		Henry_PERM_Once = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Henry_Palisade_CanHelp_04_04"); //是 不 是 喝 得 酩 酊 大 醉 与 我 无 关 ， 但 是 不 要 挡 住 我 的 工 人 的 路 。
};

// ************************************************************
// 							Teach 2h
// ************************************************************
// ------------------------------------------------------------
// 		  					Wanna Learn
// ------------------------------------------------------------
instance DIA_Addon_Henry_WhatTeach(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 21;
	condition		= DIA_Addon_Henry_WhatTeach_Condition;
	information		= DIA_Addon_Henry_WhatTeach_Info;
	permanent		= TRUE;
	description		= "你 能 教 我 如 何 成 为 更 强 的 战 士 吗 ？";
};

func int DIA_Addon_Henry_WhatTeach_Condition()
{
	if ((Knows_HenrysEntertrupp == TRUE)
	&& (Henry_Addon_TeachPlayer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_WhatTeach_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_WhatTeach_Add_15_00"); //你 能 教 我 如 何 成 为 更 强 的 战 士 吗 ？
	if (self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Henry_WhatTeach_Add_04_01"); //（ 大 笑 ） 首 先 ， 交 费 。 然 后 ， 我 才 能 和 你 谈 论 关 于 战 斗 的 事 ！
		AI_Output(self, other, "DIA_Addon_Henry_WhatTeach_Add_04_02"); //（ 狡 诈 的 ） 价 格 里 面 包 含 了 所 有 费 用 。
		Henry_Zoll_WhatFor = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Henry_WhatTeach_Add_04_03"); //当 然 ， 为 什 么 不 呢 ？
		Henry_Addon_TeachPlayer = TRUE;

		Log_CreateTopic(Topic_Addon_PIR_Teacher, LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher, Log_Text_Addon_HenryTeach);
	};
};

// ------------------------------------------------------------
// 		  					Teach 2h
// ------------------------------------------------------------
var int Henry_merke2h;
var int Henry_Labercount;
// ------------------------------------------------------------
func void B_Henry_CommentFightSkill()
{
	if (Henry_Labercount == 0)
	{
		AI_Output(self, other, "DIA_Addon_Henry_CommentFightSkill_04_01"); //你 学 得 很 快 ， 也 许 某 天 你 能 成 为 一 个 真 正 的 海 盗
		Henry_Labercount = 1;
	}
	else if (Henry_Labercount == 1)
	{
		AI_Output(self, other, "DIA_Addon_Henry_CommentFightSkill_04_02"); //如 果 你 继 续 那 样 的 话 ， 很 快 就 能 独 立 上 船 了 。
		Henry_Labercount = 2;
	}
	else if (Henry_Labercount == 2)
	{
		AI_Output(self, other, "DIA_Addon_Henry_CommentFightSkill_04_03"); //永 远 记 住 - 会 格 挡 的 人 活 得 更 久 ！
		Henry_Labercount = 0;
	};
};

// ------------------------------------------------------------
instance DIA_Addon_Henry_Teach(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 6;
	condition		= DIA_Addon_Henry_Teach_Condition;
	information		= DIA_Addon_Henry_Teach_Info;
	permanent		= TRUE;
	description		= "教 给 我 ！";
};

func int DIA_Addon_Henry_Teach_Condition()
{
	if (Henry_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Teach_15_00"); //教 给 我 ！

	Henry_merke2h = other.HitChance[NPC_TALENT_2H];

	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach, DIALOG_BACK, DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1) * 5), DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_Back()
{
	if (other.HitChance[NPC_TALENT_2H] > Henry_Merke2h)
	{
		B_Henry_CommentFightSkill();
	}
	else if (other.HitChance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self, other, "DIA_Addon_Henry_Teach_Back_04_00"); //你 更 加 出 色 了 。
	};

	Info_ClearChoices(DIA_Addon_henry_Teach);
};

func void DIA_Addon_Henry_Teach_CB_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 1, 75);

	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach, DIALOG_BACK, DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1) * 5), DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_CB_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_CROSSBOW, 5, 75);

	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach, DIALOG_BACK, DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1) * 5), DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_1()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 1, 90);

	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach, DIALOG_BACK, DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1) * 5), DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Addon_Henry_Teach_CB_5);
};

func void DIA_Addon_Henry_Teach_2H_5()
{
	B_TeachFightTalentPercent(self, other, NPC_TALENT_2H, 5, 90);

	Info_ClearChoices(DIA_Addon_Henry_Teach);
	Info_AddChoice(DIA_Addon_Henry_Teach, DIALOG_BACK, DIA_Addon_Henry_Teach_Back);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1)), DIA_Addon_Henry_Teach_2H_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1) * 5), DIA_Addon_Henry_Teach_2H_5);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow1, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 1)), DIA_Addon_Henry_Teach_CB_1);
	Info_AddChoice(DIA_Addon_Henry_Teach, B_BuildLearnString(PRINT_LearnCrossBow5, B_GetLearnCostTalent(other, NPC_TALENT_CROSSBOW, 5)), DIA_Addon_Henry_Teach_CB_5);
};

// ************************************************************
// 		  						Greg
// ************************************************************
instance DIA_Addon_Henry_Palisade_Train(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 11;
	condition		= DIA_Addon_Henry_Palisade_Train_Condition;
	information		= DIA_Addon_Henry_Palisade_Train_Info;
	description		= "格 雷 格 是 你 的 老 板 ？";
};

func int DIA_Addon_Henry_Palisade_Train_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Addon_Henry_Palisade))
	&& (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_Palisade_Train_Info()
{
	AI_Output(other, self, "DIA_Addon_Henry_Palisade_Train_15_00"); //格 雷 格 是 你 的 老 板 ？
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_01"); //他 当 然 是 。 而 且 它 是 格 雷 格 船 长 给 你 的 。 我 说 的 够 清 楚 吗。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_02"); //他 是 一 个 伟 大 的 人 。 如 果 你 遇 到 他 ， 要 小 心 不 要 站 在 错 误 的 一 边 。 否 则 你 绝 对 活 不 到 后 悔 的 那 一 刻 。

	if (PIR_1300_Addon_Greg_NW.aivar[AIV_TalkedToPlayer] == TRUE)
	{
		AI_Output(other, self, "DIA_Addon_Henry_Palisade_Train_15_03"); //我 已 经 遇 到 他 了 。
		AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_04"); //更 好 了 。 那 么 你 知 道 我 说 的 是 什 么 意 思 了 。
	};

	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_05"); //不 过 他 现 在 不 在 营 地 里 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_06"); //现 在 由 弗 朗 西 斯 指 挥 。
	AI_Output(self, other, "DIA_Addon_Henry_Palisade_Train_04_07"); //他 整 天 都 坐 在 格 雷 格 的 小 屋 前 面 ， 瞪 眼 看 着 我 们 工 作 。
};

// ************************************************************
// 		  				Dein eigener Entertrupp
// ************************************************************
instance DIA_Addon_Henry_YourOwnTrupp(C_INFO)
{
	npc				= PIR_1354_Addon_Henry;
	nr				= 1;
	condition		= DIA_Addon_Henry_YourOwnTrupp_Condition;
	information		= DIA_Addon_Henry_YourOwnTrupp_Info;
	important		= TRUE;
};

func int DIA_Addon_Henry_YourOwnTrupp_Condition()
{
	if (MIS_Addon_Greg_ClearCanyon == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Henry_YourOwnTrupp_Info()
{
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_04"); //船 长 给 了 你 自 己 的 袭 击 部 队 ， 对 吗 ？
	AI_Output(self, other, "DIA_Addon_Henry_Add_04_05"); //那 么 要 保 证 你 的 小 伙 子 们 做 大 量 的 工 作 ！
	AI_StopProcessInfos(self);
};

/*
AI_Output(other, self, "DIA_Addon_Henry_HenrysCrew_15_00"); //Wer gehört zu deinem Trupp?
AI_Output(other, self, "DIA_Addon_Henry_Morgan_15_00"); //Wo finde ich Morgan?
*/
