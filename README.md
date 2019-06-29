# python-fuse-sample

This repo contains a very simple FUSE filesystem example in Python. It's the
code from a post I wrote a while back:

https://www.stavros.io/posts/python-fuse-filesystem/

If you see anything needing improvement or have any feedback, please open an
issue.


> docker build -t python-fuse-sample:latest .
> docker run --rm -it --privileged --cap-add SYS_ADMIN --cap-add MKNOD --device /dev/fuse --volume=/tmp/srcpoint:/tmp/srcpoint python-fuse-sample:latest

> docker ps
> docker exec -it 3de14115d43b /bin/bash

> echo "It works!" >> /tmp/srcpoint/test
> cat /tmp/mntpoint/test 
It works!
