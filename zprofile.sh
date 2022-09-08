eval "$(/opt/homebrew/bin/brew shellenv)"

# android studio
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#ruby without sudo
export GEM_HOME=/Users/$USER/.gem
export PATH="$GEM_HOME/bin:$PATH"
eval "$(rbenv init -)"

function opennewtab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}


function reloadbashprofile() {
  source ~/.zprofile
}

function swiftPackageToFramework() {
  swift package generate-xcodeproj -v
}

function trim() {
    local trimmed="$1"

    # Strip leading space.
    trimmed="${trimmed## }"
    # Strip trailing space.
    trimmed="${trimmed%% }"

    echo "$trimmed"
}

function mp3youtube() {
  youtube-dl --extract-audio --audio-format mp3 "$1"
}


function ddos() {
  cd /Users/yurii/Development/mhddos_proxy
  python3 runner.py $@
}


function ddosInfinite() {
  echo "started ddos infinite"
  while :
  do
    sleep 2
    ddos $@
  done
}



function ddosForeachInfinite() {
  for var in "$@"
  do
      opennewtab "ddosInfinite $var"
  done
}

function ddosListFromUrl {
    /Users/yurii/BashScripts/ddosFromResource.sh $@
}

function switchBtDevice() {
  macaaddress=$1
  res=$(blueutil --is-connected $macaaddress)
  if [[ "$res" = '1' ]]
  then
    blueutil --unpair $macaaddress
  else
    blueutil --unpair $macaaddress
    sleep 1
    blueutil --pair $macaaddress
    sleep 1
    blueutil --connect $macaaddress
  fi
}

function runtask() {
  $@ # run some bash code
  #then
  playsound
}

function playsound() {
  afplay /System/Library/Sounds/Hero.aiff 
  #You can choose from:
  #Basso.aiff  Frog.aiff   Hero.aiff   Pop.aiff    Submarine.aiff
  #Blow.aiff   Funk.aiff   Morse.aiff  Purr.aiff   Tink.aiff
  #Bottle.aiff Glass.aiff  Ping.aiff   Sosumi.aiff
}

