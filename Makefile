OWNER=treehouselabs
IMAGE_NAME=datadog-agent-extras
FQIN=$(OWNER)/$(IMAGE_NAME)
TAG=$(shell cat Dockerfile | grep FROM | sed -e "s/FROM.*://g")

build:
	docker build -t $(FQIN):$(TAG) .

tag:
	docker tag $(FQIN):$(TAG) $(FQIN):latest

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin

push: login
	docker push $(FQIN):$(TAG)
	docker push $(FQIN):latest
