Getting Kinect data via ROS subscription
========================================

.. highlight:: ectosh

.. _diamondback: http://www.ros.org/wiki/diamondback
.. _electric: http://www.ros.org/wiki/electric

First you'll need to get the ROS master and kinect publisher going.  On ROS `diamondback`_, it is like this::

  % roscd openni_camera
  % roslaunch launch/openni_node.launch
  ... logging to /home/troy/.ros/log/04a67614-bd3a-11e0-85a0-bcaec505c5c4/roslaunch-iron-4125.log
  Checking log directory for disk usage. This may take awhile.
  Press Ctrl-C to interrupt
  Done checking log file disk usage. Usage is <1GB.

  started roslaunch server http://iron:54645/

  SUMMARY
  ========

  PARAMETERS
   * /rosdistro
   * /openni_node1/use_indices
   * /openni_node1/depth_registration
   * /openni_node1/image_time_offset
   * /openni_node1/depth_frame_id
   * /openni_node1/depth_mode
   * /openni_node1/debayering
   * /rosversion
   * /openni_node1/projector_depth_baseline
   * /openni_node1/rgb_frame_id
   * /openni_node1/depth_rgb_translation
   * /openni_node1/depth_time_offset
   * /openni_node1/image_mode
   * /openni_node1/shift_offset
   * /openni_node1/device_id
   * /openni_node1/depth_rgb_rotation

  NODES
    /
      openni_node1 (openni_camera/openni_node)
      kinect_base_link (tf/static_transform_publisher)
      kinect_base_link1 (tf/static_transform_publisher)
      kinect_base_link2 (tf/static_transform_publisher)
      kinect_base_link3 (tf/static_transform_publisher)

  ROS_MASTER_URI=http://localhost:11311

  core service [/rosout] found
  process[openni_node1-1]: started with pid [4147]
  process[kinect_base_link-2]: started with pid [4148]
  process[kinect_base_link1-3]: started with pid [4149]
  process[kinect_base_link2-4]: started with pid [4150]
  process[kinect_base_link3-5]: started with pid [4151]
  [ INFO] [1312870244.516129134]: [/openni_node1] Number devices connected: 1
  [ INFO] [1312870244.516240739]: [/openni_node1] 1. device on bus 001:09 is a Xbox NUI Camera (2ae) from Microsoft (45e) with serial id 'A00361917624047A'
  [ INFO] [1312870244.517717661]: [/openni_node1] searching for device with index = 1
  [ INFO] [1312870244.549942942]: [/openni_node1] Opened 'Xbox NUI Camera' on bus 1:9 with serial number 'A00361917624047A'
  [ INFO] [1312870244.557817950]: rgb_frame_id = '/openni_rgb_optical_frame'
  [ INFO] [1312870244.558879469]: depth_frame_id = '/openni_depth_optical_frame'

On ROS `electric`_, like this::

  % roscd openni_launch
  % roslaunch launch/openni.launch
  ... logging to /home/troy/.ros/log/04a67614-bd3a-11e0-85a0-bcaec505c5c4/roslaunch-iron-4510.log
  Checking log directory for disk usage. This may take awhile.
  Press Ctrl-C to interrupt
  Done checking log file disk usage. Usage is <1GB.

  started roslaunch server http://iron:50139/

  SUMMARY
  =======

  PARAMETERS
   * /rosdistro
   * /camera/driver/rgb_frame_id
   * /camera/driver/rgb_camera_info_url
   * /camera/depth_registered/rectify_depth/interpolation
   * /camera/driver/depth_frame_id
   * /camera/depth/rectify_depth/interpolation
   * /rosversion
   * /camera/driver/device_id
   * /camera/driver/depth_camera_info_url

  NODES
    /camera/depth/
      rectify_depth (nodelet/nodelet)
      metric_rect (nodelet/nodelet)
      metric (nodelet/nodelet)
      disparity (nodelet/nodelet)
      points (nodelet/nodelet)
    /camera/rgb/
      rectify_mono (nodelet/nodelet)
      rectify_color (nodelet/nodelet)
    /
      camera_nodelet_manager (nodelet/nodelet)
      camera_base_link (tf/static_transform_publisher)
      camera_base_link1 (tf/static_transform_publisher)
      camera_base_link2 (tf/static_transform_publisher)
      camera_base_link3 (tf/static_transform_publisher)
    /camera/
      driver (nodelet/nodelet)
      register_depth_rgb (nodelet/nodelet)
      points_xyzrgb_depth_rgb (nodelet/nodelet)
    /camera/ir/
      rectify_ir (nodelet/nodelet)
    /camera/depth_registered/
      rectify_depth (nodelet/nodelet)
      metric_rect (nodelet/nodelet)
      metric (nodelet/nodelet)
      disparity (nodelet/nodelet)

  ROS_MASTER_URI=http://localhost:11311

  core service [/rosout] found
  process[camera_nodelet_manager-1]: started with pid [4528]
  process[camera/driver-2]: started with pid [4529]
  process[camera/rgb/rectify_mono-3]: started with pid [4530]
  process[camera/rgb/rectify_color-4]: started with pid [4531]
  process[camera/ir/rectify_ir-5]: started with pid [4532]
  process[camera/depth/rectify_depth-6]: started with pid [4533]
  process[camera/depth/metric_rect-7]: started with pid [4534]
  process[camera/depth/metric-8]: started with pid [4535]
  process[camera/depth/disparity-9]: started with pid [4536]
  process[camera/depth/points-10]: started with pid [4537]
  process[camera/register_depth_rgb-11]: started with pid [4538]
  process[camera/depth_registered/rectify_depth-12]: started with pid [4539]
  process[camera/depth_registered/metric_rect-13]: started with pid [4540]
  process[camera/depth_registered/metric-14]: started with pid [4541]
  process[camera/depth_registered/disparity-15]: started with pid [4542]
  process[camera/points_xyzrgb_depth_rgb-16]: started with pid [4543]
  process[camera_base_link-17]: started with pid [4544]
  process[camera_base_link1-18]: started with pid [4545]
  process[camera_base_link2-19]: started with pid [4546]
  process[camera_base_link3-20]: started with pid [4547]
  [ INFO] [1313174584.008254707]: Number devices connected: 1
  [ INFO] [1313174584.008400094]: 1. device on bus 001:09 is a Xbox NUI Camera (2ae) from Microsoft (45e) with serial id 'A00361917624047A'
  [ INFO] [1313174584.009085765]: Searching for device with index = 1
  [ INFO] [1313174584.047288841]: Opened 'Xbox NUI Camera' on bus 1:9 with serial number 'A00361917624047A'
  [ INFO] [1313174584.074147783]: rgb_frame_id = '/camera_rgb_optical_frame'
  [ INFO] [1313174584.074206855]: depth_frame_id = '/camera_depth_optical_frame'
  [ INFO] [1313174584.078332223]: using default calibration URL
  [ INFO] [1313174584.078421596]: camera calibration URL: file:///home/troy/.ros/camera_info/rgb_A00361917624047A.yaml
  [ERROR] [1313174584.078633867]: Unable to open camera calibration file [/home/troy/.ros/camera_info/rgb_A00361917624047A.yaml]
  [ WARN] [1313174584.078704939]: Camera calibration file /home/troy/.ros/camera_info/rgb_A00361917624047A.yaml not found.
  [ INFO] [1313174584.079954472]: using default calibration URL
  [ INFO] [1313174584.080002307]: camera calibration URL: file:///home/troy/.ros/camera_info/depth_A00361917624047A.yaml
  [ERROR] [1313174584.080052890]: Unable to open camera calibration file [/home/troy/.ros/camera_info/depth_A00361917624047A.yaml]
  [ WARN] [1313174584.080084409]: Camera calibration file /home/troy/.ros/camera_info/depth_A00361917624047A.yaml not found.
  [ WARN] [1313174584.081364344]: Using default parameters for RGB camera calibration.
  [ WARN] [1313174584.081406556]: Using default parameters for IR camera calibration.

You should see the kinect stuff running.  The output below is for
`diamondback`_, (there are more nodes under `electric`_)::

  % rostopic list
  /camera/depth/camera_info
  /camera/depth/disparity
  /camera/depth/image
  /camera/depth/image_raw
  /camera/depth/points
  /camera/rgb/camera_info
  /camera/rgb/image_color
  /camera/rgb/image_mono
  /camera/rgb/image_raw
  /camera/rgb/points
  /openni_node1/parameter_descriptions
  /openni_node1/parameter_updates
  /rosout
  /rosout_agg
  /tf
  % rostopic hz /camera/rgb/image_color
  subscribed to [/camera/rgb/image_color]
  average rate: 30.765
          min: 0.013s max: 0.037s std dev: 0.00453s window: 25
  average rate: 30.340
          min: 0.013s max: 0.037s std dev: 0.00341s window: 55

Now run an ``image_view`` to view the output image::

  % rosrun image_view image_view image:=/ecto/image

A window should pop up.  Now we'll put an ecto graph in the middle:

Download: :download:`kinect_from_ros.py`

.. highlight:: py

.. literalinclude:: kinect_from_ros.py

Running this script you should see the image_view window come alive
and display frame rates.  You can start and stop the plasm as you like
while leaving the camera and image_view running... since the script
that executes the plasm doesn't itself pop up any image viewers with
threading problems (like opencv's ``imshow``), you can use the
techniques mentioned in :ref:`ipython` to change the parameters of
cells in the plasm while the plasm is executing.

.. ectoplot:: kinect_from_ros.py plasm

