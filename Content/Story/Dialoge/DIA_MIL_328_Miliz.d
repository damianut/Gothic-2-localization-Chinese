///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_328_Miliz_EXIT(C_INFO)
{
	npc				= MIL_328_Miliz;
	nr				= 999;
	condition		= DIA_328_Miliz_EXIT_Condition;
	information		= DIA_328_Miliz_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_328_Miliz_Hi(C_INFO)
{
	npc				= MIL_328_Miliz;
	nr				= 1;
	condition		= DIA_328_Miliz_Hi_Condition;
	information		= DIA_328_Miliz_Hi_Info;
	important		= TRUE;
};

func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	AI_Output(self, other, "DIA_328_Miliz_Hi_08_00"); //嘿 ， 这 里 没 你 的 事 ， 明 白 吗 ？
	AI_Output(other, self, "DIA_328_Miliz_Hi_15_01"); //你 是 谁 ？
	AI_Output(self, other, "DIA_328_Miliz_Hi_08_02"); //那 不 关 你 的 事 ！ 我 是 这 里 的 头 儿 ， 懂 吗 ？
	AI_Output(other, self, "DIA_328_Miliz_Hi_15_03"); //头 儿 ？ 谁 的 ？ 那 些 箱 子 的 ？
	AI_Output(self, other, "DIA_328_Miliz_Hi_08_04"); //嘿 ， 这 个 储 藏 室 由 我 来 管 理 ， 明 白 了 吗 ？ 所 以 滚 蛋 ， 否 则 我 就 打 碎 你 的 脑 袋 。

	AI_StopProcessInfos(self);

	Npc_SetRefuseTalk(self, 30);
};

///////////////////////////////////////////////////////////////////////
//	Info Kill
///////////////////////////////////////////////////////////////////////
instance DIA_328_Miliz_Kill(C_INFO)
{
	npc				= MIL_328_Miliz;
	nr				= 2;
	condition		= DIA_328_Miliz_Kill_Condition;
	information		= DIA_328_Miliz_Kill_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_328_Miliz_Kill_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self, other, "DIA_328_Miliz_Kill_08_00"); //嘿 ， 你 还 在 这 里 。 我 没 有 告 诉 你 滚 蛋 吗 ？
	AI_Output(self, other, "DIA_328_Miliz_Kill_08_01"); //现 在 我 让 你 知 道 这 里 谁 说 了 算 ！

	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 20);
	B_Attack(self, other, AR_KILL, 1);
};
