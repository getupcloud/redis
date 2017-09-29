FROM openshift/base-centos7

ENV REDIS_VERSION=4.0.1 \
    HOME=/ \
    REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-4.0.1.tar.gz \
    REDIS_DOWNLOAD_SHA256=2049cd6ae9167f258705081a6ef23bb80b7eff9ff3d0d7481e89510f27457591

LABEL io.k8s.description="Redis is an open source (BSD licensed), in-memory data structure store, used as database, cache and message broker." \
      io.k8s.display-name="Redis 4.0.1" \
      io.openshift.expose-services="6379:redis" \
      io.openshift.tags="cache,nosql,redis"

# for redis-sentinel see: http://redis.io/topics/sentinel
RUN wget "$REDIS_DOWNLOAD_URL" -O redis.tar.gz && \
    echo "$REDIS_DOWNLOAD_SHA256 redis.tar.gz" | sha256sum -c - && \
    mkdir -p /usr/src && \
    tar -xzf redis.tar.gz -C /usr/src && \
    mv "/usr/src/redis-$REDIS_VERSION" /usr/src/redis && \
    rm redis.tar.gz && \
    make -C /usr/src/redis && \
    make -C /usr/src/redis install && \
    rm -r /usr/src/redis && \
    mkdir -p /var/lib/redis/data && \
    chmod g+w /var/lib/redis/data

COPY container-entrypoint /usr/bin/

EXPOSE 6379

USER 1001

ENTRYPOINT ["container-entrypoint"]

CMD [ "redis-server" ]
