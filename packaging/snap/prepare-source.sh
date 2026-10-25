#!/bin/bash
set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/../.." && pwd )"
SOURCE_DIR="$SCRIPT_DIR/project-source"

rm -rf "$SOURCE_DIR"
mkdir -p "$SOURCE_DIR"

tar -C "$PROJECT_ROOT" \
    --exclude='./.git' \
    --exclude='./.env' \
    --exclude='./packaging/snap/project-source' \
    --exclude='./packaging/snap/parts' \
    --exclude='./packaging/snap/stage' \
    --exclude='./packaging/snap/prime' \
    --exclude='./packaging/snap/*.snap' \
    -cf - . | tar -C "$SOURCE_DIR" -xf -