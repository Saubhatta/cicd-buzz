#!/bin/sh
#docker login -u $DOCKER_USER -p $DOCKER_PASS
echo "$DOCKER_PASS" | docker login --username $DOCKER_USER --password-stdin
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
#echo $TRAVIS_REPO_SLUG
docker build -f Dockerfile -t "$TRAVIS_REPO_SLUG":$TAG .
docker push "$TRAVIS_REPO_SLUG"
