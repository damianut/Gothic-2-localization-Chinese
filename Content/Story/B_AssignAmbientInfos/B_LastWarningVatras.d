////////////////////////////////////////////////////////
//		B_LastWarningVatras
////////////////////////////////////////////////////////

func void B_LastWarningVatras()
{
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_00"); //你 做 了 些 什 么 ， 可 怜 的 家 伙 ？
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_01"); //我 们 在 水 之 修 道 会 里 已 经 再 三 警 告 你 不 要 被 邪 恶 引 诱 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_02"); //然 而 ， 我 注 意 到 你 已 经 离 开 了 维 持 一 切 平 衡 的 道 路 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_03"); //你 在 大 地 上 谋 杀 并 掠 夺 ， 你 犯 下 了 严 重 的 罪 行 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_04"); //很 多 无 辜 的 人 被 你 的 双 手 夺 取 生 命 。
	AI_Output(self, other, "DIA_Addon_Vatras_LastWarning_ADD_05_05"); //你 现 在 已 经 同 黑 暗 的 力 量 结 盟 。
};

func void B_VatrasPissedOff()
{
	AI_Output(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_00"); //从 今 以 后 ， 你 不 会 再 得 到 我 们 的 支 持 。
	AI_Output(self, other, "DIA_Addon_Vatras_PissedOffPerm_Add_05_01"); //走 开 。 对 我 来 说 ， 你 现 在 是 一 名 被 驱 逐 的 人 。

	if (Vatras_IsOnBoard == LOG_SUCCESS)
	{
		crewmember_Count = (Crewmember_Count - 1);
	};

	Vatras_IsOnBoard = LOG_FAILED; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	self.flags = 0;
	VatrasPissedOffForever = TRUE;

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "PRAY");
};
