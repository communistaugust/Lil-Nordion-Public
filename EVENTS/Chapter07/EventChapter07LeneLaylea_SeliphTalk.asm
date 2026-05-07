
  aEventChapter07LeneLaylea_SeliphTalk ; 8F/F331

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $48
    YIELD

    DIALOGUE dialogueCh7Talk_LeneLaylea_Seliph
    YIELD

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD

    END_EVENT
