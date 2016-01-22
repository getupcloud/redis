FROM openshift/base-centos7

ENV REDIS_VERSION=3.0.6 \
    HOME=/ \
    REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-3.0.6.tar.gz \
    REDIS_DOWNLOAD_SHA1=4b1c7b1201984bca8f7f9c6c58862f6928cf0a25

LABEL io.k8s.description="Memcached is a general-purpose distributed memory caching system." \
      io.k8s.display-name="Memcached 1.4" \
      io.openshift.expose-services="11211:memcache" \
      io.openshift.tags="cache,memcached"

# for redis-sentinel see: http://redis.io/topics/sentinel
RUN wget "$REDIS_DOWNLOAD_URL" -O redis.tar.gz && \
    echo "$REDIS_DOWNLOAD_SHA1 redis.tar.gz" | sha1sum -c - && \
    mkdir -p /usr/src && \
    tar -xzf redis.tar.gz -C /usr/src && \
    mv "/usr/src/redis-$REDIS_VERSION" /usr/src/redis && \
    rm redis.tar.gz && \
    make -C /usr/src/redis && \
    make -C /usr/src/redis install && \
    rm -r /usr/src/redis && \
    mkdir /data

EXPOSE 6379

USER 1001

COPY container-entrypoint /usr/bin/

ENTRYPOINT ["container-entrypoint"]

CMD [ "redis-server" ]
