. ./clash

class Car  \
  speed    \
  color    \
  _start   \
  _stop    \

class Color \
  red       \
  green     \
  blue      \
  _print    \

Color_print() {
  unpack red green blue = "$1"
  echo "r: $red, g: $green, b: $blue"
}

Car_start() {
  var max_speed = "$1" speed
  echo starting "$1" and increasing speed up to "$max_speed" km/h
}

Car_stop() {
  echo stopping "$1"
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
