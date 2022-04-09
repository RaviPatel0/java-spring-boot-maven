running_containers=`docker ps | grep maven-project | wc -l`
local_images=`docker images | grep java_app | wc -l`
echo $running_containers
echo $local_images
if [ $running_containers -gt 0 ]
then
    docker-compose down
fi
if [ $local_images -gt 0 ]
then
    docker rmi -f java_app:1.1
fi
docker build /home/ubuntu/java-maven-app -t java_app:1.1
docker-compose up -d -f /home/ubuntu/java-maven-app/docker-compose.yaml
docker ps