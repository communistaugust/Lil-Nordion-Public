  .virtual     $7FF000
  LoverHeterosexualPoint .fill (9*15) * size(word);
  MLMLovePoint   .fill (15*8) * size(word);
  WLWLovePoint .fill (9*5) * size(word) ;

structSiblings .struct
    FirstSiblings               .word ? ; $00
    SecondSiblings          .word ? ; $02
  .endstruct

aSiblingCritEntryPointers

        .addr aSiblingCritEntry1
        .addr aSiblingCritEntry2
        .addr aSiblingCritEntry3
        .addr aSiblingCritEntry4
        .addr aSiblingCritEntry5
        .addr aSiblingCritEntry6
        .addr aSiblingCritEntry7
        .addr aSiblingCritEntry8
        .addr aSiblingCritEntry9
        .addr aSiblingCritEntry10
        .addr aSiblingCritEntry11
        .addr aSiblingCritEntry12
        .addr aSiblingCritEntry13
        .addr aSiblingCritEntry14
        .addr aSiblingCritEntry15
        .addr aSiblingCritEntry16
        .addr aSiblingCritEntry17

aSiblingCritEntry1 .structSiblings ;
aSiblingCritEntry2 .structSiblings ;
aSiblingCritEntry3 .structSiblings ;
aSiblingCritEntry4 .structSiblings ;
aSiblingCritEntry5 .structSiblings ;
aSiblingCritEntry6 .structSiblings ;
aSiblingCritEntry7 .structSiblings ;
aSiblingCritEntry8 .structSiblings ;
aSiblingCritEntry9 .structSiblings ;
aSiblingCritEntry10 .structSiblings ;
aSiblingCritEntry11 .structSiblings ;
aSiblingCritEntry12 .structSiblings ;
aSiblingCritEntry13 .structSiblings ;
aSiblingCritEntry14 .structSiblings ;
aSiblingCritEntry15 .structSiblings ;
aSiblingCritEntry16 .structSiblings ;
aSiblingCritEntry17 .structSiblings ;
.endvirtual