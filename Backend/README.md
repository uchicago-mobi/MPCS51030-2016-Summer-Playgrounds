Spring2013-StachesAndGlasses
============================

Simple App Engine backend for Assignment 3.



### Get a json list of most recent submitted pictures

  	http://stachesandglasses.appspot.com/user/<USERNAME>/json/


### See a list of the most recent on a web page (useful for debugging)

	http://stachesandglasses.appspot.com/user/<USERNAME>/web/


### Endpoint for posting images to server.  

 You will need to post using a multipart form (see the example in the project).  There is an optional "caption" parameter that you can use.

	http://stachesandglasses.appspot.com/post/<USERNAME>/

