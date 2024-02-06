#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

rosrun thermal_camera_streamer thermal_cam.py rtsp://admin:Pineapple777@192.168.1.196:8554/ir.0

