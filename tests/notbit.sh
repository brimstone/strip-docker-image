#!/bin/sh
CID="$(docker run -d --entrypoint=/notbit "$TOSTRIPID" 2>/dev/null)"

sleep 5

if docker logs "$CID" | grep -q "Name or service not known" ; then
	docker rm -vf "$CID" >/dev/null
	exit 1
fi

if [ "$(docker inspect -f '{{.State.Running}}' "$CID" 2>/dev/null)" = "true" ]; then
	docker rm -vf "$CID" >/dev/null
	exit 0
fi

docker rm -vf "$CID" >/dev/null
exit 1
