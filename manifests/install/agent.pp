# class skydive::install::agent
class skydive::install::agent {

  case $::osfamily {
    'RedHat': {
      package { 'skydive-agent':
        ensure => installed,
        notify => Exec['skydive: reload systemd'],
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
