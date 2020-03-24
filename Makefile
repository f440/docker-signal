test: build
	docker run --name signal-string f440/signal-test:string &
	docker run --name signal-array f440/signal-test:array &
	@sleep 3
	docker ps | grep signal

build: test.sh
	docker build -t f440/signal-test:string -f Dockerfile.string .
	docker build -t f440/signal-test:array -f Dockerfile.array .

test.sh:
	printf "#!/bin/sh\n exec sleep 30" > test.sh && chmod a+x test.sh

