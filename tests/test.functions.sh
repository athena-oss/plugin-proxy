athena.plugin.require "proxy"

function testcase_athena.plugins.proxy.get_container_name()
{
	bashunit.test.mock.outputs "athena.os.get_prefix" "myprefix"
	bashunit.test.mock.outputs "athena.os.get_instance" "1"

	bashunit.test.assert_output "athena.plugins.proxy.get_container_name" "myprefix-plugin-proxy-1-5001" "5001"
	bashunit.test.assert_output "athena.plugins.proxy.get_container_name" "myprefix-plugin-proxy-1"
}
