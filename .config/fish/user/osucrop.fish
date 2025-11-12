function osucrop
    if test (count $argv) -ne 2
        echo "Usage: osucrop input_file"
        return 1
    end
    ffmpeg -i $argv[1] -vf crop=1270:720:325:160 "$argv[1]_cropped.mp4"
end
