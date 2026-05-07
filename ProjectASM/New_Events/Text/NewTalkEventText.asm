dialogueChapter07Shannan_OifeyTalk

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Old_Oifey

	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Shannan

	.byte LeftSlot
	.byte StartText
.text	"This is a test"
	.byte NewLine
.text	"More test"

	.byte RightSlot		;Shannan
	.word PauseText
	.byte $10
.text	"Even more test"
	.byte WaitForA
	.word ScrollBoth

.text	"We should be married now !"
        .byte WaitForA
	.byte EndText


dialogueChapterFinalSelif_AresTalk

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph

	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Ares1

	.byte LeftSlot
	.byte StartText
.text	"Placeholder text"
	.byte NewLine
.text	"More test"

	.byte RightSlot		;Shannan
	.word PauseText
	.byte $10
.text	"Trans right are human right"
	.byte WaitForA

	.byte EndText

dialogueChapterFinalLeneLaylea_AresTalk

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Lene

	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Ares1

	.byte LeftSlot
	.byte StartText
.text	"Placeholder text"
	.byte NewLine
.text	"More test"

	.byte RightSlot		;Shannan
	.word PauseText
	.byte $10
.text	"Can you belive we have no conversation"
.byte NewLine
.text "in the base game ?"
	.byte WaitForA
	.byte EndText


dialogueChapterFinalLana_JuliaTalk

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Lana

	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Julia

	.byte LeftSlot
	.byte StartText
.text	"Placeholder text"
	.byte NewLine
.text	"More test"

	.byte RightSlot		;Shannan
	.word PauseText
	.byte $10
.text	"Trans right are human right"
	.byte WaitForA

	.byte EndText