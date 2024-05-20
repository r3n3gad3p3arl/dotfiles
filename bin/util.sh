BOOK_DIR=~/Documents/books

open_book() {
  FILE_NAME=$(ls $BOOK_DIR | rofi -dmenu -p 'book')

  if [ -n "$FILE_NAME" ]; then
    xdg-open "$BOOK_DIR/$FILE_NAME"
  fi
}

$1
