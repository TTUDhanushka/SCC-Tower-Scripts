#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

# rosrun camera_streamer main.py cam1 cam1_image rtsp://admin:Admin123@192.168.1.211:554/path
rosrun camera_streamer main.py --ros_node cam1 --ros_topic cam1_image --camera_rtsp_url rtsp://admin:Admin123@192.168.1.211:554/path]