#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

rosrun video_streamer vision.py cam1 cam1_image rtsp://admin:Admin123@192.168.1.209:554/path

sleep 5s

# Run the second camera
gnome-terminal -- rosrun video_streamer vision.py cam2 cam2_image rtsp://admin:Admin123@192.168.1.210:554/path

