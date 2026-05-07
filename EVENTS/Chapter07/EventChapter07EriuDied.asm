
  aEventChapter07EriuDied ; B2/90BE

    RESTORE_PHASE_MUSIC
    YIELD

    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT Eriu1, EventUnitSlot1
    RUN_ASM rlASMCChapter07WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT Eriu1

    END_EVENT
