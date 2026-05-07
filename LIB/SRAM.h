
  .virtual $306000

    extendedASRAM .block

      aSaveSlot1 .newStructSaveDataEntry ; $306000
      wLastUsedOptions .word ?        ; $306B70
      aSaveSlot2 .newStructSaveDataEntry ; $306B72
      wRankingScore .word ?           ; $3076E2
      aSaveSlot3 .newStructSaveDataEntry ; $3076E4
      wUnknown3077FE .word ?          ; $308254
      wUnknown307FFE .word ?          ; $308DC6

    .bend

  .endvirtual
