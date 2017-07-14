# class skydive::install::agent
class skydive::install::agent {

  case $::osfamily {
    'RedHat': {
      package { 'skydive-agent':
        ensure  => installed,
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
