# rflinkproxy-docker
Docker image to run a Rflink proxy.

The rflinkproxy implementation is from https://github.com/aequitas/python-rflink.

By default, it connects on serial port, Rflink device on USB (/dev/ttyUSB0), baud rate 57600, and listen on port 1234 (plain socket).

This default can be override by setting the environment variables :
	- LISTEN_PORT : Port to listen on (default: 1234).
	- CONNECT_PORT : Serial port to connect to (default: /dev/ttyUSB0), or TCP port in TCP mode.
	- BAUD_RATE : Serial baud rate (default: 57600).
	- HOST : TCP mode, connect to host instead of serial port (default: not set).
	- RESTART_PERIOD : Restart period (in hours) of the proxy process (default: 4 hours).

Any data read from the socket is transferred to the device and the same from the device to the socket.
