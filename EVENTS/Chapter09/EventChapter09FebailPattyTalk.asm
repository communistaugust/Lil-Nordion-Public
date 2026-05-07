
  aEventChapter09FebailPattyTalk ; 8F/F59A

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $62
    YIELD

    DIALOGUE dialogueCh9Talk_Febail_Patty
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Patty, Luck, 1

    FILL_EVENT_UNIT_SLOT Patty, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
