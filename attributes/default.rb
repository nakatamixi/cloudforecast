default[:cloudforecast][:user] = "root"
default[:cloudforecast][:group] = "root"
default[:cloudforecast][:install_dir] = "/opt/cloudforecast"
default[:cloudforecast][:git_repository] = "https://github.com/kazeburo/cloudforecast.git"
default[:cloudforecast][:git_revision] = "master"
default[:cloudforecast][:log_path] = "/var/log/cloudforecast"
default[:cloudforecast][:lock_path] = "/var/lock/cloudforecast"
default[:cloudforecast][:web_port] = "5000"
default[:cloudforecast][:debug] = 0

default[:cloudforecast][:cf_yaml] = {}
default[:cloudforecast][:cf_yaml][:config] = {}

default[:cloudforecast][:cf_yaml][:config][:gearman_enable] = "0"
default[:cloudforecast][:cf_yaml][:config][:gearman_server_host] = "localhost"
default[:cloudforecast][:cf_yaml][:config][:gearman_server_port] = "7003"

default[:cloudforecast][:cf_yaml][:config][:data_dir] = "#{default[:cloudforecast][:install_dir]}/data"
default[:cloudforecast][:cf_yaml][:config][:host_config_dir] = "#{default[:cloudforecast][:install_dir]}/host_config"

default[:cloudforecast][:cf_yaml][:component_config] = {}

default[:cloudforecast][:cf_yaml][:component_config][:snmp_community] = "cf_community"
default[:cloudforecast][:cf_yaml][:component_config][:snmp_version] = "2"

default[:cloudforecast][:cf_yaml][:component_config][:mysql_user] = ""
default[:cloudforecast][:cf_yaml][:component_config][:mysql_password] = ""

default_hosts = [
  {:ip => "127.0.0.1", :name => "localhost", :description => "my default"}
]
default_server = {:config => "basic.yaml", :hosts => default_hosts}
default_section = {:name => "default", :servers => [default_server]}

default[:cloudforecast][:sl_yaml][:sections] = [default_section]


default[:cloudforecast][:perl_url] = "http://www.cpan.org/src/5.0/perl-5.18.1.tar.gz"
default[:cloudforecast][:perl_config] = "-des -Dprefix=/usr"
