all: test

IMAGE = mbodenhamer/texlive

TEST = docker run --rm -it -v $(CURDIR):/app -v /tmp:/tmp \
	-v /var/run/docker.sock:/var/run/docker.sock \
	mbodenhamer/docker-test:latest

#-------------------------------------------------------------------------------

build:
	docker build -t $(IMAGE):latest .

shell:
	docker run --rm -it -v $(CURDIR):/app $(IMAGE) bash

.PHONY: build shell
#-------------------------------------------------------------------------------

test-shell:
	$(TEST) bash

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) quick-test

.PHONY: test-shell quick-test test
#-------------------------------------------------------------------------------
