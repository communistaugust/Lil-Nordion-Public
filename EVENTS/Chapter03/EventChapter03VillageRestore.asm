
  aEventChapter03VillageRestore ; 9D/912D

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_RestoreStaff

    macroMapDialogue dialogueCh3VillageEast
    YIELD

    END_EVENT
