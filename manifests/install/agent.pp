# class skydive::install::agent
class skydive::install::agent {

  if $::skydive::installation_type == 'package' {
    package { 'skydive-agent':
      ensure => $::skydive::version,
    }
  }

}
