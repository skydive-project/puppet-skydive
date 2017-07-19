# class skydive::install::agent
class skydive::install::agent {

  case $::osfamily {
    'RedHat': {
      if $::operatingsystemmajrelease >= 7 {
        package { 'skydive-agent':
          ensure => installed,
          notify => Exec['skydive: reload systemd'],
        }
      } else {
        package { 'skydive-agent':
          ensure => installed,
        }
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
