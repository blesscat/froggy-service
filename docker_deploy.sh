#!/usr/bin/env bash
if [ "$TRAVIS_BRANCH" == "master" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD";
    docker image build -t froggytaipei/froggy-service-nginx -f nginx/Dockerfile .;
    docker image build -t froggytaipei/froggy-service-api ./backend;
    docker push froggytaipei/froggy-service-nginx;
    docker push froggytaipei/froggy-service-api;
fi
