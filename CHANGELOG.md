# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.1] - 2020-05-01
### Fixed
- Automatic restart every ${RESTART_PERIOD} hours was broken.

## [0.2.0] - 2020-04-30
### Added
- New environment variables to configure the container :
	- LISTEN_PORT : Port to listen on (default: 1234).
	- CONNECT_PORT : Serial port to connect to (default: /dev/ttyUSB0), or TCP port in TCP mode.
	- BAUD_RATE : Serial baud rate (default: 57600).
	- HOST : TCP mode, connect to host instead of serial port (default: not set).
	- RESTART_PERIOD : Restart period (in hours) of the proxy process (default: 4 hours).

## [0.1.0] - 2019-09-16
### Added
- First release : see README.md for details.

[Unreleased]: https://github.com/ssenart/rflinkproxy-docker/compare/0.1.0...HEAD
[0.1.0]: https://github.com/ssenart/rflinkproxy-docker/compare/0.1.0...0.0.0
[0.2.0]: https://github.com/ssenart/rflinkproxy-docker/compare/0.2.0...0.1.0