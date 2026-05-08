;	Talk events

dialogueCh6Talk_LarceiCreidne_Iucharba1

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Iucharba
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Larcei
	
	.byte LeftSlot		;Iucharba
	.byte StartText
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"!"
	.byte NewLine
.text	"Heh... I guess you finally realized"
	.byte NewLine
.text	"you want to see me, am I right?"
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Look, Iucharba, I know you try to act like"
	.byte NewLine
.text	"you're cool, tough and uncaring,"
	.byte NewLine
.text	"but I know you're not all that bad."
	.byte WaitForA
	.word ScrollBoth
	
.text	"I mean, you've made a point of keeping"
	.byte NewLine
.text	"your hands off the innocent all along."
	.byte WaitForA
	.byte ScrollText
	
.text	"I guesss I'd rather avoid fighting you,"
	.byte NewLine
.text	"if I can..."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Iucharba
.text	"Yeah, I guess... Pushing people around never"
	.byte NewLine
.text	"really sat right with me, y'know?"
	.byte NewLine
.text	"Not like my brothers."
	.byte WaitForA
	.byte ScrollText
	
.text	"And I'm getting real sick of the Loptr Church"
	.byte NewLine
.text	"running the show here."
	.byte WaitForA
	.byte ScrollText
	
.text	"All round Isaach they've been stealing kids"
	.byte NewLine
.text	"and, so I hear, killing 'em all as sacrifices!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Dad doesn't even so much as ask 'em nicely"
	.byte NewLine
.text	"to stop!"
	.byte NewLine
.text	"I've had it with 'em!"
	.byte WaitForA
	.byte ScrollText
	
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	", my men and I want to join your army."
	.byte NewLine
.text	"Just say the word and we're yours, yeah?"
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Wha-"
	.byte NewLine
.text	"...Are you serious?"
	.byte NewLine
.text	"Iucharba, this is..."
	.byte WaitForA
	.word ScrollBoth
	
.text	"Thanks so much!"
	.byte NewLine
.text	"Er, I guess I was wrong to doubt you for"
	.byte NewLine
.text	"all these years. Sorry."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Iucharba
.text	"Look, I'm no saint."
	.byte NewLine
.text	"Way I see it, at least now I can atone for"
	.byte NewLine
.text	"everything I've done."
	.byte WaitForA
	.byte ScrollText
	
.text	"Listen up, men!"
	.byte NewLine
.text	"We're with the liberation army now!"
	.byte NewLine
.text	"We're fightin' in the name of love and justice!"
	.byte WaitForA
	
	.byte EndText


dialogueCh6Talk_LarceiCreidne_Iucharba2
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Iuchar
	.byte StartText
.text	"What manner of nonsense is this?"
	.byte NewLine
.text	"...Alas, for Iucharba has turned his cloak"
	.byte NewLine
.text	"for the rebels!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Oh, how his claim to "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	" pierces my heart!"
	.byte NewLine
.text	"Men, turn your blades on love's foul traitor!"
	.byte WaitForA
	
	.byte EndText


dialogueCh6Talk_LarceiCreidne_Iuchar1

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Iuchar
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Larcei
	
	.byte LeftSlot
	.byte StartText
.text	"Oh, "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"... How the twin hands of"
	.byte NewLine
.text	"love and fate guide us! I've yearned for this day"
	.byte NewLine
.text	"for many, many years, my beloved!"
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Iuchar?! Oh, for the love of..."
	.byte NewLine
.text	"There's a stomach flu playing with your head,"
	.byte NewLine
.text	"isn't there?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Iuchar
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"... Oh, "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"!"
	.byte NewLine
.text	"Your words are as the sweetest birdsong!"
	.byte NewLine
.text	"Your eyes are as the most brilliant stars!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Oh, without you at my side,"
	.byte NewLine
.text	"what purpose is there in life?"
	.byte NewLine
.text	"What joy could possibly be?"
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Stop it! How revolting!"
	.byte NewLine
.text	"This is a battlefield!"
	.byte NewLine
.text	"Are you out of your right mind?!"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Iuchar
.text	"I can deny my heart no longer, "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"."
	.byte NewLine
.text	"Believe me when I say I've tried!"
	.byte NewLine
.text	"Alas, love is a maddening beast at times..."
	.byte WaitForA
	.byte ScrollText
	
.text	"What else can I do but be at your side?"
	.byte NewLine
.text	"Men, we are joining the liberation army!"
	.byte WaitForA
	.byte ScrollText
	
.text	"From this day on, we are men of honor!"
	.byte NewLine
.text	"Fight on, in the name of justice,"
	.byte NewLine
.text	"love, and "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"!"
	.byte WaitForA
	.byte EndText

dialogueCh6Talk_LarceiCreidne_Iuchar2
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Iucharba
	.byte StartText
.text	"You've gotta be kidding!"
	.byte NewLine
.text	"Iuchar beat me to "
	.word PrintBranchingName
	.word name_LarceiCreidne
.text	"?!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Bet he's gone and sided with her army, too,"
	.byte NewLine
.text	"the weak-willed fool..."
	.byte WaitForA
	.byte ScrollText
	
.text	"Hmph... fine by me!"
	.byte NewLine
.text	"Men, attack!"
	.byte NewLine
.text	"Iuchar's unit is now the enemy!"
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_LarceiCreidne_IucharIucharba3

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Danann2
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Schmidt2
	
	.byte LeftSlot
	.byte StartText
.text	"What in the blazes was that?!"
	.byte NewLine
.text	"Just when I thought my son can't get any more"
	.byte NewLine
.text	"useless, he goes and forgets how to fight!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Schmidt!"
	.byte NewLine
.text	"Get out there!"
	.byte NewLine
.text	"Take back my castles, now!"
	
	.byte RightSlot		;Schmidt
	.word PauseText
	.byte $10
.text	"Yes, sir!"
	.byte NewLine
.text	"You can depend on me."
	.byte WaitForA
	
	.byte EndText


dialogueCh6Talk_Sofala_Soldier

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Soldier1

	.byte RightSlot
	.word OpenBox
	.word LoadStoredPortraitA

	.byte LeftSlot
	.byte StartText
.text	"Lord Iucharba has some weird tastes."
	.byte NewLine
.text	"Lusting after such a fierce broad?"
	.byte NewLine
.text	"Really?"
	.byte WaitForA
	.byte ScrollText
	
.text	"Heh... I prefer my women a little more..."
	.byte NewLine
.text	"Wait, why am I telling you this?!"
	
	.byte RightSlot
	.word PauseText
	.byte $10
.text	"..."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Isaach_Soldier
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Soldier1
	.byte StartText
.text	"Ugh... I don't get Lord Iuchar."
	.byte NewLine
.text	"He bends over backwards to please every last"
	.byte NewLine
.text	"bit of skirt, yet here he's so bloody harsh on us!"
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Iuchar
.text	"Is that a morsel of gossip I hear, soldier?"
	
	.byte RightSlot		;Shredder
	.word PauseText
	.byte $10
.text	"N-no, sir!"
	.byte NewLine
.text	"Nothing to report here, sir!"
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Oifey_Seliph

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Old_Oifey
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte LeftSlot
	.byte StartText
.text	"Oh, thank the gods, sire!"
	.byte NewLine
.text	"You're safe!"
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Oifey!"
	.byte NewLine
.text	"Glad to see you made it back."
	.byte NewLine
.text	"What news of the rest of the world?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Oifey
.text	"The Empire's grip is tightening still further,"
	.byte NewLine
.text	"as if trying to choke life from the people."
	.byte NewLine
.text	"It's inciting doomed revolts all across Jugdral."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"So it's as I thought..."
	.byte NewLine
.text	"It isn't as if the Empire's tyranny"
	.byte NewLine
.text	"would ever be limited to only Isaach..."
	.byte WaitForA
	.word ScrollBoth
	
.text	"Oifey, is it feasible to assist them?"
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Oifey
.text	"Not as we presently stand, sire."
	.byte NewLine
.text	"We still lack the strength"
	.byte NewLine
.text	"to properly challenge the Empire."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Then what of our present battle?"
	.byte NewLine
.text	"The war for Isaach's freedom has already"
	.byte NewLine
.text	"begun. Turning back now would be impossible..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Oifey
.text	"Mm. There's certainly no chance of returning you"
	.byte NewLine
.text	"to hiding, sire, now that your whereabouts"
	.byte NewLine
.text	"have been leaked."
	.byte WaitForA
	.byte ScrollText
	
.text	"Starting the fight now was reckless,"
	.byte NewLine
.text	"but we've no choice but to continue..."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Oifey, I'm sorry I let all of this happen"
	.byte NewLine
.text	"behind your back, but we had no choice."
	.byte WaitForA
	.word ScrollBoth
	
.text	"Even so, I don't think I could have stood letting"
	.byte NewLine
.text	"Isaach suffer under Danann's thumb any longer."
	.byte NewLine
.text	"I trust you understand, Oifey..."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Oifey
.text	"I do, sire."
	.byte NewLine
.text	"Now, our priority is to lay siege to"
	.byte NewLine
.text	"Danann's capital, Ribaut, with all due haste."
	.byte WaitForA
	.byte ScrollText
	
.text	"Danann must fall before the Empire can"
	.byte NewLine
.text	"send him reinforcements."
	.byte NewLine
.text	"We cannot afford to wait!"
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Fee_Seliph

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Fee
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte LeftSlot
	.byte StartText
.text	"Hey there!"
	.byte NewLine
.text	"You're Lord Seliph, right?"
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Indeed I am."
	.byte NewLine
.text	"And you, miss?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Fee
.text	"Call me "
	.word PrintBranchingName
	.word name_FeeHermina
.text	"!"
	.byte NewLine
.text	"I'm from Silesse."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Silesse, you say?"
	.byte NewLine
.text	"Are you a pegasus knight, then?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Fee
.text	"Er, not just yet."
	.byte NewLine
.text	"I'm kinda still in training."
	.byte NewLine
.text	"My mom was one, though!"
	.byte WaitForA
	.byte ScrollText
	
.text	"Actually, in that big war years ago,"
	.byte NewLine
.text	"she helped Lord Sigurd out in his army."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Is that so? She has my utmost gratitude,"
	.byte NewLine
.text	"on my father's behalf."
	.byte NewLine
.text	"Now, what brings you here, "
	.word PrintBranchingName
	.word name_FeeHermina
.text	"?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Fee
.text	"See, what happened was I was looking"
	.byte NewLine
.text	"for my brother, who ran away ages ago."
	.byte WaitForA
	.byte ScrollText
	
.text	"But then I heard about you, sir,"
	.byte NewLine
.text	"and how you're taking on the Empire yourself!"
	.byte NewLine
.text	"And I just knew I had to be here too."
	.byte WaitForA
	.byte ScrollText
	
.text	"Can I join your army, sir?"
	.byte NewLine
.text	"Please?"
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Certainly!"
	.byte NewLine
.text	"Thank you."
	.byte NewLine
.text	"What of your brother, though?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Fee
.text	"It's silly, sir, but I have this feeling that"
	.byte NewLine
.text	"we're gonna run into him somewhere"
	.byte NewLine
.text	"down the line..."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Hermina_Seliph

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Hermina
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph

	.byte LeftSlot
	.byte StartText
.text	"Hey there!"
	.byte NewLine
.text	"You're Lord Seliph, right?"
	
	.byte RightSlot
	.word PauseText
	.byte $10
.text	"Indeed I am."
	.byte NewLine
.text	"And you, miss?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot
.text	"Call me Hermina!"
	.byte NewLine
.text	"I'm from Silesse."
	
	.byte RightSlot
	.word PauseText
	.byte $10
.text	"Silesse, you say?"
	.byte NewLine
.text	"Are you a pegasus knight, then?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot
.text	"Yeah!"
	.byte NewLine
.text	"Er, actually, I'm just a rookie though."
	
	.byte RightSlot
	.word PauseText
	.byte $10
.text	"Is that so..."
	.byte NewLine
.text	"So, what brings you to Isaach?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot
.text	"See, what happened was I was looking"
	.byte NewLine
.text	"for my brother, who ran away ages ago."
	.byte WaitForA
	.byte ScrollText
	
.text	"But then I heard about you, sir,"
	.byte NewLine
.text	"and how you're taking on the empire yourself!"
	.byte NewLine
.text	"And I just knew I had to be here too."
	.byte WaitForA
	.byte ScrollText
	
.text	"Can I join your army, sir?"
	.byte NewLine
.text	"Please?"
	
	.byte RightSlot
	.word PauseText
	.byte $10
.text	"Certainly!"
	.byte NewLine
.text	"Thank you."
	.byte NewLine
.text	"What of your brother, though?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot
.text	"It's silly, sir, but I kinda have this weird feeling"
	.byte NewLine
.text	"that we're gonna run into him somewhere"
	.byte NewLine
.text	"down the line..."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_ArthurAmid_Seliph

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Arthur
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte LeftSlot
	.byte StartText
.text	"Lord Seliph, right?"
	.byte NewLine
.text	"Nice to meet you."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Who are you?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot
.text	"The name's "
	.word PrintBranchingName
	.word name_ArthurAmid
.text	"."
	.byte NewLine
.text	"I came here from Silesse."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"Wait, so you are that "
	.word PrintBranchingName
	.word name_ArthurAmid
.text	" fellow?"
	.byte NewLine
.text	"I've heard of how you have been aiding us so far."
	.byte NewLine
.text	"Thank you so much!"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Arthur
.text	"Eh, it was no big deal."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"You are capable of wielding magic, yes?"
	.byte NewLine
.text	"That's truly impressive."
	.byte NewLine
.text	"I'm almost envious!"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Arthur
.text	"My mother was a talented war-mage..."
	.byte NewLine
.text	"But I've still got a lot to learn myself."
	
	.byte RightSlot		;Seliph
	.word PauseText
	.byte $10
.text	"We all do, do we not?"
	.byte WaitForA
	.word ScrollBoth
	
.text	"So long as we all fight together, though,"
	.byte NewLine
.text	"perhaps we still truly can change our world."
	.byte NewLine
.text	"After all, that's what brought us here today."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Arthur
.text	"Yeah, you're right... My power's at your disposal,"
	.byte NewLine
.text	"sir. I'll give my all to aid the cause."
	.byte NewLine
.text	"I'm glad we could finally meet, Lord Seliph."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Seliph_LanaMuirne

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Lana
	
	.byte LeftSlot
	.byte StartText
	.word PrintBranchingName
	.word name_LanaMuirne
.text	", I still can't say I feel"
	.byte NewLine
.text	"comfortable having you out here in"
	.byte NewLine
.text	"the field. It's much too dangerous."
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"Y-yes, milord, but I'm sure I'll be fine."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"Please, take the utmost care!"
	.byte NewLine
.text	"If you stray from behind the front lines,"
	.byte NewLine
.text	"you'll be too vulnerable a target."
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"But-"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
	.word PrintBranchingName
	.word name_LanaMuirne
.text	", please..."
	.byte NewLine
.text	"I'm worried for your sake."
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"...Okay, milord."
	.byte WaitForA
	
	.byte EndText


dialogueCh6Talk_Seliph_Julia_Sofala

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Julia
	
	.byte LeftSlot
	.byte StartText
.text	"Are you faring alright so far, Julia?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Mm."
	.byte NewLine
.text	"Thank you, Lord Seliph..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"Actually, I have something for you."
	.byte NewLine
.text	"I found this in Sofala Castle."
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"What is...?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"It's a light tome called Aura."
	.byte NewLine
.text	"You can wield these, yes?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Aura..."
	.byte NewLine
.text	"This... Why does this sound familiar..."
	.byte WaitForA
	.word ScrollBoth
	
.text	"Thank you, Lord Seliph."
	.byte NewLine
.text	"Thank you so much..."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Seliph_Julia_Isaach

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Seliph
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Julia
	.byte LeftSlot
	.byte StartText
.text	"Are you faring alright so far, Julia?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Mm."
	.byte NewLine
.text	"Thank you, Lord Seliph..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"Actually, I have something for you."
	.byte NewLine
.text	"I found this in Isaach Castle."
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"What is...?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"It's a light tome called Nosferatu."
	.byte NewLine
.text	"You can wield these, yes?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Yes..."
	.byte NewLine
.text	"I'm able to use light magic."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Seliph
.text	"Excellent!"
	.byte NewLine
.text	"Hopefully you'll now have an easier time"
	.byte NewLine
.text	"protecting yourself in combat."
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Thank you, Lord Seliph."
	.byte NewLine
.text	"Thank you so much..."
	.byte WaitForA
	
	.byte EndText


dialogueCh6Talk_LanaMuirne_Julia

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
.text	"Julia, right?"
	.byte NewLine
.text	"Hello there!"
	.byte NewLine
.text	"Are you doing okay without Lewyn?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"You're "
	.word PrintBranchingName
	.word name_LanaMuirne
.text	"..."
	.byte NewLine
.text	"Yes, thank you."
	.byte NewLine
.text	"I'm fine..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Lana
.text	"You know, Lord Seliph's actually really been"
	.byte NewLine
.text	"worrying about you."
	.byte WaitForA
	.byte ScrollText
	
.text	"If there's anything I can do to help you,"
	.byte NewLine
.text	"just let me know and I'll get right on it."
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"Mm."
	.byte NewLine
.text	"Thank you..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Lana
	.byte StartText
.text	"Oh, and I've got a little something for you."
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"This is..."
	.byte NewLine
.text	"A Mend staff?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Lana
.text	"You can use these, right?"
	
	.byte RightSlot		;Julia
	.word PauseText
	.byte $10
.text	"For me?"
	.byte NewLine
.text	"Thank you, "
	.word PrintBranchingName
	.word name_LanaMuirne
.text	"."
	.byte WaitForA
	.word ScrollBoth
	
.text	"With this..."
	.byte NewLine
.text	"I know I can help everyone."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Lana
.text	"You're welcome, Julia."
	.byte NewLine
.text	"Let's give this war our all, together!"
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Lester_Lana

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Lester
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Lana
	
	.byte LeftSlot
	.byte StartText
.text	"Lana?!"
	.byte NewLine
.text	"Don't tell me you're fighting, too!"
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"I am, Lester."
	.byte NewLine
.text	"I simply couldn't bear to leave Lord Seliph"
	.byte NewLine
.text	"to fight alone..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Lester
.text	"Why am I not surprised..."
	.byte WaitForA
	.byte ScrollText
	
.text	"Look, I know I can't get you to leave,"
	.byte NewLine
.text	"but just be careful, okay?"
	.byte WaitForA
	.byte ScrollText
	
.text	"It'd break Mother's heart if"
	.byte NewLine
.text	"something happened to you out here."
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"I know, but actually, there was something"
	.byte NewLine
.text	"Mother told me..."
	.byte WaitForA
	.word ScrollBoth
	
.text	"She told me that we owe"
	.byte NewLine
.text	"the greatest of debts to the people of Isaach,"
	.byte NewLine
.text	"and that if we can help them in any way,"
	.byte WaitForA
	.byte NewLine
.text	"we owe it to them to do all we can."
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Lester
.text	"Yeah, I guess she's right."
	.byte NewLine
.text	"I mean, we wouldn't even be here now"
	.byte NewLine
.text	"if not for the help of the locals..."
	.byte WaitForA
	.byte ScrollText
	
.text	"...So, er, where is Mother, anyway?"
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"She's back in Tirnanog's abbey,"
	.byte NewLine
.text	"working like always."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Lester
.text	"Right... Listen, Lana."
	.byte WaitForA
	.byte ScrollText
	
.text	"We've got to give this battle our all,"
	.byte NewLine
.text	"both in Mother's name and in the name"
	.byte NewLine
.text	"of our lost father..."
	.byte WaitForA
	.byte ScrollText
	
.text	"Someday, I know, we'll finally be able"
	.byte NewLine
.text	"to help Mother return to her home, Yngvi..."
	
	.byte RightSlot		;Lana
	.word PauseText
	.byte $10
.text	"You're right, Lester."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Deimne_Muirne

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Deimne
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Muirne
	
	.byte LeftSlot
	.byte StartText
.text	"Muirne?!"
	.byte NewLine
.text	"Don't tell me you're fighting, too!"
	
	.byte RightSlot		;Muirne
	.word PauseText
	.byte $10
.text	"I am, Deimne."
	.byte NewLine
.text	"I simply couldn't bear to leave Lord Seliph"
	.byte NewLine
.text	"to fight alone..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Deimne
.text	"Heh..."
	.byte NewLine
.text	"Why am I not surprised..."
	
	.byte RightSlot		;Muirne
	.word PauseText
	.byte $10
.text	"W-what do you mean?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Deimne
.text	"Oh, nothing..."
	.byte NewLine
.text	"Just, er, don't get too invested in him."
	.byte WaitForA
	.byte ScrollText
	
.text	"You know Lord Seliph's a Grannvale prince,"
	.byte NewLine
.text	"right?"
	.byte NewLine
.text	"He's as lofty a noble as they come."
	.byte WaitForA
	.byte ScrollText
	
.text	"Let's face it, peasants like us'd ordinarily"
	.byte NewLine
.text	"have no business being anywhere near him."
	.byte NewLine
.text	"I just don't want to see you get hurt..."
	
	.byte RightSlot		;Muirne
	.word PauseText
	.byte $10
.text	"You..."
	.byte NewLine
.text	"You've got the wrong idea, Deimne!"
	.byte WaitForA
	.word ScrollBoth
	
.text	"All I want is to protect Lord Seliph"
	.byte NewLine
.text	"and make sure he survives this war, okay?"
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Deimne
.text	"Oh, er, that's fine then."
	.byte NewLine
.text	"Sorry, Muirne."
	.byte NewLine
.text	"I'm just really concerned for you..."
	
	.byte RightSlot		;Muirne
	.word PauseText
	.byte $10
.text	"Yes, I know..."
	.byte NewLine
.text	"Thank you, Deimne."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Scathach_Larcei

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Scathach
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Larcei
	
	.byte LeftSlot
	.byte StartText
.text	"You holding up okay so far, Larcei?"
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Yeah, I'm getting by fine..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Scathach
.text	"Just be careful out here, okay?"
	.byte NewLine
.text	"Your usual brazen antics'll only"
	.byte NewLine
.text	"get you in trouble now."
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"I know, I know, I know!"
	.byte NewLine
.text	"What, do you think I'm still a child?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Scathach
.text	"Heh... Man, that iron will of yours!"
	.byte NewLine
.text	"Guess you're just like Mom was,"
	.byte NewLine
.text	"if what Prince Shannan's told us is true."
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Yeah... Ayra..."
	.byte NewLine
.text	"I can't remember a thing about her."
	.byte NewLine
.text	"You?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Scathach
.text	"No, of course not."
	.byte WaitForA
	.byte ScrollText
	
.text	"We're twins, remember? If you were"
	.byte NewLine
.text	"too young to remember, then so was I!"
	.byte NewLine
.text	"We weren't even two years old yet back then..."
	.byte WaitForA
	.byte ScrollText
	
.text	"It was Oifey who took us with him"
	.byte NewLine
.text	"when he fled to Isaach with Seliph."
	.byte NewLine
.text	"We waited and waited, but Mom never followed..."
	.byte WaitForA
	.byte ScrollText
	
.text	"I guess she didn't make it out of"
	.byte NewLine
.text	"the Battle of Belhalla alive..."
	
	.byte RightSlot		;Larcei
	.word PauseText
	.byte $10
.text	"Scáthach! You swore you'd never say"
	.byte NewLine
.text	"awful things like that!"
	.byte NewLine
.text	"Mom is alive! ALIVE! I'm sure of it!"
	.byte WaitForA
	.word ScrollBoth
	
.text	"Don't you dare say otherwise ever again!"
	.byte WaitForA
	.byte ScrollText
	
	.byte LeftSlot		;Scathach
.text	"...Er, sorry, Larcei..."
	.byte NewLine
.text	"You're right... I'm sorry."
	.byte WaitForA

	.byte EndText


dialogueCh6Talk_Dalvin_Creidne

	.byte LeftSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Dalvin
	
	.byte RightSlot
	.word OpenBox
	.word LoadPortrait
	.word portrait_Creidne
	
	.byte LeftSlot
	.byte StartText
.text	"You holding up okay so far, Creidne?"
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"Yeah, I'm getting by fine..."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Dalvin
.text	"Just be careful out here, okay?"
	.byte NewLine
.text	"Your usual brazen antics'll"
	.byte NewLine
.text	"only get you in trouble now."
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"I know, I know, I know!"
	.byte NewLine
.text	"What, do you think I'm still a child?"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Dalvin
.text	"So, er..."
	.byte NewLine
.text	"How about Iuchar and Iucharba, huh?"
	.byte NewLine
.text	"I just don't get either of 'em."
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"Ugh...Them! They're driving me mad!"
	.byte NewLine
.text	"Creeps like them are why men are the"
	.byte NewLine
.text	"absolute worst! They make me feel sick!"
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Dalvin
.text	"Hey, easy there! Not all men are like that."
	.byte NewLine
.text	"You've let the imperial soldiers' treatment"
	.byte NewLine
.text	"of you make you hate all men for no reason."
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"Wow, you don't say! I know it's irrational,"
	.byte NewLine
.text	"but for crying out loud, just being near"
	.byte NewLine
.text	"a man's enough to turn my stomach now."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Dalvin
.text	"Every man?"
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"Er, I guess you and Lord Seliph are okay."
	.byte WaitForA
	.word ScrollBoth

	.byte LeftSlot		;Dalvin
.text	"Heh heh... what about Shannan, then?"
	
	.byte RightSlot		;Creidne
	.word PauseText
	.byte $10
.text	"Ugh, Dalvin!"
	.byte WaitForA
	
	.byte EndText