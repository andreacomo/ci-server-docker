#!/bin/bash

echo 'Deleting Sonar... (data will be preserved!)'
docker-compose -f sonar-docker/docker-compose.yml down

echo 'Deleting Nexus... (data will be preserved!)'
docker-compose -f nexus-docker/docker-compose.yml down

echo 'Deleting Jenkins... (data will be preserved!)'
docker-compose -f jenkins-docker/docker-compose.yml down
