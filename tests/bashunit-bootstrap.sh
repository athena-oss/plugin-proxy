function athena.get_current_script_dir()
{
	if [[ -n "$ATHENA_DIR" ]]; then
		echo "$ATHENA_DIR"
		return
	fi
	echo "${BASHUNIT_TESTS_DIR}/../../.."
}

curr_script_dir="$(athena.get_current_script_dir)"
source "$curr_script_dir/bootstrap/variables.sh"
source "$curr_script_dir/bootstrap/host.functions.sh"
source "$BASHUNIT_TESTS_DIR/../bin/lib/functions.sh"
