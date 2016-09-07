CMD_DESCRIPTION="Starts a shell inside the proxy server container."

if athena.argument.argument_exists_and_remove "--help"; then
	athena.usage 1 "[--help|--port=<port>]" "$(cat <<EOF
	[--help]        ; Show this usage.
    [--port=<port>] ; In case the proxy was started with --port=<port> the <port> must be specified. For the correct container be to selected.
EOF
)"
fi

athena.info "Placing you inside a terminal..."
athena.docker.exec -ti "$(athena.plugin.get_container_name)" /usr/bin/env bash
