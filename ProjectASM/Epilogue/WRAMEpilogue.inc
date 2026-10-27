.virtual $7FC64A

  aEpilogueMainCharacters .fill $40  ; $7FC64A
    ; Indexed by epilogue ID, holds CharacterIDs of units that get their own
    ; epilogue.
  aEpilogueSupportingCharacters .fill $40  ; $7FC68A
    ; Characters who are involved in the epilogues of the prior table, same offsets.
  aEpilogueChosenDialogueID .fill $32  ; $7FC6CA
    ; For every unit, holds the ID for their epilogue pointers + 1.
    ; 0 means the character doesnt get an epilogue

  ; $7FC6FC

.endvirtual

.virtual $7FC5CA

  aEpilogueUnitProcessedFlags .fill 25 * size(word) * 2 ; $7FC5CA
    ; -1 if unit hasn't been processed yet

  ; $7FC62E

.endvirtual

.virtual $7FC54A

  aEpilogueUnitStates .fill 25 * size(word) ; $7FC54A
    ; indexed by CharacterID
    ; $8000 if dead
    ; $4000 if unrecruited
    ; $2000 + ora'd partners ID for selected children in aUnknown82F96C
  aUnknown7FC57C .fill 25 * size(word) ; $7FC57C
    ; indexed by Gen2 IDs, same as above

  ; $7FC5AE

.endvirtual

.virtual $7FC70A

  aUnknown7FC70A .fill 16 * size(byte)      ; $7FC70A
    ; result | remainder
  aUnknown7FC71A .fill 7 * size(byte)       ; $7FC71A
    ; ?
  aUnknown7FC721 .fill 24 * size(byte)       ; $7FC721
    ; male lovers gen ids indexed by female gen ids starting with patty
  aUnknown7FC72A .fill (8 + 1) * size(byte) ; $7FC72A
    ; ?
  ; $7FC734

.endvirtual