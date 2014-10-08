1: first create an image who has vol which has init data in it.
docker build -t m3958/hasvolhasdata .
2: use image created in step 1, to create a named volume
docker run -d -v /volume_has_data --name volume_has_init_data m3958/hasvolhasdata echo yes
3,to use that named volume, see if init data exist.
docker run --rm -it --volumes-from volume_has_init_data centos:centos6 /bin/bash
