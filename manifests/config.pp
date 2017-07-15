# class skydive::config
class skydive::config {

  file { '/etc/skydive':
    ensure => directory,
    mode   => '0755',
  }

}
