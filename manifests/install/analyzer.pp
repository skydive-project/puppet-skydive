# class skydive::install::analyzer
class skydive::install::analyzer {

  case $::osfamily {
    'RedHat': {
      if $::operatingsystemmajrelease >= 7 {
        package { 'skydive-analyzer':
          ensure => installed,
          notify => Exec['skydive: reload systemd'],
        }
      } else {
        package { 'skydive-analyzer':
          ensure => installed,
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
