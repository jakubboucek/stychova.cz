#!/bin/bash

REMOTE_DIR="/var/www/stychova.cz"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SSH="ssh sbl"

echo "Uploading data to SSH…"
rsync -rcP --delete --exclude=".git" --exclude="/log/" --exclude="/temp/" "${DIR}/www/" "sbl:$REMOTE_DIR/"
echo "Replace file permissions…"
$SSH sudo fixwww.sh $REMOTE_DIR
echo "Remove temporary files…"
$SSH find $REMOTE_DIR/temp -mindepth 2 -type f -delete
