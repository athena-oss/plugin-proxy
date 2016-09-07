CMD_DESCRIPTION="Creates a remap host entry."

athena.usage 3 "<port> <hostname> <ip>"

athena.plugins.proxy.create_host "$(athena.arg 1)" "$(athena.arg 2)" "$(athena.arg 3)"
