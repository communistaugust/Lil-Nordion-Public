* = $11E96B
              .logical $91E96B
              JSR rsSaveNewFileBody
              .here

 * = $11E989
              .logical $91E989
              JSR rsLoadNewSaveFileBody
              .here

* = $11E9E4
        .logical $91E9E4
        STA extendedASRAM.wRankingScore
        .here

* = $11E9E0
        .logical $91E9E0
        STA extendedASRAM.wLastUsedOptions
        .here

* = $11EE8A
        .logical $91EE8A

rsCalculateSaveSlotChecksum ; 91/EE8A

        .al
        .autsiz
        .databank ?

        phb
        pea #(`extendedASRAM)<<8
        plb
        plb
        JSR rsNewGetSaveSlotOffsetWithoutParameter
        NOP
        clc
        adc #<>extendedASRAM
        tax
        ldy #$0908
        lda #0
        sta wR0
        clc

          _Loop
          lda $0000,b,x
          and #$00FF
          adc wR0
          sta wR0
          inc x
          dec y
          bne _Loop

        inc a
        plb
        rts

        .databank 0

      rsGetSaveSlotChecksum ; 91/EEB3

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID

        jsr rsGetSaveSlotOffset
        lda extendedASRAM + newStructSaveDataEntry.Checksum,x
        rts

        .databank 0

      rsSetSaveSlotChecksum ; 91/EEBB

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID
        ; Y = checksum

        jsr rsGetSaveSlotOffset
        tya
        sta extendedASRAM + newStructSaveDataEntry.Checksum,x
        rts

        .databank 0

      rsGetSaveSlotMagicNumber ; 91/EEC4

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda extendedASRAM + newStructSaveDataEntry.MagicNumber,x
        rts

        .databank 0

      rsSetSaveSlotMagicNumber ; 91/EECC

        .al
        .autsiz
        .databank ?

        jsr rsGetSaveSlotOffset
        lda #$9207
        sta extendedASRAM + newStructSaveDataEntry.MagicNumber,x
        rts

        .databank 0
        .here

* = $11EC85
   .logical $91EC85
          rsGetSaveSlotOffset ; 91/EC85

        .al
        .autsiz
        .databank ?

        ; Input:
        ; A = save slot ID

        ; Output:
        ; X = offset

        and #$0003
        jsr rsNewGetSaveSlotOffset
        NOP
        NOP
        rts
        .databank 0
        .here

        * = $11EA1B
        .logical $91EA1B
        lda extendedASRAM.aSaveSlot1.SaveData,x
           .here
        * = $11EAE0
           .logical $91EAE0
           LDA extendedASRAM + newStructSaveDataEntry.SaveData,x
           .here
        * = $11EAED
           .logical $91EAED
           LDA extendedASRAM + newStructSaveDataEntry.SaveData,x
           .here
        * = $11EB5C
           .logical $91EB5C
           rsUnknown91EB5C ; 91/EB5C

                   .al
                   .autsiz
                   .databank ?

                   jsr rsGetSaveSlotOffset
                   clc
                   adc aSave.wStructCount,b
                   tax
                   sep #$20
                   lda extendedASRAM + newStructSaveDataEntry.UnitLossesCount[0],x
                   cmp #$FF
                   beq +

                     inc a
                     sta extendedASRAM + newStructSaveDataEntry.UnitLossesCount[0],x

                   +
                   rep #$20
                   rts

                   .databank 0

           .here
    * = $11EC1F
              .logical $91EC1F
              rsSaveGameTimerAndUnitLosses ; 91/EC1F

                      .al
                      .autsiz
                      .databank ?

                      lda aSave.wActiveSlot,b
                      jsr rsGetSaveSlotOffset

                      lda aSave.wGameTimerLow,b
                      sta extendedASRAM + newStructSaveDataEntry.GameTimerLow,x
                      lda aSave.wGameTimerHigh,b
                      sta extendedASRAM + newStructSaveDataEntry.GameTimerHigh,x

                      lda #(`aUnitLossesCount[0])<<8
                      sta lR18+1
                      lda #<>aUnitLossesCount[0]
                      sta lR18
                      ldy #0
                      sep #$20

                        -
                        lda [lR18],y
                        sta extendedASRAM.aSaveSlot1.UnitLossesCount[0],x
                        inc x
                        inc y
                        cpy #len(aUnitLossesCount) / size(byte)
                        bne -

                      rep #$20
                      rts

                      .databank 0

                    rsLoadGameTimerAndUnitLosses ; 91/EC52

                      .al
                      .autsiz
                      .databank ?

                      lda aSave.wActiveSlot,b
                      jsr rsGetSaveSlotOffset

                      lda extendedASRAM + newStructSaveDataEntry.GameTimerLow,x
                      sta aSave.wGameTimerLow,b
                      lda extendedASRAM + newStructSaveDataEntry.GameTimerHigh,x
                      sta aSave.wGameTimerHigh,b

                      lda #(`aUnitLossesCount[0])<<8
                      sta lR18+1
                      lda #<>aUnitLossesCount[0]
                      sta lR18
                      ldy #0
                      sep #$20

                        -
                        lda extendedASRAM + newStructSaveDataEntry.UnitLossesCount[0],x
                        sta [lR18],y
                        inc x
                        inc y
                        cpy #len(aUnitLossesCount) / size(byte)
                        bne -

                      rep #$20
                      rts

                      .databank 0
              .here
        * = $11EC92
           .logical $91EC92
                 rsSaveLastUsedOptions ; 91/EC92

                   .al
                   .autsiz
                   .databank ?

                   lda wOptionSettings,b
                   sta extendedASRAM.wLastUsedOptions
                   rts

                   .databank 0

                 rsUnknown91EC9A ; 91/EC9A

                   .al
                   .autsiz
                   .databank ?

                   lda extendedASRAM.wLastUsedOptions
                   sta wOptionSettings,b
                   rts

                   .databank 0
           .here

        * = $11ECBE
           .logical $91ECBE
           sta extendedASRAM.wRankingScore
           rts
           rsUnknown91ECC3 ; 91/ECC3

                   .al
                   .autsiz
                   .databank ?

                   lda extendedASRAM.wRankingScore
                   pha

                   and #$FFF8
                   cmp #$F290
                   beq +

                     pla
                     lda #0
                     pha

                   +
                   pla
                   and #$0007
                   rts

                   .databank 0

                 rlUnknown91ECDA ; 91/ECDA

                   .al
                   .autsiz
                   .databank ?

                   sta extendedASRAM.wUnknown3077FE
                   rtl

                   .databank 0

                 rlUnknown91ECDF ; 91/ECDF

                   .al
                   .autsiz
                   .databank ?

                   lda extendedASRAM.wUnknown3077FE
                   rtl

                   .databank 0

                 rlUnknown91ECE4 ; 91/ECE4

                   .al
                   .autsiz
                   .databank ?

                   and #$0003
                   ora #$D8C0
                   sta extendedASRAM.wUnknown307FFE
                   rtl

                   .databank 0

                 rlUnknown91ECEF ; 91/ECEF

                   .al
                   .autsiz
                   .databank ?

                   lda extendedASRAM.wUnknown307FFE
                   pha
                   and #$FFFC
                   cmp #$D8C0
                   beq +

                     pla
                     lda #0
                     pha

                   +
                   pla
                   and #$0003
                   rtl

                   .databank 0
           .here
        * = $11ED43
           .logical $91ED43

               ora extendedASRAM,x
               sta extendedASRAM,x
             lda wR1
             beq +

               ora extendedASRAM + size(word),x
               sta extendedASRAM + size(word),x

             +
             lda aSave.wCurrentBitOffset,b
             clc
             adc aSave.wDataBitLength,b
             sta aSave.wCurrentBitOffset,b

           _End
           plx
           rts

           .databank 0

         rsReadBitpackedSaveData ; 91/ED63

           .al
           .autsiz
           .databank ?

           phx
           lda aSave.wDataBitLength,b
           beq _End

             lda aSave.wCurrentBitOffset,b
             lsr a
             lsr a
             lsr a
             clc
             adc aSave.wAvtiveSaveSlotOffset,b
             tax

             lda extendedASRAM,x
             sta wR0
             lda extendedASRAM + 2,x
             sta wR1

             lda aSave.wCurrentBitOffset,b
             and #$0007
             beq +

               tax

                 -
                 lsr wR1
                 ror wR0
                 dec x
                 bne -

             +
             lda $1B3F
             dec a
             asl a
             tax
             lda $91EDAA,x
             and wR0
             pha

             lda aSave.wCurrentBitOffset,b
             clc
             adc aSave.wDataBitLength,b
             sta aSave.wCurrentBitOffset,b
             pla

           _End
           plx
           rts
            .databank 0
           .here
        * = $11EED7
           .logical $91EED7
           rsClearSaveSlot ;

                   .al
                   .autsiz
                   .databank ?

                   ; Input:
                   ; A = save slot

                   jsr rsGetSaveSlotOffset
                   ldy #size(newStructSaveDataEntry)
                   lda #0

                     -
                     sta extendedASRAM.aSaveSlot1,x
                     inc x
                     inc x
                     dec y
                     dec y
                     bne -

                   rts
                   .databank 0
           .here

       * = $11EA7B
              .logical $91EA7B
              rlUnknown91EA7B ; 91/EA7B

                      .al
                      .autsiz
                      .databank ?

                      jsr rsGetSaveSlotOffset
                      lda extendedASRAM.aSaveSlot1.CurrentChapter,x
                      and #$00FF
                      rtl

                      .databank 0
       rlUnknown91EA86 ; 91/EA86

               .al
               .autsiz
               .databank ?

               jsr rsGetSaveSlotOffset
               lda extendedASRAM.aSaveSlot1.CurrentTurnHigh,x
               xba
               sep #$20
               ora extendedASRAM.aSaveSlot1.CurrentTurnLow,x
               rep #$20
               pha

               lda extendedASRAM.aSaveSlot1.MagicNumber,X
               cmp #$9207
               beq _End

               pla
               pha
               cmp #$00FF
               bne _End

               pla
               lda #$FFFF
               pha

               _End
               pla
               rtl

               .databank 0
               .here
* = $11EB76
 .logical $91EB76

 rlUnknown91EB76 ; 91/EB76

         .al
         .autsiz
         .databank ?

         php
         phb
         phx
         phy
         phk
         plb
         lda aSave.wActiveSaveData,b
         beq _End

           inc aSave.wGameTimerLow,b
           bne +

             inc aSave.wGameTimerHigh,b

           +
           lda aSave.wGameTimerLow,b
           and #$07FF
           bne _End

           ldy #0

             _Loop
             lda aSave.aSlotDataBuffer[0],b,y
             and #$007F
             cmp aSave.wActiveSaveData,b
             bne _Next

               tya
               lsr a
               jsr rsGetSaveSlotOffset
               lda aSave.wGameTimerLow,b
               sta extendedASRAM.aSaveSlot1.GameTimerLow,x
               lda aSave.wGameTimerHigh,b
               sta extendedASRAM.aSaveSlot1.GameTimerHigh,x

             _Next
             inc y
             inc y
             cpy #4 * 2
             bne _Loop

         _End
         ply
         plx
         plb
         plp
         rtl

         .databank 0
         .here
* = $11ED06
    .logical $91ED06
          rsSetSaveDataOffsets ; 91/ED06

                 .al
                 .autsiz
                 .databank ?

                 jsr rsGetSaveSlotOffset
                 nop
                 sta aSave.wAvtiveSaveSlotOffset,b
                 stz aSave.wCurrentBitOffset,b
                 rts

                 .databank 0
                 .here
* = $11EBC9
.logical $91EBC9
rlUnknown91EBC9 ; 91/EBC9

        .al
        .autsiz
        .databank ?

        lda aSave.wGameTimerLow,b
        sta wR12
        lda aSave.wGameTimerHigh,b
        sta wR13
        lda #3500
        sta wR14
        lda #0
        sta wR15
        jsl $80A1D8

        lda #60
        sta wR14
        lda #0
        sta wR15
        jsl $80A1D8

        lda wR13
        bne +

          lda wR12
          cmp #9999
          bcc ++

        +
        lda #9999

        +
        tax
        lda wR10
        rtl

        .databank 0
        .here

