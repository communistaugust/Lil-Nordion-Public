
  aEventChapterFinalLana_JuliaTalk ; 8F/FC2F

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $1A
    YIELD

    DIALOGUE dialogueChapterFinalLana_JuliaTalk
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
      ADD_UNIT_STAT Julia, Resistance, 1

    FILL_EVENT_UNIT_SLOT Julia, EventUnitSlot1
        RUN_ASM rlASMCStatUpDisplay
    YIELD

    RUN_ASM rlClearBattleData

    RUN_EVENT_CONDITION
          ADD_UNIT_STAT Lana, Magic, 1

    RUN_EVENT_CONDITION
              ADD_UNIT_STAT Muirne, Magic, 1

    TEST_PERMANENT_FLAG_SET PermanentFlagLanaExists
    JUMP_TRUE +

      FILL_EVENT_UNIT_SLOT Muirne, EventUnitSlot1
      JUMP ++

      +
      FILL_EVENT_UNIT_SLOT Lana, EventUnitSlot1

    +
    RUN_ASM rlASMCStatUpDisplay
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
