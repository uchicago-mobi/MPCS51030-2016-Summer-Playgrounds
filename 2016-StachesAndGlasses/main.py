import cgi
import datetime
import urllib
import webapp2
import json

from google.appengine.ext import ndb
from google.appengine.api import images
#from google.appengine.api import users


################################################################################
# @class Photo
################################################################################
class Photo(ndb.Model):
    """Models a Guestbook entry with an author, content, avatar, and date."""
    user = ndb.StringProperty()
    image = ndb.BlobProperty()
    caption = ndb.StringProperty()
    date = ndb.DateTimeProperty(auto_now_add=True)

    @classmethod
    def query_user(cls, ancestor_key):
        return cls.query(ancestor=ancestor_key).order(-cls.date)

################################################################################
################################################################################
class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.out.write('<html><body>')
        user = self.request.get('user')
        ancestor_key = ndb.Key("User", user or "*notitle*")
        photos = Photo.query_user(ancestor_key).fetch(20)

        for photo in photos:
            self.response.out.write('<div><img src="image?image_id=%s"></img>' % photo.key())
            self.response.out.write('<blockquote>%s</blockquote></div>' % cgi.escape(photo.caption))
        
        self.response.out.write("""
            <form action="/post/default/" enctype="multipart/form-data" method="post">
            <div><textarea name="caption" rows="3" cols="60"></textarea></div>
            <div><label>Photo:</label></div>
            <div><input type="file" name="image"/></div>
            <div>User <input value="default" name="user"></div>
            <div><input type="submit" value="Post"></div>
            </form>
            <hr>
            </body>
            </html>""")#% (urllib.urlencode({'user': user}),cgi.escape(user)))


################################################################################
class User(webapp2.RequestHandler):
    def get(self,user):
        photos = db.GqlQuery('SELECT * '
                             'FROM Photo '
                             'WHERE ANCESTOR IS :1 '
                             'ORDER BY date DESC LIMIT 25',
                             user_key(user))
        
        json_array = []
        for photo in photos:
            dict = {}
            dict['image_url'] = "image/%s/" % photo.key()
            dict['caption'] = photo.caption
            dict['date'] = str(photo.date)
            json_array.append(dict)
        self.response.out.write(json.dumps({'results' : json_array}))

################################################################################
class Image(webapp2.RequestHandler):
    def get(self,key):
        photo = db.get(key)
        if photo.image:
            self.response.headers['Content-Type'] = 'image/png'
            self.response.out.write(photo.image)
        else:
            self.response.out.write('No image')


################################################################################
class Post(webapp2.RequestHandler):
    def post(self,user):
        photo = Photo(parent=ndb.Key("User",user or "*notitle$"),
                      user=user,
                      caption=self.request.get('caption'),
                      image=self.request.get('image'))

        #smaller_image = images.resize(self.request.get('image'), 300,300)
        #photo.image = ndb.BlobProperty(smaller_image)
        photo.put()
        
        self.redirect('/%s' % user+ urllib.urlencode({'user': user}))


################################################################################
################################################################################
app = webapp2.WSGIApplication([('/', MainPage),
                               webapp2.Route('/post/<user>/', handler=Post, name='post-user'),
                               webapp2.Route('/<user>/', handler=User, name='user'),
                               webapp2.Route('/image/<key>/', handler=Image, name='image')],
                              debug=True)

