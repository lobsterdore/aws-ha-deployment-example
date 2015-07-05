
deps:
	go get

build: deps
	go build -o ${GOPATH}/bin/hello-app

