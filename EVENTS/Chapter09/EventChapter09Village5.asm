
  aEventChapter09Village5 ; B1/DCC7

    TEST_FLAG_IN_CHAPTER_SET Chapter09, FlagChapter09_MousaDiedCheck
    JUMP_TRUE _MusarDead

      macroMapDialogue dialogueCh9VillageNorthwest_BeforeMousaAppears
      YIELD
      JUMP +

      _MusarDead
      macroMapDialogue dialogueCh9VillageNorthwest_AfterMousaAppears
      YIELD

    +
    END_EVENT
