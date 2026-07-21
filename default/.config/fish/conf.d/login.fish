function _colored_print -a color text
    echo (set_color $color)"$text"(set_color normal)
end

function _print_help_if_exist -a command help
    if type -q $command
        echo "    $help"
    end
end

function fish_greeting
    ### When Zellij is not in use.
    if not test $ZELLIJ
        if type -q fastfetch
            fastfetch
        end
    end

    echo ""
    echo "Hello "$USER"! Welcome to "(set_color cyan)"Fish Shell"(set_color normal)"! "
    echo "Version: "$version
    echo ""

    _colored_print magenta "Command List:"
    _colored_print magenta "General:"
    _print_help_if_exist z "- z     : Move dir you often use."
    _print_help_if_exist y "- y     : Open yazi file manager and cd when quits."

    _colored_print magenta "I/O:"
    _print_help_if_exist bat "- bat   : cat with syntax highlight."
    _print_help_if_exist wc "- wc -l : Display line count of file."
    _print_help_if_exist df "- df -h : Display the disk size."
    _print_help_if_exist du "- du -h : Display the dir size."

    _colored_print magenta "Packages:"
    _print_help_if_exist apt "- apt list -i : Display installed package."
    _print_help_if_exist apt "- apt list -u : Display upgradable package."
    _print_help_if_exist dpkg "- dpkg -l     : Display packages."
    _print_help_if_exist fisher "- fisher      : Fish plugins manager."

    _colored_print magenta "CheatSheet:"
    _print_help_if_exist navi "- navi : interactive cheatsheet."
    _print_help_if_exist tldr "- tldr : Display example of command."

    _colored_print magenta "Fish KeyBindings:"
    echo "    - Ct+ Arrow       : Forward(Backward) word. "
    echo "    - Ct+Sh+ Arrow    : Forward(Backward) Big word."
    echo "    - Ct+ a           : Jump to beginning of line."
    echo "    - Ct+ e           : Jump to end of line."
    echo "    - Ct+ l           : Clear."
    echo "    - Ct+ c           : Clear commandline."
    echo "    - Alt+ v, Alt+ e  : Edit commandline buffer."
    echo "    - Ct+ o           : fzf find."

end
