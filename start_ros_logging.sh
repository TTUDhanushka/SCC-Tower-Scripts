#!/usr/bin/env bash

# Start ros core.
gnome-terminal -- bash ros_init.sh

sleep 5s

# Start Omega stereo camera.
gnome-terminal -- bash start_stereo_camera.sh

#
# All the rosnodes should be launched and running before this line.
#

# Start rosbag recording for all the topics.
gnome-terminal -- bash ros_record.sh
