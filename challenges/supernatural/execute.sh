docker run --name=seraphina -d alpine:3.14 sleep infinity

docker exec seraphina /bin/sh -c "echo \"$(cat /proc/sys/kernel/random/uuid)\" >> /home/potions.txt"

# Write your code here

seraphine_container=$(docker container ps -q -f "name=^seraphina$")

# create clone
docker commit $seraphine_container clone

docker container stop seraphina
docker container stop isabella
docker container rm seraphina
docker container rm isabella

# create shared volume
docker volume create clone-shared-volume

docker run -d -v clone-shared-volume:/twilight --name seraphina clone
docker run -d -v clone-shared-volume:/twilight --name isabella clone

docker exec seraphina mkdir -p /twilight
docker exec isabella mkdir -p /twilight
