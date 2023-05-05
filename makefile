.PHONY: clean changelog snapshot
.PHONY: deps

# Check for required command tools to build or stop immediately
EXECUTABLES = git go find pwd
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

BUILDTIME = $(shell date +'%FT%TZ%z')

GO_BUILDER_VERSION=latest

changelog:
	git-chglog $(VERSION) > CHANGELOG.md

snapshot:
	docker run --rm --privileged \
		-v $(CURDIR):/temphia \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(GOPATH)/src:/go/src \
		-w /temphia \
		ghcr.io/gythialy/golang-cross:$(GO_BUILDER_VERSION) --snapshot --clean --rm-dist
		