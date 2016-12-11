#!/bin/bash

echo 'Jenkins:'
docker-compose -f jenkins-docker/docker-compose.yml stop

echo 'Nexus:'
docker-compose -f nexus-docker/docker-compose.yml stop

echo 'Sonar:'
docker-compose -f sonar-docker/docker-compose.yml stop
