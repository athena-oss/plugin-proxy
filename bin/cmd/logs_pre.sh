CMD_DESCRIPTION="Shows proxy server logs."

if athena.argument.argument_exists_and_remove "--help"; then
	athena.usage 1 "[--help|--port=<port>] [-f]" "$(cat <<EOF
	[--help] ; Show this usage.
	[-f]            ; Follow logs output.
	[--port=<port>] ; In case the proxy was started with --port=<port> the <port> must be specified, to select the correct container.
EOF
)"
fi

follow=
if athena.argument.argument_exists "-f"; then
	follow="-f"
fi

athena.info "Showing proxy server logs..."
athena.docker.logs "$(athena.plugin.get_container_name)" $follow
