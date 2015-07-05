
deps:
	go get

build: deps
	go build -o ${GOPATH}/bin/hello-app

build-ami:
	packer build -var 'aws_access_key=${AWS_ACCESS_KEY}' -var 'aws_secret_key=${AWS_SECRET_KEY}' builder.json

