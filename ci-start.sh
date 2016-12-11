#!/bin/bash

echo 'Jenkins:'
docker-compose -f jenkins-docker/docker-compose.yml start
docker-compose -f jenkins-docker/docker-compose.yml ps

echo 'Nexus:'
docker-compose -f nexus-docker/docker-compose.yml start
docker-compose -f nexus-docker/docker-compose.yml ps

echo 'Sonar:'
docker-compose -f sonar-docker/docker-compose.yml start
docker-compose -f sonar-docker/docker-compose.yml ps
