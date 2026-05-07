SET startDir=%~dp0

SET as="%startDir%/tools/64tass/64tass"

%as% -f -X -x -o "FE4GayNoEvent.sfc" --vice-labels -l "labels_no_event.txt" "buildfile_no_event.asm" 1>"log_no_event.txt" 2>&1 -Wno-portable

pause