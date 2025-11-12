function compress
    if test (count $argv) -ne 2
        echo "Usage: compress input_file level"
        return 1
    end
    ffmpeg -i $argv[1] -vcodec libx264 -crf $argv[2] -acodec aac -b:a 128k "$argv[1]_compress_$argv[2].mp4"
end
