#!/bin/bash

REMOTE_DIR="/var/www/stychova.cz/www"
LOCAL_DIR="/www"
SERVER_NAME="rlp"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SSH="ssh ${SERVER_NAME}"

echo "Uploading data to SSH…"
rsync -rcP --delete --exclude-from="${DIR}/.rsync-exclude" "${DIR}${LOCAL_DIR}/" "${SERVER_NAME}:$REMOTE_DIR/"

echo "Replace file permissions…"
$SSH sudo fixwww $REMOTE_DIR

echo "Remove temporary files…"
$SSH find $REMOTE_DIR/temp -mindepth 2 -type f -delete
