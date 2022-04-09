running_containers=`docker ps | grep maven-project | wc -l`
local_images=`docker images | grep java_app | wc -l`
echo "------------------------>Number of running containers: $running_containers"
echo "------------------------>Number of local images: $local_images"
if [ $running_containers -gt 0 ]
then
    echo "------------------------>found containers running, removing them."
    docker-compose down
fi
if [ $local_images -gt 0 ]
then
    echo "------------------------>found local images, removing them"
    docker rmi -f java_app:1.1
fi
# echo "------------------------>building image."
# docker build /home/ubuntu/java-maven-app -t java_app:1.1
echo "------------------------>running containers."
cd /home/ubuntu/java-maven-app
docker-compose build -q
docker-compose up -d
echo "------------------------>Current running containers" 
docker ps