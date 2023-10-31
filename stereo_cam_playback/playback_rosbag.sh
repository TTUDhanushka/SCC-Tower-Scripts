#!/usr/bin/env bash
<<comment

Author:         Dhanushka Liyanage
Description:    Print all the rosbag files in the directory and playback selected rosbag file.

comment

source /opt/ros/noetic/setup.bash

# Recorded rosbag directory (USB drive).
data_dir="/media/dhanushka/TOSHIBA EXT/bagfiles"

declare -i var_count=0

# Query all the files.
for entry in "$data_dir/"*
do
    var_count=$var_count+1

    echo "Rosbag:$var_count $entry"

done


# Get the file id to return info and playback
read -p "File ID to read"$'\n' selected_file

var_count=0

echo $selected_file
echo $var_count

# Playback the selected file.
for entry in "$data_dir"/*; do

    var_count=$var_count+1

    if [ $var_count -eq $selected_file ] 
    then
        # This will ignore whitespaces in the file path and give only the file name.
        echo "${entry##*/}"

        # gnome-terminal --title=ROS --working-directory="/media/dhanushka/TOSHIBA EXT/bagfiles/" -- sh -c 'rosbag info 2023-04-27-14-03-06.bag; exec bash'

        usr_command="rosbag play ${entry##*/}"
        gnome-terminal --title=ROS --working-directory="/media/dhanushka/TOSHIBA EXT/bagfiles/" -- sh -c "$usr_command"'; exec bash'
    fi
done