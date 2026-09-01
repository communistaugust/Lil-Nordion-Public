SET startDir=%~dp0

SET as="%startDir%/tools/64tass/64tass"

%as% -f -X -x -o "Gay_FE4+OneChildren.sfc" --vice-labels -l "labels.txt" "buildfileOneChildren.asm" 1>"Gay_FE4+OneChildrenlog.txt" 2>&1 -Wno-portable

%as% -f -X -x -o "Gay_FE4+OneChildren+InheritableHair.sfc" --vice-labels -l "labels.txt" "buildfileOneChildrenHair.asm" 1>"log.txt" 2>&1 -Wno-portable