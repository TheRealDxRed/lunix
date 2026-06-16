#!/usr/bin/env fish

set DEFAULT_INTERVAL 30

set GIFS ( find $HOME/lunix/img/wallpaper | grep 1080p.gif )

set -x AWWW_TRANSITION_FPS 60
set -x AWWW_TRANSITION_STEP 2

while true;
  set CHOICE ( random choice $GIFS );
  echo CHOICE: $CHOICE
  awww img $CHOICE
  sleep $DEFAULT_INTERVAL
end
