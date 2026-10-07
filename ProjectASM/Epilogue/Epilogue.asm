.weak

      rlCheckPermanentEventFlagSet      :?= address($86812E)
      rlGetSelectedUnitFactionSlot       :?= address($849716)
      rlGetSelectedUnitConstantDataPointer :?= address($84a1a7)
    .endweak


     * = $02F8AE
              .logical $82F8AE

rlEvaluateEpilogueEndings ; 82/F8AE

        .al
        .autsiz
        .databank ?

        ; Evaluates what characters get what ending scenes

        phb
        phx
        phy
        phk
        plb
        ldx #0
        txa
        sep #$20

          -
          sta aEpilogueMainCharacters,x
          sta aEpilogueSupportingCharacters,x
          sta aEpilogueChosenDialogueID,x
          inc x
          cpx #50
          bne -

        rep #$20
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags

        jsr rsEpilogueGetParentsEpilogueStates
        jsr rsEpilogueGetChildrenEpilogueStates
        jsr rsEvaluateEpiloguePriorities
        jsr rsEvaluateEpilogueDialogueIDs

        jsr rsUnknown82FDC1
        jsr rsUnknown82FE07
        jsr rsUnknown82FE41
        ply
        plx
        plb
        rtl

        .databank 0

      rsEpilogueGetParentsEpilogueStates ; 82/F8ED

        .al
        .autsiz
        .databank ?

        ldx #2

        _Loop
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags,x
        txa
        lsr a
        adc #40
        jsl rlCheckPermanentEventFlagSet
        bcs _ParentRecruited

          lda #($8000 | $4000)
          sta aEpilogueUnitStates,x
          bra _Next

        _ParentRecruited
        txa
        lsr a
        adc #64
        jsl rlCheckPermanentEventFlagSet
        bcc _ParentDied

          lda #0
          sta aEpilogueUnitStates,x
          bra _Next

        _ParentDied
        lda #$8000
        sta aEpilogueUnitStates,x

        _Next
        inc x
        inc x
        cpx #50
        bne _Loop

        ldx #0

        ; For all parents, save their partners in each others states.
        _Loop2
        lda _F96C,x
        and #$00FF
        beq _End

        jsl rlGetUnitRAMDataPointerByID
        bcs +

          phx
          jsl rlGetSelectedUnitFatherID
          pha

          asl a
          tax
          jsl rlGetSelectedUnitMotherID
          ora aEpilogueUnitStates,x
          ora #$2000
          sta aEpilogueUnitStates,x
          and #$00FF
          asl a
          tax

          pla
          ora aEpilogueUnitStates,x
          ora #$2000
          sta aEpilogueUnitStates,x
          plx

        +
        inc x
        bra _Loop2

        _End
        rts

        .databank 0

        _F96C ; 82/F96C

        ; Seems kind of like Gen2 recruitment order but Lester doesnt fit.

        .byte Seliph
        .byte Leif
        .byte Diarmuid
        .byte Scathach
        .byte Fee
        .byte Arthur
        .byte Lene
        .byte Lester
        .byte Patty
        .byte 0

      rsEpilogueGetChildrenEpilogueStates ; 82/F976

        .al
        .autsiz
        .databank ?

        ldx #Seliph * 2

        _Loop
        lda #$FFFF
        sta aEpilogueUnitProcessedFlags,x
        txa
        lsr a
        jsl rlGetUnitRAMDataPointerByID
        bcc _UnitExists

          -
          lda #($8000 | $4000)
          sta aEpilogueUnitStates,x
          bra _Next

        _UnitExists
        jsl rlGetSelectedUnitFactionSlot
        cmp #FS_Player
        bne -

        jsl rlGetSelectedUnitStates
        and #UnitStateDead
        beq +

          lda #$8000

        +
        sta aEpilogueUnitStates,x
        bne _Next

          jsl rlGetSelectedUnitLoverGenerationID
          cmp #0
          beq _Next

            jsl rlFindCharacterByGenerationID
            bcc +

              brk

            +
            jsl rlGetSelectedUnitCharacterID
            ora aEpilogueUnitStates,x
            ora #$2000
            sta aEpilogueUnitStates,x

        _Next
        inc x
        inc x
        cpx #64 * 2
        bne _Loop

        rts

        .databank 0

      rsEvaluateEpiloguePriorities ; 82/F9D3

        .al
        .autsiz
        .databank ?

        ldx #0

          _Loop
          lda $82fa1b+2,x
          and #$00FF
          sta wR1
          lda $82fa1b+1,x
          and #$00FF
          sta wR0
          lda $82fa1b,x
          and #$00FF
          cmp #$00FF
          beq _End

            phx
            asl a
            tax
            jsr ($82FA01,x)

            plx
            inc x
            inc x
            inc x
            bra _Loop

        _End
        rts

        .databank 0
        .here
* = $02FDC1
  .logical $82FDC1

rsUnknown82FDC1 ; 82/FDC1
        .al
        .autsiz
        .databank ?

        ldx #0

          -
          phx
          txa
          clc
          adc #$0012
          asl a
          tax
          lda aEpilogueUnitStates,x
          plx
          sep #$20
          and #$0F
          sta aUnknown7FC71A,x
          rep #$20
          inc x
          cpx #7
          bne -

        ldx #0

          -
          txa
          clc
          adc #GEN_ID_Daisy_Patty
          jsl rlFindCharacterByGenerationID
          lda #0
          bcs +

            jsl rlGetSelectedUnitLoverGenerationID

          +
          sep #$20
          and #$0F
          sta aUnknown7FC721,x
          rep #$20
          inc x
          cpx #9
          bne -

        rts

        .databank 0

      rsUnknown82FE07 ; 82/FE07

        .al
        .autsiz
        .databank ?

        sep #$20
        ldx #0

          -
          lda aUnknown7FC721+1,x
          asl a
          asl a
          asl a
          asl a
          ora aUnknown7FC71A,x
          sta aUnknown7FC72A,x
          inc x
          cpx #8
          bne -

        ldx #0
        txa

          -
          clc
          adc aUnknown7FC72A,x
          inc x
          cpx #8
          bne -

        sta aUnknown7FC72A,x
        rep #$20
        rts

        .databank 0

      aUnknown82FE38 ; 82/FE38

        .byte $46
        .byte $69
        .byte $72
        .byte $65
        .byte $45
        .byte $6D
        .byte $62
        .byte $6C
        .byte $6D

rsUnknown82FE41 ; 82/FE41

        .al
        .autsiz
        .databank ?

        sep #$20
        ldx #0

          -
          lda aUnknown7FC72A,x
          clc
          adc aUnknown82FE38,x
          sta aUnknown7FC72A,x
          inc x
          cpx #9
          bne -

        rep #$20
        ldx #0
        lda aUnknown7FC72A
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 1
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 2
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 3
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 4
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 5
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 6
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        jsr rsUnknown82FE41._FEAF

        lda aUnknown7FC72A + 7
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a
        lsr a

        _FEAF
        and #$01FF
        sta wR13

        lda #26
        sta wR14
        jsl $80A1AB ; divide
        sep #$20
        lda wR13
        clc
        adc #$41
        sta aUnknown7FC70A,x
        inc x
        lda wR10
        clc
        adc #$41
        sta aUnknown7FC70A,x
        inc x
        rep #$20
        rts

        .databank 0
        .here

* = $02FBEB
        .logical $82FBEB
rsEvaluateEpilogueDialogueIDs ; 82/FBEB

        .al
        .autsiz
        .databank ?

        lda #0
        sta wR1

          _Loop
          lda wR1
          asl a
          tax
          lda $82fc37+1,x
          and #$00FF
          sta wR2
          lda $82fc37,x
          and #$00FF
          asl a
          tax
          jsr ($82fc1d,x)
          ldx wR1
          sep #$20
          tya
          sta aEpilogueChosenDialogueID,x
          rep #$20
          inc x
          stx wR1
          cpx #50
          bne _Loop
        rts
        .databank 0
        .here

        * = $04A40D
        .logical $84A40D
        rlGetSelectedUnitMotherID ; 84/A40D

                .al
                .autsiz
                .databank ?

                phx
                phy
                jsl rlGetSelectedUnitCharacterID
                sta wRoutineVariable1,b

                lda aChildrenDataOffsets
                tax

                ldy #0

                -
                lda aChildrenDataOffsets,x
                cmp wRoutineVariable1,b
                beq _Child

                inc x
                inc x
                inc y
                cpy #size(aChildrenDataOffsets)
                bcc -

                lda #0

                -
                ply
                plx
                rtl

                _Child
                tya
                lsr a
                clc
                adc #Deirdre
                bra -

                .databank 0

              rlGetSelectedUnitFatherID ; 84/A43D

                .al
                .autsiz
                .databank ?

                phb
                php

                phk
                plb

                phx
                ldx wSelectedUnitDataRAMPointer,b
                lda $7E0000+structCharacterDataRAM.Type,x
                and #$00FF
                cmp #UnitTypeEnemy
                beq +

                jsl rlGetSelectedUnitConstantDataPointer
                lda structCharacterConstantData.FatherID,b,x
                and #$00FF

                -
                plx

                plp
                plb
                rtl

                +
                lda #0
                bra -

                .databank 0
                .here
