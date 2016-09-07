CMD_DESCRIPTION="Manages proxies."

athena.usage 1 "<sub_command> [--port=<port>]" "$(cat <<EOF
	<sub_command>   ; One of these commands: list, create, delete <port>
	[--port=<port>] ; In case the proxy was started with --port=<port> the <port> must be specified.
EOF
)"

subcommand="$(athena.arg 1)"

case $subcommand in
	"list" )
		athena.plugins.proxy.get_proxies
		;;
	"create" )
		athena.plugins.proxy.create_proxy
		;;
	"delete" )
		athena.plugins.proxy.delete_proxy "$(athena.arg 2)"
		;;
	*)
		athena.fatal "command '$subcommand' not supported!"
esac
