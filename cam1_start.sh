#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

<<<<<<< HEAD
# rosrun video_streamer vision.py cam1 cam1_image rtsp://admin:Admin123@192.168.1.209:554/path

rosrun camera_publisher camera_publisher_node _url:="rtsp://admin:Admin123@192.168.1.211:554/path" _previewImg:="/cam1_image_preview" _rawImg:="/cam1_image" __name:=camera1
=======
# rosrun camera_streamer main.py cam1 cam1_image rtsp://admin:Admin123@192.168.1.211:554/path
rosrun camera_streamer main.py --ros_node cam1 --ros_topic cam1_image --camera_rtsp_url rtsp://admin:Admin123@192.168.1.211:554/path]
>>>>>>> 098807ddd2a7e24902137bfdbecfe09774b84547
