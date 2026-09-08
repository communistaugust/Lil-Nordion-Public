SET startDir=%~dp0

SET as="%startDir%/tools/64tass/64tass"

%as% -f -X -x -o "Game/StraightHair.sfc" --vice-labels -l "labels.txt" "buildfile.asm" 1>"Log/StraightHairlog.txt" 2>&1 -Wno-portable
