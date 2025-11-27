ffmpeg -y \
  -f lavfi -i color=c=black:s=1080x1920:d=55:r=30 \
  -f lavfi -i color=c=blue:s=200x60:d=55:r=30 \
  -filter_complex "
    [1]format=rgba,split=2[blue][red];
    [red]colorchannelmixer=rr=1:gg=0:bb=0[redrect];
    [blue][redrect]blend=all_expr='if(gte(T,45), (T-45)/10, 0)'[rect_base];

    [rect_base]scale=
        w='mod(10*t,450)':
        h=60:
        eval=frame
    [rect_scaled];

    [0][rect_scaled]overlay=
        x=120:
        y='(H-overlay_h)/2'
    [bg_with_rect];

    [bg_with_rect]drawtext=
        text='%{eif\:min(t,45)/60\:d2}\:%{eif\:mod(min(t,45),60)\:d2}':
        fontcolor=white:
        fontsize=80:
        x=50:
        y=100
  " \
  -c:v libx264 -pix_fmt yuv420p out.mp4
