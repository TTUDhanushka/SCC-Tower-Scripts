## List of scripts
|Script file| Description |
|--|--|
|ros_start.sh | Start roscore|
|ros_record.sh | Record all the ros topics|
|start_ros_logging.sh|Start roscore, open cameras and record all the topics to rosbags|
  

### example
```shell
bash start_ros_logging.sh
```

Start cameras with
```shell
bash stream_ip_cameras.sh
```

#### Start web video server for online monitoring
```shell
rosrun web_video_server web_video_server
```
From a remote computer, ip address 37.157.77.203:8080 gives the video stream.

* Roslaunch file to be tested.
