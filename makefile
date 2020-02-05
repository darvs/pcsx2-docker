all: Dockerfile
	DOCKER_BUILDKIT=1 docker build -t pcsx2 .
