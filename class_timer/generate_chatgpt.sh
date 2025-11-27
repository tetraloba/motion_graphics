ffmpeg -y \
  -f lavfi -i color=c=black:s=640x480:d=5:r=30 \
  -f lavfi -i color=c=red:s=120x60:d=5:r=30 \
  -filter_complex "
    [1]format=rgba,colorchannelmixer=aa=1[rect];
    [0][rect]overlay=
      x='mod(t*160, W+120)-120':
      y='(H-h)/2':
      shortest=1,format=yuv420p
  " \
  -c:v libx264 -crf 18 -pix_fmt yuv420p out.mp4
