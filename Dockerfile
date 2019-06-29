
FROM python:2.7


# 
# docker build -t python-fuse-sample:latest .
# docker run --rm -it --privileged --cap-add SYS_ADMIN --cap-add MKNOD --device /dev/fuse --volume=/tmp/srcpoint:/tmp/srcpoint python-fuse-sample:latest
# 


# 
# https://www.stavros.io/posts/python-fuse-filesystem/
# 
# https://github.com/skorokithakis/python-fuse-sample
# https://github.com/whoopsjohnnie/python-fuse-sample
# 


# 
# https://github.com/mitre/fusera/wiki/FUSE-and-Docker
# 


# Update and upgrade the software
RUN apt-get update -y --allow-unauthenticated
RUN apt-get upgrade -y --allow-unauthenticated

# 
RUN apt-get install sshfs -y --allow-unauthenticated
RUN apt-get install libfuse-dev -y --allow-unauthenticated

# RUN cat /etc/group | grep 'fuse'
# RUN sudo usermod -a -G fuse username

ADD ./ /app

WORKDIR /app

RUN pip install -r ./requirements.txt
RUN pip install -U fusepy

CMD mkdir -p /tmp/mntpoint && python /app/passthrough.py /tmp/srcpoint /tmp/mntpoint
