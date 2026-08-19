
* = $11F07F
          .logical $91F07F
             NOP
             NOP
             NOP
             rts
            .here
* = $11F0A5
          .logical $91F0A5
             NOP
             NOP
             NOP
             rts
            .here
* = $11F021
          .logical $91F021
                       NOP
                       NOP
                       NOP
                       NOP
          .here

* = $11FD20
    .logical $91FD20
     SaveFemaleCharacterLoverData; 91/FD20
         .byte  0, $09
         .byte  2, $09
         .byte  4, $09
         .byte  6, $09
         .byte  8, $09
         .byte 10, $09
         .byte 12, $09
         .byte 14, $09
         .byte 16, $09
         .byte 18, $09
         .byte 20, $09
         .byte 22, $09
         .byte 24, $09
         .byte 26, $09
         .byte 28, $09
         .byte $FF

     SaveMLMCharacterLoverData ; 91FD68
         .byte  0, $09
         .byte  2, $09
         .byte  4, $09
         .byte  6, $09
         .byte  8, $09
         .byte 10, $09
         .byte 12, $09
         .byte 14, $09
         .byte 16, $09
         .byte 18, $09
         .byte 20, $09
         .byte 22, $09
         .byte 24, $09
         .byte 26, $09
         .byte 28, $09
         .byte 30, $09
         .byte 32, $09
         .byte 34, $09
         .byte 36, $09
         .byte 38, $09
         .byte 40, $09
         .byte 42, $09
         .byte 44, $09
         .byte 46, $09
         .byte 48, $09
         .byte 50, $09
         .byte 52, $09
         .byte 54, $09
         .byte 56, $09
         .byte 58, $09
         .byte 60, $09
         .byte 62, $09
         .byte 64, $09
         .byte 66, $09
         .byte 68, $09
         .byte 70, $09
         .byte 72, $09
         .byte 74, $09
         .byte 76, $09
         .byte 78, $09
         .byte 80, $09
         .byte 82, $09
         .byte 84, $09
         .byte 86, $09
         .byte 88, $09
         .byte 90, $09
         .byte 92, $09
         .byte 94, $09
         .byte 95, $09
         .byte 96, $09
         .byte 98, $09
         .byte 100, $09
         .byte 102, $09
         .byte 104, $09
         .byte 106, $09
         .byte 108, $09
         .byte 110, $09
         .byte 112, $09
         .byte 114, $09
         .byte 116, $09
         .byte 118, $09
         .byte 120, $09
         .byte 122, $09
         .byte 126, $09
         .byte 128, $09
         .byte 130, $09
         .byte 132, $09
         .byte 134, $09
         .byte 136, $09
         .byte 138, $09
         .byte 140, $09
         .byte 142, $09
         .byte 144, $09
         .byte 146, $09
         .byte 148, $09
         .byte 150, $09
         .byte 152, $09
         .byte 154, $09
         .byte 156, $09
         .byte 158, $09
         .byte 160, $09
         .byte 162, $09
         .byte 164, $09
         .byte 166, $09
         .byte 168, $09
         .byte 170, $09
         .byte 172, $09
         .byte 174, $09
         .byte 176, $09
         .byte 178, $09
         .byte 180, $09
         .byte 182, $09
         .byte 184, $09
         .byte 186, $09
         .byte 188, $09
         .byte 190, $09
         .byte 192, $09
         .byte 194, $09
         .byte 196, $09
         .byte 198, $09
         .byte 200, $09
         .byte 202, $09
         .byte 204, $09
         .byte 206, $09
         .byte 208, $09
         .byte 210, $09
         .byte 212, $09
         .byte 214, $09
         .byte 216, $09
         .byte 218, $09
         .byte 220, $09
         .byte 222, $09
         .byte 224, $09
         .byte 226, $09
         .byte 228, $09
         .byte 230, $09
         .byte 232, $09
         .byte 234, $09
         .byte 236, $09
         .byte 238, $09
         .byte $FF

         SaveWLWCharacterLoverData
          .byte  0, $09
          .byte  2, $09
          .byte  4, $09
          .byte  6, $09
          .byte  8, $09
          .byte 10, $09
          .byte 12, $09
          .byte 14, $09
          .byte 16, $09
          .byte 18, $09
          .byte 20, $09
          .byte 22, $09
          .byte 24, $09
          .byte 26, $09
          .byte 28, $09
          .byte 30, $09
          .byte 32, $09
          .byte 34, $09
          .byte 36, $09
          .byte 38, $09
          .byte 40, $09
          .byte 42, $09
          .byte 44, $09
          .byte 46, $09
          .byte 48, $09
          .byte 50, $09
          .byte 52, $09
          .byte 54, $09
          .byte 56, $09
          .byte 58, $09
          .byte 60, $09
          .byte 62, $09
          .byte 64, $09
          .byte 66, $09
          .byte 68, $09
          .byte 70, $09
          .byte 72, $09
          .byte 74, $09
          .byte 76, $09
          .byte 78, $09
          .byte 80, $09
          .byte 82, $09
          .byte 84, $09
          .byte 86, $09
          .byte 88, $09
          .byte $FF

      rsSaveNewFileBody ; 91/FE8A

              .al
              .autsiz
              .databank ?

              ; Saves to file from $00 until the checksum.

              phb
              phk
              plb
              lda aSave.wActiveSlot,b
              jsr rsSetSaveDataOffsets

              jsl $87FBC5

              jsr $91F5A1
              jsr $91F230
              jsr $91F2B7
              jsr $91F3FA
              jsr $91F46B
              jsr $91EF55
              jsr rsSaveLoverData
              jsl $87FC51

              lda aSave.wActiveSlot,b
              jsr $91EECC

              lda aSave.wActiveSlot,b
                  jsr $91EE8A
              tay

              lda aSave.wActiveSlot,b
              jsr $91EEBB

              lda aSave.wCurrentBitOffset,b
              cmp #newStructSaveDataEntry.Checksum * 8
              bcc +

                brk

              +
              plb
              rts

              .databank 0

       rsSaveLoverData ; 91/FD84
               .al
             .autsiz
             .databank ?
              phb
              phk
              plb
              jsr rsSaveHeteroLoverData
              jsr rsSaveMLMLoverData
              jsr rsSaveWLWLoverData
              plb
              rts
              .databank 0

     rsSaveHeteroLoverData
                 .al
                 .autsiz
                 .databank ?
                    php
                    ldx #$0
                    ldy #$0
                    lda wRoutineVariable1,b
                    pha
                   _loopLoverId
                   phy
                   phx
                     lda #(`LoverHeterosexualPoint)<<8
                     sta lR18+1
                     lda #<>LoverHeterosexualPoint
                     sty wRoutineVariable1,b
                     clc
                     adc wRoutineVariable1,b
                     sta lR18
                     ldx #<>SaveFemaleCharacterLoverData
                     jsr rsSaveBitpackedDataOffsets._Entry
                   plx
                   ply
                   inx
                   lda y
                   clc
                   adc #$1E
                   ldy a
                   cpx #$9
                   bne _loopLoverId
                   pla
                   sta wRoutineVariable1,b
                   plp
                   rts

            rsSaveWLWLoverData ; 91F1EF

            .al
            .autsiz
            .databank ?

              lda #(`WLWLovePoint)<<8
              sta lR18+1
              lda #<>WLWLovePoint
              sta lR18
              ldx #<>SaveWLWCharacterLoverData
              jsr rsSaveBitpackedDataOffsets._Entry

            rts

            .databank 0

            rsSaveMLMLoverData ; 91F1EF

            .al
            .autsiz
            .databank ?

              lda #(`MLMLovePoint)<<8
              sta lR18+1
              lda #<>MLMLovePoint
              sta lR18
              ldx #<>SaveMLMCharacterLoverData
              jsr rsSaveBitpackedDataOffsets._Entry

            rts

            .databank 0

       rsLoadLoverData ; 91/FECF
               .al
             .autsiz
             .databank ?
              jsr rsLoadHeteroLoverData
              jsr rsLoadMLMLoverData
              jsr rsLoadWLWLoverData
              jsl rlFuck_you_fe4
              rts
              .databank 0

     rsLoadHeteroLoverData
                 .al
                 .autsiz
                 .databank ?
                    php
                    ldx #$0
                    ldy #$0
                    lda wRoutineVariable1,b
                    pha
                   _loopLoverId
                   phy
                   phx
                     lda #(`LoverHeterosexualPoint)<<8
                     sta lR18+1
                     lda #<>LoverHeterosexualPoint
                     sty wRoutineVariable1,b
                     clc
                     adc wRoutineVariable1,b
                     sta lR18
                     ldx #<>SaveFemaleCharacterLoverData
                     jsr rsLoadBitpackedDataOffsets._Entry
                   plx
                   ply
                   inx
                   lda y
                   clc
                   adc #$1E
                   ldy a
                   cpx #$9
                   bne _loopLoverId
                   pla
                   sta wRoutineVariable1,b
                   plp
                   rts

            rsLoadWLWLoverData ; 91F1EF

            .al
            .autsiz
            .databank ?

              lda #(`WLWLovePoint)<<8
              sta lR18+1
              lda #<>WLWLovePoint
              sta lR18
              ldx #<>SaveWLWCharacterLoverData
              jsr rsLoadBitpackedDataOffsets._Entry

            rts

            .databank 0

            rsLoadMLMLoverData ; 91/ff8e

            .al
            .autsiz
            .databank ?

              lda #(`MLMLovePoint)<<8
              sta lR18+1
              lda #<>MLMLovePoint
              sta lR18
              ldx #<>SaveMLMCharacterLoverData
              jsr rsLoadBitpackedDataOffsets._Entry

            rts

            .databank 0
     rsLoadNewSaveFileBody ; 91/FF7B

             .al
             .autsiz
             .databank ?

             phb
             phk
             plb
             lda $1B0D
             jsr $91ED06
             jsl $848000
             jsr $91F5D3
             jsr $91F24B
             jsl $87FB5E
             jsr $91F2E1
             jsr $91F42C
             jsr $91F4C8
             jsr $91EF97
             jsr rsLoadLoverData
             jsl rlinitialateSiblings
             jsl $87FC51
             plb
             rts
             .databank 0

              rsNewGetSaveSlotOffset ;
                .al
                            .autsiz
                            .databank ?
              cmp #$00
              beq _A0
              cmp #$01
              beq _A1
             lda #$14B0
              bra _end
              _A1
              lda #$A58;A58
              bra _end
              _A0
              lda #$0
              _end
              tax
              rts
              .databank 0
              rsNewGetSaveSlotOffsetWithoutParameter;
                .al
                .autsiz
                .databank ?
                lda aSave.wActiveSlot,b
                jsr rsNewGetSaveSlotOffset
                rts
             .databank 0
            .here
 * = $11EDCA
 .logical $91EDCA
       rsSaveBitpackedDataOffsets ; 91/EDCA

         .al
         .autsiz
         .databank ?

         _Loop
         tay
         inc x
         lda $0000,b,x
         and #$007F
         sta aSave.wDataBitLength,b

         _EDD5
         lda [lR18],y
         sta wR0
         inc x

         phx
         jsr $91ED11
         plx

         _Entry ; 91/EDDF
         lda $0000,b,x
         and #$00FF
         cmp #$00FF
         bne _Loop

         rts

         .databank 0

               rsLoadBitpackedDataOffsets ; 91/EDEB

                 .al
                 .autsiz
                 .databank ?

                 _Loop
                 tay
                 inc x
                 lda $0000,b,x
                 pha
                 and #$007F
                 sta aSave.wDataBitLength,b
                 inc x
                 phx
                 jsr $91ED63
                 sta wR0
                 plx
                 pla
                 bit #$0080
                 beq +

                   sep #$20
                   lda wR0
                   sta [lR18],y
                   rep #$20
                   bra +_Entry

                 +
                 lda wR0
                 sta [lR18],y

                 _Entry ; 91/EE13
                 lda $0000,b,x
                 and #$00FF
                 cmp #$00FF
                 bne _Loop

                 rts

                 .databank 0
                 .here

* = $00C1D8
.logical $80C1D8
      CMP #$0236
      .here
