USER=nikeda
NAME=node-red
VERSION=0.0.1

build:
	docker build -t $(USER)/$(NAME):$(VERSION) .

restart: stop start

start:
	docker run -itd --rm \
		-p 1880:1880 \
		-v $$PWD/data:/data \
		--name $(NAME) \
		$(USER)/$(NAME):$(VERSION)

start-allow-root:
	docker run -itd --rm \
		-p 10000:8888 \
		-p 54321:54321 \
		-v $$PWD/data:/data \
		--name $(NAME) \
		-e GRANT_SUDO=yes \
		--user root \
		$(USER)/$(NAME):$(VERSION)
stop:
	docker stop $(NAME)
