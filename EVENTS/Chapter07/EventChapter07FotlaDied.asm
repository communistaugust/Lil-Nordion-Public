
  aEventChapter07FotlaDied ; B2/90A9

    RESTORE_PHASE_MUSIC
    YIELD

    PAUSE 20
    YIELD

    FILL_EVENT_UNIT_SLOT Fodla1, EventUnitSlot1
    RUN_ASM rlASMCChapter07WarpAway
    YIELD

    RUN_EVENT_CONDITION
      REMOVE_UNIT Fodla1

    END_EVENT
