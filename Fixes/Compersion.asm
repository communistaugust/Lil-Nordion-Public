;	This is a fix to the jealousy glitch.
;	Inverted two command lines

* = $04C402

    .byte $8C	; sty.w
    .word $056F	; UnitPointer
	
    .byte $B0	; Branch to...
    .byte $04 	; relative distance to the next step
