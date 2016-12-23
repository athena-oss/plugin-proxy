# Introduction

[BrowserMob Proxy](https://bmp.lightbody.net/) exposes a RESTful API which can be consumed by your application, you can read further in their official page.

# Running the Proxy Server

```bash
$ athena proxy start
...

[INFO] Starting proxy server ...
```

# Create a New Proxy

```bash
$ athena proxy proxy create
...

{
  "port": 9092
}
```

# Get a List of Proxies

```bash
$ athena proxy proxy list
...

{
  "proxyList": [
    {
      "port": 9092
    },
    {
      "port": 9091
    }
  ]
}
```

# Override Normal DNS Lookups

```bash
$ # e.g. Remap google.com to 127.0.0.1 IP Address
$ athena proxy hosts 9001 google.com 127.0.0.1
```

# Expose Proxy Server Port

```bash
$ # e.g. Start proxy with port published externally at 5001
$ athena proxy start --port=5001
...

[INFO] Starting proxy server at port 5001...
```

# Link With Other Containers

```bash
# e.g You can link the proxy server with your selenium grid
$ athena proxy start --link=<container_name>:<alias>
```

# Proxy Server Container Shell

```bash
$ athena proxy terminal
...

[INFO] Placing you inside a terminal...
root@f4a74ec293ed:/#
```

# Retrieve or Follow Logs

```bash
$ athena proxy logs
...

[INFO] Showing proxy server logs...
Running BrowserMob Proxy using LittleProxy implementation. To revert to the legacy implementation, run the proxy with the command-line option '--use-littleproxy false'.
[INFO  2016-09-07T18:30:39,864 net.lightbody.bmp.proxy.Main] (main) Starting BrowserMob Proxy version 2.1.2 
[INFO  2016-09-07T18:30:39,990 org.eclipse.jetty.util.log] (main) jetty-7.x.y-SNAPSHOT 
[INFO  2016-09-07T18:30:40,035 org.eclipse.jetty.util.log] (main) started o.e.j.s.ServletContextHandler{/,null} 
[INFO  2016-09-07T18:30:40,821 org.eclipse.jetty.util.log] (main) Started SelectChannelConnector@0.0.0.0:9090 
```

You can also follow the logs output

```bash
$ athena proxy logs -f
```
