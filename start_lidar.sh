#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

source ~/catkin_ws/devel/setup.bash

echo "Starting Lidar"

roslaunch ouster_ros driver.launch sensor_hostname:=os-992205000870