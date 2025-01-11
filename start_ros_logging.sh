#!/usr/bin/env bash

# Start ros core.
gnome-terminal -- bash ros_start.sh

sleep 5s

# Start Omega stereo camera. [No longer in use]
# gnome-terminal -- bash start_stereo_camera.sh

# Start RGB camera 1
gnome-terminal -- bash cam1_start.sh

sleep 1s

# Start RGB camera 2
gnome-terminal -- bash cam2_start.sh

sleep 1s

# Start thermal camera
gnome-terminal -- bash stream_thermal_camera.sh

sleep 1s

# Start IMU
gnome-terminal -- bash start_imu_ellipse.sh

# Start LiDAR
gnome-terminal -- bash start_lidar.sh

#
# All the rosnodes should be launched and running before this line.
#

# Start rosbag recording for all the topics.
gnome-terminal -- bash ros_record.sh
