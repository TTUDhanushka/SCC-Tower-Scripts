#!/usr/bin/env python3

"""
Description: Play back pcap LiDAR point clouds using Point Viz library.
"""

import os
from ouster import pcap, client, viz
import numpy as np

# Point cloud data paths.
pcap_data_path = '/home/dhanushka/LiDAR_data_from_Aker/2023-04-25-12-05-54_OS-2-32-992205000870-512x10.pcap'
metadata_path = '/home/dhanushka/LiDAR_data_from_Aker/2023-04-25-12-05-54_OS-2-32-992205000870-512x10.json'

def vizualizer(meta, scans):
    point_viz = viz.PointViz("Viz")
    viz.add_default_controls(point_viz)

    # update internal objects buffers and run visualizer
    # point_viz.update()
    # point_viz.run()

    # label_top = viz.Label("[0, 1]", 0.5, 0.0, align_top=True)
    # label_top.set_scale(1)
    # point_viz.add(label_top)
    #
    # label_bot = viz.Label("[0, -1]", 0.5, 1, align_top=False)
    # label_bot.set_scale(1)
    # point_viz.add(label_bot)

    # [doc-stag-image-pos-center]
    # img = viz.Image()
    # img.set_image(np.full((10, 10), 0.5))
    # img.set_position(-0.5, 0.5, -0.5, 0.5)
    # point_viz.add(img)
    #
    # img.set_position(-1, 0, 1, 0)
    # img.set_hshift(1)

    print(f"Altitide angles {meta.beam_altitude_angles[0]: .4f} and {meta.beam_altitude_angles[1]: .4f}")

    image_aspect = (meta.beam_altitude_angles[0] - meta.beam_altitude_angles[1]) / 360.0
    img_screen_height = 0.4
    img_screen_length = img_screen_height / image_aspect

    scan = next(scans)

    ranges = scan.field(client.ChanField.RANGE)
    ranges = client.destagger(meta, ranges)
    ranges = np.divide(ranges, np.amax(ranges), dtype=np.float32)

    print(f"Ranges {ranges}")

    signal = scan.field(client.ChanField.REFLECTIVITY)
    signal = client.destagger(meta, signal)
    signal = np.divide(signal, np.amax(signal), dtype=np.float32)

    range_img = viz.Image()
    range_img.set_image(ranges)
    range_img.set_position(-img_screen_length / 2, img_screen_length / 2, 1- img_screen_height, 1)

    # point_viz.add(range_img)

    signal_img = viz.Image()
    signal_img.set_image(signal)

    image_aspect = (meta.beam_altitude_angles[0] - meta.beam_altitude_angles[-1]) / 360.0
    img_screen_height = 0.4
    img_screen_length = img_screen_height / image_aspect

    signal_img.set_position(-img_screen_length / 2, img_screen_length / 2, - 1, -1 + img_screen_height)

    # point_viz.add(signal_img)

    range_label = viz.Label(str(client.ChanField.RANGE), 0.5,0,align_top=True)
    range_label.set_scale(1)
    # point_viz.add(range_label)

    signal_label = viz.Label(str(client.ChanField.REFLECTIVITY), 0.5, 1 - img_screen_height / 2, align_top=False)
    signal_label.set_scale(1)
    # point_viz.add(signal_label)

    # cloud_scan = viz.Cloud(meta)
    # cloud_scan.set_range(scan.field(client.ChanField.RANGE))
    # cloud_scan.set_key(signal)

    # point_viz.add(cloud_scan)

    xyz_lut = client.XYZLut(meta)
    xyz = xyz_lut(scan.field(client.ChanField.RANGE))
    cloud_xyz = viz.Cloud(xyz.shape[0] * xyz.shape[1])
    cloud_xyz.set_xyz(np.reshape(xyz, (-1, 3)))
    cloud_xyz.set_key(signal.ravel())

    point_viz.add(cloud_xyz) 

    # visualize
    point_viz.update()
    point_viz.run()

def main():
    # Getting data sources
    meta = client.SensorInfo(open(metadata_path).read())
    packets = pcap.Pcap(pcap_data_path, meta)
    scans = iter(client.Scans(packets))

    vizualizer(meta, scans)


if __name__ == "__main__":
    main()
