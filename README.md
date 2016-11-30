# Proxy Plugin [![Build Status](https://travis-ci.org/athena-oss/plugin-proxy.svg?branch=master)](https://travis-ci.org/athena-oss/plugin-proxy)

This plugin provides a straightforward API (cli and programatically) to handle [BrowserMob Proxy](http://bmp.lightbody.net/).

It supports management of not only the proxy server, but also the sub-proxies.

You can easily use this plugin in your local development machine, or in a CI/CD pipeline.

## How to Install ?

**On Linux**

* Using `apt-get` :

```bash
$ sudo add-apt-repository ppa:athena-oss/athena
$ sudo apt-get update
$ sudo apt-get install athena-plugin-proxy
```

**On MAC OSX**

* Using [Homebrew](http://brew.sh/) :

```bash
$ brew tap athena-oss/tap
$ brew install plugin-proxy
```

**Alternative**

```bash
$ athena plugins install proxy https://github.com/athena-oss/plugin-proxy.git
```

Read the [Documentation](http://athena-oss.github.io/plugin-proxy) on using Athena.

## How to Use ?

This plugin provides the following commands :

### start - Starts the Proxy Server(s)

```bash
$ athena proxy start [--help|--port=<port>] [<docker_options>...]

$ # e.g. start proxy server
$ athena proxy start

$ # e.g. link the proxy server with my selenium grid node
$ athena proxy start --link=my-selenium-grid-node:proxy-server

$ # e.g. start proxy server and publish externally port 5001
$ athena proxy start --port=5001
```

### stop - Stop the Proxy Server(s)

```bash
$ athena proxy stop [--help|--all|--port=<port>]

$ # e.g. stop proxy server
$ athena proxy stop

$ # e.g. stop proxy server at port 5001
$ athena proxy stop --port=5001
```

### logs - Shows Proxy Server Logs

```bash
$ athena proxy logs [--help|--port=<port>] [-f]

$ # e.g. simple logs print
$ athena proxy logs

$ # e.g. get proxy server at port 5001 logs
$ athena proxy logs --port=5001
```

### terminal - Starts a Shell Inside the Proxy Server Container

```bash
$ athena proxy terminal [--help|--port=<port>]

$ # e.g. simple shell
$ athena proxy terminal

$ # e.g. start a shell in the proxy server running at port 5001
$ athena proxy terminal --port=5001
```

### cleanup - Stops and Removes the Proxy Server Container(s) and Image

```bash
$ athena proxy cleanup [--help|-y]

$ # e.g. simple cleanup
$ athena proxy cleanup

$ # e.g. with automatic yes to prompts
$ athena proxy cleanup -y
```

## proxy - Manage Proxies

```bash
$ athena proxy proxy <sub_command> [--port=<port>]

$ # e.g. list proxies
$ athena proxy proxy list

$ # e.g. list, proxy server at port 5001, proxies
$ athena proxy proxy list --port=5001
```

## Contributing

Checkout our guidelines on how to contribute in [CONTRIBUTING.md](CONTRIBUTING.md).

## Versioning

Releases are managed using github's release feature. We use [Semantic Versioning](http://semver.org) for all
the releases. Every change made to the code base will be referred to in the release notes (except for
cleanups and refactorings).

## License

Licensed under the [Apache License Version 2.0 (APLv2)](LICENSE).
