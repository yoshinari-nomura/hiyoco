from concurrent import futures
import time

import grpc

import hiyoco.calendar.event_pb2 as event_pb2
import hiyoco.calendar.event_pb2_grpc as event_pb2_grpc
import hiyoco.informant.service_pb2 as service_pb2
import hiyoco.informant.service_pb2_grpc as service_pb2_grpc

import yaml
import requests
import sys

_ONE_DAY_IN_SECONDS = 60 * 60 * 24
SLACK_MESSAGE_API = 'https://slack.com/api/chat.postMessage'

try:
    settings = yaml.load(open('settings.yml','r'))
    SLACK_TOKEN =  settings['slack_token']
    SLACK_CHANNEL = settings['channel']
    SLACK_USER_NAME = settings['user_name']    
except:
    print("Error: Cannnot open setting file.")
    sys.exit(0)

def post_message(msg):
    data = {
        'token': SLACK_TOKEN,
        'channel': SLACK_CHANNEL,
        'text': msg,
        'username': SLACK_USER_NAME
    }
    result = requests.post(url=SLACK_MESSAGE_API, data=data)
    return result

class Slack(service_pb2_grpc.SlackServicer):
    def SayEvent(self, request, context):
        msg = "Summary:" + request.summary + "\n" + "Description:" + request.description + "\n"
        res = post_message(msg)
        if res.status_code == 200:
            return event_pb2.Result(result = 1)
        else:
            return event_pb2.Result(result = 0)

def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    service_pb2_grpc.add_SlackServicer_to_server(Slack(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    try:
        while True:
            time.sleep(_ONE_DAY_IN_SECONDS)
    except KeyboardInterrupt:
        server.stop(0)


if __name__ == '__main__':
    serve()
