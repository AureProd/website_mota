server=$(screen -ls | awk '/\.website\t/ {print strtonum($1)}')
                
if [ not $server ]
then

    screen -dmS "website" bash -c "cd /root/website_mota; forever index.js"

fi