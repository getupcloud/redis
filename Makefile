REPO = getupcloud
NAME = redis
VERSIONS = 3.0 3.2 4.0

all: build

build:
	for v in $(VERSIONS); do \
	  cd $${v};\
          docker build -t ${REPO}/${NAME}:$${v} .; \
	  cd ..; \
	done

tag-latest:
	docker tag ${REPO}/${NAME}:4.0 ${REPO}/${NAME}:latest

push:
	for v in $(VERSIONS); do \
	  cd $${v}; \
	  docker push ${REPO}/${NAME}:$${v}; \
	  cd ..; \
	done

push-latest:
	docker push ${REPO}/${NAME}:latest
