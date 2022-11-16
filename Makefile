GO_TEST_ARGS ?= 
GO_BUILD_ARGS ?= 

GCFLAGS ?=
ifneq ($(GCFLAGS),)
	GO_BUILD_ARGS += -gcflags "$(GCFLAGS)"
endif

LDFLAGS ?=
ifneq ($(LDFLAGS),)
	GO_BUILD_ARGS += -ldflags "$(LDFLAGS)"
endif

export GO_BUILD=env GO111MODULE=on go build $(GO_BUILD_ARGS)
export GO_TEST=env GOTRACEBACK=all GO111MODULE=on go test $(GO_TEST_ARGS)
export GO_CLEAN=go clean

# List of apps to build
CMD := TrivaNightServer

all: build

test:
	$(GO_TEST) $(GO_TEST_PATHS)

build: 
	$(GO_BUILD) -o ./build/$(CMD) ./cmd/$(CMD)

run: build
	./build/$(CMD)

clean: 
	$(GO_CLEAN) ./cmd/$(CMD)
	rm -r ./build