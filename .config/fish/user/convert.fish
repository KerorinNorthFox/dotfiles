function convert
    if test (count $argv) -ne 2
        echo "Usage: convert input_file output_file"
        return 1
    end
    ffmpeg -i $argv[1] -c:v hevc_nvenc -preset p6 -rc vbr -f mp4 $argv[2]
end
