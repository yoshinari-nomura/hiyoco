import grpc
import hiyoco.calendar.event_pb2
import hiyoco.calendar.event_pb2_grpc
import hiyoco.sounder.service_pb2
import hiyoco.sounder.service_pb2_grpc

try:
    port = sys.argv[1]
except:
    port = 50051

def run():
    channel = grpc.insecure_channel('localhost' + str(port))
    stub = hiyoco.sounder.service_pb2_grpc.SounderStub(channel)
    response = stub.SayEvent(hiyoco.calendar.event_pb2.Event(summary='Test event',description="This is test"))
    print(response)


if __name__ == '__main__':
    run()
