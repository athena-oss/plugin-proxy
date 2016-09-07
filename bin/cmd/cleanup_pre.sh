CMD_DESCRIPTION="Stops and removes proxy server container(s) and image."

if athena.argument.argument_exists_and_remove "--help"; then
	athena.usage 1 "[--help|-y]" "$(cat <<EOF
	[--help] ; Show this usage.
	[-y]     ; Automatic yes to prompts. Assume "yes" as answer to all prompts and run non-interactively.
EOF
)"
fi

if ! athena.argument.argument_exists_and_remove "-y"; then
	athena.info "Do you want to stop all running proxy containers (Y/n)?"
	read answer
	if [[ "$answer" == "n" ]]; then
		athena.exit 0
	fi
fi

athena.info "Stopping and removing proxy server containers and image..."
athena.docker.stop_all_containers "$(athena.plugins.proxy.get_container_name)"
athena.docker.remove_container_and_image "$(athena.plugin.get_tag_name)" "$(athena.plugin.get_image_version)"
