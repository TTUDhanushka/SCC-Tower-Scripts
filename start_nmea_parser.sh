#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

source ~/catkin_ws/devel/setup.bash

echo "Starting NMEA Parser"

rosrun nmea_parser parser.py