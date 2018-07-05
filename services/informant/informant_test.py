from __future__ import print_function

import grpc

import hiyoco.calendar.event_pb2 as event_pb2
import hiyoco.calendar.event_pb2_grpc as event_pb2_grpc
import hiyoco.informant.service_pb2 as service_pb2
import hiyoco.informant.service_pb2_grpc as service_pb2_grpc
import sys

try:
    port = sys.argv[1]
except:
    port = 50051

def run():
    channel = grpc.insecure_channel('localhost:' + str(port))
    stub = service_pb2_grpc.InformantStub(channel)
    response = stub.SayEvent(event_pb2.Text(body="Summury: Test\nDescription: This is test\n"))
    print(response)


if __name__ == '__main__':
    run()
