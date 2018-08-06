#!/bin/sh

################################################################
## generate_docs.sh -- convert *.proto to *.md using protoc-gen-doc
##
## This script depends on protoc-gen-doc official Docker image:
##   https://hub.docker.com/r/pseudomuto/protoc-gen-doc/
##
## Or, you can use locally-installed protoc-gen-doc.
## See https://github.com/pseudomuto/protoc-gen-doc for details.
##
## Usage:
##
## In hiyoco/proto directory, invoke ./generate_docs.sh
## You can use it in three ways:
##   1) ./generate_docs.sh
##   2) ./generate_docs.sh --local
##   3) ./generate_docs.sh --debug
##
## 1) ... Use official docker image
## 2) ... Use locally-installed protoc-gen-doc
## 3) ... Invoke shell prompt in docker container for debug
##
##

################################################################
## Configurable variables

DST_DIR=../docs/proto/hiyoco
SRC_DIR=.

################################################################
## Debug protoc-gen-doc Docker image invoking bash

function protoc_gen_doc_docker_debug () {
  ABS_DST_DIR=$(get_absolute_path "$DST_DIR")
  ABS_SRC_DIR=$(get_absolute_path "$SRC_DIR")

  docker run -it --rm \
         -v "$ABS_DST_DIR":/out \
         -v "$ABS_SRC_DIR":/protos \
         --entrypoint "/bin/bash" \
         pseudomuto/protoc-gen-doc -l
}

################################################################
## Run protoc-gen-doc using Docker image

function protoc_gen_doc_docker () {
  SRC_FILES=$(git ls-files "$SRC_DIR/*.proto" | sed 's!^!/protos/!')

  ABS_DST_DIR=$(get_absolute_path "$DST_DIR")
  ABS_SRC_DIR=$(get_absolute_path "$SRC_DIR")

  docker run -i --rm \
         -v "$ABS_DST_DIR":/out \
         -v "$ABS_SRC_DIR":/protos \
         --entrypoint "/usr/local/bin/protoc" \
         pseudomuto/protoc-gen-doc \
         --doc_out=/out \
         --doc_opt=markdown,index.md \
         -I /protos \
         $SRC_FILES
}

################################################################
## Run protoc-gen-doc using Local installation

function protoc_gen_doc_local () {
  SRC_FILES=$(git ls-files "$SRC_DIR/*.proto")

  protoc --doc_out="$DST_DIR" \
         --doc_opt=markdown,index.md \
         $SRC_FILES
}

################################################################
## helper functions

function get_absolute_path () {
  (cd "$1"; pwd)
}

################################################################
## main

DATE_NOW=$(date '+%Y-%m-%d %T')

echo "$DATE_NOW Generating docs from *.proto into $DST_DIR..." >&2

case "$1" in
  --local) protoc_gen_doc_local        ;;
  --debug) protoc_gen_doc_docker_debug ;;
  *)       protoc_gen_doc_docker       ;;
esac

status=$?

if [ "$status" = "0" ]; then
  echo "done." >&2
else
  echo "error ($status)." >&2
fi

exit $status
