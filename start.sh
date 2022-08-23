#!/bin/sh

docker compose up -d 
until [ "`docker inspect -f {{.State.Running}} grafana`"=="true" ]; do
    sleep 0.1;
    echo "wait for a docker container to be up and running";
done;
echo "INSTALL GATLING PLUGIN"
docker exec -it --user root grafana grafana-cli --pluginUrl https://downloads.gatling.io/releases/frontline-grafana-bundle/1.16.5/frontline-grafana-bundle-1.16.5-bundle.zip plugins install frontline
docker exec -it --user root grafana sed -i 's/allow_loading_unsigned_plugins =/allow_loading_unsigned_plugins = frontline/g' /usr/share/grafana/conf/defaults.ini
echo "RESTART GRAFANA"
docker compose restart
until [ "`docker inspect -f {{.State.Running}} grafana`"=="true" ]; do
    sleep 0.1;
    echo "wait for a docker container to be up and running";
done;