athena.plugin.require "proxy"

function testcase_athena.plugins.proxy.get_container_name()
{
	athena.test.mock.outputs "athena.os.get_prefix" "myprefix"
	athena.test.mock.outputs "athena.os.get_instance" "1"

	athena.test.assert_output "athena.plugins.proxy.get_container_name" "myprefix-plugin-proxy-1-5001" "5001"
	athena.test.assert_output "athena.plugins.proxy.get_container_name" "myprefix-plugin-proxy-1"
}
