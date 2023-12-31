#!/usr/bin bash

find_cameras=`ASHDetect`
echo $find_cameras

camera_id='head-T-SY-20-12-149.local'


if [[ $find_cameras == *"$camera_id"* ]]; then
    echo "Camera stream starting"

    # Open camera viewer
    ASHViewer $camera_id -rRdv
else
    echo "No cameras. Reset power or check the network"
fi

