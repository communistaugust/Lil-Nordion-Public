
  aEventPrologueWorldMap ; 8D/FC70

    PLAY_SONG $5E
    YIELD

    SET_CAMERA_POSITION [21, 30]
    WM_FADE_IN
    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    PAUSE 50
    YIELD

    WM_DIALOGUE dialoguePrologueWM1
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [33 * 16, 23 * 16]
    YIELD

    WM_DIALOGUE dialoguePrologueWM2
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [21 * 16, 30 * 16]
    YIELD

    WM_DIALOGUE dialoguePrologueWM3
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [10 * 16, 23 * 16]
    YIELD

    WM_HIGHLIGHT $01

    PAUSE 50
    YIELD

    WM_DIALOGUE dialoguePrologueWM4
    YIELD

    PAUSE 50
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [9 * 16, 36 * 16]
    YIELD

    WM_HIGHLIGHT $00

    PAUSE 50
    YIELD

    WM_DIALOGUE dialoguePrologueWM5
    YIELD

    WM_CLEAR_DIALOGUE
    YIELD

    WM_SCROLL [16 * 16, 34 * 16]
    YIELD

    WM_DIALOGUE dialoguePrologueWM6
    YIELD

    PLAY_SFX_WORD $00E1
    WM_CLEAR_DIALOGUE
    YIELD

    WM_FADE_OUT
    END_EVENT
