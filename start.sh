#!/bin/bash
QUARTUS_DIR=
PROJECTS_DIR=
docker run --rm -it -e DISPLAY -e "QT_X11_NO_MITSHM=1" --privileged -v $QUARTUS_DIR:/home/developer/quartus -v $PROJECTS_DIR:/home/developer/projects -v /tmp/.X11-unix:/tmp/.X11-unix:ro -v /sys:/sys:ro -v /dev/bus/usb:/dev/bus/usb quartus18:latest
