function compress
    if test (count $argv) -lt 2
        echo "Usage: compress input_file level "
        echo "OPTIONS"
        echo "--encoder [h264|h265]"
        return 1
    end
    
    set encoder_cpu libx264 # h264 for cpu. high compatibility, uncompressed, low-capacity.
    set encoder_gpu h264_nvenc # h264 for gpu. high compatibility, uncompressed, low-capacity.

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
            case "*"
                echo "[INFO]: '$argv[$i]' is unavailable option."
                set i (math $i + 1)
                continue
        end
    end
    
    echo "[INFO]: Encoder for CPU - '$encoder_cpu', Encoder for GPU - '$encoder_gpu'"
    
    set -l input $argv[1]
    set -l rate $argv[2]

    if type -q nvidia-smi
        echo "[INFO]:GPU is available for compress."
        ffmpeg -i "$input" -c:v $encoder_gpu -cq $rate -c:a -preset p6 aac -b:a 128k "$input_compress_$rate.mp4"
    else
        ffmpeg -i "$input" -c:v $encoder_cpu -crf $rate -c:a aac -b:a 128k "$input_compress_$rate.mp4"
    end
end
