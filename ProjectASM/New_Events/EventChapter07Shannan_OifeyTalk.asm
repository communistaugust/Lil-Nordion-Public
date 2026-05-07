
  aEventChapter07Shannan_OifeyTalk ; 8F/F160

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    PLAY_SONG $82
    YIELD

    DIALOGUE dialogueChapter07Shannan_OifeyTalk
    YIELD

        RUN_EVENT_CONDITION
          MODIFY_LOVE_POINTS Oifey, Shannan, 100

        RUN_EVENT_CONDITION
          MODIFY_LOVE_POINTS Oifey, Shannan, 100

        RUN_EVENT_CONDITION
          MODIFY_LOVE_POINTS Oifey, Shannan, 100

         RUN_EVENT_CONDITION
                   MODIFY_LOVE_POINTS Oifey, Shannan, 100

         RUN_EVENT_CONDITION
                   MODIFY_LOVE_POINTS Oifey, Shannan, 100

    PLAY_SFX_WORD $00E0
    PAUSE 35
    YIELD

    RESTORE_PHASE_MUSIC
    YIELD


    END_EVENT
