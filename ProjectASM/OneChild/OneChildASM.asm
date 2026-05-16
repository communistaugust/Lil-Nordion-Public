
* = $04BAA1
.logical $84BAA1

rlLoadChildUnit ; 84/BAA1

        .al
        .autsiz
        .databank ?

        ; Input:
        ; wRoutineVariable1 = 0 if male child, 1 if female

        phb
        php
        phk
        plb
        phx
        lda wSelectedUnitDataRAMPointer,b
        pha

        lda wRoutineVariable1,b
        sta wR2

        jsl rlGetSelectedUnitCharacterID
        cmp #Ethlyn
        beq +

          cmp #Deirdre
          beq +

            jsl rlGetSelectedUnitStates
            bit #UnitStateDead
            bne _End

        +
        ldx wSelectedUnitDataRAMPointer,b
        jsl rlGetSelectedUnitLoverGenerationID
        ora #0
        beq _End

            jsl rlGetUnitRAMDataPointerByID
            bcs _End

              ; father data?
              lda wSelectedUnitDataRAMPointer,b
              sta wR0

              ; mother data?
              stx wSelectedUnitDataRAMPointer,b
              lda wSelectedUnitDataRAMPointer,b
              sta wR1

              jsl rlGetSelectedUnitGenerationID
              dec a
                asl a
                tax

                lda wR2
                asl a
                clc
                adc aChildrenDataOffsets,x
                tax
                lda aChildrenDataOffsets,x
                beq _End

                  jsl rlLoadUnit
                  jsl rlSetChildrenPermanentFlags
        _End
        pla
        sta wSelectedUnitDataRAMPointer,b
        plx
        plp
        plb
        rtl

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
        inc a
        bra -

        .databank 0
.here

* = $0197E0
.logical $8197E0
aChildrenFlagIndex
.byte $FF
.byte $FF
.byte $1E
.byte $32
.byte $FF
.byte $FF
.byte $2A
.byte $22
.byte $1A
.byte $FF
.byte $2E
.byte $FF
.byte $FF
.byte $26
.byte $FF
.byte $34
.byte $20
.byte $30
.byte $FF
.byte $FF
.byte $24
.byte $28
.byte $2C
.byte $1C


rlSetChildrenPermanentFlags ; 84/BB1E
        phb
        php
        phk
        plb
       jsl rlGetSelectedUnitGenerationID
       tax
       dex
       SEP #$20
       lda aChildrenFlagIndex,x
       tax
       REP #$20
       lda aChildrenPermanentFlags,x
       bmi _End
                jsl rlSetPermanentEventFlag
       _End
       plp
       plb
       rtl

       HandleNewSiblings
                      .al
                      .autsiz
                      .databank ?
                      lda wRoutineVariable1,b
                      pha
                      lda #$1
                      _loop
                      pha
                      cmp #$05
                      beq _nope
                      jsl rlFindCharacterByGenerationID
                      jsl rlGetSelectedUnitCharacterID
                      sta wRoutineVariable3,b
                      jsl rlGetSelectedUnitMotherID
                      sta wRoutineVariable1,b
                      jsl rlGetSelectedUnitFatherID
                      sta wRoutineVariable2,b
                      cmp wRoutineVariable1,b
                      bcs +
                      ldx wRoutineVariable1,b
                      lda wRoutineVariable2,b
                      sta wRoutineVariable1,b
                      txa wRoutineVariable2,b
                      +
                      ldy #$1
                      _loop2
                      tya
                      jsl rlFindCharacterByGenerationID
                      jsl rlGetSelectedUnitMotherID
                      sta
                        sta aSiblingCritEntry11,x
                        pla
                        sta aSiblingCritEntry11+2,x
                      _nope
                      pla
                      inc a
                      cmp #$19
                      bne _loop
                      pla
                      sta wRoutineVariable1,b
                      rts
                      .databank 0

           rlinitialateSiblings
            .al
            .autsiz
            .databank ?
            phb
            php
            phk
            plb
            lda aCharacterData.SigurdCharacterDataEntry.CharacterID
            sta aSiblingCritEntry1
            lda aCharacterData.EthlynCharacterDataEntry.CharacterID
            sta aSiblingCritEntry1+2
            lda aCharacterData.DalvinCharacterDataEntry.CharacterID
            sta aSiblingCritEntry2
            lda aCharacterData.CreidneCharacterDataEntry.CharacterID
            sta aSiblingCritEntry2+2
            lda aCharacterData.AsaelloCharacterDataEntry.CharacterID
            sta aSiblingCritEntry3
            lda aCharacterData.DaisyCharacterDataEntry.CharacterID
            sta aSiblingCritEntry3+2
            lda aCharacterData.LeifCharacterDataEntry.CharacterID
            sta aSiblingCritEntry4
            lda aCharacterData.AltenaCharacterDataEntry.CharacterID
            sta aSiblingCritEntry4+2
            lda aCharacterData.CharlotCharacterDataEntry.CharacterID
            sta aSiblingCritEntry5
            lda aCharacterData.LayleaCharacterDataEntry.CharacterID
            sta aSiblingCritEntry5+2
            lda aCharacterData.HawkCharacterDataEntry.CharacterID
            sta aSiblingCritEntry6
            lda aCharacterData.HerminaCharacterDataEntry.CharacterID
            sta aSiblingCritEntry6+2
            lda aCharacterData.TristanCharacterDataEntry.CharacterID
            sta aSiblingCritEntry7
            lda aCharacterData.JeanneCharacterDataEntry.CharacterID
            sta aSiblingCritEntry7+2
            lda aCharacterData.DeimneCharacterDataEntry.CharacterID
            sta aSiblingCritEntry8
            lda aCharacterData.MuirneCharacterDataEntry.CharacterID
            sta aSiblingCritEntry8+2
            lda aCharacterData.AmidCharacterDataEntry.CharacterID
            sta aSiblingCritEntry9
            lda aCharacterData.LindaCharacterDataEntry.CharacterID
            sta aSiblingCritEntry9+2
            lda aCharacterData.BrigidCharacterDataEntry.CharacterID
            sta aSiblingCritEntry10
            lda aCharacterData.EdainCharacterDataEntry.CharacterID
            sta aSiblingCritEntry10+2
            lda wCurrentChapter,b
            cmp #6
            bcc +
            jsr HandleNewSiblings
            +
            plp
            plb
            rtl
        ; The first few entries are offsets, but it already gets indexed with an offset already.

        rltempTest
                phb
                php
                phk
                plb
                .al
                .autsiz
                .databank ?
                  jsl rlinitialateSiblings
                plp
                plb
                rtl
                .databank 0

.here
* = $04822d
.logical $84822d
 aModifyChildrenDataRoutines .include "../../Tables/ModifyChildrenDataRoutines.csv.asm" ; 84/822D
aModifyChildrenDataList ; 84/8237
        .word Deirdre,  ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Ethlyn,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadBothChildUnits
        .word Brigid,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Edain,    ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Silvia,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Tailtiu,  ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Erinys,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Ayra,     ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Lachesis, ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Dew,      ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadFemaleChildUnit
        .word Lex,      None, None
        .word Beowolf,  ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Claud,    ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Jamke,    None, None
        .word Azelle,   ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Chulainn, ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Lewyn,    ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Midir,    ID_LoadChildUnitAndDeleteParentUnitData, ID_LoadMaleChildUnit
        .word Quan,     None, None
        .word Finn,     ID_TransferUnitToGen2,   AdultFinn
        .word Arden,    None, None
        .word Alec,     None, None
        .word Naoise,   None, None
        .word Sigurd,   None, None
        .word Seliph,   ID_OverwriteSeliphUnitData, None
        .word Altena,   ID_OverwriteAltenaUnitData, None
        .sint -1

        rsDeleteParentUnitData ; 84/82D5

                .al
                .autsiz
                .databank ?

                rts
                nop
                nop
                jsl rlDeleteUnit
                rts
                .databank 0
.here
* = $048331
.logical $848331
      aLoadChildUnitRoutines .include "../../Tables/LoadChildUnitRoutines.csv.asm" ; 84/8331
        .here
* = $04832D
.logical $84832D
NOP
NOP
NOP
.here


* = $04FF10
.logical $84FF10
        rlNewDeleteParents
        .al
        .autsiz
        .databank ?
        phb
        php
        phk
        plb
        phx
        ldy #<>aModifyChildrenDataList
      _Loop
      lda $0000,b,y
      cmp #$FFFF
      beq _End

        jsl rlGetUnitRAMDataPointerByID
        bcs _Next
        jsl rlUndeployUnit
        jsl rlDeleteUnit

        _Next
        tya
        clc
        adc #size(word) * 3
        cmp #<>aModifyChildrenDataList+$90
        beq _End
        tay
        bra _Loop
        _End
        plx
        plp
        plb
        rtl
        .databank 0
        .here

 ;* = $0197B0
 ;.logical $8197B0

;.here

* = $0481A7
.logical $8481A7
rlUnknown8480EC ; 84/80EC

        bne +

          jsl $82F866
          jsl rlDeleteLoveandDeleteParentsAndModifyChildrenData
          jsl $8BCE71
          bra _End
        +

        jsl $87E007
        ora #0
        beq _End

          ldx #1

          -
          txa
          jsl $87e01e
          bcs _End

            jsl $87e188
            lda wR0
            cmp #$7
            beq _81E9

              cmp #$6
              beq +

                cmp #$5
                bne _81E9

              +
              jsl $87e1c7

            _81E9
            inc x
            bra -

        _End
        jsl $87E93F
        jsl $87E952
        jsl $86C548
        jsl rltempTest
        pla
        sta wR0
        plx
        plp
        plb
        rtl

        .databank 0
        .here
* = $07BCCF
.logical $87BCCF
rsActionStructCheckForSiblingCrit ; 87/BCCF

        .al
        .autsiz
        .databank ?

            lda #(`aSiblingCritEntryPointers)<<8
        sta lR18+1
        lda #<>aSiblingCritEntryPointers
        sta lR18
        lda #1
        jsr $87bdab
        cmp #2
        bcc +

          sec
          rts

        +
        clc
        rts

        .databank 0
        .here