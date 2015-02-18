# GoCD Chef cookbook

Installs and enables GoCD server and/or GoCD agent on CentOS 6.

## Usage

 - gocd::default installs Java, go-server and go-agent and starts the server and agent.
 - gocd::server only installs the server.
 - gocd::agent only installs the agent. Autoregistration can be configured via attributes.
