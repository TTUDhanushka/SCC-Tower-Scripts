 #!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

rostopic list -v

#DIR="~/bagfiles"
DIR="~/bagfiles"

if [ -d "$DIR" ]; then
    echo "Log directory exists."
else
    echo "Creating a new log directory."
#    mkdir ~/bagfiles
     mkdir -p ~/bagfiles
fi

#cd ~/bagfiles
cd ~/bagfiles

echo "Starting rosbag recording for all the published topics."

echo "Use CTRL + C to stop recording."

# rosbag record -a
rosbag record /sbg/imu_data /sbg/ekf_quat --split --duration=1h  /chatter

