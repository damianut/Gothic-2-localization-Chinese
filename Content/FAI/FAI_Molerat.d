// ***********************
// Kampf - AI Molerat (40)
// ***********************

// ************************************
// Meine Reaktionen auf Gegner-Aktionen
// ************************************

// ------ Gegner attackiert mich ------
instance FA_ENEMY_PREHIT_40(C_FightAI)
{
	move[0] = MOVE_ATTACK;
};

// ------ Gegner macht Sturmattacke ------
instance FA_ENEMY_STORMPREHIT_40(C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// *******************************************
// Gegner in W-Reichweite (Treffer-Reichweite)
// *******************************************

// ------ Ich renne auf den Gegner zu ------
instance FA_MY_W_RUNTO_40(C_FightAI)
{
	// move[0] = MOVE_TURN; // --- Stehenbleiben ---
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
};

// ------- Ich Strafe gerade ------
instance FA_MY_W_STRAFE_40(C_FightAI)
{
	move[0] = MOVE_STRAFE; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner im Fokus (kann treffen) -------
instance FA_MY_W_FOCUS_40(C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
};

// ------- Ich habe Gegner NICHT im Fokus -------
instance FA_MY_W_NOFOCUS_40(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// *************************************************
// Gegner in G-Reichweite (Sturmattacken-Reichweite)
// *************************************************

// ------ Ich renne auf den Gegner zu (kann treffen) ------
instance FA_MY_G_RUNTO_40(C_FightAI)
{
	// move[0] = MOVE_ATTACK; // Sturmattacke
	move[0] = MOVE_TURN;
};

// ------- Ich Strafe gerade ------
instance FA_MY_G_STRAFE_40(C_FightAI)
{
	move[0] = MOVE_STRAFE; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_G_FOCUS_40(C_FightAI)
{
	// move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
	move[0] = MOVE_WAIT;
};

// ***************************************
// Gegner in FK-Reichweite (weit entfernt)
// ***************************************

// ------- Ich habe Gegner im Fokus -------
instance FA_MY_FK_FOCUS_40(C_FightAI)
{
	move[0] = MOVE_RUN; // --- STANDARDEINTRAG ---
};

// ------- Ich habe Gegner NICHT im Fokus (gilt auch f�r G-Distanz!) -------
instance FA_MY_G_FK_NOFOCUS_40(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI f�r Fernkampf
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_FAR_40(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
};

// ------ Gegner NICHT im Fokus ------
instance FA_MY_FK_NOFOCUS_FAR_40(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};

// ***********************************
// FAI f�r Magie
// ---------------------------
// (wird bei jeder Entfernung benutzt)
// ***********************************

// ------ Gegner im Fokus ------
instance FA_MY_FK_FOCUS_MAG_40(C_FightAI)
{
	move[0] = MOVE_ATTACK; // --- STANDARDEINTRAG ---
	move[1] = MOVE_WAIT_LONGER;
	move[2] = MOVE_WAIT_LONGER;
	move[3] = MOVE_WAIT_LONGER;
	move[4] = MOVE_WAIT_LONGER;
	move[5] = MOVE_WAIT_LONGER;
};

// ------ Gegner NICHT im Fokus -------
instance FA_MY_FK_NOFOCUS_MAG_40(C_FightAI)
{
	move[0] = MOVE_TURN; // --- STANDARDEINTRAG ---
};
