///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_EXIT(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 999;
	condition		= DIA_Borka_EXIT_Condition;
	information		= DIA_Borka_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Borka_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Borka_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Borka_PICKPOCKET(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 900;
	condition		= DIA_Borka_PICKPOCKET_Condition;
	information		= DIA_Borka_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Borka_PICKPOCKET_Condition()
{
	C_Beklauen(80, 120);
};

func void DIA_Borka_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
	Info_AddChoice(DIA_Borka_PICKPOCKET, DIALOG_BACK, DIA_Borka_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Borka_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Borka_PICKPOCKET_DoIt);
};

func void DIA_Borka_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};

func void DIA_Borka_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Borka_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info PISSOF
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_PISSOFF(C_INFO)
{
	npc				= VLK_434_Borka;
	condition		= DIA_Borka_PISSOFF_Condition;
	information		= DIA_Borka_PISSOFF_Info;
	important		= TRUE;
};

func int DIA_Borka_PISSOFF_Condition()
{
	if ((Knows_Borka_Dealer != TRUE)
	&& (Npc_GetDistToNpc(self, other) <= ZivilAnquatschDist))
	{
		return TRUE;
	};
};

func void DIA_Borka_PISSOFF_Info()
{
	AI_Output(self, other, "DIA_Borka_PISSOFF_11_00"); //嘿 ， 你 ！ 你 准 备 去 哪 里 ？ 不 管 你 计 划 干 什 么 - 以 后 还 有 很 多 时 间 。
	AI_Output(self, other, "DIA_Borka_PISSOFF_11_01"); //你 正 在 克 霍 里 尼 斯 之 珠 - 红 灯 笼 的 前 面 。 这 是 米 尔 塔 纳 王 国 中 最 漂 亮 的 妓 院 ， 真 的 ！
	AI_Output(self, other, "DIA_Borka_PISSOFF_11_02"); //从 世 界 最 偏 远 的 地 方 来 的 水 手 们 停 靠 在 这 里 就 是 为 了 能 在 红 灯 笼 这 里 度 过 几 个 夜 晚 。
	AI_Output(self, other, "DIA_Borka_PISSOFF_11_03"); //而 现 在 你 正 拥 有 这 个 机 会 - 不 ， 这 份 荣 耀 - 来 跟 纳 德 加 - 上 天 赐 予 的 最 热 情 的 花 朵 共 度 一 个 夜 晚 ！
	AI_Output(self, other, "DIA_Borka_PISSOFF_11_04"); //进 来 吧 ， 你 将 会 拥 有 一 次 别 人 连 做 梦 都 不 会 梦 到 的 愉 快 经 历 ！

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info TROUBLE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_TROUBLE(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 3;
	condition		= DIA_Borka_TROUBLE_Condition;
	information		= DIA_Borka_TROUBLE_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Borka_TROUBLE_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_Andre_REDLIGHT != LOG_RUNNING)
	&& (Npc_IsDead(Nadja) == FALSE)
	&& (Npc_GetDistToWP(self, "NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Borka_TROUBLE_Info()
{
	AI_Output(self, other, "DIA_Borka_TROUBLE_11_00"); //你 站 在 那 外 面 干 什 么 ？ 进 来 见 见 我 们 热 情 奔 放 的 纳 德 加 吧 。
	AI_Output(self, other, "DIA_Borka_TROUBLE_11_01"); //这 个 属 于 夜 晚 的 热 辣 的 女 人 将 会 给 你 的 生 命 一 个 全 新 的 意 义 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Smoke
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_Smoke(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 3;
	condition		= DIA_Borka_Smoke_Condition;
	information		= DIA_Borka_Smoke_Info;
	permanent		= TRUE;
	description		= "你 知 道 我 在 哪 里 能 买 到 烟 草 吗 ？";
};

func int DIA_Borka_Smoke_Condition()
{
	if ((MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Knows_Borka_Dealer == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_Smoke_Info()
{
	AI_Output(other, self, "DIA_Borka_Smoke_15_00"); //你 知 道 我 可 以 去 哪 里 买 些 烟 草 吗 ？
	AI_Output(self, other, "DIA_Borka_Smoke_11_01"); //不 ， 滚 蛋 ！
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info BUYHERB
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_BUYHERB(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 2;
	condition		= DIA_Borka_BUYHERB_Condition;
	information		= DIA_Borka_BUYHERB_Info;
	permanent		= TRUE;
	description		= "我 听 说 你 在 卖 烟 草 。";
};

func int DIA_Borka_BUYHERB_Condition()
{
	if ((Knows_Borka_Dealer == TRUE)
	&& (MIS_Andre_REDLIGHT == LOG_RUNNING)
	&& (Borka_Deal == FALSE)
	&& (Undercover_Failed == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_BUYHERB_Info()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	AI_Output(other, self, "DIA_Borka_BUYHERB_15_00"); //我 听 说 你 在 卖 烟 草 。

	if (Hlp_IsItem(heroArmor, ItAR_MIl_L) == TRUE)
	{
		AI_Output(self, other, "DIA_Borka_BUYHERB_11_01"); //对 不 起 ， 城 市 卫 兵 先 生 ， 阁 下 。 一 定 出 了 什 么 错 。 我 不 知 道 任 何 关 于 烟 草 的 事 情 。
	}
	else
	{
		AI_Output(self, other, "DIA_Borka_BUYHERB_11_02"); //说 谁 ？

		Info_ClearChoices(DIA_Borka_BUYHERB);
		Info_AddChoice(DIA_Borka_BUYHERB, "那 不 重 要 。", DIA_Borka_BUYHERB_Egal);
		Info_AddChoice(DIA_Borka_BUYHERB, "纳 德 加 说 的 。", DIA_Borka_BUYHERB_Nadja);
	};
};

func void DIA_Borka_BUYHERB_Egal()
{
	AI_Output(other, self, "DIA_Borka_BUYHERB_Egal_15_00"); //那 不 是 重 点 。
	AI_Output(self, other, "DIA_Borka_BUYHERB_Egal_11_01"); //我 只 想 知 道 谁 让 你 来 的 ， 以 便 确 定 你 没 有 问 题 。

	Info_ClearChoices(DIA_Borka_BUYHERB);
	Info_AddChoice(DIA_Borka_BUYHERB, "纳 德 加 说 的 。", DIA_Borka_BUYHERB_Nadja);
	Info_AddChoice(DIA_Borka_BUYHERB, "那 你 愿 意 优 惠 一 点 吗 ， 还 是 不 愿 意 ？", DIA_Borka_BUYHERB_Deal);
};

func void DIA_Borka_BUYHERB_NADJA()
{
	AI_Output(other, self, "DIA_Borka_BUYHERB_NADJA_15_00"); //纳 德 加 说 的 。
	AI_Output(self, other, "DIA_Borka_BUYHERB_NADJA_11_01"); //你 知 道 吗 ？女 人 的 话 可 不 能 轻 易 的 相 信。 你 瞧 ， 你 不 该 相 信 这 个 女 孩 告 诉 你 的 任 何 事 情 。

	Nadja_Victim = TRUE;
	Undercover_Failed = TRUE;
	Info_ClearChoices(DIA_Borka_BUYHERB);
};

func void DIA_Borka_BUYHERB_Deal()
{
	AI_Output(other, self, "DIA_Borka_BUYHERB_Deal_15_00"); //那 你 愿 意 优 惠 一 点 吗 ， 还 是 不 愿 意 ？
	AI_PlayAni(self, "T_SEARCH");
	AI_Output(self, other, "DIA_Borka_BUYHERB_Deal_11_01"); //… … 好 吧 … … 我 们 来 做 一 笔 交 易 吧 。 你 给 我 5 0个 金 币 ， 然 后 你 就 能 拿 到 你 的 烟 草 。 不 要 讨 价 还 价 。
	Info_ClearChoices(DIA_Borka_BUYHERB);
	Borka_Deal = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info SECOND_CHANCE
///////////////////////////////////////////////////////////////////////
instance DIA_Borka_SECOND_CHANCE(C_INFO)
{
	npc				= VLK_434_Borka;
	nr				= 2;
	condition		= DIA_Borka_SECOND_CHANCE_Condition;
	information		= DIA_Borka_SECOND_CHANCE_Info;
	permanent		= TRUE;
	description		= "我 们 成 交 （ 付 ５ ０ 金 币 ）";
};

func int DIA_Borka_SECOND_CHANCE_Condition()
{
	var C_ITEM heroArmor; heroArmor = Npc_GetEquippedArmor(other);

	if ((Borka_Deal == TRUE)
	&& (Npc_HasItems(other, ItmI_Gold) >= 50)
	&& (Hlp_IsItem(heroArmor, ItAR_MIl_L) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Borka_SECOND_CHANCE_Info()
{
	AI_Output(other, self, "DIA_Borka_SECOND_CHANCE_15_00"); //我 们 做 笔 买 卖 吧 。 钱 在 这 里 。
	B_GiveInvItems(hero, self, ItMi_Gold, 50);
	AI_Output(self, other, "DIA_Borka_SECOND_CHANCE_11_01"); //好 吧 …
	AI_PlayAni(self, "T_SEARCH");
	AI_Output(self, other, "DIA_Borka_SECOND_CHANCE_11_02"); //… … 这 是 一 根 新 鲜 、 树 脂 状 的 烟 草 。
	B_GiveInvItems(self, hero, ItMi_Joint, 1);
	Borka_Deal = 2;
	AI_StopProcessInfos(self);
};
