#coding:utf-8
import json
from requests_oauthlib import OAuth1Session
from GenerateText import GenerateText

def markovbot():
    #keysfile = open('keys.json')
    #keys = json.load(keysfile)
    #oath = create_oath_session(keys)

    oath = None
    generator = GenerateText(1)

    tweetmarkovstring(oath, generator)

def create_oath_session(oath_key_dict):
    oath = OAuth1Session(
    oath_key_dict['consumer_key'],
    oath_key_dict['consumer_secret'],
    oath_key_dict['access_token'],
    oath_key_dict['access_token_secret']
    )
    return oath

def tweetmarkovstring(oath, generator):
    url = 'https://api.twitter.com/1.1/statuses/update.json'
    markovstring = generator.generate()
    print markovstring
    '''
    params = {'status': markovstring+'[偽者です]'}
    req = oath.post(url, params)

    if req.status_code == 200:
        print('tweet succeed!')
    else:
       print('tweet failed')
    '''

if __name__ == '__main__':
    markovbot()
