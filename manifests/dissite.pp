# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::dissite
class apache::dissite (
  String $vhost_file = '000-default.conf'
) {
  if $facts['os']['family'] == 'Debian' {
    exec { "a2dissite ${vhost_file}":
      onlyif => "test -f /etc/apache2/sites-enabled/${vhost_file} -a ! -f /etc/apache2/sites-available/${vhost_file}",
      path   => ['/usr/bin', '/usr/sbin', 'sbin'],
      notify => Service["${apache::service_name}"],
    }
  }
}
