#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

source ~/catkin_ws/devel/setup.bash

echo "Starting Satellite Image Classification"

rosrun sat_image_processing_node main.py