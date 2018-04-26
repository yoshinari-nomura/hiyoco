# camome_voice
## Setup for execution environment
+ Confirm pip version and python version

gRPC Python is supported for use with Python 2.7 or Python 3.4 or higher.
Ensure you have pip version 9.0.1 or higher.

+ Install `grpcio`

```
$ pip install grpcio
```
`grpcio` is gRPC library for python.
You need `grpcio` for execute python include gRPC.


## Setup for compile environment
+ Confirm pip version and python version

gRPC Python is supported for use with Python 2.7 or Python 3.4 or higher.
Ensure you have pip version 9.0.1 or higher.

+ Install `grpcio-tools`
```
$ pip install grpcio
```
`grpcio-tools` include the protocol buffer compiler `protoc`.
So, you need `grpcio-tools` for compile.


## Compile `.proto` file
Given protobuf include directories `$INCLUDE_DIR`, an output directory `$OUTPUT_DIR`, and proto files `$PROTO_FILES`, invoke as:
```
$ python -m grpc.tools.protoc -I$INCLUDE_DIR --python_out=$OUTPUT_DIR --grpc_python_out=$OUTPUT_DIR $PROTO_FILES
```


## Reference
0. [grpc(Google documents)](https://grpc.io/docs/quickstart/python.html)
0. [grpcio(Github)](https://github.com/grpc/grpc/tree/master/src/python/grpcio)
0. [grpcio-tools(GitHub)](https://github.com/grpc/grpc/tree/master/tools/distrib/python/grpcio_tools)
