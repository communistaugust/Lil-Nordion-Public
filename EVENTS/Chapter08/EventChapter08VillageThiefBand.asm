
  aEventChapter08VillageThiefBand ; 8F/BF8C

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_ThiefBracelet

    macroMapDialogue dialogueCh8VillageSouthernmost
    YIELD

    END_EVENT
