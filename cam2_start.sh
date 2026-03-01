#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

# rosrun video_streamer vision.py cam2 cam2_image rtsp://admin:Admin123@192.168.1.210:554/path

rosrun camera_publisher camera_publisher_node _url:="rtsp://admin:Admin123@192.168.1.209:554/path" _previewImg:="/cam2_image_preview" _rawImg:="/cam2_image" __name:=camera2