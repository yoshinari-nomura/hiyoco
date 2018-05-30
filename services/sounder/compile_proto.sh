#!/bin/sh

python -m grpc_tools.protoc -I../../proto/ --python_out=. --grpc_python_out=. ../../proto/hiyoco/calendar/event.proto
touch ./hiyoco/calendar/__init__.py
python -m grpc_tools.protoc -I../../proto/ --python_out=. --grpc_python_out=. ../../proto/hiyoco/sounder/service.proto
touch ./hiyoco/sounder/__init__.py
