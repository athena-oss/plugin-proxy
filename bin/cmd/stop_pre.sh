CMD_DESCRIPTION="Stops the proxy server(s)."

if athena.argument.argument_exists_and_remove "--help"; then
	athena.usage 1 "[--help|--all|--port=<port>]" "$(cat <<EOF
	[--help]        ; Show this usage.
	[--all]         ; Stops all running proxy containers.
    [--port=<port>] ; In case the proxy was started with --port=<port> the <port> must be specified. For the correct container be to stopped.
EOF
)"
fi

if athena.argument.argument_exists_and_remove "--all"; then
	athena.docker.stop_all_containers "$(athena.plugins.proxy.get_container_name)" "--global"
elif ! athena.docker.is_current_container_running ; then
	athena.os.exit_with_msg "proxy server not running!"
else
	athena.docker.stop_container "$(athena.plugin.get_container_name)"
fi
