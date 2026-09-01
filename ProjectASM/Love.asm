.weak

      rlFindGenerationIDInFactionSlotData      :?= address($84BF67)
      rlGetSelectedUnitLoverGenerationID       :?= address($849635)
      rlSetSelectedUnitLoverGenerationID       :?= address($849650)
      rlGetSelectedUnitCharacterID             :?= address($84A333)
      rlGetAndRunChapterMapEventConditions     :?= address($8682BC)
      rlGetSelectedUnitGenerationID            :?= address($84A358)
      rlGetUnitRAMDataPointerByFactionSlotEntryID :?= address($84BEF4)
      rsEventLoadSpecifiedOrEventUnit1Pointer     :?= address($8692DC)
      rlGetUnitRAMDataPointerByID     :?= address($8484B4)
      rlDeleteParentsAndModifyChildrenData :?= address($8481FF)
    .endweak



     * = $07FDE0
              .logical $87FDE0

aLovePointIndex;
.word 00
.word 15
.word 30
.word 45
.word 60
.word 75
.word 90
.word 105
.word 120
.word 135
.word 150
.word 164
.word 177
.word 189
.word 200
.word 210
.word 219
.word 227
.word 234
.word 240
.word 245
.word 249
.word 252
.word 254
.word 255
.word 264
.word 272
.word 279
.word 285
.word 290
.word 294
.word 297
.word 299

rlwSelectedUniLovePointer

        .al
        .autsiz
        .databank ?
        lda wRoutineVariable1,b
        pha
        lda wRoutineVariable2,b
        ldx wRoutineVariable3,b
        cmp wRoutineVariable3,b
        bcc +
        phx
        ldx a
        pla
        +
        cmp #$10
        bcc _men
        bra _GAY
        _men
        cpx #$10
        bcc _GAY
        phx
        ldx a
        pla
        sec
        sbc #$F
        clc
        bra _end
        _GAY
        clc
        sta wRoutineVariable1,b
        adc #9
        pha
        lda x
        sec
        sbc wRoutineVariable1,b
        inc a
        tax
        pla
        bra _end
        _end
        stx wRoutineVariable1,b
        dec a
        asl a
        ldx a
        lda aLovePointIndex,x
        clc
        adc wRoutineVariable1,b
        dec a
        asl a
        tax
        pla
        sta wRoutineVariable1,b
        lda x
        rtl
        .databank 0


rlGayModifyUnitsLovePoints ; 87/FE73

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = male GenerationID
        ; wSelectedUnitDataRAMPointer = female character data
        ; wRoutineVariable1 = love points amount, can be negative

        ; If love points are 500 or more, marry units to each other.

        phb
        php
        phk
        plb
        phx
        phy
        ldx wRoutineVariable2,b
        phx
        ldx wRoutineVariable3,b
        phx
        cmp #$0019
        bcc +
        brl _End
        +
          sta wRoutineVariable2,b ;First Lover
          jsl rlGetSelectedUnitGenerationID ;rlGetSelectedUnitGenerationID
          cmp #$0019
          bcc +
          brl _End
          +
              sta wRoutineVariable3,b ;Second lover
              jsl rlCheckLoversMarried
              ora #0
              beq +
                brl _End
              +
              jsl rlwSelectedUniLovePointer
              lda LoverHeterosexualPoint,x
              and #$01FF
              cmp #$01FF
              bne +
              brl _End
              +
                lda wRoutineVariable1,b
                bne +
                 brl _End
                 +
                bmi _Negative
                  lda LoverHeterosexualPoint,x
                  clc
                  adc wRoutineVariable1,b
                  cmp #500
                  bcs +

                    sta LoverHeterosexualPoint,x
                    bra _End
                  +
                  lda #500
                  sta LoverHeterosexualPoint,x
                  jsl rlSetUnitsAsLoversByGenerationIDs ;rlSetUnitsAsLoversByGenerationIDs
                  bra _End
                _Negative
                lda LoverHeterosexualPoint,x
                clc
                adc wRoutineVariable1,b
                bpl +

                  lda #0

                +
                sta LoverHeterosexualPoint,x
        _End
        plx
        stx wRoutineVariable3,b
        plx
        stx wRoutineVariable2,b
        ply
        plx
        plp
        plb
        rtl

        .databank 0

        .here
* = $04C3B6
        .logical $84C3B6
    JSL rlGayModifyUnitsLovePoints;
    .here



* = $042C33D
        .logical $84C33D
    rlUnknown84C33D ; 84/C33D

        .al
        .autsiz
        .databank ?

        phb
        php
        phk
        plb
        phx

        lda wCurrentTurn,b
        cmp #51
        bcs _End

          lda wActiveFactionSlot,b
          bne _End

            lda #0
            jsl $84C412

            ldx #(9 - 1) * size(word)

              -
              lda $7E201E,x
              beq +

                sta wSelectedUnitDataRAMPointer,b
                jsl rlGetSelectedUnitGenerationID
                bcs +

                  jsr $84C398

              +
              dec x
              dec x
              bpl -

            ldx #(len(aDeploymentTable._State) - 2)

              -
              lda aDeploymentTable._State,x
              bit #DeploymentStateAlive
              beq +

                lda aDeploymentTable._UnitRAMPointer,x
                sta wSelectedUnitDataRAMPointer,b
                jsl rlGetSelectedUnitGenerationID
                bcs +

                  cmp #$0010
                  bcc +

                    jsr $84C3C1

              +
              dec x
              dec x
              bpl -

        _End
        plx
        plp
        plb
        rtl

        .databank 0
        .here







* = $07AD0E
.logical $87AD0E
rlGetUnitLoveGrowthWithTarget ; 87/AD0E

        .al
        .autsiz
        .databank ?
        php
        phb
        phk
        plb
        jsl rlNewGetUnitLoveGrowthWithTarget
        plb
        plp

        rtl
        .databank 0
        .here

* = $04C356
.logical $84C356
        ldx #(24 - 1) * size(word)

              -
              lda $7E2000,x
              beq +

                sta wSelectedUnitDataRAMPointer,b
                jsl rlGetSelectedUnitGenerationID
                bcs +

                  jsr $84C398

              +
              dec x
              dec x
              bpl -
              .here

* = $04C398
.logical $84C398
         .al
         .autsiz
         .databank ?
          phb
         php

         phk
         plb
        PHX
        PHY
        jsl rlHandleLovePerTurn
        PLY
        PLX
        plp
        plb
        rts
        .databank 0
        .here

* = $0193D0
.logical $8193D0
 rlHandleLovePerTurn ; 81/93D0
         .al
         .autsiz
         .databank ?
        ldx wRoutineVariable2,b
        phx
        pha
        dec a
        asl
        sta wRoutineVariable2,b
        LDY wSelectedUnitDataRAMPointer,b
        pla
        cmp #$10
        bcc _MLM
        _straight
        LDX #(15 - 1) * size(word)
        _loopstraight
        LDA $7E2000,X
        BEQ _straight_skip
        STA wRoutineVariable1,b
        STY wSelectedUnitDataRAMPointer,b
        JSL rlGetUnitLoveGrowthWithTarget
        STA wRoutineVariable1,b
        TXA
        LSR
        INC A
        JSL rlGayModifyUnitsLovePoints
        _straight_skip
        DEX
        DEX
        BPL _loopstraight
        LDX #15 * size(word)
        _loopWLW
        LDA $7E2000,X
        BEQ _WLW_skip
        STA wRoutineVariable1,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitGenerationID
        sta wRoutineVariable3,b
        STY wSelectedUnitDataRAMPointer,b
        lda wRoutineVariable1,b
        JSL rlGetUnitLoveGrowthWithTarget
        STA wRoutineVariable1,b
        lda wRoutineVariable3,b
        JSL rlGayModifyUnitsLovePoints
        _WLW_skip
        INX
        INX
        cpx wRoutineVariable2,b
        bcc _loopWLW
        bra _end
        _MLM
        LDX #$0
        _loopMLM
        LDA $7E2000,X
        BEQ _MLM_skip
        STA wRoutineVariable1,b
        sta wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitGenerationID
        sta wRoutineVariable3,b
        STY wSelectedUnitDataRAMPointer,b
        lda wRoutineVariable1,b
        JSL rlGetUnitLoveGrowthWithTarget
        STA wRoutineVariable1,b
        lda wRoutineVariable3,b
        JSL rlGayModifyUnitsLovePoints
        _MLM_skip
        INX
        INX
        cpx wRoutineVariable2,b
        bcc _loopMLM
        _end
        plx
        stx wRoutineVariable2,b
        rtl
        .databank 0

                rlNewGetUnitLoveGrowthWithTarget ; 87/AD0E

                        .al
                        .autsiz
                        .databank ?

                        phb
                        php
                        phk
                        plb
                        phy
                        phx
                        ldx wSelectedUnitDataRAMPointer,b
                        phx
                        ldx wRoutineVariable2,b
                        phx
                        ldx wRoutineVariable3,b
                        phx
                        sta wRoutineVariable3,b
                        jsl rlGetSelectedUnitGenerationID
                        cmp #$0019
                        bcc +
                        brl _AD79
                        +
                        pha
                        jsl $849622
                        sta wRoutineVariable2,b
                        lda wRoutineVariable1,b
                        sta wSelectedUnitDataRAMPointer,b
                        jsl rlGetSelectedUnitGenerationID
                        cmp #$0019
                        bcc +
                        brl _AD79
                        +
                        pha
                        jsl $849622
                        sta wRoutineVariable3,b
                        plx
                        pla
                        sta wRoutineVariable1,b
                        cpx wRoutineVariable1,b
                        bcs +
                        phx
                        ldx a
                        pla
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        cmp #$10
                        bcs _WLWGrowth
                        cpx #$10
                        bcc _MLMGrowth
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveGrowthOffsets,x
                        CLC
                        adc wRoutineVariable2,b
                        tax
                        lda aLoveGrowthOffsets,x
                        bit #$0080
                        bne +
                        and #$007F
                        brl _End
                        +
                        ora #$FF80
                        brl _End
                        _WLWGrowth
                        lda wRoutineVariable3,b
                        cmp wRoutineVariable2,b
                        bcc +
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveWLWGrowthOffsets,x
                        pha
                        lda wRoutineVariable2,b
                        sec
                        sbc wRoutineVariable3,b
                        sta wRoutineVariable3,b
                        pla
                        CLC
                        adc wRoutineVariable3,b
                        tax
                        lda aLoveWLWGrowthOffsets,x
                        bit #$0080
                        bne +
                        and #$007F
                        brl _End
                        +
                        ora #$FF80
                        brl _End
                        _MLMGrowth
                        lda wRoutineVariable3,b
                        cmp wRoutineVariable2,b
                        bcc +
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveMLMGrowthOffsets,x
                        pha
                        lda wRoutineVariable2,b
                        sec
                        sbc wRoutineVariable3,b
                        sta wRoutineVariable3,b
                        pla
                        CLC
                        adc wRoutineVariable3,b
                        tax
                        lda aLoveMLMGrowthOffsets,x
                        bit #$0080
                        bne +
                        and #$007F
                        bra _End
                        +
                        ora #$FF80
                        bra _End
                        _End
                        plx
                        stx wRoutineVariable3,b
                        plx
                        stx wRoutineVariable2,b
                        plx
                        stx wSelectedUnitDataRAMPointer,b
                        plx
                        ply

                        plp
                        plb
                        rtl

                        _AD79
                        pla
                        lda #0
                        bra _End
                        .databank 0

                        rlNewVerificationLoveAdjacent ; 87/AD0E

                        .al
                        .autsiz
                        .databank ?
                         phb
                         php
                         phk
                         plb
                         phx
                         ldx wRoutineVariable3,b
                         phx
                         pha
                         jsl rlGetSelectedUnitGenerationID
                         sta wRoutineVariable3,b
                         pla
                         cmp wRoutineVariable3,b
                         beq _end
                         bcc _end
                         jsl rlGayModifyUnitsLovePoints
                         _end
                         plx
                         stx wRoutineVariable3,b
                         plx
                         plp
                         plb
                         rtl
                        .databank 0

                        rlNewGetUnitLoveBaseWithTarget ;81/95BC
                        .al
                        .autsiz
                        .databank ?
                        phb
                        php
                        phk
                        plb
                        phy
                        phx
                        ldx wR0
                        phx
                        ldx wSelectedUnitDataRAMPointer,b
                        phx
                        ldx wRoutineVariable2,b
                        phx
                        ldx wRoutineVariable3,b
                        phx
                        ldx wRoutineVariable1,b
                        phx
                        sta wRoutineVariable3,b
                        jsl rlGetSelectedUnitGenerationID
                        cmp #$0019
                        bcc +
                        brl _AD79
                        +
                        pha
                        jsl $849622
                        sta wRoutineVariable2,b
                        lda wRoutineVariable1,b
                        sta wSelectedUnitDataRAMPointer,b
                        jsl rlGetSelectedUnitGenerationID
                        cmp #$0019
                        bcc +
                        brl _AD79
                        +
                        pha
                        jsl $849622
                        sta wRoutineVariable3,b
                        plx
                        pla
                        sta wRoutineVariable1,b
                        cpx wRoutineVariable1,b
                        bcs +
                        phx
                        ldx a
                        pla
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        cmp #$10
                        bcs _WLWBase
                        cpx #$10
                        bcc _MLMBase
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveBaseOffsets,x
                        CLC
                        adc wRoutineVariable2,b
                        tax
                        lda aLoveBaseOffsets,x
                        bra _GetBase
                        _WLWBase
                        lda wRoutineVariable3,b
                        cmp wRoutineVariable2,b
                        bcc +
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveWLWBaseOffsets,x
                        pha
                        lda wRoutineVariable2,b
                        sec
                        sbc wRoutineVariable3,b
                        sta wRoutineVariable3,b
                        pla
                        CLC
                        adc wRoutineVariable3,b
                        tax
                        lda aLoveWLWBaseOffsets,x
                        bra _GetBase
                        _MLMBase
                        lda wRoutineVariable3,b
                        cmp wRoutineVariable2,b
                        bcc +
                        ldy wRoutineVariable3,b
                        phy
                        ldy wRoutineVariable2,b
                        sty wRoutineVariable3,b
                        ply
                        sty wRoutineVariable2,b
                        +
                        lda wRoutineVariable3,b
                        asl a
                        tax
                        lda aLoveMLMBaseOffsets,x
                        pha
                        lda wRoutineVariable2,b
                        sec
                        sbc wRoutineVariable3,b
                        sta wRoutineVariable3,b
                        pla
                        CLC
                        adc wRoutineVariable3,b
                        tax
                        lda aLoveMLMBaseOffsets,x
                        _GetBase
                        and #$00FF
                        cmp #$00FF
                        beq ++

                        cmp #$00FE
                        beq +

                        asl a
                        sta wR0
                        asl a
                        asl a
                        clc
                        adc wR0
                        bra _End

                        +
                        lda #499
                        bra _End

                        +
                        lda #$FFFF
                        _End
                        plx
                        stx wRoutineVariable1,b
                        plx
                        stx wRoutineVariable3,b
                        plx
                        stx wRoutineVariable2,b
                        plx
                        stx wSelectedUnitDataRAMPointer,b
                        plx
                        stx wR0
                        plx
                        ply

                        plp
                        plb
                        rtl
                        _AD79
                        pla
                        lda #0
                        bra _End
                        .databank 0

                        rlNewSaveUnitLoveValueWithTarget ; 8196E6
                        .al
                        .autsiz
                        .databank ?

                        phb
                        php
                        phk
                        plb
                        phx
                        phy
                        ldx wSelectedUnitDataRAMPointer,b
                        phx
                        ldx wR0
                        phx
                        ldx wRoutineVariable2,b
                        phx
                        ldx wRoutineVariable3,b
                        phx
                        sta wR0
                        ldy wSelectedUnitDataRAMPointer,b
                        jsl rlGetSelectedUnitGenerationID
                        sta wRoutineVariable2,b
                        lda wRoutineVariable1,b
                        sta wSelectedUnitDataRAMPointer,b
                        jsl rlGetSelectedUnitGenerationID
                        sta wRoutineVariable3,b
                        jsl rlwSelectedUniLovePointer
                        cpx #0
                        beq _End
                        lda wR0
                        sta LoverHeterosexualPoint,x
                        _End
                        plx
                        stx wRoutineVariable3,b
                        plx
                        stx wRoutineVariable2,b
                        plx
                        stx wR0
                        plx
                        stx wSelectedUnitDataRAMPointer,b
                        ply
                        plx
                        plp
                        plb
                        rtl
                        .databank 0
            rlNewGetLoverPointsWithTarget ; 87/AD7E

                    .al
                    .autsiz
                    .databank ?

                    phb
                    php

                    phk
                    plb

                    phx

                    ldx wRoutineVariable1,b
                    phx
                    ldx wRoutineVariable2,b
                    phx
                    ldx wRoutineVariable3,b
                    phx
                    sta wRoutineVariable2,b ;First Lover
                    cmp #$0019
                    bcs _Abort
                    jsl rlGetSelectedUnitGenerationID
                    sta wRoutineVariable3,b
                    cmp #$0019
                    bcs _Abort
                    jsl rlwSelectedUniLovePointer
                    beq _Abort
                    lda LoverHeterosexualPoint,x
                    _End
                    plx
                    stx wRoutineVariable3,b
                    plx
                    stx wRoutineVariable2,b
                    plx
                    stx wRoutineVariable1,b

                    plx
                    plp
                    plb
                    rtl
                     _Abort
                     lda #$0
                     bra _End
                    .databank 0

        rlCleanupUnitLove ; 87/AD7E

            .al
            .autsiz
            .databank ?
          pha
          phx
          ldx #$0
          lda #$0
          _loop
          sta LoverHeterosexualPoint,x
          inx
          inx
          cpx #$25A
          bcc _loop
          plx
          pla
          rts
            .databank 0
        rlDeleteLoveandDeleteParentsAndModifyChildrenData
                .al
                .autsiz
                .databank ?
                phb
                php
                phk
                plb
                jsr rlCleanupUnitLove
                jsl rlDeleteParentsAndModifyChildrenData
                jsl rlNewDeleteParents
                plp
                plb
                rtl
                .databank 0

                rlFuck_you_fe4
                              .al
                              .autsiz
                              .databank ?
                              phb
                              php
                              phk
                              plb
                              pha
                              phx
                              ldx #$0
                              _loop
                              lda LoverHeterosexualPoint,x
                              cmp #$01FF
                              bne _yeah
                              lda #$FFFF
                              sta LoverHeterosexualPoint,x
                              _yeah
                              inx
                              inx
                              cpx #$25A
                              bcc _loop
                              plx
                              pla
                              plp
                              plb
                              rtl
                                           .databank 0

                            .here

* = $04C3FF
.logical $84C3FF
    cmp #$19
    .here

* = $04C407
.logical $84C407
    JSL rlNewVerificationLoveAdjacent
    .here

* = $04C388
.logical $84C388
    cmp #$0
    .here

* = $049294
.logical $849294
    rsUnknown849294 ; 84/9294

            .al
            .autsiz
            .databank ?

            phy
            lda wR0
            pha
            lda wRoutineVariable1,b
            pha

            jsl $848C96
            jsl rlGetSelectedUnitGenerationID
            bcs _end
              ldx #$002E
              lda #24
              sta wR0
              bra _92EC
            _92EC
            lda $7E2000,x
            beq +

              sta wRoutineVariable1
              jsl rlNewGetUnitLoveBaseWithTarget
              jsl rlNewSaveUnitLoveValueWithTarget

            +
            dec x
            dec x
            dec wR0
            bne _92EC

            _end
            pla
            sta wRoutineVariable1,b
            pla
            sta wR0
            ply
            rts

            .databank 0
            .here

* = $048C31
.logical $848C31
    rlSetUnitsAsLoversByGenerationIDs ; 84/8C31

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable2 = male GenerationID
        ; wRoutineVariable3 = female GenerationID

        phb
        php
        phk
        plb
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wRoutineVariable2,b
        sta wRoutineVariable1,b

        lda #0
        jsl rlFindGenerationIDInFactionSlotData

        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        bne _End

          lda wRoutineVariable3,b
          cmp #$0019
          bcs _BRK

            jsl rlSetSelectedUnitLoverGenerationID
            jsl rlGetSelectedUnitCharacterID
            pha

            lda wRoutineVariable3,b
            sta wRoutineVariable1,b
            lda #0
            jsl rlFindGenerationIDInFactionSlotData
            lda wRoutineVariable2,b
            cmp #$0019
            bcs _BRK

              jsl rlSetSelectedUnitLoverGenerationID

              lda #$0011
              sta bEventActionIdentifier,b
              jsl rlGetSelectedUnitCharacterID
              sta wEventEngineArgument1,b

              pla
              sta wEventEngineArgument2,b

              ; Arg 1 holds male, arg 2 holds female
              jsl rlGetAndRunChapterMapEventConditions

        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        plp
        plb
        rtl

        _BRK
        brk

        .databank 0
        .here

        * = $07AD7E
        .logical $87AD7E
        rlGetLoverPointsWithTarget
                .al
                .autsiz
                .databank ?
                PHB
                PHP
                PHK
                PLB
                jsl rlNewGetLoverPointsWithTarget
                plp
                plb
                rtl
                .databank 0
                .here


* = $07AE88
.logical $87AE88
    rlGetRomance
            PHB
            PHP
            PHK
            PLB
            PHX
            PHY
            LDX wSelectedUnitDataRAMPointer
            PHX
            LDX $00
            PHX
            LDX $02
            PHX
            LDX $04
            PHX
            STA $04
            JSL rlGetSelectedUnitLoverGenerationID
            ORA #$0000
            Bne _Married
            LDA #$0001
            STA $00
            STZ $02
            JSL rlGetSelectedUnitGenerationID
            BCS _end
            TAY
            LDX #$0001
            _loop
            STX wRoutineVariable1,b
            LDA #$0000
            JSL rlGetUnitRAMDataPointerByFactionSlotEntryID
            LDA wSelectedUnitDataRAMPointer
            BEQ _end
            JSL rlGetSelectedUnitGenerationID
            BCS _continue_loop
            STA wRoutineVariable1,b
            JSL rlGetSelectedUnitLoverGenerationID
            ORA #$0000
            BNE _continue_loop
            TYA
            JSL rlGetLoverPointsWithTarget
            CMP $00
            BMI _continue_loop
            STA $00
            LDA wRoutineVariable1,b
            STA $02
            _continue_loop
            INX
            BRA _loop
            _end
            LDA $02
            _Married
            PLX
            STX $04
            PLX
            STX $02
            PLX
            STX $00
            PLX
            STX wSelectedUnitDataRAMPointer
            PLY
            PLX
            PLP
            PLB
            RTL
            .here


* = $0493F6
.logical $8493F6
                       NOP
                       NOP
                       NOP
                       NOP        ; LDA $7E0011,X (4 bytes)
                       NOP
                       NOP
                       NOP
                       NOP        ; ORA $7E0010,X (4 bytes)
                       NOP
                       NOP                ; BEQ $84941E (2 bytes removed)
                       NOP
                       NOP
                       NOP            ; LDA #$7E00 (3 bytes)
                       NOP
                       NOP                ; STA $25 (2 bytes)
                       NOP
                       NOP
                       NOP            ; LDA #$3BD7 (3 bytes)
                       NOP
                       NOP                ; STA $24 (2 bytes)
                       NOP  ; kept (4 bytes)
                       NOP
                       NOP
                       NOP
                       NOP
                       NOP
                       NOP
                       NOP        ; LDA $7E0011,X (4 bytes)
                       NOP
                       NOP                ; STA $3A (2 bytes)
                       NOP
                       NOP
                       NOP
                       NOP        ; LDA $7E0010,X (4 bytes)
                       NOP
                       NOP
                       NOP
                      NOP        ; LDA $7E0010,X (4 bytes)
                      NOP
                      NOP
                      .here
* = $069519
.logical $869519
rsChapterEventConditionCommand60
        .al
        .autsiz
        .databank ?

        ; MODIFY_LOVE_POINTS

        bcs _End

          lda $0002,b,y
          jsr rsEventLoadSpecifiedOrEventUnit1Pointer
          bcs _End

            jsl rlGetSelectedUnitGenerationID
            tax

            lda $0000,b,y
            jsl rlGetUnitRAMDataPointerByID
            bcs _End

              jsl rlGetSelectedUnitLoverGenerationID
              ora #0
              bne _End

                lda $0004,b,y
                bit #$0080
                bne +

                  and #$007F
                  bra ++

                  +
                  ora #$FF80

                +
                sta wRoutineVariable1,b
                txa
                jsl rlGayModifyUnitsLovePoints

        _End
        tya
        clc
        adc #5
        tay
        rts

        .databank 0
        .here



* = $019960
.logical $819960

rlCheckLoversMarried
        .al
        .autsiz
        .databank ?
                phb
                php
                phk
                plb
                phx
                ldx wSelectedUnitDataRAMPointer,b
                phx
                jsl rlGetSelectedUnitLoverGenerationID
                ora #0
                bne _end
                lda wRoutineVariable3,b
                jsl rlFindCharacterByGenerationID
                jsl rlGetSelectedUnitLoverGenerationID
                _end
                plx
                stx wSelectedUnitDataRAMPointer,b
                plx
                plp
                plb
                rtl
        .databank 0
        .here