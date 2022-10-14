# docker-quartus
Quartus 18.1 docker environment with UI support

Recommended requirement:
The Quartus software should already be installed on your system, but you can also run the installation from a Docker container.

Build:

docker build -t quartus18 .

Start:

In start.sh set your quartus app & projects directories

For example:
QUARTUS_DIR=/apps/fpga/intelFPGA_lite/18.1
PROJECTS_DIR=/home/cj/awesome_projects/fpga

You can customize scripts to your liking.

Happy coding :)
