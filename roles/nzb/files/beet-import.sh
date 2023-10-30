#!/bin/bash
#Get Destination Folder
lidarr_first_track=$(echo "$lidarr_addedtrackpaths" | cut -d '|' -f1)
lidarr_album_path=$(dirname "$lidarr_first_track")

#Trigger Beets
docker --config /config/.docker exec -u abc beets /bin/bash -c "beet import -q $lidarr_album_path --search-id $lidarr_albumrelease_mbid"

#Update Lidarr
# FILE=/config/config.xml
# until test -f $FILE; do sleep 1; done
API="867b2b971bfd426aa56eca279cd2cbfb"
curl -s "http://localhost:8686/music/api/v1/command?apikey=$API" -X POST -d "{'name': 'ReScanArtist', 'artistID': $lidarr_artist_id}" > /dev/null