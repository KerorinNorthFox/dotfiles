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

function convert
    if test (count $argv) -ne 2
        echo "Usage: convert input_file output_file"
        return 1
    end
    ffmpeg -i $argv[1] -c:v hevc_nvenc -preset p6 -rc vbr -f mp4 $argv[2]
end

function compress
    if test (count $argv) -ne 2
        echo "Usage: compress input_file level"
        return 1
    end
    ffmpeg -i $argv[1] -vcodec libx264 -crf $argv[2] -acodec aac -b:a 128k "$argv[1]_compress_$argv[2].mp4"
end

function osucrop
    if test (count $argv) -ne 2
        echo "Usage: osucrop input_file"
        return 1
    end
    ffmpeg -i $argv[1] -vf crop=1270:720:325:160 "$argv[1]_cropped.mp4"
end

### Global variables
set -gx CARGO_TARGET_DIR "$HOME/.cargo/target"
set -U FZF_LEGACY_KEYBINDINGS 0
set -gx EDITOR vi
