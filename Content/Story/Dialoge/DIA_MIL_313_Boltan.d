// ************************************************
// 						EXIT
// ************************************************
instance DIA_Boltan_EXIT(C_INFO)
{
	npc				= Mil_313_Boltan;
	nr				= 999;
	condition		= DIA_Boltan_EXIT_Condition;
	information		= DIA_Boltan_EXIT_Info;
	permanent		= TRUE;
	description		= "我 刚 要 走 。( 结 束 )";
};

func int DIA_Boltan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Boltan_EXIT_Info()
{
	// AI_Output(other, self, "DIA_Boltan_Add_15_15"); // Ich wollte gerade wieder gehen.
	AI_StopProcessInfos(self);
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_HALLO(C_INFO)
{
	npc				= Mil_313_Boltan;
	nr				= 1;
	condition		= DIA_Boltan_HALLO_Condition;
	information		= DIA_Boltan_HALLO_Info;
	important		= TRUE;
};

func int DIA_Boltan_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Boltan_HALLO_Info()
{
	AI_Output(self, other, "DIA_Boltan_Add_05_00"); //你 来 这 里 想 要 做 什 么 ？
};

// ************************************************
// 						Hallo
// ************************************************
instance DIA_Boltan_ToConvicts(C_INFO)
{
	npc				= Mil_313_Boltan;
	nr				= 2;
	condition		= DIA_Boltan_ToConvicts_Condition;
	information		= DIA_Boltan_ToConvicts_Info;
	permanent		= TRUE;
	description		= "我 想 见 囚 犯 。";
};

func int DIA_Boltan_ToConvicts_Condition()
{
	return TRUE;
};

func void DIA_Boltan_ToConvicts_Info()
{
	AI_Output(other, self, "DIA_Boltan_Add_15_01"); //我 想 见 囚 犯 。

	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS))
	{
		if (other.guild == GIL_SLD)
		{
			AI_Output(self, other, "DIA_Boltan_Add_05_07"); //是 的 ， 出 发 ， 并 向 你 的 朋 友 说 再 见 吧 。
		}
		else
		{
			AI_Output(self, other, "DIA_Boltan_Add_05_06"); //我 们 将 要 处 死 了 谋 杀 圣 骑 士 洛 萨 的 畜 牲 。
		};
	}
	else if ((Canthar_Ausgeliefert == FALSE)
	&& (Sarah_Ausgeliefert == FALSE)
	&& (Rengaru_Ausgeliefert == FALSE)
	&& (Nagur_Ausgeliefert == FALSE))
	{
		AI_Output(self, other, "DIA_Boltan_Add_05_02"); //现 在 所 有 的 牢 房 都 是 空 的 。
	}
	else
	{
		if (other.guild == GIL_MIL)
		{
			AI_Output(self, other, "DIA_Boltan_Add_05_04"); //好 吧 ， 朋 友 。
		}
		else if ((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			AI_Output(self, other, "DIA_Boltan_Add_05_05"); //当 然 。
		}
		else
		{
			AI_Output(self, other, "DIA_Boltan_Add_05_03"); //去 吧 ， 但 是 不 要 呆 的 时 间 太 久 ， 明 白 吗 ？
		};
	};
};

// ************************************************
// 					HalloBennet
// ************************************************
instance DIA_Boltan_HalloBennet(C_INFO)
{
	npc				= Mil_313_Boltan;
	nr				= 1;
	condition		= DIA_Boltan_HalloBennet_Condition;
	information		= DIA_Boltan_HalloBennet_Info;
	important		= TRUE;
};

func int DIA_Boltan_HalloBennet_Condition()
{
	if ((Kapitel == 3)
	&& (MIS_RescueBennet != LOG_SUCCESS)
	&& (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloBennet_Info()
{
	AI_Output(self, other, "DIA_Boltan_Add_05_08"); //你 来 这 里 不 是 要 把 你 的 同 伴 弄 出 去 吧 ， 是 吗 ？
	AI_Output(self, other, "DIA_Boltan_Add_05_09"); //想 都 不 要 想 ！ 只 要 我 拉 响 警 报 ， 卫 兵 们 会 立 即 出 现 在 这 里 ！
	AI_Output(self, other, "DIA_Boltan_Add_05_10"); //那 时 我 们 就 会 看 到 一 堆 切 碎 了 的 雇 佣 兵 ！ （ 讨 厌 的 大 笑 ）
};

// ************************************************
// 					HalloCanthar
// ************************************************
instance DIA_Boltan_HalloCanthar(C_INFO)
{
	npc				= Mil_313_Boltan;
	nr				= 1;
	condition		= DIA_Boltan_HalloCanthar_Condition;
	information		= DIA_Boltan_HalloCanthar_Info;
	important		= TRUE;
};

func int DIA_Boltan_HalloCanthar_Condition()
{
	if (((Kapitel != 3) || ((Kapitel == 3) && ((MIS_RescueBennet == LOG_SUCCESS) || (other.guild != GIL_SLD))))
	&& (Canthar_WiederRaus == TRUE)
	&& (Canthar_Ausgeliefert == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Boltan_HalloCanthar_Info()
{
	AI_Output(self, other, "DIA_Boltan_Add_05_11"); //嘿 ， 你 是 那 个 控 告 雇 佣 兵 坎 萨 的 家 伙 。
	AI_Output(self, other, "DIA_Boltan_Add_05_12"); //有 很 多 人 来 这 里 担 保 他 ， 真 是 备 受 尊 敬 的 人 。
	AI_Output(self, other, "DIA_Boltan_Add_05_13"); //发 生 的 那 些 事 一 定 是 个 误 会 。
	AI_Output(self, other, "DIA_Boltan_Add_05_14"); //在 将 来 ， 你 一 定 要 留 意 你 要 送 进 监 狱 的 人 。
};
