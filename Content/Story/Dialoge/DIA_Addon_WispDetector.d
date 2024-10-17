func void B_FollowMe_Wisp()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_FollowMe_Wisp_15_00"); //紧 跟 我 。
};

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_WispDetector_EXIT(C_INFO)
{
	npc				= Wisp_Detector;
	nr				= 999;
	condition		= DIA_Addon_WispDetector_EXIT_Condition;
	information		= DIA_Addon_WispDetector_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_WispDetector_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_EXIT_Info()
{
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info DetectItems
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_WispDetector_DetectItems(C_INFO)
{
	npc				= Wisp_Detector;
	nr				= 5;
	condition		= DIA_Addon_WispDetector_DetectItems_Condition;
	information		= DIA_Addon_WispDetector_DetectItems_Info;
	permanent		= TRUE;
	description		= "给 我 找 东 西 ！";
};

func int DIA_Addon_WispDetector_DetectItems_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_DetectItems_Info()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_15_00"); //给 我 找 东 西 ！

	Info_ClearChoices(DIA_Addon_WispDetector_DetectItems);

	Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "紧 跟 我 。", DIA_Addon_WispDetector_DetectItems_Follow);

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 咒 语 和 卷 轴.", DIA_Addon_WispDetector_DetectItems_RUNE);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 金 币 、 钥 匙 和 工 具", DIA_Addon_WispDetector_DetectItems_NONE);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 远 程 武 器 和 弹 药 。", DIA_Addon_WispDetector_DetectItems_FF);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 近 战 武 器 。", DIA_Addon_WispDetector_DetectItems_NF);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 食 物 和 植 物 。", DIA_Addon_WispDetector_DetectItems_FOOD);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 戒 指 和 护 身 符 。", DIA_Addon_WispDetector_DetectItems_MAGIC);
	};

	if (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == TRUE)
	{
		Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "我 需 要 所 有 种 类 的 药 剂 。", DIA_Addon_WispDetector_DetectItems_POTIONS);
	};

	Info_AddChoice(DIA_Addon_WispDetector_DetectItems, "把 你 能 找 到 的 所 有 东 西 给 我 拿 来 ！。", DIA_Addon_WispDetector_DetectItems_ALL);
};

func void DIA_Addon_WispDetector_DetectItems_Follow()
{
	B_FollowMe_Wisp();
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
	WispSearching = WispSearch_Follow;
};

func void DIA_Addon_WispDetector_DetectItems_ALL()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_ALL_15_00"); //把 你 能 找 到 的 所 有 东 西 给 我 拿 来 ！。
	WispSearching = WispSearch_ALL;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_POTIONS()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_POTIONS_15_00"); //我 需 要 所 有 种 类 的 药 剂 。
	WispSearching = WispSearch_POTIONS;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_MAGIC()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_MAGIC_15_00"); //我 需 要 戒 指 和 护 身 符 。
	WispSearching = WispSearch_MAGIC;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FOOD()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_FOOD_15_00"); //我 需 要 食 物 和 植 物 .
	WispSearching = WispSearch_FOOD;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NF()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_NF_15_00"); //我 需 要 近 战 武 器 。
	WispSearching = WispSearch_NF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_FF()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_FF_15_00"); //我 需 要 远 程 武 器 和 弹 药 。
	WispSearching = WispSearch_FF;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_NONE()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_NONE_15_00"); //我 需 要 金 币 .钥 匙 和 工 具
	WispSearching = WispSearch_NONE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

func void DIA_Addon_WispDetector_DetectItems_RUNE()
{
	AI_Output(other, self, "DIA_Addon_WispDetector_DetectItems_RUNE_15_00"); //我 需 要 咒 语 和 卷 轴.
	WispSearching = WispSearch_RUNE;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Follow
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_WispDetector_Follow(C_INFO)
{
	npc				= Wisp_Detector;
	nr				= 5;
	condition		= DIA_Addon_WispDetector_Follow_Condition;
	information		= DIA_Addon_WispDetector_Follow_Info;
	permanent		= TRUE;
	description		= "紧 跟 我 。";
};

func int DIA_Addon_WispDetector_Follow_Condition()
{
	return TRUE;
};

func void DIA_Addon_WispDetector_Follow_Info()
{
	B_FollowMe_Wisp();
	WispSearching = WispSearch_Follow;
	B_IrrlichtBeep();
	AI_StopProcessInfos(self);
};
