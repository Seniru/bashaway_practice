uptime=$(cat /proc/uptime | cut -d " " -f1)
echo System uptime: $(bc <<< "scale=0; $uptime/1")
