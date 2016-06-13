#!/usr/bin/env bash
set -euf
container_name=$1
debug=$2
cd /tmp
rm -rf /tmp/whmcs
tar -xvf custom_oauth2.tgz
if [ ${debug} = 'debug' ]; then
    echo "Deploying to dev server"
else
    mv whmcs html
    mv html/templates/itsyouonline html/templates/fusion
fi
docker cp whmcs ${container_name}:/var/www/html/
rm -rf custom_oauth2 custom_oauth2.tgz docker-deploy.sh