#!/usr/bin/env bash

source /opt/ros/noetic/setup.sh

# Recorded rosbag directory (USB drive).
data_dir="/media/dhanushka/TOSHIBA EXT/bagfiles"

declare -i var_count=0
selected_file=3

# Query all the files.
for entry in "$data_dir/"*
do
    echo "$entry"

    var_count=$var_count+1
    echo "$var_count"

    # Playback the selected file.
    if [ $var_count -eq $selected_file ] 
    then
        echo "$entry"
        gnome-terminal -- rosbag info $entry
        read -n 1 -s
    fi

done
