
  aEventChapter08VillagePowerRing ; 8F/BF4F

    macroMapDialogue dialogueCh8VillageNorthernmost
    YIELD

    RUN_EVENT_CONDITION
      GIVE_UNIT_PID AnyCharacter, PI_PowerRing2

    END_EVENT
