### load functions defined by user from ./user
set -l fish_location (dirname (status --current-filename))
set -l fish_user_scripts "$fish_location/user"
if test -d $fish_user_scripts
    for f in $fish_user_scripts/*.fish
        source $f
    end
end

### Fish shell theme setting
set -g theme_display_git_default_branch yes
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
set -g theme_color_scheme terminal2
set -g theme_nerd_fonts yes

### Dev env setting
set PATH $(dirname (which cargo)) $PATH # cargo - package manager for Rust
set PATH $(dirname (which nimble)) $PATH # nimble - pakcage manager for Nim
if type -q nvm
    nvm use latest --silent
end
set PATH $(dirname (which npm)) $PATH # npm and node - package manager for JS
set PATH $(dirname (which nvim)) $PATH
set DISPLAY $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

### Abbr, Alias and Command
abbr py "python3.10"
abbr nimcr "nim c -r"
abbr coding "cd /mnt/c/Users/masat/Desktop/program"

if type  -q eza
    alias ls eza
    alias la "eza -la"
end
alias zlj zellij
alias lzg lazygit
if type -q rg
    alias grep rg
end
alias bat batcat
if type -q delta
    alias diff delta
end

### Global variables
set -gx CARGO_TARGET_DIR "$HOME/.cargo/target"
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx EDITOR vi
set -x LESSCHARSET utf-8
set -x GIT_PAGER less
set -x LESS "-X -R"
set -x LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# if status is-interactive
#     # Commands to run in interactive sessions can go here
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

