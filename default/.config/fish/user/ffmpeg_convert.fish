function convert
    if test (count $argv) -lt 2
        echo "Usage: convert input_file output_file --encoder --cpu"
        echo "OPTIONS"
        echo "  --encoder [h264|h265] : Select video codec h264 or h265"
        echo "  --cpu : use cpu (gpu is default)"
        return 1
    end
    
    set encoder_cpu libx264 # h264 for cpu. high compatibility, uncompressed, low-capacity.
    set encoder_gpu h264_nvenc # h264 for gpu. high compatibility, uncompressed, low-capacity.
    set is_cpu false

    set i 3
    while test $i -le (count $argv)
        switch $argv[$i]
            case "--encoder"
                set encoder $argv[(math $i + 1)]
                if test $encoder = "h265"
                    set encoder_cpu libx265
                    set encoder_gpu hevc_nvenc
                    echo "[INFO]: Video codec is set as h265."
                else if test $encoder = "h264"
                    echo "[INFO]: Video codec is set as h264."
                else
                    echo "[WARN]: Available video codec is h264 or h265. h264 is applied as default."
                end
                set i (math $i + 2)
                continue
            case "--cpu"
                set is_cpu true
                set i (math $i + 1)
                continue
            case "*"
                echo "[INFO]: '$argv[$i]' is unavailable option."
                set i (math $i + 1)
                continue
        end
    end
    
    echo "[INFO]: Encoder for CPU - '$encoder_cpu', Encoder for GPU - '$encoder_gpu'"
    $is_cpu && echo "[INFO]: Mode 'CPU'" || echo "[INFO]: Mode 'GPU'"
 
    set -l input $argv[1]
    set -l output $argv[2]
    
    if type -q nvidia-smi && not $is_cpu
        echo "[INFO]:GPU is available for convert."
        ffmpeg -i $input -c:v $encoder_gpu -c:a aac -movflags +faststart $output
    else
        ffmpeg -i $input -c:v $encoder_cpu -c:a aac -movflags +faststart $output
    end
end
