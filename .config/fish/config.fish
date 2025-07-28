if status is-interactive
    # Commands to run in interactive sessions can go here
end

### Fish shell theme setting
set -g theme_display_git_default_branch yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_color_scheme terminal2
set -g theme_nerd_fonts yes

### Dev env setting
set PATH $HOME/.cargo/bin $PATH # cargo - package manager for Rust
set PATH $HOME/.nimble/bin $PATH # nimble - pakcage manager for Nim
set PATH /opt/nvim-linux-x86_64/bin $PATH
set DISPLAY $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

set fish_plugins theme peco
function fish_user_key_bindings
    bind \cw peco_select_history
end

function fish_greeting
    echo "Do you execute package upgrade (with autoremove)? (y/n):"
    read is_update
    if test "$is_update" = y
        sudo apt update && sudo apt upgrade -y
        sudo apt autoremove -y
    end

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

### Abbr, Alias and Command
abbr py "python3.10"
abbr nimcr "nim c -r"
abbr coding "cd /mnt/c/Users/masat/Desktop/program"

alias ls eza
alias la "eza -la"
alias zlj zellij
alias grep rg
alias lzg lazygit

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end
abbr --add dotdot --regex '^\.\.+$' --function multicd

### Global variables
set -gx CARGO_TARGET_DIR "$HOME/.cargo/target"
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx EDITOR vi
