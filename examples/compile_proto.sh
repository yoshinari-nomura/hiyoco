#!/bin/sh
SH_PATH=$(dirname $0)

bundle exec grpc_tools_ruby_protoc -I $SH_PATH/../proto/ --ruby_out=$SH_PATH --grpc_out=$SH_PATH $SH_PATH/../proto/hiyoco/calendar/event.proto
Bundle exec grpc_tools_ruby_protoc -I $SH_PATH/../proto/ --ruby_out=$SH_PATH --grpc_out=$SH_PATH $SH_PATH/../proto/hiyoco/informant/service.proto
bundle exec grpc_tools_ruby_protoc -I $SH_PATH/../proto/ --ruby_out=$SH_PATH --grpc_out=$SH_PATH $SH_PATH/../proto/hiyoco/sounder/service.proto
