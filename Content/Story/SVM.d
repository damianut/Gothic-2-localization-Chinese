// *********************
// Standard Voice Module
// *********************

class C_SVM
{
	// ------ B_Say_GuildGreetings ------
	var string MILGreetings;																	// Miliz grüßt Miliz oer Paladin
	var string PALGreetings;																	// Paladin grüßt Paladin oder Magier
	var string Weather;																			// So ein Mistwetter!

	// ------ B_Say_AttackReason ------
	var string IGetYouStill;																	// Upset-NSC sieht Spieler währned seiner Angry-Time wieder. Greift mit altem AttackReason an.
	var string DieEnemy;																		// Feind wird angegriffen
	var string DieMonster;																		// gefährliches Monster wird angegriffen
	var string Addon_DieMonster;
	var string Addon_DieMonster2;
	var string DirtyThief;																		// Dieb wird angegriffen
	var string HandsOff;																		// SC fummelt an Objekt rum
	var string SheepKiller;																		// Mensch greift Schaf an
	var string SheepKillerMonster;																// Monster greift Schaf an
	var string YouMurderer;																		// Mensch hat Menschen umgebracht (kein Feind)
	var string DieStupidBeast;																	// Torwachen schlagen ungefähliches Monster tot, das versucht durchs Tor zu gehen
	var string YouDareHitMe;																	// SC hat NSC geschlagen
	var string YouAskedForIt;																	// SC hat trotz Aufforderung seine Waffe NICHT weggesteckt
	var string ThenIBeatYouOutOfHere;															// SC hat trotz Aufforderung Raum NICHT verlassen
	var string WhatDidYouDoInThere;																// Wache sieht SC aus einem verbotenen Raum rauskommen und greift an
	var string WillYouStopFighting;																// Wache beendet Kampf, greift Täter an

	// ------ B_Say_AttackEND ------
	var string KillEnemy;																		// Finishing-Move
	var string EnemyKilled;																		// NSC hat Feind getötet
	var string MonsterKilled;																	// NSC hat gefährliches Monster getötet
	var string Addon_MonsterKilled;
	var string Addon_MonsterKilled2;
	var string ThiefDown;																		// NSC hat Item-Dieb niedergeschlagen
	var string RumfummlerDown;																	// NSC hat verbotenes-MOBSI-Benutzer niedergeschlagen
	var string SheepAttackerDown;																// NSC hat human SheepAttacker oder SheepKiller umgehauen
	var string KillMurderer;																	// Mörder finishen
	var string StupidBeastKilled;																// GateGuards töten neutrales Monster, das vorbeikam
	var string NeverHitMeAgain;																	// NSC hat jemand niedergeschlagen, der ihn angegriffen hat
	var string YouBetterShouldHaveListened;														// NSC hat jemed niedergeschlagen, der die Waffe nicht weggesteckt hat
	var string GetUpAndBeGone;																	// NSC hat einen Eindringling im Portalraum niedergeschlagen
	var string NeverEnterRoomAgain;																// NSC hat Spieler, der aus verbotenem Portalraum kam niedergeschlagen
	var string ThereIsNoFightingHere;															// Wache hat Täter einer Schlägerei (derjenige, der angefangen hat) niedergeschlagen

	// ------ C_WantToFlee ------
	var string SpareMe;																			// Tu mir nichts!
	var string RunAway;																			// Scheiße! Nichts wie weg!

	// ------ C_WantToCallGuardsForFight ------
	var string Alarm;																			// Wache ruft Wache
	var string Guards;																			// Harter Bursche ruft Wache
	var string Help;																			// Bürger ruft Hilfe

	// ------ B_AssessMurder ------
	var string GoodMonsterKill;																	// Monster getötet - NSC findet das toll
	var string GoodKill;																		// Mensch getötet - NSC findet das toll (war sein Feind)

	// ------ B_AssessTalk ------
	var string NOTNOW;																			// wenn RefuseTalk Counter aktiv

	// ------ ZS_Attack ------
	var string RunCoward;																		// Gegner flieht

	// ------ ZS_ClearRoom ------
	var string GetOutOfHere;																	// Spieler in verbotenem Raum. Harter Bursche: Raus hier!
	var string WhyAreYouInHere;																	// Spieler in verbotenem Raum. Weicher Bursche: Was willst du hier?
	var string YesGoOutOfHere;																	// Spieler verläßt verboten Raum artig wieder

	// ------ ZS_ObservePlayer ------
	var string WhatsThisSupposedToBe;															// NSC sieht Spieler schleichen
	var string YouDisturbedMySlumber;															// NSC wurde von SC durch QuietSound geweckt

	// ------ ZS_RansackBody ------
	var string ITookYourGold;
	var string ShitNoGold;
	var string ITakeYourWeapon;

	// ------ ZS_ReactToDamage ------
	var string WhatAreYouDoing;																	// NSC wird von einem FRIENDLY-SC/NSC geschlagen

	// ------ ZS_ReactToWeapon ------
	var string LookingForTroubleAgain;															// SC hat Kampf verloren "Willst du nochmal was aufs Maul?"
	var string StopMagic;
	var string ISaidStopMagic;
	var string WeaponDown;
	var string ISaidWeaponDown;
	var string WiseMove;																		// Spieler hat Waffe/Spruch weggesteckt

	// ------ ZS_Unconscious ------
	var string NextTimeYoureInForIt;															// Harter Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)
	var string OhMyHead;																		// Weicher Bursche steht auf, nachdem er niedergeschlagen wurde (murmelt zu sich selbst)

	// ------ ZS_WatchFight ------
	var string TheresAFight;																	// NSC entdeckt einen Kampf, und findet das toll
	var string OhMyGodItsAFight;																// NSC entdeckt einen Kampf, und findet das bestützend (Bürger)
	var string GoodVictory;																		// Dem Sieger zujubeln
	var string NotBad;																			// 'Nicht schlecht...' - Kampfende - Freund wurde von Nicht-Freund besiegt
	var string OhMyGodHesDown;																	// Bestürzung über brutales Niederschlagen
	var string CheerFriend01;																	// Freund landet einen Treffer. 'Immer in die Fresse!'
	var string CheerFriend02;
	var string CheerFriend03;
	var string Ooh01;																			// Freund kriegt aufs Maul. 'Mist - das tat weh.'
	var string Ooh02;
	var string Ooh03;

	// ------ ZS_MagicSleep ------
	var string WhatWasThat;																		// Wenn NSC aus Magic Sleep erwacht

	// ------ TA_Sleep ------
	var string GetOutOfMyBed;																	// Raus aus meinem Bett!
	var string Awake;																			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

	// ------ B_AssignAmbientNEWS ------
	var string ABS_COMMANDER;																	// Ich hörte, du warst beim Kommandanten und hast die Sache wieder in Ordnung gebracht.
	var string ABS_MONASTERY;																	// Ich hörte, du warst bei Vater Parlan und hast Buße getan.
	var string ABS_FARM;																		// Ich hörte, du warst bei Lee und und hast die Sache wieder in Ordnung gebracht.
	var string ABS_GOOD;
	// ---------------------------------
	var string SHEEPKILLER_CRIME;																// Einfach unsere Schafe zu schlachten! Mach, daß du hier wegkommst!
	var string ATTACK_CRIME;																	// Mit miesen Schlägern rede ich nicht!
	var string THEFT_CRIME;																		// Geh mir aus den Augen, dreckiger Dieb!
	var string MURDER_CRIME;																	// Mit gemeinen Mördern rede ich nicht.
	// ---------------------------------
	var string PAL_CITY_CRIME;																	// Du bist eine Schande für deinen Orden! Lord Hagen wird toben vor Wut!
	var string MIL_CITY_CRIME;																	// Du bist eine Schande für die Stadtwache! Lord Andre wird dir das sicher austreiben!
	var string CITY_CRIME;																		// Lord Andre wird von deiner Tat erfahren!
	// ---------------------------------
	var string MONA_CRIME;																		// Dein Frevel wird Vater Parlan sicherlich nicht erfreuen!
	var string FARM_CRIME;																		// Lee wird dir die Hammelbeine langziehen! Wirst schon sehen, was du davon hast!
	var string OC_CRIME;																		// Kommandant Garond wird dich zur Rechenschaft ziehen!

	// ------ B_Say_ToughGuyNews ------
	var string TOUGHGUY_ATTACKLOST;																// Spieler hat einen ToughGuy angegriffen und gewonnen
	var string TOUGHGUY_ATTACKWON;																// Spieler hat einen ToughGuy angegriffen und ist besiegt worden
	var string TOUGHGUY_PLAYERATTACK;															// Spieler hat einen ToughGuy angegriffen und den Kampf abgebrochen

	// ------ GOLD ------
	var string GOLD_1000;																		// 1000 Goldstücke.
	var string GOLD_950;																		// 950 Goldstücke.
	var string GOLD_900;																		// 900 Goldstücke.
	var string GOLD_850;																		// 850 Goldstücke.
	var string GOLD_800;																		// 800 Goldstücke.
	var string GOLD_750;																		// 750 Goldstücke.
	var string GOLD_700;																		// 700 Goldstücke.
	var string GOLD_650;																		// 650 Goldstücke.
	var string GOLD_600;																		// 600 GOldstücke.
	var string GOLD_550;																		// 550 Goldstücke.
	var string GOLD_500;																		// 500 Goldstücke.
	var string GOLD_450;																		// 450 Goldstücke.
	var string GOLD_400;																		// 400 Goldstücke.
	var string GOLD_350;																		// 350 Goldstücke.
	var string GOLD_300;																		// 300 Goldstücke.
	var string GOLD_250;																		// 250 Goldstücke.
	var string GOLD_200;																		// 200 Goldstücke.
	var string GOLD_150;																		// 150 Goldstücke.
	var string GOLD_100;																		// 100 Goldstücke.
	var string GOLD_90;																			// 90 Goldstücke.
	var string GOLD_80;																			// 80 Goldstücke.
	var string GOLD_70;																			// 70 Goldstücke.
	var string GOLD_60;																			// 60 Goldstücke.
	var string GOLD_50;																			// 50 Goldstücke.
	var string GOLD_40;																			// 40 Goldstücke.
	var string GOLD_30;																			// 30 Goldstücke.
	var string GOLD_20;																			// 20 Goldstücke.
	var string GOLD_10;																			// 10 Goldstücke.

	// ------ B_Say_Smalltalk (TA_Smalltalk) ------
	var string Smalltalk01;																		// ...wenn Du meinst...
	var string Smalltalk02;																		// ...kann schon sein...
	var string Smalltalk03;																		// ...war nicht besonders schlau....
	var string Smalltalk04;																		// ...ich halt mich da lieber raus...
	var string Smalltalk05;																		// ...das ist wirklich nicht mein Problem...
	var string Smalltalk06;																		// ...war doch klar, daß das Ärger gibt...
	var string Smalltalk07;																		// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	var string Smalltalk08;																		// ...das passiert mir nicht nochmal...
	var string Smalltalk09;																		// ...an der Gechichte muß wohl doch was dran sein...
	var string Smalltalk10;																		// ...man muß eben aufpassen was man rumerzählt...
	var string Smalltalk11;																		// ...solange ich damit nichts zu tun habe...
	var string Smalltalk12;																		// ...man darf auch nicht alles glauben, was man hört...
	var string Smalltalk13;																		// ...in seiner Haut will ich trotzdem nicht stecken...
	var string Smalltalk14;																		// ...immer wieder die selbe Leier...
	var string Smalltalk15;																		// ...manche lernen eben garnichts dazu...
	var string Smalltalk16;																		// ...früher wäre das ganz anders gelaufen...
	var string Smalltalk17;																		// ...gequatscht wird viel...
	var string Smalltalk18;																		// ...ich hör nicht mehr auf das Gefasel...
	var string Smalltalk19;																		// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	var string Smalltalk20;																		// ...ich glaube kaum, daß sich daran was ändern wird...
	var string Smalltalk21;																		// ...wahrscheinlich hast Du recht...
	var string Smalltalk22;																		// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	var string Smalltalk23;																		// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	var string Smalltalk24;																		// ...laß uns lieber über was anderes reden...
	// Tough Guy (SLD/MIL/DJG)
	var string Smalltalk25;																		// ...der war doch sturzbetrunken...
	var string Smalltalk26;																		// ...mit mir kann man sowas nicht machen...
	var string Smalltalk27;																		// ...alle sind gerannt wie die Hasen, ich war ganz allein...
	// ProInnos (NOV/KDF/PAL)
	var string Smalltalk28;																		// ...so steht es in den heiligen Schriften...
	var string Smalltalk29;																		// ...ich handle stets in Innos Namen...
	var string Smalltalk30;																		// ...niemand darf gegen die göttliche Ordnung verstoßen...

	// ------ Lehrer-Kommentare ------
	var string NoLearnNoPoints;																	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string NoLearnOverPersonalMAX;															// NSC-Lehrer verbietet Steigerung ÜBER sein persönliches Lehrer-Maximum
	var string NoLearnYoureBetter;																// NSC-Lehrer - MAX ist schlechter als oder gleich wie Spieler
	var string YouLearnedSomething;																// SC hat etwas gelernt

	// ------ B_AssignCityGuide ------
	var string UNTERSTADT;
	var string OBERSTADT;
	var string TEMPEL;
	var string MARKT;
	var string GALGEN;
	var string KASERNE;
	var string HAFEN;
	// -------------------------------
	var string WHERETO;
	// -------------------------------
	var string OBERSTADT_2_UNTERSTADT;
	var string UNTERSTADT_2_OBERSTADT;
	var string UNTERSTADT_2_TEMPEL;
	var string UNTERSTADT_2_HAFEN;
	var string TEMPEL_2_UNTERSTADT;
	var string TEMPEL_2_MARKT;
	var string TEMPEL_2_GALGEN;
	var string MARKT_2_TEMPEL;
	var string MARKT_2_KASERNE;
	var string MARKT_2_GALGEN;
	var string GALGEN_2_TEMPEL;
	var string GALGEN_2_MARKT;
	var string GALGEN_2_KASERNE;
	var string KASERNE_2_MARKT;
	var string KASERNE_2_GALGEN;
	var string HAFEN_2_UNTERSTADT;

	// ------ Kampf ------
	var string Dead;																			// Tödlich verletzt
	var string Aargh_1;																			// Treffer kassiert im Kampf
	var string Aargh_2;																			// Treffer kassiert im Kampf
	var string Aargh_3;																			// Treffer kassiert im Kampf

	var string ADDON_WRONGARMOR;																// Sc hat unangemessene Rüstung an // Default
	var string ADDON_WRONGARMOR_SLD;															// Beide SLD/DJG und falsche Rüstung
	var string ADDON_WRONGARMOR_MIL;															// Beide MIL/PAL und falsche Rüstung
	var string ADDON_WRONGARMOR_KDF;															// Beide KDF und falsche Rüstung
	var string ADDON_NOARMOR_BDT;																// self ist BAndite und SC hat keine Rüstung an.

	var string ADDON_DIEBANDIT;																	// Stirb du dreckiger Bandit
	var string ADDON_DIRTYPIRATE;																// Piratenpack
	// ------ SC SVMs ------
	var string SC_HeyTurnAround;																// SC: Hey du! (B_AssessTalk)
	var string SC_HeyTurnAround02;
	var string SC_HeyTurnAround03;
	var string SC_HeyTurnAround04;
	var string SC_HeyWaitASecond;																// SC: Hey warte mal! (B_AssessTalk)
	var string DoesntWork;
	var string PickBroke;
	var string NeedKey;
	var string NoMorePicks;
	var string NoPickLockTalent;
	var string NoSweeping;

	var string PICKLOCKORKEYMISSING;
	var string KEYMISSING;
	var string PICKLOCKMISSING;
	var string NEVEROPEN;
	var string MISSINGITEM;
	var string DONTKNOW;
	var string NOTHINGTOGET;
	var string NOTHINGTOGET02;
	var string NOTHINGTOGET03;
	var string HEALSHRINE;
	var string HEALLASTSHRINE;
	var string IRDORATHTHEREYOUARE;
	var string SCOPENSIRDORATHBOOK;
	var string SCOPENSLASTDOOR;

	// -------------Addon ----------------------

	var string TRADE_1;
	var string TRADE_2;
	var string TRADE_3;

	var string VERSTEHE;
	var string FOUNDTREASURE;
	var string CANTUNDERSTANDTHIS;
	var string CANTREADTHIS;
	var string STONEPLATE_1;
	var string STONEPLATE_2;
	var string STONEPLATE_3;

	var string COUGH;
	var string HUI;

	var string Addon_ThisLittleBastard;
	var string ADDON_OPENADANOSTEMPLE;

	// Story Banditenlager Dialoge
	var string ATTENTAT_ADDON_DESCRIPTION;
	var string ATTENTAT_ADDON_DESCRIPTION2;
	var string ATTENTAT_ADDON_PRO;
	var string ATTENTAT_ADDON_CONTRA;

	var string MINE_ADDON_DESCRIPTION;
	var string ADDON_SUMMONANCIENTGHOST;
	var string ADDON_ANCIENTGHOST_NOTNEAR;

	var string ADDON_GOLD_DESCRIPTION;
};

// **********************************
// NSCs
// ----
// SVMs müssen immer "SVM_x" heissen,
// wobei x die VoiceNummer ist.
// **********************************

// ------ wird nur intern gebraucht! ------
instance SVM_0(C_SVM)
{
};

instance SVM_1(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_1_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_1_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_1_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_1_IGetYouStill";					//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_1_DieEnemy";						//你 现 在 要 倒 霉 了 ！ ！
	DieMonster											= "SVM_1_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_1_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_1_HandsOff";						//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_1_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_1_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_1_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_1_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_1_YouDareHitMe";					//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_1_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_1_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_1_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_1_WillYouStopFighting";			//马 上 停 下 ！？
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_1_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_1_EnemyKilled";					//够 你 受 的 ， 罪 犯 ！。
	MonsterKilled										= "SVM_1_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_1_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_1_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_1_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_1_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_1_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_1_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_1_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的!
	GetUpAndBeGone										= "SVM_1_GetUpAndBeGone";				//现 在 从 这 里 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_1_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_1_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_1_SpareMe";						//离 我 远 点 ！
	RunAway												= "SVM_1_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_1_Alarm";						//警 报 ！
	Guards												= "SVM_1_Guards";						//卫 兵 ！
	Help												= "SVM_1_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_1_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_1_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_1_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_1_RunCoward";					//（ 大 声 呼 叫 ） 住 手 ， 你 这 个 罪 犯 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_1_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_1_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_1_YesGoOutOfHere";				//嘿 ， 从 这 里 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_1_WhatsThisSupposedToBe";		//嘿 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？。
	YouDisturbedMySlumber								= "SVM_1_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_1_ITookYourGold";				//金 子 ！ 好 吧 ， 那 是 我 买 饲 料 的 … …
	ShitNoGold											= "SVM_1_ShitNoGold";					//那 个 混 蛋 身 上 一 分 钱 都 没 有 。
	ITakeYourWeapon										= "SVM_1_ITakeYourWeapon";				//我 想 你 的 武 器 要 归 我 保 管 了 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_1_WhatAreYouDoing";				//（ 警 告 ） 嘿 ！ 小 心 ！
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_1_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 没 拿 够 ？！
	StopMagic											= "SVM_1_StopMagic";					//不 要 用 你 的 魔 法 打 我 ！
	ISaidStopMagic										= "SVM_1_ISaidStopMagic";				//停 止 那 个 魔 法 ！ 你 的 耳 朵 出 问 题 了 吗 ？
	WeaponDown											= "SVM_1_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_1_ISaidWeaponDown";				//你 是 聋 了 还 是 怎 么 ？ 我 说 ： 放 下 那 武 器 ！
	WiseMove											= "SVM_1_WiseMove";						//看 ， 那 并 不 难 。！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_1_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 我 们 会 调 查 那 里 … …
	OhMyHead											= "SVM_1_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_1_TheresAFight";					//（ 热 切 的 ） 现 在 该 采 取 一 些 行 动 了 ！
	OhMyGodItsAFight									= "SVM_1_OhMyGodItsAFight";				//（ 惊 慌 的 ） 他 们 正 试 图 敲 碎 对 方 的 骨 头 … …
	GoodVictory											= "SVM_1_GoodVictory";					//（ 邪 恶 的 笑 ） 他 罪 有 应 得 ！。
	NotBad												= "SVM_1_NotBad";						//（ 满 意 的 ） 还 不 坏 … …
	OhMyGodHesDown										= "SVM_1_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 粗 鲁 的 家 伙 … …
	CheerFriend01										= "SVM_1_CheerFriend01";				//对 ， 那 是 正 确 的 做 法 ！
	CheerFriend02										= "SVM_1_CheerFriend02";				//你 在 等 什 么 ？！
	CheerFriend03										= "SVM_1_CheerFriend03";				//打 呀 小 子 ！
	Ooh01												= "SVM_1_Ooh01";						//什 么 都 不 许 动 ！
	Ooh02												= "SVM_1_Ooh02";						//让 他 看 看 谁 是 这 里 的 头 儿 ！
	Ooh03												= "SVM_1_Ooh03";						//该 死 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_1_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_1_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_1_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_1_ABS_COMMANDER";				//我 听 说 你 去 了 指 挥 官 那 里 ， 并 把 事 情 解 决 了 。
	ABS_MONASTERY										= "SVM_1_ABS_MONASTERY";				//我 听 说 你 去 了 帕 兰 神 父 那 里 忏 悔 了 你 的 罪 。
	ABS_FARM											= "SVM_1_ABS_FARM";						//他 们 说 你 去 了 李 那 里 ， 并 解 决 了 问 题 。
	ABS_GOOD											= "SVM_1_ABS_GOOD";						//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_1_SHEEPKILLER_CRIME";			//竟 然 在 屠 杀 我 们 的 绵 羊 ！ 滚 开 ， 破 坏 者 ！
	ATTACK_CRIME										= "SVM_1_ATTACK_CRIME";					//我 不 和 卑 鄙 的 无 赖 说 话 ！
	THEFT_CRIME											= "SVM_1_THEFT_CRIME";					//滚 出 我 的 视 线 ， 你 这 个 肮 脏 的 盗 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_1_PAL_CITY_CRIME";				//你 在 给 你 们 的 修 道 会 丢 脸 ！ 哈 根 勋 爵 会 狂 怒 的 ！
	MIL_CITY_CRIME										= "SVM_1_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 安 德 烈 勋 爵 会 教 你 一 些 礼 节 ！
	CITY_CRIME											= "SVM_1_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 说 你 所 做 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_1_MONA_CRIME";					//帕 兰 神 父 听 到 这 种 亵 渎 行 为 后 绝 对 不 会 高 兴 ！
	FARM_CRIME											= "SVM_1_FARM_CRIME";					//李 会 教 训 你 的 ！ 你 会 看 到 后 果 的 ！
	OC_CRIME											= "SVM_1_OC_CRIME";						//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_1_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_1_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 需 要 我 告 诉 你 谁 说 了 算 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_1_TOUGHGUY_PLAYERATTACK";		//你 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_1_GOLD_1000";					//1000枚 金 币 。
	GOLD_950											= "SVM_1_GOLD_950";						//950枚 金 币 。
	GOLD_900											= "SVM_1_GOLD_900";						//900枚 金 币 。
	GOLD_850											= "SVM_1_GOLD_850";						//850枚 金 币 。
	GOLD_800											= "SVM_1_GOLD_800";						//800枚 金 币 。
	GOLD_750											= "SVM_1_GOLD_750";						//750枚 金 币 。
	GOLD_700											= "SVM_1_GOLD_700";						//700枚 金 币 。
	GOLD_650											= "SVM_1_GOLD_650";						//650枚 金 币 。
	GOLD_600											= "SVM_1_GOLD_600";						//600枚 金 币 。
	GOLD_550											= "SVM_1_GOLD_550";						//550枚 金 币 。
	GOLD_500											= "SVM_1_GOLD_500";						//500枚 金 币 。
	GOLD_450											= "SVM_1_GOLD_450";						//450枚 金 币 。
	GOLD_400											= "SVM_1_GOLD_400";						//400枚 金 币 。
	GOLD_350											= "SVM_1_GOLD_350";						//350枚 金 币 。
	GOLD_300											= "SVM_1_GOLD_300";						//300枚 金 币 。
	GOLD_250											= "SVM_1_GOLD_250";						//250枚 金 币 。
	GOLD_200											= "SVM_1_GOLD_200";						//200枚 金 币 。
	GOLD_150											= "SVM_1_GOLD_150";						//150枚 金 币 。
	GOLD_100											= "SVM_1_GOLD_100";						//100枚 金 币 。
	GOLD_90												= "SVM_1_GOLD_90";						//90枚 金 币 。
	GOLD_80												= "SVM_1_GOLD_80";						//80枚 金 币 。
	GOLD_70												= "SVM_1_GOLD_70";						//70枚 金 币 。
	GOLD_60												= "SVM_1_GOLD_60";						//60枚 金 币 。
	GOLD_50												= "SVM_1_GOLD_50";						//50枚 金 币 。
	GOLD_40												= "SVM_1_GOLD_40";						//40枚 金 币 。
	GOLD_30												= "SVM_1_GOLD_30";						//30枚 金 币 。
	GOLD_20												= "SVM_1_GOLD_20";						//20枚 金 币 。
	GOLD_10												= "SVM_1_GOLD_10";						//10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_1_Smalltalk01";					//… … 你 真 的 认 为 … …
	Smalltalk02											= "SVM_1_Smalltalk02";					//… … 万 事 皆 有 可 能 … …
	Smalltalk03											= "SVM_1_Smalltalk03";					//… … 他 应 该 了 解 的 更 清 楚 … …
	Smalltalk04											= "SVM_1_Smalltalk04";					//… … 好 像 我 没 有 很 多 难 题 似 的 … …
	Smalltalk05											= "SVM_1_Smalltalk05";					//… … 那 是 谁 说 的 … …
	Smalltalk06											= "SVM_1_Smalltalk06";					//… … 那 只 会 造 成 更 多 的 麻 烦 … …
	Smalltalk07											= "SVM_1_Smalltalk07";					//… … 已 经 有 了 各 种 各 样 的 谣 传 … …
	Smalltalk08											= "SVM_1_Smalltalk08";					//… … 我 真 应 该 做 完 那 个 … …
	Smalltalk09											= "SVM_1_Smalltalk09";					//… … 那 些 都 是 谣 传 … …
	Smalltalk10											= "SVM_1_Smalltalk10";					//… … 最 好 弄 清 楚 你 在 和 谁 说 什 么 … …
	Smalltalk11											= "SVM_1_Smalltalk11";					//… … 我 应 该 早 点 告 诉 你 … …
	Smalltalk12											= "SVM_1_Smalltalk12";					//… … 从 来 没 有 人 问 过 我 … …
	Smalltalk13											= "SVM_1_Smalltalk13";					//… … 你 应 该 为 那 个 可 怜 人 感 到 悲 哀 … …
	Smalltalk14											= "SVM_1_Smalltalk14";					//… … 那 不 是 什 么 新 鲜 事 … …
	Smalltalk15											= "SVM_1_Smalltalk15";					//… … 那 显 而 易 见 … …
	Smalltalk16											= "SVM_1_Smalltalk16";					//… … 你 不 应 该 问 我 那 些 … …
	Smalltalk17											= "SVM_1_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_1_Smalltalk18";					//… … 你 已 经 知 道 我 在 想 什 么 了 … …
	Smalltalk19											= "SVM_1_Smalltalk19";					//… … 那 就 是 我 要 说 的 … …
	Smalltalk20											= "SVM_1_Smalltalk20";					//… … 那 是 无 可 变 更 的 … …
	Smalltalk21											= "SVM_1_Smalltalk21";					//… … 为 什 么 我 以 前 没 有 听 过 这 个 … …
	Smalltalk22											= "SVM_1_Smalltalk22";					//… … 让 我 们 等 等 看 会 发 生 什 么 … …
	Smalltalk23											= "SVM_1_Smalltalk23";					//… … 有 些 问 题 会 自 行 解 决 … …
	Smalltalk24											= "SVM_1_Smalltalk24";					//… … 我 不 想 再 听 到 那 些 了 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_1_Smalltalk25";					//… … 他 醉 倒 了 … …
	Smalltalk26											= "SVM_1_Smalltalk26";					//… … 我 不 应 该 受 到 那 样 的 待 遇 … …
	Smalltalk27											= "SVM_1_Smalltalk27";					//… … 他 们 都 像 兔 子 一 样 跑 了 ， 我 彻 底 孤 单 了 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_1_Smalltalk28";					//… … 圣 经 上 是 这 么 说 的 … …
	Smalltalk29											= "SVM_1_Smalltalk29";					//… … 我 一 直 都 是 以 英 诺 斯 之 名 行 事 … …
	Smalltalk30											= "SVM_1_Smalltalk30";					//… … 没 有 人 能 亵 渎 神 圣 的 修 道 会 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_1_NoLearnNoPoints";				//等 你 经 验 更 多 些 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_1_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_1_NoLearnYoureBetter";			//我 已 经 不 能 再 教 你 什 么 了 。 你 已 经 变 得 太 出 色 了 。
	YouLearnedSomething									= "SVM_1_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_1_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_1_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_1_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_1_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_1_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_1_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_1_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_1_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_1_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_1_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_1_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_1_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_1_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_1_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_1_TEMPEL_2_GALGEN";				//由 神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_1_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_1_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_1_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_1_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场。
	GALGEN_2_MARKT										= "SVM_1_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_1_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_1_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_1_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_1_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_1_Dead";							//啊 啊 啊 ！
	Aargh_1												= "SVM_1_Aargh_1";						//啊
	Aargh_2												= "SVM_1_Aargh_2";						//啊
	Aargh_3												= "SVM_1_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_1_Addon_WrongArmor";				//那 些 不 是 你 的 衣 服 。 我 不 喜 欢 你 。
	ADDON_WRONGARMOR_SLD								= "SVM_1_ADDON_WRONGARMOR_SLD";			//你 穿 的 是 什 么 啊 ？ 穿 的 象 样 点 。
	ADDON_WRONGARMOR_MIL								= "SVM_1_ADDON_WRONGARMOR_MIL";			//你 是 一 名 士 兵 ！ 最 起 码 穿 着 要 像 。
	ADDON_WRONGARMOR_KDF								= "SVM_1_ADDON_WRONGARMOR_KDF";			//你 的 衣 服 不 适 合 我 们 修 道 会 。 去 换 一 件。
	ADDON_NOARMOR_BDT									= "SVM_1_ADDON_ADDON_NOARMOR_BDT";		//你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 ！

	ADDON_DIEBANDIT										= "SVM_1_ADDON_DIEBANDIT";				//去 死 吧 ， 你 这 个 可 恶 的 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_1_ADDON_DIRTYPIRATE";			//海 盗 人 渣 ！
};

instance SVM_2(C_SVM)
{
	// leer
};

instance SVM_3(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_3_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_3_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_3_Weather";						//多 么 讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_3_IGetYouStill";					//现 在 我 抓 到 你 了 ！
	DieEnemy											= "SVM_3_DieEnemy";						//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_3_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_3_DirtyThief";					//卑 鄙 的 小 偷 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_3_HandsOff";						//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_3_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_3_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_3_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_3_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_3_YouDareHitMe";					//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_3_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_3_ThenIBeatYouOutOfHere";		//你 不 想 走 ？ 好 吧 ！
	WhatDidYouDoInThere									= "SVM_3_WhatDidYouDoInThere";			//你 在 哪 里 想 做 什 么 ？
	WillYouStopFighting									= "SVM_3_WillYouStopFighting";			//你 现 在 能 停 下 来 吗！？
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_3_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_3_EnemyKilled";					//你 罪 有 应 得 ， 罪 犯 ！
	MonsterKilled										= "SVM_3_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_3_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_3_rumfummlerDown";				//从 现 在 开 始 ， 把 你 的 爪 子 从 不 属 于 你 的 东 西 上 拿 开 ！
	SheepAttackerDown									= "SVM_3_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_3_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_3_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_3_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_3_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_3_GetUpAndBeGone";				//现 在 从 这 里 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_3_NeverEnterRoomAgain";			//现 在 从 这 里 滚 出 去 ！
	ThereIsNoFightingHere								= "SVM_3_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_3_SpareMe";						//不 要 伤 害 我 ！
	RunAway												= "SVM_3_RunAway";						//喔 ， 该 死 ！ ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_3_Alarm";						//警 报 ！
	Guards												= "SVM_3_Guards";						//卫 兵 ！
	Help												= "SVM_3_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_3_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_3_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_3_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_3_RunCoward";					//（ 大 声 呼 叫 ） 对 ！ 能 跑 多 快 跑 多 快 吧 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_3_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_3_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_3_YesGoOutOfHere";				//嘿 ， 从 这 里 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_3_WhatsThisSupposedToBe";		//嘿 ，你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？。
	YouDisturbedMySlumber								= "SVM_3_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_3_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_3_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_3_ITakeYourWeapon";				//我 想 我 最 好 拿 走 这 件 武 器 !
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_3_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_3_LookingForTroubleAgain";		//你 还 没 拿 够 吗 ？！
	StopMagic											= "SVM_3_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_3_ISaidStopMagic";				//想 挨 鞭 子 吗 ？ 马 上 停 止 ！ ！ ！
	WeaponDown											= "SVM_3_WeaponDown";					//丢 掉 那 件 武 器 ！
	ISaidWeaponDown										= "SVM_3_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_3_WiseMove";						//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_3_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_3_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_3_TheresAFight";					//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_3_OhMyGodItsAFight";				//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_3_GoodVictory";					//（ 邪 恶 的 笑 ） 你 让 他 知 道 谁 说 了 算 ！
	NotBad												= "SVM_3_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_3_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_3_CheerFriend01";				//那 打 啊 ！
	CheerFriend02										= "SVM_3_CheerFriend02";				//让 他 尝 尝 你 所 有 的 手 段 ！
	CheerFriend03										= "SVM_3_CheerFriend03";				//让 他 看 看 ！
	Ooh01												= "SVM_3_Ooh01";						//坚 持 住 ！
	Ooh02												= "SVM_3_Ooh02";						//留 神 ！
	Ooh03												= "SVM_3_Ooh03";						//哇 ！ 真 痛 快 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_3_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_3_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_3_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_3_ABS_COMMANDER";				//所 以 你 去 了 指 挥 官 那 里 ， 并 把 问 题 解 决 了 。
	ABS_MONASTERY										= "SVM_3_ABS_MONASTERY";				//所 以 你 去 帕 兰 神 父 那 里 赎 罪 。
	ABS_FARM											= "SVM_3_ABS_FARM";						//所 以 你 去 找 了 李 ， 并 将 事 情 理 顺 。
	ABS_GOOD											= "SVM_3_ABS_GOOD";						//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_3_SHEEPKILLER_CRIME";			//就 象 那 样 屠 杀 我 们 的 绵 羊 ！
	ATTACK_CRIME										= "SVM_3_ATTACK_CRIME";					//走 开 ， 你 这 个 丑 恶 的 畜 牲 ！
	THEFT_CRIME											= "SVM_3_THEFT_CRIME";					//走 开 ， 你 这 可 怜 的 小 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_3_PAL_CITY_CRIME";				//你 丢 了 修 道 会 的 脸 ！ 等 着 哈 根 勋 爵 听 说 这 些 事 吧 ！
	MIL_CITY_CRIME										= "SVM_3_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 等 着 安 德 烈 勋 爵 听 说 此 事 吧 ！
	CITY_CRIME											= "SVM_3_CITY_CRIME";					//等 到 哈 根 勋 爵 听 说 此 事 的 时 候 ！。
	// -------------------------
	MONA_CRIME											= "SVM_3_MONA_CRIME";					//等 到 帕 兰 神 父 听 说 此 事 的 时 候 ！
	FARM_CRIME											= "SVM_3_FARM_CRIME";					//等 到 李 听 到 风 声 的 时 候 … …
	OC_CRIME											= "SVM_3_OC_CRIME";						//等 到 指 挥 官 加 隆 德 听 说 此 事 的 时 候 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_3_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 是 更 厉 害 一 些 的 战 士 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_3_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 早 知 道 是 那 样 ， 现 在 ， 你 也 清 楚 我 们 之 间 谁 更 强 … … 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_3_TOUGHGUY_PLAYERATTACK";		//我 以 为 你 想 要 向 我 挑 战 。 你 改 变 主 意 了 吗 ？ 你 更 喜 欢 聊 天 ， 对 吗 ？ （ 大 笑 ）
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_3_GOLD_1000";					//1000金 币 。
	GOLD_950											= "SVM_3_GOLD_950";						//950枚 金 币 。
	GOLD_900											= "SVM_3_GOLD_900";						//900枚 金 币 。
	GOLD_850											= "SVM_3_GOLD_850";						//850枚 金 币 。
	GOLD_800											= "SVM_3_GOLD_800";						//800枚 金 币 。
	GOLD_750											= "SVM_3_GOLD_750";						//750枚 金 币 。
	GOLD_700											= "SVM_3_GOLD_700";						//700枚 金 币 。
	GOLD_650											= "SVM_3_GOLD_650";						//650枚 金 币 。
	GOLD_600											= "SVM_3_GOLD_600";						//600枚 金 币 。
	GOLD_550											= "SVM_3_GOLD_550";						//550枚 金 币 。
	GOLD_500											= "SVM_3_GOLD_500";						//500枚 金 币 。
	GOLD_450											= "SVM_3_GOLD_450";						//450枚 金 币 。
	GOLD_400											= "SVM_3_GOLD_400";						//400枚 金 币 。
	GOLD_350											= "SVM_3_GOLD_350";						//350枚 金 币 。
	GOLD_300											= "SVM_3_GOLD_300";						//300枚 金 币 。
	GOLD_250											= "SVM_3_GOLD_250";						//250枚 金 币 。
	GOLD_200											= "SVM_3_GOLD_200";						//200枚 金 币 。
	GOLD_150											= "SVM_3_GOLD_150";						//150枚 金 币 。
	GOLD_100											= "SVM_3_GOLD_100";						//100枚 金 币 。
	GOLD_90												= "SVM_3_GOLD_90";						//90枚 金 币 。
	GOLD_80												= "SVM_3_GOLD_80";						//80枚 金 币 。
	GOLD_70												= "SVM_3_GOLD_70";						//70枚 金 币 。
	GOLD_60												= "SVM_3_GOLD_60";						//60枚 金 币 。
	GOLD_50												= "SVM_3_GOLD_50";						//50枚 金 币 。
	GOLD_40												= "SVM_3_GOLD_40";						//40枚 金 币 。
	GOLD_30												= "SVM_3_GOLD_30";						//30枚 金 币 。
	GOLD_20												= "SVM_3_GOLD_20";						//20枚 金 币 。
	GOLD_10												= "SVM_3_GOLD_10";						//10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_3_Smalltalk01";					//… … 你 真 的 认 为 … …
	Smalltalk02											= "SVM_3_Smalltalk02";					//… … 万 事 皆 有 可 能 … …
	Smalltalk03											= "SVM_3_Smalltalk03";					//… … 他 应 该 了 解 的 更 清 楚 … …
	Smalltalk04											= "SVM_3_Smalltalk04";					//… … 似 乎 我 的 问 题 永 远 都 不 够 … …
	Smalltalk05											= "SVM_3_Smalltalk05";					//… … 谁 告 诉 你 那 些 … …
	Smalltalk06											= "SVM_3_Smalltalk06";					//… … 那 只 会 造 成 更 多 的 麻 烦 … …
	Smalltalk07											= "SVM_3_Smalltalk07";					//… … 已 经 有 了 各 种 各 样 的 谣 传 … …
	Smalltalk08											= "SVM_3_Smalltalk08";					//… … 我 永 远 不 会 去 想 … …
	Smalltalk09											= "SVM_3_Smalltalk09";					//… … 那 些 都 是 谣 传 … …
	Smalltalk10											= "SVM_3_Smalltalk10";					//… … 你 最 好 留 神 你 在 向 谁 谈 论 那 些 … …
	Smalltalk11											= "SVM_3_Smalltalk11";					//… … 我 应 该 早 点 告 诉 你 … …
	Smalltalk12											= "SVM_3_Smalltalk12";					//… … 从 来 没 有 人 问 过 我 … …
	Smalltalk13											= "SVM_3_Smalltalk13";					//… … 你 应 该 为 那 个 可 怜 人 感 到 悲 哀 … …
	Smalltalk14											= "SVM_3_Smalltalk14";					//… … 那 不 是 什 么 新 鲜 事 … …
	Smalltalk15											= "SVM_3_Smalltalk15";					//… … 那 显 而 易 见 … …
	Smalltalk16											= "SVM_3_Smalltalk16";					//… … 你 不 应 该 问 我 那 些 … …
	Smalltalk17											= "SVM_3_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_3_Smalltalk18";					//… … 你 已 经 知 道 我 在 想 什 么 了 … …
	Smalltalk19											= "SVM_3_Smalltalk19";					//… … 那 正 是 我 要 说 的 … …
	Smalltalk20											= "SVM_3_Smalltalk20";					//… … 那 是 无 可 变 更 的 … …
	Smalltalk21											= "SVM_3_Smalltalk21";					//… … 为 什 么 我 以 前 没 有 听 过 这 个 … …
	Smalltalk22											= "SVM_3_Smalltalk22";					//… … 让 我 们 等 等 看 会 发 生 什 么 … …
	Smalltalk23											= "SVM_3_Smalltalk23";					//… … 有 些 问 题 会 自 行 解 决 … …
	Smalltalk24											= "SVM_3_Smalltalk24";					//… … 我 不 想 再 听 到 那 些 了 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_3_Smalltalk25";					//… … 他 醉 倒 了 … …
	Smalltalk26											= "SVM_3_Smalltalk26";					//… … 我 不 应 该 受 到 那 样 的 待 遇 … …
	Smalltalk27											= "SVM_3_Smalltalk27";					//… … 他 们 都 像 兔 子 一 样 跑 了 ， 我 彻 底 孤 单 了 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_3_Smalltalk28";					//… … 圣 经 上 是 这 么 说 的 … …
	Smalltalk29											= "SVM_3_Smalltalk29";					//… … 我 一 直 都 是 以 英 诺 斯 之 名 行 事 … …
	Smalltalk30											= "SVM_3_Smalltalk30";					//… … 没 有 人 能 亵 渎 神 圣 的 修 道 会 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_3_NoLearnNoPoints";				//等 你 经 验 更 多 些 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_3_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_3_NoLearnYoureBetter";			//我 已 经 不 能 再 教 你 什 么 了 。 你 已 经 变 得 太 出 色 了 。
	YouLearnedSomething									= "SVM_3_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_3_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_3_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_3_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_3_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_3_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_3_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_3_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_3_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_3_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_3_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_3_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_3_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_3_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_3_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_3_TEMPEL_2_GALGEN";				//由 神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_3_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_3_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_3_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_3_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_3_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_3_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_3_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_3_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_3_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_3_Dead";							//啊 啊 啊 ！
	Aargh_1												= "SVM_3_Aargh_1";						//啊
	Aargh_2												= "SVM_3_Aargh_2";						//啊
	Aargh_3												= "SVM_3_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_3_Addon_WrongArmor";				//那 些 是 什 么 衣 服 ？ 它 们 根 本 不 适 合 你 。 走 开 。
	ADDON_WRONGARMOR_SLD								= "SVM_3_ADDON_WRONGARMOR_SLD";			//如 果 你 想 要 谈 话 ， 那 么 先 穿 上 一 些 得 体 的 衣 服 。
	ADDON_WRONGARMOR_MIL								= "SVM_3_ADDON_WRONGARMOR_MIL";			//我 们 士 兵 要 自 豪 地 穿 上 我 们 的 制 服 。 去 换 衣 服 。
	ADDON_WRONGARMOR_KDF								= "SVM_3_ADDON_WRONGARMOR_KDF";			//在 我 们 修 道 会 里 大 家 都 是 平 等 的 ， 所 以 我 们 都 穿 同 样 的 衣 服 。 去 换 衣 服 ！
	ADDON_NOARMOR_BDT									= "SVM_3_ADDON_ADDON_NOARMOR_BDT";		//你 一 定 是 刚 从 监 狱 里 出 来 的 吧 ， 先 给 你 自 己 找 套 象 样 的 衣 服 穿 。

	ADDON_DIEBANDIT										= "SVM_3_ADDON_DIEBANDIT";				//来 这 里 ， 你 这 个 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_3_ADDON_DIRTYPIRATE";			//来 这 里 ， 你 这 个 强 盗 ！
};

instance SVM_4(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_4_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_4_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_4_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_4_IGetYouStill";					//又 是 你 ！
	DieEnemy											= "SVM_4_DieEnemy";						//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_4_DieMonster";					//又 一 件 命 中 注 定 的 事 ！
	DirtyThief											= "SVM_4_DirtyThief";					//你 这 可 怜 的 小 贼 ！
	HandsOff											= "SVM_4_HandsOff";						//把 你 的 手 从 那 里 拿 开 ！
	SheepKiller											= "SVM_4_SheepKiller";					//嘿 ！ 别 碰 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_4_SheepKillerMonster";			//那 个 怪 物 在 吃 我 们 的 绵 羊！
	YouMurderer											= "SVM_4_YouMurderer";					//杀 人 犯 ！
	DieStupidBeast										= "SVM_4_DieStupidBeast";				//那 个 生 物 在 这 里 做 什 么 呢 ？
	YouDareHitMe										= "SVM_4_YouDareHitMe";					//你 现 在 要 倒 霉 了 ！
	YouAskedForIt										= "SVM_4_YouAskedForIt";				//你 自 讨 苦 吃 。！
	ThenIBeatYouOutOfHere								= "SVM_4_ThenIBeatYouOutOfHere";		//我 想 有 些 人 就 是 要 体 会 一 下 最 难 的 方 法 。
	WhatDidYouDoInThere									= "SVM_4_WhatDidYouDoInThere";			//你 想 在 那 里 得 到 什 么 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_4_WillYouStopFighting";			//马 上 停 下 ！？
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_4_KillEnemy";					//小 子 ！
	EnemyKilled											= "SVM_4_EnemyKilled";					//多 么 愚 蠢 的 混 蛋 … …
	MonsterKilled										= "SVM_4_MonsterKilled";				//好 吧 ， 就 给 你 那 么 多 了 ， 丑 恶 的 野 兽 ！
	ThiefDown											= "SVM_4_ThiefDown";					//从 现 在 起 把 你 的 爪 子 从 我 的 东 西 上 拿 开 - 明 白 了 吗 ？
	rumfummlerDown										= "SVM_4_rumfummlerDown";				//从 现 在 起 把 你 的 手 指 收 回 去 ！
	SheepAttackerDown									= "SVM_4_SheepAttackerDown";			//从 现 在 起 ， 不 要 用 你 肮 脏 的 爪 子 碰 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_4_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_4_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_4_NeverHitMeAgain";				//不 要 再 那 样 了 ， 老 兄 ！
	YouBetterShouldHaveListened							= "SVM_4_YouBetterShouldHaveListened";	//让 那 作 为 你 的 一 堂 课 。
	GetUpAndBeGone										= "SVM_4_GetUpAndBeGone";				//站 起 来 ， 然 后 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_4_NeverEnterRoomAgain";			//我 不 想 再 在 那 里 看 到 你 - 明 白 了 吗 ？
	ThereIsNoFightingHere								= "SVM_4_ThereIsNoFightingHere";		//我 就 是 打 遍 附 近 无 敌 手 ， 明 白 吗 ？
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_4_SpareMe";						//离 我 远 点 ！
	RunAway												= "SVM_4_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_4_Alarm";						//警 报 ！
	Guards												= "SVM_4_Guards";						//守 卫！
	Help												= "SVM_4_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_4_GoodMonsterKill";				//（ 呼 喊 ） 呀 ！ 你 就 只 能 做 那 样 的 事 吗 ！
	GoodKill											= "SVM_4_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_4_NOTNOW";						//离 我 远 点 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_4_RunCoward";					//（ 大 叫 ） 你 还 没 见 识 到 我 的 真 本 事 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_4_GetOutOfHere";					//出 去 ！
	WhyAreYouInHere										= "SVM_4_WhyAreYouInHere";				//你 在 这 里 有 什 么 事 ？ ！
	YesGoOutOfHere										= "SVM_4_YesGoOutOfHere";				//那 就 走 开 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_4_WhatsThisSupposedToBe";		//你 在 那 边 鬼 鬼 祟 祟 地 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_4_YouDisturbedMySlumber";		//（ 醒 来 ） 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_4_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_4_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_4_ITakeYourWeapon";				//我 想 我 最 好 拿 走 这 件 武 器 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_4_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_4_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 想 让 脸 上 挨 一 下 吗 ？

	StopMagic											= "SVM_4_StopMagic";					//马 上 停 止 这 个 低 能 魔 法 ！
	ISaidStopMagic										= "SVM_4_ISaidStopMagic";				//想 挨 鞭 子 吗 ？ 马 上 停 止 ！ ！
	WeaponDown											= "SVM_4_WeaponDown";					//丢 掉 那 件 武 器 ！
	ISaidWeaponDown										= "SVM_4_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_4_WiseMove";						//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_4_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_4_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_4_TheresAFight";					//（ 热 切 的 ） 啊 ， 打 架 ！
	OhMyGodItsAFight									= "SVM_4_OhMyGodItsAFight";				//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_4_GoodVictory";					//（ 邪 恶 的 笑 ） 你 让 他 知 道 谁 说 了 算 ！
	NotBad												= "SVM_4_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_4_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_4_CheerFriend01";				//好 ， 让 他 尝 尝 滋 味 ！
	CheerFriend02										= "SVM_4_CheerFriend02";				//让 他 看 看 ！
	CheerFriend03										= "SVM_4_CheerFriend03";				//干 掉 他 ！
	Ooh01												= "SVM_4_Ooh01";						//准 备 自 保 ！
	Ooh02												= "SVM_4_Ooh02";						//上 ， 反 击 ！
	Ooh03												= "SVM_4_Ooh03";						//哎 呦 ！ 那 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_4_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 该 死 ， 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_4_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_4_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_4_ABS_COMMANDER";				//这 么 看 来 指 挥 官 已 经 把 你 的 事 处 理 好 了 。
	ABS_MONASTERY										= "SVM_4_ABS_MONASTERY";				//这 么 看 来 帕 兰 神 父 已 经 宽 恕 了 你 的 罪 。
	ABS_FARM											= "SVM_4_ABS_FARM";						//我 听 说 李 已 经 解 决 了 你 的 问 题 。
	ABS_GOOD											= "SVM_4_ABS_GOOD";						//很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_4_SHEEPKILLER_CRIME";			//杀 了 这 么 多 的 绵 羊 ！ 走 开 ！
	ATTACK_CRIME										= "SVM_4_ATTACK_CRIME";					//你 是 一 个 恶 棍 - 滚 开 ！
	THEFT_CRIME											= "SVM_4_THEFT_CRIME";					//该 死 的 贼 ！ - 我 现 在 已 经 受 够 你 了 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_4_PAL_CITY_CRIME";				//我 太 寄 希 望 于 圣 骑 士 了 ！ 哈 根 勋 爵 不 会 高 兴 的 。
	MIL_CITY_CRIME										= "SVM_4_MIL_CITY_CRIME";				//象 你 这 样 的 人 是 怎 么 混 成 城 市 卫 兵 的 ？ 安 德 烈 勋 爵 会 让 你 赔 偿 这 一 切 的 ！
	CITY_CRIME											= "SVM_4_CITY_CRIME";					//安 德 烈 勋 爵 会 听 说 你 的 所 作 所 为 的 ！
	// -------------------------
	MONA_CRIME											= "SVM_4_MONA_CRIME";					//你 的 亵 渎 会 激 怒 帕 兰 神 父 的 ！
	FARM_CRIME											= "SVM_4_FARM_CRIME";					//李 不 会 让 你 逃 脱 处 罚 的 ！
	OC_CRIME											= "SVM_4_OC_CRIME";						//指 挥 官 加 隆 德 不 会 为 此 感 到 高 兴 的 - 你 将 会 受 到 处 罚 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_4_TOUGHGUY_ATTACKLOST";			//嗯 ， 相 当 漂 亮 的 一 拳 … … 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_4_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 有 问 题 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_4_TOUGHGUY_PLAYERATTACK";		//又 是 你 ！
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_4_GOLD_1000";					//1000枚 金 币。
	GOLD_950											= "SVM_4_GOLD_950";						//950枚 金 币。
	GOLD_900											= "SVM_4_GOLD_900";						//900枚 金 币。
	GOLD_850											= "SVM_4_GOLD_850";						//850枚 金 币 。
	GOLD_800											= "SVM_4_GOLD_800";						//800枚 金 币 。
	GOLD_750											= "SVM_4_GOLD_750";						//750枚 金 币 。
	GOLD_700											= "SVM_4_GOLD_700";						//700枚 金 币 。
	GOLD_650											= "SVM_4_GOLD_650";						//650枚 金 币 。
	GOLD_600											= "SVM_4_GOLD_600";						//600枚 金 币 。
	GOLD_550											= "SVM_4_GOLD_550";						//550枚 金 币 。
	GOLD_500											= "SVM_4_GOLD_500";						//500枚 金 币 。
	GOLD_450											= "SVM_4_GOLD_450";						//450枚 金 币 。
	GOLD_400											= "SVM_4_GOLD_400";						//400枚 金 币 。
	GOLD_350											= "SVM_4_GOLD_350";						//350枚 金 币 。
	GOLD_300											= "SVM_4_GOLD_300";						//300枚 金 币 。
	GOLD_250											= "SVM_4_GOLD_250";						//250枚 金 币 。
	GOLD_200											= "SVM_4_GOLD_200";						//200枚 金 币 。
	GOLD_150											= "SVM_4_GOLD_150";						//150枚 金 币 。
	GOLD_100											= "SVM_4_GOLD_100";						//100枚 金 币 。
	GOLD_90												= "SVM_4_GOLD_90";						//90枚 金 币 。
	GOLD_80												= "SVM_4_GOLD_80";						//80枚 金 币 。
	GOLD_70												= "SVM_4_GOLD_70";						//70枚 金 币 。
	GOLD_60												= "SVM_4_GOLD_60";						//60枚 金 币 。
	GOLD_50												= "SVM_4_GOLD_50";						//50枚 金 币 。
	GOLD_40												= "SVM_4_GOLD_40";						//40枚 金 币 。
	GOLD_30												= "SVM_4_GOLD_30";						//30枚 金 币 。
	GOLD_20												= "SVM_4_GOLD_20";						//20枚 金 币 。
	GOLD_10												= "SVM_4_GOLD_10";						//10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_4_Smalltalk01";					//… … 是 真 的 吗 … …
	Smalltalk02											= "SVM_4_Smalltalk02";					//… … 我 听 说 的 不 是 那 样 的 … …
	Smalltalk03											= "SVM_4_Smalltalk03";					//… … 别 告 诉 我 你 不 知 道 那 个 … …
	Smalltalk04											= "SVM_4_Smalltalk04";					//… … 这 些 天 来 ， 你 很 难 知 道 该 相 信 谁 … …
	Smalltalk05											= "SVM_4_Smalltalk05";					//… … 那 都 是 流 言 … …
	Smalltalk06											= "SVM_4_Smalltalk06";					//… … 我 并 不 比 自 己 强 多 少 … …
	Smalltalk07											= "SVM_4_Smalltalk07";					//… … 没 有 什 么 能 再 让 我 吃 惊 的 了 … …
	Smalltalk08											= "SVM_4_Smalltalk08";					//… … 那 真 的 不 关 我 的 事 … …
	Smalltalk09											= "SVM_4_Smalltalk09";					//… … 你 真 的 相 信 那 个 … …
	Smalltalk10											= "SVM_4_Smalltalk10";					//… … 没 人 能 从 我 这 里 学 到 任 何 东 西 … …
	Smalltalk11											= "SVM_4_Smalltalk11";					//… … 那 始 终 都 很 明 显 … …
	Smalltalk12											= "SVM_4_Smalltalk12";					//… … 他 听 了 错 误 的 人 的 话 … …
	Smalltalk13											= "SVM_4_Smalltalk13";					//… … 如 果 他 不 知 道 那 个 ， 我 不 能 帮 助 他 … …
	Smalltalk14											= "SVM_4_Smalltalk14";					//… … 我 不 会 告 诉 你 任 何 新 的 情 况 … …
	Smalltalk15											= "SVM_4_Smalltalk15";					//… … 他 永 远 不 会 自 己 想 到 那 些 … …
	Smalltalk16											= "SVM_4_Smalltalk16";					//… … 已 经 知 道 那 个 很 久 了 … …
	Smalltalk17											= "SVM_4_Smalltalk17";					//… … 那 是 很 糟 糕 的 事 情 … …
	Smalltalk18											= "SVM_4_Smalltalk18";					//… … 我 已 经 换 了 方 法 去 做 … …
	Smalltalk19											= "SVM_4_Smalltalk19";					//… … 我 完 全 同 意 你 … …
	Smalltalk20											= "SVM_4_Smalltalk20";					//… … 什 么 时 候 会 改 变 … …
	Smalltalk21											= "SVM_4_Smalltalk21";					//… … 我 永 远 也 不 知 道 … …
	Smalltalk22											= "SVM_4_Smalltalk22";					//… … 你 做 不 了 任 何 事 情 … …
	Smalltalk23											= "SVM_4_Smalltalk23";					//… … 那 不 会 让 我 吃 惊 … …
	Smalltalk24											= "SVM_4_Smalltalk24";					//… … 但 是 不 ， 你 坚 持 认 为 他 知 道 的 更 清 楚 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_4_Smalltalk25";					//… … 最 关 键 的 是 力 量 ， 所 以 不 要 告 诉 我 那 些 … …
	Smalltalk26											= "SVM_4_Smalltalk26";					//… … 他 甚 至 不 知 道 怎 么 握 住 剑 … …
	Smalltalk27											= "SVM_4_Smalltalk27";					//… … 是 的 ， 他 已 经 说 过 那 些 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_4_Smalltalk28";					//… … 一 定 有 人 要 为 此 付 出 代 价 … …
	Smalltalk29											= "SVM_4_Smalltalk29";					//… … 英 诺 斯 会 启 迪 所 有 那 些 承 认 他 的 智 慧 的 人 … …
	Smalltalk30											= "SVM_4_Smalltalk30";					//… … 正 义 终 将 获 胜 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_4_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_4_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_4_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_4_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_4_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_4_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_4_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_4_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_4_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_4_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_4_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_4_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_4_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_4_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_4_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_4_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_4_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_4_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_4_TEMPEL_2_GALGEN";				//由 神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_4_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_4_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_4_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_4_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_4_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_4_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_4_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_4_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_4_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_4_Dead";							//啊 啊 啊 ！
	Aargh_1												= "SVM_4_Aargh_1";						//啊
	Aargh_2												= "SVM_4_Aargh_2";						//啊
	Aargh_3												= "SVM_4_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_4_Addon_WrongArmor";				//首 先 穿 得 得 体 一 点 ， 然 后 我 们 再 谈 其 它 的 事 。
	ADDON_WRONGARMOR_SLD								= "SVM_4_ADDON_WRONGARMOR_SLD";			//如 果 你 想 和 我 交 谈 的 话 ， 你 最 好 先 穿 上 你 的 盔 甲 。
	ADDON_WRONGARMOR_MIL								= "SVM_4_ADDON_WRONGARMOR_MIL";			//没 有 人 给 过 你 我 们 的 盔 甲 吗 ？ 那 就 先 去 领 一 套 。
	ADDON_WRONGARMOR_KDF								= "SVM_4_ADDON_WRONGARMOR_KDF";			//你 的 袍 子 呢 ？ 去 换 衣 服 。 否 则 我 不 会 和 你 谈 话 。
	ADDON_NOARMOR_BDT									= "SVM_4_ADDON_ADDON_NOARMOR_BDT";		//你 是 多 么 可 怜 的 家 伙 啊 ？ 等 你 能 买 套 象 样 的 盔 甲 以 后 再 回 来 。

	ADDON_DIEBANDIT										= "SVM_4_ADDON_DIEBANDIT";				//又 一 个 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_4_ADDON_DIRTYPIRATE";			//你 这 个 卑 鄙 的 海 盗 ！
};

instance SVM_5(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_5_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_5_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_5_Weather";						//多 么 糟 糕 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_5_IGetYouStill";					//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_5_DieEnemy";						//你 现 在 要 倒 霉 了 ！
	DieMonster											= "SVM_5_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_5_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_5_HandsOff";						//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_5_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_5_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_5_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_5_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_5_YouDareHitMe";					//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_5_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_5_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_5_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_5_WillYouStopFighting";			//你 现 在 能 停 下 来 吗 ！ ？
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_5_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_5_EnemyKilled";					//够 你 受 的 ， 罪 犯。
	MonsterKilled										= "SVM_5_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_5_ThiefDown";					//永 远 不 要 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_5_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_5_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_5_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_5_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_5_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_5_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_5_GetUpAndBeGone";				//现 在 从 这 里 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_5_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_5_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_5_SpareMe";						//离 我 远 点 ！
	RunAway												= "SVM_5_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_5_Alarm";						//警 报 ！
	Guards												= "SVM_5_Guards";						//卫 兵 ！
	Help												= "SVM_5_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_5_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_5_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_5_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_5_RunCoward";					//（ 大 声 呼 叫 ） 住 手 ， 你 这 个 罪 犯 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_5_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_5_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_5_YesGoOutOfHere";				//嘿 ， 从 这 里 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_5_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_5_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_5_ITookYourGold";				//金 子 ！ 好 吧 ， 那 是 我 买 饲 料 的 … …
	ShitNoGold											= "SVM_5_ShitNoGold";					//你 身 上 没 有 一 分 钱 ？
	ITakeYourWeapon										= "SVM_5_ITakeYourWeapon";				//我 想 你 的 武 器 要 归 我 保 管 了 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_5_WhatAreYouDoing";				//（ 警 告 ） 嘿 ！ 小 心 ！
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_5_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 没 拿 够 ？！
	StopMagic											= "SVM_5_StopMagic";					//不 要 用 你 的 魔 法 打 我 ！
	ISaidStopMagic										= "SVM_5_ISaidStopMagic";				//停 止 那 个 魔 法 ！ 你 的 耳 朵 出 问 题 了 吗 ？
	WeaponDown											= "SVM_5_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_5_ISaidWeaponDown";				//你 是 聋 了 还 是 怎 么 ？ 我 说 ： 放 下 那 武 器 ！
	WiseMove											= "SVM_5_WiseMove";						//看 ， 那 并 不 难 。！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_5_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 我 们 会 调 查 那 里 … …
	OhMyHead											= "SVM_5_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_5_TheresAFight";					//（ 热 切 的 ） 现 在 该 采 取 一 些 行 动 了 ！
	OhMyGodItsAFight									= "SVM_5_OhMyGodItsAFight";				//（ 沮 丧 的 ） 但 是 他 们 正 互 相 粉 碎 彼 此 的 骨 头 … …
	GoodVictory											= "SVM_5_GoodVictory";					//（ 邪 恶 的 笑 ） 他 罪 有 应 得 ！。
	NotBad												= "SVM_5_NotBad";						//（ 满 意 的 ） 还 不 坏 … …
	OhMyGodHesDown										= "SVM_5_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 粗 鲁 的 家 伙 … …
	CheerFriend01										= "SVM_5_CheerFriend01";				//对 ， 那 是 正 确 的 做 法 ！
	CheerFriend02										= "SVM_5_CheerFriend02";				//你 在 等 什 么 ？！
	CheerFriend03										= "SVM_5_CheerFriend03";				//打 呀 小 子 ！
	Ooh01												= "SVM_5_Ooh01";						//什 么 都 不 许 动 ！
	Ooh02												= "SVM_5_Ooh02";						//让 他 看 看 谁 是 这 里 的 头 儿 ！
	Ooh03												= "SVM_5_Ooh03";						//该 死 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_5_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_5_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_5_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_5_ABS_COMMANDER";				//我 听 说 你 去 了 指 挥 官 那 里 ， 并 把 事 情 解 决 了 。
	ABS_MONASTERY										= "SVM_5_ABS_MONASTERY";				//我 听 说 你 去 帕 兰 神 父 那 里 做 了 忏 悔 。
	ABS_FARM											= "SVM_5_ABS_FARM";						//我 听 说 你 去 李 那 里 把 事 情 摆 平 了 。
	ABS_GOOD											= "SVM_5_ABS_GOOD";						//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_5_SHEEPKILLER_CRIME";			//竟 然 在 屠 杀 我 们 的 绵 羊 ！ 滚 开 ， 破 坏 者 ！
	ATTACK_CRIME										= "SVM_5_ATTACK_CRIME";					//我 不 和 卑 鄙 的 无 赖 说 话 ！
	THEFT_CRIME											= "SVM_5_THEFT_CRIME";					//滚 出 我 的 视 线 ， 你 这 个 肮 脏 的 盗 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_5_PAL_CITY_CRIME";				//你 在 给 你 们 的 修 道 会 丢 脸 ！ 哈 根 勋 爵 会 狂 怒 的 ！
	MIL_CITY_CRIME										= "SVM_5_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 安 德 烈 勋 爵 会 教 你 一 些 礼 节 ！
	CITY_CRIME											= "SVM_5_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 说 你 所 做 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_5_MONA_CRIME";					//帕 兰 神 父 听 到 这 种 亵 渎 行 为 后 绝 对 不 会 高 兴 ！
	FARM_CRIME											= "SVM_5_FARM_CRIME";					//李 会 教 训 你 的 ！ 你 会 看 到 后 果 的 ！
	OC_CRIME											= "SVM_5_OC_CRIME";						//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_5_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_5_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 需 要 我 告 诉 你 谁 说 了 算 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_5_TOUGHGUY_PLAYERATTACK";		//你 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_5_GOLD_1000";					//1000金 币 。
	GOLD_950											= "SVM_5_GOLD_950";						//950金 币 。
	GOLD_900											= "SVM_5_GOLD_900";						//900金 币 。
	GOLD_850											= "SVM_5_GOLD_850";						//800金 币 。
	GOLD_800											= "SVM_5_GOLD_800";						//800金 币 。
	GOLD_750											= "SVM_5_GOLD_750";						//750金 币 。
	GOLD_700											= "SVM_5_GOLD_700";						//700金 币 。
	GOLD_650											= "SVM_5_GOLD_650";						//650金 币 。
	GOLD_600											= "SVM_5_GOLD_600";						//600金 币 。
	GOLD_550											= "SVM_5_GOLD_550";						//550金 币 。
	GOLD_500											= "SVM_5_GOLD_500";						//500金 币 。
	GOLD_450											= "SVM_5_GOLD_450";						//450金 币 。
	GOLD_400											= "SVM_5_GOLD_400";						//400金 币 。
	GOLD_350											= "SVM_5_GOLD_350";						//350金 币 。
	GOLD_300											= "SVM_5_GOLD_300";						//300金 币 。
	GOLD_250											= "SVM_5_GOLD_250";						//250金 币 。
	GOLD_200											= "SVM_5_GOLD_200";						//200金 币 。
	GOLD_150											= "SVM_5_GOLD_150";						//150金 币 。
	GOLD_100											= "SVM_5_GOLD_100";						//100金 币 。
	GOLD_90												= "SVM_5_GOLD_90";						//90金 币 。
	GOLD_80												= "SVM_5_GOLD_80";						//80金 币 。
	GOLD_70												= "SVM_5_GOLD_70";						//70金 币 。
	GOLD_60												= "SVM_5_GOLD_60";						//60金 币 。
	GOLD_50												= "SVM_5_GOLD_50";						//50金 币 。
	GOLD_40												= "SVM_5_GOLD_40";						//40金 币 。
	GOLD_30												= "SVM_5_GOLD_30";						//30金 币 。
	GOLD_20												= "SVM_5_GOLD_20";						//20金 币 。
	GOLD_10												= "SVM_5_GOLD_10";						//10金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_5_Smalltalk01";					//… … 你 真 的 认 为 … …
	Smalltalk02											= "SVM_5_Smalltalk02";					//… … 万 事 皆 有 可 能 … …
	Smalltalk03											= "SVM_5_Smalltalk03";					//… … 他 应 该 了 解 的 更 清 楚 … …
	Smalltalk04											= "SVM_5_Smalltalk04";					//… … 似 乎 我 的 问 题 永 远 都 不 够 … …
	Smalltalk05											= "SVM_5_Smalltalk05";					//… … 谁 告 诉 你 那 些 … …
	Smalltalk06											= "SVM_5_Smalltalk06";					//… … 那 只 会 造 成 更 多 的 麻 烦 … …
	Smalltalk07											= "SVM_5_Smalltalk07";					//… … 已 经 有 了 各 种 各 样 的 谣 传 … …
	Smalltalk08											= "SVM_5_Smalltalk08";					//… … 我 真 应 该 做 完 那 个 … …
	Smalltalk09											= "SVM_5_Smalltalk09";					//… … 那 些 都 是 谣 传 … …
	Smalltalk10											= "SVM_5_Smalltalk10";					//… … 最 好 弄 清 楚 你 在 和 谁 说 什 么 … …
	Smalltalk11											= "SVM_5_Smalltalk11";					//… … 我 应 该 早 点 告 诉 你 … …
	Smalltalk12											= "SVM_5_Smalltalk12";					//… … 从 来 没 有 人 问 过 我 … …
	Smalltalk13											= "SVM_5_Smalltalk13";					//… … 你 应 该 为 那 个 可 怜 人 感 到 悲 哀 … …
	Smalltalk14											= "SVM_5_Smalltalk14";					//… … 那 不 是 什 么 新 鲜 事 … …
	Smalltalk15											= "SVM_5_Smalltalk15";					//… … 那 显 而 易 见 … …
	Smalltalk16											= "SVM_5_Smalltalk16";					//… … 你 不 应 该 问 我 那 些 … …
	Smalltalk17											= "SVM_5_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_5_Smalltalk18";					//… … 你 已 经 知 道 我 在 想 什 么 了 … …
	Smalltalk19											= "SVM_5_Smalltalk19";					//… … 那 就 是 我 要 说 的 … …
	Smalltalk20											= "SVM_5_Smalltalk20";					//… … 那 是 无 可 变 更 的 … …
	Smalltalk21											= "SVM_5_Smalltalk21";					//… … 为 什 么 我 以 前 没 有 听 过 这 个 … …
	Smalltalk22											= "SVM_5_Smalltalk22";					//… … 让 我 们 等 等 看 会 发 生 什 么 … …
	Smalltalk23											= "SVM_5_Smalltalk23";					//… … 有 些 问 题 会 自 行 解 决 … …
	Smalltalk24											= "SVM_5_Smalltalk24";					//… … 我 不 想 再 听 到 那 些 了 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_5_Smalltalk25";					//… … 他 醉 倒 了 … …
	Smalltalk26											= "SVM_5_Smalltalk26";					//… … 我 不 应 该 受 到 那 样 的 待 遇 … …
	Smalltalk27											= "SVM_5_Smalltalk27";					//… … 他 们 都 像 兔 子 一 样 跑 了 ， 我 彻 底 孤 单 了 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_5_Smalltalk28";					//… … 圣 经 上 是 这 么 说 的 … …
	Smalltalk29											= "SVM_5_Smalltalk29";					//… … 我 一 直 都 是 以 英 诺 斯 之 名 行 事 … …
	Smalltalk30											= "SVM_5_Smalltalk30";					//… … 没 有 人 能 亵 渎 神 圣 的 修 道 会 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_5_NoLearnNoPoints";				//等 你 经 验 更 多 些 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_5_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_5_NoLearnYoureBetter";			//我 已 经 不 能 再 教 你 什 么 了 。 你 已 经 变 得 太 出 色 了 。
	YouLearnedSomething									= "SVM_5_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_5_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_5_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_5_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_5_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_5_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_5_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_5_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_5_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_5_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_5_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_5_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_5_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_5_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_5_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_5_TEMPEL_2_GALGEN";				//由 神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_5_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_5_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_5_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_5_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_5_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_5_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_5_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_5_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_5_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_5_Dead";							//啊 啊 啊 ！
	Aargh_1												= "SVM_5_Aargh_1";						//啊
	Aargh_2												= "SVM_5_Aargh_2";						//啊
	Aargh_3												= "SVM_5_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_5_Addon_WrongArmor";				//首 先 穿 点 得 体 的 衣 服 。
	ADDON_WRONGARMOR_SLD								= "SVM_5_ADDON_WRONGARMOR_SLD";			//你 穿 的 是 什 么 ？ 你 不 再 是 我 们 一 员 了 吗 ？ 那 样 的 话 ， 我 不 会 与 你 做 任 何 事 。
	ADDON_WRONGARMOR_MIL								= "SVM_5_ADDON_WRONGARMOR_MIL";			//我 们 战 士 为 了 国 王 而 战 ， 所 以 你 最 好 穿 上 他 的 盔 甲 。
	ADDON_WRONGARMOR_KDF								= "SVM_5_ADDON_WRONGARMOR_KDF";			//如 果 你 不 穿 的 话 ， 为 什 么 修 道 会 还 要 给 你 衣 服 呢 ？ 好 好 想 想 吧 。
	ADDON_NOARMOR_BDT									= "SVM_5_ADDON_ADDON_NOARMOR_BDT";		//你 真 蠢 货 ？ 你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 。

	ADDON_DIEBANDIT										= "SVM_5_ADDON_DIEBANDIT";				//啊 ， 一 个 强 盗 。
	ADDON_DIRTYPIRATE									= "SVM_5_ADDON_DIRTYPIRATE";			//我 会 把 你 撕 成 碎 片 ， 海 盗 ！
};

instance SVM_6(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_6_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_6_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_6_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_6_IGetYouStill";					//我 现 在 要 抓 住 你 ！
	DieEnemy											= "SVM_6_DieEnemy";						//你 不 应 该 来 到 这 里 ！
	DieMonster											= "SVM_6_DieMonster";					//来 这 里 ， 该 死 的 野 兽 ！
	DirtyThief											= "SVM_6_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_6_HandsOff";						//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_6_SheepKiller";					//离 开 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_6_SheepKillerMonster";			//离 我 们 的 绵 羊 远 点 ， 你 这 个 畜 牲 ！
	YouMurderer											= "SVM_6_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_6_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_6_YouDareHitMe";					//你 将 会 后 悔 这 么 做 ！
	YouAskedForIt										= "SVM_6_YouAskedForIt";				//不 像 是 我 没 有 警 告 你 !
	ThenIBeatYouOutOfHere								= "SVM_6_ThenIBeatYouOutOfHere";		//嘿 ， 滚 出 去 ！
	WhatDidYouDoInThere									= "SVM_6_WhatDidYouDoInThere";			//嘿 ！ 你 在 那 里 想 要 做 什 么 ？
	WillYouStopFighting									= "SVM_6_WillYouStopFighting";			//停 下 ！ 马 上 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_6_KillEnemy";					//我 要 把 你 刺 穿 ， 你 这 个 混 蛋 ！
	EnemyKilled											= "SVM_6_EnemyKilled";					//够 你 受 的 … …
	MonsterKilled										= "SVM_6_MonsterKilled";				//嘿 ， 我 已 经 抓 住 它 了 ！
	ThiefDown											= "SVM_6_ThiefDown";					//我 在 警 告 你 ！ 不 要 再 那 样 了 ， 你 这 丑 恶 的 小 偷 ！
	rumfummlerDown										= "SVM_6_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_6_SheepAttackerDown";			//从 现 在 起 离 我 们 的 绵 羊 远 点 ！
	KillMurderer										= "SVM_6_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_6_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_6_NeverHitMeAgain";				//看 你 还 敢 再 袭 击 我 ！
	YouBetterShouldHaveListened							= "SVM_6_YouBetterShouldHaveListened";	//不 像 是 我 没 有 警 告 你 !
	GetUpAndBeGone										= "SVM_6_GetUpAndBeGone";				//现 在 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_6_NeverEnterRoomAgain";			//我 不 想 再 次 看 到 你 在 那 里 ， 懂 吗 ？
	ThereIsNoFightingHere								= "SVM_6_ThereIsNoFightingHere";		//这 里 不 能 打 架 。 那 就 是 给 你 上 的 一 堂 课 。
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_6_SpareMe";						//别 耍 花 招 ！
	RunAway												= "SVM_6_RunAway";						//我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_6_Alarm";						//警 报 ！
	Guards												= "SVM_6_Guards";						//卫 兵 ！
	Help												= "SVM_6_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_6_GoodMonsterKill";				//（ 呼 喊 ） 把 那 些 野 兽 送 上 天 国 ！
	GoodKill											= "SVM_6_GoodKill";						//（ 呼 喊 ） 对 ， 好 好 教 训 那 个 混 蛋 一 下 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_6_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_6_RunCoward";					//（ 大 声 呼 叫 ） 我 一 定 会 抓 住 你 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_6_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_6_WhyAreYouInHere";				//你 在 这 里 没 有 什 么 事 ！
	YesGoOutOfHere										= "SVM_6_YesGoOutOfHere";				//对 ， 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_6_WhatsThisSupposedToBe";		//你 在 等 什 么 ？ 这 样 鬼 鬼 祟 祟 的 要 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_6_YouDisturbedMySlumber";		//（ 醒 来 ） 该 死 ， 你 想 要 做 什 么 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_6_ITookYourGold";				//嗯 ， 至 少 你 身 上 还 有 些 钱 !
	ShitNoGold											= "SVM_6_ShitNoGold";					//一 个 金 币 都 没 有 - 呸 。
	ITakeYourWeapon										= "SVM_6_ITakeYourWeapon";				//我 想 我 可 以 拿 走 你 的 武 器 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_6_WhatAreYouDoing";				//（ 警 告 ） 小 子 ！ 你 还 想 再 来 一 次 吗 !
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_6_LookingForTroubleAgain";		//（ 挑 衅 的 ） 还 想 再 被 修 理 一 顿 ？
	StopMagic											= "SVM_6_StopMagic";					//停 止 那 个 魔 法 ！
	ISaidStopMagic										= "SVM_6_ISaidStopMagic";				//最 后 警 告 ！ 停 止 那 个 魔 法 ！
	WeaponDown											= "SVM_6_WeaponDown";					//把 武 器 放 下 ！
	ISaidWeaponDown										= "SVM_6_ISaidWeaponDown";				//把 那 个 放 下 ， 否 则 吃 不 了 兜 着 走 ！
	WiseMove											= "SVM_6_WiseMove";						//嘿 ， 你 并 不 象 看 起 来 那 么 傻 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_6_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 你 还 想 再 试 一 次 的 话 … …
	OhMyHead											= "SVM_6_OhMyHead";						//（ 自 言 自 语 ） 哦 ！ 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_6_TheresAFight";					//（ 贪 婪 的 ） 现 在 好 戏 上 场 … …
	OhMyGodItsAFight									= "SVM_6_OhMyGodItsAFight";				//（ 沮 丧 的 ） 哦 ， 我 的 天 啊 … …
	GoodVictory											= "SVM_6_GoodVictory";					//（ 邪 恶 的 笑 ） 教 训 他 一 下 … …
	NotBad												= "SVM_6_NotBad";						//（ 满 意 的 ） 真 痛 快 ！
	OhMyGodHesDown										= "SVM_6_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 卑 劣 的 畜 牲 ！
	CheerFriend01										= "SVM_6_CheerFriend01";				//用 力 打 他 ！
	CheerFriend02										= "SVM_6_CheerFriend02";				//现 在 不 要 停 ！
	CheerFriend03										= "SVM_6_CheerFriend03";				//干 掉 他 ！
	Ooh01												= "SVM_6_Ooh01";						//留 神 ！
	Ooh02												= "SVM_6_Ooh02";						//格 挡 ！
	Ooh03												= "SVM_6_Ooh03";						//该 死 ， 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_6_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_6_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_6_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_6_ABS_COMMANDER";				//那 么 说 指 挥 官 把 你 的 事 摆 平 了 。
	ABS_MONASTERY										= "SVM_6_ABS_MONASTERY";				//帕 兰 神 父 宽 恕 了 你 的 罪 行 。
	ABS_FARM											= "SVM_6_ABS_FARM";						//那 么 说 你 已 经 去 李 那 里 把 事 情 解 决 了 。
	ABS_GOOD											= "SVM_6_ABS_GOOD";						//好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_6_SHEEPKILLER_CRIME";			//你 在 攻 击 绵 羊 ？ 我 想 你 是 找 不 到 其 它 更 无 力 抵 抗 的 牺 牲 品 了 吧 ？
	ATTACK_CRIME										= "SVM_6_ATTACK_CRIME";					//对 那 些 下 流 的 恶 棍 来 说 ， 我 做 不 了 什 么 ！
	THEFT_CRIME											= "SVM_6_THEFT_CRIME";					//对 那 些 盗 贼 来 说 ， 我 做 不 了 任 何 事 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_6_PAL_CITY_CRIME";				//你 想 要 成 为 一 名 圣 骑 士 ？ 先 听 听 哈 根 勋 爵 对 此 事 的 看 法 ！
	MIL_CITY_CRIME										= "SVM_6_MIL_CITY_CRIME";				//你 真 的 属 于 城 市 卫 兵 ？ 安 德 烈 勋 爵 不 会 容 忍 那 样 的 人 ！
	CITY_CRIME											= "SVM_6_CITY_CRIME";					//趁 着 你 还 能 走 ， 赶 快 去 安 德 烈 勋 爵 那 里 吧 。
	// -------------------------
	MONA_CRIME											= "SVM_6_MONA_CRIME";					//去 找 帕 兰 神 父 。 他 将 会 帮 助 你 偿 还 你 的 罪 恶 ！
	FARM_CRIME											= "SVM_6_FARM_CRIME";					//李 很 快 就 会 听 说 此 事 ， 你 要 付 出 代 价 。！
	OC_CRIME											= "SVM_6_OC_CRIME";						//指 挥 官 加 隆 德 不 会 感 到 愉 快 的 。 你 最 好 在 事 态 变 得 更 糟 糕 之 前 去 和 他 谈 谈 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_6_TOUGHGUY_ATTACKLOST";			//好 吧 - 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_6_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 想 你 现 在 知 道 了 正 在 和 谁 打 交 道 。 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_6_TOUGHGUY_PLAYERATTACK";		//又 是 你 ？ 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_6_GOLD_1000";					//1000金 币 。
	GOLD_950											= "SVM_6_GOLD_950";						//950金 币 。
	GOLD_900											= "SVM_6_GOLD_900";						//900金 币 。
	GOLD_850											= "SVM_6_GOLD_850";						//850金 币 。
	GOLD_800											= "SVM_6_GOLD_800";						//800金 币 。
	GOLD_750											= "SVM_6_GOLD_750";						//750金 币 。
	GOLD_700											= "SVM_6_GOLD_700";						//700金 币 。
	GOLD_650											= "SVM_6_GOLD_650";						//650金 币 。
	GOLD_600											= "SVM_6_GOLD_600";						//600金 币 。
	GOLD_550											= "SVM_6_GOLD_550";						//550金 币 。
	GOLD_500											= "SVM_6_GOLD_500";						//500金 币 。
	GOLD_450											= "SVM_6_GOLD_450";						//450金 币 。
	GOLD_400											= "SVM_6_GOLD_400";						//400金 币 。
	GOLD_350											= "SVM_6_GOLD_350";						//350金 币 。
	GOLD_300											= "SVM_6_GOLD_300";						//300金 币 。
	GOLD_250											= "SVM_6_GOLD_250";						//250金 币 。
	GOLD_200											= "SVM_6_GOLD_200";						//200金 币 。
	GOLD_150											= "SVM_6_GOLD_150";						//150金 币 。
	GOLD_100											= "SVM_6_GOLD_100";						//100金 币 。
	GOLD_90												= "SVM_6_GOLD_90";						//90金 币 。
	GOLD_80												= "SVM_6_GOLD_80";						//80金 币 。
	GOLD_70												= "SVM_6_GOLD_70";						//70金 币 。
	GOLD_60												= "SVM_6_GOLD_60";						//60金 币 。
	GOLD_50												= "SVM_6_GOLD_50";						//50金 币 。
	GOLD_40												= "SVM_6_GOLD_40";						//40金 币 。
	GOLD_30												= "SVM_6_GOLD_30";						//30金 币 。
	GOLD_20												= "SVM_6_GOLD_20";						//20金 币 。
	GOLD_10												= "SVM_6_GOLD_10";						//10金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_6_Smalltalk01";					//… … 我 简 直 不 能 相 信 … …
	Smalltalk02											= "SVM_6_Smalltalk02";					//… … 我 不 十 分 肯 定 … …
	Smalltalk03											= "SVM_6_Smalltalk03";					//… … 但 是 他 都 知 道 了 … …
	Smalltalk04											= "SVM_6_Smalltalk04";					//… … 我 几 乎 不 知 道 还 能 相 信 什 么 … …
	Smalltalk05											= "SVM_6_Smalltalk05";					//… … 我 不 知 道 他 为 什 么 会 这 么 激 动 … …
	Smalltalk06											= "SVM_6_Smalltalk06";					//… … 我 已 经 陷 入 太 多 的 麻 烦 中 了 … …
	Smalltalk07											= "SVM_6_Smalltalk07";					//… … 我 已 经 听 说 了 一 些 事 … …
	Smalltalk08											= "SVM_6_Smalltalk08";					//… … 我 不 会 去 碰 那 个 … …
	Smalltalk09											= "SVM_6_Smalltalk09";					//… … 你 一 定 不 要 相 信 你 听 到 的 所 有 事 情 … …
	Smalltalk10											= "SVM_6_Smalltalk10";					//… … 他 不 是 从 我 那 里 得 到 那 个 的 … …
	Smalltalk11											= "SVM_6_Smalltalk11";					//… … 我 已 经 想 得 很 多 … …
	Smalltalk12											= "SVM_6_Smalltalk12";					//… … 从 来 没 人 征 求 过 我 的 意 见 … …
	Smalltalk13											= "SVM_6_Smalltalk13";					//… … 他 真 的 不 应 该 得 到 那 个 … …
	Smalltalk14											= "SVM_6_Smalltalk14";					//… … 不 要 说 你 不 知 道 那 个 … …
	Smalltalk15											= "SVM_6_Smalltalk15";					//… … 那 非 常 明 显 … …
	Smalltalk16											= "SVM_6_Smalltalk16";					//… … 那 么 你 是 从 哪 里 见 到 的 那 个 … …
	Smalltalk17											= "SVM_6_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_6_Smalltalk18";					//… … 关 于 那 件 事 我 有 自 己 的 看 法 … …
	Smalltalk19											= "SVM_6_Smalltalk19";					//… … 就 象 你 说 的 那 样 … …
	Smalltalk20											= "SVM_6_Smalltalk20";					//… … 我 不 相 信 这 会 改 变 … …
	Smalltalk21											= "SVM_6_Smalltalk21";					//… … 那 是 我 第 一 次 听 说 它 … …
	Smalltalk22											= "SVM_6_Smalltalk22";					//… … 我 们 只 能 等 着 看 … …
	Smalltalk23											= "SVM_6_Smalltalk23";					//… … 我 知 道 那 会 是 个 问 题 … …
	Smalltalk24											= "SVM_6_Smalltalk24";					//… … 那 么 他 们 为 什 么 不 听 我 的 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_6_Smalltalk25";					//… … 他 跑 起 来 就 像 是 贝 利 尔 在 后 面 追 他 一 样 … …
	Smalltalk26											= "SVM_6_Smalltalk26";					//… … 当 然 我 们 最 后 抓 住 了 他 … …
	Smalltalk27											= "SVM_6_Smalltalk27";					//… … 你 必 须 插 手 帮 忙 ， 并 把 事 情 处 理 好 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_6_Smalltalk28";					//… … 有 人 根 本 不 知 道 他 们 有 多 么 邪 恶 … …
	Smalltalk29											= "SVM_6_Smalltalk29";					//… … 那 是 英 诺 斯 的 意 愿 … …
	Smalltalk30											= "SVM_6_Smalltalk30";					//… … 他 的 行 为 是 正 义 的 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_6_NoLearnNoPoints";				//等 你 经 验 更 多 些 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_6_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_6_NoLearnYoureBetter";			//我 已 经 不 能 再 教 你 什 么 了 。 你 已 经 变 得 太 出 色 了 。
	YouLearnedSomething									= "SVM_6_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_6_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_6_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_6_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_6_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_6_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_6_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_6_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_6_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_6_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_6_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_6_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_6_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_6_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_6_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_6_TEMPEL_2_GALGEN";				//由 神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_6_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_6_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_6_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_6_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_6_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_6_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_6_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_6_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_6_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_6_Dead";							//啊 啊 啊 ！
	Aargh_1												= "SVM_6_Aargh_1";						//啊
	Aargh_2												= "SVM_6_Aargh_2";						//啊
	Aargh_3												= "SVM_6_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_6_Addon_WrongArmor";				//你 那 样 的 打 扮 很 可 笑 。 穿 上 一 些 得 体 的 衣 服 。
	ADDON_WRONGARMOR_SLD								= "SVM_6_ADDON_WRONGARMOR_SLD";			//别 以 为 我 认 不 出 你 。 出 去 换 衣 服 。
	ADDON_WRONGARMOR_MIL								= "SVM_6_ADDON_WRONGARMOR_MIL";			//士 兵 。 那 是 什 么 衣 服 ？ 去 换 掉 ， 马 上 去 ！
	ADDON_WRONGARMOR_KDF								= "SVM_6_ADDON_WRONGARMOR_KDF";			//英 诺 斯 的 仆 人 不 用 掩 盖 他 自 己 。 去 换 你 的 袍 子 。
	ADDON_NOARMOR_BDT									= "SVM_6_ADDON_ADDON_NOARMOR_BDT";		//你 四 处 乱 跑 就 象 一 个 挖 掘 工 。 先 去 换 一 身 衣 服 。

	ADDON_DIEBANDIT										= "SVM_6_ADDON_DIEBANDIT";				//你 找 错 对 象 挑 战 了 ， 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_6_ADDON_DIRTYPIRATE";			//回 海 上 去 ， 海 盗 ！
};

instance SVM_7(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_7_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_7_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_7_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_7_IGetYouStill";					//又 是 你 ！
	DieEnemy											= "SVM_7_DieEnemy";						//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_7_DieMonster";					//又 一 件 命 中 注 定 的 事 ！
	DirtyThief											= "SVM_7_DirtyThief";					//你 这 个 可 怜 的 小 偷 ！
	HandsOff											= "SVM_7_HandsOff";						//把 你 的 手 从 那 里 拿 开 ！
	SheepKiller											= "SVM_7_SheepKiller";					//嘿 ！ 别 碰 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_7_SheepKillerMonster";			//那 个 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_7_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_7_DieStupidBeast";				//那 个 生 物 在 这 里 做 什 么 呢 ？
	YouDareHitMe										= "SVM_7_YouDareHitMe";					//你 现 在 要 倒 霉 了 ！
	YouAskedForIt										= "SVM_7_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_7_ThenIBeatYouOutOfHere";		//我 想 有 些 人 就 是 要 体 会 一 下 最 难 的 方 法 。
	WhatDidYouDoInThere									= "SVM_7_WhatDidYouDoInThere";			//你 想 在 那 里 得 到 什 么 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_7_WillYouStopFighting";			//马 上 停 下 ！？
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_7_KillEnemy";					//去 死 吧 ！
	EnemyKilled											= "SVM_7_EnemyKilled";					//多 么 愚 蠢 的 混 蛋 … …
	MonsterKilled										= "SVM_7_MonsterKilled";				//好 吧 ， 就 给 你 那 么 多 了 ， 丑 恶 的 野 兽 ！
	ThiefDown											= "SVM_7_ThiefDown";					//从 现 在 起 把 你 的 爪 子 从 我 的 东 西 上 拿 开 - 明 白 了 吗 ？
	rumfummlerDown										= "SVM_7_rumfummlerDown";				//从 现 在 起 把 你 的 手 指 收 回 去 ！
	SheepAttackerDown									= "SVM_7_SheepAttackerDown";			//从 现 在 起 ， 不 要 用 你 肮 脏 的 爪 子 碰 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_7_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_7_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_7_NeverHitMeAgain";				//不 要 再 那 样 了 ， 小 子 ！
	YouBetterShouldHaveListened							= "SVM_7_YouBetterShouldHaveListened";	//让 那 作 为 你 的 一 堂 课 。
	GetUpAndBeGone										= "SVM_7_GetUpAndBeGone";				//站 起 来 ， 然 后 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_7_NeverEnterRoomAgain";			//我 不 想 再 在 那 里 看 到 你 - 明 白 了 吗 ？
	ThereIsNoFightingHere								= "SVM_7_ThereIsNoFightingHere";		//我 就 是 打 遍 附 近 无 敌 手 ， 明 白 吗 ？
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_7_SpareMe";						//离 我 远 点 ！
	RunAway												= "SVM_7_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_7_Alarm";						//警 报 ！
	Guards												= "SVM_7_Guards";						//卫 兵 ！
	Help												= "SVM_7_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_7_GoodMonsterKill";				//（ 呼 喊 ） 呀 ！ 你 就 只 能 做 那 样 的 事 吗 ！
	GoodKill											= "SVM_7_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_7_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_7_RunCoward";					//（ 大 叫 ） 你 还 没 见 识 到 我 的 真 本 事 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_7_GetOutOfHere";					//出 去 ！
	WhyAreYouInHere										= "SVM_7_WhyAreYouInHere";				//你 在 这 里 有 什 么 事 ？ ！
	YesGoOutOfHere										= "SVM_7_YesGoOutOfHere";				//那 就 走 开 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_7_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_7_YouDisturbedMySlumber";		//（ 醒 来 ） 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_7_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_7_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_7_ITakeYourWeapon";				//我 想 我 最 好 拿 走 这 件 武 器 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_7_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_7_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 想 让 脸 上 挨 一 下 吗 ？

	StopMagic											= "SVM_7_StopMagic";					//马 上 停 止 这 个 低 能 魔 法 ！
	ISaidStopMagic										= "SVM_7_ISaidStopMagic";				//想 挨 鞭 子 吗 ？ 马 上 停 止 ！ ！ ！
	WeaponDown											= "SVM_7_WeaponDown";					//丢 掉 那 件 武 器 ！
	ISaidWeaponDown										= "SVM_7_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_7_WiseMove";						//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_7_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_7_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_7_TheresAFight";					//（ 热 切 的 ） 啊 ， 打 架 ！
	OhMyGodItsAFight									= "SVM_7_OhMyGodItsAFight";				//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_7_GoodVictory";					//（ 邪 恶 的 笑 ） 你 让 他 知 道 谁 说 了 算 ！
	NotBad												= "SVM_7_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_7_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_7_CheerFriend01";				//好 ， 让 他 尝 尝 滋 味 ！
	CheerFriend02										= "SVM_7_CheerFriend02";				//让 他 看 看 ！
	CheerFriend03										= "SVM_7_CheerFriend03";				//让 他 尝 尝 滋 味 ！
	Ooh01												= "SVM_7_Ooh01";						//准 备 自 保 ！
	Ooh02												= "SVM_7_Ooh02";						//上 ， 反 击 ！
	Ooh03												= "SVM_7_Ooh03";						//哎 呦 ！ 那 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_7_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 该 死 ， 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_7_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_7_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_7_ABS_COMMANDER";				//这 么 看 来 指 挥 官 已 经 把 你 的 事 处 理 好 了 。
	ABS_MONASTERY										= "SVM_7_ABS_MONASTERY";				//这 么 看 来 帕 兰 神 父 已 经 宽 恕 了 你 的 罪 。
	ABS_FARM											= "SVM_7_ABS_FARM";						//我 听 说 李 已 经 解 决 了 你 的 问 题 。
	ABS_GOOD											= "SVM_7_ABS_GOOD";						//好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_7_SHEEPKILLER_CRIME";			//杀 了 这 么 多 的 绵 羊 ！ 走 开 ！
	ATTACK_CRIME										= "SVM_7_ATTACK_CRIME";					//你 是 一 个 恶 棍 - 滚 开 ！
	THEFT_CRIME											= "SVM_7_THEFT_CRIME";					//该 死 的 贼 ！ - 我 现 在 已 经 受 够 你 了 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_7_PAL_CITY_CRIME";				//我 太 寄 希 望 于 圣 骑 士 了 ！ 哈 根 勋 爵 不 会 高 兴 的 。
	MIL_CITY_CRIME										= "SVM_7_MIL_CITY_CRIME";				//象 你 这 样 的 人 是 怎 么 混 成 城 市 卫 兵 的 ？ 安 德 烈 勋 爵 会 让 你 赔 偿 这 一 切 的 ！
	CITY_CRIME											= "SVM_7_CITY_CRIME";					//安 德 烈 勋 爵 会 听 说 你 的 所 作 所 为 的 ！
	// -------------------------
	MONA_CRIME											= "SVM_7_MONA_CRIME";					//你 的 亵 渎 会 激 怒 帕 兰 神 父 的 ！
	FARM_CRIME											= "SVM_7_FARM_CRIME";					//李 不 会 让 你 逃 脱 处 罚 的 ！
	OC_CRIME											= "SVM_7_OC_CRIME";						//指 挥 官 加 隆 德 不 会 为 此 感 到 高 兴 的 - 你 将 会 受 到 处 罚 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_7_TOUGHGUY_ATTACKLOST";			//嗯 ， 相 当 漂 亮 的 一 拳 … … 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_7_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 有 问 题 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_7_TOUGHGUY_PLAYERATTACK";		//又 是 你 ！
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_7_GOLD_1000";					//1000枚 金 币 。
	GOLD_950											= "SVM_7_GOLD_950";						//950枚 金 币 。
	GOLD_900											= "SVM_7_GOLD_900";						//900枚 金 币 。
	GOLD_850											= "SVM_7_GOLD_850";						//850枚 金 币 。
	GOLD_800											= "SVM_7_GOLD_800";						//800枚 金 币 。
	GOLD_750											= "SVM_7_GOLD_750";						//750枚 金 币 。
	GOLD_700											= "SVM_7_GOLD_700";						//700枚 金 币 。
	GOLD_650											= "SVM_7_GOLD_650";						//650枚 金 币 。
	GOLD_600											= "SVM_7_GOLD_600";						//600枚 金 币 。
	GOLD_550											= "SVM_7_GOLD_550";						//550枚 金 币 。
	GOLD_500											= "SVM_7_GOLD_500";						//500枚 金 币 。
	GOLD_450											= "SVM_7_GOLD_450";						//450枚 金 币 。
	GOLD_400											= "SVM_7_GOLD_400";						//400枚 金 币 。
	GOLD_350											= "SVM_7_GOLD_350";						//350枚 金 币 。
	GOLD_300											= "SVM_7_GOLD_300";						//300枚 金 币 。
	GOLD_250											= "SVM_7_GOLD_250";						//250枚 金 币 。
	GOLD_200											= "SVM_7_GOLD_200";						//200枚 金 币 。
	GOLD_150											= "SVM_7_GOLD_150";						//150枚 金 币 。
	GOLD_100											= "SVM_7_GOLD_100";						//100枚 金 币 。
	GOLD_90												= "SVM_7_GOLD_90";						//90枚 金 币 。
	GOLD_80												= "SVM_7_GOLD_80";						//80枚 金 币 。
	GOLD_70												= "SVM_7_GOLD_70";						//70枚 金 币 。
	GOLD_60												= "SVM_7_GOLD_60";						//60枚 金 币 。
	GOLD_50												= "SVM_7_GOLD_50";						//50枚 金 币 。
	GOLD_40												= "SVM_7_GOLD_40";						//40枚 金 币 。
	GOLD_30												= "SVM_7_GOLD_30";						//30枚 金 币 。
	GOLD_20												= "SVM_7_GOLD_20";						//20枚 金 币 。
	GOLD_10												= "SVM_7_GOLD_10";						//10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_7_Smalltalk01";					//… … 是 真 的 吗 … …
	Smalltalk02											= "SVM_7_Smalltalk02";					//… … 我 听 说 的 不 是 那 样 的 … …
	Smalltalk03											= "SVM_7_Smalltalk03";					//… … 别 告 诉 我 你 不 知 道 那 个 … …
	Smalltalk04											= "SVM_7_Smalltalk04";					//… … 这 些 天 来 ， 你 很 难 知 道 该 相 信 谁 … …
	Smalltalk05											= "SVM_7_Smalltalk05";					//… … 那 都 是 流 言 … …
	Smalltalk06											= "SVM_7_Smalltalk06";					//… … 我 并 不 比 自 己 强 多 少 … …
	Smalltalk07											= "SVM_7_Smalltalk07";					//… … 没 有 什 么 能 再 让 我 吃 惊 的 了 … …
	Smalltalk08											= "SVM_7_Smalltalk08";					//… … 那 真 的 不 关 我 的 事 … …
	Smalltalk09											= "SVM_7_Smalltalk09";					//… … 你 真 的 相 信 那 个 … …
	Smalltalk10											= "SVM_7_Smalltalk10";					//… … 没 人 能 从 我 这 里 学 到 任 何 东 西 … …
	Smalltalk11											= "SVM_7_Smalltalk11";					//… … 那 始 终 都 很 明 显 … …
	Smalltalk12											= "SVM_7_Smalltalk12";					//… … 他 听 了 错 误 的 人 的 话 … …
	Smalltalk13											= "SVM_7_Smalltalk13";					//… … 如 果 他 不 知 道 那 个 ， 我 不 能 帮 助 他 … …
	Smalltalk14											= "SVM_7_Smalltalk14";					//… … 我 不 会 告 诉 你 任 何 新 的 情 况 … …
	Smalltalk15											= "SVM_7_Smalltalk15";					//… … 他 永 远 不 会 自 己 想 到 那 些 … …
	Smalltalk16											= "SVM_7_Smalltalk16";					//… … 已 经 知 道 那 个 很 久 了 … …
	Smalltalk17											= "SVM_7_Smalltalk17";					//… … 那 是 很 糟 糕 的 事 情 … …
	Smalltalk18											= "SVM_7_Smalltalk18";					//… … 我 最 好 另 想 办 法 解 决 它 … …
	Smalltalk19											= "SVM_7_Smalltalk19";					//… … 我 完 全 同 意 你 … …
	Smalltalk20											= "SVM_7_Smalltalk20";					//… … 什 么 时 候 会 改 变 … …
	Smalltalk21											= "SVM_7_Smalltalk21";					//… … 我 永 远 也 不 知 道 … …
	Smalltalk22											= "SVM_7_Smalltalk22";					//… … 对 于 它 你 无 能 为 力 … …
	Smalltalk23											= "SVM_7_Smalltalk23";					//… … 那 不 会 让 我 感 到 惊 讶 … …
	Smalltalk24											= "SVM_7_Smalltalk24";					//… … 但 是 不 ， 你 坚 持 认 为 他 知 道 的 更 清 楚 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_7_Smalltalk25";					//… … 最 关 键 的 是 力 量 ， 所 以 不 要 告 诉 我 那 些 … …
	Smalltalk26											= "SVM_7_Smalltalk26";					//… … 他 甚 至 不 知 道 怎 么 握 住 剑 … …
	Smalltalk27											= "SVM_7_Smalltalk27";					//… … 是 的 ， 他 已 经 说 过 那 些 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_7_Smalltalk28";					//… … 有 人 会 为 它 付 出 代 价 … …
	Smalltalk29											= "SVM_7_Smalltalk29";					//… … 英 诺 斯 会 启 迪 所 有 那 些 承 认 他 的 智 慧 的 人 … …
	Smalltalk30											= "SVM_7_Smalltalk30";					//… … 正 义 终 将 获 胜 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_7_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_7_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_7_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_7_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_7_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_7_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_7_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_7_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_7_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_7_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_7_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_7_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_7_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_7_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_7_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_7_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_7_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_7_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_7_TEMPEL_2_GALGEN";				//神 殿 开 始 ， 如 果 你 穿 过 左 边 的 酒 吧 ， 你 就 到 达 了 绞 刑 广 场 。
	MARKT_2_TEMPEL										= "SVM_7_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_7_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_7_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_7_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_7_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_7_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_7_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_7_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_7_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_7_Dead";							//啊 啊 啊!
	Aargh_1												= "SVM_7_Aargh_1";						//啊
	Aargh_2												= "SVM_7_Aargh_2";						//啊
	Aargh_3												= "SVM_7_Aargh_3";						//啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_7_Addon_WrongArmor";				//为 什 么 要 伪 装 自 己 ？ 你 那 个 样 子 我 不 会 同 你 说 话 。
	ADDON_WRONGARMOR_SLD								= "SVM_7_ADDON_WRONGARMOR_SLD";			//你 穿 的 是 什 么 ？ 穿 上 你 的 盔 甲 ， 行 吗 。
	ADDON_WRONGARMOR_MIL								= "SVM_7_ADDON_WRONGARMOR_MIL";			//那 样 违 反 军 队 的 着 装 法 规 。 去 换 衣 服 ， 马 上 去 。
	ADDON_WRONGARMOR_KDF								= "SVM_7_ADDON_WRONGARMOR_KDF";			//你 最 好 去 穿 上 你 的 袍 子 。 在 那 之 前 ， 我 不 会 和 你 说 话 ， 只 会 为 你 祈 祷 。
	ADDON_NOARMOR_BDT									= "SVM_7_ADDON_ADDON_NOARMOR_BDT";		//你 想 要 什 么 ？ 你 不 是 我 们 的 人 。 你 甚 至 没 有 穿 我 们 的 盔 甲 。

	ADDON_DIEBANDIT										= "SVM_7_ADDON_DIEBANDIT";				//去 死 吧 ， 你 这 可 怜 的 强 盗 。
	ADDON_DIRTYPIRATE									= "SVM_7_ADDON_DIRTYPIRATE";			//去 死 吧 ， 你 这 卑 鄙 的 海 盗 。
};

instance SVM_8(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_8_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_8_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_8_Weather";						//多 么 讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_8_IGetYouStill";					//现 在 我 抓 到 你 了 ！
	DieEnemy											= "SVM_8_DieEnemy";						//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_8_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_8_DirtyThief";					//卑 鄙 的 小 偷 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_8_HandsOff";						//把 你 的 爪 子 拿 开 ！
	SheepKiller											= "SVM_8_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_8_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_8_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_8_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_8_YouDareHitMe";					//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_8_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_8_ThenIBeatYouOutOfHere";		//你 不 想 走 ？ 好 吧 ！
	WhatDidYouDoInThere									= "SVM_8_WhatDidYouDoInThere";			//你 在 哪 里 想 做 什 么 ？
	WillYouStopFighting									= "SVM_8_WillYouStopFighting";			//你 现 在 能 停 下 来 吗 ？ ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_8_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_8_EnemyKilled";					//你 罪 有 应 得 ， 罪 犯 ！
	MonsterKilled										= "SVM_8_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_8_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_8_rumfummlerDown";				//从 现 在 开 始 ， 把 你 的 爪 子 从 不 属 于 你 的 东 西 上 拿 开 ！
	SheepAttackerDown									= "SVM_8_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_8_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_8_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_8_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_8_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_8_GetUpAndBeGone";				//现 在 从 这 里 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_8_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_8_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_8_SpareMe";						//不 要 伤 害 我 ！
	RunAway												= "SVM_8_RunAway";						//喔 ， 该 死 ！ ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_8_Alarm";						//警 报 ！
	Guards												= "SVM_8_Guards";						//卫 兵 ！
	Help												= "SVM_8_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_8_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_8_GoodKill";						//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_8_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_8_RunCoward";					//（ 大 声 呼 叫 ） 对 ！ 能 跑 多 快 就 跑 多 快 吧 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_8_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_8_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_8_YesGoOutOfHere";				//对 ， 从 这 里 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_8_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_8_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_8_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_8_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_8_ITakeYourWeapon";				//我 想 我 最 好 拿 走 这 件 武 器 !
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_8_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_8_LookingForTroubleAgain";		//你 还 没 拿 够 吗 ？
	StopMagic											= "SVM_8_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_8_ISaidStopMagic";				//想 挨 鞭 子 吗 ？ 马 上 停 止 ！ ！ ！
	WeaponDown											= "SVM_8_WeaponDown";					//丢 掉 那 件 武 器 ！
	ISaidWeaponDown										= "SVM_8_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_8_WiseMove";						//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_8_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_8_OhMyHead";						//（ 自 言 自 语 ） 哦 ， 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_8_TheresAFight";					//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_8_OhMyGodItsAFight";				//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_8_GoodVictory";					//（ 邪 恶 的 笑 ） 你 教 训 了 他 ！
	NotBad												= "SVM_8_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_8_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_8_CheerFriend01";				//那 打 啊 ！
	CheerFriend02										= "SVM_8_CheerFriend02";				//让 他 尝 尝 你 所 有 的 手 段 ！
	CheerFriend03										= "SVM_8_CheerFriend03";				//让 他 看 看 ！
	Ooh01												= "SVM_8_Ooh01";						//坚 持 住 ！
	Ooh02												= "SVM_8_Ooh02";						//留 神 ！
	Ooh03												= "SVM_8_Ooh03";						//哇 ！ 真 痛 快 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_8_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_8_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_8_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_8_ABS_COMMANDER";				//所 以 你 去 了 指 挥 官 那 里 ， 并 把 问 题 解 决 了 。
	ABS_MONASTERY										= "SVM_8_ABS_MONASTERY";				//所 以 你 去 帕 兰 神 父 那 里 赎 罪 。
	ABS_FARM											= "SVM_8_ABS_FARM";						//所 以 你 去 找 了 李 ， 并 将 事 情 理 顺 。
	ABS_GOOD											= "SVM_8_ABS_GOOD";						//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_8_SHEEPKILLER_CRIME";			//就 象 那 样 屠 杀 我 们 的 绵 羊 ！
	ATTACK_CRIME										= "SVM_8_ATTACK_CRIME";					//走 开 ， 你 这 个 丑 恶 的 畜 牲 ！
	THEFT_CRIME											= "SVM_8_THEFT_CRIME";					//走 开 ， 你 这 可 怜 的 小 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_8_PAL_CITY_CRIME";				//你 丢 了 修 道 会 的 脸 ！ 等 着 哈 根 勋 爵 听 说 这 些 事 吧 ！
	MIL_CITY_CRIME										= "SVM_8_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 等 着 安 德 烈 勋 爵 听 说 此 事 吧 ！
	CITY_CRIME											= "SVM_8_CITY_CRIME";					//等 到 安 德 烈 勋 爵 听 说 此 事 的 时 候 。
	// -------------------------
	MONA_CRIME											= "SVM_8_MONA_CRIME";					//等 到 帕 兰 神 父 听 说 此 事 的 时 候 ！
	FARM_CRIME											= "SVM_8_FARM_CRIME";					//等 到 李 听 到 风 声 的 时 候 … …
	OC_CRIME											= "SVM_8_OC_CRIME";						//等 到 指 挥 官 加 隆 德 听 说 此 事 的 时 候 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_8_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 是 更 厉 害 一 些 的 战 士 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_8_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 早 知 道 是 那 样 ， 现 在 ， 你 也 清 楚 我 们 之 间 谁 更 强 … … 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_8_TOUGHGUY_PLAYERATTACK";		//我 以 为 你 想 要 向 我 挑 战 。 你 改 变 主 意 了 吗 ？ 你 更 喜 欢 聊 天 ， 对 吗 ？ （ 大 笑 ）
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_8_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_8_GOLD_950";						// 950枚 金 币 。
	GOLD_900											= "SVM_8_GOLD_900";						// 900枚 金 币 。
	GOLD_850											= "SVM_8_GOLD_850";						// 850枚 金 币 。
	GOLD_800											= "SVM_8_GOLD_800";						// 800枚 金 币 。
	GOLD_750											= "SVM_8_GOLD_750";						// 750枚 金 币 。
	GOLD_700											= "SVM_8_GOLD_700";						// 700枚 金 币 。
	GOLD_650											= "SVM_8_GOLD_650";						// 650枚 金 币 。
	GOLD_600											= "SVM_8_GOLD_600";						// 600枚 金 币 。
	GOLD_550											= "SVM_8_GOLD_550";						// 550枚 金 币 。
	GOLD_500											= "SVM_8_GOLD_500";						// 500枚 金 币 。
	GOLD_450											= "SVM_8_GOLD_450";						// 450枚 金 币 。
	GOLD_400											= "SVM_8_GOLD_400";						// 400枚 金 币 。
	GOLD_350											= "SVM_8_GOLD_350";						// 350枚 金 币 。
	GOLD_300											= "SVM_8_GOLD_300";						// 300枚 金 币 。
	GOLD_250											= "SVM_8_GOLD_250";						// 250枚 金 币 。
	GOLD_200											= "SVM_8_GOLD_200";						// 200枚 金 币 。
	GOLD_150											= "SVM_8_GOLD_150";						// 150枚 金 币 。
	GOLD_100											= "SVM_8_GOLD_100";						// 100枚 金 币 。
	GOLD_90												= "SVM_8_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_8_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_8_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_8_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_8_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_8_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_8_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_8_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_8_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_8_Smalltalk01";					//… … 是 真 的 吗 … …
	Smalltalk02											= "SVM_8_Smalltalk02";					//… … 我 听 说 的 不 是 那 样 的 … …
	Smalltalk03											= "SVM_8_Smalltalk03";					//… … 别 告 诉 我 你 不 知 道 那 个 … …
	Smalltalk04											= "SVM_8_Smalltalk04";					//… … 这 些 天 来 ， 你 很 难 知 道 该 相 信 谁 … …
	Smalltalk05											= "SVM_8_Smalltalk05";					//… … 那 都 是 流 言 … …
	Smalltalk06											= "SVM_8_Smalltalk06";					//… … 我 并 不 比 自 己 强 多 少 … …
	Smalltalk07											= "SVM_8_Smalltalk07";					//… … 没 什 么 能 再 让 我 吃 惊 了 … …
	Smalltalk08											= "SVM_8_Smalltalk08";					//… … 那 真 的 不 关 我 的 事 … …
	Smalltalk09											= "SVM_8_Smalltalk09";					//… … 你 真 的 相 信 那 个 … …
	Smalltalk10											= "SVM_8_Smalltalk10";					//… … 没 人 能 从 我 这 里 学 到 任 何 东 西 … …
	Smalltalk11											= "SVM_8_Smalltalk11";					//… … 那 始 终 都 很 明 显 … …
	Smalltalk12											= "SVM_8_Smalltalk12";					//… … 他 听 了 错 误 的 人 的 话 … …
	Smalltalk13											= "SVM_8_Smalltalk13";					//… … 如 果 他 不 知 道 那 个 ， 我 不 能 帮 助 他 … …
	Smalltalk14											= "SVM_8_Smalltalk14";					//… … 我 不 会 告 诉 你 任 何 新 的 情 况 … …
	Smalltalk15											= "SVM_8_Smalltalk15";					//… … 他 永 远 不 会 自 己 想 到 那 些 … …
	Smalltalk16											= "SVM_8_Smalltalk16";					//… … 已 经 知 道 那 个 很 久 了 … …
	Smalltalk17											= "SVM_8_Smalltalk17";					//… … 那 是 很 糟 糕 的 事 情 … …
	Smalltalk18											= "SVM_8_Smalltalk18";					//… … 我 最 好 另 想 办 法 解 决 它 … …
	Smalltalk19											= "SVM_8_Smalltalk19";					//… … 我 完 全 同 意 你 … …
	Smalltalk20											= "SVM_8_Smalltalk20";					//… … 什 么 时 候 会 改 变 … …
	Smalltalk21											= "SVM_8_Smalltalk21";					//… … 我 永 远 也 不 知 道 … …
	Smalltalk22											= "SVM_8_Smalltalk22";					//… … 对 于 它 你 无 能 为 力 … …
	Smalltalk23											= "SVM_8_Smalltalk23";					//… … 那 不 会 让 我 感 到 惊 讶 … …
	Smalltalk24											= "SVM_8_Smalltalk24";					//… … 但 是 不 ， 你 坚 持 认 为 他 知 道 的 更 清 楚 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_8_Smalltalk25";					//… … 最 关 键 的 是 力 量 ， 所 以 不 要 告 诉 我 那 些 … …
	Smalltalk26											= "SVM_8_Smalltalk26";					//… … 他 甚 至 不 知 道 怎 么 握 住 剑 … …
	Smalltalk27											= "SVM_8_Smalltalk27";					//… … 是 的 ， 他 已 经 说 过 那 些 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_8_Smalltalk28";					//… … 有 人 会 为 它 付 出 代 价 … …
	Smalltalk29											= "SVM_8_Smalltalk29";					//… … 英 诺 斯 会 启 迪 所 有 那 些 承 认 他 的 智 慧 的 人 … …
	Smalltalk30											= "SVM_8_Smalltalk30";					//… … 正 义 终 将 获 胜 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_8_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_8_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_8_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_8_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_8_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_8_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_8_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_8_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_8_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_8_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_8_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_8_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_8_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_8_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_8_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_8_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_8_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_8_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_8_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_8_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_8_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_8_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_8_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_8_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_8_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_8_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_8_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_8_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_8_Dead";							// 啊啊啊 !
	Aargh_1												= "SVM_8_Aargh_1";						// 啊
	Aargh_2												= "SVM_8_Aargh_2";						// 啊
	Aargh_3												= "SVM_8_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_8_Addon_WrongArmor";				//我 不 信 任 你 。 你 有 哪 些 地 方 不 对 头 ， 还 是 你 穿 的 衣 服 有 问 题 。
	ADDON_WRONGARMOR_SLD								= "SVM_8_ADDON_WRONGARMOR_SLD";			//看 你 的 样 子 ， 你 一 定 是 在 其 它 地 方 从 过 军 ？ 那 样 我 们 之 间 不 会 发 生 任 何 事 。
	ADDON_WRONGARMOR_MIL								= "SVM_8_ADDON_WRONGARMOR_MIL";			//我 们 必 须 要 展 现 出 风 度 。 所 以 去 换 上 你 的 盔 甲 。
	ADDON_WRONGARMOR_KDF								= "SVM_8_ADDON_WRONGARMOR_KDF";			//英 诺 斯 要 求 我 们 要 自 豪 地 穿 上 他 的 袍 子 。 去 换 衣 服 。
	ADDON_NOARMOR_BDT									= "SVM_8_ADDON_ADDON_NOARMOR_BDT";		//我 不 和 矿 工 说 话 。 你 甚 至 连 一 件 盔 甲 都 没 有 。

	ADDON_DIEBANDIT										= "SVM_8_ADDON_DIEBANDIT";				//你 这 卑 鄙 的 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_8_ADDON_DIRTYPIRATE";			//海 盗 ！
};

instance SVM_9(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_9_MILGreetings";					//为 了 国 王 ！
	PALGreetings										= "SVM_9_PALGreetings";					//为 了 英 诺 斯 ！
	Weather												= "SVM_9_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_9_IGetYouStill";					//现 在 我 抓 到 你 了 ！
	DieEnemy											= "SVM_9_DieEnemy";						//你 真 不 应 该 来 这 里 ！
	DieMonster											= "SVM_9_DieMonster";					//来 这 里 ， 你 这 丑 恶 的 野 兽 ！
	Addon_DieMonster									= "SVM_9_Addon_DieMonster";				//又 来 了 一 头 野 兽 ！
	Addon_DieMonster2									= "SVM_9_Addon_DieMonster2";			//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_9_DirtyThief";					//卑 鄙 的 小 偷 ！ 等 等 ！
	HandsOff											= "SVM_9_HandsOff";						//把 你 的 爪 子 拿 开 ！
	SheepKiller											= "SVM_9_SheepKiller";					//离 开 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_9_SheepKillerMonster";			//离 我 们 的 绵 羊 远 点 ， 你 这 丑 恶 的 野 兽 ！
	YouMurderer											= "SVM_9_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_9_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_9_YouDareHitMe";					//你 将 会 后 悔 这 么 做 ！
	YouAskedForIt										= "SVM_9_YouAskedForIt";				//我 警 告 你 ！
	ThenIBeatYouOutOfHere								= "SVM_9_ThenIBeatYouOutOfHere";		//我 说 了 出 去 ！
	WhatDidYouDoInThere									= "SVM_9_WhatDidYouDoInThere";			//嘿 ！ 你 在 那 里 做 什 么 ？
	WillYouStopFighting									= "SVM_9_WillYouStopFighting";			//停 下 ！ 马 上 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_9_KillEnemy";					//我 要 把 你 刺 穿 ， 混 蛋 ！
	EnemyKilled											= "SVM_9_EnemyKilled";					//那 是 给 你 的 … …
	// MonsterKilled									= "SVM_9_MonsterKilled";				// Ich steh' auf diese ganze Scheiße!
	Addon_MonsterKilled									= "SVM_9_Addon_MonsterKilled";			//够 你 受 的 ， 丑 恶 的 野 兽 ！
	Addon_MonsterKilled2								= "SVM_9_Addon_MonsterKilled2";			//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_9_ThiefDown";					//我 在 警 告 你 ！ 别 再 那 样 做 了 ， 你 这 卑 鄙 的 小 偷 ！
	rumfummlerDown										= "SVM_9_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_9_SheepAttackerDown";			//从 现 在 起 离 我 们 的 绵 羊 远 点 ！
	KillMurderer										= "SVM_9_KillMurderer";					//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_9_StupidBeastKilled";			//多 么 愚 蠢 的 家 伙 ！
	NeverHitMeAgain										= "SVM_9_NeverHitMeAgain";				//看 你 还 敢 再 袭 击 我 ！
	YouBetterShouldHaveListened							= "SVM_9_YouBetterShouldHaveListened";	//我 警 告 你 ！
	GetUpAndBeGone										= "SVM_9_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_9_NeverEnterRoomAgain";			//我 不 想 再 看 到 你 出 现 在 那 里 ， 永 远 ， 你 明 白 了 吗 ？
	ThereIsNoFightingHere								= "SVM_9_ThereIsNoFightingHere";		//这 里 不 能 打 架 ， 你 不 要 忘 记 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_9_SpareMe";						//不 要 做 任 何 傻 事 ！
	RunAway												= "SVM_9_RunAway";						//我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_9_Alarm";						//警 报 ！
	Guards												= "SVM_9_Guards";						//卫 兵 ！
	Help												= "SVM_9_Help";							//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_9_GoodMonsterKill";				//（ 呼 喊 ） 把 那 些 野 兽 送 上 天 国 ！
	GoodKill											= "SVM_9_GoodKill";						//（ 大 喊 ） 对 ， 让 那 个 混 蛋 尝 尝 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_9_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_9_RunCoward";					//（ 大 声 喊 叫 ） 我 会 抓 住 你 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_9_GetOutOfHere";					//滚 出 去 ！
	WhyAreYouInHere										= "SVM_9_WhyAreYouInHere";				//你 在 这 里 没 有 事 做 ！
	YesGoOutOfHere										= "SVM_9_YesGoOutOfHere";				//对 ， 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_9_WhatsThisSupposedToBe";		//你 在 等 什 么 ？ 你 在 这 里 偷 偷 摸 摸 干 什 么 ？
	YouDisturbedMySlumber								= "SVM_9_YouDisturbedMySlumber";		//（ 醒 来 ） 该 死 ， 你 想 要 做 什 么 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_9_ITookYourGold";				//嗯 ， 至 少 你 身 上 还 有 些 钱 。
	ShitNoGold											= "SVM_9_ShitNoGold";					//一 个 金 币 都 没 有 - 呸 。
	ITakeYourWeapon										= "SVM_9_ITakeYourWeapon";				//我 想 我 可 以 拿 走 你 的 武 器 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_9_WhatAreYouDoing";				//（ 警 告 ） 小 子 ！ 你 还 想 再 来 一 次 吗 ？
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_9_LookingForTroubleAgain";		//（ 挑 衅 的 ） 还 想 再 挨 一 次 揍 ？
	StopMagic											= "SVM_9_StopMagic";					//停 止 那 个 魔 法 ！
	ISaidStopMagic										= "SVM_9_ISaidStopMagic";				//最 后 警 告 ！ 停 止 那 个 魔 法 ！
	WeaponDown											= "SVM_9_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_9_ISaidWeaponDown";				//把 那 个 放 下 ， 否 则 吃 不 了 兜 着 走 ！
	WiseMove											= "SVM_9_WiseMove";						//嘿 ， 你 并 不 象 看 起 来 那 么 傻 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_9_NextTimeYoureInForIt";			//（ 自 言 自 语 ） 不 要 再 那 样 了 … …
	OhMyHead											= "SVM_9_OhMyHead";						//（ 自 言 自 语 ） 哦 ！ 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_9_TheresAFight";					//（ 贪 婪 的 ） 现 在 好 戏 上 场 … …
	OhMyGodItsAFight									= "SVM_9_OhMyGodItsAFight";				//（ 沮 丧 的 ） 哦 ， 我 的 天 啊 … …
	GoodVictory											= "SVM_9_GoodVictory";					//（ 邪 恶 的 笑 ） 教 训 他 一 下 … …
	NotBad												= "SVM_9_NotBad";						//（ 满 意 的 ） 真 痛 快 ！
	OhMyGodHesDown										= "SVM_9_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 卑 劣 的 畜 牲 ！
	CheerFriend01										= "SVM_9_CheerFriend01";				//用 力 打 他 ！
	CheerFriend02										= "SVM_9_CheerFriend02";				//现 在 不 要 停 ！
	CheerFriend03										= "SVM_9_CheerFriend03";				//干 掉 他 ！
	Ooh01												= "SVM_9_Ooh01";						//留 神 ！
	Ooh02												= "SVM_9_Ooh02";						//格 挡 ！
	Ooh03												= "SVM_9_Ooh03";						//该 死 ， 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_9_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_9_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_9_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_9_ABS_COMMANDER";				//那 么 说 指 挥 官 把 你 的 事 摆 平 了 。
	ABS_MONASTERY										= "SVM_9_ABS_MONASTERY";				//帕 兰 神 父 已 经 赦 免 了 你 的 罪 行 。
	ABS_FARM											= "SVM_9_ABS_FARM";						//那 么 说 你 已 经 见 过 李 ， 并 把 那 事 了 结 了 。
	ABS_GOOD											= "SVM_9_ABS_GOOD";						//好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_9_SHEEPKILLER_CRIME";			//你 在 攻 击 绵 羊 ？ 我 想 你 是 找 不 到 其 它 更 无 力 抵 抗 的 牺 牲 品 了 吧 ？
	ATTACK_CRIME										= "SVM_9_ATTACK_CRIME";					//对 那 些 下 流 的 恶 棍 来 说 ， 我 做 不 了 什 么 ！
	THEFT_CRIME											= "SVM_9_THEFT_CRIME";					//对 那 些 盗 贼 来 说 ， 我 做 不 了 任 何 事 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_9_PAL_CITY_CRIME";				//那 么 说 你 想 成 为 一 名 圣 骑 士 ？ 那 就 等 你 听 到 哈 根 勋 爵 对 这 件 事 有 什 么 说 法 吧 ！
	MIL_CITY_CRIME										= "SVM_9_MIL_CITY_CRIME";				//你 真 的 属 于 城 市 卫 兵 ？ 安 德 烈 勋 爵 不 会 容 忍 那 样 的 人 ！
	CITY_CRIME											= "SVM_9_CITY_CRIME";					//趁 你 还 能 走 路 ， 去 找 安 德 烈 勋 爵 。
	// -------------------------
	MONA_CRIME											= "SVM_9_MONA_CRIME";					//去 找 帕 兰 神 父 。 他 将 会 帮 助 你 偿 还 你 的 罪 恶 ！
	FARM_CRIME											= "SVM_9_FARM_CRIME";					//李 会 听 说 了 此 事 ， 而 你 将 需 赔 偿 ！
	OC_CRIME											= "SVM_9_OC_CRIME";						//指 挥 官 加 隆 德 不 会 感 到 愉 快 的 。 你 最 好 在 事 态 变 得 更 糟 糕 之 前 去 和 他 谈 谈 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_9_TOUGHGUY_ATTACKLOST";			//好 吧 - 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_9_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 想 你 现 在 知 道 了 正 在 和 谁 打 交 道 。 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_9_TOUGHGUY_PLAYERATTACK";		//又 是 你 ？ 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_9_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_9_GOLD_950";						// 950枚 金 币 。
	GOLD_900											= "SVM_9_GOLD_900";						// 900枚 金 币 。
	GOLD_850											= "SVM_9_GOLD_850";						// 850枚 金 币 。
	GOLD_800											= "SVM_9_GOLD_800";						// 800枚 金 币 。
	GOLD_750											= "SVM_9_GOLD_750";						// 750枚 金 币 。
	GOLD_700											= "SVM_9_GOLD_700";						// 700枚 金 币 。
	GOLD_650											= "SVM_9_GOLD_650";						// 650枚 金 币 。
	GOLD_600											= "SVM_9_GOLD_600";						// 600枚 金 币 。
	GOLD_550											= "SVM_9_GOLD_550";						// 550枚 金 币 。
	GOLD_500											= "SVM_9_GOLD_500";						// 500枚 金 币 。
	GOLD_450											= "SVM_9_GOLD_450";						// 450枚 金 币 。
	GOLD_400											= "SVM_9_GOLD_400";						// 400枚 金 币 。
	GOLD_350											= "SVM_9_GOLD_350";						// 350枚 金 币 。
	GOLD_300											= "SVM_9_GOLD_300";						// 300枚 金 币 。
	GOLD_250											= "SVM_9_GOLD_250";						// 250枚 金 币 。
	GOLD_200											= "SVM_9_GOLD_200";						// 200枚 金 币 。
	GOLD_150											= "SVM_9_GOLD_150";						// 150枚 金 币 。
	GOLD_100											= "SVM_9_GOLD_100";						// 100枚 金 币 。
	GOLD_90												= "SVM_9_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_9_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_9_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_9_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_9_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_9_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_9_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_9_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_9_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_9_Smalltalk01";					//… … 我 无 法 相 信 … …
	Smalltalk02											= "SVM_9_Smalltalk02";					//… … 我 不 十 分 肯 定 … …
	Smalltalk03											= "SVM_9_Smalltalk03";					//… … 但 是 他 都 知 道 了 … …
	Smalltalk04											= "SVM_9_Smalltalk04";					//… … 我 几 乎 不 知 道 还 能 相 信 什 么 … …
	Smalltalk05											= "SVM_9_Smalltalk05";					//… … 我 不 知 道 他 为 什 么 会 这 么 激 动 … …
	Smalltalk06											= "SVM_9_Smalltalk06";					//… … 我 已 经 陷 入 太 多 的 麻 烦 中 了 … …
	Smalltalk07											= "SVM_9_Smalltalk07";					//… … 我 听 说 了 一 两 件 事 … …
	Smalltalk08											= "SVM_9_Smalltalk08";					//… … 我 不 会 去 碰 那 个 … …
	Smalltalk09											= "SVM_9_Smalltalk09";					//… … 你 一 定 不 要 相 信 你 听 到 的 所 有 事 情 … …
	Smalltalk10											= "SVM_9_Smalltalk10";					//… … 他 不 是 从 我 那 里 得 到 那 个 的 … …
	Smalltalk11											= "SVM_9_Smalltalk11";					//… … 我 已 经 想 得 很 多 … …
	Smalltalk12											= "SVM_9_Smalltalk12";					//… … 从 来 没 人 征 求 过 我 的 意 见 … …
	Smalltalk13											= "SVM_9_Smalltalk13";					//… … 他 真 的 不 应 该 得 到 那 个 … …
	Smalltalk14											= "SVM_9_Smalltalk14";					//… … 别 告 诉 我 你 不 知 道 那 个 … …
	Smalltalk15											= "SVM_9_Smalltalk15";					//… … 那 很 显 然 … …
	Smalltalk16											= "SVM_9_Smalltalk16";					//… … 那 么 你 是 从 哪 里 见 到 的 那 个 … …
	Smalltalk17											= "SVM_9_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_9_Smalltalk18";					//… … 对 于 那 些 我 有 自 己 的 观 点 … …
	Smalltalk19											= "SVM_9_Smalltalk19";					//… … 就 象 你 说 的 那 样 … …
	Smalltalk20											= "SVM_9_Smalltalk20";					//… … 我 不 相 信 这 会 改 变 … …
	Smalltalk21											= "SVM_9_Smalltalk21";					//… … 那 是 我 第 一 次 听 说 它 … …
	Smalltalk22											= "SVM_9_Smalltalk22";					//… … 我 们 所 能 做 的 只 有 等 着 看 … …
	Smalltalk23											= "SVM_9_Smalltalk23";					//… … 我 知 道 那 会 是 个 问 题 … …
	Smalltalk24											= "SVM_9_Smalltalk24";					//… … 那 么 他 们 为 什 么 不 听 我 的 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_9_Smalltalk25";					//… … 他 跑 起 来 就 像 是 贝 利 尔 在 后 面 追 他 一 样 … …
	Smalltalk26											= "SVM_9_Smalltalk26";					//… … 当 然 我 们 最 后 抓 住 了 他 … …
	Smalltalk27											= "SVM_9_Smalltalk27";					//… … 你 必 须 插 手 帮 忙 ， 并 把 事 情 处 理 好 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_9_Smalltalk28";					//… … 有 人 根 本 不 知 道 他 们 有 多 么 邪 恶 … …
	Smalltalk29											= "SVM_9_Smalltalk29";					//… … 那 是 英 诺 斯 的 意 愿 … …
	Smalltalk30											= "SVM_9_Smalltalk30";					//… … 他 的 行 为 是 正 义 的 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_9_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_9_NoLearnOverPersonalMAX";		//你 要 求 的 已 经 超 出 我 所 能 传 授 的 了 。
	NoLearnYoureBetter									= "SVM_9_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_9_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_9_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_9_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_9_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_9_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_9_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_9_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_9_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_9_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_9_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_9_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_9_UNTERSTADT_2_TEMPEL";			//从 铁 匠 的 商 店 穿 过 地 道 ， 你 将 会 到 达 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_9_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_9_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_9_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_9_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_9_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_9_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_9_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_9_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_9_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_9_GALGEN_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_9_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_9_KASERNE_2_GALGEN";				//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_9_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_9_Dead";							// 啊啊啊l !
	Aargh_1												= "SVM_9_Aargh_1";						// 啊
	Aargh_2												= "SVM_9_Aargh_2";						// 啊
	Aargh_3												= "SVM_9_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_9_Addon_WrongArmor";				//这 是 什 么 装 扮 ？ 穿 上 点 适 合 你 的 衣 服 。
	ADDON_WRONGARMOR_SLD								= "SVM_9_ADDON_WRONGARMOR_SLD";			//你 穿 的 是 什 么 ？ 穿 上 你 的 盔 甲 ， 好 吗 ？
	ADDON_WRONGARMOR_MIL								= "SVM_9_ADDON_WRONGARMOR_MIL";			//你 是 为 国 王 服 务 ， 所 以 你 必 须 穿 上 他 赐 予 的 盔 甲 。 去 换 衣 服 。
	ADDON_WRONGARMOR_KDF								= "SVM_9_ADDON_WRONGARMOR_KDF";			//你 的 衣 服 不 适 合 我 们 修 道 会 。 去 换 一 件 。
	ADDON_NOARMOR_BDT									= "SVM_9_ADDON_ADDON_NOARMOR_BDT";		//你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 ！

	ADDON_DIEBANDIT										= "SVM_9_ADDON_DIEBANDIT";				//现 在 轮 到 你 了 ， 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_9_ADDON_DIRTYPIRATE";			//你 真 不 应 该 出 现 在 这 里 ， 海 盗 。
};

instance SVM_10(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_10_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_10_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_10_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_10_IGetYouStill";				//又 是 你 ！
	DieEnemy											= "SVM_10_DieEnemy";					//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_10_DieMonster";					//又 来 了 一 头 野 兽 ！
	DirtyThief											= "SVM_10_DirtyThief";					//你 这 个 可 怜 的 小 偷 ！
	HandsOff											= "SVM_10_HandsOff";					//把 你 的 手 从 那 里 挪 开 ！
	SheepKiller											= "SVM_10_SheepKiller";					//嘿 ！ 别 碰 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_10_SheepKillerMonster";			//那 个 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_10_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_10_DieStupidBeast";				//那 个 生 物 在 这 里 做 什 么 呢 ？
	YouDareHitMe										= "SVM_10_YouDareHitMe";				//你 现 在 要 倒 霉 了 ！
	YouAskedForIt										= "SVM_10_YouAskedForIt";				//你 自 讨 苦 吃 !
	ThenIBeatYouOutOfHere								= "SVM_10_ThenIBeatYouOutOfHere";		//我 想 有 些 人 就 是 要 体 会 一 下 最 难 的 方 法 。
	WhatDidYouDoInThere									= "SVM_10_WhatDidYouDoInThere";			//你 想 在 那 里 得 到 什 么 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_10_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_10_KillEnemy";					//去 死 吧 ！
	EnemyKilled											= "SVM_10_EnemyKilled";					//多 么 愚 蠢 的 混 蛋 … …
	MonsterKilled										= "SVM_10_MonsterKilled";				//好 吧 ， 就 给 你 那 么 多 了 ， 丑 恶 的 野 兽 ！
	ThiefDown											= "SVM_10_ThiefDown";					//以 后 不 要 再 用 你 的 爪 子 碰 我 的 东 西 - 明 白 吗 ？
	rumfummlerDown										= "SVM_10_rumfummlerDown";				//从 现 在 起 把 你 的 手 指 收 回 去 ！
	SheepAttackerDown									= "SVM_10_SheepAttackerDown";			//从 现 在 起 ， 不 要 用 你 肮 脏 的 爪 子 碰 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_10_KillMurderer";				//去 死 吧 ， 你 这 个 凶 手 ！
	StupidBeastKilled									= "SVM_10_StupidBeastKilled";			//多 么 愚 蠢 的 家 伙 ！
	NeverHitMeAgain										= "SVM_10_NeverHitMeAgain";				//不 要 再 试 第 二 次 ， 老 兄 ！
	YouBetterShouldHaveListened							= "SVM_10_YouBetterShouldHaveListened";	//让 那 作 为 你 的 一 堂 课 。
	GetUpAndBeGone										= "SVM_10_GetUpAndBeGone";				//站 起 来 ， 然 后 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_10_NeverEnterRoomAgain";			//我 不 想 再 在 那 里 看 到 你 - 明 白 了 吗 ？
	ThereIsNoFightingHere								= "SVM_10_ThereIsNoFightingHere";		//我 就 是 打 遍 附 近 无 敌 手 ， 明 白 吗 ？
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_10_SpareMe";						//离 我 远 点 ！
	RunAway												= "SVM_10_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_10_Alarm";						//警 报 ！
	Guards												= "SVM_10_Guards";						//卫 兵 ！
	Help												= "SVM_10_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_10_GoodMonsterKill";				//（ 呼 喊 ） 呀 ！ 你 就 只 能 做 那 样 的 事 吗 ！
	GoodKill											= "SVM_10_GoodKill";					//（ 呼 喊 ） 那 是 那 头 猪 应 得 的 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_10_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_10_RunCoward";					//（ 大 叫 ） 你 还 没 见 识 到 我 的 真 本 事 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_10_GetOutOfHere";				//出 去 ！
	WhyAreYouInHere										= "SVM_10_WhyAreYouInHere";				//你 在 这 里 有 什 么 事 ？ ！
	YesGoOutOfHere										= "SVM_10_YesGoOutOfHere";				//对 ， 走 开 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_10_WhatsThisSupposedToBe";		//你 在 那 边 鬼 鬼 祟 祟 地 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_10_YouDisturbedMySlumber";		//（ 醒 来 ） 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_10_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_10_ShitNoGold";					//你 这 可 怜 的 混 蛋 - 你 身 上 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_10_ITakeYourWeapon";				//我 要 把 这 件 武 器 妥 为 保 管 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_10_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 的 话 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_10_LookingForTroubleAgain";		//（ 挑 衅 的 ） 你 的 脸 上 还 想 再 挨 一 下 吗 ？

	StopMagic											= "SVM_10_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_10_ISaidStopMagic";				//你 在 找 揍 吗 ？ 马 上 停 手 ！ ！ ！
	WeaponDown											= "SVM_10_WeaponDown";					//把 武 器 放 下 ！
	ISaidWeaponDown										= "SVM_10_ISaidWeaponDown";				//马 上 把 那 该 死 的 武 器 放 下 ！
	WiseMove											= "SVM_10_WiseMove";					//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_10_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 我 们 下 次 会 留 神 的 … …
	OhMyHead											= "SVM_10_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_10_TheresAFight";				//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_10_OhMyGodItsAFight";			//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_10_GoodVictory";					//（ 带 着 邪 恶 的 笑 ） 你 真 正 教 训 了 他 一 顿 ！
	NotBad												= "SVM_10_NotBad";						//（ 感 激 的 ） 不 坏 … …
	OhMyGodHesDown										= "SVM_10_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_10_CheerFriend01";				//好 ， 让 他 尝 尝 滋 味 ！
	CheerFriend02										= "SVM_10_CheerFriend02";				//让 他 看 看 ！
	CheerFriend03										= "SVM_10_CheerFriend03";				//干 掉 他 ！
	Ooh01												= "SVM_10_Ooh01";						//准 备 自 保 ！
	Ooh02												= "SVM_10_Ooh02";						//前 进 ， 反 击 ！
	Ooh03												= "SVM_10_Ooh03";						//哎 呦 ！ 那 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_10_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 该 死 ， 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_10_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_10_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_10_ABS_COMMANDER";				//这 么 看 来 指 挥 官 已 经 把 你 的 事 处 理 好 了 。
	ABS_MONASTERY										= "SVM_10_ABS_MONASTERY";				//这 么 看 来 帕 兰 神 父 已 经 宽 恕 了 你 的 罪 。
	ABS_FARM											= "SVM_10_ABS_FARM";					//我 听 说 李 已 经 解 决 了 你 的 问 题 。
	ABS_GOOD											= "SVM_10_ABS_GOOD";					//很 公 平 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_10_SHEEPKILLER_CRIME";			//杀 了 这 么 多 的 绵 羊 ！ 走 开 ！
	ATTACK_CRIME										= "SVM_10_ATTACK_CRIME";				//你 是 一 个 恶 棍 - 滚 开 ！
	THEFT_CRIME											= "SVM_10_THEFT_CRIME";					//该 死 的 贼 ！ - 我 现 在 已 经 受 够 你 了 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_10_PAL_CITY_CRIME";				//我 太 寄 希 望 于 圣 骑 士 了 ！ 哈 根 勋 爵 不 会 高 兴 的 。
	MIL_CITY_CRIME										= "SVM_10_MIL_CITY_CRIME";				//象 你 这 样 的 人 是 怎 么 混 成 城 市 卫 兵 的 ？ 安 德 烈 勋 爵 会 让 你 赔 偿 这 一 切 的 ！
	CITY_CRIME											= "SVM_10_CITY_CRIME";					//安 德 烈 勋 爵 会 听 说 你 的 所 作 所 为 的 ！
	// -------------------------
	MONA_CRIME											= "SVM_10_MONA_CRIME";					//你 的 亵 渎 会 激 怒 帕 兰 神 父 的 ！
	FARM_CRIME											= "SVM_10_FARM_CRIME";					//李 不 会 让 你 逃 脱 处 罚 的 ！
	OC_CRIME											= "SVM_10_OC_CRIME";					//指 挥 官 加 隆 德 不 会 为 此 感 到 高 兴 的 - 你 将 会 受 到 处 罚 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_10_TOUGHGUY_ATTACKLOST";			//说 起 来 ， 你 那 一 拳 很 漂 亮 … … 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_10_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 有 问 题 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_10_TOUGHGUY_PLAYERATTACK";		//又 是 你 ！
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_10_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_10_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_10_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_10_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_10_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_10_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_10_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_10_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_10_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_10_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_10_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_10_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_10_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_10_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_10_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_10_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_10_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_10_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_10_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_10_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_10_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_10_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_10_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_10_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_10_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_10_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_10_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_10_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_10_Smalltalk01";					//… … 我 不 在 乎 … …
	Smalltalk02											= "SVM_10_Smalltalk02";					//… … 没 人 想 知 道 … …
	Smalltalk03											= "SVM_10_Smalltalk03";					//… … 那 是 他 的 决 定 ， 不 是 吗 … …
	Smalltalk04											= "SVM_10_Smalltalk04";					//… … 不 知 道 ， 你 告 诉 我 … …
	Smalltalk05											= "SVM_10_Smalltalk05";					//… … 我 不 参 与 … …
	Smalltalk06											= "SVM_10_Smalltalk06";					//… … 我 没 时 间 去 管 那 样 的 事 … …
	Smalltalk07											= "SVM_10_Smalltalk07";					//… … 我 无 法 带 着 那 个 离 开 … …
	Smalltalk08											= "SVM_10_Smalltalk08";					//… … 你 不 必 告 诉 我 那 些 … …
	Smalltalk09											= "SVM_10_Smalltalk09";					//… … 在 那 里 ， 那 样 做 … …
	Smalltalk10											= "SVM_10_Smalltalk10";					//… … 我 能 告 诉 你 的 事 … …
	Smalltalk11											= "SVM_10_Smalltalk11";					//… … 你 不 能 信 任 那 个 … …
	Smalltalk12											= "SVM_10_Smalltalk12";					//… … 我 通 常 亲 自 去 说 … …
	Smalltalk13											= "SVM_10_Smalltalk13";					//… … 还 有 更 多 ， 相 信 我 … …
	Smalltalk14											= "SVM_10_Smalltalk14";					//… … 又 一 次 到 处 都 是 同 样 东 西 … …
	Smalltalk15											= "SVM_10_Smalltalk15";					//… … 告 诉 我 那 不 是 真 的 … …
	Smalltalk16											= "SVM_10_Smalltalk16";					//… … 它 迟 早 会 出 现 … …
	Smalltalk17											= "SVM_10_Smalltalk17";					//… … 他 真 的 应 该 多 了 解 一 些 … …
	Smalltalk18											= "SVM_10_Smalltalk18";					//… … 那 永 远 不 会 改 变 … …
	Smalltalk19											= "SVM_10_Smalltalk19";					//… … 那 不 是 秘 密 … …
	Smalltalk20											= "SVM_10_Smalltalk20";					//… … 那 没 什 么 大 不 了 的 … …
	Smalltalk21											= "SVM_10_Smalltalk21";					//… … 他 认 为 它 和 那 个 一 样 简 单 … …
	Smalltalk22											= "SVM_10_Smalltalk22";					//… … 没 人 真 的 想 听 到 那 个 … …
	Smalltalk23											= "SVM_10_Smalltalk23";					//… … 那 就 是 事 实 … …
	Smalltalk24											= "SVM_10_Smalltalk24";					//… … 好 好 听 他 说 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_10_Smalltalk25";					//… … 如 果 事 情 没 按 我 们 的 计 划 发 展 的 话 ， 情 况 就 完 全 不 同 了 … …
	Smalltalk26											= "SVM_10_Smalltalk26";					//… … 他 还 需 要 更 多 的 实 践 … …
	Smalltalk27											= "SVM_10_Smalltalk27";					//… … 他 对 于 责 任 了 解 多 少 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_10_Smalltalk28";					//… … 英 诺 斯 会 公 正 地 作 出 处 罚 … …
	Smalltalk29											= "SVM_10_Smalltalk29";					//… … 美 德 的 路 途 漫 长 而 崎 岖 … …
	Smalltalk30											= "SVM_10_Smalltalk30";					//… … 只 有 英 诺 斯 能 决 定 事 情 是 对 还 是 错 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_10_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_10_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_10_NoLearnYoureBetter";			//我 已 经 不 能 再 教 你 什 么 了 。 你 已 经 变 得 太 出 色 了 。
	YouLearnedSomething									= "SVM_10_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_10_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_10_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_10_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_10_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_10_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_10_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_10_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_10_WHERETO";						//你 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_10_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_10_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_10_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_10_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_10_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_10_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_10_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_10_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_10_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_10_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_10_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_10_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_10_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_10_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_10_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_10_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_10_Dead";						//啊啊啊啊 !
	Aargh_1												= "SVM_10_Aargh_1";						// 啊
	Aargh_2												= "SVM_10_Aargh_2";						// 啊
	Aargh_3												= "SVM_10_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_10_Addon_WrongArmor";			//那 些 是 什 么 衣 服 ？ 它 们 根 本 不 适 合 你 。 走 开 。
	ADDON_WRONGARMOR_SLD								= "SVM_10_ADDON_WRONGARMOR_SLD";		//如 果 你 是 我 们 的 人 ， 那 么 你 就 应 该 穿 我 们 的 装 备 。 先 去 换 一 下 。
	ADDON_WRONGARMOR_MIL								= "SVM_10_ADDON_WRONGARMOR_MIL";		//如 果 有 人 发 给 了 你 国 王 的 盔 甲 ， 那 你 最 好 穿 上 它 。
	ADDON_WRONGARMOR_KDF								= "SVM_10_ADDON_WRONGARMOR_KDF";		//如 果 你 拒 绝 穿 袍 子 ， 那 么 你 就 是 否 定 英 诺 斯 。 去 想 想 吧 。
	ADDON_NOARMOR_BDT									= "SVM_10_ADDON_ADDON_NOARMOR_BDT";		//如 果 你 连 盔 甲 都 买 不 起 ， 那 我 为 什 么 要 和 你 谈 话 ？

	ADDON_DIEBANDIT										= "SVM_10_ADDON_DIEBANDIT";				//你 这 卑 鄙 的 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_10_ADDON_DIRTYPIRATE";			//你 这 个 卑 鄙 的 海 盗 ！
};

instance SVM_11(C_SVM)
{
	SC_HeyWaitASecond									= "SVM_11_Addon_HeyWaitASecond";		//（ 呼 喊 ） 等 等 ！

	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_11_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_11_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_11_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_11_IGetYouStill";				//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_11_DieEnemy";					//你 现 在 要 倒 霉 了 ！
	DieMonster											= "SVM_11_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_11_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_11_HandsOff";					//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_11_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_11_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_11_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_11_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_11_YouDareHitMe";				//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_11_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_11_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_11_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_11_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_11_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_11_EnemyKilled";					//够 你 受 的 ， 罪 犯 ！
	MonsterKilled										= "SVM_11_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_11_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_11_rumfummlerDown";				//以 后 ， 不 要 再 用 你 的 爪 子 去 碰 那 些 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_11_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_11_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_11_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_11_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_11_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_11_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_11_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_11_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_11_SpareMe";						//不 要 来 烦 我 ！
	RunAway												= "SVM_11_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_11_Alarm";						//警 报 ！
	Guards												= "SVM_11_Guards";						//卫 兵 ！
	Help												= "SVM_11_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_11_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_11_GoodKill";					//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_11_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_11_RunCoward";					//（ 大 声 呼 叫 ） 住 手 ， 你 这 个 罪 犯 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_11_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_11_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_11_YesGoOutOfHere";				//对 ， 你 悄 悄 溜 走 吧 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_11_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 ？
	YouDisturbedMySlumber								= "SVM_11_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_11_ITookYourGold";				//金 子 ！ 好 吧 ， 那 是 我 的 … …
	ShitNoGold											= "SVM_11_ShitNoGold";					//你 身 上 没 有 一 分 钱 ？
	ITakeYourWeapon										= "SVM_11_ITakeYourWeapon";				//我 想 你 的 武 器 要 归 我 保 管 了 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_11_WhatAreYouDoing";				//（ 警 告 ） 嘿 ！ 小 心 ！
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_11_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 没 拿 够 ？
	StopMagic											= "SVM_11_StopMagic";					//不 要 用 你 的 魔 法 打 我 ！
	ISaidStopMagic										= "SVM_11_ISaidStopMagic";				//停 止 那 个 魔 法 ！ 你 的 耳 朵 出 问 题 了 吗 ！ ？
	WeaponDown											= "SVM_11_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_11_ISaidWeaponDown";				//你 是 聋 了 还 是 怎 么 ？ 我 说 ： 放 下 那 武 器 ！
	WiseMove											= "SVM_11_WiseMove";					//看 ， 那 并 不 难 。
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_11_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 我 们 会 调 查 那 里 … …
	OhMyHead											= "SVM_11_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_11_TheresAFight";				//（ 热 切 的 ） 现 在 该 采 取 一 些 行 动 了 ！
	OhMyGodItsAFight									= "SVM_11_OhMyGodItsAFight";			//（ 惊 慌 的 ） 他 们 正 试 图 敲 碎 对 方 的 骨 头 … …
	GoodVictory											= "SVM_11_GoodVictory";					//（ 邪 恶 的 笑 ） 他 罪 有 应 得 ！
	NotBad												= "SVM_11_NotBad";						//（ 满 意 的 ） 还 不 坏 … …
	OhMyGodHesDown										= "SVM_11_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 粗 鲁 的 家 伙 … …
	CheerFriend01										= "SVM_11_CheerFriend01";				//对 ， 那 是 正 确 的 做 法 ！
	CheerFriend02										= "SVM_11_CheerFriend02";				//你 在 等 什 么 ？
	CheerFriend03										= "SVM_11_CheerFriend03";				//打 呀 小 子 ！
	Ooh01												= "SVM_11_Ooh01";						//什 么 都 不 许 动 ！
	Ooh02												= "SVM_11_Ooh02";						//让 他 看 看 谁 是 这 里 的 头 儿 ！
	Ooh03												= "SVM_11_Ooh03";						//该 死 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_11_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_11_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_11_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_11_ABS_COMMANDER";				//我 听 说 你 去 了 指 挥 官 那 里 ， 并 把 事 情 解 决 了 。
	ABS_MONASTERY										= "SVM_11_ABS_MONASTERY";				//我 听 说 你 去 了 帕 兰 神 父 那 里 忏 悔 了 你 的 罪 。
	ABS_FARM											= "SVM_11_ABS_FARM";					//他 们 说 你 去 了 李 那 里 ， 并 解 决 了 问 题 。
	ABS_GOOD											= "SVM_11_ABS_GOOD";					//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_11_SHEEPKILLER_CRIME";			//竟 然 在 屠 杀 我 们 的 绵 羊 ！ 滚 开 ， 破 坏 者 ！
	ATTACK_CRIME										= "SVM_11_ATTACK_CRIME";				//我 不 和 卑 鄙 的 无 赖 说 话 ！
	THEFT_CRIME											= "SVM_11_THEFT_CRIME";					//滚 出 我 的 视 线 ， 你 这 个 肮 脏 的 盗 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_11_PAL_CITY_CRIME";				//你 在 给 你 们 的 修 道 会 丢 脸 ！ 哈 根 勋 爵 会 狂 怒 的 ！
	MIL_CITY_CRIME										= "SVM_11_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 安 德 烈 勋 爵 会 教 你 一 些 礼 节 ！
	CITY_CRIME											= "SVM_11_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 说 你 所 做 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_11_MONA_CRIME";					//帕 兰 神 父 听 到 这 些 不 会 高 兴 的 ！
	FARM_CRIME											= "SVM_11_FARM_CRIME";					//李 会 教 训 你 的 ！ 你 会 看 到 后 果 的 ！
	OC_CRIME											= "SVM_11_OC_CRIME";					//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_11_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_11_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 需 要 我 告 诉 你 谁 说 了 算 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_11_TOUGHGUY_PLAYERATTACK";		//你 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_11_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_11_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_11_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_11_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_11_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_11_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_11_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_11_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_11_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_11_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_11_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_11_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_11_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_11_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_11_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_11_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_11_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_11_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_11_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_11_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_11_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_11_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_11_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_11_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_11_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_11_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_11_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_11_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_11_Smalltalk01";					//… … 你 真 的 认 为 … …
	Smalltalk02											= "SVM_11_Smalltalk02";					//… … 万 事 皆 有 可 能 … …
	Smalltalk03											= "SVM_11_Smalltalk03";					// ...他应该知道的
	Smalltalk04											= "SVM_11_Smalltalk04";					// ...你认为我的麻烦还不够多吗?
	Smalltalk05											= "SVM_11_Smalltalk05";					//… … 谁 告 诉 你 那 些 … …
	Smalltalk06											= "SVM_11_Smalltalk06";					//… … 那 只 会 造 成 更 多 的 麻 烦 … …
	Smalltalk07											= "SVM_11_Smalltalk07";					//… … 已 经 有 了 各 种 各 样 的 谣 传 … …
	Smalltalk08											= "SVM_11_Smalltalk08";					//… … 我 真 应 该 做 完 那 个 … …
	Smalltalk09											= "SVM_11_Smalltalk09";					//… … 那 些 都 是 谣 传 … …
	Smalltalk10											= "SVM_11_Smalltalk10";					//… … 最 好 弄 清 楚 你 在 和 谁 说 什 么 … …
	Smalltalk11											= "SVM_11_Smalltalk11";					//… … 我 应 该 早 点 告 诉 你 … …
	Smalltalk12											= "SVM_11_Smalltalk12";					//… … 从 来 没 有 人 问 过 我 … …
	Smalltalk13											= "SVM_11_Smalltalk13";					//… … 你 应 该 为 那 个 可 怜 人 感 到 悲 哀 … …
	Smalltalk14											= "SVM_11_Smalltalk14";					//… … 那 不 是 什 么 新 鲜 事 … …
	Smalltalk15											= "SVM_11_Smalltalk15";					//… … 那 显 而 易 见 … …
	Smalltalk16											= "SVM_11_Smalltalk16";					//… … 你 不 应 该 问 我 那 些 … …
	Smalltalk17											= "SVM_11_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_11_Smalltalk18";					//… … 你 已 经 知 道 我 在 想 什 么 了 … …
	Smalltalk19											= "SVM_11_Smalltalk19";					//… … 那 就 是 我 要 说 的 … …
	Smalltalk20											= "SVM_11_Smalltalk20";					//… … 什 么 都 不 会 因 为 那 个 而 改 变 … …
	Smalltalk21											= "SVM_11_Smalltalk21";					//… … 为 什 么 我 以 前 没 有 听 过 这 个 … …
	Smalltalk22											= "SVM_11_Smalltalk22";					//… … 让 我 们 等 等 看 会 发 生 什 么 … …
	Smalltalk23											= "SVM_11_Smalltalk23";					//… … 有 些 问 题 会 自 行 解 决 … …
	Smalltalk24											= "SVM_11_Smalltalk24";					//… … 我 不 想 再 听 到 那 些 了 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_11_Smalltalk25";					//… … 他 醉 倒 了 … …
	Smalltalk26											= "SVM_11_Smalltalk26";					//… … 我 不 应 该 受 到 那 样 的 待 遇 … …
	Smalltalk27											= "SVM_11_Smalltalk27";					//… … 他 们 都 像 兔 子 一 样 跑 了 ， 我 彻 底 孤 单 了 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_11_Smalltalk28";					//… … 圣 经 上 是 这 么 说 的 … …
	Smalltalk29											= "SVM_11_Smalltalk29";					//… … 我 一 直 都 是 以 英 诺 斯 之 名 行 事 … …
	Smalltalk30											= "SVM_11_Smalltalk30";					//… … 没 有 人 能 亵 渎 神 圣 的 修 道 会 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_11_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_11_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_11_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_11_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_11_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_11_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_11_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_11_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_11_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_11_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_11_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_11_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_11_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_11_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_11_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_11_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_11_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_11_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_11_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_11_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_11_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_11_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_11_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_11_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_11_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_11_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_11_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_11_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_11_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_11_Aargh_1";						// 啊
	Aargh_2												= "SVM_11_Aargh_2";						// 啊
	Aargh_3												= "SVM_11_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_11_Addon_WrongArmor";			//那 些 是 什 么 衣 服 ？ 它 们 根 本 不 适 合 你 。 走 开 。
	ADDON_WRONGARMOR_SLD								= "SVM_11_ADDON_WRONGARMOR_SLD";		//在 我 同 你 讲 话 的 时 候 ， 请 穿 上 我 们 盔 甲 。 现 在 走 开 。
	ADDON_WRONGARMOR_MIL								= "SVM_11_ADDON_WRONGARMOR_MIL";		//你 应 该 穿 上 国 王 的 盔 甲 。 现 在 走 吧 。
	ADDON_WRONGARMOR_KDF								= "SVM_11_ADDON_WRONGARMOR_KDF";		//你 的 衣 服 不 适 合 我 们 修 道 会 。 去 换 一 件 。
	ADDON_NOARMOR_BDT									= "SVM_11_ADDON_ADDON_NOARMOR_BDT";		//你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 ！

	ADDON_DIEBANDIT										= "SVM_11_ADDON_DIEBANDIT";				//另 一 个 强 盗 。
	ADDON_DIRTYPIRATE									= "SVM_11_ADDON_DIRTYPIRATE";			//海 盗 ！
};

instance SVM_12(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_12_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_12_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_12_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_12_IGetYouStill";				//现 在 我 抓 到 你 了 ！
	DieEnemy											= "SVM_12_DieEnemy";					//你 真 不 应 该 来 这 里 ！
	DieMonster											= "SVM_12_DieMonster";					//来 这 里 ， 你 这 丑 恶 的 野 兽 ！
	DirtyThief											= "SVM_12_DirtyThief";					//卑 鄙 的 小 偷 ！ 等 等 ！
	HandsOff											= "SVM_12_HandsOff";					//把 你 的 爪 子 拿 开 ！
	SheepKiller											= "SVM_12_SheepKiller";					//离 开 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_12_SheepKillerMonster";			//离 我 们 的 绵 羊 远 点 ， 你 这 丑 恶 的 野 兽 ！
	YouMurderer											= "SVM_12_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_12_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_12_YouDareHitMe";				//你 将 会 后 悔 这 么 做 ！
	YouAskedForIt										= "SVM_12_YouAskedForIt";				//我 警 告 你 ！
	ThenIBeatYouOutOfHere								= "SVM_12_ThenIBeatYouOutOfHere";		//我 说 了 出 去 ！
	WhatDidYouDoInThere									= "SVM_12_WhatDidYouDoInThere";			//嘿 ！ 你 在 那 里 做 什 么 ？
	WillYouStopFighting									= "SVM_12_WillYouStopFighting";			//停 下 ！ 马 上 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_12_KillEnemy";					//我 要 把 你 刺 穿 ， 混 蛋 ！
	EnemyKilled											= "SVM_12_EnemyKilled";					//那 是 给 你 的 … …
	MonsterKilled										= "SVM_12_MonsterKilled";				//我 喜 欢 这 个 混 蛋 ！
	Addon_MonsterKilled									= "SVM_12_Addon_MonsterKilled";			//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_12_ThiefDown";					//我 在 警 告 你 ！ 别 再 那 样 做 了 ， 你 这 卑 鄙 的 小 偷 ！
	rumfummlerDown										= "SVM_12_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_12_SheepAttackerDown";			//从 现 在 起 离 我 们 的 绵 羊 远 点 ！
	KillMurderer										= "SVM_12_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_12_StupidBeastKilled";			//多 么 愚 蠢 的 家 伙 ！
	NeverHitMeAgain										= "SVM_12_NeverHitMeAgain";				//看 你 还 敢 再 袭 击 我 ！
	YouBetterShouldHaveListened							= "SVM_12_YouBetterShouldHaveListened";	//我 警 告 你 ！
	GetUpAndBeGone										= "SVM_12_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_12_NeverEnterRoomAgain";			//我 不 想 在 这 里 再 见 到 你 ， 明 白 吗 ？
	ThereIsNoFightingHere								= "SVM_12_ThereIsNoFightingHere";		//这 里 不 能 打 架 ， 你 不 要 忘 记 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_12_SpareMe";						//不 要 做 任 何 傻 事 ！
	RunAway												= "SVM_12_RunAway";						//我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_12_Alarm";						//警 报 ！
	Guards												= "SVM_12_Guards";						//卫 兵 ！
	Help												= "SVM_12_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_12_GoodMonsterKill";				//（ 呼 喊 ） 把 那 些 野 兽 送 上 天 国 ！
	GoodKill											= "SVM_12_GoodKill";					//（ 大 喊 ） 对 ， 让 那 个 混 蛋 尝 尝 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_12_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_12_RunCoward";					//（ 大 声 喊 叫 ） 我 会 抓 住 你 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_12_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_12_WhyAreYouInHere";				//你 在 这 里 没 有 事 做 ！
	YesGoOutOfHere										= "SVM_12_YesGoOutOfHere";				//对 ， 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_12_WhatsThisSupposedToBe";		//你 在 等 什 么 ？ 你 在 这 里 偷 偷 摸 摸 干 什 么 ？
	YouDisturbedMySlumber								= "SVM_12_YouDisturbedMySlumber";		//（ 醒 来 ） 该 死 ， 你 想 要 做 什 么 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_12_ITookYourGold";				//嗯 ， 至 少 你 身 上 还 有 些 钱 。
	ShitNoGold											= "SVM_12_ShitNoGold";					//一 个 金 币 都 没 有 - 呸 。
	ITakeYourWeapon										= "SVM_12_ITakeYourWeapon";				//我 想 我 可 以 拿 走 你 的 武 器 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_12_WhatAreYouDoing";				//（ 警 告 ） 小 子 ！ 你 还 想 再 来 一 次 吗 ？
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_12_LookingForTroubleAgain";		//（ 挑 衅 的 ） 还 想 再 挨 一 次 揍 ？
	StopMagic											= "SVM_12_StopMagic";					//停 止 那 个 魔 法 ！
	ISaidStopMagic										= "SVM_12_ISaidStopMagic";				//最 后 警 告 ！ 停 止 那 个 魔 法 ！
	WeaponDown											= "SVM_12_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_12_ISaidWeaponDown";				//把 那 个 放 下 ， 否 则 吃 不 了 兜 着 走 ！
	WiseMove											= "SVM_12_WiseMove";					//嘿 ， 你 并 不 象 看 起 来 那 么 傻 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_12_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 不 要 再 那 样 了 … …
	OhMyHead											= "SVM_12_OhMyHead";					//（ 自 言 自 语 ） 哦 ！ 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_12_TheresAFight";				//（ 贪 婪 的 ） 现 在 好 戏 上 场 … …
	OhMyGodItsAFight									= "SVM_12_OhMyGodItsAFight";			//（ 沮 丧 的 ） 哦 ， 我 的 天 啊 … …
	GoodVictory											= "SVM_12_GoodVictory";					//（ 邪 恶 的 笑 ） 教 训 他 一 下 … …
	NotBad												= "SVM_12_NotBad";						//（ 满 意 的 ） 真 痛 快 ！
	OhMyGodHesDown										= "SVM_12_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 卑 劣 的 畜 牲 ！
	CheerFriend01										= "SVM_12_CheerFriend01";				//用 力 打 他 ！
	CheerFriend02										= "SVM_12_CheerFriend02";				//现 在 不 要 停 ！
	CheerFriend03										= "SVM_12_CheerFriend03";				//干 掉 他 ！
	Ooh01												= "SVM_12_Ooh01";						//留 神 ！
	Ooh02												= "SVM_12_Ooh02";						//格 挡 ！
	Ooh03												= "SVM_12_Ooh03";						//该 死 ， 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_12_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_12_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_12_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_12_ABS_COMMANDER";				//那 么 说 指 挥 官 把 你 的 事 摆 平 了 。
	ABS_MONASTERY										= "SVM_12_ABS_MONASTERY";				//那 么 说 帕 兰 神 父 已 经 赦 免 了 你 的 罪 恶 。
	ABS_FARM											= "SVM_12_ABS_FARM";					//那 么 说 你 已 经 见 过 李 ， 并 把 那 事 了 结 了 。
	ABS_GOOD											= "SVM_12_ABS_GOOD";					//好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_12_SHEEPKILLER_CRIME";			//你 在 攻 击 绵 羊 ？ 我 想 你 是 找 不 到 其 它 更 无 力 抵 抗 的 牺 牲 品 了 吧 ？
	ATTACK_CRIME										= "SVM_12_ATTACK_CRIME";				//对 那 些 下 流 的 恶 棍 来 说 ， 我 做 不 了 什 么 ！
	THEFT_CRIME											= "SVM_12_THEFT_CRIME";					//对 那 些 盗 贼 来 说 ， 我 做 不 了 任 何 事 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_12_PAL_CITY_CRIME";				//那 么 说 你 想 成 为 一 名 圣 骑 士 ？ 那 就 等 你 听 到 哈 根 勋 爵 对 这 件 事 有 什 么 说 法 吧 ！
	MIL_CITY_CRIME										= "SVM_12_MIL_CITY_CRIME";				//你 真 的 属 于 城 市 卫 兵 ？ 安 德 烈 勋 爵 不 会 容 忍 那 样 的 人 ！
	CITY_CRIME											= "SVM_12_CITY_CRIME";					//趁 你 还 能 走 路 ， 去 找 安 德 烈 勋 爵 。
	// -------------------------
	MONA_CRIME											= "SVM_12_MONA_CRIME";					//去 找 帕 兰 神 父 。 他 将 会 帮 助 你 偿 还 你 的 罪 恶 ！
	FARM_CRIME											= "SVM_12_FARM_CRIME";					//李 会 听 说 了 此 事 ， 而 你 将 需 赔 偿 ！
	OC_CRIME											= "SVM_12_OC_CRIME";					//指 挥 官 加 隆 德 不 会 感 到 愉 快 的 。 你 最 好 在 事 态 变 得 更 糟 糕 之 前 去 和 他 谈 谈 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_12_TOUGHGUY_ATTACKLOST";			//好 吧 - 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_12_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 想 你 现 在 知 道 了 正 在 和 谁 打 交 道 。 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_12_TOUGHGUY_PLAYERATTACK";		//又 是 你 ？ 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_12_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_12_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_12_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_12_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_12_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_12_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_12_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_12_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_12_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_12_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_12_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_12_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_12_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_12_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_12_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_12_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_12_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_12_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_12_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_12_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_12_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_12_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_12_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_12_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_12_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_12_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_12_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_12_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_12_Smalltalk01";					//… … 我 不 在 乎 … …
	Smalltalk02											= "SVM_12_Smalltalk02";					//… … 没 人 想 知 道 … …
	Smalltalk03											= "SVM_12_Smalltalk03";					//… … 那 是 他 的 决 定 ， 不 是 吗 … …
	Smalltalk04											= "SVM_12_Smalltalk04";					//… … 不 知 道 ， 你 告 诉 我 … …
	Smalltalk05											= "SVM_12_Smalltalk05";					//… … 我 不 参 与 … …
	Smalltalk06											= "SVM_12_Smalltalk06";					//… … 我 没 时 间 去 管 那 样 的 事 … …
	Smalltalk07											= "SVM_12_Smalltalk07";					//… … 我 无 法 带 着 那 个 离 开 … …
	Smalltalk08											= "SVM_12_Smalltalk08";					//… … 你 不 必 告 诉 我 那 些 … …
	Smalltalk09											= "SVM_12_Smalltalk09";					//… … 在 那 里 ， 那 样 做 … …
	Smalltalk10											= "SVM_12_Smalltalk10";					//… … 我 能 告 诉 你 的 事 … …
	Smalltalk11											= "SVM_12_Smalltalk11";					//… … 你 不 能 信 任 那 个 … …
	Smalltalk12											= "SVM_12_Smalltalk12";					//… … 我 通 常 亲 自 去 说 … …
	Smalltalk13											= "SVM_12_Smalltalk13";					//… … 还 有 更 多 ， 相 信 我 … …
	Smalltalk14											= "SVM_12_Smalltalk14";					//… … 又 一 次 到 处 都 是 同 样 东 西 … …
	Smalltalk15											= "SVM_12_Smalltalk15";					//… … 告 诉 我 那 不 是 真 的 … …
	Smalltalk16											= "SVM_12_Smalltalk16";					//… … 它 迟 早 会 出 现 … …
	Smalltalk17											= "SVM_12_Smalltalk17";					//… … 他 真 的 应 该 多 了 解 一 些 … …
	Smalltalk18											= "SVM_12_Smalltalk18";					//… … 那 永 远 不 会 改 变 … …
	Smalltalk19											= "SVM_12_Smalltalk19";					//… … 那 不 是 秘 密 … …
	Smalltalk20											= "SVM_12_Smalltalk20";					//… … 那 没 什 么 大 不 了 的 … …
	Smalltalk21											= "SVM_12_Smalltalk21";					//… … 他 认 为 它 和 那 个 一 样 简 单 … …
	Smalltalk22											= "SVM_12_Smalltalk22";					//… … 没 人 真 的 想 听 到 那 个 … …
	Smalltalk23											= "SVM_12_Smalltalk23";					//… … 那 就 是 事 实 … …
	Smalltalk24											= "SVM_12_Smalltalk24";					//… … 你 只 要 听 着 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_12_Smalltalk25";					//… … 如 果 事 情 没 按 我 们 的 计 划 发 展 的 话 ， 情 况 就 完 全 不 同 了 … …
	Smalltalk26											= "SVM_12_Smalltalk26";					//… … 他 还 需 要 更 多 的 实 践 … …
	Smalltalk27											= "SVM_12_Smalltalk27";					//… … 他 对 于 责 任 了 解 多 少 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_12_Smalltalk28";					//… … 英 诺 斯 会 公 正 地 作 出 处 罚 … …
	Smalltalk29											= "SVM_12_Smalltalk29";					//… … 美 德 的 路 途 漫 长 而 崎 岖 … …
	Smalltalk30											= "SVM_12_Smalltalk30";					//… … 只 有 英 诺 斯 能 决 定 事 情 是 对 还 是 错 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_12_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_12_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_12_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_12_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_12_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_12_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_12_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_12_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_12_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_12_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_12_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_12_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_12_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_12_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_12_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_12_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_12_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_12_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_12_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_12_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_12_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_12_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_12_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_12_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_12_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_12_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_12_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_12_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_12_Dead";						//啊啊啊啊 !
	Aargh_1												= "SVM_12_Aargh_1";						// 啊
	Aargh_2												= "SVM_12_Aargh_2";						// 啊
	Aargh_3												= "SVM_12_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_12_Addon_WrongArmor";			//你 的 衣 服 可 能 不 适 合 你 。 先 去 把 它 换 掉 。
	ADDON_WRONGARMOR_SLD								= "SVM_12_ADDON_WRONGARMOR_SLD";		//如 果 想 和 我 说 话 ， 就 穿 上 你 的 盔 甲 。
	ADDON_WRONGARMOR_MIL								= "SVM_12_ADDON_WRONGARMOR_MIL";		//士 兵 必 须 要 穿 上 国 王 的 盔 甲 。 没 有 例 外 ！ 所 以 ， 去 换 吧 。
	ADDON_WRONGARMOR_KDF								= "SVM_12_ADDON_WRONGARMOR_KDF";		//你 的 衣 服 不 适 合 我 们 修 道 会 。 去 换 一 件 。
	ADDON_NOARMOR_BDT									= "SVM_12_ADDON_ADDON_NOARMOR_BDT";		//你 连 盔 甲 都 买 不 起 。 我 不 和 低 能 儿 说 话 。

	ADDON_DIEBANDIT										= "SVM_12_ADDON_DIEBANDIT";				//我 会 把 你 撕 成 碎 片 ， 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_12_ADDON_DIRTYPIRATE";			//我 会 把 你 撕 成 碎 片 ， 海 盗 ！
};

instance SVM_13(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_13_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_13_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_13_Weather";						//讨 厌 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_13_IGetYouStill";				//我 现 在 要 抓 住 你 ！
	DieEnemy											= "SVM_13_DieEnemy";					//我 要 把 你 撕 成 碎 片 ！
	DieMonster											= "SVM_13_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_13_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_13_HandsOff";					//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_13_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_13_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_13_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_13_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_13_YouDareHitMe";				//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_13_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_13_ThenIBeatYouOutOfHere";		//你 不 想 走 ？ 好 吧 ！
	WhatDidYouDoInThere									= "SVM_13_WhatDidYouDoInThere";			//你 在 哪 里 想 做 什 么 ？
	WillYouStopFighting									= "SVM_13_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_13_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_13_EnemyKilled";					//你 罪 有 应 得 ， 罪 犯 ！
	MonsterKilled										= "SVM_13_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_13_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_13_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_13_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_13_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_13_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_13_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_13_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_13_GetUpAndBeGone";				//现 在 从 这 里 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_13_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_13_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_13_SpareMe";						//不 要 伤 害 我 ！
	RunAway												= "SVM_13_RunAway";						//喔 ， 该 死 ！ ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_13_Alarm";						//警 报 ！
	Guards												= "SVM_13_Guards";						//卫 兵 ！
	Help												= "SVM_13_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_13_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_13_GoodKill";					//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_13_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_13_RunCoward";					//（ 大 声 呼 叫 ） 对 ！ 能 跑 多 快 跑 多 快 吧 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_13_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_13_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_13_YesGoOutOfHere";				//嘿 ， 从 这 里 滚 出 去 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_13_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 。
	YouDisturbedMySlumber								= "SVM_13_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_13_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_13_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_13_ITakeYourWeapon";				//我 要 把 这 件 武 器 妥 为 保 管 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_13_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_13_LookingForTroubleAgain";		//你 还 没 拿 够 吗 ？
	StopMagic											= "SVM_13_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_13_ISaidStopMagic";				//想 挨 鞭 子 吗 ？ 马 上 停 止 ！ ！ ！
	WeaponDown											= "SVM_13_WeaponDown";					//把 武 器 放 下 ！
	ISaidWeaponDown										= "SVM_13_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_13_WiseMove";					//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_13_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_13_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_13_TheresAFight";				//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_13_OhMyGodItsAFight";			//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_13_GoodVictory";					//（ 带 着 邪 恶 的 笑 ） 你 真 正 教 训 了 他 一 顿 ！
	NotBad												= "SVM_13_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_13_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 残 忍 … …
	CheerFriend01										= "SVM_13_CheerFriend01";				//那 打 啊 ！
	CheerFriend02										= "SVM_13_CheerFriend02";				//让 他 尝 尝 你 所 有 的 手 段 ！
	CheerFriend03										= "SVM_13_CheerFriend03";				//让 他 看 看 ！
	Ooh01												= "SVM_13_Ooh01";						//坚 持 住 ！
	Ooh02												= "SVM_13_Ooh02";						//留 神 ！
	Ooh03												= "SVM_13_Ooh03";						//哇 ！ 真 痛 快 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_13_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_13_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_13_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_13_ABS_COMMANDER";				//所 以 你 去 了 指 挥 官 那 里 ， 并 把 问 题 解 决 了 。
	ABS_MONASTERY										= "SVM_13_ABS_MONASTERY";				//所 以 你 去 帕 兰 神 父 那 里 赎 罪 。
	ABS_FARM											= "SVM_13_ABS_FARM";					//所 以 你 去 找 了 李 ， 并 将 事 情 理 顺 。
	ABS_GOOD											= "SVM_13_ABS_GOOD";					//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_13_SHEEPKILLER_CRIME";			//就 象 那 样 屠 杀 我 们 的 绵 羊 ！
	ATTACK_CRIME										= "SVM_13_ATTACK_CRIME";				//走 开 ， 你 这 个 丑 恶 的 畜 牲 ！
	THEFT_CRIME											= "SVM_13_THEFT_CRIME";					//走 开 ， 你 这 可 怜 的 小 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_13_PAL_CITY_CRIME";				//你 丢 了 修 道 会 的 脸 ！ 等 着 哈 根 勋 爵 听 说 这 些 事 吧 ！
	MIL_CITY_CRIME										= "SVM_13_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 等 着 安 德 烈 勋 爵 听 说 此 事 吧 ！
	CITY_CRIME											= "SVM_13_CITY_CRIME";					//等 到 安 德 烈 勋 爵 听 说 此 事 的 时 候 。
	// -------------------------
	MONA_CRIME											= "SVM_13_MONA_CRIME";					//等 到 帕 兰 神 父 听 说 此 事 的 时 候 ！
	FARM_CRIME											= "SVM_13_FARM_CRIME";					//等 到 李 听 到 风 声 的 时 候 … …
	OC_CRIME											= "SVM_13_OC_CRIME";					//等 到 指 挥 官 加 隆 德 听 说 此 事 的 时 候 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_13_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 是 更 厉 害 一 些 的 战 士 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_13_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 我 早 知 道 是 那 样 ， 现 在 ， 你 也 清 楚 我 们 之 间 谁 更 强 … … 你 想 要 什 么 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_13_TOUGHGUY_PLAYERATTACK";		//我 以 为 你 想 要 向 我 挑 战 。 你 改 变 主 意 了 吗 ？ 你 更 喜 欢 聊 天 ， 对 吗 ？ （ 大 笑 ）
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_13_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_13_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_13_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_13_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_13_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_13_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_13_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_13_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_13_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_13_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_13_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_13_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_13_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_13_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_13_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_13_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_13_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_13_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_13_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_13_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_13_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_13_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_13_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_13_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_13_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_13_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_13_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_13_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_13_Smalltalk01";					//… … 我 不 在 乎 … …
	Smalltalk02											= "SVM_13_Smalltalk02";					//… … 没 人 想 知 道 … …
	Smalltalk03											= "SVM_13_Smalltalk03";					//… … 那 是 他 的 决 定 ， 不 是 吗 … …
	Smalltalk04											= "SVM_13_Smalltalk04";					//… … 不 知 道 ， 你 告 诉 我 … …
	Smalltalk05											= "SVM_13_Smalltalk05";					//… … 我 不 参 与 … …
	Smalltalk06											= "SVM_13_Smalltalk06";					//… … 我 没 时 间 去 管 那 样 的 事 … …
	Smalltalk07											= "SVM_13_Smalltalk07";					//… … 我 无 法 带 着 那 个 离 开 … …
	Smalltalk08											= "SVM_13_Smalltalk08";					//… … 你 不 必 告 诉 我 那 些 … …
	Smalltalk09											= "SVM_13_Smalltalk09";					//… … 在 那 里 ， 那 样 做 … …
	Smalltalk10											= "SVM_13_Smalltalk10";					//… … 我 能 告 诉 你 的 事 … …
	Smalltalk11											= "SVM_13_Smalltalk11";					//… … 你 不 能 信 任 那 个 … …
	Smalltalk12											= "SVM_13_Smalltalk12";					//… … 我 通 常 亲 自 去 说 … …
	Smalltalk13											= "SVM_13_Smalltalk13";					//… … 还 有 更 多 ， 相 信 我 … …
	Smalltalk14											= "SVM_13_Smalltalk14";					//… … 又 一 次 到 处 都 是 同 样 东 西 … …
	Smalltalk15											= "SVM_13_Smalltalk15";					//… … 告 诉 我 那 不 是 真 的 … …
	Smalltalk16											= "SVM_13_Smalltalk16";					//… … 它 迟 早 会 出 现 … …
	Smalltalk17											= "SVM_13_Smalltalk17";					//… … 他 真 的 应 该 多 了 解 一 些 … …
	Smalltalk18											= "SVM_13_Smalltalk18";					//… … 那 永 远 不 会 改 变 … …
	Smalltalk19											= "SVM_13_Smalltalk19";					//… … 那 不 是 秘 密 … …
	Smalltalk20											= "SVM_13_Smalltalk20";					//… … 那 没 什 么 大 不 了 的 … …
	Smalltalk21											= "SVM_13_Smalltalk21";					//… … 他 认 为 它 和 那 个 一 样 简 单 … …
	Smalltalk22											= "SVM_13_Smalltalk22";					//… … 没 人 真 的 想 听 到 那 个 … …
	Smalltalk23											= "SVM_13_Smalltalk23";					//… … 那 就 是 事 实 … …
	Smalltalk24											= "SVM_13_Smalltalk24";					//… … 你 只 要 听 着 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_13_Smalltalk25";					//… … 如 果 事 情 没 按 我 们 的 计 划 发 展 的 话 ， 情 况 就 完 全 不 同 了 … …
	Smalltalk26											= "SVM_13_Smalltalk26";					//… … 他 还 需 要 更 多 的 实 践 … …
	Smalltalk27											= "SVM_13_Smalltalk27";					//… … 他 对 于 责 任 了 解 多 少 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_13_Smalltalk28";					//… … 英 诺 斯 会 公 正 地 作 出 处 罚 … …
	Smalltalk29											= "SVM_13_Smalltalk29";					//… … 美 德 的 路 途 漫 长 而 崎 岖 … …
	Smalltalk30											= "SVM_13_Smalltalk30";					//… … 只 有 英 诺 斯 能 决 定 事 情 是 对 还 是 错 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_13_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_13_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_13_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_13_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_13_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_13_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_13_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_13_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_13_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_13_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_13_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_13_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_13_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_13_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_13_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_13_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_13_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_13_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_13_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_13_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_13_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_13_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_13_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_13_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_13_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_13_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_13_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_13_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_13_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_13_Aargh_1";						// 啊
	Aargh_2												= "SVM_13_Aargh_2";						// 啊
	Aargh_3												= "SVM_13_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_13_Addon_WrongArmor";			//那 些 是 什 么 衣 服 ？ 它 们 根 本 不 适 合 你 。 走 开 。
	ADDON_WRONGARMOR_SLD								= "SVM_13_ADDON_WRONGARMOR_SLD";		//你 还 没 有 穿 上 你 的 盔 甲 。 去 换 上 它 。
	ADDON_WRONGARMOR_MIL								= "SVM_13_ADDON_WRONGARMOR_MIL";		//你 应 该 为 穿 上 国 王 的 盔 甲 感 到 自 豪 ， 而 不 是 穿 着 这 样 的 破 布 四 处 乱 窜 。 现 在 ， 走 开 ！
	ADDON_WRONGARMOR_KDF								= "SVM_13_ADDON_WRONGARMOR_KDF";		//你 为 什 么 不 穿 上 我 们 修 道 会 的 服 装 ？ 去 好 好 想 想 。
	ADDON_NOARMOR_BDT									= "SVM_13_ADDON_ADDON_NOARMOR_BDT";		//你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 ！

	ADDON_DIEBANDIT										= "SVM_13_ADDON_DIEBANDIT";				//你 这 卑 鄙 的 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_13_ADDON_DIRTYPIRATE";			//你 这 可 怜 的 海 盗 ！
};

instance SVM_14(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_14_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_14_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_14_Weather";						//多 么 糟 糕 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_14_IGetYouStill";				//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_14_DieEnemy";					//你 现 在 要 倒 霉 了 ！
	DieMonster											= "SVM_14_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_14_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_14_HandsOff";					//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_14_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_14_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_14_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_14_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_14_YouDareHitMe";				//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_14_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_14_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_14_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_14_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_14_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_14_EnemyKilled";					//够 你 受 的 ， 罪 犯 ！
	MonsterKilled										= "SVM_14_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_14_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_14_rumfummlerDown";				//以 后 ， 不 要 再 用 你 的 爪 子 去 碰 那 些 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_14_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_14_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_14_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_14_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_14_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_14_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_14_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_14_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_14_SpareMe";						//不 要 来 烦 我 ！
	RunAway												= "SVM_14_RunAway";						//狗 屁 ！ 我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_14_Alarm";						//警 报 ！
	Guards												= "SVM_14_Guards";						//卫 兵 ！
	Help												= "SVM_14_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_14_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 - 又 少 了 一 头 肮 脏 的 野 兽 ！
	GoodKill											= "SVM_14_GoodKill";					//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_14_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_14_RunCoward";					//（ 大 声 呼 叫 ） 住 手 ， 你 这 个 罪 犯 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_14_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_14_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_14_YesGoOutOfHere";				//对 ， 你 悄 悄 溜 走 吧 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_14_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 。
	YouDisturbedMySlumber								= "SVM_14_YouDisturbedMySlumber";		//（ 醒 过 来 ） 该 死 ， 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_14_ITookYourGold";				//金 子 ！ 好 吧 ， 那 是 我 的 … …
	ShitNoGold											= "SVM_14_ShitNoGold";					//你 身 上 没 有 一 分 钱 ？
	ITakeYourWeapon										= "SVM_14_ITakeYourWeapon";				//我 想 你 的 武 器 要 归 我 保 管 了 。
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_14_WhatAreYouDoing";				//（ 警 告 ） 嘿 ！ 小 心 ！
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_14_LookingForTroubleAgain";		//（ 挑 衅 ） 你 还 没 拿 够 ？
	StopMagic											= "SVM_14_StopMagic";					//不 要 用 你 的 魔 法 打 我 ！
	ISaidStopMagic										= "SVM_14_ISaidStopMagic";				//停 止 那 个 魔 法 ！ 你 的 耳 朵 出 问 题 了 吗 ！ ？
	WeaponDown											= "SVM_14_WeaponDown";					//放 下 那 个 武 器 ！
	ISaidWeaponDown										= "SVM_14_ISaidWeaponDown";				//你 是 聋 了 还 是 怎 么 ？ 我 说 ： 放 下 那 武 器 ！
	WiseMove											= "SVM_14_WiseMove";					//看 ， 那 并 不 难 。
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_14_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 我 们 会 调 查 那 里 … …
	OhMyHead											= "SVM_14_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_14_TheresAFight";				//（ 热 切 的 ） 现 在 该 采 取 一 些 行 动 了 ！
	OhMyGodItsAFight									= "SVM_14_OhMyGodItsAFight";			//（ 惊 慌 的 ） 他 们 正 试 图 敲 碎 对 方 的 骨 头 … …
	GoodVictory											= "SVM_14_GoodVictory";					//（ 邪 恶 的 笑 ） 他 罪 有 应 得 ！
	NotBad												= "SVM_14_NotBad";						//（ 满 意 的 ） 还 不 坏 … …
	OhMyGodHesDown										= "SVM_14_OhMyGodHesDown";				//（ 自 言 自 语 ） 多 么 粗 鲁 的 家 伙 … …
	CheerFriend01										= "SVM_14_CheerFriend01";				//对 ， 那 是 正 确 的 做 法 ！
	CheerFriend02										= "SVM_14_CheerFriend02";				//你 在 等 什 么 ？
	CheerFriend03										= "SVM_14_CheerFriend03";				//打 呀 小 子 ！
	Ooh01												= "SVM_14_Ooh01";						//什 么 都 不 许 动 ！
	Ooh02												= "SVM_14_Ooh02";						//让 他 看 看 谁 是 这 里 的 头 儿 ！
	Ooh03												= "SVM_14_Ooh03";						//该 死 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_14_WhatWasThat";					//（ 对 自 己 ， 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_14_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_14_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_14_ABS_COMMANDER";				//我 听 说 你 去 了 指 挥 官 那 里 ， 并 把 事 情 解 决 了 。
	ABS_MONASTERY										= "SVM_14_ABS_MONASTERY";				//我 听 说 你 去 了 帕 兰 神 父 那 里 忏 悔 了 你 的 罪 。
	ABS_FARM											= "SVM_14_ABS_FARM";					//他 们 说 你 去 了 李 那 里 ， 并 解 决 了 问 题 。
	ABS_GOOD											= "SVM_14_ABS_GOOD";					//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_14_SHEEPKILLER_CRIME";			//竟 然 在 屠 杀 我 们 的 绵 羊 ！ 滚 开 ， 破 坏 者 ！
	ATTACK_CRIME										= "SVM_14_ATTACK_CRIME";				//我 不 和 卑 鄙 的 无 赖 说 话 ！
	THEFT_CRIME											= "SVM_14_THEFT_CRIME";					//滚 出 我 的 视 线 ， 你 这 个 肮 脏 的 盗 贼 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_14_PAL_CITY_CRIME";				//你 在 给 你 们 的 修 道 会 丢 脸 ！ 哈 根 勋 爵 会 狂 怒 的 ！
	MIL_CITY_CRIME										= "SVM_14_MIL_CITY_CRIME";				//你 丢 了 城 市 卫 兵 的 脸 ！ 安 德 烈 勋 爵 会 教 你 一 些 礼 节 ！
	CITY_CRIME											= "SVM_14_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 说 你 所 做 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_14_MONA_CRIME";					//帕 兰 神 父 听 到 这 些 不 会 高 兴 的 ！
	FARM_CRIME											= "SVM_14_FARM_CRIME";					//李 会 教 训 你 的 ！ 你 会 看 到 后 果 的 ！
	OC_CRIME											= "SVM_14_OC_CRIME";					//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	TOUGHGUY_ATTACKLOST									= "SVM_14_TOUGHGUY_ATTACKLOST";			//好 吧 ， 好 吧 ， 你 赢 了 。 你 想 要 什 么 ？
	TOUGHGUY_ATTACKWON									= "SVM_14_TOUGHGUY_ATTACKWON";			//（ 洋 洋 自 得 ） 还 需 要 我 告 诉 你 谁 说 了 算 吗 ？
	TOUGHGUY_PLAYERATTACK								= "SVM_14_TOUGHGUY_PLAYERATTACK";		//你 还 想 再 向 我 挑 战 ， 是 吗 ？
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_14_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_14_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_14_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_14_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_14_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_14_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_14_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_14_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_14_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_14_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_14_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_14_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_14_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_14_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_14_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_14_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_14_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_14_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_14_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_14_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_14_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_14_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_14_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_14_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_14_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_14_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_14_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_14_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_14_Smalltalk01";					//… … 我 无 法 相 信 … …
	Smalltalk02											= "SVM_14_Smalltalk02";					//… … 我 不 十 分 肯 定 … …
	Smalltalk03											= "SVM_14_Smalltalk03";					//… … 但 是 他 都 知 道 了 … …
	Smalltalk04											= "SVM_14_Smalltalk04";					//… … 我 几 乎 不 知 道 还 能 相 信 什 么 … …
	Smalltalk05											= "SVM_14_Smalltalk05";					//… … 我 不 知 道 他 为 什 么 会 这 么 激 动 … …
	Smalltalk06											= "SVM_14_Smalltalk06";					//… … 我 已 经 陷 入 太 多 的 麻 烦 中 了 … …
	Smalltalk07											= "SVM_14_Smalltalk07";					//… … 我 听 说 了 一 两 件 事 … …
	Smalltalk08											= "SVM_14_Smalltalk08";					//… … 我 不 会 去 碰 那 个 … …
	Smalltalk09											= "SVM_14_Smalltalk09";					//… … 你 一 定 不 要 相 信 你 听 到 的 所 有 事 情 … …
	Smalltalk10											= "SVM_14_Smalltalk10";					//… … 他 不 是 从 我 那 里 得 到 那 个 的 … …
	Smalltalk11											= "SVM_14_Smalltalk11";					//… … 我 已 经 想 得 很 多 … …
	Smalltalk12											= "SVM_14_Smalltalk12";					//… … 从 来 没 人 征 求 过 我 的 意 见 … …
	Smalltalk13											= "SVM_14_Smalltalk13";					//… … 他 真 的 不 应 该 得 到 那 个 … …
	Smalltalk14											= "SVM_14_Smalltalk14";					//… … 别 告 诉 我 你 不 知 道 那 个 … …
	Smalltalk15											= "SVM_14_Smalltalk15";					//… … 那 很 显 然 … …
	Smalltalk16											= "SVM_14_Smalltalk16";					//… … 那 么 你 是 从 哪 里 见 到 的 那 个 … …
	Smalltalk17											= "SVM_14_Smalltalk17";					//… … 不 会 永 远 这 样 下 去 … …
	Smalltalk18											= "SVM_14_Smalltalk18";					//… … 关 于 那 件 事 我 有 自 己 的 看 法 … …
	Smalltalk19											= "SVM_14_Smalltalk19";					//… … 就 象 你 说 的 那 样 … …
	Smalltalk20											= "SVM_14_Smalltalk20";					//… … 我 不 相 信 这 会 改 变 … …
	Smalltalk21											= "SVM_14_Smalltalk21";					//… … 那 是 我 第 一 次 听 说 它 … …
	Smalltalk22											= "SVM_14_Smalltalk22";					//… … 我 们 所 能 做 的 只 有 等 着 看 … …
	Smalltalk23											= "SVM_14_Smalltalk23";					//… … 我 知 道 那 会 是 个 问 题 … …
	Smalltalk24											= "SVM_14_Smalltalk24";					//… … 那 么 他 们 为 什 么 不 听 我 的 … …
	// ToughGuy (SLD/MIL/DJG)
	Smalltalk25											= "SVM_14_Smalltalk25";					//… … 他 跑 起 来 就 像 是 贝 利 尔 在 后 面 追 他 一 样 … …
	Smalltalk26											= "SVM_14_Smalltalk26";					//… … 当 然 我 们 最 终 会 抓 到 他 … …
	Smalltalk27											= "SVM_14_Smalltalk27";					//… … 你 必 须 插 手 帮 忙 ， 并 把 事 情 处 理 好 … …
	// ProInnos (NOV/KDF/PAL)
	Smalltalk28											= "SVM_14_Smalltalk28";					//… … 有 人 根 本 不 知 道 他 们 有 多 么 邪 恶 … …
	Smalltalk29											= "SVM_14_Smalltalk29";					//… … 那 是 英 诺 斯 的 意 愿 … …
	Smalltalk30											= "SVM_14_Smalltalk30";					//… … 他 的 行 为 是 正 义 的 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_14_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_14_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_14_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_14_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_14_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_14_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_14_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_14_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_14_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_14_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_14_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_14_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_14_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_14_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_14_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_14_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_14_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_14_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_14_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_14_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_14_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_14_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_14_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_14_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_14_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_14_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_14_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_14_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_14_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_14_Aargh_1";						// 啊
	Aargh_2												= "SVM_14_Aargh_2";						// 啊
	Aargh_3												= "SVM_14_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_14_Addon_WrongArmor";			//你 的 衣 服 不 适 合 你 。 你 一 定 是 想 掩 饰 什 么 。 走 开 。
	ADDON_WRONGARMOR_SLD								= "SVM_14_ADDON_WRONGARMOR_SLD";		//如 果 你 想 同 我 谈 话 ， 你 必 须 穿 上 我 们 的 盔 甲 。
	ADDON_WRONGARMOR_MIL								= "SVM_14_ADDON_WRONGARMOR_MIL";		//要 为 军 队 而 自 豪 ， 不 要 穿 着 那 样 的 破 布 四 处 乱 窜 。 先 去 换 衣 服 。
	ADDON_WRONGARMOR_KDF								= "SVM_14_ADDON_WRONGARMOR_KDF";		//你 的 衣 服 不 适 合 我 们 修 道 会 。 去 换 一 件 。
	ADDON_NOARMOR_BDT									= "SVM_14_ADDON_ADDON_NOARMOR_BDT";		//你 甚 至 连 一 套 盔 甲 都 没 有 。 走 开 ！

	ADDON_DIEBANDIT										= "SVM_14_ADDON_DIEBANDIT";				//去 死 吧 ， 强 盗 。
	ADDON_DIRTYPIRATE									= "SVM_14_ADDON_DIRTYPIRATE";			//去 死 吧 ， 海 盗 。
};

// ****************
// 		SPIELER
// ****************

instance SVM_15(C_SVM) // PLAYER trocken,ernst
{
	// ------ Player-Only SVMs ---------------------------------------------------------------------
	SC_HeyTurnAround									= "SVM_15_SC_HeyTurnAround";			//嘿 ， 你 ！
	SC_HeyTurnAround02									= "SVM_15_SC_HeyTurnAround02";			//嘿 ， 你 ！
	SC_HeyTurnAround03									= "SVM_15_SC_HeyTurnAround03";			//嘿 !
	SC_HeyTurnAround04									= "SVM_15_SC_HeyTurnAround04";			//嘿 !

	SC_HeyWaitASecond									= "SVM_15_SC_HeyWaitASecond";			//等 等 ！

	DoesntWork											= "SVM_15_DoesntWork";					//不 起 作 用 。
	PickBroke											= "SVM_15_PickBroke";					//嗯 ， 它 坏 了 。
	NeedKey												= "SVM_15_NeedKey";						//我 需 要 钥 匙 打 开 那 个 … …
	NoMorePicks											= "SVM_15_NoMorePicks";					//没 有 其 它 开 锁 工 具 了 … …
	NoPickLockTalent									= "SVM_15_NoPickLockTalent";			//我 不 知 道 如 何 开 锁 。
	NoSweeping											= "SVM_15_NoSweeping";					//打 扫 所 有 的 房 间 会 花 上 一 辈 子 的 时 间 ！

	PICKLOCKORKEYMISSING								= "SVM_15_PICKLOCKORKEYMISSING";		//嗯 … … 我 没 有 开 锁 工 具 或 者 钥 匙 。
	KEYMISSING											= "SVM_15_KEYMISSING";					//如 果 没 有 正 确 的 钥 匙 ， 那 么 我 永 远 也 无 法 把 这 个 打 开 ！
	PICKLOCKMISSING										= "SVM_15_PICKLOCKMISSING";				//开 锁 工 具 应 该 会 有 帮 助 ！
	NEVEROPEN											= "SVM_15_NEVEROPEN";					//我 永 远 也 无 法 打 开 这 个 东 西 ！
	MISSINGITEM											= "SVM_15_MISSINGITEM";					//用 什 么 ？
	DONTKNOW											= "SVM_15_DONTKNOW";					//嗯 … … 不 … …
	NOTHINGTOGET										= "SVM_15_NOTHINGTOGET";				//那 里 什 么 都 没 有 … …
	NOTHINGTOGET02										= "SVM_15_NOTHINGTOGET02";				// 不
	NOTHINGTOGET03										= "SVM_15_NOTHINGTOGET03";				//没 什 么 可 拿 … …

	// ------ sonstige SVMs -------------------------------------------------------------------------
	Aargh_1												= "SVM_15_Aargh_1";						// 啊啊啊 !
	Aargh_2												= "SVM_15_Aargh_2";						// 啊
	Aargh_3												= "SVM_15_Aargh_3";						// 啊
	Dead												= "SVM_15_Dead";						// 啊
	Awake												= "SVM_15_Awake";						//（ 醒 来 ）

	// ------ Story SVMs ----------------------------------------------------------------------------

	IRDORATHTHEREYOUARE									= "SVM_15_IRDORATHTHEREYOUARE";			//嗯 。 那 你 就 藏 在 那 里 。 相 当 远 。 嗯 ， 我 需 要 一 条 船 才 能 到 达 那 里 。
	HEALSHRINE											= "SVM_15_HEALSHRINE";					//英 诺 斯 ， 赐 予 我 你 的 援 助 ， 净 化 这 座 神 龛 。
	HEALLASTSHRINE										= "SVM_15_HEALLASTSHRINE";				//英 诺 斯 ， 赐 予 我 你 的 援 助 ， 去 … … 那 里 。 那 应 该 是 最 后 一 次 。
	SCOPENSIRDORATHBOOK									= "SVM_15_SCOPENSIRDORATHBOOK";			//XARAK BENDARDO！ 啊 ， 书 打 开 了 。 里 面 藏 着 一 封 信 和 一 把 钥 匙 。
	SCOPENSLASTDOOR										= "SVM_15_SCOPENSLASTDOOR";				//KHADOSH EMEM KADAR！ 打 开 ！

	// ---------Addon SVMs----------------------------------------------------------------------------
	// ADDON>
	TRADE_1												= "SVM_15_Addon_TRADE_1";				//我 们 来 交 易 。
	TRADE_2												= "SVM_15_Addon_TRADE_2";				//让 我 看 看 你 的 货 物 。
	TRADE_3												= "SVM_15_Addon_TRADE_3";				//让 我 看 看 你 知 道 什 么 。

	VERSTEHE											= "SVM_15_Addon_VERSTEHE";				//我 明 白 了 。
	FOUNDTREASURE										= "SVM_15_Addon_FOUNDTREASURE";			//啊 。 我 想 我 发 现 了 什 么 东 西 。
	CANTUNDERSTANDTHIS									= "SVM_15_Addon_CANTUNDERSTANDTHIS";	//我 不 明 白 … …
	CANTREADTHIS										= "SVM_15_Addon_CANTREADTHIS";			//我 不 认 识 那 个 ！
	STONEPLATE_1										= "SVM_15_Addon_STONEPLATE_1";			//AKHANTAR！
	STONEPLATE_2										= "SVM_15_Addon_STONEPLATE_2";			//JHERHEDRA!
	STONEPLATE_3										= "SVM_15_Addon_STONEPLATE_3";			//URIZIEL RATIS!

	COUGH												= "SVM_15_Addon_COUGH";					//（ 咳 嗽 ） 哦 ， 伙 计 。 呃 ！ ！
	HUI													= "SVM_15_Addon_HUI";					//哦 哦 哦 ！

	ATTENTAT_ADDON_DESCRIPTION							= "SVM_15_ATTENTAT_ADDON_DESCRIPTION";	//你 知 道 关 于 有 人 刺 杀 伊 斯 特 班 的 事 吗 ？
	ATTENTAT_ADDON_DESCRIPTION2							= "SVM_15_ATTENTAT_ADDON_DESCRIPTION2";	//关 于 袭 击 伊 斯 特 班 的 事 … …
	ATTENTAT_ADDON_PRO									= "SVM_15_ATTENTAT_ADDON_PRO";			//我 要 杀 死 那 些 叛 徒 。
	ATTENTAT_ADDON_CONTRA								= "SVM_15_ATTENTAT_ADDON_CONTRA";		//我 在 寻 找 那 些 家 伙 ， 那 样 我 就 能 对 抗 伊 斯 特 班 。

	MINE_ADDON_DESCRIPTION								= "SVM_15_MINE_ADDON_DESCRIPTION";		//矿 坑 需 要 你 。
	ADDON_SUMMONANCIENTGHOST							= "SVM_15_ADDON_SUMMONANCIENTGHOST";	//IghoriatThorul。 出 来 见 我 吧 ， 夸 霍 德 隆 ， 战 士 职 业 的 远 古 首 领 ！
	ADDON_ANCIENTGHOST_NOTNEAR							= "SVM_15_ADDON_ANCIENTGHOST_NOTNEAR";	//嗯 … … 那 在 这 里 不 起 作 用 。
	ADDON_GOLD_DESCRIPTION								= "SVM_15_ADDON_GOLD_DESCRIPTION";		//关 于 采 金 我 需 要 了 解 一 些 什 么 ？

	ADDON_THISLITTLEBASTARD								= "SVM_15_Addon_ThisLittleBastard";		//啊 。 弗 朗 西 斯 的 支 付 记 录 。 看 来 这 个 人 往 他 自 己 的 腰 包 里 骗 了 很 多 金 子 。
	ADDON_OPENADANOSTEMPLE								= "SVM_15_Addon_OPENADANOSTEMPLE";		//JHERHEDRA AKHANTAR!

	// ADDON<
};

// ***************
// 		Frauen
// ***************

instance SVM_16(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_16_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_16_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_16_Weather";						//多 么 糟 糕 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_16_IGetYouStill";				//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_16_DieEnemy";					//你 现 在 要 倒 霉 了 ！
	DieMonster											= "SVM_16_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_16_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_16_HandsOff";					//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_16_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_16_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_16_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_16_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_16_YouDareHitMe";				//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_16_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_16_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_16_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_16_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_16_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_16_EnemyKilled";					//够 你 受 的 ， 罪 犯 ！
	MonsterKilled										= "SVM_16_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_16_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_16_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_16_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_16_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_16_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_16_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_16_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_16_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_16_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_16_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_16_SpareMe";						//不 要 伤 害 我 ！
	RunAway												= "SVM_16_RunAway";						//我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_16_Alarm";						//警 报 ！
	Guards												= "SVM_16_Guards";						//卫 兵 ！
	Help												= "SVM_16_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_16_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 ！
	GoodKill											= "SVM_16_GoodKill";					//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_16_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_16_RunCoward";					//（ 大 声 呼 叫 ） 马 上 停 止 ， 你 这 懦 夫 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_16_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_16_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_16_YesGoOutOfHere";				//对 ， 你 悄 悄 溜 走 吧 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_16_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 。
	YouDisturbedMySlumber								= "SVM_16_YouDisturbedMySlumber";		//（ 醒 来 ） 发 生 了 什 么 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_16_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_16_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_16_ITakeYourWeapon";				//我 要 把 这 件 武 器 妥 为 保 管 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_16_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_16_LookingForTroubleAgain";		//你 还 没 拿 够 吗 ？
	StopMagic											= "SVM_16_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_16_ISaidStopMagic";				//想 挨 打 吗 ？ 马 上 停 下 ！ ！ ！
	WeaponDown											= "SVM_16_WeaponDown";					//把 武 器 放 下 ！
	ISaidWeaponDown										= "SVM_16_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_16_WiseMove";					//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_16_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_16_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_16_TheresAFight";				//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_16_OhMyGodItsAFight";			//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_16_GoodVictory";					//（ 带 着 邪 恶 的 笑 ） 你 真 正 教 训 了 他 一 顿 ！
	NotBad												= "SVM_16_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_16_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 么 残 忍 … …
	CheerFriend01										= "SVM_16_CheerFriend01";				//打 败 他 ！
	CheerFriend02										= "SVM_16_CheerFriend02";				//好 好 教 训 他 ！
	CheerFriend03										= "SVM_16_CheerFriend03";				//让 他 尝 尝 滋 味 ！
	Ooh01												= "SVM_16_Ooh01";						//反 击 ！
	Ooh02												= "SVM_16_Ooh02";						//那 么 留 神 ！
	Ooh03												= "SVM_16_Ooh03";						//喔 ！ 那 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_16_WhatWasThat";					//（ 对 她 自 己 ， 清 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_16_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_16_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_16_ABS_COMMANDER";				//因 此 你 到 指 挥 官 那 里 把 你 的 名 字 澄 清 。
	ABS_MONASTERY										= "SVM_16_ABS_MONASTERY";				//然 后 你 去 了 帕 兰 神 父 那 里 ， 并 偿 还 了 你 的 罪 。
	ABS_FARM											= "SVM_16_ABS_FARM";					//李 摆 平 了 你 的 事 情 。
	ABS_GOOD											= "SVM_16_ABS_GOOD";					//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_16_SHEEPKILLER_CRIME";			//你 不 能 那 样 杀 死 我 们 的 绵 羊 ！ 走 开 ！
	ATTACK_CRIME										= "SVM_16_ATTACK_CRIME";				//你 是 一 个 残 忍 的 恶 棍 ， 我 不 想 为 你 做 任 何 事 。
	THEFT_CRIME											= "SVM_16_THEFT_CRIME";					//我 不 和 小 偷 说 话 - 现 在 走 开 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_16_PAL_CITY_CRIME";				//你 的 行 为 并 不 值 得 尊 敬 。 哈 根 勋 爵 不 喜 欢 这 样 ！
	MIL_CITY_CRIME										= "SVM_16_MIL_CITY_CRIME";				//你 的 行 为 让 城 市 卫 兵 感 到 耻 辱 ！ 安 德 烈 勋 爵 将 会 要 求 一 个 解 释 ！
	CITY_CRIME											= "SVM_16_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 到 你 所 作 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_16_MONA_CRIME";					//你 的 行 为 是 错 误 的 。 去 帕 兰 神 父 那 里 忏 悔 吧 。
	FARM_CRIME											= "SVM_16_FARM_CRIME";					//李 会 查 明 你 所 做 的 一 切 事 情 - 他 会 惩 罚 你 的 ！
	OC_CRIME											= "SVM_16_OC_CRIME";					//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_16_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_16_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_16_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_16_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_16_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_16_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_16_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_16_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_16_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_16_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_16_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_16_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_16_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_16_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_16_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_16_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_16_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_16_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_16_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_16_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_16_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_16_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_16_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_16_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_16_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_16_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_16_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_16_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_16_Smalltalk01";					//… … 真 的 ？ 多 有 趣 啊 … …
	Smalltalk02											= "SVM_16_Smalltalk02";					//… … 我 不 相 信 … …
	Smalltalk03											= "SVM_16_Smalltalk03";					//… … 我 的 丈 夫 不 那 样 认 为 … …
	Smalltalk04											= "SVM_16_Smalltalk04";					//… … 走 开 ， 不 要 对 我 说 那 些 … …
	Smalltalk05											= "SVM_16_Smalltalk05";					//… … 真 的 ， 我 亲 眼 目 睹 … …
	Smalltalk06											= "SVM_16_Smalltalk06";					//… … 你 不 是 说 … …
	Smalltalk07											= "SVM_16_Smalltalk07";					//… … 不 要 向 任 何 人 说 起 这 些 … …
	Smalltalk08											= "SVM_16_Smalltalk08";					//… … 现 在 很 不 景 气 … …
	Smalltalk09											= "SVM_16_Smalltalk09";					//… … 谁 说 情 况 是 那 样 的 ？ … …
	Smalltalk10											= "SVM_16_Smalltalk10";					//… … 如 果 我 没 有 亲 眼 看 到 的 话 … …
	Smalltalk11											= "SVM_16_Smalltalk11";					//… … 应 该 有 人 去 工 作 … …
	Smalltalk12											= "SVM_16_Smalltalk12";					//… … 我 听 说 的 不 是 那 样 的 … …
	Smalltalk13											= "SVM_16_Smalltalk13";					//… … 现 在 那 是 代 表 性 的 ， 不 是 吗 … …
	Smalltalk14											= "SVM_16_Smalltalk14";					//… … 他 什 么 都 存 不 住 … …
	Smalltalk15											= "SVM_16_Smalltalk15";					//… … 他 最 好 闭 嘴 … …
	Smalltalk16											= "SVM_16_Smalltalk16";					//… … 他 也 整 天 工 作 … …
	Smalltalk17											= "SVM_16_Smalltalk17";					//… … 我 不 能 照 料 到 所 有 人 的 所 有 事 … …
	Smalltalk18											= "SVM_16_Smalltalk18";					//… … 他 就 是 说 的 太 多 了 … …
	Smalltalk19											= "SVM_16_Smalltalk19";					//… … 那 是 一 个 公 开 的 秘 密 … …
	Smalltalk20											= "SVM_16_Smalltalk20";					//… … 现 在 大 家 都 知 道 … …
	Smalltalk21											= "SVM_16_Smalltalk21";					//… … 从 现 在 起 ， 我 不 会 告 诉 她 任 何 事 … …
	Smalltalk22											= "SVM_16_Smalltalk22";					//… … 它 会 变 得 更 糟 糕 … …
	Smalltalk23											= "SVM_16_Smalltalk23";					//… … 但 是 那 太 可 怕 了 … …
	Smalltalk24											= "SVM_16_Smalltalk24";					//… … 我 一 直 那 样 说 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_16_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_16_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_16_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_16_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_16_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_16_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_16_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_16_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_16_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_16_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_16_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_16_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_16_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_16_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_16_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_16_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_16_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_16_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_16_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_16_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_16_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_16_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_16_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_16_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_16_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_16_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_16_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_16_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_16_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_16_Aargh_1";						// 啊
	Aargh_2												= "SVM_16_Aargh_2";						// 啊
	Aargh_3												= "SVM_16_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------

	ADDON_WRONGARMOR									= "SVM_16_Addon_WrongArmor";			//穿 上 一 些 得 体 的 衣 服 。 我 不 想 看 到 你 穿 成 那 样 。

	ADDON_DIEBANDIT										= "SVM_16_ADDON_DIEBANDIT";				//一 个 强 盗 ！
	ADDON_DIRTYPIRATE									= "SVM_16_ADDON_DIRTYPIRATE";			//一 个 海 盗 ！
};

instance SVM_17(C_SVM)
{
	// ------ B_Say_GuildGreetings ---------------------------------------------------------------------------------------
	MILGreetings										= "SVM_17_MILGreetings";				//为 了 国 王 ！
	PALGreetings										= "SVM_17_PALGreetings";				//为 了 英 诺 斯 ！
	Weather												= "SVM_17_Weather";						//多 么 糟 糕 的 天 气 ！
	// ------ B_Say_AttackReason -----------------------------------------------------------------------------------------
	IGetYouStill										= "SVM_17_IGetYouStill";				//我 终 于 找 到 你 了 ！
	DieEnemy											= "SVM_17_DieEnemy";					//你 现 在 要 倒 霉 了 ！
	DieMonster											= "SVM_17_DieMonster";					//那 种 无 耻 的 野 兽 还 有 一 只 ！
	DirtyThief											= "SVM_17_DirtyThief";					//卑 鄙 的 盗 贼 ！ 你 等 着 瞧 ！
	HandsOff											= "SVM_17_HandsOff";					//把 你 的 爪 子 从 那 里 拿 开 ！
	SheepKiller											= "SVM_17_SheepKiller";					//那 个 混 蛋 在 屠 杀 我 们 的 绵 羊 ！
	SheepKillerMonster									= "SVM_17_SheepKillerMonster";			//那 个 讨 厌 的 怪 物 在 吃 我 们 的 绵 羊 ！
	YouMurderer											= "SVM_17_YouMurderer";					//凶 手 ！
	DieStupidBeast										= "SVM_17_DieStupidBeast";				//这 里 不 欢 迎 野 兽 ！
	YouDareHitMe										= "SVM_17_YouDareHitMe";				//你 等 着 ， 混 蛋 ！
	YouAskedForIt										= "SVM_17_YouAskedForIt";				//你 自 讨 苦 吃 ！
	ThenIBeatYouOutOfHere								= "SVM_17_ThenIBeatYouOutOfHere";		//那 么 我 就 把 你 从 这 里 打 出 去 ！
	WhatDidYouDoInThere									= "SVM_17_WhatDidYouDoInThere";			//那 你 来 这 里 有 何 贵 干 ， 嗯 ！ ？
	WillYouStopFighting									= "SVM_17_WillYouStopFighting";			//马 上 停 下 ！
	// ------ B_Say_AttackEND ---------------------------------------------------------------------------------------------
	KillEnemy											= "SVM_17_KillEnemy";					//去 死 吧 ， 混 蛋 ！
	EnemyKilled											= "SVM_17_EnemyKilled";					//够 你 受 的 ， 罪 犯 ！
	MonsterKilled										= "SVM_17_MonsterKilled";				//周 围 又 少 了 一 个 怪 物 ！
	ThiefDown											= "SVM_17_ThiefDown";					//永 远 别 想 再 从 我 这 里 偷 东 西 ！
	rumfummlerDown										= "SVM_17_rumfummlerDown";				//从 现 在 起 ， 不 要 用 你 的 爪 子 碰 任 何 不 属 于 你 的 东 西 ！
	SheepAttackerDown									= "SVM_17_SheepAttackerDown";			//永 远 不 要 再 那 样 做 ！ 那 是 我 们 的 绵 羊 ！
	KillMurderer										= "SVM_17_KillMurderer";				//去 死 吧 ， 凶 手 ！
	StupidBeastKilled									= "SVM_17_StupidBeastKilled";			//多 么 愚 蠢 的 野 兽 ！
	NeverHitMeAgain										= "SVM_17_NeverHitMeAgain";				//永 远 不 要 再 向 我 挑 战 ！
	YouBetterShouldHaveListened							= "SVM_17_YouBetterShouldHaveListened";	//你 真 应 该 听 我 的 ！
	GetUpAndBeGone										= "SVM_17_GetUpAndBeGone";				//现 在 ， 滚 出 去 ！
	NeverEnterRoomAgain									= "SVM_17_NeverEnterRoomAgain";			//永 远 不 要 让 我 在 那 里 再 抓 到 你 ！
	ThereIsNoFightingHere								= "SVM_17_ThereIsNoFightingHere";		//这 里 禁 止 打 架 ， 你 明 白 吗 ？ 那 就 是 给 你 的 一 个 教 训 ！
	// ------ C_WantToFlee -------------------------------------------------------------------------------------------------
	SpareMe												= "SVM_17_SpareMe";						//不 要 伤 害 我 ！
	RunAway												= "SVM_17_RunAway";						//我 要 离 开 这 里 ！
	// ------ C_WantToCallGuardsToFight --------------------------------------------------------------------------------------
	Alarm												= "SVM_17_Alarm";						//警 报 ！
	Guards												= "SVM_17_Guards";						//卫 兵 ！
	Help												= "SVM_17_Help";						//救 命 ！
	// ------ B_AssessMurder -----------------------------------------------------------------------------------------------
	GoodMonsterKill										= "SVM_17_GoodMonsterKill";				//（ 呼 喊 ） 干 得 好 ！
	GoodKill											= "SVM_17_GoodKill";					//（ 呼 喊 ） 嘿 ， 教 训 一 下 那 头 猪 ！
	// ------ B_AssessTalk -----------------------------------------------------------------------------------------------
	NOTNOW												= "SVM_17_NOTNOW";						//别 惹 我 ！
	// ------ ZS_Attack ----------------------------------------------------------------------------------------------------
	RunCoward											= "SVM_17_RunCoward";					//（ 大 声 呼 叫 ） 马 上 停 止 ， 你 这 懦 夫 ！
	// ------ ZS_ClearRoom -------------------------------------------------------------------------------------------------
	GetOutOfHere										= "SVM_17_GetOutOfHere";				//滚 出 去 ！
	WhyAreYouInHere										= "SVM_17_WhyAreYouInHere";				//你 想 在 这 里 找 什 么 ！ ？ 滚 ！
	YesGoOutOfHere										= "SVM_17_YesGoOutOfHere";				//对 ， 你 悄 悄 溜 走 吧 ！
	// ------ ZS_ObservePlayer ---------------------------------------------------------------------------------------------
	WhatsThisSupposedToBe								= "SVM_17_WhatsThisSupposedToBe";		//嘿 ， 你 ！ 鬼 鬼 祟 祟 地 在 这 里 做 什 么 。
	YouDisturbedMySlumber								= "SVM_17_YouDisturbedMySlumber";		//（ 醒 来 ） 怎 么 回 事 ？
	// ------ ZS_RansackBody -----------------------------------------------------------------------------------------------
	ITookYourGold										= "SVM_17_ITookYourGold";				//多 谢 这 些 钱 了 ， 你 这 个 英 雄 ！
	ShitNoGold											= "SVM_17_ShitNoGold";					//你 这 个 可 怜 的 笨 蛋 ， 连 一 分 钱 都 没 有 ！
	ITakeYourWeapon										= "SVM_17_ITakeYourWeapon";				//我 要 把 这 件 武 器 妥 为 保 管 ！
	// ------ ZS_ReactToDamage ---------------------------------------------------------------------------------------------
	WhatAreYouDoing										= "SVM_17_WhatAreYouDoing";				//（ 警 告 ） 留 神 ！ 再 来 一 次 ， 我 就 揍 你 。
	// ------ ZS_ReactToWeapon ---------------------------------------------------------------------------------------------
	LookingForTroubleAgain								= "SVM_17_LookingForTroubleAgain";		//你 还 没 拿 够 吗 ？
	StopMagic											= "SVM_17_StopMagic";					//停 下 这 个 无 用 的 魔 法 ！
	ISaidStopMagic										= "SVM_17_ISaidStopMagic";				//想 挨 打 吗 ？ 马 上 停 下 ！ ！ ！
	WeaponDown											= "SVM_17_WeaponDown";					//把 武 器 放 下 ！
	ISaidWeaponDown										= "SVM_17_ISaidWeaponDown";				//你 能 丢 掉 你 该 死 的 武 器 吗 ？ ！
	WiseMove											= "SVM_17_WiseMove";					//聪 明 的 小 子 ！
	// ------ ZS_Unconscious ------------------------------------------------------------------------------------------------
	NextTimeYoureInForIt								= "SVM_17_NextTimeYoureInForIt";		//（ 自 言 自 语 ） 嗯 ， 我 们 下 次 见 … …
	OhMyHead											= "SVM_17_OhMyHead";					//（ 自 言 自 语 ） 喔 伙 计 ， 我 的 头 … …
	// ------ ZS_WatchFight -------------------------------------------------------------------------------------------------
	TheresAFight										= "SVM_17_TheresAFight";				//（ 热 切 的 ） 啊 ， 一 场 战 斗 ！
	OhMyGodItsAFight									= "SVM_17_OhMyGodItsAFight";			//（ 沮 丧 的 ） 我 的 天 啊 ， 一 场 战 斗 ！
	GoodVictory											= "SVM_17_GoodVictory";					//（ 带 着 邪 恶 的 笑 ） 你 真 正 教 训 了 他 一 顿 ！
	NotBad												= "SVM_17_NotBad";						//（ 满 意 的 ） 还 不 错 … …
	OhMyGodHesDown										= "SVM_17_OhMyGodHesDown";				//（ 自 言 自 语 ） 我 的 天 啊 ！ 多 么 残 忍 … …
	CheerFriend01										= "SVM_17_CheerFriend01";				//打 败 他 ！
	CheerFriend02										= "SVM_17_CheerFriend02";				//好 好 教 训 他 ！
	CheerFriend03										= "SVM_17_CheerFriend03";				//让 他 尝 尝 滋 味 ！
	Ooh01												= "SVM_17_Ooh01";						//反 击 ！
	Ooh02												= "SVM_17_Ooh02";						//那 么 留 神 ！
	Ooh03												= "SVM_17_Ooh03";						//喔 ！ 那 太 疼 了 ！
	// ----------------------------------------------------------------------------------------------------------------------
	WhatWasThat											= "SVM_17_WhatWasThat";					//（ 对 她 自 己 ， 清 醒 过 来 ） 那 是 什 么 ！ ？
	// ----------------------------------------------------------------------------------------------------------------------
	GetOutOfMyBed										= "SVM_17_GetOutOfMyBed";				//从 我 的 床 前 滚 开 ！
	Awake												= "SVM_17_Awake";						//（ 打 着 哈 欠 ）
	// ----------------------------------------------------------------------------------------------------------------------
	ABS_COMMANDER										= "SVM_17_ABS_COMMANDER";				//因 此 你 到 指 挥 官 那 里 把 你 的 名 字 澄 清 。
	ABS_MONASTERY										= "SVM_17_ABS_MONASTERY";				//然 后 你 去 了 帕 兰 神 父 那 里 ， 并 偿 还 了 你 的 罪 。
	ABS_FARM											= "SVM_17_ABS_FARM";					//李 摆 平 了 你 的 事 情 。
	ABS_GOOD											= "SVM_17_ABS_GOOD";					//那 样 很 好 。
	// -------------------------
	SHEEPKILLER_CRIME									= "SVM_17_SHEEPKILLER_CRIME";			//你 不 能 那 样 杀 死 我 们 的 绵 羊 ！ 走 开 ！
	ATTACK_CRIME										= "SVM_17_ATTACK_CRIME";				//你 是 一 个 残 忍 的 恶 棍 ， 我 不 想 为 你 做 任 何 事 。
	THEFT_CRIME											= "SVM_17_THEFT_CRIME";					//我 不 和 小 偷 说 话 - 现 在 走 开 ！
	// -------------------------
	PAL_CITY_CRIME										= "SVM_17_PAL_CITY_CRIME";				//你 的 行 为 并 不 值 得 尊 敬 。 哈 根 勋 爵 不 喜 欢 这 样 ！
	MIL_CITY_CRIME										= "SVM_17_MIL_CITY_CRIME";				//你 的 行 为 让 城 市 卫 兵 感 到 耻 辱 ！ 安 德 烈 勋 爵 将 会 要 求 一 个 解 释 ！
	CITY_CRIME											= "SVM_17_CITY_CRIME";					//安 德 烈 勋 爵 将 会 听 到 你 所 作 的 一 切 ！
	// -------------------------
	MONA_CRIME											= "SVM_17_MONA_CRIME";					//你 的 行 为 是 错 误 的 。 去 帕 兰 神 父 那 里 忏 悔 吧 。
	FARM_CRIME											= "SVM_17_FARM_CRIME";					//李 会 查 明 你 所 做 的 一 切 事 情 - 他 会 惩 罚 你 的 ！
	OC_CRIME											= "SVM_17_OC_CRIME";					//指 挥 官 加 隆 德 会 要 求 你 作 出 解 释 的 ！
	// ----------------------------------------------------------------------------------------------------------------------
	GOLD_1000											= "SVM_17_GOLD_1000";					// 1000枚 金 币 。
	GOLD_950											= "SVM_17_GOLD_950";					// 950枚 金 币 。
	GOLD_900											= "SVM_17_GOLD_900";					// 900枚 金 币 。
	GOLD_850											= "SVM_17_GOLD_850";					// 850枚 金 币 。
	GOLD_800											= "SVM_17_GOLD_800";					// 800枚 金 币 。
	GOLD_750											= "SVM_17_GOLD_750";					// 750枚 金 币 。
	GOLD_700											= "SVM_17_GOLD_700";					// 700枚 金 币 。
	GOLD_650											= "SVM_17_GOLD_650";					// 650枚 金 币 。
	GOLD_600											= "SVM_17_GOLD_600";					// 600枚 金 币 。
	GOLD_550											= "SVM_17_GOLD_550";					// 550枚 金 币 。
	GOLD_500											= "SVM_17_GOLD_500";					// 500枚 金 币 。
	GOLD_450											= "SVM_17_GOLD_450";					// 450枚 金 币 。
	GOLD_400											= "SVM_17_GOLD_400";					// 400枚 金 币 。
	GOLD_350											= "SVM_17_GOLD_350";					// 350枚 金 币 。
	GOLD_300											= "SVM_17_GOLD_300";					// 300枚 金 币 。
	GOLD_250											= "SVM_17_GOLD_250";					// 250枚 金 币 。
	GOLD_200											= "SVM_17_GOLD_200";					// 200枚 金 币 。
	GOLD_150											= "SVM_17_GOLD_150";					// 150枚 金 币 。
	GOLD_100											= "SVM_17_GOLD_100";					// 100枚 金 币 。
	GOLD_90												= "SVM_17_GOLD_90";						// 90枚 金 币 。
	GOLD_80												= "SVM_17_GOLD_80";						// 80枚 金 币 。
	GOLD_70												= "SVM_17_GOLD_70";						// 70枚 金 币 。
	GOLD_60												= "SVM_17_GOLD_60";						// 60枚 金 币 。
	GOLD_50												= "SVM_17_GOLD_50";						// 50枚 金 币 。
	GOLD_40												= "SVM_17_GOLD_40";						// 40枚 金 币 。
	GOLD_30												= "SVM_17_GOLD_30";						// 30枚 金 币 。
	GOLD_20												= "SVM_17_GOLD_20";						// 20枚 金 币 。
	GOLD_10												= "SVM_17_GOLD_10";						// 10枚 金 币 。
	// -----------------------------------------------------------------------------------------------------------------------
	Smalltalk01											= "SVM_17_Smalltalk01";					//… … 真 的 ？ 多 有 趣 啊 … …
	Smalltalk02											= "SVM_17_Smalltalk02";					//… … 我 不 相 信 … …
	Smalltalk03											= "SVM_17_Smalltalk03";					//… … 我 的 丈 夫 不 那 样 认 为 … …
	Smalltalk04											= "SVM_17_Smalltalk04";					//… … 走 开 ， 不 要 对 我 说 那 些 … …
	Smalltalk05											= "SVM_17_Smalltalk05";					//… … 真 的 ， 我 亲 眼 目 睹 … …
	Smalltalk06											= "SVM_17_Smalltalk06";					//… … 你 不 是 说 … …
	Smalltalk07											= "SVM_17_Smalltalk07";					//… … 不 要 向 任 何 人 说 起 这 些 … …
	Smalltalk08											= "SVM_17_Smalltalk08";					//… … 现 在 很 不 景 气 … …
	Smalltalk09											= "SVM_17_Smalltalk09";					//… … 谁 说 情 况 是 那 样 的 ？ … …
	Smalltalk10											= "SVM_17_Smalltalk10";					//… … 如 果 我 没 有 亲 眼 看 到 的 话 … …
	Smalltalk11											= "SVM_17_Smalltalk11";					//… … 应 该 有 人 去 工 作 … …
	Smalltalk12											= "SVM_17_Smalltalk12";					//… … 我 听 说 的 不 是 那 样 的 … …
	Smalltalk13											= "SVM_17_Smalltalk13";					//… … 现 在 那 是 代 表 性 的 ， 不 是 吗 … …
	Smalltalk14											= "SVM_17_Smalltalk14";					//… … 他 什 么 都 存 不 住 … …
	Smalltalk15											= "SVM_17_Smalltalk15";					//… … 他 最 好 闭 嘴 … …
	Smalltalk16											= "SVM_17_Smalltalk16";					//… … 他 也 整 天 工 作 … …
	Smalltalk17											= "SVM_17_Smalltalk17";					//… … 我 不 能 照 料 到 所 有 人 的 所 有 事 … …
	Smalltalk18											= "SVM_17_Smalltalk18";					//… … 他 就 是 说 的 太 多 了 … …
	Smalltalk19											= "SVM_17_Smalltalk19";					//… … 那 是 一 个 公 开 的 秘 密 … …
	Smalltalk20											= "SVM_17_Smalltalk20";					//… … 现 在 大 家 都 知 道 … …
	Smalltalk21											= "SVM_17_Smalltalk21";					//… … 从 现 在 起 ， 我 不 会 告 诉 她 任 何 事 … …
	Smalltalk22											= "SVM_17_Smalltalk22";					//… … 它 会 变 得 更 糟 糕 … …
	Smalltalk23											= "SVM_17_Smalltalk23";					//… … 但 是 那 太 可 怕 了 … …
	Smalltalk24											= "SVM_17_Smalltalk24";					//… … 我 一 直 那 样 说 … …
	// ----------------------------------------------------------------------------------------------------------------------
	NoLearnNoPoints										= "SVM_17_NoLearnNoPoints";				//等 你 拥 有 更 多 经 验 的 时 候 再 回 来 。
	NoLearnOverPersonalMAX								= "SVM_17_NoLearnOverPersonalMAX";		//你 的 要 求 超 过 了 我 所 能 教 你 的 。
	NoLearnYoureBetter									= "SVM_17_NoLearnYoureBetter";			//我 无 法 再 教 你 什 么 了 。 你 太 出 色 了 。
	YouLearnedSomething									= "SVM_17_YouLearnedSomething";			//看 ， 你 已 经 更 加 出 色 了 … …
	// ----------------------------------------------------------------------------------------------------------------------
	UNTERSTADT											= "SVM_17_UNTERSTADT";					//你 现 在 位 于 城 镇 的 贫 民 区 。
	OBERSTADT											= "SVM_17_OBERSTADT";					//你 现 在 位 于 城 镇 的 富 人 区 。
	TEMPEL												= "SVM_17_TEMPEL";						//你 现 在 位 于 神 殿 。
	MARKT												= "SVM_17_MARKT";						//你 现 在 位 于 市 场 。
	GALGEN												= "SVM_17_GALGEN";						//你 现 在 位 于 兵 营 前 面 的 绞 刑 广 场 。
	KASERNE												= "SVM_17_KASERNE";						//这 是 兵 营 。
	HAFEN												= "SVM_17_HAFEN";						//你 现 在 位 于 海 港 地 区 。
	// -----------------------
	WHERETO												= "SVM_17_WHERETO";						//你 想 要 去 哪 里 ？
	// -----------------------
	OBERSTADT_2_UNTERSTADT								= "SVM_17_OBERSTADT_2_UNTERSTADT";		//从 这 里 穿 过 内 城 大 门 ， 你 就 可 以 到 达 城 镇 的 贫 民 区 。
	UNTERSTADT_2_OBERSTADT								= "SVM_17_UNTERSTADT_2_OBERSTADT";		//一 组 台 阶 从 城 市 的 南 门 通 向 内 城 大 门 。 那 里 就 是 城 镇 富 人 区 的 起 点 。
	UNTERSTADT_2_TEMPEL									= "SVM_17_UNTERSTADT_2_TEMPEL";			//穿 过 铁 匠 铺 的 地 道 ， 你 就 到 了 神 殿 广 场 。
	UNTERSTADT_2_HAFEN									= "SVM_17_UNTERSTADT_2_HAFEN";			//从 铁 匠 铺 那 里 沿 着 海 港 路 走 ， 你 就 能 到 达 海 港 。
	TEMPEL_2_UNTERSTADT									= "SVM_17_TEMPEL_2_UNTERSTADT";			//从 神 殿 广 场 的 地 道 走 ， 你 就 能 到 达 城 镇 的 贫 民 区 。
	TEMPEL_2_MARKT										= "SVM_17_TEMPEL_2_MARKT";				//当 你 在 神 殿 前 面 时 ， 向 左 沿 着 城 墙 走 。 你 就 能 到 达 市 场 。
	TEMPEL_2_GALGEN										= "SVM_17_TEMPEL_2_GALGEN";				//从 神 殿 出 来 ， 如 果 你 经 过 左 边 的 酒 馆 ， 你 就 会 来 到 绞 刑 架 广 场 。
	MARKT_2_TEMPEL										= "SVM_17_MARKT_2_TEMPEL";				//从 市 场 那 里 沿 着 城 市 的 高 墙 走 ， 你 就 能 到 达 神 殿 。
	MARKT_2_KASERNE										= "SVM_17_MARKT_2_KASERNE";				//那 座 巨 大 的 建 筑 是 兵 营 ， 就 从 旅 馆 对 面 的 台 阶 上 去 。
	MARKT_2_GALGEN										= "SVM_17_MARKT_2_GALGEN";				//只 要 走 过 巨 大 的 兵 营 ， 你 就 到 了 绞 刑 广 场 。
	GALGEN_2_TEMPEL										= "SVM_17_GALGEN_2_TEMPEL";				//从 绞 刑 广 场 的 小 巷 步 行 ， 你 就 能 到 达 神 殿 广 场 。
	GALGEN_2_MARKT										= "SVM_17_GALGEN_2_MARKT";				//只 要 经 过 巨 大 的 兵 营 ， 你 就 可 以 到 达 市 场 。
	GALGEN_2_KASERNE									= "SVM_17_GALGEN_2_KASERNE";			//那 座 巨 大 的 建 筑 是 兵 营 。 走 上 台 阶 就 是 。
	KASERNE_2_MARKT										= "SVM_17_KASERNE_2_MARKT";				//只 要 沿 着 主 入 口 左 侧 的 台 阶 走 ， 你 就 能 到 达 市 场 。
	KASERNE_2_GALGEN									= "SVM_17_KASERNE_2_GALGEN";			//只 要 沿 着 主 入 口 右 侧 的 台 阶 走 ， 你 就 能 到 达 绞 刑 广 场 。
	HAFEN_2_UNTERSTADT									= "SVM_17_HAFEN_2_UNTERSTADT";			//码 头 墙 那 里 的 海 港 路 通 向 城 镇 的 贫 民 区 。
	// -------------------------------------------------------------------------------------
	Dead												= "SVM_17_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_17_Aargh_1";						// 啊
	Aargh_2												= "SVM_17_Aargh_2";						// 啊
	Aargh_3												= "SVM_17_Aargh_3";						// 啊

	// -------------------------------- Addon ------------------------------------------------
};

// *************
// 		Orks
// *************

instance SVM_18(C_SVM)
{
};

// ****************
// 	   Dementor
// ****************

instance SVM_19(C_SVM)
{
	DieEnemy											= "SVM_19_DieEnemy";					//（ 发 出 嘘 声 ） 他 在 那 里 ！
	RunCoward											= "SVM_19_RunCoward";					//（ 发 出 嘘 声 ） 我 们 会 抓 到 你 ！
	Dead												= "SVM_19_Dead";						// 啊啊啊 !
	Aargh_1												= "SVM_19_Aargh_1";						// 啊
	Aargh_2												= "SVM_19_Aargh_2";						// 啊
	Aargh_3												= "SVM_19_Aargh_3";						//啊
};

// ***********************
// 		Maximale SVMs
// ***********************

const int SVM_MODULES = 20;
