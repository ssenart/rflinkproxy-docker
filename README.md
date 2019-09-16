# rflinkproxy-docker
Docker image to run a Rflink proxy.

The rflinkproxy implementation is from https://github.com/aequitas/python-rflink.

By default, it connects on /dev/ttyUSB0, Rflink device on USB, and listen on port 1234 (plain socket).

In a next release, the device and port number will be configurable.

Any data read from the socket is transferred to the device and the same from the device to the socket.
