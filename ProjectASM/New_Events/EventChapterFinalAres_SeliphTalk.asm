
  aEventChapterFinalAres_SeliphTalk ; 8F/FC2F

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $1A
    YIELD

    DIALOGUE dialogueChapterFinalSelif_AresTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Seliph, Strength, 1

    FILL_EVENT_UNIT_SLOT Seliph, EventUnitSlot1
        RUN_ASM rlASMCStatUpDisplay
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
          ADD_UNIT_STAT Ares, Skill, 1

    FILL_EVENT_UNIT_SLOT Ares, EventUnitSlot1
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
