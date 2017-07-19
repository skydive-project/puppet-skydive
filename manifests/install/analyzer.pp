# class skydive::install::analyzer
class skydive::install::analyzer {

  case $::osfamily {
    'RedHat': {
      package { 'skydive-analyzer':
        ensure => installed,
        notify => Exec['skydive: reload systemd'],
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
