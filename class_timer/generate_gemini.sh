ffmpeg -y \
    -f lavfi -i color=c=1a1a1a:s=1280x720:r=60:d=6 \
    -vf "drawbox=x='(iw-w)/2 + 400*sin(t*2)': \
                 y='(ih-h)/2': \
                 w='200 + 50*cos(t*2)': \
                 h=100: \
                 c=00bcd4: \
                 t=fill" \
    -c:v libx264 -pix_fmt yuv420p \
    "$OUTPUT_FILE"
