import grpc
import hiyoco.calendar.event_pb2
import hiyoco.calendar.event_pb2_grpc
import hiyoco.sounder.service_pb2
import hiyoco.sounder.service_pb2_grpc

def run():
    channel = grpc.insecure_channel('localhost:50051')
    stub = hiyoco.sounder.service_pb2_grpc.SounderStub(channel)
    response = stub.SayEvent(hiyoco.calendar.event_pb2.Event(summary='Test event',description="This is test"))
    print(response)


if __name__ == '__main__':
    run()
