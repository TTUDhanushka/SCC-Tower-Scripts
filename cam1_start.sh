#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

# rosrun video_streamer vision.py cam1 cam1_image rtsp://admin:Admin123@192.168.1.209:554/path

rosrun camera_publisher camera_publisher_node _url:="rtsp://admin:Admin123@192.168.1.211:554/path" _previewImg:="/cam1_image_preview" _rawImg:="/cam1_image" __name:=camera1
