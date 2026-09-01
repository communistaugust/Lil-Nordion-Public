     * = $07FE73
              .logical $87FE73
rlGayModifyUnitsLovePointsOneChildren ; 87/FE73

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
              jsl rlLoveCheckSiblings
              bcc +
               brl _End
               +
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