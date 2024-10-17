// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	npc				= Dragon_Fire_Island;
	nr				= 999;
	condition		= DIA_Dragon_Fire_Island_Exit_Condition;
	information		= DIA_Dragon_Fire_Island_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	npc				= Dragon_Fire_Island;
	nr				= 5;
	condition		= DIA_Dragon_Fire_Island_Hello_Condition;
	information		= DIA_Dragon_Fire_Island_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //等 等 ， 那 个 人 。 我 所 有 的 感 觉 告 诉 我 ， 我 肉 体 和 血 液 的 凶 手 站 在 我 面 前 。
	AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //真 的 吗 ？ 你 管 谁 叫 凶 手 ， 你 这 地 狱 产 物 ？

	if ((hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7))
	{
		AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //你 几 乎 消 灭 了 我 们 所 有 的 子 民 ， 难 道 这 还 不 够 吗 ？。
	};

	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //你 让 我 的 兄 弟 费 欧 玛 萨 为 你 而 不 安 ， 你 将 要 付 出 代 价 。

	if ((hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7))
	{
		AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //我 会 把 你 其 它 恶 心 的 同 类 也 干 掉 。
		AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //啊 。 把 你 活 活 烧 死 会 令 我 感 到 愉 快 。
	};

	AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //别 发 出 这 么 大 的 噪 音 了 。 我 们 认 真 考 虑 正 事 吧 。
	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //你 大 老 远 来 到 这 里 ， 小 东 西 。 但 是 ， 你 永 远 也 无 法 活 着 离 开 这 座 大 厅 。

	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);
	AI_StopProcessInfos(self);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_8);

	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};
