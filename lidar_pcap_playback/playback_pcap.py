#!/usr/bin/env python3

import os
from ouster import pcap, client
from ouster.sdk import simple_viz

# pcap_data_path = '/home/dhanushka/LiDAR/Downloaded_sample_data/OS-2-32-U0_v2.3.0_1024x10_20220420_122747-000.pcap'
# metadata_path = '/home/dhanushka/LiDAR/Downloaded_sample_data/OS-2-32-U0_v2.3.0_1024x10_20220420_122747.json'

pcap_data_path = '/media/dhanushka/TOSHIBA EXT/LiDAR Recordings/Aker 25 Apr/2023-04-25-12-05-54_OS-2-32-992205000870-512x10.pcap'
metadata_path = '/media/dhanushka/TOSHIBA EXT/LiDAR Recordings/Aker 25 Apr/2023-04-25-12-05-54_OS-2-32-992205000870-512x10.json'

scan_rate = 1

def playback_sensor_data():
    with open(metadata_path, 'r') as metafile:
        info = client.SensorInfo(metafile.read())

        print(f"Scan mode:{info.mode}")
        print(f"init_id: {info.lidar_origin_to_beam_origin_mm}")

        lidarscans =  client.Scans(pcap.Pcap(pcap_path=pcap_data_path, info=info))
        simple_viz.SimpleViz(lidarscans.metadata, scan_rate).run(lidarscans)

if __name__=="__main__":
    playback_sensor_data()
