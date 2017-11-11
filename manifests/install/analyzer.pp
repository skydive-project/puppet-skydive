# class skydive::install::analyzer
class skydive::install::analyzer {

  if $::skydive::installation_type == 'package' {
    package { 'skydive-analyzer':
      ensure => $::skydive::version,
    }
  }

}
