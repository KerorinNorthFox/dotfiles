function change_lockscreen
    set wallpaper "$HOME/lock_wallpaper.jpg"
    set output "$HOME/.config/hypr/colors-hyprlock.conf"

    if not test -f "$wallpaper"
        echo "[Error]: wallpaper not found: $wallpaper"
        return 1
    end

    if not type -q matugen
        echo "[Error]: matugen is not installed."
        return 1
    end

    echo "Generating hyprlock colors from:"
    echo "$wallpaper"

    if not matugen image "$wallpaper" -m dark
        echo "[Error]: matugen failed."
        return 1
    end

    if not test -f "$output"
        echo "[Error]: generated file not found: $output"
        echo "Create $output"
        mkdir -p (dirname $output)
        touch "$output"
        return 1
    end

    echo "Generated:"
    echo "$output"
end
