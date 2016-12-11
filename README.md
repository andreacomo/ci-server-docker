# Continuous Integration Dockerized Server #

This is a CI server based on pipeline:

 * [Jenkins](https://jenkins.io/)
 * [Nexus](https://www.sonatype.com/get-nexus-sonatype)
 * [Sonar](http://www.sonarqube.org/)

Each service is a [Docker](https://www.docker.com/) container,
managed by [Docker Compose](https://docs.docker.com/compose/).

## Scripts ##

According to Docker Compose commands (`up`/`down`, `start`/`stop`), here are four scripts:

 * `ci-up.sh`: creates and starts containers
 * `ci-down.sh`: stop and destroy containers, **preserving data volumes**
 * `ci-start.sh`: start already existing containers
 * `ci-stop.sh`: stop running containers

## How to start and go ##

For **first run**, run

```
./ci-up.sh
```

This script will download images, create and run containers with Docker Compose.

To stop containers together,

```
./ci-stop.sh
```
To start them again

```
./ci-start.sh
```

## Further notes ##

  * Jenkins image *mount host Docker socket* as volume in order to let Jenkins manage **external** containers from within.
  This is [DooD (Docker-outside-of-Docker)](http://container-solutions.com/running-docker-in-jenkins-in-docker/) solution, i.e. Jenking can create *sibling* containers running on host. If you want to run e2e tests from Jenkins, you can share `jenkinsdocker_ci-net` network with sibling containers to access them.
  * Sonar DB first init may be slower than Sonar web app, so you can encounter connectivity problems. Just restart and should work fine.

### Volumes ###
Data are stored in [named Docker Volumes](https://docs.docker.com/engine/tutorials/dockervolumes/):

 * Jenkins: `/var/jenkins_home` (named `jenkinsdata`) contains all Jenkins data
 * Nexus: `/nexus-data` (named `nexusdata`) contains all Nexus data
 * Sonar: `/var/lib/mysql` (named `mysqldata`) is storage folder of Sonar DB container, containing all Sonar data.

Docker stores named container in `/var/lib/docker/volumes/[volume_name]/_data` folder on Docker host
