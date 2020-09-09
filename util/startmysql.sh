service mysql start 
while ! mysql sys -e "select count(*)" &>/dev/null
do
    sleep 1
done
