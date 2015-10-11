#!/bin/bash

TAG="php-apache"

docker build -t ${TAG} --force-rm --no-cache .