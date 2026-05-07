
  aEventChapter06BrotherRecruitedDanannResponse ; 91/D4B1

    TEST_FLAG_IN_CHAPTER_SET Chapter06, FlagChapter06_DanannDied
    JUMP_TRUE _End

      PLAY_SONG $26
      YIELD

      MAP_SCROLL [20, 50], 4
      YIELD

      DIALOGUE dialogueCh6Talk_LarceiCreidne_IucharIucharba3
      YIELD

    _End
    END_EVENT
