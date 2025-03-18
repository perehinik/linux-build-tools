.PHONY: all push clean

VERSION=1.0.1
IMAGE_NAME=linux-build-tools

all:
	@docker build . -t "$(IMAGE_NAME):$(VERSION)"

push:
	@docker tag "$(IMAGE_NAME):$(VERSION)" "perehiniak/$(IMAGE_NAME):latest"
	@docker tag "$(IMAGE_NAME):$(VERSION)" "perehiniak/$(IMAGE_NAME):$(VERSION)"
	@docker push "perehiniak/$(IMAGE_NAME):$(VERSION)"
	@docker push "perehiniak/$(IMAGE_NAME):latest"

clean:
	@docker rmi "$(IMAGE_NAME):$(VERSION)"
	@docker rmi "perehiniak/$(IMAGE_NAME):$(VERSION)"
	@docker rmi "perehiniak/$(IMAGE_NAME):latest"
