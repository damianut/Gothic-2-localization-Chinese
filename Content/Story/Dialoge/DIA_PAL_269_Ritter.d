///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_PAL_269_EXIT(C_INFO)
{
	npc				= PAL_269_Ritter;
	nr				= 999;
	condition		= DIA_PAL_269_EXIT_Condition;
	information		= DIA_PAL_269_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_269_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_269_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HERO
///////////////////////////////////////////////////////////////////////
instance DIA_Ritter_HERO(C_INFO)
{
	npc				= PAL_269_Ritter;
	condition		= DIA_PAL_269_HERO_Condition;
	information		= DIA_PAL_269_HERO_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_PAL_269_HERO_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

var int DIA_Ritter_HERO_NoPerm;
func void DIA_PAL_269_HERO_Info()
{
	AI_Output(self, other, "DIA_Ritter_HERO_04_00"); //你 的 出 现 对 我 们 所 有 人 来 说 是 一 个 预 兆 。 我 们 因 此 而 找 到 了 新 的 勇 气 。

	if (DIA_Ritter_HERO_NoPerm == FALSE)
	{
		AI_Output(self, other, "DIA_Ritter_HERO_04_01"); //我 们 知 道 城 里 的 人 们 还 没 有 忘 记 我 们 。 英 诺 斯 之 眼 在 守 护 着 我 们 。
		AI_Output(self, other, "DIA_Ritter_HERO_04_02"); //那 如 果 兽 人 和 龙 猛 攻 大 门 的 话 ， 我 们 将 正 面 交 战 ， 直 至 胜 利 或 者 死 亡 。
		DIA_Ritter_HERO_NoPerm = TRUE;
	};
};
