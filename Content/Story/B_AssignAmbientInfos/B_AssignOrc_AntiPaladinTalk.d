// ***************************************************
//  	B_AssignORC_AntiPaladinTalk
// ***************************************************

var int AntiPaladinTalkcount;
func void B_AssignORC_AntiPaladinTalk(var C_Npc Antipaladin)
{
	if (AntiPaladinTalkcount == 0)
	{
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_01"); //KHROKGNAR！ 主 人 说 到 你 们 圣 骑 士 ！ 主 人 的 正 确 的 。 主 人 永 远 是 正 确 的 。
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_02"); //我 们 自 豪 的 兽 人 军 队 的 首 领 ， 现 在 亲 自 来 杀 死 大 批 的 圣 骑 士 。
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_03"); //哈 根 和 他 的 人 将 被 消 灭 。 即 使 你 也 帮 不 了 他 们 。
		B_GivePlayerXP(XP_Ambient);
	}
	else if (AntiPaladinTalkcount == 1)
	{
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_04"); //主 人 说 兽 人 首 领 ， 带 来 伟 大 的 圣 骑 士 的 头 。 你 现 在 死 在 我 手 上 。KHROKGNAR！
	}
	else if (AntiPaladinTalkcount == 2)
	{
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_05"); //我 们 兽 人 首 领 现 在 亲 自 杀 死 你 ， 圣 骑 士 。
	}
	else
	{
		AI_Output(self, other, "DIA_ORC_AntiPaladin_18_06"); //KHROKGNAR！ 我 们 杀 死 你 ， 圣 骑 士 。
	};

	AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
	TalkedTo_AntiPaladin = TRUE;

	AI_StopProcessInfos(Antipaladin);
	Antipaladin.aivar[AIV_EnemyOverride] = FALSE;
	Npc_SetRefuseTalk(Antipaladin, 20);
};
