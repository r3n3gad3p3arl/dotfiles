WALLPAPER_DIR=$2
CURRENT_WALLPAPER=$(swww query | grep -o 'image:.*' | awk '{print $2}' | sed 's/"//g')

get_random_wallpaper() {
  FILE_NAME=""

  while [[ -z $FILE_NAME || $FILE_NAME == $CURRENT_WALLPAPER ]]; do
    FILE_NAME=$(ls -1 $WALLPAPER_DIR | shuf -n 1)
  done

  echo $WALLPAPER_DIR/$FILE_NAME
}

pick_wallpaper() {
  FILE_NAME=$(ls $WALLPAPER_DIR | rofi -dmenu -p 'wallpaper')
  echo $WALLPAPER_DIR/$FILE_NAME
}

$1 $2
