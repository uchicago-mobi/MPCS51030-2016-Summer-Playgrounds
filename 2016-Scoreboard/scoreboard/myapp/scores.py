import logging
import os
import cgi
import datetime
import wsgiref.handlers
import time

from google.appengine.ext import db
from google.appengine.api import users
from google.appengine.ext import webapp
from django.utils import simplejson  

#################################################
#
# Data Model
#
#################################################
class Scores(db.Model):
    username = db.StringProperty()
    hole = db.IntegerProperty(default=0)
    score = db.IntegerProperty(default=0)
    date = db.DateTimeProperty(auto_now_add=True)

class Players(db.Model):
    udid = db.StringProperty()
    username = db.StringProperty()
    date = db.DateTimeProperty(auto_now_add=True)
    lastUpdate = db.DateTimeProperty(auto_now=True)
    #score = db.IntegerProperty(default=0)
    
    # Custom model method to return all model properties
    def to_dict(self):
        return dict([(p, unicode(getattr(self, p))) for p in self.properties()])

#################################################
#
# Get the scores
#
#################################################
class PostHoleScore(webapp.RequestHandler):
    def post(self):
        scores = Scores()
        scores.username = self.request.get('username')
        scores.hole = int(self.request.get('hole'))
        scores.score = int(self.request.get('score'))
        scores.put()

#################################################
#
# Get the scores
#
#################################################
class GetPlayers(webapp.RequestHandler):
    def get(self):
        players = Players.all()
        self.response.out.write(simplejson.dumps([p.to_dict() for p in players]))

#################################################
#
# Get the scores
# - Return all the scores for a given player 
#   in ascending order in json format
#################################################
class GetScoresForPlayer(webapp.RequestHandler):
    def post(self):
        username = self.request.get('username')
        self.response.out.write('[')
        players = db.GqlQuery("SELECT * FROM Scores WHERE username = :1 ORDER BY date ASC",username)
        for result in players:
            self.response.out.write('{"Username":"%s","Hole":"%d","Score":"%d"}' % (result.username,result.hole,result.score))
        self.response.out.write(']')


#################################################
#
# Post the scores
#
#################################################
class PostPlayer(webapp.RequestHandler):
    def post(self):

        # Log the the request information
        logging.debug(self.request)
        
        # Test if new player or returning player
        welcomeBack = 0
        uniqueId = self.request.get('udid')
        
        # Update a player
        query = db.GqlQuery("SELECT * FROM Players WHERE udid = :1",uniqueId)
        for result in query:
            result.lastUpdate = datetime.datetime.now()
            #result.score = int(self.request.get('score'))
            result.put()
            welcomeBack == 1
        
        # Create a new player 
        if welcomeBack == 0:
            player = Players()
            player.lastUpdate = datetime.datetime.now()
            player.udid = self.request.get('udid')
            #player.score = int(self.request.get('score'))
            player.username = self.request.get('username')
            player.put()