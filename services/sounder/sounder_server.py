from concurrent import futures
import time
import sys
import aiy.audio

import grpc
import hiyoco.calendar.event_pb2
import hiyoco.calendar.event_pb2_grpc
import hiyoco.sounder.service_pb2
import hiyoco.sounder.service_pb2_grpc

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

try:
    port = sys.argv[1]
except:
    port = 50051

class Sounder(hiyoco.sounder.service_pb2_grpc.SounderServicer):
    def SayEvent(self, request, context):
        msg = "Summary is " + request.summary + "\n" + "Description is" + request.description + "\n"
        aiy.audio.say(msg)
        return hiyoco.calendar.event_pb2.Result()

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    hiyoco.sounder.service_pb2_grpc.add_SounderServicer_to_server(Sounder(), server)
    server.add_insecure_port('[::]:' + str(port))
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)

if __name__ == '__main__':
    serve()
