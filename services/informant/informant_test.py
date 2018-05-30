from __future__ import print_function

import grpc

import hiyoco.calendar.event_pb2 as event_pb2
import hiyoco.calendar.event_pb2_grpc as event_pb2_grpc
import hiyoco.informant.service_pb2 as service_pb2
import hiyoco.informant.service_pb2_grpc as service_pb2_grpc


def run():
    channel = grpc.insecure_channel('localhost:50051')
    stub = service_pb2_grpc.SlackStub(channel)
    response = stub.SayEvent(event_pb2.Event(summary='Test event',description="This is test"))
    print(response)


if __name__ == '__main__':
    run()
