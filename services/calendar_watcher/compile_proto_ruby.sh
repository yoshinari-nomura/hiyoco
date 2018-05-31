#!/bin/sh

bin/grpc_tools_ruby_protoc -I ../../proto/ --ruby_out=lib/proto --grpc_out=lib/proto ../../proto/hiyoco/calendar/event.proto
bin/grpc_tools_ruby_protoc -I ../../proto/ --ruby_out=lib/proto --grpc_out=lib/proto ../../proto/hiyoco/calendar_watcher/service.proto
echo 'Generate grpc code into "lib/proto/hiyoco"'
