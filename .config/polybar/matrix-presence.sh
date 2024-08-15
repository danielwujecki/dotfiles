#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://matrix.tu-berlin.de/_matrix/client/v3/presence"
AUTH_TOKEN=`cat $HOME/.cache/matrix-token.txt`

PRESENCE=`curl -s -H "Authorization: Bearer $AUTH_TOKEN" -X GET "$BASE_URL/@wendt:matrix.tu-berlin.de/status" | sed 's#.*\"presence\":\"\(.*\)\",.*#\1#'`

STATUS_W="W:?"
if [[ "$PRESENCE" == "online" ]] ; then
    STATUS_W="W:o"
elif [[ "$PRESENCE" == "unavailable" ]] ; then
    STATUS_W="W:u"
elif [[ "$PRESENCE" == "offline" ]] ; then
    STATUS_W="W:x"
fi

PRESENCE=`curl -s -H "Authorization: Bearer $AUTH_TOKEN" -X GET "$BASE_URL/@martin.gauk:matrix.tu-berlin.de/status" | sed 's#.*\"presence\":\"\(.*\)\",.*#\1#'`

STATUS_G="G:?"
if [[ "$PRESENCE" == "online" ]] ; then
    STATUS_G="G:o"
elif [[ "$PRESENCE" == "unavailable" ]] ; then
    STATUS_G="G:u"
elif [[ "$PRESENCE" == "offline" ]] ; then
    STATUS_G="G:x"
fi

PRESENCE=`curl -s -H "Authorization: Bearer $AUTH_TOKEN" -X GET "$BASE_URL/@daniel.golf:matrix.tu-berlin.de/status" | sed 's#.*\"presence\":\"\(.*\)\",.*#\1#'`

STATUS_D="D:?"
if [[ "$PRESENCE" == "online" ]] ; then
    STATUS_D="D:o"
elif [[ "$PRESENCE" == "unavailable" ]] ; then
    STATUS_D="D:u"
elif [[ "$PRESENCE" == "offline" ]] ; then
    STATUS_D="D:x"
fi

echo "$STATUS_W $STATUS_G $STATUS_D"

