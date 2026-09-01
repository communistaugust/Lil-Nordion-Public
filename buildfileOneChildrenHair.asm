.cpu "65816"

  crossbankRawMissing   := 0
  crossbankRawRemaining := b""

  crossbankRaw .segment Block
    crossbankRawMissing   := $10000 - (* & $FFFF)
    crossbankRawRemaining := \Block[crossbankRawMissing:]
    .text \Block[:crossbankRawMissing]
  .endsegment

  crossbankRawRemainder .segment
    .text crossbankRawRemaining
  .endsegment

  crossbank .namespace

    Remainder := b""

    start .function Filename: binary, Address=None

      .if ( Address == None )
        Address := *
      .endif

      Remainder ::= Filename[$8000 - (Address & $FFFF):]
      .text Filename[:$8000 - (Address & $FFFF)]

    .endfunction

    end .segment

      .text crossbank.Remainder

    .endsegment

  .endnamespace ; crossbank


.weak
  WARNINGS :?= "None"
.endweak

GUARD_FE4_BASEROM :?= false
.if (!GUARD_FE4_BASEROM)
  GUARD_FE4_BASEROM := true

  ; Fill the base ROM in parts to prevent
  ; pc wrap warnings.

  * := $000000

  .for bank in range($000000, $600000, $8000)
    * := bank
    .binary "FE4.sfc", bank, $8000
  .endfor

.endif ; GUARD_FE4_BASEROM

.include "LIB/LibraryHelpers.h"
.include "LIB/IORegisters.h"
.include "LIB/Save.h"
.include "LIB/WRAM.inc"
.include "LIB/Constants.inc"
.include "LIB/Macros.inc"
.include "LIB/MacroAdditions.inc"
.include "LIB/MenuText.inc"
.include "LIB/Procs.h"
.include "LIB/Events.h"
.include "LIB/AI.h"
.include "LIB/Palettes.h"
.include "LIB/Sprites.h"
.include "LIB/Tiles.h"
.include "LIB/DMA.h"
.include "LIB/HDMA.h"
.include "LIB/PermanentFlags.h"
.include "LIB/SRAM.h"
.include "LIB/Dialogue.h"
.include "ProjectASM/WRAMlover.inc"
.include "ProjectASM/LoveStruct.h"
 .include "ProjectASM/base_game_def.asm"
  ROM = binary("FE4.sfc")

.include "MenuText/_MenuTextInstaller.asm"
.include "MenuText/Tilemaps/_MenuTilemapsInstaller.asm"
.include "Graphics/_GraphicsInstaller.asm"
.include "Dialogue/_DialogueTextInstaller.asm"
.include "Fixes/_FixesInstaller.asm"
  .include "EVENTS/ChapterPrologue.asm"
  .include "EVENTS/Chapter01.asm"
  .include "EVENTS/Chapter02.asm"
  .include "EVENTS/Chapter03.asm"
  .include "EVENTS/Chapter04.asm"
  .include "EVENTS/Chapter05.asm"
  .include "EVENTS/Chapter06.asm"
  .include "EVENTS/Chapter07.asm"
  .include "EVENTS/Chapter08.asm"
  .include "EVENTS/Chapter09.asm"
  .include "EVENTS/Chapter10.asm"
  .include "EVENTS/ChapterFinal.asm"
  .include "EVENTS/ChapterEpilogue.asm"


    * = $038000
    .logical $838000

      aMainDataOffsets .block ; 83/8000

        CharacterNameOffsets    .word <>aCharacterNameOffsets     - aMainDataOffsets ; $00
        CharacterDataOffsets    .word <>aCharacterDataOffsets     - aMainDataOffsets ; $02
        ClassNameOffsets        .word <>aClassNameOffsets         - aMainDataOffsets ; $04
        ClassDataOffsets        .word <>aClassDataOffsets         - aMainDataOffsets ; $06
        MovementCostOffsets     .word <>aMovementCostOffsets      - aMainDataOffsets ; $08
        TerrainAvoidOffsets     .word <>aTerrainAvoidOffsets      - aMainDataOffsets ; $0A
        ItemNameOffsets         .word <>aItemNameOffsets          - aMainDataOffsets ; $0C
        ItemDescriptionOffsets  .word <>aItemDescriptionOffsets   - aMainDataOffsets ; $0E
        ItemDataOffsets         .word <>aItemDataOffsets          - aMainDataOffsets ; $10
                                .word <>aUnknown83D8E6            - aMainDataOffsets ; $12
        FactionNameOffsets      .word <>aFactionNameOffsets       - aMainDataOffsets ; $14
      .bend

      aClassWeaknessTable .binclude "Tables/ClassWeakness.asm"                                     ; 83/8016
      aClassMapSpriteAssignmentOffsets .binclude "Tables/ClassMapSpriteAssignmentOffsets.csv.asm"  ; 83/805E
      aClassMapSpriteAssignment .include "Tables/ClassMapSpriteAssignment.asm"                     ; 83/80EE
      aPromotionTable .binclude "Tables/PromotionTable.asm"                                        ; 83/833C
      aTerrainNameOffsets .include "Tables/TerrainNameOffsets.csv.asm"                             ; 83/837B
      aTerrainNames .binclude "MenuText/OldMenuText/TerrainNames.asm"                              ; 83/83AF
      aMaleLoveDataIDs .include "Tables/MaleLoveDataIDs.csv.asm"                                   ; 83/848D
        .sint -1
      aFemaleLoveDataIDs .include "Tables/FemaleLoveDataIDs.csv.asm"                               ; 83/84DB
        .sint -1
      aLoveBaseOffsets .include "Tables/LoveBaseOffsets.csv.asm"                                   ; 83/850F
      aGen1LoveBases .binclude "Tables/Gen1LoveBases.csv.asm"                                      ; 83/8541
      aGen2LoveBases .binclude "Tables/Gen2LoveBases.csv.asm"                                      ; 83/85C8
      aLoveGrowthOffsets  .include "Tables/LoveGrowthOffsets.csv.asm"                              ; 83/8738
      aGen1LoveGrowths .binclude "Tables/Gen1LoveGrowths.csv.asm"                                  ; 83/876A
      aGen2LoveGrowths .binclude "Tables/Gen2LoveGrowths.csv.asm"                                  ; 83/87F1
      aUnknown838961 .binclude "Tables/Unknown838961.asm"                                          ; 83/8961
      aOldChildrenDataOffsets .binclude "Tables/ChildrenDataOffsets.csv.asm"                          ; 83/8993
      aOldChildrenData .binclude "Tables/ChildrenData.csv.asm"                                        ; 83/89A5
      aAncestryGrowthBoostsOffsets .binclude "Tables/AncestryDataOffsets.csv.asm"                  ; 83/89C9
      aAncestryData .binclude "Tables/AncestryData.csv.asm"                                        ; 83/89E3
      aClassNameOffsets .include "Tables/ClassNameOffsets.csv.asm"                                 ; 83/8AB3
      aClassNames .binclude "MenuText/OldMenuText/ClassNames.asm"                                  ; 83/8B43
      aClassDataOffsets .include "Tables/ClassDataOffsets.csv.asm"                                 ; 83/8F35
      aClassData .binclude "Tables/ClassData.csv.asm"                                              ; 83/8FC5
      aMovementCostOffsets .include "Tables/MovementCostOffsets.csv.asm"                           ; 83/987D
      aMovementCost .binclude "Tables/MovementCost.csv.asm"                                        ; 83/989B
      aTerrainAvoidOffsets .include "Tables/TerrainAvoidOffsets.csv.asm"                           ; 83/9A21
      aTerrainAvoid .binclude "Tables/TerrainAvoid.csv.asm"                                        ; 83/9A25
      aCharacterNameOffsets .include "Tables/CharacterNameOffsets.csv.asm"                         ; 83/9A59
      aCharacterNames .binclude "MenuText/OldMenuText/CharacterNames.asm"                          ; 83/9ECD
      aCharacterDataOffsets .include "Tables/CharacterDataOffsets.csv.asm"                         ; 83/ADF5
      aCharacterData .binclude "Tables/SPECIAL/CharacterData.csv.asm"                              ; 83/B267
      aUnknown83D8E6 .word 0                                                                       ; 83/D8E6
      aFactionNameOffsets .include "Tables/FactionNameOffsets.csv.asm"                             ; 83/D8E8
      aFactionNames .binclude "MenuText/OldMenuText/FactionNames.asm"                              ; 83/D956
      aItemNameOffsets .include "Tables/ItemNameOffsets.csv.asm"                                   ; 83/DC12
      aItemNames .binclude "MenuText/OldMenuText/ItemNames.asm"                                    ; 83/DD26
      aItemDescriptionOffsets .include "Tables/ItemDescriptionOffsets.csv.asm"                     ; 83/E2E8
      aItemDescriptions .binclude "MenuText/OldMenuText/ItemDescriptions.asm"                      ; 83/E3FC
      aItemDataOffsets .include "Tables/ItemDataOffsets.csv.asm"                                   ; 83/E9D0
      aItemData .binclude "Tables/SPECIAL/ItemData.csv.asm"                                        ; 83/EAE4
      aPlayerItemTable .include "Tables/PlayerItemTable.csv.asm"                                   ; 83/F489
      .sint -1
      aCastleNameOffsets .include "Tables/CastleNameOffsets.csv.asm"                               ; 83/F517
      aCastleNames .binclude "MenuText/OldMenuText/CastleNames.asm"                                ; 83/F573

      rlSwapToMainDataBank ; 83/F7C1

        .al
        .autsiz
        .databank ?

        phk
        plb
        rtl

        .databank 0

        ; 83/F7C4

          aLoveWLWBaseOffsets .include "Love_Table/LoveWLWBaseOffset.asm"                              ; 83/8738
          aGen1WLWLoveBases .binclude "Love_Table/Gen1LoveBasesWLW.csv.asm"                                  ; 83/876A
          aGen2WLWLoveBases .binclude "Love_Table/Gen2LoveBasesWLW.csv.asm"
          aLoveMLMBaseOffsets .include "Love_Table/LoveMLMBaseOffset.asm"                              ; 83/8738
          aGen1MLMLoveBases .binclude "Love_Table/Gen1LoveBasesMLM.csv.asm"                                  ; 83/876A
          aGen2MLMLoveBases .binclude "Love_Table/Gen2LoveBasesMLM.csv.asm"
          aLoveWLWGrowthOffsets .include "Love_Table/LoveWLWGrowthOffset.asm"                              ; 83/8738
          aGen1WLWLoveGrowths .binclude "Love_Table/Gen1LoveGrowthsWLW.csv.asm"                                  ; 83/876A
          aGen2WLWLoveGrowths .binclude "Love_Table/Gen2LoveGrowthsWLW.csv.asm"
          aLoveMLMGrowthOffsets .include "Love_Table/LoveMLMGrowthOffset.asm"                              ; 83/8738
          aGen1MLMLoveGrowths .binclude "Love_Table/Gen1LoveGrowthsMLM.csv.asm"                                  ; 83/876A
          aGen2MLMLoveGrowths .binclude "Love_Table/Gen2LoveGrowthsMLM.csv.asm"
          aChildrenDataOffsets .binclude "Tables/NewChildrenDataOffsets.csv.asm"                          ; 83/8993
          aChildrenData .binclude "Tables/NewChildrenData.csv.asm"
          .here
    * = $08D365
    .logical $88D365

      aMapMovementShortSpritePointers .binclude "Tables/MapMovementShortSpritePointers.csv.asm" ; 88/D365
      aMapMovementTallSpritePointers  .binclude "Tables/MapMovementTallSpritePointers.csv.asm"  ; 88/D428

      ; 88/D488

    .here

    * = $010000
    .logical $C10000

      g4bppcMageFemaleMapMovementSprite         .binary "Graphics/MapMovementSprites/MageFemale.4bpp.comp"
      g4bppcMageMapMovementSprite               .binary "Graphics/MapMovementSprites/Mage.4bpp.comp"
      g4bppcPriestFemaleMapMovementSprite       .binary "Graphics/MapMovementSprites/PriestFemale.4bpp.comp"
      g4bppcLordlingMapMovementSprite           .binary "Graphics/MapMovementSprites/Lordling.4bpp.comp"
      g4bppcSwordFighterMapMovementSprite       .binary "Graphics/MapMovementSprites/SwordFighter.4bpp.comp"
      g4bppcLanceArmorMapMovementSprite         .binary "Graphics/MapMovementSprites/LanceArmor.4bpp.comp"
      g4bppcBarbarianMapMovementSprite          .binary "Graphics/MapMovementSprites/Barbarian.4bpp.comp"
      g4bppcBowFighterMapMovementSprite         .binary "Graphics/MapMovementSprites/BowFighter.4bpp.comp"
      g4bppcSoldierMapMovementSprite            .binary "Graphics/MapMovementSprites/Soldier.4bpp.comp"
      g4bppcBowFighterFemaleMapMovementSprite   .binary "Graphics/MapMovementSprites/BowFighterFemale.4bpp.comp"
      g4bppcAxeArmorMapMovementSprite           .binary "Graphics/MapMovementSprites/AxeArmor.4bpp.comp"
      g4bppcBowSoldierMapMovementSprite         .binary "Graphics/MapMovementSprites/BowSoldier.4bpp.comp"
      g4bppcDancerMapMovementSprite             .binary "Graphics/MapMovementSprites/Dancer.4bpp.comp"
      g4bppcSwordFighterFemaleMapMovementSprite .binary "Graphics/MapMovementSprites/SwordFighterFemale.4bpp.comp"
      g4bppcPrincessMapMovementSprite           .binary "Graphics/MapMovementSprites/Princess.4bpp.comp"
      g4bppcThiefMapMovementSprite              .binary "Graphics/MapMovementSprites/Thief.4bpp.comp"
      g4bppcGeneralMapMovementSprite            .binary "Graphics/MapMovementSprites/General.4bpp.comp"
      g4bppcShamanMapMovementSprite             .binary "Graphics/MapMovementSprites/Shaman.4bpp.comp"
      g4bppcAxeFighterMapMovementSprite         .binary "Graphics/MapMovementSprites/AxeFighter.4bpp.comp"
      g4bppcWindMageMapMovementSprite           .crossbank.start "Graphics/MapMovementSprites/WindMage.4bpp.comp"

    .here

    * = $020000
    .logical $C20000

      .crossbank.end
      g4bppcWindMageFemaleMapMovementSprite     .binary "Graphics/MapMovementSprites/WindMageFemale.4bpp.comp"
      g4bppcPriestMapMovementSprite             .binary "Graphics/MapMovementSprites/Priest.4bpp.comp"
      g4bppcHunterMapMovementSprite             .binary "Graphics/MapMovementSprites/Hunter.4bpp.comp"
      g4bppcSwordmasterMapMovementSprite        .binary "Graphics/MapMovementSprites/Swordmaster.4bpp.comp"
      g4bppcForesterMapMovementSprite           .binary "Graphics/MapMovementSprites/Forester.4bpp.comp"
      g4bppcWarriorMapMovementSprite            .binary "Graphics/MapMovementSprites/Warrior.4bpp.comp"
      g4bppcBrigandMapMovementSprite            .binary "Graphics/MapMovementSprites/Brigand.4bpp.comp"
      g4bppcPirateMapMovementSprite             .binary "Graphics/MapMovementSprites/Pirate.4bpp.comp"
      g4bppcForesterFemaleMapMovementSprite     .binary "Graphics/MapMovementSprites/ForesterFemale.4bpp.comp"
      g4bppcBaronMapMovementSprite              .binary "Graphics/MapMovementSprites/Baron.4bpp.comp"
      g4bppcHighPriestFemaleMapMovementSprite   .binary "Graphics/MapMovementSprites/HighPriestFemale.4bpp.comp"
      g4bppcSwordmasterFemaleMapMovementSprite  .binary "Graphics/MapMovementSprites/SwordmasterFemale.4bpp.comp"
      g4bppcSniperFemaleMapMovementSprite       .binary "Graphics/MapMovementSprites/SniperFemale.4bpp.comp"
      g4bppcSniperMapMovementSprite             .binary "Graphics/MapMovementSprites/Sniper.4bpp.comp"
      g4bppcEmperorMapMovementSprite            .binary "Graphics/MapMovementSprites/Emperor.4bpp.comp"
      g4bppcSwordSoldierMapMovementSprite       .binary "Graphics/MapMovementSprites/SwordSoldier.4bpp.comp"
      g4bppcAxeSoldierMapMovementSprite         .binary "Graphics/MapMovementSprites/AxeSoldier.4bpp.comp"
      g4bppcSpearSoldierMapMovementSprite       .binary "Graphics/MapMovementSprites/SpearSoldier.4bpp.comp"
      g4bppcSwordArmorMapMovementSprite         .crossbank.start "Graphics/MapMovementSprites/SwordArmor.4bpp.comp"

    .here

    * = $030000
    .logical $C30000

      .crossbank.end
      g4bppcBowArmorMapMovementSprite           .binary "Graphics/MapMovementSprites/BowArmor.4bpp.comp"
      g4bppcFireMageFemaleMapMovementSprite     .binary "Graphics/MapMovementSprites/FireMageFemale.4bpp.comp"
      g4bppcFireMageMapMovementSprite           .binary "Graphics/MapMovementSprites/FireMage.4bpp.comp"
      g4bppcThunderMageFemaleMapMovementSprite  .binary "Graphics/MapMovementSprites/ThunderMageFemale.4bpp.comp"
      g4bppcThunderMageMapMovementSprite        .binary "Graphics/MapMovementSprites/ThunderMage.4bpp.comp"
      g4bppcHighPriestMapMovementSprite         .binary "Graphics/MapMovementSprites/HighPriest.4bpp.comp"
      g4bppcMageFighterFemaleMapMovementSprite  .binary "Graphics/MapMovementSprites/MageFighterFemale.4bpp.comp"
      g4bppcDarkBishopMapMovementSprite         .binary "Graphics/MapMovementSprites/DarkBishop.4bpp.comp"
      g4bppcDarkMageMapMovementSprite           .binary "Graphics/MapMovementSprites/DarkMage.4bpp.comp"
      g4bppcPrinceMapMovementSprite             .binary "Graphics/MapMovementSprites/Prince.4bpp.comp"
      g4bppcMageFighterMapMovementSprite        .binary "Graphics/MapMovementSprites/MageFighter.4bpp.comp"
      g4bppcChildFemaleMapMovementSprite        .binary "Graphics/MapMovementSprites/ChildFemale.4bpp.comp"
      g4bppcChildMapMovementSprite              .binary "Graphics/MapMovementSprites/Child.4bpp.comp"
      g4bppcQueenMapMovementSprite              .binary "Graphics/MapMovementSprites/Queen.4bpp.comp"
      g4bppcBishopMapMovementSprite             .binary "Graphics/MapMovementSprites/Bishop.4bpp.comp"
      g4bppcCivilianMapMovementSprite           .binary "Graphics/MapMovementSprites/Civilian.4bpp.comp"
      g4bppcCivilianFemaleMapMovementSprite     .binary "Graphics/MapMovementSprites/CivilianFemale.4bpp.comp"
      g4bppcThiefFighterFemaleMapMovementSprite .binary "Graphics/MapMovementSprites/ThiefFighterFemale.4bpp.comp"
      g4bppcBardMapMovementSprite               .binary "Graphics/MapMovementSprites/Bard.4bpp.comp"
      g4bppcThiefFemaleMapMovementSprite        .binary "Graphics/MapMovementSprites/ThiefFemale.4bpp.comp"
      g4bppcThiefFighterMapMovementSprite       .crossbank.start "Graphics/MapMovementSprites/ThiefFighter.4bpp.comp"

    .here

    * = $040000
    .logical $C40000

      .crossbank.end
      g4bppcSageMapMovementSprite               .binary "Graphics/MapMovementSprites/Sage.4bpp.comp"
      g4bppcSageFemaleMapMovementSprite         .binary "Graphics/MapMovementSprites/SageFemale.4bpp.comp"
      g4bppcDarkPrinceMapMovementSprite         .binary "Graphics/MapMovementSprites/DarkPrince.4bpp.comp"
      g4bppcSmallOifeyMapMovementSprite         .binary "Graphics/MapMovementSprites/SmallOifey.4bpp.comp"
      g4bppcShortEmptyMapMovementSprite         .binary "Graphics/MapMovementSprites/ShortEmpty.4bpp.comp"

      g4bppcWyvernRiderMapMovementSprite        .binary "Graphics/MapMovementSprites/WyvernRider.4bpp.comp"
      g4bppcCavalierMapMovementSprite           .binary "Graphics/MapMovementSprites/Cavalier.4bpp.comp"
      g4bppcBanneretMapMovementSprite           .binary "Graphics/MapMovementSprites/Banneret.4bpp.comp"
      g4bppcPegasusRiderMapMovementSprite       .binary "Graphics/MapMovementSprites/PegasusRider.4bpp.comp"
      g4bppcAxeKnightMapMovementSprite          .binary "Graphics/MapMovementSprites/AxeKnight.4bpp.comp"
      g4bppcFreeKnightMapMovementSprite         .binary "Graphics/MapMovementSprites/FreeKnight.4bpp.comp"
      g4bppcLanceKnightMapMovementSprite        .binary "Graphics/MapMovementSprites/LanceKnight.4bpp.comp"
      g4bppcArcherKnightMapMovementSprite       .crossbank.start "Graphics/MapMovementSprites/ArcherKnight.4bpp.comp"

    .here

    * = $050000
    .logical $C50000

      .crossbank.end
      g4bppcKnightLordSeliphMapMovementSprite   .binary "Graphics/MapMovementSprites/KnightLordSeliph.4bpp.comp"
      g4bppcTroubadourMapMovementSprite         .binary "Graphics/MapMovementSprites/Troubadour.4bpp.comp"
      g4bppcKnightLordSigurdMapMovementSprite   .binary "Graphics/MapMovementSprites/KnightLordSigurd.4bpp.comp"
      g4bppcPaladinMapMovementSprite            .binary "Graphics/MapMovementSprites/Paladin.4bpp.comp"
      g4bppcWyvernLordMapMovementSprite         .binary "Graphics/MapMovementSprites/WyvernLord.4bpp.comp"
      g4bppcBowKnightMapMovementSprite          .binary "Graphics/MapMovementSprites/BowKnight.4bpp.comp"
      g4bppcGreatKnightMapMovementSprite        .binary "Graphics/MapMovementSprites/GreatKnight.4bpp.comp"
      g4bppcMageKnightMapMovementSprite         .binary "Graphics/MapMovementSprites/MageKnight.4bpp.comp"
      g4bppcWyvernKnightMapMovementSprite       .binary "Graphics/MapMovementSprites/WyvernKnight.4bpp.comp"
      g4bppcPegasusKnightMapMovementSprite      .crossbank.start "Graphics/MapMovementSprites/PegasusKnight.4bpp.comp"

    .here



    * = $060000
    .logical $C60000

      .crossbank.end
      g4bppcFalconKnightMapMovementSprite       .binary "Graphics/MapMovementSprites/FalconKnight.4bpp.comp"
      g4bppcMasterKnightMapMovementSprite       .binary "Graphics/MapMovementSprites/MasterKnight.4bpp.comp"
      g4bppcRangerMapMovementSprite             .binary "Graphics/MapMovementSprites/Ranger.4bpp.comp"
      g4bppcBallisticianMapMovementSprite       .binary "Graphics/MapMovementSprites/Ballistician.4bpp.comp"
      g4bppcIronBallisticianMapMovementSprite   .binary "Graphics/MapMovementSprites/IronBallistician.4bpp.comp"
      g4bppcKillerBallisticianMapMovementSprite .binary "Graphics/MapMovementSprites/KillerBallistician.4bpp.comp"
      g4bppcGreatBallisticianMapMovementSprite  .binary "Graphics/MapMovementSprites/GreatBallistician.4bpp.comp"
      g4bppcWyvernRiderFemaleMapMovementSprite  .binary "Graphics/MapMovementSprites/WyvernRiderFemale.4bpp.comp"
      g4bppcWyvernKnightFemaleMapMovementSprite .binary "Graphics/MapMovementSprites/WyvernKnightFemale.4bpp.comp"
      g4bppcWyvernLordFemaleMapMovementSprite   .binary "Graphics/MapMovementSprites/WyvernLordFemale.4bpp.comp"
      g4bppcPaladinFemaleMapMovementSprite      .binary "Graphics/MapMovementSprites/PaladinFemale.4bpp.comp"
      g4bppcMageKnightFemaleMapMovementSprite   .crossbank.start "Graphics/MapMovementSprites/MageKnightFemale.4bpp.comp"

    .here


    * = $070000
    .logical $C70000

      .crossbank.end
      g4bppcMasterKnightFemaleMapMovementSprite .binary "Graphics/MapMovementSprites/MasterKnightFemale.4bpp.comp"
      g4bppcTallEmptyMapMovementSprite          .binary "Graphics/MapMovementSprites/TallEmpty.4bpp.comp"

      ; C7/0C6C

    .here

     * = $06C739
        .logical $86C739

          aChapterEventPointers .include "TABLES/CHAPTER/ChapterEventPointers.csv.asm" ; 86/C739
          aChapterEventDataPointers .include "TABLES/CHAPTER/ChapterEventDataPointers.csv.asm" ; 86/C760
          aFactionGroupPointers .include "TABLES/CHAPTER/FactionGroupPointers.csv.asm" ; 86/C784

          .dsection Chapter01EventsSection
          .dsection Chapter01EventDataSection
          .dsection Chapter02EventsSection
          .dsection Chapter02EventDataSection
          .dsection Chapter03EventsSection
          .dsection Chapter03EventDataSection
          .dsection Chapter04EventsSection
          .dsection Chapter04EventDataSection
          .dsection Chapter05EventsSection
          .dsection Chapter05EventDataSection
          .dsection Chapter07EventsSection
          .dsection Chapter07EventDataSection
          .dsection Chapter08EventsSection
          .dsection Chapter08EventDataSection
          .dsection Chapter09EventsSection
          .dsection Chapter09EventDataSection
          .dsection ChapterEpilogueEventsSection

          .fill $868000 + $8000 - *, 0

        .here
        * = $01C000
            .logical $81C000

              aUNITGroupPointers                  .include "TABLES/EVENTUNIT/UNITGroupPointers.csv.asm"
              aUNITGroupDataPrologueStart         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueStart.csv.asm"
              aUNITGroupDataPrologueEvans         .binclude "TABLES/EVENTUNIT/UNITGroupDataPrologueEvans.csv.asm"
              aUNITGroupDataChapter01Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Start.csv.asm"
              aUNITGroupDataChapter01Marpha       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Marpha.csv.asm"
              aUNITGroupDataChapter01Heirhein     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Heirhein.csv.asm"
              aUNITGroupDataChapter01Nordion      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Nordion.csv.asm"
              aUNITGroupDataChapter01Verdane      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Verdane.csv.asm"
              aUNITGroupDataChapter01Brigands     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter01Brigands.csv.asm"
              aUNITGroupDataChapter02Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Start.csv.asm"
              aUNITGroupDataChapter02Yellows      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Yellows.csv.asm"
              aUNITGroupDataChapter02Infini       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Infini.csv.asm"
              aUNITGroupDataChapter02Mackily      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Mackily.csv.asm"
              aUNITGroupDataChapter02Agusti       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter02Agusti.csv.asm"
              aUNITGroupDataChapter03Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Start.csv.asm"
              aUNITGroupDataChapter03Sylvale      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Sylvale.csv.asm"
              aUNITGroupDataChapter03Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Thracia.csv.asm"
              aUNITGroupDataChapter03Orgahil      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03Orgahil.csv.asm"
              aUNITGroupDataChapter03DozelFriege  .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter03DozelFriege.csv.asm"
              aUNITGroupDataChapter04Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Start.csv.asm"
              aUNITGroupDataChapter04Donovan      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Donovan.csv.asm"
              aUNITGroupDataChapter04Pamela       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Pamela.csv.asm"
              aUNITGroupDataChapter04Annand       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Annand.csv.asm"
              aUNITGroupDataChapter04Andrey       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Andrey.csv.asm"
              aUNITGroupDataChapter04Zaxon        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter04Zaxon.csv.asm"
              aUNITGroupDataChapter05Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Start.csv.asm"
              aUNITGroupDataChapter05Leonster     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Leonster.csv.asm"
              aUNITGroupDataChapter05Phinora      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Phinora.csv.asm"
              aUNITGroupDataChapter05Velthomer    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Velthomer.csv.asm"
              aUNITGroupDataChapter05Belhalla     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Belhalla.csv.asm"
              aUNITGroupDataChapter05Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter05Thracia.csv.asm"
              aUNITGroupDataChapter06Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Start.csv.asm"
              aUNITGroupDataChapter06Ganeishire   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Ganeishire.csv.asm"
              aUNITGroupDataChapter06Ribaut       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter06Ribaut.csv.asm"
              aUNITGroupDataChapter07Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Start.csv.asm"
              aUNITGroupDataChapter07Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Opening.csv.asm"
              aUNITGroupDataChapter07Melgen       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Melgen.csv.asm"
              aUNITGroupDataChapter07Ulster       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter07Ulster.csv.asm"
              aUNITGroupDataChapter08Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Start.csv.asm"
              aUNITGroupDataChapter08Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Opening.csv.asm"
              aUNITGroupDataChapter08Meath        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Meath.csv.asm"
              aUNITGroupDataChapter08Febail       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter08Febail.csv.asm"
              aUNITGroupDataChapter09Start        .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Start.csv.asm"
              aUNITGroupDataChapter09Opening      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Opening.csv.asm"
              aUNITGroupDataChapter09Travant      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Travant.csv.asm"
              aUNITGroupDataChapter09Grutia       .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Grutia.csv.asm"
              aUNITGroupDataChapter09Thracia      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter09Thracia.csv.asm"
              aUNITGroupDataChapter10Opening1     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Opening1.csv.asm"
              aUNITGroupDataChapter10Opening2     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Opening2.csv.asm"
              aUNITGroupDataChapter10Miletos      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Miletos.csv.asm"
              aUNITGroupDataChapter10Chalphy      .binclude "TABLES/EVENTUNIT/UNITGroupDataChapter10Chalphy.csv.asm"
              aUNITGroupDataChapterFinalOpening   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalOpening.csv.asm"
              aUNITGroupDataChapterFinalDozel     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalDozel.csv.asm"
              aUNITGroupDataChapterFinalYngvi     .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalYngvi.csv.asm"
              aUNITGroupDataChapterFinalFriege    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalFriege.csv.asm"
              aUNITGroupDataChapterFinalVelthomer .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalVelthomer.csv.asm"
              aUNITGroupDataChapterFinalBelhalla  .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalBelhalla.csv.asm"
              aUNITGroupDataChapterFinalThracia   .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalThracia.csv.asm"
              aUNITGroupDataChapterFinalUnused    .binclude "TABLES/EVENTUNIT/UNITGroupDataChapterFinalUnused.csv.asm"

              ; 81ebbc
            .here

            * = $0D863F
                .logical $8D863F

                  .include "EVENTS/Chapter10/EventChapter10Opening.asm"
                  .include "EVENTS/Chapter10/EventChapter10RiddellLeisurelyCharge.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued1.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued2.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued3.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued4.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued5.asm"
                  .include "EVENTS/Chapter10/EventChapter10CivilianRescued6.asm"
                  .include "EVENTS/Chapter10/EventChapter10ChronosSeized.asm"
                  .include "EVENTS/Chapter10/EventChapter10RadosSeized.asm"
                  .include "EVENTS/Chapter10/EventChapter10MiletosSpawn.asm"
                  .include "EVENTS/Chapter10/EventChapter10MiletosSeized.asm"
                  .include "EVENTS/Chapter10/EventChapter10ChalphySpawn.asm"
                  .include "EVENTS/Chapter10/EventChapter10SeliphPalmarchTalk.asm"
                  .include "EVENTS/Chapter10/EventChapter10Ending.asm"
                  .include "EVENTS/Chapter10/EventChapter10JuliusKilledUnit.asm"
                  .include "EVENTS/Chapter10/EventChapter10IshtarKilledUnit.asm"
                  .include "EVENTS/Chapter10/EventChapter10JuliusDied.asm"
                  .include "EVENTS/Chapter10/EventChapter10IshtarDied.asm"
                  .include "EVENTS/Chapter10/EventChapter10Village1.asm"
                  .include "EVENTS/Chapter10/EventChapter10Village2.asm"
                  .include "EVENTS/Chapter10/EventChapter10Village3.asm"
                  .include "EVENTS/Chapter10/EventChapter10VillageMagicRing.asm"
                  .include "EVENTS/Chapter10/EventChapter10Village4.asm"
                  .include "EVENTS/Chapter10/EventChapter10Village5.asm"
                  .include "EVENTS/Chapter10/EventChapter10HildaDied.asm"
                  .include "EVENTS/Chapter10/EventChapter10_185.asm"
                  .include "EVENTS/Chapter10/EventChapter10SeliphAtSea.asm"
                  .include "EVENTS/Chapter10/EventChapter10_18A.asm"
                    .here

            * = $0dfc56
                    .logical $8dfc56
            aWorldMapEvents .binclude "TABLES/CHAPTER/WorldMapEvents.csv.asm"

                  .include "EVENTS/ChapterPrologue/EventPrologueWorldMap.asm"
                  .include "EVENTS/Chapter01/EventChapter01WorldMap.asm"
                  .include "EVENTS/Chapter02/EventChapter02WorldMap.asm"
                  .include "EVENTS/Chapter03/EventChapter03WorldMap.asm"
                  .include "EVENTS/Chapter04/EventChapter04WorldMap.asm"
                  .include "EVENTS/Chapter05/EventChapter05WorldMap.asm"
                  .include "EVENTS/Chapter06/EventChapter06WorldMap.asm"
                  .include "EVENTS/Chapter07/EventChapter07WorldMap.asm"
                  .include "EVENTS/Chapter08/EventChapter08WorldMap.asm"
                  .include "EVENTS/Chapter09/EventChapter09WorldMap.asm"
                  .include "EVENTS/Chapter10/EventChapter10WorldMap.asm"
                  .include "EVENTS/ChapterFinal/EventChapterFinalWorldMap.asm"
                  .here




            * = $0E8000
                .logical $8E8000

                  .include "EVENTS/Chapter02/EventChapter02Opening.asm"
                  .include "EVENTS/Chapter02/EventChapter02InfiniBrigandsSpawn.asm"
                  .include "EVENTS/Chapter02/EventChapter02ElliotCharge.asm"
                  .include "EVENTS/Chapter02/EventChapter02PhilipDefend.asm"
                  .include "EVENTS/Chapter02/EventChapter02LewynSilviaSpawn.asm"
                  .include "EVENTS/Chapter02/EventChapter02InfiniSpawn.asm"
                  .include "EVENTS/Chapter02/EventChapter02WaltzCharge.asm"
                  .include "EVENTS/Chapter02/EventChapter02SigurdLachesisTalk.asm"
                  .include "EVENTS/Chapter02/EventChapter02BeowulfTalkNoMoney.asm"
                  .include "EVENTS/Chapter02/EventChapter02BeowulfTalkSuccess.asm"
                  .include "EVENTS/Chapter02/EventChapter02MackilySpawn.asm"
                  .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentEvans.asm"
                  .include "EVENTS/Chapter02/EventChapter02AgustiSpawn.asm"
                  .include "EVENTS/Chapter02/EventChapter02LewynErinysTalk.asm"
                  .include "EVENTS/Chapter02/EventChapter02Ending.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village8.asm"
                  .include "EVENTS/Chapter02/EventChapter02VillageBargainBand.asm"
                  .include "EVENTS/Chapter02/EventChapter02VillageArmorslayer.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village5.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village2.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village4.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village6.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village7.asm"
                  .include "EVENTS/Chapter02/EventChapter02_05B.asm"
                  .include "EVENTS/Chapter02/EventChapter02_05C.asm"
                  .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentHeirhein.asm"
                  .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentInfini.asm"
                  .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentMackily.asm"
                  .include "EVENTS/Chapter02/EventChapter02ChulainnRecruitmentNordion.asm"
                  .include "EVENTS/Chapter02/EventChapter02HeirheinSeized.asm"
                  .include "EVENTS/Chapter02/EventChapter02ErinysGroupArrive.asm"
                  .include "EVENTS/Chapter02/EventChapter02InfiniSeized.asm"
                  .include "EVENTS/Chapter02/EventChapter02_064.asm"
                  .include "EVENTS/Chapter02/EventChapter02MackilyWorried.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village1.asm"
                  .include "EVENTS/Chapter02/EventChapter02Village3.asm"
                  .include "EVENTS/Chapter02/EventChapter02QuanDied.asm"
                  .include "EVENTS/Chapter02/EventChapter02EthlynDied.asm"
                  .include "EVENTS/Chapter02/EventChapter02FinnDied.asm"
                  .include "EVENTS/Chapter02/EventChapter02MackilySeized.asm"
                  .include "EVENTS/Chapter02/EventChapter02_06C.asm"
                  .include "EVENTS/Chapter02/EventChapter02_06D.asm"
                  .include "EVENTS/Chapter02/EventChapter02_06E.asm"
                  .include "EVENTS/Chapter02/EventChapter02_06F.asm"
                  .include "EVENTS/Chapter02/EventChapter02MountainArmorTalk.asm"
                  .include "EVENTS/Chapter02/EventChapter02ArdenPursuitRing.asm"
                  .here



            * = $0e9020
                .logical $8e9020
            .include "EVENTS/Chapter04/EventChapter04Opening.asm"
              .include "EVENTS/Chapter04/EventChapter04CuvuliCharge.asm"
              .include "EVENTS/Chapter04/EventChapter04DaccarAndreyPreparing.asm"
              .include "EVENTS/Chapter04/EventChapter04RaiseBridge.asm"
              .include "EVENTS/Chapter04/EventChapter04LowerBridge.asm"
              .include "EVENTS/Chapter04/EventChapter04PamelaSpawn.asm"
              .include "EVENTS/Chapter04/EventChapter04AnnandSpawn.asm"
              .include "EVENTS/Chapter04/EventChapter04AnnandPamelaCloseByTalk.asm"
              .include "EVENTS/Chapter04/EventChapter04_09E.asm"
              .include "EVENTS/Chapter04/EventChapter04AndreySpawn.asm"
              .include "EVENTS/Chapter04/EventChapter04AnnandDeathAndreyResponse.asm"
              .include "EVENTS/Chapter04/EventChapter04AnnandDeathPlayerResponses.asm"
              .include "EVENTS/Chapter04/EventChapter04AndreyLeave.asm"
              .include "EVENTS/Chapter04/EventChapter04ZaxonSpawn.asm"
              .include "EVENTS/Chapter04/EventChapter04DonovanSpawn.asm"
              .include "EVENTS/Chapter04/EventChapter04SilesseSeized.asm"
              .include "EVENTS/Chapter04/EventChapter04SilesseSeizedDaccarResponse.asm"
              .include "EVENTS/Chapter04/EventChapter04LewynSilesseVisit.asm"
              .include "EVENTS/Chapter04/EventChapter04Ending.asm"
              .include "EVENTS/Chapter04/EventChapter04CivilianRescuedA.asm"
              .include "EVENTS/Chapter04/EventChapter04CivilianRescuedB.asm"
              .include "EVENTS/Chapter04/EventChapter04Village7.asm"
              .include "EVENTS/Chapter04/EventChapter04Village4.asm"
              .include "EVENTS/Chapter04/EventChapter04Village5.asm"
              .include "EVENTS/Chapter04/EventChapter04Village3.asm"
              .include "EVENTS/Chapter04/EventChapter04Village2.asm"
              .include "EVENTS/Chapter04/EventChapter04VillageSafeguardAnyone.asm"
              .include "EVENTS/Chapter04/EventChapter04Village6.asm"
              .include "EVENTS/Chapter04/EventChapter04Village1.asm"
              .include "EVENTS/Chapter04/EventChapter04TofaSeized.asm"
              .include "EVENTS/Chapter04/EventChapter04_0B4.asm"
              .include "EVENTS/Chapter04/EventChapter04LamiaCharge.asm"
              .include "EVENTS/Chapter04/EventChapter04VillageSafeguardSilvia.asm"
              .include "EVENTS/Chapter04/EventChapter04ErinysSilviaAdjacent.asm"
              .include "EVENTS/Chapter04/EventChapter04_0B8.asm"
              .include "EVENTS/Chapter04/EventChapter04_0B9.asm"
               .here


            * = $0FB81D
                    .logical $8FB81D
           .include "EVENTS/Chapter08/EventChapter08Opening.asm"
                 .include "EVENTS/Chapter08/EventChapter08MuhammadCharge.asm"
                 .include "EVENTS/Chapter08/EventChapter08OvoCharge.asm"
                 .include "EVENTS/Chapter08/EventChapter08BanbaCharge.asm"
                 .include "EVENTS/Chapter08/EventChapter08FebailAsaello_Spawn.asm"
                 .include "EVENTS/Chapter08/EventChapter08IshtarSpawn.asm"
                 .include "EVENTS/Chapter08/EventChapter08IshtarLeave.asm"
                 .include "EVENTS/Chapter08/EventChapter08ConnachtSeized.asm"
                 .include "EVENTS/Chapter08/EventChapter08_12C.asm"
                 .include "EVENTS/Chapter08/EventChapter08MeathSpawn.asm"
                 .include "EVENTS/Chapter08/EventChapter08CoulterCharge.asm"
                 .include "EVENTS/Chapter08/EventChapter08MunsterSavedMaykovReaction.asm"
                 .include "EVENTS/Chapter08/EventChapter08Ending.asm"
                 .include "EVENTS/Chapter08/EventChapter08PattyDaisy_FebailAsaelloTalk.asm"
                 .include "EVENTS/Chapter08/EventChapter08Seliph_CedHawkTalk.asm"
                 .include "EVENTS/Chapter08/EventChapter08Village1.asm"
                 .include "EVENTS/Chapter08/EventChapter08VillagePowerRing.asm"
                 .include "EVENTS/Chapter08/EventChapter08Village2.asm"
                 .include "EVENTS/Chapter08/EventChapter08Village3.asm"
                 .include "EVENTS/Chapter08/EventChapter08Village4.asm"
                 .include "EVENTS/Chapter08/EventChapter08VillageThiefBand.asm"
                 .include "EVENTS/Chapter08/EventChapter08IshtarDied.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued1.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued2.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued3.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued4.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued5.asm"
                 .include "EVENTS/Chapter08/EventChapter08CivilianRescued6.asm"
                 .include "EVENTS/Chapter08/EventChapter08_140.asm"
                 .include "EVENTS/Chapter08/EventChapter08Village3Asaello.asm"
                 .include "EVENTS/Chapter08/EventChapter08LeifNearMountain.asm"
                 .include "EVENTS/Chapter08/EventChapter08FeeOnMountain.asm"
                 .include "EVENTS/Chapter08/EventChapter08MuirneSeliphAdjacent.asm"
                 .include "EVENTS/Chapter08/EventChapter08LindaOnTree.asm"
                 .include "EVENTS/Chapter08/EventChapter08AmidOnTree.asm"
           .here



        * = $0fe8bf
                    .logical $8fe8bf
       aEventPointers .include "ProjectASM/New_Events/EventPointers.csv.asm"

      .include "EVENTS/General/EventDebug8FEF78.asm"
      .include "EVENTS/General/EventSigurdDeathReaction.asm"
      .include "EVENTS/General/EventGen1HomeCastleSeized.asm"
      .include "EVENTS/General/EventSeliphDeathReaction.asm"
      .include "EVENTS/General/EventGen2HomeCastleSeized.asm"

      .include "EVENTS/Chapter06/EventChapter06OifeySeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06LesterLanaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06FeeSeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06LanaMuirne_JuliaTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06ScathachLarceiTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06ArthurAmid_SeliphTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06DeimneMuirneTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06DalvinCreidneTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06Seliph_LanaMuirneTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06JuliaSeliphTalk.asm"

      .include "EVENTS/Chapter07/EventChapter07Shannan_PattyDaisyTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07SeliphShannanTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07Oifey_DiarmuidTristanTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LarceiCreidne_ShannanTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07PattyDaisy_SeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07AresSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LeifSeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07DiarmuidNannaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07TristanJeanneTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07TineLinda_SeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07LeneLaylea_SeliphTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnNannaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnLanaTalk.asm"
      .include "EVENTS/Chapter07/EventChapter07FinnLarceiTalk.asm"

      .include "EVENTS/Chapter08/EventChapter08FebailAsaello_SeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08HerminaHawkTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08FeeCedTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08NannaAresTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08CedSeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08Seliph_TineLindaTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08JuliaSeliphTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08ArthurAmid_FeeHerminaTalk.asm"
      .include "EVENTS/Chapter08/EventChapter08FinnLeifTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09FebailPattyTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09SeliphHannibalTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09LeneCoirpreTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09FinnAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09HannibalAltenaTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09PattyDaisy_CoirpreCharlotTalk.asm"
      .include "EVENTS/Chapter09/EventChapter09JuliaSeliphTalk.asm"

      .include "EVENTS/Chapter10/EventChapter10LeifAltenaTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10ShannanSeliphTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10OifeySeliphTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10CoirpreCharlot_AltenaTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10LesterDeimne_PattyDaisyTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10NannaJeanne_LeifTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10FebailAsaello_LanaMuirneTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphLeneTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphFeeTalk.asm"
      .include "EVENTS/Chapter10/EventChapter10SeliphTineTalk.asm"

      .include "EVENTS/ChapterFinal/EventChapterFinalTineLinda_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalTineLinda_CedHawkTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalTineLinda_LeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalDaisyDeimneTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalJeanneLeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalMuirneAsaelloTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaMuirne_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaFebailTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLanaMuirne_ScathachDalvinTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiCreidne_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiCreidne_IucharTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiCreidne_IucharbaTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalLarceiCreidne_ShannanTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattyDaisy_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattyDaisy_ShannanTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalPattyLesterTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaJeanne_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaAresTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalNannaLeifTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeHermina_SeliphTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeHermina_ArthurAmidTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalFeeOifeyTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09AsaelloDaisyTalk.asm"

      .include "EVENTS/ChapterFinal/EventChapterFinalArthurTineTalk.asm"
      .include "EVENTS/ChapterFinal/EventChapterFinalAmidLindaTalk.asm"

      .include "EVENTS/Chapter09/EventChapter09LayleaCharlotTalk.asm"
      .include "EVENTS/Chapter06/EventChapter06HerminaSeliphTalk.asm"
      .include "ProjectASM/New_Events/EventChapter07Shannan_OifeyTalk.asm"
      .include "ProjectASM/New_Events/EventChapterFinalAres_SeliphTalk.asm"
      .include "ProjectASM/New_Events/EventChapterFinalLeneLaylea_AresTalk.asm"
      .include "ProjectASM/New_Events/EventChapterFinalLana_JuliaTalk.asm"

      .fill $8F8000 + $8000 - *, 0
       .here



            * = $108000
                .logical $908000

                  .dsection ChapterPrologueEventsSection
                  .dsection ChapterPrologueEventDataSection

                  .include "EVENTS/Chapter01/EventChapter01Opening.asm"
                  .include "EVENTS/Chapter01/EventChapter01_021.asm"
                  .include "EVENTS/Chapter01/EventChapter01EdainGroupSpawn.asm"
                  .include "EVENTS/Chapter01/EventChapter01GenoaSeized.asm"
                  .include "EVENTS/Chapter01/EventChapter01SigurdAyraTalk.asm"
                  .include "EVENTS/Chapter01/EventChapter01EdainJamkeTalk.asm"
                  .include "EVENTS/Chapter01/EventChapter01HeirheinSpawn.asm"
                  .include "EVENTS/Chapter01/EventChapter01NordionSpawn.asm"
                  .include "EVENTS/Chapter01/EventChapter01MarphaSeized.asm"
                  .include "EVENTS/Chapter01/EventChapter01VerdaneSpawn.asm"
                  .include "EVENTS/Chapter01/EventChapter01DeirdreSpawn.asm"
                  .include "EVENTS/Chapter01/EventChapter01Ending.asm"
                  .include "EVENTS/Chapter01/EventChapter01_02C.asm"
                  .include "EVENTS/Chapter01/EventChapter01_02D.asm"
                  .include "EVENTS/Chapter01/EventChapter01_02E.asm"
                  .include "EVENTS/Chapter01/EventChapter01_02F.asm"
                  .include "EVENTS/Chapter01/EventChapter01_030.asm"
                  .include "EVENTS/Chapter01/EventChapter01_031.asm"
                  .include "EVENTS/Chapter01/EventChapter01_032.asm"
                  .include "EVENTS/Chapter01/EventChapter01_033.asm"
                  .include "EVENTS/Chapter01/EventChapter01Village1.asm"
                  .include "EVENTS/Chapter01/EventChapter01Village2.asm"
                  .include "EVENTS/Chapter01/EventChapter01Village3.asm"
                  .include "EVENTS/Chapter01/EventChapter01EldiganRetreat.asm"
                  .include "EVENTS/Chapter01/EventChapter01MunnirRallyVanguard.asm"
                  .include "EVENTS/Chapter01/EventChapter01AyraDestroysGenoa.asm"
                  .include "EVENTS/Chapter01/EventChapter01AyraStartsMoving.asm"
                  .include "EVENTS/Chapter01/EventChapter01GenoaSeizedAyraResponse.asm"
                  .include "EVENTS/Chapter01/EventChapter01_03C.asm"
                  .include "EVENTS/Chapter01/EventChapter01QuanDied.asm"
                  .include "EVENTS/Chapter01/EventChapter01EthlynDied.asm"
                  .include "EVENTS/Chapter01/EventChapter01FinnDied.asm"
                  .include "EVENTS/Chapter01/EventChapter01ElliotRetreats.asm"
                  .include "EVENTS/Chapter01/EventChapter01LexBraveAxe.asm"
                  .include "EVENTS/Chapter01/EventChapter01CrossknightTalk.asm"
                  .include "EVENTS/Chapter01/EventChapter01_043.asm"
                  .here

               * = $11CE2B
                   .logical $91CE2B
                     .include "EVENTS/Chapter06/EventChapter06Opening.asm"
                     .include "EVENTS/Chapter06/EventChapter06OifeyGroupSpawn.asm"
                     .include "EVENTS/Chapter06/EventChapter06GaneishireSeized.asm"
                     .include "EVENTS/Chapter06/EventChapter06FeeArthurSpawn.asm"
                     .include "EVENTS/Chapter06/EventChapter06SchmidtSpawn.asm"
                     .include "EVENTS/Chapter06/EventChapter06LarceiCreidne_IucharbaTalk.asm"
                     .include "EVENTS/Chapter06/EventChapter06LarceiCreidne_IucharTalk.asm"
                     .include "EVENTS/Chapter06/EventChapter06IsaachSeized.asm"
                     .include "EVENTS/Chapter06/EventChapter06SofalaSeized.asm"
                     .include "EVENTS/Chapter06/EventChapter06BrotherRecruitedDanannResponse.asm"
                     .include "EVENTS/Chapter06/EventChapter06Ending.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village1.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village2.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village3.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village4.asm"
                     .include "EVENTS/Chapter06/EventChapter06VillageSkillRing.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village5.asm"
                     .include "EVENTS/Chapter06/EventChapter06_0EA.asm"
                     .include "EVENTS/Chapter06/EventChapter06CreidneIucharbaAdjacent.asm"
                     .include "EVENTS/Chapter06/EventChapter06CreidneIucharAdjacent.asm"
                     .include "EVENTS/Chapter06/EventChapter06Village2Seliph.asm"
                     .include "EVENTS/Chapter06/EventChapter06SofalaArmyTalk.asm"
                     .include "EVENTS/Chapter06/EventChapter06IsaachArmyTalk.asm"
                     .include "EVENTS/Chapter06/EventChapter06DeimneIsaachVisit.asm"
                     .include "EVENTS/Chapter06/EventChapter06_0F5.asm"

                     ; 91d616

                   .here
                 * = $1D8703
                 .logical $9D8703
                 .include "EVENTS/Chapter03/EventChapter03Opening.asm"
                       .include "EVENTS/Chapter03/EventChapter03MadinoSeized.asm"
                       .include "EVENTS/Chapter03/EventChapter03SylvaleSpawn.asm"
                       .include "EVENTS/Chapter03/EventChapter03_075.asm"
                       .include "EVENTS/Chapter03/EventChapter03EldiganApproachesSigurd.asm"
                       .include "EVENTS/Chapter03/EventChapter03SigurdApproachesEldigan.asm"
                       .include "EVENTS/Chapter03/EventChapter03LachesisEldiganTalk.asm"
                       .include "EVENTS/Chapter03/EventChapter03_079.asm"
                       .include "EVENTS/Chapter03/EventChapter03EldiganDeathSigurdResponse.asm"
                       .include "EVENTS/Chapter03/EventChapter03ThraciaSpawn.asm"
                       .include "EVENTS/Chapter03/EventChapter03_07C.asm"
                       .include "EVENTS/Chapter03/EventChapter03TravantLeave.asm"
                       .include "EVENTS/Chapter03/EventChapter03SylvaleSeized.asm"
                       .include "EVENTS/Chapter03/EventChapter03ClaudTailtiuSpawn.asm"
                       .include "EVENTS/Chapter03/EventChapter03OrgahilSpawn.asm"
                       .include "EVENTS/Chapter03/EventChapter03_081.asm"
                       .include "EVENTS/Chapter03/EventChapter03Ending.asm"
                       .include "EVENTS/Chapter03/EventChapter03_083.asm"
                       .include "EVENTS/Chapter03/EventChapter03_084.asm"
                       .include "EVENTS/Chapter03/EventChapter03Village2.asm"
                       .include "EVENTS/Chapter03/EventChapter03VillageWingclipper.asm"
                       .include "EVENTS/Chapter03/EventChapter03VillageRestore.asm"
                       .include "EVENTS/Chapter03/EventChapter03VillageDefense.asm"
                       .include "EVENTS/Chapter03/EventChapter03Village4.asm"
                       .include "EVENTS/Chapter03/EventChapter03Village3.asm"
                       .include "EVENTS/Chapter03/EventChapter03VillageStrength.asm"
                       .include "EVENTS/Chapter03/EventChapter03Village1.asm"
                       .include "EVENTS/Chapter03/EventChapter03QuanDied.asm"
                       .include "EVENTS/Chapter03/EventChapter03EthlynDied.asm"
                       .include "EVENTS/Chapter03/EventChapter03FinnDied.asm"
                       .include "EVENTS/Chapter03/EventChapter03_090.asm"
                       .include "EVENTS/Chapter03/EventChapter03_091.asm"
                       .include "EVENTS/Chapter03/EventChapter03_092.asm"
                       .include "EVENTS/Chapter03/EventChapter03SylvaleCommanderTalk.asm"
                       .include "EVENTS/Chapter03/EventChapter03DewBragiTower.asm"
                       .include "EVENTS/Chapter03/EventChapter03_095.asm"
                       .here
              * = $1DBEBB
                    .logical $9DBEBB
              .include "EVENTS/Chapter05/EventChapter05Opening.asm"
                    .include "EVENTS/Chapter05/EventChapter05SigurdByronTalk.asm"
                    .include "EVENTS/Chapter05/EventChapter05AndreyCharge.asm"
                    .include "EVENTS/Chapter05/EventChapter05BelhallaConversation.asm"
                    .include "EVENTS/Chapter05/EventChapter05LubeckSeized.asm"
                    .include "EVENTS/Chapter05/EventChapter05PhinoraSpawn.asm"
                    .include "EVENTS/Chapter05/EventChapter05LeonsterSpawn.asm"
                    .include "EVENTS/Chapter05/EventChapter05ThraciaSpawn.asm"
                    .include "EVENTS/Chapter05/EventChapter05EthlynDied.asm"
                    .include "EVENTS/Chapter05/EventChapter05QuanAndEthlynDead.asm"
                    .include "EVENTS/Chapter05/EventChapter05PhinoraSeized.asm"
                    .include "EVENTS/Chapter05/EventChapter05ReptorCharge.asm"
                    .include "EVENTS/Chapter05/EventChapter05AidaBetrayal.asm"
                    .include "EVENTS/Chapter05/EventChapter05ReptorBetrayalResponse.asm"
                    .include "EVENTS/Chapter05/EventChapter05Ending.asm"
                    .include "EVENTS/Chapter05/EventChapter05AnyoneAidaTalk.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village1.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village2.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village3.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village4.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village5.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village6.asm"
                    .include "EVENTS/Chapter05/EventChapter05VelthomerSeized.asm"
                    .include "EVENTS/Chapter05/EventChapter05Village7.asm"
                    .include "EVENTS/Chapter05/EventChapter05ReptorDied.asm"
                    .include "EVENTS/Chapter05/EventChapter05ArdenOnCliff.asm"
                    .include "EVENTS/Chapter05/EventChapter05_0D7.asm"
                    .include "EVENTS/Chapter05/EventChapter05_0D8.asm"
                    .here
              * = $30CB5A
                     .logical $B0CB5A
                     .include "EVENTS/Chapter03/EventChapter03LexAyraTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03ChulainnAyraTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03SigurdBrigidTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03ClaudSigurdTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03MidirBrigidTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03EthlynQuanTalk.asm"
                   .include "EVENTS/Chapter03/EventChapter03EdainBrigidTalk.asm"

                   .include "EVENTS/Chapter04/EventChapter04SigurdClaudTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04TailtiuAzelleTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04EdainJamkeTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04EdainMidirTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04EdainAzelleTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04SilviaClaudTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04LewynSigurdTalk.asm"
                   .include "EVENTS/Chapter04/EventChapter04ErinysLewynTalk.asm"

                   .include "EVENTS/Chapter05/EventChapter05EdainBrigidTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05ClaudEdainTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05DewJamkeTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05AlecNaoiseTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05LexAzelleTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05SigurdAyraTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05_1CE.asm"
                   .include "EVENTS/Chapter05/EventChapter05TailtiuAzelleTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05TailtiuClaudTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05TailtiuLexTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05ErinysLewynTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05ErinysArdenTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05ErinysNaoiseTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05SilviaClaudTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05SilviaLewynTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05SilviaAlecTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05LachesisBeowulfTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05LachesisNaoiseTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05LachesisDewTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05AyraLexTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05AyraChulainnTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05AyraArdenTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05BrigidAlecTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05BrigidJamkeTalk.asm"
                   .include "EVENTS/Chapter05/EventChapter05BrigidMidirTalk.asm"
                   .here

            * = $318000
                .logical $B18000

                  .include "EVENTS/ChapterPrologue/EventPrologueOpening.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueEdainAbduction.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueQuanGroupSpawn.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueLexAzelleSpawn.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueYngviSeized.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueEvansSpawn.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueArvisSpawn.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueEnding.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueSigurdHomeCastle.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00A.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00B.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00C.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00D.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00E.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue00F.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue010.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue011.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue012.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueSigurdArvisTalk.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueVillage1.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueVillage2.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueVillage4.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueVillage3.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueVillageSpeedRing.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueQuanDied.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueEthlynDied.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologueFinnDied.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue01C.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue01D.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue01E.asm"
                  .include "EVENTS/ChapterPrologue/EventPrologue01F.asm"
                  .here

               * = $31D3D6
                   .logical $B1D3D6
              .include "EVENTS/Chapter09/EventChapter09Opening.asm"
              .include "EVENTS/Chapter09/EventChapter09AltenaCharge.asm"
              .include "EVENTS/Chapter09/EventChapter09HannibalDefend.asm"
              .include "EVENTS/Chapter09/EventChapter09CoirpreHostage.asm"
              .include "EVENTS/Chapter09/EventChapter09LeifAltenaTalk.asm"
              .include "EVENTS/Chapter09/EventChapter09AltenaRespawn.asm"
              .include "EVENTS/Chapter09/EventChapter09TravantSpawnAltenaDead.asm"
              .include "EVENTS/Chapter09/EventChapter09HannibalCharge.asm"
              .include "EVENTS/Chapter09/EventChapter09SeliphAltenaTalk.asm"
              .include "EVENTS/Chapter09/EventChapter09HannibalNotRecruited.asm"
              .include "EVENTS/Chapter09/EventChapter09LutheciaSeized.asm"
              .include "EVENTS/Chapter09/EventChapter09CoirpreCharlot_HannibalTalk.asm"
              .include "EVENTS/Chapter09/EventChapter09GrutiaSpawn.asm"
              .include "EVENTS/Chapter09/EventChapter09GrutiaSeized.asm"
              .include "EVENTS/Chapter09/EventChapter09ThraciaSpawn.asm"
              .include "EVENTS/Chapter09/EventChapter09ArionCharge.asm"
              .include "EVENTS/Chapter09/EventChapter09ArionDied.asm"
              .include "EVENTS/Chapter09/EventChapter09ThraciaSeized.asm"
              .include "EVENTS/Chapter09/EventChapter09Village1.asm"
              .include "EVENTS/Chapter09/EventChapter09Village2.asm"
              .include "EVENTS/Chapter09/EventChapter09Village3.asm"
              .include "EVENTS/Chapter09/EventChapter09Village4.asm"
              .include "EVENTS/Chapter09/EventChapter09VillageBarrierRing.asm"
              .include "EVENTS/Chapter09/EventChapter09Village5.asm"
              .include "EVENTS/Chapter09/EventChapter09_161.asm"
              .include "EVENTS/Chapter09/EventChapter09CharlotHannibalAdjacent.asm"
              .include "EVENTS/Chapter09/EventChapter09Village4Special.asm"
              .include "EVENTS/Chapter09/EventChapter09HawkLutheciaVisit.asm"
              .include "EVENTS/Chapter09/EventChapter09_168.asm"

              .include "EVENTS/ChapterFinal/EventChapterFinalOpening.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalEddaSeized.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalDozelSpawn.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalDozelSeized.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalFriegeSpawn.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalYngviSpawn.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalFriegeSeized.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalBelhallaSpawn.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalThraciaSpawn.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinal_197.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalSeliphJuliaTalkManfroyDead.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalAltenaArionTalk.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalVelthomerSeized.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalJuliaVelthomerVisit.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalEnding.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalVillage1.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalVillage2.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalSeliphJuliaTalkManfroyAlive.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinalJuliusDied.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinal_1A1.asm"
              .include "EVENTS/ChapterFinal/EventChapterFinal_1A2.asm"
              .here

              * = $328000
                  .logical $B28000

                    .dsection Chapter06EventsSection
                    .dsection Chapter06EventDataSection
                    .here

            * = $3287DC
                .logical $B287DC
                .include "EVENTS/Chapter07/EventChapter07Opening.asm"

              .include "EVENTS/Chapter07/EventChapter07BramselWaiting.asm"
              .include "EVENTS/Chapter07/EventChapter07AedSeized.asm"
              .include "EVENTS/Chapter07/EventChapter07MelgenSpawn.asm"
              .include "EVENTS/Chapter07/EventChapter07AresThreatensBramsel.asm"
              .include "EVENTS/Chapter07/EventChapter07_0FB.asm"
              .include "EVENTS/Chapter07/EventChapter07MelgenSeized.asm"
              .include "EVENTS/Chapter07/EventChapter07UlsterSpawn.asm"
              .include "EVENTS/Chapter07/EventChapter07BloomCharge.asm"
              .include "EVENTS/Chapter07/EventChapter07AresRecruitment.asm"
              .include "EVENTS/Chapter07/EventChapter07BanbaDialogue.asm"
              .include "EVENTS/Chapter07/EventChapter07DahnaSeized.asm"
              .include "EVENTS/Chapter07/EventChapter07_102.asm"
              .include "EVENTS/Chapter07/EventChapter07Ending.asm"
              .include "EVENTS/Chapter07/EventChapter07ArthurAmid_TineLindaTalk.asm"
              .include "EVENTS/Chapter07/EventChapter07AresDahnaVisit.asm"
              .include "EVENTS/Chapter07/EventChapter07TineLinda_Dialogue.asm"
              .include "EVENTS/Chapter07/EventChapter07VillageSpeedRing.asm"
              .include "EVENTS/Chapter07/EventChapter07VillageBarrierBladeAnyone.asm"
              .include "EVENTS/Chapter07/EventChapter07Village1.asm"
              .include "EVENTS/Chapter07/EventChapter07Village2.asm"
              .include "EVENTS/Chapter07/EventChapter07Village3.asm"
              .include "EVENTS/Chapter07/EventChapter07VillageShieldRing.asm"
              .include "EVENTS/Chapter07/EventChapter07_10E.asm"
              .include "EVENTS/Chapter07/EventChapter07BanbaDied.asm"
              .include "EVENTS/Chapter07/EventChapter07FotlaDied.asm"
              .include "EVENTS/Chapter07/EventChapter07EriuDied.asm"
              .include "EVENTS/Chapter07/EventChapter07BloomDied.asm"
              .include "EVENTS/Chapter07/EventChapter07KutuzovFenrirFound.asm"
              .include "EVENTS/Chapter07/EventChapter07LeonsterSeized.asm"
              .include "EVENTS/Chapter07/EventChapter07_117.asm"
              .include "EVENTS/Chapter07/EventChapter07DahnaArmyTalk.asm"
              .include "EVENTS/Chapter07/EventChapter07VillageBarrierBladeLaylea.asm"
              .include "EVENTS/Chapter07/EventChapter07DaisyShannanAdjacent.asm"
              .include "EVENTS/Chapter07/EventChapter07DalvinTristanAdjacent.asm"
                .here
              * = $32f7ce
                   .logical $b2f7ce
                .include "EVENTS/ChapterPrologue/EventPrologueEthlynSigurdTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueAzelleSigurdTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueLexSigurdTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueUnusedAlecEthlynTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueQuanSigurdTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueUnusedMidirAzelleTalk.asm"
                .include "EVENTS/ChapterPrologue/EventPrologueUnusedNaoiseAlecTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01QuanFinnTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01MidirEdainTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01SigurdEdainTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01AzelleEdainTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01EdainEthlynTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01DewEdainTalk.asm"
                .include "EVENTS/Chapter01/EventChapter01AyraQuanTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02DewLachesisTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02DeirdreEthlynTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02QuanFinnTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02SigurdLewynTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02BeowulfLachesisTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02AlecSilviaTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02SilviaSigurdTalk.asm"
                .include "EVENTS/Chapter02/EventChapter02ErinysSigurdTalk.asm"
                .here

            * = $308000
                .logical $B08000

                  .dsection Chapter10EventsSection
                  .dsection Chapter10EventDataSection
                  .here

            * = $31A378
                    .logical $B1A378
                    .dsection ChapterFinalEventsSection
                   .dsection ChapterFinalEventDataSection
                   .here



 .include "ProjectASM/Project.asm"
 .include "ProjectASM/SaveRewriting.asm"
 .include "ProjectASM/Love.asm"
 .include "ProjectASM/DELETING4SAVE.asm"
 .include "ProjectASM/OneChild/OneChildASM.asm"
 .include "ProjectASM/OneChild/NewLove.asm"
 .include "ProjectASM/ParentHair/InheritableHair.asm"

        * = $0C77A1
            .logical $CC77A1
            PortraitScatash        .binary "Graphics/Portrait/PortraitInheritableHair/Scatash.4bpp.fe4"
.here
        * = $0C8000
            .logical $CC8000
            PortraitFebail         .binary "Graphics/Portrait/PortraitInheritableHair/Febail.4bpp.fe4"
            .here

        * = $0D0148
            .logical $CD0148
            PortraitCoirpre         .binary "Graphics/Portrait/PortraitInheritableHair/Coirpre.4bpp.fe4"
            .here

        * = $0D05C8
            .logical $CD05C8
            PortraitCed         .binary "Graphics/Portrait/PortraitInheritableHair/Ced.4bpp.fe4"
            .here

            * = $0D0AA1
            .logical $CD0AA1
            PortraitDiarmuid         .binary "Graphics/Portrait/PortraitInheritableHair/Diarmuid.4bpp.fe4"
            .here

            * = $0D1011
            .logical $CD1011
            PortraitLester         .binary "Graphics/Portrait/PortraitInheritableHair/Lester.4bpp.fe4"
            .here

            * = $0D14C3
            .logical $CD14C3
                        PortraitArthur         .binary "Graphics/Portrait/PortraitInheritableHair/Arthur.4bpp.fe4"
            .here

            * = $0D197C
            .logical $CD197C
                        PortraitPatty         .binary "Graphics/Portrait/PortraitInheritableHair/Patty.4bpp.fe4"
            .here

            * = $0D1EFB
            .logical $CD1EFB
            PortraitLarcei         .binary "Graphics/Portrait/PortraitInheritableHair/Larcei.4bpp.fe4"
            .here

            * = $0D246B
            .logical $CD246B
                        PortraitLana         .binary "Graphics/Portrait/PortraitInheritableHair/Lana.4bpp.fe4"
            .here

            * = $0D2969
            .logical $CD2969
                        PortraitFee         .binary "Graphics/Portrait/PortraitInheritableHair/Fee.4bpp.fe4"

            .here

            * = $0D2E3C
            .logical $CD2E3C
            PortraitTine    .binary "Graphics/Portrait/PortraitInheritableHair/Tine.4bpp.fe4"

            .here

            * = $0D3461
            .logical $CD3461
            PortraitLene         .binary "Graphics/Portrait/PortraitInheritableHair/Lene.4bpp.fe4"
            .here

            * = $0D3A0D
            .logical $CD3A0D
            PortraitNanna         .binary "Graphics/Portrait/PortraitInheritableHair/Nana.4bpp.fe4"
            .here


        * = $0CB020
            .logical $8CB020
             PalletetScatash         .binary "Graphics/Portrait/PortraitInheritableHair/Scatash.pal"
             PalletetFebail         .binary "Graphics/Portrait/PortraitInheritableHair/Febail.pal"
             PalletetCoirpre         .binary "Graphics/Portrait/PortraitInheritableHair/Coirpre.pal"
             PalletetCed         .binary "Graphics/Portrait/PortraitInheritableHair/Ced.pal"
             PalletetDiarmuid         .binary "Graphics/Portrait/PortraitInheritableHair/Diarmuid.pal"
             PalletetLester         .binary "Graphics/Portrait/PortraitInheritableHair/Lester.pal"
             PalletetArthur         .binary "Graphics/Portrait/PortraitInheritableHair/Arthur.pal"
             PalletetPatty         .binary "Graphics/Portrait/PortraitInheritableHair/Patty.pal"
             PalletetLarcei         .binary "Graphics/Portrait/PortraitInheritableHair/Larcei.pal"
             PalletetLana         .binary "Graphics/Portrait/PortraitInheritableHair/Lana.pal"
             PalletetFee         .binary "Graphics/Portrait/PortraitInheritableHair/Fee.pal"
             PalletetTine         .binary "Graphics/Portrait/PortraitInheritableHair/Tine.pal"
             PalletetLene         .binary "Graphics/Portrait/PortraitInheritableHair/Lene.pal"
             PalletetNanna         .binary "Graphics/Portrait/PortraitInheritableHair/Nana.pal"
             .here
* = $05F040
    .logical $C5F040
    PalleteSigurdHair .binary "Graphics/Portrait/ParentHairPallete/Sigurd.pal"
    PalleteNaoiseHair .binary "Graphics/Portrait/ParentHairPallete/Naoise.pal"
    PalleteAlecHair .binary "Graphics/Portrait/ParentHairPallete/Alec.pal"
    PalleteArdenHair .binary "Graphics/Portrait/ParentHairPallete/Arden.pal"
    PalleteFinnHair .binary "Graphics/Portrait/ParentHairPallete/Finn.pal"
    PalleteQuanHair .binary "Graphics/Portrait/ParentHairPallete/Quan.pal"
    PalleteMidirHair .binary "Graphics/Portrait/ParentHairPallete/Midir.pal"
    PalleteLewynHair .binary "Graphics/Portrait/ParentHairPallete/Lewyn.pal"
    PalleteChulainnHair .binary "Graphics/Portrait/ParentHairPallete/Chulainn.pal"
    PalleteAzelleHair .binary "Graphics/Portrait/ParentHairPallete/Azelle.pal"
    PalleteJamkeHair .binary "Graphics/Portrait/ParentHairPallete/Jamke.pal"
    PalleteClaudeHair .binary "Graphics/Portrait/ParentHairPallete/Claude.pal"
    PalleteBeowolfHair .binary "Graphics/Portrait/ParentHairPallete/Beowolf.pal"
    PalleteLexHair .binary "Graphics/Portrait/ParentHairPallete/Lex.pal"
    PalleteDewHair .binary "Graphics/Portrait/ParentHairPallete/Dew.pal"
    PalleteDeidreHair .binary "Graphics/Portrait/ParentHairPallete/Deidre.pal"
    PalleteEthlynHair .binary "Graphics/Portrait/ParentHairPallete/Ethlyn.pal"
    PalleteLachesisHair .binary "Graphics/Portrait/ParentHairPallete/Lachesis.pal"
    PalleteAryaHair .binary "Graphics/Portrait/ParentHairPallete/Arya.pal"
    PalleteErynisHair .binary "Graphics/Portrait/ParentHairPallete/Erynis.pal"
    PalleteTailtiuHair .binary "Graphics/Portrait/ParentHairPallete/Tailtiu.pal"
    PalleteSylviaHair .binary "Graphics/Portrait/ParentHairPallete/Sylvia.pal"
    PalleteEdainHair .binary "Graphics/Portrait/ParentHairPallete/Edain.pal"
    PalleteBrigidHair .binary "Graphics/Portrait/ParentHairPallete/Brigid.pal"
    .here

* = $0ab595
    .logical $8ab595
    .byte $00
    .byte $80
    .byte $CC
    .here