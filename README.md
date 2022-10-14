# docker-quartus
Quartus 18.1 docker environment with UI support

Backstory

My laptop is running Linux Mint 20.3. Quartus is supported on RedHat Linux, but other distributions may have difficulty running it. For example, version 21 ran on my system without problems, but due to a change in licensing policy for modeling and simulation tools (requires online activation), I had to upgrade to lower versions. On the recommendation of my teacher, I paid attention to version 18.1, which can still be downloaded. The launch of Quartus itself also went without problems, but Modelsim required certain versions of the libraries. The main problem was maintaining the correct version of the freetype6 and fontconfig packages. There are guides on the Internet on how to solve this problem. You can tell Quartus to work with local versions of these libraries by first building them on your system. That's exactly what I did. ModelSim ran but crashed. Debugging gdb pointed to incomplete compatibility of other libraries on my system. I love Docker and I try to place the working environment and SDK of all projects in it. I was wondering if there was a way to run GUI applications in Docker and found a couple of great articles on the web (see original sources). Based on these articles, I wrote my own container deployment script, as well as a startup script.
In the end, this solved the problem. It turned out to create a lightweight isolated environment with the required environment and library versions to run Qartus 18.1.

Primary sources (Inspiration)

http://my-cool-projects.blogspot.com/2018/10/how-to-dockerize-intel-quartus-1801.html

https://www.jamieiles.com/posts/quartus-docker/

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
