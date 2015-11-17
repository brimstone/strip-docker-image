#!/bin/sh
CID="$(docker run -d --entrypoint=/notbit "$TOSTRIPID" 2>/dev/null)"

sleep 5

if [ "$(docker inspect -f '{{.State.Running}}' "$CID" 2>/dev/null)" = "true" ]; then
	docker rm -vf "$CID" >/dev/null
	exit 0
fi

docker rm -vf "$CID" >/dev/null
exit 1
