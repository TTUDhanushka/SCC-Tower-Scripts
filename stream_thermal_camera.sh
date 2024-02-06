#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

rosrun thermal_camera_streamer thermal_cam.py

