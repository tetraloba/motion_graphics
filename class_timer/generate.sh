ffmpeg -y \
  -f lavfi -i color=c=black:s=1080x1920:d=55:r=30 \
  -f lavfi -i color=c=red:s=200x60:d=55:r=30 \
  -filter_complex "
    [1]scale=
        w='mod(10*t,450)':
        h=60:
        eval=frame
    [rect];

    [0][rect]overlay=
        x='120':
        y='(H-overlay_h)/2'
  " \
  -c:v libx264 -pix_fmt yuv420p out.mp4



