.include "Encodings.asm"
.include "ControlCodes.asm"
.include "_DialoguePointersInstaller.asm"
.include "PortraitDefinitions.asm"

.include "Others/Castle_Shops.asm"
.include "Others/Chapter_Names.asm"
.include "Others/Character_Names.asm"
.include "Others/Class_Names.asm"
.include "Others/Item_Names.asm"
.include "Others/Location_Names.asm"
.include "Others/TitleScreenMenu.asm"

; Positions dialogue chunks in expanded areas of the rom
; Adjust addresses if necessary to optimize your free space

;55/0A60-55/6010	Prologue		55/5990 OK (empty) Kinda tight
;55/6020-55/E800	Chapter 1		55/D5B0 OK (PN leftovers)
;5C/0000-5C/2000    Chapter 2		5C/9120	OK (empty)
;61/0150-61/9B10    Chapter 3		61/7420 OK (PN leftovers)
;5F/0000-5F/7EF0    Chapter 4		5F/AC10	OK (empty)
;61/9B60-62/5300    Chapter 5		61/FD80 OK (PN leftovers) TIGHT	 62/5070 OK (leftovers)		55/FB80 (empty) TIGHT
;60/0000-60/C990    Chapter 6		60/8F60 OK (PN leftovers)
;62/53A0-62/EB90    Chapter 7		62/E6B0 Tight-ish, moved Battles file to next batch
;63/0000-63/9D50    Chapter 8		63/87B0 OK (PN leftovers)
;63/9DA0-63/FF00-   Chapter 9		63/EE10 OK (PN leftovers), split up into two batches
;64/0000-64/1990    Chapter 9		see 64/19A0
;64/19A0-64/B070    Chapter 9(+10)	64/55C0	OK (PN leftovers)
;65/8600-65/FF60    Chapter 10		65/F8C0 OK (PN leftovers)
;66/0D00-66/A190    Chapter Final	66/5440	OK (PN leftovers)
;66/A1A0-66/FFFF    Chapter Final	66/EC20 OK (PN leftovers???) 
;67/0000-67/FFFF    Epilogues 		67/EE30 OK (empty)
;69/0000-69/FFFF    Epilogues 		69/8670 OK (empty)
;54/BF00-54/E220    Death Qs		54/E620	OK (empty)


* = $550A60
.logical $550A60
.include "0-Prologue/Chapter0_Battles.asm"
.include "0-Prologue/Chapter0_Events.asm"
.include "0-Prologue/Chapter0_Others.asm"
.include "0-Prologue/Chapter0_Talks.asm"
.include "0-Prologue/Chapter0_Villages.asm"
.include "0-Prologue/Chapter0_WorldMap.asm"
.here

* = $556020
.logical $556020
.include "1-Chapter 1/Chapter1_Battles.asm"
.include "1-Chapter 1/Chapter1_Events.asm"
.include "1-Chapter 1/Chapter1_Others.asm"
.include "1-Chapter 1/Chapter1_Talks.asm"
.include "1-Chapter 1/Chapter1_Villages.asm"
.include "1-Chapter 1/Chapter1_WorldMap.asm"
.here

* = $5C0000
.logical $5C0000
.include "2-Chapter 2/Chapter2_Battles.asm"
.include "2-Chapter 2/Chapter2_Events.asm"
.include "2-Chapter 2/Chapter2_Others.asm"
.include "2-Chapter 2/Chapter2_Talks.asm"
.include "2-Chapter 2/Chapter2_Villages.asm"
.include "2-Chapter 2/Chapter2_WorldMap.asm"
.here

* = $610150
.logical $610150
.include "3-Chapter 3/Chapter3_Battles.asm"
.include "3-Chapter 3/Chapter3_Events.asm"
.include "3-Chapter 3/Chapter3_Others.asm"
.include "3-Chapter 3/Chapter3_Talks.asm"
.include "3-Chapter 3/Chapter3_Villages.asm"
.include "3-Chapter 3/Chapter3_WorldMap.asm"
.here

* = $5F0000
.logical $5F0000
.include "4-Chapter 4/Chapter4_Battles.asm"
.include "4-Chapter 4/Chapter4_Events.asm"
.include "4-Chapter 4/Chapter4_Others.asm"
.include "4-Chapter 4/Chapter4_Talks.asm"
.include "4-Chapter 4/Chapter4_Villages.asm"
.include "4-Chapter 4/Chapter4_WorldMap.asm"
.here

* = $619B60
.logical $619B60
.include "5-Chapter 5/Chapter5_Battles.asm"
.include "5-Chapter 5/Chapter5_Events.asm"
.include "5-Chapter 5/Chapter5_Intermission.asm"
.here

* = $620000
.logical $620000
.include "5-Chapter 5/Chapter5_Others.asm"
.include "5-Chapter 5/Chapter5_Talks.asm"
.here

* = $55F000			; New Range		~400 bytes left
.logical $55F000
.include "5-Chapter 5/Chapter5_Villages.asm"
.include "5-Chapter 5/Chapter5_WorldMap.asm"
.here

* = $600000
.logical $600000
.include "6-Chapter 6/Chapter6_Battles.asm"
.include "6-Chapter 6/Chapter6_Events.asm"
.include "6-Chapter 6/Chapter6_Others.asm"
.include "6-Chapter 6/Chapter6_Talks.asm"
.include "6-Chapter 6/Chapter6_Villages.asm"
.include "6-Chapter 6/Chapter6_WorldMap.asm"
.here

* = $6253A0
.logical $6253A0
.include "7-Chapter 7/Chapter7_Events.asm"
.include "7-Chapter 7/Chapter7_Others.asm"
.include "7-Chapter 7/Chapter7_Talks.asm"
.include "7-Chapter 7/Chapter7_Villages.asm"
.include "7-Chapter 7/Chapter7_WorldMap.asm"
.include "../ProjectASM/New_Events/Text/NewTalkEventText.asm"
.here

* = $630000
.logical $630000
.include "7-Chapter 7/Chapter7_Battles.asm"
.include "8-Chapter 8/Chapter8_Battles.asm"
.include "8-Chapter 8/Chapter8_Events.asm"
.include "8-Chapter 8/Chapter8_Others.asm"
.include "8-Chapter 8/Chapter8_Talks.asm"
.include "8-Chapter 8/Chapter8_Villages.asm"
.include "8-Chapter 8/Chapter8_WorldMap.asm"
.here

* = $63A000
.logical $63A000
.include "9-Chapter 9/Chapter9_Battles.asm"
.include "9-Chapter 9/Chapter9_Events.asm"
.include "9-Chapter 9/Chapter9_Others.asm"
.include "9-Chapter 9/Chapter9_WorldMap.asm"
.here

* = $640000
.logical $640000
.include "9-Chapter 9/Chapter9_Talks.asm"
.include "9-Chapter 9/Chapter9_Villages.asm"
.include "10-Chapter 10/Chapter10_Battles.asm"
.include "10-Chapter 10/Chapter10_Villages.asm"
.include "10-Chapter 10/Chapter10_WorldMap.asm"
.here

* = $658600
.logical $658600
.include "10-Chapter 10/Chapter10_Events.asm"
.include "10-Chapter 10/Chapter10_Talks.asm"
.include "10-Chapter 10/Chapter10_Others.asm"
.here

* = $660D00
.logical $660D00
.include "11-Final Chapter/ChapterFinal_Battles.asm"
.include "11-Final Chapter/ChapterFinal_Events.asm"
.include "11-Final Chapter/ChapterFinal_Others.asm"
.here

* = $66A1A0
.logical $66A1A0
.include "11-Final Chapter/ChapterFinal_Villages.asm"
.include "11-Final Chapter/ChapterFinal_WorldMap.asm" 
.include "11-Final Chapter/ChapterFinal_Talks.asm"
.here

* = $670010
.logical $670010
.include "Epilogues/Epilogues_01_Belhalla.asm"
.include "Epilogues/Epilogues_02_Isaach.asm"
.include "Epilogues/Epilogues_03_NewThracia.asm"
.include "Epilogues/Epilogues_04_Agustria.asm"
.include "Epilogues/Epilogues_05_Verdane.asm"
.include "Epilogues/Epilogues_06_Yngvi.asm"
.here


* = $690000
.logical $690000
.include "Epilogues/Epilogues_07_Friege.asm"
.include "Epilogues/Epilogues_08_Dozel.asm"
.include "Epilogues/Epilogues_09_Edda.asm"
.include "Epilogues/Epilogues_10_Velthomer.asm"
.include "Epilogues/Epilogues_11_Chalphy.asm"
.include "Epilogues/Epilogues_12_Silesse.asm"
.include "Epilogues/Epilogues_13_Conclusion.asm"
.include "Epilogues/Epilogues_14_WorldMap.asm"
.include "Epilogues/Epilogues_15_End.asm"
.include "Others/Lover_Quotes.asm"
.include "Others/Attract_Mode.asm"
.here


* = $54BF00
.logical $54BF00
.include "Others/Death_Quotes.asm"
.here

;	When moving text around, feel free to include this file at the end to see where your insertion ends.
;	Yes, there are more elegant ways of doing this than having a bunch of AA bytes in a row, but this method is funny.

;	.include "Scream.asm"