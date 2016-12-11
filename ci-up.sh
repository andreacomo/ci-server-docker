#!/bin/bash

echo 'Creating Jenkins...'
docker-compose -f jenkins-docker/docker-compose.yml up -d
docker-compose -f jenkins-docker/docker-compose.yml ps

# *First database init* may be slower than Sonar requiring db connection,
# so let's anticipate creation!
docker-compose -f sonar-docker/docker-compose.yml up -d sonar-db

echo 'Creating Nexus...'
docker-compose -f nexus-docker/docker-compose.yml up -d
docker-compose -f nexus-docker/docker-compose.yml ps

echo 'Creating Sonar...'
docker-compose -f sonar-docker/docker-compose.yml up -d sonarqube
docker-compose -f sonar-docker/docker-compose.yml ps
