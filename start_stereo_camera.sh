#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

cd ~/catkin_ws

source /devel/setup.bash

roslaunch omega_camera omega.launch camera_name:=head-T-SY-20.12.149.local

