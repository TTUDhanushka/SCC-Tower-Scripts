#!/usr/bin bash

cd

source /opt/ros/noetic/setup.bash

echo $ROS_PACKAGE_PATH

echo "ROS Starting!"

roscore

