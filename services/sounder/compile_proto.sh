#!/bin/sh

SH_PATH=$(dirname $0)

python -m grpc_tools.protoc -I$SH_PATH/../../proto/ --python_out=$SH_PATH --grpc_python_out=$SH_PATH $SH_PATH/../../proto/hiyoco/calendar/event.proto
touch $SH_PATH/hiyoco/calendar/__init__.py
python -m grpc_tools.protoc -I$SH_PATH/../../proto/ --python_out=$SH_PATH --grpc_python_out=$SH_PATH $SH_PATH/../../proto/hiyoco/sounder/service.proto
touch $SH_PATH/hiyoco/sounder/__init__.py
