* = $09A138
.logical $89A138
rl89A138
        .al
        .autsiz
        .databank ?
        LDA $7F8195
        CMP #$002B
        BNE $89A14C
        LDA $7F8193
        BEQ $89A14C
        LDA #$02B4
        BRA $89A150
        LDA $7F8195
        JSL $8AB317
        LDA #$0800
        STA $00
        TXA
        ASL
        TAY
        LDA #$6200
        STA $02
        PHX
        JSL $80A58C
        PLX
        LDA $7F8195
        JSL $84861C
        cmp #$41
        bcs _awfull_shit
        cmp #$33
        bcs _ParentHair
        _awfull_shit
        jsl rlPaletteStuff
        RTL
        _ParentHair
        jsl rlChildrenParentHair
        RTL
        .databank 0
.here
* = $08FBC0
.logical $88FBC0

rlPaletteStuff
        .al
        .autsiz
        .databank ?
        phb
        phk
        plb
        LDX #$001E
        LDY #$001E
        _loop
        LDA [$27],Y
        STA $0280,b,Y
        DEX
        DEX
        DEY
        DEY
        BPL _loop
        LDA $7F8195
        JSL $84861C
        CMP #$00F3
        BEQ _end
        LDA #$35AD
        STA $029C
        _end
        plb
        rtl
        .databank 0


rlChildrenParentHair
        .al
        .autsiz
        .databank ?
        phb
        phk
        plb
        LDY #$0002
        jsl rlGetSelectedUnitFatherID
        dec a
        asl a
        asl a
        asl a
        tax
        _loop
        LDA PalleteSigurdHair,x
        STA $0280,b,Y
        INX
        INX
        iny
        iny
        cpy #10
        bne _loop
        LDX #$001E
        LDY #$001E
        _loop2
        LDA [$27],Y
        STA $0280,b,Y
        DEX
        DEX
        DEY
        DEY
        cpy #$0A
        bcs _loop2
        plb
        rtl
        .databank 0

    rlPaletteDialogueStuff
    phb
    phk
    plb
    pha
    _normal
    lda [lR19],y
    sta [lR20],y
    dec y
    dec y
    bpl _normal
    pla
    cmp #$40
    bcs _end
    cmp #$32
    bcs _ParentHair
    _end
    plb
    rtl
    _ParentHair
    phx
    LDY #$0002
    ldx #$0000
    jsl rlGetSelectedUnitFatherID
    dec a
    asl a
    asl a
    asl a
    tax
    _loop
    LDA PalleteSigurdHair,x
    STA [lR20],Y
    INX
    INX
    iny
    iny
    cpy #10
    bne _loop
    plx
    bra _end


     rlPaletteInteriorDialogueStuff
        phb
        phk
        plb
        pha
        _normal
        LDA [$27],Y
        STA $0280,b,Y
        dec y
        dec y
        bpl _normal
        pla
        cmp #$40
        bcs _end
        cmp #$32
        bcs _ParentHair
        _end
        plb
        rtl
        _ParentHair
        phx
        ldx wSelectedUnitDataRAMPointer,b
        phx
        jsl rlGetUnitRAMDataPointerByID
        LDY #$0002
        ldx #$0000
        jsl rlGetSelectedUnitFatherID
        dec a
        asl a
        asl a
        asl a
        tax
        _loop
        LDA PalleteSigurdHair,x
        STA $0280,b,Y
        INX
        INX
        iny
        iny
        cpy #10
        bne _loop
        plx
        stx wSelectedUnitDataRAMPointer,b
        plx
        bra _end

.here


* = $1196F9
    .logical $9196F9
rsDialogueLoadPortraitData ; 91/96F9

.al
.autsiz
.databank ?

; Input:
; A = PortraitID
; X = dialogue slot offset

; Decompresses the portrait, DMA it, and loads palette

php
pha
phx
jsl $8AB317
lda #(`aBGPaletteBuffer.aPalette6)<<8
sta lR20+1
plx

cpx #0
bne +

lda #<>aBGPaletteBuffer.aPalette6
bra ++

+
lda #<>aBGPaletteBuffer.aPalette7

+
sta lR20

ldy #$001E
pla
jsl rlPaletteDialogueStuff
nop
nop
.here

;cpx #0
;bne +
;
;lda #$7000 >> 1
;bra ++
;
;+
;lda #$7800 >> 1
;
;+
;sta wR1
;lda #16 * 4 * size(Tile4bpp)
;sta wR0
;jsl rlDMAByPointer
;plp
;rts
;
;.databank 0

* = $0A9776
    .logical $8A9776
    pha
    JSL $8AB3FE
    LDY #$001E
    pla
    jsl rlPaletteInteriorDialogueStuff
    LDA #$0800
    STA $00
    LDA #$6B00
    STA $02
    PHX
    JSL $80A58C
    PLX
    RTL
    .here

