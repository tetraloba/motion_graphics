ffmpeg -f lavfi -i color=c=0x111111:s=1280x720:d=30 -r 30 -pix_fmt yuv420p -y output_timer.mp4 \
-vf "drawbox=x=W*0.125:y=H-50:h=20:t=fill:color=if(lt(t,25),blue,red):w=W*0.75*if(lt(t,25),t/25,(t-25)/5), \
drawtext=fontfile=FreeSans.ttf:fontsize=50:x=(w-text_w)/2:y=50:fontcolor=green:text='WORK PHASE (25s)':enable='lt(t, 25)', \
drawtext=fontfile=FreeSans.ttf:fontsize=50:x=(w-text_w)/2:y=50:fontcolor=red:text='BREAK TIME (5s)':enable='gte(t, 25)', \
drawtext=fontfile=FreeSans.ttf:fontsize=150:x=(w-text_w)/2:y=(h-text_h)/2:fontcolor=white:text='%{eif\\:if(lt(t,25),25-t,30-t)\\:d}.%{eif\\:mod(if(lt(t,25),25-t,30-t), 1)*100\\:d\\:2}'"
