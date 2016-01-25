strip-docker-image
==================

This strips docker images down to only what's needed to run.

This probably isn't great for production use, your mileage my vary, see store for details.

Usage:
------
```bash
IMAGE=iamgename strip-docker-image path/to/test
```

Advanced Usage:
---------------
```
docker run --rm -it \
	-e DOCKER_HOST=tcp://172.17.0.1:2375 \
	-e IMAGE=getpwnam \
	-v /usr/bin/docker:/usr/bin/docker:ro \
	strip-docker-image \
	/tests/entrypoint
```
