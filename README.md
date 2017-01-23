# FPGA-Based Real-Time SLAM

This repository contains code and miscellaneous content for our [Major Qualifying Project](https://www.wpi.edu/academics/ece/mqp.html). 

This project created a proof of concept SLAM sensor suite capable of remotely observing and mapping areas by combining real-time stereo camera imagery with distance measurements and localization data to generate a 3D depth map and 2D floorplan of its environment. The system used a Xilinx Zynq SoC containing an embedded ARM processor and FPGA fabric, and implemented unique SLAM processing functionality using both embedded software and parallelized custom logic.