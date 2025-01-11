#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

source ~/catkin_ws/devel/setup.bash

echo "Starting Furuno Compass"

rosrun nmeaparser nmeaparser.py