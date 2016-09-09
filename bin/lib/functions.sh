# USAGE: athena.plugins.proxy.get_container_name [<port>]
function athena.plugins.proxy.get_container_name()
{
	local container_name="$(athena.os.get_prefix)-plugin-proxy-$(athena.os.get_instance)"

	if [[ -n "$1" ]]; then
		container_name="${container_name}-${1}"
	fi

	echo "$container_name"
}
