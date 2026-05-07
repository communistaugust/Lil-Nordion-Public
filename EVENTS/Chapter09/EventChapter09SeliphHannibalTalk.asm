
  aEventChapter09SeliphHannibalTalk ; 8F/F5C6

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $82
    YIELD

    DIALOGUE dialogueCh9Talk_Seliph_Hannibal
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
