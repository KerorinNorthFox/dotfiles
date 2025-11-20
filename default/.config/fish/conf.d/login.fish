function fish_greeting
    echo ""
    echo "Hello "$USER"! Welcome to "(set_color cyan)"Fish Shell"(set_color normal)"! "
    echo "Version: "$version
    echo ""
    echo (set_color magenta)"Command List"(set_color normal)":"
    printf "  %sGeneral%s:
    - z     : Move dir you often use.
" (set_color magenta) (set_color normal)
    printf "  %sI/O%s:
    - less  : scrollable cat.
    - wc -l : Display line count of file.
    - df -h : Display the disk size.
    - du -h : Display the dir size.
    - btm   : Display resource viewer.
" (set_color magenta) (set_color normal)
    printf "  %sPackage%s:
    - apt list -i : Display installed package.
    - apt list -u : Display upgradable package.
    - dpkg -l     : Display packages.
    - fisher      : Fish plugins manager.
" (set_color magenta) (set_color normal)
    printf "  %sFish KeyBindings%s:
    - Ct+ Arrow       : Forward(Backward) word. 
    - Ct+Sh+ Arrow    : Forward(Backward) Big word.
    - Ct+ a           : Jump to beginning of line.
    - Ct+ e           : Jump to end of line.
    - Ct+ l           : Clear.
    - Ct+ c           : Clear commandline.
    - Alt+ v, Alt+ e  : Edit commandline buffer.
    - Ct+ o           : fzf find.
" (set_color magenta) (set_color normal)

end
