all: build push
test: build pushtest

build:
	docker build -t xodio/concourse-kubernetes-resource:local .

push:
	docker tag xodio/concourse-kubernetes-resource:local xodio/concourse-kubernetes-resource:latest
	docker push xodio/concourse-kubernetes-resource:latest

pushtest:
	docker tag xodio/concourse-kubernetes-resource:local xodio/concourse-kubernetes-resource:test
	docker push xodio/concourse-kubernetes-resource:test
