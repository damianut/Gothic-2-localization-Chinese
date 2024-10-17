// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Swamp_Exit(C_INFO)
{
	nr				= 999;
	condition		= DIA_Dragon_Swamp_Exit_Condition;
	information		= DIA_Dragon_Swamp_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Swamp_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);

	AI_Output(self, other, "DIA_Dragon_Swamp_Exit_20_00"); //‘ 眼 睛 ’ 的 力 量 已 经 耗 尽 了 。 你 的 生 命 将 在 这 里 终 结 ， 人 类 。

	Swampdragon = Hlp_GetNpc(dragon_swamp);

	Swampdragon.flags = 0;

	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;

	if (DJG_SwampParty_GoGoGo == TRUE)
	{
		if ((DJG_SwampParty == TRUE)
		&& (Npc_IsDead(DJG_Cipher) == FALSE))
		{
			B_StartOtherRoutine(DJG_Rod, "SwampDragon");
		};

		B_StartOtherRoutine(DJG_Cipher, "SwampDragon");
	};

	if (DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff, "Follow");
		DJG_Biff_Stay = FALSE;
	};
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Swamp_Hello(C_INFO)
{
	nr				= 5;
	condition		= DIA_Dragon_Swamp_Hello_Condition;
	information		= DIA_Dragon_Swamp_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Swamp_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return 1;
	};
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Swamp_Hello_20_00"); //如 果 你 再 靠 近 一 步 ， 痛 苦 将 缠 绕 着 你 ！

	if (Mis_KilledDragons == 0)
	{
		AI_Output(other, self, "DIA_Dragon_Swamp_Hello_15_01"); //啊 。 英 诺 斯 之 眼 看 来 起 作 用 了 。
	};

	AI_Output(self, other, "DIA_Dragon_Swamp_Hello_20_02"); //象 你 这 样 的 东 西 来 过 很 多 。 我 已 经 把 他 们 一 扫 而 空 。
	AI_Output(other, self, "DIA_Dragon_Swamp_Hello_15_03"); //省 省 吧 。 你 的 大 话 吓 不 到 我 ， 你 这 散 发 着 臭 气 的 地 狱 的 产 物 。
	AI_Output(other, self, "DIA_Dragon_Swamp_Hello_15_04"); //把 我 想 要 知 道 的 一 切 都 告 诉 我 ， 否 则 我 就 让 你 在 你 自 己 的 血 泊 中 淹 死 。
	AI_Output(self, other, "DIA_Dragon_Swamp_Hello_20_05"); //哈 哈 哈 。 你 胆 敢 威 胁 我 ， 小 虫 子 ？ 说 个 理 由 ， 让 我 不 会 马 上 把 你 撕 裂 成 碎 片 。
	AI_Output(other, self, "DIA_Dragon_Swamp_Hello_15_06"); //我 是 英 诺 斯 的 使 节 ， 而 且 我 还 带 着 神 圣 的 ‘ 眼 睛 ’ 。 你 别 无 选 择 。 你 必 须 屈 从 于 我 的 意 志 ， 否 则 你 将 被 毁 灭 。
	AI_Output(self, other, "DIA_Dragon_Swamp_Hello_20_07"); //（ 呼 气 ） 啊 。 说 你 想 要 我 做 什 么 。
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WERBISTDU(C_INFO)
{
	nr				= 6;
	condition		= DIA_Dragon_Swamp_WERBISTDU_Condition;
	information		= DIA_Dragon_Swamp_WERBISTDU_Info;
	description		= "你 是 谁 ？";
};

func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other, self, "DIA_Dragon_Swamp_WERBISTDU_15_00"); //你 是 谁 ？
	AI_Output(self, other, "DIA_Dragon_Swamp_WERBISTDU_20_01"); //我 叫 潘 德 罗 多 尔 。 而 且 我 建 议 你 从 你 爬 过 来 的 岩 石 下 面 爬 回 去 。
};

///////////////////////////////////////////////////////////////////////
//	Info WoSindDieAnderen
///////////////////////////////////////////////////////////////////////
instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_INFO)
{
	nr				= 7;
	condition		= DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information		= DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description		= "我 叫 潘 德 罗 多 尔 .而 且 我 建 议 你 从 你 爬 过 来 的 岩 石 下 面 爬 回 去 。？";
};

func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other, self, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00"); //我 在 哪 里 能 找 到 你 们 其 余 那 些 可 恶 的 生 物 ？
	AI_Output(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01"); //构 成 一 切 事 务 的 元 素 ， 将 这 个 世 界 维 系 在 一 起 。
	AI_Output(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02"); //每 一 种 都 可 以 控 制 这 个 世 界 的 某 一 部 分 。
	AI_Output(self, other, "DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03"); //搜 索 这 些 元 素 ， 你 将 会 发 现 其 它 的 。
};

//**********************************************************************************
//		B_AssignDragonTalk_Swamp
//**********************************************************************************

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);

	// Die Drachenfragen
	B_AssignDragonTalk_Main(slf);
};
