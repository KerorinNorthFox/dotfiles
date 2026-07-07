function filename_removal
    set target "$argv[1]"

    if test (count $argv) -ne 1
        echo "Usage: 'filename_removal <word_to_remove>'"
        exit 1
    end

    for file in *
        if test -f "$file"
            set new_name (string replace -a "$target" "" -- "$file")

            # ファイル名が空の場合スキップ.
            if test -z "$new_name"
                echo "Skip '$file' -> '$new_name' due to empty filename."
                continue
            end

            # ファイル名が既に存在しているため.
            # ファイルの上書きを防ぐ.
            if test -e "$new_name"
                echo "Skip '$file' => '$new_name' due to existing already."
                continue
            end

            if test "$file" != "$new_name"
                echo "$file => $new_name"
                mv -- "$file" "$new_name"
            end
        end
    end
end
