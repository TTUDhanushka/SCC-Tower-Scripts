#!/usr/bin/env bash

cd ~/catkin_ws

source /opt/ros/noetic/setup.bash

source devel/setup.bash

<<<<<<< HEAD
# rosrun video_streamer vision.py cam2 cam2_image rtsp://admin:Admin123@192.168.1.210:554/path

rosrun camera_publisher camera_publisher_node _url:="rtsp://admin:Admin123@192.168.1.209:554/path" _previewImg:="/cam2_image_preview" _rawImg:="/cam2_image" __name:=camera2
=======
# rosrun camera_streamer main.py cam2 cam2_image rtsp://admin:Admin123@192.168.1.210:554/path
rosrun camera_streamer main.py --ros_node cam2 --ros_topic cam2_image --camera_rtsp_url rtsp://admin:Admin123@192.168.1.210:554/path]
>>>>>>> 098807ddd2a7e24902137bfdbecfe09774b84547
