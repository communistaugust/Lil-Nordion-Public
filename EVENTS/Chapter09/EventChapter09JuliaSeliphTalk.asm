
  aEventChapter09JuliaSeliphTalk ; 8F/F6E1

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $84
    YIELD

    DIALOGUE dialogueCh9Talk_Julia_Seliph
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Seliph, Resistance, 3

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
