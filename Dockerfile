FROM armv7/python:alpine

####################################
# Build/Container parameters.

# Port to listen on (default: 1234).
# ARG listen_port=1234
# ENV LISTEN_PORT=${listen_port}

# Serial port to connect to (default: /dev/ttyUSB0), or TCP port in TCP mode.
# ARG connect_port=/dev/ttyUSB0
# ENV CONNECT_PORT=${connect_port}

# Serial baud rate (default: 57600).
# ARG baud_rate=57600
# ENV BAUD_RATE=${baud_rate}

# TCP mode, connect to host instead of serial port.
# ARG host=
# ENV HOST=${host}

# Restart period (in hours) of the proxy process.
# ARG restart_period=4
# ENV RESTART_PERIOD=${restart_period}

####################################
# Install dependencies.
# RUN mkdir -p /opt/rflinkproxy
# ADD requirements.txt /opt/rflinkproxy
# WORKDIR /opt/rflinkproxy
# RUN pip install -r requirements.txt

####################################
# Copy files in the target image directory.
# ADD openrc/rflinkproxy /etc/init.d/rflinkproxy
# RUN chmod +x /etc/init.d/rflinkproxy
# ADD openrc/rflinkproxy.conf.d /etc/conf.d/rflinkproxy
# RUN sed -i "s/\${DOCKER_LISTEN_PORT}/${LISTEN_PORT}/g" /etc/conf.d/rflinkproxy
# RUN sed -i "s|\${DOCKER_CONNECT_PORT}|${CONNECT_PORT}|g" /etc/conf.d/rflinkproxy
# RUN sed -i "s/\${DOCKER_BAUD_RATE}/${BAUD_RATE}/g" /etc/conf.d/rflinkproxy
# RUN sed -i "s/\${DOCKER_HOST}/${HOST}/g" /etc/conf.d/rflinkproxy
# ADD openrc/crond /etc/init.d/crond
# RUN chmod +x /etc/init.d/crond

####################################
# Install and setup OpenRC.
#RUN apk add --no-cache openrc
# RUN sed -i 's/^\(tty\d\:\:\)/#\1/g' /etc/inittab \
#     && sed -i \
#         # Change subsystem type to "docker"
#         -e 's/#rc_sys=".*"/rc_sys="docker"/g' \
#         # Allow all variables through
#         -e 's/#rc_env_allow=".*"/rc_env_allow="\*"/g' \
#         # Start crashed services
#         -e 's/#rc_crashed_stop=.*/rc_crashed_stop=NO/g' \
#         -e 's/#rc_crashed_start=.*/rc_crashed_start=YES/g' \
#         # Define extra dependencies for services
#         -e 's/#rc_provide=".*"/rc_provide="loopback net"/g' \
#         /etc/rc.conf \
#     # Remove unnecessary services
#     && rm -f /etc/init.d/hwdrivers \
#             /etc/init.d/hwclock \
#             /etc/init.d/hwdrivers \
#             /etc/init.d/modules \
#             /etc/init.d/modules-load \
#             /etc/init.d/modloop \
#     # Can't do cgroups
#     && sed -i 's/\tcgroup_add_service/\t#cgroup_add_service/g' /lib/rc/sh/openrc-run.sh \
#     && sed -i 's/VSERVER/DOCKER/Ig' /lib/rc/sh/init.sh

####################################
# Install and setup Cron daemon.
#RUN apk add --no-cache dcron

####################################
# Restart rflinkproxy every ${RESTART_PERIOD} hours (sometimes, it happens that it looses its USB connectivity).
#RUN echo '0 */${RESTART_PERIOD} * * * /etc/init.d/rflinkproxy rflinkproxy restart' > /etc/crontabs/root

####################################
# Register rflinkproxy and crond as new services to be started at boot time.
#RUN rc-update add rflinkproxy default
#RUN rc-update add crond default

####################################
#CMD ["/sbin/init"]

# Listen on port ${LISTEN_PORT} for simple socket connection.
#EXPOSE ${LISTEN_PORT}/tcp
