#!/usr/bin/env bash

PLAYLIST_URL='https://www.youtube.com/playlist?list=PLksUtCwP9dNBICsrvltVWzyGeoaOk529j'

play_shuffle() {
  mpv --shuffle --no-video $PLAYLIST_URL
}

open_youtube() {
  xdg-open $PLAYLIST_URL
}

$1
