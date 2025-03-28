containers=$(docker ps -aqf "status=exited")
if [ -z "$containers" ]; then
echo "Нет остановленных контейнеров для удаления."
else
docker rm $containers
echo "Удалено $(echo $containers | wc -w) контейнеров:"
echo $containers
fi
