Redis Docker Image
==================

This repository contains Dockerfile to run Redis under OpenShift v3.
Current redis version is 3.0.6.

Configuring
-----------

The following environment variables are available to configure your redis instance:

* REDIS_MAX_MEMORY: Max memory Redis can use
* REDIS_MAX_MEMORY_POLICY: How Redis will select what to remove when maxmemory is reached
* REDIS_EXTRA_PARAMETERS: Extra command line parameters to pass to command `redis-server`

OpenShift
---------

Examples files are provided in order to use it on OpenShift.

* imageStream.yaml: edit it to point to the images on your registry
* template.yaml: this is a basic template to easily create redis images

Running Locally
---------------

To build and run locally, execute:

    git clone https://github.com/getupcloud/redis.git
    docker build -t redis:getup .
    docker run -d redis:getup

