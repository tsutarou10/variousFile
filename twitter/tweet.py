#11321coding : utf-8

from requests_oauthlib import OAuth1Session
import json
import settings
import random
import datetime
import tweepy


CK = settings.CONSUMER_KEY
CS = settings.CONSUMER_SECRET
AT = settings.ACCESS_TOKEN
AS = settings.ACCESS_TOKEN_SECRET

# create a twitter object
auth = tweepy.OAuthHandler(CK, CS)
auth.set_access_token(AT, AS)

api = tweepy.API(auth)

def tweet(userName):
    twitter = OAuth1Session(settings.CONSUMER_KEY,
            settings.CONSUMER_SECRET,
            settings.ACCESS_TOKEN,
            settings.ACCESS_TOKEN_SECRET)

    tweets = ["test", "hoge"]
    randomtweet = tweets[random.randrange(len(tweets))]

    params = {"status": '@' + userName + ' ' + randomtweet + ' ' + str(datetime.datetime.today())} 
    req = twitter.post("https://api.twitter.com/1.1/statuses/update.json", params = params)

userName = "kur1anm1tsu"
tweet(userName)
