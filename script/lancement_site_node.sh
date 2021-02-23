server=$(screen -ls | awk '/\.website\t/ {print strtonum($1)}')
                
if [ $server ]
then

    screen -dmS "website" bash -c "cd /home/arma3/site_node; forever index.js"

fi