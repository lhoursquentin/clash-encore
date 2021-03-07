class() {
  :
}

var() {
  local varname="$1"
  shift 2
  local var=
  "$@"
  eval "$varname"='$var'
}

class Car  \
  speed    \
  color    \
  _start   \
  _stop    \

class Color \
  red       \
  green     \
  blue      \
  print     \

Color_print() {
  var red = "$1" red
  var green = "$1" green
  var blue = "$1" blue
  echo "r: $red, g: $green, b: $blue"
}

Car_start() {
  var max_speed = "$1" speed
  echo starting "$1" and increasing speed up to "$max_speed" km/h
}

Car_stop() {
  echo stopping "$1"
}

mycolor() {
  case "$1" in
    print)
      local caller="$1"
      shift
      local self=mycolor
      local class=Color
      local red="$_mycolor_red"
      local green="$_mycolor_green"
      local blue="$_mycolor_blue"
      "$class"_"$caller" "$self" "$@"
      return
      ;;
    red)
      if [ "$#" -gt 1 ]; then
        if [ "$2" = = ]; then
          if [ "$#" -gt 3 ]; then
            var _mycolor_red = "$@"
          else
            _mycolor_red="$3"
          fi
        else
          shift
          "$_mycolor_red" "$@"
        fi
      else
        var="$_mycolor_red"
      fi
      ;;
    green)
      if [ "$#" -gt 1 ]; then
        if [ "$2" = = ]; then
          if [ "$#" -gt 3 ]; then
            var _mycolor_green = "$@"
          else
            _mycolor_green="$3"
          fi
        else
          shift
          "$_mycolor_green" "$@"
        fi
      else
        var="$_mycolor_green"
      fi
      ;;
    blue)
      if [ "$#" -gt 1 ]; then
        if [ "$2" = = ]; then
          if [ "$#" -gt 3 ]; then
            var _mycolor_blue = "$@"
          else
            _mycolor_blue="$3"
          fi
        else
          shift
          "$_mycolor_blue" "$@"
        fi
      else
        var="$_mycolor_blue"
      fi
      ;;
  esac
}


mycar() {
  case "$1" in
    start|stop)
      local caller="$1"
      shift
      local self=mycar
      local class=Car
      local speed="$_mycar_speed"
      local color="$_mycar_color"
      "$class"_"$caller" "$self" "$@"
      return
      ;;
    color)
      if [ "$#" -gt 1 ]; then
        if [ "$2" = = ]; then
          if [ "$#" -gt 3 ]; then
            var _mycar_color = "$@"
          else
            _mycar_color="$3"
          fi
        else
          shift
          "$_mycar_color" "$@"
        fi
      else
        var="$_mycar_color"
      fi
      ;;
    speed)
      if [ "$#" -gt 1 ]; then
        if [ "$2" = = ]; then
          if [ "$#" -gt 3 ]; then
            var _mycar_speed = "$@"
          else
            _mycar_speed="$3"
          fi
        else
          shift
          "$_mycar_speed" "$@"
        fi
      else
        var="$_mycar_speed"
      fi
      ;;
  esac
}

Color() {
  eval "_$1"_red='$2'
  eval "_$1"_green='$3'
  eval "_$1"_blue='$4'
}

Car() {
  eval "_$1"_speed='$2'
  eval "_$1"_color='$3'
}

Color mycolor 50 75 100
Car mycar 200 mycolor

mycar start
var speed1 = mycar speed
var color_red1 = mycar color red

echo speed of my car: "$speed1"
echo color red value of my car: "$color_red1"

mycar color red = 41
mycar speed = 80
var speed2 = mycar speed
var color_red2 = mycar color red

echo new speed of my car: "$speed2"
echo new color red value of my car: "$color_red2"

mycar color print
mycar stop
