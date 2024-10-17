// *******************
// Kampf - AI ORC (12)
// *******************

/*
MOVE_RUN Gegner in meinem Fokus + steht wer dazwischen?(G)
MOVE_RUNBACK Gegner in meinem Fokus
MOVE_JUMPBACK l�st t_ParadeJumpB aus(Attacke wird nur pariert, wenn man schnell genug aus der W - Reichweite kommt !
MOVE_TURN Immer bis Gegner im Fokus(also nie durch neue Aktion unterbrochen, h�chstens durch Gegner - Attacke)
MOVE_STRAFE(Richtung wird vom Programm entschieden)

MOVE_ATTACK in ComboZone = Combo / im Rennen = Sturmattacke

MOVE_SIDEATTACK Left -- > Right
MOVE_FRONTATTACK Left -- > Foward
oder Foward -- > Right

MOVE_TRIPLEATTACK Foward -- > Right -- > Left
oder Left -- > Right -- > Foward

MOVE_WHIRLATTACK Left -- > Right -- > Left -- > Right
MOVE_MASTERATTACK Left -- > Right -- > Foward -- > Foward -- > Foward -- > Foward

MOVE_PARADE
MOVE_STANDUP
MOVE_WAIT 200 ms
*/

// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
instance FA_ENEMY_PREHIT_12(C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_PARADE;
};

// ------ Gegner macht Sturmattacke ------
instance FA_ENEMY_STORMPREHIT_12(C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich bin im Combo-Fenster ------
instance FA_MY_W_COMBO_12(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu ------
instance FA_MY_W_RUNTO_12(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG (Stehenbleiben) ---
};

// ------- Ich Strafe gerade ------
instance FA_MY_W_STRAFE_12(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
instance FA_MY_W_FOCUS_12(C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_SIDEATTACK;
	move[2] = MOVE_TRIPLEATTACK;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;
};

// ------- Ich habe Gegner NICHT im Fokus -------
instance FA_MY_W_NOFOCUS_12(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------ Ich bin im Combo-Fenster ------
instance FA_MY_G_COMBO_12(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------ Ich renne auf den Gegner zu (kann Sturmattacke machen) ------
instance FA_MY_G_RUNTO_12(C_FightAI)
{
	move[0] = MOVE_ATTACK; // Sturmattacke
};

// ------- Ich Strafe gerade ------
instance FA_MY_G_STRAFE_12(C_FightAI)
{
	// --- Wird nie erreicht (Neue FAI-Bewertung erst wenn Ani zuende gespielt) ---
};

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_G_FOCUS_12(C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
	move[1] = MOVE_RUN;
	move[2] = MOVE_STRAFE;
};

// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_FK_FOCUS_12(C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch f�r G-Distanz!) -------
instance FA_MY_G_FK_NOFOCUS_12(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI f�r Fernkampf und Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_FAR_12(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
instance FA_MY_FK_NOFOCUS_FAR_12(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI f�r Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_MAG_12(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_WAIT_EXT;
	move[2] = MOVE_WAIT_EXT;
	move[3] = MOVE_WAIT_EXT;
};

// ------ Gegner NICHT im Fokus -------
instance FA_MY_FK_NOFOCUS_MAG_12(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};