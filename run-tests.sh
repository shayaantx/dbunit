#!/usr/bin/env bash

read -r inside_docker_cmd << EOM
cd /home/app && \
php -d display_errors=stderr \
    -d memory_limit=-1 \
    vendor/bin/phpunit \
    -c phpunit.xml
EOM

docker-compose build dbunit
docker-compose run --rm dbunit bash -c "${inside_docker_cmd}"
