# choosing which container to use
case "$(athena.os.get_command)" in
	"start"|"stop"|"proxy"|"terminal"|"logs"|"hosts")
		port=
		if athena.argument.argument_exists "--port" ; then
			port=$(athena.argument.get_argument --port)
		fi

		container_name=$(athena.plugins.proxy.get_container_name $port)
		athena.plugin.set_container_name "$container_name"
		;;
esac

# validating which container should be running
case "$(athena.os.get_command)" in
	"proxy"|"terminal"|"logs"|"hosts")
		if ! athena.docker.is_current_container_running ; then
			athena.os.exit_with_msg "proxy server not running! Did you specify the right instance/port?"
		fi
		;;
esac
