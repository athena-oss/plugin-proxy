function athena.plugins.proxy.curl()
{
	curl -s --connect-timeout 5 --fail $@
}

function athena.plugins.proxy.start()
{
	$BROWSERMOBPROXY_HOME/bin/browsermob-proxy -port $BROWSERMOBPROXY_PORT -proxyPortRange $BROWSERMOBPROXY_PORT_RANGE &
	BROWSERMOB_PID=$!

	trap athena.plugins.proxy.stop SIGTERM SIGINT
	wait $BROWSERMOB_PID
}

function athena.plugins.proxy.stop()
{
    athena.color.info "shutting down browsermob-proxy.."
    kill -s SIGTERM $BROWSERMOB_PID
    wait $BROWSERMOB_PID
    athena.color.info "shutdown complete"
}

function athena.plugins.proxy.get_proxies()
{
	local endpoint="http://localhost:${BROWSERMOBPROXY_PORT}/proxy"
	athena.plugins.proxy.curl -X GET "$endpoint" | jq -C .
}

function athena.plugins.proxy.create_proxy()
{
	local endpoint="http://localhost:${BROWSERMOBPROXY_PORT}/proxy"
	athena.plugins.proxy.curl -X POST "$endpoint" | jq -C .
}

function athena.plugins.proxy.delete_proxy()
{
	athena.argument.argument_is_not_empty_or_fail "$1" "port"
	local endpoint="http://localhost:${BROWSERMOBPROXY_PORT}/proxy/$1"
	athena.plugins.proxy.curl -X DELETE "$endpoint"
	if [ $? -eq 0 ]; then
		athena.color.print_ok "port '$1' was successfully deleted."
		return 0
	fi
	athena.os.exit_with_msg "could not delete port '$1'!"
}

function athena.plugins.proxy.create_host()
{
	athena.argument.argument_is_not_empty_or_fail "$1" "port"
	athena.argument.argument_is_not_empty_or_fail "$2" "hostname"
	athena.argument.argument_is_not_empty_or_fail "$3" "ip"
	local endpoint="http://localhost:${BROWSERMOBPROXY_PORT}/proxy/$1/hosts"
	local json_data="{\"$2\":\"$3\"}"
	athena.color.print_info "trying to remap host '$2' to ip '$3'..."
	echo "$json_data" | athena.plugins.proxy.curl -g -X POST -H "Content-Type: application/json" -d @- $endpoint
	if [ $? -eq 0 ]; then
		athena.color.print_ok "host was successfully remapped."
		return 0
	fi
	athena.os.exit_with_msg "could not remap host '$2'!"
}
