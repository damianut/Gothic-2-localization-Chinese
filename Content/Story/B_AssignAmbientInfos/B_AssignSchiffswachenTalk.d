// ***************************************************
//  	B_AssignSchiffswachenTalk
// ***************************************************
func void B_AssignSchiffswachenGuard(var C_Npc Schiffswache)
{
	if ((MIS_ShipIsFree == TRUE) // Joly: SC darf jetzt auf´s Schiff!!!!
	|| (MIS_SCVisitShip == LOG_RUNNING)) // Joly: Für die Kurzzeitige Erlaubnis, das Schiff zu besuchen! Muß nach der Aktion wieder geändert werden, z. B = 0;
	{
		if (Schiffswache.voice == 4)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_Ambient_04_00"); //我 们 在 监 视 你 。 记 住 那 个 。
		};

		if (Schiffswache.voice == 9)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_Ambient_09_01"); //当 你 在 这 里 的 时 候 不 要 惹 麻 烦 。
		};

		if (Schiffswache.voice == 12)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_Ambient_12_02"); //你 别 想 从 这 里 偷 任 何 东 西 ， 明 白 吗 ？
		};

		AI_StopProcessInfos(Schiffswache);
		Npc_SetRefuseTalk(Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_220_Schiffswache, 60); // Joly: Damit alle die Schnauze halten, wenn der SC auf dem Schiff rumwandert.
		Npc_SetRefuseTalk(Pal_221_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_222_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_223_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_224_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_225_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_226_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_227_Schiffswache, 60);
		Npc_SetRefuseTalk(Pal_228_Schiffswache, 60);
	}
	else
	{
		B_Say(self, other, "$ALARM");
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_GuardStopsIntruder, 1); // Joly: Ohne Erlaubnis hat der SC da nix verloren!!!!!!!!!!!
		Npc_SetRefuseTalk(Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_220_Schiffswache, 20); // Joly: Damit alle die Schnauze halten, wenn der SC sich in sicherheit bringen will.
		Npc_SetRefuseTalk(Pal_221_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_222_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_223_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_224_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_225_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_226_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_227_Schiffswache, 20);
		Npc_SetRefuseTalk(Pal_228_Schiffswache, 20);
	};
};

func void B_AssignSchiffswachenInfos(var C_Npc Schiffswache)
{
	if (Mis_OCGateOpen == TRUE)
	{
		if (Schiffswache.voice == 4)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_04_00"); //该 死 的 兽 人 袭 击 了 加 隆 德 的 城 堡 。 我 们 必 须 立 即 行 动 。
		};

		if (Schiffswache.voice == 9)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_09_01"); //如 果 我 们 抓 住 那 个 打 开 城 堡 主 大 门 的 叛 徒 ， 我 们 就 干 掉 他 。
		};

		if (Schiffswache.voice == 12)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_12_02"); //我 们 等 不 了 那 么 久 。 我 们 在 矿 藏 山 谷 的 兄 弟 们 需 要 我 们 的 帮 助 ， 要 赶 在 兽 人 的 第 二 波 攻 击 之 前 。
		};
	}
	else
	{
		if (Schiffswache.voice == 4)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_04_03"); //加 隆 德 已 经 召 起 了 全 面 动 员 。 我 们 要 尽 快 赶 去 矿 藏 山 谷 。
		};

		if (Schiffswache.voice == 9)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_09_04"); //一 定 要 好 好 给 那 些 兽 人 上 堂 课 。！
		};

		if (Schiffswache.voice == 12)
		{
			AI_Output(self, other, "DIA_Pal_Schiffswache_AmbientKap5_12_05"); //我 迫 不 及 待 要 教 训 一 下 那 些 兽 人 。 我 们 马 上 出 发 吧 。
		};
	};

	AI_StopProcessInfos(Schiffswache);
};

func void B_AssignSchiffswachenTalk(var C_Npc Schiffswache)
{
	if (Kapitel >= 5)
	{
		B_AssignSchiffswachenInfos(Schiffswache);
	}
	else
	{
		B_AssignSchiffswachenGuard(Schiffswache);
	};
};

func int B_AssignSchiffswachenInfoConditions(var C_Npc Schiffswache)
{
	if ((Kapitel < 5)
	&& (Npc_RefuseTalk(self) == FALSE)
	&& (MIS_SCVisitShip != LOG_RUNNING))
	{
		return TRUE;
	}
	else if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
