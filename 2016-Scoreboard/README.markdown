## Description #
Scoreboard is a simple google app engine application to showcase a simple interface with an iOS application.

#
# Post a score for a hole
#
curl -d username=john -d hole=1 -d score=4 http://localhost:8090/post-hole-score

#
# Add a player to db #
#
curl -d udid=1234 -d username=john http://localhost:8090/post-player/
curl -d udid=1234 -d username=jane http://localhost:8090/post-player/

#     
# Post a score for a given user and a given hole #     
#
curl -d username=john -d hole=1 -d score=4 http://localhost:8090/post-hole-score/
curl -d username=john -d hole=2 -d score=5 http://localhost:8090/post-hole-score/
curl -d username=john -d hole=3 -d score=3 http://localhost:8090/post-hole-score/
curl -d username=john -d hole=4 -d score=4 http://localhost:8090/post-hole-score/
curl -d username=john -d hole=5 -d score=4 http://localhost:8090/post-hole-score/
     
curl -d username=jane -d hole=1 -d score=3 http://localhost:8090/post-hole-score/
curl -d username=jane -d hole=2 -d score=5 http://localhost:8090/post-hole-score/
curl -d username=jane -d hole=3 -d score=2 http://localhost:8090/post-hole-score/
curl -d username=jane -d hole=4 -d score=4 http://localhost:8090/post-hole-score/
curl -d username=jane -d hole=5 -d score=4 http://localhost:8090/post-hole-score/

#
# List all the players in the db #
#
curl http://localhost:8090/get-players/

#
# Get the scores for a single player
#
curl -d username=john http://localhost:8090/get-scores-for-player/
curl -d username=john http://localhost:8090/get-scores-for-player/