Redis Docker Image
==================

This repository contains Dockerfile to run Redis under OpenShift v3.
Current redis version is 3.0.6.

There are sample Image Stream and Template files on https://github.com/getupcloud/origin-templates.

Configuring
-----------

The following environment variables are available to configure your redis instance:

* REDIS_MAX_MEMORY: Max memory Redis can use
* REDIS_MAX_MEMORY_POLICY: How Redis will select what to remove when maxmemory is reached
* REDIS_EXTRA_PARAMETERS: Extra command line parameters to pass to command `redis-server`

Running Locally
---------------

To build and run locally, execute:

    git clone https://github.com/getupcloud/redis.git
    docker build -t redis:getup .
    docker run -d redis:getup

