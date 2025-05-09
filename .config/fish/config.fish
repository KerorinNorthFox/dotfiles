if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g theme_display_git_default_branch yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_color_scheme terminal2
set -g theme_nerd_fonts yes

set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.nimble/bin $PATH
set DISPLAY $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

set fish_plugins theme peco
function fish_user_key_bindings
  bind \cw peco_select_history
end

alias py='python3.10'
alias nimcr='nim c -r'
alias coding='cd /mnt/c/Users/masat/Desktop/program'

alias g='git'
alias gst='git status'
alias gb='git branch'
alias gs='git switch'
alias gl='git log'

