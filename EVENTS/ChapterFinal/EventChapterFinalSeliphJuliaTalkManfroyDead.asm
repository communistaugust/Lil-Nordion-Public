
  aEventChapterFinalSeliphJuliaTalkManfroyDead ; B1/E4ED

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $84
    YIELD

    DIALOGUE dialogueChFinalTalk_Seliph_Julia_ManfroyDead
    YIELD

    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyAliveCheck
    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_SeliphJuliaTalkManfroyAlive
    SET_FLAG_IF_IN_CHAPTER ChapterFinal, FlagChapterFinal_SeliphJuliaTalked
    RUN_EVENT_CONDITION
      CHANGE_UNITS_FACTIONSLOT Julia, FS_Player

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD
    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
