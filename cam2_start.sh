#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

rosrun camera_streamer main.py cam2 cam2_image rtsp://admin:Admin123@192.168.1.210:554/path