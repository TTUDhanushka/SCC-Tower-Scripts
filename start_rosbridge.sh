#!/usr/bin/env bash

source /opt/ros/noetic/setup.bash

echo "Starting ROS Bridge"

roslaunch rosbridge_server rosbridge_websocket.launch topics_glob:='[/cam1_image_preview, 
                                                                    /cam2_image_preview,
                                                                    /heading,
                                                                    /pitch,
                                                                    /roll,
                                                                    /speedkmh,
                                                                    /truecourse,
                                                                    /latitude,
                                                                    /longitude]'