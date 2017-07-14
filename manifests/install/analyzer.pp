# class skydive::install::analyzer
class skydive::install::analyzer {

  case $::osfamily {
    'RedHat': {
      package { 'skydive-analyzer':
        ensure => installed,
      }
    }
    default: {
      fail("Module ${module_name} is not supported on osfamily '${::osfamily}'")
    }
  }

}
