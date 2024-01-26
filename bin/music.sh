PLAYLIST_URL='https://www.youtube.com/playlist?list=PLksUtCwP9dNBICsrvltVWzyGeoaOk529j'

play_shuffle() {
  mpv --shuffle --no-video $PLAYLIST_URL
}

play_song() {
  readarray -t titles < <(yt-dlp --flat-playlist --print title $PLAYLIST_URL)
  readarray -t urls < <(yt-dlp --flat-playlist --print urls $PLAYLIST_URL)

  SONG_TITLE=$(for i in ${!titles[@]}; do
    echo ${titles[$i]}
  done | rofi -dmenu -p 'music')

  SONG_INDEX=$(for i in ${!titles[@]}; do
    if [[ ${titles[$i]} == $SONG_TITLE ]]; then
      echo $i
    fi
  done)

  mpv --no-video ${urls[$SONG_INDEX]}
}

$1
