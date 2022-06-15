class apache (
  String $install_name,
  String $service_name,
  Array $config_paths,
  String $vhost_dir,
) {
  contain apache::install
  contain apache::config
  contain apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
