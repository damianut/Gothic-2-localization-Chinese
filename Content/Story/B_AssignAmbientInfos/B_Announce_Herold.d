// ***************
// B_Announce_Herold
// ***************

func void B_Announce_Herold()
{
	var int randy;
	if (C_BodystateContains(self, BS_SIT))
	{
		AI_StandUp(self);
		B_TurnToNpc(self, hero);
	};

	// ------ NSC steckt ggf. Waffe weg ------
	AI_RemoveWeapon(self);

	CreateInvItem(self, Fakescroll);
	AI_UseItemToState(self, Fakescroll, 1);

	AI_Output(self, self, "DIA_Herold_Announce_04_00"); //你 们 听 好 ， 克 霍 里 尼 斯 的 居 民 们 ！ 按 照 尊 敬 的 哈 根 勋 爵 下 达 的 命 令 ， 据 此 制 定 如 下 法 令 。

	if (Kapitel <= 2)
	{
		randy = Hlp_Random(5);
		if (randy == 0)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_01"); //根 据 全 面 局 势 ， 为 了 你 们 自 身 的 安 全 ， 现 在 禁 止 进 入 城 市 附 近 的 森 林 和 荒 野 ！
			AI_Output(self, self, "DIA_Herold_Announce_04_02"); //此 外 ， 严 格 禁 止 与 周 边 地 区 那 些 叛 乱 农 民 接 触 。
		}
		else if (randy == 1)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_03"); //从 此 刻 开 始 ， 安 德 烈 勋 爵 将 对 我 们 的 民 兵 享 有 最 高 指 挥 权 。
			AI_Output(self, self, "DIA_Herold_Announce_04_04"); //这 个 城 市 中 ， 所 有 拥 有 军 事 技 能 的 市 民 都 要 加 入 皇 家 民 兵 。
		}
		else if (randy == 2)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_05"); //针 对 富 人 区 的 安 全 措 施 将 进 一 步 加 强 。
			AI_Output(self, self, "DIA_Herold_Announce_04_06"); //大 门 的 卫 兵 将 以 最 严 格 的 方 式 诠 释 法 律 ， 以 防 止 未 经 授 权 的 人 进 入 。
		}
		else if (randy == 3)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_07"); //军 事 法 令 将 在 这 个 王 国 的 所 有 城 市 和 领 土 上 立 即 宣 布 。
			AI_Output(self, self, "DIA_Herold_Announce_04_08"); //所 有 的 民 事 审 判 将 交 由 皇 家 圣 骑 士 处 理 ， 立 即 生 效 。
			AI_Output(self, self, "DIA_Herold_Announce_04_09"); //尊 敬 的 安 德 烈 勋 爵 命 令 严 惩 一 切 犯 罪 行 为 ， 以 及 那 些 反 对 国 王 的 卫 兵 的 人 。
			AI_Output(self, self, "DIA_Herold_Announce_04_10"); //所 有 克 霍 里 尼 斯 中 有 犯 罪 行 为 的 人 要 立 即 向 安 德 烈 勋 爵 汇 报 。
		}
		else
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_11"); //由 于 兽 人 袭 击 的 危 险 将 至 ， 城 市 中 的 所 有 居 民 都 要 做 好 相 应 准 备 。
			AI_Output(self, self, "DIA_Herold_Announce_04_12"); //所 有 人 都 要 立 即 开 始 战 斗 技 能 的 训 练 ， 并 要 适 当 进 行 武 装 。
		};
	}
	else if (Kapitel == 3)
	{
		if (MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_13"); //雇 佣 兵 铁 匠 贝 尼 特 ， 恶 毒 地 谋 杀 了 圣 骑 士 洛 萨 ， 已 经 以 英 诺 斯 之 名 定 罪 。
			AI_Output(self, self, "DIA_Herold_Announce_04_14"); //判 决 为 绞 刑 ， 几 天 后 执 行 。
		}
		else
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_15"); //铁 匠 贝 尼 特 已 经 被 宣 告 无 罪 释 放 ， 因 为 他 的 无 辜 已 经 得 到 了 哈 根 勋 爵 的 证 实 。
		};
	}
	else if (Kapitel == 4)
	{
		AI_Output(self, self, "DIA_Herold_Announce_04_16"); //关 于 克 霍 里 尼 斯 矿 藏 山 谷 有 龙 出 没 的 谣 言 不 能 相 信 。
		AI_Output(self, self, "DIA_Herold_Announce_04_17"); //这 些 谣 言 是 由 敌 人 散 布 的 ， 用 以 在 勇 敢 的 米 尔 塔 纳 人 民 中 传 播 恐 惧 。
		AI_Output(self, self, "DIA_Herold_Announce_04_18"); //为 了 反 驳 这 些 荒 谬 的 言 论 ， 由 一 名 熟 悉 那 个 地 方 的 圣 骑 士 指 挥 的 一 队 圣 骑 士 已 经 向 矿 藏 山 谷 进 发 。
	}
	else // Kapitel 5
	{
		randy = Hlp_Random(2);
		if (randy == 0)
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_19"); //威 胁 这 片 土 地 的 龙 已 经 被 以 哈 根 勋 爵 率 领 的 勇 敢 的 战 士 们 击 败 。
			AI_Output(self, self, "DIA_Herold_Announce_04_20"); //很 快 ， 国 王 罗 巴 尔 将 会 把 这 片 大 陆 从 兽 人 手 中 解 放 出 来 ， 这 个 王 国 将 会 再 次 繁 荣 兴 旺 ！
		}
		else
		{
			AI_Output(self, self, "DIA_Herold_Announce_04_21"); //安 德 烈 勋 爵 将 拥 有 指 挥 克 霍 里 尼 斯 城 的 最 高 权 力 ， 立 即 生 效 。
			AI_Output(self, self, "DIA_Herold_Announce_04_22"); //哈 根 勋 爵 已 经 宣 布 ， 他 将 亲 自 前 往 矿 藏 山 谷 ， 以 确 保 他 的 船 可 以 装 满 魔 法 矿 石 。
		};
	};

	AI_UseItemToState(self, Fakescroll, -1);
};

/*

AI_Output(self, self, "DIA_Herold_Announce_04_00"); //Hört Bürger von Khorinis den Beschluß des ehrenwerten Lord Hagen!
AI_Output(self, self, "DIA_Herold_Announce_04_02"); //An alle Bürger von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt.
AI_Output(self, self, "DIA_Herold_Announce_04_09"); //Hört ihr Bewohner von Khorinis und vernehmt das königliche Dekret zur Aufrechterhaltung der öffentlichen Ordnung.
AI_Output(self, self, "DIA_Herold_Announce_04_09"); //An alle Bewohner von Khorinis, vernehmt Lord Hagens Anordnungen zum Schutze unserer Stadt.

Kapitel 3 Spieler kommt aus dem Minental und hat mit Lord Hagen gesprochen
Hört ihr Büger von Khorinis. Ein Bote der Paladine brachte Kunde aus dem Minental
Unsere tapferen Paladine halten den Orks wehrhaft stand und erschliessen neue Minen für das Königreich !

Kapitel 3 Bennet ist im Knast
Hört ihr Bürger von Khorinis
Der Schmied Bennet, der den ehrenwerten Paladin Lothar heimtückisch ermordert hat, ist im Namen Innos verurteilt worden.
Das Urteil lautet Tod durch den Strick.

Kapitel 3 Bennet ist wieder frei
Hört ihr Bürger,
Der Schmied Bennet wird freigesprochen, da seine Unschuld von einem klugen Berater Lord Hagens bewiesen wurde.
So ist es Innos Wille und nach seiner Gerechtigkeit handeln wir.

Kapitel 5 Start Drachen sind tot
Hört Bürger von Khorinis
Die Drachen die das Land bedrohten wurden von tapferen Männern unter dem Befehl von Lord Hagen besiegt.
Bald wird auch König Rohbar das Land von den Orks befreien und das Königreich wird in neuem Glanz aufblühen !

Kapitel 5 Kurz vor Schluß(Spieler war in der Biblothek)
Der ehrenwerte Lord Hagen hat verkündet nun selbst ins Minental zu ziehen um dafür zu sorgen das sein Schiff mit dem Erz beladen werden kann.

*/
