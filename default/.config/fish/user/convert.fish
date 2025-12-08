function convert
    if test (count $argv) -ne 2
        echo "Usage: convert input_file output_file"
        return 1
    end
    
    set -l input $argv[1]
    set -l output $argv[2]
    
    ffmpeg -i $input -c:v copy -c:a copy -movflags +faststart $output
    end
end
