SET startDir=%~dp0

SET as="%startDir%/tools/64tass/64tass"

%as% -f -X -x -o "Game/GAYFE4.sfc" --vice-labels -l "labels.txt" "buildfile.asm" 1>"Log/log.txt" 2>&1 -Wno-portable

%as% -f -X -x -o "Game/GAYFE4+Hair.sfc" --vice-labels -l "labels.txt" "buildfileHair.asm" 1>"Log/GayHairlog.txt" 2>&1 -Wno-portable