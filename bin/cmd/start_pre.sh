CMD_DESCRIPTION="Starts the proxy server(s)."

# no mandatory arguments exist
if athena.argument.argument_exists_and_remove "--help" ; then
	athena.usage 1 "[--help|<options>....] [<docker_options>...]" "$(cat <<EOF
    [--help]                ; Show this usage.
    [--port=<port>]         ; In case the proxy was started with --port=<port> the <port> must be specified, to select the correct container.
    [--use-athena-network]  ; This allows Athena to use its own network which automatically resolves containers name without needing explicit linking.
EOF
)"
fi

msg=
if athena.argument.argument_exists_and_remove "--port" "port"; then
	athena.argument.append_to_arguments "-p" "$port:9090"
	msg="at port $port"
fi

if athena.argument.argument_exists_and_remove "--use-athena-network"; then
	athena.docker.network_exists_or_create "athena"
	athena.docker.add_option "--network athena"
fi

athena.docker.is_current_container_not_running_or_fail
athena.info "Starting proxy server $msg..."
args=()
athena.argument.get_arguments "args"
athena.docker.add_daemon
athena.docker.add_option "${args[*]}"
athena.pop_args ${#args}
