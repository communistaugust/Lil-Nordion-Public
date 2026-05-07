
  aEventChapter04SilesseSeizedDaccarResponse ; 8E/994B

    PLAY_SONG $6C
    YIELD

    MAP_SCROLL [48, 38], 4
    YIELD

    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_PamelaDied
    JUMP_TRUE _PamelaDead

      TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LamiaDied
      JUMP_TRUE _PamelaAliveLamiaDead

        DIALOGUE dialogueCh4SeizeSilesse2_DecairAlive_LamiaPamelaAlive
        YIELD
        JUMP _End

      _PamelaAliveLamiaDead ; 8E/9967
      DIALOGUE dialogueCh4SeizeSilesse2_DecairAlive_PamelaAlive
      YIELD
      JUMP _End

    _PamelaDead ; 8E/996F
    TEST_FLAG_IN_CHAPTER_SET Chapter04, FlagChapter04_LamiaDied
    JUMP_TRUE _PamelaDeadLamiaDead

      DIALOGUE dialogueCh4SeizeSilesse2_DecairAlive_LamiaAlive
      YIELD
      JUMP _End

    _PamelaDeadLamiaDead ; 8E/997D
    DIALOGUE dialogueCh4SeizeSilesse2_DecairAlive_LamiaPamelaDead
    YIELD

    _End ; 8E/9982
    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
