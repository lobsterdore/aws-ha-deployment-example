
deps:
	go get

build: deps
	go build -o ${GOPATH}/bin/hello-app

build-ami:
	packer build -var 'aws_access_key=${AWS_ACCESS_KEY}' -var 'aws_secret_key=${AWS_SECRET_KEY}' packer.json

deploy-ami:
	ansible-playbook -i "localhost," -c local -e aws_access_key=${AWS_ACCESS_KEY} -e aws_secret_key=${AWS_SECRET_KEY} -e aws_key_name=${AWS_KEY_NAME} -e aws_ami_id=$(AWS_AMI_ID) deploy.yml
