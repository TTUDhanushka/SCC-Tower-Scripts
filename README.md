## List of active scripts
|Script file| Description |
|--|--|
|ros_start.sh | Start roscore|
|cam1_start.sh | Camera 1 streaming raw image and a compressed preview image in jpeg|
|cam2_start.sh | Camera 2 streaming raw image and a compressed preview image in jpeg|
|stream_thermal_camera.sh | Start thermal camera - need to update|
|start_compass.sh | Start furuno compass and stream NMEA2000 messages|
|start_lidar.sh | Start Ouster LiDAR|
|start_rosbridge.sh | ROS bridge requires to communicate with WebUI|
|start_sat_classifier.sh | Start satellite image classifier node|
|start_rgb_classifier.sh | Start onboard image classifier - Node itself need updating|
|ros_record.sh | Record all the ros topics|
|start_ros_logging.sh|Start roscore, open cameras and record all the topics to rosbags|
  

### example
```shell
bash start_ros_logging.sh
```

Start camera 1 with
```shell
bash cam1_start.sh
```

#### Start web video server for online monitoring
```shell
rosrun web_video_server web_video_server
```
From a remote computer, ip address 37.157.77.203:8080 gives the video stream.

* Roslaunch file to be tested.

#### TO Remove
- stream_ip_cameras.sh
- stereo_view.sh
