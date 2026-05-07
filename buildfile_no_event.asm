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
.include "ProjectASM/WRAMlover.inc"
.include "ProjectASM/LoveStruct.h"
 .include "ProjectASM/base_game_def.asm"
  ROM = binary("FE4.sfc")

.include "MenuText/_MenuTextInstaller.asm"
.include "MenuText/Tilemaps/_MenuTilemapsInstaller.asm"
.include "Graphics/_GraphicsInstaller.asm"
.include "Dialogue/_DialogueTextInstaller.asm"
.include "Fixes/_FixesInstaller.asm"

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
      aChildrenDataOffsets .binclude "Tables/ChildrenDataOffsets.csv.asm"                          ; 83/8993
      aChildrenData .binclude "Tables/ChildrenData.csv.asm"                                        ; 83/89A5
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

 .include "ProjectASM/Project.asm"
 .include "ProjectASM/SaveRewriting.asm"
 .include "ProjectASM/Love.asm"
 .include "ProjectASM/DELETING4SAVE.asm"