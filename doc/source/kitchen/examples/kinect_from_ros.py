#!/usr/bin/env python

import sys
import ecto, ecto_ros, ecto_sensor_msgs, ecto_opencv.highgui

plasm = ecto.Plasm()

# subscribe to images
sub_rgb = ecto_sensor_msgs.Subscriber_Image('Image sub',topic_name='/camera/rgb/image_color')

# convert to cv::Mat
im2mat_rgb = ecto_ros.Image2Mat('Image -> cv::Mat')

# draw the frames per second on the image for good measure
fps = ecto_opencv.highgui.FPSDrawer()

# convert back to image
mat2img_rgb = ecto_ros.Mat2Image('cv::Mat -> Image')

# publish the image
pub = ecto_sensor_msgs.Publisher_Image('image pub', topic_name='/ecto/image')

plasm.connect(sub_rgb["output"] >> im2mat_rgb["image"],
              im2mat_rgb["image"] >> fps[:],
              fps[:] >> mat2img_rgb[:],
              mat2img_rgb[:] >> pub[:])

if __name__ == '__main__':
    ecto_ros.init(sys.argv,"kinect_peeker")
    sched = ecto.schedulers.Threadpool(plasm)
    sched.execute()


