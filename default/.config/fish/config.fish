### load functions defined by user from ./user
set -l fish_location (dirname (status --current-filename))
set -l fish_user_scripts "$fish_location/user"
if test -d $fish_user_scripts
    for f in $fish_user_scripts/*.fish
        echo "Load script $f"
        source $f
    end
    echo ""
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
set PATH $HOME/.local/bin $PATH
set PATH /usr/local/cuda/bin $PATH
if type -q nvm
    nvm use latest --silent
    if test $status -ne 0 # install latest node if there is not.
        read -P "Setting node version to latest is failed. Do you install latest version?[y/n] : " is_install_nvm
        if test "$is_install_nvm" = y -o "$is_install_nvm" = Y
            nvm install latest
            nvm use latest
        end
    end
end
set PATH $(dirname (which npm)) $PATH # npm and node - package manager for JS
set PATH /opt/nvim-linux-x86_64/bin $PATH
set DISPLAY $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

### Abbr, Alias and Command
abbr py "python3.10"
abbr nimcr "nim c -r"
abbr coding "cd /mnt/c/Users/masat/Desktop/program"

if type -q eza
    alias ls eza
    alias la "eza -la"
end
alias zlj zellij
alias lzg lazygit
if type -q rg
    alias grep rg
end
if type -q batcat
    alias bat batcat
end
if type -q delta
    alias diff delta
end
if type -q ~/.cargo/target/release/dup-img-remover
    alias dup-img-remover ~/.cargo/target/release/dup-img-remover
end
if type -q yazi # yaziで移動したディレクトリにq時にcdするコマンドyを定義.
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$tmp" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        command rm -f -- "$tmp"
    end
end

### Global variables
set -gx CARGO_TARGET_DIR "$HOME/.cargo/target"
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx EDITOR vi
set -x LESSCHARSET utf-8
set -x LESS "-X -R"
set -x LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# if status is-interactive
#     # Commands to run in interactive sessions can go here
#     eval (zellij setup --generate-auto-start fish | string collect)
# end
